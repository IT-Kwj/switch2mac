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
    float4 m_57 [[user(locn0)]];
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
    float4 m_59 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_61 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _794 = false;
    bool _696 = false;
    bool _360 = false;
    bool _198 = false;
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
        float _3155 = as_type<float>(_118);
        out.gl_Position.z = _3155;
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
        float _3210 = as_type<float>(_144);
        out.gl_Position.z = _3210;
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
    float _178 = _156;
    float _196;
    if (!_176)
    {
        float _180 = in.m_53.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        _196 = _156;
    }
    _198 = false;
    float _200 = _196;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = _200 + _202;
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _200 + _218;
    bool _222 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_200);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _242 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_200);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = 1.0 / _240;
    float _256 = -_252;
    float _258 = _256 + 1.0;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _232 * _258;
    float _264 = -_232;
    float _266 = _264 + 1.0;
    float _268 = 1.0 / _236;
    float _270 = _220 * _254;
    float _272 = _204 * _268;
    float _274 = -_216;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _252 * _276;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = fma(_280, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = fma(_286, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _296 = fma(_290, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = _292 * _262;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = _294 * _262;
    float _306 = _296 * _262;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _316 = fma(_302, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _304);
    float _320 = fma(_310, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _322 = fma(_314, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _324 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _326 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _328 = fma(_320, _282, _318);
    float _330 = fma(_316, _282, _324);
    float _332 = fma(_322, _282, _326);
    float _334 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].x, _328);
    float _336 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].y, _330);
    float _338 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].z, _332);
    bool _340 = !_260;
    float _358;
    if (!_340)
    {
        float _342 = in.m_53.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        _358 = _156;
    }
    _360 = false;
    float _362 = _358;
    float _364 = in.m_55.x;
    float _366 = in.m_55.y;
    float _368 = in.m_55.z;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _386 = 1.0 / _372;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _388;
    float _392 = 1.0 / _376;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _396 = _362 + _394;
    bool _398 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _400 = isnan(_362);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    bool _410 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _412 = isnan(_362);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _338 * _368;
    float _424 = _336 * _366;
    float _426 = 1.0 / _380;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _430 = _362 + _428;
    float _432 = _396 * _386;
    bool _434 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _436 = isnan(_362);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _448 = _362 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _452 = _362 + _450;
    bool _454 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _456 = isnan(_362);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -_408;
    float _468 = _466 + 1.0;
    float _470 = 1.0 / _384;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _474 = _362 + _472;
    float _476 = _430 * _392;
    bool _478 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _480 = isnan(_362);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -_444;
    float _492 = _490 + 1.0;
    float _494 = -_420;
    float _496 = _494 + 1.0;
    float _498 = _464 * _468;
    float _500 = -_464;
    float _502 = _500 + 1.0;
    float _504 = 1.0 / _390;
    float _506 = _448 * _426;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _508;
    float _512 = _488 * _492;
    float _514 = -_488;
    float _516 = _514 + 1.0;
    float _518 = fma(_510, _432, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _520 = _474 * _470;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _522;
    float _526 = _420 * _516;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _532 = fma(_524, _432, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _534 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _536 = fma(_530, _476, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _538 = _452 * _504;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _540;
    float _544 = _334 * _364;
    float _546 = fma(_542, _432, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _548 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _550 = isnan(_362);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _408 * _496;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = _558 * _502;
    float _572 = fma(_564, _476, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _574 = fma(_568, _476, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _576;
    float _580 = _532 * _570;
    float _582 = _546 * _570;
    float _584 = _518 * _570;
    float _586 = -_558;
    float _588 = _586 + 1.0;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _594;
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].x, _580);
    float _600 = fma(_592, _506, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _606 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].y, _582);
    float _608 = fma(_572, _498, _598);
    float _610 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].z, _584);
    float _612 = fma(_596, _506, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _614 = fma(_604, _520, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _616 = fma(_600, _560, _608);
    float _618 = fma(_578, _506, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _620 = fma(_536, _498, _606);
    float _622 = fma(_574, _498, _610);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _632 = fma(_618, _560, _622);
    float _634 = fma(_626, _520, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _640;
    float _644 = fma(_630, _520, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _646 = fma(_612, _560, _620);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _648;
    float _652 = fma(_638, _538, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _654 = fma(_642, _538, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _656 = fma(_614, _526, _616);
    float _658 = fma(_650, _538, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _660 = fma(_634, _526, _646);
    float _662 = fma(_644, _526, _632);
    float _664 = fma(_652, _512, _656);
    float _666 = fma(_654, _512, _660);
    float _668 = fma(_658, _512, _662);
    float _670 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[112].x, _664);
    float _672 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[112].y, _666);
    float _674 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[112].z, _668);
    bool _676 = !_534;
    float _694;
    if (!_676)
    {
        float _678 = in.m_53.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        _694 = _156;
    }
    _696 = false;
    float _698 = _694;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _702 = _698 + _700;
    bool _704 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _706 = isnan(_698);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _720 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _722 = isnan(_698);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _732;
    float _736 = _670 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _738 = -_714;
    float _740 = _738 + 1.0;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _744 = 1.0 / _718;
    float _746 = _730 * _740;
    float _748 = -_730;
    float _750 = _748 + 1.0;
    float _752 = _734 * _744;
    float _754 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _756 = fma(_752, _702, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _758 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _756 * _746;
    float _762 = _672 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[115].x, _760);
    float _766 = _762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _768 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[116].x, _764);
    float _770 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _772 = _768 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _770;
    out.m_57.y = _766;
    out.m_57.z = _758;
    out.m_57.w = _772;
    bool _774 = !_742;
    float _792;
    if (!_774)
    {
        float _776 = in.m_53.x;
        float _778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _780 = _776 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _784 = _782 * _778;
        float _786 = floor(_784);
        float _788 = -_786;
        float _790 = _784 + _788;
        _792 = _790;
        _794 = true;
    }
    else
    {
        _792 = _156;
    }
    _794 = false;
    float _796 = _792;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _800 = _796 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _804 = _796 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _808 = _796 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _826 = 1.0 / _812;
    bool _828 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _830 = isnan(_796);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = 1.0 / _824;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _844 = _796 + _842;
    bool _846 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _848 = isnan(_796);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    bool _858 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _860 = 1.0 / _820;
    float _862 = _800 * _826;
    bool _864 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _866 = isnan(_796);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = 1.0 / _816;
    float _878 = _844 * _840;
    bool _880 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _882 = isnan(_796);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -_874;
    float _894 = _892 + 1.0;
    float _896 = _890 * _894;
    float _898 = _804 * _860;
    bool _900 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _902 = isnan(_796);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = -_890;
    float _914 = _912 + 1.0;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _928 = _910 * _914;
    float _930 = fma(_918, _862, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _932 = _808 * _876;
    float _934 = -_910;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _950 = _838 * _936;
    float _952 = -_838;
    float _954 = _952 + 1.0;
    float _956 = fma(_940, _862, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _958 = fma(_922, _862, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _960 = fma(_926, _932, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _962 = _856 * _954;
    float _964 = fma(_944, _932, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _966 = fma(_948, _932, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _968 = -_856;
    float _970 = _968 + 1.0;
    float _972 = _930 * _962;
    float _974 = _956 * _962;
    float _976 = _958 * _962;
    float _978 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].x, _972);
    float _980 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].y, _974);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].z, _976);
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _992;
    float _996 = fma(_960, _950, _978);
    float _998 = fma(_966, _950, _982);
    float _1000 = fma(_986, _898, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1002 = fma(_990, _898, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1004 = fma(_964, _950, _980);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1014 = fma(_994, _898, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1020 = fma(_1000, _928, _996);
    float _1022 = fma(_1008, _878, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1024 = fma(_1012, _878, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1026 = fma(_1002, _928, _1004);
    float _1028 = fma(_1018, _878, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1030 = fma(_1014, _928, _998);
    float _1032 = fma(_1022, _896, _1020);
    float _1034 = fma(_1024, _896, _1026);
    float _1036 = fma(_1028, _896, _1030);
    float _1038 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1032);
    float _1040 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1034);
    float _1042 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1036);
    bool _1044 = !_858;
    if (!_1044)
    {
        float _1046 = in.m_53.x;
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1050 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1054 = _1052 * _1048;
        float _1056 = floor(_1054);
        float _1058 = -_1056;
        float _1060 = _1054 + _1058;
        _178 = _1060;
    }
    float _1062 = _178;
    float _1064 = in.m_53.x;
    float _1066 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1068 = log2(_1066);
    float _1070 = in.m_53.z;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1074 = _1072 != 0;
    float _1076 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1078 = in.m_53.y;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1090 = _1088 != 0;
    float _1092 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1094 = int(_1092);
    float _1096 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1100 = !_1086;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1106 = !_1082;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1112 = !_1090;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1118 = int(_1116);
    float _1120 = _1064 * 2.0;
    float _1122 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1126 = float(_1094);
    float _1128 = _1070 * 2.0;
    float _1130 = floor(_1120);
    float _1132 = -_1104;
    float _1134 = fma(_1122, 2.0, _1132);
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1138 = _1078 * 2.0;
    float _1140 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1142 = -_100;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1134);
    float _1146 = floor(_1128);
    float _1148 = _1064 + _1078;
    float _1150 = fma(_1140, -2.0, _1110);
    float _1152 = _1140;
    if (!_1074)
    {
        _1152 = _1070;
    }
    float _1154 = _1152;
    float _1156 = _1148 + (-1.0);
    float _1158 = _1154;
    float _1160 = _1156;
    if (_1074)
    {
        _1158 = _1078;
    }
    float _1162 = _1158;
    float _1164 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1150);
    bool _1166 = _1130 > 0.0;
    float _1168 = floor(_1138);
    bool _1170 = _1130 >= 0.0;
    bool _1172 = isnan(_1130);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1182 = _1162;
    if (!_1074)
    {
        _1160 = _1078;
    }
    float _1184 = _1160;
    bool _1186 = _1146 >= 0.0;
    bool _1188 = isnan(_1146);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan(0.0);
    bool _1194 = _1190 || _1192;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1198 = _1184;
    if (_1074)
    {
        _1198 = _1064;
    }
    float _1200 = _1198;
    float _1202 = 1.0 / _1126;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1214 = _1212 != 0;
    int _1216 = _1194 ? 0 : 1;
    float _1218 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1220 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1196);
    bool _1222 = !_1206;
    int _1224 = _1222 ? 0 : 1;
    bool _1226 = _1146 > 0.0;
    float _1228 = -_1124;
    float _1230 = fma(_1218, 2.0, _1228);
    int _1232 = ~_1216;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    int _1238 = _1178 ? 0 : 1;
    float _1240 = -_100;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1230);
    bool _1244 = _1168 > 0.0;
    float _1246 = _1202 * _100;
    bool _1248 = _1168 >= 0.0;
    bool _1250 = isnan(_1168);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan(0.0);
    bool _1256 = _1252 || _1254;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1260 = abs(_1224);
    int _1262 = _1236;
    if (!_1226)
    {
        int _1264 = ~_1216;
        int _1266 = _1264 + 1;
        _1262 = _1266;
    }
    int _1268 = _1262;
    float _1270 = _1068 * _100;
    int _1272 = _1256 ? 0 : 1;
    float _1274 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1258);
    if (!_1074)
    {
        _1182 = _1070;
    }
    float _1276 = _1182;
    float _1278 = _1276;
    if (_1074)
    {
        _1278 = _1078;
    }
    float _1280 = _1278;
    float _1282 = exp2(_1270);
    int _1284 = ~_1272;
    int _1286 = _1284 + 1;
    int _1288 = _1286 + 1;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1294 = float(_1268);
    float _1296 = fma(_1290, -2.0, _1136);
    int _1298 = _1288;
    if (!_1244)
    {
        int _1300 = ~_1272;
        int _1302 = _1300 + 1;
        _1298 = _1302;
    }
    int _1304 = _1298;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1308 = float(_1260);
    float _1310 = in.m_59.x;
    float _1312 = in.m_59.y;
    float _1314 = in.m_59.z;
    int _1316 = ~_1238;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1306);
    float _1324 = _1308 * _1294;
    float _1326 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1292);
    bool _1328 = !_1210;
    int _1330 = _1328 ? 0 : 1;
    float _1332 = -_1282;
    float _1334 = _1332 + 1.0;
    int _1336 = _1320;
    if (!_1166)
    {
        int _1338 = ~_1238;
        int _1340 = _1338 + 1;
        _1336 = _1340;
    }
    int _1342 = _1336;
    float _1344 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1326);
    bool _1346 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1354 = _1350 || _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1358 = 1.0 + _1356;
    int _1360 = abs(_1330);
    float _1362 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1322);
    float _1364 = _1354 ? _1334 : 0.0;
    float _1366 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1220);
    float _1368 = 1.0 / _1358;
    float _1370 = float(_1342);
    float _1372 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1296);
    float _1374 = float(_1360);
    float _1376 = _1324 * (-2.0);
    bool _1378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1380 = isnan(1.0);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1118);
    float _1390 = _1374 * _1370;
    float _1392 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1274);
    bool _1394 = !_1214;
    int _1396 = _1394 ? 0 : 1;
    float _1398 = fma(_1376, _1310, _1310);
    float _1400 = _1064 + (-0.5);
    float _1402 = fma(_1180, _1376, _1180);
    int _1404 = abs(_1396);
    float _1406 = _1078 + _1070;
    float _1408 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1398);
    float _1410 = float(_1304);
    float _1412 = _1390 * (-2.0);
    float _1414 = _1406 + (-1.0);
    float _1416 = _1388 * _100;
    float _1418 = float(_1404);
    if (_1386)
    {
        float _1420 = _1364 * _1368;
        _110 = _1420;
    }
    float _1422 = _110;
    float _1424 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1426 = _1418 * _1410;
    float _1428 = _1078 + (-0.5);
    float _1430 = fma(_1412, _1312, _1312);
    float _1432 = fma(_1424, _1412, _1424);
    float _1434 = _1064 + _1070;
    float _1436 = _1426 * (-2.0);
    float _1438 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1430);
    float _1440 = fma(_1402, _1422, _1408);
    float _1442 = in.m_61.x;
    float _1444 = in.m_61.y;
    float _1446 = in.m_61.z;
    float _1448 = _1434 + (-1.0);
    float _1450 = fma(_1432, _1422, _1438);
    float _1452 = _1440 * 0.15915493667125701904296875;
    float _1454 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1456 = fma(_1436, _1314, _1314);
    float _1458 = _1070 + (-0.5);
    float _1460 = _1450 * 0.15915493667125701904296875;
    float _1462 = fma(_1454, _1436, _1454);
    float _1464 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1456);
    float _1466 = _1452 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = fma(_1462, _1422, _1464);
    float _1472 = _1470 * 0.15915493667125701904296875;
    float _1474 = _1452 * 6.283185482025146484375;
    float _1476 = cos(_1474);
    float _1478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1442);
    float _1480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1444);
    float _1482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1446);
    float _1484 = _1460 * 6.283185482025146484375;
    float _1486 = sin(_1484);
    float _1488 = _1076 * _1480;
    float _1490 = _1096 * _1478;
    float _1492 = _1098 * _1482;
    float _1494 = _1460 * 6.283185482025146484375;
    float _1496 = cos(_1494);
    float _1498 = _1472 * 6.283185482025146484375;
    float _1500 = cos(_1498);
    float _1502 = in.m_42.x;
    float _1504 = in.m_42.y;
    float _1506 = in.m_42.z;
    float _1508 = _1468 * _1486;
    float _1510 = _1476 * _1486;
    float _1512 = _1472 * 6.283185482025146484375;
    float _1514 = sin(_1512);
    float _1516 = _1476 * _1496;
    float _1518 = _1496 * _1500;
    float _1520 = _1500 * _1488;
    float _1522 = _1468 * _1496;
    float _1524 = _1486 * _1500;
    float _1526 = _1476 * _1520;
    float _1528 = _1468 * _1520;
    float _1530 = fma(_1514, _1516, _1508);
    float _1532 = -_1510;
    float _1534 = fma(_1514, _1522, _1532);
    float _1536 = -_1488;
    float _1538 = _1514 * _1536;
    float _1540 = -_1522;
    float _1542 = fma(_1514, _1510, _1540);
    float _1544 = fma(_1530, _1490, _1526);
    float _1546 = fma(_1514, _1508, _1516);
    float _1548 = fma(_1518, _1490, _1538);
    float _1550 = fma(_1534, _1490, _1528);
    float _1552 = fma(_1542, _1492, _1544);
    float _1554 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1556 = fma(_1524, _1492, _1548);
    float _1558 = fma(_1546, _1492, _1550);
    float _1560 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1562 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1564 = fma(_1502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1554);
    float _1566 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1568 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1560);
    float _1570 = fma(_1502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1562);
    float _1572 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1564);
    float _1574 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1566);
    float _1576 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1568);
    float _1578 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1570);
    float _1580 = _1572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1582 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1574);
    float _1584 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1588 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1592 = _1580 + _1584;
    float _1594 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1596 = fma(_1502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1588);
    float _1598 = _1586 + _1590;
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1602 = _1592 + _1600;
    float _1604 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1594);
    float _1606 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1596);
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1610 = _1598 + _1608;
    float _1612 = _1602 * _1602;
    float _1614 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1604);
    float _1616 = _1606 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1618 = fma(_1610, _1610, _1612);
    float _1620 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1622 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1624 = sqrt(_1618);
    float _1626 = _1616 + _1620;
    float _1628 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1622);
    float _1630 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1628);
    bool _1632 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = _1628;
    float _1636 = _1502;
    float _1638 = _1506;
    float _1640 = _1490;
    if (!_1632)
    {
        _1634 = _1598;
    }
    float _1642 = _1634;
    float _1644 = _1642;
    if (!_1632)
    {
        _1636 = _1592;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    if (!_1632)
    {
        _1638 = _1626;
    }
    float _1650 = _1638;
    bool _1652 = !_1632;
    float _1654 = _1650;
    if (!_1652)
    {
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1660 = _1624 + _1658;
        float _1662 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1664 = rsqrt(_1618);
        float _1666 = _1660 * _1656;
        float _1668 = _1666 * 0.15915493667125701904296875;
        float _1670 = _1668 * 6.283185482025146484375;
        float _1672 = cos(_1670);
        float _1674 = _1668 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 + (-1.0);
        float _1680 = fma(_1676, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1682 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1684 = _1664 * _1680;
        float _1686 = fma(_1626, _1672, _1682);
        float _1688 = fma(_1610, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1690 = fma(_1602, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1654 = _1686;
        _1644 = _1688;
        _1648 = _1690;
    }
    float _1692 = _1654;
    float _1694 = _1644;
    float _1696 = _1648;
    float _1698 = -_1616;
    float _1700 = _1698 + _1692;
    float _1702 = -_1586;
    float _1704 = _1702 + _1694;
    float _1706 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1708 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1710 = _1700 * _1700;
    float _1712 = -_1580;
    float _1714 = _1712 + _1696;
    float _1716 = 1.0 / _1706;
    float _1718 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1708);
    float _1720 = fma(_1704, _1704, _1710);
    bool _1722 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1724 = isnan(0.5);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1730 = _1726 || _1728;
    float _1732 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1718);
    float _1734 = fma(_1714, _1714, _1720);
    float _1736 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1738 = sqrt(_1734);
    float _1740 = _1736 + _1706;
    float _1742 = _1706;
    float _1744 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1746 = _1694;
    float _1748 = _1696;
    float _1750 = _1714;
    if (_1730)
    {
        _1742 = 1.0;
    }
    float _1752 = _1742;
    float _1754 = _1740 * _1716;
    float _1756 = _1754 * 0.5;
    float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1760 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1758);
    float _1762 = 1.0 / _1760;
    bool _1764 = _1738 > 0.0;
    float _1766 = _1738;
    float _1768 = _1752;
    if (!_1764)
    {
        _1766 = _1692;
    }
    float _1770 = _1766;
    bool _1772 = !_1764;
    float _1774 = _1770;
    if (!_1772)
    {
        float _1776 = _172 * _172;
        float _1778 = fma(_170, _170, _1776);
        float _1780 = fma(_174, _174, _1778);
        float _1782 = rsqrt(_1734);
        float _1784 = sqrt(_1780);
        float _1786 = _1704 * _1782;
        float _1788 = _1700 * _1782;
        float _1790 = _1714 * _1782;
        bool _1792 = _1784 > 0.0;
        float _1794 = _1782;
        _1744 = _1784;
        if (!_1792)
        {
            _1794 = _1692;
        }
        float _1796 = _1794;
        bool _1798 = !_1792;
        _1774 = _1796;
        if (!_1798)
        {
            float _1800 = rsqrt(_1780);
            float _1802 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1804 = _172 * _1800;
            float _1806 = _170 * _1800;
            float _1808 = _174 * _1800;
            float _1810 = _1788 * _1804;
            float _1812 = fma(_1786, _1806, _1810);
            float _1814 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1816 = fma(_1790, _1808, _1812);
            float _1818 = _1816 * _1814;
            float _1820 = fma(_170, _1818, _1694);
            float _1822 = fma(_172, _1818, _1692);
            float _1824 = fma(_174, _1818, _1696);
            _1744 = _1806;
            _1774 = _1822;
            _1746 = _1820;
            _1748 = _1824;
            _1750 = _1818;
        }
    }
    float _1826 = _1744;
    float _1828 = _1774;
    float _1830 = _1746;
    float _1832 = _1748;
    float _1834 = _1750;
    float _1836 = _1834;
    float _1838 = _1826;
    if (_1730)
    {
        _1836 = 1.0;
    }
    float _1840 = _1836;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1844 = _1762 * _1842;
    float _1846 = _1840;
    if (!_1730)
    {
        float _1848 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1850 = _1848 * 0.15915493667125701904296875;
        float _1852 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1854 = _1850 * 6.283185482025146484375;
        float _1856 = cos(_1854);
        float _1858 = _1852 * 0.15915493667125701904296875;
        float _1860 = _1850 * 6.283185482025146484375;
        float _1862 = sin(_1860);
        float _1864 = 1.0 / _1856;
        float _1866 = _1858 * 6.283185482025146484375;
        float _1868 = cos(_1866);
        float _1870 = _1862 * _1864;
        float _1872 = _1858 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        float _1876 = _1868 * _1870;
        float _1878 = 1.0 / _1876;
        float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1882 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1880;
        float _1884 = 1.0 / _1882;
        float _1886 = _1874 * _1878;
        float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1890 = fma(_1844, _1886, _1888);
        float _1892 = _1890 * _1884;
        float _1894 = precise::clamp(_1892, 0.0, 1.0);
        _1838 = _1864;
        _1768 = _1894;
    }
    float _1896 = _1838;
    float _1898 = _1768;
    float _1900 = _1896;
    if (!_1730)
    {
        float _1902 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1904 = _1902 * 0.15915493667125701904296875;
        float _1906 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1908 = _1904 * 6.283185482025146484375;
        float _1910 = cos(_1908);
        float _1912 = _1906 * 0.15915493667125701904296875;
        float _1914 = _1904 * 6.283185482025146484375;
        float _1916 = sin(_1914);
        float _1918 = 1.0 / _1910;
        float _1920 = _1912 * 6.283185482025146484375;
        float _1922 = cos(_1920);
        float _1924 = _1916 * _1918;
        float _1926 = _1912 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        float _1930 = _1922 * _1924;
        float _1932 = 1.0 / _1930;
        float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1936 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1934;
        float _1938 = 1.0 / _1936;
        float _1940 = _1928 * _1932;
        float _1942 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1944 = fma(_1844, _1940, _1942);
        float _1946 = _1944 * _1938;
        float _1948 = precise::clamp(_1946, 0.0, 1.0);
        float _1950 = -_1948;
        float _1952 = _1950 + 1.0;
        _1900 = _1932;
        _1846 = _1952;
    }
    float _1954 = _1900;
    float _1956 = _1846;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1960 = _1828 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1964 = _1830 + _1962;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1968 = _1832 + _1966;
    float _1970 = _1960 * _1960;
    float _1972 = fma(_1964, _1964, _1970);
    float _1974 = fma(_1968, _1968, _1972);
    float _1976 = rsqrt(_1974);
    float _1978 = sqrt(_1974);
    float _1980 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1982 = _1964 * _1980;
    float _1984 = _1968 * _1980;
    float _1986 = _1982 * _1982;
    float _1988 = _1984 * _1984;
    float _1990 = _1986 + _1988;
    float _1992 = sqrt(_1990);
    bool _1994 = _1992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1998 = _1992 + _1996;
    float _2000 = _1976;
    float _2002 = _1990;
    float _2004 = _1998;
    float _2006 = _1954;
    float _2008 = _1960;
    float _2010 = _1980;
    if (_1994)
    {
        float _2012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2000 = _2012;
    }
    float _2014 = _2000;
    if (_1994)
    {
        float _2016 = rsqrt(_1990);
        _2002 = _2016;
    }
    float _2018 = _2002;
    float _2020 = _2018;
    if (_1994)
    {
        float _2022 = _1998 * _2014;
        _2004 = _2022;
    }
    float _2024 = _2004;
    if (_1994)
    {
        float _2026 = _2024 * 0.15915493667125701904296875;
        _2006 = _2026;
    }
    float _2028 = _2006;
    float _2030 = _2014;
    if (_1994)
    {
        float _2032 = _2028 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _2030 = _2034;
    }
    float _2036 = _2030;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = precise::max(0.0, _2038);
    float _2042 = _1968;
    float _2044 = _2040;
    if (_1994)
    {
        float _2046 = _2028 * 6.283185482025146484375;
        float _2048 = cos(_2046);
        _2042 = _2048;
    }
    float _2050 = _2042;
    float _2052 = -_1980;
    float _2054 = -_2040;
    float _2056 = fma(_1960, _2052, _2054);
    if (_1994)
    {
        float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2044 = _2058;
    }
    float _2060 = _2044;
    float _2062 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2064 = _2060;
    float _2066 = _2036;
    if (_1994)
    {
        float _2068 = fma(_2036, _2060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2064 = _2068;
    }
    float _2070 = _2064;
    float _2072 = _2070;
    if (!_1994)
    {
        _2066 = _1982;
    }
    float _2074 = _2066;
    float _2076 = _2074;
    float _2078 = _2050;
    if (_1994)
    {
        float _2080 = _2050 + (-1.0);
        _2008 = _2080;
    }
    float _2082 = _2008;
    float _2084 = _2082;
    if (_1994)
    {
        float _2086 = _2018 * _2070;
        _1640 = _2086;
    }
    float _2088 = _1640;
    if (!_1994)
    {
        _2072 = _2056;
    }
    float _2090 = _2072;
    float _2092 = _2090;
    if (_1994)
    {
        float _2094 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2010 = _2094;
    }
    float _2096 = _2010;
    if (_1994)
    {
        float _2098 = _1982 * _2088;
        _2076 = _2098;
    }
    float _2100 = _2076;
    if (!_1994)
    {
        _2084 = _1984;
    }
    float _2102 = _2084;
    float _2104 = _2102;
    if (_1994)
    {
        float _2106 = _1984 * _2088;
        _2104 = _2106;
    }
    float _2108 = _2104;
    if (!_1994)
    {
        _2020 = _1986;
    }
    float _2110 = _2020;
    float _2112 = _2110;
    if (_1994)
    {
        float _2114 = fma(_2056, _2050, _2096);
        _2092 = _2114;
    }
    float _2116 = _2092;
    if (_1994)
    {
        float _2118 = _2100 * _2100;
        _2112 = _2118;
    }
    float _2120 = _2112;
    if (!_1994)
    {
        _2078 = _1988;
    }
    float _2122 = _2078;
    float _2124 = _2122;
    if (_1994)
    {
        float _2126 = _2108 * _2108;
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = fma(_2116, _2116, _2120);
    float _2132 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2134 = _2130 + _2128;
    float _2136 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2062);
    float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2140 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2138);
    float _2142 = precise::clamp(_2140, 0.0, 1.0);
    float _2144 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2146 = rsqrt(_2134);
    float _2148 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2136);
    float _2150 = -_2142;
    float _2152 = _2150 + 1.0;
    float _2154 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2156 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2144);
    float _2158 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2160 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2154);
    float _2164 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2156);
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2168 = abs(_2152);
    float _2170 = log2(_2168);
    float _2172 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2162);
    float _2174 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2176 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = -_2166;
    float _2180 = fma(_2178, _2132, 1.0);
    float _2182 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2184 = _2146 * _2100;
    float _2186 = _2146 * _2116;
    float _2188 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2174);
    float _2192 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2194 = _2146 * _2108;
    float _2196 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2198 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = -_2192;
    float _2202 = fma(_2186, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2200);
    float _2204 = log2(_2180);
    float _2206 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2196);
    float _2208 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2210 = -_2194;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2202);
    float _2214 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2216 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2206);
    float _2218 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2220 = fma(_2212, -0.5, 0.5);
    float _2222 = exp2(_2208);
    float _2224 = fma(_2212, 0.5, 0.5);
    float _2226 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2214);
    float _2228 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2218);
    float _2230 = _2186 + 1.0;
    float _2232 = fma(_2224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2226);
    float _2236 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2228);
    float _2238 = 1.0 / _2216;
    float _2240 = fma(_2224, _2232, -0.212114393711090087890625);
    float _2242 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2234);
    float _2244 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2236);
    float _2246 = _2204 * 0.693147182464599609375;
    float _2248 = fma(_2224, _2240, 1.570728778839111328125);
    float _2250 = sqrt(_2220);
    float _2252 = -_2186;
    float _2254 = fma(_2222, _2230, _2252);
    float _2256 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2258 = fma(_2254, 0.5, 0.5);
    float _2260 = _2242 * _2238;
    float _2262 = _2244 * _2238;
    float _2264 = fma(_2260, 0.5, 0.5);
    float _2266 = fma(_2262, -0.5, 0.5);
    float _2268 = _2250 * 0.636619746685028076171875;
    float _2270 = -_2248;
    float _2272 = fma(_2268, _2270, 1.0);
    float3 _6632 = float3(_2264, _2266, _2256);
    float _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6632, float3(0.0), isnan(_6632)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6632, float3(0.0), isnan(_6632)), level(0.0)).x;
    float3 _6643 = float3(_2264, _2266, _2256);
    float4 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6643, float3(0.0), isnan(_6643)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6643, float3(0.0), isnan(_6643)), level(0.0)).xyzw;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = _2277.w;
    float2 _6660 = float2(_2272, _2258);
    float3 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6660, float2(0.0), isnan(_6660)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6660, float2(0.0), isnan(_6660)), level(0.0)).xyz;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = float(uint(_1118));
    float _2299 = trunc(_1246);
    int _2301 = int(_2299);
    int _2303 = ~_1118;
    int _2305 = _2303 + 1;
    float _2307 = _1416 * _152;
    int _2309 = ~_1118;
    int _2311 = _2309 + 1;
    float _2313 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2315 = abs(_1108);
    float _2317 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2319 = abs(_1114);
    float _2321 = 1.0 / _2297;
    int _2323 = _1118 + (-1);
    float _2325 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2327 = float(uint(_2301));
    float _2329 = trunc(_2307);
    int _2331 = int(_2329);
    int _2333 = as_type<int>(_2321) + (-2);
    float _2335 = exp2(_2313);
    float _2337 = as_type<float>(_2333) * _2327;
    float _2339 = trunc(_2337);
    float _2341 = precise::max(_2339, 0.0);
    uint _2344 = uint(_2341);
    float _2346 = -_2335;
    float _2348 = _2346 + 1.0;
    float _2350 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2352 = _2305 * int(_2344);
    int _2354 = _2352 + _2301;
    float _2356 = float(uint(_2354));
    float _2358 = as_type<float>(_2333) * _2356;
    bool _2360 = !_1074;
    float _2362 = _2360 ? 7.345489978790283203125 : 1.0;
    float _2364 = trunc(_2358);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    float _2370 = _2362 * _1064;
    float _2372 = float(_2301);
    bool _2374 = _2372 >= _1388;
    bool _2376 = isnan(_2372);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan(_1388);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = floor(_2370);
    int _2388 = int(_2344) + int(_2368);
    float _2390 = trunc(_2384);
    int _2392 = int(_2390);
    int _2394 = _2311 * _2388;
    int _2396 = _2394 + _2301;
    float _2398 = -_2386;
    float _2400 = _2370 + _2398;
    bool _2402 = uint(_2396) >= uint(_1118);
    bool _2404 = !_2402;
    int _2406 = _2404 ? 0 : (-1);
    bool _2408 = _1118 == 0;
    int _2410 = ~_2388;
    int _2412 = _2410 + _2406;
    int _2414 = _2412 + 1;
    float _2416 = _2400 * _1388;
    int _2418 = ~_2392;
    int _2420 = _2418 + 1;
    int _2422 = _2420 + 1;
    int _2424 = _1118 * _2414;
    int _2426 = _2424 + _2301;
    float _2428 = trunc(_2416);
    int _2430 = int(_2428);
    int _2432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2434 = _2432 != 0;
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2438 = _2436 != 0;
    bool _2440 = !_2408;
    int _2442 = _2440 ? _2426 : (-1);
    bool _2444 = !_2434;
    int _2446 = _2444 ? 0 : 1;
    int _2448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2450 = _2448 != 0;
    int _2452 = _2442 * _2422;
    int _2454 = abs(_1102);
    int _2456 = abs(_2446);
    int _2458 = _2392 * _2323;
    int _2460 = _2458 + _2452;
    bool _2462 = !_2450;
    int _2464 = _2462 ? 0 : 1;
    int _2466 = _2460 * _2454;
    int _2468 = abs(_2464);
    int _2470 = _2430 * _2456;
    int _2472 = _2470 + _2301;
    int _2474 = _2331 * _2315;
    int _2476 = _2474 + _2466;
    float _2478 = in.m_53.w;
    int _2480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2482 = _2480 != 0;
    int _2484 = _2472 * _2319;
    int _2486 = _2484 + _2476;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2494 = _2492 != 0;
    int _2496 = _2430 * _2468;
    int _2498 = _2496 + _2486;
    int _2500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2502 = _2500 != 0;
    float _2504 = in.m_63.y;
    float _2506 = 1.0 / _2490;
    int _2508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2510 = _2508 != 0;
    float _2512 = float(uint(_2498));
    float _2514 = as_type<float>(_2333) * _2512;
    int _2516 = ~_1118;
    int _2518 = _2516 + 1;
    float _2520 = trunc(_2514);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    bool _2526 = _2478 > 0.5;
    float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2530 = _2528 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2532 = 1.0 / _2530;
    int _2534 = _2518 * int(_2524);
    int _2536 = _2534 + _2498;
    float _2538 = float(uint(_2536));
    float _2540 = as_type<float>(_2333) * _2538;
    float _2542 = trunc(_2540);
    float _2544 = precise::max(_2542, 0.0);
    uint _2546 = uint(_2544);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2548 = -_2504;
    float _2550 = _2548 + 1.0;
    int _2552 = _2526 ? as_type<int>(_2550) : as_type<int>(_2504);
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2556 = _2554 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2558 = _1078 > 0.5;
    int _2560 = ~_1118;
    int _2562 = _2560 + 1;
    float _2564 = 1.0 / _2556;
    int _2566 = int(_2524) + int(_2546);
    float _2568 = _2482 ? as_type<float>(_2552) : _2504;
    float _2570 = _2504;
    bool _2572 = _2438;
    bool _2574 = _2482;
    if (_2438)
    {
        float _2576 = _2558 ? _2550 : _2504;
        _2570 = _2576;
    }
    float _2578 = _2570;
    int _2580 = _2562 * _2566;
    int _2582 = _2580 + _2498;
    float _2584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2494)
    {
        bool _2586 = _1070 > 0.5;
        _2572 = _2586;
    }
    bool _2588 = _2572;
    bool _2590 = uint(_2582) >= uint(_1118);
    float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2592;
    if (_2502)
    {
        bool _2596 = _1064 > 0.5;
        _2574 = _2596;
    }
    bool _2598 = _2574;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2604 = !_2590;
    int _2606 = _2604 ? 0 : (-1);
    float _2608 = _2594 * _2506;
    float _2610 = _2602 * _2532;
    int _2612 = ~_2566;
    int _2614 = _2612 + _2606;
    int _2616 = _2614 + 1;
    float _2618 = in.m_63.x;
    float _2620 = float(uint(_2472));
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2622;
    bool _2626 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2628 = isnan(_1062);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2634 = _2630 || _2632;
    float _2636 = float(_2634);
    int _2638 = _1118 * _2616;
    int _2640 = _2638 + _2498;
    int _2642 = ~_1118;
    int _2644 = _2642 + 1;
    float _2646 = _2624 * _2564;
    float _2648 = as_type<float>(_2333) * _2620;
    float _2650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2652 = _1062 + _2650;
    float _2654 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2656 = _1062 + _2654;
    bool _2658 = !_2408;
    int _2660 = _2658 ? _2640 : (-1);
    float _2662 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2664 = fma(_2608, _2652, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2668 = _1062 + _2666;
    float _2670 = trunc(_2648);
    float _2672 = precise::max(_2670, 0.0);
    uint _2674 = uint(_2672);
    float _2676 = fma(_2610, _2656, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2678 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2680 = isnan(_1062);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = fma(_2646, _2668, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2692 = _2660 >> 31;
    float _2694 = fma(_2568, _2662, -0.5);
    bool _2696 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2698 = isnan(_1062);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2704 = _2700 || _2702;
    float _2706 = float(_2704);
    float _2708 = -_2688;
    float _2710 = _2708 + 1.0;
    int _2712 = _2692 & 3;
    float _2714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2716 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2718 = isnan(_1062);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2724 = _2720 || _2722;
    float _2726 = float(_2724);
    float _2728 = _2706 * _2710;
    int _2730 = _2660 + _2712;
    float _2732 = -_2706;
    float _2734 = _2732 + 1.0;
    float _2736 = _2710;
    int _2738 = as_type<int>(_2664);
    float _2740 = _2618;
    if (!_2502)
    {
        _2736 = _2618;
    }
    float _2742 = _2736;
    int _2744 = 0;
    float _2746 = _2742;
    if (_2494)
    {
        float _2748 = -_2618;
        float _2750 = _2748 + 1.0;
        _2744 = as_type<int>(_2750);
    }
    int _2752 = _2744;
    int _2754 = _2730 >> 2;
    float _2756 = _2726 * _2734;
    float _2758 = -_2726;
    float _2760 = _2758 + 1.0;
    int _2762 = _2644 * int(_2674);
    int _2764 = _2762 + _2472;
    int _2766 = _2754 << 4;
    int _2768 = _2766 + 368;
    float _2770 = -_1372;
    float _2772 = fma(_1392, _2694, _2770);
    float _2774 = _2636 * _2760;
    float _2776 = -_2636;
    float _2778 = _2776 + 1.0;
    float _2780 = float(uint(_2764));
    float _2782 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2784 = uint(int(uint(_2768) >> uint(2)));
    uint _2786 = uint(int(uint(int(_2784)) >> uint(2)));
    int _2788 = int(_2784) & 3;
    float _2790 = (*spvDescriptorSet0.vp_c9)._m0[int(_2786)][_2788];
    int _2792 = int(_2784) + 1;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    int _2796 = _2792 & 3;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[int(_2794)][_2796];
    float _2800 = _2664 * _2774;
    if (_2502)
    {
        float _2802 = -_2618;
        float _2804 = _2802 + 1.0;
        _2738 = as_type<int>(_2804);
    }
    int _2806 = _2738;
    float _2808 = as_type<float>(_2333) * _2780;
    float _2810 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2578, -0.5);
    float _2812 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2800);
    if (_2502)
    {
        float _2814 = _2598 ? as_type<float>(_2806) : _2618;
        _2746 = _2814;
    }
    float _2816 = _2746;
    float _2818 = -_1164;
    float _2820 = fma(_1362, _2810, _2818);
    float _2822 = trunc(_2808);
    float _2824 = precise::max(_2822, 0.0);
    uint _2826 = uint(_2824);
    int _2828 = _2660 & 3;
    bool _2830 = _2828 != 0;
    int _2832 = _2768 + 8;
    uint _2834 = uint(int(uint(_2832) >> uint(2)));
    uint _2836 = uint(int(uint(int(_2834)) >> uint(2)));
    int _2838 = int(_2834) & 3;
    float _2840 = (*spvDescriptorSet0.vp_c9)._m0[int(_2836)][_2838];
    int _2842 = int(_2834) + 1;
    uint _2844 = uint(int(uint(_2842) >> uint(2)));
    int _2846 = _2842 & 3;
    float _2848 = (*spvDescriptorSet0.vp_c9)._m0[int(_2844)][_2846];
    if (_2494)
    {
        float _2850 = _2588 ? as_type<float>(_2752) : _2618;
        _2740 = _2850;
    }
    float _2852 = _2740;
    float _2854 = fma(_2676, _2756, _2812);
    bool _2856 = uint(_2828) > 1u;
    int _2858 = _2660 & 3;
    bool _2860 = _2858 != 0;
    float _2862 = fma(_2690, _2728, _2854);
    float _2864 = fma(_2782, _2852, -0.5);
    int _2866 = ~_1118;
    int _2868 = _2866 + 1;
    int _2870 = _2860 ? 0 : 1;
    float _2872 = fma(_2816, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2874 = fma(_1366, _2864, _1242);
    int _2876 = int(_2674) + int(_2826);
    int _2878 = ~_2870;
    int _2880 = _2878 + 1;
    int _2882 = _2880 + 1;
    float _2884 = fma(_1344, _2872, _1144);
    int _2886 = _2882;
    if (!_2856)
    {
        int _2888 = ~_2870;
        int _2890 = _2888 + 1;
        _2886 = _2890;
    }
    int _2892 = _2886;
    int _2894 = _2868 * _2876;
    int _2896 = _2894 + _2472;
    bool _2898 = _2828 != 3;
    int _2900 = abs(_2892);
    float _2902 = _2350 * _2274;
    bool _2904 = uint(_2896) >= uint(_1118);
    float _2906 = fma(_2688, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2862);
    bool _2908 = uint(_2828) >= 2u;
    bool _2910 = !_2904;
    int _2912 = _2910 ? 0 : (-1);
    int _2914 = ~_2900;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    int _2920 = _2908 ? 0 : 1;
    int _2922 = ~_2876;
    int _2924 = _2922 + _2912;
    int _2926 = _2924 + 1;
    int _2928 = _2918 * as_type<int>(_2798);
    bool _2930 = !_2830;
    int _2932 = _2930 ? 0 : 1;
    int _2934 = ~_2920;
    int _2936 = _2934 + 1;
    int _2938 = _2936 + 1;
    int _2940 = _1118 * _2926;
    int _2942 = _2940 + _2472;
    bool _2944 = _2828 != 3;
    float _2946 = _2772 + 0.5;
    int _2948 = _2938;
    if (_2898)
    {
        int _2950 = ~_2920;
        int _2952 = _2950 + 1;
        _2948 = _2952;
    }
    int _2954 = _2948;
    float _2956 = _2820 + 0.5;
    int _2958 = abs(_2932);
    float _2960 = _2884 + 0.5;
    bool _2962 = !_2944;
    int _2964 = _2962 ? 0 : (-1);
    int _2966 = abs(_2954);
    int _2968 = ~_2958;
    int _2970 = _2968 + 1;
    int _2972 = _2970 + 1;
    int _2974 = abs(_2964);
    float _2976 = _2874 + 0.5;
    int _2978 = ~_2966;
    int _2980 = _2978 + 1;
    int _2982 = _2980 + 1;
    int _2984 = _2972 * as_type<int>(_2790);
    int _2986 = _2984 + _2928;
    bool _2988 = !_2510;
    int _2990 = _2988 ? 0 : 1;
    float _2992 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2994 = ~_2974;
    int _2996 = _2994 + 1;
    int _2998 = _2996 + 1;
    int _3000 = _2982 * as_type<int>(_2840);
    int _3002 = _3000 + _2986;
    int _3004 = abs(_2990);
    out.m_67.x = _2960;
    out.m_67.y = _2956;
    out.m_67.z = _2976;
    out.m_67.w = _2946;
    float _3006 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2992);
    int _3008 = _2998 * as_type<int>(_2848);
    int _3010 = _3008 + _3002;
    float _3012 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3006);
    float _3014 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3012);
    float _3016 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3018 = ~_3004;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    float _3024 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3026 = _2325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3028 = !_2408;
    int _3030 = _3028 ? _2942 : (-1);
    float _3032 = _1898 * _1956;
    int _3034 = _3010 * _3022;
    float _3036 = _3016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3038 = _2906 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3040 = _3032 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3042 = _3030 * _3004;
    int _3044 = _3042 + _3034;
    float _3046 = _3014 + _2216;
    bool _3048 = _1898 > 0.0;
    bool _3050 = isnan(_1898);
    bool _3052 = _3048 || _3050;
    bool _3054 = isnan(0.0);
    bool _3056 = _3052 || _3054;
    float _3058 = _3040 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _3026;
    out.m_69.y = _3024;
    out.m_69.z = _3036;
    out.m_69.w = _3038;
    float _3060 = _3046 * 0.5;
    bool _3062 = _1956 <= 0.0;
    bool _3064 = !_3056;
    bool _3066 = _3062 || _3064;
    float _3068 = float(_3044);
    float _3070 = _2295 * _2902;
    out.m_49.x = _3058;
    out.m_71.x = _3068;
    float _3072 = _2285 * _2902;
    float _3074 = -_2350;
    float _3076 = _3074 + 1.0;
    out.gl_Position.x = _2242;
    out.gl_Position.y = _2244;
    out.gl_Position.z = _3014;
    out.gl_Position.w = _2216;
    float _3078 = fma(_2291, _3072, _2279);
    float _3080 = fma(_2293, _3072, _2281);
    float _3082 = _2285 * _3076;
    float _3084 = fma(_2285, _3070, _2283);
    out.m_73.z = _3060;
    out.m_73.w = _2216;
    out.m_75.x = _3078;
    out.m_75.y = _3080;
    out.m_75.z = _3084;
    out.m_75.w = _3082;
    if (!_3066)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3086 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3086;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _794 = false;
    bool _696 = false;
    bool _360 = false;
    bool _198 = false;
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
        float _3155 = as_type<float>(_118);
        out.gl_Position.z = _3155;
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
        float _3210 = as_type<float>(_144);
        out.gl_Position.z = _3210;
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
    float _178 = _156;
    float _196;
    if (!_176)
    {
        float _180 = in.m_53.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        _196 = _156;
    }
    _198 = false;
    float _200 = _196;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = _200 + _202;
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _200 + _218;
    bool _222 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_200);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _242 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_200);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = 1.0 / _240;
    float _256 = -_252;
    float _258 = _256 + 1.0;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _232 * _258;
    float _264 = -_232;
    float _266 = _264 + 1.0;
    float _268 = 1.0 / _236;
    float _270 = _220 * _254;
    float _272 = _204 * _268;
    float _274 = -_216;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _252 * _276;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = fma(_280, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = fma(_286, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _296 = fma(_290, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = _292 * _262;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = _294 * _262;
    float _306 = _296 * _262;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _316 = fma(_302, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _304);
    float _320 = fma(_310, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _322 = fma(_314, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _324 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _326 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _328 = fma(_320, _282, _318);
    float _330 = fma(_316, _282, _324);
    float _332 = fma(_322, _282, _326);
    float _334 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].x, _328);
    float _336 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].y, _330);
    float _338 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].z, _332);
    bool _340 = !_260;
    float _358;
    if (!_340)
    {
        float _342 = in.m_53.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        _358 = _156;
    }
    _360 = false;
    float _362 = _358;
    float _364 = in.m_55.x;
    float _366 = in.m_55.y;
    float _368 = in.m_55.z;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _386 = 1.0 / _372;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _388;
    float _392 = 1.0 / _376;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _396 = _362 + _394;
    bool _398 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _400 = isnan(_362);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    bool _410 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _412 = isnan(_362);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _338 * _368;
    float _424 = _336 * _366;
    float _426 = 1.0 / _380;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _430 = _362 + _428;
    float _432 = _396 * _386;
    bool _434 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _436 = isnan(_362);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _448 = _362 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _452 = _362 + _450;
    bool _454 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _456 = isnan(_362);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -_408;
    float _468 = _466 + 1.0;
    float _470 = 1.0 / _384;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _474 = _362 + _472;
    float _476 = _430 * _392;
    bool _478 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _480 = isnan(_362);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -_444;
    float _492 = _490 + 1.0;
    float _494 = -_420;
    float _496 = _494 + 1.0;
    float _498 = _464 * _468;
    float _500 = -_464;
    float _502 = _500 + 1.0;
    float _504 = 1.0 / _390;
    float _506 = _448 * _426;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _508;
    float _512 = _488 * _492;
    float _514 = -_488;
    float _516 = _514 + 1.0;
    float _518 = fma(_510, _432, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _520 = _474 * _470;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _522;
    float _526 = _420 * _516;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _532 = fma(_524, _432, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _534 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _536 = fma(_530, _476, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _538 = _452 * _504;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _540;
    float _544 = _334 * _364;
    float _546 = fma(_542, _432, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _548 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _550 = isnan(_362);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _408 * _496;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = _558 * _502;
    float _572 = fma(_564, _476, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _574 = fma(_568, _476, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _576;
    float _580 = _532 * _570;
    float _582 = _546 * _570;
    float _584 = _518 * _570;
    float _586 = -_558;
    float _588 = _586 + 1.0;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _594;
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].x, _580);
    float _600 = fma(_592, _506, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _606 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].y, _582);
    float _608 = fma(_572, _498, _598);
    float _610 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].z, _584);
    float _612 = fma(_596, _506, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _614 = fma(_604, _520, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _616 = fma(_600, _560, _608);
    float _618 = fma(_578, _506, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _620 = fma(_536, _498, _606);
    float _622 = fma(_574, _498, _610);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _632 = fma(_618, _560, _622);
    float _634 = fma(_626, _520, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _640;
    float _644 = fma(_630, _520, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _646 = fma(_612, _560, _620);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _648;
    float _652 = fma(_638, _538, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _654 = fma(_642, _538, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _656 = fma(_614, _526, _616);
    float _658 = fma(_650, _538, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _660 = fma(_634, _526, _646);
    float _662 = fma(_644, _526, _632);
    float _664 = fma(_652, _512, _656);
    float _666 = fma(_654, _512, _660);
    float _668 = fma(_658, _512, _662);
    float _670 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[112].x, _664);
    float _672 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[112].y, _666);
    float _674 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[112].z, _668);
    bool _676 = !_534;
    float _694;
    if (!_676)
    {
        float _678 = in.m_53.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        _694 = _156;
    }
    _696 = false;
    float _698 = _694;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _702 = _698 + _700;
    bool _704 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _706 = isnan(_698);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _720 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _722 = isnan(_698);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _732;
    float _736 = _670 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _738 = -_714;
    float _740 = _738 + 1.0;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _744 = 1.0 / _718;
    float _746 = _730 * _740;
    float _748 = -_730;
    float _750 = _748 + 1.0;
    float _752 = _734 * _744;
    float _754 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _756 = fma(_752, _702, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _758 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _756 * _746;
    float _762 = _672 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[115].x, _760);
    float _766 = _762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _768 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[116].x, _764);
    float _770 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _772 = _768 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _770;
    out.m_57.y = _766;
    out.m_57.z = _758;
    out.m_57.w = _772;
    bool _774 = !_742;
    float _792;
    if (!_774)
    {
        float _776 = in.m_53.x;
        float _778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _780 = _776 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _784 = _782 * _778;
        float _786 = floor(_784);
        float _788 = -_786;
        float _790 = _784 + _788;
        _792 = _790;
        _794 = true;
    }
    else
    {
        _792 = _156;
    }
    _794 = false;
    float _796 = _792;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _800 = _796 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _804 = _796 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _808 = _796 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _826 = 1.0 / _812;
    bool _828 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _830 = isnan(_796);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = 1.0 / _824;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _844 = _796 + _842;
    bool _846 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _848 = isnan(_796);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    bool _858 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _860 = 1.0 / _820;
    float _862 = _800 * _826;
    bool _864 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _866 = isnan(_796);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = 1.0 / _816;
    float _878 = _844 * _840;
    bool _880 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _882 = isnan(_796);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -_874;
    float _894 = _892 + 1.0;
    float _896 = _890 * _894;
    float _898 = _804 * _860;
    bool _900 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _902 = isnan(_796);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = -_890;
    float _914 = _912 + 1.0;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _928 = _910 * _914;
    float _930 = fma(_918, _862, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _932 = _808 * _876;
    float _934 = -_910;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _950 = _838 * _936;
    float _952 = -_838;
    float _954 = _952 + 1.0;
    float _956 = fma(_940, _862, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _958 = fma(_922, _862, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _960 = fma(_926, _932, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _962 = _856 * _954;
    float _964 = fma(_944, _932, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _966 = fma(_948, _932, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _968 = -_856;
    float _970 = _968 + 1.0;
    float _972 = _930 * _962;
    float _974 = _956 * _962;
    float _976 = _958 * _962;
    float _978 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].x, _972);
    float _980 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].y, _974);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].z, _976);
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _992;
    float _996 = fma(_960, _950, _978);
    float _998 = fma(_966, _950, _982);
    float _1000 = fma(_986, _898, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1002 = fma(_990, _898, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1004 = fma(_964, _950, _980);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1014 = fma(_994, _898, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1020 = fma(_1000, _928, _996);
    float _1022 = fma(_1008, _878, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1024 = fma(_1012, _878, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1026 = fma(_1002, _928, _1004);
    float _1028 = fma(_1018, _878, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1030 = fma(_1014, _928, _998);
    float _1032 = fma(_1022, _896, _1020);
    float _1034 = fma(_1024, _896, _1026);
    float _1036 = fma(_1028, _896, _1030);
    float _1038 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1032);
    float _1040 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1034);
    float _1042 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1036);
    bool _1044 = !_858;
    if (!_1044)
    {
        float _1046 = in.m_53.x;
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1050 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1054 = _1052 * _1048;
        float _1056 = floor(_1054);
        float _1058 = -_1056;
        float _1060 = _1054 + _1058;
        _178 = _1060;
    }
    float _1062 = _178;
    float _1064 = in.m_53.x;
    float _1066 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1068 = log2(_1066);
    float _1070 = in.m_53.z;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1074 = _1072 != 0;
    float _1076 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1078 = in.m_53.y;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1090 = _1088 != 0;
    float _1092 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1094 = int(_1092);
    float _1096 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1100 = !_1086;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1106 = !_1082;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1112 = !_1090;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1118 = int(_1116);
    float _1120 = _1064 * 2.0;
    float _1122 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1126 = float(_1094);
    float _1128 = _1070 * 2.0;
    float _1130 = floor(_1120);
    float _1132 = -_1104;
    float _1134 = fma(_1122, 2.0, _1132);
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1138 = _1078 * 2.0;
    float _1140 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1142 = -_100;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1134);
    float _1146 = floor(_1128);
    float _1148 = _1064 + _1078;
    float _1150 = fma(_1140, -2.0, _1110);
    float _1152 = _1140;
    if (!_1074)
    {
        _1152 = _1070;
    }
    float _1154 = _1152;
    float _1156 = _1148 + (-1.0);
    float _1158 = _1154;
    float _1160 = _1156;
    if (_1074)
    {
        _1158 = _1078;
    }
    float _1162 = _1158;
    float _1164 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1150);
    bool _1166 = _1130 > 0.0;
    float _1168 = floor(_1138);
    bool _1170 = _1130 >= 0.0;
    bool _1172 = isnan(_1130);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1182 = _1162;
    if (!_1074)
    {
        _1160 = _1078;
    }
    float _1184 = _1160;
    bool _1186 = _1146 >= 0.0;
    bool _1188 = isnan(_1146);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan(0.0);
    bool _1194 = _1190 || _1192;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1198 = _1184;
    if (_1074)
    {
        _1198 = _1064;
    }
    float _1200 = _1198;
    float _1202 = 1.0 / _1126;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1214 = _1212 != 0;
    int _1216 = _1194 ? 0 : 1;
    float _1218 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1220 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1196);
    bool _1222 = !_1206;
    int _1224 = _1222 ? 0 : 1;
    bool _1226 = _1146 > 0.0;
    float _1228 = -_1124;
    float _1230 = fma(_1218, 2.0, _1228);
    int _1232 = ~_1216;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    int _1238 = _1178 ? 0 : 1;
    float _1240 = -_100;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1230);
    bool _1244 = _1168 > 0.0;
    float _1246 = _1202 * _100;
    bool _1248 = _1168 >= 0.0;
    bool _1250 = isnan(_1168);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan(0.0);
    bool _1256 = _1252 || _1254;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1260 = abs(_1224);
    int _1262 = _1236;
    if (!_1226)
    {
        int _1264 = ~_1216;
        int _1266 = _1264 + 1;
        _1262 = _1266;
    }
    int _1268 = _1262;
    float _1270 = _1068 * _100;
    int _1272 = _1256 ? 0 : 1;
    float _1274 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1258);
    if (!_1074)
    {
        _1182 = _1070;
    }
    float _1276 = _1182;
    float _1278 = _1276;
    if (_1074)
    {
        _1278 = _1078;
    }
    float _1280 = _1278;
    float _1282 = exp2(_1270);
    int _1284 = ~_1272;
    int _1286 = _1284 + 1;
    int _1288 = _1286 + 1;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1294 = float(_1268);
    float _1296 = fma(_1290, -2.0, _1136);
    int _1298 = _1288;
    if (!_1244)
    {
        int _1300 = ~_1272;
        int _1302 = _1300 + 1;
        _1298 = _1302;
    }
    int _1304 = _1298;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1308 = float(_1260);
    float _1310 = in.m_59.x;
    float _1312 = in.m_59.y;
    float _1314 = in.m_59.z;
    int _1316 = ~_1238;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1306);
    float _1324 = _1308 * _1294;
    float _1326 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1292);
    bool _1328 = !_1210;
    int _1330 = _1328 ? 0 : 1;
    float _1332 = -_1282;
    float _1334 = _1332 + 1.0;
    int _1336 = _1320;
    if (!_1166)
    {
        int _1338 = ~_1238;
        int _1340 = _1338 + 1;
        _1336 = _1340;
    }
    int _1342 = _1336;
    float _1344 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1326);
    bool _1346 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1354 = _1350 || _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1358 = 1.0 + _1356;
    int _1360 = abs(_1330);
    float _1362 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1322);
    float _1364 = _1354 ? _1334 : 0.0;
    float _1366 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1220);
    float _1368 = 1.0 / _1358;
    float _1370 = float(_1342);
    float _1372 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1296);
    float _1374 = float(_1360);
    float _1376 = _1324 * (-2.0);
    bool _1378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1380 = isnan(1.0);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1118);
    float _1390 = _1374 * _1370;
    float _1392 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1274);
    bool _1394 = !_1214;
    int _1396 = _1394 ? 0 : 1;
    float _1398 = fma(_1376, _1310, _1310);
    float _1400 = _1064 + (-0.5);
    float _1402 = fma(_1180, _1376, _1180);
    int _1404 = abs(_1396);
    float _1406 = _1078 + _1070;
    float _1408 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1398);
    float _1410 = float(_1304);
    float _1412 = _1390 * (-2.0);
    float _1414 = _1406 + (-1.0);
    float _1416 = _1388 * _100;
    float _1418 = float(_1404);
    if (_1386)
    {
        float _1420 = _1364 * _1368;
        _110 = _1420;
    }
    float _1422 = _110;
    float _1424 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1426 = _1418 * _1410;
    float _1428 = _1078 + (-0.5);
    float _1430 = fma(_1412, _1312, _1312);
    float _1432 = fma(_1424, _1412, _1424);
    float _1434 = _1064 + _1070;
    float _1436 = _1426 * (-2.0);
    float _1438 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1430);
    float _1440 = fma(_1402, _1422, _1408);
    float _1442 = in.m_61.x;
    float _1444 = in.m_61.y;
    float _1446 = in.m_61.z;
    float _1448 = _1434 + (-1.0);
    float _1450 = fma(_1432, _1422, _1438);
    float _1452 = _1440 * 0.15915493667125701904296875;
    float _1454 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1456 = fma(_1436, _1314, _1314);
    float _1458 = _1070 + (-0.5);
    float _1460 = _1450 * 0.15915493667125701904296875;
    float _1462 = fma(_1454, _1436, _1454);
    float _1464 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1456);
    float _1466 = _1452 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = fma(_1462, _1422, _1464);
    float _1472 = _1470 * 0.15915493667125701904296875;
    float _1474 = _1452 * 6.283185482025146484375;
    float _1476 = cos(_1474);
    float _1478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1442);
    float _1480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1444);
    float _1482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1446);
    float _1484 = _1460 * 6.283185482025146484375;
    float _1486 = sin(_1484);
    float _1488 = _1076 * _1480;
    float _1490 = _1096 * _1478;
    float _1492 = _1098 * _1482;
    float _1494 = _1460 * 6.283185482025146484375;
    float _1496 = cos(_1494);
    float _1498 = _1472 * 6.283185482025146484375;
    float _1500 = cos(_1498);
    float _1502 = in.m_42.x;
    float _1504 = in.m_42.y;
    float _1506 = in.m_42.z;
    float _1508 = _1468 * _1486;
    float _1510 = _1476 * _1486;
    float _1512 = _1472 * 6.283185482025146484375;
    float _1514 = sin(_1512);
    float _1516 = _1476 * _1496;
    float _1518 = _1496 * _1500;
    float _1520 = _1500 * _1488;
    float _1522 = _1468 * _1496;
    float _1524 = _1486 * _1500;
    float _1526 = _1476 * _1520;
    float _1528 = _1468 * _1520;
    float _1530 = fma(_1514, _1516, _1508);
    float _1532 = -_1510;
    float _1534 = fma(_1514, _1522, _1532);
    float _1536 = -_1488;
    float _1538 = _1514 * _1536;
    float _1540 = -_1522;
    float _1542 = fma(_1514, _1510, _1540);
    float _1544 = fma(_1530, _1490, _1526);
    float _1546 = fma(_1514, _1508, _1516);
    float _1548 = fma(_1518, _1490, _1538);
    float _1550 = fma(_1534, _1490, _1528);
    float _1552 = fma(_1542, _1492, _1544);
    float _1554 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1556 = fma(_1524, _1492, _1548);
    float _1558 = fma(_1546, _1492, _1550);
    float _1560 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1562 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1564 = fma(_1502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1554);
    float _1566 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1568 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1560);
    float _1570 = fma(_1502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1562);
    float _1572 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1564);
    float _1574 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1566);
    float _1576 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1568);
    float _1578 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1570);
    float _1580 = _1572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1582 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1574);
    float _1584 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1588 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1592 = _1580 + _1584;
    float _1594 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1596 = fma(_1502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1588);
    float _1598 = _1586 + _1590;
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1602 = _1592 + _1600;
    float _1604 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1594);
    float _1606 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1596);
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1610 = _1598 + _1608;
    float _1612 = _1602 * _1602;
    float _1614 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1604);
    float _1616 = _1606 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1618 = fma(_1610, _1610, _1612);
    float _1620 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1622 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1624 = sqrt(_1618);
    float _1626 = _1616 + _1620;
    float _1628 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1622);
    float _1630 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1628);
    bool _1632 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = _1628;
    float _1636 = _1502;
    float _1638 = _1506;
    float _1640 = _1490;
    if (!_1632)
    {
        _1634 = _1598;
    }
    float _1642 = _1634;
    float _1644 = _1642;
    if (!_1632)
    {
        _1636 = _1592;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    if (!_1632)
    {
        _1638 = _1626;
    }
    float _1650 = _1638;
    bool _1652 = !_1632;
    float _1654 = _1650;
    if (!_1652)
    {
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1660 = _1624 + _1658;
        float _1662 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1664 = rsqrt(_1618);
        float _1666 = _1660 * _1656;
        float _1668 = _1666 * 0.15915493667125701904296875;
        float _1670 = _1668 * 6.283185482025146484375;
        float _1672 = cos(_1670);
        float _1674 = _1668 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 + (-1.0);
        float _1680 = fma(_1676, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1682 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1684 = _1664 * _1680;
        float _1686 = fma(_1626, _1672, _1682);
        float _1688 = fma(_1610, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1690 = fma(_1602, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1654 = _1686;
        _1644 = _1688;
        _1648 = _1690;
    }
    float _1692 = _1654;
    float _1694 = _1644;
    float _1696 = _1648;
    float _1698 = -_1616;
    float _1700 = _1698 + _1692;
    float _1702 = -_1586;
    float _1704 = _1702 + _1694;
    float _1706 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1708 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1710 = _1700 * _1700;
    float _1712 = -_1580;
    float _1714 = _1712 + _1696;
    float _1716 = 1.0 / _1706;
    float _1718 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1708);
    float _1720 = fma(_1704, _1704, _1710);
    bool _1722 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1724 = isnan(0.5);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1730 = _1726 || _1728;
    float _1732 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1718);
    float _1734 = fma(_1714, _1714, _1720);
    float _1736 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1738 = sqrt(_1734);
    float _1740 = _1736 + _1706;
    float _1742 = _1706;
    float _1744 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1746 = _1694;
    float _1748 = _1696;
    float _1750 = _1714;
    if (_1730)
    {
        _1742 = 1.0;
    }
    float _1752 = _1742;
    float _1754 = _1740 * _1716;
    float _1756 = _1754 * 0.5;
    float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1760 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1758);
    float _1762 = 1.0 / _1760;
    bool _1764 = _1738 > 0.0;
    float _1766 = _1738;
    float _1768 = _1752;
    if (!_1764)
    {
        _1766 = _1692;
    }
    float _1770 = _1766;
    bool _1772 = !_1764;
    float _1774 = _1770;
    if (!_1772)
    {
        float _1776 = _172 * _172;
        float _1778 = fma(_170, _170, _1776);
        float _1780 = fma(_174, _174, _1778);
        float _1782 = rsqrt(_1734);
        float _1784 = sqrt(_1780);
        float _1786 = _1704 * _1782;
        float _1788 = _1700 * _1782;
        float _1790 = _1714 * _1782;
        bool _1792 = _1784 > 0.0;
        float _1794 = _1782;
        _1744 = _1784;
        if (!_1792)
        {
            _1794 = _1692;
        }
        float _1796 = _1794;
        bool _1798 = !_1792;
        _1774 = _1796;
        if (!_1798)
        {
            float _1800 = rsqrt(_1780);
            float _1802 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1804 = _172 * _1800;
            float _1806 = _170 * _1800;
            float _1808 = _174 * _1800;
            float _1810 = _1788 * _1804;
            float _1812 = fma(_1786, _1806, _1810);
            float _1814 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1816 = fma(_1790, _1808, _1812);
            float _1818 = _1816 * _1814;
            float _1820 = fma(_170, _1818, _1694);
            float _1822 = fma(_172, _1818, _1692);
            float _1824 = fma(_174, _1818, _1696);
            _1744 = _1806;
            _1774 = _1822;
            _1746 = _1820;
            _1748 = _1824;
            _1750 = _1818;
        }
    }
    float _1826 = _1744;
    float _1828 = _1774;
    float _1830 = _1746;
    float _1832 = _1748;
    float _1834 = _1750;
    float _1836 = _1834;
    float _1838 = _1826;
    if (_1730)
    {
        _1836 = 1.0;
    }
    float _1840 = _1836;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1844 = _1762 * _1842;
    float _1846 = _1840;
    if (!_1730)
    {
        float _1848 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1850 = _1848 * 0.15915493667125701904296875;
        float _1852 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1854 = _1850 * 6.283185482025146484375;
        float _1856 = cos(_1854);
        float _1858 = _1852 * 0.15915493667125701904296875;
        float _1860 = _1850 * 6.283185482025146484375;
        float _1862 = sin(_1860);
        float _1864 = 1.0 / _1856;
        float _1866 = _1858 * 6.283185482025146484375;
        float _1868 = cos(_1866);
        float _1870 = _1862 * _1864;
        float _1872 = _1858 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        float _1876 = _1868 * _1870;
        float _1878 = 1.0 / _1876;
        float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1882 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1880;
        float _1884 = 1.0 / _1882;
        float _1886 = _1874 * _1878;
        float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1890 = fma(_1844, _1886, _1888);
        float _1892 = _1890 * _1884;
        float _1894 = precise::clamp(_1892, 0.0, 1.0);
        _1838 = _1864;
        _1768 = _1894;
    }
    float _1896 = _1838;
    float _1898 = _1768;
    float _1900 = _1896;
    if (!_1730)
    {
        float _1902 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1904 = _1902 * 0.15915493667125701904296875;
        float _1906 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1908 = _1904 * 6.283185482025146484375;
        float _1910 = cos(_1908);
        float _1912 = _1906 * 0.15915493667125701904296875;
        float _1914 = _1904 * 6.283185482025146484375;
        float _1916 = sin(_1914);
        float _1918 = 1.0 / _1910;
        float _1920 = _1912 * 6.283185482025146484375;
        float _1922 = cos(_1920);
        float _1924 = _1916 * _1918;
        float _1926 = _1912 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        float _1930 = _1922 * _1924;
        float _1932 = 1.0 / _1930;
        float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1936 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1934;
        float _1938 = 1.0 / _1936;
        float _1940 = _1928 * _1932;
        float _1942 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1944 = fma(_1844, _1940, _1942);
        float _1946 = _1944 * _1938;
        float _1948 = precise::clamp(_1946, 0.0, 1.0);
        float _1950 = -_1948;
        float _1952 = _1950 + 1.0;
        _1900 = _1932;
        _1846 = _1952;
    }
    float _1954 = _1900;
    float _1956 = _1846;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1960 = _1828 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1964 = _1830 + _1962;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1968 = _1832 + _1966;
    float _1970 = _1960 * _1960;
    float _1972 = fma(_1964, _1964, _1970);
    float _1974 = fma(_1968, _1968, _1972);
    float _1976 = rsqrt(_1974);
    float _1978 = sqrt(_1974);
    float _1980 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1982 = _1964 * _1980;
    float _1984 = _1968 * _1980;
    float _1986 = _1982 * _1982;
    float _1988 = _1984 * _1984;
    float _1990 = _1986 + _1988;
    float _1992 = sqrt(_1990);
    bool _1994 = _1992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1998 = _1992 + _1996;
    float _2000 = _1976;
    float _2002 = _1990;
    float _2004 = _1998;
    float _2006 = _1954;
    float _2008 = _1960;
    float _2010 = _1980;
    if (_1994)
    {
        float _2012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2000 = _2012;
    }
    float _2014 = _2000;
    if (_1994)
    {
        float _2016 = rsqrt(_1990);
        _2002 = _2016;
    }
    float _2018 = _2002;
    float _2020 = _2018;
    if (_1994)
    {
        float _2022 = _1998 * _2014;
        _2004 = _2022;
    }
    float _2024 = _2004;
    if (_1994)
    {
        float _2026 = _2024 * 0.15915493667125701904296875;
        _2006 = _2026;
    }
    float _2028 = _2006;
    float _2030 = _2014;
    if (_1994)
    {
        float _2032 = _2028 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _2030 = _2034;
    }
    float _2036 = _2030;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = precise::max(0.0, _2038);
    float _2042 = _1968;
    float _2044 = _2040;
    if (_1994)
    {
        float _2046 = _2028 * 6.283185482025146484375;
        float _2048 = cos(_2046);
        _2042 = _2048;
    }
    float _2050 = _2042;
    float _2052 = -_1980;
    float _2054 = -_2040;
    float _2056 = fma(_1960, _2052, _2054);
    if (_1994)
    {
        float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2044 = _2058;
    }
    float _2060 = _2044;
    float _2062 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2064 = _2060;
    float _2066 = _2036;
    if (_1994)
    {
        float _2068 = fma(_2036, _2060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2064 = _2068;
    }
    float _2070 = _2064;
    float _2072 = _2070;
    if (!_1994)
    {
        _2066 = _1982;
    }
    float _2074 = _2066;
    float _2076 = _2074;
    float _2078 = _2050;
    if (_1994)
    {
        float _2080 = _2050 + (-1.0);
        _2008 = _2080;
    }
    float _2082 = _2008;
    float _2084 = _2082;
    if (_1994)
    {
        float _2086 = _2018 * _2070;
        _1640 = _2086;
    }
    float _2088 = _1640;
    if (!_1994)
    {
        _2072 = _2056;
    }
    float _2090 = _2072;
    float _2092 = _2090;
    if (_1994)
    {
        float _2094 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2010 = _2094;
    }
    float _2096 = _2010;
    if (_1994)
    {
        float _2098 = _1982 * _2088;
        _2076 = _2098;
    }
    float _2100 = _2076;
    if (!_1994)
    {
        _2084 = _1984;
    }
    float _2102 = _2084;
    float _2104 = _2102;
    if (_1994)
    {
        float _2106 = _1984 * _2088;
        _2104 = _2106;
    }
    float _2108 = _2104;
    if (!_1994)
    {
        _2020 = _1986;
    }
    float _2110 = _2020;
    float _2112 = _2110;
    if (_1994)
    {
        float _2114 = fma(_2056, _2050, _2096);
        _2092 = _2114;
    }
    float _2116 = _2092;
    if (_1994)
    {
        float _2118 = _2100 * _2100;
        _2112 = _2118;
    }
    float _2120 = _2112;
    if (!_1994)
    {
        _2078 = _1988;
    }
    float _2122 = _2078;
    float _2124 = _2122;
    if (_1994)
    {
        float _2126 = _2108 * _2108;
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = fma(_2116, _2116, _2120);
    float _2132 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2134 = _2130 + _2128;
    float _2136 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2062);
    float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2140 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2138);
    float _2142 = precise::clamp(_2140, 0.0, 1.0);
    float _2144 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2146 = rsqrt(_2134);
    float _2148 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2136);
    float _2150 = -_2142;
    float _2152 = _2150 + 1.0;
    float _2154 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2156 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2144);
    float _2158 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2160 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2154);
    float _2164 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2156);
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2168 = abs(_2152);
    float _2170 = log2(_2168);
    float _2172 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2162);
    float _2174 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2176 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = -_2166;
    float _2180 = fma(_2178, _2132, 1.0);
    float _2182 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2184 = _2146 * _2100;
    float _2186 = _2146 * _2116;
    float _2188 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2174);
    float _2192 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2194 = _2146 * _2108;
    float _2196 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2198 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = -_2192;
    float _2202 = fma(_2186, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2200);
    float _2204 = log2(_2180);
    float _2206 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2196);
    float _2208 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2210 = -_2194;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2202);
    float _2214 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2216 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2206);
    float _2218 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2220 = fma(_2212, -0.5, 0.5);
    float _2222 = exp2(_2208);
    float _2224 = fma(_2212, 0.5, 0.5);
    float _2226 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2214);
    float _2228 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2218);
    float _2230 = _2186 + 1.0;
    float _2232 = fma(_2224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2226);
    float _2236 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2228);
    float _2238 = 1.0 / _2216;
    float _2240 = fma(_2224, _2232, -0.212114393711090087890625);
    float _2242 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2234);
    float _2244 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2236);
    float _2246 = _2204 * 0.693147182464599609375;
    float _2248 = fma(_2224, _2240, 1.570728778839111328125);
    float _2250 = sqrt(_2220);
    float _2252 = -_2186;
    float _2254 = fma(_2222, _2230, _2252);
    float _2256 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2258 = fma(_2254, 0.5, 0.5);
    float _2260 = _2242 * _2238;
    float _2262 = _2244 * _2238;
    float _2264 = fma(_2260, 0.5, 0.5);
    float _2266 = fma(_2262, -0.5, 0.5);
    float _2268 = _2250 * 0.636619746685028076171875;
    float _2270 = -_2248;
    float _2272 = fma(_2268, _2270, 1.0);
    float3 _6632 = float3(_2264, _2266, _2256);
    float _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6632, float3(0.0), isnan(_6632)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6632, float3(0.0), isnan(_6632)), level(0.0)).x;
    float3 _6643 = float3(_2264, _2266, _2256);
    float4 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6643, float3(0.0), isnan(_6643)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6643, float3(0.0), isnan(_6643)), level(0.0)).xyzw;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = _2277.w;
    float2 _6660 = float2(_2272, _2258);
    float3 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6660, float2(0.0), isnan(_6660)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6660, float2(0.0), isnan(_6660)), level(0.0)).xyz;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = float(uint(_1118));
    float _2299 = trunc(_1246);
    int _2301 = int(_2299);
    int _2303 = ~_1118;
    int _2305 = _2303 + 1;
    float _2307 = _1416 * _152;
    int _2309 = ~_1118;
    int _2311 = _2309 + 1;
    float _2313 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2315 = abs(_1108);
    float _2317 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2319 = abs(_1114);
    float _2321 = 1.0 / _2297;
    int _2323 = _1118 + (-1);
    float _2325 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2327 = float(uint(_2301));
    float _2329 = trunc(_2307);
    int _2331 = int(_2329);
    int _2333 = as_type<int>(_2321) + (-2);
    float _2335 = exp2(_2313);
    float _2337 = as_type<float>(_2333) * _2327;
    float _2339 = trunc(_2337);
    float _2341 = precise::max(_2339, 0.0);
    uint _2344 = uint(_2341);
    float _2346 = -_2335;
    float _2348 = _2346 + 1.0;
    float _2350 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2352 = _2305 * int(_2344);
    int _2354 = _2352 + _2301;
    float _2356 = float(uint(_2354));
    float _2358 = as_type<float>(_2333) * _2356;
    bool _2360 = !_1074;
    float _2362 = _2360 ? 7.345489978790283203125 : 1.0;
    float _2364 = trunc(_2358);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    float _2370 = _2362 * _1064;
    float _2372 = float(_2301);
    bool _2374 = _2372 >= _1388;
    bool _2376 = isnan(_2372);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan(_1388);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = floor(_2370);
    int _2388 = int(_2344) + int(_2368);
    float _2390 = trunc(_2384);
    int _2392 = int(_2390);
    int _2394 = _2311 * _2388;
    int _2396 = _2394 + _2301;
    float _2398 = -_2386;
    float _2400 = _2370 + _2398;
    bool _2402 = uint(_2396) >= uint(_1118);
    bool _2404 = !_2402;
    int _2406 = _2404 ? 0 : (-1);
    bool _2408 = _1118 == 0;
    int _2410 = ~_2388;
    int _2412 = _2410 + _2406;
    int _2414 = _2412 + 1;
    float _2416 = _2400 * _1388;
    int _2418 = ~_2392;
    int _2420 = _2418 + 1;
    int _2422 = _2420 + 1;
    int _2424 = _1118 * _2414;
    int _2426 = _2424 + _2301;
    float _2428 = trunc(_2416);
    int _2430 = int(_2428);
    int _2432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2434 = _2432 != 0;
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2438 = _2436 != 0;
    bool _2440 = !_2408;
    int _2442 = _2440 ? _2426 : (-1);
    bool _2444 = !_2434;
    int _2446 = _2444 ? 0 : 1;
    int _2448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2450 = _2448 != 0;
    int _2452 = _2442 * _2422;
    int _2454 = abs(_1102);
    int _2456 = abs(_2446);
    int _2458 = _2392 * _2323;
    int _2460 = _2458 + _2452;
    bool _2462 = !_2450;
    int _2464 = _2462 ? 0 : 1;
    int _2466 = _2460 * _2454;
    int _2468 = abs(_2464);
    int _2470 = _2430 * _2456;
    int _2472 = _2470 + _2301;
    int _2474 = _2331 * _2315;
    int _2476 = _2474 + _2466;
    float _2478 = in.m_53.w;
    int _2480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2482 = _2480 != 0;
    int _2484 = _2472 * _2319;
    int _2486 = _2484 + _2476;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2494 = _2492 != 0;
    int _2496 = _2430 * _2468;
    int _2498 = _2496 + _2486;
    int _2500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2502 = _2500 != 0;
    float _2504 = in.m_63.y;
    float _2506 = 1.0 / _2490;
    int _2508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2510 = _2508 != 0;
    float _2512 = float(uint(_2498));
    float _2514 = as_type<float>(_2333) * _2512;
    int _2516 = ~_1118;
    int _2518 = _2516 + 1;
    float _2520 = trunc(_2514);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    bool _2526 = _2478 > 0.5;
    float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2530 = _2528 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2532 = 1.0 / _2530;
    int _2534 = _2518 * int(_2524);
    int _2536 = _2534 + _2498;
    float _2538 = float(uint(_2536));
    float _2540 = as_type<float>(_2333) * _2538;
    float _2542 = trunc(_2540);
    float _2544 = precise::max(_2542, 0.0);
    uint _2546 = uint(_2544);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2548 = -_2504;
    float _2550 = _2548 + 1.0;
    int _2552 = _2526 ? as_type<int>(_2550) : as_type<int>(_2504);
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2556 = _2554 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2558 = _1078 > 0.5;
    int _2560 = ~_1118;
    int _2562 = _2560 + 1;
    float _2564 = 1.0 / _2556;
    int _2566 = int(_2524) + int(_2546);
    float _2568 = _2482 ? as_type<float>(_2552) : _2504;
    float _2570 = _2504;
    bool _2572 = _2438;
    bool _2574 = _2482;
    if (_2438)
    {
        float _2576 = _2558 ? _2550 : _2504;
        _2570 = _2576;
    }
    float _2578 = _2570;
    int _2580 = _2562 * _2566;
    int _2582 = _2580 + _2498;
    float _2584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2494)
    {
        bool _2586 = _1070 > 0.5;
        _2572 = _2586;
    }
    bool _2588 = _2572;
    bool _2590 = uint(_2582) >= uint(_1118);
    float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2592;
    if (_2502)
    {
        bool _2596 = _1064 > 0.5;
        _2574 = _2596;
    }
    bool _2598 = _2574;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2604 = !_2590;
    int _2606 = _2604 ? 0 : (-1);
    float _2608 = _2594 * _2506;
    float _2610 = _2602 * _2532;
    int _2612 = ~_2566;
    int _2614 = _2612 + _2606;
    int _2616 = _2614 + 1;
    float _2618 = in.m_63.x;
    float _2620 = float(uint(_2472));
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2622;
    bool _2626 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2628 = isnan(_1062);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2634 = _2630 || _2632;
    float _2636 = float(_2634);
    int _2638 = _1118 * _2616;
    int _2640 = _2638 + _2498;
    int _2642 = ~_1118;
    int _2644 = _2642 + 1;
    float _2646 = _2624 * _2564;
    float _2648 = as_type<float>(_2333) * _2620;
    float _2650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2652 = _1062 + _2650;
    float _2654 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2656 = _1062 + _2654;
    bool _2658 = !_2408;
    int _2660 = _2658 ? _2640 : (-1);
    float _2662 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2664 = fma(_2608, _2652, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2668 = _1062 + _2666;
    float _2670 = trunc(_2648);
    float _2672 = precise::max(_2670, 0.0);
    uint _2674 = uint(_2672);
    float _2676 = fma(_2610, _2656, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2678 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2680 = isnan(_1062);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = fma(_2646, _2668, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2692 = _2660 >> 31;
    float _2694 = fma(_2568, _2662, -0.5);
    bool _2696 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2698 = isnan(_1062);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2704 = _2700 || _2702;
    float _2706 = float(_2704);
    float _2708 = -_2688;
    float _2710 = _2708 + 1.0;
    int _2712 = _2692 & 3;
    float _2714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2716 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2718 = isnan(_1062);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2724 = _2720 || _2722;
    float _2726 = float(_2724);
    float _2728 = _2706 * _2710;
    int _2730 = _2660 + _2712;
    float _2732 = -_2706;
    float _2734 = _2732 + 1.0;
    float _2736 = _2710;
    int _2738 = as_type<int>(_2664);
    float _2740 = _2618;
    if (!_2502)
    {
        _2736 = _2618;
    }
    float _2742 = _2736;
    int _2744 = 0;
    float _2746 = _2742;
    if (_2494)
    {
        float _2748 = -_2618;
        float _2750 = _2748 + 1.0;
        _2744 = as_type<int>(_2750);
    }
    int _2752 = _2744;
    int _2754 = _2730 >> 2;
    float _2756 = _2726 * _2734;
    float _2758 = -_2726;
    float _2760 = _2758 + 1.0;
    int _2762 = _2644 * int(_2674);
    int _2764 = _2762 + _2472;
    int _2766 = _2754 << 4;
    int _2768 = _2766 + 368;
    float _2770 = -_1372;
    float _2772 = fma(_1392, _2694, _2770);
    float _2774 = _2636 * _2760;
    float _2776 = -_2636;
    float _2778 = _2776 + 1.0;
    float _2780 = float(uint(_2764));
    float _2782 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2784 = uint(int(uint(_2768) >> uint(2)));
    uint _2786 = uint(int(uint(int(_2784)) >> uint(2)));
    int _2788 = int(_2784) & 3;
    float _2790 = (*spvDescriptorSet0.vp_c9)._m0[int(_2786)][_2788];
    int _2792 = int(_2784) + 1;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    int _2796 = _2792 & 3;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[int(_2794)][_2796];
    float _2800 = _2664 * _2774;
    if (_2502)
    {
        float _2802 = -_2618;
        float _2804 = _2802 + 1.0;
        _2738 = as_type<int>(_2804);
    }
    int _2806 = _2738;
    float _2808 = as_type<float>(_2333) * _2780;
    float _2810 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2578, -0.5);
    float _2812 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2800);
    if (_2502)
    {
        float _2814 = _2598 ? as_type<float>(_2806) : _2618;
        _2746 = _2814;
    }
    float _2816 = _2746;
    float _2818 = -_1164;
    float _2820 = fma(_1362, _2810, _2818);
    float _2822 = trunc(_2808);
    float _2824 = precise::max(_2822, 0.0);
    uint _2826 = uint(_2824);
    int _2828 = _2660 & 3;
    bool _2830 = _2828 != 0;
    int _2832 = _2768 + 8;
    uint _2834 = uint(int(uint(_2832) >> uint(2)));
    uint _2836 = uint(int(uint(int(_2834)) >> uint(2)));
    int _2838 = int(_2834) & 3;
    float _2840 = (*spvDescriptorSet0.vp_c9)._m0[int(_2836)][_2838];
    int _2842 = int(_2834) + 1;
    uint _2844 = uint(int(uint(_2842) >> uint(2)));
    int _2846 = _2842 & 3;
    float _2848 = (*spvDescriptorSet0.vp_c9)._m0[int(_2844)][_2846];
    if (_2494)
    {
        float _2850 = _2588 ? as_type<float>(_2752) : _2618;
        _2740 = _2850;
    }
    float _2852 = _2740;
    float _2854 = fma(_2676, _2756, _2812);
    bool _2856 = uint(_2828) > 1u;
    int _2858 = _2660 & 3;
    bool _2860 = _2858 != 0;
    float _2862 = fma(_2690, _2728, _2854);
    float _2864 = fma(_2782, _2852, -0.5);
    int _2866 = ~_1118;
    int _2868 = _2866 + 1;
    int _2870 = _2860 ? 0 : 1;
    float _2872 = fma(_2816, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2874 = fma(_1366, _2864, _1242);
    int _2876 = int(_2674) + int(_2826);
    int _2878 = ~_2870;
    int _2880 = _2878 + 1;
    int _2882 = _2880 + 1;
    float _2884 = fma(_1344, _2872, _1144);
    int _2886 = _2882;
    if (!_2856)
    {
        int _2888 = ~_2870;
        int _2890 = _2888 + 1;
        _2886 = _2890;
    }
    int _2892 = _2886;
    int _2894 = _2868 * _2876;
    int _2896 = _2894 + _2472;
    bool _2898 = _2828 != 3;
    int _2900 = abs(_2892);
    float _2902 = _2350 * _2274;
    bool _2904 = uint(_2896) >= uint(_1118);
    float _2906 = fma(_2688, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2862);
    bool _2908 = uint(_2828) >= 2u;
    bool _2910 = !_2904;
    int _2912 = _2910 ? 0 : (-1);
    int _2914 = ~_2900;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    int _2920 = _2908 ? 0 : 1;
    int _2922 = ~_2876;
    int _2924 = _2922 + _2912;
    int _2926 = _2924 + 1;
    int _2928 = _2918 * as_type<int>(_2798);
    bool _2930 = !_2830;
    int _2932 = _2930 ? 0 : 1;
    int _2934 = ~_2920;
    int _2936 = _2934 + 1;
    int _2938 = _2936 + 1;
    int _2940 = _1118 * _2926;
    int _2942 = _2940 + _2472;
    bool _2944 = _2828 != 3;
    float _2946 = _2772 + 0.5;
    int _2948 = _2938;
    if (_2898)
    {
        int _2950 = ~_2920;
        int _2952 = _2950 + 1;
        _2948 = _2952;
    }
    int _2954 = _2948;
    float _2956 = _2820 + 0.5;
    int _2958 = abs(_2932);
    float _2960 = _2884 + 0.5;
    bool _2962 = !_2944;
    int _2964 = _2962 ? 0 : (-1);
    int _2966 = abs(_2954);
    int _2968 = ~_2958;
    int _2970 = _2968 + 1;
    int _2972 = _2970 + 1;
    int _2974 = abs(_2964);
    float _2976 = _2874 + 0.5;
    int _2978 = ~_2966;
    int _2980 = _2978 + 1;
    int _2982 = _2980 + 1;
    int _2984 = _2972 * as_type<int>(_2790);
    int _2986 = _2984 + _2928;
    bool _2988 = !_2510;
    int _2990 = _2988 ? 0 : 1;
    float _2992 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2994 = ~_2974;
    int _2996 = _2994 + 1;
    int _2998 = _2996 + 1;
    int _3000 = _2982 * as_type<int>(_2840);
    int _3002 = _3000 + _2986;
    int _3004 = abs(_2990);
    out.m_67.x = _2960;
    out.m_67.y = _2956;
    out.m_67.z = _2976;
    out.m_67.w = _2946;
    float _3006 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2992);
    int _3008 = _2998 * as_type<int>(_2848);
    int _3010 = _3008 + _3002;
    float _3012 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3006);
    float _3014 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3012);
    float _3016 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3018 = ~_3004;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    float _3024 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3026 = _2325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3028 = !_2408;
    int _3030 = _3028 ? _2942 : (-1);
    float _3032 = _1898 * _1956;
    int _3034 = _3010 * _3022;
    float _3036 = _3016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3038 = _2906 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3040 = _3032 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3042 = _3030 * _3004;
    int _3044 = _3042 + _3034;
    float _3046 = _3014 + _2216;
    bool _3048 = _1898 > 0.0;
    bool _3050 = isnan(_1898);
    bool _3052 = _3048 || _3050;
    bool _3054 = isnan(0.0);
    bool _3056 = _3052 || _3054;
    float _3058 = _3040 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _3026;
    out.m_69.y = _3024;
    out.m_69.z = _3036;
    out.m_69.w = _3038;
    float _3060 = _3046 * 0.5;
    bool _3062 = _1956 <= 0.0;
    bool _3064 = !_3056;
    bool _3066 = _3062 || _3064;
    float _3068 = float(_3044);
    float _3070 = _2295 * _2902;
    out.m_49.x = _3058;
    out.m_71.x = _3068;
    float _3072 = _2285 * _2902;
    float _3074 = -_2350;
    float _3076 = _3074 + 1.0;
    out.gl_Position.x = _2242;
    out.gl_Position.y = _2244;
    out.gl_Position.z = _3014;
    out.gl_Position.w = _2216;
    float _3078 = fma(_2291, _3072, _2279);
    float _3080 = fma(_2293, _3072, _2281);
    float _3082 = _2285 * _3076;
    float _3084 = fma(_2285, _3070, _2283);
    out.m_73.z = _3060;
    out.m_73.w = _2216;
    out.m_75.x = _3078;
    out.m_75.y = _3080;
    out.m_75.z = _3084;
    out.m_75.w = _3082;
    if (!_3066)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3086 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3086;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _794 = false;
    bool _696 = false;
    bool _360 = false;
    bool _198 = false;
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
        float _3155 = as_type<float>(_118);
        out.gl_Position.z = _3155;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3210 = as_type<float>(_144);
        out.gl_Position.z = _3210;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _178 = _156;
    float _196;
    if (!_176)
    {
        float _180 = in.m_53.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        _196 = _156;
    }
    _198 = false;
    float _200 = _196;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = _200 + _202;
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _220 = _200 + _218;
    bool _222 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_200);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _242 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_200);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = 1.0 / _240;
    float _256 = -_252;
    float _258 = _256 + 1.0;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _232 * _258;
    float _264 = -_232;
    float _266 = _264 + 1.0;
    float _268 = 1.0 / _236;
    float _270 = _220 * _254;
    float _272 = _204 * _268;
    float _274 = -_216;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _252 * _276;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = fma(_280, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = fma(_286, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _296 = fma(_290, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _298 = _292 * _262;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = _294 * _262;
    float _306 = _296 * _262;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _310 = _308 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _316 = fma(_302, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _304);
    float _320 = fma(_310, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _322 = fma(_314, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _324 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _326 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _306);
    float _328 = fma(_320, _282, _318);
    float _330 = fma(_316, _282, _324);
    float _332 = fma(_322, _282, _326);
    float _334 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].x, _328);
    float _336 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].y, _330);
    float _338 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[145].z, _332);
    bool _340 = !_260;
    float _358;
    if (!_340)
    {
        float _342 = in.m_53.x;
        float _344 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _346 = _342 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _348 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _350 = _348 * _344;
        float _352 = floor(_350);
        float _354 = -_352;
        float _356 = _350 + _354;
        _358 = _356;
        _360 = true;
    }
    else
    {
        _358 = _156;
    }
    _360 = false;
    float _362 = _358;
    float _364 = in.m_55.x;
    float _366 = in.m_55.y;
    float _368 = in.m_55.z;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _378;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _386 = 1.0 / _372;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _388;
    float _392 = 1.0 / _376;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _396 = _362 + _394;
    bool _398 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _400 = isnan(_362);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    bool _410 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _412 = isnan(_362);
    bool _414 = _410 || _412;
    bool _416 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _418 = _414 || _416;
    float _420 = float(_418);
    float _422 = _338 * _368;
    float _424 = _336 * _366;
    float _426 = 1.0 / _380;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _430 = _362 + _428;
    float _432 = _396 * _386;
    bool _434 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _436 = isnan(_362);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _448 = _362 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _452 = _362 + _450;
    bool _454 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _456 = isnan(_362);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -_408;
    float _468 = _466 + 1.0;
    float _470 = 1.0 / _384;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _474 = _362 + _472;
    float _476 = _430 * _392;
    bool _478 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _480 = isnan(_362);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -_444;
    float _492 = _490 + 1.0;
    float _494 = -_420;
    float _496 = _494 + 1.0;
    float _498 = _464 * _468;
    float _500 = -_464;
    float _502 = _500 + 1.0;
    float _504 = 1.0 / _390;
    float _506 = _448 * _426;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _508;
    float _512 = _488 * _492;
    float _514 = -_488;
    float _516 = _514 + 1.0;
    float _518 = fma(_510, _432, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _520 = _474 * _470;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _522;
    float _526 = _420 * _516;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _532 = fma(_524, _432, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _534 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _536 = fma(_530, _476, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _538 = _452 * _504;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _540;
    float _544 = _334 * _364;
    float _546 = fma(_542, _432, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _548 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _550 = isnan(_362);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _556 = _552 || _554;
    float _558 = float(_556);
    float _560 = _408 * _496;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _570 = _558 * _502;
    float _572 = fma(_564, _476, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _574 = fma(_568, _476, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _576;
    float _580 = _532 * _570;
    float _582 = _546 * _570;
    float _584 = _518 * _570;
    float _586 = -_558;
    float _588 = _586 + 1.0;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _594;
    float _598 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].x, _580);
    float _600 = fma(_592, _506, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _606 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].y, _582);
    float _608 = fma(_572, _498, _598);
    float _610 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[107].z, _584);
    float _612 = fma(_596, _506, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _614 = fma(_604, _520, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _616 = fma(_600, _560, _608);
    float _618 = fma(_578, _506, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _620 = fma(_536, _498, _606);
    float _622 = fma(_574, _498, _610);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _632 = fma(_618, _560, _622);
    float _634 = fma(_626, _520, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _640;
    float _644 = fma(_630, _520, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _646 = fma(_612, _560, _620);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _648;
    float _652 = fma(_638, _538, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _654 = fma(_642, _538, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _656 = fma(_614, _526, _616);
    float _658 = fma(_650, _538, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _660 = fma(_634, _526, _646);
    float _662 = fma(_644, _526, _632);
    float _664 = fma(_652, _512, _656);
    float _666 = fma(_654, _512, _660);
    float _668 = fma(_658, _512, _662);
    float _670 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[112].x, _664);
    float _672 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[112].y, _666);
    float _674 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[112].z, _668);
    bool _676 = !_534;
    float _694;
    if (!_676)
    {
        float _678 = in.m_53.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        _694 = _156;
    }
    _696 = false;
    float _698 = _694;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _702 = _698 + _700;
    bool _704 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _706 = isnan(_698);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _720 = _698 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _722 = isnan(_698);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _732;
    float _736 = _670 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _738 = -_714;
    float _740 = _738 + 1.0;
    bool _742 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _744 = 1.0 / _718;
    float _746 = _730 * _740;
    float _748 = -_730;
    float _750 = _748 + 1.0;
    float _752 = _734 * _744;
    float _754 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _756 = fma(_752, _702, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _758 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _756 * _746;
    float _762 = _672 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _764 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[115].x, _760);
    float _766 = _762 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _768 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[116].x, _764);
    float _770 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _772 = _768 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _770;
    out.m_57.y = _766;
    out.m_57.z = _758;
    out.m_57.w = _772;
    bool _774 = !_742;
    float _792;
    if (!_774)
    {
        float _776 = in.m_53.x;
        float _778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _780 = _776 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _782 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _784 = _782 * _778;
        float _786 = floor(_784);
        float _788 = -_786;
        float _790 = _784 + _788;
        _792 = _790;
        _794 = true;
    }
    else
    {
        _792 = _156;
    }
    _794 = false;
    float _796 = _792;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _800 = _796 + _798;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _804 = _796 + _802;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _808 = _796 + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _824 = _822 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _826 = 1.0 / _812;
    bool _828 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _830 = isnan(_796);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _836 = _832 || _834;
    float _838 = float(_836);
    float _840 = 1.0 / _824;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _844 = _796 + _842;
    bool _846 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _848 = isnan(_796);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    bool _858 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _860 = 1.0 / _820;
    float _862 = _800 * _826;
    bool _864 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _866 = isnan(_796);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = 1.0 / _816;
    float _878 = _844 * _840;
    bool _880 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _882 = isnan(_796);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -_874;
    float _894 = _892 + 1.0;
    float _896 = _890 * _894;
    float _898 = _804 * _860;
    bool _900 = _796 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _902 = isnan(_796);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = -_890;
    float _914 = _912 + 1.0;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _916;
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _920;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _926 = _924 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _928 = _910 * _914;
    float _930 = fma(_918, _862, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _932 = _808 * _876;
    float _934 = -_910;
    float _936 = _934 + 1.0;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _938;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _950 = _838 * _936;
    float _952 = -_838;
    float _954 = _952 + 1.0;
    float _956 = fma(_940, _862, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _958 = fma(_922, _862, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _960 = fma(_926, _932, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _962 = _856 * _954;
    float _964 = fma(_944, _932, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _966 = fma(_948, _932, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _968 = -_856;
    float _970 = _968 + 1.0;
    float _972 = _930 * _962;
    float _974 = _956 * _962;
    float _976 = _958 * _962;
    float _978 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].x, _972);
    float _980 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].y, _974);
    float _982 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[123].z, _976);
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _992;
    float _996 = fma(_960, _950, _978);
    float _998 = fma(_966, _950, _982);
    float _1000 = fma(_986, _898, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1002 = fma(_990, _898, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1004 = fma(_964, _950, _980);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1014 = fma(_994, _898, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1018 = _1016 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1020 = fma(_1000, _928, _996);
    float _1022 = fma(_1008, _878, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1024 = fma(_1012, _878, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1026 = fma(_1002, _928, _1004);
    float _1028 = fma(_1018, _878, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1030 = fma(_1014, _928, _998);
    float _1032 = fma(_1022, _896, _1020);
    float _1034 = fma(_1024, _896, _1026);
    float _1036 = fma(_1028, _896, _1030);
    float _1038 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1032);
    float _1040 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1034);
    float _1042 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1036);
    bool _1044 = !_858;
    if (!_1044)
    {
        float _1046 = in.m_53.x;
        float _1048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1050 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1052 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1054 = _1052 * _1048;
        float _1056 = floor(_1054);
        float _1058 = -_1056;
        float _1060 = _1054 + _1058;
        _178 = _1060;
    }
    float _1062 = _178;
    float _1064 = in.m_53.x;
    float _1066 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1068 = log2(_1066);
    float _1070 = in.m_53.z;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1074 = _1072 != 0;
    float _1076 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1078 = in.m_53.y;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1090 = _1088 != 0;
    float _1092 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1094 = int(_1092);
    float _1096 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = _422 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1100 = !_1086;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1106 = !_1082;
    int _1108 = _1106 ? 0 : 1;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1112 = !_1090;
    int _1114 = _1112 ? 0 : 1;
    float _1116 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1118 = int(_1116);
    float _1120 = _1064 * 2.0;
    float _1122 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1126 = float(_1094);
    float _1128 = _1070 * 2.0;
    float _1130 = floor(_1120);
    float _1132 = -_1104;
    float _1134 = fma(_1122, 2.0, _1132);
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1138 = _1078 * 2.0;
    float _1140 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1142 = -_100;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1134);
    float _1146 = floor(_1128);
    float _1148 = _1064 + _1078;
    float _1150 = fma(_1140, -2.0, _1110);
    float _1152 = _1140;
    if (!_1074)
    {
        _1152 = _1070;
    }
    float _1154 = _1152;
    float _1156 = _1148 + (-1.0);
    float _1158 = _1154;
    float _1160 = _1156;
    if (_1074)
    {
        _1158 = _1078;
    }
    float _1162 = _1158;
    float _1164 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1150);
    bool _1166 = _1130 > 0.0;
    float _1168 = floor(_1138);
    bool _1170 = _1130 >= 0.0;
    bool _1172 = isnan(_1130);
    bool _1174 = _1170 || _1172;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    float _1180 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1182 = _1162;
    if (!_1074)
    {
        _1160 = _1078;
    }
    float _1184 = _1160;
    bool _1186 = _1146 >= 0.0;
    bool _1188 = isnan(_1146);
    bool _1190 = _1186 || _1188;
    bool _1192 = isnan(0.0);
    bool _1194 = _1190 || _1192;
    float _1196 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1198 = _1184;
    if (_1074)
    {
        _1198 = _1064;
    }
    float _1200 = _1198;
    float _1202 = 1.0 / _1126;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1214 = _1212 != 0;
    int _1216 = _1194 ? 0 : 1;
    float _1218 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1220 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1196);
    bool _1222 = !_1206;
    int _1224 = _1222 ? 0 : 1;
    bool _1226 = _1146 > 0.0;
    float _1228 = -_1124;
    float _1230 = fma(_1218, 2.0, _1228);
    int _1232 = ~_1216;
    int _1234 = _1232 + 1;
    int _1236 = _1234 + 1;
    int _1238 = _1178 ? 0 : 1;
    float _1240 = -_100;
    float _1242 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1230);
    bool _1244 = _1168 > 0.0;
    float _1246 = _1202 * _100;
    bool _1248 = _1168 >= 0.0;
    bool _1250 = isnan(_1168);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan(0.0);
    bool _1256 = _1252 || _1254;
    float _1258 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1260 = abs(_1224);
    int _1262 = _1236;
    if (!_1226)
    {
        int _1264 = ~_1216;
        int _1266 = _1264 + 1;
        _1262 = _1266;
    }
    int _1268 = _1262;
    float _1270 = _1068 * _100;
    int _1272 = _1256 ? 0 : 1;
    float _1274 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1258);
    if (!_1074)
    {
        _1182 = _1070;
    }
    float _1276 = _1182;
    float _1278 = _1276;
    if (_1074)
    {
        _1278 = _1078;
    }
    float _1280 = _1278;
    float _1282 = exp2(_1270);
    int _1284 = ~_1272;
    int _1286 = _1284 + 1;
    int _1288 = _1286 + 1;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1294 = float(_1268);
    float _1296 = fma(_1290, -2.0, _1136);
    int _1298 = _1288;
    if (!_1244)
    {
        int _1300 = ~_1272;
        int _1302 = _1300 + 1;
        _1298 = _1302;
    }
    int _1304 = _1298;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1308 = float(_1260);
    float _1310 = in.m_59.x;
    float _1312 = in.m_59.y;
    float _1314 = in.m_59.z;
    int _1316 = ~_1238;
    int _1318 = _1316 + 1;
    int _1320 = _1318 + 1;
    float _1322 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1306);
    float _1324 = _1308 * _1294;
    float _1326 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1292);
    bool _1328 = !_1210;
    int _1330 = _1328 ? 0 : 1;
    float _1332 = -_1282;
    float _1334 = _1332 + 1.0;
    int _1336 = _1320;
    if (!_1166)
    {
        int _1338 = ~_1238;
        int _1340 = _1338 + 1;
        _1336 = _1340;
    }
    int _1342 = _1336;
    float _1344 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1326);
    bool _1346 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1348 = isnan(0.0);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1354 = _1350 || _1352;
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1358 = 1.0 + _1356;
    int _1360 = abs(_1330);
    float _1362 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1322);
    float _1364 = _1354 ? _1334 : 0.0;
    float _1366 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1220);
    float _1368 = 1.0 / _1358;
    float _1370 = float(_1342);
    float _1372 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1296);
    float _1374 = float(_1360);
    float _1376 = _1324 * (-2.0);
    bool _1378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1380 = isnan(1.0);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1118);
    float _1390 = _1374 * _1370;
    float _1392 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1274);
    bool _1394 = !_1214;
    int _1396 = _1394 ? 0 : 1;
    float _1398 = fma(_1376, _1310, _1310);
    float _1400 = _1064 + (-0.5);
    float _1402 = fma(_1180, _1376, _1180);
    int _1404 = abs(_1396);
    float _1406 = _1078 + _1070;
    float _1408 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1398);
    float _1410 = float(_1304);
    float _1412 = _1390 * (-2.0);
    float _1414 = _1406 + (-1.0);
    float _1416 = _1388 * _100;
    float _1418 = float(_1404);
    if (_1386)
    {
        float _1420 = _1364 * _1368;
        _110 = _1420;
    }
    float _1422 = _110;
    float _1424 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1426 = _1418 * _1410;
    float _1428 = _1078 + (-0.5);
    float _1430 = fma(_1412, _1312, _1312);
    float _1432 = fma(_1424, _1412, _1424);
    float _1434 = _1064 + _1070;
    float _1436 = _1426 * (-2.0);
    float _1438 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1430);
    float _1440 = fma(_1402, _1422, _1408);
    float _1442 = in.m_61.x;
    float _1444 = in.m_61.y;
    float _1446 = in.m_61.z;
    float _1448 = _1434 + (-1.0);
    float _1450 = fma(_1432, _1422, _1438);
    float _1452 = _1440 * 0.15915493667125701904296875;
    float _1454 = fma(_1448, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1456 = fma(_1436, _1314, _1314);
    float _1458 = _1070 + (-0.5);
    float _1460 = _1450 * 0.15915493667125701904296875;
    float _1462 = fma(_1454, _1436, _1454);
    float _1464 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1456);
    float _1466 = _1452 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = fma(_1462, _1422, _1464);
    float _1472 = _1470 * 0.15915493667125701904296875;
    float _1474 = _1452 * 6.283185482025146484375;
    float _1476 = cos(_1474);
    float _1478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1442);
    float _1480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1444);
    float _1482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1446);
    float _1484 = _1460 * 6.283185482025146484375;
    float _1486 = sin(_1484);
    float _1488 = _1076 * _1480;
    float _1490 = _1096 * _1478;
    float _1492 = _1098 * _1482;
    float _1494 = _1460 * 6.283185482025146484375;
    float _1496 = cos(_1494);
    float _1498 = _1472 * 6.283185482025146484375;
    float _1500 = cos(_1498);
    float _1502 = in.m_42.x;
    float _1504 = in.m_42.y;
    float _1506 = in.m_42.z;
    float _1508 = _1468 * _1486;
    float _1510 = _1476 * _1486;
    float _1512 = _1472 * 6.283185482025146484375;
    float _1514 = sin(_1512);
    float _1516 = _1476 * _1496;
    float _1518 = _1496 * _1500;
    float _1520 = _1500 * _1488;
    float _1522 = _1468 * _1496;
    float _1524 = _1486 * _1500;
    float _1526 = _1476 * _1520;
    float _1528 = _1468 * _1520;
    float _1530 = fma(_1514, _1516, _1508);
    float _1532 = -_1510;
    float _1534 = fma(_1514, _1522, _1532);
    float _1536 = -_1488;
    float _1538 = _1514 * _1536;
    float _1540 = -_1522;
    float _1542 = fma(_1514, _1510, _1540);
    float _1544 = fma(_1530, _1490, _1526);
    float _1546 = fma(_1514, _1508, _1516);
    float _1548 = fma(_1518, _1490, _1538);
    float _1550 = fma(_1534, _1490, _1528);
    float _1552 = fma(_1542, _1492, _1544);
    float _1554 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1556 = fma(_1524, _1492, _1548);
    float _1558 = fma(_1546, _1492, _1550);
    float _1560 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1562 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1564 = fma(_1502, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1554);
    float _1566 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1568 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1560);
    float _1570 = fma(_1502, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1562);
    float _1572 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1564);
    float _1574 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1566);
    float _1576 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1568);
    float _1578 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1570);
    float _1580 = _1572 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1582 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1574);
    float _1584 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1586 = _1578 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1588 = _1504 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1590 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1592 = _1580 + _1584;
    float _1594 = _1552 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1596 = fma(_1502, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1588);
    float _1598 = _1586 + _1590;
    float _1600 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1602 = _1592 + _1600;
    float _1604 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1594);
    float _1606 = fma(_1506, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1596);
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1610 = _1598 + _1608;
    float _1612 = _1602 * _1602;
    float _1614 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1604);
    float _1616 = _1606 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1618 = fma(_1610, _1610, _1612);
    float _1620 = _1614 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1622 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1624 = sqrt(_1618);
    float _1626 = _1616 + _1620;
    float _1628 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1622);
    float _1630 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1628);
    bool _1632 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1634 = _1628;
    float _1636 = _1502;
    float _1638 = _1506;
    float _1640 = _1490;
    if (!_1632)
    {
        _1634 = _1598;
    }
    float _1642 = _1634;
    float _1644 = _1642;
    if (!_1632)
    {
        _1636 = _1592;
    }
    float _1646 = _1636;
    float _1648 = _1646;
    if (!_1632)
    {
        _1638 = _1626;
    }
    float _1650 = _1638;
    bool _1652 = !_1632;
    float _1654 = _1650;
    if (!_1652)
    {
        float _1656 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1660 = _1624 + _1658;
        float _1662 = _1626 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1664 = rsqrt(_1618);
        float _1666 = _1660 * _1656;
        float _1668 = _1666 * 0.15915493667125701904296875;
        float _1670 = _1668 * 6.283185482025146484375;
        float _1672 = cos(_1670);
        float _1674 = _1668 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 + (-1.0);
        float _1680 = fma(_1676, _1662, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1682 = _1678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1684 = _1664 * _1680;
        float _1686 = fma(_1626, _1672, _1682);
        float _1688 = fma(_1610, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1690 = fma(_1602, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1654 = _1686;
        _1644 = _1688;
        _1648 = _1690;
    }
    float _1692 = _1654;
    float _1694 = _1644;
    float _1696 = _1648;
    float _1698 = -_1616;
    float _1700 = _1698 + _1692;
    float _1702 = -_1586;
    float _1704 = _1702 + _1694;
    float _1706 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1708 = _1616 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1710 = _1700 * _1700;
    float _1712 = -_1580;
    float _1714 = _1712 + _1696;
    float _1716 = 1.0 / _1706;
    float _1718 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1708);
    float _1720 = fma(_1704, _1704, _1710);
    bool _1722 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1724 = isnan(0.5);
    bool _1726 = _1722 || _1724;
    bool _1728 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1730 = _1726 || _1728;
    float _1732 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1718);
    float _1734 = fma(_1714, _1714, _1720);
    float _1736 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1738 = sqrt(_1734);
    float _1740 = _1736 + _1706;
    float _1742 = _1706;
    float _1744 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1746 = _1694;
    float _1748 = _1696;
    float _1750 = _1714;
    if (_1730)
    {
        _1742 = 1.0;
    }
    float _1752 = _1742;
    float _1754 = _1740 * _1716;
    float _1756 = _1754 * 0.5;
    float _1758 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1760 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1758);
    float _1762 = 1.0 / _1760;
    bool _1764 = _1738 > 0.0;
    float _1766 = _1738;
    float _1768 = _1752;
    if (!_1764)
    {
        _1766 = _1692;
    }
    float _1770 = _1766;
    bool _1772 = !_1764;
    float _1774 = _1770;
    if (!_1772)
    {
        float _1776 = _172 * _172;
        float _1778 = fma(_170, _170, _1776);
        float _1780 = fma(_174, _174, _1778);
        float _1782 = rsqrt(_1734);
        float _1784 = sqrt(_1780);
        float _1786 = _1704 * _1782;
        float _1788 = _1700 * _1782;
        float _1790 = _1714 * _1782;
        bool _1792 = _1784 > 0.0;
        float _1794 = _1782;
        _1744 = _1784;
        if (!_1792)
        {
            _1794 = _1692;
        }
        float _1796 = _1794;
        bool _1798 = !_1792;
        _1774 = _1796;
        if (!_1798)
        {
            float _1800 = rsqrt(_1780);
            float _1802 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1804 = _172 * _1800;
            float _1806 = _170 * _1800;
            float _1808 = _174 * _1800;
            float _1810 = _1788 * _1804;
            float _1812 = fma(_1786, _1806, _1810);
            float _1814 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1816 = fma(_1790, _1808, _1812);
            float _1818 = _1816 * _1814;
            float _1820 = fma(_170, _1818, _1694);
            float _1822 = fma(_172, _1818, _1692);
            float _1824 = fma(_174, _1818, _1696);
            _1744 = _1806;
            _1774 = _1822;
            _1746 = _1820;
            _1748 = _1824;
            _1750 = _1818;
        }
    }
    float _1826 = _1744;
    float _1828 = _1774;
    float _1830 = _1746;
    float _1832 = _1748;
    float _1834 = _1750;
    float _1836 = _1834;
    float _1838 = _1826;
    if (_1730)
    {
        _1836 = 1.0;
    }
    float _1840 = _1836;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1844 = _1762 * _1842;
    float _1846 = _1840;
    if (!_1730)
    {
        float _1848 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1850 = _1848 * 0.15915493667125701904296875;
        float _1852 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1854 = _1850 * 6.283185482025146484375;
        float _1856 = cos(_1854);
        float _1858 = _1852 * 0.15915493667125701904296875;
        float _1860 = _1850 * 6.283185482025146484375;
        float _1862 = sin(_1860);
        float _1864 = 1.0 / _1856;
        float _1866 = _1858 * 6.283185482025146484375;
        float _1868 = cos(_1866);
        float _1870 = _1862 * _1864;
        float _1872 = _1858 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        float _1876 = _1868 * _1870;
        float _1878 = 1.0 / _1876;
        float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1882 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1880;
        float _1884 = 1.0 / _1882;
        float _1886 = _1874 * _1878;
        float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1890 = fma(_1844, _1886, _1888);
        float _1892 = _1890 * _1884;
        float _1894 = precise::clamp(_1892, 0.0, 1.0);
        _1838 = _1864;
        _1768 = _1894;
    }
    float _1896 = _1838;
    float _1898 = _1768;
    float _1900 = _1896;
    if (!_1730)
    {
        float _1902 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1904 = _1902 * 0.15915493667125701904296875;
        float _1906 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1908 = _1904 * 6.283185482025146484375;
        float _1910 = cos(_1908);
        float _1912 = _1906 * 0.15915493667125701904296875;
        float _1914 = _1904 * 6.283185482025146484375;
        float _1916 = sin(_1914);
        float _1918 = 1.0 / _1910;
        float _1920 = _1912 * 6.283185482025146484375;
        float _1922 = cos(_1920);
        float _1924 = _1916 * _1918;
        float _1926 = _1912 * 6.283185482025146484375;
        float _1928 = sin(_1926);
        float _1930 = _1922 * _1924;
        float _1932 = 1.0 / _1930;
        float _1934 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1936 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1934;
        float _1938 = 1.0 / _1936;
        float _1940 = _1928 * _1932;
        float _1942 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1944 = fma(_1844, _1940, _1942);
        float _1946 = _1944 * _1938;
        float _1948 = precise::clamp(_1946, 0.0, 1.0);
        float _1950 = -_1948;
        float _1952 = _1950 + 1.0;
        _1900 = _1932;
        _1846 = _1952;
    }
    float _1954 = _1900;
    float _1956 = _1846;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1960 = _1828 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1964 = _1830 + _1962;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1968 = _1832 + _1966;
    float _1970 = _1960 * _1960;
    float _1972 = fma(_1964, _1964, _1970);
    float _1974 = fma(_1968, _1968, _1972);
    float _1976 = rsqrt(_1974);
    float _1978 = sqrt(_1974);
    float _1980 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1982 = _1964 * _1980;
    float _1984 = _1968 * _1980;
    float _1986 = _1982 * _1982;
    float _1988 = _1984 * _1984;
    float _1990 = _1986 + _1988;
    float _1992 = sqrt(_1990);
    bool _1994 = _1992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1998 = _1992 + _1996;
    float _2000 = _1976;
    float _2002 = _1990;
    float _2004 = _1998;
    float _2006 = _1954;
    float _2008 = _1960;
    float _2010 = _1980;
    if (_1994)
    {
        float _2012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2000 = _2012;
    }
    float _2014 = _2000;
    if (_1994)
    {
        float _2016 = rsqrt(_1990);
        _2002 = _2016;
    }
    float _2018 = _2002;
    float _2020 = _2018;
    if (_1994)
    {
        float _2022 = _1998 * _2014;
        _2004 = _2022;
    }
    float _2024 = _2004;
    if (_1994)
    {
        float _2026 = _2024 * 0.15915493667125701904296875;
        _2006 = _2026;
    }
    float _2028 = _2006;
    float _2030 = _2014;
    if (_1994)
    {
        float _2032 = _2028 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _2030 = _2034;
    }
    float _2036 = _2030;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = precise::max(0.0, _2038);
    float _2042 = _1968;
    float _2044 = _2040;
    if (_1994)
    {
        float _2046 = _2028 * 6.283185482025146484375;
        float _2048 = cos(_2046);
        _2042 = _2048;
    }
    float _2050 = _2042;
    float _2052 = -_1980;
    float _2054 = -_2040;
    float _2056 = fma(_1960, _2052, _2054);
    if (_1994)
    {
        float _2058 = _2056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2044 = _2058;
    }
    float _2060 = _2044;
    float _2062 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2064 = _2060;
    float _2066 = _2036;
    if (_1994)
    {
        float _2068 = fma(_2036, _2060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2064 = _2068;
    }
    float _2070 = _2064;
    float _2072 = _2070;
    if (!_1994)
    {
        _2066 = _1982;
    }
    float _2074 = _2066;
    float _2076 = _2074;
    float _2078 = _2050;
    if (_1994)
    {
        float _2080 = _2050 + (-1.0);
        _2008 = _2080;
    }
    float _2082 = _2008;
    float _2084 = _2082;
    if (_1994)
    {
        float _2086 = _2018 * _2070;
        _1640 = _2086;
    }
    float _2088 = _1640;
    if (!_1994)
    {
        _2072 = _2056;
    }
    float _2090 = _2072;
    float _2092 = _2090;
    if (_1994)
    {
        float _2094 = _2082 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2010 = _2094;
    }
    float _2096 = _2010;
    if (_1994)
    {
        float _2098 = _1982 * _2088;
        _2076 = _2098;
    }
    float _2100 = _2076;
    if (!_1994)
    {
        _2084 = _1984;
    }
    float _2102 = _2084;
    float _2104 = _2102;
    if (_1994)
    {
        float _2106 = _1984 * _2088;
        _2104 = _2106;
    }
    float _2108 = _2104;
    if (!_1994)
    {
        _2020 = _1986;
    }
    float _2110 = _2020;
    float _2112 = _2110;
    if (_1994)
    {
        float _2114 = fma(_2056, _2050, _2096);
        _2092 = _2114;
    }
    float _2116 = _2092;
    if (_1994)
    {
        float _2118 = _2100 * _2100;
        _2112 = _2118;
    }
    float _2120 = _2112;
    if (!_1994)
    {
        _2078 = _1988;
    }
    float _2122 = _2078;
    float _2124 = _2122;
    if (_1994)
    {
        float _2126 = _2108 * _2108;
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = fma(_2116, _2116, _2120);
    float _2132 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2134 = _2130 + _2128;
    float _2136 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2062);
    float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2140 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2138);
    float _2142 = precise::clamp(_2140, 0.0, 1.0);
    float _2144 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2146 = rsqrt(_2134);
    float _2148 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2136);
    float _2150 = -_2142;
    float _2152 = _2150 + 1.0;
    float _2154 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2156 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2144);
    float _2158 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2160 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2154);
    float _2164 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2156);
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2168 = abs(_2152);
    float _2170 = log2(_2168);
    float _2172 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2162);
    float _2174 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2176 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = -_2166;
    float _2180 = fma(_2178, _2132, 1.0);
    float _2182 = _2172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2184 = _2146 * _2100;
    float _2186 = _2146 * _2116;
    float _2188 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2190 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2174);
    float _2192 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2194 = _2146 * _2108;
    float _2196 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2188);
    float _2198 = _2190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = -_2192;
    float _2202 = fma(_2186, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2200);
    float _2204 = log2(_2180);
    float _2206 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2196);
    float _2208 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2210 = -_2194;
    float _2212 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2202);
    float _2214 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2216 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2206);
    float _2218 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2220 = fma(_2212, -0.5, 0.5);
    float _2222 = exp2(_2208);
    float _2224 = fma(_2212, 0.5, 0.5);
    float _2226 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2214);
    float _2228 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2218);
    float _2230 = _2186 + 1.0;
    float _2232 = fma(_2224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2226);
    float _2236 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2228);
    float _2238 = 1.0 / _2216;
    float _2240 = fma(_2224, _2232, -0.212114393711090087890625);
    float _2242 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2234);
    float _2244 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2236);
    float _2246 = _2204 * 0.693147182464599609375;
    float _2248 = fma(_2224, _2240, 1.570728778839111328125);
    float _2250 = sqrt(_2220);
    float _2252 = -_2186;
    float _2254 = fma(_2222, _2230, _2252);
    float _2256 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2258 = fma(_2254, 0.5, 0.5);
    float _2260 = _2242 * _2238;
    float _2262 = _2244 * _2238;
    float _2264 = fma(_2260, 0.5, 0.5);
    float _2266 = fma(_2262, -0.5, 0.5);
    float _2268 = _2250 * 0.636619746685028076171875;
    float _2270 = -_2248;
    float _2272 = fma(_2268, _2270, 1.0);
    float3 _6632 = float3(_2264, _2266, _2256);
    float _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6632, float3(0.0), isnan(_6632)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6632, float3(0.0), isnan(_6632)), level(0.0)).x;
    float3 _6643 = float3(_2264, _2266, _2256);
    float4 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6643, float3(0.0), isnan(_6643)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6643, float3(0.0), isnan(_6643)), level(0.0)).xyzw;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = _2277.w;
    float2 _6660 = float2(_2272, _2258);
    float3 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6660, float2(0.0), isnan(_6660)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6660, float2(0.0), isnan(_6660)), level(0.0)).xyz;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = float(uint(_1118));
    float _2299 = trunc(_1246);
    int _2301 = int(_2299);
    int _2303 = ~_1118;
    int _2305 = _2303 + 1;
    float _2307 = _1416 * _152;
    int _2309 = ~_1118;
    int _2311 = _2309 + 1;
    float _2313 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2315 = abs(_1108);
    float _2317 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2319 = abs(_1114);
    float _2321 = 1.0 / _2297;
    int _2323 = _1118 + (-1);
    float _2325 = _1038 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2327 = float(uint(_2301));
    float _2329 = trunc(_2307);
    int _2331 = int(_2329);
    int _2333 = as_type<int>(_2321) + (-2);
    float _2335 = exp2(_2313);
    float _2337 = as_type<float>(_2333) * _2327;
    float _2339 = trunc(_2337);
    float _2341 = precise::max(_2339, 0.0);
    uint _2344 = uint(_2341);
    float _2346 = -_2335;
    float _2348 = _2346 + 1.0;
    float _2350 = _2348 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2352 = _2305 * int(_2344);
    int _2354 = _2352 + _2301;
    float _2356 = float(uint(_2354));
    float _2358 = as_type<float>(_2333) * _2356;
    bool _2360 = !_1074;
    float _2362 = _2360 ? 7.345489978790283203125 : 1.0;
    float _2364 = trunc(_2358);
    float _2366 = precise::max(_2364, 0.0);
    uint _2368 = uint(_2366);
    float _2370 = _2362 * _1064;
    float _2372 = float(_2301);
    bool _2374 = _2372 >= _1388;
    bool _2376 = isnan(_2372);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan(_1388);
    bool _2382 = _2378 || _2380;
    float _2384 = float(_2382);
    float _2386 = floor(_2370);
    int _2388 = int(_2344) + int(_2368);
    float _2390 = trunc(_2384);
    int _2392 = int(_2390);
    int _2394 = _2311 * _2388;
    int _2396 = _2394 + _2301;
    float _2398 = -_2386;
    float _2400 = _2370 + _2398;
    bool _2402 = uint(_2396) >= uint(_1118);
    bool _2404 = !_2402;
    int _2406 = _2404 ? 0 : (-1);
    bool _2408 = _1118 == 0;
    int _2410 = ~_2388;
    int _2412 = _2410 + _2406;
    int _2414 = _2412 + 1;
    float _2416 = _2400 * _1388;
    int _2418 = ~_2392;
    int _2420 = _2418 + 1;
    int _2422 = _2420 + 1;
    int _2424 = _1118 * _2414;
    int _2426 = _2424 + _2301;
    float _2428 = trunc(_2416);
    int _2430 = int(_2428);
    int _2432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2434 = _2432 != 0;
    int _2436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2438 = _2436 != 0;
    bool _2440 = !_2408;
    int _2442 = _2440 ? _2426 : (-1);
    bool _2444 = !_2434;
    int _2446 = _2444 ? 0 : 1;
    int _2448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2450 = _2448 != 0;
    int _2452 = _2442 * _2422;
    int _2454 = abs(_1102);
    int _2456 = abs(_2446);
    int _2458 = _2392 * _2323;
    int _2460 = _2458 + _2452;
    bool _2462 = !_2450;
    int _2464 = _2462 ? 0 : 1;
    int _2466 = _2460 * _2454;
    int _2468 = abs(_2464);
    int _2470 = _2430 * _2456;
    int _2472 = _2470 + _2301;
    int _2474 = _2331 * _2315;
    int _2476 = _2474 + _2466;
    float _2478 = in.m_53.w;
    int _2480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2482 = _2480 != 0;
    int _2484 = _2472 * _2319;
    int _2486 = _2484 + _2476;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2494 = _2492 != 0;
    int _2496 = _2430 * _2468;
    int _2498 = _2496 + _2486;
    int _2500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2502 = _2500 != 0;
    float _2504 = in.m_63.y;
    float _2506 = 1.0 / _2490;
    int _2508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2510 = _2508 != 0;
    float _2512 = float(uint(_2498));
    float _2514 = as_type<float>(_2333) * _2512;
    int _2516 = ~_1118;
    int _2518 = _2516 + 1;
    float _2520 = trunc(_2514);
    float _2522 = precise::max(_2520, 0.0);
    uint _2524 = uint(_2522);
    bool _2526 = _2478 > 0.5;
    float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2530 = _2528 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2532 = 1.0 / _2530;
    int _2534 = _2518 * int(_2524);
    int _2536 = _2534 + _2498;
    float _2538 = float(uint(_2536));
    float _2540 = as_type<float>(_2333) * _2538;
    float _2542 = trunc(_2540);
    float _2544 = precise::max(_2542, 0.0);
    uint _2546 = uint(_2544);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2548 = -_2504;
    float _2550 = _2548 + 1.0;
    int _2552 = _2526 ? as_type<int>(_2550) : as_type<int>(_2504);
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2556 = _2554 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2558 = _1078 > 0.5;
    int _2560 = ~_1118;
    int _2562 = _2560 + 1;
    float _2564 = 1.0 / _2556;
    int _2566 = int(_2524) + int(_2546);
    float _2568 = _2482 ? as_type<float>(_2552) : _2504;
    float _2570 = _2504;
    bool _2572 = _2438;
    bool _2574 = _2482;
    if (_2438)
    {
        float _2576 = _2558 ? _2550 : _2504;
        _2570 = _2576;
    }
    float _2578 = _2570;
    int _2580 = _2562 * _2566;
    int _2582 = _2580 + _2498;
    float _2584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2494)
    {
        bool _2586 = _1070 > 0.5;
        _2572 = _2586;
    }
    bool _2588 = _2572;
    bool _2590 = uint(_2582) >= uint(_1118);
    float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2592;
    if (_2502)
    {
        bool _2596 = _1064 > 0.5;
        _2574 = _2596;
    }
    bool _2598 = _2574;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2602 = _2600 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2604 = !_2590;
    int _2606 = _2604 ? 0 : (-1);
    float _2608 = _2594 * _2506;
    float _2610 = _2602 * _2532;
    int _2612 = ~_2566;
    int _2614 = _2612 + _2606;
    int _2616 = _2614 + 1;
    float _2618 = in.m_63.x;
    float _2620 = float(uint(_2472));
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2624 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2622;
    bool _2626 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2628 = isnan(_1062);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2634 = _2630 || _2632;
    float _2636 = float(_2634);
    int _2638 = _1118 * _2616;
    int _2640 = _2638 + _2498;
    int _2642 = ~_1118;
    int _2644 = _2642 + 1;
    float _2646 = _2624 * _2564;
    float _2648 = as_type<float>(_2333) * _2620;
    float _2650 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2652 = _1062 + _2650;
    float _2654 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2656 = _1062 + _2654;
    bool _2658 = !_2408;
    int _2660 = _2658 ? _2640 : (-1);
    float _2662 = _2584 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2664 = fma(_2608, _2652, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2668 = _1062 + _2666;
    float _2670 = trunc(_2648);
    float _2672 = precise::max(_2670, 0.0);
    uint _2674 = uint(_2672);
    float _2676 = fma(_2610, _2656, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2678 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2680 = isnan(_1062);
    bool _2682 = _2678 || _2680;
    bool _2684 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2686 = _2682 || _2684;
    float _2688 = float(_2686);
    float _2690 = fma(_2646, _2668, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2692 = _2660 >> 31;
    float _2694 = fma(_2568, _2662, -0.5);
    bool _2696 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2698 = isnan(_1062);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2704 = _2700 || _2702;
    float _2706 = float(_2704);
    float _2708 = -_2688;
    float _2710 = _2708 + 1.0;
    int _2712 = _2692 & 3;
    float _2714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2716 = _1062 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2718 = isnan(_1062);
    bool _2720 = _2716 || _2718;
    bool _2722 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2724 = _2720 || _2722;
    float _2726 = float(_2724);
    float _2728 = _2706 * _2710;
    int _2730 = _2660 + _2712;
    float _2732 = -_2706;
    float _2734 = _2732 + 1.0;
    float _2736 = _2710;
    int _2738 = as_type<int>(_2664);
    float _2740 = _2618;
    if (!_2502)
    {
        _2736 = _2618;
    }
    float _2742 = _2736;
    int _2744 = 0;
    float _2746 = _2742;
    if (_2494)
    {
        float _2748 = -_2618;
        float _2750 = _2748 + 1.0;
        _2744 = as_type<int>(_2750);
    }
    int _2752 = _2744;
    int _2754 = _2730 >> 2;
    float _2756 = _2726 * _2734;
    float _2758 = -_2726;
    float _2760 = _2758 + 1.0;
    int _2762 = _2644 * int(_2674);
    int _2764 = _2762 + _2472;
    int _2766 = _2754 << 4;
    int _2768 = _2766 + 368;
    float _2770 = -_1372;
    float _2772 = fma(_1392, _2694, _2770);
    float _2774 = _2636 * _2760;
    float _2776 = -_2636;
    float _2778 = _2776 + 1.0;
    float _2780 = float(uint(_2764));
    float _2782 = _2714 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2784 = uint(int(uint(_2768) >> uint(2)));
    uint _2786 = uint(int(uint(int(_2784)) >> uint(2)));
    int _2788 = int(_2784) & 3;
    float _2790 = (*spvDescriptorSet0.vp_c9)._m0[int(_2786)][_2788];
    int _2792 = int(_2784) + 1;
    uint _2794 = uint(int(uint(_2792) >> uint(2)));
    int _2796 = _2792 & 3;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[int(_2794)][_2796];
    float _2800 = _2664 * _2774;
    if (_2502)
    {
        float _2802 = -_2618;
        float _2804 = _2802 + 1.0;
        _2738 = as_type<int>(_2804);
    }
    int _2806 = _2738;
    float _2808 = as_type<float>(_2333) * _2780;
    float _2810 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2578, -0.5);
    float _2812 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2800);
    if (_2502)
    {
        float _2814 = _2598 ? as_type<float>(_2806) : _2618;
        _2746 = _2814;
    }
    float _2816 = _2746;
    float _2818 = -_1164;
    float _2820 = fma(_1362, _2810, _2818);
    float _2822 = trunc(_2808);
    float _2824 = precise::max(_2822, 0.0);
    uint _2826 = uint(_2824);
    int _2828 = _2660 & 3;
    bool _2830 = _2828 != 0;
    int _2832 = _2768 + 8;
    uint _2834 = uint(int(uint(_2832) >> uint(2)));
    uint _2836 = uint(int(uint(int(_2834)) >> uint(2)));
    int _2838 = int(_2834) & 3;
    float _2840 = (*spvDescriptorSet0.vp_c9)._m0[int(_2836)][_2838];
    int _2842 = int(_2834) + 1;
    uint _2844 = uint(int(uint(_2842) >> uint(2)));
    int _2846 = _2842 & 3;
    float _2848 = (*spvDescriptorSet0.vp_c9)._m0[int(_2844)][_2846];
    if (_2494)
    {
        float _2850 = _2588 ? as_type<float>(_2752) : _2618;
        _2740 = _2850;
    }
    float _2852 = _2740;
    float _2854 = fma(_2676, _2756, _2812);
    bool _2856 = uint(_2828) > 1u;
    int _2858 = _2660 & 3;
    bool _2860 = _2858 != 0;
    float _2862 = fma(_2690, _2728, _2854);
    float _2864 = fma(_2782, _2852, -0.5);
    int _2866 = ~_1118;
    int _2868 = _2866 + 1;
    int _2870 = _2860 ? 0 : 1;
    float _2872 = fma(_2816, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2874 = fma(_1366, _2864, _1242);
    int _2876 = int(_2674) + int(_2826);
    int _2878 = ~_2870;
    int _2880 = _2878 + 1;
    int _2882 = _2880 + 1;
    float _2884 = fma(_1344, _2872, _1144);
    int _2886 = _2882;
    if (!_2856)
    {
        int _2888 = ~_2870;
        int _2890 = _2888 + 1;
        _2886 = _2890;
    }
    int _2892 = _2886;
    int _2894 = _2868 * _2876;
    int _2896 = _2894 + _2472;
    bool _2898 = _2828 != 3;
    int _2900 = abs(_2892);
    float _2902 = _2350 * _2274;
    bool _2904 = uint(_2896) >= uint(_1118);
    float _2906 = fma(_2688, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2862);
    bool _2908 = uint(_2828) >= 2u;
    bool _2910 = !_2904;
    int _2912 = _2910 ? 0 : (-1);
    int _2914 = ~_2900;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    int _2920 = _2908 ? 0 : 1;
    int _2922 = ~_2876;
    int _2924 = _2922 + _2912;
    int _2926 = _2924 + 1;
    int _2928 = _2918 * as_type<int>(_2798);
    bool _2930 = !_2830;
    int _2932 = _2930 ? 0 : 1;
    int _2934 = ~_2920;
    int _2936 = _2934 + 1;
    int _2938 = _2936 + 1;
    int _2940 = _1118 * _2926;
    int _2942 = _2940 + _2472;
    bool _2944 = _2828 != 3;
    float _2946 = _2772 + 0.5;
    int _2948 = _2938;
    if (_2898)
    {
        int _2950 = ~_2920;
        int _2952 = _2950 + 1;
        _2948 = _2952;
    }
    int _2954 = _2948;
    float _2956 = _2820 + 0.5;
    int _2958 = abs(_2932);
    float _2960 = _2884 + 0.5;
    bool _2962 = !_2944;
    int _2964 = _2962 ? 0 : (-1);
    int _2966 = abs(_2954);
    int _2968 = ~_2958;
    int _2970 = _2968 + 1;
    int _2972 = _2970 + 1;
    int _2974 = abs(_2964);
    float _2976 = _2874 + 0.5;
    int _2978 = ~_2966;
    int _2980 = _2978 + 1;
    int _2982 = _2980 + 1;
    int _2984 = _2972 * as_type<int>(_2790);
    int _2986 = _2984 + _2928;
    bool _2988 = !_2510;
    int _2990 = _2988 ? 0 : 1;
    float _2992 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2994 = ~_2974;
    int _2996 = _2994 + 1;
    int _2998 = _2996 + 1;
    int _3000 = _2982 * as_type<int>(_2840);
    int _3002 = _3000 + _2986;
    int _3004 = abs(_2990);
    out.m_67.x = _2960;
    out.m_67.y = _2956;
    out.m_67.z = _2976;
    out.m_67.w = _2946;
    float _3006 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2992);
    int _3008 = _2998 * as_type<int>(_2848);
    int _3010 = _3008 + _3002;
    float _3012 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3006);
    float _3014 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3012);
    float _3016 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3018 = ~_3004;
    int _3020 = _3018 + 1;
    int _3022 = _3020 + 1;
    float _3024 = _2317 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3026 = _2325 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3028 = !_2408;
    int _3030 = _3028 ? _2942 : (-1);
    float _3032 = _1898 * _1956;
    int _3034 = _3010 * _3022;
    float _3036 = _3016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3038 = _2906 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3040 = _3032 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3042 = _3030 * _3004;
    int _3044 = _3042 + _3034;
    float _3046 = _3014 + _2216;
    bool _3048 = _1898 > 0.0;
    bool _3050 = isnan(_1898);
    bool _3052 = _3048 || _3050;
    bool _3054 = isnan(0.0);
    bool _3056 = _3052 || _3054;
    float _3058 = _3040 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _3026;
    out.m_69.y = _3024;
    out.m_69.z = _3036;
    out.m_69.w = _3038;
    float _3060 = _3046 * 0.5;
    bool _3062 = _1956 <= 0.0;
    bool _3064 = !_3056;
    bool _3066 = _3062 || _3064;
    float _3068 = float(_3044);
    float _3070 = _2295 * _2902;
    out.m_49.x = _3058;
    out.m_71.x = _3068;
    float _3072 = _2285 * _2902;
    float _3074 = -_2350;
    float _3076 = _3074 + 1.0;
    out.gl_Position.x = _2242;
    out.gl_Position.y = _2244;
    out.gl_Position.z = _3014;
    out.gl_Position.w = _2216;
    float _3078 = fma(_2291, _3072, _2279);
    float _3080 = fma(_2293, _3072, _2281);
    float _3082 = _2285 * _3076;
    float _3084 = fma(_2285, _3070, _2283);
    out.m_73.z = _3060;
    out.m_73.w = _2216;
    out.m_75.x = _3078;
    out.m_75.y = _3080;
    out.m_75.z = _3084;
    out.m_75.w = _3082;
    if (!_3066)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3086 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3086;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

