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
    bool _1118 = false;
    bool _848 = false;
    bool _748 = false;
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
        float _3351 = as_type<float>(_118);
        out.gl_Position.z = _3351;
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
        float _3406 = as_type<float>(_144);
        out.gl_Position.z = _3406;
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
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _478 = _468 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = 1.0 / _482;
    bool _498 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _500 = 1.0 / _490;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _504 = _468 + _502;
    float _506 = _442 * _472;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _510 = _468 + _508;
    float _512 = 1.0 / _494;
    float _514 = _444 * _474;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _518 = _468 + _516;
    float _520 = _510 * _496;
    bool _522 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _524 = isnan(_468);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _440 * _470;
    bool _536 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _538 = isnan(_468);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = 1.0 / _486;
    float _550 = _504 * _500;
    float _552 = -_532;
    float _554 = _552 + 1.0;
    bool _556 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _558 = isnan(_468);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = _478 * _512;
    bool _570 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _572 = isnan(_468);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = -_580;
    float _592 = _590 + 1.0;
    float _594 = fma(_584, _520, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _596 = _518 * _548;
    float _598 = _546 * _554;
    bool _600 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _602 = isnan(_468);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _612;
    float _616 = -_546;
    float _618 = _616 + 1.0;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _624 = fma(_588, _520, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _626 = _610 * _592;
    float _628 = -_610;
    float _630 = _628 + 1.0;
    float _632 = _580 * _618;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _642 = fma(_614, _520, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _644 = _566 * _630;
    float _646 = fma(_622, _596, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_636, _596, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = fma(_640, _596, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _652 = _642 * _644;
    float _654 = _594 * _644;
    float _656 = _624 * _644;
    float _658 = -_566;
    float _660 = _658 + 1.0;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _670;
    float _674 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].x, _652);
    float _676 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].z, _656);
    float _678 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].y, _654);
    float _680 = fma(_664, _550, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _682 = fma(_646, _626, _674);
    float _684 = fma(_650, _626, _676);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _694 = fma(_668, _550, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _696 = fma(_672, _550, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _698 = fma(_648, _626, _678);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _704 = fma(_680, _632, _682);
    float _706 = fma(_688, _568, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _708 = fma(_692, _568, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _710 = fma(_702, _568, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _712 = fma(_694, _632, _698);
    float _714 = fma(_696, _632, _684);
    float _716 = fma(_706, _598, _704);
    float _718 = fma(_708, _598, _712);
    float _720 = fma(_710, _598, _714);
    float _722 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].x, _716);
    float _724 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].y, _718);
    float _726 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].z, _720);
    bool _728 = !_498;
    float _746;
    if (!_728)
    {
        float _730 = in.m_53.x;
        float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _734 = _730 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _738 = _736 * _732;
        float _740 = floor(_738);
        float _742 = -_740;
        float _744 = _738 + _742;
        _746 = _744;
        _748 = true;
    }
    else
    {
        _746 = _156;
    }
    _748 = false;
    float _750 = _746;
    bool _752 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _754 = isnan(_750);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _768 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _770 = isnan(_750);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _780;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _786 = _750 + _784;
    float _788 = -_762;
    float _790 = _788 + 1.0;
    bool _792 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _794 = 1.0 / _766;
    float _796 = _778 * _790;
    float _798 = -_778;
    float _800 = _798 + 1.0;
    float _802 = _782 * _794;
    float _804 = _724 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _806 = fma(_802, _786, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _808 = _722 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _810 = _806 * _796;
    float _812 = _726 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[115].x, _810);
    float _816 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = _812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[116].x, _814);
    float _824 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _826 = !_792;
    float _828 = _820;
    float _846;
    if (!_826)
    {
        float _830 = in.m_53.x;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _834 = _830 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _838 = _836 * _832;
        float _840 = floor(_838);
        float _842 = -_840;
        float _844 = _838 + _842;
        _846 = _844;
        _848 = true;
    }
    else
    {
        _846 = _156;
    }
    _848 = false;
    float _850 = _846;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _854 = _850 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _858 = _850 + _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _862 = _850 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _872;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _880 = 1.0 / _866;
    bool _882 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _884 = isnan(_850);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = 1.0 / _870;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _898 = _850 + _896;
    float _900 = 1.0 / _874;
    float _902 = _854 * _880;
    bool _904 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _906 = isnan(_850);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    bool _916 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _918 = 1.0 / _878;
    float _920 = _858 * _894;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _926;
    float _930 = fma(_924, _902, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _932 = fma(_928, _902, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _934 = _862 * _900;
    float _936 = -_892;
    float _938 = _936 + 1.0;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _940;
    float _944 = fma(_942, _902, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _946 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _948 = isnan(_850);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _898 * _918;
    bool _960 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _962 = isnan(_850);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = _914 * _938;
    float _974 = -_914;
    float _976 = _974 + 1.0;
    bool _978 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _980 = isnan(_850);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = -_970;
    float _992 = _990 + 1.0;
    float _994 = _970 * _976;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1004 = _956 * _992;
    float _1006 = -_956;
    float _1008 = _1006 + 1.0;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1014 = fma(_998, _920, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1016 = fma(_1002, _920, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1018 = _988 * _1008;
    float _1020 = fma(_1012, _920, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1022 = _932 * _1018;
    float _1024 = _930 * _1018;
    float _1026 = -_988;
    float _1028 = _1026 + 1.0;
    float _1030 = _944 * _1018;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1040;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1024);
    float _1046 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1022);
    float _1048 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1030);
    float _1050 = fma(_1034, _934, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1052 = fma(_1038, _934, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1054 = fma(_1042, _934, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1056 = fma(_1014, _1004, _1044);
    float _1058 = fma(_1020, _1004, _1046);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1068 = fma(_1016, _1004, _1048);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1074 = fma(_1050, _994, _1056);
    float _1076 = fma(_1062, _958, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1078 = fma(_1066, _958, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1080 = fma(_1052, _994, _1058);
    float _1082 = fma(_1072, _958, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1084 = fma(_1054, _994, _1068);
    float _1086 = fma(_1076, _972, _1074);
    float _1088 = fma(_1078, _972, _1080);
    float _1090 = fma(_1082, _972, _1084);
    float _1092 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1086);
    float _1094 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1088);
    float _1096 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1090);
    bool _1098 = !_916;
    float _1116;
    if (!_1098)
    {
        float _1100 = in.m_53.x;
        float _1102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1104 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1108 = _1106 * _1102;
        float _1110 = floor(_1108);
        float _1112 = -_1110;
        float _1114 = _1108 + _1112;
        _1116 = _1114;
        _1118 = true;
    }
    else
    {
        _1116 = _156;
    }
    _1118 = false;
    float _1120 = _1116;
    float _1122 = in.m_42.x;
    float _1124 = in.m_42.y;
    float _1126 = in.m_42.z;
    float _1128 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1130 = in.m_53.x;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1134 = _1132 != 0;
    float _1136 = in.m_53.y;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1142 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1144 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1142);
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1148 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1150 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1152 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1154 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1144);
    float _1156 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1158 = _1130 * 2.0;
    float _1160 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1152);
    float _1162 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1148);
    float _1164 = in.m_53.z;
    float _1166 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1168 = -_1138;
    float _1170 = fma(_1156, 2.0, _1168);
    float _1172 = _1136 * 2.0;
    float _1174 = floor(_1158);
    float _1176 = fma(_1166, -2.0, _1140);
    float _1178 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1150);
    float _1180 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1160);
    float _1182 = _1130 + _1136;
    float _1184 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1186 = floor(_1172);
    float _1188 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1178);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1192 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1184);
    float _1194 = _1182 + (-1.0);
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1198 = _1174 > 0.0;
    float _1200 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1192);
    bool _1202 = _1174 >= 0.0;
    bool _1204 = isnan(_1174);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan(0.0);
    bool _1210 = _1206 || _1208;
    float _1212 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1162);
    float _1214 = _1192;
    float _1216 = _1162;
    float _1218 = _1126;
    float _1220 = _1178;
    float _1222 = _1136;
    if (!_1134)
    {
        _1214 = _1136;
    }
    float _1224 = _1214;
    float _1226 = _1164 * 2.0;
    float _1228 = _1224;
    if (!_1134)
    {
        _1216 = _1130;
    }
    float _1230 = _1216;
    float _1232 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1234 = _1230;
    if (!_1134)
    {
        _1218 = _1164;
    }
    float _1236 = _1218;
    float _1238 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1240 = int(_1238);
    float _1242 = _1236;
    if (_1134)
    {
        _1228 = _1130;
    }
    float _1244 = _1228;
    float _1246 = -_100;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1170);
    if (_1134)
    {
        _1234 = _1164;
    }
    float _1250 = _1234;
    float _1252 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1176);
    bool _1254 = _1186 > 0.0;
    float _1256 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1258 = _1186;
    if (!_1134)
    {
        _1220 = _1236;
    }
    float _1260 = _1220;
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1190);
    float _1264 = -_1146;
    float _1266 = fma(_1256, 2.0, _1264);
    float _1268 = _1260;
    if (_1134)
    {
        _1268 = _1136;
    }
    float _1270 = _1268;
    float _1272 = floor(_1226);
    bool _1274 = _1186 >= 0.0;
    bool _1276 = isnan(_1186);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1134)
    {
        _1258 = _1136;
    }
    float _1286 = _1258;
    float _1288 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1290 = _1210 ? 0 : 1;
    float _1292 = _1130 + _1164;
    float _1294 = fma(_1288, -2.0, _1284);
    float _1296 = _1286;
    if (_1134)
    {
        _1296 = _1130;
    }
    float _1298 = _1296;
    float _1300 = _1292 + (-1.0);
    int _1302 = _1282 ? 0 : 1;
    float _1304 = rsqrt(_1154);
    int _1306 = ~_1290;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    float _1312 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1196);
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1316 = _1314 != 0;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1324 = _1322 != 0;
    float _1326 = -_100;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1266);
    int _1330 = _1310;
    if (!_1198)
    {
        int _1332 = ~_1290;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1262);
    int _1340 = ~_1302;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    float _1346 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1348 = log2(_1346);
    int _1350 = _1344;
    if (!_1254)
    {
        int _1352 = ~_1302;
        int _1354 = _1352 + 1;
        _1350 = _1354;
    }
    int _1356 = _1350;
    float _1358 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1294);
    float _1360 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1362 = !_1320;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1368 = !_1316;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1374 = !_1324;
    int _1376 = _1374 ? 0 : 1;
    float _1378 = _1136 + _1164;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1390 = _1388 != 0;
    float _1392 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1378 + (-1.0);
    bool _1396 = !_1390;
    int _1398 = _1396 ? 0 : 1;
    float _1400 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1402 = !_1386;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1408 = abs(_1398);
    float _1410 = float(_1240);
    bool _1412 = _1272 > 0.0;
    bool _1414 = _1272 >= 0.0;
    bool _1416 = isnan(_1272);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.0);
    bool _1422 = _1418 || _1420;
    float _1424 = _1348 * _100;
    float _1426 = 1.0 / _1410;
    if (_1134)
    {
        _1242 = _1136;
    }
    float _1428 = _1242;
    int _1430 = abs(_1404);
    float _1432 = float(_1356);
    float _1434 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1406);
    float _1436 = float(_1408);
    float _1438 = exp2(_1424);
    float _1440 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1434);
    float _1442 = float(_1336);
    float _1444 = _1436 * _1432;
    float _1446 = in.m_57.x;
    float _1448 = in.m_57.y;
    float _1450 = in.m_57.z;
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1454 = 1.0 + _1452;
    float _1456 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1458 = int(_1456);
    float _1460 = _1426 * _100;
    float _1462 = float(_1430);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1466 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1468 = isnan(1.0);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1474 = _1470 || _1472;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1478 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1480 = isnan(0.0);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1486 = _1482 || _1484;
    float _1488 = 1.0 / _1454;
    float _1490 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1464);
    float _1492 = -_1438;
    float _1494 = _1492 + 1.0;
    float _1496 = _1462 * _1442;
    float _1498 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1476);
    float _1500 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1490);
    int _1502 = _1422 ? 0 : 1;
    float _1504 = _1496 * (-2.0);
    float _1506 = float(_1458);
    float _1508 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1498);
    float _1510 = _1486 ? _1494 : 0.0;
    float _1512 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1312);
    float _1514 = fma(_1400, _1504, _1400);
    float _1516 = _1506 * _100;
    float _1518 = fma(_1504, _1448, _1448);
    float _1520 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1474)
    {
        float _1522 = _1510 * _1488;
        _110 = _1522;
    }
    float _1524 = _110;
    float _1526 = _1136 + (-0.5);
    int _1528 = ~_1502;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    int _1534 = _1532;
    if (!_1412)
    {
        int _1536 = ~_1502;
        int _1538 = _1536 + 1;
        _1534 = _1538;
    }
    int _1540 = _1534;
    float _1542 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1518);
    float _1544 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1546 = _1520 * _1520;
    float _1548 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1550 = fma(_1544, _1544, _1546);
    bool _1552 = !_1382;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1556;
    float _1560 = _1444 * (-2.0);
    float _1562 = fma(_1548, _1548, _1550);
    int _1564 = abs(_1554);
    float _1566 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1568 = fma(_1372, _1560, _1372);
    float _1570 = fma(_1560, _1450, _1450);
    float _1572 = fma(_1514, _1524, _1542);
    float _1574 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1576 = _1164 + (-0.5);
    float _1578 = _1572 * 0.15915493667125701904296875;
    float _1580 = float(_1540);
    float _1582 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1566);
    float _1584 = float(_1564);
    float _1586 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1570);
    float _1588 = rsqrt(_1562);
    float _1590 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1582);
    float _1592 = _1584 * _1580;
    float _1594 = _1592 * (-2.0);
    float _1596 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1598 = fma(_1568, _1524, _1586);
    float _1600 = _1130 + (-0.5);
    float _1602 = in.m_59.x;
    float _1604 = in.m_59.y;
    float _1606 = in.m_59.z;
    float _1608 = -_1596;
    float _1610 = _1392 + _1608;
    float _1612 = fma(_1594, _1446, _1446);
    float _1614 = 1.0 / _1558;
    float _1616 = fma(_1232, _1594, _1232);
    bool _1618 = _1596 >= _1392;
    bool _1620 = isnan(_1596);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(_1392);
    bool _1626 = _1622 || _1624;
    float _1628 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1612);
    float _1630 = abs(_1610);
    float _1632 = precise::max(_1630, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1634 = _1598 * 0.15915493667125701904296875;
    float _1636 = _1544 * _1588;
    float _1638 = fma(_1616, _1524, _1628);
    float _1640 = precise::min(_1632, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1642 = _1634 * 6.283185482025146484375;
    float _1644 = sin(_1642);
    bool _1646 = !_1626;
    float _1648 = _1646 ? 1.0 : (-1.0);
    float _1650 = _1638 * 0.15915493667125701904296875;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1654 = _1640 + _1652;
    float _1656 = _1520 * _1588;
    float _1658 = _1548 * _1588;
    float _1660 = _1654 * _1614;
    float _1662 = _1634 * 6.283185482025146484375;
    float _1664 = cos(_1662);
    float _1666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1602);
    float _1668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1606);
    float _1670 = _1648 * _1660;
    float _1672 = _1578 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    float _1676 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1678 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1680 = _1678 * _1670;
    float _1682 = _1578 * 6.283185482025146484375;
    float _1684 = cos(_1682);
    float _1686 = _1650 * 6.283185482025146484375;
    float _1688 = sin(_1686);
    float _1690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1604);
    float _1692 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1694 = _1676 * _1668;
    float _1696 = _1128 * _1690;
    float _1698 = _1692 * _1666;
    float _1700 = _1680 * 0.15915493667125701904296875;
    float _1702 = _1650 * 6.283185482025146484375;
    float _1704 = cos(_1702);
    float _1706 = _1664 * _1696;
    float _1708 = _1684 * _1664;
    float _1710 = _1674 * _1664;
    float _1712 = _1688 * _1674;
    float _1714 = -_1696;
    float _1716 = _1644 * _1714;
    float _1718 = _1700 * 6.283185482025146484375;
    float _1720 = cos(_1718);
    float _1722 = fma(_1708, _1698, _1716);
    float _1724 = _1704 * _1684;
    float _1726 = _1704 * _1674;
    float _1728 = _1704 * _1706;
    float _1730 = _1688 * _1684;
    float _1732 = fma(_1644, _1724, _1712);
    float _1734 = _1688 * _1706;
    float _1736 = fma(_1710, _1694, _1722);
    float _1738 = -_1730;
    float _1740 = fma(_1644, _1726, _1738);
    float _1742 = fma(_1732, _1698, _1728);
    float _1744 = -_1726;
    float _1746 = fma(_1644, _1730, _1744);
    float _1748 = _1700 * 6.283185482025146484375;
    float _1750 = sin(_1748);
    float _1752 = fma(_1644, _1712, _1724);
    float _1754 = fma(_1740, _1694, _1742);
    float _1756 = fma(_1746, _1698, _1734);
    float _1758 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1762 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1764 = fma(_1752, _1694, _1756);
    float _1766 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1758);
    float _1768 = -_1720;
    float _1770 = _1768 + 1.0;
    float _1772 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1760);
    float _1774 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1762);
    float _1776 = _1658 * _1658;
    float _1778 = _1656 * _1770;
    float _1780 = _1636 * _1750;
    float _1782 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1766);
    float _1784 = _1656 * _1750;
    float _1786 = fma(_1770, _1776, _1720);
    float _1788 = _1658 * _1750;
    float _1790 = _1636 * _1770;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1772);
    float _1794 = fma(_1658, _1778, _1780);
    float _1796 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1798 = -_1788;
    float _1800 = fma(_1656, _1790, _1798);
    float _1802 = -_1784;
    float _1804 = fma(_1658, _1790, _1802);
    float _1806 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1808 = _1796 * _1794;
    float _1810 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1774);
    float _1812 = fma(_1636, _1790, _1720);
    float _1814 = _1796 * _1800;
    float _1816 = fma(_1806, _1804, _1808);
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1820 = fma(_1656, _1790, _1788);
    float _1822 = fma(_1806, _1812, _1814);
    float _1824 = fma(_1658, _1790, _1784);
    float _1826 = fma(_1818, _1786, _1816);
    float _1828 = fma(_1656, _1778, _1720);
    float _1830 = -_1780;
    float _1832 = fma(_1658, _1778, _1830);
    float _1834 = fma(_1818, _1824, _1822);
    float _1836 = _1366 + _1826;
    float _1838 = _1796 * _1828;
    float _1840 = _1574 + _1834;
    float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1844 = _1836 + _1842;
    float _1846 = fma(_1806, _1820, _1838);
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1850 = _1840 + _1848;
    float _1852 = _1844 * _1844;
    float _1854 = fma(_1818, _1832, _1846);
    float _1856 = fma(_1850, _1850, _1852);
    float _1858 = _1360 + _1854;
    float _1860 = sqrt(_1856);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = _1854;
    float _1866 = _1656;
    float _1868 = _1846;
    if (!_1862)
    {
        _1864 = _1840;
    }
    float _1870 = _1864;
    float _1872 = _1870;
    if (!_1862)
    {
        _1866 = _1836;
    }
    float _1874 = _1866;
    float _1876 = _1874;
    if (!_1862)
    {
        _1868 = _1858;
    }
    float _1878 = _1868;
    bool _1880 = !_1862;
    float _1882 = _1878;
    if (!_1880)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1888 = _1860 + _1886;
        float _1890 = rsqrt(_1856);
        float _1892 = _1888 * _1884;
        float _1894 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1896 = _1892 * 0.15915493667125701904296875;
        float _1898 = _1896 * 6.283185482025146484375;
        float _1900 = sin(_1898);
        float _1902 = _1896 * 6.283185482025146484375;
        float _1904 = cos(_1902);
        float _1906 = fma(_1900, _1894, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1908 = _1890 * _1906;
        float _1910 = _1904 + (-1.0);
        float _1912 = fma(_1850, _1908, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1914 = fma(_1844, _1908, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1916 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1918 = fma(_1858, _1904, _1916);
        _1882 = _1918;
        _1872 = _1912;
        _1876 = _1914;
    }
    float _1920 = _1882;
    float _1922 = _1872;
    float _1924 = _1876;
    float _1926 = -_1360;
    float _1928 = _1926 + _1920;
    float _1930 = -_1574;
    float _1932 = _1930 + _1922;
    float _1934 = -_1366;
    float _1936 = _1934 + _1924;
    float _1938 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1940 = _1928 * _1928;
    float _1942 = fma(_1932, _1932, _1940);
    float _1944 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1938);
    float _1946 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1948 = fma(_1936, _1936, _1942);
    float _1950 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1944);
    float _1952 = sqrt(_1948);
    float _1954 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1956 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1946);
    float _1958 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1956);
    bool _1960 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan(0.5);
    bool _1968 = _1964 || _1966;
    float _1970 = 1.0 / _1954;
    float _1972 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1974 = _1972 + _1954;
    bool _1976 = _1952 > 0.0;
    bool _1978 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1980 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan(0.5);
    bool _1986 = _1982 || _1984;
    float _1988 = _1974 * _1970;
    float _1990 = _1988 * 0.5;
    bool _1992 = !_1976;
    float _1994 = _1920;
    float _1996 = _1932;
    float _1998 = _1922;
    float _2000 = _1924;
    float _2002 = _1954;
    float _2004 = _1928;
    float _2006 = _1936;
    float _2008 = _1948;
    float _2010 = _1972;
    float _2012 = _1970;
    if (!_1992)
    {
        float _2014 = _172 * _172;
        float _2016 = rsqrt(_1948);
        float _2018 = fma(_170, _170, _2014);
        float _2020 = fma(_174, _174, _2018);
        float _2022 = sqrt(_2020);
        float _2024 = _1932 * _2016;
        float _2026 = _1928 * _2016;
        bool _2028 = _2022 > 0.0;
        float _2030 = _1936 * _2016;
        bool _2032 = !_2028;
        _2002 = _2020;
        _2008 = _2016;
        _2010 = _2030;
        if (!_2032)
        {
            float _2034 = rsqrt(_2020);
            float _2036 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2038 = _172 * _2034;
            float _2040 = _170 * _2034;
            float _2042 = _174 * _2034;
            float _2044 = _2026 * _2038;
            float _2046 = fma(_2024, _2040, _2044);
            float _2048 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2050 = fma(_2030, _2042, _2046);
            float _2052 = _2050 * _2048;
            float _2054 = fma(_170, _2052, _1922);
            float _2056 = fma(_172, _2052, _1920);
            float _2058 = fma(_174, _2052, _1924);
            _1994 = _2056;
            _1996 = _2046;
            _1998 = _2054;
            _2000 = _2058;
            _2004 = _2052;
            _2006 = _2044;
            _2008 = _2048;
        }
    }
    float _2060 = _1994;
    float _2062 = _1996;
    float _2064 = _1998;
    float _2066 = _2000;
    float _2068 = _2002;
    float _2070 = _2004;
    float _2072 = _2006;
    float _2074 = _2008;
    float _2076 = _2010;
    float _2078 = _2068;
    float _2080 = _2070;
    float _2082 = _2064;
    float _2084 = _2066;
    float _2086 = _2062;
    float _2088 = _2076;
    if (_1986)
    {
        _2078 = 1.0;
    }
    float _2090 = _2078;
    float _2092 = _2090;
    if (_1968)
    {
        _2080 = _2060;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (!_1968)
    {
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2100 = _1360 + _2098;
        float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2104 = _1574 + _2102;
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2108 = -_1360;
        float _2110 = _2108 + _2060;
        float _2112 = _2100 * _2100;
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2116 = _1366 + _2114;
        float _2118 = fma(_2104, _2104, _2112);
        float _2120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2122 = fma(_2116, _2116, _2118);
        float _2124 = sqrt(_2122);
        float _2126 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2128 = precise::min(_2124, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2130 = _2128 * _2120;
        float _2132 = -_1574;
        float _2134 = _2132 + _2064;
        float _2136 = -_1366;
        float _2138 = _2136 + _2066;
        float _2140 = _2126 * _2130;
        float _2142 = fma(_2134, _2140, _1574);
        float _2144 = fma(_2110, _2140, _1360);
        float _2146 = fma(_2138, _2140, _1366);
        _2096 = _2144;
        _2082 = _2142;
        _2084 = _2146;
        _2086 = _2140;
    }
    float _2148 = _2096;
    float _2150 = _2082;
    float _2152 = _2084;
    float _2154 = _2086;
    float _2156 = _2154;
    if (!_1986)
    {
        float _2158 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2160 = _2158 * 0.15915493667125701904296875;
        float _2162 = _2160 * 6.283185482025146484375;
        float _2164 = cos(_2162);
        float _2166 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2168 = _2166 * 0.15915493667125701904296875;
        float _2170 = _2160 * 6.283185482025146484375;
        float _2172 = sin(_2170);
        float _2174 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2176 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2174);
        float _2178 = 1.0 / _2164;
        float _2180 = _2168 * 6.283185482025146484375;
        float _2182 = cos(_2180);
        float _2184 = _2172 * _2178;
        float _2186 = 1.0 / _2176;
        float _2188 = _2182 * _2184;
        float _2190 = _2168 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2196 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2194;
        float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2200 = _2186 * _2198;
        float _2202 = 1.0 / _2188;
        float _2204 = 1.0 / _2196;
        float _2206 = _2192 * _2202;
        float _2208 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2210 = fma(_2206, _2200, _2208);
        float _2212 = _2210 * _2204;
        float _2214 = precise::clamp(_2212, 0.0, 1.0);
        _2156 = _2160;
        _2092 = _2214;
    }
    float _2216 = _2156;
    float _2218 = _2092;
    float _2220 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2222 = _2148 + _2220;
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2226 = _2150 + _2224;
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2230 = _2152 + _2228;
    float _2232 = _2222 * _2222;
    float _2234 = fma(_2226, _2226, _2232);
    float _2236 = fma(_2230, _2230, _2234);
    float _2238 = rsqrt(_2236);
    float _2240 = sqrt(_2236);
    float _2242 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2244 = _2226 * _2242;
    float _2246 = _2230 * _2242;
    float _2248 = _2244 * _2244;
    float _2250 = _2246 * _2246;
    float _2252 = _2248 + _2250;
    float _2254 = sqrt(_2252);
    bool _2256 = _2254 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2260 = _2254 + _2258;
    float _2262 = _2072;
    float _2264 = _2260;
    float _2266 = _2222;
    float _2268 = _2246;
    float _2270 = _2248;
    float _2272 = _2250;
    if (_2256)
    {
        float _2274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2262 = _2274;
    }
    float _2276 = _2262;
    if (_2256)
    {
        float _2278 = _2260 * _2276;
        _2264 = _2278;
    }
    float _2280 = _2264;
    if (_2256)
    {
        float _2282 = _2280 * 0.15915493667125701904296875;
        _2012 = _2282;
    }
    float _2284 = _2012;
    float _2286 = _2074;
    if (_2256)
    {
        float _2288 = _2284 * 6.283185482025146484375;
        float _2290 = sin(_2288);
        _2286 = _2290;
    }
    float _2292 = _2286;
    float _2294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2296 = precise::max(0.0, _2294);
    float _2298 = _2216;
    float _2300 = _2296;
    if (_2256)
    {
        float _2302 = _2284 * 6.283185482025146484375;
        float _2304 = cos(_2302);
        _2298 = _2304;
    }
    float _2306 = _2298;
    float _2308 = -_2242;
    float _2310 = -_2296;
    float _2312 = fma(_2222, _2308, _2310);
    if (!_2256)
    {
        _2266 = _2244;
    }
    float _2314 = _2266;
    float _2316 = _2294;
    float _2318 = _2314;
    if (_2256)
    {
        float _2320 = rsqrt(_2252);
        _2316 = _2320;
    }
    float _2322 = _2316;
    if (_2256)
    {
        float _2324 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2300 = _2324;
    }
    float _2326 = _2300;
    float _2328 = _2326;
    if (_2256)
    {
        float _2330 = fma(_2292, _2326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2088 = _2330;
    }
    float _2332 = _2088;
    float _2334 = _2332;
    if (_2256)
    {
        float _2336 = _2306 + (-1.0);
        _2328 = _2336;
    }
    float _2338 = _2328;
    float _2340 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2342 = _2338;
    if (_2256)
    {
        float _2344 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2342 = _2344;
    }
    float _2346 = _2342;
    float _2348 = _2322;
    if (_2256)
    {
        float _2350 = _2322 * _2332;
        _2334 = _2350;
    }
    float _2352 = _2334;
    if (!_2256)
    {
        _2348 = _2312;
    }
    float _2354 = _2348;
    float _2356 = _2354;
    if (_2256)
    {
        float _2358 = fma(_2312, _2306, _2346);
        _2356 = _2358;
    }
    float _2360 = _2356;
    if (_2256)
    {
        float _2362 = _2244 * _2352;
        _2318 = _2362;
    }
    float _2364 = _2318;
    if (_2256)
    {
        float _2366 = _2246 * _2352;
        _2268 = _2366;
    }
    float _2368 = _2268;
    if (_2256)
    {
        float _2370 = _2364 * _2364;
        _2270 = _2370;
    }
    float _2372 = _2270;
    if (_2256)
    {
        float _2374 = _2368 * _2368;
        _2272 = _2374;
    }
    float _2376 = _2272;
    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2380 = fma(_2240, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2378);
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2386 = fma(_2360, _2360, _2372);
    float _2388 = -_2382;
    float _2390 = _2388 + 1.0;
    float _2392 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2384);
    float _2394 = _2386 + _2376;
    float _2396 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2398 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2400 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2392);
    float _2402 = abs(_2390);
    float _2404 = log2(_2402);
    float _2406 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2396);
    float _2408 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2410 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2412 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2406);
    float _2414 = rsqrt(_2394);
    float _2416 = _2412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2418 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2408);
    float _2420 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2398);
    float _2422 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2424 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2418);
    float _2426 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2420);
    float _2428 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2430 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2432 = _2424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2434 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2436 = -_2422;
    float _2438 = fma(_2436, _2340, 1.0);
    float _2440 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2428);
    float _2442 = exp2(_2430);
    float _2444 = _2414 * _2364;
    float _2446 = _2414 * _2360;
    float _2448 = _2414 * _2368;
    float _2450 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2440);
    float _2452 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2454 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2450);
    float _2456 = -_2452;
    float _2458 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2456);
    float _2460 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2462 = log2(_2438);
    float _2464 = -_2448;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2458);
    float _2468 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2470 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2460);
    float _2472 = fma(_2466, -0.5, 0.5);
    float _2474 = fma(_2466, 0.5, 0.5);
    float _2476 = 1.0 / _2454;
    float _2478 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2468);
    float _2480 = _2446 + 1.0;
    float _2482 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2470);
    float _2484 = fma(_2474, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2486 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2478);
    float _2488 = -_2446;
    float _2490 = fma(_2442, _2480, _2488);
    float _2492 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2482);
    float _2494 = sqrt(_2472);
    float _2496 = fma(_2474, _2484, -0.212114393711090087890625);
    float _2498 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2486);
    float _2500 = _2462 * 0.693147182464599609375;
    float _2502 = fma(_2490, 0.5, 0.5);
    float _2504 = fma(_2474, _2496, 1.570728778839111328125);
    float _2506 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2508 = _2498 * _2476;
    float _2510 = _2492 * _2476;
    float _2512 = fma(_2510, 0.5, 0.5);
    float _2514 = _2494 * 0.636619746685028076171875;
    float _2516 = fma(_2508, -0.5, 0.5);
    float _2518 = -_2504;
    float _2520 = fma(_2514, _2518, 1.0);
    float3 _7230 = float3(_2512, _2516, _2506);
    float _2522 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7230, float3(0.0), isnan(_7230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7230, float3(0.0), isnan(_7230)), level(0.0)).x;
    float3 _7241 = float3(_2512, _2516, _2506);
    float4 _2525 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7241, float3(0.0), isnan(_7241)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7241, float3(0.0), isnan(_7241)), level(0.0)).xyzw;
    float _2527 = _2525.x;
    float _2529 = _2525.y;
    float _2531 = _2525.z;
    float _2533 = _2525.w;
    float2 _7258 = float2(_2520, _2502);
    float3 _2537 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7258, float2(0.0), isnan(_7258)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7258, float2(0.0), isnan(_7258)), level(0.0)).xyz;
    float _2539 = _2537.x;
    float _2541 = _2537.y;
    float _2543 = _2537.z;
    float _2545 = float(uint(_1458));
    float _2547 = trunc(_1460);
    int _2549 = int(_2547);
    int _2551 = ~_1458;
    int _2553 = _2551 + 1;
    out.m_61.x = _816;
    out.m_61.y = _818;
    out.m_61.z = _820;
    out.m_61.w = _824;
    int _2555 = abs(_1364);
    float _2557 = _1338 * (-0.15915493667125701904296875);
    float _2559 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2561 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2563 = 1.0 / _2545;
    float _2565 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2561);
    bool _2567 = !_1134;
    float _2569 = _2567 ? 7.345489978790283203125 : 1.0;
    float _2571 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2565);
    float _2573 = float(uint(_2549));
    float _2575 = exp2(_2559);
    float _2577 = float(_2549);
    float _2579 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2571);
    bool _2581 = _2577 >= _1506;
    bool _2583 = isnan(_2577);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(_1506);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    int _2593 = as_type<int>(_2563) + (-2);
    out.gl_Position.x = _2492;
    out.gl_Position.y = _2498;
    out.gl_Position.z = _2579;
    out.gl_Position.w = _2454;
    float _2595 = trunc(_2591);
    int _2597 = int(_2595);
    float _2599 = as_type<float>(_2593) * _2573;
    float _2601 = -_2575;
    float _2603 = _2601 + 1.0;
    float _2605 = trunc(_2599);
    float _2607 = precise::max(_2605, 0.0);
    uint _2610 = uint(_2607);
    int _2612 = _2553 * int(_2610);
    int _2614 = _2612 + _2549;
    float _2616 = float(uint(_2614));
    float _2618 = as_type<float>(_2593) * _2616;
    float _2620 = _2569 * _1130;
    float _2622 = floor(_2620);
    float _2624 = trunc(_2618);
    float _2626 = precise::max(_2624, 0.0);
    uint _2628 = uint(_2626);
    int _2630 = int(_2610) + int(_2628);
    float _2632 = -_2622;
    float _2634 = _2620 + _2632;
    int _2636 = _2553 * _2630;
    int _2638 = _2636 + _2549;
    int _2640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2642 = _2640 != 0;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2646 = _2644 != 0;
    bool _2648 = uint(_2638) >= uint(_1458);
    float _2650 = _2634 * _1506;
    float _2652 = _1516 * _152;
    int _2654 = _1458 + (-1);
    bool _2656 = !_2648;
    int _2658 = _2656 ? 0 : (-1);
    float _2660 = trunc(_2650);
    int _2662 = int(_2660);
    bool _2664 = _1458 == 0;
    int _2666 = ~_2630;
    int _2668 = _2666 + _2658;
    int _2670 = _2668 + 1;
    int _2672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2674 = _2672 != 0;
    int _2676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2678 = _2676 != 0;
    int _2680 = _1458 * _2670;
    int _2682 = _2680 + _2549;
    int _2684 = ~_2597;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    float _2690 = trunc(_2652);
    int _2692 = int(_2690);
    bool _2694 = !_2664;
    int _2696 = _2694 ? _2682 : (-1);
    bool _2698 = !_2642;
    int _2700 = _2698 ? 0 : 1;
    int _2702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2704 = _2702 != 0;
    int _2706 = _2696 * _2688;
    int _2708 = abs(_2700);
    float _2710 = in.m_63.x;
    int _2712 = abs(_1370);
    int _2714 = _2597 * _2654;
    int _2716 = _2714 + _2706;
    int _2718 = abs(_1376);
    int _2720 = _2716 * _2555;
    bool _2722 = !_2704;
    int _2724 = _2722 ? 0 : 1;
    int _2726 = _2662 * _2708;
    int _2728 = _2726 + _2549;
    int _2730 = _2692 * _2712;
    int _2732 = _2730 + _2720;
    int _2734 = abs(_2724);
    int _2736 = ~_1458;
    int _2738 = _2736 + 1;
    int _2740 = _2728 * _2718;
    int _2742 = _2740 + _2732;
    int _2744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2746 = _2744 != 0;
    int _2748 = _2662 * _2734;
    int _2750 = _2748 + _2742;
    float _2752 = in.m_53.w;
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2754;
    int _2758 = as_type<int>(_2710);
    if (!_2678)
    {
        _828 = _2710;
    }
    float _2760 = _828;
    float _2762 = float(uint(_2750));
    float _2764 = as_type<float>(_2593) * _2762;
    int _2766 = ~_1458;
    int _2768 = _2766 + 1;
    float _2770 = trunc(_2764);
    float _2772 = precise::max(_2770, 0.0);
    uint _2774 = uint(_2772);
    bool _2776 = _2752 > 0.5;
    int _2778 = _2768 * int(_2774);
    int _2780 = _2778 + _2750;
    float _2782 = float(uint(_2780));
    float _2784 = as_type<float>(_2593) * _2782;
    float _2786 = in.m_63.y;
    float _2788 = trunc(_2784);
    float _2790 = precise::max(_2788, 0.0);
    uint _2792 = uint(_2790);
    int _2794 = int(_2774) + int(_2792);
    float _2796 = -_2786;
    float _2798 = _2796 + 1.0;
    int _2800 = _2738 * _2794;
    int _2802 = _2800 + _2750;
    float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2806 = _2804 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2808 = float(uint(_2728));
    bool _2810 = uint(_2802) >= uint(_1458);
    float _2812 = 1.0 / _2806;
    int _2814 = _2776 ? as_type<int>(_2798) : as_type<int>(_2786);
    float _2816 = as_type<float>(_2593) * _2808;
    bool _2818 = !_2810;
    int _2820 = _2818 ? 0 : (-1);
    int _2822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2824 = _2822 != 0;
    bool _2826 = _1136 > 0.5;
    float _2828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2830 = ~_2794;
    int _2832 = _2830 + _2820;
    int _2834 = _2832 + 1;
    float _2836 = _2824 ? as_type<float>(_2814) : _2786;
    float _2838 = _2786;
    bool _2840 = _2826;
    bool _2842 = _2824;
    float _2844 = _2760;
    if (_2646)
    {
        float _2846 = _2826 ? _2798 : _2786;
        _2838 = _2846;
    }
    float _2848 = _2838;
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2852 = _1120 + _2850;
    if (_2674)
    {
        bool _2854 = _1164 > 0.5;
        _2840 = _2854;
    }
    bool _2856 = _2840;
    int _2858 = _1458 * _2834;
    int _2860 = _2858 + _2750;
    if (_2678)
    {
        bool _2862 = _1130 > 0.5;
        _2842 = _2862;
    }
    bool _2864 = _2842;
    float _2866 = _2756 * _2812;
    bool _2868 = _1120 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2870 = isnan(_1120);
    bool _2872 = _2868 || _2870;
    bool _2874 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2876 = _2872 || _2874;
    float _2878 = float(_2876);
    float _2880 = trunc(_2816);
    float _2882 = precise::max(_2880, 0.0);
    uint _2884 = uint(_2882);
    bool _2886 = !_2664;
    int _2888 = _2886 ? _2860 : (-1);
    float _2890 = fma(_2866, _2852, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2892 = _1120 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2894 = isnan(_1120);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2900 = _2896 || _2898;
    float _2902 = float(_2900);
    float _2904 = -_2878;
    float _2906 = _2904 + 1.0;
    int _2908 = _2888 >> 31;
    float _2910 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2912 = ~_1458;
    int _2914 = _2912 + 1;
    float _2916 = _2902 * _2906;
    int _2918 = _2908 & 3;
    float _2920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2922 = _2916;
    if (!_2678)
    {
        _1222 = _2760;
    }
    float _2924 = _1222;
    float _2926 = fma(_2836, _2910, -0.5);
    int _2928 = _2888 + _2918;
    float _2930 = _2890 * _2916;
    float _2932 = _2924;
    if (_2678)
    {
        _2844 = _2710;
    }
    float _2934 = _2844;
    int _2936 = _2914 * int(_2884);
    int _2938 = _2936 + _2728;
    int _2940 = _2928 >> 2;
    float _2942 = -_2902;
    float _2944 = _2942 + 1.0;
    int _2946 = _2938;
    if (!_2674)
    {
        _2922 = _2934;
    }
    float _2948 = _2922;
    float _2950 = _2948;
    if (_2674)
    {
        float _2952 = -_2934;
        float _2954 = _2952 + 1.0;
        _2758 = as_type<int>(_2954);
    }
    int _2956 = _2758;
    int _2958 = _2940 << 4;
    int _2960 = _2958 + 368;
    float _2962 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2930);
    float _2964 = float(uint(_2938));
    if (_2678)
    {
        float _2966 = -_2934;
        float _2968 = _2966 + 1.0;
        _2946 = as_type<int>(_2968);
    }
    int _2970 = _2946;
    uint _2972 = uint(int(uint(_2960) >> uint(2)));
    uint _2974 = uint(int(uint(int(_2972)) >> uint(2)));
    int _2976 = int(_2972) & 3;
    float _2978 = (*spvDescriptorSet0.vp_c9)._m0[int(_2974)][_2976];
    int _2980 = int(_2972) + 1;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    int _2984 = _2980 & 3;
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[int(_2982)][_2984];
    if (_2674)
    {
        float _2988 = _2856 ? as_type<float>(_2956) : _2934;
        _2950 = _2988;
    }
    float _2990 = _2950;
    float _2992 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2994 = as_type<float>(_2593) * _2964;
    float _2996 = _2557 * 6.283185482025146484375;
    float _2998 = sin(_2996);
    if (_2678)
    {
        float _3000 = _2864 ? as_type<float>(_2970) : _2934;
        _2932 = _3000;
    }
    float _3002 = _2932;
    float _3004 = fma(_2878, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2962);
    int _3006 = _2960 + 8;
    uint _3008 = uint(int(uint(_3006) >> uint(2)));
    uint _3010 = uint(int(uint(int(_3008)) >> uint(2)));
    int _3012 = int(_3008) & 3;
    float _3014 = (*spvDescriptorSet0.vp_c9)._m0[int(_3010)][_3012];
    int _3016 = int(_3008) + 1;
    uint _3018 = uint(int(uint(_3016) >> uint(2)));
    int _3020 = _3016 & 3;
    float _3022 = (*spvDescriptorSet0.vp_c9)._m0[int(_3018)][_3020];
    float _3024 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2848, -0.5);
    int _3026 = _2888 & 3;
    bool _3028 = _3026 != 0;
    float _3030 = fma(_2992, _2990, -0.5);
    int _3032 = ~_1458;
    int _3034 = _3032 + 1;
    float _3036 = trunc(_2994);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    float _3042 = -_1252;
    float _3044 = fma(_1508, _3024, _3042);
    float _3046 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _3048 = _2888 & 3;
    bool _3050 = _3048 != 0;
    float _3052 = fma(_1500, _3046, _1248);
    bool _3054 = uint(_3048) > 1u;
    float _3056 = _2557 * 6.283185482025146484375;
    float _3058 = cos(_3056);
    int _3060 = _3028 ? 0 : 1;
    float _3062 = _3044 + 0.5;
    bool _3064 = _3048 != 3;
    float _3066 = _3052 + 0.5;
    bool _3068 = uint(_3048) >= 2u;
    int _3070 = ~_3060;
    int _3072 = _3070 + 1;
    int _3074 = _3072 + 1;
    int _3076 = int(_2884) + int(_3040);
    float _3078 = _2998 * _2926;
    int _3080 = _3074;
    if (!_3054)
    {
        int _3082 = ~_3060;
        int _3084 = _3082 + 1;
        _3080 = _3084;
    }
    int _3086 = _3080;
    int _3088 = _3034 * _3076;
    int _3090 = _3088 + _2728;
    float _3092 = _3058 * _2926;
    float _3094 = -_3078;
    float _3096 = fma(_3058, _3030, _3094);
    bool _3098 = uint(_3090) >= uint(_1458);
    float _3100 = fma(_2998, _3030, _3092);
    int _3102 = _3068 ? 0 : 1;
    float _3104 = fma(_1512, _3096, _1328);
    bool _3106 = !_3050;
    int _3108 = _3106 ? 0 : 1;
    float _3110 = -_1358;
    float _3112 = fma(_1440, _3100, _3110);
    int _3114 = abs(_3086);
    float _3116 = _3104 + 0.5;
    int _3118 = ~_3102;
    int _3120 = _3118 + 1;
    int _3122 = _3120 + 1;
    float _3124 = _3112 + 0.5;
    bool _3126 = _3048 != 3;
    int _3128 = abs(_3108);
    int _3130 = _3122;
    if (_3064)
    {
        int _3132 = ~_3102;
        int _3134 = _3132 + 1;
        _3130 = _3134;
    }
    int _3136 = _3130;
    out.m_65.x = _3066;
    out.m_65.y = _3062;
    out.m_65.z = _3116;
    out.m_65.w = _3124;
    bool _3138 = !_3126;
    int _3140 = _3138 ? 0 : (-1);
    int _3142 = abs(_3136);
    int _3144 = ~_3114;
    int _3146 = _3144 + 1;
    int _3148 = _3146 + 1;
    int _3150 = abs(_3140);
    int _3152 = ~_3128;
    int _3154 = _3152 + 1;
    int _3156 = _3154 + 1;
    int _3158 = _3148 * as_type<int>(_2986);
    bool _3160 = !_2746;
    int _3162 = _3160 ? 0 : 1;
    int _3164 = _3156 * as_type<int>(_2978);
    int _3166 = _3164 + _3158;
    int _3168 = ~_3142;
    int _3170 = _3168 + 1;
    int _3172 = _3170 + 1;
    int _3174 = abs(_3162);
    int _3176 = ~_3150;
    int _3178 = _3176 + 1;
    int _3180 = _3178 + 1;
    int _3182 = _3172 * as_type<int>(_3014);
    int _3184 = _3182 + _3166;
    int _3186 = ~_3174;
    int _3188 = _3186 + 1;
    int _3190 = _3188 + 1;
    float _3192 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3194 = !_3098;
    int _3196 = _3194 ? 0 : (-1);
    int _3198 = _3180 * as_type<int>(_3022);
    int _3200 = _3198 + _3184;
    float _3202 = _1094 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3204 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3206 = ~_3076;
    int _3208 = _3206 + _3196;
    int _3210 = _3208 + 1;
    int _3212 = _3200 * _3190;
    float _3214 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3216 = _3202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3218 = _3004 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3220 = _1458 * _3210;
    int _3222 = _3220 + _2728;
    float _3224 = _3214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3226 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3228 = _2579 + _2454;
    float _3230 = _2492 + _2454;
    bool _3232 = !_2664;
    int _3234 = _3232 ? _3222 : (-1);
    out.m_67.x = _3224;
    out.m_67.y = _3216;
    out.m_67.z = _3204;
    out.m_67.w = _3218;
    bool _3236 = _2218 > 0.0;
    bool _3238 = isnan(_2218);
    bool _3240 = _3236 || _3238;
    bool _3242 = isnan(0.0);
    bool _3244 = _3240 || _3242;
    float _3246 = _3228 * 0.5;
    int _3248 = _3234 * _3174;
    int _3250 = _3248 + _3212;
    float _3252 = _2454 * 0.5;
    float _3254 = _3230 * 0.5;
    float _3256 = fma(_2498, -0.5, _3252);
    float _3258 = float(_3250);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _3260 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3262 = _3226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3258;
    float _3264 = _3260 * _2522;
    float _3266 = -_3260;
    float _3268 = _3266 + 1.0;
    out.m_73.x = _3254;
    out.m_73.y = _3256;
    out.m_73.z = _3246;
    out.m_73.w = _2454;
    float _3270 = _2533 * _3264;
    float _3272 = _2543 * _3264;
    float _3274 = _2533 * _3268;
    out.m_49.x = _3262;
    float _3276 = fma(_2539, _3270, _2527);
    float _3278 = fma(_2541, _3270, _2529);
    float _3280 = fma(_2533, _3272, _2531);
    out.m_75.x = _3276;
    out.m_75.y = _3278;
    out.m_75.z = _3280;
    out.m_75.w = _3274;
    if (_3244)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3282 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3282;
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
    bool _1118 = false;
    bool _848 = false;
    bool _748 = false;
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
        float _3351 = as_type<float>(_118);
        out.gl_Position.z = _3351;
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
        float _3406 = as_type<float>(_144);
        out.gl_Position.z = _3406;
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
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _478 = _468 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = 1.0 / _482;
    bool _498 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _500 = 1.0 / _490;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _504 = _468 + _502;
    float _506 = _442 * _472;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _510 = _468 + _508;
    float _512 = 1.0 / _494;
    float _514 = _444 * _474;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _518 = _468 + _516;
    float _520 = _510 * _496;
    bool _522 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _524 = isnan(_468);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _440 * _470;
    bool _536 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _538 = isnan(_468);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = 1.0 / _486;
    float _550 = _504 * _500;
    float _552 = -_532;
    float _554 = _552 + 1.0;
    bool _556 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _558 = isnan(_468);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = _478 * _512;
    bool _570 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _572 = isnan(_468);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = -_580;
    float _592 = _590 + 1.0;
    float _594 = fma(_584, _520, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _596 = _518 * _548;
    float _598 = _546 * _554;
    bool _600 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _602 = isnan(_468);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _612;
    float _616 = -_546;
    float _618 = _616 + 1.0;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _624 = fma(_588, _520, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _626 = _610 * _592;
    float _628 = -_610;
    float _630 = _628 + 1.0;
    float _632 = _580 * _618;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _642 = fma(_614, _520, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _644 = _566 * _630;
    float _646 = fma(_622, _596, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_636, _596, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = fma(_640, _596, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _652 = _642 * _644;
    float _654 = _594 * _644;
    float _656 = _624 * _644;
    float _658 = -_566;
    float _660 = _658 + 1.0;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _670;
    float _674 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].x, _652);
    float _676 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].z, _656);
    float _678 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].y, _654);
    float _680 = fma(_664, _550, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _682 = fma(_646, _626, _674);
    float _684 = fma(_650, _626, _676);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _694 = fma(_668, _550, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _696 = fma(_672, _550, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _698 = fma(_648, _626, _678);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _704 = fma(_680, _632, _682);
    float _706 = fma(_688, _568, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _708 = fma(_692, _568, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _710 = fma(_702, _568, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _712 = fma(_694, _632, _698);
    float _714 = fma(_696, _632, _684);
    float _716 = fma(_706, _598, _704);
    float _718 = fma(_708, _598, _712);
    float _720 = fma(_710, _598, _714);
    float _722 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].x, _716);
    float _724 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].y, _718);
    float _726 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].z, _720);
    bool _728 = !_498;
    float _746;
    if (!_728)
    {
        float _730 = in.m_53.x;
        float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _734 = _730 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _738 = _736 * _732;
        float _740 = floor(_738);
        float _742 = -_740;
        float _744 = _738 + _742;
        _746 = _744;
        _748 = true;
    }
    else
    {
        _746 = _156;
    }
    _748 = false;
    float _750 = _746;
    bool _752 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _754 = isnan(_750);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _768 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _770 = isnan(_750);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _780;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _786 = _750 + _784;
    float _788 = -_762;
    float _790 = _788 + 1.0;
    bool _792 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _794 = 1.0 / _766;
    float _796 = _778 * _790;
    float _798 = -_778;
    float _800 = _798 + 1.0;
    float _802 = _782 * _794;
    float _804 = _724 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _806 = fma(_802, _786, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _808 = _722 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _810 = _806 * _796;
    float _812 = _726 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[115].x, _810);
    float _816 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = _812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[116].x, _814);
    float _824 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _826 = !_792;
    float _828 = _820;
    float _846;
    if (!_826)
    {
        float _830 = in.m_53.x;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _834 = _830 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _838 = _836 * _832;
        float _840 = floor(_838);
        float _842 = -_840;
        float _844 = _838 + _842;
        _846 = _844;
        _848 = true;
    }
    else
    {
        _846 = _156;
    }
    _848 = false;
    float _850 = _846;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _854 = _850 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _858 = _850 + _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _862 = _850 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _872;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _880 = 1.0 / _866;
    bool _882 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _884 = isnan(_850);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = 1.0 / _870;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _898 = _850 + _896;
    float _900 = 1.0 / _874;
    float _902 = _854 * _880;
    bool _904 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _906 = isnan(_850);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    bool _916 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _918 = 1.0 / _878;
    float _920 = _858 * _894;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _926;
    float _930 = fma(_924, _902, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _932 = fma(_928, _902, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _934 = _862 * _900;
    float _936 = -_892;
    float _938 = _936 + 1.0;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _940;
    float _944 = fma(_942, _902, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _946 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _948 = isnan(_850);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _898 * _918;
    bool _960 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _962 = isnan(_850);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = _914 * _938;
    float _974 = -_914;
    float _976 = _974 + 1.0;
    bool _978 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _980 = isnan(_850);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = -_970;
    float _992 = _990 + 1.0;
    float _994 = _970 * _976;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1004 = _956 * _992;
    float _1006 = -_956;
    float _1008 = _1006 + 1.0;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1014 = fma(_998, _920, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1016 = fma(_1002, _920, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1018 = _988 * _1008;
    float _1020 = fma(_1012, _920, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1022 = _932 * _1018;
    float _1024 = _930 * _1018;
    float _1026 = -_988;
    float _1028 = _1026 + 1.0;
    float _1030 = _944 * _1018;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1040;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1024);
    float _1046 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1022);
    float _1048 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1030);
    float _1050 = fma(_1034, _934, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1052 = fma(_1038, _934, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1054 = fma(_1042, _934, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1056 = fma(_1014, _1004, _1044);
    float _1058 = fma(_1020, _1004, _1046);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1068 = fma(_1016, _1004, _1048);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1074 = fma(_1050, _994, _1056);
    float _1076 = fma(_1062, _958, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1078 = fma(_1066, _958, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1080 = fma(_1052, _994, _1058);
    float _1082 = fma(_1072, _958, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1084 = fma(_1054, _994, _1068);
    float _1086 = fma(_1076, _972, _1074);
    float _1088 = fma(_1078, _972, _1080);
    float _1090 = fma(_1082, _972, _1084);
    float _1092 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1086);
    float _1094 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1088);
    float _1096 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1090);
    bool _1098 = !_916;
    float _1116;
    if (!_1098)
    {
        float _1100 = in.m_53.x;
        float _1102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1104 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1108 = _1106 * _1102;
        float _1110 = floor(_1108);
        float _1112 = -_1110;
        float _1114 = _1108 + _1112;
        _1116 = _1114;
        _1118 = true;
    }
    else
    {
        _1116 = _156;
    }
    _1118 = false;
    float _1120 = _1116;
    float _1122 = in.m_42.x;
    float _1124 = in.m_42.y;
    float _1126 = in.m_42.z;
    float _1128 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1130 = in.m_53.x;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1134 = _1132 != 0;
    float _1136 = in.m_53.y;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1142 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1144 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1142);
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1148 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1150 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1152 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1154 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1144);
    float _1156 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1158 = _1130 * 2.0;
    float _1160 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1152);
    float _1162 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1148);
    float _1164 = in.m_53.z;
    float _1166 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1168 = -_1138;
    float _1170 = fma(_1156, 2.0, _1168);
    float _1172 = _1136 * 2.0;
    float _1174 = floor(_1158);
    float _1176 = fma(_1166, -2.0, _1140);
    float _1178 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1150);
    float _1180 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1160);
    float _1182 = _1130 + _1136;
    float _1184 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1186 = floor(_1172);
    float _1188 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1178);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1192 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1184);
    float _1194 = _1182 + (-1.0);
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1198 = _1174 > 0.0;
    float _1200 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1192);
    bool _1202 = _1174 >= 0.0;
    bool _1204 = isnan(_1174);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan(0.0);
    bool _1210 = _1206 || _1208;
    float _1212 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1162);
    float _1214 = _1192;
    float _1216 = _1162;
    float _1218 = _1126;
    float _1220 = _1178;
    float _1222 = _1136;
    if (!_1134)
    {
        _1214 = _1136;
    }
    float _1224 = _1214;
    float _1226 = _1164 * 2.0;
    float _1228 = _1224;
    if (!_1134)
    {
        _1216 = _1130;
    }
    float _1230 = _1216;
    float _1232 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1234 = _1230;
    if (!_1134)
    {
        _1218 = _1164;
    }
    float _1236 = _1218;
    float _1238 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1240 = int(_1238);
    float _1242 = _1236;
    if (_1134)
    {
        _1228 = _1130;
    }
    float _1244 = _1228;
    float _1246 = -_100;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1170);
    if (_1134)
    {
        _1234 = _1164;
    }
    float _1250 = _1234;
    float _1252 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1176);
    bool _1254 = _1186 > 0.0;
    float _1256 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1258 = _1186;
    if (!_1134)
    {
        _1220 = _1236;
    }
    float _1260 = _1220;
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1190);
    float _1264 = -_1146;
    float _1266 = fma(_1256, 2.0, _1264);
    float _1268 = _1260;
    if (_1134)
    {
        _1268 = _1136;
    }
    float _1270 = _1268;
    float _1272 = floor(_1226);
    bool _1274 = _1186 >= 0.0;
    bool _1276 = isnan(_1186);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1134)
    {
        _1258 = _1136;
    }
    float _1286 = _1258;
    float _1288 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1290 = _1210 ? 0 : 1;
    float _1292 = _1130 + _1164;
    float _1294 = fma(_1288, -2.0, _1284);
    float _1296 = _1286;
    if (_1134)
    {
        _1296 = _1130;
    }
    float _1298 = _1296;
    float _1300 = _1292 + (-1.0);
    int _1302 = _1282 ? 0 : 1;
    float _1304 = rsqrt(_1154);
    int _1306 = ~_1290;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    float _1312 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1196);
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1316 = _1314 != 0;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1324 = _1322 != 0;
    float _1326 = -_100;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1266);
    int _1330 = _1310;
    if (!_1198)
    {
        int _1332 = ~_1290;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1262);
    int _1340 = ~_1302;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    float _1346 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1348 = log2(_1346);
    int _1350 = _1344;
    if (!_1254)
    {
        int _1352 = ~_1302;
        int _1354 = _1352 + 1;
        _1350 = _1354;
    }
    int _1356 = _1350;
    float _1358 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1294);
    float _1360 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1362 = !_1320;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1368 = !_1316;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1374 = !_1324;
    int _1376 = _1374 ? 0 : 1;
    float _1378 = _1136 + _1164;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1390 = _1388 != 0;
    float _1392 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1378 + (-1.0);
    bool _1396 = !_1390;
    int _1398 = _1396 ? 0 : 1;
    float _1400 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1402 = !_1386;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1408 = abs(_1398);
    float _1410 = float(_1240);
    bool _1412 = _1272 > 0.0;
    bool _1414 = _1272 >= 0.0;
    bool _1416 = isnan(_1272);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.0);
    bool _1422 = _1418 || _1420;
    float _1424 = _1348 * _100;
    float _1426 = 1.0 / _1410;
    if (_1134)
    {
        _1242 = _1136;
    }
    float _1428 = _1242;
    int _1430 = abs(_1404);
    float _1432 = float(_1356);
    float _1434 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1406);
    float _1436 = float(_1408);
    float _1438 = exp2(_1424);
    float _1440 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1434);
    float _1442 = float(_1336);
    float _1444 = _1436 * _1432;
    float _1446 = in.m_57.x;
    float _1448 = in.m_57.y;
    float _1450 = in.m_57.z;
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1454 = 1.0 + _1452;
    float _1456 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1458 = int(_1456);
    float _1460 = _1426 * _100;
    float _1462 = float(_1430);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1466 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1468 = isnan(1.0);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1474 = _1470 || _1472;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1478 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1480 = isnan(0.0);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1486 = _1482 || _1484;
    float _1488 = 1.0 / _1454;
    float _1490 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1464);
    float _1492 = -_1438;
    float _1494 = _1492 + 1.0;
    float _1496 = _1462 * _1442;
    float _1498 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1476);
    float _1500 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1490);
    int _1502 = _1422 ? 0 : 1;
    float _1504 = _1496 * (-2.0);
    float _1506 = float(_1458);
    float _1508 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1498);
    float _1510 = _1486 ? _1494 : 0.0;
    float _1512 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1312);
    float _1514 = fma(_1400, _1504, _1400);
    float _1516 = _1506 * _100;
    float _1518 = fma(_1504, _1448, _1448);
    float _1520 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1474)
    {
        float _1522 = _1510 * _1488;
        _110 = _1522;
    }
    float _1524 = _110;
    float _1526 = _1136 + (-0.5);
    int _1528 = ~_1502;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    int _1534 = _1532;
    if (!_1412)
    {
        int _1536 = ~_1502;
        int _1538 = _1536 + 1;
        _1534 = _1538;
    }
    int _1540 = _1534;
    float _1542 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1518);
    float _1544 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1546 = _1520 * _1520;
    float _1548 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1550 = fma(_1544, _1544, _1546);
    bool _1552 = !_1382;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1556;
    float _1560 = _1444 * (-2.0);
    float _1562 = fma(_1548, _1548, _1550);
    int _1564 = abs(_1554);
    float _1566 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1568 = fma(_1372, _1560, _1372);
    float _1570 = fma(_1560, _1450, _1450);
    float _1572 = fma(_1514, _1524, _1542);
    float _1574 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1576 = _1164 + (-0.5);
    float _1578 = _1572 * 0.15915493667125701904296875;
    float _1580 = float(_1540);
    float _1582 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1566);
    float _1584 = float(_1564);
    float _1586 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1570);
    float _1588 = rsqrt(_1562);
    float _1590 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1582);
    float _1592 = _1584 * _1580;
    float _1594 = _1592 * (-2.0);
    float _1596 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1598 = fma(_1568, _1524, _1586);
    float _1600 = _1130 + (-0.5);
    float _1602 = in.m_59.x;
    float _1604 = in.m_59.y;
    float _1606 = in.m_59.z;
    float _1608 = -_1596;
    float _1610 = _1392 + _1608;
    float _1612 = fma(_1594, _1446, _1446);
    float _1614 = 1.0 / _1558;
    float _1616 = fma(_1232, _1594, _1232);
    bool _1618 = _1596 >= _1392;
    bool _1620 = isnan(_1596);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(_1392);
    bool _1626 = _1622 || _1624;
    float _1628 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1612);
    float _1630 = abs(_1610);
    float _1632 = precise::max(_1630, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1634 = _1598 * 0.15915493667125701904296875;
    float _1636 = _1544 * _1588;
    float _1638 = fma(_1616, _1524, _1628);
    float _1640 = precise::min(_1632, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1642 = _1634 * 6.283185482025146484375;
    float _1644 = sin(_1642);
    bool _1646 = !_1626;
    float _1648 = _1646 ? 1.0 : (-1.0);
    float _1650 = _1638 * 0.15915493667125701904296875;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1654 = _1640 + _1652;
    float _1656 = _1520 * _1588;
    float _1658 = _1548 * _1588;
    float _1660 = _1654 * _1614;
    float _1662 = _1634 * 6.283185482025146484375;
    float _1664 = cos(_1662);
    float _1666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1602);
    float _1668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1606);
    float _1670 = _1648 * _1660;
    float _1672 = _1578 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    float _1676 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1678 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1680 = _1678 * _1670;
    float _1682 = _1578 * 6.283185482025146484375;
    float _1684 = cos(_1682);
    float _1686 = _1650 * 6.283185482025146484375;
    float _1688 = sin(_1686);
    float _1690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1604);
    float _1692 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1694 = _1676 * _1668;
    float _1696 = _1128 * _1690;
    float _1698 = _1692 * _1666;
    float _1700 = _1680 * 0.15915493667125701904296875;
    float _1702 = _1650 * 6.283185482025146484375;
    float _1704 = cos(_1702);
    float _1706 = _1664 * _1696;
    float _1708 = _1684 * _1664;
    float _1710 = _1674 * _1664;
    float _1712 = _1688 * _1674;
    float _1714 = -_1696;
    float _1716 = _1644 * _1714;
    float _1718 = _1700 * 6.283185482025146484375;
    float _1720 = cos(_1718);
    float _1722 = fma(_1708, _1698, _1716);
    float _1724 = _1704 * _1684;
    float _1726 = _1704 * _1674;
    float _1728 = _1704 * _1706;
    float _1730 = _1688 * _1684;
    float _1732 = fma(_1644, _1724, _1712);
    float _1734 = _1688 * _1706;
    float _1736 = fma(_1710, _1694, _1722);
    float _1738 = -_1730;
    float _1740 = fma(_1644, _1726, _1738);
    float _1742 = fma(_1732, _1698, _1728);
    float _1744 = -_1726;
    float _1746 = fma(_1644, _1730, _1744);
    float _1748 = _1700 * 6.283185482025146484375;
    float _1750 = sin(_1748);
    float _1752 = fma(_1644, _1712, _1724);
    float _1754 = fma(_1740, _1694, _1742);
    float _1756 = fma(_1746, _1698, _1734);
    float _1758 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1762 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1764 = fma(_1752, _1694, _1756);
    float _1766 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1758);
    float _1768 = -_1720;
    float _1770 = _1768 + 1.0;
    float _1772 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1760);
    float _1774 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1762);
    float _1776 = _1658 * _1658;
    float _1778 = _1656 * _1770;
    float _1780 = _1636 * _1750;
    float _1782 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1766);
    float _1784 = _1656 * _1750;
    float _1786 = fma(_1770, _1776, _1720);
    float _1788 = _1658 * _1750;
    float _1790 = _1636 * _1770;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1772);
    float _1794 = fma(_1658, _1778, _1780);
    float _1796 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1798 = -_1788;
    float _1800 = fma(_1656, _1790, _1798);
    float _1802 = -_1784;
    float _1804 = fma(_1658, _1790, _1802);
    float _1806 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1808 = _1796 * _1794;
    float _1810 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1774);
    float _1812 = fma(_1636, _1790, _1720);
    float _1814 = _1796 * _1800;
    float _1816 = fma(_1806, _1804, _1808);
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1820 = fma(_1656, _1790, _1788);
    float _1822 = fma(_1806, _1812, _1814);
    float _1824 = fma(_1658, _1790, _1784);
    float _1826 = fma(_1818, _1786, _1816);
    float _1828 = fma(_1656, _1778, _1720);
    float _1830 = -_1780;
    float _1832 = fma(_1658, _1778, _1830);
    float _1834 = fma(_1818, _1824, _1822);
    float _1836 = _1366 + _1826;
    float _1838 = _1796 * _1828;
    float _1840 = _1574 + _1834;
    float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1844 = _1836 + _1842;
    float _1846 = fma(_1806, _1820, _1838);
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1850 = _1840 + _1848;
    float _1852 = _1844 * _1844;
    float _1854 = fma(_1818, _1832, _1846);
    float _1856 = fma(_1850, _1850, _1852);
    float _1858 = _1360 + _1854;
    float _1860 = sqrt(_1856);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = _1854;
    float _1866 = _1656;
    float _1868 = _1846;
    if (!_1862)
    {
        _1864 = _1840;
    }
    float _1870 = _1864;
    float _1872 = _1870;
    if (!_1862)
    {
        _1866 = _1836;
    }
    float _1874 = _1866;
    float _1876 = _1874;
    if (!_1862)
    {
        _1868 = _1858;
    }
    float _1878 = _1868;
    bool _1880 = !_1862;
    float _1882 = _1878;
    if (!_1880)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1888 = _1860 + _1886;
        float _1890 = rsqrt(_1856);
        float _1892 = _1888 * _1884;
        float _1894 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1896 = _1892 * 0.15915493667125701904296875;
        float _1898 = _1896 * 6.283185482025146484375;
        float _1900 = sin(_1898);
        float _1902 = _1896 * 6.283185482025146484375;
        float _1904 = cos(_1902);
        float _1906 = fma(_1900, _1894, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1908 = _1890 * _1906;
        float _1910 = _1904 + (-1.0);
        float _1912 = fma(_1850, _1908, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1914 = fma(_1844, _1908, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1916 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1918 = fma(_1858, _1904, _1916);
        _1882 = _1918;
        _1872 = _1912;
        _1876 = _1914;
    }
    float _1920 = _1882;
    float _1922 = _1872;
    float _1924 = _1876;
    float _1926 = -_1360;
    float _1928 = _1926 + _1920;
    float _1930 = -_1574;
    float _1932 = _1930 + _1922;
    float _1934 = -_1366;
    float _1936 = _1934 + _1924;
    float _1938 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1940 = _1928 * _1928;
    float _1942 = fma(_1932, _1932, _1940);
    float _1944 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1938);
    float _1946 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1948 = fma(_1936, _1936, _1942);
    float _1950 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1944);
    float _1952 = sqrt(_1948);
    float _1954 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1956 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1946);
    float _1958 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1956);
    bool _1960 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan(0.5);
    bool _1968 = _1964 || _1966;
    float _1970 = 1.0 / _1954;
    float _1972 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1974 = _1972 + _1954;
    bool _1976 = _1952 > 0.0;
    bool _1978 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1980 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan(0.5);
    bool _1986 = _1982 || _1984;
    float _1988 = _1974 * _1970;
    float _1990 = _1988 * 0.5;
    bool _1992 = !_1976;
    float _1994 = _1920;
    float _1996 = _1932;
    float _1998 = _1922;
    float _2000 = _1924;
    float _2002 = _1954;
    float _2004 = _1928;
    float _2006 = _1936;
    float _2008 = _1948;
    float _2010 = _1972;
    float _2012 = _1970;
    if (!_1992)
    {
        float _2014 = _172 * _172;
        float _2016 = rsqrt(_1948);
        float _2018 = fma(_170, _170, _2014);
        float _2020 = fma(_174, _174, _2018);
        float _2022 = sqrt(_2020);
        float _2024 = _1932 * _2016;
        float _2026 = _1928 * _2016;
        bool _2028 = _2022 > 0.0;
        float _2030 = _1936 * _2016;
        bool _2032 = !_2028;
        _2002 = _2020;
        _2008 = _2016;
        _2010 = _2030;
        if (!_2032)
        {
            float _2034 = rsqrt(_2020);
            float _2036 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2038 = _172 * _2034;
            float _2040 = _170 * _2034;
            float _2042 = _174 * _2034;
            float _2044 = _2026 * _2038;
            float _2046 = fma(_2024, _2040, _2044);
            float _2048 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2050 = fma(_2030, _2042, _2046);
            float _2052 = _2050 * _2048;
            float _2054 = fma(_170, _2052, _1922);
            float _2056 = fma(_172, _2052, _1920);
            float _2058 = fma(_174, _2052, _1924);
            _1994 = _2056;
            _1996 = _2046;
            _1998 = _2054;
            _2000 = _2058;
            _2004 = _2052;
            _2006 = _2044;
            _2008 = _2048;
        }
    }
    float _2060 = _1994;
    float _2062 = _1996;
    float _2064 = _1998;
    float _2066 = _2000;
    float _2068 = _2002;
    float _2070 = _2004;
    float _2072 = _2006;
    float _2074 = _2008;
    float _2076 = _2010;
    float _2078 = _2068;
    float _2080 = _2070;
    float _2082 = _2064;
    float _2084 = _2066;
    float _2086 = _2062;
    float _2088 = _2076;
    if (_1986)
    {
        _2078 = 1.0;
    }
    float _2090 = _2078;
    float _2092 = _2090;
    if (_1968)
    {
        _2080 = _2060;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (!_1968)
    {
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2100 = _1360 + _2098;
        float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2104 = _1574 + _2102;
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2108 = -_1360;
        float _2110 = _2108 + _2060;
        float _2112 = _2100 * _2100;
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2116 = _1366 + _2114;
        float _2118 = fma(_2104, _2104, _2112);
        float _2120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2122 = fma(_2116, _2116, _2118);
        float _2124 = sqrt(_2122);
        float _2126 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2128 = precise::min(_2124, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2130 = _2128 * _2120;
        float _2132 = -_1574;
        float _2134 = _2132 + _2064;
        float _2136 = -_1366;
        float _2138 = _2136 + _2066;
        float _2140 = _2126 * _2130;
        float _2142 = fma(_2134, _2140, _1574);
        float _2144 = fma(_2110, _2140, _1360);
        float _2146 = fma(_2138, _2140, _1366);
        _2096 = _2144;
        _2082 = _2142;
        _2084 = _2146;
        _2086 = _2140;
    }
    float _2148 = _2096;
    float _2150 = _2082;
    float _2152 = _2084;
    float _2154 = _2086;
    float _2156 = _2154;
    if (!_1986)
    {
        float _2158 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2160 = _2158 * 0.15915493667125701904296875;
        float _2162 = _2160 * 6.283185482025146484375;
        float _2164 = cos(_2162);
        float _2166 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2168 = _2166 * 0.15915493667125701904296875;
        float _2170 = _2160 * 6.283185482025146484375;
        float _2172 = sin(_2170);
        float _2174 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2176 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2174);
        float _2178 = 1.0 / _2164;
        float _2180 = _2168 * 6.283185482025146484375;
        float _2182 = cos(_2180);
        float _2184 = _2172 * _2178;
        float _2186 = 1.0 / _2176;
        float _2188 = _2182 * _2184;
        float _2190 = _2168 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2196 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2194;
        float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2200 = _2186 * _2198;
        float _2202 = 1.0 / _2188;
        float _2204 = 1.0 / _2196;
        float _2206 = _2192 * _2202;
        float _2208 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2210 = fma(_2206, _2200, _2208);
        float _2212 = _2210 * _2204;
        float _2214 = precise::clamp(_2212, 0.0, 1.0);
        _2156 = _2160;
        _2092 = _2214;
    }
    float _2216 = _2156;
    float _2218 = _2092;
    float _2220 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2222 = _2148 + _2220;
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2226 = _2150 + _2224;
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2230 = _2152 + _2228;
    float _2232 = _2222 * _2222;
    float _2234 = fma(_2226, _2226, _2232);
    float _2236 = fma(_2230, _2230, _2234);
    float _2238 = rsqrt(_2236);
    float _2240 = sqrt(_2236);
    float _2242 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2244 = _2226 * _2242;
    float _2246 = _2230 * _2242;
    float _2248 = _2244 * _2244;
    float _2250 = _2246 * _2246;
    float _2252 = _2248 + _2250;
    float _2254 = sqrt(_2252);
    bool _2256 = _2254 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2260 = _2254 + _2258;
    float _2262 = _2072;
    float _2264 = _2260;
    float _2266 = _2222;
    float _2268 = _2246;
    float _2270 = _2248;
    float _2272 = _2250;
    if (_2256)
    {
        float _2274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2262 = _2274;
    }
    float _2276 = _2262;
    if (_2256)
    {
        float _2278 = _2260 * _2276;
        _2264 = _2278;
    }
    float _2280 = _2264;
    if (_2256)
    {
        float _2282 = _2280 * 0.15915493667125701904296875;
        _2012 = _2282;
    }
    float _2284 = _2012;
    float _2286 = _2074;
    if (_2256)
    {
        float _2288 = _2284 * 6.283185482025146484375;
        float _2290 = sin(_2288);
        _2286 = _2290;
    }
    float _2292 = _2286;
    float _2294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2296 = precise::max(0.0, _2294);
    float _2298 = _2216;
    float _2300 = _2296;
    if (_2256)
    {
        float _2302 = _2284 * 6.283185482025146484375;
        float _2304 = cos(_2302);
        _2298 = _2304;
    }
    float _2306 = _2298;
    float _2308 = -_2242;
    float _2310 = -_2296;
    float _2312 = fma(_2222, _2308, _2310);
    if (!_2256)
    {
        _2266 = _2244;
    }
    float _2314 = _2266;
    float _2316 = _2294;
    float _2318 = _2314;
    if (_2256)
    {
        float _2320 = rsqrt(_2252);
        _2316 = _2320;
    }
    float _2322 = _2316;
    if (_2256)
    {
        float _2324 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2300 = _2324;
    }
    float _2326 = _2300;
    float _2328 = _2326;
    if (_2256)
    {
        float _2330 = fma(_2292, _2326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2088 = _2330;
    }
    float _2332 = _2088;
    float _2334 = _2332;
    if (_2256)
    {
        float _2336 = _2306 + (-1.0);
        _2328 = _2336;
    }
    float _2338 = _2328;
    float _2340 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2342 = _2338;
    if (_2256)
    {
        float _2344 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2342 = _2344;
    }
    float _2346 = _2342;
    float _2348 = _2322;
    if (_2256)
    {
        float _2350 = _2322 * _2332;
        _2334 = _2350;
    }
    float _2352 = _2334;
    if (!_2256)
    {
        _2348 = _2312;
    }
    float _2354 = _2348;
    float _2356 = _2354;
    if (_2256)
    {
        float _2358 = fma(_2312, _2306, _2346);
        _2356 = _2358;
    }
    float _2360 = _2356;
    if (_2256)
    {
        float _2362 = _2244 * _2352;
        _2318 = _2362;
    }
    float _2364 = _2318;
    if (_2256)
    {
        float _2366 = _2246 * _2352;
        _2268 = _2366;
    }
    float _2368 = _2268;
    if (_2256)
    {
        float _2370 = _2364 * _2364;
        _2270 = _2370;
    }
    float _2372 = _2270;
    if (_2256)
    {
        float _2374 = _2368 * _2368;
        _2272 = _2374;
    }
    float _2376 = _2272;
    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2380 = fma(_2240, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2378);
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2386 = fma(_2360, _2360, _2372);
    float _2388 = -_2382;
    float _2390 = _2388 + 1.0;
    float _2392 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2384);
    float _2394 = _2386 + _2376;
    float _2396 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2398 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2400 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2392);
    float _2402 = abs(_2390);
    float _2404 = log2(_2402);
    float _2406 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2396);
    float _2408 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2410 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2412 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2406);
    float _2414 = rsqrt(_2394);
    float _2416 = _2412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2418 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2408);
    float _2420 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2398);
    float _2422 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2424 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2418);
    float _2426 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2420);
    float _2428 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2430 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2432 = _2424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2434 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2436 = -_2422;
    float _2438 = fma(_2436, _2340, 1.0);
    float _2440 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2428);
    float _2442 = exp2(_2430);
    float _2444 = _2414 * _2364;
    float _2446 = _2414 * _2360;
    float _2448 = _2414 * _2368;
    float _2450 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2440);
    float _2452 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2454 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2450);
    float _2456 = -_2452;
    float _2458 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2456);
    float _2460 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2462 = log2(_2438);
    float _2464 = -_2448;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2458);
    float _2468 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2470 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2460);
    float _2472 = fma(_2466, -0.5, 0.5);
    float _2474 = fma(_2466, 0.5, 0.5);
    float _2476 = 1.0 / _2454;
    float _2478 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2468);
    float _2480 = _2446 + 1.0;
    float _2482 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2470);
    float _2484 = fma(_2474, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2486 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2478);
    float _2488 = -_2446;
    float _2490 = fma(_2442, _2480, _2488);
    float _2492 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2482);
    float _2494 = sqrt(_2472);
    float _2496 = fma(_2474, _2484, -0.212114393711090087890625);
    float _2498 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2486);
    float _2500 = _2462 * 0.693147182464599609375;
    float _2502 = fma(_2490, 0.5, 0.5);
    float _2504 = fma(_2474, _2496, 1.570728778839111328125);
    float _2506 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2508 = _2498 * _2476;
    float _2510 = _2492 * _2476;
    float _2512 = fma(_2510, 0.5, 0.5);
    float _2514 = _2494 * 0.636619746685028076171875;
    float _2516 = fma(_2508, -0.5, 0.5);
    float _2518 = -_2504;
    float _2520 = fma(_2514, _2518, 1.0);
    float3 _7230 = float3(_2512, _2516, _2506);
    float _2522 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7230, float3(0.0), isnan(_7230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7230, float3(0.0), isnan(_7230)), level(0.0)).x;
    float3 _7241 = float3(_2512, _2516, _2506);
    float4 _2525 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7241, float3(0.0), isnan(_7241)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7241, float3(0.0), isnan(_7241)), level(0.0)).xyzw;
    float _2527 = _2525.x;
    float _2529 = _2525.y;
    float _2531 = _2525.z;
    float _2533 = _2525.w;
    float2 _7258 = float2(_2520, _2502);
    float3 _2537 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7258, float2(0.0), isnan(_7258)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7258, float2(0.0), isnan(_7258)), level(0.0)).xyz;
    float _2539 = _2537.x;
    float _2541 = _2537.y;
    float _2543 = _2537.z;
    float _2545 = float(uint(_1458));
    float _2547 = trunc(_1460);
    int _2549 = int(_2547);
    int _2551 = ~_1458;
    int _2553 = _2551 + 1;
    out.m_61.x = _816;
    out.m_61.y = _818;
    out.m_61.z = _820;
    out.m_61.w = _824;
    int _2555 = abs(_1364);
    float _2557 = _1338 * (-0.15915493667125701904296875);
    float _2559 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2561 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2563 = 1.0 / _2545;
    float _2565 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2561);
    bool _2567 = !_1134;
    float _2569 = _2567 ? 7.345489978790283203125 : 1.0;
    float _2571 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2565);
    float _2573 = float(uint(_2549));
    float _2575 = exp2(_2559);
    float _2577 = float(_2549);
    float _2579 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2571);
    bool _2581 = _2577 >= _1506;
    bool _2583 = isnan(_2577);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(_1506);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    int _2593 = as_type<int>(_2563) + (-2);
    out.gl_Position.x = _2492;
    out.gl_Position.y = _2498;
    out.gl_Position.z = _2579;
    out.gl_Position.w = _2454;
    float _2595 = trunc(_2591);
    int _2597 = int(_2595);
    float _2599 = as_type<float>(_2593) * _2573;
    float _2601 = -_2575;
    float _2603 = _2601 + 1.0;
    float _2605 = trunc(_2599);
    float _2607 = precise::max(_2605, 0.0);
    uint _2610 = uint(_2607);
    int _2612 = _2553 * int(_2610);
    int _2614 = _2612 + _2549;
    float _2616 = float(uint(_2614));
    float _2618 = as_type<float>(_2593) * _2616;
    float _2620 = _2569 * _1130;
    float _2622 = floor(_2620);
    float _2624 = trunc(_2618);
    float _2626 = precise::max(_2624, 0.0);
    uint _2628 = uint(_2626);
    int _2630 = int(_2610) + int(_2628);
    float _2632 = -_2622;
    float _2634 = _2620 + _2632;
    int _2636 = _2553 * _2630;
    int _2638 = _2636 + _2549;
    int _2640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2642 = _2640 != 0;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2646 = _2644 != 0;
    bool _2648 = uint(_2638) >= uint(_1458);
    float _2650 = _2634 * _1506;
    float _2652 = _1516 * _152;
    int _2654 = _1458 + (-1);
    bool _2656 = !_2648;
    int _2658 = _2656 ? 0 : (-1);
    float _2660 = trunc(_2650);
    int _2662 = int(_2660);
    bool _2664 = _1458 == 0;
    int _2666 = ~_2630;
    int _2668 = _2666 + _2658;
    int _2670 = _2668 + 1;
    int _2672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2674 = _2672 != 0;
    int _2676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2678 = _2676 != 0;
    int _2680 = _1458 * _2670;
    int _2682 = _2680 + _2549;
    int _2684 = ~_2597;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    float _2690 = trunc(_2652);
    int _2692 = int(_2690);
    bool _2694 = !_2664;
    int _2696 = _2694 ? _2682 : (-1);
    bool _2698 = !_2642;
    int _2700 = _2698 ? 0 : 1;
    int _2702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2704 = _2702 != 0;
    int _2706 = _2696 * _2688;
    int _2708 = abs(_2700);
    float _2710 = in.m_63.x;
    int _2712 = abs(_1370);
    int _2714 = _2597 * _2654;
    int _2716 = _2714 + _2706;
    int _2718 = abs(_1376);
    int _2720 = _2716 * _2555;
    bool _2722 = !_2704;
    int _2724 = _2722 ? 0 : 1;
    int _2726 = _2662 * _2708;
    int _2728 = _2726 + _2549;
    int _2730 = _2692 * _2712;
    int _2732 = _2730 + _2720;
    int _2734 = abs(_2724);
    int _2736 = ~_1458;
    int _2738 = _2736 + 1;
    int _2740 = _2728 * _2718;
    int _2742 = _2740 + _2732;
    int _2744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2746 = _2744 != 0;
    int _2748 = _2662 * _2734;
    int _2750 = _2748 + _2742;
    float _2752 = in.m_53.w;
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2754;
    int _2758 = as_type<int>(_2710);
    if (!_2678)
    {
        _828 = _2710;
    }
    float _2760 = _828;
    float _2762 = float(uint(_2750));
    float _2764 = as_type<float>(_2593) * _2762;
    int _2766 = ~_1458;
    int _2768 = _2766 + 1;
    float _2770 = trunc(_2764);
    float _2772 = precise::max(_2770, 0.0);
    uint _2774 = uint(_2772);
    bool _2776 = _2752 > 0.5;
    int _2778 = _2768 * int(_2774);
    int _2780 = _2778 + _2750;
    float _2782 = float(uint(_2780));
    float _2784 = as_type<float>(_2593) * _2782;
    float _2786 = in.m_63.y;
    float _2788 = trunc(_2784);
    float _2790 = precise::max(_2788, 0.0);
    uint _2792 = uint(_2790);
    int _2794 = int(_2774) + int(_2792);
    float _2796 = -_2786;
    float _2798 = _2796 + 1.0;
    int _2800 = _2738 * _2794;
    int _2802 = _2800 + _2750;
    float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2806 = _2804 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2808 = float(uint(_2728));
    bool _2810 = uint(_2802) >= uint(_1458);
    float _2812 = 1.0 / _2806;
    int _2814 = _2776 ? as_type<int>(_2798) : as_type<int>(_2786);
    float _2816 = as_type<float>(_2593) * _2808;
    bool _2818 = !_2810;
    int _2820 = _2818 ? 0 : (-1);
    int _2822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2824 = _2822 != 0;
    bool _2826 = _1136 > 0.5;
    float _2828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2830 = ~_2794;
    int _2832 = _2830 + _2820;
    int _2834 = _2832 + 1;
    float _2836 = _2824 ? as_type<float>(_2814) : _2786;
    float _2838 = _2786;
    bool _2840 = _2826;
    bool _2842 = _2824;
    float _2844 = _2760;
    if (_2646)
    {
        float _2846 = _2826 ? _2798 : _2786;
        _2838 = _2846;
    }
    float _2848 = _2838;
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2852 = _1120 + _2850;
    if (_2674)
    {
        bool _2854 = _1164 > 0.5;
        _2840 = _2854;
    }
    bool _2856 = _2840;
    int _2858 = _1458 * _2834;
    int _2860 = _2858 + _2750;
    if (_2678)
    {
        bool _2862 = _1130 > 0.5;
        _2842 = _2862;
    }
    bool _2864 = _2842;
    float _2866 = _2756 * _2812;
    bool _2868 = _1120 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2870 = isnan(_1120);
    bool _2872 = _2868 || _2870;
    bool _2874 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2876 = _2872 || _2874;
    float _2878 = float(_2876);
    float _2880 = trunc(_2816);
    float _2882 = precise::max(_2880, 0.0);
    uint _2884 = uint(_2882);
    bool _2886 = !_2664;
    int _2888 = _2886 ? _2860 : (-1);
    float _2890 = fma(_2866, _2852, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2892 = _1120 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2894 = isnan(_1120);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2900 = _2896 || _2898;
    float _2902 = float(_2900);
    float _2904 = -_2878;
    float _2906 = _2904 + 1.0;
    int _2908 = _2888 >> 31;
    float _2910 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2912 = ~_1458;
    int _2914 = _2912 + 1;
    float _2916 = _2902 * _2906;
    int _2918 = _2908 & 3;
    float _2920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2922 = _2916;
    if (!_2678)
    {
        _1222 = _2760;
    }
    float _2924 = _1222;
    float _2926 = fma(_2836, _2910, -0.5);
    int _2928 = _2888 + _2918;
    float _2930 = _2890 * _2916;
    float _2932 = _2924;
    if (_2678)
    {
        _2844 = _2710;
    }
    float _2934 = _2844;
    int _2936 = _2914 * int(_2884);
    int _2938 = _2936 + _2728;
    int _2940 = _2928 >> 2;
    float _2942 = -_2902;
    float _2944 = _2942 + 1.0;
    int _2946 = _2938;
    if (!_2674)
    {
        _2922 = _2934;
    }
    float _2948 = _2922;
    float _2950 = _2948;
    if (_2674)
    {
        float _2952 = -_2934;
        float _2954 = _2952 + 1.0;
        _2758 = as_type<int>(_2954);
    }
    int _2956 = _2758;
    int _2958 = _2940 << 4;
    int _2960 = _2958 + 368;
    float _2962 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2930);
    float _2964 = float(uint(_2938));
    if (_2678)
    {
        float _2966 = -_2934;
        float _2968 = _2966 + 1.0;
        _2946 = as_type<int>(_2968);
    }
    int _2970 = _2946;
    uint _2972 = uint(int(uint(_2960) >> uint(2)));
    uint _2974 = uint(int(uint(int(_2972)) >> uint(2)));
    int _2976 = int(_2972) & 3;
    float _2978 = (*spvDescriptorSet0.vp_c9)._m0[int(_2974)][_2976];
    int _2980 = int(_2972) + 1;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    int _2984 = _2980 & 3;
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[int(_2982)][_2984];
    if (_2674)
    {
        float _2988 = _2856 ? as_type<float>(_2956) : _2934;
        _2950 = _2988;
    }
    float _2990 = _2950;
    float _2992 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2994 = as_type<float>(_2593) * _2964;
    float _2996 = _2557 * 6.283185482025146484375;
    float _2998 = sin(_2996);
    if (_2678)
    {
        float _3000 = _2864 ? as_type<float>(_2970) : _2934;
        _2932 = _3000;
    }
    float _3002 = _2932;
    float _3004 = fma(_2878, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2962);
    int _3006 = _2960 + 8;
    uint _3008 = uint(int(uint(_3006) >> uint(2)));
    uint _3010 = uint(int(uint(int(_3008)) >> uint(2)));
    int _3012 = int(_3008) & 3;
    float _3014 = (*spvDescriptorSet0.vp_c9)._m0[int(_3010)][_3012];
    int _3016 = int(_3008) + 1;
    uint _3018 = uint(int(uint(_3016) >> uint(2)));
    int _3020 = _3016 & 3;
    float _3022 = (*spvDescriptorSet0.vp_c9)._m0[int(_3018)][_3020];
    float _3024 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2848, -0.5);
    int _3026 = _2888 & 3;
    bool _3028 = _3026 != 0;
    float _3030 = fma(_2992, _2990, -0.5);
    int _3032 = ~_1458;
    int _3034 = _3032 + 1;
    float _3036 = trunc(_2994);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    float _3042 = -_1252;
    float _3044 = fma(_1508, _3024, _3042);
    float _3046 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _3048 = _2888 & 3;
    bool _3050 = _3048 != 0;
    float _3052 = fma(_1500, _3046, _1248);
    bool _3054 = uint(_3048) > 1u;
    float _3056 = _2557 * 6.283185482025146484375;
    float _3058 = cos(_3056);
    int _3060 = _3028 ? 0 : 1;
    float _3062 = _3044 + 0.5;
    bool _3064 = _3048 != 3;
    float _3066 = _3052 + 0.5;
    bool _3068 = uint(_3048) >= 2u;
    int _3070 = ~_3060;
    int _3072 = _3070 + 1;
    int _3074 = _3072 + 1;
    int _3076 = int(_2884) + int(_3040);
    float _3078 = _2998 * _2926;
    int _3080 = _3074;
    if (!_3054)
    {
        int _3082 = ~_3060;
        int _3084 = _3082 + 1;
        _3080 = _3084;
    }
    int _3086 = _3080;
    int _3088 = _3034 * _3076;
    int _3090 = _3088 + _2728;
    float _3092 = _3058 * _2926;
    float _3094 = -_3078;
    float _3096 = fma(_3058, _3030, _3094);
    bool _3098 = uint(_3090) >= uint(_1458);
    float _3100 = fma(_2998, _3030, _3092);
    int _3102 = _3068 ? 0 : 1;
    float _3104 = fma(_1512, _3096, _1328);
    bool _3106 = !_3050;
    int _3108 = _3106 ? 0 : 1;
    float _3110 = -_1358;
    float _3112 = fma(_1440, _3100, _3110);
    int _3114 = abs(_3086);
    float _3116 = _3104 + 0.5;
    int _3118 = ~_3102;
    int _3120 = _3118 + 1;
    int _3122 = _3120 + 1;
    float _3124 = _3112 + 0.5;
    bool _3126 = _3048 != 3;
    int _3128 = abs(_3108);
    int _3130 = _3122;
    if (_3064)
    {
        int _3132 = ~_3102;
        int _3134 = _3132 + 1;
        _3130 = _3134;
    }
    int _3136 = _3130;
    out.m_65.x = _3066;
    out.m_65.y = _3062;
    out.m_65.z = _3116;
    out.m_65.w = _3124;
    bool _3138 = !_3126;
    int _3140 = _3138 ? 0 : (-1);
    int _3142 = abs(_3136);
    int _3144 = ~_3114;
    int _3146 = _3144 + 1;
    int _3148 = _3146 + 1;
    int _3150 = abs(_3140);
    int _3152 = ~_3128;
    int _3154 = _3152 + 1;
    int _3156 = _3154 + 1;
    int _3158 = _3148 * as_type<int>(_2986);
    bool _3160 = !_2746;
    int _3162 = _3160 ? 0 : 1;
    int _3164 = _3156 * as_type<int>(_2978);
    int _3166 = _3164 + _3158;
    int _3168 = ~_3142;
    int _3170 = _3168 + 1;
    int _3172 = _3170 + 1;
    int _3174 = abs(_3162);
    int _3176 = ~_3150;
    int _3178 = _3176 + 1;
    int _3180 = _3178 + 1;
    int _3182 = _3172 * as_type<int>(_3014);
    int _3184 = _3182 + _3166;
    int _3186 = ~_3174;
    int _3188 = _3186 + 1;
    int _3190 = _3188 + 1;
    float _3192 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3194 = !_3098;
    int _3196 = _3194 ? 0 : (-1);
    int _3198 = _3180 * as_type<int>(_3022);
    int _3200 = _3198 + _3184;
    float _3202 = _1094 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3204 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3206 = ~_3076;
    int _3208 = _3206 + _3196;
    int _3210 = _3208 + 1;
    int _3212 = _3200 * _3190;
    float _3214 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3216 = _3202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3218 = _3004 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3220 = _1458 * _3210;
    int _3222 = _3220 + _2728;
    float _3224 = _3214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3226 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3228 = _2579 + _2454;
    float _3230 = _2492 + _2454;
    bool _3232 = !_2664;
    int _3234 = _3232 ? _3222 : (-1);
    out.m_67.x = _3224;
    out.m_67.y = _3216;
    out.m_67.z = _3204;
    out.m_67.w = _3218;
    bool _3236 = _2218 > 0.0;
    bool _3238 = isnan(_2218);
    bool _3240 = _3236 || _3238;
    bool _3242 = isnan(0.0);
    bool _3244 = _3240 || _3242;
    float _3246 = _3228 * 0.5;
    int _3248 = _3234 * _3174;
    int _3250 = _3248 + _3212;
    float _3252 = _2454 * 0.5;
    float _3254 = _3230 * 0.5;
    float _3256 = fma(_2498, -0.5, _3252);
    float _3258 = float(_3250);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _3260 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3262 = _3226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3258;
    float _3264 = _3260 * _2522;
    float _3266 = -_3260;
    float _3268 = _3266 + 1.0;
    out.m_73.x = _3254;
    out.m_73.y = _3256;
    out.m_73.z = _3246;
    out.m_73.w = _2454;
    float _3270 = _2533 * _3264;
    float _3272 = _2543 * _3264;
    float _3274 = _2533 * _3268;
    out.m_49.x = _3262;
    float _3276 = fma(_2539, _3270, _2527);
    float _3278 = fma(_2541, _3270, _2529);
    float _3280 = fma(_2533, _3272, _2531);
    out.m_75.x = _3276;
    out.m_75.y = _3278;
    out.m_75.z = _3280;
    out.m_75.w = _3274;
    if (_3244)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3282 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3282;
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
    bool _1118 = false;
    bool _848 = false;
    bool _748 = false;
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
        float _3351 = as_type<float>(_118);
        out.gl_Position.z = _3351;
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
        float _3406 = as_type<float>(_144);
        out.gl_Position.z = _3406;
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
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _478 = _468 + _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = 1.0 / _482;
    bool _498 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _500 = 1.0 / _490;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _504 = _468 + _502;
    float _506 = _442 * _472;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _510 = _468 + _508;
    float _512 = 1.0 / _494;
    float _514 = _444 * _474;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _518 = _468 + _516;
    float _520 = _510 * _496;
    bool _522 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _524 = isnan(_468);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = _440 * _470;
    bool _536 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _538 = isnan(_468);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = 1.0 / _486;
    float _550 = _504 * _500;
    float _552 = -_532;
    float _554 = _552 + 1.0;
    bool _556 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _558 = isnan(_468);
    bool _560 = _556 || _558;
    bool _562 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _564 = _560 || _562;
    float _566 = float(_564);
    float _568 = _478 * _512;
    bool _570 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _572 = isnan(_468);
    bool _574 = _570 || _572;
    bool _576 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _578 = _574 || _576;
    float _580 = float(_578);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = -_580;
    float _592 = _590 + 1.0;
    float _594 = fma(_584, _520, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _596 = _518 * _548;
    float _598 = _546 * _554;
    bool _600 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _602 = isnan(_468);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _612;
    float _616 = -_546;
    float _618 = _616 + 1.0;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _624 = fma(_588, _520, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _626 = _610 * _592;
    float _628 = -_610;
    float _630 = _628 + 1.0;
    float _632 = _580 * _618;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _636 = _634 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _642 = fma(_614, _520, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _644 = _566 * _630;
    float _646 = fma(_622, _596, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _648 = fma(_636, _596, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _650 = fma(_640, _596, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _652 = _642 * _644;
    float _654 = _594 * _644;
    float _656 = _624 * _644;
    float _658 = -_566;
    float _660 = _658 + 1.0;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _666;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _670;
    float _674 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].x, _652);
    float _676 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].z, _656);
    float _678 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[107].y, _654);
    float _680 = fma(_664, _550, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _682 = fma(_646, _626, _674);
    float _684 = fma(_650, _626, _676);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _692 = _690 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _694 = fma(_668, _550, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _696 = fma(_672, _550, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _698 = fma(_648, _626, _678);
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _704 = fma(_680, _632, _682);
    float _706 = fma(_688, _568, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _708 = fma(_692, _568, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _710 = fma(_702, _568, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _712 = fma(_694, _632, _698);
    float _714 = fma(_696, _632, _684);
    float _716 = fma(_706, _598, _704);
    float _718 = fma(_708, _598, _712);
    float _720 = fma(_710, _598, _714);
    float _722 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].x, _716);
    float _724 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].y, _718);
    float _726 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[111].z, _720);
    bool _728 = !_498;
    float _746;
    if (!_728)
    {
        float _730 = in.m_53.x;
        float _732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _734 = _730 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _738 = _736 * _732;
        float _740 = floor(_738);
        float _742 = -_740;
        float _744 = _738 + _742;
        _746 = _744;
        _748 = true;
    }
    else
    {
        _746 = _156;
    }
    _748 = false;
    float _750 = _746;
    bool _752 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _754 = isnan(_750);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _768 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _770 = isnan(_750);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _780;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _786 = _750 + _784;
    float _788 = -_762;
    float _790 = _788 + 1.0;
    bool _792 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _794 = 1.0 / _766;
    float _796 = _778 * _790;
    float _798 = -_778;
    float _800 = _798 + 1.0;
    float _802 = _782 * _794;
    float _804 = _724 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _806 = fma(_802, _786, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _808 = _722 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _810 = _806 * _796;
    float _812 = _726 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _814 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[115].x, _810);
    float _816 = _808 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _818 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = _812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _822 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[116].x, _814);
    float _824 = _822 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _826 = !_792;
    float _828 = _820;
    float _846;
    if (!_826)
    {
        float _830 = in.m_53.x;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _834 = _830 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _838 = _836 * _832;
        float _840 = floor(_838);
        float _842 = -_840;
        float _844 = _838 + _842;
        _846 = _844;
        _848 = true;
    }
    else
    {
        _846 = _156;
    }
    _848 = false;
    float _850 = _846;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _854 = _850 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _858 = _850 + _856;
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _862 = _850 + _860;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _872;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _880 = 1.0 / _866;
    bool _882 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _884 = isnan(_850);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = 1.0 / _870;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _898 = _850 + _896;
    float _900 = 1.0 / _874;
    float _902 = _854 * _880;
    bool _904 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _906 = isnan(_850);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    bool _916 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _918 = 1.0 / _878;
    float _920 = _858 * _894;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _922;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _926;
    float _930 = fma(_924, _902, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _932 = fma(_928, _902, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _934 = _862 * _900;
    float _936 = -_892;
    float _938 = _936 + 1.0;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _940;
    float _944 = fma(_942, _902, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _946 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _948 = isnan(_850);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    float _958 = _898 * _918;
    bool _960 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _962 = isnan(_850);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = _914 * _938;
    float _974 = -_914;
    float _976 = _974 + 1.0;
    bool _978 = _850 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _980 = isnan(_850);
    bool _982 = _978 || _980;
    bool _984 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _986 = _982 || _984;
    float _988 = float(_986);
    float _990 = -_970;
    float _992 = _990 + 1.0;
    float _994 = _970 * _976;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1004 = _956 * _992;
    float _1006 = -_956;
    float _1008 = _1006 + 1.0;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1014 = fma(_998, _920, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1016 = fma(_1002, _920, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1018 = _988 * _1008;
    float _1020 = fma(_1012, _920, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1022 = _932 * _1018;
    float _1024 = _930 * _1018;
    float _1026 = -_988;
    float _1028 = _1026 + 1.0;
    float _1030 = _944 * _1018;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1032;
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1038 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1036;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1040;
    float _1044 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1024);
    float _1046 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1022);
    float _1048 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1030);
    float _1050 = fma(_1034, _934, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1052 = fma(_1038, _934, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1054 = fma(_1042, _934, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1056 = fma(_1014, _1004, _1044);
    float _1058 = fma(_1020, _1004, _1046);
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1068 = fma(_1016, _1004, _1048);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1074 = fma(_1050, _994, _1056);
    float _1076 = fma(_1062, _958, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1078 = fma(_1066, _958, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1080 = fma(_1052, _994, _1058);
    float _1082 = fma(_1072, _958, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1084 = fma(_1054, _994, _1068);
    float _1086 = fma(_1076, _972, _1074);
    float _1088 = fma(_1078, _972, _1080);
    float _1090 = fma(_1082, _972, _1084);
    float _1092 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1086);
    float _1094 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1088);
    float _1096 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1090);
    bool _1098 = !_916;
    float _1116;
    if (!_1098)
    {
        float _1100 = in.m_53.x;
        float _1102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1104 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1106 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1108 = _1106 * _1102;
        float _1110 = floor(_1108);
        float _1112 = -_1110;
        float _1114 = _1108 + _1112;
        _1116 = _1114;
        _1118 = true;
    }
    else
    {
        _1116 = _156;
    }
    _1118 = false;
    float _1120 = _1116;
    float _1122 = in.m_42.x;
    float _1124 = in.m_42.y;
    float _1126 = in.m_42.z;
    float _1128 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1130 = in.m_53.x;
    int _1132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1134 = _1132 != 0;
    float _1136 = in.m_53.y;
    float _1138 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1142 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1144 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1142);
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1148 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1150 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1152 = _1124 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1154 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1144);
    float _1156 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1158 = _1130 * 2.0;
    float _1160 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1152);
    float _1162 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1148);
    float _1164 = in.m_53.z;
    float _1166 = _1136 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1168 = -_1138;
    float _1170 = fma(_1156, 2.0, _1168);
    float _1172 = _1136 * 2.0;
    float _1174 = floor(_1158);
    float _1176 = fma(_1166, -2.0, _1140);
    float _1178 = fma(_1122, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1150);
    float _1180 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1160);
    float _1182 = _1130 + _1136;
    float _1184 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1186 = floor(_1172);
    float _1188 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1178);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _1192 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1184);
    float _1194 = _1182 + (-1.0);
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1198 = _1174 > 0.0;
    float _1200 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1192);
    bool _1202 = _1174 >= 0.0;
    bool _1204 = isnan(_1174);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan(0.0);
    bool _1210 = _1206 || _1208;
    float _1212 = fma(_1126, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1162);
    float _1214 = _1192;
    float _1216 = _1162;
    float _1218 = _1126;
    float _1220 = _1178;
    float _1222 = _1136;
    if (!_1134)
    {
        _1214 = _1136;
    }
    float _1224 = _1214;
    float _1226 = _1164 * 2.0;
    float _1228 = _1224;
    if (!_1134)
    {
        _1216 = _1130;
    }
    float _1230 = _1216;
    float _1232 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1234 = _1230;
    if (!_1134)
    {
        _1218 = _1164;
    }
    float _1236 = _1218;
    float _1238 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1240 = int(_1238);
    float _1242 = _1236;
    if (_1134)
    {
        _1228 = _1130;
    }
    float _1244 = _1228;
    float _1246 = -_100;
    float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1170);
    if (_1134)
    {
        _1234 = _1164;
    }
    float _1250 = _1234;
    float _1252 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1176);
    bool _1254 = _1186 > 0.0;
    float _1256 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1258 = _1186;
    if (!_1134)
    {
        _1220 = _1236;
    }
    float _1260 = _1220;
    float _1262 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1190);
    float _1264 = -_1146;
    float _1266 = fma(_1256, 2.0, _1264);
    float _1268 = _1260;
    if (_1134)
    {
        _1268 = _1136;
    }
    float _1270 = _1268;
    float _1272 = floor(_1226);
    bool _1274 = _1186 >= 0.0;
    bool _1276 = isnan(_1186);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan(0.0);
    bool _1282 = _1278 || _1280;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (!_1134)
    {
        _1258 = _1136;
    }
    float _1286 = _1258;
    float _1288 = _1270 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1290 = _1210 ? 0 : 1;
    float _1292 = _1130 + _1164;
    float _1294 = fma(_1288, -2.0, _1284);
    float _1296 = _1286;
    if (_1134)
    {
        _1296 = _1130;
    }
    float _1298 = _1296;
    float _1300 = _1292 + (-1.0);
    int _1302 = _1282 ? 0 : 1;
    float _1304 = rsqrt(_1154);
    int _1306 = ~_1290;
    int _1308 = _1306 + 1;
    int _1310 = _1308 + 1;
    float _1312 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1196);
    int _1314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1316 = _1314 != 0;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1320 = _1318 != 0;
    int _1322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1324 = _1322 != 0;
    float _1326 = -_100;
    float _1328 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1266);
    int _1330 = _1310;
    if (!_1198)
    {
        int _1332 = ~_1290;
        int _1334 = _1332 + 1;
        _1330 = _1334;
    }
    int _1336 = _1330;
    float _1338 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1262);
    int _1340 = ~_1302;
    int _1342 = _1340 + 1;
    int _1344 = _1342 + 1;
    float _1346 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1348 = log2(_1346);
    int _1350 = _1344;
    if (!_1254)
    {
        int _1352 = ~_1302;
        int _1354 = _1352 + 1;
        _1350 = _1354;
    }
    int _1356 = _1350;
    float _1358 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1294);
    float _1360 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1362 = !_1320;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = _1180 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1368 = !_1316;
    int _1370 = _1368 ? 0 : 1;
    float _1372 = fma(_1300, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1374 = !_1324;
    int _1376 = _1374 ? 0 : 1;
    float _1378 = _1136 + _1164;
    int _1380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1382 = _1380 != 0;
    int _1384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1386 = _1384 != 0;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1390 = _1388 != 0;
    float _1392 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1394 = _1378 + (-1.0);
    bool _1396 = !_1390;
    int _1398 = _1396 ? 0 : 1;
    float _1400 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1402 = !_1386;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1408 = abs(_1398);
    float _1410 = float(_1240);
    bool _1412 = _1272 > 0.0;
    bool _1414 = _1272 >= 0.0;
    bool _1416 = isnan(_1272);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan(0.0);
    bool _1422 = _1418 || _1420;
    float _1424 = _1348 * _100;
    float _1426 = 1.0 / _1410;
    if (_1134)
    {
        _1242 = _1136;
    }
    float _1428 = _1242;
    int _1430 = abs(_1404);
    float _1432 = float(_1356);
    float _1434 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1406);
    float _1436 = float(_1408);
    float _1438 = exp2(_1424);
    float _1440 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1434);
    float _1442 = float(_1336);
    float _1444 = _1436 * _1432;
    float _1446 = in.m_57.x;
    float _1448 = in.m_57.y;
    float _1450 = in.m_57.z;
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1454 = 1.0 + _1452;
    float _1456 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1458 = int(_1456);
    float _1460 = _1426 * _100;
    float _1462 = float(_1430);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1466 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1468 = isnan(1.0);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1474 = _1470 || _1472;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1478 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1480 = isnan(0.0);
    bool _1482 = _1478 || _1480;
    bool _1484 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1486 = _1482 || _1484;
    float _1488 = 1.0 / _1454;
    float _1490 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1464);
    float _1492 = -_1438;
    float _1494 = _1492 + 1.0;
    float _1496 = _1462 * _1442;
    float _1498 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1476);
    float _1500 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1490);
    int _1502 = _1422 ? 0 : 1;
    float _1504 = _1496 * (-2.0);
    float _1506 = float(_1458);
    float _1508 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1498);
    float _1510 = _1486 ? _1494 : 0.0;
    float _1512 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1312);
    float _1514 = fma(_1400, _1504, _1400);
    float _1516 = _1506 * _100;
    float _1518 = fma(_1504, _1448, _1448);
    float _1520 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1474)
    {
        float _1522 = _1510 * _1488;
        _110 = _1522;
    }
    float _1524 = _110;
    float _1526 = _1136 + (-0.5);
    int _1528 = ~_1502;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    int _1534 = _1532;
    if (!_1412)
    {
        int _1536 = ~_1502;
        int _1538 = _1536 + 1;
        _1534 = _1538;
    }
    int _1540 = _1534;
    float _1542 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1518);
    float _1544 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1546 = _1520 * _1520;
    float _1548 = _1304 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1550 = fma(_1544, _1544, _1546);
    bool _1552 = !_1382;
    int _1554 = _1552 ? 0 : 1;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1556;
    float _1560 = _1444 * (-2.0);
    float _1562 = fma(_1548, _1548, _1550);
    int _1564 = abs(_1554);
    float _1566 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1568 = fma(_1372, _1560, _1372);
    float _1570 = fma(_1560, _1450, _1450);
    float _1572 = fma(_1514, _1524, _1542);
    float _1574 = _1212 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1576 = _1164 + (-0.5);
    float _1578 = _1572 * 0.15915493667125701904296875;
    float _1580 = float(_1540);
    float _1582 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1566);
    float _1584 = float(_1564);
    float _1586 = fma(_1576, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1570);
    float _1588 = rsqrt(_1562);
    float _1590 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1582);
    float _1592 = _1584 * _1580;
    float _1594 = _1592 * (-2.0);
    float _1596 = _1590 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1598 = fma(_1568, _1524, _1586);
    float _1600 = _1130 + (-0.5);
    float _1602 = in.m_59.x;
    float _1604 = in.m_59.y;
    float _1606 = in.m_59.z;
    float _1608 = -_1596;
    float _1610 = _1392 + _1608;
    float _1612 = fma(_1594, _1446, _1446);
    float _1614 = 1.0 / _1558;
    float _1616 = fma(_1232, _1594, _1232);
    bool _1618 = _1596 >= _1392;
    bool _1620 = isnan(_1596);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(_1392);
    bool _1626 = _1622 || _1624;
    float _1628 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1612);
    float _1630 = abs(_1610);
    float _1632 = precise::max(_1630, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1634 = _1598 * 0.15915493667125701904296875;
    float _1636 = _1544 * _1588;
    float _1638 = fma(_1616, _1524, _1628);
    float _1640 = precise::min(_1632, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1642 = _1634 * 6.283185482025146484375;
    float _1644 = sin(_1642);
    bool _1646 = !_1626;
    float _1648 = _1646 ? 1.0 : (-1.0);
    float _1650 = _1638 * 0.15915493667125701904296875;
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1654 = _1640 + _1652;
    float _1656 = _1520 * _1588;
    float _1658 = _1548 * _1588;
    float _1660 = _1654 * _1614;
    float _1662 = _1634 * 6.283185482025146484375;
    float _1664 = cos(_1662);
    float _1666 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1602);
    float _1668 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1606);
    float _1670 = _1648 * _1660;
    float _1672 = _1578 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    float _1676 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1678 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1680 = _1678 * _1670;
    float _1682 = _1578 * 6.283185482025146484375;
    float _1684 = cos(_1682);
    float _1686 = _1650 * 6.283185482025146484375;
    float _1688 = sin(_1686);
    float _1690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1604);
    float _1692 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1694 = _1676 * _1668;
    float _1696 = _1128 * _1690;
    float _1698 = _1692 * _1666;
    float _1700 = _1680 * 0.15915493667125701904296875;
    float _1702 = _1650 * 6.283185482025146484375;
    float _1704 = cos(_1702);
    float _1706 = _1664 * _1696;
    float _1708 = _1684 * _1664;
    float _1710 = _1674 * _1664;
    float _1712 = _1688 * _1674;
    float _1714 = -_1696;
    float _1716 = _1644 * _1714;
    float _1718 = _1700 * 6.283185482025146484375;
    float _1720 = cos(_1718);
    float _1722 = fma(_1708, _1698, _1716);
    float _1724 = _1704 * _1684;
    float _1726 = _1704 * _1674;
    float _1728 = _1704 * _1706;
    float _1730 = _1688 * _1684;
    float _1732 = fma(_1644, _1724, _1712);
    float _1734 = _1688 * _1706;
    float _1736 = fma(_1710, _1694, _1722);
    float _1738 = -_1730;
    float _1740 = fma(_1644, _1726, _1738);
    float _1742 = fma(_1732, _1698, _1728);
    float _1744 = -_1726;
    float _1746 = fma(_1644, _1730, _1744);
    float _1748 = _1700 * 6.283185482025146484375;
    float _1750 = sin(_1748);
    float _1752 = fma(_1644, _1712, _1724);
    float _1754 = fma(_1740, _1694, _1742);
    float _1756 = fma(_1746, _1698, _1734);
    float _1758 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1762 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1764 = fma(_1752, _1694, _1756);
    float _1766 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1758);
    float _1768 = -_1720;
    float _1770 = _1768 + 1.0;
    float _1772 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1760);
    float _1774 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1762);
    float _1776 = _1658 * _1658;
    float _1778 = _1656 * _1770;
    float _1780 = _1636 * _1750;
    float _1782 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1766);
    float _1784 = _1656 * _1750;
    float _1786 = fma(_1770, _1776, _1720);
    float _1788 = _1658 * _1750;
    float _1790 = _1636 * _1770;
    float _1792 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1772);
    float _1794 = fma(_1658, _1778, _1780);
    float _1796 = _1782 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1798 = -_1788;
    float _1800 = fma(_1656, _1790, _1798);
    float _1802 = -_1784;
    float _1804 = fma(_1658, _1790, _1802);
    float _1806 = _1792 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1808 = _1796 * _1794;
    float _1810 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1774);
    float _1812 = fma(_1636, _1790, _1720);
    float _1814 = _1796 * _1800;
    float _1816 = fma(_1806, _1804, _1808);
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1820 = fma(_1656, _1790, _1788);
    float _1822 = fma(_1806, _1812, _1814);
    float _1824 = fma(_1658, _1790, _1784);
    float _1826 = fma(_1818, _1786, _1816);
    float _1828 = fma(_1656, _1778, _1720);
    float _1830 = -_1780;
    float _1832 = fma(_1658, _1778, _1830);
    float _1834 = fma(_1818, _1824, _1822);
    float _1836 = _1366 + _1826;
    float _1838 = _1796 * _1828;
    float _1840 = _1574 + _1834;
    float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1844 = _1836 + _1842;
    float _1846 = fma(_1806, _1820, _1838);
    float _1848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1850 = _1840 + _1848;
    float _1852 = _1844 * _1844;
    float _1854 = fma(_1818, _1832, _1846);
    float _1856 = fma(_1850, _1850, _1852);
    float _1858 = _1360 + _1854;
    float _1860 = sqrt(_1856);
    bool _1862 = _1860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1864 = _1854;
    float _1866 = _1656;
    float _1868 = _1846;
    if (!_1862)
    {
        _1864 = _1840;
    }
    float _1870 = _1864;
    float _1872 = _1870;
    if (!_1862)
    {
        _1866 = _1836;
    }
    float _1874 = _1866;
    float _1876 = _1874;
    if (!_1862)
    {
        _1868 = _1858;
    }
    float _1878 = _1868;
    bool _1880 = !_1862;
    float _1882 = _1878;
    if (!_1880)
    {
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1888 = _1860 + _1886;
        float _1890 = rsqrt(_1856);
        float _1892 = _1888 * _1884;
        float _1894 = _1858 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1896 = _1892 * 0.15915493667125701904296875;
        float _1898 = _1896 * 6.283185482025146484375;
        float _1900 = sin(_1898);
        float _1902 = _1896 * 6.283185482025146484375;
        float _1904 = cos(_1902);
        float _1906 = fma(_1900, _1894, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1908 = _1890 * _1906;
        float _1910 = _1904 + (-1.0);
        float _1912 = fma(_1850, _1908, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1914 = fma(_1844, _1908, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1916 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1918 = fma(_1858, _1904, _1916);
        _1882 = _1918;
        _1872 = _1912;
        _1876 = _1914;
    }
    float _1920 = _1882;
    float _1922 = _1872;
    float _1924 = _1876;
    float _1926 = -_1360;
    float _1928 = _1926 + _1920;
    float _1930 = -_1574;
    float _1932 = _1930 + _1922;
    float _1934 = -_1366;
    float _1936 = _1934 + _1924;
    float _1938 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1940 = _1928 * _1928;
    float _1942 = fma(_1932, _1932, _1940);
    float _1944 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1938);
    float _1946 = _1360 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1948 = fma(_1936, _1936, _1942);
    float _1950 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1944);
    float _1952 = sqrt(_1948);
    float _1954 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1956 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1946);
    float _1958 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1956);
    bool _1960 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1962 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1964 = _1960 || _1962;
    bool _1966 = isnan(0.5);
    bool _1968 = _1964 || _1966;
    float _1970 = 1.0 / _1954;
    float _1972 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1974 = _1972 + _1954;
    bool _1976 = _1952 > 0.0;
    bool _1978 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1980 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1982 = _1978 || _1980;
    bool _1984 = isnan(0.5);
    bool _1986 = _1982 || _1984;
    float _1988 = _1974 * _1970;
    float _1990 = _1988 * 0.5;
    bool _1992 = !_1976;
    float _1994 = _1920;
    float _1996 = _1932;
    float _1998 = _1922;
    float _2000 = _1924;
    float _2002 = _1954;
    float _2004 = _1928;
    float _2006 = _1936;
    float _2008 = _1948;
    float _2010 = _1972;
    float _2012 = _1970;
    if (!_1992)
    {
        float _2014 = _172 * _172;
        float _2016 = rsqrt(_1948);
        float _2018 = fma(_170, _170, _2014);
        float _2020 = fma(_174, _174, _2018);
        float _2022 = sqrt(_2020);
        float _2024 = _1932 * _2016;
        float _2026 = _1928 * _2016;
        bool _2028 = _2022 > 0.0;
        float _2030 = _1936 * _2016;
        bool _2032 = !_2028;
        _2002 = _2020;
        _2008 = _2016;
        _2010 = _2030;
        if (!_2032)
        {
            float _2034 = rsqrt(_2020);
            float _2036 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2038 = _172 * _2034;
            float _2040 = _170 * _2034;
            float _2042 = _174 * _2034;
            float _2044 = _2026 * _2038;
            float _2046 = fma(_2024, _2040, _2044);
            float _2048 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2050 = fma(_2030, _2042, _2046);
            float _2052 = _2050 * _2048;
            float _2054 = fma(_170, _2052, _1922);
            float _2056 = fma(_172, _2052, _1920);
            float _2058 = fma(_174, _2052, _1924);
            _1994 = _2056;
            _1996 = _2046;
            _1998 = _2054;
            _2000 = _2058;
            _2004 = _2052;
            _2006 = _2044;
            _2008 = _2048;
        }
    }
    float _2060 = _1994;
    float _2062 = _1996;
    float _2064 = _1998;
    float _2066 = _2000;
    float _2068 = _2002;
    float _2070 = _2004;
    float _2072 = _2006;
    float _2074 = _2008;
    float _2076 = _2010;
    float _2078 = _2068;
    float _2080 = _2070;
    float _2082 = _2064;
    float _2084 = _2066;
    float _2086 = _2062;
    float _2088 = _2076;
    if (_1986)
    {
        _2078 = 1.0;
    }
    float _2090 = _2078;
    float _2092 = _2090;
    if (_1968)
    {
        _2080 = _2060;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (!_1968)
    {
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2100 = _1360 + _2098;
        float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2104 = _1574 + _2102;
        float _2106 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2108 = -_1360;
        float _2110 = _2108 + _2060;
        float _2112 = _2100 * _2100;
        float _2114 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2116 = _1366 + _2114;
        float _2118 = fma(_2104, _2104, _2112);
        float _2120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2122 = fma(_2116, _2116, _2118);
        float _2124 = sqrt(_2122);
        float _2126 = _2106 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2128 = precise::min(_2124, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2130 = _2128 * _2120;
        float _2132 = -_1574;
        float _2134 = _2132 + _2064;
        float _2136 = -_1366;
        float _2138 = _2136 + _2066;
        float _2140 = _2126 * _2130;
        float _2142 = fma(_2134, _2140, _1574);
        float _2144 = fma(_2110, _2140, _1360);
        float _2146 = fma(_2138, _2140, _1366);
        _2096 = _2144;
        _2082 = _2142;
        _2084 = _2146;
        _2086 = _2140;
    }
    float _2148 = _2096;
    float _2150 = _2082;
    float _2152 = _2084;
    float _2154 = _2086;
    float _2156 = _2154;
    if (!_1986)
    {
        float _2158 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2160 = _2158 * 0.15915493667125701904296875;
        float _2162 = _2160 * 6.283185482025146484375;
        float _2164 = cos(_2162);
        float _2166 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2168 = _2166 * 0.15915493667125701904296875;
        float _2170 = _2160 * 6.283185482025146484375;
        float _2172 = sin(_2170);
        float _2174 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2176 = fma(_1990, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2174);
        float _2178 = 1.0 / _2164;
        float _2180 = _2168 * 6.283185482025146484375;
        float _2182 = cos(_2180);
        float _2184 = _2172 * _2178;
        float _2186 = 1.0 / _2176;
        float _2188 = _2182 * _2184;
        float _2190 = _2168 * 6.283185482025146484375;
        float _2192 = sin(_2190);
        float _2194 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2196 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2194;
        float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2200 = _2186 * _2198;
        float _2202 = 1.0 / _2188;
        float _2204 = 1.0 / _2196;
        float _2206 = _2192 * _2202;
        float _2208 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2210 = fma(_2206, _2200, _2208);
        float _2212 = _2210 * _2204;
        float _2214 = precise::clamp(_2212, 0.0, 1.0);
        _2156 = _2160;
        _2092 = _2214;
    }
    float _2216 = _2156;
    float _2218 = _2092;
    float _2220 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2222 = _2148 + _2220;
    float _2224 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2226 = _2150 + _2224;
    float _2228 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2230 = _2152 + _2228;
    float _2232 = _2222 * _2222;
    float _2234 = fma(_2226, _2226, _2232);
    float _2236 = fma(_2230, _2230, _2234);
    float _2238 = rsqrt(_2236);
    float _2240 = sqrt(_2236);
    float _2242 = _2238 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2244 = _2226 * _2242;
    float _2246 = _2230 * _2242;
    float _2248 = _2244 * _2244;
    float _2250 = _2246 * _2246;
    float _2252 = _2248 + _2250;
    float _2254 = sqrt(_2252);
    bool _2256 = _2254 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2258 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2260 = _2254 + _2258;
    float _2262 = _2072;
    float _2264 = _2260;
    float _2266 = _2222;
    float _2268 = _2246;
    float _2270 = _2248;
    float _2272 = _2250;
    if (_2256)
    {
        float _2274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2262 = _2274;
    }
    float _2276 = _2262;
    if (_2256)
    {
        float _2278 = _2260 * _2276;
        _2264 = _2278;
    }
    float _2280 = _2264;
    if (_2256)
    {
        float _2282 = _2280 * 0.15915493667125701904296875;
        _2012 = _2282;
    }
    float _2284 = _2012;
    float _2286 = _2074;
    if (_2256)
    {
        float _2288 = _2284 * 6.283185482025146484375;
        float _2290 = sin(_2288);
        _2286 = _2290;
    }
    float _2292 = _2286;
    float _2294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2296 = precise::max(0.0, _2294);
    float _2298 = _2216;
    float _2300 = _2296;
    if (_2256)
    {
        float _2302 = _2284 * 6.283185482025146484375;
        float _2304 = cos(_2302);
        _2298 = _2304;
    }
    float _2306 = _2298;
    float _2308 = -_2242;
    float _2310 = -_2296;
    float _2312 = fma(_2222, _2308, _2310);
    if (!_2256)
    {
        _2266 = _2244;
    }
    float _2314 = _2266;
    float _2316 = _2294;
    float _2318 = _2314;
    if (_2256)
    {
        float _2320 = rsqrt(_2252);
        _2316 = _2320;
    }
    float _2322 = _2316;
    if (_2256)
    {
        float _2324 = _2312 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2300 = _2324;
    }
    float _2326 = _2300;
    float _2328 = _2326;
    if (_2256)
    {
        float _2330 = fma(_2292, _2326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2088 = _2330;
    }
    float _2332 = _2088;
    float _2334 = _2332;
    if (_2256)
    {
        float _2336 = _2306 + (-1.0);
        _2328 = _2336;
    }
    float _2338 = _2328;
    float _2340 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2342 = _2338;
    if (_2256)
    {
        float _2344 = _2338 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2342 = _2344;
    }
    float _2346 = _2342;
    float _2348 = _2322;
    if (_2256)
    {
        float _2350 = _2322 * _2332;
        _2334 = _2350;
    }
    float _2352 = _2334;
    if (!_2256)
    {
        _2348 = _2312;
    }
    float _2354 = _2348;
    float _2356 = _2354;
    if (_2256)
    {
        float _2358 = fma(_2312, _2306, _2346);
        _2356 = _2358;
    }
    float _2360 = _2356;
    if (_2256)
    {
        float _2362 = _2244 * _2352;
        _2318 = _2362;
    }
    float _2364 = _2318;
    if (_2256)
    {
        float _2366 = _2246 * _2352;
        _2268 = _2366;
    }
    float _2368 = _2268;
    if (_2256)
    {
        float _2370 = _2364 * _2364;
        _2270 = _2370;
    }
    float _2372 = _2270;
    if (_2256)
    {
        float _2374 = _2368 * _2368;
        _2272 = _2374;
    }
    float _2376 = _2272;
    float _2378 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2380 = fma(_2240, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2378);
    float _2382 = precise::clamp(_2380, 0.0, 1.0);
    float _2384 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2386 = fma(_2360, _2360, _2372);
    float _2388 = -_2382;
    float _2390 = _2388 + 1.0;
    float _2392 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2384);
    float _2394 = _2386 + _2376;
    float _2396 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2398 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2400 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2392);
    float _2402 = abs(_2390);
    float _2404 = log2(_2402);
    float _2406 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2396);
    float _2408 = _2148 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2410 = _2400 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2412 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2406);
    float _2414 = rsqrt(_2394);
    float _2416 = _2412 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2418 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2408);
    float _2420 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2398);
    float _2422 = _2416 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2424 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2418);
    float _2426 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2420);
    float _2428 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2430 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2432 = _2424 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2434 = _2426 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2436 = -_2422;
    float _2438 = fma(_2436, _2340, 1.0);
    float _2440 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2428);
    float _2442 = exp2(_2430);
    float _2444 = _2414 * _2364;
    float _2446 = _2414 * _2360;
    float _2448 = _2414 * _2368;
    float _2450 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2440);
    float _2452 = _2444 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2454 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2450);
    float _2456 = -_2452;
    float _2458 = fma(_2446, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2456);
    float _2460 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2462 = log2(_2438);
    float _2464 = -_2448;
    float _2466 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2458);
    float _2468 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2470 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2460);
    float _2472 = fma(_2466, -0.5, 0.5);
    float _2474 = fma(_2466, 0.5, 0.5);
    float _2476 = 1.0 / _2454;
    float _2478 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2468);
    float _2480 = _2446 + 1.0;
    float _2482 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2470);
    float _2484 = fma(_2474, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2486 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2478);
    float _2488 = -_2446;
    float _2490 = fma(_2442, _2480, _2488);
    float _2492 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2482);
    float _2494 = sqrt(_2472);
    float _2496 = fma(_2474, _2484, -0.212114393711090087890625);
    float _2498 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2486);
    float _2500 = _2462 * 0.693147182464599609375;
    float _2502 = fma(_2490, 0.5, 0.5);
    float _2504 = fma(_2474, _2496, 1.570728778839111328125);
    float _2506 = _2500 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2508 = _2498 * _2476;
    float _2510 = _2492 * _2476;
    float _2512 = fma(_2510, 0.5, 0.5);
    float _2514 = _2494 * 0.636619746685028076171875;
    float _2516 = fma(_2508, -0.5, 0.5);
    float _2518 = -_2504;
    float _2520 = fma(_2514, _2518, 1.0);
    float3 _7230 = float3(_2512, _2516, _2506);
    float _2522 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7230, float3(0.0), isnan(_7230)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7230, float3(0.0), isnan(_7230)), level(0.0)).x;
    float3 _7241 = float3(_2512, _2516, _2506);
    float4 _2525 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7241, float3(0.0), isnan(_7241)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7241, float3(0.0), isnan(_7241)), level(0.0)).xyzw;
    float _2527 = _2525.x;
    float _2529 = _2525.y;
    float _2531 = _2525.z;
    float _2533 = _2525.w;
    float2 _7258 = float2(_2520, _2502);
    float3 _2537 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7258, float2(0.0), isnan(_7258)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7258, float2(0.0), isnan(_7258)), level(0.0)).xyz;
    float _2539 = _2537.x;
    float _2541 = _2537.y;
    float _2543 = _2537.z;
    float _2545 = float(uint(_1458));
    float _2547 = trunc(_1460);
    int _2549 = int(_2547);
    int _2551 = ~_1458;
    int _2553 = _2551 + 1;
    out.m_61.x = _816;
    out.m_61.y = _818;
    out.m_61.z = _820;
    out.m_61.w = _824;
    int _2555 = abs(_1364);
    float _2557 = _1338 * (-0.15915493667125701904296875);
    float _2559 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2561 = _2410 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2563 = 1.0 / _2545;
    float _2565 = fma(_2432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2561);
    bool _2567 = !_1134;
    float _2569 = _2567 ? 7.345489978790283203125 : 1.0;
    float _2571 = fma(_2416, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2565);
    float _2573 = float(uint(_2549));
    float _2575 = exp2(_2559);
    float _2577 = float(_2549);
    float _2579 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2571);
    bool _2581 = _2577 >= _1506;
    bool _2583 = isnan(_2577);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(_1506);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    int _2593 = as_type<int>(_2563) + (-2);
    out.gl_Position.x = _2492;
    out.gl_Position.y = _2498;
    out.gl_Position.z = _2579;
    out.gl_Position.w = _2454;
    float _2595 = trunc(_2591);
    int _2597 = int(_2595);
    float _2599 = as_type<float>(_2593) * _2573;
    float _2601 = -_2575;
    float _2603 = _2601 + 1.0;
    float _2605 = trunc(_2599);
    float _2607 = precise::max(_2605, 0.0);
    uint _2610 = uint(_2607);
    int _2612 = _2553 * int(_2610);
    int _2614 = _2612 + _2549;
    float _2616 = float(uint(_2614));
    float _2618 = as_type<float>(_2593) * _2616;
    float _2620 = _2569 * _1130;
    float _2622 = floor(_2620);
    float _2624 = trunc(_2618);
    float _2626 = precise::max(_2624, 0.0);
    uint _2628 = uint(_2626);
    int _2630 = int(_2610) + int(_2628);
    float _2632 = -_2622;
    float _2634 = _2620 + _2632;
    int _2636 = _2553 * _2630;
    int _2638 = _2636 + _2549;
    int _2640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2642 = _2640 != 0;
    int _2644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2646 = _2644 != 0;
    bool _2648 = uint(_2638) >= uint(_1458);
    float _2650 = _2634 * _1506;
    float _2652 = _1516 * _152;
    int _2654 = _1458 + (-1);
    bool _2656 = !_2648;
    int _2658 = _2656 ? 0 : (-1);
    float _2660 = trunc(_2650);
    int _2662 = int(_2660);
    bool _2664 = _1458 == 0;
    int _2666 = ~_2630;
    int _2668 = _2666 + _2658;
    int _2670 = _2668 + 1;
    int _2672 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2674 = _2672 != 0;
    int _2676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2678 = _2676 != 0;
    int _2680 = _1458 * _2670;
    int _2682 = _2680 + _2549;
    int _2684 = ~_2597;
    int _2686 = _2684 + 1;
    int _2688 = _2686 + 1;
    float _2690 = trunc(_2652);
    int _2692 = int(_2690);
    bool _2694 = !_2664;
    int _2696 = _2694 ? _2682 : (-1);
    bool _2698 = !_2642;
    int _2700 = _2698 ? 0 : 1;
    int _2702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2704 = _2702 != 0;
    int _2706 = _2696 * _2688;
    int _2708 = abs(_2700);
    float _2710 = in.m_63.x;
    int _2712 = abs(_1370);
    int _2714 = _2597 * _2654;
    int _2716 = _2714 + _2706;
    int _2718 = abs(_1376);
    int _2720 = _2716 * _2555;
    bool _2722 = !_2704;
    int _2724 = _2722 ? 0 : 1;
    int _2726 = _2662 * _2708;
    int _2728 = _2726 + _2549;
    int _2730 = _2692 * _2712;
    int _2732 = _2730 + _2720;
    int _2734 = abs(_2724);
    int _2736 = ~_1458;
    int _2738 = _2736 + 1;
    int _2740 = _2728 * _2718;
    int _2742 = _2740 + _2732;
    int _2744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2746 = _2744 != 0;
    int _2748 = _2662 * _2734;
    int _2750 = _2748 + _2742;
    float _2752 = in.m_53.w;
    float _2754 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2754;
    int _2758 = as_type<int>(_2710);
    if (!_2678)
    {
        _828 = _2710;
    }
    float _2760 = _828;
    float _2762 = float(uint(_2750));
    float _2764 = as_type<float>(_2593) * _2762;
    int _2766 = ~_1458;
    int _2768 = _2766 + 1;
    float _2770 = trunc(_2764);
    float _2772 = precise::max(_2770, 0.0);
    uint _2774 = uint(_2772);
    bool _2776 = _2752 > 0.5;
    int _2778 = _2768 * int(_2774);
    int _2780 = _2778 + _2750;
    float _2782 = float(uint(_2780));
    float _2784 = as_type<float>(_2593) * _2782;
    float _2786 = in.m_63.y;
    float _2788 = trunc(_2784);
    float _2790 = precise::max(_2788, 0.0);
    uint _2792 = uint(_2790);
    int _2794 = int(_2774) + int(_2792);
    float _2796 = -_2786;
    float _2798 = _2796 + 1.0;
    int _2800 = _2738 * _2794;
    int _2802 = _2800 + _2750;
    float _2804 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2806 = _2804 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2808 = float(uint(_2728));
    bool _2810 = uint(_2802) >= uint(_1458);
    float _2812 = 1.0 / _2806;
    int _2814 = _2776 ? as_type<int>(_2798) : as_type<int>(_2786);
    float _2816 = as_type<float>(_2593) * _2808;
    bool _2818 = !_2810;
    int _2820 = _2818 ? 0 : (-1);
    int _2822 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2824 = _2822 != 0;
    bool _2826 = _1136 > 0.5;
    float _2828 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2830 = ~_2794;
    int _2832 = _2830 + _2820;
    int _2834 = _2832 + 1;
    float _2836 = _2824 ? as_type<float>(_2814) : _2786;
    float _2838 = _2786;
    bool _2840 = _2826;
    bool _2842 = _2824;
    float _2844 = _2760;
    if (_2646)
    {
        float _2846 = _2826 ? _2798 : _2786;
        _2838 = _2846;
    }
    float _2848 = _2838;
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2852 = _1120 + _2850;
    if (_2674)
    {
        bool _2854 = _1164 > 0.5;
        _2840 = _2854;
    }
    bool _2856 = _2840;
    int _2858 = _1458 * _2834;
    int _2860 = _2858 + _2750;
    if (_2678)
    {
        bool _2862 = _1130 > 0.5;
        _2842 = _2862;
    }
    bool _2864 = _2842;
    float _2866 = _2756 * _2812;
    bool _2868 = _1120 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2870 = isnan(_1120);
    bool _2872 = _2868 || _2870;
    bool _2874 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2876 = _2872 || _2874;
    float _2878 = float(_2876);
    float _2880 = trunc(_2816);
    float _2882 = precise::max(_2880, 0.0);
    uint _2884 = uint(_2882);
    bool _2886 = !_2664;
    int _2888 = _2886 ? _2860 : (-1);
    float _2890 = fma(_2866, _2852, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2892 = _1120 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2894 = isnan(_1120);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2900 = _2896 || _2898;
    float _2902 = float(_2900);
    float _2904 = -_2878;
    float _2906 = _2904 + 1.0;
    int _2908 = _2888 >> 31;
    float _2910 = _2828 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2912 = ~_1458;
    int _2914 = _2912 + 1;
    float _2916 = _2902 * _2906;
    int _2918 = _2908 & 3;
    float _2920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2922 = _2916;
    if (!_2678)
    {
        _1222 = _2760;
    }
    float _2924 = _1222;
    float _2926 = fma(_2836, _2910, -0.5);
    int _2928 = _2888 + _2918;
    float _2930 = _2890 * _2916;
    float _2932 = _2924;
    if (_2678)
    {
        _2844 = _2710;
    }
    float _2934 = _2844;
    int _2936 = _2914 * int(_2884);
    int _2938 = _2936 + _2728;
    int _2940 = _2928 >> 2;
    float _2942 = -_2902;
    float _2944 = _2942 + 1.0;
    int _2946 = _2938;
    if (!_2674)
    {
        _2922 = _2934;
    }
    float _2948 = _2922;
    float _2950 = _2948;
    if (_2674)
    {
        float _2952 = -_2934;
        float _2954 = _2952 + 1.0;
        _2758 = as_type<int>(_2954);
    }
    int _2956 = _2758;
    int _2958 = _2940 << 4;
    int _2960 = _2958 + 368;
    float _2962 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2930);
    float _2964 = float(uint(_2938));
    if (_2678)
    {
        float _2966 = -_2934;
        float _2968 = _2966 + 1.0;
        _2946 = as_type<int>(_2968);
    }
    int _2970 = _2946;
    uint _2972 = uint(int(uint(_2960) >> uint(2)));
    uint _2974 = uint(int(uint(int(_2972)) >> uint(2)));
    int _2976 = int(_2972) & 3;
    float _2978 = (*spvDescriptorSet0.vp_c9)._m0[int(_2974)][_2976];
    int _2980 = int(_2972) + 1;
    uint _2982 = uint(int(uint(_2980) >> uint(2)));
    int _2984 = _2980 & 3;
    float _2986 = (*spvDescriptorSet0.vp_c9)._m0[int(_2982)][_2984];
    if (_2674)
    {
        float _2988 = _2856 ? as_type<float>(_2956) : _2934;
        _2950 = _2988;
    }
    float _2990 = _2950;
    float _2992 = _2920 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2994 = as_type<float>(_2593) * _2964;
    float _2996 = _2557 * 6.283185482025146484375;
    float _2998 = sin(_2996);
    if (_2678)
    {
        float _3000 = _2864 ? as_type<float>(_2970) : _2934;
        _2932 = _3000;
    }
    float _3002 = _2932;
    float _3004 = fma(_2878, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2962);
    int _3006 = _2960 + 8;
    uint _3008 = uint(int(uint(_3006) >> uint(2)));
    uint _3010 = uint(int(uint(int(_3008)) >> uint(2)));
    int _3012 = int(_3008) & 3;
    float _3014 = (*spvDescriptorSet0.vp_c9)._m0[int(_3010)][_3012];
    int _3016 = int(_3008) + 1;
    uint _3018 = uint(int(uint(_3016) >> uint(2)));
    int _3020 = _3016 & 3;
    float _3022 = (*spvDescriptorSet0.vp_c9)._m0[int(_3018)][_3020];
    float _3024 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2848, -0.5);
    int _3026 = _2888 & 3;
    bool _3028 = _3026 != 0;
    float _3030 = fma(_2992, _2990, -0.5);
    int _3032 = ~_1458;
    int _3034 = _3032 + 1;
    float _3036 = trunc(_2994);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    float _3042 = -_1252;
    float _3044 = fma(_1508, _3024, _3042);
    float _3046 = fma(_3002, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _3048 = _2888 & 3;
    bool _3050 = _3048 != 0;
    float _3052 = fma(_1500, _3046, _1248);
    bool _3054 = uint(_3048) > 1u;
    float _3056 = _2557 * 6.283185482025146484375;
    float _3058 = cos(_3056);
    int _3060 = _3028 ? 0 : 1;
    float _3062 = _3044 + 0.5;
    bool _3064 = _3048 != 3;
    float _3066 = _3052 + 0.5;
    bool _3068 = uint(_3048) >= 2u;
    int _3070 = ~_3060;
    int _3072 = _3070 + 1;
    int _3074 = _3072 + 1;
    int _3076 = int(_2884) + int(_3040);
    float _3078 = _2998 * _2926;
    int _3080 = _3074;
    if (!_3054)
    {
        int _3082 = ~_3060;
        int _3084 = _3082 + 1;
        _3080 = _3084;
    }
    int _3086 = _3080;
    int _3088 = _3034 * _3076;
    int _3090 = _3088 + _2728;
    float _3092 = _3058 * _2926;
    float _3094 = -_3078;
    float _3096 = fma(_3058, _3030, _3094);
    bool _3098 = uint(_3090) >= uint(_1458);
    float _3100 = fma(_2998, _3030, _3092);
    int _3102 = _3068 ? 0 : 1;
    float _3104 = fma(_1512, _3096, _1328);
    bool _3106 = !_3050;
    int _3108 = _3106 ? 0 : 1;
    float _3110 = -_1358;
    float _3112 = fma(_1440, _3100, _3110);
    int _3114 = abs(_3086);
    float _3116 = _3104 + 0.5;
    int _3118 = ~_3102;
    int _3120 = _3118 + 1;
    int _3122 = _3120 + 1;
    float _3124 = _3112 + 0.5;
    bool _3126 = _3048 != 3;
    int _3128 = abs(_3108);
    int _3130 = _3122;
    if (_3064)
    {
        int _3132 = ~_3102;
        int _3134 = _3132 + 1;
        _3130 = _3134;
    }
    int _3136 = _3130;
    out.m_65.x = _3066;
    out.m_65.y = _3062;
    out.m_65.z = _3116;
    out.m_65.w = _3124;
    bool _3138 = !_3126;
    int _3140 = _3138 ? 0 : (-1);
    int _3142 = abs(_3136);
    int _3144 = ~_3114;
    int _3146 = _3144 + 1;
    int _3148 = _3146 + 1;
    int _3150 = abs(_3140);
    int _3152 = ~_3128;
    int _3154 = _3152 + 1;
    int _3156 = _3154 + 1;
    int _3158 = _3148 * as_type<int>(_2986);
    bool _3160 = !_2746;
    int _3162 = _3160 ? 0 : 1;
    int _3164 = _3156 * as_type<int>(_2978);
    int _3166 = _3164 + _3158;
    int _3168 = ~_3142;
    int _3170 = _3168 + 1;
    int _3172 = _3170 + 1;
    int _3174 = abs(_3162);
    int _3176 = ~_3150;
    int _3178 = _3176 + 1;
    int _3180 = _3178 + 1;
    int _3182 = _3172 * as_type<int>(_3014);
    int _3184 = _3182 + _3166;
    int _3186 = ~_3174;
    int _3188 = _3186 + 1;
    int _3190 = _3188 + 1;
    float _3192 = _1096 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _3194 = !_3098;
    int _3196 = _3194 ? 0 : (-1);
    int _3198 = _3180 * as_type<int>(_3022);
    int _3200 = _3198 + _3184;
    float _3202 = _1094 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3204 = _3192 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3206 = ~_3076;
    int _3208 = _3206 + _3196;
    int _3210 = _3208 + 1;
    int _3212 = _3200 * _3190;
    float _3214 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3216 = _3202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3218 = _3004 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3220 = _1458 * _3210;
    int _3222 = _3220 + _2728;
    float _3224 = _3214 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3226 = _2218 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3228 = _2579 + _2454;
    float _3230 = _2492 + _2454;
    bool _3232 = !_2664;
    int _3234 = _3232 ? _3222 : (-1);
    out.m_67.x = _3224;
    out.m_67.y = _3216;
    out.m_67.z = _3204;
    out.m_67.w = _3218;
    bool _3236 = _2218 > 0.0;
    bool _3238 = isnan(_2218);
    bool _3240 = _3236 || _3238;
    bool _3242 = isnan(0.0);
    bool _3244 = _3240 || _3242;
    float _3246 = _3228 * 0.5;
    int _3248 = _3234 * _3174;
    int _3250 = _3248 + _3212;
    float _3252 = _2454 * 0.5;
    float _3254 = _3230 * 0.5;
    float _3256 = fma(_2498, -0.5, _3252);
    float _3258 = float(_3250);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    float _3260 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3262 = _3226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3258;
    float _3264 = _3260 * _2522;
    float _3266 = -_3260;
    float _3268 = _3266 + 1.0;
    out.m_73.x = _3254;
    out.m_73.y = _3256;
    out.m_73.z = _3246;
    out.m_73.w = _2454;
    float _3270 = _2533 * _3264;
    float _3272 = _2543 * _3264;
    float _3274 = _2533 * _3268;
    out.m_49.x = _3262;
    float _3276 = fma(_2539, _3270, _2527);
    float _3278 = fma(_2541, _3270, _2529);
    float _3280 = fma(_2533, _3272, _2531);
    out.m_75.x = _3276;
    out.m_75.y = _3278;
    out.m_75.z = _3280;
    out.m_75.w = _3274;
    if (_3244)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3282 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3282;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

