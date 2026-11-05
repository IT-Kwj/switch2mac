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
    bool _1172 = false;
    bool _902 = false;
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
        float _3405 = as_type<float>(_118);
        out.gl_Position.z = _3405;
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
        float _3460 = as_type<float>(_144);
        out.gl_Position.z = _3460;
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
    float _882 = _874;
    float _900;
    if (!_880)
    {
        float _884 = in.m_53.x;
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _888 = _884 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _892 = _890 * _886;
        float _894 = floor(_892);
        float _896 = -_894;
        float _898 = _892 + _896;
        _900 = _898;
        _902 = true;
    }
    else
    {
        _900 = _156;
    }
    _902 = false;
    float _904 = _900;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _908 = _904 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _912 = _904 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _916 = _904 + _914;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _934 = 1.0 / _920;
    bool _936 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _938 = isnan(_904);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = 1.0 / _924;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _952 = _904 + _950;
    float _954 = 1.0 / _928;
    float _956 = _908 * _934;
    bool _958 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _960 = isnan(_904);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    bool _970 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _972 = 1.0 / _932;
    float _974 = _912 * _948;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _980;
    float _984 = fma(_978, _956, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _986 = fma(_982, _956, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _988 = _916 * _954;
    float _990 = -_946;
    float _992 = _990 + 1.0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _994;
    float _998 = fma(_996, _956, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1000 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1002 = isnan(_904);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _952 * _972;
    bool _1014 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1016 = isnan(_904);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _968 * _992;
    float _1028 = -_968;
    float _1030 = _1028 + 1.0;
    bool _1032 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1034 = isnan(_904);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = -_1024;
    float _1046 = _1044 + 1.0;
    float _1048 = _1024 * _1030;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1058 = _1010 * _1046;
    float _1060 = -_1010;
    float _1062 = _1060 + 1.0;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1068 = fma(_1052, _974, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1070 = fma(_1056, _974, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1072 = _1042 * _1062;
    float _1074 = fma(_1066, _974, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1076 = _986 * _1072;
    float _1078 = _984 * _1072;
    float _1080 = -_1042;
    float _1082 = _1080 + 1.0;
    float _1084 = _998 * _1072;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1094;
    float _1098 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1078);
    float _1100 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1076);
    float _1102 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1084);
    float _1104 = fma(_1088, _988, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1106 = fma(_1092, _988, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1108 = fma(_1096, _988, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1110 = fma(_1068, _1058, _1098);
    float _1112 = fma(_1074, _1058, _1100);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1122 = fma(_1070, _1058, _1102);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1128 = fma(_1104, _1048, _1110);
    float _1130 = fma(_1116, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1132 = fma(_1120, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1134 = fma(_1106, _1048, _1112);
    float _1136 = fma(_1126, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1138 = fma(_1108, _1048, _1122);
    float _1140 = fma(_1130, _1026, _1128);
    float _1142 = fma(_1132, _1026, _1134);
    float _1144 = fma(_1136, _1026, _1138);
    float _1146 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1140);
    float _1148 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1142);
    float _1150 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1144);
    bool _1152 = !_970;
    float _1170;
    if (!_1152)
    {
        float _1154 = in.m_53.x;
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1158 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1162 = _1160 * _1156;
        float _1164 = floor(_1162);
        float _1166 = -_1164;
        float _1168 = _1162 + _1166;
        _1170 = _1168;
        _1172 = true;
    }
    else
    {
        _1170 = _156;
    }
    _1172 = false;
    float _1174 = _1170;
    float _1176 = in.m_42.x;
    float _1178 = in.m_42.y;
    float _1180 = in.m_42.z;
    float _1182 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1184 = in.m_53.x;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1188 = _1186 != 0;
    float _1190 = in.m_53.y;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1196 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1198 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1196);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1202 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1204 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1206 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1198);
    float _1210 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1212 = _1184 * 2.0;
    float _1214 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1206);
    float _1216 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1202);
    float _1218 = in.m_53.z;
    float _1220 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1222 = -_1192;
    float _1224 = fma(_1210, 2.0, _1222);
    float _1226 = _1190 * 2.0;
    float _1228 = floor(_1212);
    float _1230 = fma(_1220, -2.0, _1194);
    float _1232 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1204);
    float _1234 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1214);
    float _1236 = _1184 + _1190;
    float _1238 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1240 = floor(_1226);
    float _1242 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1232);
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1246 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1238);
    float _1248 = _1236 + (-1.0);
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1252 = _1228 > 0.0;
    float _1254 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1246);
    bool _1256 = _1228 >= 0.0;
    bool _1258 = isnan(_1228);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(0.0);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1216);
    float _1268 = _1246;
    float _1270 = _1216;
    float _1272 = _1180;
    float _1274 = _1232;
    float _1276 = _1190;
    if (!_1188)
    {
        _1268 = _1190;
    }
    float _1278 = _1268;
    float _1280 = _1218 * 2.0;
    float _1282 = _1278;
    if (!_1188)
    {
        _1270 = _1184;
    }
    float _1284 = _1270;
    float _1286 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1288 = _1284;
    if (!_1188)
    {
        _1272 = _1218;
    }
    float _1290 = _1272;
    float _1292 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1294 = int(_1292);
    float _1296 = _1290;
    if (_1188)
    {
        _1282 = _1184;
    }
    float _1298 = _1282;
    float _1300 = -_100;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1224);
    if (_1188)
    {
        _1288 = _1218;
    }
    float _1304 = _1288;
    float _1306 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1230);
    bool _1308 = _1240 > 0.0;
    float _1310 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1312 = _1240;
    if (!_1188)
    {
        _1274 = _1290;
    }
    float _1314 = _1274;
    float _1316 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1244);
    float _1318 = -_1200;
    float _1320 = fma(_1310, 2.0, _1318);
    float _1322 = _1314;
    if (_1188)
    {
        _1322 = _1190;
    }
    float _1324 = _1322;
    float _1326 = floor(_1280);
    bool _1328 = _1240 >= 0.0;
    bool _1330 = isnan(_1240);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(0.0);
    bool _1336 = _1332 || _1334;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1188)
    {
        _1312 = _1190;
    }
    float _1340 = _1312;
    float _1342 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1344 = _1264 ? 0 : 1;
    float _1346 = _1184 + _1218;
    float _1348 = fma(_1342, -2.0, _1338);
    float _1350 = _1340;
    if (_1188)
    {
        _1350 = _1184;
    }
    float _1352 = _1350;
    float _1354 = _1346 + (-1.0);
    int _1356 = _1336 ? 0 : 1;
    float _1358 = rsqrt(_1208);
    int _1360 = ~_1344;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    float _1366 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1250);
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1378 = _1376 != 0;
    float _1380 = -_100;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1320);
    int _1384 = _1364;
    if (!_1252)
    {
        int _1386 = ~_1344;
        int _1388 = _1386 + 1;
        _1384 = _1388;
    }
    int _1390 = _1384;
    float _1392 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1316);
    int _1394 = ~_1356;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    float _1400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1402 = log2(_1400);
    int _1404 = _1398;
    if (!_1308)
    {
        int _1406 = ~_1356;
        int _1408 = _1406 + 1;
        _1404 = _1408;
    }
    int _1410 = _1404;
    float _1412 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1348);
    float _1414 = _1242 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1416 = !_1374;
    int _1418 = _1416 ? 0 : 1;
    float _1420 = _1234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1422 = !_1370;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1428 = !_1378;
    int _1430 = _1428 ? 0 : 1;
    float _1432 = _1190 + _1218;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1440 = _1438 != 0;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1444 = _1442 != 0;
    float _1446 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1448 = _1432 + (-1.0);
    bool _1450 = !_1444;
    int _1452 = _1450 ? 0 : 1;
    float _1454 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1456 = !_1440;
    int _1458 = _1456 ? 0 : 1;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1462 = abs(_1452);
    float _1464 = float(_1294);
    bool _1466 = _1326 > 0.0;
    bool _1468 = _1326 >= 0.0;
    bool _1470 = isnan(_1326);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan(0.0);
    bool _1476 = _1472 || _1474;
    float _1478 = _1402 * _100;
    float _1480 = 1.0 / _1464;
    if (_1188)
    {
        _1296 = _1190;
    }
    float _1482 = _1296;
    int _1484 = abs(_1458);
    float _1486 = float(_1410);
    float _1488 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1460);
    float _1490 = float(_1462);
    float _1492 = exp2(_1478);
    float _1494 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1488);
    float _1496 = float(_1390);
    float _1498 = _1490 * _1486;
    float _1500 = in.m_57.x;
    float _1502 = in.m_57.y;
    float _1504 = in.m_57.z;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1508 = 1.0 + _1506;
    float _1510 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1512 = int(_1510);
    float _1514 = _1480 * _100;
    float _1516 = float(_1484);
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1520 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1522 = isnan(1.0);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1528 = _1524 || _1526;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1532 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1534 = isnan(0.0);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1540 = _1536 || _1538;
    float _1542 = 1.0 / _1508;
    float _1544 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1518);
    float _1546 = -_1492;
    float _1548 = _1546 + 1.0;
    float _1550 = _1516 * _1496;
    float _1552 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    float _1554 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1544);
    int _1556 = _1476 ? 0 : 1;
    float _1558 = _1550 * (-2.0);
    float _1560 = float(_1512);
    float _1562 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1552);
    float _1564 = _1540 ? _1548 : 0.0;
    float _1566 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1366);
    float _1568 = fma(_1454, _1558, _1454);
    float _1570 = _1560 * _100;
    float _1572 = fma(_1558, _1502, _1502);
    float _1574 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1528)
    {
        float _1576 = _1564 * _1542;
        _110 = _1576;
    }
    float _1578 = _110;
    float _1580 = _1190 + (-0.5);
    int _1582 = ~_1556;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    int _1588 = _1586;
    if (!_1466)
    {
        int _1590 = ~_1556;
        int _1592 = _1590 + 1;
        _1588 = _1592;
    }
    int _1594 = _1588;
    float _1596 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1572);
    float _1598 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1600 = _1574 * _1574;
    float _1602 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1604 = fma(_1598, _1598, _1600);
    bool _1606 = !_1436;
    int _1608 = _1606 ? 0 : 1;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1610;
    float _1614 = _1498 * (-2.0);
    float _1616 = fma(_1602, _1602, _1604);
    int _1618 = abs(_1608);
    float _1620 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1622 = fma(_1426, _1614, _1426);
    float _1624 = fma(_1614, _1504, _1504);
    float _1626 = fma(_1568, _1578, _1596);
    float _1628 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1630 = _1218 + (-0.5);
    float _1632 = _1626 * 0.15915493667125701904296875;
    float _1634 = float(_1594);
    float _1636 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1620);
    float _1638 = float(_1618);
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1624);
    float _1642 = rsqrt(_1616);
    float _1644 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1636);
    float _1646 = _1638 * _1634;
    float _1648 = _1646 * (-2.0);
    float _1650 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1652 = fma(_1622, _1578, _1640);
    float _1654 = _1184 + (-0.5);
    float _1656 = in.m_59.x;
    float _1658 = in.m_59.y;
    float _1660 = in.m_59.z;
    float _1662 = -_1650;
    float _1664 = _1446 + _1662;
    float _1666 = fma(_1648, _1500, _1500);
    float _1668 = 1.0 / _1612;
    float _1670 = fma(_1286, _1648, _1286);
    bool _1672 = _1650 >= _1446;
    bool _1674 = isnan(_1650);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan(_1446);
    bool _1680 = _1676 || _1678;
    float _1682 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1666);
    float _1684 = abs(_1664);
    float _1686 = precise::max(_1684, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1688 = _1652 * 0.15915493667125701904296875;
    float _1690 = _1598 * _1642;
    float _1692 = fma(_1670, _1578, _1682);
    float _1694 = precise::min(_1686, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1696 = _1688 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    bool _1700 = !_1680;
    float _1702 = _1700 ? 1.0 : (-1.0);
    float _1704 = _1692 * 0.15915493667125701904296875;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1708 = _1694 + _1706;
    float _1710 = _1574 * _1642;
    float _1712 = _1602 * _1642;
    float _1714 = _1708 * _1668;
    float _1716 = _1688 * 6.283185482025146484375;
    float _1718 = cos(_1716);
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1656);
    float _1722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1660);
    float _1724 = _1702 * _1714;
    float _1726 = _1632 * 6.283185482025146484375;
    float _1728 = sin(_1726);
    float _1730 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1732 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1734 = _1732 * _1724;
    float _1736 = _1632 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = _1704 * 6.283185482025146484375;
    float _1742 = sin(_1740);
    float _1744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1658);
    float _1746 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1748 = _1730 * _1722;
    float _1750 = _1182 * _1744;
    float _1752 = _1746 * _1720;
    float _1754 = _1734 * 0.15915493667125701904296875;
    float _1756 = _1704 * 6.283185482025146484375;
    float _1758 = cos(_1756);
    float _1760 = _1718 * _1750;
    float _1762 = _1738 * _1718;
    float _1764 = _1728 * _1718;
    float _1766 = _1742 * _1728;
    float _1768 = -_1750;
    float _1770 = _1698 * _1768;
    float _1772 = _1754 * 6.283185482025146484375;
    float _1774 = cos(_1772);
    float _1776 = fma(_1762, _1752, _1770);
    float _1778 = _1758 * _1738;
    float _1780 = _1758 * _1728;
    float _1782 = _1758 * _1760;
    float _1784 = _1742 * _1738;
    float _1786 = fma(_1698, _1778, _1766);
    float _1788 = _1742 * _1760;
    float _1790 = fma(_1764, _1748, _1776);
    float _1792 = -_1784;
    float _1794 = fma(_1698, _1780, _1792);
    float _1796 = fma(_1786, _1752, _1782);
    float _1798 = -_1780;
    float _1800 = fma(_1698, _1784, _1798);
    float _1802 = _1754 * 6.283185482025146484375;
    float _1804 = sin(_1802);
    float _1806 = fma(_1698, _1766, _1778);
    float _1808 = fma(_1794, _1748, _1796);
    float _1810 = fma(_1800, _1752, _1788);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1814 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1816 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1818 = fma(_1806, _1748, _1810);
    float _1820 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1812);
    float _1822 = -_1774;
    float _1824 = _1822 + 1.0;
    float _1826 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1814);
    float _1828 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1816);
    float _1830 = _1712 * _1712;
    float _1832 = _1710 * _1824;
    float _1834 = _1690 * _1804;
    float _1836 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1820);
    float _1838 = _1710 * _1804;
    float _1840 = fma(_1824, _1830, _1774);
    float _1842 = _1712 * _1804;
    float _1844 = _1690 * _1824;
    float _1846 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1826);
    float _1848 = fma(_1712, _1832, _1834);
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1852 = -_1842;
    float _1854 = fma(_1710, _1844, _1852);
    float _1856 = -_1838;
    float _1858 = fma(_1712, _1844, _1856);
    float _1860 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1862 = _1850 * _1848;
    float _1864 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1828);
    float _1866 = fma(_1690, _1844, _1774);
    float _1868 = _1850 * _1854;
    float _1870 = fma(_1860, _1858, _1862);
    float _1872 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1874 = fma(_1710, _1844, _1842);
    float _1876 = fma(_1860, _1866, _1868);
    float _1878 = fma(_1712, _1844, _1838);
    float _1880 = fma(_1872, _1840, _1870);
    float _1882 = fma(_1710, _1832, _1774);
    float _1884 = -_1834;
    float _1886 = fma(_1712, _1832, _1884);
    float _1888 = fma(_1872, _1878, _1876);
    float _1890 = _1420 + _1880;
    float _1892 = _1850 * _1882;
    float _1894 = _1628 + _1888;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1898 = _1890 + _1896;
    float _1900 = fma(_1860, _1874, _1892);
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1904 = _1894 + _1902;
    float _1906 = _1898 * _1898;
    float _1908 = fma(_1872, _1886, _1900);
    float _1910 = fma(_1904, _1904, _1906);
    float _1912 = _1414 + _1908;
    float _1914 = sqrt(_1910);
    bool _1916 = _1914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1918 = _1908;
    float _1920 = _1710;
    float _1922 = _1900;
    if (!_1916)
    {
        _1918 = _1894;
    }
    float _1924 = _1918;
    float _1926 = _1924;
    if (!_1916)
    {
        _1920 = _1890;
    }
    float _1928 = _1920;
    float _1930 = _1928;
    if (!_1916)
    {
        _1922 = _1912;
    }
    float _1932 = _1922;
    bool _1934 = !_1916;
    float _1936 = _1932;
    if (!_1934)
    {
        float _1938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1942 = _1914 + _1940;
        float _1944 = rsqrt(_1910);
        float _1946 = _1942 * _1938;
        float _1948 = _1912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = _1946 * 0.15915493667125701904296875;
        float _1952 = _1950 * 6.283185482025146484375;
        float _1954 = sin(_1952);
        float _1956 = _1950 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = fma(_1954, _1948, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1962 = _1944 * _1960;
        float _1964 = _1958 + (-1.0);
        float _1966 = fma(_1904, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1968 = fma(_1898, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1970 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1972 = fma(_1912, _1958, _1970);
        _1936 = _1972;
        _1926 = _1966;
        _1930 = _1968;
    }
    float _1974 = _1936;
    float _1976 = _1926;
    float _1978 = _1930;
    float _1980 = -_1414;
    float _1982 = _1980 + _1974;
    float _1984 = -_1628;
    float _1986 = _1984 + _1976;
    float _1988 = -_1420;
    float _1990 = _1988 + _1978;
    float _1992 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1994 = _1982 * _1982;
    float _1996 = fma(_1986, _1986, _1994);
    float _1998 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1992);
    float _2000 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2002 = fma(_1990, _1990, _1996);
    float _2004 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1998);
    float _2006 = sqrt(_2002);
    float _2008 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2010 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2000);
    float _2012 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2010);
    bool _2014 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.5);
    bool _2022 = _2018 || _2020;
    float _2024 = 1.0 / _2008;
    float _2026 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2028 = _2026 + _2008;
    bool _2030 = _2006 > 0.0;
    bool _2032 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan(0.5);
    bool _2040 = _2036 || _2038;
    float _2042 = _2028 * _2024;
    float _2044 = _2042 * 0.5;
    bool _2046 = !_2030;
    float _2048 = _1974;
    float _2050 = _1986;
    float _2052 = _1976;
    float _2054 = _1978;
    float _2056 = _2008;
    float _2058 = _1982;
    float _2060 = _1990;
    float _2062 = _2002;
    float _2064 = _2026;
    float _2066 = _2024;
    if (!_2046)
    {
        float _2068 = _172 * _172;
        float _2070 = rsqrt(_2002);
        float _2072 = fma(_170, _170, _2068);
        float _2074 = fma(_174, _174, _2072);
        float _2076 = sqrt(_2074);
        float _2078 = _1986 * _2070;
        float _2080 = _1982 * _2070;
        bool _2082 = _2076 > 0.0;
        float _2084 = _1990 * _2070;
        bool _2086 = !_2082;
        _2056 = _2074;
        _2062 = _2070;
        _2064 = _2084;
        if (!_2086)
        {
            float _2088 = rsqrt(_2074);
            float _2090 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2092 = _172 * _2088;
            float _2094 = _170 * _2088;
            float _2096 = _174 * _2088;
            float _2098 = _2080 * _2092;
            float _2100 = fma(_2078, _2094, _2098);
            float _2102 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2104 = fma(_2084, _2096, _2100);
            float _2106 = _2104 * _2102;
            float _2108 = fma(_170, _2106, _1976);
            float _2110 = fma(_172, _2106, _1974);
            float _2112 = fma(_174, _2106, _1978);
            _2048 = _2110;
            _2050 = _2100;
            _2052 = _2108;
            _2054 = _2112;
            _2058 = _2106;
            _2060 = _2098;
            _2062 = _2102;
        }
    }
    float _2114 = _2048;
    float _2116 = _2050;
    float _2118 = _2052;
    float _2120 = _2054;
    float _2122 = _2056;
    float _2124 = _2058;
    float _2126 = _2060;
    float _2128 = _2062;
    float _2130 = _2064;
    float _2132 = _2122;
    float _2134 = _2124;
    float _2136 = _2118;
    float _2138 = _2120;
    float _2140 = _2116;
    float _2142 = _2130;
    if (_2040)
    {
        _2132 = 1.0;
    }
    float _2144 = _2132;
    float _2146 = _2144;
    if (_2022)
    {
        _2134 = _2114;
    }
    float _2148 = _2134;
    float _2150 = _2148;
    if (!_2022)
    {
        float _2152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2154 = _1414 + _2152;
        float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2158 = _1628 + _2156;
        float _2160 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2162 = -_1414;
        float _2164 = _2162 + _2114;
        float _2166 = _2154 * _2154;
        float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2170 = _1420 + _2168;
        float _2172 = fma(_2158, _2158, _2166);
        float _2174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2176 = fma(_2170, _2170, _2172);
        float _2178 = sqrt(_2176);
        float _2180 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2182 = precise::min(_2178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2184 = _2182 * _2174;
        float _2186 = -_1628;
        float _2188 = _2186 + _2118;
        float _2190 = -_1420;
        float _2192 = _2190 + _2120;
        float _2194 = _2180 * _2184;
        float _2196 = fma(_2188, _2194, _1628);
        float _2198 = fma(_2164, _2194, _1414);
        float _2200 = fma(_2192, _2194, _1420);
        _2150 = _2198;
        _2136 = _2196;
        _2138 = _2200;
        _2140 = _2194;
    }
    float _2202 = _2150;
    float _2204 = _2136;
    float _2206 = _2138;
    float _2208 = _2140;
    float _2210 = _2208;
    if (!_2040)
    {
        float _2212 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2214 = _2212 * 0.15915493667125701904296875;
        float _2216 = _2214 * 6.283185482025146484375;
        float _2218 = cos(_2216);
        float _2220 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2222 = _2220 * 0.15915493667125701904296875;
        float _2224 = _2214 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2230 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2228);
        float _2232 = 1.0 / _2218;
        float _2234 = _2222 * 6.283185482025146484375;
        float _2236 = cos(_2234);
        float _2238 = _2226 * _2232;
        float _2240 = 1.0 / _2230;
        float _2242 = _2236 * _2238;
        float _2244 = _2222 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2250 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2248;
        float _2252 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2254 = _2240 * _2252;
        float _2256 = 1.0 / _2242;
        float _2258 = 1.0 / _2250;
        float _2260 = _2246 * _2256;
        float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2264 = fma(_2260, _2254, _2262);
        float _2266 = _2264 * _2258;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        _2210 = _2214;
        _2146 = _2268;
    }
    float _2270 = _2210;
    float _2272 = _2146;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2276 = _2202 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2280 = _2204 + _2278;
    float _2282 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2284 = _2206 + _2282;
    float _2286 = _2276 * _2276;
    float _2288 = fma(_2280, _2280, _2286);
    float _2290 = fma(_2284, _2284, _2288);
    float _2292 = rsqrt(_2290);
    float _2294 = sqrt(_2290);
    float _2296 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2298 = _2280 * _2296;
    float _2300 = _2284 * _2296;
    float _2302 = _2298 * _2298;
    float _2304 = _2300 * _2300;
    float _2306 = _2302 + _2304;
    float _2308 = sqrt(_2306);
    bool _2310 = _2308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2314 = _2308 + _2312;
    float _2316 = _2126;
    float _2318 = _2314;
    float _2320 = _2276;
    float _2322 = _2300;
    float _2324 = _2302;
    float _2326 = _2304;
    if (_2310)
    {
        float _2328 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2316 = _2328;
    }
    float _2330 = _2316;
    if (_2310)
    {
        float _2332 = _2314 * _2330;
        _2318 = _2332;
    }
    float _2334 = _2318;
    if (_2310)
    {
        float _2336 = _2334 * 0.15915493667125701904296875;
        _2066 = _2336;
    }
    float _2338 = _2066;
    float _2340 = _2128;
    if (_2310)
    {
        float _2342 = _2338 * 6.283185482025146484375;
        float _2344 = sin(_2342);
        _2340 = _2344;
    }
    float _2346 = _2340;
    float _2348 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2350 = precise::max(0.0, _2348);
    float _2352 = _2270;
    float _2354 = _2350;
    if (_2310)
    {
        float _2356 = _2338 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        _2352 = _2358;
    }
    float _2360 = _2352;
    float _2362 = -_2296;
    float _2364 = -_2350;
    float _2366 = fma(_2276, _2362, _2364);
    if (!_2310)
    {
        _2320 = _2298;
    }
    float _2368 = _2320;
    float _2370 = _2348;
    float _2372 = _2368;
    if (_2310)
    {
        float _2374 = rsqrt(_2306);
        _2370 = _2374;
    }
    float _2376 = _2370;
    if (_2310)
    {
        float _2378 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2354 = _2378;
    }
    float _2380 = _2354;
    float _2382 = _2380;
    if (_2310)
    {
        float _2384 = fma(_2346, _2380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2142 = _2384;
    }
    float _2386 = _2142;
    float _2388 = _2386;
    if (_2310)
    {
        float _2390 = _2360 + (-1.0);
        _2382 = _2390;
    }
    float _2392 = _2382;
    float _2394 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2396 = _2392;
    if (_2310)
    {
        float _2398 = _2392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2396 = _2398;
    }
    float _2400 = _2396;
    float _2402 = _2376;
    if (_2310)
    {
        float _2404 = _2376 * _2386;
        _2388 = _2404;
    }
    float _2406 = _2388;
    if (!_2310)
    {
        _2402 = _2366;
    }
    float _2408 = _2402;
    float _2410 = _2408;
    if (_2310)
    {
        float _2412 = fma(_2366, _2360, _2400);
        _2410 = _2412;
    }
    float _2414 = _2410;
    if (_2310)
    {
        float _2416 = _2298 * _2406;
        _2372 = _2416;
    }
    float _2418 = _2372;
    if (_2310)
    {
        float _2420 = _2300 * _2406;
        _2322 = _2420;
    }
    float _2422 = _2322;
    if (_2310)
    {
        float _2424 = _2418 * _2418;
        _2324 = _2424;
    }
    float _2426 = _2324;
    if (_2310)
    {
        float _2428 = _2422 * _2422;
        _2326 = _2428;
    }
    float _2430 = _2326;
    float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2434 = fma(_2294, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2432);
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2440 = fma(_2414, _2414, _2426);
    float _2442 = -_2436;
    float _2444 = _2442 + 1.0;
    float _2446 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2438);
    float _2448 = _2440 + _2430;
    float _2450 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2452 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2454 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2446);
    float _2456 = abs(_2444);
    float _2458 = log2(_2456);
    float _2460 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2450);
    float _2462 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2464 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2466 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2460);
    float _2468 = rsqrt(_2448);
    float _2470 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2472 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2462);
    float _2474 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2452);
    float _2476 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2478 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2472);
    float _2480 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2474);
    float _2482 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2484 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2486 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2488 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2490 = -_2476;
    float _2492 = fma(_2490, _2394, 1.0);
    float _2494 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2482);
    float _2496 = exp2(_2484);
    float _2498 = _2468 * _2418;
    float _2500 = _2468 * _2414;
    float _2502 = _2468 * _2422;
    float _2504 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2494);
    float _2506 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2508 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2504);
    float _2510 = -_2506;
    float _2512 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2510);
    float _2514 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2516 = log2(_2492);
    float _2518 = -_2502;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2512);
    float _2522 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2524 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2514);
    float _2526 = fma(_2520, -0.5, 0.5);
    float _2528 = fma(_2520, 0.5, 0.5);
    float _2530 = 1.0 / _2508;
    float _2532 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2522);
    float _2534 = _2500 + 1.0;
    float _2536 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2524);
    float _2538 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2540 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2532);
    float _2542 = -_2500;
    float _2544 = fma(_2496, _2534, _2542);
    float _2546 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2536);
    float _2548 = sqrt(_2526);
    float _2550 = fma(_2528, _2538, -0.212114393711090087890625);
    float _2552 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2540);
    float _2554 = _2516 * 0.693147182464599609375;
    float _2556 = fma(_2544, 0.5, 0.5);
    float _2558 = fma(_2528, _2550, 1.570728778839111328125);
    float _2560 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2562 = _2552 * _2530;
    float _2564 = _2546 * _2530;
    float _2566 = fma(_2564, 0.5, 0.5);
    float _2568 = _2548 * 0.636619746685028076171875;
    float _2570 = fma(_2562, -0.5, 0.5);
    float _2572 = -_2558;
    float _2574 = fma(_2568, _2572, 1.0);
    float3 _7375 = float3(_2566, _2570, _2560);
    float _2576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7375, float3(0.0), isnan(_7375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7375, float3(0.0), isnan(_7375)), level(0.0)).x;
    float3 _7386 = float3(_2566, _2570, _2560);
    float4 _2579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7386, float3(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7386, float3(0.0), isnan(_7386)), level(0.0)).xyzw;
    float _2581 = _2579.x;
    float _2583 = _2579.y;
    float _2585 = _2579.z;
    float _2587 = _2579.w;
    float2 _7403 = float2(_2574, _2556);
    float3 _2591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7403, float2(0.0), isnan(_7403)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7403, float2(0.0), isnan(_7403)), level(0.0)).xyz;
    float _2593 = _2591.x;
    float _2595 = _2591.y;
    float _2597 = _2591.z;
    float _2599 = float(uint(_1512));
    float _2601 = trunc(_1514);
    int _2603 = int(_2601);
    int _2605 = ~_1512;
    int _2607 = _2605 + 1;
    out.m_61.x = _870;
    out.m_61.y = _872;
    out.m_61.z = _874;
    out.m_61.w = _878;
    int _2609 = abs(_1418);
    float _2611 = _1392 * (-0.15915493667125701904296875);
    float _2613 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2615 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2617 = 1.0 / _2599;
    float _2619 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2615);
    bool _2621 = !_1188;
    float _2623 = _2621 ? 7.345489978790283203125 : 1.0;
    float _2625 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2619);
    float _2627 = float(uint(_2603));
    float _2629 = exp2(_2613);
    float _2631 = float(_2603);
    float _2633 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2625);
    bool _2635 = _2631 >= _1560;
    bool _2637 = isnan(_2631);
    bool _2639 = _2635 || _2637;
    bool _2641 = isnan(_1560);
    bool _2643 = _2639 || _2641;
    float _2645 = float(_2643);
    int _2647 = as_type<int>(_2617) + (-2);
    out.gl_Position.x = _2546;
    out.gl_Position.y = _2552;
    out.gl_Position.z = _2633;
    out.gl_Position.w = _2508;
    float _2649 = trunc(_2645);
    int _2651 = int(_2649);
    float _2653 = as_type<float>(_2647) * _2627;
    float _2655 = -_2629;
    float _2657 = _2655 + 1.0;
    float _2659 = trunc(_2653);
    float _2661 = precise::max(_2659, 0.0);
    uint _2664 = uint(_2661);
    int _2666 = _2607 * int(_2664);
    int _2668 = _2666 + _2603;
    float _2670 = float(uint(_2668));
    float _2672 = as_type<float>(_2647) * _2670;
    float _2674 = _2623 * _1184;
    float _2676 = floor(_2674);
    float _2678 = trunc(_2672);
    float _2680 = precise::max(_2678, 0.0);
    uint _2682 = uint(_2680);
    int _2684 = int(_2664) + int(_2682);
    float _2686 = -_2676;
    float _2688 = _2674 + _2686;
    int _2690 = _2607 * _2684;
    int _2692 = _2690 + _2603;
    int _2694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2696 = _2694 != 0;
    int _2698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2700 = _2698 != 0;
    bool _2702 = uint(_2692) >= uint(_1512);
    float _2704 = _2688 * _1560;
    float _2706 = _1570 * _152;
    int _2708 = _1512 + (-1);
    bool _2710 = !_2702;
    int _2712 = _2710 ? 0 : (-1);
    float _2714 = trunc(_2704);
    int _2716 = int(_2714);
    bool _2718 = _1512 == 0;
    int _2720 = ~_2684;
    int _2722 = _2720 + _2712;
    int _2724 = _2722 + 1;
    int _2726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2728 = _2726 != 0;
    int _2730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2732 = _2730 != 0;
    int _2734 = _1512 * _2724;
    int _2736 = _2734 + _2603;
    int _2738 = ~_2651;
    int _2740 = _2738 + 1;
    int _2742 = _2740 + 1;
    float _2744 = trunc(_2706);
    int _2746 = int(_2744);
    bool _2748 = !_2718;
    int _2750 = _2748 ? _2736 : (-1);
    bool _2752 = !_2696;
    int _2754 = _2752 ? 0 : 1;
    int _2756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2758 = _2756 != 0;
    int _2760 = _2750 * _2742;
    int _2762 = abs(_2754);
    float _2764 = in.m_63.x;
    int _2766 = abs(_1424);
    int _2768 = _2651 * _2708;
    int _2770 = _2768 + _2760;
    int _2772 = abs(_1430);
    int _2774 = _2770 * _2609;
    bool _2776 = !_2758;
    int _2778 = _2776 ? 0 : 1;
    int _2780 = _2716 * _2762;
    int _2782 = _2780 + _2603;
    int _2784 = _2746 * _2766;
    int _2786 = _2784 + _2774;
    int _2788 = abs(_2778);
    int _2790 = ~_1512;
    int _2792 = _2790 + 1;
    int _2794 = _2782 * _2772;
    int _2796 = _2794 + _2786;
    int _2798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2800 = _2798 != 0;
    int _2802 = _2716 * _2788;
    int _2804 = _2802 + _2796;
    float _2806 = in.m_53.w;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2808;
    int _2812 = as_type<int>(_2764);
    if (!_2732)
    {
        _882 = _2764;
    }
    float _2814 = _882;
    float _2816 = float(uint(_2804));
    float _2818 = as_type<float>(_2647) * _2816;
    int _2820 = ~_1512;
    int _2822 = _2820 + 1;
    float _2824 = trunc(_2818);
    float _2826 = precise::max(_2824, 0.0);
    uint _2828 = uint(_2826);
    bool _2830 = _2806 > 0.5;
    int _2832 = _2822 * int(_2828);
    int _2834 = _2832 + _2804;
    float _2836 = float(uint(_2834));
    float _2838 = as_type<float>(_2647) * _2836;
    float _2840 = in.m_63.y;
    float _2842 = trunc(_2838);
    float _2844 = precise::max(_2842, 0.0);
    uint _2846 = uint(_2844);
    int _2848 = int(_2828) + int(_2846);
    float _2850 = -_2840;
    float _2852 = _2850 + 1.0;
    int _2854 = _2792 * _2848;
    int _2856 = _2854 + _2804;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2860 = _2858 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2862 = float(uint(_2782));
    bool _2864 = uint(_2856) >= uint(_1512);
    float _2866 = 1.0 / _2860;
    int _2868 = _2830 ? as_type<int>(_2852) : as_type<int>(_2840);
    float _2870 = as_type<float>(_2647) * _2862;
    bool _2872 = !_2864;
    int _2874 = _2872 ? 0 : (-1);
    int _2876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2878 = _2876 != 0;
    bool _2880 = _1190 > 0.5;
    float _2882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2884 = ~_2848;
    int _2886 = _2884 + _2874;
    int _2888 = _2886 + 1;
    float _2890 = _2878 ? as_type<float>(_2868) : _2840;
    float _2892 = _2840;
    bool _2894 = _2880;
    bool _2896 = _2878;
    float _2898 = _2814;
    if (_2700)
    {
        float _2900 = _2880 ? _2852 : _2840;
        _2892 = _2900;
    }
    float _2902 = _2892;
    float _2904 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2906 = _1174 + _2904;
    if (_2728)
    {
        bool _2908 = _1218 > 0.5;
        _2894 = _2908;
    }
    bool _2910 = _2894;
    int _2912 = _1512 * _2888;
    int _2914 = _2912 + _2804;
    if (_2732)
    {
        bool _2916 = _1184 > 0.5;
        _2896 = _2916;
    }
    bool _2918 = _2896;
    float _2920 = _2810 * _2866;
    bool _2922 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2924 = isnan(_1174);
    bool _2926 = _2922 || _2924;
    bool _2928 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2930 = _2926 || _2928;
    float _2932 = float(_2930);
    float _2934 = trunc(_2870);
    float _2936 = precise::max(_2934, 0.0);
    uint _2938 = uint(_2936);
    bool _2940 = !_2718;
    int _2942 = _2940 ? _2914 : (-1);
    float _2944 = fma(_2920, _2906, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2946 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2948 = isnan(_1174);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2954 = _2950 || _2952;
    float _2956 = float(_2954);
    float _2958 = -_2932;
    float _2960 = _2958 + 1.0;
    int _2962 = _2942 >> 31;
    float _2964 = _2882 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2966 = ~_1512;
    int _2968 = _2966 + 1;
    float _2970 = _2956 * _2960;
    int _2972 = _2962 & 3;
    float _2974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2976 = _2970;
    if (!_2732)
    {
        _1276 = _2814;
    }
    float _2978 = _1276;
    float _2980 = fma(_2890, _2964, -0.5);
    int _2982 = _2942 + _2972;
    float _2984 = _2944 * _2970;
    float _2986 = _2978;
    if (_2732)
    {
        _2898 = _2764;
    }
    float _2988 = _2898;
    int _2990 = _2968 * int(_2938);
    int _2992 = _2990 + _2782;
    int _2994 = _2982 >> 2;
    float _2996 = -_2956;
    float _2998 = _2996 + 1.0;
    int _3000 = _2992;
    if (!_2728)
    {
        _2976 = _2988;
    }
    float _3002 = _2976;
    float _3004 = _3002;
    if (_2728)
    {
        float _3006 = -_2988;
        float _3008 = _3006 + 1.0;
        _2812 = as_type<int>(_3008);
    }
    int _3010 = _2812;
    int _3012 = _2994 << 4;
    int _3014 = _3012 + 368;
    float _3016 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2984);
    float _3018 = float(uint(_2992));
    if (_2732)
    {
        float _3020 = -_2988;
        float _3022 = _3020 + 1.0;
        _3000 = as_type<int>(_3022);
    }
    int _3024 = _3000;
    uint _3026 = uint(int(uint(_3014) >> uint(2)));
    uint _3028 = uint(int(uint(int(_3026)) >> uint(2)));
    int _3030 = int(_3026) & 3;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[int(_3028)][_3030];
    int _3034 = int(_3026) + 1;
    uint _3036 = uint(int(uint(_3034) >> uint(2)));
    int _3038 = _3034 & 3;
    float _3040 = (*spvDescriptorSet0.vp_c9)._m0[int(_3036)][_3038];
    if (_2728)
    {
        float _3042 = _2910 ? as_type<float>(_3010) : _2988;
        _3004 = _3042;
    }
    float _3044 = _3004;
    float _3046 = _2974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3048 = as_type<float>(_2647) * _3018;
    float _3050 = _2611 * 6.283185482025146484375;
    float _3052 = sin(_3050);
    if (_2732)
    {
        float _3054 = _2918 ? as_type<float>(_3024) : _2988;
        _2986 = _3054;
    }
    float _3056 = _2986;
    float _3058 = fma(_2932, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3016);
    int _3060 = _3014 + 8;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    uint _3064 = uint(int(uint(int(_3062)) >> uint(2)));
    int _3066 = int(_3062) & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = int(_3062) + 1;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    int _3074 = _3070 & 3;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[int(_3072)][_3074];
    float _3078 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2902, -0.5);
    int _3080 = _2942 & 3;
    bool _3082 = _3080 != 0;
    float _3084 = fma(_3046, _3044, -0.5);
    int _3086 = ~_1512;
    int _3088 = _3086 + 1;
    float _3090 = trunc(_3048);
    float _3092 = precise::max(_3090, 0.0);
    uint _3094 = uint(_3092);
    float _3096 = -_1306;
    float _3098 = fma(_1562, _3078, _3096);
    float _3100 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _3102 = _2942 & 3;
    bool _3104 = _3102 != 0;
    float _3106 = fma(_1554, _3100, _1302);
    bool _3108 = uint(_3102) > 1u;
    float _3110 = _2611 * 6.283185482025146484375;
    float _3112 = cos(_3110);
    int _3114 = _3082 ? 0 : 1;
    float _3116 = _3098 + 0.5;
    bool _3118 = _3102 != 3;
    float _3120 = _3106 + 0.5;
    bool _3122 = uint(_3102) >= 2u;
    int _3124 = ~_3114;
    int _3126 = _3124 + 1;
    int _3128 = _3126 + 1;
    int _3130 = int(_2938) + int(_3094);
    float _3132 = _3052 * _2980;
    int _3134 = _3128;
    if (!_3108)
    {
        int _3136 = ~_3114;
        int _3138 = _3136 + 1;
        _3134 = _3138;
    }
    int _3140 = _3134;
    int _3142 = _3088 * _3130;
    int _3144 = _3142 + _2782;
    float _3146 = _3112 * _2980;
    float _3148 = -_3132;
    float _3150 = fma(_3112, _3084, _3148);
    bool _3152 = uint(_3144) >= uint(_1512);
    float _3154 = fma(_3052, _3084, _3146);
    int _3156 = _3122 ? 0 : 1;
    float _3158 = fma(_1566, _3150, _1382);
    bool _3160 = !_3104;
    int _3162 = _3160 ? 0 : 1;
    float _3164 = -_1412;
    float _3166 = fma(_1494, _3154, _3164);
    int _3168 = abs(_3140);
    float _3170 = _3158 + 0.5;
    int _3172 = ~_3156;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    float _3178 = _3166 + 0.5;
    bool _3180 = _3102 != 3;
    int _3182 = abs(_3162);
    int _3184 = _3176;
    if (_3118)
    {
        int _3186 = ~_3156;
        int _3188 = _3186 + 1;
        _3184 = _3188;
    }
    int _3190 = _3184;
    out.m_65.x = _3120;
    out.m_65.y = _3116;
    out.m_65.z = _3170;
    out.m_65.w = _3178;
    bool _3192 = !_3180;
    int _3194 = _3192 ? 0 : (-1);
    int _3196 = abs(_3190);
    int _3198 = ~_3168;
    int _3200 = _3198 + 1;
    int _3202 = _3200 + 1;
    int _3204 = abs(_3194);
    int _3206 = ~_3182;
    int _3208 = _3206 + 1;
    int _3210 = _3208 + 1;
    int _3212 = _3202 * as_type<int>(_3040);
    bool _3214 = !_2800;
    int _3216 = _3214 ? 0 : 1;
    int _3218 = _3210 * as_type<int>(_3032);
    int _3220 = _3218 + _3212;
    int _3222 = ~_3196;
    int _3224 = _3222 + 1;
    int _3226 = _3224 + 1;
    int _3228 = abs(_3216);
    int _3230 = ~_3204;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    int _3236 = _3226 * as_type<int>(_3068);
    int _3238 = _3236 + _3220;
    int _3240 = ~_3228;
    int _3242 = _3240 + 1;
    int _3244 = _3242 + 1;
    float _3246 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3248 = !_3152;
    int _3250 = _3248 ? 0 : (-1);
    int _3252 = _3234 * as_type<int>(_3076);
    int _3254 = _3252 + _3238;
    float _3256 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3258 = _3246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3260 = ~_3130;
    int _3262 = _3260 + _3250;
    int _3264 = _3262 + 1;
    int _3266 = _3254 * _3244;
    float _3268 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3270 = _3256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3272 = _3058 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3274 = _1512 * _3264;
    int _3276 = _3274 + _2782;
    float _3278 = _3268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3280 = _2272 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3282 = _2633 + _2508;
    float _3284 = _2546 + _2508;
    bool _3286 = !_2718;
    int _3288 = _3286 ? _3276 : (-1);
    out.m_67.x = _3278;
    out.m_67.y = _3270;
    out.m_67.z = _3258;
    out.m_67.w = _3272;
    bool _3290 = _2272 > 0.0;
    bool _3292 = isnan(_2272);
    bool _3294 = _3290 || _3292;
    bool _3296 = isnan(0.0);
    bool _3298 = _3294 || _3296;
    float _3300 = _3282 * 0.5;
    int _3302 = _3288 * _3228;
    int _3304 = _3302 + _3266;
    float _3306 = _2508 * 0.5;
    float _3308 = _3284 * 0.5;
    float _3310 = fma(_2552, -0.5, _3306);
    float _3312 = float(_3304);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _3314 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3316 = _3280 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3312;
    float _3318 = _3314 * _2576;
    float _3320 = -_3314;
    float _3322 = _3320 + 1.0;
    out.m_73.x = _3308;
    out.m_73.y = _3310;
    out.m_73.z = _3300;
    out.m_73.w = _2508;
    float _3324 = _2587 * _3318;
    float _3326 = _2597 * _3318;
    float _3328 = _2587 * _3322;
    out.m_49.x = _3316;
    float _3330 = fma(_2593, _3324, _2581);
    float _3332 = fma(_2595, _3324, _2583);
    float _3334 = fma(_2587, _3326, _2585);
    out.m_75.x = _3330;
    out.m_75.y = _3332;
    out.m_75.z = _3334;
    out.m_75.w = _3328;
    if (_3298)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3336 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3336;
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
    bool _1172 = false;
    bool _902 = false;
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
        float _3405 = as_type<float>(_118);
        out.gl_Position.z = _3405;
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
        float _3460 = as_type<float>(_144);
        out.gl_Position.z = _3460;
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
    float _882 = _874;
    float _900;
    if (!_880)
    {
        float _884 = in.m_53.x;
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _888 = _884 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _892 = _890 * _886;
        float _894 = floor(_892);
        float _896 = -_894;
        float _898 = _892 + _896;
        _900 = _898;
        _902 = true;
    }
    else
    {
        _900 = _156;
    }
    _902 = false;
    float _904 = _900;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _908 = _904 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _912 = _904 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _916 = _904 + _914;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _934 = 1.0 / _920;
    bool _936 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _938 = isnan(_904);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = 1.0 / _924;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _952 = _904 + _950;
    float _954 = 1.0 / _928;
    float _956 = _908 * _934;
    bool _958 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _960 = isnan(_904);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    bool _970 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _972 = 1.0 / _932;
    float _974 = _912 * _948;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _980;
    float _984 = fma(_978, _956, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _986 = fma(_982, _956, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _988 = _916 * _954;
    float _990 = -_946;
    float _992 = _990 + 1.0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _994;
    float _998 = fma(_996, _956, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1000 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1002 = isnan(_904);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _952 * _972;
    bool _1014 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1016 = isnan(_904);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _968 * _992;
    float _1028 = -_968;
    float _1030 = _1028 + 1.0;
    bool _1032 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1034 = isnan(_904);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = -_1024;
    float _1046 = _1044 + 1.0;
    float _1048 = _1024 * _1030;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1058 = _1010 * _1046;
    float _1060 = -_1010;
    float _1062 = _1060 + 1.0;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1068 = fma(_1052, _974, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1070 = fma(_1056, _974, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1072 = _1042 * _1062;
    float _1074 = fma(_1066, _974, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1076 = _986 * _1072;
    float _1078 = _984 * _1072;
    float _1080 = -_1042;
    float _1082 = _1080 + 1.0;
    float _1084 = _998 * _1072;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1094;
    float _1098 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1078);
    float _1100 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1076);
    float _1102 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1084);
    float _1104 = fma(_1088, _988, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1106 = fma(_1092, _988, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1108 = fma(_1096, _988, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1110 = fma(_1068, _1058, _1098);
    float _1112 = fma(_1074, _1058, _1100);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1122 = fma(_1070, _1058, _1102);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1128 = fma(_1104, _1048, _1110);
    float _1130 = fma(_1116, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1132 = fma(_1120, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1134 = fma(_1106, _1048, _1112);
    float _1136 = fma(_1126, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1138 = fma(_1108, _1048, _1122);
    float _1140 = fma(_1130, _1026, _1128);
    float _1142 = fma(_1132, _1026, _1134);
    float _1144 = fma(_1136, _1026, _1138);
    float _1146 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1140);
    float _1148 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1142);
    float _1150 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1144);
    bool _1152 = !_970;
    float _1170;
    if (!_1152)
    {
        float _1154 = in.m_53.x;
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1158 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1162 = _1160 * _1156;
        float _1164 = floor(_1162);
        float _1166 = -_1164;
        float _1168 = _1162 + _1166;
        _1170 = _1168;
        _1172 = true;
    }
    else
    {
        _1170 = _156;
    }
    _1172 = false;
    float _1174 = _1170;
    float _1176 = in.m_42.x;
    float _1178 = in.m_42.y;
    float _1180 = in.m_42.z;
    float _1182 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1184 = in.m_53.x;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1188 = _1186 != 0;
    float _1190 = in.m_53.y;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1196 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1198 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1196);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1202 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1204 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1206 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1198);
    float _1210 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1212 = _1184 * 2.0;
    float _1214 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1206);
    float _1216 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1202);
    float _1218 = in.m_53.z;
    float _1220 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1222 = -_1192;
    float _1224 = fma(_1210, 2.0, _1222);
    float _1226 = _1190 * 2.0;
    float _1228 = floor(_1212);
    float _1230 = fma(_1220, -2.0, _1194);
    float _1232 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1204);
    float _1234 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1214);
    float _1236 = _1184 + _1190;
    float _1238 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1240 = floor(_1226);
    float _1242 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1232);
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1246 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1238);
    float _1248 = _1236 + (-1.0);
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1252 = _1228 > 0.0;
    float _1254 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1246);
    bool _1256 = _1228 >= 0.0;
    bool _1258 = isnan(_1228);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(0.0);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1216);
    float _1268 = _1246;
    float _1270 = _1216;
    float _1272 = _1180;
    float _1274 = _1232;
    float _1276 = _1190;
    if (!_1188)
    {
        _1268 = _1190;
    }
    float _1278 = _1268;
    float _1280 = _1218 * 2.0;
    float _1282 = _1278;
    if (!_1188)
    {
        _1270 = _1184;
    }
    float _1284 = _1270;
    float _1286 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1288 = _1284;
    if (!_1188)
    {
        _1272 = _1218;
    }
    float _1290 = _1272;
    float _1292 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1294 = int(_1292);
    float _1296 = _1290;
    if (_1188)
    {
        _1282 = _1184;
    }
    float _1298 = _1282;
    float _1300 = -_100;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1224);
    if (_1188)
    {
        _1288 = _1218;
    }
    float _1304 = _1288;
    float _1306 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1230);
    bool _1308 = _1240 > 0.0;
    float _1310 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1312 = _1240;
    if (!_1188)
    {
        _1274 = _1290;
    }
    float _1314 = _1274;
    float _1316 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1244);
    float _1318 = -_1200;
    float _1320 = fma(_1310, 2.0, _1318);
    float _1322 = _1314;
    if (_1188)
    {
        _1322 = _1190;
    }
    float _1324 = _1322;
    float _1326 = floor(_1280);
    bool _1328 = _1240 >= 0.0;
    bool _1330 = isnan(_1240);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(0.0);
    bool _1336 = _1332 || _1334;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1188)
    {
        _1312 = _1190;
    }
    float _1340 = _1312;
    float _1342 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1344 = _1264 ? 0 : 1;
    float _1346 = _1184 + _1218;
    float _1348 = fma(_1342, -2.0, _1338);
    float _1350 = _1340;
    if (_1188)
    {
        _1350 = _1184;
    }
    float _1352 = _1350;
    float _1354 = _1346 + (-1.0);
    int _1356 = _1336 ? 0 : 1;
    float _1358 = rsqrt(_1208);
    int _1360 = ~_1344;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    float _1366 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1250);
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1378 = _1376 != 0;
    float _1380 = -_100;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1320);
    int _1384 = _1364;
    if (!_1252)
    {
        int _1386 = ~_1344;
        int _1388 = _1386 + 1;
        _1384 = _1388;
    }
    int _1390 = _1384;
    float _1392 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1316);
    int _1394 = ~_1356;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    float _1400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1402 = log2(_1400);
    int _1404 = _1398;
    if (!_1308)
    {
        int _1406 = ~_1356;
        int _1408 = _1406 + 1;
        _1404 = _1408;
    }
    int _1410 = _1404;
    float _1412 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1348);
    float _1414 = _1242 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1416 = !_1374;
    int _1418 = _1416 ? 0 : 1;
    float _1420 = _1234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1422 = !_1370;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1428 = !_1378;
    int _1430 = _1428 ? 0 : 1;
    float _1432 = _1190 + _1218;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1440 = _1438 != 0;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1444 = _1442 != 0;
    float _1446 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1448 = _1432 + (-1.0);
    bool _1450 = !_1444;
    int _1452 = _1450 ? 0 : 1;
    float _1454 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1456 = !_1440;
    int _1458 = _1456 ? 0 : 1;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1462 = abs(_1452);
    float _1464 = float(_1294);
    bool _1466 = _1326 > 0.0;
    bool _1468 = _1326 >= 0.0;
    bool _1470 = isnan(_1326);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan(0.0);
    bool _1476 = _1472 || _1474;
    float _1478 = _1402 * _100;
    float _1480 = 1.0 / _1464;
    if (_1188)
    {
        _1296 = _1190;
    }
    float _1482 = _1296;
    int _1484 = abs(_1458);
    float _1486 = float(_1410);
    float _1488 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1460);
    float _1490 = float(_1462);
    float _1492 = exp2(_1478);
    float _1494 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1488);
    float _1496 = float(_1390);
    float _1498 = _1490 * _1486;
    float _1500 = in.m_57.x;
    float _1502 = in.m_57.y;
    float _1504 = in.m_57.z;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1508 = 1.0 + _1506;
    float _1510 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1512 = int(_1510);
    float _1514 = _1480 * _100;
    float _1516 = float(_1484);
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1520 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1522 = isnan(1.0);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1528 = _1524 || _1526;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1532 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1534 = isnan(0.0);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1540 = _1536 || _1538;
    float _1542 = 1.0 / _1508;
    float _1544 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1518);
    float _1546 = -_1492;
    float _1548 = _1546 + 1.0;
    float _1550 = _1516 * _1496;
    float _1552 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    float _1554 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1544);
    int _1556 = _1476 ? 0 : 1;
    float _1558 = _1550 * (-2.0);
    float _1560 = float(_1512);
    float _1562 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1552);
    float _1564 = _1540 ? _1548 : 0.0;
    float _1566 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1366);
    float _1568 = fma(_1454, _1558, _1454);
    float _1570 = _1560 * _100;
    float _1572 = fma(_1558, _1502, _1502);
    float _1574 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1528)
    {
        float _1576 = _1564 * _1542;
        _110 = _1576;
    }
    float _1578 = _110;
    float _1580 = _1190 + (-0.5);
    int _1582 = ~_1556;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    int _1588 = _1586;
    if (!_1466)
    {
        int _1590 = ~_1556;
        int _1592 = _1590 + 1;
        _1588 = _1592;
    }
    int _1594 = _1588;
    float _1596 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1572);
    float _1598 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1600 = _1574 * _1574;
    float _1602 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1604 = fma(_1598, _1598, _1600);
    bool _1606 = !_1436;
    int _1608 = _1606 ? 0 : 1;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1610;
    float _1614 = _1498 * (-2.0);
    float _1616 = fma(_1602, _1602, _1604);
    int _1618 = abs(_1608);
    float _1620 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1622 = fma(_1426, _1614, _1426);
    float _1624 = fma(_1614, _1504, _1504);
    float _1626 = fma(_1568, _1578, _1596);
    float _1628 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1630 = _1218 + (-0.5);
    float _1632 = _1626 * 0.15915493667125701904296875;
    float _1634 = float(_1594);
    float _1636 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1620);
    float _1638 = float(_1618);
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1624);
    float _1642 = rsqrt(_1616);
    float _1644 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1636);
    float _1646 = _1638 * _1634;
    float _1648 = _1646 * (-2.0);
    float _1650 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1652 = fma(_1622, _1578, _1640);
    float _1654 = _1184 + (-0.5);
    float _1656 = in.m_59.x;
    float _1658 = in.m_59.y;
    float _1660 = in.m_59.z;
    float _1662 = -_1650;
    float _1664 = _1446 + _1662;
    float _1666 = fma(_1648, _1500, _1500);
    float _1668 = 1.0 / _1612;
    float _1670 = fma(_1286, _1648, _1286);
    bool _1672 = _1650 >= _1446;
    bool _1674 = isnan(_1650);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan(_1446);
    bool _1680 = _1676 || _1678;
    float _1682 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1666);
    float _1684 = abs(_1664);
    float _1686 = precise::max(_1684, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1688 = _1652 * 0.15915493667125701904296875;
    float _1690 = _1598 * _1642;
    float _1692 = fma(_1670, _1578, _1682);
    float _1694 = precise::min(_1686, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1696 = _1688 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    bool _1700 = !_1680;
    float _1702 = _1700 ? 1.0 : (-1.0);
    float _1704 = _1692 * 0.15915493667125701904296875;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1708 = _1694 + _1706;
    float _1710 = _1574 * _1642;
    float _1712 = _1602 * _1642;
    float _1714 = _1708 * _1668;
    float _1716 = _1688 * 6.283185482025146484375;
    float _1718 = cos(_1716);
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1656);
    float _1722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1660);
    float _1724 = _1702 * _1714;
    float _1726 = _1632 * 6.283185482025146484375;
    float _1728 = sin(_1726);
    float _1730 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1732 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1734 = _1732 * _1724;
    float _1736 = _1632 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = _1704 * 6.283185482025146484375;
    float _1742 = sin(_1740);
    float _1744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1658);
    float _1746 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1748 = _1730 * _1722;
    float _1750 = _1182 * _1744;
    float _1752 = _1746 * _1720;
    float _1754 = _1734 * 0.15915493667125701904296875;
    float _1756 = _1704 * 6.283185482025146484375;
    float _1758 = cos(_1756);
    float _1760 = _1718 * _1750;
    float _1762 = _1738 * _1718;
    float _1764 = _1728 * _1718;
    float _1766 = _1742 * _1728;
    float _1768 = -_1750;
    float _1770 = _1698 * _1768;
    float _1772 = _1754 * 6.283185482025146484375;
    float _1774 = cos(_1772);
    float _1776 = fma(_1762, _1752, _1770);
    float _1778 = _1758 * _1738;
    float _1780 = _1758 * _1728;
    float _1782 = _1758 * _1760;
    float _1784 = _1742 * _1738;
    float _1786 = fma(_1698, _1778, _1766);
    float _1788 = _1742 * _1760;
    float _1790 = fma(_1764, _1748, _1776);
    float _1792 = -_1784;
    float _1794 = fma(_1698, _1780, _1792);
    float _1796 = fma(_1786, _1752, _1782);
    float _1798 = -_1780;
    float _1800 = fma(_1698, _1784, _1798);
    float _1802 = _1754 * 6.283185482025146484375;
    float _1804 = sin(_1802);
    float _1806 = fma(_1698, _1766, _1778);
    float _1808 = fma(_1794, _1748, _1796);
    float _1810 = fma(_1800, _1752, _1788);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1814 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1816 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1818 = fma(_1806, _1748, _1810);
    float _1820 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1812);
    float _1822 = -_1774;
    float _1824 = _1822 + 1.0;
    float _1826 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1814);
    float _1828 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1816);
    float _1830 = _1712 * _1712;
    float _1832 = _1710 * _1824;
    float _1834 = _1690 * _1804;
    float _1836 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1820);
    float _1838 = _1710 * _1804;
    float _1840 = fma(_1824, _1830, _1774);
    float _1842 = _1712 * _1804;
    float _1844 = _1690 * _1824;
    float _1846 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1826);
    float _1848 = fma(_1712, _1832, _1834);
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1852 = -_1842;
    float _1854 = fma(_1710, _1844, _1852);
    float _1856 = -_1838;
    float _1858 = fma(_1712, _1844, _1856);
    float _1860 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1862 = _1850 * _1848;
    float _1864 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1828);
    float _1866 = fma(_1690, _1844, _1774);
    float _1868 = _1850 * _1854;
    float _1870 = fma(_1860, _1858, _1862);
    float _1872 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1874 = fma(_1710, _1844, _1842);
    float _1876 = fma(_1860, _1866, _1868);
    float _1878 = fma(_1712, _1844, _1838);
    float _1880 = fma(_1872, _1840, _1870);
    float _1882 = fma(_1710, _1832, _1774);
    float _1884 = -_1834;
    float _1886 = fma(_1712, _1832, _1884);
    float _1888 = fma(_1872, _1878, _1876);
    float _1890 = _1420 + _1880;
    float _1892 = _1850 * _1882;
    float _1894 = _1628 + _1888;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1898 = _1890 + _1896;
    float _1900 = fma(_1860, _1874, _1892);
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1904 = _1894 + _1902;
    float _1906 = _1898 * _1898;
    float _1908 = fma(_1872, _1886, _1900);
    float _1910 = fma(_1904, _1904, _1906);
    float _1912 = _1414 + _1908;
    float _1914 = sqrt(_1910);
    bool _1916 = _1914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1918 = _1908;
    float _1920 = _1710;
    float _1922 = _1900;
    if (!_1916)
    {
        _1918 = _1894;
    }
    float _1924 = _1918;
    float _1926 = _1924;
    if (!_1916)
    {
        _1920 = _1890;
    }
    float _1928 = _1920;
    float _1930 = _1928;
    if (!_1916)
    {
        _1922 = _1912;
    }
    float _1932 = _1922;
    bool _1934 = !_1916;
    float _1936 = _1932;
    if (!_1934)
    {
        float _1938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1942 = _1914 + _1940;
        float _1944 = rsqrt(_1910);
        float _1946 = _1942 * _1938;
        float _1948 = _1912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = _1946 * 0.15915493667125701904296875;
        float _1952 = _1950 * 6.283185482025146484375;
        float _1954 = sin(_1952);
        float _1956 = _1950 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = fma(_1954, _1948, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1962 = _1944 * _1960;
        float _1964 = _1958 + (-1.0);
        float _1966 = fma(_1904, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1968 = fma(_1898, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1970 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1972 = fma(_1912, _1958, _1970);
        _1936 = _1972;
        _1926 = _1966;
        _1930 = _1968;
    }
    float _1974 = _1936;
    float _1976 = _1926;
    float _1978 = _1930;
    float _1980 = -_1414;
    float _1982 = _1980 + _1974;
    float _1984 = -_1628;
    float _1986 = _1984 + _1976;
    float _1988 = -_1420;
    float _1990 = _1988 + _1978;
    float _1992 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1994 = _1982 * _1982;
    float _1996 = fma(_1986, _1986, _1994);
    float _1998 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1992);
    float _2000 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2002 = fma(_1990, _1990, _1996);
    float _2004 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1998);
    float _2006 = sqrt(_2002);
    float _2008 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2010 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2000);
    float _2012 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2010);
    bool _2014 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.5);
    bool _2022 = _2018 || _2020;
    float _2024 = 1.0 / _2008;
    float _2026 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2028 = _2026 + _2008;
    bool _2030 = _2006 > 0.0;
    bool _2032 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan(0.5);
    bool _2040 = _2036 || _2038;
    float _2042 = _2028 * _2024;
    float _2044 = _2042 * 0.5;
    bool _2046 = !_2030;
    float _2048 = _1974;
    float _2050 = _1986;
    float _2052 = _1976;
    float _2054 = _1978;
    float _2056 = _2008;
    float _2058 = _1982;
    float _2060 = _1990;
    float _2062 = _2002;
    float _2064 = _2026;
    float _2066 = _2024;
    if (!_2046)
    {
        float _2068 = _172 * _172;
        float _2070 = rsqrt(_2002);
        float _2072 = fma(_170, _170, _2068);
        float _2074 = fma(_174, _174, _2072);
        float _2076 = sqrt(_2074);
        float _2078 = _1986 * _2070;
        float _2080 = _1982 * _2070;
        bool _2082 = _2076 > 0.0;
        float _2084 = _1990 * _2070;
        bool _2086 = !_2082;
        _2056 = _2074;
        _2062 = _2070;
        _2064 = _2084;
        if (!_2086)
        {
            float _2088 = rsqrt(_2074);
            float _2090 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2092 = _172 * _2088;
            float _2094 = _170 * _2088;
            float _2096 = _174 * _2088;
            float _2098 = _2080 * _2092;
            float _2100 = fma(_2078, _2094, _2098);
            float _2102 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2104 = fma(_2084, _2096, _2100);
            float _2106 = _2104 * _2102;
            float _2108 = fma(_170, _2106, _1976);
            float _2110 = fma(_172, _2106, _1974);
            float _2112 = fma(_174, _2106, _1978);
            _2048 = _2110;
            _2050 = _2100;
            _2052 = _2108;
            _2054 = _2112;
            _2058 = _2106;
            _2060 = _2098;
            _2062 = _2102;
        }
    }
    float _2114 = _2048;
    float _2116 = _2050;
    float _2118 = _2052;
    float _2120 = _2054;
    float _2122 = _2056;
    float _2124 = _2058;
    float _2126 = _2060;
    float _2128 = _2062;
    float _2130 = _2064;
    float _2132 = _2122;
    float _2134 = _2124;
    float _2136 = _2118;
    float _2138 = _2120;
    float _2140 = _2116;
    float _2142 = _2130;
    if (_2040)
    {
        _2132 = 1.0;
    }
    float _2144 = _2132;
    float _2146 = _2144;
    if (_2022)
    {
        _2134 = _2114;
    }
    float _2148 = _2134;
    float _2150 = _2148;
    if (!_2022)
    {
        float _2152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2154 = _1414 + _2152;
        float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2158 = _1628 + _2156;
        float _2160 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2162 = -_1414;
        float _2164 = _2162 + _2114;
        float _2166 = _2154 * _2154;
        float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2170 = _1420 + _2168;
        float _2172 = fma(_2158, _2158, _2166);
        float _2174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2176 = fma(_2170, _2170, _2172);
        float _2178 = sqrt(_2176);
        float _2180 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2182 = precise::min(_2178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2184 = _2182 * _2174;
        float _2186 = -_1628;
        float _2188 = _2186 + _2118;
        float _2190 = -_1420;
        float _2192 = _2190 + _2120;
        float _2194 = _2180 * _2184;
        float _2196 = fma(_2188, _2194, _1628);
        float _2198 = fma(_2164, _2194, _1414);
        float _2200 = fma(_2192, _2194, _1420);
        _2150 = _2198;
        _2136 = _2196;
        _2138 = _2200;
        _2140 = _2194;
    }
    float _2202 = _2150;
    float _2204 = _2136;
    float _2206 = _2138;
    float _2208 = _2140;
    float _2210 = _2208;
    if (!_2040)
    {
        float _2212 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2214 = _2212 * 0.15915493667125701904296875;
        float _2216 = _2214 * 6.283185482025146484375;
        float _2218 = cos(_2216);
        float _2220 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2222 = _2220 * 0.15915493667125701904296875;
        float _2224 = _2214 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2230 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2228);
        float _2232 = 1.0 / _2218;
        float _2234 = _2222 * 6.283185482025146484375;
        float _2236 = cos(_2234);
        float _2238 = _2226 * _2232;
        float _2240 = 1.0 / _2230;
        float _2242 = _2236 * _2238;
        float _2244 = _2222 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2250 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2248;
        float _2252 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2254 = _2240 * _2252;
        float _2256 = 1.0 / _2242;
        float _2258 = 1.0 / _2250;
        float _2260 = _2246 * _2256;
        float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2264 = fma(_2260, _2254, _2262);
        float _2266 = _2264 * _2258;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        _2210 = _2214;
        _2146 = _2268;
    }
    float _2270 = _2210;
    float _2272 = _2146;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2276 = _2202 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2280 = _2204 + _2278;
    float _2282 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2284 = _2206 + _2282;
    float _2286 = _2276 * _2276;
    float _2288 = fma(_2280, _2280, _2286);
    float _2290 = fma(_2284, _2284, _2288);
    float _2292 = rsqrt(_2290);
    float _2294 = sqrt(_2290);
    float _2296 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2298 = _2280 * _2296;
    float _2300 = _2284 * _2296;
    float _2302 = _2298 * _2298;
    float _2304 = _2300 * _2300;
    float _2306 = _2302 + _2304;
    float _2308 = sqrt(_2306);
    bool _2310 = _2308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2314 = _2308 + _2312;
    float _2316 = _2126;
    float _2318 = _2314;
    float _2320 = _2276;
    float _2322 = _2300;
    float _2324 = _2302;
    float _2326 = _2304;
    if (_2310)
    {
        float _2328 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2316 = _2328;
    }
    float _2330 = _2316;
    if (_2310)
    {
        float _2332 = _2314 * _2330;
        _2318 = _2332;
    }
    float _2334 = _2318;
    if (_2310)
    {
        float _2336 = _2334 * 0.15915493667125701904296875;
        _2066 = _2336;
    }
    float _2338 = _2066;
    float _2340 = _2128;
    if (_2310)
    {
        float _2342 = _2338 * 6.283185482025146484375;
        float _2344 = sin(_2342);
        _2340 = _2344;
    }
    float _2346 = _2340;
    float _2348 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2350 = precise::max(0.0, _2348);
    float _2352 = _2270;
    float _2354 = _2350;
    if (_2310)
    {
        float _2356 = _2338 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        _2352 = _2358;
    }
    float _2360 = _2352;
    float _2362 = -_2296;
    float _2364 = -_2350;
    float _2366 = fma(_2276, _2362, _2364);
    if (!_2310)
    {
        _2320 = _2298;
    }
    float _2368 = _2320;
    float _2370 = _2348;
    float _2372 = _2368;
    if (_2310)
    {
        float _2374 = rsqrt(_2306);
        _2370 = _2374;
    }
    float _2376 = _2370;
    if (_2310)
    {
        float _2378 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2354 = _2378;
    }
    float _2380 = _2354;
    float _2382 = _2380;
    if (_2310)
    {
        float _2384 = fma(_2346, _2380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2142 = _2384;
    }
    float _2386 = _2142;
    float _2388 = _2386;
    if (_2310)
    {
        float _2390 = _2360 + (-1.0);
        _2382 = _2390;
    }
    float _2392 = _2382;
    float _2394 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2396 = _2392;
    if (_2310)
    {
        float _2398 = _2392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2396 = _2398;
    }
    float _2400 = _2396;
    float _2402 = _2376;
    if (_2310)
    {
        float _2404 = _2376 * _2386;
        _2388 = _2404;
    }
    float _2406 = _2388;
    if (!_2310)
    {
        _2402 = _2366;
    }
    float _2408 = _2402;
    float _2410 = _2408;
    if (_2310)
    {
        float _2412 = fma(_2366, _2360, _2400);
        _2410 = _2412;
    }
    float _2414 = _2410;
    if (_2310)
    {
        float _2416 = _2298 * _2406;
        _2372 = _2416;
    }
    float _2418 = _2372;
    if (_2310)
    {
        float _2420 = _2300 * _2406;
        _2322 = _2420;
    }
    float _2422 = _2322;
    if (_2310)
    {
        float _2424 = _2418 * _2418;
        _2324 = _2424;
    }
    float _2426 = _2324;
    if (_2310)
    {
        float _2428 = _2422 * _2422;
        _2326 = _2428;
    }
    float _2430 = _2326;
    float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2434 = fma(_2294, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2432);
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2440 = fma(_2414, _2414, _2426);
    float _2442 = -_2436;
    float _2444 = _2442 + 1.0;
    float _2446 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2438);
    float _2448 = _2440 + _2430;
    float _2450 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2452 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2454 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2446);
    float _2456 = abs(_2444);
    float _2458 = log2(_2456);
    float _2460 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2450);
    float _2462 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2464 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2466 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2460);
    float _2468 = rsqrt(_2448);
    float _2470 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2472 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2462);
    float _2474 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2452);
    float _2476 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2478 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2472);
    float _2480 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2474);
    float _2482 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2484 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2486 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2488 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2490 = -_2476;
    float _2492 = fma(_2490, _2394, 1.0);
    float _2494 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2482);
    float _2496 = exp2(_2484);
    float _2498 = _2468 * _2418;
    float _2500 = _2468 * _2414;
    float _2502 = _2468 * _2422;
    float _2504 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2494);
    float _2506 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2508 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2504);
    float _2510 = -_2506;
    float _2512 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2510);
    float _2514 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2516 = log2(_2492);
    float _2518 = -_2502;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2512);
    float _2522 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2524 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2514);
    float _2526 = fma(_2520, -0.5, 0.5);
    float _2528 = fma(_2520, 0.5, 0.5);
    float _2530 = 1.0 / _2508;
    float _2532 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2522);
    float _2534 = _2500 + 1.0;
    float _2536 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2524);
    float _2538 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2540 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2532);
    float _2542 = -_2500;
    float _2544 = fma(_2496, _2534, _2542);
    float _2546 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2536);
    float _2548 = sqrt(_2526);
    float _2550 = fma(_2528, _2538, -0.212114393711090087890625);
    float _2552 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2540);
    float _2554 = _2516 * 0.693147182464599609375;
    float _2556 = fma(_2544, 0.5, 0.5);
    float _2558 = fma(_2528, _2550, 1.570728778839111328125);
    float _2560 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2562 = _2552 * _2530;
    float _2564 = _2546 * _2530;
    float _2566 = fma(_2564, 0.5, 0.5);
    float _2568 = _2548 * 0.636619746685028076171875;
    float _2570 = fma(_2562, -0.5, 0.5);
    float _2572 = -_2558;
    float _2574 = fma(_2568, _2572, 1.0);
    float3 _7375 = float3(_2566, _2570, _2560);
    float _2576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7375, float3(0.0), isnan(_7375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7375, float3(0.0), isnan(_7375)), level(0.0)).x;
    float3 _7386 = float3(_2566, _2570, _2560);
    float4 _2579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7386, float3(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7386, float3(0.0), isnan(_7386)), level(0.0)).xyzw;
    float _2581 = _2579.x;
    float _2583 = _2579.y;
    float _2585 = _2579.z;
    float _2587 = _2579.w;
    float2 _7403 = float2(_2574, _2556);
    float3 _2591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7403, float2(0.0), isnan(_7403)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7403, float2(0.0), isnan(_7403)), level(0.0)).xyz;
    float _2593 = _2591.x;
    float _2595 = _2591.y;
    float _2597 = _2591.z;
    float _2599 = float(uint(_1512));
    float _2601 = trunc(_1514);
    int _2603 = int(_2601);
    int _2605 = ~_1512;
    int _2607 = _2605 + 1;
    out.m_61.x = _870;
    out.m_61.y = _872;
    out.m_61.z = _874;
    out.m_61.w = _878;
    int _2609 = abs(_1418);
    float _2611 = _1392 * (-0.15915493667125701904296875);
    float _2613 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2615 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2617 = 1.0 / _2599;
    float _2619 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2615);
    bool _2621 = !_1188;
    float _2623 = _2621 ? 7.345489978790283203125 : 1.0;
    float _2625 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2619);
    float _2627 = float(uint(_2603));
    float _2629 = exp2(_2613);
    float _2631 = float(_2603);
    float _2633 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2625);
    bool _2635 = _2631 >= _1560;
    bool _2637 = isnan(_2631);
    bool _2639 = _2635 || _2637;
    bool _2641 = isnan(_1560);
    bool _2643 = _2639 || _2641;
    float _2645 = float(_2643);
    int _2647 = as_type<int>(_2617) + (-2);
    out.gl_Position.x = _2546;
    out.gl_Position.y = _2552;
    out.gl_Position.z = _2633;
    out.gl_Position.w = _2508;
    float _2649 = trunc(_2645);
    int _2651 = int(_2649);
    float _2653 = as_type<float>(_2647) * _2627;
    float _2655 = -_2629;
    float _2657 = _2655 + 1.0;
    float _2659 = trunc(_2653);
    float _2661 = precise::max(_2659, 0.0);
    uint _2664 = uint(_2661);
    int _2666 = _2607 * int(_2664);
    int _2668 = _2666 + _2603;
    float _2670 = float(uint(_2668));
    float _2672 = as_type<float>(_2647) * _2670;
    float _2674 = _2623 * _1184;
    float _2676 = floor(_2674);
    float _2678 = trunc(_2672);
    float _2680 = precise::max(_2678, 0.0);
    uint _2682 = uint(_2680);
    int _2684 = int(_2664) + int(_2682);
    float _2686 = -_2676;
    float _2688 = _2674 + _2686;
    int _2690 = _2607 * _2684;
    int _2692 = _2690 + _2603;
    int _2694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2696 = _2694 != 0;
    int _2698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2700 = _2698 != 0;
    bool _2702 = uint(_2692) >= uint(_1512);
    float _2704 = _2688 * _1560;
    float _2706 = _1570 * _152;
    int _2708 = _1512 + (-1);
    bool _2710 = !_2702;
    int _2712 = _2710 ? 0 : (-1);
    float _2714 = trunc(_2704);
    int _2716 = int(_2714);
    bool _2718 = _1512 == 0;
    int _2720 = ~_2684;
    int _2722 = _2720 + _2712;
    int _2724 = _2722 + 1;
    int _2726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2728 = _2726 != 0;
    int _2730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2732 = _2730 != 0;
    int _2734 = _1512 * _2724;
    int _2736 = _2734 + _2603;
    int _2738 = ~_2651;
    int _2740 = _2738 + 1;
    int _2742 = _2740 + 1;
    float _2744 = trunc(_2706);
    int _2746 = int(_2744);
    bool _2748 = !_2718;
    int _2750 = _2748 ? _2736 : (-1);
    bool _2752 = !_2696;
    int _2754 = _2752 ? 0 : 1;
    int _2756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2758 = _2756 != 0;
    int _2760 = _2750 * _2742;
    int _2762 = abs(_2754);
    float _2764 = in.m_63.x;
    int _2766 = abs(_1424);
    int _2768 = _2651 * _2708;
    int _2770 = _2768 + _2760;
    int _2772 = abs(_1430);
    int _2774 = _2770 * _2609;
    bool _2776 = !_2758;
    int _2778 = _2776 ? 0 : 1;
    int _2780 = _2716 * _2762;
    int _2782 = _2780 + _2603;
    int _2784 = _2746 * _2766;
    int _2786 = _2784 + _2774;
    int _2788 = abs(_2778);
    int _2790 = ~_1512;
    int _2792 = _2790 + 1;
    int _2794 = _2782 * _2772;
    int _2796 = _2794 + _2786;
    int _2798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2800 = _2798 != 0;
    int _2802 = _2716 * _2788;
    int _2804 = _2802 + _2796;
    float _2806 = in.m_53.w;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2808;
    int _2812 = as_type<int>(_2764);
    if (!_2732)
    {
        _882 = _2764;
    }
    float _2814 = _882;
    float _2816 = float(uint(_2804));
    float _2818 = as_type<float>(_2647) * _2816;
    int _2820 = ~_1512;
    int _2822 = _2820 + 1;
    float _2824 = trunc(_2818);
    float _2826 = precise::max(_2824, 0.0);
    uint _2828 = uint(_2826);
    bool _2830 = _2806 > 0.5;
    int _2832 = _2822 * int(_2828);
    int _2834 = _2832 + _2804;
    float _2836 = float(uint(_2834));
    float _2838 = as_type<float>(_2647) * _2836;
    float _2840 = in.m_63.y;
    float _2842 = trunc(_2838);
    float _2844 = precise::max(_2842, 0.0);
    uint _2846 = uint(_2844);
    int _2848 = int(_2828) + int(_2846);
    float _2850 = -_2840;
    float _2852 = _2850 + 1.0;
    int _2854 = _2792 * _2848;
    int _2856 = _2854 + _2804;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2860 = _2858 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2862 = float(uint(_2782));
    bool _2864 = uint(_2856) >= uint(_1512);
    float _2866 = 1.0 / _2860;
    int _2868 = _2830 ? as_type<int>(_2852) : as_type<int>(_2840);
    float _2870 = as_type<float>(_2647) * _2862;
    bool _2872 = !_2864;
    int _2874 = _2872 ? 0 : (-1);
    int _2876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2878 = _2876 != 0;
    bool _2880 = _1190 > 0.5;
    float _2882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2884 = ~_2848;
    int _2886 = _2884 + _2874;
    int _2888 = _2886 + 1;
    float _2890 = _2878 ? as_type<float>(_2868) : _2840;
    float _2892 = _2840;
    bool _2894 = _2880;
    bool _2896 = _2878;
    float _2898 = _2814;
    if (_2700)
    {
        float _2900 = _2880 ? _2852 : _2840;
        _2892 = _2900;
    }
    float _2902 = _2892;
    float _2904 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2906 = _1174 + _2904;
    if (_2728)
    {
        bool _2908 = _1218 > 0.5;
        _2894 = _2908;
    }
    bool _2910 = _2894;
    int _2912 = _1512 * _2888;
    int _2914 = _2912 + _2804;
    if (_2732)
    {
        bool _2916 = _1184 > 0.5;
        _2896 = _2916;
    }
    bool _2918 = _2896;
    float _2920 = _2810 * _2866;
    bool _2922 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2924 = isnan(_1174);
    bool _2926 = _2922 || _2924;
    bool _2928 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2930 = _2926 || _2928;
    float _2932 = float(_2930);
    float _2934 = trunc(_2870);
    float _2936 = precise::max(_2934, 0.0);
    uint _2938 = uint(_2936);
    bool _2940 = !_2718;
    int _2942 = _2940 ? _2914 : (-1);
    float _2944 = fma(_2920, _2906, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2946 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2948 = isnan(_1174);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2954 = _2950 || _2952;
    float _2956 = float(_2954);
    float _2958 = -_2932;
    float _2960 = _2958 + 1.0;
    int _2962 = _2942 >> 31;
    float _2964 = _2882 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2966 = ~_1512;
    int _2968 = _2966 + 1;
    float _2970 = _2956 * _2960;
    int _2972 = _2962 & 3;
    float _2974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2976 = _2970;
    if (!_2732)
    {
        _1276 = _2814;
    }
    float _2978 = _1276;
    float _2980 = fma(_2890, _2964, -0.5);
    int _2982 = _2942 + _2972;
    float _2984 = _2944 * _2970;
    float _2986 = _2978;
    if (_2732)
    {
        _2898 = _2764;
    }
    float _2988 = _2898;
    int _2990 = _2968 * int(_2938);
    int _2992 = _2990 + _2782;
    int _2994 = _2982 >> 2;
    float _2996 = -_2956;
    float _2998 = _2996 + 1.0;
    int _3000 = _2992;
    if (!_2728)
    {
        _2976 = _2988;
    }
    float _3002 = _2976;
    float _3004 = _3002;
    if (_2728)
    {
        float _3006 = -_2988;
        float _3008 = _3006 + 1.0;
        _2812 = as_type<int>(_3008);
    }
    int _3010 = _2812;
    int _3012 = _2994 << 4;
    int _3014 = _3012 + 368;
    float _3016 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2984);
    float _3018 = float(uint(_2992));
    if (_2732)
    {
        float _3020 = -_2988;
        float _3022 = _3020 + 1.0;
        _3000 = as_type<int>(_3022);
    }
    int _3024 = _3000;
    uint _3026 = uint(int(uint(_3014) >> uint(2)));
    uint _3028 = uint(int(uint(int(_3026)) >> uint(2)));
    int _3030 = int(_3026) & 3;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[int(_3028)][_3030];
    int _3034 = int(_3026) + 1;
    uint _3036 = uint(int(uint(_3034) >> uint(2)));
    int _3038 = _3034 & 3;
    float _3040 = (*spvDescriptorSet0.vp_c9)._m0[int(_3036)][_3038];
    if (_2728)
    {
        float _3042 = _2910 ? as_type<float>(_3010) : _2988;
        _3004 = _3042;
    }
    float _3044 = _3004;
    float _3046 = _2974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3048 = as_type<float>(_2647) * _3018;
    float _3050 = _2611 * 6.283185482025146484375;
    float _3052 = sin(_3050);
    if (_2732)
    {
        float _3054 = _2918 ? as_type<float>(_3024) : _2988;
        _2986 = _3054;
    }
    float _3056 = _2986;
    float _3058 = fma(_2932, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3016);
    int _3060 = _3014 + 8;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    uint _3064 = uint(int(uint(int(_3062)) >> uint(2)));
    int _3066 = int(_3062) & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = int(_3062) + 1;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    int _3074 = _3070 & 3;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[int(_3072)][_3074];
    float _3078 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2902, -0.5);
    int _3080 = _2942 & 3;
    bool _3082 = _3080 != 0;
    float _3084 = fma(_3046, _3044, -0.5);
    int _3086 = ~_1512;
    int _3088 = _3086 + 1;
    float _3090 = trunc(_3048);
    float _3092 = precise::max(_3090, 0.0);
    uint _3094 = uint(_3092);
    float _3096 = -_1306;
    float _3098 = fma(_1562, _3078, _3096);
    float _3100 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _3102 = _2942 & 3;
    bool _3104 = _3102 != 0;
    float _3106 = fma(_1554, _3100, _1302);
    bool _3108 = uint(_3102) > 1u;
    float _3110 = _2611 * 6.283185482025146484375;
    float _3112 = cos(_3110);
    int _3114 = _3082 ? 0 : 1;
    float _3116 = _3098 + 0.5;
    bool _3118 = _3102 != 3;
    float _3120 = _3106 + 0.5;
    bool _3122 = uint(_3102) >= 2u;
    int _3124 = ~_3114;
    int _3126 = _3124 + 1;
    int _3128 = _3126 + 1;
    int _3130 = int(_2938) + int(_3094);
    float _3132 = _3052 * _2980;
    int _3134 = _3128;
    if (!_3108)
    {
        int _3136 = ~_3114;
        int _3138 = _3136 + 1;
        _3134 = _3138;
    }
    int _3140 = _3134;
    int _3142 = _3088 * _3130;
    int _3144 = _3142 + _2782;
    float _3146 = _3112 * _2980;
    float _3148 = -_3132;
    float _3150 = fma(_3112, _3084, _3148);
    bool _3152 = uint(_3144) >= uint(_1512);
    float _3154 = fma(_3052, _3084, _3146);
    int _3156 = _3122 ? 0 : 1;
    float _3158 = fma(_1566, _3150, _1382);
    bool _3160 = !_3104;
    int _3162 = _3160 ? 0 : 1;
    float _3164 = -_1412;
    float _3166 = fma(_1494, _3154, _3164);
    int _3168 = abs(_3140);
    float _3170 = _3158 + 0.5;
    int _3172 = ~_3156;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    float _3178 = _3166 + 0.5;
    bool _3180 = _3102 != 3;
    int _3182 = abs(_3162);
    int _3184 = _3176;
    if (_3118)
    {
        int _3186 = ~_3156;
        int _3188 = _3186 + 1;
        _3184 = _3188;
    }
    int _3190 = _3184;
    out.m_65.x = _3120;
    out.m_65.y = _3116;
    out.m_65.z = _3170;
    out.m_65.w = _3178;
    bool _3192 = !_3180;
    int _3194 = _3192 ? 0 : (-1);
    int _3196 = abs(_3190);
    int _3198 = ~_3168;
    int _3200 = _3198 + 1;
    int _3202 = _3200 + 1;
    int _3204 = abs(_3194);
    int _3206 = ~_3182;
    int _3208 = _3206 + 1;
    int _3210 = _3208 + 1;
    int _3212 = _3202 * as_type<int>(_3040);
    bool _3214 = !_2800;
    int _3216 = _3214 ? 0 : 1;
    int _3218 = _3210 * as_type<int>(_3032);
    int _3220 = _3218 + _3212;
    int _3222 = ~_3196;
    int _3224 = _3222 + 1;
    int _3226 = _3224 + 1;
    int _3228 = abs(_3216);
    int _3230 = ~_3204;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    int _3236 = _3226 * as_type<int>(_3068);
    int _3238 = _3236 + _3220;
    int _3240 = ~_3228;
    int _3242 = _3240 + 1;
    int _3244 = _3242 + 1;
    float _3246 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3248 = !_3152;
    int _3250 = _3248 ? 0 : (-1);
    int _3252 = _3234 * as_type<int>(_3076);
    int _3254 = _3252 + _3238;
    float _3256 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3258 = _3246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3260 = ~_3130;
    int _3262 = _3260 + _3250;
    int _3264 = _3262 + 1;
    int _3266 = _3254 * _3244;
    float _3268 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3270 = _3256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3272 = _3058 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3274 = _1512 * _3264;
    int _3276 = _3274 + _2782;
    float _3278 = _3268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3280 = _2272 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3282 = _2633 + _2508;
    float _3284 = _2546 + _2508;
    bool _3286 = !_2718;
    int _3288 = _3286 ? _3276 : (-1);
    out.m_67.x = _3278;
    out.m_67.y = _3270;
    out.m_67.z = _3258;
    out.m_67.w = _3272;
    bool _3290 = _2272 > 0.0;
    bool _3292 = isnan(_2272);
    bool _3294 = _3290 || _3292;
    bool _3296 = isnan(0.0);
    bool _3298 = _3294 || _3296;
    float _3300 = _3282 * 0.5;
    int _3302 = _3288 * _3228;
    int _3304 = _3302 + _3266;
    float _3306 = _2508 * 0.5;
    float _3308 = _3284 * 0.5;
    float _3310 = fma(_2552, -0.5, _3306);
    float _3312 = float(_3304);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _3314 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3316 = _3280 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3312;
    float _3318 = _3314 * _2576;
    float _3320 = -_3314;
    float _3322 = _3320 + 1.0;
    out.m_73.x = _3308;
    out.m_73.y = _3310;
    out.m_73.z = _3300;
    out.m_73.w = _2508;
    float _3324 = _2587 * _3318;
    float _3326 = _2597 * _3318;
    float _3328 = _2587 * _3322;
    out.m_49.x = _3316;
    float _3330 = fma(_2593, _3324, _2581);
    float _3332 = fma(_2595, _3324, _2583);
    float _3334 = fma(_2587, _3326, _2585);
    out.m_75.x = _3330;
    out.m_75.y = _3332;
    out.m_75.z = _3334;
    out.m_75.w = _3328;
    if (_3298)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3336 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3336;
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
    bool _1172 = false;
    bool _902 = false;
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
        float _3405 = as_type<float>(_118);
        out.gl_Position.z = _3405;
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
        float _3460 = as_type<float>(_144);
        out.gl_Position.z = _3460;
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
    float _882 = _874;
    float _900;
    if (!_880)
    {
        float _884 = in.m_53.x;
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _888 = _884 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _892 = _890 * _886;
        float _894 = floor(_892);
        float _896 = -_894;
        float _898 = _892 + _896;
        _900 = _898;
        _902 = true;
    }
    else
    {
        _900 = _156;
    }
    _902 = false;
    float _904 = _900;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _908 = _904 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _912 = _904 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _916 = _904 + _914;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _918;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _924 = _922 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _934 = 1.0 / _920;
    bool _936 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _938 = isnan(_904);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = 1.0 / _924;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _952 = _904 + _950;
    float _954 = 1.0 / _928;
    float _956 = _908 * _934;
    bool _958 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _960 = isnan(_904);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    bool _970 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _972 = 1.0 / _932;
    float _974 = _912 * _948;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _976;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _980;
    float _984 = fma(_978, _956, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _986 = fma(_982, _956, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _988 = _916 * _954;
    float _990 = -_946;
    float _992 = _990 + 1.0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _994;
    float _998 = fma(_996, _956, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1000 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1002 = isnan(_904);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _952 * _972;
    bool _1014 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1016 = isnan(_904);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = _968 * _992;
    float _1028 = -_968;
    float _1030 = _1028 + 1.0;
    bool _1032 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1034 = isnan(_904);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = -_1024;
    float _1046 = _1044 + 1.0;
    float _1048 = _1024 * _1030;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1058 = _1010 * _1046;
    float _1060 = -_1010;
    float _1062 = _1060 + 1.0;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1068 = fma(_1052, _974, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1070 = fma(_1056, _974, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1072 = _1042 * _1062;
    float _1074 = fma(_1066, _974, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1076 = _986 * _1072;
    float _1078 = _984 * _1072;
    float _1080 = -_1042;
    float _1082 = _1080 + 1.0;
    float _1084 = _998 * _1072;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1094;
    float _1098 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1078);
    float _1100 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1076);
    float _1102 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1084);
    float _1104 = fma(_1088, _988, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1106 = fma(_1092, _988, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1108 = fma(_1096, _988, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1110 = fma(_1068, _1058, _1098);
    float _1112 = fma(_1074, _1058, _1100);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1122 = fma(_1070, _1058, _1102);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1128 = fma(_1104, _1048, _1110);
    float _1130 = fma(_1116, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1132 = fma(_1120, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1134 = fma(_1106, _1048, _1112);
    float _1136 = fma(_1126, _1012, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1138 = fma(_1108, _1048, _1122);
    float _1140 = fma(_1130, _1026, _1128);
    float _1142 = fma(_1132, _1026, _1134);
    float _1144 = fma(_1136, _1026, _1138);
    float _1146 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1140);
    float _1148 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1142);
    float _1150 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1144);
    bool _1152 = !_970;
    float _1170;
    if (!_1152)
    {
        float _1154 = in.m_53.x;
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1158 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1162 = _1160 * _1156;
        float _1164 = floor(_1162);
        float _1166 = -_1164;
        float _1168 = _1162 + _1166;
        _1170 = _1168;
        _1172 = true;
    }
    else
    {
        _1170 = _156;
    }
    _1172 = false;
    float _1174 = _1170;
    float _1176 = in.m_42.x;
    float _1178 = in.m_42.y;
    float _1180 = in.m_42.z;
    float _1182 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1184 = in.m_53.x;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1188 = _1186 != 0;
    float _1190 = in.m_53.y;
    float _1192 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1196 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1198 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1196);
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1202 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1204 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1206 = _1178 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1208 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1198);
    float _1210 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1212 = _1184 * 2.0;
    float _1214 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1206);
    float _1216 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1202);
    float _1218 = in.m_53.z;
    float _1220 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1222 = -_1192;
    float _1224 = fma(_1210, 2.0, _1222);
    float _1226 = _1190 * 2.0;
    float _1228 = floor(_1212);
    float _1230 = fma(_1220, -2.0, _1194);
    float _1232 = fma(_1176, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1204);
    float _1234 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1214);
    float _1236 = _1184 + _1190;
    float _1238 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1240 = floor(_1226);
    float _1242 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1232);
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1246 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1238);
    float _1248 = _1236 + (-1.0);
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1252 = _1228 > 0.0;
    float _1254 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1246);
    bool _1256 = _1228 >= 0.0;
    bool _1258 = isnan(_1228);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan(0.0);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_1180, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1216);
    float _1268 = _1246;
    float _1270 = _1216;
    float _1272 = _1180;
    float _1274 = _1232;
    float _1276 = _1190;
    if (!_1188)
    {
        _1268 = _1190;
    }
    float _1278 = _1268;
    float _1280 = _1218 * 2.0;
    float _1282 = _1278;
    if (!_1188)
    {
        _1270 = _1184;
    }
    float _1284 = _1270;
    float _1286 = fma(_1248, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1288 = _1284;
    if (!_1188)
    {
        _1272 = _1218;
    }
    float _1290 = _1272;
    float _1292 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1294 = int(_1292);
    float _1296 = _1290;
    if (_1188)
    {
        _1282 = _1184;
    }
    float _1298 = _1282;
    float _1300 = -_100;
    float _1302 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1224);
    if (_1188)
    {
        _1288 = _1218;
    }
    float _1304 = _1288;
    float _1306 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1230);
    bool _1308 = _1240 > 0.0;
    float _1310 = _1298 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1312 = _1240;
    if (!_1188)
    {
        _1274 = _1290;
    }
    float _1314 = _1274;
    float _1316 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1244);
    float _1318 = -_1200;
    float _1320 = fma(_1310, 2.0, _1318);
    float _1322 = _1314;
    if (_1188)
    {
        _1322 = _1190;
    }
    float _1324 = _1322;
    float _1326 = floor(_1280);
    bool _1328 = _1240 >= 0.0;
    bool _1330 = isnan(_1240);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(0.0);
    bool _1336 = _1332 || _1334;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1188)
    {
        _1312 = _1190;
    }
    float _1340 = _1312;
    float _1342 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1344 = _1264 ? 0 : 1;
    float _1346 = _1184 + _1218;
    float _1348 = fma(_1342, -2.0, _1338);
    float _1350 = _1340;
    if (_1188)
    {
        _1350 = _1184;
    }
    float _1352 = _1350;
    float _1354 = _1346 + (-1.0);
    int _1356 = _1336 ? 0 : 1;
    float _1358 = rsqrt(_1208);
    int _1360 = ~_1344;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    float _1366 = fma(_1352, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1250);
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1378 = _1376 != 0;
    float _1380 = -_100;
    float _1382 = fma(_1380, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1320);
    int _1384 = _1364;
    if (!_1252)
    {
        int _1386 = ~_1344;
        int _1388 = _1386 + 1;
        _1384 = _1388;
    }
    int _1390 = _1384;
    float _1392 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1316);
    int _1394 = ~_1356;
    int _1396 = _1394 + 1;
    int _1398 = _1396 + 1;
    float _1400 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1402 = log2(_1400);
    int _1404 = _1398;
    if (!_1308)
    {
        int _1406 = ~_1356;
        int _1408 = _1406 + 1;
        _1404 = _1408;
    }
    int _1410 = _1404;
    float _1412 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1348);
    float _1414 = _1242 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1416 = !_1374;
    int _1418 = _1416 ? 0 : 1;
    float _1420 = _1234 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1422 = !_1370;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = fma(_1354, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1428 = !_1378;
    int _1430 = _1428 ? 0 : 1;
    float _1432 = _1190 + _1218;
    int _1434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1436 = _1434 != 0;
    int _1438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1440 = _1438 != 0;
    int _1442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1444 = _1442 != 0;
    float _1446 = _1254 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1448 = _1432 + (-1.0);
    bool _1450 = !_1444;
    int _1452 = _1450 ? 0 : 1;
    float _1454 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1456 = !_1440;
    int _1458 = _1456 ? 0 : 1;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1462 = abs(_1452);
    float _1464 = float(_1294);
    bool _1466 = _1326 > 0.0;
    bool _1468 = _1326 >= 0.0;
    bool _1470 = isnan(_1326);
    bool _1472 = _1468 || _1470;
    bool _1474 = isnan(0.0);
    bool _1476 = _1472 || _1474;
    float _1478 = _1402 * _100;
    float _1480 = 1.0 / _1464;
    if (_1188)
    {
        _1296 = _1190;
    }
    float _1482 = _1296;
    int _1484 = abs(_1458);
    float _1486 = float(_1410);
    float _1488 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1460);
    float _1490 = float(_1462);
    float _1492 = exp2(_1478);
    float _1494 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1488);
    float _1496 = float(_1390);
    float _1498 = _1490 * _1486;
    float _1500 = in.m_57.x;
    float _1502 = in.m_57.y;
    float _1504 = in.m_57.z;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1508 = 1.0 + _1506;
    float _1510 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1512 = int(_1510);
    float _1514 = _1480 * _100;
    float _1516 = float(_1484);
    float _1518 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1520 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1522 = isnan(1.0);
    bool _1524 = _1520 || _1522;
    bool _1526 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1528 = _1524 || _1526;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1532 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1534 = isnan(0.0);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1540 = _1536 || _1538;
    float _1542 = 1.0 / _1508;
    float _1544 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1518);
    float _1546 = -_1492;
    float _1548 = _1546 + 1.0;
    float _1550 = _1516 * _1496;
    float _1552 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1530);
    float _1554 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1544);
    int _1556 = _1476 ? 0 : 1;
    float _1558 = _1550 * (-2.0);
    float _1560 = float(_1512);
    float _1562 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1552);
    float _1564 = _1540 ? _1548 : 0.0;
    float _1566 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1366);
    float _1568 = fma(_1454, _1558, _1454);
    float _1570 = _1560 * _100;
    float _1572 = fma(_1558, _1502, _1502);
    float _1574 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1528)
    {
        float _1576 = _1564 * _1542;
        _110 = _1576;
    }
    float _1578 = _110;
    float _1580 = _1190 + (-0.5);
    int _1582 = ~_1556;
    int _1584 = _1582 + 1;
    int _1586 = _1584 + 1;
    int _1588 = _1586;
    if (!_1466)
    {
        int _1590 = ~_1556;
        int _1592 = _1590 + 1;
        _1588 = _1592;
    }
    int _1594 = _1588;
    float _1596 = fma(_1580, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1572);
    float _1598 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1600 = _1574 * _1574;
    float _1602 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1604 = fma(_1598, _1598, _1600);
    bool _1606 = !_1436;
    int _1608 = _1606 ? 0 : 1;
    float _1610 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1610;
    float _1614 = _1498 * (-2.0);
    float _1616 = fma(_1602, _1602, _1604);
    int _1618 = abs(_1608);
    float _1620 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1622 = fma(_1426, _1614, _1426);
    float _1624 = fma(_1614, _1504, _1504);
    float _1626 = fma(_1568, _1578, _1596);
    float _1628 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1630 = _1218 + (-0.5);
    float _1632 = _1626 * 0.15915493667125701904296875;
    float _1634 = float(_1594);
    float _1636 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1620);
    float _1638 = float(_1618);
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1624);
    float _1642 = rsqrt(_1616);
    float _1644 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1636);
    float _1646 = _1638 * _1634;
    float _1648 = _1646 * (-2.0);
    float _1650 = _1644 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1652 = fma(_1622, _1578, _1640);
    float _1654 = _1184 + (-0.5);
    float _1656 = in.m_59.x;
    float _1658 = in.m_59.y;
    float _1660 = in.m_59.z;
    float _1662 = -_1650;
    float _1664 = _1446 + _1662;
    float _1666 = fma(_1648, _1500, _1500);
    float _1668 = 1.0 / _1612;
    float _1670 = fma(_1286, _1648, _1286);
    bool _1672 = _1650 >= _1446;
    bool _1674 = isnan(_1650);
    bool _1676 = _1672 || _1674;
    bool _1678 = isnan(_1446);
    bool _1680 = _1676 || _1678;
    float _1682 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1666);
    float _1684 = abs(_1664);
    float _1686 = precise::max(_1684, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1688 = _1652 * 0.15915493667125701904296875;
    float _1690 = _1598 * _1642;
    float _1692 = fma(_1670, _1578, _1682);
    float _1694 = precise::min(_1686, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1696 = _1688 * 6.283185482025146484375;
    float _1698 = sin(_1696);
    bool _1700 = !_1680;
    float _1702 = _1700 ? 1.0 : (-1.0);
    float _1704 = _1692 * 0.15915493667125701904296875;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1708 = _1694 + _1706;
    float _1710 = _1574 * _1642;
    float _1712 = _1602 * _1642;
    float _1714 = _1708 * _1668;
    float _1716 = _1688 * 6.283185482025146484375;
    float _1718 = cos(_1716);
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1656);
    float _1722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1660);
    float _1724 = _1702 * _1714;
    float _1726 = _1632 * 6.283185482025146484375;
    float _1728 = sin(_1726);
    float _1730 = _530 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1732 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1734 = _1732 * _1724;
    float _1736 = _1632 * 6.283185482025146484375;
    float _1738 = cos(_1736);
    float _1740 = _1704 * 6.283185482025146484375;
    float _1742 = sin(_1740);
    float _1744 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1658);
    float _1746 = _548 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1748 = _1730 * _1722;
    float _1750 = _1182 * _1744;
    float _1752 = _1746 * _1720;
    float _1754 = _1734 * 0.15915493667125701904296875;
    float _1756 = _1704 * 6.283185482025146484375;
    float _1758 = cos(_1756);
    float _1760 = _1718 * _1750;
    float _1762 = _1738 * _1718;
    float _1764 = _1728 * _1718;
    float _1766 = _1742 * _1728;
    float _1768 = -_1750;
    float _1770 = _1698 * _1768;
    float _1772 = _1754 * 6.283185482025146484375;
    float _1774 = cos(_1772);
    float _1776 = fma(_1762, _1752, _1770);
    float _1778 = _1758 * _1738;
    float _1780 = _1758 * _1728;
    float _1782 = _1758 * _1760;
    float _1784 = _1742 * _1738;
    float _1786 = fma(_1698, _1778, _1766);
    float _1788 = _1742 * _1760;
    float _1790 = fma(_1764, _1748, _1776);
    float _1792 = -_1784;
    float _1794 = fma(_1698, _1780, _1792);
    float _1796 = fma(_1786, _1752, _1782);
    float _1798 = -_1780;
    float _1800 = fma(_1698, _1784, _1798);
    float _1802 = _1754 * 6.283185482025146484375;
    float _1804 = sin(_1802);
    float _1806 = fma(_1698, _1766, _1778);
    float _1808 = fma(_1794, _1748, _1796);
    float _1810 = fma(_1800, _1752, _1788);
    float _1812 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1814 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1816 = _1808 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1818 = fma(_1806, _1748, _1810);
    float _1820 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1812);
    float _1822 = -_1774;
    float _1824 = _1822 + 1.0;
    float _1826 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1814);
    float _1828 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1816);
    float _1830 = _1712 * _1712;
    float _1832 = _1710 * _1824;
    float _1834 = _1690 * _1804;
    float _1836 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1820);
    float _1838 = _1710 * _1804;
    float _1840 = fma(_1824, _1830, _1774);
    float _1842 = _1712 * _1804;
    float _1844 = _1690 * _1824;
    float _1846 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1826);
    float _1848 = fma(_1712, _1832, _1834);
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1852 = -_1842;
    float _1854 = fma(_1710, _1844, _1852);
    float _1856 = -_1838;
    float _1858 = fma(_1712, _1844, _1856);
    float _1860 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1862 = _1850 * _1848;
    float _1864 = fma(_1818, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1828);
    float _1866 = fma(_1690, _1844, _1774);
    float _1868 = _1850 * _1854;
    float _1870 = fma(_1860, _1858, _1862);
    float _1872 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1874 = fma(_1710, _1844, _1842);
    float _1876 = fma(_1860, _1866, _1868);
    float _1878 = fma(_1712, _1844, _1838);
    float _1880 = fma(_1872, _1840, _1870);
    float _1882 = fma(_1710, _1832, _1774);
    float _1884 = -_1834;
    float _1886 = fma(_1712, _1832, _1884);
    float _1888 = fma(_1872, _1878, _1876);
    float _1890 = _1420 + _1880;
    float _1892 = _1850 * _1882;
    float _1894 = _1628 + _1888;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1898 = _1890 + _1896;
    float _1900 = fma(_1860, _1874, _1892);
    float _1902 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1904 = _1894 + _1902;
    float _1906 = _1898 * _1898;
    float _1908 = fma(_1872, _1886, _1900);
    float _1910 = fma(_1904, _1904, _1906);
    float _1912 = _1414 + _1908;
    float _1914 = sqrt(_1910);
    bool _1916 = _1914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1918 = _1908;
    float _1920 = _1710;
    float _1922 = _1900;
    if (!_1916)
    {
        _1918 = _1894;
    }
    float _1924 = _1918;
    float _1926 = _1924;
    if (!_1916)
    {
        _1920 = _1890;
    }
    float _1928 = _1920;
    float _1930 = _1928;
    if (!_1916)
    {
        _1922 = _1912;
    }
    float _1932 = _1922;
    bool _1934 = !_1916;
    float _1936 = _1932;
    if (!_1934)
    {
        float _1938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1942 = _1914 + _1940;
        float _1944 = rsqrt(_1910);
        float _1946 = _1942 * _1938;
        float _1948 = _1912 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = _1946 * 0.15915493667125701904296875;
        float _1952 = _1950 * 6.283185482025146484375;
        float _1954 = sin(_1952);
        float _1956 = _1950 * 6.283185482025146484375;
        float _1958 = cos(_1956);
        float _1960 = fma(_1954, _1948, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1962 = _1944 * _1960;
        float _1964 = _1958 + (-1.0);
        float _1966 = fma(_1904, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1968 = fma(_1898, _1962, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1970 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1972 = fma(_1912, _1958, _1970);
        _1936 = _1972;
        _1926 = _1966;
        _1930 = _1968;
    }
    float _1974 = _1936;
    float _1976 = _1926;
    float _1978 = _1930;
    float _1980 = -_1414;
    float _1982 = _1980 + _1974;
    float _1984 = -_1628;
    float _1986 = _1984 + _1976;
    float _1988 = -_1420;
    float _1990 = _1988 + _1978;
    float _1992 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1994 = _1982 * _1982;
    float _1996 = fma(_1986, _1986, _1994);
    float _1998 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1992);
    float _2000 = _1414 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2002 = fma(_1990, _1990, _1996);
    float _2004 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1998);
    float _2006 = sqrt(_2002);
    float _2008 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2010 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2000);
    float _2012 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2010);
    bool _2014 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.5);
    bool _2022 = _2018 || _2020;
    float _2024 = 1.0 / _2008;
    float _2026 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2028 = _2026 + _2008;
    bool _2030 = _2006 > 0.0;
    bool _2032 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan(0.5);
    bool _2040 = _2036 || _2038;
    float _2042 = _2028 * _2024;
    float _2044 = _2042 * 0.5;
    bool _2046 = !_2030;
    float _2048 = _1974;
    float _2050 = _1986;
    float _2052 = _1976;
    float _2054 = _1978;
    float _2056 = _2008;
    float _2058 = _1982;
    float _2060 = _1990;
    float _2062 = _2002;
    float _2064 = _2026;
    float _2066 = _2024;
    if (!_2046)
    {
        float _2068 = _172 * _172;
        float _2070 = rsqrt(_2002);
        float _2072 = fma(_170, _170, _2068);
        float _2074 = fma(_174, _174, _2072);
        float _2076 = sqrt(_2074);
        float _2078 = _1986 * _2070;
        float _2080 = _1982 * _2070;
        bool _2082 = _2076 > 0.0;
        float _2084 = _1990 * _2070;
        bool _2086 = !_2082;
        _2056 = _2074;
        _2062 = _2070;
        _2064 = _2084;
        if (!_2086)
        {
            float _2088 = rsqrt(_2074);
            float _2090 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2092 = _172 * _2088;
            float _2094 = _170 * _2088;
            float _2096 = _174 * _2088;
            float _2098 = _2080 * _2092;
            float _2100 = fma(_2078, _2094, _2098);
            float _2102 = _2090 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2104 = fma(_2084, _2096, _2100);
            float _2106 = _2104 * _2102;
            float _2108 = fma(_170, _2106, _1976);
            float _2110 = fma(_172, _2106, _1974);
            float _2112 = fma(_174, _2106, _1978);
            _2048 = _2110;
            _2050 = _2100;
            _2052 = _2108;
            _2054 = _2112;
            _2058 = _2106;
            _2060 = _2098;
            _2062 = _2102;
        }
    }
    float _2114 = _2048;
    float _2116 = _2050;
    float _2118 = _2052;
    float _2120 = _2054;
    float _2122 = _2056;
    float _2124 = _2058;
    float _2126 = _2060;
    float _2128 = _2062;
    float _2130 = _2064;
    float _2132 = _2122;
    float _2134 = _2124;
    float _2136 = _2118;
    float _2138 = _2120;
    float _2140 = _2116;
    float _2142 = _2130;
    if (_2040)
    {
        _2132 = 1.0;
    }
    float _2144 = _2132;
    float _2146 = _2144;
    if (_2022)
    {
        _2134 = _2114;
    }
    float _2148 = _2134;
    float _2150 = _2148;
    if (!_2022)
    {
        float _2152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2154 = _1414 + _2152;
        float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2158 = _1628 + _2156;
        float _2160 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2162 = -_1414;
        float _2164 = _2162 + _2114;
        float _2166 = _2154 * _2154;
        float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2170 = _1420 + _2168;
        float _2172 = fma(_2158, _2158, _2166);
        float _2174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2176 = fma(_2170, _2170, _2172);
        float _2178 = sqrt(_2176);
        float _2180 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2182 = precise::min(_2178, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2184 = _2182 * _2174;
        float _2186 = -_1628;
        float _2188 = _2186 + _2118;
        float _2190 = -_1420;
        float _2192 = _2190 + _2120;
        float _2194 = _2180 * _2184;
        float _2196 = fma(_2188, _2194, _1628);
        float _2198 = fma(_2164, _2194, _1414);
        float _2200 = fma(_2192, _2194, _1420);
        _2150 = _2198;
        _2136 = _2196;
        _2138 = _2200;
        _2140 = _2194;
    }
    float _2202 = _2150;
    float _2204 = _2136;
    float _2206 = _2138;
    float _2208 = _2140;
    float _2210 = _2208;
    if (!_2040)
    {
        float _2212 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2214 = _2212 * 0.15915493667125701904296875;
        float _2216 = _2214 * 6.283185482025146484375;
        float _2218 = cos(_2216);
        float _2220 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2222 = _2220 * 0.15915493667125701904296875;
        float _2224 = _2214 * 6.283185482025146484375;
        float _2226 = sin(_2224);
        float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2230 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2228);
        float _2232 = 1.0 / _2218;
        float _2234 = _2222 * 6.283185482025146484375;
        float _2236 = cos(_2234);
        float _2238 = _2226 * _2232;
        float _2240 = 1.0 / _2230;
        float _2242 = _2236 * _2238;
        float _2244 = _2222 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2250 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2248;
        float _2252 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2254 = _2240 * _2252;
        float _2256 = 1.0 / _2242;
        float _2258 = 1.0 / _2250;
        float _2260 = _2246 * _2256;
        float _2262 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2264 = fma(_2260, _2254, _2262);
        float _2266 = _2264 * _2258;
        float _2268 = precise::clamp(_2266, 0.0, 1.0);
        _2210 = _2214;
        _2146 = _2268;
    }
    float _2270 = _2210;
    float _2272 = _2146;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2276 = _2202 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2280 = _2204 + _2278;
    float _2282 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2284 = _2206 + _2282;
    float _2286 = _2276 * _2276;
    float _2288 = fma(_2280, _2280, _2286);
    float _2290 = fma(_2284, _2284, _2288);
    float _2292 = rsqrt(_2290);
    float _2294 = sqrt(_2290);
    float _2296 = _2292 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2298 = _2280 * _2296;
    float _2300 = _2284 * _2296;
    float _2302 = _2298 * _2298;
    float _2304 = _2300 * _2300;
    float _2306 = _2302 + _2304;
    float _2308 = sqrt(_2306);
    bool _2310 = _2308 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2312 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2314 = _2308 + _2312;
    float _2316 = _2126;
    float _2318 = _2314;
    float _2320 = _2276;
    float _2322 = _2300;
    float _2324 = _2302;
    float _2326 = _2304;
    if (_2310)
    {
        float _2328 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2316 = _2328;
    }
    float _2330 = _2316;
    if (_2310)
    {
        float _2332 = _2314 * _2330;
        _2318 = _2332;
    }
    float _2334 = _2318;
    if (_2310)
    {
        float _2336 = _2334 * 0.15915493667125701904296875;
        _2066 = _2336;
    }
    float _2338 = _2066;
    float _2340 = _2128;
    if (_2310)
    {
        float _2342 = _2338 * 6.283185482025146484375;
        float _2344 = sin(_2342);
        _2340 = _2344;
    }
    float _2346 = _2340;
    float _2348 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2350 = precise::max(0.0, _2348);
    float _2352 = _2270;
    float _2354 = _2350;
    if (_2310)
    {
        float _2356 = _2338 * 6.283185482025146484375;
        float _2358 = cos(_2356);
        _2352 = _2358;
    }
    float _2360 = _2352;
    float _2362 = -_2296;
    float _2364 = -_2350;
    float _2366 = fma(_2276, _2362, _2364);
    if (!_2310)
    {
        _2320 = _2298;
    }
    float _2368 = _2320;
    float _2370 = _2348;
    float _2372 = _2368;
    if (_2310)
    {
        float _2374 = rsqrt(_2306);
        _2370 = _2374;
    }
    float _2376 = _2370;
    if (_2310)
    {
        float _2378 = _2366 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2354 = _2378;
    }
    float _2380 = _2354;
    float _2382 = _2380;
    if (_2310)
    {
        float _2384 = fma(_2346, _2380, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2142 = _2384;
    }
    float _2386 = _2142;
    float _2388 = _2386;
    if (_2310)
    {
        float _2390 = _2360 + (-1.0);
        _2382 = _2390;
    }
    float _2392 = _2382;
    float _2394 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2396 = _2392;
    if (_2310)
    {
        float _2398 = _2392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2396 = _2398;
    }
    float _2400 = _2396;
    float _2402 = _2376;
    if (_2310)
    {
        float _2404 = _2376 * _2386;
        _2388 = _2404;
    }
    float _2406 = _2388;
    if (!_2310)
    {
        _2402 = _2366;
    }
    float _2408 = _2402;
    float _2410 = _2408;
    if (_2310)
    {
        float _2412 = fma(_2366, _2360, _2400);
        _2410 = _2412;
    }
    float _2414 = _2410;
    if (_2310)
    {
        float _2416 = _2298 * _2406;
        _2372 = _2416;
    }
    float _2418 = _2372;
    if (_2310)
    {
        float _2420 = _2300 * _2406;
        _2322 = _2420;
    }
    float _2422 = _2322;
    if (_2310)
    {
        float _2424 = _2418 * _2418;
        _2324 = _2424;
    }
    float _2426 = _2324;
    if (_2310)
    {
        float _2428 = _2422 * _2422;
        _2326 = _2428;
    }
    float _2430 = _2326;
    float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2434 = fma(_2294, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2432);
    float _2436 = precise::clamp(_2434, 0.0, 1.0);
    float _2438 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2440 = fma(_2414, _2414, _2426);
    float _2442 = -_2436;
    float _2444 = _2442 + 1.0;
    float _2446 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2438);
    float _2448 = _2440 + _2430;
    float _2450 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2452 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2454 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2446);
    float _2456 = abs(_2444);
    float _2458 = log2(_2456);
    float _2460 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2450);
    float _2462 = _2202 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2464 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2466 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2460);
    float _2468 = rsqrt(_2448);
    float _2470 = _2466 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2472 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2462);
    float _2474 = fma(_2204, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2452);
    float _2476 = _2470 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2478 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2472);
    float _2480 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2474);
    float _2482 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2484 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2486 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2488 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2490 = -_2476;
    float _2492 = fma(_2490, _2394, 1.0);
    float _2494 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2482);
    float _2496 = exp2(_2484);
    float _2498 = _2468 * _2418;
    float _2500 = _2468 * _2414;
    float _2502 = _2468 * _2422;
    float _2504 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2494);
    float _2506 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2508 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2504);
    float _2510 = -_2506;
    float _2512 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2510);
    float _2514 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2516 = log2(_2492);
    float _2518 = -_2502;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2512);
    float _2522 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2524 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2514);
    float _2526 = fma(_2520, -0.5, 0.5);
    float _2528 = fma(_2520, 0.5, 0.5);
    float _2530 = 1.0 / _2508;
    float _2532 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2522);
    float _2534 = _2500 + 1.0;
    float _2536 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2524);
    float _2538 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2540 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2532);
    float _2542 = -_2500;
    float _2544 = fma(_2496, _2534, _2542);
    float _2546 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2536);
    float _2548 = sqrt(_2526);
    float _2550 = fma(_2528, _2538, -0.212114393711090087890625);
    float _2552 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2540);
    float _2554 = _2516 * 0.693147182464599609375;
    float _2556 = fma(_2544, 0.5, 0.5);
    float _2558 = fma(_2528, _2550, 1.570728778839111328125);
    float _2560 = _2554 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2562 = _2552 * _2530;
    float _2564 = _2546 * _2530;
    float _2566 = fma(_2564, 0.5, 0.5);
    float _2568 = _2548 * 0.636619746685028076171875;
    float _2570 = fma(_2562, -0.5, 0.5);
    float _2572 = -_2558;
    float _2574 = fma(_2568, _2572, 1.0);
    float3 _7375 = float3(_2566, _2570, _2560);
    float _2576 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7375, float3(0.0), isnan(_7375)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7375, float3(0.0), isnan(_7375)), level(0.0)).x;
    float3 _7386 = float3(_2566, _2570, _2560);
    float4 _2579 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7386, float3(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7386, float3(0.0), isnan(_7386)), level(0.0)).xyzw;
    float _2581 = _2579.x;
    float _2583 = _2579.y;
    float _2585 = _2579.z;
    float _2587 = _2579.w;
    float2 _7403 = float2(_2574, _2556);
    float3 _2591 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7403, float2(0.0), isnan(_7403)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7403, float2(0.0), isnan(_7403)), level(0.0)).xyz;
    float _2593 = _2591.x;
    float _2595 = _2591.y;
    float _2597 = _2591.z;
    float _2599 = float(uint(_1512));
    float _2601 = trunc(_1514);
    int _2603 = int(_2601);
    int _2605 = ~_1512;
    int _2607 = _2605 + 1;
    out.m_61.x = _870;
    out.m_61.y = _872;
    out.m_61.z = _874;
    out.m_61.w = _878;
    int _2609 = abs(_1418);
    float _2611 = _1392 * (-0.15915493667125701904296875);
    float _2613 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2615 = _2464 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2617 = 1.0 / _2599;
    float _2619 = fma(_2486, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2615);
    bool _2621 = !_1188;
    float _2623 = _2621 ? 7.345489978790283203125 : 1.0;
    float _2625 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2619);
    float _2627 = float(uint(_2603));
    float _2629 = exp2(_2613);
    float _2631 = float(_2603);
    float _2633 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2625);
    bool _2635 = _2631 >= _1560;
    bool _2637 = isnan(_2631);
    bool _2639 = _2635 || _2637;
    bool _2641 = isnan(_1560);
    bool _2643 = _2639 || _2641;
    float _2645 = float(_2643);
    int _2647 = as_type<int>(_2617) + (-2);
    out.gl_Position.x = _2546;
    out.gl_Position.y = _2552;
    out.gl_Position.z = _2633;
    out.gl_Position.w = _2508;
    float _2649 = trunc(_2645);
    int _2651 = int(_2649);
    float _2653 = as_type<float>(_2647) * _2627;
    float _2655 = -_2629;
    float _2657 = _2655 + 1.0;
    float _2659 = trunc(_2653);
    float _2661 = precise::max(_2659, 0.0);
    uint _2664 = uint(_2661);
    int _2666 = _2607 * int(_2664);
    int _2668 = _2666 + _2603;
    float _2670 = float(uint(_2668));
    float _2672 = as_type<float>(_2647) * _2670;
    float _2674 = _2623 * _1184;
    float _2676 = floor(_2674);
    float _2678 = trunc(_2672);
    float _2680 = precise::max(_2678, 0.0);
    uint _2682 = uint(_2680);
    int _2684 = int(_2664) + int(_2682);
    float _2686 = -_2676;
    float _2688 = _2674 + _2686;
    int _2690 = _2607 * _2684;
    int _2692 = _2690 + _2603;
    int _2694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2696 = _2694 != 0;
    int _2698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2700 = _2698 != 0;
    bool _2702 = uint(_2692) >= uint(_1512);
    float _2704 = _2688 * _1560;
    float _2706 = _1570 * _152;
    int _2708 = _1512 + (-1);
    bool _2710 = !_2702;
    int _2712 = _2710 ? 0 : (-1);
    float _2714 = trunc(_2704);
    int _2716 = int(_2714);
    bool _2718 = _1512 == 0;
    int _2720 = ~_2684;
    int _2722 = _2720 + _2712;
    int _2724 = _2722 + 1;
    int _2726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2728 = _2726 != 0;
    int _2730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2732 = _2730 != 0;
    int _2734 = _1512 * _2724;
    int _2736 = _2734 + _2603;
    int _2738 = ~_2651;
    int _2740 = _2738 + 1;
    int _2742 = _2740 + 1;
    float _2744 = trunc(_2706);
    int _2746 = int(_2744);
    bool _2748 = !_2718;
    int _2750 = _2748 ? _2736 : (-1);
    bool _2752 = !_2696;
    int _2754 = _2752 ? 0 : 1;
    int _2756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2758 = _2756 != 0;
    int _2760 = _2750 * _2742;
    int _2762 = abs(_2754);
    float _2764 = in.m_63.x;
    int _2766 = abs(_1424);
    int _2768 = _2651 * _2708;
    int _2770 = _2768 + _2760;
    int _2772 = abs(_1430);
    int _2774 = _2770 * _2609;
    bool _2776 = !_2758;
    int _2778 = _2776 ? 0 : 1;
    int _2780 = _2716 * _2762;
    int _2782 = _2780 + _2603;
    int _2784 = _2746 * _2766;
    int _2786 = _2784 + _2774;
    int _2788 = abs(_2778);
    int _2790 = ~_1512;
    int _2792 = _2790 + 1;
    int _2794 = _2782 * _2772;
    int _2796 = _2794 + _2786;
    int _2798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2800 = _2798 != 0;
    int _2802 = _2716 * _2788;
    int _2804 = _2802 + _2796;
    float _2806 = in.m_53.w;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2810 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2808;
    int _2812 = as_type<int>(_2764);
    if (!_2732)
    {
        _882 = _2764;
    }
    float _2814 = _882;
    float _2816 = float(uint(_2804));
    float _2818 = as_type<float>(_2647) * _2816;
    int _2820 = ~_1512;
    int _2822 = _2820 + 1;
    float _2824 = trunc(_2818);
    float _2826 = precise::max(_2824, 0.0);
    uint _2828 = uint(_2826);
    bool _2830 = _2806 > 0.5;
    int _2832 = _2822 * int(_2828);
    int _2834 = _2832 + _2804;
    float _2836 = float(uint(_2834));
    float _2838 = as_type<float>(_2647) * _2836;
    float _2840 = in.m_63.y;
    float _2842 = trunc(_2838);
    float _2844 = precise::max(_2842, 0.0);
    uint _2846 = uint(_2844);
    int _2848 = int(_2828) + int(_2846);
    float _2850 = -_2840;
    float _2852 = _2850 + 1.0;
    int _2854 = _2792 * _2848;
    int _2856 = _2854 + _2804;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2860 = _2858 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2862 = float(uint(_2782));
    bool _2864 = uint(_2856) >= uint(_1512);
    float _2866 = 1.0 / _2860;
    int _2868 = _2830 ? as_type<int>(_2852) : as_type<int>(_2840);
    float _2870 = as_type<float>(_2647) * _2862;
    bool _2872 = !_2864;
    int _2874 = _2872 ? 0 : (-1);
    int _2876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2878 = _2876 != 0;
    bool _2880 = _1190 > 0.5;
    float _2882 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2884 = ~_2848;
    int _2886 = _2884 + _2874;
    int _2888 = _2886 + 1;
    float _2890 = _2878 ? as_type<float>(_2868) : _2840;
    float _2892 = _2840;
    bool _2894 = _2880;
    bool _2896 = _2878;
    float _2898 = _2814;
    if (_2700)
    {
        float _2900 = _2880 ? _2852 : _2840;
        _2892 = _2900;
    }
    float _2902 = _2892;
    float _2904 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2906 = _1174 + _2904;
    if (_2728)
    {
        bool _2908 = _1218 > 0.5;
        _2894 = _2908;
    }
    bool _2910 = _2894;
    int _2912 = _1512 * _2888;
    int _2914 = _2912 + _2804;
    if (_2732)
    {
        bool _2916 = _1184 > 0.5;
        _2896 = _2916;
    }
    bool _2918 = _2896;
    float _2920 = _2810 * _2866;
    bool _2922 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2924 = isnan(_1174);
    bool _2926 = _2922 || _2924;
    bool _2928 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2930 = _2926 || _2928;
    float _2932 = float(_2930);
    float _2934 = trunc(_2870);
    float _2936 = precise::max(_2934, 0.0);
    uint _2938 = uint(_2936);
    bool _2940 = !_2718;
    int _2942 = _2940 ? _2914 : (-1);
    float _2944 = fma(_2920, _2906, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2946 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2948 = isnan(_1174);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2954 = _2950 || _2952;
    float _2956 = float(_2954);
    float _2958 = -_2932;
    float _2960 = _2958 + 1.0;
    int _2962 = _2942 >> 31;
    float _2964 = _2882 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2966 = ~_1512;
    int _2968 = _2966 + 1;
    float _2970 = _2956 * _2960;
    int _2972 = _2962 & 3;
    float _2974 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2976 = _2970;
    if (!_2732)
    {
        _1276 = _2814;
    }
    float _2978 = _1276;
    float _2980 = fma(_2890, _2964, -0.5);
    int _2982 = _2942 + _2972;
    float _2984 = _2944 * _2970;
    float _2986 = _2978;
    if (_2732)
    {
        _2898 = _2764;
    }
    float _2988 = _2898;
    int _2990 = _2968 * int(_2938);
    int _2992 = _2990 + _2782;
    int _2994 = _2982 >> 2;
    float _2996 = -_2956;
    float _2998 = _2996 + 1.0;
    int _3000 = _2992;
    if (!_2728)
    {
        _2976 = _2988;
    }
    float _3002 = _2976;
    float _3004 = _3002;
    if (_2728)
    {
        float _3006 = -_2988;
        float _3008 = _3006 + 1.0;
        _2812 = as_type<int>(_3008);
    }
    int _3010 = _2812;
    int _3012 = _2994 << 4;
    int _3014 = _3012 + 368;
    float _3016 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2984);
    float _3018 = float(uint(_2992));
    if (_2732)
    {
        float _3020 = -_2988;
        float _3022 = _3020 + 1.0;
        _3000 = as_type<int>(_3022);
    }
    int _3024 = _3000;
    uint _3026 = uint(int(uint(_3014) >> uint(2)));
    uint _3028 = uint(int(uint(int(_3026)) >> uint(2)));
    int _3030 = int(_3026) & 3;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[int(_3028)][_3030];
    int _3034 = int(_3026) + 1;
    uint _3036 = uint(int(uint(_3034) >> uint(2)));
    int _3038 = _3034 & 3;
    float _3040 = (*spvDescriptorSet0.vp_c9)._m0[int(_3036)][_3038];
    if (_2728)
    {
        float _3042 = _2910 ? as_type<float>(_3010) : _2988;
        _3004 = _3042;
    }
    float _3044 = _3004;
    float _3046 = _2974 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3048 = as_type<float>(_2647) * _3018;
    float _3050 = _2611 * 6.283185482025146484375;
    float _3052 = sin(_3050);
    if (_2732)
    {
        float _3054 = _2918 ? as_type<float>(_3024) : _2988;
        _2986 = _3054;
    }
    float _3056 = _2986;
    float _3058 = fma(_2932, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3016);
    int _3060 = _3014 + 8;
    uint _3062 = uint(int(uint(_3060) >> uint(2)));
    uint _3064 = uint(int(uint(int(_3062)) >> uint(2)));
    int _3066 = int(_3062) & 3;
    float _3068 = (*spvDescriptorSet0.vp_c9)._m0[int(_3064)][_3066];
    int _3070 = int(_3062) + 1;
    uint _3072 = uint(int(uint(_3070) >> uint(2)));
    int _3074 = _3070 & 3;
    float _3076 = (*spvDescriptorSet0.vp_c9)._m0[int(_3072)][_3074];
    float _3078 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2902, -0.5);
    int _3080 = _2942 & 3;
    bool _3082 = _3080 != 0;
    float _3084 = fma(_3046, _3044, -0.5);
    int _3086 = ~_1512;
    int _3088 = _3086 + 1;
    float _3090 = trunc(_3048);
    float _3092 = precise::max(_3090, 0.0);
    uint _3094 = uint(_3092);
    float _3096 = -_1306;
    float _3098 = fma(_1562, _3078, _3096);
    float _3100 = fma(_3056, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _3102 = _2942 & 3;
    bool _3104 = _3102 != 0;
    float _3106 = fma(_1554, _3100, _1302);
    bool _3108 = uint(_3102) > 1u;
    float _3110 = _2611 * 6.283185482025146484375;
    float _3112 = cos(_3110);
    int _3114 = _3082 ? 0 : 1;
    float _3116 = _3098 + 0.5;
    bool _3118 = _3102 != 3;
    float _3120 = _3106 + 0.5;
    bool _3122 = uint(_3102) >= 2u;
    int _3124 = ~_3114;
    int _3126 = _3124 + 1;
    int _3128 = _3126 + 1;
    int _3130 = int(_2938) + int(_3094);
    float _3132 = _3052 * _2980;
    int _3134 = _3128;
    if (!_3108)
    {
        int _3136 = ~_3114;
        int _3138 = _3136 + 1;
        _3134 = _3138;
    }
    int _3140 = _3134;
    int _3142 = _3088 * _3130;
    int _3144 = _3142 + _2782;
    float _3146 = _3112 * _2980;
    float _3148 = -_3132;
    float _3150 = fma(_3112, _3084, _3148);
    bool _3152 = uint(_3144) >= uint(_1512);
    float _3154 = fma(_3052, _3084, _3146);
    int _3156 = _3122 ? 0 : 1;
    float _3158 = fma(_1566, _3150, _1382);
    bool _3160 = !_3104;
    int _3162 = _3160 ? 0 : 1;
    float _3164 = -_1412;
    float _3166 = fma(_1494, _3154, _3164);
    int _3168 = abs(_3140);
    float _3170 = _3158 + 0.5;
    int _3172 = ~_3156;
    int _3174 = _3172 + 1;
    int _3176 = _3174 + 1;
    float _3178 = _3166 + 0.5;
    bool _3180 = _3102 != 3;
    int _3182 = abs(_3162);
    int _3184 = _3176;
    if (_3118)
    {
        int _3186 = ~_3156;
        int _3188 = _3186 + 1;
        _3184 = _3188;
    }
    int _3190 = _3184;
    out.m_65.x = _3120;
    out.m_65.y = _3116;
    out.m_65.z = _3170;
    out.m_65.w = _3178;
    bool _3192 = !_3180;
    int _3194 = _3192 ? 0 : (-1);
    int _3196 = abs(_3190);
    int _3198 = ~_3168;
    int _3200 = _3198 + 1;
    int _3202 = _3200 + 1;
    int _3204 = abs(_3194);
    int _3206 = ~_3182;
    int _3208 = _3206 + 1;
    int _3210 = _3208 + 1;
    int _3212 = _3202 * as_type<int>(_3040);
    bool _3214 = !_2800;
    int _3216 = _3214 ? 0 : 1;
    int _3218 = _3210 * as_type<int>(_3032);
    int _3220 = _3218 + _3212;
    int _3222 = ~_3196;
    int _3224 = _3222 + 1;
    int _3226 = _3224 + 1;
    int _3228 = abs(_3216);
    int _3230 = ~_3204;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    int _3236 = _3226 * as_type<int>(_3068);
    int _3238 = _3236 + _3220;
    int _3240 = ~_3228;
    int _3242 = _3240 + 1;
    int _3244 = _3242 + 1;
    float _3246 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3248 = !_3152;
    int _3250 = _3248 ? 0 : (-1);
    int _3252 = _3234 * as_type<int>(_3076);
    int _3254 = _3252 + _3238;
    float _3256 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3258 = _3246 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3260 = ~_3130;
    int _3262 = _3260 + _3250;
    int _3264 = _3262 + 1;
    int _3266 = _3254 * _3244;
    float _3268 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3270 = _3256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3272 = _3058 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3274 = _1512 * _3264;
    int _3276 = _3274 + _2782;
    float _3278 = _3268 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3280 = _2272 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3282 = _2633 + _2508;
    float _3284 = _2546 + _2508;
    bool _3286 = !_2718;
    int _3288 = _3286 ? _3276 : (-1);
    out.m_67.x = _3278;
    out.m_67.y = _3270;
    out.m_67.z = _3258;
    out.m_67.w = _3272;
    bool _3290 = _2272 > 0.0;
    bool _3292 = isnan(_2272);
    bool _3294 = _3290 || _3292;
    bool _3296 = isnan(0.0);
    bool _3298 = _3294 || _3296;
    float _3300 = _3282 * 0.5;
    int _3302 = _3288 * _3228;
    int _3304 = _3302 + _3266;
    float _3306 = _2508 * 0.5;
    float _3308 = _3284 * 0.5;
    float _3310 = fma(_2552, -0.5, _3306);
    float _3312 = float(_3304);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _3314 = _2657 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3316 = _3280 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3312;
    float _3318 = _3314 * _2576;
    float _3320 = -_3314;
    float _3322 = _3320 + 1.0;
    out.m_73.x = _3308;
    out.m_73.y = _3310;
    out.m_73.z = _3300;
    out.m_73.w = _2508;
    float _3324 = _2587 * _3318;
    float _3326 = _2597 * _3318;
    float _3328 = _2587 * _3322;
    out.m_49.x = _3316;
    float _3330 = fma(_2593, _3324, _2581);
    float _3332 = fma(_2595, _3324, _2583);
    float _3334 = fma(_2587, _3326, _2585);
    out.m_75.x = _3330;
    out.m_75.y = _3332;
    out.m_75.z = _3334;
    out.m_75.w = _3328;
    if (_3298)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3336 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3336;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

