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
    float4 m_69 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1174 = false;
    bool _904 = false;
    bool _806 = false;
    bool _470 = false;
    bool _200 = false;
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
        float _3503 = as_type<float>(_118);
        out.gl_Position.z = _3503;
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
        float _3558 = as_type<float>(_144);
        out.gl_Position.z = _3558;
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
    float _178 = _170;
    float _180 = _174;
    float _198;
    if (!_176)
    {
        float _182 = in.m_53.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        _198 = _156;
    }
    _200 = false;
    float _202 = _198;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _228 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_202);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = 1.0 / _218;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = _202 + _242;
    float _246 = 1.0 / _226;
    bool _248 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_202);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _222;
    float _264 = 1.0 / _214;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _268 = _202 + _266;
    float _270 = _206 * _246;
    bool _272 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _274 = isnan(_202);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    float _288 = _268 * _240;
    bool _290 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _292 = isnan(_202);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -_258;
    float _304 = _302 + 1.0;
    float _306 = _210 * _262;
    float _308 = -_300;
    float _310 = _308 + 1.0;
    float _312 = fma(_286, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = _282 * _310;
    bool _316 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_202);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _332 = -_282;
    float _334 = _332 + 1.0;
    float _336 = _238 * _304;
    float _338 = _244 * _264;
    float _340 = -_238;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    float _352 = _258 * _334;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _362 = _326 * _342;
    float _364 = fma(_346, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_350, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = fma(_330, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _370 = fma(_356, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _372 = fma(_360, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _374 = _312 * _362;
    float _376 = -_326;
    float _378 = _376 + 1.0;
    float _380 = _364 * _362;
    float _382 = _366 * _362;
    float _384 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _374);
    float _386 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _380);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _388;
    float _392 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _382);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _398;
    float _402 = fma(_368, _336, _384);
    float _404 = fma(_370, _336, _386);
    float _406 = fma(_390, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _408 = fma(_372, _336, _392);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _418 = fma(_396, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _420 = fma(_400, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _426 = fma(_406, _352, _402);
    float _428 = fma(_412, _288, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _430 = fma(_416, _288, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _432 = fma(_424, _288, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _434 = fma(_418, _352, _404);
    float _436 = fma(_420, _352, _408);
    float _438 = fma(_428, _314, _426);
    float _440 = fma(_430, _314, _434);
    float _442 = fma(_432, _314, _436);
    float _444 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].x, _438);
    float _446 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].y, _440);
    float _448 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].z, _442);
    bool _450 = !_260;
    float _468;
    if (!_450)
    {
        float _452 = in.m_53.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        _468 = _156;
    }
    _470 = false;
    float _472 = _468;
    float _474 = in.m_55.x;
    float _476 = in.m_55.y;
    float _478 = in.m_55.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = 1.0 / _482;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _498;
    float _502 = 1.0 / _486;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _472 + _504;
    float _508 = _446 * _476;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _512 = _472 + _510;
    float _514 = 1.0 / _490;
    float _516 = _506 * _496;
    float _518 = _448 * _478;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _522 = _472 + _520;
    bool _524 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _526 = isnan(_472);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _538 = _472 + _536;
    bool _540 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _542 = isnan(_472);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = _444 * _474;
    float _554 = 1.0 / _494;
    float _556 = _512 * _502;
    bool _558 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _560 = isnan(_472);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _572 = _472 + _570;
    bool _574 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _576 = isnan(_472);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    bool _586 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _588 = -_568;
    float _590 = _588 + 1.0;
    float _592 = 1.0 / _500;
    float _594 = _522 * _514;
    bool _596 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _598 = isnan(_472);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _534 * _590;
    float _610 = -_534;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _614;
    float _618 = -_584;
    float _620 = _618 + 1.0;
    float _622 = _572 * _554;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _628;
    float _632 = _606 * _612;
    float _634 = fma(_616, _516, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _636 = fma(_626, _516, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _638 = fma(_630, _516, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _640 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _642 = isnan(_472);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _538 * _592;
    float _654 = -_606;
    float _656 = _654 + 1.0;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _662 = _550 * _620;
    float _664 = -_550;
    float _666 = _664 + 1.0;
    float _668 = _584 * _656;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _678 = _650 * _666;
    float _680 = fma(_660, _556, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _682 = fma(_672, _556, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _684 = fma(_676, _556, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _686 = _634 * _678;
    float _688 = -_650;
    float _690 = _688 + 1.0;
    float _692 = _636 * _678;
    float _694 = _638 * _678;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _696;
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[107].x, _686);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[107].y, _692);
    float _704 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[107].z, _694);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _710;
    float _714 = fma(_698, _594, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _716 = fma(_682, _662, _700);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _718;
    float _722 = fma(_708, _622, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _724 = fma(_712, _594, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _730 = fma(_714, _668, _716);
    float _732 = fma(_720, _594, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _734 = fma(_684, _662, _704);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _740 = fma(_680, _662, _702);
    float _742 = fma(_728, _622, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _744 = fma(_732, _668, _734);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _746;
    float _750 = fma(_738, _622, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _752 = fma(_724, _668, _740);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _758;
    float _762 = fma(_722, _632, _730);
    float _764 = fma(_748, _652, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _766 = fma(_756, _652, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _768 = fma(_760, _652, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _770 = fma(_742, _632, _752);
    float _772 = fma(_750, _632, _744);
    float _774 = fma(_764, _608, _762);
    float _776 = fma(_766, _608, _770);
    float _778 = fma(_768, _608, _772);
    float _780 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[112].x, _774);
    float _782 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[112].y, _776);
    float _784 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[112].z, _778);
    bool _786 = !_586;
    float _804;
    if (!_786)
    {
        float _788 = in.m_53.x;
        float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _792 = _788 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _796 = _794 * _790;
        float _798 = floor(_796);
        float _800 = -_798;
        float _802 = _796 + _800;
        _804 = _802;
        _806 = true;
    }
    else
    {
        _804 = _156;
    }
    _806 = false;
    float _808 = _804;
    bool _810 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _812 = isnan(_808);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _826 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _828 = isnan(_808);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _838;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _808 + _842;
    float _846 = -_820;
    float _848 = _846 + 1.0;
    bool _850 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _852 = 1.0 / _824;
    float _854 = _836 * _848;
    float _856 = -_836;
    float _858 = _856 + 1.0;
    float _860 = _840 * _852;
    float _862 = _782 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _864 = fma(_860, _844, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _866 = _780 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _868 = _864 * _854;
    float _870 = _784 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _872 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[115].x, _868);
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _880 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[116].x, _872);
    float _882 = _880 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _884 = !_850;
    float _902;
    if (!_884)
    {
        float _886 = in.m_53.x;
        float _888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _890 = _886 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _894 = _892 * _888;
        float _896 = floor(_894);
        float _898 = -_896;
        float _900 = _894 + _898;
        _902 = _900;
        _904 = true;
    }
    else
    {
        _902 = _156;
    }
    _904 = false;
    float _906 = _902;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _910 = _906 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _914 = _906 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _918 = _906 + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _936 = 1.0 / _922;
    bool _938 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _940 = isnan(_906);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = 1.0 / _926;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _954 = _906 + _952;
    float _956 = 1.0 / _930;
    float _958 = _910 * _936;
    bool _960 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _962 = isnan(_906);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    bool _972 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _974 = 1.0 / _934;
    float _976 = _914 * _950;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _978;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _982;
    float _986 = fma(_980, _958, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _988 = fma(_984, _958, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _990 = _918 * _956;
    float _992 = -_948;
    float _994 = _992 + 1.0;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _996;
    float _1000 = fma(_998, _958, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1002 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1004 = isnan(_906);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = _954 * _974;
    bool _1016 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1018 = isnan(_906);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = _970 * _994;
    float _1030 = -_970;
    float _1032 = _1030 + 1.0;
    bool _1034 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1036 = isnan(_906);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = -_1026;
    float _1048 = _1046 + 1.0;
    float _1050 = _1026 * _1032;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1060 = _1012 * _1048;
    float _1062 = -_1012;
    float _1064 = _1062 + 1.0;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1070 = fma(_1054, _976, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1072 = fma(_1058, _976, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1074 = _1044 * _1064;
    float _1076 = fma(_1068, _976, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1078 = _988 * _1074;
    float _1080 = _986 * _1074;
    float _1082 = -_1044;
    float _1084 = _1082 + 1.0;
    float _1086 = _1000 * _1074;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1096;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1080);
    float _1102 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1078);
    float _1104 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1086);
    float _1106 = fma(_1090, _990, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1108 = fma(_1094, _990, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1110 = fma(_1098, _990, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1112 = fma(_1070, _1060, _1100);
    float _1114 = fma(_1076, _1060, _1102);
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1124 = fma(_1072, _1060, _1104);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1130 = fma(_1106, _1050, _1112);
    float _1132 = fma(_1118, _1014, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1134 = fma(_1122, _1014, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1136 = fma(_1108, _1050, _1114);
    float _1138 = fma(_1128, _1014, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1140 = fma(_1110, _1050, _1124);
    float _1142 = fma(_1132, _1028, _1130);
    float _1144 = fma(_1134, _1028, _1136);
    float _1146 = fma(_1138, _1028, _1140);
    float _1148 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1142);
    float _1150 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1144);
    float _1152 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1146);
    bool _1154 = !_972;
    float _1172;
    if (!_1154)
    {
        float _1156 = in.m_53.x;
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1160 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1164 = _1162 * _1158;
        float _1166 = floor(_1164);
        float _1168 = -_1166;
        float _1170 = _1164 + _1168;
        _1172 = _1170;
        _1174 = true;
    }
    else
    {
        _1172 = _156;
    }
    _1174 = false;
    float _1176 = _1172;
    float _1178 = in.m_53.x;
    float _1180 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1182 = int(_1180);
    float _1184 = in.m_53.y;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1188 = in.m_42.x;
    float _1190 = in.m_42.y;
    float _1192 = in.m_42.z;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1198 = _1196 != 0;
    float _1200 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1202 = in.m_53.z;
    float _1204 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1206 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1204);
    float _1208 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1214 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1216 = -_1186;
    float _1218 = fma(_1208, 2.0, _1216);
    float _1220 = _1178 * 2.0;
    float _1222 = _1184 * 2.0;
    float _1224 = fma(_1214, -2.0, _1194);
    float _1226 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1228 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1230 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1232 = floor(_1220);
    float _1234 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1236 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1226);
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1228);
    float _1240 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1230);
    float _1242 = _1178 + _1184;
    float _1244 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1234);
    float _1246 = _1202 * 2.0;
    float _1248 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1236);
    float _1250 = _1242 + (-1.0);
    float _1252 = _1184 + _1202;
    float _1254 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1256 = log2(_1254);
    float _1258 = _1178 + _1202;
    float _1260 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1238);
    float _1262 = _1252 + (-1.0);
    float _1264 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1240);
    bool _1266 = _1232 > 0.0;
    float _1268 = _1258 + (-1.0);
    bool _1270 = _1232 >= 0.0;
    bool _1272 = isnan(_1232);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan(0.0);
    bool _1278 = _1274 || _1276;
    float _1280 = floor(_1246);
    float _1282 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1284 = _1262;
    float _1286 = _1238;
    if (!_1198)
    {
        _1284 = _1202;
    }
    float _1288 = _1284;
    float _1290 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1292 = _1288;
    if (_1198)
    {
        _1292 = _1184;
    }
    float _1294 = _1292;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1298 = -_100;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1218);
    float _1302 = floor(_1222);
    float _1304 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1210);
    float _1306 = _1294;
    if (!_1198)
    {
        _1306 = _1202;
    }
    float _1308 = _1306;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1312 = _1308;
    if (_1198)
    {
        _1312 = _1184;
    }
    float _1314 = _1312;
    float _1316 = _1256 * _100;
    if (!_1198)
    {
        _1286 = _1184;
    }
    float _1318 = _1286;
    float _1320 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1322 = _1280 > 0.0;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1326 = _1318;
    if (_1198)
    {
        _1326 = _1178;
    }
    float _1328 = _1326;
    float _1330 = exp2(_1316);
    bool _1332 = _1280 >= 0.0;
    bool _1334 = isnan(_1280);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = fma(_1324, -2.0, _1212);
    float _1344 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1310);
    float _1346 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1348 = _1340 ? 0 : 1;
    float _1350 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1244);
    float _1352 = -_1296;
    float _1354 = fma(_1346, 2.0, _1352);
    float _1356 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1358 = int(_1356);
    int _1360 = ~_1348;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    float _1366 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1206);
    bool _1368 = _1302 >= 0.0;
    bool _1370 = isnan(_1302);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    int _1378 = _1364;
    if (!_1322)
    {
        int _1380 = ~_1348;
        int _1382 = _1380 + 1;
        _1378 = _1382;
    }
    int _1384 = _1378;
    float _1386 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1388 = _1302 > 0.0;
    float _1390 = rsqrt(_1366);
    int _1392 = _1278 ? 0 : 1;
    bool _1394 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1396 = isnan(0.0);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1402 = _1398 || _1400;
    int _1404 = _1376 ? 0 : 1;
    int _1406 = ~_1392;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1414 = 1.0 + _1412;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1418 = _1416 != 0;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1422 = _1420 != 0;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1426 = _1424 != 0;
    int _1428 = _1410;
    if (!_1266)
    {
        int _1430 = ~_1392;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = 1.0 / _1414;
    bool _1438 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1440 = isnan(1.0);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1446 = _1442 || _1444;
    bool _1448 = !_1422;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1454 = !_1418;
    int _1456 = _1454 ? 0 : 1;
    bool _1458 = !_1426;
    int _1460 = _1458 ? 0 : 1;
    float _1462 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1452);
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1470 = _1468 != 0;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1474 = _1472 != 0;
    float _1476 = -_1330;
    float _1478 = _1476 + 1.0;
    float _1480 = float(_1358);
    float _1482 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1224);
    int _1484 = ~_1404;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    int _1490 = _1488;
    if (!_1388)
    {
        int _1492 = ~_1404;
        int _1494 = _1492 + 1;
        _1490 = _1494;
    }
    int _1496 = _1490;
    float _1498 = in.m_57.x;
    float _1500 = in.m_57.y;
    float _1502 = in.m_57.z;
    bool _1504 = !_1466;
    int _1506 = _1504 ? 0 : 1;
    float _1508 = 1.0 / _1480;
    bool _1510 = !_1470;
    int _1512 = _1510 ? 0 : 1;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1516 = abs(_1506);
    float _1518 = -_100;
    float _1520 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1354);
    int _1522 = abs(_1512);
    float _1524 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1304);
    float _1526 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1514);
    float _1528 = float(_1434);
    float _1530 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1342);
    float _1532 = float(_1522);
    float _1534 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1526);
    float _1536 = float(_1516);
    float _1538 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1462);
    float _1540 = float(_1384);
    float _1542 = _1532 * _1528;
    bool _1544 = !_1474;
    int _1546 = _1544 ? 0 : 1;
    float _1548 = _1508 * _100;
    float _1550 = float(_1182);
    float _1552 = _1536 * _1540;
    float _1554 = _1402 ? _1478 : 0.0;
    float _1556 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1344);
    float _1558 = _1550 * _100;
    int _1560 = abs(_1546);
    float _1562 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1446)
    {
        float _1564 = _1554 * _1436;
        _110 = _1564;
    }
    float _1566 = _110;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1568;
    float _1572 = _1552 * (-2.0);
    float _1574 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1576 = _1562 * _1562;
    float _1578 = _1178 + (-0.5);
    float _1580 = fma(_1572, _1498, _1498);
    float _1582 = fma(_1574, _1574, _1576);
    float _1584 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1586 = float(_1496);
    float _1588 = fma(_1386, _1572, _1386);
    float _1590 = float(_1560);
    float _1592 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1580);
    float _1594 = _1542 * (-2.0);
    float _1596 = fma(_1584, _1584, _1582);
    float _1598 = 1.0 / _1570;
    float _1600 = _1590 * _1586;
    float _1602 = fma(_1588, _1566, _1592);
    float _1604 = fma(_1282, _1594, _1282);
    float _1606 = fma(_1594, _1500, _1500);
    float _1608 = _1260 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1610 = in.m_59.x;
    float _1612 = in.m_59.y;
    float _1614 = in.m_59.z;
    float _1616 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1618 = _1602 * 0.15915493667125701904296875;
    float _1620 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1622 = _1184 + (-0.5);
    float _1624 = _1600 * (-2.0);
    float _1626 = rsqrt(_1596);
    float _1628 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1620);
    float _1630 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1606);
    float _1632 = fma(_1290, _1624, _1290);
    float _1634 = fma(_1624, _1502, _1502);
    float _1636 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1638 = fma(_1604, _1566, _1630);
    float _1640 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1642 = _1202 + (-0.5);
    float _1644 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1646 = _1638 * 0.15915493667125701904296875;
    float _1648 = _1618 * 6.283185482025146484375;
    float _1650 = sin(_1648);
    float _1652 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1634);
    float _1654 = -_1644;
    float _1656 = _1640 + _1654;
    float _1658 = fma(_1632, _1566, _1652);
    bool _1660 = _1644 >= _1640;
    bool _1662 = isnan(_1644);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(_1640);
    bool _1668 = _1664 || _1666;
    float _1670 = _1574 * _1626;
    float _1672 = abs(_1656);
    float _1674 = precise::max(_1672, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1610);
    float _1678 = _1658 * 0.15915493667125701904296875;
    float _1680 = _1618 * 6.283185482025146484375;
    float _1682 = cos(_1680);
    float _1684 = precise::min(_1674, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1686 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1688 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1614);
    bool _1692 = !_1668;
    float _1694 = _1692 ? 1.0 : (-1.0);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1698 = _1684 + _1696;
    float _1700 = _1686 * _1676;
    float _1702 = _1646 * 6.283185482025146484375;
    float _1704 = sin(_1702);
    float _1706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1612);
    float _1708 = _1698 * _1598;
    float _1710 = _1688 * _1690;
    float _1712 = _1562 * _1626;
    float _1714 = _1200 * _1706;
    float _1716 = _1694 * _1708;
    float _1718 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1720 = _1646 * 6.283185482025146484375;
    float _1722 = cos(_1720);
    float _1724 = _1584 * _1626;
    float _1726 = _1718 * _1716;
    float _1728 = _1726 * 0.15915493667125701904296875;
    float _1730 = _1678 * 6.283185482025146484375;
    float _1732 = cos(_1730);
    float _1734 = _1650 * _1704;
    float _1736 = _1682 * _1704;
    float _1738 = _1678 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    float _1742 = _1650 * _1722;
    float _1744 = _1732 * _1714;
    float _1746 = _1682 * _1722;
    float _1748 = _1704 * _1732;
    float _1750 = _1722 * _1732;
    float _1752 = _1728 * 6.283185482025146484375;
    float _1754 = cos(_1752);
    float _1756 = _1682 * _1744;
    float _1758 = _1650 * _1744;
    float _1760 = fma(_1740, _1746, _1734);
    float _1762 = -_1736;
    float _1764 = fma(_1740, _1742, _1762);
    float _1766 = -_1714;
    float _1768 = _1740 * _1766;
    float _1770 = -_1742;
    float _1772 = fma(_1740, _1736, _1770);
    float _1774 = fma(_1760, _1700, _1756);
    float _1776 = _1728 * 6.283185482025146484375;
    float _1778 = sin(_1776);
    float _1780 = fma(_1750, _1700, _1768);
    float _1782 = fma(_1740, _1734, _1746);
    float _1784 = fma(_1772, _1710, _1774);
    float _1786 = fma(_1764, _1700, _1758);
    float _1788 = fma(_1748, _1710, _1780);
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1792 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1794 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1796 = fma(_1782, _1710, _1786);
    float _1798 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1790);
    float _1800 = -_1754;
    float _1802 = _1800 + 1.0;
    float _1804 = _1724 * _1724;
    float _1806 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1792);
    float _1808 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1794);
    float _1810 = _1670 * _1778;
    float _1812 = _1712 * _1802;
    float _1814 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1798);
    float _1816 = _1712 * _1778;
    float _1818 = fma(_1802, _1804, _1754);
    float _1820 = _1724 * _1778;
    float _1822 = _1670 * _1802;
    float _1824 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1806);
    float _1826 = fma(_1724, _1812, _1810);
    float _1828 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1830 = -_1820;
    float _1832 = fma(_1712, _1822, _1830);
    float _1834 = -_1816;
    float _1836 = fma(_1724, _1822, _1834);
    float _1838 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1840 = _1828 * _1826;
    float _1842 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1808);
    float _1844 = fma(_1670, _1822, _1754);
    float _1846 = _1828 * _1832;
    float _1848 = fma(_1838, _1836, _1840);
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1852 = fma(_1724, _1822, _1816);
    float _1854 = fma(_1838, _1844, _1846);
    float _1856 = fma(_1712, _1812, _1754);
    float _1858 = fma(_1850, _1818, _1848);
    float _1860 = fma(_1712, _1822, _1820);
    float _1862 = fma(_1850, _1852, _1854);
    float _1864 = _1828 * _1856;
    float _1866 = _1320 + _1858;
    float _1868 = -_1810;
    float _1870 = fma(_1724, _1812, _1868);
    float _1872 = _1616 + _1862;
    float _1874 = fma(_1838, _1860, _1864);
    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1878 = _1866 + _1876;
    float _1880 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1884 = _1872 + _1882;
    float _1886 = fma(_1850, _1870, _1874);
    float _1888 = _1878 * _1878;
    float _1890 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1880);
    float _1892 = _1608 + _1886;
    float _1894 = fma(_1884, _1884, _1888);
    float _1896 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1890);
    float _1898 = sqrt(_1894);
    bool _1900 = _1898 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1890;
    float _1904 = _1812;
    float _1906 = _1870;
    float _1908 = _1898;
    if (!_1900)
    {
        _1902 = _1872;
    }
    float _1910 = _1902;
    float _1912 = _1910;
    if (!_1900)
    {
        _1904 = _1866;
    }
    float _1914 = _1904;
    float _1916 = _1914;
    if (!_1900)
    {
        _1906 = _1892;
    }
    float _1918 = _1906;
    bool _1920 = !_1900;
    float _1922 = _1918;
    if (!_1920)
    {
        float _1924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1926 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1928 = _1898 + _1926;
        float _1930 = rsqrt(_1894);
        float _1932 = _1928 * _1924;
        float _1934 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1936 = _1932 * 0.15915493667125701904296875;
        float _1938 = _1936 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1936 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        float _1946 = _1940 + (-1.0);
        float _1948 = fma(_1944, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1950 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1952 = _1930 * _1948;
        float _1954 = fma(_1892, _1940, _1950);
        float _1956 = fma(_1884, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1958 = fma(_1878, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1922 = _1954;
        _1912 = _1956;
        _1916 = _1958;
    }
    float _1960 = _1922;
    float _1962 = _1912;
    float _1964 = _1916;
    float _1966 = -_1608;
    float _1968 = _1966 + _1960;
    float _1970 = -_1616;
    float _1972 = _1970 + _1962;
    float _1974 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1976 = -_1320;
    float _1978 = _1976 + _1964;
    float _1980 = _1968 * _1968;
    float _1982 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1984 = 1.0 / _1974;
    float _1986 = fma(_1972, _1972, _1980);
    float _1988 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1982);
    float _1990 = fma(_1978, _1978, _1986);
    float _1992 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1988);
    float _1994 = sqrt(_1990);
    float _1996 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1998 = _1996 + _1974;
    float _2000 = _1998 * _1984;
    float _2002 = _2000 * 0.5;
    bool _2004 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    bool _2014 = _1994 > 0.0;
    float _2016 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2018 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2016);
    bool _2020 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2022 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan(0.5);
    bool _2028 = _2024 || _2026;
    float _2030 = 1.0 / _2018;
    bool _2032 = !_2014;
    float _2034 = _1964;
    float _2036 = _1962;
    float _2038 = _1960;
    float _2040 = _1978;
    float _2042 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2044 = _1990;
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_2032)
    {
        float _2048 = _172 * _172;
        float _2050 = rsqrt(_1990);
        float _2052 = fma(_170, _170, _2048);
        float _2054 = fma(_174, _174, _2052);
        float _2056 = sqrt(_2054);
        float _2058 = _1978 * _2050;
        bool _2060 = _2056 > 0.0;
        float _2062 = _1972 * _2050;
        float _2064 = _1968 * _2050;
        bool _2066 = !_2060;
        _2042 = _2054;
        _1908 = _2058;
        _2046 = _2050;
        if (!_2066)
        {
            float _2068 = rsqrt(_2054);
            float _2070 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2072 = _172 * _2068;
            float _2074 = _170 * _2068;
            float _2076 = _2064 * _2072;
            float _2078 = _174 * _2068;
            float _2080 = fma(_2062, _2074, _2076);
            float _2082 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2084 = fma(_2058, _2078, _2080);
            float _2086 = _2084 * _2082;
            float _2088 = fma(_170, _2086, _1962);
            float _2090 = fma(_172, _2086, _1960);
            float _2092 = fma(_174, _2086, _1964);
            _2034 = _2092;
            _2036 = _2088;
            _2038 = _2090;
            _2040 = _2086;
            _2042 = _2068;
            _2044 = _2070;
            _2046 = _2082;
        }
    }
    float _2094 = _2034;
    float _2096 = _2036;
    float _2098 = _2038;
    float _2100 = _2040;
    float _2102 = _2042;
    float _2104 = _1908;
    float _2106 = _2044;
    float _2108 = _2046;
    float _2110 = _2106;
    float _2112 = _2098;
    float _2114 = _2096;
    float _2116 = _2100;
    float _2118 = _2108;
    float _2120 = _2102;
    float _2122 = _2104;
    if (_2028)
    {
        _2110 = 1.0;
    }
    float _2124 = _2110;
    float _2126 = _2124;
    if (_2012)
    {
        _178 = _2094;
    }
    float _2128 = _178;
    float _2130 = _2128;
    if (!_2012)
    {
        float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2134 = _1608 + _2132;
        float _2136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2138 = _1616 + _2136;
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2142 = -_1616;
        float _2144 = _2142 + _2096;
        float _2146 = _2134 * _2134;
        float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2150 = _1320 + _2148;
        float _2152 = -_1320;
        float _2154 = _2152 + _2094;
        float _2156 = fma(_2138, _2138, _2146);
        float _2158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2160 = fma(_2150, _2150, _2156);
        float _2162 = sqrt(_2160);
        float _2164 = _2140 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2166 = precise::min(_2162, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2168 = _2166 * _2158;
        float _2170 = _2164 * _2168;
        float _2172 = -_1608;
        float _2174 = _2172 + _2098;
        float _2176 = fma(_2144, _2170, _1616);
        float _2178 = fma(_2174, _2170, _1608);
        float _2180 = fma(_2154, _2170, _1320);
        _180 = _2140;
        _2112 = _2178;
        _2114 = _2176;
        _2130 = _2180;
        _2116 = _2170;
    }
    float _2182 = _180;
    float _2184 = _2112;
    float _2186 = _2114;
    float _2188 = _2130;
    float _2190 = _2116;
    float _2192 = _2182;
    float _2194 = _2190;
    if (_2028)
    {
        _2118 = 1.0;
    }
    float _2196 = _2118;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2200 = _2030 * _2198;
    float _2202 = _2196;
    if (!_2028)
    {
        float _2204 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2206 = _2204 * 0.15915493667125701904296875;
        float _2208 = _2206 * 6.283185482025146484375;
        float _2210 = cos(_2208);
        float _2212 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2214 = _2212 * 0.15915493667125701904296875;
        float _2216 = _2206 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        float _2220 = 1.0 / _2210;
        float _2222 = _2214 * 6.283185482025146484375;
        float _2224 = cos(_2222);
        float _2226 = _2218 * _2220;
        float _2228 = _2214 * 6.283185482025146484375;
        float _2230 = sin(_2228);
        float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2234 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2232;
        float _2236 = _2224 * _2226;
        float _2238 = 1.0 / _2234;
        float _2240 = 1.0 / _2236;
        float _2242 = _2230 * _2240;
        float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2246 = fma(_2200, _2242, _2244);
        float _2248 = _2246 * _2238;
        float _2250 = precise::clamp(_2248, 0.0, 1.0);
        _2192 = _2214;
        _2194 = _2206;
        _2126 = _2250;
    }
    float _2252 = _2192;
    float _2254 = _2194;
    float _2256 = _2126;
    float _2258 = _2252;
    if (!_2028)
    {
        float _2260 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2262 = _2260 * 0.15915493667125701904296875;
        float _2264 = _2262 * 6.283185482025146484375;
        float _2266 = cos(_2264);
        float _2268 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2270 = _2268 * 0.15915493667125701904296875;
        float _2272 = _2262 * 6.283185482025146484375;
        float _2274 = sin(_2272);
        float _2276 = 1.0 / _2266;
        float _2278 = _2270 * 6.283185482025146484375;
        float _2280 = cos(_2278);
        float _2282 = _2274 * _2276;
        float _2284 = _2270 * 6.283185482025146484375;
        float _2286 = sin(_2284);
        float _2288 = _2280 * _2282;
        float _2290 = 1.0 / _2288;
        float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2294 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2292;
        float _2296 = 1.0 / _2294;
        float _2298 = _2286 * _2290;
        float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2302 = fma(_2200, _2298, _2300);
        float _2304 = _2302 * _2296;
        float _2306 = precise::clamp(_2304, 0.0, 1.0);
        float _2308 = -_2306;
        float _2310 = _2308 + 1.0;
        _2258 = _2276;
        _2202 = _2310;
    }
    float _2312 = _2258;
    float _2314 = _2202;
    float _2316 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2318 = _2184 + _2316;
    float _2320 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2322 = _2186 + _2320;
    float _2324 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2326 = _2188 + _2324;
    float _2328 = _2318 * _2318;
    float _2330 = fma(_2322, _2322, _2328);
    float _2332 = fma(_2326, _2326, _2330);
    float _2334 = rsqrt(_2332);
    float _2336 = sqrt(_2332);
    float _2338 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2340 = _2322 * _2338;
    float _2342 = _2326 * _2338;
    float _2344 = _2340 * _2340;
    float _2346 = _2342 * _2342;
    float _2348 = _2344 + _2346;
    float _2350 = sqrt(_2348);
    bool _2352 = _2350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2356 = _2350 + _2354;
    float _2358 = _2312;
    float _2360 = _2348;
    float _2362 = _2356;
    float _2364 = _2318;
    float _2366 = _2342;
    float _2368 = _2344;
    float _2370 = _2346;
    if (_2352)
    {
        float _2372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2358 = _2372;
    }
    float _2374 = _2358;
    if (_2352)
    {
        float _2376 = rsqrt(_2348);
        _2360 = _2376;
    }
    float _2378 = _2360;
    if (_2352)
    {
        float _2380 = _2356 * _2374;
        _2362 = _2380;
    }
    float _2382 = _2362;
    if (_2352)
    {
        float _2384 = _2382 * 0.15915493667125701904296875;
        _2120 = _2384;
    }
    float _2386 = _2120;
    float _2388 = _2254;
    if (_2352)
    {
        float _2390 = _2386 * 6.283185482025146484375;
        float _2392 = sin(_2390);
        _2388 = _2392;
    }
    float _2394 = _2388;
    float _2396 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2398 = precise::max(0.0, _2396);
    float _2400 = _2374;
    float _2402 = _2398;
    if (_2352)
    {
        float _2404 = _2386 * 6.283185482025146484375;
        float _2406 = cos(_2404);
        _2400 = _2406;
    }
    float _2408 = _2400;
    float _2410 = -_2338;
    float _2412 = -_2398;
    float _2414 = fma(_2318, _2410, _2412);
    if (_2352)
    {
        float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2364 = _2416;
    }
    float _2418 = _2364;
    float _2420 = _2418;
    float _2422 = _2394;
    if (_2352)
    {
        float _2424 = fma(_2394, _2418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2402 = _2424;
    }
    float _2426 = _2402;
    float _2428 = _2426;
    if (!_2352)
    {
        _2420 = _2340;
    }
    float _2430 = _2420;
    float _2432 = _2430;
    if (_2352)
    {
        float _2434 = _2408 + (-1.0);
        _2422 = _2434;
    }
    float _2436 = _2422;
    float _2438 = _2436;
    if (_2352)
    {
        float _2440 = _2378 * _2426;
        _2122 = _2440;
    }
    float _2442 = _2122;
    if (!_2352)
    {
        _2428 = _2414;
    }
    float _2444 = _2428;
    float _2446 = _2444;
    if (_2352)
    {
        float _2448 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2438 = _2448;
    }
    float _2450 = _2438;
    if (_2352)
    {
        float _2452 = _2340 * _2442;
        _2432 = _2452;
    }
    float _2454 = _2432;
    if (_2352)
    {
        float _2456 = _2342 * _2442;
        _2366 = _2456;
    }
    float _2458 = _2366;
    if (_2352)
    {
        float _2460 = fma(_2414, _2408, _2450);
        _2446 = _2460;
    }
    float _2462 = _2446;
    if (_2352)
    {
        float _2464 = _2454 * _2454;
        _2368 = _2464;
    }
    float _2466 = _2368;
    if (_2352)
    {
        float _2468 = _2458 * _2458;
        _2370 = _2468;
    }
    float _2470 = _2370;
    float _2472 = fma(_2462, _2462, _2466);
    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2476 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2474);
    float _2478 = precise::clamp(_2476, 0.0, 1.0);
    float _2480 = _2472 + _2470;
    float _2482 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2484 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2486 = -_2478;
    float _2488 = _2486 + 1.0;
    float _2490 = rsqrt(_2480);
    float _2492 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2482);
    float _2494 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2496 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2498 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2492);
    float _2500 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2484);
    float _2502 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2504 = abs(_2488);
    float _2506 = log2(_2504);
    float _2508 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2494);
    float _2510 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2500);
    float _2512 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2502);
    float _2514 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2516 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2508);
    float _2518 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2520 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2512);
    float _2522 = _2490 * _2454;
    float _2524 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2526 = _2490 * _2462;
    float _2528 = _2520 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2530 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2532 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2534 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2536 = _2490 * _2458;
    float _2538 = -_2530;
    float _2540 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2538);
    float _2542 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2532);
    float _2544 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2546 = -_2534;
    float _2548 = fma(_2546, _2496, 1.0);
    float _2550 = -_2536;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2540);
    float _2554 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2542);
    float _2556 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2558 = log2(_2548);
    float _2560 = fma(_2552, -0.5, 0.5);
    float _2562 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2554);
    float _2564 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2566 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2556);
    float _2568 = fma(_2552, 0.5, 0.5);
    float _2570 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2564);
    float _2572 = exp2(_2544);
    float _2574 = _2526 + 1.0;
    float _2576 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2566);
    float _2578 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2570);
    float _2580 = fma(_2568, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2582 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2578);
    float _2584 = 1.0 / _2562;
    float _2586 = fma(_2568, _2580, -0.212114393711090087890625);
    float _2588 = fma(_2568, _2586, 1.570728778839111328125);
    float _2590 = sqrt(_2560);
    float _2592 = -_2526;
    float _2594 = fma(_2572, _2574, _2592);
    float _2596 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2576);
    float _2598 = _2558 * 0.693147182464599609375;
    float _2600 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2602 = _2596 * _2584;
    float _2604 = _2582 * _2584;
    float _2606 = fma(_2602, 0.5, 0.5);
    float _2608 = fma(_2604, -0.5, 0.5);
    float _2610 = fma(_2594, 0.5, 0.5);
    float _2612 = _2590 * 0.636619746685028076171875;
    float _2614 = -_2588;
    float _2616 = fma(_2612, _2614, 1.0);
    float3 _7514 = float3(_2606, _2608, _2600);
    float _2618 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7514, float3(0.0), isnan(_7514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7514, float3(0.0), isnan(_7514)), level(0.0)).x;
    float3 _7525 = float3(_2606, _2608, _2600);
    float4 _2621 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7525, float3(0.0), isnan(_7525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7525, float3(0.0), isnan(_7525)), level(0.0)).xyzw;
    float _2623 = _2621.x;
    float _2625 = _2621.y;
    float _2627 = _2621.z;
    float _2629 = _2621.w;
    float2 _7542 = float2(_2616, _2610);
    float3 _2633 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7542, float2(0.0), isnan(_7542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7542, float2(0.0), isnan(_7542)), level(0.0)).xyz;
    float _2635 = _2633.x;
    float _2637 = _2633.y;
    float _2639 = _2633.z;
    float _2641 = float(uint(_1182));
    float _2643 = trunc(_1548);
    int _2645 = int(_2643);
    int _2647 = ~_1182;
    int _2649 = _2647 + 1;
    float _2651 = _1558 * _152;
    int _2653 = ~_1182;
    int _2655 = _2653 + 1;
    out.m_61.x = _874;
    out.m_61.y = _876;
    out.m_61.z = _878;
    out.m_61.w = _882;
    int _2657 = _1182 + (-1);
    float _2659 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2661 = abs(_1450);
    float _2663 = 1.0 / _2641;
    float _2665 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2667 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2665);
    bool _2669 = !_1198;
    float _2671 = _2669 ? 7.345489978790283203125 : 1.0;
    float _2673 = float(uint(_2645));
    float _2675 = trunc(_2651);
    int _2677 = int(_2675);
    float _2679 = float(_2645);
    float _2681 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2667);
    float _2683 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2681);
    int _2685 = as_type<int>(_2663) + (-2);
    float _2687 = exp2(_2659);
    float _2689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2689;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2697 = as_type<float>(_2685) * _2673;
    out.gl_Position.x = _2596;
    out.gl_Position.y = _2582;
    out.gl_Position.z = _2683;
    out.gl_Position.w = _2562;
    float _2699 = trunc(_2697);
    float _2701 = precise::max(_2699, 0.0);
    uint _2704 = uint(_2701);
    float _2706 = -_2687;
    float _2708 = _2706 + 1.0;
    int _2710 = _2649 * int(_2704);
    int _2712 = _2710 + _2645;
    float _2714 = float(uint(_2712));
    float _2716 = as_type<float>(_2685) * _2714;
    float _2718 = _2671 * _1178;
    bool _2720 = _2679 >= _1550;
    bool _2722 = isnan(_2679);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan(_1550);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = floor(_2718);
    float _2734 = trunc(_2716);
    float _2736 = precise::max(_2734, 0.0);
    uint _2738 = uint(_2736);
    float _2740 = trunc(_2730);
    int _2742 = int(_2740);
    float _2744 = -_2732;
    float _2746 = _2718 + _2744;
    int _2748 = int(_2704) + int(_2738);
    int _2750 = _2655 * _2748;
    int _2752 = _2750 + _2645;
    int _2754 = ~_2742;
    int _2756 = _2754 + 1;
    int _2758 = _2756 + 1;
    bool _2760 = uint(_2752) >= uint(_1182);
    bool _2762 = !_2760;
    int _2764 = _2762 ? 0 : (-1);
    bool _2766 = _1182 == 0;
    int _2768 = ~_2748;
    int _2770 = _2768 + _2764;
    int _2772 = _2770 + 1;
    float _2774 = _2746 * _1550;
    int _2776 = _1182 * _2772;
    int _2778 = _2776 + _2645;
    int _2780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2782 = _2780 != 0;
    float _2784 = trunc(_2774);
    int _2786 = int(_2784);
    int _2788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2790 = _2788 != 0;
    bool _2792 = !_2766;
    int _2794 = _2792 ? _2778 : (-1);
    bool _2796 = !_2782;
    int _2798 = _2796 ? 0 : 1;
    int _2800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2802 = _2800 != 0;
    int _2804 = _2794 * _2758;
    int _2806 = abs(_2798);
    int _2808 = abs(_1456);
    int _2810 = _2742 * _2657;
    int _2812 = _2810 + _2804;
    int _2814 = abs(_1460);
    int _2816 = _2812 * _2661;
    bool _2818 = !_2802;
    int _2820 = _2818 ? 0 : 1;
    int _2822 = _2786 * _2806;
    int _2824 = _2822 + _2645;
    int _2826 = abs(_2820);
    int _2828 = _2677 * _2808;
    int _2830 = _2828 + _2816;
    int _2832 = _2824 * _2814;
    int _2834 = _2832 + _2830;
    float _2836 = in.m_53.w;
    int _2838 = _2786 * _2826;
    int _2840 = _2838 + _2834;
    float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2846 = in.m_63.y;
    int _2848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2850 = _2848 != 0;
    float _2852 = float(uint(_2840));
    float _2854 = 1.0 / _2844;
    int _2856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2858 = _2856 != 0;
    float _2860 = as_type<float>(_2685) * _2852;
    int _2862 = ~_1182;
    int _2864 = _2862 + 1;
    int _2866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2868 = _2866 != 0;
    int _2870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2872 = _2870 != 0;
    float _2874 = trunc(_2860);
    float _2876 = precise::max(_2874, 0.0);
    uint _2878 = uint(_2876);
    bool _2880 = _2836 > 0.5;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2884 = _2882 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2888 = _2864 * int(_2878);
    int _2890 = _2888 + _2840;
    float _2892 = 1.0 / _2884;
    float _2894 = float(uint(_2890));
    float _2896 = _2886 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2898 = as_type<float>(_2685) * _2894;
    float _2900 = -_2846;
    float _2902 = _2900 + 1.0;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2904 = trunc(_2898);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    int _2910 = _2880 ? as_type<int>(_2902) : as_type<int>(_2846);
    float _2912 = _2695 * _2892;
    bool _2914 = _1184 > 0.5;
    int _2916 = ~_1182;
    int _2918 = _2916 + 1;
    float _2920 = _2858 ? as_type<float>(_2910) : _2846;
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2924 = _2922 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2926 = _2691 * _2854;
    float _2928 = _2846;
    bool _2930 = _2858;
    bool _2932 = _2790;
    int _2934 = as_type<int>(_2774);
    if (_2790)
    {
        float _2936 = _2914 ? _2902 : _2846;
        _2928 = _2936;
    }
    float _2938 = _2928;
    float _2940 = 1.0 / _2924;
    if (_2850)
    {
        bool _2942 = _1178 > 0.5;
        _2930 = _2942;
    }
    bool _2944 = _2930;
    float _2946 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2948 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2946;
    int _2950 = int(_2878) + int(_2908);
    float _2952 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2954 = _1176 + _2952;
    float _2956 = float(uint(_2824));
    float _2958 = fma(_2920, _2896, -0.5);
    if (_2868)
    {
        bool _2960 = _1202 > 0.5;
        _2932 = _2960;
    }
    bool _2962 = _2932;
    int _2964 = _2918 * _2950;
    int _2966 = _2964 + _2840;
    float _2968 = fma(_2926, _2954, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2970 = as_type<float>(_2685) * _2956;
    float _2972 = in.m_63.x;
    float _2974 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2938, -0.5);
    bool _2976 = uint(_2966) >= uint(_1182);
    float _2978 = trunc(_2970);
    float _2980 = precise::max(_2978, 0.0);
    uint _2982 = uint(_2980);
    int _2984 = ~_1182;
    int _2986 = _2984 + 1;
    float _2988 = _2948 * _2940;
    bool _2990 = !_2976;
    int _2992 = _2990 ? 0 : (-1);
    float _2994 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2996 = _1176 + _2994;
    float _2998 = -_1530;
    float _3000 = fma(_1524, _2958, _2998);
    int _3002 = ~_1182;
    int _3004 = _3002 + 1;
    float _3006 = -_1482;
    float _3008 = fma(_1538, _2974, _3006);
    int _3010 = ~_2950;
    int _3012 = _3010 + _2992;
    int _3014 = _3012 + 1;
    float _3016 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3018 = _1176 + _3016;
    bool _3020 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3022 = isnan(_1176);
    bool _3024 = _3020 || _3022;
    bool _3026 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3028 = _3024 || _3026;
    float _3030 = float(_3028);
    float _3032 = fma(_2912, _2996, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3034 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3036 = isnan(_1176);
    bool _3038 = _3034 || _3036;
    bool _3040 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3042 = _3038 || _3040;
    float _3044 = float(_3042);
    int _3046 = _1182 * _3014;
    int _3048 = _3046 + _2840;
    float _3050 = fma(_2988, _3018, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _3052 = -_3030;
    float _3054 = _3052 + 1.0;
    bool _3056 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3058 = isnan(_1176);
    bool _3060 = _3056 || _3058;
    bool _3062 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3064 = _3060 || _3062;
    float _3066 = float(_3064);
    int _3068 = _2986 * int(_2982);
    int _3070 = _3068 + _2824;
    bool _3072 = !_2766;
    int _3074 = _3072 ? _3048 : (-1);
    float _3076 = _3044 * _3054;
    float _3078 = -_3044;
    float _3080 = _3078 + 1.0;
    bool _3082 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3084 = isnan(_1176);
    bool _3086 = _3082 || _3084;
    bool _3088 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3090 = _3086 || _3088;
    float _3092 = float(_3090);
    if (_2868)
    {
        float _3094 = -_2972;
        float _3096 = _3094 + 1.0;
        _2934 = as_type<int>(_3096);
    }
    int _3098 = _2934;
    int _3100 = _3074 >> 31;
    float _3102 = float(uint(_3070));
    float _3104 = _3066 * _3080;
    int _3106 = _3100 & 3;
    float _3108 = -_3066;
    float _3110 = _3108 + 1.0;
    float _3112 = as_type<float>(_2685) * _3102;
    int _3114 = _3074 + _3106;
    float _3116 = _3092 * _3110;
    float _3118 = -_3092;
    float _3120 = _3118 + 1.0;
    float _3122 = trunc(_3112);
    float _3124 = precise::max(_3122, 0.0);
    uint _3126 = uint(_3124);
    int _3128 = _3114 >> 2;
    float _3130 = _2968 * _3116;
    float _3132 = as_type<float>(_3106);
    float _3134 = as_type<float>(_3128);
    int _3136 = as_type<int>(_3112);
    if (!_2850)
    {
        _3132 = _2972;
    }
    float _3138 = _3132;
    int _3140 = _3128 << 4;
    int _3142 = _3140 + 368;
    float _3144 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3130);
    float _3146 = _3138;
    if (!_2868)
    {
        _3134 = _2972;
    }
    float _3148 = _3134;
    float _3150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3152 = uint(int(uint(_3142) >> uint(2)));
    uint _3154 = uint(int(uint(int(_3152)) >> uint(2)));
    int _3156 = int(_3152) & 3;
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[int(_3154)][_3156];
    int _3160 = int(_3152) + 1;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    int _3164 = _3160 & 3;
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[int(_3162)][_3164];
    float _3168 = _3148;
    if (_2850)
    {
        float _3170 = -_2972;
        float _3172 = _3170 + 1.0;
        _3136 = as_type<int>(_3172);
    }
    int _3174 = _3136;
    if (_2868)
    {
        float _3176 = _2962 ? as_type<float>(_3098) : _2972;
        _3168 = _3176;
    }
    float _3178 = _3168;
    float _3180 = fma(_3032, _3104, _3144);
    int _3182 = _3074 & 3;
    bool _3184 = _3182 != 0;
    if (_2850)
    {
        float _3186 = _2944 ? as_type<float>(_3174) : _2972;
        _3146 = _3186;
    }
    float _3188 = _3146;
    float _3190 = fma(_3050, _3076, _3180);
    int _3192 = _3142 + 8;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c9)._m0[int(_3204)][_3206];
    int _3210 = _3074 & 3;
    bool _3212 = _3210 != 0;
    bool _3214 = uint(_3182) > 1u;
    float _3216 = fma(_3188, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3218 = _3150 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3220 = _3212 ? 0 : 1;
    bool _3222 = _3182 != 3;
    float _3224 = fma(_3218, _3178, -0.5);
    int _3226 = int(_2982) + int(_3126);
    float _3228 = fma(_1534, _3216, _1300);
    bool _3230 = uint(_3182) >= 2u;
    float _3232 = fma(_1556, _3224, _1520);
    int _3234 = _3004 * _3226;
    int _3236 = _3234 + _2824;
    int _3238 = ~_3220;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    float _3244 = _3232 + 0.5;
    int _3246 = _3230 ? 0 : 1;
    int _3248 = _3242;
    if (!_3214)
    {
        int _3250 = ~_3220;
        int _3252 = _3250 + 1;
        _3248 = _3252;
    }
    int _3254 = _3248;
    bool _3256 = uint(_3236) >= uint(_1182);
    bool _3258 = !_3184;
    int _3260 = _3258 ? 0 : 1;
    int _3262 = ~_3246;
    int _3264 = _3262 + 1;
    int _3266 = _3264 + 1;
    int _3268 = abs(_3254);
    bool _3270 = _3182 != 3;
    int _3272 = _3266;
    if (_3222)
    {
        int _3274 = ~_3246;
        int _3276 = _3274 + 1;
        _3272 = _3276;
    }
    int _3278 = _3272;
    int _3280 = abs(_3260);
    bool _3282 = !_3270;
    int _3284 = _3282 ? 0 : (-1);
    int _3286 = ~_3268;
    int _3288 = _3286 + 1;
    int _3290 = _3288 + 1;
    int _3292 = abs(_3278);
    int _3294 = abs(_3284);
    int _3296 = _3290 * as_type<int>(_3166);
    int _3298 = ~_3280;
    int _3300 = _3298 + 1;
    int _3302 = _3300 + 1;
    bool _3304 = !_2872;
    int _3306 = _3304 ? 0 : 1;
    int _3308 = _3302 * as_type<int>(_3158);
    int _3310 = _3308 + _3296;
    int _3312 = ~_3292;
    int _3314 = _3312 + 1;
    int _3316 = _3314 + 1;
    bool _3318 = !_3256;
    int _3320 = _3318 ? 0 : (-1);
    int _3322 = abs(_3306);
    int _3324 = _3316 * as_type<int>(_3200);
    int _3326 = _3324 + _3310;
    int _3328 = ~_3294;
    int _3330 = _3328 + 1;
    int _3332 = _3330 + 1;
    float _3334 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3336 = ~_3226;
    int _3338 = _3336 + _3320;
    int _3340 = _3338 + 1;
    int _3342 = ~_3322;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    int _3348 = _3332 * as_type<int>(_3208);
    int _3350 = _3348 + _3326;
    float _3352 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3190);
    int _3354 = _1182 * _3340;
    int _3356 = _3354 + _2824;
    float _3358 = _3008 + 0.5;
    float _3360 = _3000 + 0.5;
    float _3362 = _3228 + 0.5;
    int _3364 = _3350 * _3346;
    float _3366 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3368 = !_2766;
    int _3370 = _3368 ? _3356 : (-1);
    float _3372 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3374 = _2256 * _2314;
    out.m_67.x = _3362;
    out.m_67.y = _3358;
    out.m_67.z = _3244;
    out.m_67.w = _3360;
    float _3376 = _3366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3378 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3380 = _3334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3382 = _3352 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3384 = _3370 * _3322;
    int _3386 = _3384 + _3364;
    bool _3388 = _2256 > 0.0;
    bool _3390 = isnan(_2256);
    bool _3392 = _3388 || _3390;
    bool _3394 = isnan(0.0);
    bool _3396 = _3392 || _3394;
    float _3398 = _3374 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _3376;
    out.m_69.y = _3378;
    out.m_69.z = _3380;
    out.m_69.w = _3382;
    bool _3400 = _2314 <= 0.0;
    bool _3402 = !_3396;
    bool _3404 = _3400 || _3402;
    float _3406 = _3398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3408 = float(_3386);
    float _3410 = _2683 + _2562;
    float _3412 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3406;
    float _3414 = _3410 * 0.5;
    float _3416 = _3412 * _2618;
    out.m_71.x = _3408;
    float _3418 = _2639 * _3416;
    float _3420 = _2629 * _3416;
    float _3422 = -_3412;
    float _3424 = _3422 + 1.0;
    out.m_73.z = _3414;
    out.m_73.w = _2562;
    float _3426 = fma(_2635, _3420, _2623);
    float _3428 = fma(_2637, _3420, _2625);
    float _3430 = _2629 * _3424;
    float _3432 = fma(_2629, _3418, _2627);
    out.m_75.x = _3426;
    out.m_75.y = _3428;
    out.m_75.z = _3432;
    out.m_75.w = _3430;
    if (!_3404)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3434;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1174 = false;
    bool _904 = false;
    bool _806 = false;
    bool _470 = false;
    bool _200 = false;
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
        float _3503 = as_type<float>(_118);
        out.gl_Position.z = _3503;
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
        float _3558 = as_type<float>(_144);
        out.gl_Position.z = _3558;
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
    float _178 = _170;
    float _180 = _174;
    float _198;
    if (!_176)
    {
        float _182 = in.m_53.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        _198 = _156;
    }
    _200 = false;
    float _202 = _198;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _228 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_202);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = 1.0 / _218;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = _202 + _242;
    float _246 = 1.0 / _226;
    bool _248 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_202);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _222;
    float _264 = 1.0 / _214;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _268 = _202 + _266;
    float _270 = _206 * _246;
    bool _272 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _274 = isnan(_202);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    float _288 = _268 * _240;
    bool _290 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _292 = isnan(_202);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -_258;
    float _304 = _302 + 1.0;
    float _306 = _210 * _262;
    float _308 = -_300;
    float _310 = _308 + 1.0;
    float _312 = fma(_286, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = _282 * _310;
    bool _316 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_202);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _332 = -_282;
    float _334 = _332 + 1.0;
    float _336 = _238 * _304;
    float _338 = _244 * _264;
    float _340 = -_238;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    float _352 = _258 * _334;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _362 = _326 * _342;
    float _364 = fma(_346, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_350, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = fma(_330, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _370 = fma(_356, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _372 = fma(_360, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _374 = _312 * _362;
    float _376 = -_326;
    float _378 = _376 + 1.0;
    float _380 = _364 * _362;
    float _382 = _366 * _362;
    float _384 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _374);
    float _386 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _380);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _388;
    float _392 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _382);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _398;
    float _402 = fma(_368, _336, _384);
    float _404 = fma(_370, _336, _386);
    float _406 = fma(_390, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _408 = fma(_372, _336, _392);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _418 = fma(_396, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _420 = fma(_400, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _426 = fma(_406, _352, _402);
    float _428 = fma(_412, _288, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _430 = fma(_416, _288, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _432 = fma(_424, _288, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _434 = fma(_418, _352, _404);
    float _436 = fma(_420, _352, _408);
    float _438 = fma(_428, _314, _426);
    float _440 = fma(_430, _314, _434);
    float _442 = fma(_432, _314, _436);
    float _444 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].x, _438);
    float _446 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].y, _440);
    float _448 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].z, _442);
    bool _450 = !_260;
    float _468;
    if (!_450)
    {
        float _452 = in.m_53.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        _468 = _156;
    }
    _470 = false;
    float _472 = _468;
    float _474 = in.m_55.x;
    float _476 = in.m_55.y;
    float _478 = in.m_55.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = 1.0 / _482;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _498;
    float _502 = 1.0 / _486;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _472 + _504;
    float _508 = _446 * _476;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _512 = _472 + _510;
    float _514 = 1.0 / _490;
    float _516 = _506 * _496;
    float _518 = _448 * _478;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _522 = _472 + _520;
    bool _524 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _526 = isnan(_472);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _538 = _472 + _536;
    bool _540 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _542 = isnan(_472);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = _444 * _474;
    float _554 = 1.0 / _494;
    float _556 = _512 * _502;
    bool _558 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _560 = isnan(_472);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _572 = _472 + _570;
    bool _574 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _576 = isnan(_472);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    bool _586 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _588 = -_568;
    float _590 = _588 + 1.0;
    float _592 = 1.0 / _500;
    float _594 = _522 * _514;
    bool _596 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _598 = isnan(_472);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _534 * _590;
    float _610 = -_534;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _614;
    float _618 = -_584;
    float _620 = _618 + 1.0;
    float _622 = _572 * _554;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _628;
    float _632 = _606 * _612;
    float _634 = fma(_616, _516, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _636 = fma(_626, _516, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _638 = fma(_630, _516, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _640 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _642 = isnan(_472);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _538 * _592;
    float _654 = -_606;
    float _656 = _654 + 1.0;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _662 = _550 * _620;
    float _664 = -_550;
    float _666 = _664 + 1.0;
    float _668 = _584 * _656;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _678 = _650 * _666;
    float _680 = fma(_660, _556, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _682 = fma(_672, _556, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _684 = fma(_676, _556, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _686 = _634 * _678;
    float _688 = -_650;
    float _690 = _688 + 1.0;
    float _692 = _636 * _678;
    float _694 = _638 * _678;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _696;
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[107].x, _686);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[107].y, _692);
    float _704 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[107].z, _694);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _710;
    float _714 = fma(_698, _594, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _716 = fma(_682, _662, _700);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _718;
    float _722 = fma(_708, _622, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _724 = fma(_712, _594, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _730 = fma(_714, _668, _716);
    float _732 = fma(_720, _594, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _734 = fma(_684, _662, _704);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _740 = fma(_680, _662, _702);
    float _742 = fma(_728, _622, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _744 = fma(_732, _668, _734);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _746;
    float _750 = fma(_738, _622, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _752 = fma(_724, _668, _740);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _758;
    float _762 = fma(_722, _632, _730);
    float _764 = fma(_748, _652, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _766 = fma(_756, _652, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _768 = fma(_760, _652, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _770 = fma(_742, _632, _752);
    float _772 = fma(_750, _632, _744);
    float _774 = fma(_764, _608, _762);
    float _776 = fma(_766, _608, _770);
    float _778 = fma(_768, _608, _772);
    float _780 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[112].x, _774);
    float _782 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[112].y, _776);
    float _784 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[112].z, _778);
    bool _786 = !_586;
    float _804;
    if (!_786)
    {
        float _788 = in.m_53.x;
        float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _792 = _788 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _796 = _794 * _790;
        float _798 = floor(_796);
        float _800 = -_798;
        float _802 = _796 + _800;
        _804 = _802;
        _806 = true;
    }
    else
    {
        _804 = _156;
    }
    _806 = false;
    float _808 = _804;
    bool _810 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _812 = isnan(_808);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _826 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _828 = isnan(_808);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _838;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _808 + _842;
    float _846 = -_820;
    float _848 = _846 + 1.0;
    bool _850 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _852 = 1.0 / _824;
    float _854 = _836 * _848;
    float _856 = -_836;
    float _858 = _856 + 1.0;
    float _860 = _840 * _852;
    float _862 = _782 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _864 = fma(_860, _844, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _866 = _780 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _868 = _864 * _854;
    float _870 = _784 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _872 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[115].x, _868);
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _880 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[116].x, _872);
    float _882 = _880 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _884 = !_850;
    float _902;
    if (!_884)
    {
        float _886 = in.m_53.x;
        float _888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _890 = _886 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _894 = _892 * _888;
        float _896 = floor(_894);
        float _898 = -_896;
        float _900 = _894 + _898;
        _902 = _900;
        _904 = true;
    }
    else
    {
        _902 = _156;
    }
    _904 = false;
    float _906 = _902;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _910 = _906 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _914 = _906 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _918 = _906 + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _936 = 1.0 / _922;
    bool _938 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _940 = isnan(_906);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = 1.0 / _926;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _954 = _906 + _952;
    float _956 = 1.0 / _930;
    float _958 = _910 * _936;
    bool _960 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _962 = isnan(_906);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    bool _972 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _974 = 1.0 / _934;
    float _976 = _914 * _950;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _978;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _982;
    float _986 = fma(_980, _958, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _988 = fma(_984, _958, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _990 = _918 * _956;
    float _992 = -_948;
    float _994 = _992 + 1.0;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _996;
    float _1000 = fma(_998, _958, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1002 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1004 = isnan(_906);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = _954 * _974;
    bool _1016 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1018 = isnan(_906);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = _970 * _994;
    float _1030 = -_970;
    float _1032 = _1030 + 1.0;
    bool _1034 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1036 = isnan(_906);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = -_1026;
    float _1048 = _1046 + 1.0;
    float _1050 = _1026 * _1032;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1060 = _1012 * _1048;
    float _1062 = -_1012;
    float _1064 = _1062 + 1.0;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1070 = fma(_1054, _976, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1072 = fma(_1058, _976, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1074 = _1044 * _1064;
    float _1076 = fma(_1068, _976, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1078 = _988 * _1074;
    float _1080 = _986 * _1074;
    float _1082 = -_1044;
    float _1084 = _1082 + 1.0;
    float _1086 = _1000 * _1074;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1096;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1080);
    float _1102 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1078);
    float _1104 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1086);
    float _1106 = fma(_1090, _990, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1108 = fma(_1094, _990, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1110 = fma(_1098, _990, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1112 = fma(_1070, _1060, _1100);
    float _1114 = fma(_1076, _1060, _1102);
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1124 = fma(_1072, _1060, _1104);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1130 = fma(_1106, _1050, _1112);
    float _1132 = fma(_1118, _1014, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1134 = fma(_1122, _1014, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1136 = fma(_1108, _1050, _1114);
    float _1138 = fma(_1128, _1014, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1140 = fma(_1110, _1050, _1124);
    float _1142 = fma(_1132, _1028, _1130);
    float _1144 = fma(_1134, _1028, _1136);
    float _1146 = fma(_1138, _1028, _1140);
    float _1148 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1142);
    float _1150 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1144);
    float _1152 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1146);
    bool _1154 = !_972;
    float _1172;
    if (!_1154)
    {
        float _1156 = in.m_53.x;
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1160 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1164 = _1162 * _1158;
        float _1166 = floor(_1164);
        float _1168 = -_1166;
        float _1170 = _1164 + _1168;
        _1172 = _1170;
        _1174 = true;
    }
    else
    {
        _1172 = _156;
    }
    _1174 = false;
    float _1176 = _1172;
    float _1178 = in.m_53.x;
    float _1180 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1182 = int(_1180);
    float _1184 = in.m_53.y;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1188 = in.m_42.x;
    float _1190 = in.m_42.y;
    float _1192 = in.m_42.z;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1198 = _1196 != 0;
    float _1200 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1202 = in.m_53.z;
    float _1204 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1206 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1204);
    float _1208 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1214 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1216 = -_1186;
    float _1218 = fma(_1208, 2.0, _1216);
    float _1220 = _1178 * 2.0;
    float _1222 = _1184 * 2.0;
    float _1224 = fma(_1214, -2.0, _1194);
    float _1226 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1228 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1230 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1232 = floor(_1220);
    float _1234 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1236 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1226);
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1228);
    float _1240 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1230);
    float _1242 = _1178 + _1184;
    float _1244 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1234);
    float _1246 = _1202 * 2.0;
    float _1248 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1236);
    float _1250 = _1242 + (-1.0);
    float _1252 = _1184 + _1202;
    float _1254 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1256 = log2(_1254);
    float _1258 = _1178 + _1202;
    float _1260 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1238);
    float _1262 = _1252 + (-1.0);
    float _1264 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1240);
    bool _1266 = _1232 > 0.0;
    float _1268 = _1258 + (-1.0);
    bool _1270 = _1232 >= 0.0;
    bool _1272 = isnan(_1232);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan(0.0);
    bool _1278 = _1274 || _1276;
    float _1280 = floor(_1246);
    float _1282 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1284 = _1262;
    float _1286 = _1238;
    if (!_1198)
    {
        _1284 = _1202;
    }
    float _1288 = _1284;
    float _1290 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1292 = _1288;
    if (_1198)
    {
        _1292 = _1184;
    }
    float _1294 = _1292;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1298 = -_100;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1218);
    float _1302 = floor(_1222);
    float _1304 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1210);
    float _1306 = _1294;
    if (!_1198)
    {
        _1306 = _1202;
    }
    float _1308 = _1306;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1312 = _1308;
    if (_1198)
    {
        _1312 = _1184;
    }
    float _1314 = _1312;
    float _1316 = _1256 * _100;
    if (!_1198)
    {
        _1286 = _1184;
    }
    float _1318 = _1286;
    float _1320 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1322 = _1280 > 0.0;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1326 = _1318;
    if (_1198)
    {
        _1326 = _1178;
    }
    float _1328 = _1326;
    float _1330 = exp2(_1316);
    bool _1332 = _1280 >= 0.0;
    bool _1334 = isnan(_1280);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = fma(_1324, -2.0, _1212);
    float _1344 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1310);
    float _1346 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1348 = _1340 ? 0 : 1;
    float _1350 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1244);
    float _1352 = -_1296;
    float _1354 = fma(_1346, 2.0, _1352);
    float _1356 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1358 = int(_1356);
    int _1360 = ~_1348;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    float _1366 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1206);
    bool _1368 = _1302 >= 0.0;
    bool _1370 = isnan(_1302);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    int _1378 = _1364;
    if (!_1322)
    {
        int _1380 = ~_1348;
        int _1382 = _1380 + 1;
        _1378 = _1382;
    }
    int _1384 = _1378;
    float _1386 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1388 = _1302 > 0.0;
    float _1390 = rsqrt(_1366);
    int _1392 = _1278 ? 0 : 1;
    bool _1394 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1396 = isnan(0.0);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1402 = _1398 || _1400;
    int _1404 = _1376 ? 0 : 1;
    int _1406 = ~_1392;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1414 = 1.0 + _1412;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1418 = _1416 != 0;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1422 = _1420 != 0;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1426 = _1424 != 0;
    int _1428 = _1410;
    if (!_1266)
    {
        int _1430 = ~_1392;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = 1.0 / _1414;
    bool _1438 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1440 = isnan(1.0);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1446 = _1442 || _1444;
    bool _1448 = !_1422;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1454 = !_1418;
    int _1456 = _1454 ? 0 : 1;
    bool _1458 = !_1426;
    int _1460 = _1458 ? 0 : 1;
    float _1462 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1452);
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1470 = _1468 != 0;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1474 = _1472 != 0;
    float _1476 = -_1330;
    float _1478 = _1476 + 1.0;
    float _1480 = float(_1358);
    float _1482 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1224);
    int _1484 = ~_1404;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    int _1490 = _1488;
    if (!_1388)
    {
        int _1492 = ~_1404;
        int _1494 = _1492 + 1;
        _1490 = _1494;
    }
    int _1496 = _1490;
    float _1498 = in.m_57.x;
    float _1500 = in.m_57.y;
    float _1502 = in.m_57.z;
    bool _1504 = !_1466;
    int _1506 = _1504 ? 0 : 1;
    float _1508 = 1.0 / _1480;
    bool _1510 = !_1470;
    int _1512 = _1510 ? 0 : 1;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1516 = abs(_1506);
    float _1518 = -_100;
    float _1520 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1354);
    int _1522 = abs(_1512);
    float _1524 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1304);
    float _1526 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1514);
    float _1528 = float(_1434);
    float _1530 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1342);
    float _1532 = float(_1522);
    float _1534 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1526);
    float _1536 = float(_1516);
    float _1538 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1462);
    float _1540 = float(_1384);
    float _1542 = _1532 * _1528;
    bool _1544 = !_1474;
    int _1546 = _1544 ? 0 : 1;
    float _1548 = _1508 * _100;
    float _1550 = float(_1182);
    float _1552 = _1536 * _1540;
    float _1554 = _1402 ? _1478 : 0.0;
    float _1556 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1344);
    float _1558 = _1550 * _100;
    int _1560 = abs(_1546);
    float _1562 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1446)
    {
        float _1564 = _1554 * _1436;
        _110 = _1564;
    }
    float _1566 = _110;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1568;
    float _1572 = _1552 * (-2.0);
    float _1574 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1576 = _1562 * _1562;
    float _1578 = _1178 + (-0.5);
    float _1580 = fma(_1572, _1498, _1498);
    float _1582 = fma(_1574, _1574, _1576);
    float _1584 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1586 = float(_1496);
    float _1588 = fma(_1386, _1572, _1386);
    float _1590 = float(_1560);
    float _1592 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1580);
    float _1594 = _1542 * (-2.0);
    float _1596 = fma(_1584, _1584, _1582);
    float _1598 = 1.0 / _1570;
    float _1600 = _1590 * _1586;
    float _1602 = fma(_1588, _1566, _1592);
    float _1604 = fma(_1282, _1594, _1282);
    float _1606 = fma(_1594, _1500, _1500);
    float _1608 = _1260 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1610 = in.m_59.x;
    float _1612 = in.m_59.y;
    float _1614 = in.m_59.z;
    float _1616 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1618 = _1602 * 0.15915493667125701904296875;
    float _1620 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1622 = _1184 + (-0.5);
    float _1624 = _1600 * (-2.0);
    float _1626 = rsqrt(_1596);
    float _1628 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1620);
    float _1630 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1606);
    float _1632 = fma(_1290, _1624, _1290);
    float _1634 = fma(_1624, _1502, _1502);
    float _1636 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1638 = fma(_1604, _1566, _1630);
    float _1640 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1642 = _1202 + (-0.5);
    float _1644 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1646 = _1638 * 0.15915493667125701904296875;
    float _1648 = _1618 * 6.283185482025146484375;
    float _1650 = sin(_1648);
    float _1652 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1634);
    float _1654 = -_1644;
    float _1656 = _1640 + _1654;
    float _1658 = fma(_1632, _1566, _1652);
    bool _1660 = _1644 >= _1640;
    bool _1662 = isnan(_1644);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(_1640);
    bool _1668 = _1664 || _1666;
    float _1670 = _1574 * _1626;
    float _1672 = abs(_1656);
    float _1674 = precise::max(_1672, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1610);
    float _1678 = _1658 * 0.15915493667125701904296875;
    float _1680 = _1618 * 6.283185482025146484375;
    float _1682 = cos(_1680);
    float _1684 = precise::min(_1674, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1686 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1688 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1614);
    bool _1692 = !_1668;
    float _1694 = _1692 ? 1.0 : (-1.0);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1698 = _1684 + _1696;
    float _1700 = _1686 * _1676;
    float _1702 = _1646 * 6.283185482025146484375;
    float _1704 = sin(_1702);
    float _1706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1612);
    float _1708 = _1698 * _1598;
    float _1710 = _1688 * _1690;
    float _1712 = _1562 * _1626;
    float _1714 = _1200 * _1706;
    float _1716 = _1694 * _1708;
    float _1718 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1720 = _1646 * 6.283185482025146484375;
    float _1722 = cos(_1720);
    float _1724 = _1584 * _1626;
    float _1726 = _1718 * _1716;
    float _1728 = _1726 * 0.15915493667125701904296875;
    float _1730 = _1678 * 6.283185482025146484375;
    float _1732 = cos(_1730);
    float _1734 = _1650 * _1704;
    float _1736 = _1682 * _1704;
    float _1738 = _1678 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    float _1742 = _1650 * _1722;
    float _1744 = _1732 * _1714;
    float _1746 = _1682 * _1722;
    float _1748 = _1704 * _1732;
    float _1750 = _1722 * _1732;
    float _1752 = _1728 * 6.283185482025146484375;
    float _1754 = cos(_1752);
    float _1756 = _1682 * _1744;
    float _1758 = _1650 * _1744;
    float _1760 = fma(_1740, _1746, _1734);
    float _1762 = -_1736;
    float _1764 = fma(_1740, _1742, _1762);
    float _1766 = -_1714;
    float _1768 = _1740 * _1766;
    float _1770 = -_1742;
    float _1772 = fma(_1740, _1736, _1770);
    float _1774 = fma(_1760, _1700, _1756);
    float _1776 = _1728 * 6.283185482025146484375;
    float _1778 = sin(_1776);
    float _1780 = fma(_1750, _1700, _1768);
    float _1782 = fma(_1740, _1734, _1746);
    float _1784 = fma(_1772, _1710, _1774);
    float _1786 = fma(_1764, _1700, _1758);
    float _1788 = fma(_1748, _1710, _1780);
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1792 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1794 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1796 = fma(_1782, _1710, _1786);
    float _1798 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1790);
    float _1800 = -_1754;
    float _1802 = _1800 + 1.0;
    float _1804 = _1724 * _1724;
    float _1806 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1792);
    float _1808 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1794);
    float _1810 = _1670 * _1778;
    float _1812 = _1712 * _1802;
    float _1814 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1798);
    float _1816 = _1712 * _1778;
    float _1818 = fma(_1802, _1804, _1754);
    float _1820 = _1724 * _1778;
    float _1822 = _1670 * _1802;
    float _1824 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1806);
    float _1826 = fma(_1724, _1812, _1810);
    float _1828 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1830 = -_1820;
    float _1832 = fma(_1712, _1822, _1830);
    float _1834 = -_1816;
    float _1836 = fma(_1724, _1822, _1834);
    float _1838 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1840 = _1828 * _1826;
    float _1842 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1808);
    float _1844 = fma(_1670, _1822, _1754);
    float _1846 = _1828 * _1832;
    float _1848 = fma(_1838, _1836, _1840);
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1852 = fma(_1724, _1822, _1816);
    float _1854 = fma(_1838, _1844, _1846);
    float _1856 = fma(_1712, _1812, _1754);
    float _1858 = fma(_1850, _1818, _1848);
    float _1860 = fma(_1712, _1822, _1820);
    float _1862 = fma(_1850, _1852, _1854);
    float _1864 = _1828 * _1856;
    float _1866 = _1320 + _1858;
    float _1868 = -_1810;
    float _1870 = fma(_1724, _1812, _1868);
    float _1872 = _1616 + _1862;
    float _1874 = fma(_1838, _1860, _1864);
    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1878 = _1866 + _1876;
    float _1880 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1884 = _1872 + _1882;
    float _1886 = fma(_1850, _1870, _1874);
    float _1888 = _1878 * _1878;
    float _1890 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1880);
    float _1892 = _1608 + _1886;
    float _1894 = fma(_1884, _1884, _1888);
    float _1896 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1890);
    float _1898 = sqrt(_1894);
    bool _1900 = _1898 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1890;
    float _1904 = _1812;
    float _1906 = _1870;
    float _1908 = _1898;
    if (!_1900)
    {
        _1902 = _1872;
    }
    float _1910 = _1902;
    float _1912 = _1910;
    if (!_1900)
    {
        _1904 = _1866;
    }
    float _1914 = _1904;
    float _1916 = _1914;
    if (!_1900)
    {
        _1906 = _1892;
    }
    float _1918 = _1906;
    bool _1920 = !_1900;
    float _1922 = _1918;
    if (!_1920)
    {
        float _1924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1926 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1928 = _1898 + _1926;
        float _1930 = rsqrt(_1894);
        float _1932 = _1928 * _1924;
        float _1934 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1936 = _1932 * 0.15915493667125701904296875;
        float _1938 = _1936 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1936 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        float _1946 = _1940 + (-1.0);
        float _1948 = fma(_1944, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1950 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1952 = _1930 * _1948;
        float _1954 = fma(_1892, _1940, _1950);
        float _1956 = fma(_1884, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1958 = fma(_1878, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1922 = _1954;
        _1912 = _1956;
        _1916 = _1958;
    }
    float _1960 = _1922;
    float _1962 = _1912;
    float _1964 = _1916;
    float _1966 = -_1608;
    float _1968 = _1966 + _1960;
    float _1970 = -_1616;
    float _1972 = _1970 + _1962;
    float _1974 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1976 = -_1320;
    float _1978 = _1976 + _1964;
    float _1980 = _1968 * _1968;
    float _1982 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1984 = 1.0 / _1974;
    float _1986 = fma(_1972, _1972, _1980);
    float _1988 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1982);
    float _1990 = fma(_1978, _1978, _1986);
    float _1992 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1988);
    float _1994 = sqrt(_1990);
    float _1996 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1998 = _1996 + _1974;
    float _2000 = _1998 * _1984;
    float _2002 = _2000 * 0.5;
    bool _2004 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    bool _2014 = _1994 > 0.0;
    float _2016 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2018 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2016);
    bool _2020 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2022 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan(0.5);
    bool _2028 = _2024 || _2026;
    float _2030 = 1.0 / _2018;
    bool _2032 = !_2014;
    float _2034 = _1964;
    float _2036 = _1962;
    float _2038 = _1960;
    float _2040 = _1978;
    float _2042 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2044 = _1990;
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_2032)
    {
        float _2048 = _172 * _172;
        float _2050 = rsqrt(_1990);
        float _2052 = fma(_170, _170, _2048);
        float _2054 = fma(_174, _174, _2052);
        float _2056 = sqrt(_2054);
        float _2058 = _1978 * _2050;
        bool _2060 = _2056 > 0.0;
        float _2062 = _1972 * _2050;
        float _2064 = _1968 * _2050;
        bool _2066 = !_2060;
        _2042 = _2054;
        _1908 = _2058;
        _2046 = _2050;
        if (!_2066)
        {
            float _2068 = rsqrt(_2054);
            float _2070 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2072 = _172 * _2068;
            float _2074 = _170 * _2068;
            float _2076 = _2064 * _2072;
            float _2078 = _174 * _2068;
            float _2080 = fma(_2062, _2074, _2076);
            float _2082 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2084 = fma(_2058, _2078, _2080);
            float _2086 = _2084 * _2082;
            float _2088 = fma(_170, _2086, _1962);
            float _2090 = fma(_172, _2086, _1960);
            float _2092 = fma(_174, _2086, _1964);
            _2034 = _2092;
            _2036 = _2088;
            _2038 = _2090;
            _2040 = _2086;
            _2042 = _2068;
            _2044 = _2070;
            _2046 = _2082;
        }
    }
    float _2094 = _2034;
    float _2096 = _2036;
    float _2098 = _2038;
    float _2100 = _2040;
    float _2102 = _2042;
    float _2104 = _1908;
    float _2106 = _2044;
    float _2108 = _2046;
    float _2110 = _2106;
    float _2112 = _2098;
    float _2114 = _2096;
    float _2116 = _2100;
    float _2118 = _2108;
    float _2120 = _2102;
    float _2122 = _2104;
    if (_2028)
    {
        _2110 = 1.0;
    }
    float _2124 = _2110;
    float _2126 = _2124;
    if (_2012)
    {
        _178 = _2094;
    }
    float _2128 = _178;
    float _2130 = _2128;
    if (!_2012)
    {
        float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2134 = _1608 + _2132;
        float _2136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2138 = _1616 + _2136;
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2142 = -_1616;
        float _2144 = _2142 + _2096;
        float _2146 = _2134 * _2134;
        float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2150 = _1320 + _2148;
        float _2152 = -_1320;
        float _2154 = _2152 + _2094;
        float _2156 = fma(_2138, _2138, _2146);
        float _2158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2160 = fma(_2150, _2150, _2156);
        float _2162 = sqrt(_2160);
        float _2164 = _2140 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2166 = precise::min(_2162, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2168 = _2166 * _2158;
        float _2170 = _2164 * _2168;
        float _2172 = -_1608;
        float _2174 = _2172 + _2098;
        float _2176 = fma(_2144, _2170, _1616);
        float _2178 = fma(_2174, _2170, _1608);
        float _2180 = fma(_2154, _2170, _1320);
        _180 = _2140;
        _2112 = _2178;
        _2114 = _2176;
        _2130 = _2180;
        _2116 = _2170;
    }
    float _2182 = _180;
    float _2184 = _2112;
    float _2186 = _2114;
    float _2188 = _2130;
    float _2190 = _2116;
    float _2192 = _2182;
    float _2194 = _2190;
    if (_2028)
    {
        _2118 = 1.0;
    }
    float _2196 = _2118;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2200 = _2030 * _2198;
    float _2202 = _2196;
    if (!_2028)
    {
        float _2204 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2206 = _2204 * 0.15915493667125701904296875;
        float _2208 = _2206 * 6.283185482025146484375;
        float _2210 = cos(_2208);
        float _2212 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2214 = _2212 * 0.15915493667125701904296875;
        float _2216 = _2206 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        float _2220 = 1.0 / _2210;
        float _2222 = _2214 * 6.283185482025146484375;
        float _2224 = cos(_2222);
        float _2226 = _2218 * _2220;
        float _2228 = _2214 * 6.283185482025146484375;
        float _2230 = sin(_2228);
        float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2234 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2232;
        float _2236 = _2224 * _2226;
        float _2238 = 1.0 / _2234;
        float _2240 = 1.0 / _2236;
        float _2242 = _2230 * _2240;
        float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2246 = fma(_2200, _2242, _2244);
        float _2248 = _2246 * _2238;
        float _2250 = precise::clamp(_2248, 0.0, 1.0);
        _2192 = _2214;
        _2194 = _2206;
        _2126 = _2250;
    }
    float _2252 = _2192;
    float _2254 = _2194;
    float _2256 = _2126;
    float _2258 = _2252;
    if (!_2028)
    {
        float _2260 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2262 = _2260 * 0.15915493667125701904296875;
        float _2264 = _2262 * 6.283185482025146484375;
        float _2266 = cos(_2264);
        float _2268 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2270 = _2268 * 0.15915493667125701904296875;
        float _2272 = _2262 * 6.283185482025146484375;
        float _2274 = sin(_2272);
        float _2276 = 1.0 / _2266;
        float _2278 = _2270 * 6.283185482025146484375;
        float _2280 = cos(_2278);
        float _2282 = _2274 * _2276;
        float _2284 = _2270 * 6.283185482025146484375;
        float _2286 = sin(_2284);
        float _2288 = _2280 * _2282;
        float _2290 = 1.0 / _2288;
        float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2294 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2292;
        float _2296 = 1.0 / _2294;
        float _2298 = _2286 * _2290;
        float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2302 = fma(_2200, _2298, _2300);
        float _2304 = _2302 * _2296;
        float _2306 = precise::clamp(_2304, 0.0, 1.0);
        float _2308 = -_2306;
        float _2310 = _2308 + 1.0;
        _2258 = _2276;
        _2202 = _2310;
    }
    float _2312 = _2258;
    float _2314 = _2202;
    float _2316 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2318 = _2184 + _2316;
    float _2320 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2322 = _2186 + _2320;
    float _2324 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2326 = _2188 + _2324;
    float _2328 = _2318 * _2318;
    float _2330 = fma(_2322, _2322, _2328);
    float _2332 = fma(_2326, _2326, _2330);
    float _2334 = rsqrt(_2332);
    float _2336 = sqrt(_2332);
    float _2338 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2340 = _2322 * _2338;
    float _2342 = _2326 * _2338;
    float _2344 = _2340 * _2340;
    float _2346 = _2342 * _2342;
    float _2348 = _2344 + _2346;
    float _2350 = sqrt(_2348);
    bool _2352 = _2350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2356 = _2350 + _2354;
    float _2358 = _2312;
    float _2360 = _2348;
    float _2362 = _2356;
    float _2364 = _2318;
    float _2366 = _2342;
    float _2368 = _2344;
    float _2370 = _2346;
    if (_2352)
    {
        float _2372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2358 = _2372;
    }
    float _2374 = _2358;
    if (_2352)
    {
        float _2376 = rsqrt(_2348);
        _2360 = _2376;
    }
    float _2378 = _2360;
    if (_2352)
    {
        float _2380 = _2356 * _2374;
        _2362 = _2380;
    }
    float _2382 = _2362;
    if (_2352)
    {
        float _2384 = _2382 * 0.15915493667125701904296875;
        _2120 = _2384;
    }
    float _2386 = _2120;
    float _2388 = _2254;
    if (_2352)
    {
        float _2390 = _2386 * 6.283185482025146484375;
        float _2392 = sin(_2390);
        _2388 = _2392;
    }
    float _2394 = _2388;
    float _2396 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2398 = precise::max(0.0, _2396);
    float _2400 = _2374;
    float _2402 = _2398;
    if (_2352)
    {
        float _2404 = _2386 * 6.283185482025146484375;
        float _2406 = cos(_2404);
        _2400 = _2406;
    }
    float _2408 = _2400;
    float _2410 = -_2338;
    float _2412 = -_2398;
    float _2414 = fma(_2318, _2410, _2412);
    if (_2352)
    {
        float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2364 = _2416;
    }
    float _2418 = _2364;
    float _2420 = _2418;
    float _2422 = _2394;
    if (_2352)
    {
        float _2424 = fma(_2394, _2418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2402 = _2424;
    }
    float _2426 = _2402;
    float _2428 = _2426;
    if (!_2352)
    {
        _2420 = _2340;
    }
    float _2430 = _2420;
    float _2432 = _2430;
    if (_2352)
    {
        float _2434 = _2408 + (-1.0);
        _2422 = _2434;
    }
    float _2436 = _2422;
    float _2438 = _2436;
    if (_2352)
    {
        float _2440 = _2378 * _2426;
        _2122 = _2440;
    }
    float _2442 = _2122;
    if (!_2352)
    {
        _2428 = _2414;
    }
    float _2444 = _2428;
    float _2446 = _2444;
    if (_2352)
    {
        float _2448 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2438 = _2448;
    }
    float _2450 = _2438;
    if (_2352)
    {
        float _2452 = _2340 * _2442;
        _2432 = _2452;
    }
    float _2454 = _2432;
    if (_2352)
    {
        float _2456 = _2342 * _2442;
        _2366 = _2456;
    }
    float _2458 = _2366;
    if (_2352)
    {
        float _2460 = fma(_2414, _2408, _2450);
        _2446 = _2460;
    }
    float _2462 = _2446;
    if (_2352)
    {
        float _2464 = _2454 * _2454;
        _2368 = _2464;
    }
    float _2466 = _2368;
    if (_2352)
    {
        float _2468 = _2458 * _2458;
        _2370 = _2468;
    }
    float _2470 = _2370;
    float _2472 = fma(_2462, _2462, _2466);
    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2476 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2474);
    float _2478 = precise::clamp(_2476, 0.0, 1.0);
    float _2480 = _2472 + _2470;
    float _2482 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2484 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2486 = -_2478;
    float _2488 = _2486 + 1.0;
    float _2490 = rsqrt(_2480);
    float _2492 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2482);
    float _2494 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2496 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2498 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2492);
    float _2500 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2484);
    float _2502 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2504 = abs(_2488);
    float _2506 = log2(_2504);
    float _2508 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2494);
    float _2510 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2500);
    float _2512 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2502);
    float _2514 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2516 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2508);
    float _2518 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2520 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2512);
    float _2522 = _2490 * _2454;
    float _2524 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2526 = _2490 * _2462;
    float _2528 = _2520 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2530 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2532 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2534 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2536 = _2490 * _2458;
    float _2538 = -_2530;
    float _2540 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2538);
    float _2542 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2532);
    float _2544 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2546 = -_2534;
    float _2548 = fma(_2546, _2496, 1.0);
    float _2550 = -_2536;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2540);
    float _2554 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2542);
    float _2556 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2558 = log2(_2548);
    float _2560 = fma(_2552, -0.5, 0.5);
    float _2562 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2554);
    float _2564 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2566 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2556);
    float _2568 = fma(_2552, 0.5, 0.5);
    float _2570 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2564);
    float _2572 = exp2(_2544);
    float _2574 = _2526 + 1.0;
    float _2576 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2566);
    float _2578 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2570);
    float _2580 = fma(_2568, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2582 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2578);
    float _2584 = 1.0 / _2562;
    float _2586 = fma(_2568, _2580, -0.212114393711090087890625);
    float _2588 = fma(_2568, _2586, 1.570728778839111328125);
    float _2590 = sqrt(_2560);
    float _2592 = -_2526;
    float _2594 = fma(_2572, _2574, _2592);
    float _2596 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2576);
    float _2598 = _2558 * 0.693147182464599609375;
    float _2600 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2602 = _2596 * _2584;
    float _2604 = _2582 * _2584;
    float _2606 = fma(_2602, 0.5, 0.5);
    float _2608 = fma(_2604, -0.5, 0.5);
    float _2610 = fma(_2594, 0.5, 0.5);
    float _2612 = _2590 * 0.636619746685028076171875;
    float _2614 = -_2588;
    float _2616 = fma(_2612, _2614, 1.0);
    float3 _7514 = float3(_2606, _2608, _2600);
    float _2618 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7514, float3(0.0), isnan(_7514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7514, float3(0.0), isnan(_7514)), level(0.0)).x;
    float3 _7525 = float3(_2606, _2608, _2600);
    float4 _2621 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7525, float3(0.0), isnan(_7525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7525, float3(0.0), isnan(_7525)), level(0.0)).xyzw;
    float _2623 = _2621.x;
    float _2625 = _2621.y;
    float _2627 = _2621.z;
    float _2629 = _2621.w;
    float2 _7542 = float2(_2616, _2610);
    float3 _2633 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7542, float2(0.0), isnan(_7542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7542, float2(0.0), isnan(_7542)), level(0.0)).xyz;
    float _2635 = _2633.x;
    float _2637 = _2633.y;
    float _2639 = _2633.z;
    float _2641 = float(uint(_1182));
    float _2643 = trunc(_1548);
    int _2645 = int(_2643);
    int _2647 = ~_1182;
    int _2649 = _2647 + 1;
    float _2651 = _1558 * _152;
    int _2653 = ~_1182;
    int _2655 = _2653 + 1;
    out.m_61.x = _874;
    out.m_61.y = _876;
    out.m_61.z = _878;
    out.m_61.w = _882;
    int _2657 = _1182 + (-1);
    float _2659 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2661 = abs(_1450);
    float _2663 = 1.0 / _2641;
    float _2665 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2667 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2665);
    bool _2669 = !_1198;
    float _2671 = _2669 ? 7.345489978790283203125 : 1.0;
    float _2673 = float(uint(_2645));
    float _2675 = trunc(_2651);
    int _2677 = int(_2675);
    float _2679 = float(_2645);
    float _2681 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2667);
    float _2683 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2681);
    int _2685 = as_type<int>(_2663) + (-2);
    float _2687 = exp2(_2659);
    float _2689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2689;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2697 = as_type<float>(_2685) * _2673;
    out.gl_Position.x = _2596;
    out.gl_Position.y = _2582;
    out.gl_Position.z = _2683;
    out.gl_Position.w = _2562;
    float _2699 = trunc(_2697);
    float _2701 = precise::max(_2699, 0.0);
    uint _2704 = uint(_2701);
    float _2706 = -_2687;
    float _2708 = _2706 + 1.0;
    int _2710 = _2649 * int(_2704);
    int _2712 = _2710 + _2645;
    float _2714 = float(uint(_2712));
    float _2716 = as_type<float>(_2685) * _2714;
    float _2718 = _2671 * _1178;
    bool _2720 = _2679 >= _1550;
    bool _2722 = isnan(_2679);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan(_1550);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = floor(_2718);
    float _2734 = trunc(_2716);
    float _2736 = precise::max(_2734, 0.0);
    uint _2738 = uint(_2736);
    float _2740 = trunc(_2730);
    int _2742 = int(_2740);
    float _2744 = -_2732;
    float _2746 = _2718 + _2744;
    int _2748 = int(_2704) + int(_2738);
    int _2750 = _2655 * _2748;
    int _2752 = _2750 + _2645;
    int _2754 = ~_2742;
    int _2756 = _2754 + 1;
    int _2758 = _2756 + 1;
    bool _2760 = uint(_2752) >= uint(_1182);
    bool _2762 = !_2760;
    int _2764 = _2762 ? 0 : (-1);
    bool _2766 = _1182 == 0;
    int _2768 = ~_2748;
    int _2770 = _2768 + _2764;
    int _2772 = _2770 + 1;
    float _2774 = _2746 * _1550;
    int _2776 = _1182 * _2772;
    int _2778 = _2776 + _2645;
    int _2780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2782 = _2780 != 0;
    float _2784 = trunc(_2774);
    int _2786 = int(_2784);
    int _2788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2790 = _2788 != 0;
    bool _2792 = !_2766;
    int _2794 = _2792 ? _2778 : (-1);
    bool _2796 = !_2782;
    int _2798 = _2796 ? 0 : 1;
    int _2800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2802 = _2800 != 0;
    int _2804 = _2794 * _2758;
    int _2806 = abs(_2798);
    int _2808 = abs(_1456);
    int _2810 = _2742 * _2657;
    int _2812 = _2810 + _2804;
    int _2814 = abs(_1460);
    int _2816 = _2812 * _2661;
    bool _2818 = !_2802;
    int _2820 = _2818 ? 0 : 1;
    int _2822 = _2786 * _2806;
    int _2824 = _2822 + _2645;
    int _2826 = abs(_2820);
    int _2828 = _2677 * _2808;
    int _2830 = _2828 + _2816;
    int _2832 = _2824 * _2814;
    int _2834 = _2832 + _2830;
    float _2836 = in.m_53.w;
    int _2838 = _2786 * _2826;
    int _2840 = _2838 + _2834;
    float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2846 = in.m_63.y;
    int _2848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2850 = _2848 != 0;
    float _2852 = float(uint(_2840));
    float _2854 = 1.0 / _2844;
    int _2856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2858 = _2856 != 0;
    float _2860 = as_type<float>(_2685) * _2852;
    int _2862 = ~_1182;
    int _2864 = _2862 + 1;
    int _2866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2868 = _2866 != 0;
    int _2870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2872 = _2870 != 0;
    float _2874 = trunc(_2860);
    float _2876 = precise::max(_2874, 0.0);
    uint _2878 = uint(_2876);
    bool _2880 = _2836 > 0.5;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2884 = _2882 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2888 = _2864 * int(_2878);
    int _2890 = _2888 + _2840;
    float _2892 = 1.0 / _2884;
    float _2894 = float(uint(_2890));
    float _2896 = _2886 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2898 = as_type<float>(_2685) * _2894;
    float _2900 = -_2846;
    float _2902 = _2900 + 1.0;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2904 = trunc(_2898);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    int _2910 = _2880 ? as_type<int>(_2902) : as_type<int>(_2846);
    float _2912 = _2695 * _2892;
    bool _2914 = _1184 > 0.5;
    int _2916 = ~_1182;
    int _2918 = _2916 + 1;
    float _2920 = _2858 ? as_type<float>(_2910) : _2846;
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2924 = _2922 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2926 = _2691 * _2854;
    float _2928 = _2846;
    bool _2930 = _2858;
    bool _2932 = _2790;
    int _2934 = as_type<int>(_2774);
    if (_2790)
    {
        float _2936 = _2914 ? _2902 : _2846;
        _2928 = _2936;
    }
    float _2938 = _2928;
    float _2940 = 1.0 / _2924;
    if (_2850)
    {
        bool _2942 = _1178 > 0.5;
        _2930 = _2942;
    }
    bool _2944 = _2930;
    float _2946 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2948 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2946;
    int _2950 = int(_2878) + int(_2908);
    float _2952 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2954 = _1176 + _2952;
    float _2956 = float(uint(_2824));
    float _2958 = fma(_2920, _2896, -0.5);
    if (_2868)
    {
        bool _2960 = _1202 > 0.5;
        _2932 = _2960;
    }
    bool _2962 = _2932;
    int _2964 = _2918 * _2950;
    int _2966 = _2964 + _2840;
    float _2968 = fma(_2926, _2954, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2970 = as_type<float>(_2685) * _2956;
    float _2972 = in.m_63.x;
    float _2974 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2938, -0.5);
    bool _2976 = uint(_2966) >= uint(_1182);
    float _2978 = trunc(_2970);
    float _2980 = precise::max(_2978, 0.0);
    uint _2982 = uint(_2980);
    int _2984 = ~_1182;
    int _2986 = _2984 + 1;
    float _2988 = _2948 * _2940;
    bool _2990 = !_2976;
    int _2992 = _2990 ? 0 : (-1);
    float _2994 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2996 = _1176 + _2994;
    float _2998 = -_1530;
    float _3000 = fma(_1524, _2958, _2998);
    int _3002 = ~_1182;
    int _3004 = _3002 + 1;
    float _3006 = -_1482;
    float _3008 = fma(_1538, _2974, _3006);
    int _3010 = ~_2950;
    int _3012 = _3010 + _2992;
    int _3014 = _3012 + 1;
    float _3016 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3018 = _1176 + _3016;
    bool _3020 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3022 = isnan(_1176);
    bool _3024 = _3020 || _3022;
    bool _3026 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3028 = _3024 || _3026;
    float _3030 = float(_3028);
    float _3032 = fma(_2912, _2996, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3034 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3036 = isnan(_1176);
    bool _3038 = _3034 || _3036;
    bool _3040 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3042 = _3038 || _3040;
    float _3044 = float(_3042);
    int _3046 = _1182 * _3014;
    int _3048 = _3046 + _2840;
    float _3050 = fma(_2988, _3018, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _3052 = -_3030;
    float _3054 = _3052 + 1.0;
    bool _3056 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3058 = isnan(_1176);
    bool _3060 = _3056 || _3058;
    bool _3062 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3064 = _3060 || _3062;
    float _3066 = float(_3064);
    int _3068 = _2986 * int(_2982);
    int _3070 = _3068 + _2824;
    bool _3072 = !_2766;
    int _3074 = _3072 ? _3048 : (-1);
    float _3076 = _3044 * _3054;
    float _3078 = -_3044;
    float _3080 = _3078 + 1.0;
    bool _3082 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3084 = isnan(_1176);
    bool _3086 = _3082 || _3084;
    bool _3088 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3090 = _3086 || _3088;
    float _3092 = float(_3090);
    if (_2868)
    {
        float _3094 = -_2972;
        float _3096 = _3094 + 1.0;
        _2934 = as_type<int>(_3096);
    }
    int _3098 = _2934;
    int _3100 = _3074 >> 31;
    float _3102 = float(uint(_3070));
    float _3104 = _3066 * _3080;
    int _3106 = _3100 & 3;
    float _3108 = -_3066;
    float _3110 = _3108 + 1.0;
    float _3112 = as_type<float>(_2685) * _3102;
    int _3114 = _3074 + _3106;
    float _3116 = _3092 * _3110;
    float _3118 = -_3092;
    float _3120 = _3118 + 1.0;
    float _3122 = trunc(_3112);
    float _3124 = precise::max(_3122, 0.0);
    uint _3126 = uint(_3124);
    int _3128 = _3114 >> 2;
    float _3130 = _2968 * _3116;
    float _3132 = as_type<float>(_3106);
    float _3134 = as_type<float>(_3128);
    int _3136 = as_type<int>(_3112);
    if (!_2850)
    {
        _3132 = _2972;
    }
    float _3138 = _3132;
    int _3140 = _3128 << 4;
    int _3142 = _3140 + 368;
    float _3144 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3130);
    float _3146 = _3138;
    if (!_2868)
    {
        _3134 = _2972;
    }
    float _3148 = _3134;
    float _3150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3152 = uint(int(uint(_3142) >> uint(2)));
    uint _3154 = uint(int(uint(int(_3152)) >> uint(2)));
    int _3156 = int(_3152) & 3;
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[int(_3154)][_3156];
    int _3160 = int(_3152) + 1;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    int _3164 = _3160 & 3;
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[int(_3162)][_3164];
    float _3168 = _3148;
    if (_2850)
    {
        float _3170 = -_2972;
        float _3172 = _3170 + 1.0;
        _3136 = as_type<int>(_3172);
    }
    int _3174 = _3136;
    if (_2868)
    {
        float _3176 = _2962 ? as_type<float>(_3098) : _2972;
        _3168 = _3176;
    }
    float _3178 = _3168;
    float _3180 = fma(_3032, _3104, _3144);
    int _3182 = _3074 & 3;
    bool _3184 = _3182 != 0;
    if (_2850)
    {
        float _3186 = _2944 ? as_type<float>(_3174) : _2972;
        _3146 = _3186;
    }
    float _3188 = _3146;
    float _3190 = fma(_3050, _3076, _3180);
    int _3192 = _3142 + 8;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c9)._m0[int(_3204)][_3206];
    int _3210 = _3074 & 3;
    bool _3212 = _3210 != 0;
    bool _3214 = uint(_3182) > 1u;
    float _3216 = fma(_3188, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3218 = _3150 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3220 = _3212 ? 0 : 1;
    bool _3222 = _3182 != 3;
    float _3224 = fma(_3218, _3178, -0.5);
    int _3226 = int(_2982) + int(_3126);
    float _3228 = fma(_1534, _3216, _1300);
    bool _3230 = uint(_3182) >= 2u;
    float _3232 = fma(_1556, _3224, _1520);
    int _3234 = _3004 * _3226;
    int _3236 = _3234 + _2824;
    int _3238 = ~_3220;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    float _3244 = _3232 + 0.5;
    int _3246 = _3230 ? 0 : 1;
    int _3248 = _3242;
    if (!_3214)
    {
        int _3250 = ~_3220;
        int _3252 = _3250 + 1;
        _3248 = _3252;
    }
    int _3254 = _3248;
    bool _3256 = uint(_3236) >= uint(_1182);
    bool _3258 = !_3184;
    int _3260 = _3258 ? 0 : 1;
    int _3262 = ~_3246;
    int _3264 = _3262 + 1;
    int _3266 = _3264 + 1;
    int _3268 = abs(_3254);
    bool _3270 = _3182 != 3;
    int _3272 = _3266;
    if (_3222)
    {
        int _3274 = ~_3246;
        int _3276 = _3274 + 1;
        _3272 = _3276;
    }
    int _3278 = _3272;
    int _3280 = abs(_3260);
    bool _3282 = !_3270;
    int _3284 = _3282 ? 0 : (-1);
    int _3286 = ~_3268;
    int _3288 = _3286 + 1;
    int _3290 = _3288 + 1;
    int _3292 = abs(_3278);
    int _3294 = abs(_3284);
    int _3296 = _3290 * as_type<int>(_3166);
    int _3298 = ~_3280;
    int _3300 = _3298 + 1;
    int _3302 = _3300 + 1;
    bool _3304 = !_2872;
    int _3306 = _3304 ? 0 : 1;
    int _3308 = _3302 * as_type<int>(_3158);
    int _3310 = _3308 + _3296;
    int _3312 = ~_3292;
    int _3314 = _3312 + 1;
    int _3316 = _3314 + 1;
    bool _3318 = !_3256;
    int _3320 = _3318 ? 0 : (-1);
    int _3322 = abs(_3306);
    int _3324 = _3316 * as_type<int>(_3200);
    int _3326 = _3324 + _3310;
    int _3328 = ~_3294;
    int _3330 = _3328 + 1;
    int _3332 = _3330 + 1;
    float _3334 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3336 = ~_3226;
    int _3338 = _3336 + _3320;
    int _3340 = _3338 + 1;
    int _3342 = ~_3322;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    int _3348 = _3332 * as_type<int>(_3208);
    int _3350 = _3348 + _3326;
    float _3352 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3190);
    int _3354 = _1182 * _3340;
    int _3356 = _3354 + _2824;
    float _3358 = _3008 + 0.5;
    float _3360 = _3000 + 0.5;
    float _3362 = _3228 + 0.5;
    int _3364 = _3350 * _3346;
    float _3366 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3368 = !_2766;
    int _3370 = _3368 ? _3356 : (-1);
    float _3372 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3374 = _2256 * _2314;
    out.m_67.x = _3362;
    out.m_67.y = _3358;
    out.m_67.z = _3244;
    out.m_67.w = _3360;
    float _3376 = _3366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3378 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3380 = _3334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3382 = _3352 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3384 = _3370 * _3322;
    int _3386 = _3384 + _3364;
    bool _3388 = _2256 > 0.0;
    bool _3390 = isnan(_2256);
    bool _3392 = _3388 || _3390;
    bool _3394 = isnan(0.0);
    bool _3396 = _3392 || _3394;
    float _3398 = _3374 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _3376;
    out.m_69.y = _3378;
    out.m_69.z = _3380;
    out.m_69.w = _3382;
    bool _3400 = _2314 <= 0.0;
    bool _3402 = !_3396;
    bool _3404 = _3400 || _3402;
    float _3406 = _3398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3408 = float(_3386);
    float _3410 = _2683 + _2562;
    float _3412 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3406;
    float _3414 = _3410 * 0.5;
    float _3416 = _3412 * _2618;
    out.m_71.x = _3408;
    float _3418 = _2639 * _3416;
    float _3420 = _2629 * _3416;
    float _3422 = -_3412;
    float _3424 = _3422 + 1.0;
    out.m_73.z = _3414;
    out.m_73.w = _2562;
    float _3426 = fma(_2635, _3420, _2623);
    float _3428 = fma(_2637, _3420, _2625);
    float _3430 = _2629 * _3424;
    float _3432 = fma(_2629, _3418, _2627);
    out.m_75.x = _3426;
    out.m_75.y = _3428;
    out.m_75.z = _3432;
    out.m_75.w = _3430;
    if (!_3404)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3434;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1174 = false;
    bool _904 = false;
    bool _806 = false;
    bool _470 = false;
    bool _200 = false;
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
        float _3503 = as_type<float>(_118);
        out.gl_Position.z = _3503;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3558 = as_type<float>(_144);
        out.gl_Position.z = _3558;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _178 = _170;
    float _180 = _174;
    float _198;
    if (!_176)
    {
        float _182 = in.m_53.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        _198 = _156;
    }
    _200 = false;
    float _202 = _198;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _202 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _228 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _230 = isnan(_202);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    float _240 = 1.0 / _218;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _244 = _202 + _242;
    float _246 = 1.0 / _226;
    bool _248 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_202);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _222;
    float _264 = 1.0 / _214;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _268 = _202 + _266;
    float _270 = _206 * _246;
    bool _272 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _274 = isnan(_202);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    float _288 = _268 * _240;
    bool _290 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _292 = isnan(_202);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = -_258;
    float _304 = _302 + 1.0;
    float _306 = _210 * _262;
    float _308 = -_300;
    float _310 = _308 + 1.0;
    float _312 = fma(_286, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _314 = _282 * _310;
    bool _316 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_202);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _332 = -_282;
    float _334 = _332 + 1.0;
    float _336 = _238 * _304;
    float _338 = _244 * _264;
    float _340 = -_238;
    float _342 = _340 + 1.0;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    float _352 = _258 * _334;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _362 = _326 * _342;
    float _364 = fma(_346, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = fma(_350, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _368 = fma(_330, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _370 = fma(_356, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _372 = fma(_360, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _374 = _312 * _362;
    float _376 = -_326;
    float _378 = _376 + 1.0;
    float _380 = _364 * _362;
    float _382 = _366 * _362;
    float _384 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].x, _374);
    float _386 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].y, _380);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _388;
    float _392 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[143].z, _382);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _398;
    float _402 = fma(_368, _336, _384);
    float _404 = fma(_370, _336, _386);
    float _406 = fma(_390, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _408 = fma(_372, _336, _392);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _418 = fma(_396, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _420 = fma(_400, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _426 = fma(_406, _352, _402);
    float _428 = fma(_412, _288, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _430 = fma(_416, _288, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _432 = fma(_424, _288, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _434 = fma(_418, _352, _404);
    float _436 = fma(_420, _352, _408);
    float _438 = fma(_428, _314, _426);
    float _440 = fma(_430, _314, _434);
    float _442 = fma(_432, _314, _436);
    float _444 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].x, _438);
    float _446 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].y, _440);
    float _448 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[147].z, _442);
    bool _450 = !_260;
    float _468;
    if (!_450)
    {
        float _452 = in.m_53.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = _466;
        _470 = true;
    }
    else
    {
        _468 = _156;
    }
    _470 = false;
    float _472 = _468;
    float _474 = in.m_55.x;
    float _476 = in.m_55.y;
    float _478 = in.m_55.z;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _496 = 1.0 / _482;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _498;
    float _502 = 1.0 / _486;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = _472 + _504;
    float _508 = _446 * _476;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _512 = _472 + _510;
    float _514 = 1.0 / _490;
    float _516 = _506 * _496;
    float _518 = _448 * _478;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _522 = _472 + _520;
    bool _524 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _526 = isnan(_472);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _538 = _472 + _536;
    bool _540 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _542 = isnan(_472);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = _444 * _474;
    float _554 = 1.0 / _494;
    float _556 = _512 * _502;
    bool _558 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _560 = isnan(_472);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _572 = _472 + _570;
    bool _574 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _576 = isnan(_472);
    bool _578 = _574 || _576;
    bool _580 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    bool _586 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _588 = -_568;
    float _590 = _588 + 1.0;
    float _592 = 1.0 / _500;
    float _594 = _522 * _514;
    bool _596 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _598 = isnan(_472);
    bool _600 = _596 || _598;
    bool _602 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _604 = _600 || _602;
    float _606 = float(_604);
    float _608 = _534 * _590;
    float _610 = -_534;
    float _612 = _610 + 1.0;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _614;
    float _618 = -_584;
    float _620 = _618 + 1.0;
    float _622 = _572 * _554;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _628;
    float _632 = _606 * _612;
    float _634 = fma(_616, _516, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _636 = fma(_626, _516, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _638 = fma(_630, _516, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _640 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _642 = isnan(_472);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = _538 * _592;
    float _654 = -_606;
    float _656 = _654 + 1.0;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _662 = _550 * _620;
    float _664 = -_550;
    float _666 = _664 + 1.0;
    float _668 = _584 * _656;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _678 = _650 * _666;
    float _680 = fma(_660, _556, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _682 = fma(_672, _556, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _684 = fma(_676, _556, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _686 = _634 * _678;
    float _688 = -_650;
    float _690 = _688 + 1.0;
    float _692 = _636 * _678;
    float _694 = _638 * _678;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _696;
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[107].x, _686);
    float _702 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[107].y, _692);
    float _704 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[107].z, _694);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _708 = _706 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _710;
    float _714 = fma(_698, _594, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _716 = fma(_682, _662, _700);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _718;
    float _722 = fma(_708, _622, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _724 = fma(_712, _594, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _730 = fma(_714, _668, _716);
    float _732 = fma(_720, _594, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _734 = fma(_684, _662, _704);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _740 = fma(_680, _662, _702);
    float _742 = fma(_728, _622, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _744 = fma(_732, _668, _734);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _746;
    float _750 = fma(_738, _622, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _752 = fma(_724, _668, _740);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _758;
    float _762 = fma(_722, _632, _730);
    float _764 = fma(_748, _652, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _766 = fma(_756, _652, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _768 = fma(_760, _652, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _770 = fma(_742, _632, _752);
    float _772 = fma(_750, _632, _744);
    float _774 = fma(_764, _608, _762);
    float _776 = fma(_766, _608, _770);
    float _778 = fma(_768, _608, _772);
    float _780 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[112].x, _774);
    float _782 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[112].y, _776);
    float _784 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[112].z, _778);
    bool _786 = !_586;
    float _804;
    if (!_786)
    {
        float _788 = in.m_53.x;
        float _790 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _792 = _788 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _794 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _796 = _794 * _790;
        float _798 = floor(_796);
        float _800 = -_798;
        float _802 = _796 + _800;
        _804 = _802;
        _806 = true;
    }
    else
    {
        _804 = _156;
    }
    _806 = false;
    float _808 = _804;
    bool _810 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _812 = isnan(_808);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _826 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _828 = isnan(_808);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _838;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _844 = _808 + _842;
    float _846 = -_820;
    float _848 = _846 + 1.0;
    bool _850 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _852 = 1.0 / _824;
    float _854 = _836 * _848;
    float _856 = -_836;
    float _858 = _856 + 1.0;
    float _860 = _840 * _852;
    float _862 = _782 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _864 = fma(_860, _844, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _866 = _780 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _868 = _864 * _854;
    float _870 = _784 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _872 = fma(_858, (*spvDescriptorSet0.vp_c9)._m0[115].x, _868);
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = _862 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _870 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _880 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[116].x, _872);
    float _882 = _880 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _884 = !_850;
    float _902;
    if (!_884)
    {
        float _886 = in.m_53.x;
        float _888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _890 = _886 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _892 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _894 = _892 * _888;
        float _896 = floor(_894);
        float _898 = -_896;
        float _900 = _894 + _898;
        _902 = _900;
        _904 = true;
    }
    else
    {
        _902 = _156;
    }
    _904 = false;
    float _906 = _902;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _910 = _906 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _914 = _906 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _918 = _906 + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _928 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _928;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _936 = 1.0 / _922;
    bool _938 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _940 = isnan(_906);
    bool _942 = _938 || _940;
    bool _944 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _946 = _942 || _944;
    float _948 = float(_946);
    float _950 = 1.0 / _926;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _954 = _906 + _952;
    float _956 = 1.0 / _930;
    float _958 = _910 * _936;
    bool _960 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _962 = isnan(_906);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    bool _972 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _974 = 1.0 / _934;
    float _976 = _914 * _950;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _978;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _982;
    float _986 = fma(_980, _958, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _988 = fma(_984, _958, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _990 = _918 * _956;
    float _992 = -_948;
    float _994 = _992 + 1.0;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _996;
    float _1000 = fma(_998, _958, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1002 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1004 = isnan(_906);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = _954 * _974;
    bool _1016 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1018 = isnan(_906);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = _970 * _994;
    float _1030 = -_970;
    float _1032 = _1030 + 1.0;
    bool _1034 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1036 = isnan(_906);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = -_1026;
    float _1048 = _1046 + 1.0;
    float _1050 = _1026 * _1032;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1060 = _1012 * _1048;
    float _1062 = -_1012;
    float _1064 = _1062 + 1.0;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1070 = fma(_1054, _976, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1072 = fma(_1058, _976, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1074 = _1044 * _1064;
    float _1076 = fma(_1068, _976, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1078 = _988 * _1074;
    float _1080 = _986 * _1074;
    float _1082 = -_1044;
    float _1084 = _1082 + 1.0;
    float _1086 = _1000 * _1074;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1096;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1080);
    float _1102 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1078);
    float _1104 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1086);
    float _1106 = fma(_1090, _990, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1108 = fma(_1094, _990, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1110 = fma(_1098, _990, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1112 = fma(_1070, _1060, _1100);
    float _1114 = fma(_1076, _1060, _1102);
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1124 = fma(_1072, _1060, _1104);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1130 = fma(_1106, _1050, _1112);
    float _1132 = fma(_1118, _1014, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1134 = fma(_1122, _1014, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1136 = fma(_1108, _1050, _1114);
    float _1138 = fma(_1128, _1014, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1140 = fma(_1110, _1050, _1124);
    float _1142 = fma(_1132, _1028, _1130);
    float _1144 = fma(_1134, _1028, _1136);
    float _1146 = fma(_1138, _1028, _1140);
    float _1148 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1142);
    float _1150 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1144);
    float _1152 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1146);
    bool _1154 = !_972;
    float _1172;
    if (!_1154)
    {
        float _1156 = in.m_53.x;
        float _1158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1160 = _1156 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1164 = _1162 * _1158;
        float _1166 = floor(_1164);
        float _1168 = -_1166;
        float _1170 = _1164 + _1168;
        _1172 = _1170;
        _1174 = true;
    }
    else
    {
        _1172 = _156;
    }
    _1174 = false;
    float _1176 = _1172;
    float _1178 = in.m_53.x;
    float _1180 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1182 = int(_1180);
    float _1184 = in.m_53.y;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1188 = in.m_42.x;
    float _1190 = in.m_42.y;
    float _1192 = in.m_42.z;
    float _1194 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1198 = _1196 != 0;
    float _1200 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1202 = in.m_53.z;
    float _1204 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1206 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1204);
    float _1208 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1214 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1216 = -_1186;
    float _1218 = fma(_1208, 2.0, _1216);
    float _1220 = _1178 * 2.0;
    float _1222 = _1184 * 2.0;
    float _1224 = fma(_1214, -2.0, _1194);
    float _1226 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1228 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1230 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1232 = floor(_1220);
    float _1234 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1236 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1226);
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1228);
    float _1240 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1230);
    float _1242 = _1178 + _1184;
    float _1244 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1234);
    float _1246 = _1202 * 2.0;
    float _1248 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1236);
    float _1250 = _1242 + (-1.0);
    float _1252 = _1184 + _1202;
    float _1254 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1256 = log2(_1254);
    float _1258 = _1178 + _1202;
    float _1260 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1238);
    float _1262 = _1252 + (-1.0);
    float _1264 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1240);
    bool _1266 = _1232 > 0.0;
    float _1268 = _1258 + (-1.0);
    bool _1270 = _1232 >= 0.0;
    bool _1272 = isnan(_1232);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan(0.0);
    bool _1278 = _1274 || _1276;
    float _1280 = floor(_1246);
    float _1282 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1284 = _1262;
    float _1286 = _1238;
    if (!_1198)
    {
        _1284 = _1202;
    }
    float _1288 = _1284;
    float _1290 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1292 = _1288;
    if (_1198)
    {
        _1292 = _1184;
    }
    float _1294 = _1292;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1298 = -_100;
    float _1300 = fma(_1298, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1218);
    float _1302 = floor(_1222);
    float _1304 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1210);
    float _1306 = _1294;
    if (!_1198)
    {
        _1306 = _1202;
    }
    float _1308 = _1306;
    float _1310 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1312 = _1308;
    if (_1198)
    {
        _1312 = _1184;
    }
    float _1314 = _1312;
    float _1316 = _1256 * _100;
    if (!_1198)
    {
        _1286 = _1184;
    }
    float _1318 = _1286;
    float _1320 = _1264 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1322 = _1280 > 0.0;
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1326 = _1318;
    if (_1198)
    {
        _1326 = _1178;
    }
    float _1328 = _1326;
    float _1330 = exp2(_1316);
    bool _1332 = _1280 >= 0.0;
    bool _1334 = isnan(_1280);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = fma(_1324, -2.0, _1212);
    float _1344 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1310);
    float _1346 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1348 = _1340 ? 0 : 1;
    float _1350 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1244);
    float _1352 = -_1296;
    float _1354 = fma(_1346, 2.0, _1352);
    float _1356 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1358 = int(_1356);
    int _1360 = ~_1348;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    float _1366 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1206);
    bool _1368 = _1302 >= 0.0;
    bool _1370 = isnan(_1302);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    int _1378 = _1364;
    if (!_1322)
    {
        int _1380 = ~_1348;
        int _1382 = _1380 + 1;
        _1378 = _1382;
    }
    int _1384 = _1378;
    float _1386 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1388 = _1302 > 0.0;
    float _1390 = rsqrt(_1366);
    int _1392 = _1278 ? 0 : 1;
    bool _1394 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1396 = isnan(0.0);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1402 = _1398 || _1400;
    int _1404 = _1376 ? 0 : 1;
    int _1406 = ~_1392;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    float _1412 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1414 = 1.0 + _1412;
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1418 = _1416 != 0;
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1422 = _1420 != 0;
    int _1424 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1426 = _1424 != 0;
    int _1428 = _1410;
    if (!_1266)
    {
        int _1430 = ~_1392;
        int _1432 = _1430 + 1;
        _1428 = _1432;
    }
    int _1434 = _1428;
    float _1436 = 1.0 / _1414;
    bool _1438 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1440 = isnan(1.0);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1446 = _1442 || _1444;
    bool _1448 = !_1422;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1454 = !_1418;
    int _1456 = _1454 ? 0 : 1;
    bool _1458 = !_1426;
    int _1460 = _1458 ? 0 : 1;
    float _1462 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1452);
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1470 = _1468 != 0;
    int _1472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1474 = _1472 != 0;
    float _1476 = -_1330;
    float _1478 = _1476 + 1.0;
    float _1480 = float(_1358);
    float _1482 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1224);
    int _1484 = ~_1404;
    int _1486 = _1484 + 1;
    int _1488 = _1486 + 1;
    int _1490 = _1488;
    if (!_1388)
    {
        int _1492 = ~_1404;
        int _1494 = _1492 + 1;
        _1490 = _1494;
    }
    int _1496 = _1490;
    float _1498 = in.m_57.x;
    float _1500 = in.m_57.y;
    float _1502 = in.m_57.z;
    bool _1504 = !_1466;
    int _1506 = _1504 ? 0 : 1;
    float _1508 = 1.0 / _1480;
    bool _1510 = !_1470;
    int _1512 = _1510 ? 0 : 1;
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1516 = abs(_1506);
    float _1518 = -_100;
    float _1520 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1354);
    int _1522 = abs(_1512);
    float _1524 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1304);
    float _1526 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1514);
    float _1528 = float(_1434);
    float _1530 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1342);
    float _1532 = float(_1522);
    float _1534 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1526);
    float _1536 = float(_1516);
    float _1538 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1462);
    float _1540 = float(_1384);
    float _1542 = _1532 * _1528;
    bool _1544 = !_1474;
    int _1546 = _1544 ? 0 : 1;
    float _1548 = _1508 * _100;
    float _1550 = float(_1182);
    float _1552 = _1536 * _1540;
    float _1554 = _1402 ? _1478 : 0.0;
    float _1556 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1344);
    float _1558 = _1550 * _100;
    int _1560 = abs(_1546);
    float _1562 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1446)
    {
        float _1564 = _1554 * _1436;
        _110 = _1564;
    }
    float _1566 = _110;
    float _1568 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1568;
    float _1572 = _1552 * (-2.0);
    float _1574 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1576 = _1562 * _1562;
    float _1578 = _1178 + (-0.5);
    float _1580 = fma(_1572, _1498, _1498);
    float _1582 = fma(_1574, _1574, _1576);
    float _1584 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1586 = float(_1496);
    float _1588 = fma(_1386, _1572, _1386);
    float _1590 = float(_1560);
    float _1592 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1580);
    float _1594 = _1542 * (-2.0);
    float _1596 = fma(_1584, _1584, _1582);
    float _1598 = 1.0 / _1570;
    float _1600 = _1590 * _1586;
    float _1602 = fma(_1588, _1566, _1592);
    float _1604 = fma(_1282, _1594, _1282);
    float _1606 = fma(_1594, _1500, _1500);
    float _1608 = _1260 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1610 = in.m_59.x;
    float _1612 = in.m_59.y;
    float _1614 = in.m_59.z;
    float _1616 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1618 = _1602 * 0.15915493667125701904296875;
    float _1620 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1622 = _1184 + (-0.5);
    float _1624 = _1600 * (-2.0);
    float _1626 = rsqrt(_1596);
    float _1628 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1620);
    float _1630 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1606);
    float _1632 = fma(_1290, _1624, _1290);
    float _1634 = fma(_1624, _1502, _1502);
    float _1636 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1628);
    float _1638 = fma(_1604, _1566, _1630);
    float _1640 = _1350 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1642 = _1202 + (-0.5);
    float _1644 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1646 = _1638 * 0.15915493667125701904296875;
    float _1648 = _1618 * 6.283185482025146484375;
    float _1650 = sin(_1648);
    float _1652 = fma(_1642, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1634);
    float _1654 = -_1644;
    float _1656 = _1640 + _1654;
    float _1658 = fma(_1632, _1566, _1652);
    bool _1660 = _1644 >= _1640;
    bool _1662 = isnan(_1644);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan(_1640);
    bool _1668 = _1664 || _1666;
    float _1670 = _1574 * _1626;
    float _1672 = abs(_1656);
    float _1674 = precise::max(_1672, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1676 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1610);
    float _1678 = _1658 * 0.15915493667125701904296875;
    float _1680 = _1618 * 6.283185482025146484375;
    float _1682 = cos(_1680);
    float _1684 = precise::min(_1674, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1686 = _552 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1688 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1614);
    bool _1692 = !_1668;
    float _1694 = _1692 ? 1.0 : (-1.0);
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1698 = _1684 + _1696;
    float _1700 = _1686 * _1676;
    float _1702 = _1646 * 6.283185482025146484375;
    float _1704 = sin(_1702);
    float _1706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1612);
    float _1708 = _1698 * _1598;
    float _1710 = _1688 * _1690;
    float _1712 = _1562 * _1626;
    float _1714 = _1200 * _1706;
    float _1716 = _1694 * _1708;
    float _1718 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1720 = _1646 * 6.283185482025146484375;
    float _1722 = cos(_1720);
    float _1724 = _1584 * _1626;
    float _1726 = _1718 * _1716;
    float _1728 = _1726 * 0.15915493667125701904296875;
    float _1730 = _1678 * 6.283185482025146484375;
    float _1732 = cos(_1730);
    float _1734 = _1650 * _1704;
    float _1736 = _1682 * _1704;
    float _1738 = _1678 * 6.283185482025146484375;
    float _1740 = sin(_1738);
    float _1742 = _1650 * _1722;
    float _1744 = _1732 * _1714;
    float _1746 = _1682 * _1722;
    float _1748 = _1704 * _1732;
    float _1750 = _1722 * _1732;
    float _1752 = _1728 * 6.283185482025146484375;
    float _1754 = cos(_1752);
    float _1756 = _1682 * _1744;
    float _1758 = _1650 * _1744;
    float _1760 = fma(_1740, _1746, _1734);
    float _1762 = -_1736;
    float _1764 = fma(_1740, _1742, _1762);
    float _1766 = -_1714;
    float _1768 = _1740 * _1766;
    float _1770 = -_1742;
    float _1772 = fma(_1740, _1736, _1770);
    float _1774 = fma(_1760, _1700, _1756);
    float _1776 = _1728 * 6.283185482025146484375;
    float _1778 = sin(_1776);
    float _1780 = fma(_1750, _1700, _1768);
    float _1782 = fma(_1740, _1734, _1746);
    float _1784 = fma(_1772, _1710, _1774);
    float _1786 = fma(_1764, _1700, _1758);
    float _1788 = fma(_1748, _1710, _1780);
    float _1790 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1792 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1794 = _1784 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1796 = fma(_1782, _1710, _1786);
    float _1798 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1790);
    float _1800 = -_1754;
    float _1802 = _1800 + 1.0;
    float _1804 = _1724 * _1724;
    float _1806 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1792);
    float _1808 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1794);
    float _1810 = _1670 * _1778;
    float _1812 = _1712 * _1802;
    float _1814 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1798);
    float _1816 = _1712 * _1778;
    float _1818 = fma(_1802, _1804, _1754);
    float _1820 = _1724 * _1778;
    float _1822 = _1670 * _1802;
    float _1824 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1806);
    float _1826 = fma(_1724, _1812, _1810);
    float _1828 = _1814 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1830 = -_1820;
    float _1832 = fma(_1712, _1822, _1830);
    float _1834 = -_1816;
    float _1836 = fma(_1724, _1822, _1834);
    float _1838 = _1824 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1840 = _1828 * _1826;
    float _1842 = fma(_1796, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1808);
    float _1844 = fma(_1670, _1822, _1754);
    float _1846 = _1828 * _1832;
    float _1848 = fma(_1838, _1836, _1840);
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1852 = fma(_1724, _1822, _1816);
    float _1854 = fma(_1838, _1844, _1846);
    float _1856 = fma(_1712, _1812, _1754);
    float _1858 = fma(_1850, _1818, _1848);
    float _1860 = fma(_1712, _1822, _1820);
    float _1862 = fma(_1850, _1852, _1854);
    float _1864 = _1828 * _1856;
    float _1866 = _1320 + _1858;
    float _1868 = -_1810;
    float _1870 = fma(_1724, _1812, _1868);
    float _1872 = _1616 + _1862;
    float _1874 = fma(_1838, _1860, _1864);
    float _1876 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1878 = _1866 + _1876;
    float _1880 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1882 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1884 = _1872 + _1882;
    float _1886 = fma(_1850, _1870, _1874);
    float _1888 = _1878 * _1878;
    float _1890 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1880);
    float _1892 = _1608 + _1886;
    float _1894 = fma(_1884, _1884, _1888);
    float _1896 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1890);
    float _1898 = sqrt(_1894);
    bool _1900 = _1898 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1902 = _1890;
    float _1904 = _1812;
    float _1906 = _1870;
    float _1908 = _1898;
    if (!_1900)
    {
        _1902 = _1872;
    }
    float _1910 = _1902;
    float _1912 = _1910;
    if (!_1900)
    {
        _1904 = _1866;
    }
    float _1914 = _1904;
    float _1916 = _1914;
    if (!_1900)
    {
        _1906 = _1892;
    }
    float _1918 = _1906;
    bool _1920 = !_1900;
    float _1922 = _1918;
    if (!_1920)
    {
        float _1924 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1926 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1928 = _1898 + _1926;
        float _1930 = rsqrt(_1894);
        float _1932 = _1928 * _1924;
        float _1934 = _1892 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1936 = _1932 * 0.15915493667125701904296875;
        float _1938 = _1936 * 6.283185482025146484375;
        float _1940 = cos(_1938);
        float _1942 = _1936 * 6.283185482025146484375;
        float _1944 = sin(_1942);
        float _1946 = _1940 + (-1.0);
        float _1948 = fma(_1944, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1950 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1952 = _1930 * _1948;
        float _1954 = fma(_1892, _1940, _1950);
        float _1956 = fma(_1884, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1958 = fma(_1878, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1922 = _1954;
        _1912 = _1956;
        _1916 = _1958;
    }
    float _1960 = _1922;
    float _1962 = _1912;
    float _1964 = _1916;
    float _1966 = -_1608;
    float _1968 = _1966 + _1960;
    float _1970 = -_1616;
    float _1972 = _1970 + _1962;
    float _1974 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1976 = -_1320;
    float _1978 = _1976 + _1964;
    float _1980 = _1968 * _1968;
    float _1982 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1984 = 1.0 / _1974;
    float _1986 = fma(_1972, _1972, _1980);
    float _1988 = fma(_1616, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1982);
    float _1990 = fma(_1978, _1978, _1986);
    float _1992 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1988);
    float _1994 = sqrt(_1990);
    float _1996 = _1992 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1998 = _1996 + _1974;
    float _2000 = _1998 * _1984;
    float _2002 = _2000 * 0.5;
    bool _2004 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2008 = _2004 || _2006;
    bool _2010 = isnan(0.5);
    bool _2012 = _2008 || _2010;
    bool _2014 = _1994 > 0.0;
    float _2016 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2018 = fma(_2002, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2016);
    bool _2020 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2022 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2024 = _2020 || _2022;
    bool _2026 = isnan(0.5);
    bool _2028 = _2024 || _2026;
    float _2030 = 1.0 / _2018;
    bool _2032 = !_2014;
    float _2034 = _1964;
    float _2036 = _1962;
    float _2038 = _1960;
    float _2040 = _1978;
    float _2042 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2044 = _1990;
    float _2046 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_2032)
    {
        float _2048 = _172 * _172;
        float _2050 = rsqrt(_1990);
        float _2052 = fma(_170, _170, _2048);
        float _2054 = fma(_174, _174, _2052);
        float _2056 = sqrt(_2054);
        float _2058 = _1978 * _2050;
        bool _2060 = _2056 > 0.0;
        float _2062 = _1972 * _2050;
        float _2064 = _1968 * _2050;
        bool _2066 = !_2060;
        _2042 = _2054;
        _1908 = _2058;
        _2046 = _2050;
        if (!_2066)
        {
            float _2068 = rsqrt(_2054);
            float _2070 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2072 = _172 * _2068;
            float _2074 = _170 * _2068;
            float _2076 = _2064 * _2072;
            float _2078 = _174 * _2068;
            float _2080 = fma(_2062, _2074, _2076);
            float _2082 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2084 = fma(_2058, _2078, _2080);
            float _2086 = _2084 * _2082;
            float _2088 = fma(_170, _2086, _1962);
            float _2090 = fma(_172, _2086, _1960);
            float _2092 = fma(_174, _2086, _1964);
            _2034 = _2092;
            _2036 = _2088;
            _2038 = _2090;
            _2040 = _2086;
            _2042 = _2068;
            _2044 = _2070;
            _2046 = _2082;
        }
    }
    float _2094 = _2034;
    float _2096 = _2036;
    float _2098 = _2038;
    float _2100 = _2040;
    float _2102 = _2042;
    float _2104 = _1908;
    float _2106 = _2044;
    float _2108 = _2046;
    float _2110 = _2106;
    float _2112 = _2098;
    float _2114 = _2096;
    float _2116 = _2100;
    float _2118 = _2108;
    float _2120 = _2102;
    float _2122 = _2104;
    if (_2028)
    {
        _2110 = 1.0;
    }
    float _2124 = _2110;
    float _2126 = _2124;
    if (_2012)
    {
        _178 = _2094;
    }
    float _2128 = _178;
    float _2130 = _2128;
    if (!_2012)
    {
        float _2132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2134 = _1608 + _2132;
        float _2136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2138 = _1616 + _2136;
        float _2140 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2142 = -_1616;
        float _2144 = _2142 + _2096;
        float _2146 = _2134 * _2134;
        float _2148 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2150 = _1320 + _2148;
        float _2152 = -_1320;
        float _2154 = _2152 + _2094;
        float _2156 = fma(_2138, _2138, _2146);
        float _2158 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2160 = fma(_2150, _2150, _2156);
        float _2162 = sqrt(_2160);
        float _2164 = _2140 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2166 = precise::min(_2162, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2168 = _2166 * _2158;
        float _2170 = _2164 * _2168;
        float _2172 = -_1608;
        float _2174 = _2172 + _2098;
        float _2176 = fma(_2144, _2170, _1616);
        float _2178 = fma(_2174, _2170, _1608);
        float _2180 = fma(_2154, _2170, _1320);
        _180 = _2140;
        _2112 = _2178;
        _2114 = _2176;
        _2130 = _2180;
        _2116 = _2170;
    }
    float _2182 = _180;
    float _2184 = _2112;
    float _2186 = _2114;
    float _2188 = _2130;
    float _2190 = _2116;
    float _2192 = _2182;
    float _2194 = _2190;
    if (_2028)
    {
        _2118 = 1.0;
    }
    float _2196 = _2118;
    float _2198 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2200 = _2030 * _2198;
    float _2202 = _2196;
    if (!_2028)
    {
        float _2204 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2206 = _2204 * 0.15915493667125701904296875;
        float _2208 = _2206 * 6.283185482025146484375;
        float _2210 = cos(_2208);
        float _2212 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2214 = _2212 * 0.15915493667125701904296875;
        float _2216 = _2206 * 6.283185482025146484375;
        float _2218 = sin(_2216);
        float _2220 = 1.0 / _2210;
        float _2222 = _2214 * 6.283185482025146484375;
        float _2224 = cos(_2222);
        float _2226 = _2218 * _2220;
        float _2228 = _2214 * 6.283185482025146484375;
        float _2230 = sin(_2228);
        float _2232 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2234 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2232;
        float _2236 = _2224 * _2226;
        float _2238 = 1.0 / _2234;
        float _2240 = 1.0 / _2236;
        float _2242 = _2230 * _2240;
        float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2246 = fma(_2200, _2242, _2244);
        float _2248 = _2246 * _2238;
        float _2250 = precise::clamp(_2248, 0.0, 1.0);
        _2192 = _2214;
        _2194 = _2206;
        _2126 = _2250;
    }
    float _2252 = _2192;
    float _2254 = _2194;
    float _2256 = _2126;
    float _2258 = _2252;
    if (!_2028)
    {
        float _2260 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2262 = _2260 * 0.15915493667125701904296875;
        float _2264 = _2262 * 6.283185482025146484375;
        float _2266 = cos(_2264);
        float _2268 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2270 = _2268 * 0.15915493667125701904296875;
        float _2272 = _2262 * 6.283185482025146484375;
        float _2274 = sin(_2272);
        float _2276 = 1.0 / _2266;
        float _2278 = _2270 * 6.283185482025146484375;
        float _2280 = cos(_2278);
        float _2282 = _2274 * _2276;
        float _2284 = _2270 * 6.283185482025146484375;
        float _2286 = sin(_2284);
        float _2288 = _2280 * _2282;
        float _2290 = 1.0 / _2288;
        float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2294 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2292;
        float _2296 = 1.0 / _2294;
        float _2298 = _2286 * _2290;
        float _2300 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2302 = fma(_2200, _2298, _2300);
        float _2304 = _2302 * _2296;
        float _2306 = precise::clamp(_2304, 0.0, 1.0);
        float _2308 = -_2306;
        float _2310 = _2308 + 1.0;
        _2258 = _2276;
        _2202 = _2310;
    }
    float _2312 = _2258;
    float _2314 = _2202;
    float _2316 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2318 = _2184 + _2316;
    float _2320 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2322 = _2186 + _2320;
    float _2324 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2326 = _2188 + _2324;
    float _2328 = _2318 * _2318;
    float _2330 = fma(_2322, _2322, _2328);
    float _2332 = fma(_2326, _2326, _2330);
    float _2334 = rsqrt(_2332);
    float _2336 = sqrt(_2332);
    float _2338 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2340 = _2322 * _2338;
    float _2342 = _2326 * _2338;
    float _2344 = _2340 * _2340;
    float _2346 = _2342 * _2342;
    float _2348 = _2344 + _2346;
    float _2350 = sqrt(_2348);
    bool _2352 = _2350 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2356 = _2350 + _2354;
    float _2358 = _2312;
    float _2360 = _2348;
    float _2362 = _2356;
    float _2364 = _2318;
    float _2366 = _2342;
    float _2368 = _2344;
    float _2370 = _2346;
    if (_2352)
    {
        float _2372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2358 = _2372;
    }
    float _2374 = _2358;
    if (_2352)
    {
        float _2376 = rsqrt(_2348);
        _2360 = _2376;
    }
    float _2378 = _2360;
    if (_2352)
    {
        float _2380 = _2356 * _2374;
        _2362 = _2380;
    }
    float _2382 = _2362;
    if (_2352)
    {
        float _2384 = _2382 * 0.15915493667125701904296875;
        _2120 = _2384;
    }
    float _2386 = _2120;
    float _2388 = _2254;
    if (_2352)
    {
        float _2390 = _2386 * 6.283185482025146484375;
        float _2392 = sin(_2390);
        _2388 = _2392;
    }
    float _2394 = _2388;
    float _2396 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2398 = precise::max(0.0, _2396);
    float _2400 = _2374;
    float _2402 = _2398;
    if (_2352)
    {
        float _2404 = _2386 * 6.283185482025146484375;
        float _2406 = cos(_2404);
        _2400 = _2406;
    }
    float _2408 = _2400;
    float _2410 = -_2338;
    float _2412 = -_2398;
    float _2414 = fma(_2318, _2410, _2412);
    if (_2352)
    {
        float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2364 = _2416;
    }
    float _2418 = _2364;
    float _2420 = _2418;
    float _2422 = _2394;
    if (_2352)
    {
        float _2424 = fma(_2394, _2418, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2402 = _2424;
    }
    float _2426 = _2402;
    float _2428 = _2426;
    if (!_2352)
    {
        _2420 = _2340;
    }
    float _2430 = _2420;
    float _2432 = _2430;
    if (_2352)
    {
        float _2434 = _2408 + (-1.0);
        _2422 = _2434;
    }
    float _2436 = _2422;
    float _2438 = _2436;
    if (_2352)
    {
        float _2440 = _2378 * _2426;
        _2122 = _2440;
    }
    float _2442 = _2122;
    if (!_2352)
    {
        _2428 = _2414;
    }
    float _2444 = _2428;
    float _2446 = _2444;
    if (_2352)
    {
        float _2448 = _2436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2438 = _2448;
    }
    float _2450 = _2438;
    if (_2352)
    {
        float _2452 = _2340 * _2442;
        _2432 = _2452;
    }
    float _2454 = _2432;
    if (_2352)
    {
        float _2456 = _2342 * _2442;
        _2366 = _2456;
    }
    float _2458 = _2366;
    if (_2352)
    {
        float _2460 = fma(_2414, _2408, _2450);
        _2446 = _2460;
    }
    float _2462 = _2446;
    if (_2352)
    {
        float _2464 = _2454 * _2454;
        _2368 = _2464;
    }
    float _2466 = _2368;
    if (_2352)
    {
        float _2468 = _2458 * _2458;
        _2370 = _2468;
    }
    float _2470 = _2370;
    float _2472 = fma(_2462, _2462, _2466);
    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2476 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2474);
    float _2478 = precise::clamp(_2476, 0.0, 1.0);
    float _2480 = _2472 + _2470;
    float _2482 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2484 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2486 = -_2478;
    float _2488 = _2486 + 1.0;
    float _2490 = rsqrt(_2480);
    float _2492 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2482);
    float _2494 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2496 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2498 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2492);
    float _2500 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2484);
    float _2502 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2504 = abs(_2488);
    float _2506 = log2(_2504);
    float _2508 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2494);
    float _2510 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2500);
    float _2512 = fma(_2186, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2502);
    float _2514 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2516 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2508);
    float _2518 = _2510 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2520 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2512);
    float _2522 = _2490 * _2454;
    float _2524 = _2516 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2526 = _2490 * _2462;
    float _2528 = _2520 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2530 = _2522 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2532 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2534 = _2514 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2536 = _2490 * _2458;
    float _2538 = -_2530;
    float _2540 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2538);
    float _2542 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2532);
    float _2544 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2546 = -_2534;
    float _2548 = fma(_2546, _2496, 1.0);
    float _2550 = -_2536;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2540);
    float _2554 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2542);
    float _2556 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2558 = log2(_2548);
    float _2560 = fma(_2552, -0.5, 0.5);
    float _2562 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2554);
    float _2564 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2566 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2556);
    float _2568 = fma(_2552, 0.5, 0.5);
    float _2570 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2564);
    float _2572 = exp2(_2544);
    float _2574 = _2526 + 1.0;
    float _2576 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2566);
    float _2578 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2570);
    float _2580 = fma(_2568, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2582 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2578);
    float _2584 = 1.0 / _2562;
    float _2586 = fma(_2568, _2580, -0.212114393711090087890625);
    float _2588 = fma(_2568, _2586, 1.570728778839111328125);
    float _2590 = sqrt(_2560);
    float _2592 = -_2526;
    float _2594 = fma(_2572, _2574, _2592);
    float _2596 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2576);
    float _2598 = _2558 * 0.693147182464599609375;
    float _2600 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2602 = _2596 * _2584;
    float _2604 = _2582 * _2584;
    float _2606 = fma(_2602, 0.5, 0.5);
    float _2608 = fma(_2604, -0.5, 0.5);
    float _2610 = fma(_2594, 0.5, 0.5);
    float _2612 = _2590 * 0.636619746685028076171875;
    float _2614 = -_2588;
    float _2616 = fma(_2612, _2614, 1.0);
    float3 _7514 = float3(_2606, _2608, _2600);
    float _2618 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7514, float3(0.0), isnan(_7514)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7514, float3(0.0), isnan(_7514)), level(0.0)).x;
    float3 _7525 = float3(_2606, _2608, _2600);
    float4 _2621 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7525, float3(0.0), isnan(_7525)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7525, float3(0.0), isnan(_7525)), level(0.0)).xyzw;
    float _2623 = _2621.x;
    float _2625 = _2621.y;
    float _2627 = _2621.z;
    float _2629 = _2621.w;
    float2 _7542 = float2(_2616, _2610);
    float3 _2633 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7542, float2(0.0), isnan(_7542)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7542, float2(0.0), isnan(_7542)), level(0.0)).xyz;
    float _2635 = _2633.x;
    float _2637 = _2633.y;
    float _2639 = _2633.z;
    float _2641 = float(uint(_1182));
    float _2643 = trunc(_1548);
    int _2645 = int(_2643);
    int _2647 = ~_1182;
    int _2649 = _2647 + 1;
    float _2651 = _1558 * _152;
    int _2653 = ~_1182;
    int _2655 = _2653 + 1;
    out.m_61.x = _874;
    out.m_61.y = _876;
    out.m_61.z = _878;
    out.m_61.w = _882;
    int _2657 = _1182 + (-1);
    float _2659 = _2506 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2661 = abs(_1450);
    float _2663 = 1.0 / _2641;
    float _2665 = _2518 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2667 = fma(_2524, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2665);
    bool _2669 = !_1198;
    float _2671 = _2669 ? 7.345489978790283203125 : 1.0;
    float _2673 = float(uint(_2645));
    float _2675 = trunc(_2651);
    int _2677 = int(_2675);
    float _2679 = float(_2645);
    float _2681 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2667);
    float _2683 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2681);
    int _2685 = as_type<int>(_2663) + (-2);
    float _2687 = exp2(_2659);
    float _2689 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2689;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2697 = as_type<float>(_2685) * _2673;
    out.gl_Position.x = _2596;
    out.gl_Position.y = _2582;
    out.gl_Position.z = _2683;
    out.gl_Position.w = _2562;
    float _2699 = trunc(_2697);
    float _2701 = precise::max(_2699, 0.0);
    uint _2704 = uint(_2701);
    float _2706 = -_2687;
    float _2708 = _2706 + 1.0;
    int _2710 = _2649 * int(_2704);
    int _2712 = _2710 + _2645;
    float _2714 = float(uint(_2712));
    float _2716 = as_type<float>(_2685) * _2714;
    float _2718 = _2671 * _1178;
    bool _2720 = _2679 >= _1550;
    bool _2722 = isnan(_2679);
    bool _2724 = _2720 || _2722;
    bool _2726 = isnan(_1550);
    bool _2728 = _2724 || _2726;
    float _2730 = float(_2728);
    float _2732 = floor(_2718);
    float _2734 = trunc(_2716);
    float _2736 = precise::max(_2734, 0.0);
    uint _2738 = uint(_2736);
    float _2740 = trunc(_2730);
    int _2742 = int(_2740);
    float _2744 = -_2732;
    float _2746 = _2718 + _2744;
    int _2748 = int(_2704) + int(_2738);
    int _2750 = _2655 * _2748;
    int _2752 = _2750 + _2645;
    int _2754 = ~_2742;
    int _2756 = _2754 + 1;
    int _2758 = _2756 + 1;
    bool _2760 = uint(_2752) >= uint(_1182);
    bool _2762 = !_2760;
    int _2764 = _2762 ? 0 : (-1);
    bool _2766 = _1182 == 0;
    int _2768 = ~_2748;
    int _2770 = _2768 + _2764;
    int _2772 = _2770 + 1;
    float _2774 = _2746 * _1550;
    int _2776 = _1182 * _2772;
    int _2778 = _2776 + _2645;
    int _2780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2782 = _2780 != 0;
    float _2784 = trunc(_2774);
    int _2786 = int(_2784);
    int _2788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2790 = _2788 != 0;
    bool _2792 = !_2766;
    int _2794 = _2792 ? _2778 : (-1);
    bool _2796 = !_2782;
    int _2798 = _2796 ? 0 : 1;
    int _2800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2802 = _2800 != 0;
    int _2804 = _2794 * _2758;
    int _2806 = abs(_2798);
    int _2808 = abs(_1456);
    int _2810 = _2742 * _2657;
    int _2812 = _2810 + _2804;
    int _2814 = abs(_1460);
    int _2816 = _2812 * _2661;
    bool _2818 = !_2802;
    int _2820 = _2818 ? 0 : 1;
    int _2822 = _2786 * _2806;
    int _2824 = _2822 + _2645;
    int _2826 = abs(_2820);
    int _2828 = _2677 * _2808;
    int _2830 = _2828 + _2816;
    int _2832 = _2824 * _2814;
    int _2834 = _2832 + _2830;
    float _2836 = in.m_53.w;
    int _2838 = _2786 * _2826;
    int _2840 = _2838 + _2834;
    float _2842 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2844 = _2842 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2846 = in.m_63.y;
    int _2848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2850 = _2848 != 0;
    float _2852 = float(uint(_2840));
    float _2854 = 1.0 / _2844;
    int _2856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2858 = _2856 != 0;
    float _2860 = as_type<float>(_2685) * _2852;
    int _2862 = ~_1182;
    int _2864 = _2862 + 1;
    int _2866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2868 = _2866 != 0;
    int _2870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2872 = _2870 != 0;
    float _2874 = trunc(_2860);
    float _2876 = precise::max(_2874, 0.0);
    uint _2878 = uint(_2876);
    bool _2880 = _2836 > 0.5;
    float _2882 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2884 = _2882 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2888 = _2864 * int(_2878);
    int _2890 = _2888 + _2840;
    float _2892 = 1.0 / _2884;
    float _2894 = float(uint(_2890));
    float _2896 = _2886 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2898 = as_type<float>(_2685) * _2894;
    float _2900 = -_2846;
    float _2902 = _2900 + 1.0;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2904 = trunc(_2898);
    float _2906 = precise::max(_2904, 0.0);
    uint _2908 = uint(_2906);
    int _2910 = _2880 ? as_type<int>(_2902) : as_type<int>(_2846);
    float _2912 = _2695 * _2892;
    bool _2914 = _1184 > 0.5;
    int _2916 = ~_1182;
    int _2918 = _2916 + 1;
    float _2920 = _2858 ? as_type<float>(_2910) : _2846;
    float _2922 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2924 = _2922 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2926 = _2691 * _2854;
    float _2928 = _2846;
    bool _2930 = _2858;
    bool _2932 = _2790;
    int _2934 = as_type<int>(_2774);
    if (_2790)
    {
        float _2936 = _2914 ? _2902 : _2846;
        _2928 = _2936;
    }
    float _2938 = _2928;
    float _2940 = 1.0 / _2924;
    if (_2850)
    {
        bool _2942 = _1178 > 0.5;
        _2930 = _2942;
    }
    bool _2944 = _2930;
    float _2946 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2948 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2946;
    int _2950 = int(_2878) + int(_2908);
    float _2952 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2954 = _1176 + _2952;
    float _2956 = float(uint(_2824));
    float _2958 = fma(_2920, _2896, -0.5);
    if (_2868)
    {
        bool _2960 = _1202 > 0.5;
        _2932 = _2960;
    }
    bool _2962 = _2932;
    int _2964 = _2918 * _2950;
    int _2966 = _2964 + _2840;
    float _2968 = fma(_2926, _2954, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2970 = as_type<float>(_2685) * _2956;
    float _2972 = in.m_63.x;
    float _2974 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2938, -0.5);
    bool _2976 = uint(_2966) >= uint(_1182);
    float _2978 = trunc(_2970);
    float _2980 = precise::max(_2978, 0.0);
    uint _2982 = uint(_2980);
    int _2984 = ~_1182;
    int _2986 = _2984 + 1;
    float _2988 = _2948 * _2940;
    bool _2990 = !_2976;
    int _2992 = _2990 ? 0 : (-1);
    float _2994 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2996 = _1176 + _2994;
    float _2998 = -_1530;
    float _3000 = fma(_1524, _2958, _2998);
    int _3002 = ~_1182;
    int _3004 = _3002 + 1;
    float _3006 = -_1482;
    float _3008 = fma(_1538, _2974, _3006);
    int _3010 = ~_2950;
    int _3012 = _3010 + _2992;
    int _3014 = _3012 + 1;
    float _3016 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3018 = _1176 + _3016;
    bool _3020 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3022 = isnan(_1176);
    bool _3024 = _3020 || _3022;
    bool _3026 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3028 = _3024 || _3026;
    float _3030 = float(_3028);
    float _3032 = fma(_2912, _2996, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3034 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3036 = isnan(_1176);
    bool _3038 = _3034 || _3036;
    bool _3040 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3042 = _3038 || _3040;
    float _3044 = float(_3042);
    int _3046 = _1182 * _3014;
    int _3048 = _3046 + _2840;
    float _3050 = fma(_2988, _3018, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _3052 = -_3030;
    float _3054 = _3052 + 1.0;
    bool _3056 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3058 = isnan(_1176);
    bool _3060 = _3056 || _3058;
    bool _3062 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3064 = _3060 || _3062;
    float _3066 = float(_3064);
    int _3068 = _2986 * int(_2982);
    int _3070 = _3068 + _2824;
    bool _3072 = !_2766;
    int _3074 = _3072 ? _3048 : (-1);
    float _3076 = _3044 * _3054;
    float _3078 = -_3044;
    float _3080 = _3078 + 1.0;
    bool _3082 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3084 = isnan(_1176);
    bool _3086 = _3082 || _3084;
    bool _3088 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3090 = _3086 || _3088;
    float _3092 = float(_3090);
    if (_2868)
    {
        float _3094 = -_2972;
        float _3096 = _3094 + 1.0;
        _2934 = as_type<int>(_3096);
    }
    int _3098 = _2934;
    int _3100 = _3074 >> 31;
    float _3102 = float(uint(_3070));
    float _3104 = _3066 * _3080;
    int _3106 = _3100 & 3;
    float _3108 = -_3066;
    float _3110 = _3108 + 1.0;
    float _3112 = as_type<float>(_2685) * _3102;
    int _3114 = _3074 + _3106;
    float _3116 = _3092 * _3110;
    float _3118 = -_3092;
    float _3120 = _3118 + 1.0;
    float _3122 = trunc(_3112);
    float _3124 = precise::max(_3122, 0.0);
    uint _3126 = uint(_3124);
    int _3128 = _3114 >> 2;
    float _3130 = _2968 * _3116;
    float _3132 = as_type<float>(_3106);
    float _3134 = as_type<float>(_3128);
    int _3136 = as_type<int>(_3112);
    if (!_2850)
    {
        _3132 = _2972;
    }
    float _3138 = _3132;
    int _3140 = _3128 << 4;
    int _3142 = _3140 + 368;
    float _3144 = fma(_3120, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3130);
    float _3146 = _3138;
    if (!_2868)
    {
        _3134 = _2972;
    }
    float _3148 = _3134;
    float _3150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3152 = uint(int(uint(_3142) >> uint(2)));
    uint _3154 = uint(int(uint(int(_3152)) >> uint(2)));
    int _3156 = int(_3152) & 3;
    float _3158 = (*spvDescriptorSet0.vp_c9)._m0[int(_3154)][_3156];
    int _3160 = int(_3152) + 1;
    uint _3162 = uint(int(uint(_3160) >> uint(2)));
    int _3164 = _3160 & 3;
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[int(_3162)][_3164];
    float _3168 = _3148;
    if (_2850)
    {
        float _3170 = -_2972;
        float _3172 = _3170 + 1.0;
        _3136 = as_type<int>(_3172);
    }
    int _3174 = _3136;
    if (_2868)
    {
        float _3176 = _2962 ? as_type<float>(_3098) : _2972;
        _3168 = _3176;
    }
    float _3178 = _3168;
    float _3180 = fma(_3032, _3104, _3144);
    int _3182 = _3074 & 3;
    bool _3184 = _3182 != 0;
    if (_2850)
    {
        float _3186 = _2944 ? as_type<float>(_3174) : _2972;
        _3146 = _3186;
    }
    float _3188 = _3146;
    float _3190 = fma(_3050, _3076, _3180);
    int _3192 = _3142 + 8;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c9)._m0[int(_3204)][_3206];
    int _3210 = _3074 & 3;
    bool _3212 = _3210 != 0;
    bool _3214 = uint(_3182) > 1u;
    float _3216 = fma(_3188, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3218 = _3150 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3220 = _3212 ? 0 : 1;
    bool _3222 = _3182 != 3;
    float _3224 = fma(_3218, _3178, -0.5);
    int _3226 = int(_2982) + int(_3126);
    float _3228 = fma(_1534, _3216, _1300);
    bool _3230 = uint(_3182) >= 2u;
    float _3232 = fma(_1556, _3224, _1520);
    int _3234 = _3004 * _3226;
    int _3236 = _3234 + _2824;
    int _3238 = ~_3220;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    float _3244 = _3232 + 0.5;
    int _3246 = _3230 ? 0 : 1;
    int _3248 = _3242;
    if (!_3214)
    {
        int _3250 = ~_3220;
        int _3252 = _3250 + 1;
        _3248 = _3252;
    }
    int _3254 = _3248;
    bool _3256 = uint(_3236) >= uint(_1182);
    bool _3258 = !_3184;
    int _3260 = _3258 ? 0 : 1;
    int _3262 = ~_3246;
    int _3264 = _3262 + 1;
    int _3266 = _3264 + 1;
    int _3268 = abs(_3254);
    bool _3270 = _3182 != 3;
    int _3272 = _3266;
    if (_3222)
    {
        int _3274 = ~_3246;
        int _3276 = _3274 + 1;
        _3272 = _3276;
    }
    int _3278 = _3272;
    int _3280 = abs(_3260);
    bool _3282 = !_3270;
    int _3284 = _3282 ? 0 : (-1);
    int _3286 = ~_3268;
    int _3288 = _3286 + 1;
    int _3290 = _3288 + 1;
    int _3292 = abs(_3278);
    int _3294 = abs(_3284);
    int _3296 = _3290 * as_type<int>(_3166);
    int _3298 = ~_3280;
    int _3300 = _3298 + 1;
    int _3302 = _3300 + 1;
    bool _3304 = !_2872;
    int _3306 = _3304 ? 0 : 1;
    int _3308 = _3302 * as_type<int>(_3158);
    int _3310 = _3308 + _3296;
    int _3312 = ~_3292;
    int _3314 = _3312 + 1;
    int _3316 = _3314 + 1;
    bool _3318 = !_3256;
    int _3320 = _3318 ? 0 : (-1);
    int _3322 = abs(_3306);
    int _3324 = _3316 * as_type<int>(_3200);
    int _3326 = _3324 + _3310;
    int _3328 = ~_3294;
    int _3330 = _3328 + 1;
    int _3332 = _3330 + 1;
    float _3334 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3336 = ~_3226;
    int _3338 = _3336 + _3320;
    int _3340 = _3338 + 1;
    int _3342 = ~_3322;
    int _3344 = _3342 + 1;
    int _3346 = _3344 + 1;
    int _3348 = _3332 * as_type<int>(_3208);
    int _3350 = _3348 + _3326;
    float _3352 = fma(_3030, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3190);
    int _3354 = _1182 * _3340;
    int _3356 = _3354 + _2824;
    float _3358 = _3008 + 0.5;
    float _3360 = _3000 + 0.5;
    float _3362 = _3228 + 0.5;
    int _3364 = _3350 * _3346;
    float _3366 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3368 = !_2766;
    int _3370 = _3368 ? _3356 : (-1);
    float _3372 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3374 = _2256 * _2314;
    out.m_67.x = _3362;
    out.m_67.y = _3358;
    out.m_67.z = _3244;
    out.m_67.w = _3360;
    float _3376 = _3366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3378 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3380 = _3334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3382 = _3352 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3384 = _3370 * _3322;
    int _3386 = _3384 + _3364;
    bool _3388 = _2256 > 0.0;
    bool _3390 = isnan(_2256);
    bool _3392 = _3388 || _3390;
    bool _3394 = isnan(0.0);
    bool _3396 = _3392 || _3394;
    float _3398 = _3374 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _3376;
    out.m_69.y = _3378;
    out.m_69.z = _3380;
    out.m_69.w = _3382;
    bool _3400 = _2314 <= 0.0;
    bool _3402 = !_3396;
    bool _3404 = _3400 || _3402;
    float _3406 = _3398 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3408 = float(_3386);
    float _3410 = _2683 + _2562;
    float _3412 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3406;
    float _3414 = _3410 * 0.5;
    float _3416 = _3412 * _2618;
    out.m_71.x = _3408;
    float _3418 = _2639 * _3416;
    float _3420 = _2629 * _3416;
    float _3422 = -_3412;
    float _3424 = _3422 + 1.0;
    out.m_73.z = _3414;
    out.m_73.w = _2562;
    float _3426 = fma(_2635, _3420, _2623);
    float _3428 = fma(_2637, _3420, _2625);
    float _3430 = _2629 * _3424;
    float _3432 = fma(_2629, _3418, _2627);
    out.m_75.x = _3426;
    out.m_75.y = _3428;
    out.m_75.z = _3432;
    out.m_75.w = _3430;
    if (!_3404)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3434;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

