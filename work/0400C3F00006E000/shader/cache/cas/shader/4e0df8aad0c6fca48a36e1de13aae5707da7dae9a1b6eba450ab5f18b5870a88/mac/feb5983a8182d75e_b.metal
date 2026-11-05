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
    float4 m_65 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _108 = _91;
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
        float _3468 = as_type<float>(_118);
        out.gl_Position.z = _3468;
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
        float _3523 = as_type<float>(_144);
        out.gl_Position.z = _3523;
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
    float _178 = _172;
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
    float _332 = _238 * _304;
    float _334 = _244 * _264;
    float _336 = -_238;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = -_282;
    float _346 = _344 + 1.0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    float _352 = _326 * _338;
    float _354 = fma(_342, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = _258 * _346;
    float _358 = fma(_350, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = _312 * _352;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _354 * _352;
    float _376 = fma(_330, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_362, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_366, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = _358 * _352;
    float _384 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _368);
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _388;
    float _392 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _382);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _398;
    float _402 = fma(_376, _332, _384);
    float _404 = fma(_378, _332, _386);
    float _406 = fma(_390, _334, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _408 = fma(_380, _332, _392);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _418 = fma(_396, _334, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _420 = fma(_400, _334, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _426 = fma(_406, _356, _402);
    float _428 = fma(_412, _288, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _430 = fma(_416, _288, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _432 = fma(_424, _288, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _434 = fma(_418, _356, _404);
    float _436 = fma(_420, _356, _408);
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
    bool _502 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _504 = isnan(_472);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _494;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _472 + _516;
    bool _520 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _522 = isnan(_472);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _532;
    float _536 = 1.0 / _490;
    float _538 = _518 * _496;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _542 = _472 + _540;
    float _544 = _446 * _476;
    bool _546 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _548 = isnan(_472);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _560 = _472 + _558;
    float _562 = _448 * _478;
    float _564 = 1.0 / _486;
    float _566 = _542 * _514;
    bool _568 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _570 = isnan(_472);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _582 = _472 + _580;
    float _584 = fma(_534, _538, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _586 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _588 = 1.0 / _500;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _592 = _472 + _590;
    float _594 = _560 * _536;
    float _596 = -_578;
    float _598 = _596 + 1.0;
    float _600 = _592 * _564;
    float _602 = -_556;
    float _604 = _602 + 1.0;
    bool _606 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _608 = isnan(_472);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _578 * _604;
    float _620 = _512 * _598;
    bool _622 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _624 = isnan(_472);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = -_616;
    float _636 = _634 + 1.0;
    float _638 = -_512;
    float _640 = _638 + 1.0;
    float _642 = _582 * _588;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _644;
    float _648 = _632 * _636;
    float _650 = -_632;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _654;
    float _658 = _616 * _640;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _664 = fma(_646, _538, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _674 = _530 * _652;
    float _676 = fma(_656, _538, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _678 = fma(_662, _600, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _680 = fma(_668, _600, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _682 = fma(_672, _600, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _684 = _664 * _674;
    float _686 = -_530;
    float _688 = _686 + 1.0;
    float _690 = _676 * _674;
    float _692 = _584 * _674;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _702;
    float _706 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[107].x, _684);
    float _708 = fma(_696, _594, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _710 = fma(_700, _594, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _712 = fma(_704, _594, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _718 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[107].y, _690);
    float _720 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[107].z, _692);
    float _722 = fma(_678, _648, _706);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _728 = fma(_716, _566, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _730 = fma(_680, _648, _718);
    float _732 = fma(_682, _648, _720);
    float _734 = fma(_708, _658, _722);
    float _736 = fma(_726, _566, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _742 = fma(_710, _658, _730);
    float _744 = fma(_712, _658, _732);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _750;
    float _754 = fma(_740, _566, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _756;
    float _760 = fma(_728, _620, _734);
    float _762 = fma(_748, _642, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _764 = fma(_752, _642, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _766 = fma(_758, _642, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _768 = fma(_736, _620, _742);
    float _770 = fma(_754, _620, _744);
    float _772 = fma(_762, _618, _760);
    float _774 = fma(_764, _618, _768);
    float _776 = fma(_766, _618, _770);
    float _778 = _444 * _474;
    float _780 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[112].x, _772);
    float _782 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[112].y, _774);
    float _784 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[112].z, _776);
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
    bool _956 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _958 = isnan(_906);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _970 = isnan(_906);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = 1.0 / _930;
    float _982 = _910 * _936;
    bool _984 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _986 = isnan(_906);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    bool _996 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _998 = 1.0 / _934;
    float _1000 = _914 * _950;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1006;
    float _1010 = fma(_1004, _982, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1012 = fma(_1008, _982, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1014 = _918 * _980;
    float _1016 = -_948;
    float _1018 = _1016 + 1.0;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1020;
    float _1024 = fma(_1022, _982, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1026 = _954 * _998;
    bool _1028 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1030 = isnan(_906);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = _994 * _1018;
    float _1042 = -_994;
    float _1044 = _1042 + 1.0;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1050 = -_1038;
    float _1052 = _1050 + 1.0;
    float _1054 = _1038 * _1044;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1064 = _966 * _1052;
    float _1066 = -_966;
    float _1068 = _1066 + 1.0;
    float _1070 = fma(_1058, _1000, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1072 = fma(_1062, _1000, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1074 = fma(_1048, _1000, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1076 = _978 * _1068;
    float _1078 = -_978;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1082;
    float _1086 = _1010 * _1076;
    float _1088 = _1012 * _1076;
    float _1090 = _1024 * _1076;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1096;
    float _1100 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1086);
    float _1102 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1088);
    float _1104 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1090);
    float _1106 = fma(_1094, _1014, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1108 = fma(_1098, _1014, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1110 = fma(_1084, _1014, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1112 = fma(_1070, _1064, _1100);
    float _1114 = fma(_1072, _1064, _1102);
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1124 = fma(_1074, _1064, _1104);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1130 = fma(_1106, _1054, _1112);
    float _1132 = fma(_1118, _1026, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1134 = fma(_1122, _1026, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1136 = fma(_1108, _1054, _1114);
    float _1138 = fma(_1128, _1026, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1140 = fma(_1110, _1054, _1124);
    float _1142 = fma(_1132, _1040, _1130);
    float _1144 = fma(_1134, _1040, _1136);
    float _1146 = fma(_1138, _1040, _1140);
    float _1148 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1142);
    float _1150 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1144);
    float _1152 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1146);
    bool _1154 = !_996;
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
    float _1200 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1202 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1204 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1208 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1202);
    float _1210 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1206);
    float _1212 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1214 = _1178 * 2.0;
    float _1216 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1210);
    float _1218 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1220 = -_1186;
    float _1222 = fma(_1212, 2.0, _1220);
    float _1224 = _1184 * 2.0;
    float _1226 = floor(_1214);
    float _1228 = fma(_1218, -2.0, _1194);
    float _1230 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1232 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1234 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1236 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1230);
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1232);
    float _1240 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1234);
    float _1242 = _1178 + _1184;
    float _1244 = in.m_53.z;
    float _1246 = floor(_1224);
    float _1248 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1238);
    float _1250 = _1242 + (-1.0);
    float _1252 = _1238;
    float _1254 = _1236;
    if (!_1198)
    {
        _1252 = _1184;
    }
    float _1256 = _1252;
    float _1258 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1236);
    float _1260 = _1256;
    if (_1198)
    {
        _1260 = _1178;
    }
    float _1262 = _1260;
    float _1264 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1266 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1240);
    bool _1268 = _1226 > 0.0;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1272 = _1226 >= 0.0;
    bool _1274 = isnan(_1226);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan(0.0);
    bool _1280 = _1276 || _1278;
    float _1282 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1208);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1286 = _1226;
    float _1288 = _1262;
    if (!_1198)
    {
        _1254 = _1184;
    }
    float _1290 = _1254;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1294 = _1246 > 0.0;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _1298 = _1246 >= 0.0;
    bool _1300 = isnan(_1246);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1310 = _1246;
    float _1312 = _1290;
    if (!_1198)
    {
        _1310 = _1178;
    }
    float _1314 = _1310;
    float _1316 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1318 = int(_1316);
    float _1320 = _1314;
    if (!_1198)
    {
        _1286 = _1244;
    }
    float _1322 = _1286;
    float _1324 = -_100;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1222);
    float _1328 = _1322;
    if (_1198)
    {
        _1320 = _1244;
    }
    float _1330 = _1320;
    float _1332 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1228);
    if (!_1198)
    {
        _1288 = _1322;
    }
    float _1334 = _1288;
    float _1336 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1338 = _1334;
    if (_1198)
    {
        _1338 = _1184;
    }
    float _1340 = _1338;
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1296);
    if (_1198)
    {
        _1312 = _1178;
    }
    float _1344 = _1312;
    float _1346 = rsqrt(_1216);
    if (_1198)
    {
        _1328 = _1184;
    }
    float _1348 = _1328;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1352 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1292);
    int _1354 = _1280 ? 0 : 1;
    float _1356 = fma(_1350, -2.0, _1284);
    int _1358 = _1306 ? 0 : 1;
    float _1360 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1308);
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1372 = _1370 != 0;
    float _1374 = _1178 + _1244;
    int _1376 = ~_1354;
    int _1378 = _1376 + 1;
    int _1380 = _1378 + 1;
    float _1382 = _1244 * 2.0;
    int _1384 = ~_1358;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    float _1390 = _1374 + (-1.0);
    int _1392 = _1380;
    int _1394 = _1388;
    if (!_1268)
    {
        int _1396 = ~_1354;
        int _1398 = _1396 + 1;
        _1392 = _1398;
    }
    int _1400 = _1392;
    float _1402 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1360);
    if (!_1294)
    {
        int _1404 = ~_1358;
        int _1406 = _1404 + 1;
        _1394 = _1406;
    }
    int _1408 = _1394;
    float _1410 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1412 = log2(_1410);
    float _1414 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1416 = !_1368;
    int _1418 = _1416 ? 0 : 1;
    bool _1420 = !_1364;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1426 = !_1372;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = _1184 + _1244;
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1434 = _1432 != 0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1442 = _1440 != 0;
    float _1444 = floor(_1382);
    float _1446 = _1430 + (-1.0);
    bool _1448 = !_1442;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1454 = float(_1318);
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1458 = abs(_1450);
    float _1460 = float(_1400);
    float _1462 = 1.0 / _1454;
    float _1464 = _1412 * _100;
    float _1466 = float(_1408);
    float _1468 = -_1456;
    float _1470 = fma(_1270, 2.0, _1468);
    float _1472 = float(_1458);
    float _1474 = exp2(_1464);
    float _1476 = _1472 * _1466;
    bool _1478 = !_1438;
    int _1480 = _1478 ? 0 : 1;
    float _1482 = in.m_57.x;
    float _1484 = in.m_57.y;
    float _1486 = in.m_57.z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1492 = 1.0 + _1490;
    int _1494 = abs(_1480);
    float _1496 = _1462 * _100;
    float _1498 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1488);
    float _1500 = 1.0 / _1492;
    bool _1502 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1504 = isnan(1.0);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1498);
    float _1514 = float(_1494);
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1518 = -_1474;
    float _1520 = _1518 + 1.0;
    bool _1522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1530 = _1526 || _1528;
    float _1532 = -_100;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1470);
    bool _1536 = _1444 > 0.0;
    float _1538 = _1514 * _1460;
    float _1540 = float(_1182);
    float _1542 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1516);
    float _1544 = _1530 ? _1520 : 0.0;
    float _1546 = _1538 * (-2.0);
    bool _1548 = _1444 >= 0.0;
    bool _1550 = isnan(_1444);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    float _1558 = _1540 * _100;
    float _1560 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1542);
    float _1562 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1352);
    float _1564 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1342);
    float _1566 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1356);
    int _1568 = _1556 ? 0 : 1;
    if (_1510)
    {
        float _1570 = _1544 * _1500;
        _110 = _1570;
    }
    float _1572 = _110;
    float _1574 = fma(_1452, _1546, _1452);
    float _1576 = fma(_1546, _1484, _1484);
    float _1578 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1580 = ~_1568;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    float _1586 = _1184 + (-0.5);
    int _1588 = _1584;
    if (!_1536)
    {
        int _1590 = ~_1568;
        int _1592 = _1590 + 1;
        _1588 = _1592;
    }
    int _1594 = _1588;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1596;
    float _1600 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1602 = _1578 * _1578;
    float _1604 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1576);
    float _1606 = _1476 * (-2.0);
    float _1608 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1610 = fma(_1600, _1600, _1602);
    bool _1612 = !_1434;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1574, _1572, _1604);
    float _1618 = fma(_1424, _1606, _1424);
    float _1620 = fma(_1606, _1486, _1486);
    int _1622 = abs(_1614);
    float _1624 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1626 = _1616 * 0.15915493667125701904296875;
    float _1628 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1630 = _1244 + (-0.5);
    float _1632 = float(_1622);
    float _1634 = fma(_1608, _1608, _1610);
    float _1636 = float(_1594);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1628);
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1620);
    float _1642 = rsqrt(_1634);
    float _1644 = _1632 * _1636;
    float _1646 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1638);
    float _1648 = _1644 * (-2.0);
    float _1650 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1652 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1654 = fma(_1618, _1572, _1640);
    float _1656 = 1.0 / _1598;
    float _1658 = in.m_59.x;
    float _1660 = in.m_59.y;
    float _1662 = in.m_59.z;
    float _1664 = -_1652;
    float _1666 = _1650 + _1664;
    float _1668 = fma(_1648, _1482, _1482);
    float _1670 = _1178 + (-0.5);
    float _1672 = fma(_1264, _1648, _1264);
    bool _1674 = _1652 >= _1650;
    bool _1676 = isnan(_1652);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(_1650);
    bool _1682 = _1678 || _1680;
    float _1684 = _1654 * 0.15915493667125701904296875;
    float _1686 = abs(_1666);
    float _1688 = precise::max(_1686, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1690 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1668);
    float _1692 = _1626 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _1600 * _1642;
    float _1698 = precise::min(_1688, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1700 = fma(_1672, _1572, _1690);
    float _1702 = _1578 * _1642;
    float _1704 = _1608 * _1642;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1708 = _1698 + _1706;
    float _1710 = _1626 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    bool _1714 = !_1682;
    float _1716 = _1714 ? 1.0 : (-1.0);
    float _1718 = _1708 * _1656;
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1658);
    float _1722 = _1684 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = _1700 * 0.15915493667125701904296875;
    float _1728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1660);
    float _1730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1662);
    float _1732 = _1716 * _1718;
    float _1734 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1736 = _1200 * _1728;
    float _1738 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1740 = _1684 * 6.283185482025146484375;
    float _1742 = cos(_1740);
    float _1744 = _1204 * _1732;
    float _1746 = _1734 * _1720;
    float _1748 = _1738 * _1730;
    float _1750 = _1744 * 0.15915493667125701904296875;
    float _1752 = _1726 * 6.283185482025146484375;
    float _1754 = sin(_1752);
    float _1756 = -_1736;
    float _1758 = _1724 * _1756;
    float _1760 = _1726 * 6.283185482025146484375;
    float _1762 = cos(_1760);
    float _1764 = _1742 * _1736;
    float _1766 = _1712 * _1742;
    float _1768 = fma(_1766, _1746, _1758);
    float _1770 = _1754 * _1694;
    float _1772 = _1750 * 6.283185482025146484375;
    float _1774 = cos(_1772);
    float _1776 = _1762 * _1712;
    float _1778 = _1762 * _1694;
    float _1780 = _1762 * _1764;
    float _1782 = _1754 * _1712;
    float _1784 = fma(_1724, _1776, _1770);
    float _1786 = _1694 * _1742;
    float _1788 = _1754 * _1764;
    float _1790 = -_1782;
    float _1792 = fma(_1724, _1778, _1790);
    float _1794 = fma(_1784, _1746, _1780);
    float _1796 = _1750 * 6.283185482025146484375;
    float _1798 = sin(_1796);
    float _1800 = -_1778;
    float _1802 = fma(_1724, _1782, _1800);
    float _1804 = fma(_1786, _1748, _1768);
    float _1806 = fma(_1792, _1748, _1794);
    float _1808 = fma(_1724, _1770, _1776);
    float _1810 = fma(_1802, _1746, _1788);
    float _1812 = -_1774;
    float _1814 = _1812 + 1.0;
    float _1816 = _1806 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1818 = _1806 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1820 = fma(_1808, _1748, _1810);
    float _1822 = _1806 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1824 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1816);
    float _1826 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1818);
    float _1828 = _1702 * _1814;
    float _1830 = _1704 * _1704;
    float _1832 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1824);
    float _1834 = _1696 * _1798;
    float _1836 = _1702 * _1798;
    float _1838 = _1704 * _1798;
    float _1840 = _1696 * _1814;
    float _1842 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1822);
    float _1844 = fma(_1704, _1828, _1834);
    float _1846 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1826);
    float _1848 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1850 = fma(_1814, _1830, _1774);
    float _1852 = -_1838;
    float _1854 = fma(_1702, _1840, _1852);
    float _1856 = -_1836;
    float _1858 = fma(_1704, _1840, _1856);
    float _1860 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1862 = _1848 * _1844;
    float _1864 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1842);
    float _1866 = fma(_1696, _1840, _1774);
    float _1868 = _1848 * _1854;
    float _1870 = fma(_1860, _1858, _1862);
    float _1872 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1874 = fma(_1702, _1840, _1838);
    float _1876 = fma(_1860, _1866, _1868);
    float _1878 = fma(_1704, _1840, _1836);
    float _1880 = fma(_1872, _1850, _1870);
    float _1882 = fma(_1872, _1878, _1876);
    float _1884 = _1414 + _1880;
    float _1886 = _1624 + _1882;
    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1890 = _1884 + _1888;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1894 = _1886 + _1892;
    float _1896 = _1890 * _1890;
    float _1898 = fma(_1894, _1894, _1896);
    float _1900 = fma(_1702, _1828, _1774);
    float _1902 = -_1834;
    float _1904 = fma(_1704, _1828, _1902);
    float _1906 = sqrt(_1898);
    float _1908 = _1848 * _1900;
    float _1910 = fma(_1860, _1874, _1908);
    float _1912 = fma(_1872, _1904, _1910);
    float _1914 = _1336 + _1912;
    bool _1916 = _1906 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1918 = _1912;
    float _1920 = _1908;
    float _1922 = _1910;
    if (!_1916)
    {
        _1918 = _1886;
    }
    float _1924 = _1918;
    float _1926 = _1924;
    if (!_1916)
    {
        _1920 = _1884;
    }
    float _1928 = _1920;
    float _1930 = _1928;
    if (!_1916)
    {
        _1922 = _1914;
    }
    float _1932 = _1922;
    bool _1934 = !_1916;
    float _1936 = _1932;
    if (!_1934)
    {
        float _1938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1942 = _1906 + _1940;
        float _1944 = rsqrt(_1898);
        float _1946 = _1942 * _1938;
        float _1948 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = _1946 * 0.15915493667125701904296875;
        float _1952 = _1950 * 6.283185482025146484375;
        float _1954 = cos(_1952);
        float _1956 = _1950 * 6.283185482025146484375;
        float _1958 = sin(_1956);
        float _1960 = _1954 + (-1.0);
        float _1962 = fma(_1958, _1948, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1966 = _1944 * _1962;
        float _1968 = fma(_1914, _1954, _1964);
        float _1970 = fma(_1894, _1966, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1972 = fma(_1890, _1966, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1936 = _1968;
        _1926 = _1970;
        _1930 = _1972;
    }
    float _1974 = _1936;
    float _1976 = _1926;
    float _1978 = _1930;
    float _1980 = -_1336;
    float _1982 = _1980 + _1974;
    float _1984 = -_1624;
    float _1986 = _1984 + _1976;
    float _1988 = -_1414;
    float _1990 = _1988 + _1978;
    float _1992 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1994 = _1982 * _1982;
    float _1996 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1992);
    float _1998 = fma(_1986, _1986, _1994);
    float _2000 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1996);
    float _2002 = fma(_1990, _1990, _1998);
    float _2004 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2006 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2008 = sqrt(_2002);
    float _2010 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2004);
    float _2012 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2010);
    bool _2014 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.5);
    bool _2022 = _2018 || _2020;
    float _2024 = 1.0 / _2006;
    float _2026 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2028 = _2026 + _2006;
    bool _2030 = _2008 > 0.0;
    bool _2032 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan(0.5);
    bool _2040 = _2036 || _2038;
    float _2042 = _2028 * _2024;
    float _2044 = _2042 * 0.5;
    bool _2046 = !_2030;
    float _2048 = _1974;
    float _2050 = _1978;
    float _2052 = _1976;
    float _2054 = _1990;
    float _2056 = _2002;
    float _2058 = _2024;
    float _2060 = _2026;
    float _2062 = _2006;
    if (!_2046)
    {
        float _2064 = _172 * _172;
        float _2066 = rsqrt(_2002);
        float _2068 = fma(_170, _170, _2064);
        float _2070 = fma(_174, _174, _2068);
        float _2072 = sqrt(_2070);
        float _2074 = _1982 * _2066;
        float _2076 = _1990 * _2066;
        bool _2078 = _2072 > 0.0;
        float _2080 = _1986 * _2066;
        bool _2082 = !_2078;
        _2056 = _2066;
        _2058 = _2076;
        _2060 = _2070;
        _2062 = _2080;
        if (!_2082)
        {
            float _2084 = rsqrt(_2070);
            float _2086 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2088 = _172 * _2084;
            float _2090 = _170 * _2084;
            float _2092 = _2074 * _2088;
            float _2094 = _174 * _2084;
            float _2096 = fma(_2080, _2090, _2092);
            float _2098 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2100 = fma(_2076, _2094, _2096);
            float _2102 = _2100 * _2098;
            float _2104 = fma(_170, _2102, _1976);
            float _2106 = fma(_172, _2102, _1974);
            float _2108 = fma(_174, _2102, _1978);
            _2048 = _2106;
            _2050 = _2108;
            _2052 = _2104;
            _2054 = _2098;
            _2056 = _2086;
            _2060 = _2084;
        }
    }
    float _2110 = _2048;
    float _2112 = _2050;
    float _2114 = _2052;
    float _2116 = _2054;
    float _2118 = _2056;
    float _2120 = _2058;
    float _2122 = _2060;
    float _2124 = _2062;
    float _2126 = _2124;
    float _2128 = _2114;
    float _2130 = _2112;
    float _2132 = _2116;
    float _2134 = _2120;
    float _2136 = _2122;
    if (_2040)
    {
        _2126 = 1.0;
    }
    float _2138 = _2126;
    float _2140 = _2138;
    if (_2022)
    {
        _178 = _2110;
    }
    float _2142 = _178;
    float _2144 = _2142;
    if (!_2022)
    {
        float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2148 = _1336 + _2146;
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2152 = _1624 + _2150;
        float _2154 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2156 = -_1336;
        float _2158 = _2156 + _2110;
        float _2160 = _2148 * _2148;
        float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2164 = _1414 + _2162;
        float _2166 = -_1414;
        float _2168 = _2166 + _2112;
        float _2170 = fma(_2152, _2152, _2160);
        float _2172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2174 = fma(_2164, _2164, _2170);
        float _2176 = sqrt(_2174);
        float _2178 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2180 = precise::min(_2176, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2182 = _2180 * _2172;
        float _2184 = -_1624;
        float _2186 = _2184 + _2114;
        float _2188 = _2178 * _2182;
        float _2190 = fma(_2186, _2188, _1624);
        float _2192 = fma(_2158, _2188, _1336);
        float _2194 = fma(_2168, _2188, _1414);
        _2144 = _2192;
        _2128 = _2190;
        _2130 = _2194;
        _2132 = _2188;
    }
    float _2196 = _2144;
    float _2198 = _2128;
    float _2200 = _2130;
    float _2202 = _2132;
    float _2204 = _2202;
    if (!_2040)
    {
        float _2206 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2210 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2208);
        float _2212 = _2206 * 0.15915493667125701904296875;
        float _2214 = _2212 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2220 = _2218 * 0.15915493667125701904296875;
        float _2222 = _2212 * 6.283185482025146484375;
        float _2224 = sin(_2222);
        float _2226 = 1.0 / _2216;
        float _2228 = _2220 * 6.283185482025146484375;
        float _2230 = cos(_2228);
        float _2232 = _2224 * _2226;
        float _2234 = 1.0 / _2210;
        float _2236 = _2230 * _2232;
        float _2238 = _2220 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2244 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2242;
        float _2246 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2248 = _2234 * _2246;
        float _2250 = 1.0 / _2236;
        float _2252 = 1.0 / _2244;
        float _2254 = _2240 * _2250;
        float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2258 = fma(_2254, _2248, _2256);
        float _2260 = _2258 * _2252;
        float _2262 = precise::clamp(_2260, 0.0, 1.0);
        _2204 = _2252;
        _180 = _2220;
        _2140 = _2262;
    }
    float _2264 = _2204;
    float _2266 = _180;
    float _2268 = _2140;
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2196 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2276 = _2198 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2280 = _2200 + _2278;
    float _2282 = _2272 * _2272;
    float _2284 = fma(_2276, _2276, _2282);
    float _2286 = fma(_2280, _2280, _2284);
    float _2288 = rsqrt(_2286);
    float _2290 = sqrt(_2286);
    float _2292 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2294 = _2276 * _2292;
    float _2296 = _2280 * _2292;
    float _2298 = _2294 * _2294;
    float _2300 = _2296 * _2296;
    float _2302 = _2298 + _2300;
    float _2304 = sqrt(_2302);
    bool _2306 = _2304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = _2304 + _2308;
    float _2312 = _2264;
    float _2314 = _2310;
    float _2316 = _2272;
    float _2318 = _2296;
    float _2320 = _2298;
    float _2322 = _2300;
    if (_2306)
    {
        float _2324 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2312 = _2324;
    }
    float _2326 = _2312;
    if (_2306)
    {
        float _2328 = _2310 * _2326;
        _2314 = _2328;
    }
    float _2330 = _2314;
    if (_2306)
    {
        float _2332 = _2330 * 0.15915493667125701904296875;
        _2134 = _2332;
    }
    float _2334 = _2134;
    float _2336 = _2118;
    if (_2306)
    {
        float _2338 = _2334 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        _2336 = _2340;
    }
    float _2342 = _2336;
    float _2344 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2346 = precise::max(0.0, _2344);
    float _2348 = _2266;
    float _2350 = _2346;
    if (_2306)
    {
        float _2352 = _2334 * 6.283185482025146484375;
        float _2354 = cos(_2352);
        _2348 = _2354;
    }
    float _2356 = _2348;
    float _2358 = -_2292;
    float _2360 = -_2346;
    float _2362 = fma(_2272, _2358, _2360);
    if (!_2306)
    {
        _2316 = _2294;
    }
    float _2364 = _2316;
    float _2366 = _2344;
    float _2368 = _2364;
    if (_2306)
    {
        float _2370 = rsqrt(_2302);
        _2366 = _2370;
    }
    float _2372 = _2366;
    if (_2306)
    {
        float _2374 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2350 = _2374;
    }
    float _2376 = _2350;
    float _2378 = _2376;
    if (_2306)
    {
        float _2380 = fma(_2342, _2376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2136 = _2380;
    }
    float _2382 = _2136;
    float _2384 = _2382;
    if (_2306)
    {
        float _2386 = _2356 + (-1.0);
        _2378 = _2386;
    }
    float _2388 = _2378;
    float _2390 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2392 = _2388;
    if (_2306)
    {
        float _2394 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2392 = _2394;
    }
    float _2396 = _2392;
    float _2398 = _2372;
    if (_2306)
    {
        float _2400 = _2372 * _2382;
        _2384 = _2400;
    }
    float _2402 = _2384;
    if (!_2306)
    {
        _2398 = _2362;
    }
    float _2404 = _2398;
    float _2406 = _2404;
    if (_2306)
    {
        float _2408 = fma(_2362, _2356, _2396);
        _2406 = _2408;
    }
    float _2410 = _2406;
    if (_2306)
    {
        float _2412 = _2294 * _2402;
        _2368 = _2412;
    }
    float _2414 = _2368;
    if (_2306)
    {
        float _2416 = _2296 * _2402;
        _2318 = _2416;
    }
    float _2418 = _2318;
    if (_2306)
    {
        float _2420 = _2414 * _2414;
        _2320 = _2420;
    }
    float _2422 = _2320;
    if (_2306)
    {
        float _2424 = _2418 * _2418;
        _2322 = _2424;
    }
    float _2426 = _2322;
    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2430 = fma(_2290, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2428);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2436 = fma(_2410, _2410, _2422);
    float _2438 = -_2432;
    float _2440 = _2438 + 1.0;
    float _2442 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2434);
    float _2444 = _2436 + _2426;
    float _2446 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2448 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2442);
    float _2450 = abs(_2440);
    float _2452 = log2(_2450);
    float _2454 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2446);
    float _2456 = _2448 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2458 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2454);
    float _2460 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2462 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2464 = rsqrt(_2444);
    float _2466 = _2458 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2468 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2460);
    float _2470 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2462);
    float _2472 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2474 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2468);
    float _2476 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2478 = -_2472;
    float _2480 = fma(_2478, _2390, 1.0);
    float _2482 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2470);
    float _2484 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2486 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2488 = exp2(_2476);
    float _2490 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2492 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2494 = _2464 * _2414;
    float _2496 = _2464 * _2410;
    float _2498 = _2464 * _2418;
    float _2500 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2486);
    float _2502 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2504 = log2(_2480);
    float _2506 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2492);
    float _2508 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2500);
    float _2510 = -_2502;
    float _2512 = fma(_2496, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2510);
    float _2514 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2506);
    float _2516 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2508);
    float _2518 = -_2498;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2512);
    float _2522 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2524 = 1.0 / _2516;
    float _2526 = fma(_2520, -0.5, 0.5);
    float _2528 = fma(_2520, 0.5, 0.5);
    float _2530 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2522);
    float _2532 = _2496 + 1.0;
    float _2534 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2536 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2530);
    float _2538 = sqrt(_2526);
    float _2540 = -_2496;
    float _2542 = fma(_2488, _2532, _2540);
    float _2544 = fma(_2528, _2534, -0.212114393711090087890625);
    float _2546 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2536);
    float _2548 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2514);
    float _2550 = _2504 * 0.693147182464599609375;
    float _2552 = fma(_2528, _2544, 1.570728778839111328125);
    float _2554 = fma(_2542, 0.5, 0.5);
    float _2556 = _2546 * _2524;
    float _2558 = _2548 * _2524;
    float _2560 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2562 = fma(_2556, 0.5, 0.5);
    float _2564 = fma(_2558, -0.5, 0.5);
    float _2566 = _2538 * 0.636619746685028076171875;
    float _2568 = -_2552;
    float _2570 = fma(_2566, _2568, 1.0);
    float3 _7437 = float3(_2562, _2564, _2560);
    float _2572 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7437, float3(0.0), isnan(_7437)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7437, float3(0.0), isnan(_7437)), level(0.0)).x;
    float3 _7448 = float3(_2562, _2564, _2560);
    float4 _2575 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7448, float3(0.0), isnan(_7448)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7448, float3(0.0), isnan(_7448)), level(0.0)).xyzw;
    float _2577 = _2575.x;
    float _2579 = _2575.y;
    float _2581 = _2575.z;
    float _2583 = _2575.w;
    float2 _7465 = float2(_2570, _2554);
    float3 _2587 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7465, float2(0.0), isnan(_7465)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7465, float2(0.0), isnan(_7465)), level(0.0)).xyz;
    float _2589 = _2587.x;
    float _2591 = _2587.y;
    float _2593 = _2587.z;
    float _2595 = float(uint(_1182));
    float _2597 = trunc(_1496);
    int _2599 = int(_2597);
    int _2601 = ~_1182;
    int _2603 = _2601 + 1;
    float _2605 = _1558 * _152;
    int _2607 = ~_1182;
    int _2609 = _2607 + 1;
    out.m_61.x = _874;
    out.m_61.y = _876;
    out.m_61.z = _878;
    out.m_61.w = _882;
    int _2611 = abs(_1418);
    float _2613 = _1564 * (-0.15915493667125701904296875);
    int _2615 = abs(_1422);
    float _2617 = 1.0 / _2595;
    float _2619 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2621 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2625 = _2623 != 0;
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2629 = _2627 != 0;
    float _2631 = trunc(_2605);
    int _2633 = int(_2631);
    float _2635 = float(uint(_2599));
    float _2637 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2621);
    int _2639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2641 = _2639 != 0;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2645 = _2643 != 0;
    float _2647 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2637);
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2651 = _2649 != 0;
    float _2653 = exp2(_2619);
    int _2655 = as_type<int>(_2617) + (-2);
    float _2657 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2647);
    float _2659 = as_type<float>(_2655) * _2635;
    out.gl_Position.x = _2546;
    out.gl_Position.y = _2548;
    out.gl_Position.z = _2657;
    out.gl_Position.w = _2516;
    float _2661 = trunc(_2659);
    float _2663 = precise::max(_2661, 0.0);
    uint _2666 = uint(_2663);
    float _2668 = -_2653;
    float _2670 = _2668 + 1.0;
    int _2672 = _2603 * int(_2666);
    int _2674 = _2672 + _2599;
    float _2676 = float(uint(_2674));
    float _2678 = as_type<float>(_2655) * _2676;
    float _2680 = trunc(_2678);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    bool _2686 = !_1198;
    float _2688 = _2686 ? 7.345489978790283203125 : 1.0;
    float _2690 = _2688 * _1178;
    float _2692 = floor(_2690);
    int _2694 = int(_2666) + int(_2684);
    float _2696 = float(_2599);
    int _2698 = _2609 * _2694;
    int _2700 = _2698 + _2599;
    bool _2702 = _2696 >= _1540;
    bool _2704 = isnan(_2696);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan(_1540);
    bool _2710 = _2706 || _2708;
    float _2712 = float(_2710);
    bool _2714 = uint(_2700) >= uint(_1182);
    float _2716 = -_2692;
    float _2718 = _2690 + _2716;
    float _2720 = trunc(_2712);
    int _2722 = int(_2720);
    bool _2724 = !_2714;
    int _2726 = _2724 ? 0 : (-1);
    float _2728 = _2718 * _1540;
    bool _2730 = _1182 == 0;
    int _2732 = ~_2694;
    int _2734 = _2732 + _2726;
    int _2736 = _2734 + 1;
    float _2738 = trunc(_2728);
    int _2740 = int(_2738);
    int _2742 = _1182 + (-1);
    int _2744 = _1182 * _2736;
    int _2746 = _2744 + _2599;
    bool _2748 = !_2625;
    int _2750 = _2748 ? 0 : 1;
    int _2752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2754 = _2752 != 0;
    int _2756 = ~_2722;
    int _2758 = _2756 + 1;
    int _2760 = _2758 + 1;
    bool _2762 = !_2730;
    int _2764 = _2762 ? _2746 : (-1);
    int _2766 = abs(_2750);
    int _2768 = abs(_1428);
    int _2770 = _2764 * _2760;
    int _2772 = _2722 * _2742;
    int _2774 = _2772 + _2770;
    bool _2776 = !_2754;
    int _2778 = _2776 ? 0 : 1;
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2782 = _2780 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2784 = _2774 * _2611;
    int _2786 = abs(_2778);
    float _2788 = 1.0 / _2782;
    int _2790 = _2740 * _2766;
    int _2792 = _2790 + _2599;
    int _2794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2796 = _2794 != 0;
    int _2798 = _2633 * _2615;
    int _2800 = _2798 + _2784;
    int _2802 = ~_1182;
    int _2804 = _2802 + 1;
    float _2806 = in.m_53.w;
    int _2808 = _2792 * _2768;
    int _2810 = _2808 + _2800;
    float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2814 = _1176 + _2812;
    float _2816 = in.m_63.x;
    int _2818 = _2740 * _2786;
    int _2820 = _2818 + _2810;
    float _2822 = float(uint(_2820));
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2826 = _2824 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2828 = as_type<float>(_2655) * _2822;
    float _2830 = in.m_63.y;
    float _2832 = 1.0 / _2826;
    bool _2834 = _2806 > 0.5;
    float _2836 = trunc(_2828);
    float _2838 = precise::max(_2836, 0.0);
    uint _2840 = uint(_2838);
    int _2842 = _2746;
    bool _2844 = _2651;
    bool _2846 = _2641;
    int _2848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[80].y);
    if (_2645)
    {
        float _2850 = -_2816;
        float _2852 = _2850 + 1.0;
        _2842 = as_type<int>(_2852);
    }
    int _2854 = _2842;
    float _2856 = -_2830;
    float _2858 = _2856 + 1.0;
    int _2860 = _2804 * int(_2840);
    int _2862 = _2860 + _2820;
    int _2864 = _2834 ? as_type<int>(_2858) : as_type<int>(_2830);
    float _2866 = float(uint(_2862));
    float _2868 = _2651 ? as_type<float>(_2864) : _2830;
    float _2870 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2872 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2870;
    bool _2874 = _1184 > 0.5;
    float _2876 = as_type<float>(_2655) * _2866;
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2880 = _2878 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2882 = _2830;
    if (_2629)
    {
        bool _2884 = _1178 > 0.5;
        _2844 = _2884;
    }
    bool _2886 = _2844;
    float _2888 = _2872 * _2832;
    int _2890 = ~_1182;
    int _2892 = _2890 + 1;
    float _2894 = trunc(_2876);
    float _2896 = precise::max(_2894, 0.0);
    uint _2898 = uint(_2896);
    float _2900 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2902 = _2900 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    if (_2641)
    {
        float _2904 = _2874 ? _2858 : _2830;
        _2882 = _2904;
    }
    float _2906 = _2882;
    float _2908 = fma(_2888, _2814, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_2645)
    {
        bool _2910 = _1244 > 0.5;
        _2846 = _2910;
    }
    bool _2912 = _2846;
    float _2914 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2906, -0.5);
    float _2916 = 1.0 / _2902;
    float _2918 = float(uint(_2792));
    if (_2629)
    {
        float _2920 = -_2816;
        float _2922 = _2920 + 1.0;
        _2848 = as_type<int>(_2922);
    }
    int _2924 = _2848;
    float _2926 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2926;
    bool _2930 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2932 = isnan(_1176);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2938 = _2934 || _2936;
    float _2940 = float(_2938);
    float _2942 = -_1332;
    float _2944 = fma(_1560, _2914, _2942);
    float _2946 = _2928 * _2788;
    int _2948 = int(_2840) + int(_2898);
    float _2950 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2952 = _1176 + _2950;
    float _2954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2956 = ~_1182;
    int _2958 = _2956 + 1;
    int _2960 = _2892 * _2948;
    int _2962 = _2960 + _2820;
    float _2964 = _2880 * _2916;
    bool _2966 = uint(_2962) >= uint(_1182);
    float _2968 = fma(_2964, _2952, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2970 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2972 = _1176 + _2970;
    bool _2974 = !_2966;
    float _2976 = _2974 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2978 = fma(_2946, _2972, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2980 = ~_2948;
    int _2982 = _2980 + as_type<int>(_2976);
    int _2984 = _2982 + 1;
    float _2986 = as_type<float>(_2655) * _2918;
    bool _2988 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2990 = isnan(_1176);
    bool _2992 = _2988 || _2990;
    bool _2994 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2996 = _2992 || _2994;
    float _2998 = float(_2996);
    float _3000 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3002 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3004 = isnan(_1176);
    bool _3006 = _3002 || _3004;
    bool _3008 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3010 = _3006 || _3008;
    float _3012 = float(_3010);
    int _3014 = _1182 * _2984;
    int _3016 = _3014 + _2820;
    bool _3018 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3020 = isnan(_1176);
    bool _3022 = _3018 || _3020;
    bool _3024 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3026 = _3022 || _3024;
    float _3028 = float(_3026);
    float _3030 = -_2998;
    float _3032 = _3030 + 1.0;
    float _3034 = trunc(_2986);
    float _3036 = precise::max(_3034, 0.0);
    uint _3038 = uint(_3036);
    float _3040 = _2976;
    if (!_2629)
    {
        _3040 = _2816;
    }
    float _3042 = _3040;
    float _3044 = _3012 * _3032;
    float _3046 = -_3012;
    float _3048 = _3046 + 1.0;
    bool _3050 = !_2730;
    int _3052 = _3050 ? _3016 : (-1);
    float _3054 = _3042;
    if (_2629)
    {
        float _3056 = _2886 ? as_type<float>(_2924) : _2816;
        _3054 = _3056;
    }
    float _3058 = _3054;
    float _3060 = _3028 * _3048;
    float _3062 = -_3028;
    float _3064 = _3062 + 1.0;
    float _3066 = fma(_2868, _3000, -0.5);
    int _3068 = _3052 >> 31;
    float _3070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3072 = _2940 * _3064;
    float _3074 = -_2940;
    float _3076 = _3074 + 1.0;
    int _3078 = _3068 & 3;
    int _3080 = _2958 * int(_3038);
    int _3082 = _3080 + _2792;
    float _3084 = _2908 * _3072;
    int _3086 = _3052 & 3;
    bool _3088 = _3086 != 0;
    int _3090 = _3052 + _3078;
    float _3092 = _2613 * 6.283185482025146484375;
    float _3094 = sin(_3092);
    float _3096 = float(uint(_3082));
    int _3098 = _3090 >> 2;
    float _3100 = as_type<float>(_3078);
    if (!_2645)
    {
        _3100 = _2816;
    }
    float _3102 = _3100;
    float _3104 = as_type<float>(_2655) * _3096;
    int _3106 = _3098 << 4;
    int _3108 = _3106 + 368;
    float _3110 = fma(_3076, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3084);
    float _3112 = _3070 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3114 = fma(_3058, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    uint _3116 = uint(int(uint(_3108) >> uint(2)));
    uint _3118 = uint(int(uint(int(_3116)) >> uint(2)));
    int _3120 = int(_3116) & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    int _3124 = int(_3116) + 1;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    int _3128 = _3124 & 3;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[int(_3126)][_3128];
    float _3132 = fma(_2968, _3060, _3110);
    float _3134 = _3102;
    if (_2645)
    {
        float _3136 = _2912 ? as_type<float>(_2854) : _2816;
        _3134 = _3136;
    }
    float _3138 = _3134;
    float _3140 = trunc(_3104);
    float _3142 = precise::max(_3140, 0.0);
    uint _3144 = uint(_3142);
    int _3146 = _3052 & 3;
    bool _3148 = _3146 != 0;
    float _3150 = fma(_2978, _3044, _3132);
    float _3152 = _3094 * _3066;
    float _3154 = fma(_3112, _3138, -0.5);
    int _3156 = _3108 + 8;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    uint _3160 = uint(int(uint(int(_3158)) >> uint(2)));
    int _3162 = int(_3158) & 3;
    float _3164 = (*spvDescriptorSet0.vp_c9)._m0[int(_3160)][_3162];
    int _3166 = int(_3158) + 1;
    uint _3168 = uint(int(uint(_3166) >> uint(2)));
    int _3170 = _3166 & 3;
    float _3172 = (*spvDescriptorSet0.vp_c9)._m0[int(_3168)][_3170];
    bool _3174 = uint(_3146) > 1u;
    float _3176 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3150);
    float _3178 = _2613 * 6.283185482025146484375;
    float _3180 = cos(_3178);
    int _3182 = _3088 ? 0 : 1;
    float _3184 = fma(_1512, _3114, _1326);
    bool _3186 = _3146 != 3;
    bool _3188 = uint(_3146) >= 2u;
    int _3190 = int(_3038) + int(_3144);
    int _3192 = ~_1182;
    int _3194 = _3192 + 1;
    int _3196 = _3194 * _3190;
    int _3198 = _3196 + _2792;
    float _3200 = -_3152;
    float _3202 = fma(_3180, _3154, _3200);
    int _3204 = ~_3182;
    int _3206 = _3204 + 1;
    int _3208 = _3206 + 1;
    float _3210 = _3180 * _3066;
    int _3212 = _3208;
    if (!_3174)
    {
        int _3214 = ~_3182;
        int _3216 = _3214 + 1;
        _3212 = _3216;
    }
    int _3218 = _3212;
    float _3220 = fma(_1562, _3202, _1534);
    bool _3222 = !_3148;
    int _3224 = _3222 ? 0 : 1;
    float _3226 = fma(_3094, _3154, _3210);
    int _3228 = abs(_3218);
    float _3230 = _3220 + 0.5;
    int _3232 = _3188 ? 0 : 1;
    bool _3234 = _3146 != 3;
    bool _3236 = uint(_3198) >= uint(_1182);
    int _3238 = ~_3232;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    bool _3244 = !_3234;
    int _3246 = _3244 ? 0 : (-1);
    int _3248 = abs(_3224);
    int _3250 = _3242;
    if (_3186)
    {
        int _3252 = ~_3232;
        int _3254 = _3252 + 1;
        _3250 = _3254;
    }
    int _3256 = _3250;
    int _3258 = ~_3228;
    int _3260 = _3258 + 1;
    int _3262 = _3260 + 1;
    bool _3264 = !_2796;
    int _3266 = _3264 ? 0 : 1;
    int _3268 = abs(_3246);
    int _3270 = _3262 * as_type<int>(_3130);
    int _3272 = abs(_3256);
    int _3274 = ~_3248;
    int _3276 = _3274 + 1;
    int _3278 = _3276 + 1;
    int _3280 = abs(_3266);
    int _3282 = _3278 * as_type<int>(_3122);
    int _3284 = _3282 + _3270;
    int _3286 = ~_3272;
    int _3288 = _3286 + 1;
    int _3290 = _3288 + 1;
    float _3292 = -_1566;
    float _3294 = fma(_1402, _3226, _3292);
    bool _3296 = !_3236;
    int _3298 = _3296 ? 0 : (-1);
    int _3300 = _3290 * as_type<int>(_3164);
    int _3302 = _3300 + _3284;
    int _3304 = ~_3268;
    int _3306 = _3304 + 1;
    int _3308 = _3306 + 1;
    float _3310 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3312 = ~_3190;
    int _3314 = _3312 + _3298;
    int _3316 = _3314 + 1;
    float _3318 = _2944 + 0.5;
    int _3320 = ~_3280;
    int _3322 = _3320 + 1;
    int _3324 = _3322 + 1;
    int _3326 = _3308 * as_type<int>(_3172);
    int _3328 = _3326 + _3302;
    float _3330 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3332 = _1182 * _3316;
    int _3334 = _3332 + _2792;
    float _3336 = _3310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3338 = _3328 * _3324;
    float _3340 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3342 = _3330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3344 = _3176 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3346 = !_2730;
    int _3348 = _3346 ? _3334 : (-1);
    float _3350 = _3340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3352 = _2657 + _2516;
    int _3354 = _3348 * _3280;
    int _3356 = _3354 + _3338;
    out.m_65.x = _3350;
    out.m_65.y = _3342;
    out.m_65.z = _3336;
    out.m_65.w = _3344;
    bool _3358 = _2268 > 0.0;
    bool _3360 = isnan(_2268);
    bool _3362 = _3358 || _3360;
    bool _3364 = isnan(0.0);
    bool _3366 = _3362 || _3364;
    float _3368 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3370 = _3184 + 0.5;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    float _3372 = float(_3356);
    float _3374 = _3294 + 0.5;
    float _3376 = _3352 * 0.5;
    out.m_69.x = _3372;
    float _3378 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3380 = _3368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3370;
    out.m_71.y = _3318;
    out.m_71.z = _3230;
    out.m_71.w = _3374;
    float _3382 = _3378 * _2572;
    float _3384 = -_3378;
    float _3386 = _3384 + 1.0;
    out.m_73.z = _3376;
    out.m_73.w = _2516;
    float _3388 = _2583 * _3382;
    float _3390 = _2593 * _3382;
    float _3392 = _2583 * _3386;
    out.m_49.x = _3380;
    float _3394 = fma(_2589, _3388, _2577);
    float _3396 = fma(_2591, _3388, _2579);
    float _3398 = fma(_2583, _3390, _2581);
    out.m_75.x = _3394;
    out.m_75.y = _3396;
    out.m_75.z = _3398;
    out.m_75.w = _3392;
    if (_3366)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3400 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3400;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _108 = _91;
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
        float _3468 = as_type<float>(_118);
        out.gl_Position.z = _3468;
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
        float _3523 = as_type<float>(_144);
        out.gl_Position.z = _3523;
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
    float _178 = _172;
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
    float _332 = _238 * _304;
    float _334 = _244 * _264;
    float _336 = -_238;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = -_282;
    float _346 = _344 + 1.0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    float _352 = _326 * _338;
    float _354 = fma(_342, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = _258 * _346;
    float _358 = fma(_350, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = _312 * _352;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _354 * _352;
    float _376 = fma(_330, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_362, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_366, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = _358 * _352;
    float _384 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _368);
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _388;
    float _392 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _382);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _398;
    float _402 = fma(_376, _332, _384);
    float _404 = fma(_378, _332, _386);
    float _406 = fma(_390, _334, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _408 = fma(_380, _332, _392);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _418 = fma(_396, _334, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _420 = fma(_400, _334, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _426 = fma(_406, _356, _402);
    float _428 = fma(_412, _288, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _430 = fma(_416, _288, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _432 = fma(_424, _288, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _434 = fma(_418, _356, _404);
    float _436 = fma(_420, _356, _408);
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
    bool _502 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _504 = isnan(_472);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _494;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _472 + _516;
    bool _520 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _522 = isnan(_472);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _532;
    float _536 = 1.0 / _490;
    float _538 = _518 * _496;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _542 = _472 + _540;
    float _544 = _446 * _476;
    bool _546 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _548 = isnan(_472);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _560 = _472 + _558;
    float _562 = _448 * _478;
    float _564 = 1.0 / _486;
    float _566 = _542 * _514;
    bool _568 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _570 = isnan(_472);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _582 = _472 + _580;
    float _584 = fma(_534, _538, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _586 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _588 = 1.0 / _500;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _592 = _472 + _590;
    float _594 = _560 * _536;
    float _596 = -_578;
    float _598 = _596 + 1.0;
    float _600 = _592 * _564;
    float _602 = -_556;
    float _604 = _602 + 1.0;
    bool _606 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _608 = isnan(_472);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _578 * _604;
    float _620 = _512 * _598;
    bool _622 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _624 = isnan(_472);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = -_616;
    float _636 = _634 + 1.0;
    float _638 = -_512;
    float _640 = _638 + 1.0;
    float _642 = _582 * _588;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _644;
    float _648 = _632 * _636;
    float _650 = -_632;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _654;
    float _658 = _616 * _640;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _664 = fma(_646, _538, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _674 = _530 * _652;
    float _676 = fma(_656, _538, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _678 = fma(_662, _600, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _680 = fma(_668, _600, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _682 = fma(_672, _600, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _684 = _664 * _674;
    float _686 = -_530;
    float _688 = _686 + 1.0;
    float _690 = _676 * _674;
    float _692 = _584 * _674;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _702;
    float _706 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[107].x, _684);
    float _708 = fma(_696, _594, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _710 = fma(_700, _594, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _712 = fma(_704, _594, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _718 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[107].y, _690);
    float _720 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[107].z, _692);
    float _722 = fma(_678, _648, _706);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _728 = fma(_716, _566, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _730 = fma(_680, _648, _718);
    float _732 = fma(_682, _648, _720);
    float _734 = fma(_708, _658, _722);
    float _736 = fma(_726, _566, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _742 = fma(_710, _658, _730);
    float _744 = fma(_712, _658, _732);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _750;
    float _754 = fma(_740, _566, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _756;
    float _760 = fma(_728, _620, _734);
    float _762 = fma(_748, _642, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _764 = fma(_752, _642, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _766 = fma(_758, _642, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _768 = fma(_736, _620, _742);
    float _770 = fma(_754, _620, _744);
    float _772 = fma(_762, _618, _760);
    float _774 = fma(_764, _618, _768);
    float _776 = fma(_766, _618, _770);
    float _778 = _444 * _474;
    float _780 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[112].x, _772);
    float _782 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[112].y, _774);
    float _784 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[112].z, _776);
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
    bool _956 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _958 = isnan(_906);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _970 = isnan(_906);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = 1.0 / _930;
    float _982 = _910 * _936;
    bool _984 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _986 = isnan(_906);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    bool _996 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _998 = 1.0 / _934;
    float _1000 = _914 * _950;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1006;
    float _1010 = fma(_1004, _982, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1012 = fma(_1008, _982, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1014 = _918 * _980;
    float _1016 = -_948;
    float _1018 = _1016 + 1.0;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1020;
    float _1024 = fma(_1022, _982, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1026 = _954 * _998;
    bool _1028 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1030 = isnan(_906);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = _994 * _1018;
    float _1042 = -_994;
    float _1044 = _1042 + 1.0;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1050 = -_1038;
    float _1052 = _1050 + 1.0;
    float _1054 = _1038 * _1044;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1064 = _966 * _1052;
    float _1066 = -_966;
    float _1068 = _1066 + 1.0;
    float _1070 = fma(_1058, _1000, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1072 = fma(_1062, _1000, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1074 = fma(_1048, _1000, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1076 = _978 * _1068;
    float _1078 = -_978;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1082;
    float _1086 = _1010 * _1076;
    float _1088 = _1012 * _1076;
    float _1090 = _1024 * _1076;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1096;
    float _1100 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1086);
    float _1102 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1088);
    float _1104 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1090);
    float _1106 = fma(_1094, _1014, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1108 = fma(_1098, _1014, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1110 = fma(_1084, _1014, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1112 = fma(_1070, _1064, _1100);
    float _1114 = fma(_1072, _1064, _1102);
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1124 = fma(_1074, _1064, _1104);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1130 = fma(_1106, _1054, _1112);
    float _1132 = fma(_1118, _1026, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1134 = fma(_1122, _1026, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1136 = fma(_1108, _1054, _1114);
    float _1138 = fma(_1128, _1026, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1140 = fma(_1110, _1054, _1124);
    float _1142 = fma(_1132, _1040, _1130);
    float _1144 = fma(_1134, _1040, _1136);
    float _1146 = fma(_1138, _1040, _1140);
    float _1148 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1142);
    float _1150 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1144);
    float _1152 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1146);
    bool _1154 = !_996;
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
    float _1200 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1202 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1204 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1208 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1202);
    float _1210 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1206);
    float _1212 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1214 = _1178 * 2.0;
    float _1216 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1210);
    float _1218 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1220 = -_1186;
    float _1222 = fma(_1212, 2.0, _1220);
    float _1224 = _1184 * 2.0;
    float _1226 = floor(_1214);
    float _1228 = fma(_1218, -2.0, _1194);
    float _1230 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1232 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1234 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1236 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1230);
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1232);
    float _1240 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1234);
    float _1242 = _1178 + _1184;
    float _1244 = in.m_53.z;
    float _1246 = floor(_1224);
    float _1248 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1238);
    float _1250 = _1242 + (-1.0);
    float _1252 = _1238;
    float _1254 = _1236;
    if (!_1198)
    {
        _1252 = _1184;
    }
    float _1256 = _1252;
    float _1258 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1236);
    float _1260 = _1256;
    if (_1198)
    {
        _1260 = _1178;
    }
    float _1262 = _1260;
    float _1264 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1266 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1240);
    bool _1268 = _1226 > 0.0;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1272 = _1226 >= 0.0;
    bool _1274 = isnan(_1226);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan(0.0);
    bool _1280 = _1276 || _1278;
    float _1282 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1208);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1286 = _1226;
    float _1288 = _1262;
    if (!_1198)
    {
        _1254 = _1184;
    }
    float _1290 = _1254;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1294 = _1246 > 0.0;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _1298 = _1246 >= 0.0;
    bool _1300 = isnan(_1246);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1310 = _1246;
    float _1312 = _1290;
    if (!_1198)
    {
        _1310 = _1178;
    }
    float _1314 = _1310;
    float _1316 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1318 = int(_1316);
    float _1320 = _1314;
    if (!_1198)
    {
        _1286 = _1244;
    }
    float _1322 = _1286;
    float _1324 = -_100;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1222);
    float _1328 = _1322;
    if (_1198)
    {
        _1320 = _1244;
    }
    float _1330 = _1320;
    float _1332 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1228);
    if (!_1198)
    {
        _1288 = _1322;
    }
    float _1334 = _1288;
    float _1336 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1338 = _1334;
    if (_1198)
    {
        _1338 = _1184;
    }
    float _1340 = _1338;
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1296);
    if (_1198)
    {
        _1312 = _1178;
    }
    float _1344 = _1312;
    float _1346 = rsqrt(_1216);
    if (_1198)
    {
        _1328 = _1184;
    }
    float _1348 = _1328;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1352 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1292);
    int _1354 = _1280 ? 0 : 1;
    float _1356 = fma(_1350, -2.0, _1284);
    int _1358 = _1306 ? 0 : 1;
    float _1360 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1308);
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1372 = _1370 != 0;
    float _1374 = _1178 + _1244;
    int _1376 = ~_1354;
    int _1378 = _1376 + 1;
    int _1380 = _1378 + 1;
    float _1382 = _1244 * 2.0;
    int _1384 = ~_1358;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    float _1390 = _1374 + (-1.0);
    int _1392 = _1380;
    int _1394 = _1388;
    if (!_1268)
    {
        int _1396 = ~_1354;
        int _1398 = _1396 + 1;
        _1392 = _1398;
    }
    int _1400 = _1392;
    float _1402 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1360);
    if (!_1294)
    {
        int _1404 = ~_1358;
        int _1406 = _1404 + 1;
        _1394 = _1406;
    }
    int _1408 = _1394;
    float _1410 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1412 = log2(_1410);
    float _1414 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1416 = !_1368;
    int _1418 = _1416 ? 0 : 1;
    bool _1420 = !_1364;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1426 = !_1372;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = _1184 + _1244;
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1434 = _1432 != 0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1442 = _1440 != 0;
    float _1444 = floor(_1382);
    float _1446 = _1430 + (-1.0);
    bool _1448 = !_1442;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1454 = float(_1318);
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1458 = abs(_1450);
    float _1460 = float(_1400);
    float _1462 = 1.0 / _1454;
    float _1464 = _1412 * _100;
    float _1466 = float(_1408);
    float _1468 = -_1456;
    float _1470 = fma(_1270, 2.0, _1468);
    float _1472 = float(_1458);
    float _1474 = exp2(_1464);
    float _1476 = _1472 * _1466;
    bool _1478 = !_1438;
    int _1480 = _1478 ? 0 : 1;
    float _1482 = in.m_57.x;
    float _1484 = in.m_57.y;
    float _1486 = in.m_57.z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1492 = 1.0 + _1490;
    int _1494 = abs(_1480);
    float _1496 = _1462 * _100;
    float _1498 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1488);
    float _1500 = 1.0 / _1492;
    bool _1502 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1504 = isnan(1.0);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1498);
    float _1514 = float(_1494);
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1518 = -_1474;
    float _1520 = _1518 + 1.0;
    bool _1522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1530 = _1526 || _1528;
    float _1532 = -_100;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1470);
    bool _1536 = _1444 > 0.0;
    float _1538 = _1514 * _1460;
    float _1540 = float(_1182);
    float _1542 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1516);
    float _1544 = _1530 ? _1520 : 0.0;
    float _1546 = _1538 * (-2.0);
    bool _1548 = _1444 >= 0.0;
    bool _1550 = isnan(_1444);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    float _1558 = _1540 * _100;
    float _1560 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1542);
    float _1562 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1352);
    float _1564 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1342);
    float _1566 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1356);
    int _1568 = _1556 ? 0 : 1;
    if (_1510)
    {
        float _1570 = _1544 * _1500;
        _110 = _1570;
    }
    float _1572 = _110;
    float _1574 = fma(_1452, _1546, _1452);
    float _1576 = fma(_1546, _1484, _1484);
    float _1578 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1580 = ~_1568;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    float _1586 = _1184 + (-0.5);
    int _1588 = _1584;
    if (!_1536)
    {
        int _1590 = ~_1568;
        int _1592 = _1590 + 1;
        _1588 = _1592;
    }
    int _1594 = _1588;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1596;
    float _1600 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1602 = _1578 * _1578;
    float _1604 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1576);
    float _1606 = _1476 * (-2.0);
    float _1608 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1610 = fma(_1600, _1600, _1602);
    bool _1612 = !_1434;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1574, _1572, _1604);
    float _1618 = fma(_1424, _1606, _1424);
    float _1620 = fma(_1606, _1486, _1486);
    int _1622 = abs(_1614);
    float _1624 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1626 = _1616 * 0.15915493667125701904296875;
    float _1628 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1630 = _1244 + (-0.5);
    float _1632 = float(_1622);
    float _1634 = fma(_1608, _1608, _1610);
    float _1636 = float(_1594);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1628);
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1620);
    float _1642 = rsqrt(_1634);
    float _1644 = _1632 * _1636;
    float _1646 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1638);
    float _1648 = _1644 * (-2.0);
    float _1650 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1652 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1654 = fma(_1618, _1572, _1640);
    float _1656 = 1.0 / _1598;
    float _1658 = in.m_59.x;
    float _1660 = in.m_59.y;
    float _1662 = in.m_59.z;
    float _1664 = -_1652;
    float _1666 = _1650 + _1664;
    float _1668 = fma(_1648, _1482, _1482);
    float _1670 = _1178 + (-0.5);
    float _1672 = fma(_1264, _1648, _1264);
    bool _1674 = _1652 >= _1650;
    bool _1676 = isnan(_1652);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(_1650);
    bool _1682 = _1678 || _1680;
    float _1684 = _1654 * 0.15915493667125701904296875;
    float _1686 = abs(_1666);
    float _1688 = precise::max(_1686, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1690 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1668);
    float _1692 = _1626 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _1600 * _1642;
    float _1698 = precise::min(_1688, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1700 = fma(_1672, _1572, _1690);
    float _1702 = _1578 * _1642;
    float _1704 = _1608 * _1642;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1708 = _1698 + _1706;
    float _1710 = _1626 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    bool _1714 = !_1682;
    float _1716 = _1714 ? 1.0 : (-1.0);
    float _1718 = _1708 * _1656;
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1658);
    float _1722 = _1684 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = _1700 * 0.15915493667125701904296875;
    float _1728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1660);
    float _1730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1662);
    float _1732 = _1716 * _1718;
    float _1734 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1736 = _1200 * _1728;
    float _1738 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1740 = _1684 * 6.283185482025146484375;
    float _1742 = cos(_1740);
    float _1744 = _1204 * _1732;
    float _1746 = _1734 * _1720;
    float _1748 = _1738 * _1730;
    float _1750 = _1744 * 0.15915493667125701904296875;
    float _1752 = _1726 * 6.283185482025146484375;
    float _1754 = sin(_1752);
    float _1756 = -_1736;
    float _1758 = _1724 * _1756;
    float _1760 = _1726 * 6.283185482025146484375;
    float _1762 = cos(_1760);
    float _1764 = _1742 * _1736;
    float _1766 = _1712 * _1742;
    float _1768 = fma(_1766, _1746, _1758);
    float _1770 = _1754 * _1694;
    float _1772 = _1750 * 6.283185482025146484375;
    float _1774 = cos(_1772);
    float _1776 = _1762 * _1712;
    float _1778 = _1762 * _1694;
    float _1780 = _1762 * _1764;
    float _1782 = _1754 * _1712;
    float _1784 = fma(_1724, _1776, _1770);
    float _1786 = _1694 * _1742;
    float _1788 = _1754 * _1764;
    float _1790 = -_1782;
    float _1792 = fma(_1724, _1778, _1790);
    float _1794 = fma(_1784, _1746, _1780);
    float _1796 = _1750 * 6.283185482025146484375;
    float _1798 = sin(_1796);
    float _1800 = -_1778;
    float _1802 = fma(_1724, _1782, _1800);
    float _1804 = fma(_1786, _1748, _1768);
    float _1806 = fma(_1792, _1748, _1794);
    float _1808 = fma(_1724, _1770, _1776);
    float _1810 = fma(_1802, _1746, _1788);
    float _1812 = -_1774;
    float _1814 = _1812 + 1.0;
    float _1816 = _1806 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1818 = _1806 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1820 = fma(_1808, _1748, _1810);
    float _1822 = _1806 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1824 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1816);
    float _1826 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1818);
    float _1828 = _1702 * _1814;
    float _1830 = _1704 * _1704;
    float _1832 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1824);
    float _1834 = _1696 * _1798;
    float _1836 = _1702 * _1798;
    float _1838 = _1704 * _1798;
    float _1840 = _1696 * _1814;
    float _1842 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1822);
    float _1844 = fma(_1704, _1828, _1834);
    float _1846 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1826);
    float _1848 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1850 = fma(_1814, _1830, _1774);
    float _1852 = -_1838;
    float _1854 = fma(_1702, _1840, _1852);
    float _1856 = -_1836;
    float _1858 = fma(_1704, _1840, _1856);
    float _1860 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1862 = _1848 * _1844;
    float _1864 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1842);
    float _1866 = fma(_1696, _1840, _1774);
    float _1868 = _1848 * _1854;
    float _1870 = fma(_1860, _1858, _1862);
    float _1872 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1874 = fma(_1702, _1840, _1838);
    float _1876 = fma(_1860, _1866, _1868);
    float _1878 = fma(_1704, _1840, _1836);
    float _1880 = fma(_1872, _1850, _1870);
    float _1882 = fma(_1872, _1878, _1876);
    float _1884 = _1414 + _1880;
    float _1886 = _1624 + _1882;
    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1890 = _1884 + _1888;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1894 = _1886 + _1892;
    float _1896 = _1890 * _1890;
    float _1898 = fma(_1894, _1894, _1896);
    float _1900 = fma(_1702, _1828, _1774);
    float _1902 = -_1834;
    float _1904 = fma(_1704, _1828, _1902);
    float _1906 = sqrt(_1898);
    float _1908 = _1848 * _1900;
    float _1910 = fma(_1860, _1874, _1908);
    float _1912 = fma(_1872, _1904, _1910);
    float _1914 = _1336 + _1912;
    bool _1916 = _1906 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1918 = _1912;
    float _1920 = _1908;
    float _1922 = _1910;
    if (!_1916)
    {
        _1918 = _1886;
    }
    float _1924 = _1918;
    float _1926 = _1924;
    if (!_1916)
    {
        _1920 = _1884;
    }
    float _1928 = _1920;
    float _1930 = _1928;
    if (!_1916)
    {
        _1922 = _1914;
    }
    float _1932 = _1922;
    bool _1934 = !_1916;
    float _1936 = _1932;
    if (!_1934)
    {
        float _1938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1942 = _1906 + _1940;
        float _1944 = rsqrt(_1898);
        float _1946 = _1942 * _1938;
        float _1948 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = _1946 * 0.15915493667125701904296875;
        float _1952 = _1950 * 6.283185482025146484375;
        float _1954 = cos(_1952);
        float _1956 = _1950 * 6.283185482025146484375;
        float _1958 = sin(_1956);
        float _1960 = _1954 + (-1.0);
        float _1962 = fma(_1958, _1948, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1966 = _1944 * _1962;
        float _1968 = fma(_1914, _1954, _1964);
        float _1970 = fma(_1894, _1966, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1972 = fma(_1890, _1966, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1936 = _1968;
        _1926 = _1970;
        _1930 = _1972;
    }
    float _1974 = _1936;
    float _1976 = _1926;
    float _1978 = _1930;
    float _1980 = -_1336;
    float _1982 = _1980 + _1974;
    float _1984 = -_1624;
    float _1986 = _1984 + _1976;
    float _1988 = -_1414;
    float _1990 = _1988 + _1978;
    float _1992 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1994 = _1982 * _1982;
    float _1996 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1992);
    float _1998 = fma(_1986, _1986, _1994);
    float _2000 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1996);
    float _2002 = fma(_1990, _1990, _1998);
    float _2004 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2006 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2008 = sqrt(_2002);
    float _2010 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2004);
    float _2012 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2010);
    bool _2014 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.5);
    bool _2022 = _2018 || _2020;
    float _2024 = 1.0 / _2006;
    float _2026 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2028 = _2026 + _2006;
    bool _2030 = _2008 > 0.0;
    bool _2032 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan(0.5);
    bool _2040 = _2036 || _2038;
    float _2042 = _2028 * _2024;
    float _2044 = _2042 * 0.5;
    bool _2046 = !_2030;
    float _2048 = _1974;
    float _2050 = _1978;
    float _2052 = _1976;
    float _2054 = _1990;
    float _2056 = _2002;
    float _2058 = _2024;
    float _2060 = _2026;
    float _2062 = _2006;
    if (!_2046)
    {
        float _2064 = _172 * _172;
        float _2066 = rsqrt(_2002);
        float _2068 = fma(_170, _170, _2064);
        float _2070 = fma(_174, _174, _2068);
        float _2072 = sqrt(_2070);
        float _2074 = _1982 * _2066;
        float _2076 = _1990 * _2066;
        bool _2078 = _2072 > 0.0;
        float _2080 = _1986 * _2066;
        bool _2082 = !_2078;
        _2056 = _2066;
        _2058 = _2076;
        _2060 = _2070;
        _2062 = _2080;
        if (!_2082)
        {
            float _2084 = rsqrt(_2070);
            float _2086 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2088 = _172 * _2084;
            float _2090 = _170 * _2084;
            float _2092 = _2074 * _2088;
            float _2094 = _174 * _2084;
            float _2096 = fma(_2080, _2090, _2092);
            float _2098 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2100 = fma(_2076, _2094, _2096);
            float _2102 = _2100 * _2098;
            float _2104 = fma(_170, _2102, _1976);
            float _2106 = fma(_172, _2102, _1974);
            float _2108 = fma(_174, _2102, _1978);
            _2048 = _2106;
            _2050 = _2108;
            _2052 = _2104;
            _2054 = _2098;
            _2056 = _2086;
            _2060 = _2084;
        }
    }
    float _2110 = _2048;
    float _2112 = _2050;
    float _2114 = _2052;
    float _2116 = _2054;
    float _2118 = _2056;
    float _2120 = _2058;
    float _2122 = _2060;
    float _2124 = _2062;
    float _2126 = _2124;
    float _2128 = _2114;
    float _2130 = _2112;
    float _2132 = _2116;
    float _2134 = _2120;
    float _2136 = _2122;
    if (_2040)
    {
        _2126 = 1.0;
    }
    float _2138 = _2126;
    float _2140 = _2138;
    if (_2022)
    {
        _178 = _2110;
    }
    float _2142 = _178;
    float _2144 = _2142;
    if (!_2022)
    {
        float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2148 = _1336 + _2146;
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2152 = _1624 + _2150;
        float _2154 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2156 = -_1336;
        float _2158 = _2156 + _2110;
        float _2160 = _2148 * _2148;
        float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2164 = _1414 + _2162;
        float _2166 = -_1414;
        float _2168 = _2166 + _2112;
        float _2170 = fma(_2152, _2152, _2160);
        float _2172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2174 = fma(_2164, _2164, _2170);
        float _2176 = sqrt(_2174);
        float _2178 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2180 = precise::min(_2176, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2182 = _2180 * _2172;
        float _2184 = -_1624;
        float _2186 = _2184 + _2114;
        float _2188 = _2178 * _2182;
        float _2190 = fma(_2186, _2188, _1624);
        float _2192 = fma(_2158, _2188, _1336);
        float _2194 = fma(_2168, _2188, _1414);
        _2144 = _2192;
        _2128 = _2190;
        _2130 = _2194;
        _2132 = _2188;
    }
    float _2196 = _2144;
    float _2198 = _2128;
    float _2200 = _2130;
    float _2202 = _2132;
    float _2204 = _2202;
    if (!_2040)
    {
        float _2206 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2210 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2208);
        float _2212 = _2206 * 0.15915493667125701904296875;
        float _2214 = _2212 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2220 = _2218 * 0.15915493667125701904296875;
        float _2222 = _2212 * 6.283185482025146484375;
        float _2224 = sin(_2222);
        float _2226 = 1.0 / _2216;
        float _2228 = _2220 * 6.283185482025146484375;
        float _2230 = cos(_2228);
        float _2232 = _2224 * _2226;
        float _2234 = 1.0 / _2210;
        float _2236 = _2230 * _2232;
        float _2238 = _2220 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2244 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2242;
        float _2246 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2248 = _2234 * _2246;
        float _2250 = 1.0 / _2236;
        float _2252 = 1.0 / _2244;
        float _2254 = _2240 * _2250;
        float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2258 = fma(_2254, _2248, _2256);
        float _2260 = _2258 * _2252;
        float _2262 = precise::clamp(_2260, 0.0, 1.0);
        _2204 = _2252;
        _180 = _2220;
        _2140 = _2262;
    }
    float _2264 = _2204;
    float _2266 = _180;
    float _2268 = _2140;
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2196 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2276 = _2198 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2280 = _2200 + _2278;
    float _2282 = _2272 * _2272;
    float _2284 = fma(_2276, _2276, _2282);
    float _2286 = fma(_2280, _2280, _2284);
    float _2288 = rsqrt(_2286);
    float _2290 = sqrt(_2286);
    float _2292 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2294 = _2276 * _2292;
    float _2296 = _2280 * _2292;
    float _2298 = _2294 * _2294;
    float _2300 = _2296 * _2296;
    float _2302 = _2298 + _2300;
    float _2304 = sqrt(_2302);
    bool _2306 = _2304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = _2304 + _2308;
    float _2312 = _2264;
    float _2314 = _2310;
    float _2316 = _2272;
    float _2318 = _2296;
    float _2320 = _2298;
    float _2322 = _2300;
    if (_2306)
    {
        float _2324 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2312 = _2324;
    }
    float _2326 = _2312;
    if (_2306)
    {
        float _2328 = _2310 * _2326;
        _2314 = _2328;
    }
    float _2330 = _2314;
    if (_2306)
    {
        float _2332 = _2330 * 0.15915493667125701904296875;
        _2134 = _2332;
    }
    float _2334 = _2134;
    float _2336 = _2118;
    if (_2306)
    {
        float _2338 = _2334 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        _2336 = _2340;
    }
    float _2342 = _2336;
    float _2344 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2346 = precise::max(0.0, _2344);
    float _2348 = _2266;
    float _2350 = _2346;
    if (_2306)
    {
        float _2352 = _2334 * 6.283185482025146484375;
        float _2354 = cos(_2352);
        _2348 = _2354;
    }
    float _2356 = _2348;
    float _2358 = -_2292;
    float _2360 = -_2346;
    float _2362 = fma(_2272, _2358, _2360);
    if (!_2306)
    {
        _2316 = _2294;
    }
    float _2364 = _2316;
    float _2366 = _2344;
    float _2368 = _2364;
    if (_2306)
    {
        float _2370 = rsqrt(_2302);
        _2366 = _2370;
    }
    float _2372 = _2366;
    if (_2306)
    {
        float _2374 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2350 = _2374;
    }
    float _2376 = _2350;
    float _2378 = _2376;
    if (_2306)
    {
        float _2380 = fma(_2342, _2376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2136 = _2380;
    }
    float _2382 = _2136;
    float _2384 = _2382;
    if (_2306)
    {
        float _2386 = _2356 + (-1.0);
        _2378 = _2386;
    }
    float _2388 = _2378;
    float _2390 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2392 = _2388;
    if (_2306)
    {
        float _2394 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2392 = _2394;
    }
    float _2396 = _2392;
    float _2398 = _2372;
    if (_2306)
    {
        float _2400 = _2372 * _2382;
        _2384 = _2400;
    }
    float _2402 = _2384;
    if (!_2306)
    {
        _2398 = _2362;
    }
    float _2404 = _2398;
    float _2406 = _2404;
    if (_2306)
    {
        float _2408 = fma(_2362, _2356, _2396);
        _2406 = _2408;
    }
    float _2410 = _2406;
    if (_2306)
    {
        float _2412 = _2294 * _2402;
        _2368 = _2412;
    }
    float _2414 = _2368;
    if (_2306)
    {
        float _2416 = _2296 * _2402;
        _2318 = _2416;
    }
    float _2418 = _2318;
    if (_2306)
    {
        float _2420 = _2414 * _2414;
        _2320 = _2420;
    }
    float _2422 = _2320;
    if (_2306)
    {
        float _2424 = _2418 * _2418;
        _2322 = _2424;
    }
    float _2426 = _2322;
    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2430 = fma(_2290, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2428);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2436 = fma(_2410, _2410, _2422);
    float _2438 = -_2432;
    float _2440 = _2438 + 1.0;
    float _2442 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2434);
    float _2444 = _2436 + _2426;
    float _2446 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2448 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2442);
    float _2450 = abs(_2440);
    float _2452 = log2(_2450);
    float _2454 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2446);
    float _2456 = _2448 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2458 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2454);
    float _2460 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2462 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2464 = rsqrt(_2444);
    float _2466 = _2458 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2468 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2460);
    float _2470 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2462);
    float _2472 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2474 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2468);
    float _2476 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2478 = -_2472;
    float _2480 = fma(_2478, _2390, 1.0);
    float _2482 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2470);
    float _2484 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2486 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2488 = exp2(_2476);
    float _2490 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2492 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2494 = _2464 * _2414;
    float _2496 = _2464 * _2410;
    float _2498 = _2464 * _2418;
    float _2500 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2486);
    float _2502 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2504 = log2(_2480);
    float _2506 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2492);
    float _2508 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2500);
    float _2510 = -_2502;
    float _2512 = fma(_2496, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2510);
    float _2514 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2506);
    float _2516 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2508);
    float _2518 = -_2498;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2512);
    float _2522 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2524 = 1.0 / _2516;
    float _2526 = fma(_2520, -0.5, 0.5);
    float _2528 = fma(_2520, 0.5, 0.5);
    float _2530 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2522);
    float _2532 = _2496 + 1.0;
    float _2534 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2536 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2530);
    float _2538 = sqrt(_2526);
    float _2540 = -_2496;
    float _2542 = fma(_2488, _2532, _2540);
    float _2544 = fma(_2528, _2534, -0.212114393711090087890625);
    float _2546 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2536);
    float _2548 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2514);
    float _2550 = _2504 * 0.693147182464599609375;
    float _2552 = fma(_2528, _2544, 1.570728778839111328125);
    float _2554 = fma(_2542, 0.5, 0.5);
    float _2556 = _2546 * _2524;
    float _2558 = _2548 * _2524;
    float _2560 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2562 = fma(_2556, 0.5, 0.5);
    float _2564 = fma(_2558, -0.5, 0.5);
    float _2566 = _2538 * 0.636619746685028076171875;
    float _2568 = -_2552;
    float _2570 = fma(_2566, _2568, 1.0);
    float3 _7437 = float3(_2562, _2564, _2560);
    float _2572 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7437, float3(0.0), isnan(_7437)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7437, float3(0.0), isnan(_7437)), level(0.0)).x;
    float3 _7448 = float3(_2562, _2564, _2560);
    float4 _2575 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7448, float3(0.0), isnan(_7448)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7448, float3(0.0), isnan(_7448)), level(0.0)).xyzw;
    float _2577 = _2575.x;
    float _2579 = _2575.y;
    float _2581 = _2575.z;
    float _2583 = _2575.w;
    float2 _7465 = float2(_2570, _2554);
    float3 _2587 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7465, float2(0.0), isnan(_7465)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7465, float2(0.0), isnan(_7465)), level(0.0)).xyz;
    float _2589 = _2587.x;
    float _2591 = _2587.y;
    float _2593 = _2587.z;
    float _2595 = float(uint(_1182));
    float _2597 = trunc(_1496);
    int _2599 = int(_2597);
    int _2601 = ~_1182;
    int _2603 = _2601 + 1;
    float _2605 = _1558 * _152;
    int _2607 = ~_1182;
    int _2609 = _2607 + 1;
    out.m_61.x = _874;
    out.m_61.y = _876;
    out.m_61.z = _878;
    out.m_61.w = _882;
    int _2611 = abs(_1418);
    float _2613 = _1564 * (-0.15915493667125701904296875);
    int _2615 = abs(_1422);
    float _2617 = 1.0 / _2595;
    float _2619 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2621 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2625 = _2623 != 0;
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2629 = _2627 != 0;
    float _2631 = trunc(_2605);
    int _2633 = int(_2631);
    float _2635 = float(uint(_2599));
    float _2637 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2621);
    int _2639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2641 = _2639 != 0;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2645 = _2643 != 0;
    float _2647 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2637);
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2651 = _2649 != 0;
    float _2653 = exp2(_2619);
    int _2655 = as_type<int>(_2617) + (-2);
    float _2657 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2647);
    float _2659 = as_type<float>(_2655) * _2635;
    out.gl_Position.x = _2546;
    out.gl_Position.y = _2548;
    out.gl_Position.z = _2657;
    out.gl_Position.w = _2516;
    float _2661 = trunc(_2659);
    float _2663 = precise::max(_2661, 0.0);
    uint _2666 = uint(_2663);
    float _2668 = -_2653;
    float _2670 = _2668 + 1.0;
    int _2672 = _2603 * int(_2666);
    int _2674 = _2672 + _2599;
    float _2676 = float(uint(_2674));
    float _2678 = as_type<float>(_2655) * _2676;
    float _2680 = trunc(_2678);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    bool _2686 = !_1198;
    float _2688 = _2686 ? 7.345489978790283203125 : 1.0;
    float _2690 = _2688 * _1178;
    float _2692 = floor(_2690);
    int _2694 = int(_2666) + int(_2684);
    float _2696 = float(_2599);
    int _2698 = _2609 * _2694;
    int _2700 = _2698 + _2599;
    bool _2702 = _2696 >= _1540;
    bool _2704 = isnan(_2696);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan(_1540);
    bool _2710 = _2706 || _2708;
    float _2712 = float(_2710);
    bool _2714 = uint(_2700) >= uint(_1182);
    float _2716 = -_2692;
    float _2718 = _2690 + _2716;
    float _2720 = trunc(_2712);
    int _2722 = int(_2720);
    bool _2724 = !_2714;
    int _2726 = _2724 ? 0 : (-1);
    float _2728 = _2718 * _1540;
    bool _2730 = _1182 == 0;
    int _2732 = ~_2694;
    int _2734 = _2732 + _2726;
    int _2736 = _2734 + 1;
    float _2738 = trunc(_2728);
    int _2740 = int(_2738);
    int _2742 = _1182 + (-1);
    int _2744 = _1182 * _2736;
    int _2746 = _2744 + _2599;
    bool _2748 = !_2625;
    int _2750 = _2748 ? 0 : 1;
    int _2752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2754 = _2752 != 0;
    int _2756 = ~_2722;
    int _2758 = _2756 + 1;
    int _2760 = _2758 + 1;
    bool _2762 = !_2730;
    int _2764 = _2762 ? _2746 : (-1);
    int _2766 = abs(_2750);
    int _2768 = abs(_1428);
    int _2770 = _2764 * _2760;
    int _2772 = _2722 * _2742;
    int _2774 = _2772 + _2770;
    bool _2776 = !_2754;
    int _2778 = _2776 ? 0 : 1;
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2782 = _2780 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2784 = _2774 * _2611;
    int _2786 = abs(_2778);
    float _2788 = 1.0 / _2782;
    int _2790 = _2740 * _2766;
    int _2792 = _2790 + _2599;
    int _2794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2796 = _2794 != 0;
    int _2798 = _2633 * _2615;
    int _2800 = _2798 + _2784;
    int _2802 = ~_1182;
    int _2804 = _2802 + 1;
    float _2806 = in.m_53.w;
    int _2808 = _2792 * _2768;
    int _2810 = _2808 + _2800;
    float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2814 = _1176 + _2812;
    float _2816 = in.m_63.x;
    int _2818 = _2740 * _2786;
    int _2820 = _2818 + _2810;
    float _2822 = float(uint(_2820));
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2826 = _2824 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2828 = as_type<float>(_2655) * _2822;
    float _2830 = in.m_63.y;
    float _2832 = 1.0 / _2826;
    bool _2834 = _2806 > 0.5;
    float _2836 = trunc(_2828);
    float _2838 = precise::max(_2836, 0.0);
    uint _2840 = uint(_2838);
    int _2842 = _2746;
    bool _2844 = _2651;
    bool _2846 = _2641;
    int _2848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[80].y);
    if (_2645)
    {
        float _2850 = -_2816;
        float _2852 = _2850 + 1.0;
        _2842 = as_type<int>(_2852);
    }
    int _2854 = _2842;
    float _2856 = -_2830;
    float _2858 = _2856 + 1.0;
    int _2860 = _2804 * int(_2840);
    int _2862 = _2860 + _2820;
    int _2864 = _2834 ? as_type<int>(_2858) : as_type<int>(_2830);
    float _2866 = float(uint(_2862));
    float _2868 = _2651 ? as_type<float>(_2864) : _2830;
    float _2870 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2872 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2870;
    bool _2874 = _1184 > 0.5;
    float _2876 = as_type<float>(_2655) * _2866;
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2880 = _2878 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2882 = _2830;
    if (_2629)
    {
        bool _2884 = _1178 > 0.5;
        _2844 = _2884;
    }
    bool _2886 = _2844;
    float _2888 = _2872 * _2832;
    int _2890 = ~_1182;
    int _2892 = _2890 + 1;
    float _2894 = trunc(_2876);
    float _2896 = precise::max(_2894, 0.0);
    uint _2898 = uint(_2896);
    float _2900 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2902 = _2900 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    if (_2641)
    {
        float _2904 = _2874 ? _2858 : _2830;
        _2882 = _2904;
    }
    float _2906 = _2882;
    float _2908 = fma(_2888, _2814, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_2645)
    {
        bool _2910 = _1244 > 0.5;
        _2846 = _2910;
    }
    bool _2912 = _2846;
    float _2914 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2906, -0.5);
    float _2916 = 1.0 / _2902;
    float _2918 = float(uint(_2792));
    if (_2629)
    {
        float _2920 = -_2816;
        float _2922 = _2920 + 1.0;
        _2848 = as_type<int>(_2922);
    }
    int _2924 = _2848;
    float _2926 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2926;
    bool _2930 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2932 = isnan(_1176);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2938 = _2934 || _2936;
    float _2940 = float(_2938);
    float _2942 = -_1332;
    float _2944 = fma(_1560, _2914, _2942);
    float _2946 = _2928 * _2788;
    int _2948 = int(_2840) + int(_2898);
    float _2950 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2952 = _1176 + _2950;
    float _2954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2956 = ~_1182;
    int _2958 = _2956 + 1;
    int _2960 = _2892 * _2948;
    int _2962 = _2960 + _2820;
    float _2964 = _2880 * _2916;
    bool _2966 = uint(_2962) >= uint(_1182);
    float _2968 = fma(_2964, _2952, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2970 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2972 = _1176 + _2970;
    bool _2974 = !_2966;
    float _2976 = _2974 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2978 = fma(_2946, _2972, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2980 = ~_2948;
    int _2982 = _2980 + as_type<int>(_2976);
    int _2984 = _2982 + 1;
    float _2986 = as_type<float>(_2655) * _2918;
    bool _2988 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2990 = isnan(_1176);
    bool _2992 = _2988 || _2990;
    bool _2994 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2996 = _2992 || _2994;
    float _2998 = float(_2996);
    float _3000 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3002 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3004 = isnan(_1176);
    bool _3006 = _3002 || _3004;
    bool _3008 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3010 = _3006 || _3008;
    float _3012 = float(_3010);
    int _3014 = _1182 * _2984;
    int _3016 = _3014 + _2820;
    bool _3018 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3020 = isnan(_1176);
    bool _3022 = _3018 || _3020;
    bool _3024 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3026 = _3022 || _3024;
    float _3028 = float(_3026);
    float _3030 = -_2998;
    float _3032 = _3030 + 1.0;
    float _3034 = trunc(_2986);
    float _3036 = precise::max(_3034, 0.0);
    uint _3038 = uint(_3036);
    float _3040 = _2976;
    if (!_2629)
    {
        _3040 = _2816;
    }
    float _3042 = _3040;
    float _3044 = _3012 * _3032;
    float _3046 = -_3012;
    float _3048 = _3046 + 1.0;
    bool _3050 = !_2730;
    int _3052 = _3050 ? _3016 : (-1);
    float _3054 = _3042;
    if (_2629)
    {
        float _3056 = _2886 ? as_type<float>(_2924) : _2816;
        _3054 = _3056;
    }
    float _3058 = _3054;
    float _3060 = _3028 * _3048;
    float _3062 = -_3028;
    float _3064 = _3062 + 1.0;
    float _3066 = fma(_2868, _3000, -0.5);
    int _3068 = _3052 >> 31;
    float _3070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3072 = _2940 * _3064;
    float _3074 = -_2940;
    float _3076 = _3074 + 1.0;
    int _3078 = _3068 & 3;
    int _3080 = _2958 * int(_3038);
    int _3082 = _3080 + _2792;
    float _3084 = _2908 * _3072;
    int _3086 = _3052 & 3;
    bool _3088 = _3086 != 0;
    int _3090 = _3052 + _3078;
    float _3092 = _2613 * 6.283185482025146484375;
    float _3094 = sin(_3092);
    float _3096 = float(uint(_3082));
    int _3098 = _3090 >> 2;
    float _3100 = as_type<float>(_3078);
    if (!_2645)
    {
        _3100 = _2816;
    }
    float _3102 = _3100;
    float _3104 = as_type<float>(_2655) * _3096;
    int _3106 = _3098 << 4;
    int _3108 = _3106 + 368;
    float _3110 = fma(_3076, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3084);
    float _3112 = _3070 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3114 = fma(_3058, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    uint _3116 = uint(int(uint(_3108) >> uint(2)));
    uint _3118 = uint(int(uint(int(_3116)) >> uint(2)));
    int _3120 = int(_3116) & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    int _3124 = int(_3116) + 1;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    int _3128 = _3124 & 3;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[int(_3126)][_3128];
    float _3132 = fma(_2968, _3060, _3110);
    float _3134 = _3102;
    if (_2645)
    {
        float _3136 = _2912 ? as_type<float>(_2854) : _2816;
        _3134 = _3136;
    }
    float _3138 = _3134;
    float _3140 = trunc(_3104);
    float _3142 = precise::max(_3140, 0.0);
    uint _3144 = uint(_3142);
    int _3146 = _3052 & 3;
    bool _3148 = _3146 != 0;
    float _3150 = fma(_2978, _3044, _3132);
    float _3152 = _3094 * _3066;
    float _3154 = fma(_3112, _3138, -0.5);
    int _3156 = _3108 + 8;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    uint _3160 = uint(int(uint(int(_3158)) >> uint(2)));
    int _3162 = int(_3158) & 3;
    float _3164 = (*spvDescriptorSet0.vp_c9)._m0[int(_3160)][_3162];
    int _3166 = int(_3158) + 1;
    uint _3168 = uint(int(uint(_3166) >> uint(2)));
    int _3170 = _3166 & 3;
    float _3172 = (*spvDescriptorSet0.vp_c9)._m0[int(_3168)][_3170];
    bool _3174 = uint(_3146) > 1u;
    float _3176 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3150);
    float _3178 = _2613 * 6.283185482025146484375;
    float _3180 = cos(_3178);
    int _3182 = _3088 ? 0 : 1;
    float _3184 = fma(_1512, _3114, _1326);
    bool _3186 = _3146 != 3;
    bool _3188 = uint(_3146) >= 2u;
    int _3190 = int(_3038) + int(_3144);
    int _3192 = ~_1182;
    int _3194 = _3192 + 1;
    int _3196 = _3194 * _3190;
    int _3198 = _3196 + _2792;
    float _3200 = -_3152;
    float _3202 = fma(_3180, _3154, _3200);
    int _3204 = ~_3182;
    int _3206 = _3204 + 1;
    int _3208 = _3206 + 1;
    float _3210 = _3180 * _3066;
    int _3212 = _3208;
    if (!_3174)
    {
        int _3214 = ~_3182;
        int _3216 = _3214 + 1;
        _3212 = _3216;
    }
    int _3218 = _3212;
    float _3220 = fma(_1562, _3202, _1534);
    bool _3222 = !_3148;
    int _3224 = _3222 ? 0 : 1;
    float _3226 = fma(_3094, _3154, _3210);
    int _3228 = abs(_3218);
    float _3230 = _3220 + 0.5;
    int _3232 = _3188 ? 0 : 1;
    bool _3234 = _3146 != 3;
    bool _3236 = uint(_3198) >= uint(_1182);
    int _3238 = ~_3232;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    bool _3244 = !_3234;
    int _3246 = _3244 ? 0 : (-1);
    int _3248 = abs(_3224);
    int _3250 = _3242;
    if (_3186)
    {
        int _3252 = ~_3232;
        int _3254 = _3252 + 1;
        _3250 = _3254;
    }
    int _3256 = _3250;
    int _3258 = ~_3228;
    int _3260 = _3258 + 1;
    int _3262 = _3260 + 1;
    bool _3264 = !_2796;
    int _3266 = _3264 ? 0 : 1;
    int _3268 = abs(_3246);
    int _3270 = _3262 * as_type<int>(_3130);
    int _3272 = abs(_3256);
    int _3274 = ~_3248;
    int _3276 = _3274 + 1;
    int _3278 = _3276 + 1;
    int _3280 = abs(_3266);
    int _3282 = _3278 * as_type<int>(_3122);
    int _3284 = _3282 + _3270;
    int _3286 = ~_3272;
    int _3288 = _3286 + 1;
    int _3290 = _3288 + 1;
    float _3292 = -_1566;
    float _3294 = fma(_1402, _3226, _3292);
    bool _3296 = !_3236;
    int _3298 = _3296 ? 0 : (-1);
    int _3300 = _3290 * as_type<int>(_3164);
    int _3302 = _3300 + _3284;
    int _3304 = ~_3268;
    int _3306 = _3304 + 1;
    int _3308 = _3306 + 1;
    float _3310 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3312 = ~_3190;
    int _3314 = _3312 + _3298;
    int _3316 = _3314 + 1;
    float _3318 = _2944 + 0.5;
    int _3320 = ~_3280;
    int _3322 = _3320 + 1;
    int _3324 = _3322 + 1;
    int _3326 = _3308 * as_type<int>(_3172);
    int _3328 = _3326 + _3302;
    float _3330 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3332 = _1182 * _3316;
    int _3334 = _3332 + _2792;
    float _3336 = _3310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3338 = _3328 * _3324;
    float _3340 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3342 = _3330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3344 = _3176 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3346 = !_2730;
    int _3348 = _3346 ? _3334 : (-1);
    float _3350 = _3340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3352 = _2657 + _2516;
    int _3354 = _3348 * _3280;
    int _3356 = _3354 + _3338;
    out.m_65.x = _3350;
    out.m_65.y = _3342;
    out.m_65.z = _3336;
    out.m_65.w = _3344;
    bool _3358 = _2268 > 0.0;
    bool _3360 = isnan(_2268);
    bool _3362 = _3358 || _3360;
    bool _3364 = isnan(0.0);
    bool _3366 = _3362 || _3364;
    float _3368 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3370 = _3184 + 0.5;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    float _3372 = float(_3356);
    float _3374 = _3294 + 0.5;
    float _3376 = _3352 * 0.5;
    out.m_69.x = _3372;
    float _3378 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3380 = _3368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3370;
    out.m_71.y = _3318;
    out.m_71.z = _3230;
    out.m_71.w = _3374;
    float _3382 = _3378 * _2572;
    float _3384 = -_3378;
    float _3386 = _3384 + 1.0;
    out.m_73.z = _3376;
    out.m_73.w = _2516;
    float _3388 = _2583 * _3382;
    float _3390 = _2593 * _3382;
    float _3392 = _2583 * _3386;
    out.m_49.x = _3380;
    float _3394 = fma(_2589, _3388, _2577);
    float _3396 = fma(_2591, _3388, _2579);
    float _3398 = fma(_2583, _3390, _2581);
    out.m_75.x = _3394;
    out.m_75.y = _3396;
    out.m_75.z = _3398;
    out.m_75.w = _3392;
    if (_3366)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3400 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3400;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
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
    float _108 = _91;
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
        float _3468 = as_type<float>(_118);
        out.gl_Position.z = _3468;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3523 = as_type<float>(_144);
        out.gl_Position.z = _3523;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _178 = _172;
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
    float _332 = _238 * _304;
    float _334 = _244 * _264;
    float _336 = -_238;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _342 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _340;
    float _344 = -_282;
    float _346 = _344 + 1.0;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    float _352 = _326 * _338;
    float _354 = fma(_342, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = _258 * _346;
    float _358 = fma(_350, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = _312 * _352;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = _354 * _352;
    float _376 = fma(_330, _270, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _378 = fma(_362, _270, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _380 = fma(_366, _270, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _382 = _358 * _352;
    float _384 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _368);
    float _386 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _374);
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _388;
    float _392 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _382);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _398;
    float _402 = fma(_376, _332, _384);
    float _404 = fma(_378, _332, _386);
    float _406 = fma(_390, _334, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _408 = fma(_380, _332, _392);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _418 = fma(_396, _334, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _420 = fma(_400, _334, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _424 = _422 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _426 = fma(_406, _356, _402);
    float _428 = fma(_412, _288, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _430 = fma(_416, _288, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _432 = fma(_424, _288, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _434 = fma(_418, _356, _404);
    float _436 = fma(_420, _356, _408);
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
    bool _502 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _504 = isnan(_472);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _494;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _518 = _472 + _516;
    bool _520 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _522 = isnan(_472);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _532;
    float _536 = 1.0 / _490;
    float _538 = _518 * _496;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _542 = _472 + _540;
    float _544 = _446 * _476;
    bool _546 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _548 = isnan(_472);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _560 = _472 + _558;
    float _562 = _448 * _478;
    float _564 = 1.0 / _486;
    float _566 = _542 * _514;
    bool _568 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _570 = isnan(_472);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _582 = _472 + _580;
    float _584 = fma(_534, _538, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _586 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _588 = 1.0 / _500;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _592 = _472 + _590;
    float _594 = _560 * _536;
    float _596 = -_578;
    float _598 = _596 + 1.0;
    float _600 = _592 * _564;
    float _602 = -_556;
    float _604 = _602 + 1.0;
    bool _606 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _608 = isnan(_472);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _578 * _604;
    float _620 = _512 * _598;
    bool _622 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _624 = isnan(_472);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = -_616;
    float _636 = _634 + 1.0;
    float _638 = -_512;
    float _640 = _638 + 1.0;
    float _642 = _582 * _588;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _644;
    float _648 = _632 * _636;
    float _650 = -_632;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _654;
    float _658 = _616 * _640;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _664 = fma(_646, _538, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _674 = _530 * _652;
    float _676 = fma(_656, _538, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _678 = fma(_662, _600, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _680 = fma(_668, _600, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _682 = fma(_672, _600, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _684 = _664 * _674;
    float _686 = -_530;
    float _688 = _686 + 1.0;
    float _690 = _676 * _674;
    float _692 = _584 * _674;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _694;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _698;
    float _702 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _702;
    float _706 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[107].x, _684);
    float _708 = fma(_696, _594, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _710 = fma(_700, _594, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _712 = fma(_704, _594, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _718 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[107].y, _690);
    float _720 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[107].z, _692);
    float _722 = fma(_678, _648, _706);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _728 = fma(_716, _566, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _730 = fma(_680, _648, _718);
    float _732 = fma(_682, _648, _720);
    float _734 = fma(_708, _658, _722);
    float _736 = fma(_726, _566, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _742 = fma(_710, _658, _730);
    float _744 = fma(_712, _658, _732);
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _750;
    float _754 = fma(_740, _566, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _756;
    float _760 = fma(_728, _620, _734);
    float _762 = fma(_748, _642, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _764 = fma(_752, _642, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _766 = fma(_758, _642, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _768 = fma(_736, _620, _742);
    float _770 = fma(_754, _620, _744);
    float _772 = fma(_762, _618, _760);
    float _774 = fma(_764, _618, _768);
    float _776 = fma(_766, _618, _770);
    float _778 = _444 * _474;
    float _780 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[112].x, _772);
    float _782 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[112].y, _774);
    float _784 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[112].z, _776);
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
    bool _956 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _958 = isnan(_906);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _970 = isnan(_906);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = 1.0 / _930;
    float _982 = _910 * _936;
    bool _984 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _986 = isnan(_906);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    bool _996 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _998 = 1.0 / _934;
    float _1000 = _914 * _950;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1002;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1006;
    float _1010 = fma(_1004, _982, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1012 = fma(_1008, _982, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1014 = _918 * _980;
    float _1016 = -_948;
    float _1018 = _1016 + 1.0;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1020;
    float _1024 = fma(_1022, _982, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1026 = _954 * _998;
    bool _1028 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1030 = isnan(_906);
    bool _1032 = _1028 || _1030;
    bool _1034 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1036 = _1032 || _1034;
    float _1038 = float(_1036);
    float _1040 = _994 * _1018;
    float _1042 = -_994;
    float _1044 = _1042 + 1.0;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1050 = -_1038;
    float _1052 = _1050 + 1.0;
    float _1054 = _1038 * _1044;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1064 = _966 * _1052;
    float _1066 = -_966;
    float _1068 = _1066 + 1.0;
    float _1070 = fma(_1058, _1000, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1072 = fma(_1062, _1000, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1074 = fma(_1048, _1000, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1076 = _978 * _1068;
    float _1078 = -_978;
    float _1080 = _1078 + 1.0;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1082;
    float _1086 = _1010 * _1076;
    float _1088 = _1012 * _1076;
    float _1090 = _1024 * _1076;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1096;
    float _1100 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1086);
    float _1102 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1088);
    float _1104 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1090);
    float _1106 = fma(_1094, _1014, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1108 = fma(_1098, _1014, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1110 = fma(_1084, _1014, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1112 = fma(_1070, _1064, _1100);
    float _1114 = fma(_1072, _1064, _1102);
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1124 = fma(_1074, _1064, _1104);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1128 = _1126 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1130 = fma(_1106, _1054, _1112);
    float _1132 = fma(_1118, _1026, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1134 = fma(_1122, _1026, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1136 = fma(_1108, _1054, _1114);
    float _1138 = fma(_1128, _1026, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1140 = fma(_1110, _1054, _1124);
    float _1142 = fma(_1132, _1040, _1130);
    float _1144 = fma(_1134, _1040, _1136);
    float _1146 = fma(_1138, _1040, _1140);
    float _1148 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1142);
    float _1150 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1144);
    float _1152 = fma(_948, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1146);
    bool _1154 = !_996;
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
    float _1200 = _544 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1202 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1204 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1206 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1208 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1202);
    float _1210 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1206);
    float _1212 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1214 = _1178 * 2.0;
    float _1216 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1210);
    float _1218 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1220 = -_1186;
    float _1222 = fma(_1212, 2.0, _1220);
    float _1224 = _1184 * 2.0;
    float _1226 = floor(_1214);
    float _1228 = fma(_1218, -2.0, _1194);
    float _1230 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1232 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1234 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1236 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1230);
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1232);
    float _1240 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1234);
    float _1242 = _1178 + _1184;
    float _1244 = in.m_53.z;
    float _1246 = floor(_1224);
    float _1248 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1238);
    float _1250 = _1242 + (-1.0);
    float _1252 = _1238;
    float _1254 = _1236;
    if (!_1198)
    {
        _1252 = _1184;
    }
    float _1256 = _1252;
    float _1258 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1236);
    float _1260 = _1256;
    if (_1198)
    {
        _1260 = _1178;
    }
    float _1262 = _1260;
    float _1264 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1266 = fma(_1192, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1240);
    bool _1268 = _1226 > 0.0;
    float _1270 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1272 = _1226 >= 0.0;
    bool _1274 = isnan(_1226);
    bool _1276 = _1272 || _1274;
    bool _1278 = isnan(0.0);
    bool _1280 = _1276 || _1278;
    float _1282 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1208);
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1286 = _1226;
    float _1288 = _1262;
    if (!_1198)
    {
        _1254 = _1184;
    }
    float _1290 = _1254;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1294 = _1246 > 0.0;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _1298 = _1246 >= 0.0;
    bool _1300 = isnan(_1246);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan(0.0);
    bool _1306 = _1302 || _1304;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1310 = _1246;
    float _1312 = _1290;
    if (!_1198)
    {
        _1310 = _1178;
    }
    float _1314 = _1310;
    float _1316 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1318 = int(_1316);
    float _1320 = _1314;
    if (!_1198)
    {
        _1286 = _1244;
    }
    float _1322 = _1286;
    float _1324 = -_100;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1222);
    float _1328 = _1322;
    if (_1198)
    {
        _1320 = _1244;
    }
    float _1330 = _1320;
    float _1332 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1228);
    if (!_1198)
    {
        _1288 = _1322;
    }
    float _1334 = _1288;
    float _1336 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1338 = _1334;
    if (_1198)
    {
        _1338 = _1184;
    }
    float _1340 = _1338;
    float _1342 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[84].z, _1296);
    if (_1198)
    {
        _1312 = _1178;
    }
    float _1344 = _1312;
    float _1346 = rsqrt(_1216);
    if (_1198)
    {
        _1328 = _1184;
    }
    float _1348 = _1328;
    float _1350 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1352 = fma(_1344, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1292);
    int _1354 = _1280 ? 0 : 1;
    float _1356 = fma(_1350, -2.0, _1284);
    int _1358 = _1306 ? 0 : 1;
    float _1360 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1308);
    int _1362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1364 = _1362 != 0;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1372 = _1370 != 0;
    float _1374 = _1178 + _1244;
    int _1376 = ~_1354;
    int _1378 = _1376 + 1;
    int _1380 = _1378 + 1;
    float _1382 = _1244 * 2.0;
    int _1384 = ~_1358;
    int _1386 = _1384 + 1;
    int _1388 = _1386 + 1;
    float _1390 = _1374 + (-1.0);
    int _1392 = _1380;
    int _1394 = _1388;
    if (!_1268)
    {
        int _1396 = ~_1354;
        int _1398 = _1396 + 1;
        _1392 = _1398;
    }
    int _1400 = _1392;
    float _1402 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1360);
    if (!_1294)
    {
        int _1404 = ~_1358;
        int _1406 = _1404 + 1;
        _1394 = _1406;
    }
    int _1408 = _1394;
    float _1410 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1412 = log2(_1410);
    float _1414 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1416 = !_1368;
    int _1418 = _1416 ? 0 : 1;
    bool _1420 = !_1364;
    int _1422 = _1420 ? 0 : 1;
    float _1424 = fma(_1390, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1426 = !_1372;
    int _1428 = _1426 ? 0 : 1;
    float _1430 = _1184 + _1244;
    int _1432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1434 = _1432 != 0;
    int _1436 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1438 = _1436 != 0;
    int _1440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1442 = _1440 != 0;
    float _1444 = floor(_1382);
    float _1446 = _1430 + (-1.0);
    bool _1448 = !_1442;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1454 = float(_1318);
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1458 = abs(_1450);
    float _1460 = float(_1400);
    float _1462 = 1.0 / _1454;
    float _1464 = _1412 * _100;
    float _1466 = float(_1408);
    float _1468 = -_1456;
    float _1470 = fma(_1270, 2.0, _1468);
    float _1472 = float(_1458);
    float _1474 = exp2(_1464);
    float _1476 = _1472 * _1466;
    bool _1478 = !_1438;
    int _1480 = _1478 ? 0 : 1;
    float _1482 = in.m_57.x;
    float _1484 = in.m_57.y;
    float _1486 = in.m_57.z;
    float _1488 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1490 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1492 = 1.0 + _1490;
    int _1494 = abs(_1480);
    float _1496 = _1462 * _100;
    float _1498 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1488);
    float _1500 = 1.0 / _1492;
    bool _1502 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1504 = isnan(1.0);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1510 = _1506 || _1508;
    float _1512 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1498);
    float _1514 = float(_1494);
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1518 = -_1474;
    float _1520 = _1518 + 1.0;
    bool _1522 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1530 = _1526 || _1528;
    float _1532 = -_100;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1470);
    bool _1536 = _1444 > 0.0;
    float _1538 = _1514 * _1460;
    float _1540 = float(_1182);
    float _1542 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1516);
    float _1544 = _1530 ? _1520 : 0.0;
    float _1546 = _1538 * (-2.0);
    bool _1548 = _1444 >= 0.0;
    bool _1550 = isnan(_1444);
    bool _1552 = _1548 || _1550;
    bool _1554 = isnan(0.0);
    bool _1556 = _1552 || _1554;
    float _1558 = _1540 * _100;
    float _1560 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1542);
    float _1562 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1352);
    float _1564 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[84].x, _1342);
    float _1566 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1356);
    int _1568 = _1556 ? 0 : 1;
    if (_1510)
    {
        float _1570 = _1544 * _1500;
        _110 = _1570;
    }
    float _1572 = _110;
    float _1574 = fma(_1452, _1546, _1452);
    float _1576 = fma(_1546, _1484, _1484);
    float _1578 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1580 = ~_1568;
    int _1582 = _1580 + 1;
    int _1584 = _1582 + 1;
    float _1586 = _1184 + (-0.5);
    int _1588 = _1584;
    if (!_1536)
    {
        int _1590 = ~_1568;
        int _1592 = _1590 + 1;
        _1588 = _1592;
    }
    int _1594 = _1588;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1596;
    float _1600 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1602 = _1578 * _1578;
    float _1604 = fma(_1586, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1576);
    float _1606 = _1476 * (-2.0);
    float _1608 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1610 = fma(_1600, _1600, _1602);
    bool _1612 = !_1434;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1574, _1572, _1604);
    float _1618 = fma(_1424, _1606, _1424);
    float _1620 = fma(_1606, _1486, _1486);
    int _1622 = abs(_1614);
    float _1624 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1626 = _1616 * 0.15915493667125701904296875;
    float _1628 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1630 = _1244 + (-0.5);
    float _1632 = float(_1622);
    float _1634 = fma(_1608, _1608, _1610);
    float _1636 = float(_1594);
    float _1638 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1628);
    float _1640 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1620);
    float _1642 = rsqrt(_1634);
    float _1644 = _1632 * _1636;
    float _1646 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1638);
    float _1648 = _1644 * (-2.0);
    float _1650 = _1282 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1652 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1654 = fma(_1618, _1572, _1640);
    float _1656 = 1.0 / _1598;
    float _1658 = in.m_59.x;
    float _1660 = in.m_59.y;
    float _1662 = in.m_59.z;
    float _1664 = -_1652;
    float _1666 = _1650 + _1664;
    float _1668 = fma(_1648, _1482, _1482);
    float _1670 = _1178 + (-0.5);
    float _1672 = fma(_1264, _1648, _1264);
    bool _1674 = _1652 >= _1650;
    bool _1676 = isnan(_1652);
    bool _1678 = _1674 || _1676;
    bool _1680 = isnan(_1650);
    bool _1682 = _1678 || _1680;
    float _1684 = _1654 * 0.15915493667125701904296875;
    float _1686 = abs(_1666);
    float _1688 = precise::max(_1686, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1690 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1668);
    float _1692 = _1626 * 6.283185482025146484375;
    float _1694 = sin(_1692);
    float _1696 = _1600 * _1642;
    float _1698 = precise::min(_1688, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1700 = fma(_1672, _1572, _1690);
    float _1702 = _1578 * _1642;
    float _1704 = _1608 * _1642;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1708 = _1698 + _1706;
    float _1710 = _1626 * 6.283185482025146484375;
    float _1712 = cos(_1710);
    bool _1714 = !_1682;
    float _1716 = _1714 ? 1.0 : (-1.0);
    float _1718 = _1708 * _1656;
    float _1720 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1658);
    float _1722 = _1684 * 6.283185482025146484375;
    float _1724 = sin(_1722);
    float _1726 = _1700 * 0.15915493667125701904296875;
    float _1728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1660);
    float _1730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1662);
    float _1732 = _1716 * _1718;
    float _1734 = _778 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1736 = _1200 * _1728;
    float _1738 = _562 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1740 = _1684 * 6.283185482025146484375;
    float _1742 = cos(_1740);
    float _1744 = _1204 * _1732;
    float _1746 = _1734 * _1720;
    float _1748 = _1738 * _1730;
    float _1750 = _1744 * 0.15915493667125701904296875;
    float _1752 = _1726 * 6.283185482025146484375;
    float _1754 = sin(_1752);
    float _1756 = -_1736;
    float _1758 = _1724 * _1756;
    float _1760 = _1726 * 6.283185482025146484375;
    float _1762 = cos(_1760);
    float _1764 = _1742 * _1736;
    float _1766 = _1712 * _1742;
    float _1768 = fma(_1766, _1746, _1758);
    float _1770 = _1754 * _1694;
    float _1772 = _1750 * 6.283185482025146484375;
    float _1774 = cos(_1772);
    float _1776 = _1762 * _1712;
    float _1778 = _1762 * _1694;
    float _1780 = _1762 * _1764;
    float _1782 = _1754 * _1712;
    float _1784 = fma(_1724, _1776, _1770);
    float _1786 = _1694 * _1742;
    float _1788 = _1754 * _1764;
    float _1790 = -_1782;
    float _1792 = fma(_1724, _1778, _1790);
    float _1794 = fma(_1784, _1746, _1780);
    float _1796 = _1750 * 6.283185482025146484375;
    float _1798 = sin(_1796);
    float _1800 = -_1778;
    float _1802 = fma(_1724, _1782, _1800);
    float _1804 = fma(_1786, _1748, _1768);
    float _1806 = fma(_1792, _1748, _1794);
    float _1808 = fma(_1724, _1770, _1776);
    float _1810 = fma(_1802, _1746, _1788);
    float _1812 = -_1774;
    float _1814 = _1812 + 1.0;
    float _1816 = _1806 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1818 = _1806 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1820 = fma(_1808, _1748, _1810);
    float _1822 = _1806 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1824 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1816);
    float _1826 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1818);
    float _1828 = _1702 * _1814;
    float _1830 = _1704 * _1704;
    float _1832 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1824);
    float _1834 = _1696 * _1798;
    float _1836 = _1702 * _1798;
    float _1838 = _1704 * _1798;
    float _1840 = _1696 * _1814;
    float _1842 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1822);
    float _1844 = fma(_1704, _1828, _1834);
    float _1846 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1826);
    float _1848 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1850 = fma(_1814, _1830, _1774);
    float _1852 = -_1838;
    float _1854 = fma(_1702, _1840, _1852);
    float _1856 = -_1836;
    float _1858 = fma(_1704, _1840, _1856);
    float _1860 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1862 = _1848 * _1844;
    float _1864 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1842);
    float _1866 = fma(_1696, _1840, _1774);
    float _1868 = _1848 * _1854;
    float _1870 = fma(_1860, _1858, _1862);
    float _1872 = _1864 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1874 = fma(_1702, _1840, _1838);
    float _1876 = fma(_1860, _1866, _1868);
    float _1878 = fma(_1704, _1840, _1836);
    float _1880 = fma(_1872, _1850, _1870);
    float _1882 = fma(_1872, _1878, _1876);
    float _1884 = _1414 + _1880;
    float _1886 = _1624 + _1882;
    float _1888 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1890 = _1884 + _1888;
    float _1892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1894 = _1886 + _1892;
    float _1896 = _1890 * _1890;
    float _1898 = fma(_1894, _1894, _1896);
    float _1900 = fma(_1702, _1828, _1774);
    float _1902 = -_1834;
    float _1904 = fma(_1704, _1828, _1902);
    float _1906 = sqrt(_1898);
    float _1908 = _1848 * _1900;
    float _1910 = fma(_1860, _1874, _1908);
    float _1912 = fma(_1872, _1904, _1910);
    float _1914 = _1336 + _1912;
    bool _1916 = _1906 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1918 = _1912;
    float _1920 = _1908;
    float _1922 = _1910;
    if (!_1916)
    {
        _1918 = _1886;
    }
    float _1924 = _1918;
    float _1926 = _1924;
    if (!_1916)
    {
        _1920 = _1884;
    }
    float _1928 = _1920;
    float _1930 = _1928;
    if (!_1916)
    {
        _1922 = _1914;
    }
    float _1932 = _1922;
    bool _1934 = !_1916;
    float _1936 = _1932;
    if (!_1934)
    {
        float _1938 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1942 = _1906 + _1940;
        float _1944 = rsqrt(_1898);
        float _1946 = _1942 * _1938;
        float _1948 = _1914 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1950 = _1946 * 0.15915493667125701904296875;
        float _1952 = _1950 * 6.283185482025146484375;
        float _1954 = cos(_1952);
        float _1956 = _1950 * 6.283185482025146484375;
        float _1958 = sin(_1956);
        float _1960 = _1954 + (-1.0);
        float _1962 = fma(_1958, _1948, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1964 = _1960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1966 = _1944 * _1962;
        float _1968 = fma(_1914, _1954, _1964);
        float _1970 = fma(_1894, _1966, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1972 = fma(_1890, _1966, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1936 = _1968;
        _1926 = _1970;
        _1930 = _1972;
    }
    float _1974 = _1936;
    float _1976 = _1926;
    float _1978 = _1930;
    float _1980 = -_1336;
    float _1982 = _1980 + _1974;
    float _1984 = -_1624;
    float _1986 = _1984 + _1976;
    float _1988 = -_1414;
    float _1990 = _1988 + _1978;
    float _1992 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1994 = _1982 * _1982;
    float _1996 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1992);
    float _1998 = fma(_1986, _1986, _1994);
    float _2000 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1996);
    float _2002 = fma(_1990, _1990, _1998);
    float _2004 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2006 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2008 = sqrt(_2002);
    float _2010 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2004);
    float _2012 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2010);
    bool _2014 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2016 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2018 = _2014 || _2016;
    bool _2020 = isnan(0.5);
    bool _2022 = _2018 || _2020;
    float _2024 = 1.0 / _2006;
    float _2026 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2028 = _2026 + _2006;
    bool _2030 = _2008 > 0.0;
    bool _2032 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan(0.5);
    bool _2040 = _2036 || _2038;
    float _2042 = _2028 * _2024;
    float _2044 = _2042 * 0.5;
    bool _2046 = !_2030;
    float _2048 = _1974;
    float _2050 = _1978;
    float _2052 = _1976;
    float _2054 = _1990;
    float _2056 = _2002;
    float _2058 = _2024;
    float _2060 = _2026;
    float _2062 = _2006;
    if (!_2046)
    {
        float _2064 = _172 * _172;
        float _2066 = rsqrt(_2002);
        float _2068 = fma(_170, _170, _2064);
        float _2070 = fma(_174, _174, _2068);
        float _2072 = sqrt(_2070);
        float _2074 = _1982 * _2066;
        float _2076 = _1990 * _2066;
        bool _2078 = _2072 > 0.0;
        float _2080 = _1986 * _2066;
        bool _2082 = !_2078;
        _2056 = _2066;
        _2058 = _2076;
        _2060 = _2070;
        _2062 = _2080;
        if (!_2082)
        {
            float _2084 = rsqrt(_2070);
            float _2086 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2088 = _172 * _2084;
            float _2090 = _170 * _2084;
            float _2092 = _2074 * _2088;
            float _2094 = _174 * _2084;
            float _2096 = fma(_2080, _2090, _2092);
            float _2098 = _2086 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2100 = fma(_2076, _2094, _2096);
            float _2102 = _2100 * _2098;
            float _2104 = fma(_170, _2102, _1976);
            float _2106 = fma(_172, _2102, _1974);
            float _2108 = fma(_174, _2102, _1978);
            _2048 = _2106;
            _2050 = _2108;
            _2052 = _2104;
            _2054 = _2098;
            _2056 = _2086;
            _2060 = _2084;
        }
    }
    float _2110 = _2048;
    float _2112 = _2050;
    float _2114 = _2052;
    float _2116 = _2054;
    float _2118 = _2056;
    float _2120 = _2058;
    float _2122 = _2060;
    float _2124 = _2062;
    float _2126 = _2124;
    float _2128 = _2114;
    float _2130 = _2112;
    float _2132 = _2116;
    float _2134 = _2120;
    float _2136 = _2122;
    if (_2040)
    {
        _2126 = 1.0;
    }
    float _2138 = _2126;
    float _2140 = _2138;
    if (_2022)
    {
        _178 = _2110;
    }
    float _2142 = _178;
    float _2144 = _2142;
    if (!_2022)
    {
        float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2148 = _1336 + _2146;
        float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2152 = _1624 + _2150;
        float _2154 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2156 = -_1336;
        float _2158 = _2156 + _2110;
        float _2160 = _2148 * _2148;
        float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2164 = _1414 + _2162;
        float _2166 = -_1414;
        float _2168 = _2166 + _2112;
        float _2170 = fma(_2152, _2152, _2160);
        float _2172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2174 = fma(_2164, _2164, _2170);
        float _2176 = sqrt(_2174);
        float _2178 = _2154 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2180 = precise::min(_2176, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2182 = _2180 * _2172;
        float _2184 = -_1624;
        float _2186 = _2184 + _2114;
        float _2188 = _2178 * _2182;
        float _2190 = fma(_2186, _2188, _1624);
        float _2192 = fma(_2158, _2188, _1336);
        float _2194 = fma(_2168, _2188, _1414);
        _2144 = _2192;
        _2128 = _2190;
        _2130 = _2194;
        _2132 = _2188;
    }
    float _2196 = _2144;
    float _2198 = _2128;
    float _2200 = _2130;
    float _2202 = _2132;
    float _2204 = _2202;
    if (!_2040)
    {
        float _2206 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2208 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2210 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2208);
        float _2212 = _2206 * 0.15915493667125701904296875;
        float _2214 = _2212 * 6.283185482025146484375;
        float _2216 = cos(_2214);
        float _2218 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2220 = _2218 * 0.15915493667125701904296875;
        float _2222 = _2212 * 6.283185482025146484375;
        float _2224 = sin(_2222);
        float _2226 = 1.0 / _2216;
        float _2228 = _2220 * 6.283185482025146484375;
        float _2230 = cos(_2228);
        float _2232 = _2224 * _2226;
        float _2234 = 1.0 / _2210;
        float _2236 = _2230 * _2232;
        float _2238 = _2220 * 6.283185482025146484375;
        float _2240 = sin(_2238);
        float _2242 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2244 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2242;
        float _2246 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2248 = _2234 * _2246;
        float _2250 = 1.0 / _2236;
        float _2252 = 1.0 / _2244;
        float _2254 = _2240 * _2250;
        float _2256 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2258 = fma(_2254, _2248, _2256);
        float _2260 = _2258 * _2252;
        float _2262 = precise::clamp(_2260, 0.0, 1.0);
        _2204 = _2252;
        _180 = _2220;
        _2140 = _2262;
    }
    float _2264 = _2204;
    float _2266 = _180;
    float _2268 = _2140;
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2196 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2276 = _2198 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2280 = _2200 + _2278;
    float _2282 = _2272 * _2272;
    float _2284 = fma(_2276, _2276, _2282);
    float _2286 = fma(_2280, _2280, _2284);
    float _2288 = rsqrt(_2286);
    float _2290 = sqrt(_2286);
    float _2292 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2294 = _2276 * _2292;
    float _2296 = _2280 * _2292;
    float _2298 = _2294 * _2294;
    float _2300 = _2296 * _2296;
    float _2302 = _2298 + _2300;
    float _2304 = sqrt(_2302);
    bool _2306 = _2304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = _2304 + _2308;
    float _2312 = _2264;
    float _2314 = _2310;
    float _2316 = _2272;
    float _2318 = _2296;
    float _2320 = _2298;
    float _2322 = _2300;
    if (_2306)
    {
        float _2324 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2312 = _2324;
    }
    float _2326 = _2312;
    if (_2306)
    {
        float _2328 = _2310 * _2326;
        _2314 = _2328;
    }
    float _2330 = _2314;
    if (_2306)
    {
        float _2332 = _2330 * 0.15915493667125701904296875;
        _2134 = _2332;
    }
    float _2334 = _2134;
    float _2336 = _2118;
    if (_2306)
    {
        float _2338 = _2334 * 6.283185482025146484375;
        float _2340 = sin(_2338);
        _2336 = _2340;
    }
    float _2342 = _2336;
    float _2344 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2346 = precise::max(0.0, _2344);
    float _2348 = _2266;
    float _2350 = _2346;
    if (_2306)
    {
        float _2352 = _2334 * 6.283185482025146484375;
        float _2354 = cos(_2352);
        _2348 = _2354;
    }
    float _2356 = _2348;
    float _2358 = -_2292;
    float _2360 = -_2346;
    float _2362 = fma(_2272, _2358, _2360);
    if (!_2306)
    {
        _2316 = _2294;
    }
    float _2364 = _2316;
    float _2366 = _2344;
    float _2368 = _2364;
    if (_2306)
    {
        float _2370 = rsqrt(_2302);
        _2366 = _2370;
    }
    float _2372 = _2366;
    if (_2306)
    {
        float _2374 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2350 = _2374;
    }
    float _2376 = _2350;
    float _2378 = _2376;
    if (_2306)
    {
        float _2380 = fma(_2342, _2376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2136 = _2380;
    }
    float _2382 = _2136;
    float _2384 = _2382;
    if (_2306)
    {
        float _2386 = _2356 + (-1.0);
        _2378 = _2386;
    }
    float _2388 = _2378;
    float _2390 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2392 = _2388;
    if (_2306)
    {
        float _2394 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2392 = _2394;
    }
    float _2396 = _2392;
    float _2398 = _2372;
    if (_2306)
    {
        float _2400 = _2372 * _2382;
        _2384 = _2400;
    }
    float _2402 = _2384;
    if (!_2306)
    {
        _2398 = _2362;
    }
    float _2404 = _2398;
    float _2406 = _2404;
    if (_2306)
    {
        float _2408 = fma(_2362, _2356, _2396);
        _2406 = _2408;
    }
    float _2410 = _2406;
    if (_2306)
    {
        float _2412 = _2294 * _2402;
        _2368 = _2412;
    }
    float _2414 = _2368;
    if (_2306)
    {
        float _2416 = _2296 * _2402;
        _2318 = _2416;
    }
    float _2418 = _2318;
    if (_2306)
    {
        float _2420 = _2414 * _2414;
        _2320 = _2420;
    }
    float _2422 = _2320;
    if (_2306)
    {
        float _2424 = _2418 * _2418;
        _2322 = _2424;
    }
    float _2426 = _2322;
    float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2430 = fma(_2290, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2428);
    float _2432 = precise::clamp(_2430, 0.0, 1.0);
    float _2434 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2436 = fma(_2410, _2410, _2422);
    float _2438 = -_2432;
    float _2440 = _2438 + 1.0;
    float _2442 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2434);
    float _2444 = _2436 + _2426;
    float _2446 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2448 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2442);
    float _2450 = abs(_2440);
    float _2452 = log2(_2450);
    float _2454 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2446);
    float _2456 = _2448 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2458 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2454);
    float _2460 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2462 = _2196 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2464 = rsqrt(_2444);
    float _2466 = _2458 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2468 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2460);
    float _2470 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2462);
    float _2472 = _2466 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2474 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2468);
    float _2476 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2478 = -_2472;
    float _2480 = fma(_2478, _2390, 1.0);
    float _2482 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2470);
    float _2484 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2486 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2488 = exp2(_2476);
    float _2490 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2492 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2494 = _2464 * _2414;
    float _2496 = _2464 * _2410;
    float _2498 = _2464 * _2418;
    float _2500 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2486);
    float _2502 = _2494 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2504 = log2(_2480);
    float _2506 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2492);
    float _2508 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2500);
    float _2510 = -_2502;
    float _2512 = fma(_2496, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2510);
    float _2514 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2506);
    float _2516 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2508);
    float _2518 = -_2498;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2512);
    float _2522 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2524 = 1.0 / _2516;
    float _2526 = fma(_2520, -0.5, 0.5);
    float _2528 = fma(_2520, 0.5, 0.5);
    float _2530 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2522);
    float _2532 = _2496 + 1.0;
    float _2534 = fma(_2528, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2536 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2530);
    float _2538 = sqrt(_2526);
    float _2540 = -_2496;
    float _2542 = fma(_2488, _2532, _2540);
    float _2544 = fma(_2528, _2534, -0.212114393711090087890625);
    float _2546 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2536);
    float _2548 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2514);
    float _2550 = _2504 * 0.693147182464599609375;
    float _2552 = fma(_2528, _2544, 1.570728778839111328125);
    float _2554 = fma(_2542, 0.5, 0.5);
    float _2556 = _2546 * _2524;
    float _2558 = _2548 * _2524;
    float _2560 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2562 = fma(_2556, 0.5, 0.5);
    float _2564 = fma(_2558, -0.5, 0.5);
    float _2566 = _2538 * 0.636619746685028076171875;
    float _2568 = -_2552;
    float _2570 = fma(_2566, _2568, 1.0);
    float3 _7437 = float3(_2562, _2564, _2560);
    float _2572 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7437, float3(0.0), isnan(_7437)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7437, float3(0.0), isnan(_7437)), level(0.0)).x;
    float3 _7448 = float3(_2562, _2564, _2560);
    float4 _2575 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7448, float3(0.0), isnan(_7448)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7448, float3(0.0), isnan(_7448)), level(0.0)).xyzw;
    float _2577 = _2575.x;
    float _2579 = _2575.y;
    float _2581 = _2575.z;
    float _2583 = _2575.w;
    float2 _7465 = float2(_2570, _2554);
    float3 _2587 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7465, float2(0.0), isnan(_7465)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7465, float2(0.0), isnan(_7465)), level(0.0)).xyz;
    float _2589 = _2587.x;
    float _2591 = _2587.y;
    float _2593 = _2587.z;
    float _2595 = float(uint(_1182));
    float _2597 = trunc(_1496);
    int _2599 = int(_2597);
    int _2601 = ~_1182;
    int _2603 = _2601 + 1;
    float _2605 = _1558 * _152;
    int _2607 = ~_1182;
    int _2609 = _2607 + 1;
    out.m_61.x = _874;
    out.m_61.y = _876;
    out.m_61.z = _878;
    out.m_61.w = _882;
    int _2611 = abs(_1418);
    float _2613 = _1564 * (-0.15915493667125701904296875);
    int _2615 = abs(_1422);
    float _2617 = 1.0 / _2595;
    float _2619 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2621 = _2456 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2623 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2625 = _2623 != 0;
    int _2627 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2629 = _2627 != 0;
    float _2631 = trunc(_2605);
    int _2633 = int(_2631);
    float _2635 = float(uint(_2599));
    float _2637 = fma(_2484, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2621);
    int _2639 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2641 = _2639 != 0;
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2645 = _2643 != 0;
    float _2647 = fma(_2466, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2637);
    int _2649 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2651 = _2649 != 0;
    float _2653 = exp2(_2619);
    int _2655 = as_type<int>(_2617) + (-2);
    float _2657 = fma(_2490, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2647);
    float _2659 = as_type<float>(_2655) * _2635;
    out.gl_Position.x = _2546;
    out.gl_Position.y = _2548;
    out.gl_Position.z = _2657;
    out.gl_Position.w = _2516;
    float _2661 = trunc(_2659);
    float _2663 = precise::max(_2661, 0.0);
    uint _2666 = uint(_2663);
    float _2668 = -_2653;
    float _2670 = _2668 + 1.0;
    int _2672 = _2603 * int(_2666);
    int _2674 = _2672 + _2599;
    float _2676 = float(uint(_2674));
    float _2678 = as_type<float>(_2655) * _2676;
    float _2680 = trunc(_2678);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    bool _2686 = !_1198;
    float _2688 = _2686 ? 7.345489978790283203125 : 1.0;
    float _2690 = _2688 * _1178;
    float _2692 = floor(_2690);
    int _2694 = int(_2666) + int(_2684);
    float _2696 = float(_2599);
    int _2698 = _2609 * _2694;
    int _2700 = _2698 + _2599;
    bool _2702 = _2696 >= _1540;
    bool _2704 = isnan(_2696);
    bool _2706 = _2702 || _2704;
    bool _2708 = isnan(_1540);
    bool _2710 = _2706 || _2708;
    float _2712 = float(_2710);
    bool _2714 = uint(_2700) >= uint(_1182);
    float _2716 = -_2692;
    float _2718 = _2690 + _2716;
    float _2720 = trunc(_2712);
    int _2722 = int(_2720);
    bool _2724 = !_2714;
    int _2726 = _2724 ? 0 : (-1);
    float _2728 = _2718 * _1540;
    bool _2730 = _1182 == 0;
    int _2732 = ~_2694;
    int _2734 = _2732 + _2726;
    int _2736 = _2734 + 1;
    float _2738 = trunc(_2728);
    int _2740 = int(_2738);
    int _2742 = _1182 + (-1);
    int _2744 = _1182 * _2736;
    int _2746 = _2744 + _2599;
    bool _2748 = !_2625;
    int _2750 = _2748 ? 0 : 1;
    int _2752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2754 = _2752 != 0;
    int _2756 = ~_2722;
    int _2758 = _2756 + 1;
    int _2760 = _2758 + 1;
    bool _2762 = !_2730;
    int _2764 = _2762 ? _2746 : (-1);
    int _2766 = abs(_2750);
    int _2768 = abs(_1428);
    int _2770 = _2764 * _2760;
    int _2772 = _2722 * _2742;
    int _2774 = _2772 + _2770;
    bool _2776 = !_2754;
    int _2778 = _2776 ? 0 : 1;
    float _2780 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2782 = _2780 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _2784 = _2774 * _2611;
    int _2786 = abs(_2778);
    float _2788 = 1.0 / _2782;
    int _2790 = _2740 * _2766;
    int _2792 = _2790 + _2599;
    int _2794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2796 = _2794 != 0;
    int _2798 = _2633 * _2615;
    int _2800 = _2798 + _2784;
    int _2802 = ~_1182;
    int _2804 = _2802 + 1;
    float _2806 = in.m_53.w;
    int _2808 = _2792 * _2768;
    int _2810 = _2808 + _2800;
    float _2812 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2814 = _1176 + _2812;
    float _2816 = in.m_63.x;
    int _2818 = _2740 * _2786;
    int _2820 = _2818 + _2810;
    float _2822 = float(uint(_2820));
    float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2826 = _2824 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2828 = as_type<float>(_2655) * _2822;
    float _2830 = in.m_63.y;
    float _2832 = 1.0 / _2826;
    bool _2834 = _2806 > 0.5;
    float _2836 = trunc(_2828);
    float _2838 = precise::max(_2836, 0.0);
    uint _2840 = uint(_2838);
    int _2842 = _2746;
    bool _2844 = _2651;
    bool _2846 = _2641;
    int _2848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[80].y);
    if (_2645)
    {
        float _2850 = -_2816;
        float _2852 = _2850 + 1.0;
        _2842 = as_type<int>(_2852);
    }
    int _2854 = _2842;
    float _2856 = -_2830;
    float _2858 = _2856 + 1.0;
    int _2860 = _2804 * int(_2840);
    int _2862 = _2860 + _2820;
    int _2864 = _2834 ? as_type<int>(_2858) : as_type<int>(_2830);
    float _2866 = float(uint(_2862));
    float _2868 = _2651 ? as_type<float>(_2864) : _2830;
    float _2870 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2872 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2870;
    bool _2874 = _1184 > 0.5;
    float _2876 = as_type<float>(_2655) * _2866;
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2880 = _2878 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2882 = _2830;
    if (_2629)
    {
        bool _2884 = _1178 > 0.5;
        _2844 = _2884;
    }
    bool _2886 = _2844;
    float _2888 = _2872 * _2832;
    int _2890 = ~_1182;
    int _2892 = _2890 + 1;
    float _2894 = trunc(_2876);
    float _2896 = precise::max(_2894, 0.0);
    uint _2898 = uint(_2896);
    float _2900 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2902 = _2900 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    if (_2641)
    {
        float _2904 = _2874 ? _2858 : _2830;
        _2882 = _2904;
    }
    float _2906 = _2882;
    float _2908 = fma(_2888, _2814, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_2645)
    {
        bool _2910 = _1244 > 0.5;
        _2846 = _2910;
    }
    bool _2912 = _2846;
    float _2914 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2906, -0.5);
    float _2916 = 1.0 / _2902;
    float _2918 = float(uint(_2792));
    if (_2629)
    {
        float _2920 = -_2816;
        float _2922 = _2920 + 1.0;
        _2848 = as_type<int>(_2922);
    }
    int _2924 = _2848;
    float _2926 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2926;
    bool _2930 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2932 = isnan(_1176);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2938 = _2934 || _2936;
    float _2940 = float(_2938);
    float _2942 = -_1332;
    float _2944 = fma(_1560, _2914, _2942);
    float _2946 = _2928 * _2788;
    int _2948 = int(_2840) + int(_2898);
    float _2950 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2952 = _1176 + _2950;
    float _2954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2956 = ~_1182;
    int _2958 = _2956 + 1;
    int _2960 = _2892 * _2948;
    int _2962 = _2960 + _2820;
    float _2964 = _2880 * _2916;
    bool _2966 = uint(_2962) >= uint(_1182);
    float _2968 = fma(_2964, _2952, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2970 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2972 = _1176 + _2970;
    bool _2974 = !_2966;
    float _2976 = _2974 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2978 = fma(_2946, _2972, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2980 = ~_2948;
    int _2982 = _2980 + as_type<int>(_2976);
    int _2984 = _2982 + 1;
    float _2986 = as_type<float>(_2655) * _2918;
    bool _2988 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2990 = isnan(_1176);
    bool _2992 = _2988 || _2990;
    bool _2994 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2996 = _2992 || _2994;
    float _2998 = float(_2996);
    float _3000 = _2954 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3002 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3004 = isnan(_1176);
    bool _3006 = _3002 || _3004;
    bool _3008 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3010 = _3006 || _3008;
    float _3012 = float(_3010);
    int _3014 = _1182 * _2984;
    int _3016 = _3014 + _2820;
    bool _3018 = _1176 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3020 = isnan(_1176);
    bool _3022 = _3018 || _3020;
    bool _3024 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3026 = _3022 || _3024;
    float _3028 = float(_3026);
    float _3030 = -_2998;
    float _3032 = _3030 + 1.0;
    float _3034 = trunc(_2986);
    float _3036 = precise::max(_3034, 0.0);
    uint _3038 = uint(_3036);
    float _3040 = _2976;
    if (!_2629)
    {
        _3040 = _2816;
    }
    float _3042 = _3040;
    float _3044 = _3012 * _3032;
    float _3046 = -_3012;
    float _3048 = _3046 + 1.0;
    bool _3050 = !_2730;
    int _3052 = _3050 ? _3016 : (-1);
    float _3054 = _3042;
    if (_2629)
    {
        float _3056 = _2886 ? as_type<float>(_2924) : _2816;
        _3054 = _3056;
    }
    float _3058 = _3054;
    float _3060 = _3028 * _3048;
    float _3062 = -_3028;
    float _3064 = _3062 + 1.0;
    float _3066 = fma(_2868, _3000, -0.5);
    int _3068 = _3052 >> 31;
    float _3070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3072 = _2940 * _3064;
    float _3074 = -_2940;
    float _3076 = _3074 + 1.0;
    int _3078 = _3068 & 3;
    int _3080 = _2958 * int(_3038);
    int _3082 = _3080 + _2792;
    float _3084 = _2908 * _3072;
    int _3086 = _3052 & 3;
    bool _3088 = _3086 != 0;
    int _3090 = _3052 + _3078;
    float _3092 = _2613 * 6.283185482025146484375;
    float _3094 = sin(_3092);
    float _3096 = float(uint(_3082));
    int _3098 = _3090 >> 2;
    float _3100 = as_type<float>(_3078);
    if (!_2645)
    {
        _3100 = _2816;
    }
    float _3102 = _3100;
    float _3104 = as_type<float>(_2655) * _3096;
    int _3106 = _3098 << 4;
    int _3108 = _3106 + 368;
    float _3110 = fma(_3076, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3084);
    float _3112 = _3070 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3114 = fma(_3058, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    uint _3116 = uint(int(uint(_3108) >> uint(2)));
    uint _3118 = uint(int(uint(int(_3116)) >> uint(2)));
    int _3120 = int(_3116) & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    int _3124 = int(_3116) + 1;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    int _3128 = _3124 & 3;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[int(_3126)][_3128];
    float _3132 = fma(_2968, _3060, _3110);
    float _3134 = _3102;
    if (_2645)
    {
        float _3136 = _2912 ? as_type<float>(_2854) : _2816;
        _3134 = _3136;
    }
    float _3138 = _3134;
    float _3140 = trunc(_3104);
    float _3142 = precise::max(_3140, 0.0);
    uint _3144 = uint(_3142);
    int _3146 = _3052 & 3;
    bool _3148 = _3146 != 0;
    float _3150 = fma(_2978, _3044, _3132);
    float _3152 = _3094 * _3066;
    float _3154 = fma(_3112, _3138, -0.5);
    int _3156 = _3108 + 8;
    uint _3158 = uint(int(uint(_3156) >> uint(2)));
    uint _3160 = uint(int(uint(int(_3158)) >> uint(2)));
    int _3162 = int(_3158) & 3;
    float _3164 = (*spvDescriptorSet0.vp_c9)._m0[int(_3160)][_3162];
    int _3166 = int(_3158) + 1;
    uint _3168 = uint(int(uint(_3166) >> uint(2)));
    int _3170 = _3166 & 3;
    float _3172 = (*spvDescriptorSet0.vp_c9)._m0[int(_3168)][_3170];
    bool _3174 = uint(_3146) > 1u;
    float _3176 = fma(_2998, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3150);
    float _3178 = _2613 * 6.283185482025146484375;
    float _3180 = cos(_3178);
    int _3182 = _3088 ? 0 : 1;
    float _3184 = fma(_1512, _3114, _1326);
    bool _3186 = _3146 != 3;
    bool _3188 = uint(_3146) >= 2u;
    int _3190 = int(_3038) + int(_3144);
    int _3192 = ~_1182;
    int _3194 = _3192 + 1;
    int _3196 = _3194 * _3190;
    int _3198 = _3196 + _2792;
    float _3200 = -_3152;
    float _3202 = fma(_3180, _3154, _3200);
    int _3204 = ~_3182;
    int _3206 = _3204 + 1;
    int _3208 = _3206 + 1;
    float _3210 = _3180 * _3066;
    int _3212 = _3208;
    if (!_3174)
    {
        int _3214 = ~_3182;
        int _3216 = _3214 + 1;
        _3212 = _3216;
    }
    int _3218 = _3212;
    float _3220 = fma(_1562, _3202, _1534);
    bool _3222 = !_3148;
    int _3224 = _3222 ? 0 : 1;
    float _3226 = fma(_3094, _3154, _3210);
    int _3228 = abs(_3218);
    float _3230 = _3220 + 0.5;
    int _3232 = _3188 ? 0 : 1;
    bool _3234 = _3146 != 3;
    bool _3236 = uint(_3198) >= uint(_1182);
    int _3238 = ~_3232;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    bool _3244 = !_3234;
    int _3246 = _3244 ? 0 : (-1);
    int _3248 = abs(_3224);
    int _3250 = _3242;
    if (_3186)
    {
        int _3252 = ~_3232;
        int _3254 = _3252 + 1;
        _3250 = _3254;
    }
    int _3256 = _3250;
    int _3258 = ~_3228;
    int _3260 = _3258 + 1;
    int _3262 = _3260 + 1;
    bool _3264 = !_2796;
    int _3266 = _3264 ? 0 : 1;
    int _3268 = abs(_3246);
    int _3270 = _3262 * as_type<int>(_3130);
    int _3272 = abs(_3256);
    int _3274 = ~_3248;
    int _3276 = _3274 + 1;
    int _3278 = _3276 + 1;
    int _3280 = abs(_3266);
    int _3282 = _3278 * as_type<int>(_3122);
    int _3284 = _3282 + _3270;
    int _3286 = ~_3272;
    int _3288 = _3286 + 1;
    int _3290 = _3288 + 1;
    float _3292 = -_1566;
    float _3294 = fma(_1402, _3226, _3292);
    bool _3296 = !_3236;
    int _3298 = _3296 ? 0 : (-1);
    int _3300 = _3290 * as_type<int>(_3164);
    int _3302 = _3300 + _3284;
    int _3304 = ~_3268;
    int _3306 = _3304 + 1;
    int _3308 = _3306 + 1;
    float _3310 = _1152 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3312 = ~_3190;
    int _3314 = _3312 + _3298;
    int _3316 = _3314 + 1;
    float _3318 = _2944 + 0.5;
    int _3320 = ~_3280;
    int _3322 = _3320 + 1;
    int _3324 = _3322 + 1;
    int _3326 = _3308 * as_type<int>(_3172);
    int _3328 = _3326 + _3302;
    float _3330 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3332 = _1182 * _3316;
    int _3334 = _3332 + _2792;
    float _3336 = _3310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3338 = _3328 * _3324;
    float _3340 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3342 = _3330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3344 = _3176 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _3346 = !_2730;
    int _3348 = _3346 ? _3334 : (-1);
    float _3350 = _3340 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3352 = _2657 + _2516;
    int _3354 = _3348 * _3280;
    int _3356 = _3354 + _3338;
    out.m_65.x = _3350;
    out.m_65.y = _3342;
    out.m_65.z = _3336;
    out.m_65.w = _3344;
    bool _3358 = _2268 > 0.0;
    bool _3360 = isnan(_2268);
    bool _3362 = _3358 || _3360;
    bool _3364 = isnan(0.0);
    bool _3366 = _3362 || _3364;
    float _3368 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3370 = _3184 + 0.5;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    float _3372 = float(_3356);
    float _3374 = _3294 + 0.5;
    float _3376 = _3352 * 0.5;
    out.m_69.x = _3372;
    float _3378 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3380 = _3368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_71.x = _3370;
    out.m_71.y = _3318;
    out.m_71.z = _3230;
    out.m_71.w = _3374;
    float _3382 = _3378 * _2572;
    float _3384 = -_3378;
    float _3386 = _3384 + 1.0;
    out.m_73.z = _3376;
    out.m_73.w = _2516;
    float _3388 = _2583 * _3382;
    float _3390 = _2593 * _3382;
    float _3392 = _2583 * _3386;
    out.m_49.x = _3380;
    float _3394 = fma(_2589, _3388, _2577);
    float _3396 = fma(_2591, _3388, _2579);
    float _3398 = fma(_2583, _3390, _2581);
    out.m_75.x = _3394;
    out.m_75.y = _3396;
    out.m_75.z = _3398;
    out.m_75.w = _3392;
    if (_3366)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3400 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3400;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

