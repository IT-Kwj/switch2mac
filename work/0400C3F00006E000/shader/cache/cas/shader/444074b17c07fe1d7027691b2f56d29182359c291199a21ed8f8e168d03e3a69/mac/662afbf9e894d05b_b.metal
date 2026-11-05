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
    bool _796 = false;
    bool _698 = false;
    bool _362 = false;
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
        float _3047 = as_type<float>(_118);
        out.gl_Position.z = _3047;
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
        float _3102 = as_type<float>(_144);
        out.gl_Position.z = _3102;
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
    float _180 = _172;
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
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _202 + _204;
    bool _208 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _210 = isnan(_202);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _202 + _220;
    bool _224 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _226 = isnan(_202);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _244 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _246 = isnan(_202);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = 1.0 / _238;
    float _258 = -_254;
    float _260 = _258 + 1.0;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = _234 * _260;
    float _266 = -_234;
    float _268 = _266 + 1.0;
    float _270 = 1.0 / _242;
    float _272 = _206 * _256;
    float _274 = -_218;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _254 * _276;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = fma(_280, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = _222 * _270;
    float _296 = fma(_286, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_290, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _300 = _292 * _264;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _306 = _296 * _264;
    float _308 = _298 * _264;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _318 = fma(_304, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _320 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _306);
    float _322 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _324 = fma(_312, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _326 = fma(_316, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _328 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _308);
    float _330 = fma(_318, _282, _322);
    float _332 = fma(_324, _282, _320);
    float _334 = fma(_326, _282, _328);
    float _336 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[145].y, _330);
    float _338 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[145].x, _332);
    float _340 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[145].z, _334);
    bool _342 = !_262;
    float _360;
    if (!_342)
    {
        float _344 = in.m_53.x;
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        _360 = _156;
    }
    _362 = false;
    float _364 = _360;
    float _366 = in.m_55.x;
    float _368 = in.m_55.y;
    float _370 = in.m_55.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _388 = 1.0 / _374;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _390;
    bool _394 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _396 = isnan(_364);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _364 + _408;
    bool _412 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _414 = isnan(_364);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = 1.0 / _382;
    float _426 = _410 * _388;
    float _428 = _340 * _370;
    bool _430 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _432 = isnan(_364);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _444 = _364 + _442;
    bool _446 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _448 = isnan(_364);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = _336 * _368;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _462 = _364 + _460;
    float _464 = 1.0 / _386;
    float _466 = _444 * _406;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _470 = _364 + _468;
    bool _472 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_364);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -_456;
    float _486 = _484 + 1.0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _490 = _364 + _488;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _494 = 1.0 / _392;
    float _496 = _462 * _424;
    bool _498 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _500 = isnan(_364);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -_482;
    float _512 = _510 + 1.0;
    float _514 = _470 * _464;
    float _516 = -_440;
    float _518 = _516 + 1.0;
    float _520 = _456 * _518;
    float _522 = _404 * _486;
    float _524 = -_404;
    float _526 = _524 + 1.0;
    float _528 = _490 * _494;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = _482 * _526;
    float _540 = _508 * _512;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _554 = -_508;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _558;
    float _562 = fma(_544, _426, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _564 = fma(_548, _466, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _566 = fma(_552, _466, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _568 = fma(_536, _466, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _570 = _422 * _556;
    float _572 = fma(_560, _426, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _574 = fma(_532, _426, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _576 = _562 * _570;
    float _578 = -_422;
    float _580 = _578 + 1.0;
    float _582 = _572 * _570;
    float _584 = _574 * _570;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _594;
    float _598 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[107].x, _576);
    float _600 = fma(_588, _496, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _602 = fma(_592, _496, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _604 = fma(_596, _496, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[107].y, _582);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _620 = fma(_564, _540, _598);
    float _622 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[107].z, _584);
    float _624 = fma(_566, _540, _606);
    float _626 = fma(_610, _514, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _628 = fma(_614, _514, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _630 = fma(_618, _514, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _632 = fma(_600, _538, _620);
    float _634 = fma(_568, _540, _622);
    float _636 = fma(_602, _538, _624);
    float _638 = fma(_604, _538, _634);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _640;
    float _644 = fma(_626, _522, _632);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _646;
    float _650 = fma(_628, _522, _636);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _652;
    float _656 = fma(_642, _528, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _658 = fma(_648, _528, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _660 = fma(_630, _522, _638);
    float _662 = fma(_654, _528, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _664 = fma(_656, _520, _644);
    float _666 = fma(_658, _520, _650);
    float _668 = _338 * _366;
    float _670 = fma(_662, _520, _660);
    float _672 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[112].x, _664);
    float _674 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[112].y, _666);
    float _676 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[112].z, _670);
    bool _678 = !_492;
    float _696;
    if (!_678)
    {
        float _680 = in.m_53.x;
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _684 = _680 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _688 = _686 * _682;
        float _690 = floor(_688);
        float _692 = -_690;
        float _694 = _688 + _692;
        _696 = _694;
        _698 = true;
    }
    else
    {
        _696 = _156;
    }
    _698 = false;
    float _700 = _696;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _704 = _700 + _702;
    bool _706 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _708 = isnan(_700);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _722 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _724 = isnan(_700);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _734;
    float _738 = _672 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _740 = -_716;
    float _742 = _740 + 1.0;
    bool _744 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _746 = 1.0 / _720;
    float _748 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _732 * _742;
    float _752 = -_732;
    float _754 = _752 + 1.0;
    float _756 = _736 * _746;
    float _758 = _676 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _760 = fma(_756, _704, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _762 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _760 * _750;
    float _766 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[115].x, _764);
    float _770 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _772 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[116].x, _768);
    float _774 = _772 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _748;
    out.m_57.y = _770;
    out.m_57.z = _762;
    out.m_57.w = _774;
    bool _776 = !_744;
    float _794;
    if (!_776)
    {
        float _778 = in.m_53.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        _794 = _156;
    }
    _796 = false;
    float _798 = _794;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _802 = _798 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _806 = _798 + _804;
    bool _808 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _810 = isnan(_798);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _820;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _836 = 1.0 / _822;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _840 = _798 + _838;
    bool _842 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _844 = isnan(_798);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = 1.0 / _830;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _856;
    bool _860 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _862 = isnan(_798);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / _826;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _876 = _798 + _874;
    float _878 = _802 * _836;
    bool _880 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _882 = isnan(_798);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = 1.0 / _834;
    float _894 = _806 * _854;
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _898 = fma(_858, _894, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _900 = _876 * _872;
    bool _902 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _904 = isnan(_798);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = -_818;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _922 = _912 * _916;
    float _924 = -_912;
    float _926 = _924 + 1.0;
    float _928 = _840 * _892;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _934;
    float _938 = _890 * _926;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _944 = fma(_932, _894, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _946 = fma(_936, _894, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _948 = -_890;
    float _950 = _948 + 1.0;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _956 = fma(_920, _928, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _958 = fma(_942, _928, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _960 = _852 * _950;
    float _962 = -_852;
    float _964 = _962 + 1.0;
    float _966 = fma(_954, _928, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _968 = _870 * _964;
    float _970 = -_870;
    float _972 = _970 + 1.0;
    float _974 = _944 * _968;
    float _976 = _946 * _968;
    float _978 = _898 * _968;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _980;
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[123].x, _974);
    float _986 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[123].y, _976);
    float _988 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[123].z, _978);
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _994;
    float _998 = fma(_966, _960, _986);
    float _1000 = fma(_956, _960, _984);
    float _1002 = fma(_958, _960, _988);
    float _1004 = fma(_982, _878, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1006 = fma(_992, _878, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1016 = fma(_996, _878, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1022 = fma(_1004, _938, _1000);
    float _1024 = fma(_1010, _900, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1026 = fma(_1014, _900, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1028 = fma(_1006, _938, _998);
    float _1030 = fma(_1020, _900, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1032 = fma(_1016, _938, _1002);
    float _1034 = fma(_1024, _922, _1022);
    float _1036 = fma(_1026, _922, _1028);
    float _1038 = fma(_1030, _922, _1032);
    float _1040 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1034);
    float _1042 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1036);
    float _1044 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1038);
    bool _1046 = !_896;
    if (!_1046)
    {
        float _1048 = in.m_53.x;
        float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1052 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1056 = _1054 * _1050;
        float _1058 = floor(_1056);
        float _1060 = -_1058;
        float _1062 = _1056 + _1060;
        _178 = _1062;
    }
    float _1064 = _178;
    float _1066 = in.m_53.z;
    float _1068 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1070 = int(_1068);
    float _1072 = in.m_53.x;
    float _1074 = in.m_53.y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1090 = _1088 != 0;
    float _1092 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1094 = int(_1092);
    float _1096 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1098 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1100 = !_1086;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1106 = !_1082;
    int _1108 = _1106 ? 0 : 1;
    bool _1110 = !_1090;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1124 = _1122 != 0;
    float _1126 = float(_1070);
    float _1128 = _1066 * 2.0;
    float _1130 = 1.0 / _1126;
    float _1132 = float(_1094);
    float _1134 = _1072 * 2.0;
    float _1136 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1138 = _1074 + _1072;
    float _1140 = _1074 * 2.0;
    float _1142 = _1132 * _100;
    float _1144 = -_1076;
    float _1146 = fma(_1136, 2.0, _1144);
    float _1148 = floor(_1128);
    float _1150 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1152 = -_100;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1146);
    float _1156 = fma(_1150, -2.0, _1078);
    float _1158 = _1138 + (-1.0);
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1162 = 1.0 + _1160;
    float _1164 = floor(_1134);
    bool _1166 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1168 = isnan(1.0);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1174 = _1170 || _1172;
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1178 = _1130 * _100;
    float _1180 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    bool _1182 = _1148 > 0.0;
    float _1184 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1186 = log2(_1184);
    bool _1188 = _1148 >= 0.0;
    bool _1190 = isnan(_1148);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = !_1116;
    int _1200 = _1198 ? 0 : 1;
    int _1202 = _1196 ? 0 : 1;
    bool _1204 = _1164 > 0.0;
    float _1206 = floor(_1140);
    bool _1208 = _1164 >= 0.0;
    bool _1210 = isnan(_1164);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    int _1218 = ~_1202;
    int _1220 = _1218 + 1;
    int _1222 = _1220 + 1;
    int _1224 = _1216 ? 0 : 1;
    int _1226 = abs(_1200);
    float _1228 = 1.0 / _1162;
    int _1230 = _1222;
    if (!_1182)
    {
        int _1232 = ~_1202;
        int _1234 = _1232 + 1;
        _1230 = _1234;
    }
    int _1236 = _1230;
    int _1238 = ~_1224;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    int _1244 = _1242;
    if (!_1204)
    {
        int _1246 = ~_1224;
        int _1248 = _1246 + 1;
        _1244 = _1248;
    }
    int _1250 = _1244;
    float _1252 = _1186 * _100;
    float _1254 = float(_1226);
    float _1256 = float(_1236);
    float _1258 = exp2(_1252);
    bool _1260 = _1206 > 0.0;
    bool _1262 = _1206 >= 0.0;
    bool _1264 = isnan(_1206);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan(0.0);
    bool _1270 = _1266 || _1268;
    float _1272 = _1254 * _1256;
    float _1274 = in.m_59.x;
    float _1276 = in.m_59.y;
    float _1278 = in.m_59.z;
    float _1280 = _1272 * (-2.0);
    bool _1282 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1284 = isnan(0.0);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1290 = _1286 || _1288;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1294 = float(_1250);
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1298 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1292);
    float _1300 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1296);
    bool _1302 = !_1120;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1298);
    float _1308 = -_1258;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1300);
    int _1314 = abs(_1304);
    int _1316 = _1270 ? 0 : 1;
    float _1318 = _1290 ? _1310 : 0.0;
    int _1320 = ~_1316;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    float _1326 = float(_1314);
    int _1328 = _1324;
    if (_1174)
    {
        float _1330 = _1318 * _1228;
        _110 = _1330;
    }
    float _1332 = _110;
    if (!_1260)
    {
        int _1334 = ~_1316;
        int _1336 = _1334 + 1;
        _1328 = _1336;
    }
    int _1338 = _1328;
    float _1340 = _1072 + (-0.5);
    bool _1342 = !_1124;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = fma(_1280, _1274, _1274);
    float _1348 = _1326 * _1294;
    float _1350 = fma(_1176, _1280, _1176);
    int _1352 = abs(_1344);
    float _1354 = _1074 + _1066;
    float _1356 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1346);
    float _1358 = float(_1338);
    float _1360 = _1354 + (-1.0);
    float _1362 = float(_1352);
    float _1364 = fma(_1350, _1332, _1356);
    float _1366 = _1348 * (-2.0);
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1370 = _1074 + (-0.5);
    float _1372 = _1362 * _1358;
    float _1374 = fma(_1366, _1276, _1276);
    float _1376 = _1066 + _1072;
    float _1378 = _1364 * 0.15915493667125701904296875;
    float _1380 = _1372 * (-2.0);
    float _1382 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1374);
    float _1384 = _1376 + (-1.0);
    float _1386 = fma(_1368, _1366, _1368);
    float _1388 = fma(_1380, _1278, _1278);
    float _1390 = in.m_61.x;
    float _1392 = in.m_61.y;
    float _1394 = in.m_61.z;
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1398 = _1066 + (-0.5);
    float _1400 = fma(_1386, _1332, _1382);
    float _1402 = _1378 * 6.283185482025146484375;
    float _1404 = sin(_1402);
    float _1406 = fma(_1396, _1380, _1396);
    float _1408 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1388);
    float _1410 = _1400 * 0.15915493667125701904296875;
    float _1412 = fma(_1406, _1332, _1408);
    float _1414 = _1410 * 6.283185482025146484375;
    float _1416 = sin(_1414);
    float _1418 = _1412 * 0.15915493667125701904296875;
    float _1420 = _1410 * 6.283185482025146484375;
    float _1422 = cos(_1420);
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1390);
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1392);
    float _1428 = _1418 * 6.283185482025146484375;
    float _1430 = cos(_1428);
    float _1432 = _1096 * _1426;
    float _1434 = _1098 * _1424;
    float _1436 = _1378 * 6.283185482025146484375;
    float _1438 = cos(_1436);
    float _1440 = _1418 * 6.283185482025146484375;
    float _1442 = sin(_1440);
    float _1444 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1394);
    float _1446 = _1416 * _1430;
    float _1448 = in.m_42.x;
    float _1450 = in.m_42.y;
    float _1452 = in.m_42.z;
    float _1454 = _1422 * _1430;
    float _1456 = _1104 * _1444;
    float _1458 = _1430 * _1432;
    float _1460 = _1404 * _1416;
    float _1462 = _1438 * _1422;
    float _1464 = _1438 * _1416;
    float _1466 = _1404 * _1422;
    float _1468 = _1438 * _1458;
    float _1470 = fma(_1442, _1462, _1460);
    float _1472 = -_1464;
    float _1474 = fma(_1442, _1466, _1472);
    float _1476 = -_1432;
    float _1478 = _1442 * _1476;
    float _1480 = -_1466;
    float _1482 = fma(_1442, _1464, _1480);
    float _1484 = fma(_1470, _1434, _1468);
    float _1486 = _1404 * _1458;
    float _1488 = fma(_1454, _1434, _1478);
    float _1490 = fma(_1442, _1460, _1462);
    float _1492 = fma(_1482, _1456, _1484);
    float _1494 = fma(_1474, _1434, _1486);
    float _1496 = fma(_1446, _1456, _1488);
    float _1498 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1500 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1502 = fma(_1490, _1456, _1494);
    float _1504 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1506 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1498);
    float _1508 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1510 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1500);
    float _1512 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1504);
    float _1514 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1506);
    float _1516 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1508);
    float _1518 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1510);
    float _1520 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1512);
    float _1522 = _1514 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1524 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1516);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1528 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1530 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1534 = _1522 + _1526;
    float _1536 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1530);
    float _1538 = _1528 + _1532;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1542 = _1534 + _1540;
    float _1544 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1536);
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1548 = _1538 + _1546;
    float _1550 = _1542 * _1542;
    float _1552 = fma(_1548, _1548, _1550);
    float _1554 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1556 = sqrt(_1552);
    float _1558 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1554);
    float _1560 = _1544 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1562 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1558);
    float _1564 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1566 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1568 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1564);
    float _1570 = _1560 + _1566;
    float _1572 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1568);
    bool _1574 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1576 = _1568;
    float _1578 = _1564;
    float _1580 = _1452;
    if (!_1574)
    {
        _1576 = _1538;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (!_1574)
    {
        _1578 = _1534;
    }
    float _1586 = _1578;
    float _1588 = _1586;
    if (!_1574)
    {
        _1580 = _1570;
    }
    float _1590 = _1580;
    bool _1592 = !_1574;
    float _1594 = _1590;
    if (!_1592)
    {
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1600 = _1556 + _1598;
        float _1602 = rsqrt(_1552);
        float _1604 = _1600 * _1596;
        float _1606 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = _1604 * 0.15915493667125701904296875;
        float _1610 = _1608 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = _1608 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612 + (-1.0);
        float _1620 = fma(_1616, _1606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1622 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = _1602 * _1620;
        float _1626 = fma(_1570, _1612, _1622);
        float _1628 = fma(_1548, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1630 = fma(_1542, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1594 = _1626;
        _1584 = _1628;
        _1588 = _1630;
    }
    float _1632 = _1594;
    float _1634 = _1584;
    float _1636 = _1588;
    float _1638 = -_1560;
    float _1640 = _1638 + _1632;
    float _1642 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1644 = -_1528;
    float _1646 = _1644 + _1634;
    float _1648 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1650 = _1640 * _1640;
    float _1652 = -_1522;
    float _1654 = _1652 + _1636;
    float _1656 = 1.0 / _1642;
    float _1658 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1648);
    float _1660 = fma(_1646, _1646, _1650);
    bool _1662 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1664 = isnan(0.5);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1670 = _1666 || _1668;
    float _1672 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1658);
    float _1674 = fma(_1654, _1654, _1660);
    float _1676 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1678 = sqrt(_1674);
    float _1680 = _1676 + _1642;
    float _1682 = _1642;
    float _1684 = _1632;
    float _1686 = _1634;
    float _1688 = _1636;
    float _1690 = _1646;
    if (_1670)
    {
        _1682 = 1.0;
    }
    float _1692 = _1682;
    float _1694 = _1680 * _1656;
    float _1696 = _1694 * 0.5;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1700 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1698);
    float _1702 = 1.0 / _1700;
    bool _1704 = _1678 > 0.0;
    bool _1706 = !_1704;
    float _1708 = _1700;
    float _1710 = _1692;
    if (!_1706)
    {
        float _1712 = _172 * _172;
        float _1714 = fma(_170, _170, _1712);
        float _1716 = rsqrt(_1674);
        float _1718 = fma(_174, _174, _1714);
        float _1720 = sqrt(_1718);
        float _1722 = _1646 * _1716;
        float _1724 = _1640 * _1716;
        float _1726 = _1654 * _1716;
        bool _1728 = _1720 > 0.0;
        bool _1730 = !_1728;
        _1708 = _1720;
        if (!_1730)
        {
            float _1732 = rsqrt(_1718);
            float _1734 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1736 = _172 * _1732;
            float _1738 = _170 * _1732;
            float _1740 = _174 * _1732;
            float _1742 = _1724 * _1736;
            float _1744 = fma(_1722, _1738, _1742);
            float _1746 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1748 = fma(_1726, _1740, _1744);
            float _1750 = _1748 * _1746;
            float _1752 = fma(_170, _1750, _1634);
            float _1754 = fma(_172, _1750, _1632);
            float _1756 = fma(_174, _1750, _1636);
            _1708 = _1744;
            _1684 = _1754;
            _1686 = _1752;
            _1688 = _1756;
            _1690 = _1746;
        }
    }
    float _1758 = _1708;
    float _1760 = _1684;
    float _1762 = _1686;
    float _1764 = _1688;
    float _1766 = _1690;
    float _1768 = _1766;
    float _1770 = _1758;
    if (_1670)
    {
        _1768 = 1.0;
    }
    float _1772 = _1768;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1776 = _1702 * _1774;
    float _1778 = _1772;
    if (!_1670)
    {
        float _1780 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1782 = _1780 * 0.15915493667125701904296875;
        float _1784 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1786 = _1782 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = _1784 * 0.15915493667125701904296875;
        float _1792 = _1782 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = 1.0 / _1788;
        float _1798 = _1790 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        float _1802 = _1794 * _1796;
        float _1804 = _1790 * 6.283185482025146484375;
        float _1806 = sin(_1804);
        float _1808 = _1800 * _1802;
        float _1810 = 1.0 / _1808;
        float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1814 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1812;
        float _1816 = 1.0 / _1814;
        float _1818 = _1806 * _1810;
        float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1822 = fma(_1776, _1818, _1820);
        float _1824 = _1822 * _1816;
        float _1826 = precise::clamp(_1824, 0.0, 1.0);
        _1770 = _1816;
        _180 = _1796;
        _1710 = _1826;
    }
    float _1828 = _1770;
    float _1830 = _180;
    float _1832 = _1710;
    float _1834 = _1828;
    float _1836 = _1830;
    if (!_1670)
    {
        float _1838 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1840 = _1838 * 0.15915493667125701904296875;
        float _1842 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1844 = _1840 * 6.283185482025146484375;
        float _1846 = cos(_1844);
        float _1848 = _1842 * 0.15915493667125701904296875;
        float _1850 = _1840 * 6.283185482025146484375;
        float _1852 = sin(_1850);
        float _1854 = 1.0 / _1846;
        float _1856 = _1848 * 6.283185482025146484375;
        float _1858 = cos(_1856);
        float _1860 = _1852 * _1854;
        float _1862 = _1848 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = _1858 * _1860;
        float _1868 = 1.0 / _1866;
        float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1872 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1870;
        float _1874 = 1.0 / _1872;
        float _1876 = _1864 * _1868;
        float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1880 = fma(_1776, _1876, _1878);
        float _1882 = _1880 * _1874;
        float _1884 = precise::clamp(_1882, 0.0, 1.0);
        float _1886 = -_1884;
        float _1888 = _1886 + 1.0;
        _1834 = _1854;
        _1836 = _1840;
        _1778 = _1888;
    }
    float _1890 = _1834;
    float _1892 = _1836;
    float _1894 = _1778;
    float _1896 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1898 = _1760 + _1896;
    float _1900 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1902 = _1762 + _1900;
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1906 = _1764 + _1904;
    float _1908 = _1898 * _1898;
    float _1910 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1912 = fma(_1902, _1902, _1908);
    float _1914 = fma(_1906, _1906, _1912);
    float _1916 = rsqrt(_1914);
    float _1918 = sqrt(_1914);
    float _1920 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1922 = _1902 * _1920;
    float _1924 = _1906 * _1920;
    float _1926 = _1922 * _1922;
    float _1928 = _1924 * _1924;
    float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1932 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1930);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = _1926 + _1928;
    float _1938 = -_1934;
    float _1940 = _1938 + 1.0;
    float _1942 = sqrt(_1936);
    bool _1944 = _1942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1948 = _1942 + _1946;
    float _1950 = _1916;
    float _1952 = _1936;
    float _1954 = _1948;
    float _1956 = _1890;
    float _1958 = _1898;
    float _1960 = _1892;
    if (_1944)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _1962;
    }
    float _1964 = _1950;
    if (_1944)
    {
        float _1966 = rsqrt(_1936);
        _1952 = _1966;
    }
    float _1968 = _1952;
    if (_1944)
    {
        float _1970 = _1948 * _1964;
        _1954 = _1970;
    }
    float _1972 = _1954;
    if (_1944)
    {
        float _1974 = _1972 * 0.15915493667125701904296875;
        _1956 = _1974;
    }
    float _1976 = _1956;
    float _1978 = _1906;
    float _1980 = _1976;
    if (_1944)
    {
        float _1982 = _1976 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        _1978 = _1984;
    }
    float _1986 = _1978;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = precise::max(0.0, _1988);
    float _1992 = _1964;
    float _1994 = _1990;
    if (_1944)
    {
        float _1996 = _1976 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = -_1920;
    float _2004 = -_1990;
    float _2006 = fma(_1898, _2002, _2004);
    if (!_1944)
    {
        _1994 = _1922;
    }
    float _2008 = _1994;
    float _2010 = _2008;
    if (_1944)
    {
        float _2012 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1958 = _2012;
    }
    float _2014 = _1958;
    float _2016 = _1986;
    float _2018 = _2014;
    if (_1944)
    {
        float _2020 = fma(_1986, _2014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2016 = _2020;
    }
    float _2022 = _2016;
    float _2024 = _2022;
    if (!_1944)
    {
        _2018 = _2006;
    }
    float _2026 = _2018;
    float _2028 = _2026;
    float _2030 = _2000;
    if (_1944)
    {
        float _2032 = _2000 + (-1.0);
        _1960 = _2032;
    }
    float _2034 = _1960;
    float _2036 = _2034;
    if (_1944)
    {
        float _2038 = _1968 * _2022;
        _1980 = _2038;
    }
    float _2040 = _1980;
    if (!_1944)
    {
        _2024 = _1924;
    }
    float _2042 = _2024;
    float _2044 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = _2042;
    if (_1944)
    {
        float _2048 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2036 = _2048;
    }
    float _2050 = _2036;
    float _2052 = _2050;
    if (_1944)
    {
        float _2054 = _1922 * _2040;
        _2010 = _2054;
    }
    float _2056 = _2010;
    if (_1944)
    {
        float _2058 = _1924 * _2040;
        _2046 = _2058;
    }
    float _2060 = _2046;
    float _2062 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1944)
    {
        float _2064 = fma(_2006, _2000, _2050);
        _2028 = _2064;
    }
    float _2066 = _2028;
    if (!_1944)
    {
        _2052 = _1926;
    }
    float _2068 = _2052;
    float _2070 = _2068;
    if (_1944)
    {
        float _2072 = _2056 * _2056;
        _2070 = _2072;
    }
    float _2074 = _2070;
    if (!_1944)
    {
        _2030 = _1928;
    }
    float _2076 = _2030;
    float _2078 = _2076;
    if (_1944)
    {
        float _2080 = _2060 * _2060;
        _2078 = _2080;
    }
    float _2082 = _2078;
    float _2084 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2086 = fma(_2066, _2066, _2074);
    float _2088 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2062);
    float _2090 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2092 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2084);
    float _2094 = _2086 + _2082;
    float _2096 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2088);
    float _2098 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2100 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2092);
    float _2102 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2090);
    float _2104 = _2096 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2106 = rsqrt(_2094);
    float _2108 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2110 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2098);
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2116 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2118 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2110);
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2114);
    float _2122 = -_2116;
    float _2124 = fma(_2122, _1910, 1.0);
    float _2126 = abs(_1940);
    float _2128 = log2(_2126);
    float _2130 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2132 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2120);
    float _2134 = _2106 * _2056;
    float _2136 = _2106 * _2066;
    float _2138 = _2106 * _2060;
    float _2140 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2132);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2146 = log2(_2124);
    float _2148 = _2136 + 1.0;
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = -_2138;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2160 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2162 = 1.0 / _2140;
    float _2164 = fma(_2158, -0.5, 0.5);
    float _2166 = fma(_2158, 0.5, 0.5);
    float _2168 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2144);
    float _2170 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2160);
    float _2172 = fma(_2166, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2174 = exp2(_2154);
    float _2176 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2168);
    float _2178 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2170);
    float _2180 = fma(_2166, _2172, -0.212114393711090087890625);
    float _2182 = _2146 * 0.693147182464599609375;
    float _2184 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2176);
    float _2186 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2178);
    float _2188 = fma(_2166, _2180, 1.570728778839111328125);
    float _2190 = sqrt(_2164);
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2194 = _2186 * _2162;
    float _2196 = -_2136;
    float _2198 = fma(_2174, _2148, _2196);
    float _2200 = _2184 * _2162;
    float _2202 = fma(_2198, 0.5, 0.5);
    float _2204 = fma(_2200, 0.5, 0.5);
    float _2206 = _2190 * 0.636619746685028076171875;
    float _2208 = fma(_2194, -0.5, 0.5);
    float _2210 = -_2188;
    float _2212 = fma(_2206, _2210, 1.0);
    float3 _6398 = float3(_2204, _2208, _2192);
    float _2214 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6398, float3(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6398, float3(0.0), isnan(_6398)), level(0.0)).x;
    float3 _6409 = float3(_2204, _2208, _2192);
    float4 _2217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6409, float3(0.0), isnan(_6409)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6409, float3(0.0), isnan(_6409)), level(0.0)).xyzw;
    float _2219 = _2217.x;
    float _2221 = _2217.y;
    float _2223 = _2217.z;
    float _2225 = _2217.w;
    float2 _6426 = float2(_2212, _2202);
    float3 _2229 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6426, float2(0.0), isnan(_6426)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6426, float2(0.0), isnan(_6426)), level(0.0)).xyz;
    float _2231 = _2229.x;
    float _2233 = _2229.y;
    float _2235 = _2229.z;
    float _2237 = float(uint(_1094));
    float _2239 = trunc(_1178);
    int _2241 = int(_2239);
    int _2243 = ~_1094;
    int _2245 = _2243 + 1;
    float _2247 = _1142 * _152;
    int _2249 = abs(_1102);
    float _2251 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2253 = abs(_1108);
    float _2255 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2257 = _1074 > 0.5;
    float _2259 = 1.0 / _2237;
    float _2261 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2255);
    float _2263 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2261);
    float _2265 = float(uint(_2241));
    float _2267 = trunc(_2247);
    int _2269 = int(_2267);
    float _2271 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2263);
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2186;
    out.gl_Position.z = _2271;
    out.gl_Position.w = _2140;
    int _2273 = as_type<int>(_2259) + (-2);
    float _2275 = exp2(_2251);
    float _2277 = as_type<float>(_2273) * _2265;
    float _2279 = trunc(_2277);
    float _2281 = precise::max(_2279, 0.0);
    uint _2284 = uint(_2281);
    float _2286 = -_2275;
    float _2288 = _2286 + 1.0;
    int _2290 = ~_1094;
    int _2292 = _2290 + 1;
    int _2294 = _2245 * int(_2284);
    int _2296 = _2294 + _2241;
    float _2298 = float(uint(_2296));
    float _2300 = as_type<float>(_2273) * _2298;
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2304 = _2302 != 0;
    float _2306 = trunc(_2300);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    float _2312 = float(_2241);
    bool _2314 = !_2304;
    float _2316 = _2314 ? 7.345489978790283203125 : 1.0;
    bool _2318 = _2312 >= _1132;
    bool _2320 = isnan(_2312);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(_1132);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = _2316 * _1072;
    float _2332 = trunc(_2328);
    int _2334 = int(_2332);
    int _2336 = int(_2284) + int(_2310);
    float _2338 = floor(_2330);
    int _2340 = _2292 * _2336;
    int _2342 = _2340 + _2241;
    bool _2344 = uint(_2342) >= uint(_1094);
    bool _2346 = !_2344;
    int _2348 = _2346 ? 0 : (-1);
    bool _2350 = _1094 == 0;
    int _2352 = ~_2336;
    int _2354 = _2352 + _2348;
    int _2356 = _2354 + 1;
    float _2358 = -_2338;
    float _2360 = _2330 + _2358;
    int _2362 = _1094 + (-1);
    float _2364 = _2360 * _1132;
    int _2366 = _1094 * _2356;
    int _2368 = _2366 + _2241;
    int _2370 = ~_2334;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    int _2376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2378 = _2376 != 0;
    bool _2380 = !_2350;
    int _2382 = _2380 ? _2368 : (-1);
    float _2384 = trunc(_2364);
    int _2386 = int(_2384);
    bool _2388 = !_2378;
    int _2390 = _2388 ? 0 : 1;
    int _2392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2394 = _2392 != 0;
    int _2396 = _2382 * _2374;
    int _2398 = abs(_2390);
    int _2400 = abs(_1112);
    int _2402 = _2334 * _2362;
    int _2404 = _2402 + _2396;
    bool _2406 = !_2394;
    int _2408 = _2406 ? 0 : 1;
    int _2410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2412 = _2410 != 0;
    int _2414 = _2404 * _2249;
    int _2416 = abs(_2408);
    int _2418 = _2386 * _2398;
    int _2420 = _2418 + _2241;
    int _2422 = ~_1094;
    int _2424 = _2422 + 1;
    int _2426 = _2269 * _2253;
    int _2428 = _2426 + _2414;
    int _2430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2432 = _2430 != 0;
    float _2434 = float(uint(_2420));
    int _2436 = _2420 * _2400;
    int _2438 = _2436 + _2428;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2442 = _2440 != 0;
    float _2444 = as_type<float>(_2334);
    float _2446 = as_type<float>(_2245);
    if (_2412)
    {
        float _2448 = in.m_53.x;
        _2444 = _2448;
    }
    float _2450 = _2444;
    int _2452 = ~_1094;
    int _2454 = _2452 + 1;
    int _2456 = _2386 * _2416;
    int _2458 = _2456 + _2438;
    int _2460 = ~_1094;
    int _2462 = _2460 + 1;
    float _2464 = float(uint(_2458));
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2470 = as_type<float>(_2273) * _2464;
    float _2472 = trunc(_2470);
    float _2474 = precise::max(_2472, 0.0);
    uint _2476 = uint(_2474);
    int _2478 = _2462 * int(_2476);
    int _2480 = _2478 + _2458;
    float _2482 = float(uint(_2480));
    float _2484 = as_type<float>(_2273) * _2482;
    float _2486 = in.m_63.y;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2492 = trunc(_2484);
    float _2494 = precise::max(_2492, 0.0);
    uint _2496 = uint(_2494);
    float _2498 = 1.0 / _2490;
    float _2500 = as_type<float>(_2273) * _2434;
    int _2502 = int(_2476) + int(_2496);
    float _2504 = trunc(_2500);
    float _2506 = precise::max(_2504, 0.0);
    uint _2508 = uint(_2506);
    int _2510 = _2424 * _2502;
    int _2512 = _2510 + _2458;
    float _2514 = -_2486;
    float _2516 = _2514 + 1.0;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _2526 = uint(_2512) >= uint(_1094);
    float _2528 = _2520 * _2498;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2532 = _1064 + _2530;
    float _2534 = _2486;
    if (_2432)
    {
        float _2536 = _2257 ? _2516 : _2486;
        _2534 = _2536;
    }
    float _2538 = _2534;
    float _2540 = in.m_63.x;
    bool _2542 = !_2526;
    int _2544 = _2542 ? 0 : (-1);
    bool _2546 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2548 = isnan(_1064);
    bool _2550 = _2546 || _2548;
    bool _2552 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2554 = _2550 || _2552;
    float _2556 = float(_2554);
    int _2558 = _2454 * int(_2508);
    int _2560 = _2558 + _2420;
    int _2562 = ~_2502;
    int _2564 = _2562 + _2544;
    int _2566 = _2564 + 1;
    float _2568 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2570 = fma(_2528, _2532, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2572 = -_2556;
    float _2574 = _2572 + 1.0;
    int _2576 = _1094 * _2566;
    int _2578 = _2576 + _2458;
    bool _2580 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2582 = isnan(_1064);
    bool _2584 = _2580 || _2582;
    bool _2586 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2588 = _2584 || _2586;
    float _2590 = float(_2588);
    float _2592 = -_1180;
    float _2594 = fma(_1312, _2568, _2592);
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2598 = _2596 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2600 = _2450 > 0.5;
    bool _2602 = _2600 && _2412;
    bool _2604 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2606 = isnan(_1064);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2612 = _2608 || _2610;
    float _2614 = float(_2612);
    float _2616 = -_2590;
    float _2618 = _2616 + 1.0;
    float _2620 = _2590 * _2574;
    float _2622 = 1.0 / _2598;
    bool _2624 = !_2350;
    int _2626 = _2624 ? _2578 : (-1);
    float _2628 = _2614 * _2618;
    bool _2630 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2632 = isnan(_1064);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2638 = _2634 || _2636;
    float _2640 = float(_2638);
    float _2642 = -_2614;
    float _2644 = _2642 + 1.0;
    int _2646 = _2626 >> 31;
    float _2648 = float(uint(_2560));
    float _2650 = _2640 * _2644;
    int _2652 = _2646 & 3;
    float _2654 = -_2640;
    float _2656 = _2654 + 1.0;
    if (_2412)
    {
        _2446 = _2540;
    }
    float _2658 = _2446;
    float _2660 = _2570 * _2650;
    int _2662 = _2626 + _2652;
    float _2664 = as_type<float>(_2273) * _2648;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2668 = _1064 + _2666;
    float _2670 = _2524 * _2622;
    int _2672 = _2662 >> 2;
    float _2674 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2660);
    float _2676 = fma(_2670, _2668, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2678 = _2672 << 4;
    int _2680 = _2678 + 368;
    float _2682 = 1.0 / _2468;
    float _2684 = _2658;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    if (_2602)
    {
        float _2688 = -_2658;
        float _2690 = _2688 + 1.0;
        _2684 = _2690;
    }
    float _2692 = _2684;
    float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2696 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2694;
    if (!_2412)
    {
        _2686 = _2540;
    }
    float _2698 = _2686;
    int _2700 = _2680 + 8;
    uint _2702 = uint(int(uint(_2700) >> uint(2)));
    uint _2704 = uint(int(uint(int(_2702)) >> uint(2)));
    int _2706 = int(_2702) & 3;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[int(_2704)][_2706];
    int _2710 = int(_2702) + 1;
    uint _2712 = uint(int(uint(_2710) >> uint(2)));
    int _2714 = _2710 & 3;
    float _2716 = (*spvDescriptorSet0.vp_c9)._m0[int(_2712)][_2714];
    int _2718 = _2626 & 3;
    bool _2720 = _2718 != 0;
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2724 = _1064 + _2722;
    float _2726 = _2698;
    if (_2412)
    {
        _2726 = _2692;
    }
    float _2728 = _2726;
    float _2730 = trunc(_2664);
    float _2732 = precise::max(_2730, 0.0);
    uint _2734 = uint(_2732);
    bool _2736 = uint(_2718) > 1u;
    float _2738 = fma(_2676, _2628, _2674);
    int _2740 = _2626 & 3;
    bool _2742 = _2740 != 0;
    uint _2744 = uint(int(uint(_2680) >> uint(2)));
    uint _2746 = uint(int(uint(int(_2744)) >> uint(2)));
    int _2748 = int(_2744) & 3;
    float _2750 = (*spvDescriptorSet0.vp_c9)._m0[int(_2746)][_2748];
    int _2752 = int(_2744) + 1;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    int _2756 = _2752 & 3;
    float _2758 = (*spvDescriptorSet0.vp_c9)._m0[int(_2754)][_2756];
    float _2760 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2762 = _2718 != 3;
    float _2764 = _2696 * _2682;
    float _2766 = fma(_1306, _2760, _1154);
    int _2768 = ~_1094;
    int _2770 = _2768 + 1;
    float _2772 = _2594 + 0.5;
    float _2774 = fma(_2764, _2724, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2776 = _2742 ? 0 : 1;
    float _2778 = _2766 + 0.5;
    bool _2780 = uint(_2718) >= 2u;
    float _2782 = fma(_2774, _2620, _2738);
    int _2784 = int(_2508) + int(_2734);
    int _2786 = ~_2776;
    int _2788 = _2786 + 1;
    int _2790 = _2788 + 1;
    out.m_67.x = _2778;
    out.m_67.y = _2772;
    int _2792 = _2780 ? 0 : 1;
    int _2794 = _2770 * _2784;
    int _2796 = _2794 + _2420;
    int _2798 = _2790;
    if (!_2736)
    {
        int _2800 = ~_2776;
        int _2802 = _2800 + 1;
        _2798 = _2802;
    }
    int _2804 = _2798;
    float _2806 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2782);
    bool _2808 = !_2720;
    int _2810 = _2808 ? 0 : 1;
    bool _2812 = uint(_2796) >= uint(_1094);
    bool _2814 = _2718 != 3;
    int _2816 = ~_2792;
    int _2818 = _2816 + 1;
    int _2820 = _2818 + 1;
    int _2822 = abs(_2804);
    int _2824 = _2820;
    if (_2762)
    {
        int _2826 = ~_2792;
        int _2828 = _2826 + 1;
        _2824 = _2828;
    }
    int _2830 = _2824;
    bool _2832 = !_2814;
    int _2834 = _2832 ? 0 : (-1);
    int _2836 = abs(_2810);
    int _2838 = abs(_2830);
    int _2840 = ~_2822;
    int _2842 = _2840 + 1;
    int _2844 = _2842 + 1;
    int _2846 = abs(_2834);
    int _2848 = ~_2836;
    int _2850 = _2848 + 1;
    int _2852 = _2850 + 1;
    bool _2854 = !_2812;
    int _2856 = _2854 ? 0 : (-1);
    int _2858 = _2844 * as_type<int>(_2758);
    int _2860 = ~_2838;
    int _2862 = _2860 + 1;
    int _2864 = _2862 + 1;
    int _2866 = ~_2784;
    int _2868 = _2866 + _2856;
    int _2870 = _2868 + 1;
    int _2872 = _2852 * as_type<int>(_2750);
    int _2874 = _2872 + _2858;
    int _2876 = ~_2846;
    int _2878 = _2876 + 1;
    int _2880 = _2878 + 1;
    int _2882 = _2864 * as_type<int>(_2708);
    int _2884 = _2882 + _2874;
    bool _2886 = !_2442;
    int _2888 = _2886 ? 0 : 1;
    int _2890 = _1094 * _2870;
    int _2892 = _2890 + _2420;
    int _2894 = _2880 * as_type<int>(_2716);
    int _2896 = _2894 + _2884;
    int _2898 = abs(_2888);
    float _2900 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2902 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2904 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2906 = _1832 * _1894;
    bool _2908 = !_2350;
    int _2910 = _2908 ? _2892 : (-1);
    float _2912 = _2904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2914 = ~_2898;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    float _2920 = _2906 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2922 = _2902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2924 = _2900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2926 = _2806 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2928 = _2896 * _2918;
    bool _2930 = _1832 > 0.0;
    bool _2932 = isnan(_1832);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan(0.0);
    bool _2938 = _2934 || _2936;
    int _2940 = _2910 * _2898;
    int _2942 = _2940 + _2928;
    float _2944 = _2271 + _2140;
    float _2946 = _2920 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2948 = _1894 <= 0.0;
    bool _2950 = !_2938;
    bool _2952 = _2948 || _2950;
    out.m_69.x = _2912;
    out.m_69.y = _2922;
    out.m_69.z = _2924;
    out.m_69.w = _2926;
    float _2954 = _2944 * 0.5;
    float _2956 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2958 = float(_2942);
    out.m_49.x = _2946;
    float _2960 = _2956 * _2214;
    out.m_71.x = _2958;
    float _2962 = _2235 * _2960;
    out.m_73.z = _2954;
    out.m_73.w = _2140;
    float _2964 = _2225 * _2960;
    float _2966 = -_2956;
    float _2968 = _2966 + 1.0;
    float _2970 = fma(_2225, _2962, _2223);
    float _2972 = fma(_2231, _2964, _2219);
    float _2974 = fma(_2233, _2964, _2221);
    float _2976 = _2225 * _2968;
    out.m_75.x = _2972;
    out.m_75.y = _2974;
    out.m_75.z = _2970;
    out.m_75.w = _2976;
    if (!_2952)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2978 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2978;
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
    bool _796 = false;
    bool _698 = false;
    bool _362 = false;
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
        float _3047 = as_type<float>(_118);
        out.gl_Position.z = _3047;
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
        float _3102 = as_type<float>(_144);
        out.gl_Position.z = _3102;
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
    float _180 = _172;
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
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _202 + _204;
    bool _208 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _210 = isnan(_202);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _202 + _220;
    bool _224 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _226 = isnan(_202);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _244 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _246 = isnan(_202);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = 1.0 / _238;
    float _258 = -_254;
    float _260 = _258 + 1.0;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = _234 * _260;
    float _266 = -_234;
    float _268 = _266 + 1.0;
    float _270 = 1.0 / _242;
    float _272 = _206 * _256;
    float _274 = -_218;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _254 * _276;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = fma(_280, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = _222 * _270;
    float _296 = fma(_286, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_290, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _300 = _292 * _264;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _306 = _296 * _264;
    float _308 = _298 * _264;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _318 = fma(_304, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _320 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _306);
    float _322 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _324 = fma(_312, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _326 = fma(_316, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _328 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _308);
    float _330 = fma(_318, _282, _322);
    float _332 = fma(_324, _282, _320);
    float _334 = fma(_326, _282, _328);
    float _336 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[145].y, _330);
    float _338 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[145].x, _332);
    float _340 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[145].z, _334);
    bool _342 = !_262;
    float _360;
    if (!_342)
    {
        float _344 = in.m_53.x;
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        _360 = _156;
    }
    _362 = false;
    float _364 = _360;
    float _366 = in.m_55.x;
    float _368 = in.m_55.y;
    float _370 = in.m_55.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _388 = 1.0 / _374;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _390;
    bool _394 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _396 = isnan(_364);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _364 + _408;
    bool _412 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _414 = isnan(_364);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = 1.0 / _382;
    float _426 = _410 * _388;
    float _428 = _340 * _370;
    bool _430 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _432 = isnan(_364);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _444 = _364 + _442;
    bool _446 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _448 = isnan(_364);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = _336 * _368;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _462 = _364 + _460;
    float _464 = 1.0 / _386;
    float _466 = _444 * _406;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _470 = _364 + _468;
    bool _472 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_364);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -_456;
    float _486 = _484 + 1.0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _490 = _364 + _488;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _494 = 1.0 / _392;
    float _496 = _462 * _424;
    bool _498 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _500 = isnan(_364);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -_482;
    float _512 = _510 + 1.0;
    float _514 = _470 * _464;
    float _516 = -_440;
    float _518 = _516 + 1.0;
    float _520 = _456 * _518;
    float _522 = _404 * _486;
    float _524 = -_404;
    float _526 = _524 + 1.0;
    float _528 = _490 * _494;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = _482 * _526;
    float _540 = _508 * _512;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _554 = -_508;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _558;
    float _562 = fma(_544, _426, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _564 = fma(_548, _466, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _566 = fma(_552, _466, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _568 = fma(_536, _466, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _570 = _422 * _556;
    float _572 = fma(_560, _426, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _574 = fma(_532, _426, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _576 = _562 * _570;
    float _578 = -_422;
    float _580 = _578 + 1.0;
    float _582 = _572 * _570;
    float _584 = _574 * _570;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _594;
    float _598 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[107].x, _576);
    float _600 = fma(_588, _496, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _602 = fma(_592, _496, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _604 = fma(_596, _496, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[107].y, _582);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _620 = fma(_564, _540, _598);
    float _622 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[107].z, _584);
    float _624 = fma(_566, _540, _606);
    float _626 = fma(_610, _514, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _628 = fma(_614, _514, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _630 = fma(_618, _514, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _632 = fma(_600, _538, _620);
    float _634 = fma(_568, _540, _622);
    float _636 = fma(_602, _538, _624);
    float _638 = fma(_604, _538, _634);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _640;
    float _644 = fma(_626, _522, _632);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _646;
    float _650 = fma(_628, _522, _636);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _652;
    float _656 = fma(_642, _528, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _658 = fma(_648, _528, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _660 = fma(_630, _522, _638);
    float _662 = fma(_654, _528, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _664 = fma(_656, _520, _644);
    float _666 = fma(_658, _520, _650);
    float _668 = _338 * _366;
    float _670 = fma(_662, _520, _660);
    float _672 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[112].x, _664);
    float _674 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[112].y, _666);
    float _676 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[112].z, _670);
    bool _678 = !_492;
    float _696;
    if (!_678)
    {
        float _680 = in.m_53.x;
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _684 = _680 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _688 = _686 * _682;
        float _690 = floor(_688);
        float _692 = -_690;
        float _694 = _688 + _692;
        _696 = _694;
        _698 = true;
    }
    else
    {
        _696 = _156;
    }
    _698 = false;
    float _700 = _696;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _704 = _700 + _702;
    bool _706 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _708 = isnan(_700);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _722 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _724 = isnan(_700);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _734;
    float _738 = _672 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _740 = -_716;
    float _742 = _740 + 1.0;
    bool _744 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _746 = 1.0 / _720;
    float _748 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _732 * _742;
    float _752 = -_732;
    float _754 = _752 + 1.0;
    float _756 = _736 * _746;
    float _758 = _676 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _760 = fma(_756, _704, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _762 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _760 * _750;
    float _766 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[115].x, _764);
    float _770 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _772 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[116].x, _768);
    float _774 = _772 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _748;
    out.m_57.y = _770;
    out.m_57.z = _762;
    out.m_57.w = _774;
    bool _776 = !_744;
    float _794;
    if (!_776)
    {
        float _778 = in.m_53.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        _794 = _156;
    }
    _796 = false;
    float _798 = _794;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _802 = _798 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _806 = _798 + _804;
    bool _808 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _810 = isnan(_798);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _820;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _836 = 1.0 / _822;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _840 = _798 + _838;
    bool _842 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _844 = isnan(_798);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = 1.0 / _830;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _856;
    bool _860 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _862 = isnan(_798);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / _826;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _876 = _798 + _874;
    float _878 = _802 * _836;
    bool _880 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _882 = isnan(_798);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = 1.0 / _834;
    float _894 = _806 * _854;
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _898 = fma(_858, _894, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _900 = _876 * _872;
    bool _902 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _904 = isnan(_798);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = -_818;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _922 = _912 * _916;
    float _924 = -_912;
    float _926 = _924 + 1.0;
    float _928 = _840 * _892;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _934;
    float _938 = _890 * _926;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _944 = fma(_932, _894, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _946 = fma(_936, _894, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _948 = -_890;
    float _950 = _948 + 1.0;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _956 = fma(_920, _928, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _958 = fma(_942, _928, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _960 = _852 * _950;
    float _962 = -_852;
    float _964 = _962 + 1.0;
    float _966 = fma(_954, _928, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _968 = _870 * _964;
    float _970 = -_870;
    float _972 = _970 + 1.0;
    float _974 = _944 * _968;
    float _976 = _946 * _968;
    float _978 = _898 * _968;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _980;
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[123].x, _974);
    float _986 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[123].y, _976);
    float _988 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[123].z, _978);
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _994;
    float _998 = fma(_966, _960, _986);
    float _1000 = fma(_956, _960, _984);
    float _1002 = fma(_958, _960, _988);
    float _1004 = fma(_982, _878, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1006 = fma(_992, _878, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1016 = fma(_996, _878, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1022 = fma(_1004, _938, _1000);
    float _1024 = fma(_1010, _900, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1026 = fma(_1014, _900, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1028 = fma(_1006, _938, _998);
    float _1030 = fma(_1020, _900, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1032 = fma(_1016, _938, _1002);
    float _1034 = fma(_1024, _922, _1022);
    float _1036 = fma(_1026, _922, _1028);
    float _1038 = fma(_1030, _922, _1032);
    float _1040 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1034);
    float _1042 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1036);
    float _1044 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1038);
    bool _1046 = !_896;
    if (!_1046)
    {
        float _1048 = in.m_53.x;
        float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1052 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1056 = _1054 * _1050;
        float _1058 = floor(_1056);
        float _1060 = -_1058;
        float _1062 = _1056 + _1060;
        _178 = _1062;
    }
    float _1064 = _178;
    float _1066 = in.m_53.z;
    float _1068 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1070 = int(_1068);
    float _1072 = in.m_53.x;
    float _1074 = in.m_53.y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1090 = _1088 != 0;
    float _1092 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1094 = int(_1092);
    float _1096 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1098 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1100 = !_1086;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1106 = !_1082;
    int _1108 = _1106 ? 0 : 1;
    bool _1110 = !_1090;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1124 = _1122 != 0;
    float _1126 = float(_1070);
    float _1128 = _1066 * 2.0;
    float _1130 = 1.0 / _1126;
    float _1132 = float(_1094);
    float _1134 = _1072 * 2.0;
    float _1136 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1138 = _1074 + _1072;
    float _1140 = _1074 * 2.0;
    float _1142 = _1132 * _100;
    float _1144 = -_1076;
    float _1146 = fma(_1136, 2.0, _1144);
    float _1148 = floor(_1128);
    float _1150 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1152 = -_100;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1146);
    float _1156 = fma(_1150, -2.0, _1078);
    float _1158 = _1138 + (-1.0);
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1162 = 1.0 + _1160;
    float _1164 = floor(_1134);
    bool _1166 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1168 = isnan(1.0);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1174 = _1170 || _1172;
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1178 = _1130 * _100;
    float _1180 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    bool _1182 = _1148 > 0.0;
    float _1184 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1186 = log2(_1184);
    bool _1188 = _1148 >= 0.0;
    bool _1190 = isnan(_1148);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = !_1116;
    int _1200 = _1198 ? 0 : 1;
    int _1202 = _1196 ? 0 : 1;
    bool _1204 = _1164 > 0.0;
    float _1206 = floor(_1140);
    bool _1208 = _1164 >= 0.0;
    bool _1210 = isnan(_1164);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    int _1218 = ~_1202;
    int _1220 = _1218 + 1;
    int _1222 = _1220 + 1;
    int _1224 = _1216 ? 0 : 1;
    int _1226 = abs(_1200);
    float _1228 = 1.0 / _1162;
    int _1230 = _1222;
    if (!_1182)
    {
        int _1232 = ~_1202;
        int _1234 = _1232 + 1;
        _1230 = _1234;
    }
    int _1236 = _1230;
    int _1238 = ~_1224;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    int _1244 = _1242;
    if (!_1204)
    {
        int _1246 = ~_1224;
        int _1248 = _1246 + 1;
        _1244 = _1248;
    }
    int _1250 = _1244;
    float _1252 = _1186 * _100;
    float _1254 = float(_1226);
    float _1256 = float(_1236);
    float _1258 = exp2(_1252);
    bool _1260 = _1206 > 0.0;
    bool _1262 = _1206 >= 0.0;
    bool _1264 = isnan(_1206);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan(0.0);
    bool _1270 = _1266 || _1268;
    float _1272 = _1254 * _1256;
    float _1274 = in.m_59.x;
    float _1276 = in.m_59.y;
    float _1278 = in.m_59.z;
    float _1280 = _1272 * (-2.0);
    bool _1282 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1284 = isnan(0.0);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1290 = _1286 || _1288;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1294 = float(_1250);
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1298 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1292);
    float _1300 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1296);
    bool _1302 = !_1120;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1298);
    float _1308 = -_1258;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1300);
    int _1314 = abs(_1304);
    int _1316 = _1270 ? 0 : 1;
    float _1318 = _1290 ? _1310 : 0.0;
    int _1320 = ~_1316;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    float _1326 = float(_1314);
    int _1328 = _1324;
    if (_1174)
    {
        float _1330 = _1318 * _1228;
        _110 = _1330;
    }
    float _1332 = _110;
    if (!_1260)
    {
        int _1334 = ~_1316;
        int _1336 = _1334 + 1;
        _1328 = _1336;
    }
    int _1338 = _1328;
    float _1340 = _1072 + (-0.5);
    bool _1342 = !_1124;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = fma(_1280, _1274, _1274);
    float _1348 = _1326 * _1294;
    float _1350 = fma(_1176, _1280, _1176);
    int _1352 = abs(_1344);
    float _1354 = _1074 + _1066;
    float _1356 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1346);
    float _1358 = float(_1338);
    float _1360 = _1354 + (-1.0);
    float _1362 = float(_1352);
    float _1364 = fma(_1350, _1332, _1356);
    float _1366 = _1348 * (-2.0);
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1370 = _1074 + (-0.5);
    float _1372 = _1362 * _1358;
    float _1374 = fma(_1366, _1276, _1276);
    float _1376 = _1066 + _1072;
    float _1378 = _1364 * 0.15915493667125701904296875;
    float _1380 = _1372 * (-2.0);
    float _1382 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1374);
    float _1384 = _1376 + (-1.0);
    float _1386 = fma(_1368, _1366, _1368);
    float _1388 = fma(_1380, _1278, _1278);
    float _1390 = in.m_61.x;
    float _1392 = in.m_61.y;
    float _1394 = in.m_61.z;
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1398 = _1066 + (-0.5);
    float _1400 = fma(_1386, _1332, _1382);
    float _1402 = _1378 * 6.283185482025146484375;
    float _1404 = sin(_1402);
    float _1406 = fma(_1396, _1380, _1396);
    float _1408 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1388);
    float _1410 = _1400 * 0.15915493667125701904296875;
    float _1412 = fma(_1406, _1332, _1408);
    float _1414 = _1410 * 6.283185482025146484375;
    float _1416 = sin(_1414);
    float _1418 = _1412 * 0.15915493667125701904296875;
    float _1420 = _1410 * 6.283185482025146484375;
    float _1422 = cos(_1420);
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1390);
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1392);
    float _1428 = _1418 * 6.283185482025146484375;
    float _1430 = cos(_1428);
    float _1432 = _1096 * _1426;
    float _1434 = _1098 * _1424;
    float _1436 = _1378 * 6.283185482025146484375;
    float _1438 = cos(_1436);
    float _1440 = _1418 * 6.283185482025146484375;
    float _1442 = sin(_1440);
    float _1444 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1394);
    float _1446 = _1416 * _1430;
    float _1448 = in.m_42.x;
    float _1450 = in.m_42.y;
    float _1452 = in.m_42.z;
    float _1454 = _1422 * _1430;
    float _1456 = _1104 * _1444;
    float _1458 = _1430 * _1432;
    float _1460 = _1404 * _1416;
    float _1462 = _1438 * _1422;
    float _1464 = _1438 * _1416;
    float _1466 = _1404 * _1422;
    float _1468 = _1438 * _1458;
    float _1470 = fma(_1442, _1462, _1460);
    float _1472 = -_1464;
    float _1474 = fma(_1442, _1466, _1472);
    float _1476 = -_1432;
    float _1478 = _1442 * _1476;
    float _1480 = -_1466;
    float _1482 = fma(_1442, _1464, _1480);
    float _1484 = fma(_1470, _1434, _1468);
    float _1486 = _1404 * _1458;
    float _1488 = fma(_1454, _1434, _1478);
    float _1490 = fma(_1442, _1460, _1462);
    float _1492 = fma(_1482, _1456, _1484);
    float _1494 = fma(_1474, _1434, _1486);
    float _1496 = fma(_1446, _1456, _1488);
    float _1498 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1500 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1502 = fma(_1490, _1456, _1494);
    float _1504 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1506 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1498);
    float _1508 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1510 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1500);
    float _1512 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1504);
    float _1514 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1506);
    float _1516 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1508);
    float _1518 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1510);
    float _1520 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1512);
    float _1522 = _1514 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1524 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1516);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1528 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1530 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1534 = _1522 + _1526;
    float _1536 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1530);
    float _1538 = _1528 + _1532;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1542 = _1534 + _1540;
    float _1544 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1536);
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1548 = _1538 + _1546;
    float _1550 = _1542 * _1542;
    float _1552 = fma(_1548, _1548, _1550);
    float _1554 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1556 = sqrt(_1552);
    float _1558 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1554);
    float _1560 = _1544 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1562 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1558);
    float _1564 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1566 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1568 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1564);
    float _1570 = _1560 + _1566;
    float _1572 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1568);
    bool _1574 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1576 = _1568;
    float _1578 = _1564;
    float _1580 = _1452;
    if (!_1574)
    {
        _1576 = _1538;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (!_1574)
    {
        _1578 = _1534;
    }
    float _1586 = _1578;
    float _1588 = _1586;
    if (!_1574)
    {
        _1580 = _1570;
    }
    float _1590 = _1580;
    bool _1592 = !_1574;
    float _1594 = _1590;
    if (!_1592)
    {
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1600 = _1556 + _1598;
        float _1602 = rsqrt(_1552);
        float _1604 = _1600 * _1596;
        float _1606 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = _1604 * 0.15915493667125701904296875;
        float _1610 = _1608 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = _1608 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612 + (-1.0);
        float _1620 = fma(_1616, _1606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1622 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = _1602 * _1620;
        float _1626 = fma(_1570, _1612, _1622);
        float _1628 = fma(_1548, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1630 = fma(_1542, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1594 = _1626;
        _1584 = _1628;
        _1588 = _1630;
    }
    float _1632 = _1594;
    float _1634 = _1584;
    float _1636 = _1588;
    float _1638 = -_1560;
    float _1640 = _1638 + _1632;
    float _1642 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1644 = -_1528;
    float _1646 = _1644 + _1634;
    float _1648 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1650 = _1640 * _1640;
    float _1652 = -_1522;
    float _1654 = _1652 + _1636;
    float _1656 = 1.0 / _1642;
    float _1658 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1648);
    float _1660 = fma(_1646, _1646, _1650);
    bool _1662 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1664 = isnan(0.5);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1670 = _1666 || _1668;
    float _1672 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1658);
    float _1674 = fma(_1654, _1654, _1660);
    float _1676 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1678 = sqrt(_1674);
    float _1680 = _1676 + _1642;
    float _1682 = _1642;
    float _1684 = _1632;
    float _1686 = _1634;
    float _1688 = _1636;
    float _1690 = _1646;
    if (_1670)
    {
        _1682 = 1.0;
    }
    float _1692 = _1682;
    float _1694 = _1680 * _1656;
    float _1696 = _1694 * 0.5;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1700 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1698);
    float _1702 = 1.0 / _1700;
    bool _1704 = _1678 > 0.0;
    bool _1706 = !_1704;
    float _1708 = _1700;
    float _1710 = _1692;
    if (!_1706)
    {
        float _1712 = _172 * _172;
        float _1714 = fma(_170, _170, _1712);
        float _1716 = rsqrt(_1674);
        float _1718 = fma(_174, _174, _1714);
        float _1720 = sqrt(_1718);
        float _1722 = _1646 * _1716;
        float _1724 = _1640 * _1716;
        float _1726 = _1654 * _1716;
        bool _1728 = _1720 > 0.0;
        bool _1730 = !_1728;
        _1708 = _1720;
        if (!_1730)
        {
            float _1732 = rsqrt(_1718);
            float _1734 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1736 = _172 * _1732;
            float _1738 = _170 * _1732;
            float _1740 = _174 * _1732;
            float _1742 = _1724 * _1736;
            float _1744 = fma(_1722, _1738, _1742);
            float _1746 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1748 = fma(_1726, _1740, _1744);
            float _1750 = _1748 * _1746;
            float _1752 = fma(_170, _1750, _1634);
            float _1754 = fma(_172, _1750, _1632);
            float _1756 = fma(_174, _1750, _1636);
            _1708 = _1744;
            _1684 = _1754;
            _1686 = _1752;
            _1688 = _1756;
            _1690 = _1746;
        }
    }
    float _1758 = _1708;
    float _1760 = _1684;
    float _1762 = _1686;
    float _1764 = _1688;
    float _1766 = _1690;
    float _1768 = _1766;
    float _1770 = _1758;
    if (_1670)
    {
        _1768 = 1.0;
    }
    float _1772 = _1768;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1776 = _1702 * _1774;
    float _1778 = _1772;
    if (!_1670)
    {
        float _1780 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1782 = _1780 * 0.15915493667125701904296875;
        float _1784 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1786 = _1782 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = _1784 * 0.15915493667125701904296875;
        float _1792 = _1782 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = 1.0 / _1788;
        float _1798 = _1790 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        float _1802 = _1794 * _1796;
        float _1804 = _1790 * 6.283185482025146484375;
        float _1806 = sin(_1804);
        float _1808 = _1800 * _1802;
        float _1810 = 1.0 / _1808;
        float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1814 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1812;
        float _1816 = 1.0 / _1814;
        float _1818 = _1806 * _1810;
        float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1822 = fma(_1776, _1818, _1820);
        float _1824 = _1822 * _1816;
        float _1826 = precise::clamp(_1824, 0.0, 1.0);
        _1770 = _1816;
        _180 = _1796;
        _1710 = _1826;
    }
    float _1828 = _1770;
    float _1830 = _180;
    float _1832 = _1710;
    float _1834 = _1828;
    float _1836 = _1830;
    if (!_1670)
    {
        float _1838 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1840 = _1838 * 0.15915493667125701904296875;
        float _1842 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1844 = _1840 * 6.283185482025146484375;
        float _1846 = cos(_1844);
        float _1848 = _1842 * 0.15915493667125701904296875;
        float _1850 = _1840 * 6.283185482025146484375;
        float _1852 = sin(_1850);
        float _1854 = 1.0 / _1846;
        float _1856 = _1848 * 6.283185482025146484375;
        float _1858 = cos(_1856);
        float _1860 = _1852 * _1854;
        float _1862 = _1848 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = _1858 * _1860;
        float _1868 = 1.0 / _1866;
        float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1872 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1870;
        float _1874 = 1.0 / _1872;
        float _1876 = _1864 * _1868;
        float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1880 = fma(_1776, _1876, _1878);
        float _1882 = _1880 * _1874;
        float _1884 = precise::clamp(_1882, 0.0, 1.0);
        float _1886 = -_1884;
        float _1888 = _1886 + 1.0;
        _1834 = _1854;
        _1836 = _1840;
        _1778 = _1888;
    }
    float _1890 = _1834;
    float _1892 = _1836;
    float _1894 = _1778;
    float _1896 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1898 = _1760 + _1896;
    float _1900 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1902 = _1762 + _1900;
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1906 = _1764 + _1904;
    float _1908 = _1898 * _1898;
    float _1910 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1912 = fma(_1902, _1902, _1908);
    float _1914 = fma(_1906, _1906, _1912);
    float _1916 = rsqrt(_1914);
    float _1918 = sqrt(_1914);
    float _1920 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1922 = _1902 * _1920;
    float _1924 = _1906 * _1920;
    float _1926 = _1922 * _1922;
    float _1928 = _1924 * _1924;
    float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1932 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1930);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = _1926 + _1928;
    float _1938 = -_1934;
    float _1940 = _1938 + 1.0;
    float _1942 = sqrt(_1936);
    bool _1944 = _1942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1948 = _1942 + _1946;
    float _1950 = _1916;
    float _1952 = _1936;
    float _1954 = _1948;
    float _1956 = _1890;
    float _1958 = _1898;
    float _1960 = _1892;
    if (_1944)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _1962;
    }
    float _1964 = _1950;
    if (_1944)
    {
        float _1966 = rsqrt(_1936);
        _1952 = _1966;
    }
    float _1968 = _1952;
    if (_1944)
    {
        float _1970 = _1948 * _1964;
        _1954 = _1970;
    }
    float _1972 = _1954;
    if (_1944)
    {
        float _1974 = _1972 * 0.15915493667125701904296875;
        _1956 = _1974;
    }
    float _1976 = _1956;
    float _1978 = _1906;
    float _1980 = _1976;
    if (_1944)
    {
        float _1982 = _1976 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        _1978 = _1984;
    }
    float _1986 = _1978;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = precise::max(0.0, _1988);
    float _1992 = _1964;
    float _1994 = _1990;
    if (_1944)
    {
        float _1996 = _1976 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = -_1920;
    float _2004 = -_1990;
    float _2006 = fma(_1898, _2002, _2004);
    if (!_1944)
    {
        _1994 = _1922;
    }
    float _2008 = _1994;
    float _2010 = _2008;
    if (_1944)
    {
        float _2012 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1958 = _2012;
    }
    float _2014 = _1958;
    float _2016 = _1986;
    float _2018 = _2014;
    if (_1944)
    {
        float _2020 = fma(_1986, _2014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2016 = _2020;
    }
    float _2022 = _2016;
    float _2024 = _2022;
    if (!_1944)
    {
        _2018 = _2006;
    }
    float _2026 = _2018;
    float _2028 = _2026;
    float _2030 = _2000;
    if (_1944)
    {
        float _2032 = _2000 + (-1.0);
        _1960 = _2032;
    }
    float _2034 = _1960;
    float _2036 = _2034;
    if (_1944)
    {
        float _2038 = _1968 * _2022;
        _1980 = _2038;
    }
    float _2040 = _1980;
    if (!_1944)
    {
        _2024 = _1924;
    }
    float _2042 = _2024;
    float _2044 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = _2042;
    if (_1944)
    {
        float _2048 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2036 = _2048;
    }
    float _2050 = _2036;
    float _2052 = _2050;
    if (_1944)
    {
        float _2054 = _1922 * _2040;
        _2010 = _2054;
    }
    float _2056 = _2010;
    if (_1944)
    {
        float _2058 = _1924 * _2040;
        _2046 = _2058;
    }
    float _2060 = _2046;
    float _2062 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1944)
    {
        float _2064 = fma(_2006, _2000, _2050);
        _2028 = _2064;
    }
    float _2066 = _2028;
    if (!_1944)
    {
        _2052 = _1926;
    }
    float _2068 = _2052;
    float _2070 = _2068;
    if (_1944)
    {
        float _2072 = _2056 * _2056;
        _2070 = _2072;
    }
    float _2074 = _2070;
    if (!_1944)
    {
        _2030 = _1928;
    }
    float _2076 = _2030;
    float _2078 = _2076;
    if (_1944)
    {
        float _2080 = _2060 * _2060;
        _2078 = _2080;
    }
    float _2082 = _2078;
    float _2084 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2086 = fma(_2066, _2066, _2074);
    float _2088 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2062);
    float _2090 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2092 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2084);
    float _2094 = _2086 + _2082;
    float _2096 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2088);
    float _2098 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2100 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2092);
    float _2102 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2090);
    float _2104 = _2096 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2106 = rsqrt(_2094);
    float _2108 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2110 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2098);
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2116 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2118 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2110);
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2114);
    float _2122 = -_2116;
    float _2124 = fma(_2122, _1910, 1.0);
    float _2126 = abs(_1940);
    float _2128 = log2(_2126);
    float _2130 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2132 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2120);
    float _2134 = _2106 * _2056;
    float _2136 = _2106 * _2066;
    float _2138 = _2106 * _2060;
    float _2140 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2132);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2146 = log2(_2124);
    float _2148 = _2136 + 1.0;
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = -_2138;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2160 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2162 = 1.0 / _2140;
    float _2164 = fma(_2158, -0.5, 0.5);
    float _2166 = fma(_2158, 0.5, 0.5);
    float _2168 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2144);
    float _2170 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2160);
    float _2172 = fma(_2166, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2174 = exp2(_2154);
    float _2176 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2168);
    float _2178 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2170);
    float _2180 = fma(_2166, _2172, -0.212114393711090087890625);
    float _2182 = _2146 * 0.693147182464599609375;
    float _2184 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2176);
    float _2186 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2178);
    float _2188 = fma(_2166, _2180, 1.570728778839111328125);
    float _2190 = sqrt(_2164);
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2194 = _2186 * _2162;
    float _2196 = -_2136;
    float _2198 = fma(_2174, _2148, _2196);
    float _2200 = _2184 * _2162;
    float _2202 = fma(_2198, 0.5, 0.5);
    float _2204 = fma(_2200, 0.5, 0.5);
    float _2206 = _2190 * 0.636619746685028076171875;
    float _2208 = fma(_2194, -0.5, 0.5);
    float _2210 = -_2188;
    float _2212 = fma(_2206, _2210, 1.0);
    float3 _6398 = float3(_2204, _2208, _2192);
    float _2214 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6398, float3(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6398, float3(0.0), isnan(_6398)), level(0.0)).x;
    float3 _6409 = float3(_2204, _2208, _2192);
    float4 _2217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6409, float3(0.0), isnan(_6409)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6409, float3(0.0), isnan(_6409)), level(0.0)).xyzw;
    float _2219 = _2217.x;
    float _2221 = _2217.y;
    float _2223 = _2217.z;
    float _2225 = _2217.w;
    float2 _6426 = float2(_2212, _2202);
    float3 _2229 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6426, float2(0.0), isnan(_6426)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6426, float2(0.0), isnan(_6426)), level(0.0)).xyz;
    float _2231 = _2229.x;
    float _2233 = _2229.y;
    float _2235 = _2229.z;
    float _2237 = float(uint(_1094));
    float _2239 = trunc(_1178);
    int _2241 = int(_2239);
    int _2243 = ~_1094;
    int _2245 = _2243 + 1;
    float _2247 = _1142 * _152;
    int _2249 = abs(_1102);
    float _2251 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2253 = abs(_1108);
    float _2255 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2257 = _1074 > 0.5;
    float _2259 = 1.0 / _2237;
    float _2261 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2255);
    float _2263 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2261);
    float _2265 = float(uint(_2241));
    float _2267 = trunc(_2247);
    int _2269 = int(_2267);
    float _2271 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2263);
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2186;
    out.gl_Position.z = _2271;
    out.gl_Position.w = _2140;
    int _2273 = as_type<int>(_2259) + (-2);
    float _2275 = exp2(_2251);
    float _2277 = as_type<float>(_2273) * _2265;
    float _2279 = trunc(_2277);
    float _2281 = precise::max(_2279, 0.0);
    uint _2284 = uint(_2281);
    float _2286 = -_2275;
    float _2288 = _2286 + 1.0;
    int _2290 = ~_1094;
    int _2292 = _2290 + 1;
    int _2294 = _2245 * int(_2284);
    int _2296 = _2294 + _2241;
    float _2298 = float(uint(_2296));
    float _2300 = as_type<float>(_2273) * _2298;
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2304 = _2302 != 0;
    float _2306 = trunc(_2300);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    float _2312 = float(_2241);
    bool _2314 = !_2304;
    float _2316 = _2314 ? 7.345489978790283203125 : 1.0;
    bool _2318 = _2312 >= _1132;
    bool _2320 = isnan(_2312);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(_1132);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = _2316 * _1072;
    float _2332 = trunc(_2328);
    int _2334 = int(_2332);
    int _2336 = int(_2284) + int(_2310);
    float _2338 = floor(_2330);
    int _2340 = _2292 * _2336;
    int _2342 = _2340 + _2241;
    bool _2344 = uint(_2342) >= uint(_1094);
    bool _2346 = !_2344;
    int _2348 = _2346 ? 0 : (-1);
    bool _2350 = _1094 == 0;
    int _2352 = ~_2336;
    int _2354 = _2352 + _2348;
    int _2356 = _2354 + 1;
    float _2358 = -_2338;
    float _2360 = _2330 + _2358;
    int _2362 = _1094 + (-1);
    float _2364 = _2360 * _1132;
    int _2366 = _1094 * _2356;
    int _2368 = _2366 + _2241;
    int _2370 = ~_2334;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    int _2376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2378 = _2376 != 0;
    bool _2380 = !_2350;
    int _2382 = _2380 ? _2368 : (-1);
    float _2384 = trunc(_2364);
    int _2386 = int(_2384);
    bool _2388 = !_2378;
    int _2390 = _2388 ? 0 : 1;
    int _2392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2394 = _2392 != 0;
    int _2396 = _2382 * _2374;
    int _2398 = abs(_2390);
    int _2400 = abs(_1112);
    int _2402 = _2334 * _2362;
    int _2404 = _2402 + _2396;
    bool _2406 = !_2394;
    int _2408 = _2406 ? 0 : 1;
    int _2410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2412 = _2410 != 0;
    int _2414 = _2404 * _2249;
    int _2416 = abs(_2408);
    int _2418 = _2386 * _2398;
    int _2420 = _2418 + _2241;
    int _2422 = ~_1094;
    int _2424 = _2422 + 1;
    int _2426 = _2269 * _2253;
    int _2428 = _2426 + _2414;
    int _2430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2432 = _2430 != 0;
    float _2434 = float(uint(_2420));
    int _2436 = _2420 * _2400;
    int _2438 = _2436 + _2428;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2442 = _2440 != 0;
    float _2444 = as_type<float>(_2334);
    float _2446 = as_type<float>(_2245);
    if (_2412)
    {
        float _2448 = in.m_53.x;
        _2444 = _2448;
    }
    float _2450 = _2444;
    int _2452 = ~_1094;
    int _2454 = _2452 + 1;
    int _2456 = _2386 * _2416;
    int _2458 = _2456 + _2438;
    int _2460 = ~_1094;
    int _2462 = _2460 + 1;
    float _2464 = float(uint(_2458));
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2470 = as_type<float>(_2273) * _2464;
    float _2472 = trunc(_2470);
    float _2474 = precise::max(_2472, 0.0);
    uint _2476 = uint(_2474);
    int _2478 = _2462 * int(_2476);
    int _2480 = _2478 + _2458;
    float _2482 = float(uint(_2480));
    float _2484 = as_type<float>(_2273) * _2482;
    float _2486 = in.m_63.y;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2492 = trunc(_2484);
    float _2494 = precise::max(_2492, 0.0);
    uint _2496 = uint(_2494);
    float _2498 = 1.0 / _2490;
    float _2500 = as_type<float>(_2273) * _2434;
    int _2502 = int(_2476) + int(_2496);
    float _2504 = trunc(_2500);
    float _2506 = precise::max(_2504, 0.0);
    uint _2508 = uint(_2506);
    int _2510 = _2424 * _2502;
    int _2512 = _2510 + _2458;
    float _2514 = -_2486;
    float _2516 = _2514 + 1.0;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _2526 = uint(_2512) >= uint(_1094);
    float _2528 = _2520 * _2498;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2532 = _1064 + _2530;
    float _2534 = _2486;
    if (_2432)
    {
        float _2536 = _2257 ? _2516 : _2486;
        _2534 = _2536;
    }
    float _2538 = _2534;
    float _2540 = in.m_63.x;
    bool _2542 = !_2526;
    int _2544 = _2542 ? 0 : (-1);
    bool _2546 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2548 = isnan(_1064);
    bool _2550 = _2546 || _2548;
    bool _2552 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2554 = _2550 || _2552;
    float _2556 = float(_2554);
    int _2558 = _2454 * int(_2508);
    int _2560 = _2558 + _2420;
    int _2562 = ~_2502;
    int _2564 = _2562 + _2544;
    int _2566 = _2564 + 1;
    float _2568 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2570 = fma(_2528, _2532, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2572 = -_2556;
    float _2574 = _2572 + 1.0;
    int _2576 = _1094 * _2566;
    int _2578 = _2576 + _2458;
    bool _2580 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2582 = isnan(_1064);
    bool _2584 = _2580 || _2582;
    bool _2586 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2588 = _2584 || _2586;
    float _2590 = float(_2588);
    float _2592 = -_1180;
    float _2594 = fma(_1312, _2568, _2592);
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2598 = _2596 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2600 = _2450 > 0.5;
    bool _2602 = _2600 && _2412;
    bool _2604 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2606 = isnan(_1064);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2612 = _2608 || _2610;
    float _2614 = float(_2612);
    float _2616 = -_2590;
    float _2618 = _2616 + 1.0;
    float _2620 = _2590 * _2574;
    float _2622 = 1.0 / _2598;
    bool _2624 = !_2350;
    int _2626 = _2624 ? _2578 : (-1);
    float _2628 = _2614 * _2618;
    bool _2630 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2632 = isnan(_1064);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2638 = _2634 || _2636;
    float _2640 = float(_2638);
    float _2642 = -_2614;
    float _2644 = _2642 + 1.0;
    int _2646 = _2626 >> 31;
    float _2648 = float(uint(_2560));
    float _2650 = _2640 * _2644;
    int _2652 = _2646 & 3;
    float _2654 = -_2640;
    float _2656 = _2654 + 1.0;
    if (_2412)
    {
        _2446 = _2540;
    }
    float _2658 = _2446;
    float _2660 = _2570 * _2650;
    int _2662 = _2626 + _2652;
    float _2664 = as_type<float>(_2273) * _2648;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2668 = _1064 + _2666;
    float _2670 = _2524 * _2622;
    int _2672 = _2662 >> 2;
    float _2674 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2660);
    float _2676 = fma(_2670, _2668, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2678 = _2672 << 4;
    int _2680 = _2678 + 368;
    float _2682 = 1.0 / _2468;
    float _2684 = _2658;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    if (_2602)
    {
        float _2688 = -_2658;
        float _2690 = _2688 + 1.0;
        _2684 = _2690;
    }
    float _2692 = _2684;
    float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2696 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2694;
    if (!_2412)
    {
        _2686 = _2540;
    }
    float _2698 = _2686;
    int _2700 = _2680 + 8;
    uint _2702 = uint(int(uint(_2700) >> uint(2)));
    uint _2704 = uint(int(uint(int(_2702)) >> uint(2)));
    int _2706 = int(_2702) & 3;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[int(_2704)][_2706];
    int _2710 = int(_2702) + 1;
    uint _2712 = uint(int(uint(_2710) >> uint(2)));
    int _2714 = _2710 & 3;
    float _2716 = (*spvDescriptorSet0.vp_c9)._m0[int(_2712)][_2714];
    int _2718 = _2626 & 3;
    bool _2720 = _2718 != 0;
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2724 = _1064 + _2722;
    float _2726 = _2698;
    if (_2412)
    {
        _2726 = _2692;
    }
    float _2728 = _2726;
    float _2730 = trunc(_2664);
    float _2732 = precise::max(_2730, 0.0);
    uint _2734 = uint(_2732);
    bool _2736 = uint(_2718) > 1u;
    float _2738 = fma(_2676, _2628, _2674);
    int _2740 = _2626 & 3;
    bool _2742 = _2740 != 0;
    uint _2744 = uint(int(uint(_2680) >> uint(2)));
    uint _2746 = uint(int(uint(int(_2744)) >> uint(2)));
    int _2748 = int(_2744) & 3;
    float _2750 = (*spvDescriptorSet0.vp_c9)._m0[int(_2746)][_2748];
    int _2752 = int(_2744) + 1;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    int _2756 = _2752 & 3;
    float _2758 = (*spvDescriptorSet0.vp_c9)._m0[int(_2754)][_2756];
    float _2760 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2762 = _2718 != 3;
    float _2764 = _2696 * _2682;
    float _2766 = fma(_1306, _2760, _1154);
    int _2768 = ~_1094;
    int _2770 = _2768 + 1;
    float _2772 = _2594 + 0.5;
    float _2774 = fma(_2764, _2724, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2776 = _2742 ? 0 : 1;
    float _2778 = _2766 + 0.5;
    bool _2780 = uint(_2718) >= 2u;
    float _2782 = fma(_2774, _2620, _2738);
    int _2784 = int(_2508) + int(_2734);
    int _2786 = ~_2776;
    int _2788 = _2786 + 1;
    int _2790 = _2788 + 1;
    out.m_67.x = _2778;
    out.m_67.y = _2772;
    int _2792 = _2780 ? 0 : 1;
    int _2794 = _2770 * _2784;
    int _2796 = _2794 + _2420;
    int _2798 = _2790;
    if (!_2736)
    {
        int _2800 = ~_2776;
        int _2802 = _2800 + 1;
        _2798 = _2802;
    }
    int _2804 = _2798;
    float _2806 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2782);
    bool _2808 = !_2720;
    int _2810 = _2808 ? 0 : 1;
    bool _2812 = uint(_2796) >= uint(_1094);
    bool _2814 = _2718 != 3;
    int _2816 = ~_2792;
    int _2818 = _2816 + 1;
    int _2820 = _2818 + 1;
    int _2822 = abs(_2804);
    int _2824 = _2820;
    if (_2762)
    {
        int _2826 = ~_2792;
        int _2828 = _2826 + 1;
        _2824 = _2828;
    }
    int _2830 = _2824;
    bool _2832 = !_2814;
    int _2834 = _2832 ? 0 : (-1);
    int _2836 = abs(_2810);
    int _2838 = abs(_2830);
    int _2840 = ~_2822;
    int _2842 = _2840 + 1;
    int _2844 = _2842 + 1;
    int _2846 = abs(_2834);
    int _2848 = ~_2836;
    int _2850 = _2848 + 1;
    int _2852 = _2850 + 1;
    bool _2854 = !_2812;
    int _2856 = _2854 ? 0 : (-1);
    int _2858 = _2844 * as_type<int>(_2758);
    int _2860 = ~_2838;
    int _2862 = _2860 + 1;
    int _2864 = _2862 + 1;
    int _2866 = ~_2784;
    int _2868 = _2866 + _2856;
    int _2870 = _2868 + 1;
    int _2872 = _2852 * as_type<int>(_2750);
    int _2874 = _2872 + _2858;
    int _2876 = ~_2846;
    int _2878 = _2876 + 1;
    int _2880 = _2878 + 1;
    int _2882 = _2864 * as_type<int>(_2708);
    int _2884 = _2882 + _2874;
    bool _2886 = !_2442;
    int _2888 = _2886 ? 0 : 1;
    int _2890 = _1094 * _2870;
    int _2892 = _2890 + _2420;
    int _2894 = _2880 * as_type<int>(_2716);
    int _2896 = _2894 + _2884;
    int _2898 = abs(_2888);
    float _2900 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2902 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2904 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2906 = _1832 * _1894;
    bool _2908 = !_2350;
    int _2910 = _2908 ? _2892 : (-1);
    float _2912 = _2904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2914 = ~_2898;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    float _2920 = _2906 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2922 = _2902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2924 = _2900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2926 = _2806 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2928 = _2896 * _2918;
    bool _2930 = _1832 > 0.0;
    bool _2932 = isnan(_1832);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan(0.0);
    bool _2938 = _2934 || _2936;
    int _2940 = _2910 * _2898;
    int _2942 = _2940 + _2928;
    float _2944 = _2271 + _2140;
    float _2946 = _2920 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2948 = _1894 <= 0.0;
    bool _2950 = !_2938;
    bool _2952 = _2948 || _2950;
    out.m_69.x = _2912;
    out.m_69.y = _2922;
    out.m_69.z = _2924;
    out.m_69.w = _2926;
    float _2954 = _2944 * 0.5;
    float _2956 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2958 = float(_2942);
    out.m_49.x = _2946;
    float _2960 = _2956 * _2214;
    out.m_71.x = _2958;
    float _2962 = _2235 * _2960;
    out.m_73.z = _2954;
    out.m_73.w = _2140;
    float _2964 = _2225 * _2960;
    float _2966 = -_2956;
    float _2968 = _2966 + 1.0;
    float _2970 = fma(_2225, _2962, _2223);
    float _2972 = fma(_2231, _2964, _2219);
    float _2974 = fma(_2233, _2964, _2221);
    float _2976 = _2225 * _2968;
    out.m_75.x = _2972;
    out.m_75.y = _2974;
    out.m_75.z = _2970;
    out.m_75.w = _2976;
    if (!_2952)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2978 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2978;
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
    bool _796 = false;
    bool _698 = false;
    bool _362 = false;
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
        float _3047 = as_type<float>(_118);
        out.gl_Position.z = _3047;
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
        float _3102 = as_type<float>(_144);
        out.gl_Position.z = _3102;
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
    float _180 = _172;
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
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _202 + _204;
    bool _208 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _210 = isnan(_202);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _202 + _220;
    bool _224 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _226 = isnan(_202);
    bool _228 = _224 || _226;
    bool _230 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _232 = _228 || _230;
    float _234 = float(_232);
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _244 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _246 = isnan(_202);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _252 = _248 || _250;
    float _254 = float(_252);
    float _256 = 1.0 / _238;
    float _258 = -_254;
    float _260 = _258 + 1.0;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = _234 * _260;
    float _266 = -_234;
    float _268 = _266 + 1.0;
    float _270 = 1.0 / _242;
    float _272 = _206 * _256;
    float _274 = -_218;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = _254 * _276;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _284;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _288;
    float _292 = fma(_280, _272, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = _222 * _270;
    float _296 = fma(_286, _272, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_290, _272, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _300 = _292 * _264;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _306 = _296 * _264;
    float _308 = _298 * _264;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _318 = fma(_304, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _320 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _306);
    float _322 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _324 = fma(_312, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _326 = fma(_316, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _328 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _308);
    float _330 = fma(_318, _282, _322);
    float _332 = fma(_324, _282, _320);
    float _334 = fma(_326, _282, _328);
    float _336 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[145].y, _330);
    float _338 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[145].x, _332);
    float _340 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[145].z, _334);
    bool _342 = !_262;
    float _360;
    if (!_342)
    {
        float _344 = in.m_53.x;
        float _346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _348 = _344 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _350 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _352 = _350 * _346;
        float _354 = floor(_352);
        float _356 = -_354;
        float _358 = _352 + _356;
        _360 = _358;
        _362 = true;
    }
    else
    {
        _360 = _156;
    }
    _362 = false;
    float _364 = _360;
    float _366 = in.m_55.x;
    float _368 = in.m_55.y;
    float _370 = in.m_55.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _388 = 1.0 / _374;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _390;
    bool _394 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _396 = isnan(_364);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = 1.0 / _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _410 = _364 + _408;
    bool _412 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _414 = isnan(_364);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = 1.0 / _382;
    float _426 = _410 * _388;
    float _428 = _340 * _370;
    bool _430 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _432 = isnan(_364);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _444 = _364 + _442;
    bool _446 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _448 = isnan(_364);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = _336 * _368;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _462 = _364 + _460;
    float _464 = 1.0 / _386;
    float _466 = _444 * _406;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _470 = _364 + _468;
    bool _472 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_364);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -_456;
    float _486 = _484 + 1.0;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _490 = _364 + _488;
    bool _492 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _494 = 1.0 / _392;
    float _496 = _462 * _424;
    bool _498 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _500 = isnan(_364);
    bool _502 = _498 || _500;
    bool _504 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = -_482;
    float _512 = _510 + 1.0;
    float _514 = _470 * _464;
    float _516 = -_440;
    float _518 = _516 + 1.0;
    float _520 = _456 * _518;
    float _522 = _404 * _486;
    float _524 = -_404;
    float _526 = _524 + 1.0;
    float _528 = _490 * _494;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = _482 * _526;
    float _540 = _508 * _512;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _554 = -_508;
    float _556 = _554 + 1.0;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _558;
    float _562 = fma(_544, _426, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _564 = fma(_548, _466, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _566 = fma(_552, _466, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _568 = fma(_536, _466, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _570 = _422 * _556;
    float _572 = fma(_560, _426, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _574 = fma(_532, _426, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _576 = _562 * _570;
    float _578 = -_422;
    float _580 = _578 + 1.0;
    float _582 = _572 * _570;
    float _584 = _574 * _570;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _586;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _594;
    float _598 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[107].x, _576);
    float _600 = fma(_588, _496, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _602 = fma(_592, _496, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _604 = fma(_596, _496, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[107].y, _582);
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _620 = fma(_564, _540, _598);
    float _622 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[107].z, _584);
    float _624 = fma(_566, _540, _606);
    float _626 = fma(_610, _514, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _628 = fma(_614, _514, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _630 = fma(_618, _514, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _632 = fma(_600, _538, _620);
    float _634 = fma(_568, _540, _622);
    float _636 = fma(_602, _538, _624);
    float _638 = fma(_604, _538, _634);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _640;
    float _644 = fma(_626, _522, _632);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _646;
    float _650 = fma(_628, _522, _636);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _652;
    float _656 = fma(_642, _528, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _658 = fma(_648, _528, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _660 = fma(_630, _522, _638);
    float _662 = fma(_654, _528, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _664 = fma(_656, _520, _644);
    float _666 = fma(_658, _520, _650);
    float _668 = _338 * _366;
    float _670 = fma(_662, _520, _660);
    float _672 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[112].x, _664);
    float _674 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[112].y, _666);
    float _676 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[112].z, _670);
    bool _678 = !_492;
    float _696;
    if (!_678)
    {
        float _680 = in.m_53.x;
        float _682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _684 = _680 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _686 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _688 = _686 * _682;
        float _690 = floor(_688);
        float _692 = -_690;
        float _694 = _688 + _692;
        _696 = _694;
        _698 = true;
    }
    else
    {
        _696 = _156;
    }
    _698 = false;
    float _700 = _696;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _704 = _700 + _702;
    bool _706 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _708 = isnan(_700);
    bool _710 = _706 || _708;
    bool _712 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _722 = _700 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _724 = isnan(_700);
    bool _726 = _722 || _724;
    bool _728 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _730 = _726 || _728;
    float _732 = float(_730);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _734;
    float _738 = _672 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _740 = -_716;
    float _742 = _740 + 1.0;
    bool _744 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _746 = 1.0 / _720;
    float _748 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _732 * _742;
    float _752 = -_732;
    float _754 = _752 + 1.0;
    float _756 = _736 * _746;
    float _758 = _676 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _760 = fma(_756, _704, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _762 = _758 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _764 = _760 * _750;
    float _766 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _768 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[115].x, _764);
    float _770 = _766 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _772 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[116].x, _768);
    float _774 = _772 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _748;
    out.m_57.y = _770;
    out.m_57.z = _762;
    out.m_57.w = _774;
    bool _776 = !_744;
    float _794;
    if (!_776)
    {
        float _778 = in.m_53.x;
        float _780 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _782 = _778 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _786 = _784 * _780;
        float _788 = floor(_786);
        float _790 = -_788;
        float _792 = _786 + _790;
        _794 = _792;
        _796 = true;
    }
    else
    {
        _794 = _156;
    }
    _796 = false;
    float _798 = _794;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _802 = _798 + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _806 = _798 + _804;
    bool _808 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _810 = isnan(_798);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _820;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _828;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _836 = 1.0 / _822;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _840 = _798 + _838;
    bool _842 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _844 = isnan(_798);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = 1.0 / _830;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _856;
    bool _860 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _862 = isnan(_798);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / _826;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _876 = _798 + _874;
    float _878 = _802 * _836;
    bool _880 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _882 = isnan(_798);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = 1.0 / _834;
    float _894 = _806 * _854;
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _898 = fma(_858, _894, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _900 = _876 * _872;
    bool _902 = _798 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _904 = isnan(_798);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = -_818;
    float _916 = _914 + 1.0;
    float _918 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _920 = _918 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _922 = _912 * _916;
    float _924 = -_912;
    float _926 = _924 + 1.0;
    float _928 = _840 * _892;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _934;
    float _938 = _890 * _926;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _944 = fma(_932, _894, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _946 = fma(_936, _894, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _948 = -_890;
    float _950 = _948 + 1.0;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _956 = fma(_920, _928, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _958 = fma(_942, _928, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _960 = _852 * _950;
    float _962 = -_852;
    float _964 = _962 + 1.0;
    float _966 = fma(_954, _928, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _968 = _870 * _964;
    float _970 = -_870;
    float _972 = _970 + 1.0;
    float _974 = _944 * _968;
    float _976 = _946 * _968;
    float _978 = _898 * _968;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _980;
    float _984 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[123].x, _974);
    float _986 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[123].y, _976);
    float _988 = fma(_972, (*spvDescriptorSet0.vp_c9)._m0[123].z, _978);
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _990;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _996 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _994;
    float _998 = fma(_966, _960, _986);
    float _1000 = fma(_956, _960, _984);
    float _1002 = fma(_958, _960, _988);
    float _1004 = fma(_982, _878, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1006 = fma(_992, _878, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1014 = _1012 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1016 = fma(_996, _878, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1022 = fma(_1004, _938, _1000);
    float _1024 = fma(_1010, _900, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1026 = fma(_1014, _900, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1028 = fma(_1006, _938, _998);
    float _1030 = fma(_1020, _900, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1032 = fma(_1016, _938, _1002);
    float _1034 = fma(_1024, _922, _1022);
    float _1036 = fma(_1026, _922, _1028);
    float _1038 = fma(_1030, _922, _1032);
    float _1040 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1034);
    float _1042 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1036);
    float _1044 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1038);
    bool _1046 = !_896;
    if (!_1046)
    {
        float _1048 = in.m_53.x;
        float _1050 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1052 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1054 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1056 = _1054 * _1050;
        float _1058 = floor(_1056);
        float _1060 = -_1058;
        float _1062 = _1056 + _1060;
        _178 = _1062;
    }
    float _1064 = _178;
    float _1066 = in.m_53.z;
    float _1068 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1070 = int(_1068);
    float _1072 = in.m_53.x;
    float _1074 = in.m_53.y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1090 = _1088 != 0;
    float _1092 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1094 = int(_1092);
    float _1096 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1098 = _668 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1100 = !_1086;
    int _1102 = _1100 ? 0 : 1;
    float _1104 = _428 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1106 = !_1082;
    int _1108 = _1106 ? 0 : 1;
    bool _1110 = !_1090;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1116 = _1114 != 0;
    int _1118 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1120 = _1118 != 0;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1124 = _1122 != 0;
    float _1126 = float(_1070);
    float _1128 = _1066 * 2.0;
    float _1130 = 1.0 / _1126;
    float _1132 = float(_1094);
    float _1134 = _1072 * 2.0;
    float _1136 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1138 = _1074 + _1072;
    float _1140 = _1074 * 2.0;
    float _1142 = _1132 * _100;
    float _1144 = -_1076;
    float _1146 = fma(_1136, 2.0, _1144);
    float _1148 = floor(_1128);
    float _1150 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1152 = -_100;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1146);
    float _1156 = fma(_1150, -2.0, _1078);
    float _1158 = _1138 + (-1.0);
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1162 = 1.0 + _1160;
    float _1164 = floor(_1134);
    bool _1166 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1168 = isnan(1.0);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1174 = _1170 || _1172;
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1178 = _1130 * _100;
    float _1180 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1156);
    bool _1182 = _1148 > 0.0;
    float _1184 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1186 = log2(_1184);
    bool _1188 = _1148 >= 0.0;
    bool _1190 = isnan(_1148);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    bool _1198 = !_1116;
    int _1200 = _1198 ? 0 : 1;
    int _1202 = _1196 ? 0 : 1;
    bool _1204 = _1164 > 0.0;
    float _1206 = floor(_1140);
    bool _1208 = _1164 >= 0.0;
    bool _1210 = isnan(_1164);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    int _1218 = ~_1202;
    int _1220 = _1218 + 1;
    int _1222 = _1220 + 1;
    int _1224 = _1216 ? 0 : 1;
    int _1226 = abs(_1200);
    float _1228 = 1.0 / _1162;
    int _1230 = _1222;
    if (!_1182)
    {
        int _1232 = ~_1202;
        int _1234 = _1232 + 1;
        _1230 = _1234;
    }
    int _1236 = _1230;
    int _1238 = ~_1224;
    int _1240 = _1238 + 1;
    int _1242 = _1240 + 1;
    int _1244 = _1242;
    if (!_1204)
    {
        int _1246 = ~_1224;
        int _1248 = _1246 + 1;
        _1244 = _1248;
    }
    int _1250 = _1244;
    float _1252 = _1186 * _100;
    float _1254 = float(_1226);
    float _1256 = float(_1236);
    float _1258 = exp2(_1252);
    bool _1260 = _1206 > 0.0;
    bool _1262 = _1206 >= 0.0;
    bool _1264 = isnan(_1206);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan(0.0);
    bool _1270 = _1266 || _1268;
    float _1272 = _1254 * _1256;
    float _1274 = in.m_59.x;
    float _1276 = in.m_59.y;
    float _1278 = in.m_59.z;
    float _1280 = _1272 * (-2.0);
    bool _1282 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1284 = isnan(0.0);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1290 = _1286 || _1288;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1294 = float(_1250);
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1298 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1292);
    float _1300 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1296);
    bool _1302 = !_1120;
    int _1304 = _1302 ? 0 : 1;
    float _1306 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1298);
    float _1308 = -_1258;
    float _1310 = _1308 + 1.0;
    float _1312 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1300);
    int _1314 = abs(_1304);
    int _1316 = _1270 ? 0 : 1;
    float _1318 = _1290 ? _1310 : 0.0;
    int _1320 = ~_1316;
    int _1322 = _1320 + 1;
    int _1324 = _1322 + 1;
    float _1326 = float(_1314);
    int _1328 = _1324;
    if (_1174)
    {
        float _1330 = _1318 * _1228;
        _110 = _1330;
    }
    float _1332 = _110;
    if (!_1260)
    {
        int _1334 = ~_1316;
        int _1336 = _1334 + 1;
        _1328 = _1336;
    }
    int _1338 = _1328;
    float _1340 = _1072 + (-0.5);
    bool _1342 = !_1124;
    int _1344 = _1342 ? 0 : 1;
    float _1346 = fma(_1280, _1274, _1274);
    float _1348 = _1326 * _1294;
    float _1350 = fma(_1176, _1280, _1176);
    int _1352 = abs(_1344);
    float _1354 = _1074 + _1066;
    float _1356 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1346);
    float _1358 = float(_1338);
    float _1360 = _1354 + (-1.0);
    float _1362 = float(_1352);
    float _1364 = fma(_1350, _1332, _1356);
    float _1366 = _1348 * (-2.0);
    float _1368 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1370 = _1074 + (-0.5);
    float _1372 = _1362 * _1358;
    float _1374 = fma(_1366, _1276, _1276);
    float _1376 = _1066 + _1072;
    float _1378 = _1364 * 0.15915493667125701904296875;
    float _1380 = _1372 * (-2.0);
    float _1382 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1374);
    float _1384 = _1376 + (-1.0);
    float _1386 = fma(_1368, _1366, _1368);
    float _1388 = fma(_1380, _1278, _1278);
    float _1390 = in.m_61.x;
    float _1392 = in.m_61.y;
    float _1394 = in.m_61.z;
    float _1396 = fma(_1384, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1398 = _1066 + (-0.5);
    float _1400 = fma(_1386, _1332, _1382);
    float _1402 = _1378 * 6.283185482025146484375;
    float _1404 = sin(_1402);
    float _1406 = fma(_1396, _1380, _1396);
    float _1408 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1388);
    float _1410 = _1400 * 0.15915493667125701904296875;
    float _1412 = fma(_1406, _1332, _1408);
    float _1414 = _1410 * 6.283185482025146484375;
    float _1416 = sin(_1414);
    float _1418 = _1412 * 0.15915493667125701904296875;
    float _1420 = _1410 * 6.283185482025146484375;
    float _1422 = cos(_1420);
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1390);
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1392);
    float _1428 = _1418 * 6.283185482025146484375;
    float _1430 = cos(_1428);
    float _1432 = _1096 * _1426;
    float _1434 = _1098 * _1424;
    float _1436 = _1378 * 6.283185482025146484375;
    float _1438 = cos(_1436);
    float _1440 = _1418 * 6.283185482025146484375;
    float _1442 = sin(_1440);
    float _1444 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1394);
    float _1446 = _1416 * _1430;
    float _1448 = in.m_42.x;
    float _1450 = in.m_42.y;
    float _1452 = in.m_42.z;
    float _1454 = _1422 * _1430;
    float _1456 = _1104 * _1444;
    float _1458 = _1430 * _1432;
    float _1460 = _1404 * _1416;
    float _1462 = _1438 * _1422;
    float _1464 = _1438 * _1416;
    float _1466 = _1404 * _1422;
    float _1468 = _1438 * _1458;
    float _1470 = fma(_1442, _1462, _1460);
    float _1472 = -_1464;
    float _1474 = fma(_1442, _1466, _1472);
    float _1476 = -_1432;
    float _1478 = _1442 * _1476;
    float _1480 = -_1466;
    float _1482 = fma(_1442, _1464, _1480);
    float _1484 = fma(_1470, _1434, _1468);
    float _1486 = _1404 * _1458;
    float _1488 = fma(_1454, _1434, _1478);
    float _1490 = fma(_1442, _1460, _1462);
    float _1492 = fma(_1482, _1456, _1484);
    float _1494 = fma(_1474, _1434, _1486);
    float _1496 = fma(_1446, _1456, _1488);
    float _1498 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1500 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1502 = fma(_1490, _1456, _1494);
    float _1504 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1506 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1498);
    float _1508 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1510 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1500);
    float _1512 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1504);
    float _1514 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1506);
    float _1516 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1508);
    float _1518 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1510);
    float _1520 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1512);
    float _1522 = _1514 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1524 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1516);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1528 = _1520 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1530 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1534 = _1522 + _1526;
    float _1536 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1530);
    float _1538 = _1528 + _1532;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1542 = _1534 + _1540;
    float _1544 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1536);
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1548 = _1538 + _1546;
    float _1550 = _1542 * _1542;
    float _1552 = fma(_1548, _1548, _1550);
    float _1554 = _1492 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1556 = sqrt(_1552);
    float _1558 = fma(_1496, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1554);
    float _1560 = _1544 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1562 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1558);
    float _1564 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1566 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1568 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1564);
    float _1570 = _1560 + _1566;
    float _1572 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1568);
    bool _1574 = _1556 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1576 = _1568;
    float _1578 = _1564;
    float _1580 = _1452;
    if (!_1574)
    {
        _1576 = _1538;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (!_1574)
    {
        _1578 = _1534;
    }
    float _1586 = _1578;
    float _1588 = _1586;
    if (!_1574)
    {
        _1580 = _1570;
    }
    float _1590 = _1580;
    bool _1592 = !_1574;
    float _1594 = _1590;
    if (!_1592)
    {
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1598 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1600 = _1556 + _1598;
        float _1602 = rsqrt(_1552);
        float _1604 = _1600 * _1596;
        float _1606 = _1570 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = _1604 * 0.15915493667125701904296875;
        float _1610 = _1608 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        float _1614 = _1608 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612 + (-1.0);
        float _1620 = fma(_1616, _1606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1622 = _1618 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = _1602 * _1620;
        float _1626 = fma(_1570, _1612, _1622);
        float _1628 = fma(_1548, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1630 = fma(_1542, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1594 = _1626;
        _1584 = _1628;
        _1588 = _1630;
    }
    float _1632 = _1594;
    float _1634 = _1584;
    float _1636 = _1588;
    float _1638 = -_1560;
    float _1640 = _1638 + _1632;
    float _1642 = _1572 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1644 = -_1528;
    float _1646 = _1644 + _1634;
    float _1648 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1650 = _1640 * _1640;
    float _1652 = -_1522;
    float _1654 = _1652 + _1636;
    float _1656 = 1.0 / _1642;
    float _1658 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1648);
    float _1660 = fma(_1646, _1646, _1650);
    bool _1662 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1664 = isnan(0.5);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1670 = _1666 || _1668;
    float _1672 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1658);
    float _1674 = fma(_1654, _1654, _1660);
    float _1676 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1678 = sqrt(_1674);
    float _1680 = _1676 + _1642;
    float _1682 = _1642;
    float _1684 = _1632;
    float _1686 = _1634;
    float _1688 = _1636;
    float _1690 = _1646;
    if (_1670)
    {
        _1682 = 1.0;
    }
    float _1692 = _1682;
    float _1694 = _1680 * _1656;
    float _1696 = _1694 * 0.5;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1700 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1698);
    float _1702 = 1.0 / _1700;
    bool _1704 = _1678 > 0.0;
    bool _1706 = !_1704;
    float _1708 = _1700;
    float _1710 = _1692;
    if (!_1706)
    {
        float _1712 = _172 * _172;
        float _1714 = fma(_170, _170, _1712);
        float _1716 = rsqrt(_1674);
        float _1718 = fma(_174, _174, _1714);
        float _1720 = sqrt(_1718);
        float _1722 = _1646 * _1716;
        float _1724 = _1640 * _1716;
        float _1726 = _1654 * _1716;
        bool _1728 = _1720 > 0.0;
        bool _1730 = !_1728;
        _1708 = _1720;
        if (!_1730)
        {
            float _1732 = rsqrt(_1718);
            float _1734 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1736 = _172 * _1732;
            float _1738 = _170 * _1732;
            float _1740 = _174 * _1732;
            float _1742 = _1724 * _1736;
            float _1744 = fma(_1722, _1738, _1742);
            float _1746 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1748 = fma(_1726, _1740, _1744);
            float _1750 = _1748 * _1746;
            float _1752 = fma(_170, _1750, _1634);
            float _1754 = fma(_172, _1750, _1632);
            float _1756 = fma(_174, _1750, _1636);
            _1708 = _1744;
            _1684 = _1754;
            _1686 = _1752;
            _1688 = _1756;
            _1690 = _1746;
        }
    }
    float _1758 = _1708;
    float _1760 = _1684;
    float _1762 = _1686;
    float _1764 = _1688;
    float _1766 = _1690;
    float _1768 = _1766;
    float _1770 = _1758;
    if (_1670)
    {
        _1768 = 1.0;
    }
    float _1772 = _1768;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1776 = _1702 * _1774;
    float _1778 = _1772;
    if (!_1670)
    {
        float _1780 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1782 = _1780 * 0.15915493667125701904296875;
        float _1784 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1786 = _1782 * 6.283185482025146484375;
        float _1788 = cos(_1786);
        float _1790 = _1784 * 0.15915493667125701904296875;
        float _1792 = _1782 * 6.283185482025146484375;
        float _1794 = sin(_1792);
        float _1796 = 1.0 / _1788;
        float _1798 = _1790 * 6.283185482025146484375;
        float _1800 = cos(_1798);
        float _1802 = _1794 * _1796;
        float _1804 = _1790 * 6.283185482025146484375;
        float _1806 = sin(_1804);
        float _1808 = _1800 * _1802;
        float _1810 = 1.0 / _1808;
        float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1814 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1812;
        float _1816 = 1.0 / _1814;
        float _1818 = _1806 * _1810;
        float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1822 = fma(_1776, _1818, _1820);
        float _1824 = _1822 * _1816;
        float _1826 = precise::clamp(_1824, 0.0, 1.0);
        _1770 = _1816;
        _180 = _1796;
        _1710 = _1826;
    }
    float _1828 = _1770;
    float _1830 = _180;
    float _1832 = _1710;
    float _1834 = _1828;
    float _1836 = _1830;
    if (!_1670)
    {
        float _1838 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1840 = _1838 * 0.15915493667125701904296875;
        float _1842 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1844 = _1840 * 6.283185482025146484375;
        float _1846 = cos(_1844);
        float _1848 = _1842 * 0.15915493667125701904296875;
        float _1850 = _1840 * 6.283185482025146484375;
        float _1852 = sin(_1850);
        float _1854 = 1.0 / _1846;
        float _1856 = _1848 * 6.283185482025146484375;
        float _1858 = cos(_1856);
        float _1860 = _1852 * _1854;
        float _1862 = _1848 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = _1858 * _1860;
        float _1868 = 1.0 / _1866;
        float _1870 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1872 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1870;
        float _1874 = 1.0 / _1872;
        float _1876 = _1864 * _1868;
        float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1880 = fma(_1776, _1876, _1878);
        float _1882 = _1880 * _1874;
        float _1884 = precise::clamp(_1882, 0.0, 1.0);
        float _1886 = -_1884;
        float _1888 = _1886 + 1.0;
        _1834 = _1854;
        _1836 = _1840;
        _1778 = _1888;
    }
    float _1890 = _1834;
    float _1892 = _1836;
    float _1894 = _1778;
    float _1896 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1898 = _1760 + _1896;
    float _1900 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1902 = _1762 + _1900;
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1906 = _1764 + _1904;
    float _1908 = _1898 * _1898;
    float _1910 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1912 = fma(_1902, _1902, _1908);
    float _1914 = fma(_1906, _1906, _1912);
    float _1916 = rsqrt(_1914);
    float _1918 = sqrt(_1914);
    float _1920 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1922 = _1902 * _1920;
    float _1924 = _1906 * _1920;
    float _1926 = _1922 * _1922;
    float _1928 = _1924 * _1924;
    float _1930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1932 = fma(_1918, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1930);
    float _1934 = precise::clamp(_1932, 0.0, 1.0);
    float _1936 = _1926 + _1928;
    float _1938 = -_1934;
    float _1940 = _1938 + 1.0;
    float _1942 = sqrt(_1936);
    bool _1944 = _1942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1946 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1948 = _1942 + _1946;
    float _1950 = _1916;
    float _1952 = _1936;
    float _1954 = _1948;
    float _1956 = _1890;
    float _1958 = _1898;
    float _1960 = _1892;
    if (_1944)
    {
        float _1962 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _1962;
    }
    float _1964 = _1950;
    if (_1944)
    {
        float _1966 = rsqrt(_1936);
        _1952 = _1966;
    }
    float _1968 = _1952;
    if (_1944)
    {
        float _1970 = _1948 * _1964;
        _1954 = _1970;
    }
    float _1972 = _1954;
    if (_1944)
    {
        float _1974 = _1972 * 0.15915493667125701904296875;
        _1956 = _1974;
    }
    float _1976 = _1956;
    float _1978 = _1906;
    float _1980 = _1976;
    if (_1944)
    {
        float _1982 = _1976 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        _1978 = _1984;
    }
    float _1986 = _1978;
    float _1988 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1990 = precise::max(0.0, _1988);
    float _1992 = _1964;
    float _1994 = _1990;
    if (_1944)
    {
        float _1996 = _1976 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = -_1920;
    float _2004 = -_1990;
    float _2006 = fma(_1898, _2002, _2004);
    if (!_1944)
    {
        _1994 = _1922;
    }
    float _2008 = _1994;
    float _2010 = _2008;
    if (_1944)
    {
        float _2012 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1958 = _2012;
    }
    float _2014 = _1958;
    float _2016 = _1986;
    float _2018 = _2014;
    if (_1944)
    {
        float _2020 = fma(_1986, _2014, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2016 = _2020;
    }
    float _2022 = _2016;
    float _2024 = _2022;
    if (!_1944)
    {
        _2018 = _2006;
    }
    float _2026 = _2018;
    float _2028 = _2026;
    float _2030 = _2000;
    if (_1944)
    {
        float _2032 = _2000 + (-1.0);
        _1960 = _2032;
    }
    float _2034 = _1960;
    float _2036 = _2034;
    if (_1944)
    {
        float _2038 = _1968 * _2022;
        _1980 = _2038;
    }
    float _2040 = _1980;
    if (!_1944)
    {
        _2024 = _1924;
    }
    float _2042 = _2024;
    float _2044 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = _2042;
    if (_1944)
    {
        float _2048 = _2034 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2036 = _2048;
    }
    float _2050 = _2036;
    float _2052 = _2050;
    if (_1944)
    {
        float _2054 = _1922 * _2040;
        _2010 = _2054;
    }
    float _2056 = _2010;
    if (_1944)
    {
        float _2058 = _1924 * _2040;
        _2046 = _2058;
    }
    float _2060 = _2046;
    float _2062 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1944)
    {
        float _2064 = fma(_2006, _2000, _2050);
        _2028 = _2064;
    }
    float _2066 = _2028;
    if (!_1944)
    {
        _2052 = _1926;
    }
    float _2068 = _2052;
    float _2070 = _2068;
    if (_1944)
    {
        float _2072 = _2056 * _2056;
        _2070 = _2072;
    }
    float _2074 = _2070;
    if (!_1944)
    {
        _2030 = _1928;
    }
    float _2076 = _2030;
    float _2078 = _2076;
    if (_1944)
    {
        float _2080 = _2060 * _2060;
        _2078 = _2080;
    }
    float _2082 = _2078;
    float _2084 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2086 = fma(_2066, _2066, _2074);
    float _2088 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2062);
    float _2090 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2092 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2084);
    float _2094 = _2086 + _2082;
    float _2096 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2088);
    float _2098 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2100 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2092);
    float _2102 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2090);
    float _2104 = _2096 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2106 = rsqrt(_2094);
    float _2108 = _2100 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2110 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2098);
    float _2112 = _2102 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2114 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2116 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2118 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2110);
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2114);
    float _2122 = -_2116;
    float _2124 = fma(_2122, _1910, 1.0);
    float _2126 = abs(_1940);
    float _2128 = log2(_2126);
    float _2130 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2132 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2120);
    float _2134 = _2106 * _2056;
    float _2136 = _2106 * _2066;
    float _2138 = _2106 * _2060;
    float _2140 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2132);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2146 = log2(_2124);
    float _2148 = _2136 + 1.0;
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = -_2138;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2160 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2162 = 1.0 / _2140;
    float _2164 = fma(_2158, -0.5, 0.5);
    float _2166 = fma(_2158, 0.5, 0.5);
    float _2168 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2144);
    float _2170 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2160);
    float _2172 = fma(_2166, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2174 = exp2(_2154);
    float _2176 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2168);
    float _2178 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2170);
    float _2180 = fma(_2166, _2172, -0.212114393711090087890625);
    float _2182 = _2146 * 0.693147182464599609375;
    float _2184 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2176);
    float _2186 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2178);
    float _2188 = fma(_2166, _2180, 1.570728778839111328125);
    float _2190 = sqrt(_2164);
    float _2192 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2194 = _2186 * _2162;
    float _2196 = -_2136;
    float _2198 = fma(_2174, _2148, _2196);
    float _2200 = _2184 * _2162;
    float _2202 = fma(_2198, 0.5, 0.5);
    float _2204 = fma(_2200, 0.5, 0.5);
    float _2206 = _2190 * 0.636619746685028076171875;
    float _2208 = fma(_2194, -0.5, 0.5);
    float _2210 = -_2188;
    float _2212 = fma(_2206, _2210, 1.0);
    float3 _6398 = float3(_2204, _2208, _2192);
    float _2214 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6398, float3(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6398, float3(0.0), isnan(_6398)), level(0.0)).x;
    float3 _6409 = float3(_2204, _2208, _2192);
    float4 _2217 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6409, float3(0.0), isnan(_6409)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6409, float3(0.0), isnan(_6409)), level(0.0)).xyzw;
    float _2219 = _2217.x;
    float _2221 = _2217.y;
    float _2223 = _2217.z;
    float _2225 = _2217.w;
    float2 _6426 = float2(_2212, _2202);
    float3 _2229 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6426, float2(0.0), isnan(_6426)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6426, float2(0.0), isnan(_6426)), level(0.0)).xyz;
    float _2231 = _2229.x;
    float _2233 = _2229.y;
    float _2235 = _2229.z;
    float _2237 = float(uint(_1094));
    float _2239 = trunc(_1178);
    int _2241 = int(_2239);
    int _2243 = ~_1094;
    int _2245 = _2243 + 1;
    float _2247 = _1142 * _152;
    int _2249 = abs(_1102);
    float _2251 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2253 = abs(_1108);
    float _2255 = _2104 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2257 = _1074 > 0.5;
    float _2259 = 1.0 / _2237;
    float _2261 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2255);
    float _2263 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2261);
    float _2265 = float(uint(_2241));
    float _2267 = trunc(_2247);
    int _2269 = int(_2267);
    float _2271 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2263);
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2186;
    out.gl_Position.z = _2271;
    out.gl_Position.w = _2140;
    int _2273 = as_type<int>(_2259) + (-2);
    float _2275 = exp2(_2251);
    float _2277 = as_type<float>(_2273) * _2265;
    float _2279 = trunc(_2277);
    float _2281 = precise::max(_2279, 0.0);
    uint _2284 = uint(_2281);
    float _2286 = -_2275;
    float _2288 = _2286 + 1.0;
    int _2290 = ~_1094;
    int _2292 = _2290 + 1;
    int _2294 = _2245 * int(_2284);
    int _2296 = _2294 + _2241;
    float _2298 = float(uint(_2296));
    float _2300 = as_type<float>(_2273) * _2298;
    int _2302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2304 = _2302 != 0;
    float _2306 = trunc(_2300);
    float _2308 = precise::max(_2306, 0.0);
    uint _2310 = uint(_2308);
    float _2312 = float(_2241);
    bool _2314 = !_2304;
    float _2316 = _2314 ? 7.345489978790283203125 : 1.0;
    bool _2318 = _2312 >= _1132;
    bool _2320 = isnan(_2312);
    bool _2322 = _2318 || _2320;
    bool _2324 = isnan(_1132);
    bool _2326 = _2322 || _2324;
    float _2328 = float(_2326);
    float _2330 = _2316 * _1072;
    float _2332 = trunc(_2328);
    int _2334 = int(_2332);
    int _2336 = int(_2284) + int(_2310);
    float _2338 = floor(_2330);
    int _2340 = _2292 * _2336;
    int _2342 = _2340 + _2241;
    bool _2344 = uint(_2342) >= uint(_1094);
    bool _2346 = !_2344;
    int _2348 = _2346 ? 0 : (-1);
    bool _2350 = _1094 == 0;
    int _2352 = ~_2336;
    int _2354 = _2352 + _2348;
    int _2356 = _2354 + 1;
    float _2358 = -_2338;
    float _2360 = _2330 + _2358;
    int _2362 = _1094 + (-1);
    float _2364 = _2360 * _1132;
    int _2366 = _1094 * _2356;
    int _2368 = _2366 + _2241;
    int _2370 = ~_2334;
    int _2372 = _2370 + 1;
    int _2374 = _2372 + 1;
    int _2376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2378 = _2376 != 0;
    bool _2380 = !_2350;
    int _2382 = _2380 ? _2368 : (-1);
    float _2384 = trunc(_2364);
    int _2386 = int(_2384);
    bool _2388 = !_2378;
    int _2390 = _2388 ? 0 : 1;
    int _2392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2394 = _2392 != 0;
    int _2396 = _2382 * _2374;
    int _2398 = abs(_2390);
    int _2400 = abs(_1112);
    int _2402 = _2334 * _2362;
    int _2404 = _2402 + _2396;
    bool _2406 = !_2394;
    int _2408 = _2406 ? 0 : 1;
    int _2410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2412 = _2410 != 0;
    int _2414 = _2404 * _2249;
    int _2416 = abs(_2408);
    int _2418 = _2386 * _2398;
    int _2420 = _2418 + _2241;
    int _2422 = ~_1094;
    int _2424 = _2422 + 1;
    int _2426 = _2269 * _2253;
    int _2428 = _2426 + _2414;
    int _2430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2432 = _2430 != 0;
    float _2434 = float(uint(_2420));
    int _2436 = _2420 * _2400;
    int _2438 = _2436 + _2428;
    int _2440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2442 = _2440 != 0;
    float _2444 = as_type<float>(_2334);
    float _2446 = as_type<float>(_2245);
    if (_2412)
    {
        float _2448 = in.m_53.x;
        _2444 = _2448;
    }
    float _2450 = _2444;
    int _2452 = ~_1094;
    int _2454 = _2452 + 1;
    int _2456 = _2386 * _2416;
    int _2458 = _2456 + _2438;
    int _2460 = ~_1094;
    int _2462 = _2460 + 1;
    float _2464 = float(uint(_2458));
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2470 = as_type<float>(_2273) * _2464;
    float _2472 = trunc(_2470);
    float _2474 = precise::max(_2472, 0.0);
    uint _2476 = uint(_2474);
    int _2478 = _2462 * int(_2476);
    int _2480 = _2478 + _2458;
    float _2482 = float(uint(_2480));
    float _2484 = as_type<float>(_2273) * _2482;
    float _2486 = in.m_63.y;
    float _2488 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2490 = _2488 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2492 = trunc(_2484);
    float _2494 = precise::max(_2492, 0.0);
    uint _2496 = uint(_2494);
    float _2498 = 1.0 / _2490;
    float _2500 = as_type<float>(_2273) * _2434;
    int _2502 = int(_2476) + int(_2496);
    float _2504 = trunc(_2500);
    float _2506 = precise::max(_2504, 0.0);
    uint _2508 = uint(_2506);
    int _2510 = _2424 * _2502;
    int _2512 = _2510 + _2458;
    float _2514 = -_2486;
    float _2516 = _2514 + 1.0;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2518;
    float _2522 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2524 = _2522 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    bool _2526 = uint(_2512) >= uint(_1094);
    float _2528 = _2520 * _2498;
    float _2530 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2532 = _1064 + _2530;
    float _2534 = _2486;
    if (_2432)
    {
        float _2536 = _2257 ? _2516 : _2486;
        _2534 = _2536;
    }
    float _2538 = _2534;
    float _2540 = in.m_63.x;
    bool _2542 = !_2526;
    int _2544 = _2542 ? 0 : (-1);
    bool _2546 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2548 = isnan(_1064);
    bool _2550 = _2546 || _2548;
    bool _2552 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2554 = _2550 || _2552;
    float _2556 = float(_2554);
    int _2558 = _2454 * int(_2508);
    int _2560 = _2558 + _2420;
    int _2562 = ~_2502;
    int _2564 = _2562 + _2544;
    int _2566 = _2564 + 1;
    float _2568 = fma(_2538, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2570 = fma(_2528, _2532, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2572 = -_2556;
    float _2574 = _2572 + 1.0;
    int _2576 = _1094 * _2566;
    int _2578 = _2576 + _2458;
    bool _2580 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2582 = isnan(_1064);
    bool _2584 = _2580 || _2582;
    bool _2586 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2588 = _2584 || _2586;
    float _2590 = float(_2588);
    float _2592 = -_1180;
    float _2594 = fma(_1312, _2568, _2592);
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2598 = _2596 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2600 = _2450 > 0.5;
    bool _2602 = _2600 && _2412;
    bool _2604 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2606 = isnan(_1064);
    bool _2608 = _2604 || _2606;
    bool _2610 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2612 = _2608 || _2610;
    float _2614 = float(_2612);
    float _2616 = -_2590;
    float _2618 = _2616 + 1.0;
    float _2620 = _2590 * _2574;
    float _2622 = 1.0 / _2598;
    bool _2624 = !_2350;
    int _2626 = _2624 ? _2578 : (-1);
    float _2628 = _2614 * _2618;
    bool _2630 = _1064 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2632 = isnan(_1064);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2638 = _2634 || _2636;
    float _2640 = float(_2638);
    float _2642 = -_2614;
    float _2644 = _2642 + 1.0;
    int _2646 = _2626 >> 31;
    float _2648 = float(uint(_2560));
    float _2650 = _2640 * _2644;
    int _2652 = _2646 & 3;
    float _2654 = -_2640;
    float _2656 = _2654 + 1.0;
    if (_2412)
    {
        _2446 = _2540;
    }
    float _2658 = _2446;
    float _2660 = _2570 * _2650;
    int _2662 = _2626 + _2652;
    float _2664 = as_type<float>(_2273) * _2648;
    float _2666 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2668 = _1064 + _2666;
    float _2670 = _2524 * _2622;
    int _2672 = _2662 >> 2;
    float _2674 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2660);
    float _2676 = fma(_2670, _2668, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2678 = _2672 << 4;
    int _2680 = _2678 + 368;
    float _2682 = 1.0 / _2468;
    float _2684 = _2658;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[134].x;
    if (_2602)
    {
        float _2688 = -_2658;
        float _2690 = _2688 + 1.0;
        _2684 = _2690;
    }
    float _2692 = _2684;
    float _2694 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2696 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2694;
    if (!_2412)
    {
        _2686 = _2540;
    }
    float _2698 = _2686;
    int _2700 = _2680 + 8;
    uint _2702 = uint(int(uint(_2700) >> uint(2)));
    uint _2704 = uint(int(uint(int(_2702)) >> uint(2)));
    int _2706 = int(_2702) & 3;
    float _2708 = (*spvDescriptorSet0.vp_c9)._m0[int(_2704)][_2706];
    int _2710 = int(_2702) + 1;
    uint _2712 = uint(int(uint(_2710) >> uint(2)));
    int _2714 = _2710 & 3;
    float _2716 = (*spvDescriptorSet0.vp_c9)._m0[int(_2712)][_2714];
    int _2718 = _2626 & 3;
    bool _2720 = _2718 != 0;
    float _2722 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2724 = _1064 + _2722;
    float _2726 = _2698;
    if (_2412)
    {
        _2726 = _2692;
    }
    float _2728 = _2726;
    float _2730 = trunc(_2664);
    float _2732 = precise::max(_2730, 0.0);
    uint _2734 = uint(_2732);
    bool _2736 = uint(_2718) > 1u;
    float _2738 = fma(_2676, _2628, _2674);
    int _2740 = _2626 & 3;
    bool _2742 = _2740 != 0;
    uint _2744 = uint(int(uint(_2680) >> uint(2)));
    uint _2746 = uint(int(uint(int(_2744)) >> uint(2)));
    int _2748 = int(_2744) & 3;
    float _2750 = (*spvDescriptorSet0.vp_c9)._m0[int(_2746)][_2748];
    int _2752 = int(_2744) + 1;
    uint _2754 = uint(int(uint(_2752) >> uint(2)));
    int _2756 = _2752 & 3;
    float _2758 = (*spvDescriptorSet0.vp_c9)._m0[int(_2754)][_2756];
    float _2760 = fma(_2728, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2762 = _2718 != 3;
    float _2764 = _2696 * _2682;
    float _2766 = fma(_1306, _2760, _1154);
    int _2768 = ~_1094;
    int _2770 = _2768 + 1;
    float _2772 = _2594 + 0.5;
    float _2774 = fma(_2764, _2724, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2776 = _2742 ? 0 : 1;
    float _2778 = _2766 + 0.5;
    bool _2780 = uint(_2718) >= 2u;
    float _2782 = fma(_2774, _2620, _2738);
    int _2784 = int(_2508) + int(_2734);
    int _2786 = ~_2776;
    int _2788 = _2786 + 1;
    int _2790 = _2788 + 1;
    out.m_67.x = _2778;
    out.m_67.y = _2772;
    int _2792 = _2780 ? 0 : 1;
    int _2794 = _2770 * _2784;
    int _2796 = _2794 + _2420;
    int _2798 = _2790;
    if (!_2736)
    {
        int _2800 = ~_2776;
        int _2802 = _2800 + 1;
        _2798 = _2802;
    }
    int _2804 = _2798;
    float _2806 = fma(_2556, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2782);
    bool _2808 = !_2720;
    int _2810 = _2808 ? 0 : 1;
    bool _2812 = uint(_2796) >= uint(_1094);
    bool _2814 = _2718 != 3;
    int _2816 = ~_2792;
    int _2818 = _2816 + 1;
    int _2820 = _2818 + 1;
    int _2822 = abs(_2804);
    int _2824 = _2820;
    if (_2762)
    {
        int _2826 = ~_2792;
        int _2828 = _2826 + 1;
        _2824 = _2828;
    }
    int _2830 = _2824;
    bool _2832 = !_2814;
    int _2834 = _2832 ? 0 : (-1);
    int _2836 = abs(_2810);
    int _2838 = abs(_2830);
    int _2840 = ~_2822;
    int _2842 = _2840 + 1;
    int _2844 = _2842 + 1;
    int _2846 = abs(_2834);
    int _2848 = ~_2836;
    int _2850 = _2848 + 1;
    int _2852 = _2850 + 1;
    bool _2854 = !_2812;
    int _2856 = _2854 ? 0 : (-1);
    int _2858 = _2844 * as_type<int>(_2758);
    int _2860 = ~_2838;
    int _2862 = _2860 + 1;
    int _2864 = _2862 + 1;
    int _2866 = ~_2784;
    int _2868 = _2866 + _2856;
    int _2870 = _2868 + 1;
    int _2872 = _2852 * as_type<int>(_2750);
    int _2874 = _2872 + _2858;
    int _2876 = ~_2846;
    int _2878 = _2876 + 1;
    int _2880 = _2878 + 1;
    int _2882 = _2864 * as_type<int>(_2708);
    int _2884 = _2882 + _2874;
    bool _2886 = !_2442;
    int _2888 = _2886 ? 0 : 1;
    int _2890 = _1094 * _2870;
    int _2892 = _2890 + _2420;
    int _2894 = _2880 * as_type<int>(_2716);
    int _2896 = _2894 + _2884;
    int _2898 = abs(_2888);
    float _2900 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2902 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2904 = _1040 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2906 = _1832 * _1894;
    bool _2908 = !_2350;
    int _2910 = _2908 ? _2892 : (-1);
    float _2912 = _2904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2914 = ~_2898;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    float _2920 = _2906 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2922 = _2902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2924 = _2900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2926 = _2806 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2928 = _2896 * _2918;
    bool _2930 = _1832 > 0.0;
    bool _2932 = isnan(_1832);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan(0.0);
    bool _2938 = _2934 || _2936;
    int _2940 = _2910 * _2898;
    int _2942 = _2940 + _2928;
    float _2944 = _2271 + _2140;
    float _2946 = _2920 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2948 = _1894 <= 0.0;
    bool _2950 = !_2938;
    bool _2952 = _2948 || _2950;
    out.m_69.x = _2912;
    out.m_69.y = _2922;
    out.m_69.z = _2924;
    out.m_69.w = _2926;
    float _2954 = _2944 * 0.5;
    float _2956 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2958 = float(_2942);
    out.m_49.x = _2946;
    float _2960 = _2956 * _2214;
    out.m_71.x = _2958;
    float _2962 = _2235 * _2960;
    out.m_73.z = _2954;
    out.m_73.w = _2140;
    float _2964 = _2225 * _2960;
    float _2966 = -_2956;
    float _2968 = _2966 + 1.0;
    float _2970 = fma(_2225, _2962, _2223);
    float _2972 = fma(_2231, _2964, _2219);
    float _2974 = fma(_2233, _2964, _2221);
    float _2976 = _2225 * _2968;
    out.m_75.x = _2972;
    out.m_75.y = _2974;
    out.m_75.z = _2970;
    out.m_75.w = _2976;
    if (!_2952)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2978 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2978;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

