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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_59 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1170 = false;
    bool _900 = false;
    bool _802 = false;
    bool _466 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3473 = as_type<float>(_118);
        out.gl_Position.z = _3473;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = float(_96);
    bool _134 = _100 >= _132;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    if (_138)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _108;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _120 = as_type<int>(_142);
    }
    int _144 = _120;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3528 = as_type<float>(_144);
        out.gl_Position.z = _3528;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _132;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        _194 = _156;
    }
    _196 = false;
    float _198 = _194;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_198);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = 1.0 / _214;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = _198 + _238;
    float _242 = 1.0 / _222;
    bool _244 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _246 = isnan(_198);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _258 = 1.0 / _218;
    float _260 = 1.0 / _210;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _198 + _262;
    float _266 = _202 * _242;
    bool _268 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _270 = isnan(_198);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _280;
    float _284 = _264 * _236;
    bool _286 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _288 = isnan(_198);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_254;
    float _300 = _298 + 1.0;
    float _302 = _206 * _258;
    float _304 = -_296;
    float _306 = _304 + 1.0;
    float _308 = fma(_282, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = _278 * _306;
    bool _312 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_198);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _328 = -_278;
    float _330 = _328 + 1.0;
    float _332 = _234 * _300;
    float _334 = _240 * _260;
    float _336 = -_234;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _344;
    float _348 = _254 * _330;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = _322 * _338;
    float _360 = fma(_342, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = fma(_346, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = fma(_326, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_352, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _368 = fma(_356, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = _308 * _358;
    float _372 = -_322;
    float _374 = _372 + 1.0;
    float _376 = _360 * _358;
    float _378 = _362 * _358;
    float _380 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _382 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _376);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _378);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_364, _332, _380);
    float _400 = fma(_366, _332, _382);
    float _402 = fma(_386, _334, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _404 = fma(_368, _332, _388);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _414 = fma(_392, _334, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_396, _334, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _422 = fma(_402, _348, _398);
    float _424 = fma(_408, _284, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _426 = fma(_412, _284, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _428 = fma(_420, _284, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _430 = fma(_414, _348, _400);
    float _432 = fma(_416, _348, _404);
    float _434 = fma(_424, _310, _422);
    float _436 = fma(_426, _310, _430);
    float _438 = fma(_428, _310, _432);
    float _440 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[147].x, _434);
    float _442 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[147].y, _436);
    float _444 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[147].z, _438);
    bool _446 = !_256;
    float _464;
    if (!_446)
    {
        float _448 = in.m_53.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        _464 = _156;
    }
    _466 = false;
    float _468 = _464;
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = in.m_55.z;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _492 = 1.0 / _478;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _494;
    float _498 = 1.0 / _482;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _502 = _468 + _500;
    bool _504 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _506 = isnan(_468);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _442 * _472;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _520 = _468 + _518;
    float _522 = 1.0 / _486;
    float _524 = _502 * _492;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _528 = _468 + _526;
    float _530 = _444 * _474;
    bool _532 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _534 = isnan(_468);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _546 = _468 + _544;
    float _548 = _440 * _470;
    float _550 = _520 * _498;
    bool _552 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _554 = isnan(_468);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = 1.0 / _490;
    bool _566 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _568 = isnan(_468);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _580 = _468 + _578;
    bool _582 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _584 = _528 * _522;
    float _586 = -_576;
    float _588 = _586 + 1.0;
    float _590 = 1.0 / _496;
    float _592 = -_562;
    float _594 = _592 + 1.0;
    bool _596 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _598 = isnan(_468);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _576 * _594;
    float _610 = _542 * _588;
    bool _612 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _614 = isnan(_468);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -_606;
    float _626 = _624 + 1.0;
    float _628 = -_542;
    float _630 = _628 + 1.0;
    float _632 = _580 * _564;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _634;
    float _638 = _622 * _626;
    float _640 = -_622;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _644;
    float _648 = _606 * _630;
    float _650 = _546 * _590;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _660 = fma(_636, _524, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _670 = _514 * _642;
    float _672 = fma(_654, _524, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _674 = fma(_646, _524, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _676 = fma(_658, _550, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _678 = fma(_664, _550, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _680 = fma(_668, _550, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _682 = _660 * _670;
    float _684 = -_514;
    float _686 = _684 + 1.0;
    float _688 = _672 * _670;
    float _690 = _674 * _670;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _700;
    float _704 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[107].x, _682);
    float _706 = fma(_694, _584, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _708 = fma(_698, _584, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _710 = fma(_702, _584, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[107].y, _688);
    float _718 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[107].z, _690);
    float _720 = fma(_676, _638, _704);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _726 = fma(_714, _632, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _728 = fma(_678, _638, _716);
    float _730 = fma(_680, _638, _718);
    float _732 = fma(_706, _648, _720);
    float _734 = fma(_724, _632, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _740 = fma(_708, _648, _728);
    float _742 = fma(_710, _648, _730);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _748;
    float _752 = fma(_738, _632, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _754;
    float _758 = fma(_726, _610, _732);
    float _760 = fma(_746, _650, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _762 = fma(_750, _650, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _764 = fma(_756, _650, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _766 = fma(_734, _610, _740);
    float _768 = fma(_752, _610, _742);
    float _770 = fma(_760, _608, _758);
    float _772 = fma(_762, _608, _766);
    float _774 = fma(_764, _608, _768);
    float _776 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[112].x, _770);
    float _778 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[112].y, _772);
    float _780 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[112].z, _774);
    bool _782 = !_582;
    float _800;
    if (!_782)
    {
        float _784 = in.m_53.x;
        float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _788 = _784 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _792 = _790 * _786;
        float _794 = floor(_792);
        float _796 = -_794;
        float _798 = _792 + _796;
        _800 = _798;
        _802 = true;
    }
    else
    {
        _800 = _156;
    }
    _802 = false;
    float _804 = _800;
    bool _806 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _808 = isnan(_804);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _824 = isnan(_804);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _804 + _838;
    float _842 = -_816;
    float _844 = _842 + 1.0;
    bool _846 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _848 = 1.0 / _820;
    float _850 = _832 * _844;
    float _852 = -_832;
    float _854 = _852 + 1.0;
    float _856 = _836 * _848;
    float _858 = _778 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _860 = fma(_856, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _862 = _776 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _864 = _860 * _850;
    float _866 = _780 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[115].x, _864);
    float _870 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _872 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[116].x, _868);
    float _878 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _880 = !_846;
    float _898;
    if (!_880)
    {
        float _882 = in.m_53.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        _898 = _156;
    }
    _900 = false;
    float _902 = _898;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _906 = _902 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _910 = _902 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _914 = _902 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _932 = 1.0 / _918;
    bool _934 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _936 = isnan(_902);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = 1.0 / _922;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _950 = _902 + _948;
    float _952 = 1.0 / _926;
    float _954 = _906 * _932;
    bool _956 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _958 = isnan(_902);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _970 = 1.0 / _930;
    float _972 = _910 * _946;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _978;
    float _982 = fma(_976, _954, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _984 = fma(_980, _954, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _986 = _914 * _952;
    float _988 = -_944;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _992;
    float _996 = fma(_994, _954, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _998 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1000 = isnan(_902);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _950 * _970;
    bool _1012 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1014 = isnan(_902);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = _966 * _990;
    float _1026 = -_966;
    float _1028 = _1026 + 1.0;
    bool _1030 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1032 = isnan(_902);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = -_1022;
    float _1044 = _1042 + 1.0;
    float _1046 = _1022 * _1028;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1056 = _1008 * _1044;
    float _1058 = -_1008;
    float _1060 = _1058 + 1.0;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1066 = fma(_1050, _972, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1068 = fma(_1054, _972, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1070 = _1040 * _1060;
    float _1072 = fma(_1064, _972, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1074 = _984 * _1070;
    float _1076 = _982 * _1070;
    float _1078 = -_1040;
    float _1080 = _1078 + 1.0;
    float _1082 = _996 * _1070;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1092;
    float _1096 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1076);
    float _1098 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1074);
    float _1100 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1082);
    float _1102 = fma(_1086, _986, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1104 = fma(_1090, _986, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1106 = fma(_1094, _986, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1108 = fma(_1066, _1056, _1096);
    float _1110 = fma(_1072, _1056, _1098);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1120 = fma(_1068, _1056, _1100);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1126 = fma(_1102, _1046, _1108);
    float _1128 = fma(_1114, _1010, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1130 = fma(_1118, _1010, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1132 = fma(_1104, _1046, _1110);
    float _1134 = fma(_1124, _1010, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1136 = fma(_1106, _1046, _1120);
    float _1138 = fma(_1128, _1024, _1126);
    float _1140 = fma(_1130, _1024, _1132);
    float _1142 = fma(_1134, _1024, _1136);
    float _1144 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1138);
    float _1146 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1140);
    float _1148 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1142);
    bool _1150 = !_968;
    float _1168;
    if (!_1150)
    {
        float _1152 = in.m_53.x;
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1156 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1160 = _1158 * _1154;
        float _1162 = floor(_1160);
        float _1164 = -_1162;
        float _1166 = _1160 + _1164;
        _1168 = _1166;
        _1170 = true;
    }
    else
    {
        _1168 = _156;
    }
    _1170 = false;
    float _1172 = _1168;
    float _1174 = in.m_42.x;
    float _1176 = in.m_42.y;
    float _1178 = in.m_42.z;
    float _1180 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1182 = in.m_53.x;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = in.m_53.y;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1194 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1196 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1194);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1202 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1204 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1206 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1196);
    float _1208 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1210 = _1182 * 2.0;
    float _1212 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1204);
    float _1214 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1200);
    float _1216 = in.m_53.z;
    float _1218 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1220 = -_1190;
    float _1222 = fma(_1208, 2.0, _1220);
    float _1224 = _1188 * 2.0;
    float _1226 = floor(_1210);
    float _1228 = fma(_1218, -2.0, _1192);
    float _1230 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1202);
    float _1232 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1212);
    float _1234 = _1182 + _1188;
    float _1236 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1238 = floor(_1224);
    float _1240 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1230);
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1244 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1236);
    float _1246 = _1234 + (-1.0);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1250 = _1226 > 0.0;
    float _1252 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1244);
    bool _1254 = _1226 >= 0.0;
    bool _1256 = isnan(_1226);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan(0.0);
    bool _1262 = _1258 || _1260;
    float _1264 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1214);
    float _1266 = _1244;
    float _1268 = _1214;
    float _1270 = _1178;
    float _1272 = _1230;
    if (!_1186)
    {
        _1266 = _1188;
    }
    float _1274 = _1266;
    float _1276 = _1216 * 2.0;
    float _1278 = _1274;
    if (!_1186)
    {
        _1268 = _1182;
    }
    float _1280 = _1268;
    float _1282 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1284 = _1280;
    if (!_1186)
    {
        _1270 = _1216;
    }
    float _1286 = _1270;
    float _1288 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1290 = int(_1288);
    float _1292 = _1286;
    if (_1186)
    {
        _1278 = _1182;
    }
    float _1294 = _1278;
    float _1296 = -_100;
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1222);
    if (_1186)
    {
        _1284 = _1216;
    }
    float _1300 = _1284;
    float _1302 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1228);
    bool _1304 = _1238 > 0.0;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1308 = _1238;
    if (!_1186)
    {
        _1272 = _1286;
    }
    float _1310 = _1272;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1242);
    float _1314 = -_1198;
    float _1316 = fma(_1306, 2.0, _1314);
    float _1318 = _1310;
    if (_1186)
    {
        _1318 = _1188;
    }
    float _1320 = _1318;
    float _1322 = floor(_1276);
    bool _1324 = _1238 >= 0.0;
    bool _1326 = isnan(_1238);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1186)
    {
        _1308 = _1188;
    }
    float _1336 = _1308;
    float _1338 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1340 = _1262 ? 0 : 1;
    float _1342 = _1182 + _1216;
    float _1344 = fma(_1338, -2.0, _1334);
    float _1346 = _1336;
    if (_1186)
    {
        _1346 = _1182;
    }
    float _1348 = _1346;
    float _1350 = _1342 + (-1.0);
    int _1352 = _1332 ? 0 : 1;
    float _1354 = rsqrt(_1206);
    int _1356 = ~_1340;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1248);
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1374 = _1372 != 0;
    float _1376 = -_100;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1316);
    int _1380 = _1360;
    if (!_1250)
    {
        int _1382 = ~_1340;
        int _1384 = _1382 + 1;
        _1380 = _1384;
    }
    int _1386 = _1380;
    float _1388 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1312);
    int _1390 = ~_1352;
    int _1392 = _1390 + 1;
    int _1394 = _1392 + 1;
    float _1396 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1398 = log2(_1396);
    int _1400 = _1394;
    if (!_1304)
    {
        int _1402 = ~_1352;
        int _1404 = _1402 + 1;
        _1400 = _1404;
    }
    int _1406 = _1400;
    float _1408 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1344);
    float _1410 = _1240 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1412 = !_1370;
    int _1414 = _1412 ? 0 : 1;
    float _1416 = _1232 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1418 = !_1366;
    int _1420 = _1418 ? 0 : 1;
    float _1422 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1424 = !_1374;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = _1188 + _1216;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1432 = _1430 != 0;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1440 = _1438 != 0;
    float _1442 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1428 + (-1.0);
    bool _1446 = !_1440;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1452 = !_1436;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1458 = abs(_1448);
    float _1460 = float(_1290);
    bool _1462 = _1322 > 0.0;
    bool _1464 = _1322 >= 0.0;
    bool _1466 = isnan(_1322);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan(0.0);
    bool _1472 = _1468 || _1470;
    float _1474 = _1398 * _100;
    float _1476 = 1.0 / _1460;
    if (_1186)
    {
        _1292 = _1188;
    }
    float _1478 = _1292;
    int _1480 = abs(_1454);
    float _1482 = float(_1406);
    float _1484 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1456);
    float _1486 = float(_1458);
    float _1488 = exp2(_1474);
    float _1490 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1484);
    float _1492 = float(_1386);
    float _1494 = _1486 * _1482;
    float _1496 = in.m_57.x;
    float _1498 = in.m_57.y;
    float _1500 = in.m_57.z;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1504 = 1.0 + _1502;
    float _1506 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1508 = int(_1506);
    float _1510 = _1476 * _100;
    float _1512 = float(_1480);
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1516 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1518 = isnan(1.0);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1524 = _1520 || _1522;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1528 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1530 = isnan(0.0);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1536 = _1532 || _1534;
    float _1538 = 1.0 / _1504;
    float _1540 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1514);
    float _1542 = -_1488;
    float _1544 = _1542 + 1.0;
    float _1546 = _1512 * _1492;
    float _1548 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1526);
    float _1550 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1540);
    int _1552 = _1472 ? 0 : 1;
    float _1554 = _1546 * (-2.0);
    float _1556 = float(_1508);
    float _1558 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1548);
    float _1560 = _1536 ? _1544 : 0.0;
    float _1562 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1362);
    float _1564 = fma(_1450, _1554, _1450);
    float _1566 = _1556 * _100;
    float _1568 = fma(_1554, _1498, _1498);
    float _1570 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1524)
    {
        float _1572 = _1560 * _1538;
        _110 = _1572;
    }
    float _1574 = _110;
    float _1576 = _1188 + (-0.5);
    int _1578 = ~_1552;
    int _1580 = _1578 + 1;
    int _1582 = _1580 + 1;
    int _1584 = _1582;
    if (!_1462)
    {
        int _1586 = ~_1552;
        int _1588 = _1586 + 1;
        _1584 = _1588;
    }
    int _1590 = _1584;
    float _1592 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1568);
    float _1594 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1596 = _1570 * _1570;
    float _1598 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1600 = fma(_1594, _1594, _1596);
    bool _1602 = !_1432;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1606;
    float _1610 = _1494 * (-2.0);
    float _1612 = fma(_1598, _1598, _1600);
    int _1614 = abs(_1604);
    float _1616 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1618 = fma(_1422, _1610, _1422);
    float _1620 = fma(_1610, _1500, _1500);
    float _1622 = fma(_1564, _1574, _1592);
    float _1624 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1626 = _1216 + (-0.5);
    float _1628 = _1622 * 0.15915493667125701904296875;
    float _1630 = float(_1590);
    float _1632 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1616);
    float _1634 = float(_1614);
    float _1636 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1620);
    float _1638 = rsqrt(_1612);
    float _1640 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1642 = _1634 * _1630;
    float _1644 = _1642 * (-2.0);
    float _1646 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1648 = fma(_1618, _1574, _1636);
    float _1650 = _1182 + (-0.5);
    float _1652 = in.m_59.x;
    float _1654 = in.m_59.y;
    float _1656 = in.m_59.z;
    float _1658 = -_1646;
    float _1660 = _1442 + _1658;
    float _1662 = fma(_1644, _1496, _1496);
    float _1664 = 1.0 / _1608;
    float _1666 = fma(_1282, _1644, _1282);
    bool _1668 = _1646 >= _1442;
    bool _1670 = isnan(_1646);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan(_1442);
    bool _1676 = _1672 || _1674;
    float _1678 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1662);
    float _1680 = abs(_1660);
    float _1682 = precise::max(_1680, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1684 = _1648 * 0.15915493667125701904296875;
    float _1686 = _1594 * _1638;
    float _1688 = fma(_1666, _1574, _1678);
    float _1690 = precise::min(_1682, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1692 = _1684 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    bool _1696 = !_1676;
    float _1698 = _1696 ? 1.0 : (-1.0);
    float _1700 = _1688 * 0.15915493667125701904296875;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1704 = _1690 + _1702;
    float _1706 = _1570 * _1638;
    float _1708 = _1598 * _1638;
    float _1710 = _1704 * _1664;
    float _1712 = _1684 * 6.283185482025146484375;
    float _1714 = cos(_1712);
    float _1716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1652);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1656);
    float _1720 = _1698 * _1710;
    float _1722 = _1628 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1728 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1730 = _1728 * _1720;
    float _1732 = _1628 * 6.283185482025146484375;
    float _1734 = cos(_1732);
    float _1736 = _1700 * 6.283185482025146484375;
    float _1738 = sin(_1736);
    float _1740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1654);
    float _1742 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1744 = _1726 * _1718;
    float _1746 = _1180 * _1740;
    float _1748 = _1742 * _1716;
    float _1750 = _1730 * 0.15915493667125701904296875;
    float _1752 = _1700 * 6.283185482025146484375;
    float _1754 = cos(_1752);
    float _1756 = _1714 * _1746;
    float _1758 = _1734 * _1714;
    float _1760 = _1724 * _1714;
    float _1762 = _1738 * _1724;
    float _1764 = -_1746;
    float _1766 = _1694 * _1764;
    float _1768 = _1750 * 6.283185482025146484375;
    float _1770 = cos(_1768);
    float _1772 = fma(_1758, _1748, _1766);
    float _1774 = _1754 * _1734;
    float _1776 = _1754 * _1724;
    float _1778 = _1754 * _1756;
    float _1780 = _1738 * _1734;
    float _1782 = fma(_1694, _1774, _1762);
    float _1784 = _1738 * _1756;
    float _1786 = fma(_1760, _1744, _1772);
    float _1788 = -_1780;
    float _1790 = fma(_1694, _1776, _1788);
    float _1792 = fma(_1782, _1748, _1778);
    float _1794 = -_1776;
    float _1796 = fma(_1694, _1780, _1794);
    float _1798 = _1750 * 6.283185482025146484375;
    float _1800 = sin(_1798);
    float _1802 = fma(_1694, _1762, _1774);
    float _1804 = fma(_1790, _1744, _1792);
    float _1806 = fma(_1796, _1748, _1784);
    float _1808 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1810 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1814 = fma(_1802, _1744, _1806);
    float _1816 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1808);
    float _1818 = -_1770;
    float _1820 = _1818 + 1.0;
    float _1822 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1810);
    float _1824 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1812);
    float _1826 = _1708 * _1708;
    float _1828 = _1706 * _1820;
    float _1830 = _1686 * _1800;
    float _1832 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1816);
    float _1834 = _1706 * _1800;
    float _1836 = fma(_1820, _1826, _1770);
    float _1838 = _1708 * _1800;
    float _1840 = _1686 * _1820;
    float _1842 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1822);
    float _1844 = fma(_1708, _1828, _1830);
    float _1846 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1848 = -_1838;
    float _1850 = fma(_1706, _1840, _1848);
    float _1852 = -_1834;
    float _1854 = fma(_1708, _1840, _1852);
    float _1856 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1858 = _1846 * _1844;
    float _1860 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1824);
    float _1862 = fma(_1686, _1840, _1770);
    float _1864 = _1846 * _1850;
    float _1866 = fma(_1856, _1854, _1858);
    float _1868 = _1860 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1870 = fma(_1706, _1840, _1838);
    float _1872 = fma(_1856, _1862, _1864);
    float _1874 = fma(_1708, _1840, _1834);
    float _1876 = fma(_1868, _1836, _1866);
    float _1878 = fma(_1706, _1828, _1770);
    float _1880 = -_1830;
    float _1882 = fma(_1708, _1828, _1880);
    float _1884 = fma(_1868, _1874, _1872);
    float _1886 = _1416 + _1876;
    float _1888 = _1846 * _1878;
    float _1890 = _1624 + _1884;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1894 = _1886 + _1892;
    float _1896 = fma(_1856, _1870, _1888);
    float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1900 = _1890 + _1898;
    float _1902 = _1894 * _1894;
    float _1904 = fma(_1868, _1882, _1896);
    float _1906 = fma(_1900, _1900, _1902);
    float _1908 = _1410 + _1904;
    float _1910 = sqrt(_1906);
    bool _1912 = _1910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1914 = _1904;
    float _1916 = _1706;
    float _1918 = _1896;
    int _1920 = as_type<int>(_1740);
    if (!_1912)
    {
        _1914 = _1890;
    }
    float _1922 = _1914;
    float _1924 = _1922;
    if (!_1912)
    {
        _1916 = _1886;
    }
    float _1926 = _1916;
    float _1928 = _1926;
    if (!_1912)
    {
        _1918 = _1908;
    }
    float _1930 = _1918;
    bool _1932 = !_1912;
    float _1934 = _1930;
    if (!_1932)
    {
        float _1936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1940 = _1910 + _1938;
        float _1942 = rsqrt(_1906);
        float _1944 = _1940 * _1936;
        float _1946 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1948 = _1944 * 0.15915493667125701904296875;
        float _1950 = _1948 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = _1948 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        float _1958 = fma(_1952, _1946, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1960 = _1942 * _1958;
        float _1962 = _1956 + (-1.0);
        float _1964 = fma(_1900, _1960, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1966 = fma(_1894, _1960, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1968 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = fma(_1908, _1956, _1968);
        _1934 = _1970;
        _1924 = _1964;
        _1928 = _1966;
    }
    float _1972 = _1934;
    float _1974 = _1924;
    float _1976 = _1928;
    float _1978 = -_1410;
    float _1980 = _1978 + _1972;
    float _1982 = -_1624;
    float _1984 = _1982 + _1974;
    float _1986 = -_1416;
    float _1988 = _1986 + _1976;
    float _1990 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1992 = _1980 * _1980;
    float _1994 = fma(_1984, _1984, _1992);
    float _1996 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1990);
    float _1998 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2000 = fma(_1988, _1988, _1994);
    float _2002 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1996);
    float _2004 = sqrt(_2000);
    float _2006 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2008 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1998);
    float _2010 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2008);
    bool _2012 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan(0.5);
    bool _2020 = _2016 || _2018;
    float _2022 = 1.0 / _2006;
    float _2024 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2026 = _2024 + _2006;
    bool _2028 = _2004 > 0.0;
    bool _2030 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2032 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan(0.5);
    bool _2038 = _2034 || _2036;
    float _2040 = _2026 * _2022;
    float _2042 = _2040 * 0.5;
    bool _2044 = !_2028;
    float _2046 = _1972;
    float _2048 = _1984;
    float _2050 = _1974;
    float _2052 = _1976;
    float _2054 = _2006;
    float _2056 = _1980;
    float _2058 = _1988;
    float _2060 = _2000;
    float _2062 = _2024;
    float _2064 = _2022;
    if (!_2044)
    {
        float _2066 = _172 * _172;
        float _2068 = rsqrt(_2000);
        float _2070 = fma(_170, _170, _2066);
        float _2072 = fma(_174, _174, _2070);
        float _2074 = sqrt(_2072);
        float _2076 = _1984 * _2068;
        float _2078 = _1980 * _2068;
        bool _2080 = _2074 > 0.0;
        float _2082 = _1988 * _2068;
        bool _2084 = !_2080;
        _2054 = _2072;
        _2060 = _2068;
        _2062 = _2082;
        if (!_2084)
        {
            float _2086 = rsqrt(_2072);
            float _2088 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2090 = _172 * _2086;
            float _2092 = _170 * _2086;
            float _2094 = _174 * _2086;
            float _2096 = _2078 * _2090;
            float _2098 = fma(_2076, _2092, _2096);
            float _2100 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2102 = fma(_2082, _2094, _2098);
            float _2104 = _2102 * _2100;
            float _2106 = fma(_170, _2104, _1974);
            float _2108 = fma(_172, _2104, _1972);
            float _2110 = fma(_174, _2104, _1976);
            _2046 = _2108;
            _2048 = _2098;
            _2050 = _2106;
            _2052 = _2110;
            _2056 = _2104;
            _2058 = _2096;
            _2060 = _2100;
        }
    }
    float _2112 = _2046;
    float _2114 = _2048;
    float _2116 = _2050;
    float _2118 = _2052;
    float _2120 = _2054;
    float _2122 = _2056;
    float _2124 = _2058;
    float _2126 = _2060;
    float _2128 = _2062;
    float _2130 = _2120;
    float _2132 = _2122;
    float _2134 = _2116;
    float _2136 = _2118;
    float _2138 = _2114;
    float _2140 = _2128;
    if (_2038)
    {
        _2130 = 1.0;
    }
    float _2142 = _2130;
    float _2144 = _2142;
    if (_2020)
    {
        _2132 = _2112;
    }
    float _2146 = _2132;
    float _2148 = _2146;
    if (!_2020)
    {
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2152 = _1410 + _2150;
        float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2156 = _1624 + _2154;
        float _2158 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2160 = -_1410;
        float _2162 = _2160 + _2112;
        float _2164 = _2152 * _2152;
        float _2166 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2168 = _1416 + _2166;
        float _2170 = fma(_2156, _2156, _2164);
        float _2172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2174 = fma(_2168, _2168, _2170);
        float _2176 = sqrt(_2174);
        float _2178 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2180 = precise::min(_2176, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2182 = _2180 * _2172;
        float _2184 = -_1624;
        float _2186 = _2184 + _2116;
        float _2188 = -_1416;
        float _2190 = _2188 + _2118;
        float _2192 = _2178 * _2182;
        float _2194 = fma(_2186, _2192, _1624);
        float _2196 = fma(_2162, _2192, _1410);
        float _2198 = fma(_2190, _2192, _1416);
        _2148 = _2196;
        _2134 = _2194;
        _2136 = _2198;
        _2138 = _2192;
    }
    float _2200 = _2148;
    float _2202 = _2134;
    float _2204 = _2136;
    float _2206 = _2138;
    float _2208 = _2206;
    if (!_2038)
    {
        float _2210 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2212 = _2210 * 0.15915493667125701904296875;
        float _2214 = _2212 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2220 = _2218 * 0.15915493667125701904296875;
        float _2222 = _2212 * 6.283185482025146484375;
        float _2224 = sin(_2222);
        float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2228 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2226);
        float _2230 = 1.0 / _2216;
        float _2232 = _2220 * 6.283185482025146484375;
        float _2234 = cos(_2232);
        float _2236 = _2224 * _2230;
        float _2238 = 1.0 / _2228;
        float _2240 = _2234 * _2236;
        float _2242 = _2220 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2246;
        float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2252 = _2238 * _2250;
        float _2254 = 1.0 / _2240;
        float _2256 = 1.0 / _2248;
        float _2258 = _2244 * _2254;
        float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2262 = fma(_2258, _2252, _2260);
        float _2264 = _2262 * _2256;
        float _2266 = precise::clamp(_2264, 0.0, 1.0);
        _2208 = _2212;
        _2144 = _2266;
    }
    float _2268 = _2208;
    float _2270 = _2144;
    float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2274 = _2200 + _2272;
    float _2276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2278 = _2202 + _2276;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2282 = _2204 + _2280;
    float _2284 = _2274 * _2274;
    float _2286 = fma(_2278, _2278, _2284);
    float _2288 = fma(_2282, _2282, _2286);
    float _2290 = rsqrt(_2288);
    float _2292 = sqrt(_2288);
    float _2294 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2296 = _2278 * _2294;
    float _2298 = _2282 * _2294;
    float _2300 = _2296 * _2296;
    float _2302 = _2298 * _2298;
    float _2304 = _2300 + _2302;
    float _2306 = sqrt(_2304);
    bool _2308 = _2306 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2312 = _2306 + _2310;
    float _2314 = _2124;
    float _2316 = _2312;
    float _2318 = _2274;
    float _2320 = _2298;
    float _2322 = _2300;
    float _2324 = _2302;
    if (_2308)
    {
        float _2326 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2314 = _2326;
    }
    float _2328 = _2314;
    if (_2308)
    {
        float _2330 = _2312 * _2328;
        _2316 = _2330;
    }
    float _2332 = _2316;
    if (_2308)
    {
        float _2334 = _2332 * 0.15915493667125701904296875;
        _2064 = _2334;
    }
    float _2336 = _2064;
    float _2338 = _2126;
    if (_2308)
    {
        float _2340 = _2336 * 6.283185482025146484375;
        float _2342 = sin(_2340);
        _2338 = _2342;
    }
    float _2344 = _2338;
    float _2346 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2348 = precise::max(0.0, _2346);
    float _2350 = _2268;
    float _2352 = _2348;
    if (_2308)
    {
        float _2354 = _2336 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        _2350 = _2356;
    }
    float _2358 = _2350;
    float _2360 = -_2294;
    float _2362 = -_2348;
    float _2364 = fma(_2274, _2360, _2362);
    if (!_2308)
    {
        _2318 = _2296;
    }
    float _2366 = _2318;
    float _2368 = _2346;
    float _2370 = _2366;
    if (_2308)
    {
        float _2372 = rsqrt(_2304);
        _2368 = _2372;
    }
    float _2374 = _2368;
    if (_2308)
    {
        float _2376 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2352 = _2376;
    }
    float _2378 = _2352;
    float _2380 = _2378;
    if (_2308)
    {
        float _2382 = fma(_2344, _2378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2140 = _2382;
    }
    float _2384 = _2140;
    float _2386 = _2384;
    if (_2308)
    {
        float _2388 = _2358 + (-1.0);
        _2380 = _2388;
    }
    float _2390 = _2380;
    float _2392 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2394 = _2390;
    if (_2308)
    {
        float _2396 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2394 = _2396;
    }
    float _2398 = _2394;
    float _2400 = _2374;
    if (_2308)
    {
        float _2402 = _2374 * _2384;
        _2386 = _2402;
    }
    float _2404 = _2386;
    if (!_2308)
    {
        _2400 = _2364;
    }
    float _2406 = _2400;
    float _2408 = _2406;
    if (_2308)
    {
        float _2410 = fma(_2364, _2358, _2398);
        _2408 = _2410;
    }
    float _2412 = _2408;
    if (_2308)
    {
        float _2414 = _2296 * _2404;
        _2370 = _2414;
    }
    float _2416 = _2370;
    if (_2308)
    {
        float _2418 = _2298 * _2404;
        _2320 = _2418;
    }
    float _2420 = _2320;
    if (_2308)
    {
        float _2422 = _2416 * _2416;
        _2322 = _2422;
    }
    float _2424 = _2322;
    if (_2308)
    {
        float _2426 = _2420 * _2420;
        _2324 = _2426;
    }
    float _2428 = _2324;
    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2432 = fma(_2292, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2430);
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    float _2436 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2438 = fma(_2412, _2412, _2424);
    float _2440 = -_2434;
    float _2442 = _2440 + 1.0;
    float _2444 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2436);
    float _2446 = _2438 + _2428;
    float _2448 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2450 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2452 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2444);
    float _2454 = abs(_2442);
    float _2456 = log2(_2454);
    float _2458 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2448);
    float _2460 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2462 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2464 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2458);
    float _2466 = rsqrt(_2446);
    float _2468 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2470 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2460);
    float _2472 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2450);
    float _2474 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2476 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2470);
    float _2478 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2472);
    float _2480 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2482 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2484 = _2476 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2486 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2488 = -_2474;
    float _2490 = fma(_2488, _2392, 1.0);
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2480);
    float _2494 = exp2(_2482);
    float _2496 = _2466 * _2416;
    float _2498 = _2466 * _2412;
    float _2500 = _2466 * _2420;
    float _2502 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2492);
    float _2504 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2506 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2502);
    float _2508 = -_2504;
    float _2510 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2508);
    float _2512 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2514 = log2(_2490);
    float _2516 = -_2500;
    float _2518 = fma(_2516, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2510);
    float _2520 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2522 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2512);
    float _2524 = fma(_2518, -0.5, 0.5);
    float _2526 = fma(_2518, 0.5, 0.5);
    float _2528 = 1.0 / _2506;
    float _2530 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2520);
    float _2532 = _2498 + 1.0;
    float _2534 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2522);
    float _2536 = fma(_2526, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2538 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2530);
    float _2540 = -_2498;
    float _2542 = fma(_2494, _2532, _2540);
    float _2544 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2534);
    float _2546 = sqrt(_2524);
    float _2548 = fma(_2526, _2536, -0.212114393711090087890625);
    float _2550 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2538);
    float _2552 = _2514 * 0.693147182464599609375;
    float _2554 = fma(_2542, 0.5, 0.5);
    float _2556 = fma(_2526, _2548, 1.570728778839111328125);
    float _2558 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2560 = _2550 * _2528;
    float _2562 = _2544 * _2528;
    float _2564 = fma(_2562, 0.5, 0.5);
    float _2566 = _2546 * 0.636619746685028076171875;
    float _2568 = fma(_2560, -0.5, 0.5);
    float _2570 = -_2556;
    float _2572 = fma(_2566, _2570, 1.0);
    float3 _7443 = float3(_2564, _2568, _2558);
    float _2574 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7443, float3(0.0), isnan(_7443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7443, float3(0.0), isnan(_7443)), level(0.0)).x;
    float3 _7454 = float3(_2564, _2568, _2558);
    float4 _2577 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7454, float3(0.0), isnan(_7454)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7454, float3(0.0), isnan(_7454)), level(0.0)).xyzw;
    float _2579 = _2577.x;
    float _2581 = _2577.y;
    float _2583 = _2577.z;
    float _2585 = _2577.w;
    float2 _7471 = float2(_2572, _2554);
    float3 _2589 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7471, float2(0.0), isnan(_7471)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7471, float2(0.0), isnan(_7471)), level(0.0)).xyz;
    float _2591 = _2589.x;
    float _2593 = _2589.y;
    float _2595 = _2589.z;
    float _2597 = float(uint(_1508));
    float _2599 = trunc(_1510);
    int _2601 = int(_2599);
    int _2603 = ~_1508;
    int _2605 = _2603 + 1;
    float _2607 = _1566 * _152;
    int _2609 = ~_1508;
    int _2611 = _2609 + 1;
    out.m_61.x = _870;
    out.m_61.y = _872;
    out.m_61.z = _874;
    out.m_61.w = _878;
    int _2613 = abs(_1420);
    float _2615 = _1388 * (-0.15915493667125701904296875);
    float _2617 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2619 = 1.0 / _2597;
    float _2621 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2623 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2621);
    bool _2625 = !_1186;
    float _2627 = _2625 ? 7.345489978790283203125 : 1.0;
    float _2629 = float(uint(_2601));
    float _2631 = trunc(_2607);
    int _2633 = int(_2631);
    float _2635 = float(_2601);
    float _2637 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2623);
    float _2639 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2637);
    int _2641 = as_type<int>(_2619) + (-2);
    float _2643 = exp2(_2617);
    out.gl_Position.x = _2544;
    out.gl_Position.y = _2550;
    out.gl_Position.z = _2639;
    out.gl_Position.w = _2506;
    float _2645 = as_type<float>(_2641) * _2629;
    float _2647 = trunc(_2645);
    float _2649 = precise::max(_2647, 0.0);
    uint _2652 = uint(_2649);
    float _2654 = -_2643;
    float _2656 = _2654 + 1.0;
    int _2658 = _2605 * int(_2652);
    int _2660 = _2658 + _2601;
    float _2662 = float(uint(_2660));
    float _2664 = as_type<float>(_2641) * _2662;
    float _2666 = _2627 * _1182;
    bool _2668 = _2635 >= _1556;
    bool _2670 = isnan(_2635);
    bool _2672 = _2668 || _2670;
    bool _2674 = isnan(_1556);
    bool _2676 = _2672 || _2674;
    float _2678 = float(_2676);
    float _2680 = floor(_2666);
    float _2682 = trunc(_2664);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    float _2688 = trunc(_2678);
    int _2690 = int(_2688);
    float _2692 = -_2680;
    float _2694 = _2666 + _2692;
    int _2696 = int(_2652) + int(_2686);
    int _2698 = _2611 * _2696;
    int _2700 = _2698 + _2601;
    bool _2702 = uint(_2700) >= uint(_1508);
    bool _2704 = !_2702;
    int _2706 = _2704 ? 0 : (-1);
    bool _2708 = _1508 == 0;
    int _2710 = ~_2696;
    int _2712 = _2710 + _2706;
    int _2714 = _2712 + 1;
    float _2716 = _2694 * _1556;
    int _2718 = _1508 * _2714;
    int _2720 = _2718 + _2601;
    float _2722 = trunc(_2716);
    int _2724 = int(_2722);
    int _2726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2728 = _2726 != 0;
    int _2730 = ~_2690;
    int _2732 = _2730 + 1;
    int _2734 = _2732 + 1;
    bool _2736 = !_2708;
    int _2738 = _2736 ? _2720 : (-1);
    int _2740 = _1508 + (-1);
    bool _2742 = !_2728;
    int _2744 = _2742 ? 0 : 1;
    int _2746 = _2738 * _2734;
    int _2748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2750 = _2748 != 0;
    int _2752 = abs(_1414);
    int _2754 = _2690 * _2740;
    int _2756 = _2754 + _2746;
    int _2758 = abs(_2744);
    bool _2760 = !_2750;
    int _2762 = _2760 ? 0 : 1;
    int _2764 = abs(_1426);
    int _2766 = _2756 * _2752;
    int _2768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2770 = _2768 != 0;
    int _2772 = _2724 * _2758;
    int _2774 = _2772 + _2601;
    int _2776 = abs(_2762);
    int _2778 = _2633 * _2613;
    int _2780 = _2778 + _2766;
    float _2782 = in.m_53.w;
    int _2784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2786 = _2784 != 0;
    int _2788 = _2774 * _2764;
    int _2790 = _2788 + _2780;
    int _2792 = ~_1508;
    int _2794 = _2792 + 1;
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2798 = _2796 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2802 = _2800 != 0;
    int _2804 = _2724 * _2776;
    int _2806 = _2804 + _2790;
    int _2808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2810 = _2808 != 0;
    int _2812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2814 = _2812 != 0;
    float _2816 = 1.0 / _2798;
    float _2818 = float(uint(_2806));
    float _2820 = as_type<float>(_2641) * _2818;
    float _2822 = in.m_63.y;
    float _2824 = trunc(_2820);
    float _2826 = precise::max(_2824, 0.0);
    uint _2828 = uint(_2826);
    bool _2830 = _2782 > 0.5;
    float _2832 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2834 = _2832 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2836 = in.m_63.x;
    float _2838 = 1.0 / _2834;
    int _2840 = _2794 * int(_2828);
    int _2842 = _2840 + _2806;
    float _2844 = -_2822;
    float _2846 = _2844 + 1.0;
    float _2848 = float(uint(_2842));
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2852 = _1172 + _2850;
    int _2854 = _2830 ? as_type<int>(_2846) : as_type<int>(_2822);
    float _2856 = as_type<float>(_2641) * _2848;
    bool _2858 = _1188 > 0.5;
    float _2860 = _2810 ? as_type<float>(_2854) : _2822;
    float _2862 = trunc(_2856);
    float _2864 = precise::max(_2862, 0.0);
    uint _2866 = uint(_2864);
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2870 = _2868 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2872 = _2822;
    bool _2874 = _2770;
    bool _2876 = _2810;
    if (_2770)
    {
        float _2878 = _2858 ? _2846 : _2822;
        _2872 = _2878;
    }
    float _2880 = _2872;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2882;
    int _2886 = ~_1508;
    int _2888 = _2886 + 1;
    float _2890 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2892 = _2890 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_2786)
    {
        bool _2894 = _1216 > 0.5;
        _2874 = _2894;
    }
    bool _2896 = _2874;
    float _2898 = _2884 * _2816;
    float _2900 = 1.0 / _2870;
    float _2902 = _2836;
    if (_2786)
    {
        float _2904 = -_2836;
        float _2906 = _2904 + 1.0;
        _1920 = as_type<int>(_2906);
    }
    int _2908 = _1920;
    if (_2802)
    {
        bool _2910 = _1182 > 0.5;
        _2876 = _2910;
    }
    bool _2912 = _2876;
    float _2914 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2916 = _1172 + _2914;
    float _2918 = fma(_2898, _2852, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2920 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2922 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2920;
    float _2924 = float(uint(_2774));
    int _2926 = int(_2828) + int(_2866);
    float _2928 = _2922 * _2838;
    float _2930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2932 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2934 = isnan(_1172);
    bool _2936 = _2932 || _2934;
    bool _2938 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2940 = _2936 || _2938;
    float _2942 = float(_2940);
    int _2944 = _2888 * _2926;
    int _2946 = _2944 + _2806;
    int _2948 = ~_1508;
    int _2950 = _2948 + 1;
    float _2952 = _2892 * _2900;
    bool _2954 = uint(_2946) >= uint(_1508);
    float _2956 = fma(_2952, _2916, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2958 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2960 = _1172 + _2958;
    bool _2962 = !_2954;
    float _2964 = _2962 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2966 = fma(_2928, _2960, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2968 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2970 = isnan(_1172);
    bool _2972 = _2968 || _2970;
    bool _2974 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2976 = _2972 || _2974;
    float _2978 = float(_2976);
    float _2980 = _2930 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2982 = ~_2926;
    int _2984 = _2982 + as_type<int>(_2964);
    int _2986 = _2984 + 1;
    float _2988 = as_type<float>(_2641) * _2924;
    bool _2990 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2992 = isnan(_1172);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2998 = _2994 || _2996;
    float _3000 = float(_2998);
    float _3002 = -_2978;
    float _3004 = _3002 + 1.0;
    float _3006 = _2964;
    if (!_2802)
    {
        _3006 = _2836;
    }
    float _3008 = _3006;
    int _3010 = _1508 * _2986;
    int _3012 = _3010 + _2806;
    bool _3014 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3016 = isnan(_1172);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3022 = _3018 || _3020;
    float _3024 = float(_3022);
    float _3026 = trunc(_2988);
    float _3028 = precise::max(_3026, 0.0);
    uint _3030 = uint(_3028);
    float _3032 = _3000 * _3004;
    float _3034 = -_3000;
    float _3036 = _3034 + 1.0;
    bool _3038 = !_2708;
    int _3040 = _3038 ? _3012 : (-1);
    float _3042 = _3024 * _3036;
    float _3044 = -_3024;
    float _3046 = _3044 + 1.0;
    float _3048 = fma(_2860, _2980, -0.5);
    int _3050 = _3040 >> 31;
    float _3052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3054 = _2942 * _3046;
    float _3056 = -_2942;
    float _3058 = _3056 + 1.0;
    float _3060 = _2918 * _3054;
    int _3062 = _3050 & 3;
    int _3064 = _2950 * int(_3030);
    int _3066 = _3064 + _2774;
    int _3068 = _3040 + _3062;
    float _3070 = float(uint(_3066));
    float _3072 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2880, -0.5);
    int _3074 = _3068 >> 2;
    float _3076 = fma(_3058, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3060);
    float _3078 = _2615 * 6.283185482025146484375;
    float _3080 = sin(_3078);
    float _3082 = as_type<float>(_2641) * _3070;
    int _3084 = _3074 << 4;
    int _3086 = _3084 + 368;
    int _3088 = as_type<int>(_3070);
    float _3090 = _3008;
    if (_2802)
    {
        float _3092 = -_2836;
        float _3094 = _3092 + 1.0;
        _3088 = as_type<int>(_3094);
    }
    int _3096 = _3088;
    float _3098 = fma(_2956, _3042, _3076);
    float _3100 = -_1302;
    float _3102 = fma(_1558, _3072, _3100);
    uint _3104 = uint(int(uint(_3086) >> uint(2)));
    uint _3106 = uint(int(uint(int(_3104)) >> uint(2)));
    int _3108 = int(_3104) & 3;
    float _3110 = (*spvDescriptorSet0.vp_c9)._m0[int(_3106)][_3108];
    int _3112 = int(_3104) + 1;
    uint _3114 = uint(int(uint(_3112) >> uint(2)));
    int _3116 = _3112 & 3;
    float _3118 = (*spvDescriptorSet0.vp_c9)._m0[int(_3114)][_3116];
    if (_2802)
    {
        float _3120 = _2912 ? as_type<float>(_3096) : _2836;
        _3090 = _3120;
    }
    float _3122 = _3090;
    float _3124 = _3052 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2786)
    {
        float _3126 = _2896 ? as_type<float>(_2908) : _2836;
        _2902 = _3126;
    }
    float _3128 = _2902;
    float _3130 = _2615 * 6.283185482025146484375;
    float _3132 = cos(_3130);
    float _3134 = fma(_2966, _3032, _3098);
    float _3136 = fma(_3122, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _3138 = _3040 & 3;
    bool _3140 = _3138 != 0;
    int _3142 = _3086 + 8;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    uint _3146 = uint(int(uint(int(_3144)) >> uint(2)));
    int _3148 = int(_3144) & 3;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[int(_3146)][_3148];
    int _3152 = int(_3144) + 1;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    int _3156 = _3152 & 3;
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[int(_3154)][_3156];
    int _3160 = _3040 & 3;
    bool _3162 = _3160 != 0;
    float _3164 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3134);
    bool _3166 = uint(_3138) > 1u;
    float _3168 = trunc(_3082);
    float _3170 = precise::max(_3168, 0.0);
    uint _3172 = uint(_3170);
    int _3174 = _3162 ? 0 : 1;
    float _3176 = _3080 * _3048;
    bool _3178 = _3138 != 3;
    float _3180 = fma(_3124, _3128, -0.5);
    bool _3182 = uint(_3138) >= 2u;
    float _3184 = fma(_1550, _3136, _1298);
    int _3186 = ~_3174;
    int _3188 = _3186 + 1;
    int _3190 = _3188 + 1;
    float _3192 = _3132 * _3048;
    float _3194 = -_3176;
    float _3196 = fma(_3132, _3180, _3194);
    float _3198 = _3102 + 0.5;
    float _3200 = _3184 + 0.5;
    int _3202 = _3190;
    if (!_3166)
    {
        int _3204 = ~_3174;
        int _3206 = _3204 + 1;
        _3202 = _3206;
    }
    int _3208 = _3202;
    float _3210 = fma(_3080, _3180, _3192);
    bool _3212 = !_3140;
    int _3214 = _3212 ? 0 : 1;
    float _3216 = fma(_1562, _3196, _1378);
    int _3218 = _3182 ? 0 : 1;
    float _3220 = -_1408;
    float _3222 = fma(_1490, _3210, _3220);
    bool _3224 = _3138 != 3;
    float _3226 = _3216 + 0.5;
    int _3228 = int(_3030) + int(_3172);
    float _3230 = _3222 + 0.5;
    int _3232 = abs(_3208);
    int _3234 = ~_1508;
    int _3236 = _3234 + 1;
    int _3238 = ~_3218;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    out.m_65.x = _3200;
    out.m_65.y = _3198;
    out.m_65.z = _3226;
    out.m_65.w = _3230;
    bool _3244 = !_3224;
    int _3246 = _3244 ? 0 : (-1);
    int _3248 = _3236 * _3228;
    int _3250 = _3248 + _2774;
    int _3252 = abs(_3214);
    int _3254 = _3242;
    if (_3178)
    {
        int _3256 = ~_3218;
        int _3258 = _3256 + 1;
        _3254 = _3258;
    }
    int _3260 = _3254;
    int _3262 = ~_3232;
    int _3264 = _3262 + 1;
    int _3266 = _3264 + 1;
    bool _3268 = !_2814;
    int _3270 = _3268 ? 0 : 1;
    int _3272 = abs(_3246);
    int _3274 = _3266 * as_type<int>(_3118);
    int _3276 = abs(_3260);
    int _3278 = ~_3252;
    int _3280 = _3278 + 1;
    int _3282 = _3280 + 1;
    int _3284 = abs(_3270);
    bool _3286 = uint(_3250) >= uint(_1508);
    int _3288 = _3282 * as_type<int>(_3110);
    int _3290 = _3288 + _3274;
    int _3292 = ~_3276;
    int _3294 = _3292 + 1;
    int _3296 = _3294 + 1;
    bool _3298 = !_3286;
    int _3300 = _3298 ? 0 : (-1);
    int _3302 = _3296 * as_type<int>(_3150);
    int _3304 = _3302 + _3290;
    int _3306 = ~_3272;
    int _3308 = _3306 + 1;
    int _3310 = _3308 + 1;
    float _3312 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3314 = ~_3228;
    int _3316 = _3314 + _3300;
    int _3318 = _3316 + 1;
    float _3320 = _2544 + _2506;
    int _3322 = ~_3284;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    int _3328 = _3310 * as_type<int>(_3158);
    int _3330 = _3328 + _3304;
    float _3332 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3334 = _3312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3336 = _3164 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3338 = _3330 * _3326;
    float _3340 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3342 = _3332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3344 = _1508 * _3318;
    int _3346 = _3344 + _2774;
    float _3348 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3350 = _3340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3352 = _2506 * 0.5;
    float _3354 = _3320 * 0.5;
    bool _3356 = !_2708;
    int _3358 = _3356 ? _3346 : (-1);
    out.m_67.x = _3350;
    out.m_67.y = _3342;
    out.m_67.z = _3334;
    out.m_67.w = _3336;
    bool _3360 = _2270 > 0.0;
    bool _3362 = isnan(_2270);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan(0.0);
    bool _3368 = _3364 || _3366;
    float _3370 = fma(_2550, -0.5, _3352);
    int _3372 = _3358 * _3284;
    int _3374 = _3372 + _3338;
    float _3376 = _2639 + _2506;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _3378 = float(_3374);
    float _3380 = _3376 * 0.5;
    float _3382 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3384 = _3348 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3378;
    float _3386 = _3382 * _2574;
    float _3388 = -_3382;
    float _3390 = _3388 + 1.0;
    out.m_73.x = _3354;
    out.m_73.y = _3370;
    out.m_73.z = _3380;
    out.m_73.w = _2506;
    float _3392 = _2585 * _3386;
    float _3394 = _2595 * _3386;
    float _3396 = _2585 * _3390;
    out.m_49.x = _3384;
    float _3398 = fma(_2591, _3392, _2579);
    float _3400 = fma(_2593, _3392, _2581);
    float _3402 = fma(_2585, _3394, _2583);
    out.m_75.x = _3398;
    out.m_75.y = _3400;
    out.m_75.z = _3402;
    out.m_75.w = _3396;
    if (_3368)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3404 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3404;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1170 = false;
    bool _900 = false;
    bool _802 = false;
    bool _466 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3473 = as_type<float>(_118);
        out.gl_Position.z = _3473;
    }
    if (!_104)
    {
        return out;
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = float(_96);
    bool _134 = _100 >= _132;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    if (_138)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _108;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _120 = as_type<int>(_142);
    }
    int _144 = _120;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3528 = as_type<float>(_144);
        out.gl_Position.z = _3528;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _132;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        _194 = _156;
    }
    _196 = false;
    float _198 = _194;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_198);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = 1.0 / _214;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = _198 + _238;
    float _242 = 1.0 / _222;
    bool _244 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _246 = isnan(_198);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _258 = 1.0 / _218;
    float _260 = 1.0 / _210;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _198 + _262;
    float _266 = _202 * _242;
    bool _268 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _270 = isnan(_198);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _280;
    float _284 = _264 * _236;
    bool _286 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _288 = isnan(_198);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_254;
    float _300 = _298 + 1.0;
    float _302 = _206 * _258;
    float _304 = -_296;
    float _306 = _304 + 1.0;
    float _308 = fma(_282, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = _278 * _306;
    bool _312 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_198);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _328 = -_278;
    float _330 = _328 + 1.0;
    float _332 = _234 * _300;
    float _334 = _240 * _260;
    float _336 = -_234;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _344;
    float _348 = _254 * _330;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = _322 * _338;
    float _360 = fma(_342, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = fma(_346, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = fma(_326, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_352, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _368 = fma(_356, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = _308 * _358;
    float _372 = -_322;
    float _374 = _372 + 1.0;
    float _376 = _360 * _358;
    float _378 = _362 * _358;
    float _380 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _382 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _376);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _378);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_364, _332, _380);
    float _400 = fma(_366, _332, _382);
    float _402 = fma(_386, _334, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _404 = fma(_368, _332, _388);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _414 = fma(_392, _334, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_396, _334, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _422 = fma(_402, _348, _398);
    float _424 = fma(_408, _284, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _426 = fma(_412, _284, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _428 = fma(_420, _284, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _430 = fma(_414, _348, _400);
    float _432 = fma(_416, _348, _404);
    float _434 = fma(_424, _310, _422);
    float _436 = fma(_426, _310, _430);
    float _438 = fma(_428, _310, _432);
    float _440 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[147].x, _434);
    float _442 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[147].y, _436);
    float _444 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[147].z, _438);
    bool _446 = !_256;
    float _464;
    if (!_446)
    {
        float _448 = in.m_53.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        _464 = _156;
    }
    _466 = false;
    float _468 = _464;
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = in.m_55.z;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _492 = 1.0 / _478;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _494;
    float _498 = 1.0 / _482;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _502 = _468 + _500;
    bool _504 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _506 = isnan(_468);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _442 * _472;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _520 = _468 + _518;
    float _522 = 1.0 / _486;
    float _524 = _502 * _492;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _528 = _468 + _526;
    float _530 = _444 * _474;
    bool _532 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _534 = isnan(_468);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _546 = _468 + _544;
    float _548 = _440 * _470;
    float _550 = _520 * _498;
    bool _552 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _554 = isnan(_468);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = 1.0 / _490;
    bool _566 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _568 = isnan(_468);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _580 = _468 + _578;
    bool _582 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _584 = _528 * _522;
    float _586 = -_576;
    float _588 = _586 + 1.0;
    float _590 = 1.0 / _496;
    float _592 = -_562;
    float _594 = _592 + 1.0;
    bool _596 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _598 = isnan(_468);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _576 * _594;
    float _610 = _542 * _588;
    bool _612 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _614 = isnan(_468);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -_606;
    float _626 = _624 + 1.0;
    float _628 = -_542;
    float _630 = _628 + 1.0;
    float _632 = _580 * _564;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _634;
    float _638 = _622 * _626;
    float _640 = -_622;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _644;
    float _648 = _606 * _630;
    float _650 = _546 * _590;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _660 = fma(_636, _524, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _670 = _514 * _642;
    float _672 = fma(_654, _524, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _674 = fma(_646, _524, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _676 = fma(_658, _550, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _678 = fma(_664, _550, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _680 = fma(_668, _550, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _682 = _660 * _670;
    float _684 = -_514;
    float _686 = _684 + 1.0;
    float _688 = _672 * _670;
    float _690 = _674 * _670;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _700;
    float _704 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[107].x, _682);
    float _706 = fma(_694, _584, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _708 = fma(_698, _584, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _710 = fma(_702, _584, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[107].y, _688);
    float _718 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[107].z, _690);
    float _720 = fma(_676, _638, _704);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _726 = fma(_714, _632, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _728 = fma(_678, _638, _716);
    float _730 = fma(_680, _638, _718);
    float _732 = fma(_706, _648, _720);
    float _734 = fma(_724, _632, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _740 = fma(_708, _648, _728);
    float _742 = fma(_710, _648, _730);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _748;
    float _752 = fma(_738, _632, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _754;
    float _758 = fma(_726, _610, _732);
    float _760 = fma(_746, _650, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _762 = fma(_750, _650, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _764 = fma(_756, _650, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _766 = fma(_734, _610, _740);
    float _768 = fma(_752, _610, _742);
    float _770 = fma(_760, _608, _758);
    float _772 = fma(_762, _608, _766);
    float _774 = fma(_764, _608, _768);
    float _776 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[112].x, _770);
    float _778 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[112].y, _772);
    float _780 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[112].z, _774);
    bool _782 = !_582;
    float _800;
    if (!_782)
    {
        float _784 = in.m_53.x;
        float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _788 = _784 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _792 = _790 * _786;
        float _794 = floor(_792);
        float _796 = -_794;
        float _798 = _792 + _796;
        _800 = _798;
        _802 = true;
    }
    else
    {
        _800 = _156;
    }
    _802 = false;
    float _804 = _800;
    bool _806 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _808 = isnan(_804);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _824 = isnan(_804);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _804 + _838;
    float _842 = -_816;
    float _844 = _842 + 1.0;
    bool _846 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _848 = 1.0 / _820;
    float _850 = _832 * _844;
    float _852 = -_832;
    float _854 = _852 + 1.0;
    float _856 = _836 * _848;
    float _858 = _778 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _860 = fma(_856, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _862 = _776 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _864 = _860 * _850;
    float _866 = _780 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[115].x, _864);
    float _870 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _872 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[116].x, _868);
    float _878 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _880 = !_846;
    float _898;
    if (!_880)
    {
        float _882 = in.m_53.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        _898 = _156;
    }
    _900 = false;
    float _902 = _898;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _906 = _902 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _910 = _902 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _914 = _902 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _932 = 1.0 / _918;
    bool _934 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _936 = isnan(_902);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = 1.0 / _922;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _950 = _902 + _948;
    float _952 = 1.0 / _926;
    float _954 = _906 * _932;
    bool _956 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _958 = isnan(_902);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _970 = 1.0 / _930;
    float _972 = _910 * _946;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _978;
    float _982 = fma(_976, _954, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _984 = fma(_980, _954, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _986 = _914 * _952;
    float _988 = -_944;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _992;
    float _996 = fma(_994, _954, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _998 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1000 = isnan(_902);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _950 * _970;
    bool _1012 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1014 = isnan(_902);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = _966 * _990;
    float _1026 = -_966;
    float _1028 = _1026 + 1.0;
    bool _1030 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1032 = isnan(_902);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = -_1022;
    float _1044 = _1042 + 1.0;
    float _1046 = _1022 * _1028;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1056 = _1008 * _1044;
    float _1058 = -_1008;
    float _1060 = _1058 + 1.0;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1066 = fma(_1050, _972, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1068 = fma(_1054, _972, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1070 = _1040 * _1060;
    float _1072 = fma(_1064, _972, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1074 = _984 * _1070;
    float _1076 = _982 * _1070;
    float _1078 = -_1040;
    float _1080 = _1078 + 1.0;
    float _1082 = _996 * _1070;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1092;
    float _1096 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1076);
    float _1098 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1074);
    float _1100 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1082);
    float _1102 = fma(_1086, _986, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1104 = fma(_1090, _986, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1106 = fma(_1094, _986, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1108 = fma(_1066, _1056, _1096);
    float _1110 = fma(_1072, _1056, _1098);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1120 = fma(_1068, _1056, _1100);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1126 = fma(_1102, _1046, _1108);
    float _1128 = fma(_1114, _1010, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1130 = fma(_1118, _1010, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1132 = fma(_1104, _1046, _1110);
    float _1134 = fma(_1124, _1010, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1136 = fma(_1106, _1046, _1120);
    float _1138 = fma(_1128, _1024, _1126);
    float _1140 = fma(_1130, _1024, _1132);
    float _1142 = fma(_1134, _1024, _1136);
    float _1144 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1138);
    float _1146 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1140);
    float _1148 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1142);
    bool _1150 = !_968;
    float _1168;
    if (!_1150)
    {
        float _1152 = in.m_53.x;
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1156 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1160 = _1158 * _1154;
        float _1162 = floor(_1160);
        float _1164 = -_1162;
        float _1166 = _1160 + _1164;
        _1168 = _1166;
        _1170 = true;
    }
    else
    {
        _1168 = _156;
    }
    _1170 = false;
    float _1172 = _1168;
    float _1174 = in.m_42.x;
    float _1176 = in.m_42.y;
    float _1178 = in.m_42.z;
    float _1180 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1182 = in.m_53.x;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = in.m_53.y;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1194 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1196 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1194);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1202 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1204 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1206 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1196);
    float _1208 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1210 = _1182 * 2.0;
    float _1212 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1204);
    float _1214 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1200);
    float _1216 = in.m_53.z;
    float _1218 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1220 = -_1190;
    float _1222 = fma(_1208, 2.0, _1220);
    float _1224 = _1188 * 2.0;
    float _1226 = floor(_1210);
    float _1228 = fma(_1218, -2.0, _1192);
    float _1230 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1202);
    float _1232 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1212);
    float _1234 = _1182 + _1188;
    float _1236 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1238 = floor(_1224);
    float _1240 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1230);
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1244 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1236);
    float _1246 = _1234 + (-1.0);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1250 = _1226 > 0.0;
    float _1252 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1244);
    bool _1254 = _1226 >= 0.0;
    bool _1256 = isnan(_1226);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan(0.0);
    bool _1262 = _1258 || _1260;
    float _1264 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1214);
    float _1266 = _1244;
    float _1268 = _1214;
    float _1270 = _1178;
    float _1272 = _1230;
    if (!_1186)
    {
        _1266 = _1188;
    }
    float _1274 = _1266;
    float _1276 = _1216 * 2.0;
    float _1278 = _1274;
    if (!_1186)
    {
        _1268 = _1182;
    }
    float _1280 = _1268;
    float _1282 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1284 = _1280;
    if (!_1186)
    {
        _1270 = _1216;
    }
    float _1286 = _1270;
    float _1288 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1290 = int(_1288);
    float _1292 = _1286;
    if (_1186)
    {
        _1278 = _1182;
    }
    float _1294 = _1278;
    float _1296 = -_100;
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1222);
    if (_1186)
    {
        _1284 = _1216;
    }
    float _1300 = _1284;
    float _1302 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1228);
    bool _1304 = _1238 > 0.0;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1308 = _1238;
    if (!_1186)
    {
        _1272 = _1286;
    }
    float _1310 = _1272;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1242);
    float _1314 = -_1198;
    float _1316 = fma(_1306, 2.0, _1314);
    float _1318 = _1310;
    if (_1186)
    {
        _1318 = _1188;
    }
    float _1320 = _1318;
    float _1322 = floor(_1276);
    bool _1324 = _1238 >= 0.0;
    bool _1326 = isnan(_1238);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1186)
    {
        _1308 = _1188;
    }
    float _1336 = _1308;
    float _1338 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1340 = _1262 ? 0 : 1;
    float _1342 = _1182 + _1216;
    float _1344 = fma(_1338, -2.0, _1334);
    float _1346 = _1336;
    if (_1186)
    {
        _1346 = _1182;
    }
    float _1348 = _1346;
    float _1350 = _1342 + (-1.0);
    int _1352 = _1332 ? 0 : 1;
    float _1354 = rsqrt(_1206);
    int _1356 = ~_1340;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1248);
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1374 = _1372 != 0;
    float _1376 = -_100;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1316);
    int _1380 = _1360;
    if (!_1250)
    {
        int _1382 = ~_1340;
        int _1384 = _1382 + 1;
        _1380 = _1384;
    }
    int _1386 = _1380;
    float _1388 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1312);
    int _1390 = ~_1352;
    int _1392 = _1390 + 1;
    int _1394 = _1392 + 1;
    float _1396 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1398 = log2(_1396);
    int _1400 = _1394;
    if (!_1304)
    {
        int _1402 = ~_1352;
        int _1404 = _1402 + 1;
        _1400 = _1404;
    }
    int _1406 = _1400;
    float _1408 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1344);
    float _1410 = _1240 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1412 = !_1370;
    int _1414 = _1412 ? 0 : 1;
    float _1416 = _1232 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1418 = !_1366;
    int _1420 = _1418 ? 0 : 1;
    float _1422 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1424 = !_1374;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = _1188 + _1216;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1432 = _1430 != 0;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1440 = _1438 != 0;
    float _1442 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1428 + (-1.0);
    bool _1446 = !_1440;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1452 = !_1436;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1458 = abs(_1448);
    float _1460 = float(_1290);
    bool _1462 = _1322 > 0.0;
    bool _1464 = _1322 >= 0.0;
    bool _1466 = isnan(_1322);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan(0.0);
    bool _1472 = _1468 || _1470;
    float _1474 = _1398 * _100;
    float _1476 = 1.0 / _1460;
    if (_1186)
    {
        _1292 = _1188;
    }
    float _1478 = _1292;
    int _1480 = abs(_1454);
    float _1482 = float(_1406);
    float _1484 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1456);
    float _1486 = float(_1458);
    float _1488 = exp2(_1474);
    float _1490 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1484);
    float _1492 = float(_1386);
    float _1494 = _1486 * _1482;
    float _1496 = in.m_57.x;
    float _1498 = in.m_57.y;
    float _1500 = in.m_57.z;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1504 = 1.0 + _1502;
    float _1506 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1508 = int(_1506);
    float _1510 = _1476 * _100;
    float _1512 = float(_1480);
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1516 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1518 = isnan(1.0);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1524 = _1520 || _1522;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1528 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1530 = isnan(0.0);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1536 = _1532 || _1534;
    float _1538 = 1.0 / _1504;
    float _1540 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1514);
    float _1542 = -_1488;
    float _1544 = _1542 + 1.0;
    float _1546 = _1512 * _1492;
    float _1548 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1526);
    float _1550 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1540);
    int _1552 = _1472 ? 0 : 1;
    float _1554 = _1546 * (-2.0);
    float _1556 = float(_1508);
    float _1558 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1548);
    float _1560 = _1536 ? _1544 : 0.0;
    float _1562 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1362);
    float _1564 = fma(_1450, _1554, _1450);
    float _1566 = _1556 * _100;
    float _1568 = fma(_1554, _1498, _1498);
    float _1570 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1524)
    {
        float _1572 = _1560 * _1538;
        _110 = _1572;
    }
    float _1574 = _110;
    float _1576 = _1188 + (-0.5);
    int _1578 = ~_1552;
    int _1580 = _1578 + 1;
    int _1582 = _1580 + 1;
    int _1584 = _1582;
    if (!_1462)
    {
        int _1586 = ~_1552;
        int _1588 = _1586 + 1;
        _1584 = _1588;
    }
    int _1590 = _1584;
    float _1592 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1568);
    float _1594 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1596 = _1570 * _1570;
    float _1598 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1600 = fma(_1594, _1594, _1596);
    bool _1602 = !_1432;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1606;
    float _1610 = _1494 * (-2.0);
    float _1612 = fma(_1598, _1598, _1600);
    int _1614 = abs(_1604);
    float _1616 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1618 = fma(_1422, _1610, _1422);
    float _1620 = fma(_1610, _1500, _1500);
    float _1622 = fma(_1564, _1574, _1592);
    float _1624 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1626 = _1216 + (-0.5);
    float _1628 = _1622 * 0.15915493667125701904296875;
    float _1630 = float(_1590);
    float _1632 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1616);
    float _1634 = float(_1614);
    float _1636 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1620);
    float _1638 = rsqrt(_1612);
    float _1640 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1642 = _1634 * _1630;
    float _1644 = _1642 * (-2.0);
    float _1646 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1648 = fma(_1618, _1574, _1636);
    float _1650 = _1182 + (-0.5);
    float _1652 = in.m_59.x;
    float _1654 = in.m_59.y;
    float _1656 = in.m_59.z;
    float _1658 = -_1646;
    float _1660 = _1442 + _1658;
    float _1662 = fma(_1644, _1496, _1496);
    float _1664 = 1.0 / _1608;
    float _1666 = fma(_1282, _1644, _1282);
    bool _1668 = _1646 >= _1442;
    bool _1670 = isnan(_1646);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan(_1442);
    bool _1676 = _1672 || _1674;
    float _1678 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1662);
    float _1680 = abs(_1660);
    float _1682 = precise::max(_1680, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1684 = _1648 * 0.15915493667125701904296875;
    float _1686 = _1594 * _1638;
    float _1688 = fma(_1666, _1574, _1678);
    float _1690 = precise::min(_1682, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1692 = _1684 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    bool _1696 = !_1676;
    float _1698 = _1696 ? 1.0 : (-1.0);
    float _1700 = _1688 * 0.15915493667125701904296875;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1704 = _1690 + _1702;
    float _1706 = _1570 * _1638;
    float _1708 = _1598 * _1638;
    float _1710 = _1704 * _1664;
    float _1712 = _1684 * 6.283185482025146484375;
    float _1714 = cos(_1712);
    float _1716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1652);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1656);
    float _1720 = _1698 * _1710;
    float _1722 = _1628 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1728 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1730 = _1728 * _1720;
    float _1732 = _1628 * 6.283185482025146484375;
    float _1734 = cos(_1732);
    float _1736 = _1700 * 6.283185482025146484375;
    float _1738 = sin(_1736);
    float _1740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1654);
    float _1742 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1744 = _1726 * _1718;
    float _1746 = _1180 * _1740;
    float _1748 = _1742 * _1716;
    float _1750 = _1730 * 0.15915493667125701904296875;
    float _1752 = _1700 * 6.283185482025146484375;
    float _1754 = cos(_1752);
    float _1756 = _1714 * _1746;
    float _1758 = _1734 * _1714;
    float _1760 = _1724 * _1714;
    float _1762 = _1738 * _1724;
    float _1764 = -_1746;
    float _1766 = _1694 * _1764;
    float _1768 = _1750 * 6.283185482025146484375;
    float _1770 = cos(_1768);
    float _1772 = fma(_1758, _1748, _1766);
    float _1774 = _1754 * _1734;
    float _1776 = _1754 * _1724;
    float _1778 = _1754 * _1756;
    float _1780 = _1738 * _1734;
    float _1782 = fma(_1694, _1774, _1762);
    float _1784 = _1738 * _1756;
    float _1786 = fma(_1760, _1744, _1772);
    float _1788 = -_1780;
    float _1790 = fma(_1694, _1776, _1788);
    float _1792 = fma(_1782, _1748, _1778);
    float _1794 = -_1776;
    float _1796 = fma(_1694, _1780, _1794);
    float _1798 = _1750 * 6.283185482025146484375;
    float _1800 = sin(_1798);
    float _1802 = fma(_1694, _1762, _1774);
    float _1804 = fma(_1790, _1744, _1792);
    float _1806 = fma(_1796, _1748, _1784);
    float _1808 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1810 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1814 = fma(_1802, _1744, _1806);
    float _1816 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1808);
    float _1818 = -_1770;
    float _1820 = _1818 + 1.0;
    float _1822 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1810);
    float _1824 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1812);
    float _1826 = _1708 * _1708;
    float _1828 = _1706 * _1820;
    float _1830 = _1686 * _1800;
    float _1832 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1816);
    float _1834 = _1706 * _1800;
    float _1836 = fma(_1820, _1826, _1770);
    float _1838 = _1708 * _1800;
    float _1840 = _1686 * _1820;
    float _1842 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1822);
    float _1844 = fma(_1708, _1828, _1830);
    float _1846 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1848 = -_1838;
    float _1850 = fma(_1706, _1840, _1848);
    float _1852 = -_1834;
    float _1854 = fma(_1708, _1840, _1852);
    float _1856 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1858 = _1846 * _1844;
    float _1860 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1824);
    float _1862 = fma(_1686, _1840, _1770);
    float _1864 = _1846 * _1850;
    float _1866 = fma(_1856, _1854, _1858);
    float _1868 = _1860 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1870 = fma(_1706, _1840, _1838);
    float _1872 = fma(_1856, _1862, _1864);
    float _1874 = fma(_1708, _1840, _1834);
    float _1876 = fma(_1868, _1836, _1866);
    float _1878 = fma(_1706, _1828, _1770);
    float _1880 = -_1830;
    float _1882 = fma(_1708, _1828, _1880);
    float _1884 = fma(_1868, _1874, _1872);
    float _1886 = _1416 + _1876;
    float _1888 = _1846 * _1878;
    float _1890 = _1624 + _1884;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1894 = _1886 + _1892;
    float _1896 = fma(_1856, _1870, _1888);
    float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1900 = _1890 + _1898;
    float _1902 = _1894 * _1894;
    float _1904 = fma(_1868, _1882, _1896);
    float _1906 = fma(_1900, _1900, _1902);
    float _1908 = _1410 + _1904;
    float _1910 = sqrt(_1906);
    bool _1912 = _1910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1914 = _1904;
    float _1916 = _1706;
    float _1918 = _1896;
    int _1920 = as_type<int>(_1740);
    if (!_1912)
    {
        _1914 = _1890;
    }
    float _1922 = _1914;
    float _1924 = _1922;
    if (!_1912)
    {
        _1916 = _1886;
    }
    float _1926 = _1916;
    float _1928 = _1926;
    if (!_1912)
    {
        _1918 = _1908;
    }
    float _1930 = _1918;
    bool _1932 = !_1912;
    float _1934 = _1930;
    if (!_1932)
    {
        float _1936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1940 = _1910 + _1938;
        float _1942 = rsqrt(_1906);
        float _1944 = _1940 * _1936;
        float _1946 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1948 = _1944 * 0.15915493667125701904296875;
        float _1950 = _1948 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = _1948 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        float _1958 = fma(_1952, _1946, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1960 = _1942 * _1958;
        float _1962 = _1956 + (-1.0);
        float _1964 = fma(_1900, _1960, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1966 = fma(_1894, _1960, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1968 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = fma(_1908, _1956, _1968);
        _1934 = _1970;
        _1924 = _1964;
        _1928 = _1966;
    }
    float _1972 = _1934;
    float _1974 = _1924;
    float _1976 = _1928;
    float _1978 = -_1410;
    float _1980 = _1978 + _1972;
    float _1982 = -_1624;
    float _1984 = _1982 + _1974;
    float _1986 = -_1416;
    float _1988 = _1986 + _1976;
    float _1990 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1992 = _1980 * _1980;
    float _1994 = fma(_1984, _1984, _1992);
    float _1996 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1990);
    float _1998 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2000 = fma(_1988, _1988, _1994);
    float _2002 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1996);
    float _2004 = sqrt(_2000);
    float _2006 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2008 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1998);
    float _2010 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2008);
    bool _2012 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan(0.5);
    bool _2020 = _2016 || _2018;
    float _2022 = 1.0 / _2006;
    float _2024 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2026 = _2024 + _2006;
    bool _2028 = _2004 > 0.0;
    bool _2030 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2032 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan(0.5);
    bool _2038 = _2034 || _2036;
    float _2040 = _2026 * _2022;
    float _2042 = _2040 * 0.5;
    bool _2044 = !_2028;
    float _2046 = _1972;
    float _2048 = _1984;
    float _2050 = _1974;
    float _2052 = _1976;
    float _2054 = _2006;
    float _2056 = _1980;
    float _2058 = _1988;
    float _2060 = _2000;
    float _2062 = _2024;
    float _2064 = _2022;
    if (!_2044)
    {
        float _2066 = _172 * _172;
        float _2068 = rsqrt(_2000);
        float _2070 = fma(_170, _170, _2066);
        float _2072 = fma(_174, _174, _2070);
        float _2074 = sqrt(_2072);
        float _2076 = _1984 * _2068;
        float _2078 = _1980 * _2068;
        bool _2080 = _2074 > 0.0;
        float _2082 = _1988 * _2068;
        bool _2084 = !_2080;
        _2054 = _2072;
        _2060 = _2068;
        _2062 = _2082;
        if (!_2084)
        {
            float _2086 = rsqrt(_2072);
            float _2088 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2090 = _172 * _2086;
            float _2092 = _170 * _2086;
            float _2094 = _174 * _2086;
            float _2096 = _2078 * _2090;
            float _2098 = fma(_2076, _2092, _2096);
            float _2100 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2102 = fma(_2082, _2094, _2098);
            float _2104 = _2102 * _2100;
            float _2106 = fma(_170, _2104, _1974);
            float _2108 = fma(_172, _2104, _1972);
            float _2110 = fma(_174, _2104, _1976);
            _2046 = _2108;
            _2048 = _2098;
            _2050 = _2106;
            _2052 = _2110;
            _2056 = _2104;
            _2058 = _2096;
            _2060 = _2100;
        }
    }
    float _2112 = _2046;
    float _2114 = _2048;
    float _2116 = _2050;
    float _2118 = _2052;
    float _2120 = _2054;
    float _2122 = _2056;
    float _2124 = _2058;
    float _2126 = _2060;
    float _2128 = _2062;
    float _2130 = _2120;
    float _2132 = _2122;
    float _2134 = _2116;
    float _2136 = _2118;
    float _2138 = _2114;
    float _2140 = _2128;
    if (_2038)
    {
        _2130 = 1.0;
    }
    float _2142 = _2130;
    float _2144 = _2142;
    if (_2020)
    {
        _2132 = _2112;
    }
    float _2146 = _2132;
    float _2148 = _2146;
    if (!_2020)
    {
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2152 = _1410 + _2150;
        float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2156 = _1624 + _2154;
        float _2158 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2160 = -_1410;
        float _2162 = _2160 + _2112;
        float _2164 = _2152 * _2152;
        float _2166 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2168 = _1416 + _2166;
        float _2170 = fma(_2156, _2156, _2164);
        float _2172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2174 = fma(_2168, _2168, _2170);
        float _2176 = sqrt(_2174);
        float _2178 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2180 = precise::min(_2176, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2182 = _2180 * _2172;
        float _2184 = -_1624;
        float _2186 = _2184 + _2116;
        float _2188 = -_1416;
        float _2190 = _2188 + _2118;
        float _2192 = _2178 * _2182;
        float _2194 = fma(_2186, _2192, _1624);
        float _2196 = fma(_2162, _2192, _1410);
        float _2198 = fma(_2190, _2192, _1416);
        _2148 = _2196;
        _2134 = _2194;
        _2136 = _2198;
        _2138 = _2192;
    }
    float _2200 = _2148;
    float _2202 = _2134;
    float _2204 = _2136;
    float _2206 = _2138;
    float _2208 = _2206;
    if (!_2038)
    {
        float _2210 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2212 = _2210 * 0.15915493667125701904296875;
        float _2214 = _2212 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2220 = _2218 * 0.15915493667125701904296875;
        float _2222 = _2212 * 6.283185482025146484375;
        float _2224 = sin(_2222);
        float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2228 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2226);
        float _2230 = 1.0 / _2216;
        float _2232 = _2220 * 6.283185482025146484375;
        float _2234 = cos(_2232);
        float _2236 = _2224 * _2230;
        float _2238 = 1.0 / _2228;
        float _2240 = _2234 * _2236;
        float _2242 = _2220 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2246;
        float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2252 = _2238 * _2250;
        float _2254 = 1.0 / _2240;
        float _2256 = 1.0 / _2248;
        float _2258 = _2244 * _2254;
        float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2262 = fma(_2258, _2252, _2260);
        float _2264 = _2262 * _2256;
        float _2266 = precise::clamp(_2264, 0.0, 1.0);
        _2208 = _2212;
        _2144 = _2266;
    }
    float _2268 = _2208;
    float _2270 = _2144;
    float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2274 = _2200 + _2272;
    float _2276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2278 = _2202 + _2276;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2282 = _2204 + _2280;
    float _2284 = _2274 * _2274;
    float _2286 = fma(_2278, _2278, _2284);
    float _2288 = fma(_2282, _2282, _2286);
    float _2290 = rsqrt(_2288);
    float _2292 = sqrt(_2288);
    float _2294 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2296 = _2278 * _2294;
    float _2298 = _2282 * _2294;
    float _2300 = _2296 * _2296;
    float _2302 = _2298 * _2298;
    float _2304 = _2300 + _2302;
    float _2306 = sqrt(_2304);
    bool _2308 = _2306 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2312 = _2306 + _2310;
    float _2314 = _2124;
    float _2316 = _2312;
    float _2318 = _2274;
    float _2320 = _2298;
    float _2322 = _2300;
    float _2324 = _2302;
    if (_2308)
    {
        float _2326 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2314 = _2326;
    }
    float _2328 = _2314;
    if (_2308)
    {
        float _2330 = _2312 * _2328;
        _2316 = _2330;
    }
    float _2332 = _2316;
    if (_2308)
    {
        float _2334 = _2332 * 0.15915493667125701904296875;
        _2064 = _2334;
    }
    float _2336 = _2064;
    float _2338 = _2126;
    if (_2308)
    {
        float _2340 = _2336 * 6.283185482025146484375;
        float _2342 = sin(_2340);
        _2338 = _2342;
    }
    float _2344 = _2338;
    float _2346 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2348 = precise::max(0.0, _2346);
    float _2350 = _2268;
    float _2352 = _2348;
    if (_2308)
    {
        float _2354 = _2336 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        _2350 = _2356;
    }
    float _2358 = _2350;
    float _2360 = -_2294;
    float _2362 = -_2348;
    float _2364 = fma(_2274, _2360, _2362);
    if (!_2308)
    {
        _2318 = _2296;
    }
    float _2366 = _2318;
    float _2368 = _2346;
    float _2370 = _2366;
    if (_2308)
    {
        float _2372 = rsqrt(_2304);
        _2368 = _2372;
    }
    float _2374 = _2368;
    if (_2308)
    {
        float _2376 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2352 = _2376;
    }
    float _2378 = _2352;
    float _2380 = _2378;
    if (_2308)
    {
        float _2382 = fma(_2344, _2378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2140 = _2382;
    }
    float _2384 = _2140;
    float _2386 = _2384;
    if (_2308)
    {
        float _2388 = _2358 + (-1.0);
        _2380 = _2388;
    }
    float _2390 = _2380;
    float _2392 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2394 = _2390;
    if (_2308)
    {
        float _2396 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2394 = _2396;
    }
    float _2398 = _2394;
    float _2400 = _2374;
    if (_2308)
    {
        float _2402 = _2374 * _2384;
        _2386 = _2402;
    }
    float _2404 = _2386;
    if (!_2308)
    {
        _2400 = _2364;
    }
    float _2406 = _2400;
    float _2408 = _2406;
    if (_2308)
    {
        float _2410 = fma(_2364, _2358, _2398);
        _2408 = _2410;
    }
    float _2412 = _2408;
    if (_2308)
    {
        float _2414 = _2296 * _2404;
        _2370 = _2414;
    }
    float _2416 = _2370;
    if (_2308)
    {
        float _2418 = _2298 * _2404;
        _2320 = _2418;
    }
    float _2420 = _2320;
    if (_2308)
    {
        float _2422 = _2416 * _2416;
        _2322 = _2422;
    }
    float _2424 = _2322;
    if (_2308)
    {
        float _2426 = _2420 * _2420;
        _2324 = _2426;
    }
    float _2428 = _2324;
    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2432 = fma(_2292, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2430);
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    float _2436 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2438 = fma(_2412, _2412, _2424);
    float _2440 = -_2434;
    float _2442 = _2440 + 1.0;
    float _2444 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2436);
    float _2446 = _2438 + _2428;
    float _2448 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2450 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2452 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2444);
    float _2454 = abs(_2442);
    float _2456 = log2(_2454);
    float _2458 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2448);
    float _2460 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2462 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2464 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2458);
    float _2466 = rsqrt(_2446);
    float _2468 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2470 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2460);
    float _2472 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2450);
    float _2474 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2476 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2470);
    float _2478 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2472);
    float _2480 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2482 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2484 = _2476 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2486 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2488 = -_2474;
    float _2490 = fma(_2488, _2392, 1.0);
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2480);
    float _2494 = exp2(_2482);
    float _2496 = _2466 * _2416;
    float _2498 = _2466 * _2412;
    float _2500 = _2466 * _2420;
    float _2502 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2492);
    float _2504 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2506 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2502);
    float _2508 = -_2504;
    float _2510 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2508);
    float _2512 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2514 = log2(_2490);
    float _2516 = -_2500;
    float _2518 = fma(_2516, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2510);
    float _2520 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2522 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2512);
    float _2524 = fma(_2518, -0.5, 0.5);
    float _2526 = fma(_2518, 0.5, 0.5);
    float _2528 = 1.0 / _2506;
    float _2530 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2520);
    float _2532 = _2498 + 1.0;
    float _2534 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2522);
    float _2536 = fma(_2526, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2538 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2530);
    float _2540 = -_2498;
    float _2542 = fma(_2494, _2532, _2540);
    float _2544 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2534);
    float _2546 = sqrt(_2524);
    float _2548 = fma(_2526, _2536, -0.212114393711090087890625);
    float _2550 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2538);
    float _2552 = _2514 * 0.693147182464599609375;
    float _2554 = fma(_2542, 0.5, 0.5);
    float _2556 = fma(_2526, _2548, 1.570728778839111328125);
    float _2558 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2560 = _2550 * _2528;
    float _2562 = _2544 * _2528;
    float _2564 = fma(_2562, 0.5, 0.5);
    float _2566 = _2546 * 0.636619746685028076171875;
    float _2568 = fma(_2560, -0.5, 0.5);
    float _2570 = -_2556;
    float _2572 = fma(_2566, _2570, 1.0);
    float3 _7443 = float3(_2564, _2568, _2558);
    float _2574 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7443, float3(0.0), isnan(_7443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7443, float3(0.0), isnan(_7443)), level(0.0)).x;
    float3 _7454 = float3(_2564, _2568, _2558);
    float4 _2577 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7454, float3(0.0), isnan(_7454)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7454, float3(0.0), isnan(_7454)), level(0.0)).xyzw;
    float _2579 = _2577.x;
    float _2581 = _2577.y;
    float _2583 = _2577.z;
    float _2585 = _2577.w;
    float2 _7471 = float2(_2572, _2554);
    float3 _2589 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7471, float2(0.0), isnan(_7471)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7471, float2(0.0), isnan(_7471)), level(0.0)).xyz;
    float _2591 = _2589.x;
    float _2593 = _2589.y;
    float _2595 = _2589.z;
    float _2597 = float(uint(_1508));
    float _2599 = trunc(_1510);
    int _2601 = int(_2599);
    int _2603 = ~_1508;
    int _2605 = _2603 + 1;
    float _2607 = _1566 * _152;
    int _2609 = ~_1508;
    int _2611 = _2609 + 1;
    out.m_61.x = _870;
    out.m_61.y = _872;
    out.m_61.z = _874;
    out.m_61.w = _878;
    int _2613 = abs(_1420);
    float _2615 = _1388 * (-0.15915493667125701904296875);
    float _2617 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2619 = 1.0 / _2597;
    float _2621 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2623 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2621);
    bool _2625 = !_1186;
    float _2627 = _2625 ? 7.345489978790283203125 : 1.0;
    float _2629 = float(uint(_2601));
    float _2631 = trunc(_2607);
    int _2633 = int(_2631);
    float _2635 = float(_2601);
    float _2637 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2623);
    float _2639 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2637);
    int _2641 = as_type<int>(_2619) + (-2);
    float _2643 = exp2(_2617);
    out.gl_Position.x = _2544;
    out.gl_Position.y = _2550;
    out.gl_Position.z = _2639;
    out.gl_Position.w = _2506;
    float _2645 = as_type<float>(_2641) * _2629;
    float _2647 = trunc(_2645);
    float _2649 = precise::max(_2647, 0.0);
    uint _2652 = uint(_2649);
    float _2654 = -_2643;
    float _2656 = _2654 + 1.0;
    int _2658 = _2605 * int(_2652);
    int _2660 = _2658 + _2601;
    float _2662 = float(uint(_2660));
    float _2664 = as_type<float>(_2641) * _2662;
    float _2666 = _2627 * _1182;
    bool _2668 = _2635 >= _1556;
    bool _2670 = isnan(_2635);
    bool _2672 = _2668 || _2670;
    bool _2674 = isnan(_1556);
    bool _2676 = _2672 || _2674;
    float _2678 = float(_2676);
    float _2680 = floor(_2666);
    float _2682 = trunc(_2664);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    float _2688 = trunc(_2678);
    int _2690 = int(_2688);
    float _2692 = -_2680;
    float _2694 = _2666 + _2692;
    int _2696 = int(_2652) + int(_2686);
    int _2698 = _2611 * _2696;
    int _2700 = _2698 + _2601;
    bool _2702 = uint(_2700) >= uint(_1508);
    bool _2704 = !_2702;
    int _2706 = _2704 ? 0 : (-1);
    bool _2708 = _1508 == 0;
    int _2710 = ~_2696;
    int _2712 = _2710 + _2706;
    int _2714 = _2712 + 1;
    float _2716 = _2694 * _1556;
    int _2718 = _1508 * _2714;
    int _2720 = _2718 + _2601;
    float _2722 = trunc(_2716);
    int _2724 = int(_2722);
    int _2726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2728 = _2726 != 0;
    int _2730 = ~_2690;
    int _2732 = _2730 + 1;
    int _2734 = _2732 + 1;
    bool _2736 = !_2708;
    int _2738 = _2736 ? _2720 : (-1);
    int _2740 = _1508 + (-1);
    bool _2742 = !_2728;
    int _2744 = _2742 ? 0 : 1;
    int _2746 = _2738 * _2734;
    int _2748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2750 = _2748 != 0;
    int _2752 = abs(_1414);
    int _2754 = _2690 * _2740;
    int _2756 = _2754 + _2746;
    int _2758 = abs(_2744);
    bool _2760 = !_2750;
    int _2762 = _2760 ? 0 : 1;
    int _2764 = abs(_1426);
    int _2766 = _2756 * _2752;
    int _2768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2770 = _2768 != 0;
    int _2772 = _2724 * _2758;
    int _2774 = _2772 + _2601;
    int _2776 = abs(_2762);
    int _2778 = _2633 * _2613;
    int _2780 = _2778 + _2766;
    float _2782 = in.m_53.w;
    int _2784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2786 = _2784 != 0;
    int _2788 = _2774 * _2764;
    int _2790 = _2788 + _2780;
    int _2792 = ~_1508;
    int _2794 = _2792 + 1;
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2798 = _2796 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2802 = _2800 != 0;
    int _2804 = _2724 * _2776;
    int _2806 = _2804 + _2790;
    int _2808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2810 = _2808 != 0;
    int _2812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2814 = _2812 != 0;
    float _2816 = 1.0 / _2798;
    float _2818 = float(uint(_2806));
    float _2820 = as_type<float>(_2641) * _2818;
    float _2822 = in.m_63.y;
    float _2824 = trunc(_2820);
    float _2826 = precise::max(_2824, 0.0);
    uint _2828 = uint(_2826);
    bool _2830 = _2782 > 0.5;
    float _2832 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2834 = _2832 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2836 = in.m_63.x;
    float _2838 = 1.0 / _2834;
    int _2840 = _2794 * int(_2828);
    int _2842 = _2840 + _2806;
    float _2844 = -_2822;
    float _2846 = _2844 + 1.0;
    float _2848 = float(uint(_2842));
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2852 = _1172 + _2850;
    int _2854 = _2830 ? as_type<int>(_2846) : as_type<int>(_2822);
    float _2856 = as_type<float>(_2641) * _2848;
    bool _2858 = _1188 > 0.5;
    float _2860 = _2810 ? as_type<float>(_2854) : _2822;
    float _2862 = trunc(_2856);
    float _2864 = precise::max(_2862, 0.0);
    uint _2866 = uint(_2864);
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2870 = _2868 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2872 = _2822;
    bool _2874 = _2770;
    bool _2876 = _2810;
    if (_2770)
    {
        float _2878 = _2858 ? _2846 : _2822;
        _2872 = _2878;
    }
    float _2880 = _2872;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2882;
    int _2886 = ~_1508;
    int _2888 = _2886 + 1;
    float _2890 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2892 = _2890 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_2786)
    {
        bool _2894 = _1216 > 0.5;
        _2874 = _2894;
    }
    bool _2896 = _2874;
    float _2898 = _2884 * _2816;
    float _2900 = 1.0 / _2870;
    float _2902 = _2836;
    if (_2786)
    {
        float _2904 = -_2836;
        float _2906 = _2904 + 1.0;
        _1920 = as_type<int>(_2906);
    }
    int _2908 = _1920;
    if (_2802)
    {
        bool _2910 = _1182 > 0.5;
        _2876 = _2910;
    }
    bool _2912 = _2876;
    float _2914 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2916 = _1172 + _2914;
    float _2918 = fma(_2898, _2852, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2920 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2922 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2920;
    float _2924 = float(uint(_2774));
    int _2926 = int(_2828) + int(_2866);
    float _2928 = _2922 * _2838;
    float _2930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2932 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2934 = isnan(_1172);
    bool _2936 = _2932 || _2934;
    bool _2938 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2940 = _2936 || _2938;
    float _2942 = float(_2940);
    int _2944 = _2888 * _2926;
    int _2946 = _2944 + _2806;
    int _2948 = ~_1508;
    int _2950 = _2948 + 1;
    float _2952 = _2892 * _2900;
    bool _2954 = uint(_2946) >= uint(_1508);
    float _2956 = fma(_2952, _2916, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2958 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2960 = _1172 + _2958;
    bool _2962 = !_2954;
    float _2964 = _2962 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2966 = fma(_2928, _2960, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2968 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2970 = isnan(_1172);
    bool _2972 = _2968 || _2970;
    bool _2974 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2976 = _2972 || _2974;
    float _2978 = float(_2976);
    float _2980 = _2930 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2982 = ~_2926;
    int _2984 = _2982 + as_type<int>(_2964);
    int _2986 = _2984 + 1;
    float _2988 = as_type<float>(_2641) * _2924;
    bool _2990 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2992 = isnan(_1172);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2998 = _2994 || _2996;
    float _3000 = float(_2998);
    float _3002 = -_2978;
    float _3004 = _3002 + 1.0;
    float _3006 = _2964;
    if (!_2802)
    {
        _3006 = _2836;
    }
    float _3008 = _3006;
    int _3010 = _1508 * _2986;
    int _3012 = _3010 + _2806;
    bool _3014 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3016 = isnan(_1172);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3022 = _3018 || _3020;
    float _3024 = float(_3022);
    float _3026 = trunc(_2988);
    float _3028 = precise::max(_3026, 0.0);
    uint _3030 = uint(_3028);
    float _3032 = _3000 * _3004;
    float _3034 = -_3000;
    float _3036 = _3034 + 1.0;
    bool _3038 = !_2708;
    int _3040 = _3038 ? _3012 : (-1);
    float _3042 = _3024 * _3036;
    float _3044 = -_3024;
    float _3046 = _3044 + 1.0;
    float _3048 = fma(_2860, _2980, -0.5);
    int _3050 = _3040 >> 31;
    float _3052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3054 = _2942 * _3046;
    float _3056 = -_2942;
    float _3058 = _3056 + 1.0;
    float _3060 = _2918 * _3054;
    int _3062 = _3050 & 3;
    int _3064 = _2950 * int(_3030);
    int _3066 = _3064 + _2774;
    int _3068 = _3040 + _3062;
    float _3070 = float(uint(_3066));
    float _3072 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2880, -0.5);
    int _3074 = _3068 >> 2;
    float _3076 = fma(_3058, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3060);
    float _3078 = _2615 * 6.283185482025146484375;
    float _3080 = sin(_3078);
    float _3082 = as_type<float>(_2641) * _3070;
    int _3084 = _3074 << 4;
    int _3086 = _3084 + 368;
    int _3088 = as_type<int>(_3070);
    float _3090 = _3008;
    if (_2802)
    {
        float _3092 = -_2836;
        float _3094 = _3092 + 1.0;
        _3088 = as_type<int>(_3094);
    }
    int _3096 = _3088;
    float _3098 = fma(_2956, _3042, _3076);
    float _3100 = -_1302;
    float _3102 = fma(_1558, _3072, _3100);
    uint _3104 = uint(int(uint(_3086) >> uint(2)));
    uint _3106 = uint(int(uint(int(_3104)) >> uint(2)));
    int _3108 = int(_3104) & 3;
    float _3110 = (*spvDescriptorSet0.vp_c9)._m0[int(_3106)][_3108];
    int _3112 = int(_3104) + 1;
    uint _3114 = uint(int(uint(_3112) >> uint(2)));
    int _3116 = _3112 & 3;
    float _3118 = (*spvDescriptorSet0.vp_c9)._m0[int(_3114)][_3116];
    if (_2802)
    {
        float _3120 = _2912 ? as_type<float>(_3096) : _2836;
        _3090 = _3120;
    }
    float _3122 = _3090;
    float _3124 = _3052 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2786)
    {
        float _3126 = _2896 ? as_type<float>(_2908) : _2836;
        _2902 = _3126;
    }
    float _3128 = _2902;
    float _3130 = _2615 * 6.283185482025146484375;
    float _3132 = cos(_3130);
    float _3134 = fma(_2966, _3032, _3098);
    float _3136 = fma(_3122, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _3138 = _3040 & 3;
    bool _3140 = _3138 != 0;
    int _3142 = _3086 + 8;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    uint _3146 = uint(int(uint(int(_3144)) >> uint(2)));
    int _3148 = int(_3144) & 3;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[int(_3146)][_3148];
    int _3152 = int(_3144) + 1;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    int _3156 = _3152 & 3;
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[int(_3154)][_3156];
    int _3160 = _3040 & 3;
    bool _3162 = _3160 != 0;
    float _3164 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3134);
    bool _3166 = uint(_3138) > 1u;
    float _3168 = trunc(_3082);
    float _3170 = precise::max(_3168, 0.0);
    uint _3172 = uint(_3170);
    int _3174 = _3162 ? 0 : 1;
    float _3176 = _3080 * _3048;
    bool _3178 = _3138 != 3;
    float _3180 = fma(_3124, _3128, -0.5);
    bool _3182 = uint(_3138) >= 2u;
    float _3184 = fma(_1550, _3136, _1298);
    int _3186 = ~_3174;
    int _3188 = _3186 + 1;
    int _3190 = _3188 + 1;
    float _3192 = _3132 * _3048;
    float _3194 = -_3176;
    float _3196 = fma(_3132, _3180, _3194);
    float _3198 = _3102 + 0.5;
    float _3200 = _3184 + 0.5;
    int _3202 = _3190;
    if (!_3166)
    {
        int _3204 = ~_3174;
        int _3206 = _3204 + 1;
        _3202 = _3206;
    }
    int _3208 = _3202;
    float _3210 = fma(_3080, _3180, _3192);
    bool _3212 = !_3140;
    int _3214 = _3212 ? 0 : 1;
    float _3216 = fma(_1562, _3196, _1378);
    int _3218 = _3182 ? 0 : 1;
    float _3220 = -_1408;
    float _3222 = fma(_1490, _3210, _3220);
    bool _3224 = _3138 != 3;
    float _3226 = _3216 + 0.5;
    int _3228 = int(_3030) + int(_3172);
    float _3230 = _3222 + 0.5;
    int _3232 = abs(_3208);
    int _3234 = ~_1508;
    int _3236 = _3234 + 1;
    int _3238 = ~_3218;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    out.m_65.x = _3200;
    out.m_65.y = _3198;
    out.m_65.z = _3226;
    out.m_65.w = _3230;
    bool _3244 = !_3224;
    int _3246 = _3244 ? 0 : (-1);
    int _3248 = _3236 * _3228;
    int _3250 = _3248 + _2774;
    int _3252 = abs(_3214);
    int _3254 = _3242;
    if (_3178)
    {
        int _3256 = ~_3218;
        int _3258 = _3256 + 1;
        _3254 = _3258;
    }
    int _3260 = _3254;
    int _3262 = ~_3232;
    int _3264 = _3262 + 1;
    int _3266 = _3264 + 1;
    bool _3268 = !_2814;
    int _3270 = _3268 ? 0 : 1;
    int _3272 = abs(_3246);
    int _3274 = _3266 * as_type<int>(_3118);
    int _3276 = abs(_3260);
    int _3278 = ~_3252;
    int _3280 = _3278 + 1;
    int _3282 = _3280 + 1;
    int _3284 = abs(_3270);
    bool _3286 = uint(_3250) >= uint(_1508);
    int _3288 = _3282 * as_type<int>(_3110);
    int _3290 = _3288 + _3274;
    int _3292 = ~_3276;
    int _3294 = _3292 + 1;
    int _3296 = _3294 + 1;
    bool _3298 = !_3286;
    int _3300 = _3298 ? 0 : (-1);
    int _3302 = _3296 * as_type<int>(_3150);
    int _3304 = _3302 + _3290;
    int _3306 = ~_3272;
    int _3308 = _3306 + 1;
    int _3310 = _3308 + 1;
    float _3312 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3314 = ~_3228;
    int _3316 = _3314 + _3300;
    int _3318 = _3316 + 1;
    float _3320 = _2544 + _2506;
    int _3322 = ~_3284;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    int _3328 = _3310 * as_type<int>(_3158);
    int _3330 = _3328 + _3304;
    float _3332 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3334 = _3312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3336 = _3164 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3338 = _3330 * _3326;
    float _3340 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3342 = _3332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3344 = _1508 * _3318;
    int _3346 = _3344 + _2774;
    float _3348 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3350 = _3340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3352 = _2506 * 0.5;
    float _3354 = _3320 * 0.5;
    bool _3356 = !_2708;
    int _3358 = _3356 ? _3346 : (-1);
    out.m_67.x = _3350;
    out.m_67.y = _3342;
    out.m_67.z = _3334;
    out.m_67.w = _3336;
    bool _3360 = _2270 > 0.0;
    bool _3362 = isnan(_2270);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan(0.0);
    bool _3368 = _3364 || _3366;
    float _3370 = fma(_2550, -0.5, _3352);
    int _3372 = _3358 * _3284;
    int _3374 = _3372 + _3338;
    float _3376 = _2639 + _2506;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _3378 = float(_3374);
    float _3380 = _3376 * 0.5;
    float _3382 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3384 = _3348 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3378;
    float _3386 = _3382 * _2574;
    float _3388 = -_3382;
    float _3390 = _3388 + 1.0;
    out.m_73.x = _3354;
    out.m_73.y = _3370;
    out.m_73.z = _3380;
    out.m_73.w = _2506;
    float _3392 = _2585 * _3386;
    float _3394 = _2595 * _3386;
    float _3396 = _2585 * _3390;
    out.m_49.x = _3384;
    float _3398 = fma(_2591, _3392, _2579);
    float _3400 = fma(_2593, _3392, _2581);
    float _3402 = fma(_2585, _3394, _2583);
    out.m_75.x = _3398;
    out.m_75.y = _3400;
    out.m_75.z = _3402;
    out.m_75.w = _3396;
    if (_3368)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3404 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3404;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1170 = false;
    bool _900 = false;
    bool _802 = false;
    bool _466 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3473 = as_type<float>(_118);
        out.gl_Position.z = _3473;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_91);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = float(_96);
    bool _134 = _100 >= _132;
    bool _136 = !_130;
    bool _138 = _134 || _136;
    if (_138)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _108;
    if (_138)
    {
        out.m_49.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _120 = as_type<int>(_142);
    }
    int _144 = _120;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3528 = as_type<float>(_144);
        out.gl_Position.z = _3528;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _132;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _194;
    if (!_176)
    {
        float _178 = in.m_53.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        _194 = _156;
    }
    _196 = false;
    float _198 = _194;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _220 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _224 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _226 = isnan(_198);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = 1.0 / _214;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = _198 + _238;
    float _242 = 1.0 / _222;
    bool _244 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _246 = isnan(_198);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _258 = 1.0 / _218;
    float _260 = 1.0 / _210;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _264 = _198 + _262;
    float _266 = _202 * _242;
    bool _268 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _270 = isnan(_198);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _280;
    float _284 = _264 * _236;
    bool _286 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _288 = isnan(_198);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -_254;
    float _300 = _298 + 1.0;
    float _302 = _206 * _258;
    float _304 = -_296;
    float _306 = _304 + 1.0;
    float _308 = fma(_282, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = _278 * _306;
    bool _312 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _314 = isnan(_198);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _328 = -_278;
    float _330 = _328 + 1.0;
    float _332 = _234 * _300;
    float _334 = _240 * _260;
    float _336 = -_234;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _344;
    float _348 = _254 * _330;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = _322 * _338;
    float _360 = fma(_342, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = fma(_346, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _364 = fma(_326, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_352, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _368 = fma(_356, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = _308 * _358;
    float _372 = -_322;
    float _374 = _372 + 1.0;
    float _376 = _360 * _358;
    float _378 = _362 * _358;
    float _380 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _382 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _376);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _378);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _390;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _394;
    float _398 = fma(_364, _332, _380);
    float _400 = fma(_366, _332, _382);
    float _402 = fma(_386, _334, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _404 = fma(_368, _332, _388);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _414 = fma(_392, _334, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _416 = fma(_396, _334, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _422 = fma(_402, _348, _398);
    float _424 = fma(_408, _284, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _426 = fma(_412, _284, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _428 = fma(_420, _284, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _430 = fma(_414, _348, _400);
    float _432 = fma(_416, _348, _404);
    float _434 = fma(_424, _310, _422);
    float _436 = fma(_426, _310, _430);
    float _438 = fma(_428, _310, _432);
    float _440 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[147].x, _434);
    float _442 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[147].y, _436);
    float _444 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[147].z, _438);
    bool _446 = !_256;
    float _464;
    if (!_446)
    {
        float _448 = in.m_53.x;
        float _450 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _452 = _448 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _454 = fma(_452, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _456 = _454 * _450;
        float _458 = floor(_456);
        float _460 = -_458;
        float _462 = _456 + _460;
        _464 = _462;
        _466 = true;
    }
    else
    {
        _464 = _156;
    }
    _466 = false;
    float _468 = _464;
    float _470 = in.m_55.x;
    float _472 = in.m_55.y;
    float _474 = in.m_55.z;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _484;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _490 = _488 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _492 = 1.0 / _478;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _494;
    float _498 = 1.0 / _482;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _502 = _468 + _500;
    bool _504 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _506 = isnan(_468);
    bool _508 = _504 || _506;
    bool _510 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _512 = _508 || _510;
    float _514 = float(_512);
    float _516 = _442 * _472;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _520 = _468 + _518;
    float _522 = 1.0 / _486;
    float _524 = _502 * _492;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _528 = _468 + _526;
    float _530 = _444 * _474;
    bool _532 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _534 = isnan(_468);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _546 = _468 + _544;
    float _548 = _440 * _470;
    float _550 = _520 * _498;
    bool _552 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _554 = isnan(_468);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = 1.0 / _490;
    bool _566 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _568 = isnan(_468);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _580 = _468 + _578;
    bool _582 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _584 = _528 * _522;
    float _586 = -_576;
    float _588 = _586 + 1.0;
    float _590 = 1.0 / _496;
    float _592 = -_562;
    float _594 = _592 + 1.0;
    bool _596 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _598 = isnan(_468);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _576 * _594;
    float _610 = _542 * _588;
    bool _612 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _614 = isnan(_468);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -_606;
    float _626 = _624 + 1.0;
    float _628 = -_542;
    float _630 = _628 + 1.0;
    float _632 = _580 * _564;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _634;
    float _638 = _622 * _626;
    float _640 = -_622;
    float _642 = _640 + 1.0;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _644;
    float _648 = _606 * _630;
    float _650 = _546 * _590;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _660 = fma(_636, _524, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _670 = _514 * _642;
    float _672 = fma(_654, _524, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _674 = fma(_646, _524, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _676 = fma(_658, _550, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _678 = fma(_664, _550, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _680 = fma(_668, _550, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _682 = _660 * _670;
    float _684 = -_514;
    float _686 = _684 + 1.0;
    float _688 = _672 * _670;
    float _690 = _674 * _670;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _700;
    float _704 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[107].x, _682);
    float _706 = fma(_694, _584, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _708 = fma(_698, _584, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _710 = fma(_702, _584, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _714 = _712 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _716 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[107].y, _688);
    float _718 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[107].z, _690);
    float _720 = fma(_676, _638, _704);
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _726 = fma(_714, _632, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _728 = fma(_678, _638, _716);
    float _730 = fma(_680, _638, _718);
    float _732 = fma(_706, _648, _720);
    float _734 = fma(_724, _632, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _740 = fma(_708, _648, _728);
    float _742 = fma(_710, _648, _730);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _750 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _748;
    float _752 = fma(_738, _632, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _754;
    float _758 = fma(_726, _610, _732);
    float _760 = fma(_746, _650, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _762 = fma(_750, _650, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _764 = fma(_756, _650, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _766 = fma(_734, _610, _740);
    float _768 = fma(_752, _610, _742);
    float _770 = fma(_760, _608, _758);
    float _772 = fma(_762, _608, _766);
    float _774 = fma(_764, _608, _768);
    float _776 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[112].x, _770);
    float _778 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[112].y, _772);
    float _780 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[112].z, _774);
    bool _782 = !_582;
    float _800;
    if (!_782)
    {
        float _784 = in.m_53.x;
        float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _788 = _784 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _790 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _792 = _790 * _786;
        float _794 = floor(_792);
        float _796 = -_794;
        float _798 = _792 + _796;
        _800 = _798;
        _802 = true;
    }
    else
    {
        _800 = _156;
    }
    _802 = false;
    float _804 = _800;
    bool _806 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _808 = isnan(_804);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _822 = _804 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _824 = isnan(_804);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _840 = _804 + _838;
    float _842 = -_816;
    float _844 = _842 + 1.0;
    bool _846 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _848 = 1.0 / _820;
    float _850 = _832 * _844;
    float _852 = -_832;
    float _854 = _852 + 1.0;
    float _856 = _836 * _848;
    float _858 = _778 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _860 = fma(_856, _840, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _862 = _776 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _864 = _860 * _850;
    float _866 = _780 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _868 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[115].x, _864);
    float _870 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _872 = _858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[116].x, _868);
    float _878 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _880 = !_846;
    float _898;
    if (!_880)
    {
        float _882 = in.m_53.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        _898 = _156;
    }
    _900 = false;
    float _902 = _898;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _906 = _902 + _904;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _910 = _902 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _914 = _902 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _922 = _920 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _926 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _924;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _930 = _928 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _932 = 1.0 / _918;
    bool _934 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _936 = isnan(_902);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = 1.0 / _922;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _950 = _902 + _948;
    float _952 = 1.0 / _926;
    float _954 = _906 * _932;
    bool _956 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _958 = isnan(_902);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _970 = 1.0 / _930;
    float _972 = _910 * _946;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _974;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _978;
    float _982 = fma(_976, _954, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _984 = fma(_980, _954, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _986 = _914 * _952;
    float _988 = -_944;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _992;
    float _996 = fma(_994, _954, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _998 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1000 = isnan(_902);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _950 * _970;
    bool _1012 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1014 = isnan(_902);
    bool _1016 = _1012 || _1014;
    bool _1018 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1020 = _1016 || _1018;
    float _1022 = float(_1020);
    float _1024 = _966 * _990;
    float _1026 = -_966;
    float _1028 = _1026 + 1.0;
    bool _1030 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1032 = isnan(_902);
    bool _1034 = _1030 || _1032;
    bool _1036 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1038 = _1034 || _1036;
    float _1040 = float(_1038);
    float _1042 = -_1022;
    float _1044 = _1042 + 1.0;
    float _1046 = _1022 * _1028;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1056 = _1008 * _1044;
    float _1058 = -_1008;
    float _1060 = _1058 + 1.0;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1064 = _1062 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1066 = fma(_1050, _972, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1068 = fma(_1054, _972, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1070 = _1040 * _1060;
    float _1072 = fma(_1064, _972, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1074 = _984 * _1070;
    float _1076 = _982 * _1070;
    float _1078 = -_1040;
    float _1080 = _1078 + 1.0;
    float _1082 = _996 * _1070;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1092;
    float _1096 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1076);
    float _1098 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1074);
    float _1100 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1082);
    float _1102 = fma(_1086, _986, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1104 = fma(_1090, _986, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1106 = fma(_1094, _986, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1108 = fma(_1066, _1056, _1096);
    float _1110 = fma(_1072, _1056, _1098);
    float _1112 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1114 = _1112 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1120 = fma(_1068, _1056, _1100);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1124 = _1122 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1126 = fma(_1102, _1046, _1108);
    float _1128 = fma(_1114, _1010, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1130 = fma(_1118, _1010, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1132 = fma(_1104, _1046, _1110);
    float _1134 = fma(_1124, _1010, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1136 = fma(_1106, _1046, _1120);
    float _1138 = fma(_1128, _1024, _1126);
    float _1140 = fma(_1130, _1024, _1132);
    float _1142 = fma(_1134, _1024, _1136);
    float _1144 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1138);
    float _1146 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1140);
    float _1148 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1142);
    bool _1150 = !_968;
    float _1168;
    if (!_1150)
    {
        float _1152 = in.m_53.x;
        float _1154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1156 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1160 = _1158 * _1154;
        float _1162 = floor(_1160);
        float _1164 = -_1162;
        float _1166 = _1160 + _1164;
        _1168 = _1166;
        _1170 = true;
    }
    else
    {
        _1168 = _156;
    }
    _1170 = false;
    float _1172 = _1168;
    float _1174 = in.m_42.x;
    float _1176 = in.m_42.y;
    float _1178 = in.m_42.z;
    float _1180 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1182 = in.m_53.x;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = in.m_53.y;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1194 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1196 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1194);
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1202 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1204 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1206 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1196);
    float _1208 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1210 = _1182 * 2.0;
    float _1212 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1204);
    float _1214 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1200);
    float _1216 = in.m_53.z;
    float _1218 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1220 = -_1190;
    float _1222 = fma(_1208, 2.0, _1220);
    float _1224 = _1188 * 2.0;
    float _1226 = floor(_1210);
    float _1228 = fma(_1218, -2.0, _1192);
    float _1230 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1202);
    float _1232 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1212);
    float _1234 = _1182 + _1188;
    float _1236 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1238 = floor(_1224);
    float _1240 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1230);
    float _1242 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1244 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1236);
    float _1246 = _1234 + (-1.0);
    float _1248 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1250 = _1226 > 0.0;
    float _1252 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1244);
    bool _1254 = _1226 >= 0.0;
    bool _1256 = isnan(_1226);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan(0.0);
    bool _1262 = _1258 || _1260;
    float _1264 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1214);
    float _1266 = _1244;
    float _1268 = _1214;
    float _1270 = _1178;
    float _1272 = _1230;
    if (!_1186)
    {
        _1266 = _1188;
    }
    float _1274 = _1266;
    float _1276 = _1216 * 2.0;
    float _1278 = _1274;
    if (!_1186)
    {
        _1268 = _1182;
    }
    float _1280 = _1268;
    float _1282 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1284 = _1280;
    if (!_1186)
    {
        _1270 = _1216;
    }
    float _1286 = _1270;
    float _1288 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1290 = int(_1288);
    float _1292 = _1286;
    if (_1186)
    {
        _1278 = _1182;
    }
    float _1294 = _1278;
    float _1296 = -_100;
    float _1298 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1222);
    if (_1186)
    {
        _1284 = _1216;
    }
    float _1300 = _1284;
    float _1302 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1228);
    bool _1304 = _1238 > 0.0;
    float _1306 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1308 = _1238;
    if (!_1186)
    {
        _1272 = _1286;
    }
    float _1310 = _1272;
    float _1312 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1242);
    float _1314 = -_1198;
    float _1316 = fma(_1306, 2.0, _1314);
    float _1318 = _1310;
    if (_1186)
    {
        _1318 = _1188;
    }
    float _1320 = _1318;
    float _1322 = floor(_1276);
    bool _1324 = _1238 >= 0.0;
    bool _1326 = isnan(_1238);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan(0.0);
    bool _1332 = _1328 || _1330;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1186)
    {
        _1308 = _1188;
    }
    float _1336 = _1308;
    float _1338 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1340 = _1262 ? 0 : 1;
    float _1342 = _1182 + _1216;
    float _1344 = fma(_1338, -2.0, _1334);
    float _1346 = _1336;
    if (_1186)
    {
        _1346 = _1182;
    }
    float _1348 = _1346;
    float _1350 = _1342 + (-1.0);
    int _1352 = _1332 ? 0 : 1;
    float _1354 = rsqrt(_1206);
    int _1356 = ~_1340;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1248);
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1374 = _1372 != 0;
    float _1376 = -_100;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1316);
    int _1380 = _1360;
    if (!_1250)
    {
        int _1382 = ~_1340;
        int _1384 = _1382 + 1;
        _1380 = _1384;
    }
    int _1386 = _1380;
    float _1388 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1312);
    int _1390 = ~_1352;
    int _1392 = _1390 + 1;
    int _1394 = _1392 + 1;
    float _1396 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1398 = log2(_1396);
    int _1400 = _1394;
    if (!_1304)
    {
        int _1402 = ~_1352;
        int _1404 = _1402 + 1;
        _1400 = _1404;
    }
    int _1406 = _1400;
    float _1408 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1344);
    float _1410 = _1240 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1412 = !_1370;
    int _1414 = _1412 ? 0 : 1;
    float _1416 = _1232 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1418 = !_1366;
    int _1420 = _1418 ? 0 : 1;
    float _1422 = fma(_1350, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1424 = !_1374;
    int _1426 = _1424 ? 0 : 1;
    float _1428 = _1188 + _1216;
    int _1430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1432 = _1430 != 0;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1440 = _1438 != 0;
    float _1442 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1428 + (-1.0);
    bool _1446 = !_1440;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1452 = !_1436;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1458 = abs(_1448);
    float _1460 = float(_1290);
    bool _1462 = _1322 > 0.0;
    bool _1464 = _1322 >= 0.0;
    bool _1466 = isnan(_1322);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan(0.0);
    bool _1472 = _1468 || _1470;
    float _1474 = _1398 * _100;
    float _1476 = 1.0 / _1460;
    if (_1186)
    {
        _1292 = _1188;
    }
    float _1478 = _1292;
    int _1480 = abs(_1454);
    float _1482 = float(_1406);
    float _1484 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1456);
    float _1486 = float(_1458);
    float _1488 = exp2(_1474);
    float _1490 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1484);
    float _1492 = float(_1386);
    float _1494 = _1486 * _1482;
    float _1496 = in.m_57.x;
    float _1498 = in.m_57.y;
    float _1500 = in.m_57.z;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1504 = 1.0 + _1502;
    float _1506 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1508 = int(_1506);
    float _1510 = _1476 * _100;
    float _1512 = float(_1480);
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1516 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1518 = isnan(1.0);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1524 = _1520 || _1522;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1528 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1530 = isnan(0.0);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1536 = _1532 || _1534;
    float _1538 = 1.0 / _1504;
    float _1540 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1514);
    float _1542 = -_1488;
    float _1544 = _1542 + 1.0;
    float _1546 = _1512 * _1492;
    float _1548 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1526);
    float _1550 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1540);
    int _1552 = _1472 ? 0 : 1;
    float _1554 = _1546 * (-2.0);
    float _1556 = float(_1508);
    float _1558 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1548);
    float _1560 = _1536 ? _1544 : 0.0;
    float _1562 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1362);
    float _1564 = fma(_1450, _1554, _1450);
    float _1566 = _1556 * _100;
    float _1568 = fma(_1554, _1498, _1498);
    float _1570 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1524)
    {
        float _1572 = _1560 * _1538;
        _110 = _1572;
    }
    float _1574 = _110;
    float _1576 = _1188 + (-0.5);
    int _1578 = ~_1552;
    int _1580 = _1578 + 1;
    int _1582 = _1580 + 1;
    int _1584 = _1582;
    if (!_1462)
    {
        int _1586 = ~_1552;
        int _1588 = _1586 + 1;
        _1584 = _1588;
    }
    int _1590 = _1584;
    float _1592 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1568);
    float _1594 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1596 = _1570 * _1570;
    float _1598 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1600 = fma(_1594, _1594, _1596);
    bool _1602 = !_1432;
    int _1604 = _1602 ? 0 : 1;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1606;
    float _1610 = _1494 * (-2.0);
    float _1612 = fma(_1598, _1598, _1600);
    int _1614 = abs(_1604);
    float _1616 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1618 = fma(_1422, _1610, _1422);
    float _1620 = fma(_1610, _1500, _1500);
    float _1622 = fma(_1564, _1574, _1592);
    float _1624 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1626 = _1216 + (-0.5);
    float _1628 = _1622 * 0.15915493667125701904296875;
    float _1630 = float(_1590);
    float _1632 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1616);
    float _1634 = float(_1614);
    float _1636 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1620);
    float _1638 = rsqrt(_1612);
    float _1640 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1642 = _1634 * _1630;
    float _1644 = _1642 * (-2.0);
    float _1646 = _1640 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1648 = fma(_1618, _1574, _1636);
    float _1650 = _1182 + (-0.5);
    float _1652 = in.m_59.x;
    float _1654 = in.m_59.y;
    float _1656 = in.m_59.z;
    float _1658 = -_1646;
    float _1660 = _1442 + _1658;
    float _1662 = fma(_1644, _1496, _1496);
    float _1664 = 1.0 / _1608;
    float _1666 = fma(_1282, _1644, _1282);
    bool _1668 = _1646 >= _1442;
    bool _1670 = isnan(_1646);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan(_1442);
    bool _1676 = _1672 || _1674;
    float _1678 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1662);
    float _1680 = abs(_1660);
    float _1682 = precise::max(_1680, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1684 = _1648 * 0.15915493667125701904296875;
    float _1686 = _1594 * _1638;
    float _1688 = fma(_1666, _1574, _1678);
    float _1690 = precise::min(_1682, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1692 = _1684 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    bool _1696 = !_1676;
    float _1698 = _1696 ? 1.0 : (-1.0);
    float _1700 = _1688 * 0.15915493667125701904296875;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1704 = _1690 + _1702;
    float _1706 = _1570 * _1638;
    float _1708 = _1598 * _1638;
    float _1710 = _1704 * _1664;
    float _1712 = _1684 * 6.283185482025146484375;
    float _1714 = cos(_1712);
    float _1716 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1652);
    float _1718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1656);
    float _1720 = _1698 * _1710;
    float _1722 = _1628 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1728 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1730 = _1728 * _1720;
    float _1732 = _1628 * 6.283185482025146484375;
    float _1734 = cos(_1732);
    float _1736 = _1700 * 6.283185482025146484375;
    float _1738 = sin(_1736);
    float _1740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1654);
    float _1742 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1744 = _1726 * _1718;
    float _1746 = _1180 * _1740;
    float _1748 = _1742 * _1716;
    float _1750 = _1730 * 0.15915493667125701904296875;
    float _1752 = _1700 * 6.283185482025146484375;
    float _1754 = cos(_1752);
    float _1756 = _1714 * _1746;
    float _1758 = _1734 * _1714;
    float _1760 = _1724 * _1714;
    float _1762 = _1738 * _1724;
    float _1764 = -_1746;
    float _1766 = _1694 * _1764;
    float _1768 = _1750 * 6.283185482025146484375;
    float _1770 = cos(_1768);
    float _1772 = fma(_1758, _1748, _1766);
    float _1774 = _1754 * _1734;
    float _1776 = _1754 * _1724;
    float _1778 = _1754 * _1756;
    float _1780 = _1738 * _1734;
    float _1782 = fma(_1694, _1774, _1762);
    float _1784 = _1738 * _1756;
    float _1786 = fma(_1760, _1744, _1772);
    float _1788 = -_1780;
    float _1790 = fma(_1694, _1776, _1788);
    float _1792 = fma(_1782, _1748, _1778);
    float _1794 = -_1776;
    float _1796 = fma(_1694, _1780, _1794);
    float _1798 = _1750 * 6.283185482025146484375;
    float _1800 = sin(_1798);
    float _1802 = fma(_1694, _1762, _1774);
    float _1804 = fma(_1790, _1744, _1792);
    float _1806 = fma(_1796, _1748, _1784);
    float _1808 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1810 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1812 = _1804 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1814 = fma(_1802, _1744, _1806);
    float _1816 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1808);
    float _1818 = -_1770;
    float _1820 = _1818 + 1.0;
    float _1822 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1810);
    float _1824 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1812);
    float _1826 = _1708 * _1708;
    float _1828 = _1706 * _1820;
    float _1830 = _1686 * _1800;
    float _1832 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1816);
    float _1834 = _1706 * _1800;
    float _1836 = fma(_1820, _1826, _1770);
    float _1838 = _1708 * _1800;
    float _1840 = _1686 * _1820;
    float _1842 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1822);
    float _1844 = fma(_1708, _1828, _1830);
    float _1846 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1848 = -_1838;
    float _1850 = fma(_1706, _1840, _1848);
    float _1852 = -_1834;
    float _1854 = fma(_1708, _1840, _1852);
    float _1856 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1858 = _1846 * _1844;
    float _1860 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1824);
    float _1862 = fma(_1686, _1840, _1770);
    float _1864 = _1846 * _1850;
    float _1866 = fma(_1856, _1854, _1858);
    float _1868 = _1860 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1870 = fma(_1706, _1840, _1838);
    float _1872 = fma(_1856, _1862, _1864);
    float _1874 = fma(_1708, _1840, _1834);
    float _1876 = fma(_1868, _1836, _1866);
    float _1878 = fma(_1706, _1828, _1770);
    float _1880 = -_1830;
    float _1882 = fma(_1708, _1828, _1880);
    float _1884 = fma(_1868, _1874, _1872);
    float _1886 = _1416 + _1876;
    float _1888 = _1846 * _1878;
    float _1890 = _1624 + _1884;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1894 = _1886 + _1892;
    float _1896 = fma(_1856, _1870, _1888);
    float _1898 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1900 = _1890 + _1898;
    float _1902 = _1894 * _1894;
    float _1904 = fma(_1868, _1882, _1896);
    float _1906 = fma(_1900, _1900, _1902);
    float _1908 = _1410 + _1904;
    float _1910 = sqrt(_1906);
    bool _1912 = _1910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1914 = _1904;
    float _1916 = _1706;
    float _1918 = _1896;
    int _1920 = as_type<int>(_1740);
    if (!_1912)
    {
        _1914 = _1890;
    }
    float _1922 = _1914;
    float _1924 = _1922;
    if (!_1912)
    {
        _1916 = _1886;
    }
    float _1926 = _1916;
    float _1928 = _1926;
    if (!_1912)
    {
        _1918 = _1908;
    }
    float _1930 = _1918;
    bool _1932 = !_1912;
    float _1934 = _1930;
    if (!_1932)
    {
        float _1936 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1938 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1940 = _1910 + _1938;
        float _1942 = rsqrt(_1906);
        float _1944 = _1940 * _1936;
        float _1946 = _1908 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1948 = _1944 * 0.15915493667125701904296875;
        float _1950 = _1948 * 6.283185482025146484375;
        float _1952 = sin(_1950);
        float _1954 = _1948 * 6.283185482025146484375;
        float _1956 = cos(_1954);
        float _1958 = fma(_1952, _1946, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1960 = _1942 * _1958;
        float _1962 = _1956 + (-1.0);
        float _1964 = fma(_1900, _1960, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1966 = fma(_1894, _1960, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1968 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = fma(_1908, _1956, _1968);
        _1934 = _1970;
        _1924 = _1964;
        _1928 = _1966;
    }
    float _1972 = _1934;
    float _1974 = _1924;
    float _1976 = _1928;
    float _1978 = -_1410;
    float _1980 = _1978 + _1972;
    float _1982 = -_1624;
    float _1984 = _1982 + _1974;
    float _1986 = -_1416;
    float _1988 = _1986 + _1976;
    float _1990 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1992 = _1980 * _1980;
    float _1994 = fma(_1984, _1984, _1992);
    float _1996 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1990);
    float _1998 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2000 = fma(_1988, _1988, _1994);
    float _2002 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1996);
    float _2004 = sqrt(_2000);
    float _2006 = _2002 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2008 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1998);
    float _2010 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2008);
    bool _2012 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2014 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2016 = _2012 || _2014;
    bool _2018 = isnan(0.5);
    bool _2020 = _2016 || _2018;
    float _2022 = 1.0 / _2006;
    float _2024 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2026 = _2024 + _2006;
    bool _2028 = _2004 > 0.0;
    bool _2030 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2032 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2034 = _2030 || _2032;
    bool _2036 = isnan(0.5);
    bool _2038 = _2034 || _2036;
    float _2040 = _2026 * _2022;
    float _2042 = _2040 * 0.5;
    bool _2044 = !_2028;
    float _2046 = _1972;
    float _2048 = _1984;
    float _2050 = _1974;
    float _2052 = _1976;
    float _2054 = _2006;
    float _2056 = _1980;
    float _2058 = _1988;
    float _2060 = _2000;
    float _2062 = _2024;
    float _2064 = _2022;
    if (!_2044)
    {
        float _2066 = _172 * _172;
        float _2068 = rsqrt(_2000);
        float _2070 = fma(_170, _170, _2066);
        float _2072 = fma(_174, _174, _2070);
        float _2074 = sqrt(_2072);
        float _2076 = _1984 * _2068;
        float _2078 = _1980 * _2068;
        bool _2080 = _2074 > 0.0;
        float _2082 = _1988 * _2068;
        bool _2084 = !_2080;
        _2054 = _2072;
        _2060 = _2068;
        _2062 = _2082;
        if (!_2084)
        {
            float _2086 = rsqrt(_2072);
            float _2088 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2090 = _172 * _2086;
            float _2092 = _170 * _2086;
            float _2094 = _174 * _2086;
            float _2096 = _2078 * _2090;
            float _2098 = fma(_2076, _2092, _2096);
            float _2100 = _2088 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2102 = fma(_2082, _2094, _2098);
            float _2104 = _2102 * _2100;
            float _2106 = fma(_170, _2104, _1974);
            float _2108 = fma(_172, _2104, _1972);
            float _2110 = fma(_174, _2104, _1976);
            _2046 = _2108;
            _2048 = _2098;
            _2050 = _2106;
            _2052 = _2110;
            _2056 = _2104;
            _2058 = _2096;
            _2060 = _2100;
        }
    }
    float _2112 = _2046;
    float _2114 = _2048;
    float _2116 = _2050;
    float _2118 = _2052;
    float _2120 = _2054;
    float _2122 = _2056;
    float _2124 = _2058;
    float _2126 = _2060;
    float _2128 = _2062;
    float _2130 = _2120;
    float _2132 = _2122;
    float _2134 = _2116;
    float _2136 = _2118;
    float _2138 = _2114;
    float _2140 = _2128;
    if (_2038)
    {
        _2130 = 1.0;
    }
    float _2142 = _2130;
    float _2144 = _2142;
    if (_2020)
    {
        _2132 = _2112;
    }
    float _2146 = _2132;
    float _2148 = _2146;
    if (!_2020)
    {
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2152 = _1410 + _2150;
        float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2156 = _1624 + _2154;
        float _2158 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2160 = -_1410;
        float _2162 = _2160 + _2112;
        float _2164 = _2152 * _2152;
        float _2166 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2168 = _1416 + _2166;
        float _2170 = fma(_2156, _2156, _2164);
        float _2172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2174 = fma(_2168, _2168, _2170);
        float _2176 = sqrt(_2174);
        float _2178 = _2158 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2180 = precise::min(_2176, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2182 = _2180 * _2172;
        float _2184 = -_1624;
        float _2186 = _2184 + _2116;
        float _2188 = -_1416;
        float _2190 = _2188 + _2118;
        float _2192 = _2178 * _2182;
        float _2194 = fma(_2186, _2192, _1624);
        float _2196 = fma(_2162, _2192, _1410);
        float _2198 = fma(_2190, _2192, _1416);
        _2148 = _2196;
        _2134 = _2194;
        _2136 = _2198;
        _2138 = _2192;
    }
    float _2200 = _2148;
    float _2202 = _2134;
    float _2204 = _2136;
    float _2206 = _2138;
    float _2208 = _2206;
    if (!_2038)
    {
        float _2210 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2212 = _2210 * 0.15915493667125701904296875;
        float _2214 = _2212 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2220 = _2218 * 0.15915493667125701904296875;
        float _2222 = _2212 * 6.283185482025146484375;
        float _2224 = sin(_2222);
        float _2226 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2228 = fma(_2042, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2226);
        float _2230 = 1.0 / _2216;
        float _2232 = _2220 * 6.283185482025146484375;
        float _2234 = cos(_2232);
        float _2236 = _2224 * _2230;
        float _2238 = 1.0 / _2228;
        float _2240 = _2234 * _2236;
        float _2242 = _2220 * 6.283185482025146484375;
        float _2244 = sin(_2242);
        float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2248 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2246;
        float _2250 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2252 = _2238 * _2250;
        float _2254 = 1.0 / _2240;
        float _2256 = 1.0 / _2248;
        float _2258 = _2244 * _2254;
        float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2262 = fma(_2258, _2252, _2260);
        float _2264 = _2262 * _2256;
        float _2266 = precise::clamp(_2264, 0.0, 1.0);
        _2208 = _2212;
        _2144 = _2266;
    }
    float _2268 = _2208;
    float _2270 = _2144;
    float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2274 = _2200 + _2272;
    float _2276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2278 = _2202 + _2276;
    float _2280 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2282 = _2204 + _2280;
    float _2284 = _2274 * _2274;
    float _2286 = fma(_2278, _2278, _2284);
    float _2288 = fma(_2282, _2282, _2286);
    float _2290 = rsqrt(_2288);
    float _2292 = sqrt(_2288);
    float _2294 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2296 = _2278 * _2294;
    float _2298 = _2282 * _2294;
    float _2300 = _2296 * _2296;
    float _2302 = _2298 * _2298;
    float _2304 = _2300 + _2302;
    float _2306 = sqrt(_2304);
    bool _2308 = _2306 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2312 = _2306 + _2310;
    float _2314 = _2124;
    float _2316 = _2312;
    float _2318 = _2274;
    float _2320 = _2298;
    float _2322 = _2300;
    float _2324 = _2302;
    if (_2308)
    {
        float _2326 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2314 = _2326;
    }
    float _2328 = _2314;
    if (_2308)
    {
        float _2330 = _2312 * _2328;
        _2316 = _2330;
    }
    float _2332 = _2316;
    if (_2308)
    {
        float _2334 = _2332 * 0.15915493667125701904296875;
        _2064 = _2334;
    }
    float _2336 = _2064;
    float _2338 = _2126;
    if (_2308)
    {
        float _2340 = _2336 * 6.283185482025146484375;
        float _2342 = sin(_2340);
        _2338 = _2342;
    }
    float _2344 = _2338;
    float _2346 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2348 = precise::max(0.0, _2346);
    float _2350 = _2268;
    float _2352 = _2348;
    if (_2308)
    {
        float _2354 = _2336 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        _2350 = _2356;
    }
    float _2358 = _2350;
    float _2360 = -_2294;
    float _2362 = -_2348;
    float _2364 = fma(_2274, _2360, _2362);
    if (!_2308)
    {
        _2318 = _2296;
    }
    float _2366 = _2318;
    float _2368 = _2346;
    float _2370 = _2366;
    if (_2308)
    {
        float _2372 = rsqrt(_2304);
        _2368 = _2372;
    }
    float _2374 = _2368;
    if (_2308)
    {
        float _2376 = _2364 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2352 = _2376;
    }
    float _2378 = _2352;
    float _2380 = _2378;
    if (_2308)
    {
        float _2382 = fma(_2344, _2378, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2140 = _2382;
    }
    float _2384 = _2140;
    float _2386 = _2384;
    if (_2308)
    {
        float _2388 = _2358 + (-1.0);
        _2380 = _2388;
    }
    float _2390 = _2380;
    float _2392 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2394 = _2390;
    if (_2308)
    {
        float _2396 = _2390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2394 = _2396;
    }
    float _2398 = _2394;
    float _2400 = _2374;
    if (_2308)
    {
        float _2402 = _2374 * _2384;
        _2386 = _2402;
    }
    float _2404 = _2386;
    if (!_2308)
    {
        _2400 = _2364;
    }
    float _2406 = _2400;
    float _2408 = _2406;
    if (_2308)
    {
        float _2410 = fma(_2364, _2358, _2398);
        _2408 = _2410;
    }
    float _2412 = _2408;
    if (_2308)
    {
        float _2414 = _2296 * _2404;
        _2370 = _2414;
    }
    float _2416 = _2370;
    if (_2308)
    {
        float _2418 = _2298 * _2404;
        _2320 = _2418;
    }
    float _2420 = _2320;
    if (_2308)
    {
        float _2422 = _2416 * _2416;
        _2322 = _2422;
    }
    float _2424 = _2322;
    if (_2308)
    {
        float _2426 = _2420 * _2420;
        _2324 = _2426;
    }
    float _2428 = _2324;
    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2432 = fma(_2292, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2430);
    float _2434 = precise::clamp(_2432, 0.0, 1.0);
    float _2436 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2438 = fma(_2412, _2412, _2424);
    float _2440 = -_2434;
    float _2442 = _2440 + 1.0;
    float _2444 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2436);
    float _2446 = _2438 + _2428;
    float _2448 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2450 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2452 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2444);
    float _2454 = abs(_2442);
    float _2456 = log2(_2454);
    float _2458 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2448);
    float _2460 = _2200 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2462 = _2452 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2464 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2458);
    float _2466 = rsqrt(_2446);
    float _2468 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2470 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2460);
    float _2472 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2450);
    float _2474 = _2468 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2476 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2470);
    float _2478 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2472);
    float _2480 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2482 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2484 = _2476 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2486 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2488 = -_2474;
    float _2490 = fma(_2488, _2392, 1.0);
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2480);
    float _2494 = exp2(_2482);
    float _2496 = _2466 * _2416;
    float _2498 = _2466 * _2412;
    float _2500 = _2466 * _2420;
    float _2502 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2492);
    float _2504 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2506 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2502);
    float _2508 = -_2504;
    float _2510 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2508);
    float _2512 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2514 = log2(_2490);
    float _2516 = -_2500;
    float _2518 = fma(_2516, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2510);
    float _2520 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2522 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2512);
    float _2524 = fma(_2518, -0.5, 0.5);
    float _2526 = fma(_2518, 0.5, 0.5);
    float _2528 = 1.0 / _2506;
    float _2530 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2520);
    float _2532 = _2498 + 1.0;
    float _2534 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2522);
    float _2536 = fma(_2526, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2538 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2530);
    float _2540 = -_2498;
    float _2542 = fma(_2494, _2532, _2540);
    float _2544 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2534);
    float _2546 = sqrt(_2524);
    float _2548 = fma(_2526, _2536, -0.212114393711090087890625);
    float _2550 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2538);
    float _2552 = _2514 * 0.693147182464599609375;
    float _2554 = fma(_2542, 0.5, 0.5);
    float _2556 = fma(_2526, _2548, 1.570728778839111328125);
    float _2558 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2560 = _2550 * _2528;
    float _2562 = _2544 * _2528;
    float _2564 = fma(_2562, 0.5, 0.5);
    float _2566 = _2546 * 0.636619746685028076171875;
    float _2568 = fma(_2560, -0.5, 0.5);
    float _2570 = -_2556;
    float _2572 = fma(_2566, _2570, 1.0);
    float3 _7443 = float3(_2564, _2568, _2558);
    float _2574 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7443, float3(0.0), isnan(_7443)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7443, float3(0.0), isnan(_7443)), level(0.0)).x;
    float3 _7454 = float3(_2564, _2568, _2558);
    float4 _2577 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7454, float3(0.0), isnan(_7454)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7454, float3(0.0), isnan(_7454)), level(0.0)).xyzw;
    float _2579 = _2577.x;
    float _2581 = _2577.y;
    float _2583 = _2577.z;
    float _2585 = _2577.w;
    float2 _7471 = float2(_2572, _2554);
    float3 _2589 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7471, float2(0.0), isnan(_7471)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7471, float2(0.0), isnan(_7471)), level(0.0)).xyz;
    float _2591 = _2589.x;
    float _2593 = _2589.y;
    float _2595 = _2589.z;
    float _2597 = float(uint(_1508));
    float _2599 = trunc(_1510);
    int _2601 = int(_2599);
    int _2603 = ~_1508;
    int _2605 = _2603 + 1;
    float _2607 = _1566 * _152;
    int _2609 = ~_1508;
    int _2611 = _2609 + 1;
    out.m_61.x = _870;
    out.m_61.y = _872;
    out.m_61.z = _874;
    out.m_61.w = _878;
    int _2613 = abs(_1420);
    float _2615 = _1388 * (-0.15915493667125701904296875);
    float _2617 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2619 = 1.0 / _2597;
    float _2621 = _2462 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2623 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2621);
    bool _2625 = !_1186;
    float _2627 = _2625 ? 7.345489978790283203125 : 1.0;
    float _2629 = float(uint(_2601));
    float _2631 = trunc(_2607);
    int _2633 = int(_2631);
    float _2635 = float(_2601);
    float _2637 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2623);
    float _2639 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2637);
    int _2641 = as_type<int>(_2619) + (-2);
    float _2643 = exp2(_2617);
    out.gl_Position.x = _2544;
    out.gl_Position.y = _2550;
    out.gl_Position.z = _2639;
    out.gl_Position.w = _2506;
    float _2645 = as_type<float>(_2641) * _2629;
    float _2647 = trunc(_2645);
    float _2649 = precise::max(_2647, 0.0);
    uint _2652 = uint(_2649);
    float _2654 = -_2643;
    float _2656 = _2654 + 1.0;
    int _2658 = _2605 * int(_2652);
    int _2660 = _2658 + _2601;
    float _2662 = float(uint(_2660));
    float _2664 = as_type<float>(_2641) * _2662;
    float _2666 = _2627 * _1182;
    bool _2668 = _2635 >= _1556;
    bool _2670 = isnan(_2635);
    bool _2672 = _2668 || _2670;
    bool _2674 = isnan(_1556);
    bool _2676 = _2672 || _2674;
    float _2678 = float(_2676);
    float _2680 = floor(_2666);
    float _2682 = trunc(_2664);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    float _2688 = trunc(_2678);
    int _2690 = int(_2688);
    float _2692 = -_2680;
    float _2694 = _2666 + _2692;
    int _2696 = int(_2652) + int(_2686);
    int _2698 = _2611 * _2696;
    int _2700 = _2698 + _2601;
    bool _2702 = uint(_2700) >= uint(_1508);
    bool _2704 = !_2702;
    int _2706 = _2704 ? 0 : (-1);
    bool _2708 = _1508 == 0;
    int _2710 = ~_2696;
    int _2712 = _2710 + _2706;
    int _2714 = _2712 + 1;
    float _2716 = _2694 * _1556;
    int _2718 = _1508 * _2714;
    int _2720 = _2718 + _2601;
    float _2722 = trunc(_2716);
    int _2724 = int(_2722);
    int _2726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2728 = _2726 != 0;
    int _2730 = ~_2690;
    int _2732 = _2730 + 1;
    int _2734 = _2732 + 1;
    bool _2736 = !_2708;
    int _2738 = _2736 ? _2720 : (-1);
    int _2740 = _1508 + (-1);
    bool _2742 = !_2728;
    int _2744 = _2742 ? 0 : 1;
    int _2746 = _2738 * _2734;
    int _2748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2750 = _2748 != 0;
    int _2752 = abs(_1414);
    int _2754 = _2690 * _2740;
    int _2756 = _2754 + _2746;
    int _2758 = abs(_2744);
    bool _2760 = !_2750;
    int _2762 = _2760 ? 0 : 1;
    int _2764 = abs(_1426);
    int _2766 = _2756 * _2752;
    int _2768 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2770 = _2768 != 0;
    int _2772 = _2724 * _2758;
    int _2774 = _2772 + _2601;
    int _2776 = abs(_2762);
    int _2778 = _2633 * _2613;
    int _2780 = _2778 + _2766;
    float _2782 = in.m_53.w;
    int _2784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2786 = _2784 != 0;
    int _2788 = _2774 * _2764;
    int _2790 = _2788 + _2780;
    int _2792 = ~_1508;
    int _2794 = _2792 + 1;
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2798 = _2796 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2802 = _2800 != 0;
    int _2804 = _2724 * _2776;
    int _2806 = _2804 + _2790;
    int _2808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2810 = _2808 != 0;
    int _2812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2814 = _2812 != 0;
    float _2816 = 1.0 / _2798;
    float _2818 = float(uint(_2806));
    float _2820 = as_type<float>(_2641) * _2818;
    float _2822 = in.m_63.y;
    float _2824 = trunc(_2820);
    float _2826 = precise::max(_2824, 0.0);
    uint _2828 = uint(_2826);
    bool _2830 = _2782 > 0.5;
    float _2832 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2834 = _2832 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2836 = in.m_63.x;
    float _2838 = 1.0 / _2834;
    int _2840 = _2794 * int(_2828);
    int _2842 = _2840 + _2806;
    float _2844 = -_2822;
    float _2846 = _2844 + 1.0;
    float _2848 = float(uint(_2842));
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2852 = _1172 + _2850;
    int _2854 = _2830 ? as_type<int>(_2846) : as_type<int>(_2822);
    float _2856 = as_type<float>(_2641) * _2848;
    bool _2858 = _1188 > 0.5;
    float _2860 = _2810 ? as_type<float>(_2854) : _2822;
    float _2862 = trunc(_2856);
    float _2864 = precise::max(_2862, 0.0);
    uint _2866 = uint(_2864);
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2870 = _2868 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2872 = _2822;
    bool _2874 = _2770;
    bool _2876 = _2810;
    if (_2770)
    {
        float _2878 = _2858 ? _2846 : _2822;
        _2872 = _2878;
    }
    float _2880 = _2872;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2882;
    int _2886 = ~_1508;
    int _2888 = _2886 + 1;
    float _2890 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2892 = _2890 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    if (_2786)
    {
        bool _2894 = _1216 > 0.5;
        _2874 = _2894;
    }
    bool _2896 = _2874;
    float _2898 = _2884 * _2816;
    float _2900 = 1.0 / _2870;
    float _2902 = _2836;
    if (_2786)
    {
        float _2904 = -_2836;
        float _2906 = _2904 + 1.0;
        _1920 = as_type<int>(_2906);
    }
    int _2908 = _1920;
    if (_2802)
    {
        bool _2910 = _1182 > 0.5;
        _2876 = _2910;
    }
    bool _2912 = _2876;
    float _2914 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2916 = _1172 + _2914;
    float _2918 = fma(_2898, _2852, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2920 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2922 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2920;
    float _2924 = float(uint(_2774));
    int _2926 = int(_2828) + int(_2866);
    float _2928 = _2922 * _2838;
    float _2930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2932 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2934 = isnan(_1172);
    bool _2936 = _2932 || _2934;
    bool _2938 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2940 = _2936 || _2938;
    float _2942 = float(_2940);
    int _2944 = _2888 * _2926;
    int _2946 = _2944 + _2806;
    int _2948 = ~_1508;
    int _2950 = _2948 + 1;
    float _2952 = _2892 * _2900;
    bool _2954 = uint(_2946) >= uint(_1508);
    float _2956 = fma(_2952, _2916, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2958 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2960 = _1172 + _2958;
    bool _2962 = !_2954;
    float _2964 = _2962 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2966 = fma(_2928, _2960, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2968 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2970 = isnan(_1172);
    bool _2972 = _2968 || _2970;
    bool _2974 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2976 = _2972 || _2974;
    float _2978 = float(_2976);
    float _2980 = _2930 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2982 = ~_2926;
    int _2984 = _2982 + as_type<int>(_2964);
    int _2986 = _2984 + 1;
    float _2988 = as_type<float>(_2641) * _2924;
    bool _2990 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2992 = isnan(_1172);
    bool _2994 = _2990 || _2992;
    bool _2996 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2998 = _2994 || _2996;
    float _3000 = float(_2998);
    float _3002 = -_2978;
    float _3004 = _3002 + 1.0;
    float _3006 = _2964;
    if (!_2802)
    {
        _3006 = _2836;
    }
    float _3008 = _3006;
    int _3010 = _1508 * _2986;
    int _3012 = _3010 + _2806;
    bool _3014 = _1172 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3016 = isnan(_1172);
    bool _3018 = _3014 || _3016;
    bool _3020 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3022 = _3018 || _3020;
    float _3024 = float(_3022);
    float _3026 = trunc(_2988);
    float _3028 = precise::max(_3026, 0.0);
    uint _3030 = uint(_3028);
    float _3032 = _3000 * _3004;
    float _3034 = -_3000;
    float _3036 = _3034 + 1.0;
    bool _3038 = !_2708;
    int _3040 = _3038 ? _3012 : (-1);
    float _3042 = _3024 * _3036;
    float _3044 = -_3024;
    float _3046 = _3044 + 1.0;
    float _3048 = fma(_2860, _2980, -0.5);
    int _3050 = _3040 >> 31;
    float _3052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3054 = _2942 * _3046;
    float _3056 = -_2942;
    float _3058 = _3056 + 1.0;
    float _3060 = _2918 * _3054;
    int _3062 = _3050 & 3;
    int _3064 = _2950 * int(_3030);
    int _3066 = _3064 + _2774;
    int _3068 = _3040 + _3062;
    float _3070 = float(uint(_3066));
    float _3072 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2880, -0.5);
    int _3074 = _3068 >> 2;
    float _3076 = fma(_3058, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3060);
    float _3078 = _2615 * 6.283185482025146484375;
    float _3080 = sin(_3078);
    float _3082 = as_type<float>(_2641) * _3070;
    int _3084 = _3074 << 4;
    int _3086 = _3084 + 368;
    int _3088 = as_type<int>(_3070);
    float _3090 = _3008;
    if (_2802)
    {
        float _3092 = -_2836;
        float _3094 = _3092 + 1.0;
        _3088 = as_type<int>(_3094);
    }
    int _3096 = _3088;
    float _3098 = fma(_2956, _3042, _3076);
    float _3100 = -_1302;
    float _3102 = fma(_1558, _3072, _3100);
    uint _3104 = uint(int(uint(_3086) >> uint(2)));
    uint _3106 = uint(int(uint(int(_3104)) >> uint(2)));
    int _3108 = int(_3104) & 3;
    float _3110 = (*spvDescriptorSet0.vp_c9)._m0[int(_3106)][_3108];
    int _3112 = int(_3104) + 1;
    uint _3114 = uint(int(uint(_3112) >> uint(2)));
    int _3116 = _3112 & 3;
    float _3118 = (*spvDescriptorSet0.vp_c9)._m0[int(_3114)][_3116];
    if (_2802)
    {
        float _3120 = _2912 ? as_type<float>(_3096) : _2836;
        _3090 = _3120;
    }
    float _3122 = _3090;
    float _3124 = _3052 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_2786)
    {
        float _3126 = _2896 ? as_type<float>(_2908) : _2836;
        _2902 = _3126;
    }
    float _3128 = _2902;
    float _3130 = _2615 * 6.283185482025146484375;
    float _3132 = cos(_3130);
    float _3134 = fma(_2966, _3032, _3098);
    float _3136 = fma(_3122, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _3138 = _3040 & 3;
    bool _3140 = _3138 != 0;
    int _3142 = _3086 + 8;
    uint _3144 = uint(int(uint(_3142) >> uint(2)));
    uint _3146 = uint(int(uint(int(_3144)) >> uint(2)));
    int _3148 = int(_3144) & 3;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[int(_3146)][_3148];
    int _3152 = int(_3144) + 1;
    uint _3154 = uint(int(uint(_3152) >> uint(2)));
    int _3156 = _3152 & 3;
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[int(_3154)][_3156];
    int _3160 = _3040 & 3;
    bool _3162 = _3160 != 0;
    float _3164 = fma(_2978, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3134);
    bool _3166 = uint(_3138) > 1u;
    float _3168 = trunc(_3082);
    float _3170 = precise::max(_3168, 0.0);
    uint _3172 = uint(_3170);
    int _3174 = _3162 ? 0 : 1;
    float _3176 = _3080 * _3048;
    bool _3178 = _3138 != 3;
    float _3180 = fma(_3124, _3128, -0.5);
    bool _3182 = uint(_3138) >= 2u;
    float _3184 = fma(_1550, _3136, _1298);
    int _3186 = ~_3174;
    int _3188 = _3186 + 1;
    int _3190 = _3188 + 1;
    float _3192 = _3132 * _3048;
    float _3194 = -_3176;
    float _3196 = fma(_3132, _3180, _3194);
    float _3198 = _3102 + 0.5;
    float _3200 = _3184 + 0.5;
    int _3202 = _3190;
    if (!_3166)
    {
        int _3204 = ~_3174;
        int _3206 = _3204 + 1;
        _3202 = _3206;
    }
    int _3208 = _3202;
    float _3210 = fma(_3080, _3180, _3192);
    bool _3212 = !_3140;
    int _3214 = _3212 ? 0 : 1;
    float _3216 = fma(_1562, _3196, _1378);
    int _3218 = _3182 ? 0 : 1;
    float _3220 = -_1408;
    float _3222 = fma(_1490, _3210, _3220);
    bool _3224 = _3138 != 3;
    float _3226 = _3216 + 0.5;
    int _3228 = int(_3030) + int(_3172);
    float _3230 = _3222 + 0.5;
    int _3232 = abs(_3208);
    int _3234 = ~_1508;
    int _3236 = _3234 + 1;
    int _3238 = ~_3218;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    out.m_65.x = _3200;
    out.m_65.y = _3198;
    out.m_65.z = _3226;
    out.m_65.w = _3230;
    bool _3244 = !_3224;
    int _3246 = _3244 ? 0 : (-1);
    int _3248 = _3236 * _3228;
    int _3250 = _3248 + _2774;
    int _3252 = abs(_3214);
    int _3254 = _3242;
    if (_3178)
    {
        int _3256 = ~_3218;
        int _3258 = _3256 + 1;
        _3254 = _3258;
    }
    int _3260 = _3254;
    int _3262 = ~_3232;
    int _3264 = _3262 + 1;
    int _3266 = _3264 + 1;
    bool _3268 = !_2814;
    int _3270 = _3268 ? 0 : 1;
    int _3272 = abs(_3246);
    int _3274 = _3266 * as_type<int>(_3118);
    int _3276 = abs(_3260);
    int _3278 = ~_3252;
    int _3280 = _3278 + 1;
    int _3282 = _3280 + 1;
    int _3284 = abs(_3270);
    bool _3286 = uint(_3250) >= uint(_1508);
    int _3288 = _3282 * as_type<int>(_3110);
    int _3290 = _3288 + _3274;
    int _3292 = ~_3276;
    int _3294 = _3292 + 1;
    int _3296 = _3294 + 1;
    bool _3298 = !_3286;
    int _3300 = _3298 ? 0 : (-1);
    int _3302 = _3296 * as_type<int>(_3150);
    int _3304 = _3302 + _3290;
    int _3306 = ~_3272;
    int _3308 = _3306 + 1;
    int _3310 = _3308 + 1;
    float _3312 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3314 = ~_3228;
    int _3316 = _3314 + _3300;
    int _3318 = _3316 + 1;
    float _3320 = _2544 + _2506;
    int _3322 = ~_3284;
    int _3324 = _3322 + 1;
    int _3326 = _3324 + 1;
    int _3328 = _3310 * as_type<int>(_3158);
    int _3330 = _3328 + _3304;
    float _3332 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3334 = _3312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3336 = _3164 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3338 = _3330 * _3326;
    float _3340 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3342 = _3332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3344 = _1508 * _3318;
    int _3346 = _3344 + _2774;
    float _3348 = _2270 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3350 = _3340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3352 = _2506 * 0.5;
    float _3354 = _3320 * 0.5;
    bool _3356 = !_2708;
    int _3358 = _3356 ? _3346 : (-1);
    out.m_67.x = _3350;
    out.m_67.y = _3342;
    out.m_67.z = _3334;
    out.m_67.w = _3336;
    bool _3360 = _2270 > 0.0;
    bool _3362 = isnan(_2270);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan(0.0);
    bool _3368 = _3364 || _3366;
    float _3370 = fma(_2550, -0.5, _3352);
    int _3372 = _3358 * _3284;
    int _3374 = _3372 + _3338;
    float _3376 = _2639 + _2506;
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _3378 = float(_3374);
    float _3380 = _3376 * 0.5;
    float _3382 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3384 = _3348 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3378;
    float _3386 = _3382 * _2574;
    float _3388 = -_3382;
    float _3390 = _3388 + 1.0;
    out.m_73.x = _3354;
    out.m_73.y = _3370;
    out.m_73.z = _3380;
    out.m_73.w = _2506;
    float _3392 = _2585 * _3386;
    float _3394 = _2595 * _3386;
    float _3396 = _2585 * _3390;
    out.m_49.x = _3384;
    float _3398 = fma(_2591, _3392, _2579);
    float _3400 = fma(_2593, _3392, _2581);
    float _3402 = fma(_2585, _3394, _2583);
    out.m_75.x = _3398;
    out.m_75.y = _3400;
    out.m_75.z = _3402;
    out.m_75.w = _3396;
    if (_3368)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3404 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3404;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

