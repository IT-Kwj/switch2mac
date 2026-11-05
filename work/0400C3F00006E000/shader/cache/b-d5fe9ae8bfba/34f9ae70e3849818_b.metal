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
    bool _1336 = false;
    bool _958 = false;
    bool _860 = false;
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
        float _3665 = as_type<float>(_118);
        out.gl_Position.z = _3665;
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
        float _3720 = as_type<float>(_144);
        out.gl_Position.z = _3720;
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
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _506 = 1.0 / _486;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _510 = _472 + _508;
    bool _512 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _514 = isnan(_472);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = 1.0 / _504;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _530 = _472 + _528;
    float _532 = _446 * _476;
    float _534 = _510 * _496;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _538 = _472 + _536;
    bool _540 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _542 = isnan(_472);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _554 = _472 + _552;
    float _556 = _448 * _478;
    float _558 = 1.0 / _494;
    float _560 = _530 * _506;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _564 = _472 + _562;
    bool _566 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _568 = isnan(_472);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _582;
    float _586 = _444 * _474;
    float _588 = 1.0 / _500;
    float _590 = _538 * _526;
    float _592 = -_550;
    float _594 = _592 + 1.0;
    float _596 = -_576;
    float _598 = _596 + 1.0;
    float _600 = _576 * _594;
    float _602 = fma(_580, _534, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _604 = 1.0 / _490;
    float _606 = _554 * _558;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _616 = fma(_610, _534, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _618 = fma(_614, _560, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _622 = _472 + _620;
    float _624 = _622 * _588;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _626;
    float _630 = _564 * _604;
    bool _632 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _634 = isnan(_472);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = fma(_628, _534, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _646 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _648 = isnan(_472);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = fma(_584, _630, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _660 = -_642;
    float _662 = _660 + 1.0;
    float _664 = _642 * _598;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = _656 * _662;
    bool _676 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _678 = isnan(_472);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_656;
    float _690 = _688 + 1.0;
    bool _692 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _694 = isnan(_472);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = fma(_672, _560, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _706 = fma(_668, _560, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _708 = _522 * _690;
    float _710 = -_686;
    float _712 = _710 + 1.0;
    float _714 = -_522;
    float _716 = _714 + 1.0;
    float _718 = _702 * _712;
    float _720 = _686 * _716;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _726;
    float _730 = _602 * _718;
    float _732 = _616 * _718;
    float _734 = -_702;
    float _736 = _734 + 1.0;
    float _738 = _644 * _718;
    float _740 = fma(_724, _630, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _742 = fma(_728, _630, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[107].x, _730);
    float _758 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[107].y, _732);
    float _760 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[107].z, _738);
    float _762 = fma(_746, _606, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _764 = fma(_750, _606, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _766 = fma(_754, _606, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _768 = fma(_704, _720, _756);
    float _770 = fma(_706, _720, _758);
    float _772 = fma(_618, _720, _760);
    float _774 = fma(_740, _708, _768);
    float _776 = fma(_658, _708, _772);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _778;
    float _782 = fma(_742, _708, _770);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _788;
    float _792 = fma(_780, _624, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _794 = fma(_786, _624, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _796 = fma(_762, _674, _774);
    float _798 = fma(_790, _624, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _800 = fma(_766, _674, _776);
    float _802 = fma(_764, _674, _782);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _816 = fma(_792, _664, _796);
    float _818 = fma(_806, _590, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _820 = fma(_810, _590, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _822 = fma(_814, _590, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _824 = fma(_794, _664, _802);
    float _826 = fma(_798, _664, _800);
    float _828 = fma(_818, _600, _816);
    float _830 = fma(_820, _600, _824);
    float _832 = fma(_822, _600, _826);
    float _834 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[113].x, _828);
    float _836 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[113].y, _830);
    float _838 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[113].z, _832);
    bool _840 = !_524;
    float _858;
    if (!_840)
    {
        float _842 = in.m_53.x;
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _846 = _842 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _850 = _848 * _844;
        float _852 = floor(_850);
        float _854 = -_852;
        float _856 = _850 + _854;
        _858 = _856;
        _860 = true;
    }
    else
    {
        _858 = _156;
    }
    _860 = false;
    float _862 = _858;
    bool _864 = _862 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = isnan(_862);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _880 = _862 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _882 = isnan(_862);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _862 + _896;
    float _900 = -_874;
    float _902 = _900 + 1.0;
    bool _904 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _906 = 1.0 / _878;
    float _908 = _890 * _902;
    float _910 = -_890;
    float _912 = _910 + 1.0;
    float _914 = _894 * _906;
    float _916 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _918 = fma(_914, _898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _920 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _922 = _918 * _908;
    float _924 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _926 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[115].x, _922);
    float _928 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[116].x, _926);
    float _936 = _934 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _938 = !_904;
    float _956;
    if (!_938)
    {
        float _940 = in.m_53.x;
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _948 = _946 * _942;
        float _950 = floor(_948);
        float _952 = -_950;
        float _954 = _948 + _952;
        _956 = _954;
        _958 = true;
    }
    else
    {
        _956 = _156;
    }
    _958 = false;
    float _960 = _956;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _962;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _978;
    float _982 = 1.0 / _968;
    bool _984 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _986 = isnan(_960);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1000 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1002 = isnan(_960);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = 1.0 / _964;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1016 = _960 + _1014;
    bool _1018 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1020 = isnan(_960);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_1010;
    float _1032 = _1030 + 1.0;
    bool _1034 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1036 = isnan(_960);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = 1.0 / _976;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1050 = _960 + _1048;
    float _1052 = _1016 * _982;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1056 = _960 + _1054;
    bool _1058 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1060 = isnan(_960);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1072 = _960 + _1070;
    float _1074 = 1.0 / _972;
    float _1076 = _1050 * _1012;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1080 = _960 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1084 = _960 + _1082;
    float _1086 = 1.0 / _980;
    float _1088 = _1056 * _1046;
    float _1090 = -_994;
    float _1092 = _1090 + 1.0;
    bool _1094 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1096 = _1010 * _1092;
    float _1098 = _1080 * _1074;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1100;
    float _1104 = 1.0 / _998;
    float _1106 = fma(_1102, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1108 = _1028 * _1032;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1114 = _1084 * _1086;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1116;
    float _1120 = -_1044;
    float _1122 = _1120 + 1.0;
    float _1124 = fma(_1112, _1052, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1126 = fma(_1118, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1128 = -_1028;
    float _1130 = _1128 + 1.0;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1140 = _1044 * _1130;
    float _1142 = fma(_1134, _1052, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1144 = fma(_1138, _1052, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1146 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1148 = isnan(_960);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1072 * _1104;
    bool _1160 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1162 = isnan(_960);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = _1068 * _1122;
    float _1174 = -_1068;
    float _1176 = _1174 + 1.0;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1186;
    float _1190 = _1170 * _1176;
    float _1192 = -_1170;
    float _1194 = _1192 + 1.0;
    float _1196 = fma(_1180, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1198;
    float _1202 = fma(_1184, _1098, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1204 = _1156 * _1194;
    float _1206 = -_1156;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1200, _1098, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1212 = fma(_1188, _1098, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1214 = _1106 * _1204;
    float _1216 = _1126 * _1204;
    float _1218 = _1196 * _1204;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1214);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1216);
    float _1228 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1218);
    float _1230 = fma(_1222, _1088, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1240 = fma(_1144, _1190, _1228);
    float _1242 = fma(_1142, _1190, _1224);
    float _1244 = fma(_1124, _1190, _1226);
    float _1246 = fma(_1234, _1088, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1248 = fma(_1238, _1088, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1258;
    float _1262 = fma(_1212, _1172, _1240);
    float _1264 = fma(_1210, _1172, _1242);
    float _1266 = fma(_1202, _1172, _1244);
    float _1268 = fma(_1252, _1114, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1270 = fma(_1256, _1114, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1272 = fma(_1260, _1114, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1274 = fma(_1248, _1140, _1262);
    float _1276 = fma(_1246, _1140, _1264);
    float _1278 = fma(_1230, _1140, _1266);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1290 = _1288 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1292 = fma(_1268, _1108, _1276);
    float _1294 = fma(_1282, _1158, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1296 = fma(_1286, _1158, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1298 = fma(_1270, _1108, _1278);
    float _1300 = fma(_1290, _1158, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1302 = fma(_1272, _1108, _1274);
    float _1304 = fma(_1294, _1096, _1292);
    float _1306 = fma(_1296, _1096, _1298);
    float _1308 = fma(_1300, _1096, _1302);
    float _1310 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1304);
    float _1312 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1306);
    float _1314 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1308);
    bool _1316 = !_1094;
    float _1334;
    if (!_1316)
    {
        float _1318 = in.m_53.x;
        float _1320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1322 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1326 = _1324 * _1320;
        float _1328 = floor(_1326);
        float _1330 = -_1328;
        float _1332 = _1326 + _1330;
        _1334 = _1332;
        _1336 = true;
    }
    else
    {
        _1334 = _156;
    }
    _1336 = false;
    float _1338 = _1334;
    float _1340 = in.m_53.x;
    float _1342 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1344 = int(_1342);
    float _1346 = in.m_53.y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1350 = in.m_42.x;
    float _1352 = in.m_42.y;
    float _1354 = in.m_42.z;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1360 = _1358 != 0;
    float _1362 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1364 = in.m_53.z;
    float _1366 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1368 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1370 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1372 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1370);
    float _1374 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1380 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1382 = -_1348;
    float _1384 = fma(_1374, 2.0, _1382);
    float _1386 = _1340 * 2.0;
    float _1388 = _1346 * 2.0;
    float _1390 = fma(_1380, -2.0, _1356);
    float _1392 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1394 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1396 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1398 = floor(_1386);
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1402 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1392);
    float _1404 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1394);
    float _1406 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1396);
    float _1408 = _1340 + _1346;
    float _1410 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1400);
    float _1412 = _1364 * 2.0;
    float _1414 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1402);
    float _1416 = _1408 + (-1.0);
    float _1418 = _1346 + _1364;
    float _1420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1422 = log2(_1420);
    float _1424 = _1340 + _1364;
    float _1426 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1404);
    float _1428 = _1418 + (-1.0);
    float _1430 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1406);
    bool _1432 = _1398 > 0.0;
    float _1434 = _1424 + (-1.0);
    bool _1436 = _1398 >= 0.0;
    bool _1438 = isnan(_1398);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    float _1446 = floor(_1412);
    float _1448 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1450 = _1428;
    float _1452 = _1404;
    if (!_1360)
    {
        _1450 = _1364;
    }
    float _1454 = _1450;
    float _1456 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1458 = _1454;
    if (_1360)
    {
        _1458 = _1346;
    }
    float _1460 = _1458;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1464 = -_100;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1384);
    float _1468 = floor(_1388);
    float _1470 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1376);
    float _1472 = _1460;
    if (!_1360)
    {
        _1472 = _1364;
    }
    float _1474 = _1472;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1478 = _1474;
    if (_1360)
    {
        _1478 = _1346;
    }
    float _1480 = _1478;
    float _1482 = _1422 * _100;
    if (!_1360)
    {
        _1452 = _1346;
    }
    float _1484 = _1452;
    float _1486 = _1430 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1488 = _1446 > 0.0;
    float _1490 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1492 = _1484;
    if (_1360)
    {
        _1492 = _1340;
    }
    float _1494 = _1492;
    float _1496 = exp2(_1482);
    bool _1498 = _1446 >= 0.0;
    bool _1500 = isnan(_1446);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan(0.0);
    bool _1506 = _1502 || _1504;
    float _1508 = fma(_1490, -2.0, _1378);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1476);
    float _1512 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1514 = _1506 ? 0 : 1;
    float _1516 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1410);
    float _1518 = -_1462;
    float _1520 = fma(_1512, 2.0, _1518);
    float _1522 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1524 = int(_1522);
    int _1526 = ~_1514;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    float _1532 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1372);
    bool _1534 = _1468 >= 0.0;
    bool _1536 = isnan(_1468);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan(0.0);
    bool _1542 = _1538 || _1540;
    int _1544 = _1530;
    if (!_1488)
    {
        int _1546 = ~_1514;
        int _1548 = _1546 + 1;
        _1544 = _1548;
    }
    int _1550 = _1544;
    float _1552 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1554 = _1468 > 0.0;
    float _1556 = rsqrt(_1532);
    int _1558 = _1444 ? 0 : 1;
    bool _1560 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1562 = isnan(0.0);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1568 = _1564 || _1566;
    int _1570 = _1542 ? 0 : 1;
    int _1572 = ~_1558;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1580 = 1.0 + _1578;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1588 = _1586 != 0;
    int _1590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1592 = _1590 != 0;
    int _1594 = _1576;
    if (!_1432)
    {
        int _1596 = ~_1558;
        int _1598 = _1596 + 1;
        _1594 = _1598;
    }
    int _1600 = _1594;
    float _1602 = 1.0 / _1580;
    bool _1604 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1606 = isnan(1.0);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1612 = _1608 || _1610;
    bool _1614 = !_1588;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1620 = !_1584;
    int _1622 = _1620 ? 0 : 1;
    bool _1624 = !_1592;
    int _1626 = _1624 ? 0 : 1;
    float _1628 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1618);
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1632 = _1630 != 0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1640 = _1638 != 0;
    float _1642 = -_1496;
    float _1644 = _1642 + 1.0;
    float _1646 = float(_1524);
    float _1648 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1390);
    int _1650 = ~_1570;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = _1654;
    if (!_1554)
    {
        int _1658 = ~_1570;
        int _1660 = _1658 + 1;
        _1656 = _1660;
    }
    int _1662 = _1656;
    float _1664 = in.m_57.x;
    float _1666 = in.m_57.y;
    float _1668 = in.m_57.z;
    bool _1670 = !_1632;
    int _1672 = _1670 ? 0 : 1;
    float _1674 = 1.0 / _1646;
    bool _1676 = !_1636;
    int _1678 = _1676 ? 0 : 1;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1682 = abs(_1672);
    float _1684 = -_100;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1520);
    int _1688 = abs(_1678);
    float _1690 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1470);
    float _1692 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1680);
    float _1694 = float(_1600);
    float _1696 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1508);
    float _1698 = float(_1688);
    float _1700 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1692);
    float _1702 = float(_1682);
    float _1704 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1628);
    float _1706 = float(_1550);
    float _1708 = _1698 * _1694;
    bool _1710 = !_1640;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = _1674 * _100;
    float _1716 = float(_1344);
    float _1718 = _1702 * _1706;
    float _1720 = _1568 ? _1644 : 0.0;
    float _1722 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1510);
    float _1724 = _1716 * _100;
    int _1726 = abs(_1712);
    float _1728 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1612)
    {
        float _1730 = _1720 * _1602;
        _110 = _1730;
    }
    float _1732 = _110;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1734;
    float _1738 = _1718 * (-2.0);
    float _1740 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1742 = _1728 * _1728;
    float _1744 = _1340 + (-0.5);
    float _1746 = fma(_1738, _1664, _1664);
    float _1748 = fma(_1740, _1740, _1742);
    float _1750 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1752 = float(_1662);
    float _1754 = fma(_1552, _1738, _1552);
    float _1756 = float(_1726);
    float _1758 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1746);
    float _1760 = _1708 * (-2.0);
    float _1762 = fma(_1750, _1750, _1748);
    float _1764 = 1.0 / _1736;
    float _1766 = _1756 * _1752;
    float _1768 = fma(_1754, _1732, _1758);
    float _1770 = fma(_1448, _1760, _1448);
    float _1772 = fma(_1760, _1666, _1666);
    float _1774 = _1426 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1776 = in.m_59.x;
    float _1778 = in.m_59.y;
    float _1780 = in.m_59.z;
    float _1782 = _1414 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1784 = _1768 * 0.15915493667125701904296875;
    float _1786 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1788 = _1346 + (-0.5);
    float _1790 = _1766 * (-2.0);
    float _1792 = rsqrt(_1762);
    float _1794 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1786);
    float _1796 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1772);
    float _1798 = fma(_1456, _1790, _1456);
    float _1800 = fma(_1790, _1668, _1668);
    float _1802 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1794);
    float _1804 = fma(_1770, _1732, _1796);
    float _1806 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1808 = _1364 + (-0.5);
    float _1810 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1812 = _1804 * 0.15915493667125701904296875;
    float _1814 = _1784 * 6.283185482025146484375;
    float _1816 = sin(_1814);
    float _1818 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1800);
    float _1820 = -_1810;
    float _1822 = _1806 + _1820;
    float _1824 = fma(_1798, _1732, _1818);
    bool _1826 = _1810 >= _1806;
    bool _1828 = isnan(_1810);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(_1806);
    bool _1834 = _1830 || _1832;
    float _1836 = _1740 * _1792;
    float _1838 = abs(_1822);
    float _1840 = precise::max(_1838, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1776);
    float _1844 = _1824 * 0.15915493667125701904296875;
    float _1846 = _1784 * 6.283185482025146484375;
    float _1848 = cos(_1846);
    float _1850 = precise::min(_1840, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1852 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1780);
    bool _1856 = !_1834;
    float _1858 = _1856 ? 1.0 : (-1.0);
    float _1860 = _1728 * _1792;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1864 = _1850 + _1862;
    float _1866 = _1852 * _1842;
    float _1868 = _1812 * 6.283185482025146484375;
    float _1870 = sin(_1868);
    float _1872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1778);
    float _1874 = _1362 * _1854;
    float _1876 = _1864 * _1764;
    float _1878 = _1750 * _1792;
    float _1880 = _1366 * _1872;
    float _1882 = _1858 * _1876;
    float _1884 = _1812 * 6.283185482025146484375;
    float _1886 = cos(_1884);
    float _1888 = _1368 * _1882;
    float _1890 = _1888 * 0.15915493667125701904296875;
    float _1892 = _1844 * 6.283185482025146484375;
    float _1894 = cos(_1892);
    float _1896 = _1816 * _1870;
    float _1898 = _1848 * _1870;
    float _1900 = _1844 * 6.283185482025146484375;
    float _1902 = sin(_1900);
    float _1904 = _1816 * _1886;
    float _1906 = _1894 * _1880;
    float _1908 = _1848 * _1886;
    float _1910 = _1870 * _1894;
    float _1912 = _1886 * _1894;
    float _1914 = _1890 * 6.283185482025146484375;
    float _1916 = cos(_1914);
    float _1918 = _1848 * _1906;
    float _1920 = _1816 * _1906;
    float _1922 = fma(_1902, _1908, _1896);
    float _1924 = -_1898;
    float _1926 = fma(_1902, _1904, _1924);
    float _1928 = -_1880;
    float _1930 = _1902 * _1928;
    float _1932 = -_1904;
    float _1934 = fma(_1902, _1898, _1932);
    float _1936 = fma(_1922, _1866, _1918);
    float _1938 = _1890 * 6.283185482025146484375;
    float _1940 = sin(_1938);
    float _1942 = fma(_1912, _1866, _1930);
    float _1944 = fma(_1902, _1896, _1908);
    float _1946 = fma(_1934, _1874, _1936);
    float _1948 = fma(_1926, _1866, _1920);
    float _1950 = fma(_1910, _1874, _1942);
    float _1952 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1954 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1958 = fma(_1944, _1874, _1948);
    float _1960 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1952);
    float _1962 = -_1916;
    float _1964 = _1962 + 1.0;
    float _1966 = _1878 * _1878;
    float _1968 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1954);
    float _1970 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1956);
    float _1972 = _1836 * _1940;
    float _1974 = _1860 * _1964;
    float _1976 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1960);
    float _1978 = _1860 * _1940;
    float _1980 = fma(_1964, _1966, _1916);
    float _1982 = _1878 * _1940;
    float _1984 = _1836 * _1964;
    float _1986 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1968);
    float _1988 = fma(_1878, _1974, _1972);
    float _1990 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1992 = -_1982;
    float _1994 = fma(_1860, _1984, _1992);
    float _1996 = -_1978;
    float _1998 = fma(_1878, _1984, _1996);
    float _2000 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2002 = _1990 * _1988;
    float _2004 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1970);
    float _2006 = fma(_1836, _1984, _1916);
    float _2008 = _1990 * _1994;
    float _2010 = fma(_2000, _1998, _2002);
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2014 = fma(_1878, _1984, _1978);
    float _2016 = fma(_2000, _2006, _2008);
    float _2018 = fma(_1860, _1974, _1916);
    float _2020 = fma(_2012, _1980, _2010);
    float _2022 = fma(_1860, _1984, _1982);
    float _2024 = fma(_2012, _2014, _2016);
    float _2026 = _1990 * _2018;
    float _2028 = _1486 + _2020;
    float _2030 = -_1972;
    float _2032 = fma(_1878, _1974, _2030);
    float _2034 = _1782 + _2024;
    float _2036 = fma(_2000, _2022, _2026);
    float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2040 = _2028 + _2038;
    float _2042 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2046 = _2034 + _2044;
    float _2048 = fma(_2012, _2032, _2036);
    float _2050 = _2040 * _2040;
    float _2052 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2042);
    float _2054 = _1774 + _2048;
    float _2056 = fma(_2046, _2046, _2050);
    float _2058 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2052);
    float _2060 = sqrt(_2056);
    bool _2062 = _2060 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2064 = _2052;
    float _2066 = _1974;
    float _2068 = _2032;
    float _2070 = _2060;
    if (!_2062)
    {
        _2064 = _2034;
    }
    float _2072 = _2064;
    float _2074 = _2072;
    if (!_2062)
    {
        _2066 = _2028;
    }
    float _2076 = _2066;
    float _2078 = _2076;
    if (!_2062)
    {
        _2068 = _2054;
    }
    float _2080 = _2068;
    bool _2082 = !_2062;
    float _2084 = _2080;
    if (!_2082)
    {
        float _2086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2090 = _2060 + _2088;
        float _2092 = rsqrt(_2056);
        float _2094 = _2090 * _2086;
        float _2096 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2098 = _2094 * 0.15915493667125701904296875;
        float _2100 = _2098 * 6.283185482025146484375;
        float _2102 = cos(_2100);
        float _2104 = _2098 * 6.283185482025146484375;
        float _2106 = sin(_2104);
        float _2108 = _2102 + (-1.0);
        float _2110 = fma(_2106, _2096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2112 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = _2092 * _2110;
        float _2116 = fma(_2054, _2102, _2112);
        float _2118 = fma(_2046, _2114, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2120 = fma(_2040, _2114, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2084 = _2116;
        _2074 = _2118;
        _2078 = _2120;
    }
    float _2122 = _2084;
    float _2124 = _2074;
    float _2126 = _2078;
    float _2128 = -_1774;
    float _2130 = _2128 + _2122;
    float _2132 = -_1782;
    float _2134 = _2132 + _2124;
    float _2136 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2138 = -_1486;
    float _2140 = _2138 + _2126;
    float _2142 = _2130 * _2130;
    float _2144 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2146 = 1.0 / _2136;
    float _2148 = fma(_2134, _2134, _2142);
    float _2150 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2144);
    float _2152 = fma(_2140, _2140, _2148);
    float _2154 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2150);
    float _2156 = sqrt(_2152);
    float _2158 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2160 = _2158 + _2136;
    float _2162 = _2160 * _2146;
    float _2164 = _2162 * 0.5;
    bool _2166 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan(0.5);
    bool _2174 = _2170 || _2172;
    bool _2176 = _2156 > 0.0;
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2180 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2178);
    bool _2182 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan(0.5);
    bool _2190 = _2186 || _2188;
    float _2192 = 1.0 / _2180;
    bool _2194 = !_2176;
    float _2196 = _2126;
    float _2198 = _2124;
    float _2200 = _2122;
    float _2202 = _2140;
    float _2204 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2206 = _2152;
    float _2208 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_2194)
    {
        float _2210 = _172 * _172;
        float _2212 = rsqrt(_2152);
        float _2214 = fma(_170, _170, _2210);
        float _2216 = fma(_174, _174, _2214);
        float _2218 = sqrt(_2216);
        float _2220 = _2140 * _2212;
        bool _2222 = _2218 > 0.0;
        float _2224 = _2134 * _2212;
        float _2226 = _2130 * _2212;
        bool _2228 = !_2222;
        _2204 = _2216;
        _2070 = _2220;
        _2208 = _2212;
        if (!_2228)
        {
            float _2230 = rsqrt(_2216);
            float _2232 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2234 = _172 * _2230;
            float _2236 = _170 * _2230;
            float _2238 = _2226 * _2234;
            float _2240 = _174 * _2230;
            float _2242 = fma(_2224, _2236, _2238);
            float _2244 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2246 = fma(_2220, _2240, _2242);
            float _2248 = _2246 * _2244;
            float _2250 = fma(_170, _2248, _2124);
            float _2252 = fma(_172, _2248, _2122);
            float _2254 = fma(_174, _2248, _2126);
            _2196 = _2254;
            _2198 = _2250;
            _2200 = _2252;
            _2202 = _2248;
            _2204 = _2230;
            _2206 = _2232;
            _2208 = _2244;
        }
    }
    float _2256 = _2196;
    float _2258 = _2198;
    float _2260 = _2200;
    float _2262 = _2202;
    float _2264 = _2204;
    float _2266 = _2070;
    float _2268 = _2206;
    float _2270 = _2208;
    float _2272 = _2268;
    float _2274 = _2260;
    float _2276 = _2258;
    float _2278 = _2262;
    float _2280 = _2270;
    float _2282 = _2264;
    float _2284 = _2266;
    if (_2190)
    {
        _2272 = 1.0;
    }
    float _2286 = _2272;
    float _2288 = _2286;
    if (_2174)
    {
        _178 = _2256;
    }
    float _2290 = _178;
    float _2292 = _2290;
    if (!_2174)
    {
        float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2296 = _1774 + _2294;
        float _2298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2300 = _1782 + _2298;
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2304 = -_1782;
        float _2306 = _2304 + _2258;
        float _2308 = _2296 * _2296;
        float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2312 = _1486 + _2310;
        float _2314 = -_1486;
        float _2316 = _2314 + _2256;
        float _2318 = fma(_2300, _2300, _2308);
        float _2320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2322 = fma(_2312, _2312, _2318);
        float _2324 = sqrt(_2322);
        float _2326 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2328 = precise::min(_2324, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2330 = _2328 * _2320;
        float _2332 = _2326 * _2330;
        float _2334 = -_1774;
        float _2336 = _2334 + _2260;
        float _2338 = fma(_2306, _2332, _1782);
        float _2340 = fma(_2336, _2332, _1774);
        float _2342 = fma(_2316, _2332, _1486);
        _180 = _2302;
        _2274 = _2340;
        _2276 = _2338;
        _2292 = _2342;
        _2278 = _2332;
    }
    float _2344 = _180;
    float _2346 = _2274;
    float _2348 = _2276;
    float _2350 = _2292;
    float _2352 = _2278;
    float _2354 = _2344;
    float _2356 = _2352;
    if (_2190)
    {
        _2280 = 1.0;
    }
    float _2358 = _2280;
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2362 = _2192 * _2360;
    float _2364 = _2358;
    if (!_2190)
    {
        float _2366 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2368 = _2366 * 0.15915493667125701904296875;
        float _2370 = _2368 * 6.283185482025146484375;
        float _2372 = cos(_2370);
        float _2374 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2376 = _2374 * 0.15915493667125701904296875;
        float _2378 = _2368 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = 1.0 / _2372;
        float _2384 = _2376 * 6.283185482025146484375;
        float _2386 = cos(_2384);
        float _2388 = _2380 * _2382;
        float _2390 = _2376 * 6.283185482025146484375;
        float _2392 = sin(_2390);
        float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2394;
        float _2398 = _2386 * _2388;
        float _2400 = 1.0 / _2396;
        float _2402 = 1.0 / _2398;
        float _2404 = _2392 * _2402;
        float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2408 = fma(_2362, _2404, _2406);
        float _2410 = _2408 * _2400;
        float _2412 = precise::clamp(_2410, 0.0, 1.0);
        _2354 = _2376;
        _2356 = _2368;
        _2288 = _2412;
    }
    float _2414 = _2354;
    float _2416 = _2356;
    float _2418 = _2288;
    float _2420 = _2414;
    if (!_2190)
    {
        float _2422 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2424 = _2422 * 0.15915493667125701904296875;
        float _2426 = _2424 * 6.283185482025146484375;
        float _2428 = cos(_2426);
        float _2430 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2432 = _2430 * 0.15915493667125701904296875;
        float _2434 = _2424 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = 1.0 / _2428;
        float _2440 = _2432 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2436 * _2438;
        float _2446 = _2432 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = 1.0 / _2450;
        float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2456 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2454;
        float _2458 = 1.0 / _2456;
        float _2460 = _2448 * _2452;
        float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2464 = fma(_2362, _2460, _2462);
        float _2466 = _2464 * _2458;
        float _2468 = precise::clamp(_2466, 0.0, 1.0);
        float _2470 = -_2468;
        float _2472 = _2470 + 1.0;
        _2420 = _2438;
        _2364 = _2472;
    }
    float _2474 = _2420;
    float _2476 = _2364;
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2480 = _2346 + _2478;
    float _2482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2484 = _2348 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2488 = _2350 + _2486;
    float _2490 = _2480 * _2480;
    float _2492 = fma(_2484, _2484, _2490);
    float _2494 = fma(_2488, _2488, _2492);
    float _2496 = rsqrt(_2494);
    float _2498 = sqrt(_2494);
    float _2500 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2502 = _2484 * _2500;
    float _2504 = _2488 * _2500;
    float _2506 = _2502 * _2502;
    float _2508 = _2504 * _2504;
    float _2510 = _2506 + _2508;
    float _2512 = sqrt(_2510);
    bool _2514 = _2512 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2518 = _2512 + _2516;
    float _2520 = _2474;
    float _2522 = _2510;
    float _2524 = _2518;
    float _2526 = _2480;
    float _2528 = _2504;
    float _2530 = _2506;
    float _2532 = _2508;
    if (_2514)
    {
        float _2534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2534;
    }
    float _2536 = _2520;
    if (_2514)
    {
        float _2538 = rsqrt(_2510);
        _2522 = _2538;
    }
    float _2540 = _2522;
    if (_2514)
    {
        float _2542 = _2518 * _2536;
        _2524 = _2542;
    }
    float _2544 = _2524;
    if (_2514)
    {
        float _2546 = _2544 * 0.15915493667125701904296875;
        _2282 = _2546;
    }
    float _2548 = _2282;
    float _2550 = _2416;
    if (_2514)
    {
        float _2552 = _2548 * 6.283185482025146484375;
        float _2554 = sin(_2552);
        _2550 = _2554;
    }
    float _2556 = _2550;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2560 = precise::max(0.0, _2558);
    float _2562 = _2536;
    float _2564 = _2560;
    if (_2514)
    {
        float _2566 = _2548 * 6.283185482025146484375;
        float _2568 = cos(_2566);
        _2562 = _2568;
    }
    float _2570 = _2562;
    float _2572 = -_2500;
    float _2574 = -_2560;
    float _2576 = fma(_2480, _2572, _2574);
    if (_2514)
    {
        float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2526 = _2578;
    }
    float _2580 = _2526;
    float _2582 = _2580;
    float _2584 = _2556;
    if (_2514)
    {
        float _2586 = fma(_2556, _2580, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2564 = _2586;
    }
    float _2588 = _2564;
    float _2590 = _2588;
    if (!_2514)
    {
        _2582 = _2502;
    }
    float _2592 = _2582;
    float _2594 = _2592;
    if (_2514)
    {
        float _2596 = _2570 + (-1.0);
        _2584 = _2596;
    }
    float _2598 = _2584;
    float _2600 = _2598;
    if (_2514)
    {
        float _2602 = _2540 * _2588;
        _2284 = _2602;
    }
    float _2604 = _2284;
    if (!_2514)
    {
        _2590 = _2576;
    }
    float _2606 = _2590;
    float _2608 = _2606;
    if (_2514)
    {
        float _2610 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2600 = _2610;
    }
    float _2612 = _2600;
    if (_2514)
    {
        float _2614 = _2502 * _2604;
        _2594 = _2614;
    }
    float _2616 = _2594;
    if (_2514)
    {
        float _2618 = _2504 * _2604;
        _2528 = _2618;
    }
    float _2620 = _2528;
    if (_2514)
    {
        float _2622 = fma(_2576, _2570, _2612);
        _2608 = _2622;
    }
    float _2624 = _2608;
    if (_2514)
    {
        float _2626 = _2616 * _2616;
        _2530 = _2626;
    }
    float _2628 = _2530;
    if (_2514)
    {
        float _2630 = _2620 * _2620;
        _2532 = _2630;
    }
    float _2632 = _2532;
    float _2634 = fma(_2624, _2624, _2628);
    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2638 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2636);
    float _2640 = precise::clamp(_2638, 0.0, 1.0);
    float _2642 = _2634 + _2632;
    float _2644 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2646 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2648 = -_2640;
    float _2650 = _2648 + 1.0;
    float _2652 = rsqrt(_2642);
    float _2654 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2644);
    float _2656 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2660 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2654);
    float _2662 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2646);
    float _2664 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2666 = abs(_2650);
    float _2668 = log2(_2666);
    float _2670 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2656);
    float _2672 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2662);
    float _2674 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2664);
    float _2676 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2678 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2670);
    float _2680 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2682 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2674);
    float _2684 = _2652 * _2616;
    float _2686 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2688 = _2652 * _2624;
    float _2690 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2692 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2694 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2696 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2698 = _2652 * _2620;
    float _2700 = -_2692;
    float _2702 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2700);
    float _2704 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2694);
    float _2706 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2708 = -_2696;
    float _2710 = fma(_2708, _2658, 1.0);
    float _2712 = -_2698;
    float _2714 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2702);
    float _2716 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2704);
    float _2718 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2720 = log2(_2710);
    float _2722 = fma(_2714, -0.5, 0.5);
    float _2724 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2716);
    float _2726 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2728 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2718);
    float _2730 = fma(_2714, 0.5, 0.5);
    float _2732 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2726);
    float _2734 = exp2(_2706);
    float _2736 = _2688 + 1.0;
    float _2738 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2728);
    float _2740 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2732);
    float _2742 = fma(_2730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2744 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2740);
    float _2746 = 1.0 / _2724;
    float _2748 = fma(_2730, _2742, -0.212114393711090087890625);
    float _2750 = fma(_2730, _2748, 1.570728778839111328125);
    float _2752 = sqrt(_2722);
    float _2754 = -_2688;
    float _2756 = fma(_2734, _2736, _2754);
    float _2758 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2738);
    float _2760 = _2720 * 0.693147182464599609375;
    float _2762 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2764 = _2758 * _2746;
    float _2766 = _2744 * _2746;
    float _2768 = fma(_2764, 0.5, 0.5);
    float _2770 = fma(_2766, -0.5, 0.5);
    float _2772 = fma(_2756, 0.5, 0.5);
    float _2774 = _2752 * 0.636619746685028076171875;
    float _2776 = -_2750;
    float _2778 = fma(_2774, _2776, 1.0);
    float3 _7949 = float3(_2768, _2770, _2762);
    float _2780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7949, float3(0.0), isnan(_7949)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7949, float3(0.0), isnan(_7949)), level(0.0)).x;
    float3 _7960 = float3(_2768, _2770, _2762);
    float4 _2783 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7960, float3(0.0), isnan(_7960)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7960, float3(0.0), isnan(_7960)), level(0.0)).xyzw;
    float _2785 = _2783.x;
    float _2787 = _2783.y;
    float _2789 = _2783.z;
    float _2791 = _2783.w;
    float2 _7977 = float2(_2778, _2772);
    float3 _2795 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7977, float2(0.0), isnan(_7977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7977, float2(0.0), isnan(_7977)), level(0.0)).xyz;
    float _2797 = _2795.x;
    float _2799 = _2795.y;
    float _2801 = _2795.z;
    float _2803 = float(uint(_1344));
    float _2805 = trunc(_1714);
    int _2807 = int(_2805);
    int _2809 = ~_1344;
    int _2811 = _2809 + 1;
    float _2813 = _1724 * _152;
    int _2815 = ~_1344;
    int _2817 = _2815 + 1;
    out.m_61.x = _928;
    out.m_61.y = _930;
    out.m_61.z = _932;
    out.m_61.w = _936;
    int _2819 = _1344 + (-1);
    float _2821 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2823 = abs(_1616);
    float _2825 = 1.0 / _2803;
    float _2827 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2829 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2827);
    bool _2831 = !_1360;
    float _2833 = _2831 ? 7.345489978790283203125 : 1.0;
    float _2835 = float(uint(_2807));
    float _2837 = trunc(_2813);
    int _2839 = int(_2837);
    float _2841 = float(_2807);
    float _2843 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2829);
    float _2845 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2843);
    int _2847 = as_type<int>(_2825) + (-2);
    float _2849 = exp2(_2821);
    float _2851 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2851;
    float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2857 = _2855 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2859 = as_type<float>(_2847) * _2835;
    out.gl_Position.x = _2758;
    out.gl_Position.y = _2744;
    out.gl_Position.z = _2845;
    out.gl_Position.w = _2724;
    float _2861 = trunc(_2859);
    float _2863 = precise::max(_2861, 0.0);
    uint _2866 = uint(_2863);
    float _2868 = -_2849;
    float _2870 = _2868 + 1.0;
    int _2872 = _2811 * int(_2866);
    int _2874 = _2872 + _2807;
    float _2876 = float(uint(_2874));
    float _2878 = as_type<float>(_2847) * _2876;
    float _2880 = _2833 * _1340;
    bool _2882 = _2841 >= _1716;
    bool _2884 = isnan(_2841);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan(_1716);
    bool _2890 = _2886 || _2888;
    float _2892 = float(_2890);
    float _2894 = floor(_2880);
    float _2896 = trunc(_2878);
    float _2898 = precise::max(_2896, 0.0);
    uint _2900 = uint(_2898);
    float _2902 = trunc(_2892);
    int _2904 = int(_2902);
    float _2906 = -_2894;
    float _2908 = _2880 + _2906;
    int _2910 = int(_2866) + int(_2900);
    int _2912 = _2817 * _2910;
    int _2914 = _2912 + _2807;
    int _2916 = ~_2904;
    int _2918 = _2916 + 1;
    int _2920 = _2918 + 1;
    bool _2922 = uint(_2914) >= uint(_1344);
    bool _2924 = !_2922;
    int _2926 = _2924 ? 0 : (-1);
    bool _2928 = _1344 == 0;
    int _2930 = ~_2910;
    int _2932 = _2930 + _2926;
    int _2934 = _2932 + 1;
    float _2936 = _2908 * _1716;
    int _2938 = _1344 * _2934;
    int _2940 = _2938 + _2807;
    int _2942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2944 = _2942 != 0;
    float _2946 = trunc(_2936);
    int _2948 = int(_2946);
    int _2950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2952 = _2950 != 0;
    bool _2954 = !_2928;
    int _2956 = _2954 ? _2940 : (-1);
    bool _2958 = !_2944;
    int _2960 = _2958 ? 0 : 1;
    int _2962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2964 = _2962 != 0;
    int _2966 = _2956 * _2920;
    int _2968 = abs(_2960);
    int _2970 = abs(_1622);
    int _2972 = _2904 * _2819;
    int _2974 = _2972 + _2966;
    int _2976 = abs(_1626);
    int _2978 = _2974 * _2823;
    bool _2980 = !_2964;
    int _2982 = _2980 ? 0 : 1;
    int _2984 = _2948 * _2968;
    int _2986 = _2984 + _2807;
    int _2988 = abs(_2982);
    int _2990 = _2839 * _2970;
    int _2992 = _2990 + _2978;
    int _2994 = _2986 * _2976;
    int _2996 = _2994 + _2992;
    float _2998 = in.m_53.w;
    int _3000 = _2948 * _2988;
    int _3002 = _3000 + _2996;
    float _3004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3006 = _3004 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3008 = in.m_63.y;
    int _3010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3012 = _3010 != 0;
    float _3014 = float(uint(_3002));
    float _3016 = 1.0 / _3006;
    int _3018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3020 = _3018 != 0;
    float _3022 = as_type<float>(_2847) * _3014;
    int _3024 = ~_1344;
    int _3026 = _3024 + 1;
    int _3028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3030 = _3028 != 0;
    int _3032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3034 = _3032 != 0;
    float _3036 = trunc(_3022);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    bool _3042 = _2998 > 0.5;
    float _3044 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3050 = _3026 * int(_3040);
    int _3052 = _3050 + _3002;
    float _3054 = 1.0 / _3046;
    float _3056 = float(uint(_3052));
    float _3058 = _3048 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3060 = as_type<float>(_2847) * _3056;
    float _3062 = -_3008;
    float _3064 = _3062 + 1.0;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _3066 = trunc(_3060);
    float _3068 = precise::max(_3066, 0.0);
    uint _3070 = uint(_3068);
    int _3072 = _3042 ? as_type<int>(_3064) : as_type<int>(_3008);
    float _3074 = _2857 * _3054;
    bool _3076 = _1346 > 0.5;
    int _3078 = ~_1344;
    int _3080 = _3078 + 1;
    float _3082 = _3020 ? as_type<float>(_3072) : _3008;
    float _3084 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3086 = _3084 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _3088 = _2853 * _3016;
    float _3090 = _3008;
    bool _3092 = _3020;
    bool _3094 = _2952;
    int _3096 = as_type<int>(_2936);
    if (_2952)
    {
        float _3098 = _3076 ? _3064 : _3008;
        _3090 = _3098;
    }
    float _3100 = _3090;
    float _3102 = 1.0 / _3086;
    if (_3012)
    {
        bool _3104 = _1340 > 0.5;
        _3092 = _3104;
    }
    bool _3106 = _3092;
    float _3108 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3110 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _3108;
    int _3112 = int(_3040) + int(_3070);
    float _3114 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3116 = _1338 + _3114;
    float _3118 = float(uint(_2986));
    float _3120 = fma(_3082, _3058, -0.5);
    if (_3030)
    {
        bool _3122 = _1364 > 0.5;
        _3094 = _3122;
    }
    bool _3124 = _3094;
    int _3126 = _3080 * _3112;
    int _3128 = _3126 + _3002;
    float _3130 = fma(_3088, _3116, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _3132 = as_type<float>(_2847) * _3118;
    float _3134 = in.m_63.x;
    float _3136 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _3100, -0.5);
    bool _3138 = uint(_3128) >= uint(_1344);
    float _3140 = trunc(_3132);
    float _3142 = precise::max(_3140, 0.0);
    uint _3144 = uint(_3142);
    int _3146 = ~_1344;
    int _3148 = _3146 + 1;
    float _3150 = _3110 * _3102;
    bool _3152 = !_3138;
    int _3154 = _3152 ? 0 : (-1);
    float _3156 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3158 = _1338 + _3156;
    float _3160 = -_1696;
    float _3162 = fma(_1690, _3120, _3160);
    int _3164 = ~_1344;
    int _3166 = _3164 + 1;
    float _3168 = -_1648;
    float _3170 = fma(_1704, _3136, _3168);
    int _3172 = ~_3112;
    int _3174 = _3172 + _3154;
    int _3176 = _3174 + 1;
    float _3178 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3180 = _1338 + _3178;
    bool _3182 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3184 = isnan(_1338);
    bool _3186 = _3182 || _3184;
    bool _3188 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3190 = _3186 || _3188;
    float _3192 = float(_3190);
    float _3194 = fma(_3074, _3158, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3196 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3198 = isnan(_1338);
    bool _3200 = _3196 || _3198;
    bool _3202 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3204 = _3200 || _3202;
    float _3206 = float(_3204);
    int _3208 = _1344 * _3176;
    int _3210 = _3208 + _3002;
    float _3212 = fma(_3150, _3180, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _3214 = -_3192;
    float _3216 = _3214 + 1.0;
    bool _3218 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3220 = isnan(_1338);
    bool _3222 = _3218 || _3220;
    bool _3224 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3226 = _3222 || _3224;
    float _3228 = float(_3226);
    int _3230 = _3148 * int(_3144);
    int _3232 = _3230 + _2986;
    bool _3234 = !_2928;
    int _3236 = _3234 ? _3210 : (-1);
    float _3238 = _3206 * _3216;
    float _3240 = -_3206;
    float _3242 = _3240 + 1.0;
    bool _3244 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3246 = isnan(_1338);
    bool _3248 = _3244 || _3246;
    bool _3250 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3252 = _3248 || _3250;
    float _3254 = float(_3252);
    if (_3030)
    {
        float _3256 = -_3134;
        float _3258 = _3256 + 1.0;
        _3096 = as_type<int>(_3258);
    }
    int _3260 = _3096;
    int _3262 = _3236 >> 31;
    float _3264 = float(uint(_3232));
    float _3266 = _3228 * _3242;
    int _3268 = _3262 & 3;
    float _3270 = -_3228;
    float _3272 = _3270 + 1.0;
    float _3274 = as_type<float>(_2847) * _3264;
    int _3276 = _3236 + _3268;
    float _3278 = _3254 * _3272;
    float _3280 = -_3254;
    float _3282 = _3280 + 1.0;
    float _3284 = trunc(_3274);
    float _3286 = precise::max(_3284, 0.0);
    uint _3288 = uint(_3286);
    int _3290 = _3276 >> 2;
    float _3292 = _3130 * _3278;
    float _3294 = as_type<float>(_3268);
    float _3296 = as_type<float>(_3290);
    int _3298 = as_type<int>(_3274);
    if (!_3012)
    {
        _3294 = _3134;
    }
    float _3300 = _3294;
    int _3302 = _3290 << 4;
    int _3304 = _3302 + 368;
    float _3306 = fma(_3282, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3292);
    float _3308 = _3300;
    if (!_3030)
    {
        _3296 = _3134;
    }
    float _3310 = _3296;
    float _3312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3314 = uint(int(uint(_3304) >> uint(2)));
    uint _3316 = uint(int(uint(int(_3314)) >> uint(2)));
    int _3318 = int(_3314) & 3;
    float _3320 = (*spvDescriptorSet0.vp_c9)._m0[int(_3316)][_3318];
    int _3322 = int(_3314) + 1;
    uint _3324 = uint(int(uint(_3322) >> uint(2)));
    int _3326 = _3322 & 3;
    float _3328 = (*spvDescriptorSet0.vp_c9)._m0[int(_3324)][_3326];
    float _3330 = _3310;
    if (_3012)
    {
        float _3332 = -_3134;
        float _3334 = _3332 + 1.0;
        _3298 = as_type<int>(_3334);
    }
    int _3336 = _3298;
    if (_3030)
    {
        float _3338 = _3124 ? as_type<float>(_3260) : _3134;
        _3330 = _3338;
    }
    float _3340 = _3330;
    float _3342 = fma(_3194, _3266, _3306);
    int _3344 = _3236 & 3;
    bool _3346 = _3344 != 0;
    if (_3012)
    {
        float _3348 = _3106 ? as_type<float>(_3336) : _3134;
        _3308 = _3348;
    }
    float _3350 = _3308;
    float _3352 = fma(_3212, _3238, _3342);
    int _3354 = _3304 + 8;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    uint _3358 = uint(int(uint(int(_3356)) >> uint(2)));
    int _3360 = int(_3356) & 3;
    float _3362 = (*spvDescriptorSet0.vp_c9)._m0[int(_3358)][_3360];
    int _3364 = int(_3356) + 1;
    uint _3366 = uint(int(uint(_3364) >> uint(2)));
    int _3368 = _3364 & 3;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[int(_3366)][_3368];
    int _3372 = _3236 & 3;
    bool _3374 = _3372 != 0;
    bool _3376 = uint(_3344) > 1u;
    float _3378 = fma(_3350, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3380 = _3312 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3382 = _3374 ? 0 : 1;
    bool _3384 = _3344 != 3;
    float _3386 = fma(_3380, _3340, -0.5);
    int _3388 = int(_3144) + int(_3288);
    float _3390 = fma(_1700, _3378, _1466);
    bool _3392 = uint(_3344) >= 2u;
    float _3394 = fma(_1722, _3386, _1686);
    int _3396 = _3166 * _3388;
    int _3398 = _3396 + _2986;
    int _3400 = ~_3382;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    float _3406 = _3394 + 0.5;
    int _3408 = _3392 ? 0 : 1;
    int _3410 = _3404;
    if (!_3376)
    {
        int _3412 = ~_3382;
        int _3414 = _3412 + 1;
        _3410 = _3414;
    }
    int _3416 = _3410;
    bool _3418 = uint(_3398) >= uint(_1344);
    bool _3420 = !_3346;
    int _3422 = _3420 ? 0 : 1;
    int _3424 = ~_3408;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    int _3430 = abs(_3416);
    bool _3432 = _3344 != 3;
    int _3434 = _3428;
    if (_3384)
    {
        int _3436 = ~_3408;
        int _3438 = _3436 + 1;
        _3434 = _3438;
    }
    int _3440 = _3434;
    int _3442 = abs(_3422);
    bool _3444 = !_3432;
    int _3446 = _3444 ? 0 : (-1);
    int _3448 = ~_3430;
    int _3450 = _3448 + 1;
    int _3452 = _3450 + 1;
    int _3454 = abs(_3440);
    int _3456 = abs(_3446);
    int _3458 = _3452 * as_type<int>(_3328);
    int _3460 = ~_3442;
    int _3462 = _3460 + 1;
    int _3464 = _3462 + 1;
    bool _3466 = !_3034;
    int _3468 = _3466 ? 0 : 1;
    int _3470 = _3464 * as_type<int>(_3320);
    int _3472 = _3470 + _3458;
    int _3474 = ~_3454;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    bool _3480 = !_3418;
    int _3482 = _3480 ? 0 : (-1);
    int _3484 = abs(_3468);
    int _3486 = _3478 * as_type<int>(_3362);
    int _3488 = _3486 + _3472;
    int _3490 = ~_3456;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    float _3496 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3498 = ~_3388;
    int _3500 = _3498 + _3482;
    int _3502 = _3500 + 1;
    int _3504 = ~_3484;
    int _3506 = _3504 + 1;
    int _3508 = _3506 + 1;
    int _3510 = _3494 * as_type<int>(_3370);
    int _3512 = _3510 + _3488;
    float _3514 = fma(_3192, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3352);
    int _3516 = _1344 * _3502;
    int _3518 = _3516 + _2986;
    float _3520 = _3170 + 0.5;
    float _3522 = _3162 + 0.5;
    float _3524 = _3390 + 0.5;
    int _3526 = _3512 * _3508;
    float _3528 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3530 = !_2928;
    int _3532 = _3530 ? _3518 : (-1);
    float _3534 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3536 = _2418 * _2476;
    out.m_67.x = _3524;
    out.m_67.y = _3520;
    out.m_67.z = _3406;
    out.m_67.w = _3522;
    float _3538 = _3528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3540 = _3534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3542 = _3496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3544 = _3514 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3546 = _3532 * _3484;
    int _3548 = _3546 + _3526;
    bool _3550 = _2418 > 0.0;
    bool _3552 = isnan(_2418);
    bool _3554 = _3550 || _3552;
    bool _3556 = isnan(0.0);
    bool _3558 = _3554 || _3556;
    float _3560 = _3536 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _3538;
    out.m_69.y = _3540;
    out.m_69.z = _3542;
    out.m_69.w = _3544;
    bool _3562 = _2476 <= 0.0;
    bool _3564 = !_3558;
    bool _3566 = _3562 || _3564;
    float _3568 = _3560 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3570 = float(_3548);
    float _3572 = _2845 + _2724;
    float _3574 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3568;
    float _3576 = _3572 * 0.5;
    float _3578 = _3574 * _2780;
    out.m_71.x = _3570;
    float _3580 = _2801 * _3578;
    float _3582 = _2791 * _3578;
    float _3584 = -_3574;
    float _3586 = _3584 + 1.0;
    out.m_73.z = _3576;
    out.m_73.w = _2724;
    float _3588 = fma(_2797, _3582, _2785);
    float _3590 = fma(_2799, _3582, _2787);
    float _3592 = _2791 * _3586;
    float _3594 = fma(_2791, _3580, _2789);
    out.m_75.x = _3588;
    out.m_75.y = _3590;
    out.m_75.z = _3594;
    out.m_75.w = _3592;
    if (!_3566)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3596 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3596;
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
    bool _1336 = false;
    bool _958 = false;
    bool _860 = false;
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
        float _3665 = as_type<float>(_118);
        out.gl_Position.z = _3665;
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
        float _3720 = as_type<float>(_144);
        out.gl_Position.z = _3720;
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
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _506 = 1.0 / _486;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _510 = _472 + _508;
    bool _512 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _514 = isnan(_472);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = 1.0 / _504;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _530 = _472 + _528;
    float _532 = _446 * _476;
    float _534 = _510 * _496;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _538 = _472 + _536;
    bool _540 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _542 = isnan(_472);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _554 = _472 + _552;
    float _556 = _448 * _478;
    float _558 = 1.0 / _494;
    float _560 = _530 * _506;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _564 = _472 + _562;
    bool _566 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _568 = isnan(_472);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _582;
    float _586 = _444 * _474;
    float _588 = 1.0 / _500;
    float _590 = _538 * _526;
    float _592 = -_550;
    float _594 = _592 + 1.0;
    float _596 = -_576;
    float _598 = _596 + 1.0;
    float _600 = _576 * _594;
    float _602 = fma(_580, _534, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _604 = 1.0 / _490;
    float _606 = _554 * _558;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _616 = fma(_610, _534, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _618 = fma(_614, _560, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _622 = _472 + _620;
    float _624 = _622 * _588;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _626;
    float _630 = _564 * _604;
    bool _632 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _634 = isnan(_472);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = fma(_628, _534, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _646 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _648 = isnan(_472);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = fma(_584, _630, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _660 = -_642;
    float _662 = _660 + 1.0;
    float _664 = _642 * _598;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = _656 * _662;
    bool _676 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _678 = isnan(_472);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_656;
    float _690 = _688 + 1.0;
    bool _692 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _694 = isnan(_472);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = fma(_672, _560, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _706 = fma(_668, _560, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _708 = _522 * _690;
    float _710 = -_686;
    float _712 = _710 + 1.0;
    float _714 = -_522;
    float _716 = _714 + 1.0;
    float _718 = _702 * _712;
    float _720 = _686 * _716;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _726;
    float _730 = _602 * _718;
    float _732 = _616 * _718;
    float _734 = -_702;
    float _736 = _734 + 1.0;
    float _738 = _644 * _718;
    float _740 = fma(_724, _630, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _742 = fma(_728, _630, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[107].x, _730);
    float _758 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[107].y, _732);
    float _760 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[107].z, _738);
    float _762 = fma(_746, _606, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _764 = fma(_750, _606, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _766 = fma(_754, _606, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _768 = fma(_704, _720, _756);
    float _770 = fma(_706, _720, _758);
    float _772 = fma(_618, _720, _760);
    float _774 = fma(_740, _708, _768);
    float _776 = fma(_658, _708, _772);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _778;
    float _782 = fma(_742, _708, _770);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _788;
    float _792 = fma(_780, _624, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _794 = fma(_786, _624, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _796 = fma(_762, _674, _774);
    float _798 = fma(_790, _624, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _800 = fma(_766, _674, _776);
    float _802 = fma(_764, _674, _782);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _816 = fma(_792, _664, _796);
    float _818 = fma(_806, _590, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _820 = fma(_810, _590, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _822 = fma(_814, _590, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _824 = fma(_794, _664, _802);
    float _826 = fma(_798, _664, _800);
    float _828 = fma(_818, _600, _816);
    float _830 = fma(_820, _600, _824);
    float _832 = fma(_822, _600, _826);
    float _834 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[113].x, _828);
    float _836 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[113].y, _830);
    float _838 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[113].z, _832);
    bool _840 = !_524;
    float _858;
    if (!_840)
    {
        float _842 = in.m_53.x;
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _846 = _842 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _850 = _848 * _844;
        float _852 = floor(_850);
        float _854 = -_852;
        float _856 = _850 + _854;
        _858 = _856;
        _860 = true;
    }
    else
    {
        _858 = _156;
    }
    _860 = false;
    float _862 = _858;
    bool _864 = _862 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = isnan(_862);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _880 = _862 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _882 = isnan(_862);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _862 + _896;
    float _900 = -_874;
    float _902 = _900 + 1.0;
    bool _904 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _906 = 1.0 / _878;
    float _908 = _890 * _902;
    float _910 = -_890;
    float _912 = _910 + 1.0;
    float _914 = _894 * _906;
    float _916 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _918 = fma(_914, _898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _920 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _922 = _918 * _908;
    float _924 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _926 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[115].x, _922);
    float _928 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[116].x, _926);
    float _936 = _934 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _938 = !_904;
    float _956;
    if (!_938)
    {
        float _940 = in.m_53.x;
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _948 = _946 * _942;
        float _950 = floor(_948);
        float _952 = -_950;
        float _954 = _948 + _952;
        _956 = _954;
        _958 = true;
    }
    else
    {
        _956 = _156;
    }
    _958 = false;
    float _960 = _956;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _962;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _978;
    float _982 = 1.0 / _968;
    bool _984 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _986 = isnan(_960);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1000 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1002 = isnan(_960);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = 1.0 / _964;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1016 = _960 + _1014;
    bool _1018 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1020 = isnan(_960);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_1010;
    float _1032 = _1030 + 1.0;
    bool _1034 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1036 = isnan(_960);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = 1.0 / _976;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1050 = _960 + _1048;
    float _1052 = _1016 * _982;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1056 = _960 + _1054;
    bool _1058 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1060 = isnan(_960);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1072 = _960 + _1070;
    float _1074 = 1.0 / _972;
    float _1076 = _1050 * _1012;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1080 = _960 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1084 = _960 + _1082;
    float _1086 = 1.0 / _980;
    float _1088 = _1056 * _1046;
    float _1090 = -_994;
    float _1092 = _1090 + 1.0;
    bool _1094 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1096 = _1010 * _1092;
    float _1098 = _1080 * _1074;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1100;
    float _1104 = 1.0 / _998;
    float _1106 = fma(_1102, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1108 = _1028 * _1032;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1114 = _1084 * _1086;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1116;
    float _1120 = -_1044;
    float _1122 = _1120 + 1.0;
    float _1124 = fma(_1112, _1052, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1126 = fma(_1118, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1128 = -_1028;
    float _1130 = _1128 + 1.0;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1140 = _1044 * _1130;
    float _1142 = fma(_1134, _1052, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1144 = fma(_1138, _1052, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1146 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1148 = isnan(_960);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1072 * _1104;
    bool _1160 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1162 = isnan(_960);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = _1068 * _1122;
    float _1174 = -_1068;
    float _1176 = _1174 + 1.0;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1186;
    float _1190 = _1170 * _1176;
    float _1192 = -_1170;
    float _1194 = _1192 + 1.0;
    float _1196 = fma(_1180, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1198;
    float _1202 = fma(_1184, _1098, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1204 = _1156 * _1194;
    float _1206 = -_1156;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1200, _1098, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1212 = fma(_1188, _1098, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1214 = _1106 * _1204;
    float _1216 = _1126 * _1204;
    float _1218 = _1196 * _1204;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1214);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1216);
    float _1228 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1218);
    float _1230 = fma(_1222, _1088, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1240 = fma(_1144, _1190, _1228);
    float _1242 = fma(_1142, _1190, _1224);
    float _1244 = fma(_1124, _1190, _1226);
    float _1246 = fma(_1234, _1088, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1248 = fma(_1238, _1088, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1258;
    float _1262 = fma(_1212, _1172, _1240);
    float _1264 = fma(_1210, _1172, _1242);
    float _1266 = fma(_1202, _1172, _1244);
    float _1268 = fma(_1252, _1114, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1270 = fma(_1256, _1114, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1272 = fma(_1260, _1114, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1274 = fma(_1248, _1140, _1262);
    float _1276 = fma(_1246, _1140, _1264);
    float _1278 = fma(_1230, _1140, _1266);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1290 = _1288 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1292 = fma(_1268, _1108, _1276);
    float _1294 = fma(_1282, _1158, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1296 = fma(_1286, _1158, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1298 = fma(_1270, _1108, _1278);
    float _1300 = fma(_1290, _1158, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1302 = fma(_1272, _1108, _1274);
    float _1304 = fma(_1294, _1096, _1292);
    float _1306 = fma(_1296, _1096, _1298);
    float _1308 = fma(_1300, _1096, _1302);
    float _1310 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1304);
    float _1312 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1306);
    float _1314 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1308);
    bool _1316 = !_1094;
    float _1334;
    if (!_1316)
    {
        float _1318 = in.m_53.x;
        float _1320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1322 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1326 = _1324 * _1320;
        float _1328 = floor(_1326);
        float _1330 = -_1328;
        float _1332 = _1326 + _1330;
        _1334 = _1332;
        _1336 = true;
    }
    else
    {
        _1334 = _156;
    }
    _1336 = false;
    float _1338 = _1334;
    float _1340 = in.m_53.x;
    float _1342 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1344 = int(_1342);
    float _1346 = in.m_53.y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1350 = in.m_42.x;
    float _1352 = in.m_42.y;
    float _1354 = in.m_42.z;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1360 = _1358 != 0;
    float _1362 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1364 = in.m_53.z;
    float _1366 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1368 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1370 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1372 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1370);
    float _1374 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1380 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1382 = -_1348;
    float _1384 = fma(_1374, 2.0, _1382);
    float _1386 = _1340 * 2.0;
    float _1388 = _1346 * 2.0;
    float _1390 = fma(_1380, -2.0, _1356);
    float _1392 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1394 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1396 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1398 = floor(_1386);
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1402 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1392);
    float _1404 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1394);
    float _1406 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1396);
    float _1408 = _1340 + _1346;
    float _1410 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1400);
    float _1412 = _1364 * 2.0;
    float _1414 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1402);
    float _1416 = _1408 + (-1.0);
    float _1418 = _1346 + _1364;
    float _1420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1422 = log2(_1420);
    float _1424 = _1340 + _1364;
    float _1426 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1404);
    float _1428 = _1418 + (-1.0);
    float _1430 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1406);
    bool _1432 = _1398 > 0.0;
    float _1434 = _1424 + (-1.0);
    bool _1436 = _1398 >= 0.0;
    bool _1438 = isnan(_1398);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    float _1446 = floor(_1412);
    float _1448 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1450 = _1428;
    float _1452 = _1404;
    if (!_1360)
    {
        _1450 = _1364;
    }
    float _1454 = _1450;
    float _1456 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1458 = _1454;
    if (_1360)
    {
        _1458 = _1346;
    }
    float _1460 = _1458;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1464 = -_100;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1384);
    float _1468 = floor(_1388);
    float _1470 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1376);
    float _1472 = _1460;
    if (!_1360)
    {
        _1472 = _1364;
    }
    float _1474 = _1472;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1478 = _1474;
    if (_1360)
    {
        _1478 = _1346;
    }
    float _1480 = _1478;
    float _1482 = _1422 * _100;
    if (!_1360)
    {
        _1452 = _1346;
    }
    float _1484 = _1452;
    float _1486 = _1430 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1488 = _1446 > 0.0;
    float _1490 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1492 = _1484;
    if (_1360)
    {
        _1492 = _1340;
    }
    float _1494 = _1492;
    float _1496 = exp2(_1482);
    bool _1498 = _1446 >= 0.0;
    bool _1500 = isnan(_1446);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan(0.0);
    bool _1506 = _1502 || _1504;
    float _1508 = fma(_1490, -2.0, _1378);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1476);
    float _1512 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1514 = _1506 ? 0 : 1;
    float _1516 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1410);
    float _1518 = -_1462;
    float _1520 = fma(_1512, 2.0, _1518);
    float _1522 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1524 = int(_1522);
    int _1526 = ~_1514;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    float _1532 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1372);
    bool _1534 = _1468 >= 0.0;
    bool _1536 = isnan(_1468);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan(0.0);
    bool _1542 = _1538 || _1540;
    int _1544 = _1530;
    if (!_1488)
    {
        int _1546 = ~_1514;
        int _1548 = _1546 + 1;
        _1544 = _1548;
    }
    int _1550 = _1544;
    float _1552 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1554 = _1468 > 0.0;
    float _1556 = rsqrt(_1532);
    int _1558 = _1444 ? 0 : 1;
    bool _1560 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1562 = isnan(0.0);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1568 = _1564 || _1566;
    int _1570 = _1542 ? 0 : 1;
    int _1572 = ~_1558;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1580 = 1.0 + _1578;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1588 = _1586 != 0;
    int _1590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1592 = _1590 != 0;
    int _1594 = _1576;
    if (!_1432)
    {
        int _1596 = ~_1558;
        int _1598 = _1596 + 1;
        _1594 = _1598;
    }
    int _1600 = _1594;
    float _1602 = 1.0 / _1580;
    bool _1604 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1606 = isnan(1.0);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1612 = _1608 || _1610;
    bool _1614 = !_1588;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1620 = !_1584;
    int _1622 = _1620 ? 0 : 1;
    bool _1624 = !_1592;
    int _1626 = _1624 ? 0 : 1;
    float _1628 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1618);
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1632 = _1630 != 0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1640 = _1638 != 0;
    float _1642 = -_1496;
    float _1644 = _1642 + 1.0;
    float _1646 = float(_1524);
    float _1648 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1390);
    int _1650 = ~_1570;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = _1654;
    if (!_1554)
    {
        int _1658 = ~_1570;
        int _1660 = _1658 + 1;
        _1656 = _1660;
    }
    int _1662 = _1656;
    float _1664 = in.m_57.x;
    float _1666 = in.m_57.y;
    float _1668 = in.m_57.z;
    bool _1670 = !_1632;
    int _1672 = _1670 ? 0 : 1;
    float _1674 = 1.0 / _1646;
    bool _1676 = !_1636;
    int _1678 = _1676 ? 0 : 1;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1682 = abs(_1672);
    float _1684 = -_100;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1520);
    int _1688 = abs(_1678);
    float _1690 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1470);
    float _1692 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1680);
    float _1694 = float(_1600);
    float _1696 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1508);
    float _1698 = float(_1688);
    float _1700 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1692);
    float _1702 = float(_1682);
    float _1704 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1628);
    float _1706 = float(_1550);
    float _1708 = _1698 * _1694;
    bool _1710 = !_1640;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = _1674 * _100;
    float _1716 = float(_1344);
    float _1718 = _1702 * _1706;
    float _1720 = _1568 ? _1644 : 0.0;
    float _1722 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1510);
    float _1724 = _1716 * _100;
    int _1726 = abs(_1712);
    float _1728 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1612)
    {
        float _1730 = _1720 * _1602;
        _110 = _1730;
    }
    float _1732 = _110;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1734;
    float _1738 = _1718 * (-2.0);
    float _1740 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1742 = _1728 * _1728;
    float _1744 = _1340 + (-0.5);
    float _1746 = fma(_1738, _1664, _1664);
    float _1748 = fma(_1740, _1740, _1742);
    float _1750 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1752 = float(_1662);
    float _1754 = fma(_1552, _1738, _1552);
    float _1756 = float(_1726);
    float _1758 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1746);
    float _1760 = _1708 * (-2.0);
    float _1762 = fma(_1750, _1750, _1748);
    float _1764 = 1.0 / _1736;
    float _1766 = _1756 * _1752;
    float _1768 = fma(_1754, _1732, _1758);
    float _1770 = fma(_1448, _1760, _1448);
    float _1772 = fma(_1760, _1666, _1666);
    float _1774 = _1426 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1776 = in.m_59.x;
    float _1778 = in.m_59.y;
    float _1780 = in.m_59.z;
    float _1782 = _1414 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1784 = _1768 * 0.15915493667125701904296875;
    float _1786 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1788 = _1346 + (-0.5);
    float _1790 = _1766 * (-2.0);
    float _1792 = rsqrt(_1762);
    float _1794 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1786);
    float _1796 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1772);
    float _1798 = fma(_1456, _1790, _1456);
    float _1800 = fma(_1790, _1668, _1668);
    float _1802 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1794);
    float _1804 = fma(_1770, _1732, _1796);
    float _1806 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1808 = _1364 + (-0.5);
    float _1810 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1812 = _1804 * 0.15915493667125701904296875;
    float _1814 = _1784 * 6.283185482025146484375;
    float _1816 = sin(_1814);
    float _1818 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1800);
    float _1820 = -_1810;
    float _1822 = _1806 + _1820;
    float _1824 = fma(_1798, _1732, _1818);
    bool _1826 = _1810 >= _1806;
    bool _1828 = isnan(_1810);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(_1806);
    bool _1834 = _1830 || _1832;
    float _1836 = _1740 * _1792;
    float _1838 = abs(_1822);
    float _1840 = precise::max(_1838, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1776);
    float _1844 = _1824 * 0.15915493667125701904296875;
    float _1846 = _1784 * 6.283185482025146484375;
    float _1848 = cos(_1846);
    float _1850 = precise::min(_1840, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1852 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1780);
    bool _1856 = !_1834;
    float _1858 = _1856 ? 1.0 : (-1.0);
    float _1860 = _1728 * _1792;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1864 = _1850 + _1862;
    float _1866 = _1852 * _1842;
    float _1868 = _1812 * 6.283185482025146484375;
    float _1870 = sin(_1868);
    float _1872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1778);
    float _1874 = _1362 * _1854;
    float _1876 = _1864 * _1764;
    float _1878 = _1750 * _1792;
    float _1880 = _1366 * _1872;
    float _1882 = _1858 * _1876;
    float _1884 = _1812 * 6.283185482025146484375;
    float _1886 = cos(_1884);
    float _1888 = _1368 * _1882;
    float _1890 = _1888 * 0.15915493667125701904296875;
    float _1892 = _1844 * 6.283185482025146484375;
    float _1894 = cos(_1892);
    float _1896 = _1816 * _1870;
    float _1898 = _1848 * _1870;
    float _1900 = _1844 * 6.283185482025146484375;
    float _1902 = sin(_1900);
    float _1904 = _1816 * _1886;
    float _1906 = _1894 * _1880;
    float _1908 = _1848 * _1886;
    float _1910 = _1870 * _1894;
    float _1912 = _1886 * _1894;
    float _1914 = _1890 * 6.283185482025146484375;
    float _1916 = cos(_1914);
    float _1918 = _1848 * _1906;
    float _1920 = _1816 * _1906;
    float _1922 = fma(_1902, _1908, _1896);
    float _1924 = -_1898;
    float _1926 = fma(_1902, _1904, _1924);
    float _1928 = -_1880;
    float _1930 = _1902 * _1928;
    float _1932 = -_1904;
    float _1934 = fma(_1902, _1898, _1932);
    float _1936 = fma(_1922, _1866, _1918);
    float _1938 = _1890 * 6.283185482025146484375;
    float _1940 = sin(_1938);
    float _1942 = fma(_1912, _1866, _1930);
    float _1944 = fma(_1902, _1896, _1908);
    float _1946 = fma(_1934, _1874, _1936);
    float _1948 = fma(_1926, _1866, _1920);
    float _1950 = fma(_1910, _1874, _1942);
    float _1952 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1954 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1958 = fma(_1944, _1874, _1948);
    float _1960 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1952);
    float _1962 = -_1916;
    float _1964 = _1962 + 1.0;
    float _1966 = _1878 * _1878;
    float _1968 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1954);
    float _1970 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1956);
    float _1972 = _1836 * _1940;
    float _1974 = _1860 * _1964;
    float _1976 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1960);
    float _1978 = _1860 * _1940;
    float _1980 = fma(_1964, _1966, _1916);
    float _1982 = _1878 * _1940;
    float _1984 = _1836 * _1964;
    float _1986 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1968);
    float _1988 = fma(_1878, _1974, _1972);
    float _1990 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1992 = -_1982;
    float _1994 = fma(_1860, _1984, _1992);
    float _1996 = -_1978;
    float _1998 = fma(_1878, _1984, _1996);
    float _2000 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2002 = _1990 * _1988;
    float _2004 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1970);
    float _2006 = fma(_1836, _1984, _1916);
    float _2008 = _1990 * _1994;
    float _2010 = fma(_2000, _1998, _2002);
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2014 = fma(_1878, _1984, _1978);
    float _2016 = fma(_2000, _2006, _2008);
    float _2018 = fma(_1860, _1974, _1916);
    float _2020 = fma(_2012, _1980, _2010);
    float _2022 = fma(_1860, _1984, _1982);
    float _2024 = fma(_2012, _2014, _2016);
    float _2026 = _1990 * _2018;
    float _2028 = _1486 + _2020;
    float _2030 = -_1972;
    float _2032 = fma(_1878, _1974, _2030);
    float _2034 = _1782 + _2024;
    float _2036 = fma(_2000, _2022, _2026);
    float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2040 = _2028 + _2038;
    float _2042 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2046 = _2034 + _2044;
    float _2048 = fma(_2012, _2032, _2036);
    float _2050 = _2040 * _2040;
    float _2052 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2042);
    float _2054 = _1774 + _2048;
    float _2056 = fma(_2046, _2046, _2050);
    float _2058 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2052);
    float _2060 = sqrt(_2056);
    bool _2062 = _2060 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2064 = _2052;
    float _2066 = _1974;
    float _2068 = _2032;
    float _2070 = _2060;
    if (!_2062)
    {
        _2064 = _2034;
    }
    float _2072 = _2064;
    float _2074 = _2072;
    if (!_2062)
    {
        _2066 = _2028;
    }
    float _2076 = _2066;
    float _2078 = _2076;
    if (!_2062)
    {
        _2068 = _2054;
    }
    float _2080 = _2068;
    bool _2082 = !_2062;
    float _2084 = _2080;
    if (!_2082)
    {
        float _2086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2090 = _2060 + _2088;
        float _2092 = rsqrt(_2056);
        float _2094 = _2090 * _2086;
        float _2096 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2098 = _2094 * 0.15915493667125701904296875;
        float _2100 = _2098 * 6.283185482025146484375;
        float _2102 = cos(_2100);
        float _2104 = _2098 * 6.283185482025146484375;
        float _2106 = sin(_2104);
        float _2108 = _2102 + (-1.0);
        float _2110 = fma(_2106, _2096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2112 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = _2092 * _2110;
        float _2116 = fma(_2054, _2102, _2112);
        float _2118 = fma(_2046, _2114, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2120 = fma(_2040, _2114, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2084 = _2116;
        _2074 = _2118;
        _2078 = _2120;
    }
    float _2122 = _2084;
    float _2124 = _2074;
    float _2126 = _2078;
    float _2128 = -_1774;
    float _2130 = _2128 + _2122;
    float _2132 = -_1782;
    float _2134 = _2132 + _2124;
    float _2136 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2138 = -_1486;
    float _2140 = _2138 + _2126;
    float _2142 = _2130 * _2130;
    float _2144 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2146 = 1.0 / _2136;
    float _2148 = fma(_2134, _2134, _2142);
    float _2150 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2144);
    float _2152 = fma(_2140, _2140, _2148);
    float _2154 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2150);
    float _2156 = sqrt(_2152);
    float _2158 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2160 = _2158 + _2136;
    float _2162 = _2160 * _2146;
    float _2164 = _2162 * 0.5;
    bool _2166 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan(0.5);
    bool _2174 = _2170 || _2172;
    bool _2176 = _2156 > 0.0;
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2180 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2178);
    bool _2182 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan(0.5);
    bool _2190 = _2186 || _2188;
    float _2192 = 1.0 / _2180;
    bool _2194 = !_2176;
    float _2196 = _2126;
    float _2198 = _2124;
    float _2200 = _2122;
    float _2202 = _2140;
    float _2204 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2206 = _2152;
    float _2208 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_2194)
    {
        float _2210 = _172 * _172;
        float _2212 = rsqrt(_2152);
        float _2214 = fma(_170, _170, _2210);
        float _2216 = fma(_174, _174, _2214);
        float _2218 = sqrt(_2216);
        float _2220 = _2140 * _2212;
        bool _2222 = _2218 > 0.0;
        float _2224 = _2134 * _2212;
        float _2226 = _2130 * _2212;
        bool _2228 = !_2222;
        _2204 = _2216;
        _2070 = _2220;
        _2208 = _2212;
        if (!_2228)
        {
            float _2230 = rsqrt(_2216);
            float _2232 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2234 = _172 * _2230;
            float _2236 = _170 * _2230;
            float _2238 = _2226 * _2234;
            float _2240 = _174 * _2230;
            float _2242 = fma(_2224, _2236, _2238);
            float _2244 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2246 = fma(_2220, _2240, _2242);
            float _2248 = _2246 * _2244;
            float _2250 = fma(_170, _2248, _2124);
            float _2252 = fma(_172, _2248, _2122);
            float _2254 = fma(_174, _2248, _2126);
            _2196 = _2254;
            _2198 = _2250;
            _2200 = _2252;
            _2202 = _2248;
            _2204 = _2230;
            _2206 = _2232;
            _2208 = _2244;
        }
    }
    float _2256 = _2196;
    float _2258 = _2198;
    float _2260 = _2200;
    float _2262 = _2202;
    float _2264 = _2204;
    float _2266 = _2070;
    float _2268 = _2206;
    float _2270 = _2208;
    float _2272 = _2268;
    float _2274 = _2260;
    float _2276 = _2258;
    float _2278 = _2262;
    float _2280 = _2270;
    float _2282 = _2264;
    float _2284 = _2266;
    if (_2190)
    {
        _2272 = 1.0;
    }
    float _2286 = _2272;
    float _2288 = _2286;
    if (_2174)
    {
        _178 = _2256;
    }
    float _2290 = _178;
    float _2292 = _2290;
    if (!_2174)
    {
        float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2296 = _1774 + _2294;
        float _2298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2300 = _1782 + _2298;
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2304 = -_1782;
        float _2306 = _2304 + _2258;
        float _2308 = _2296 * _2296;
        float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2312 = _1486 + _2310;
        float _2314 = -_1486;
        float _2316 = _2314 + _2256;
        float _2318 = fma(_2300, _2300, _2308);
        float _2320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2322 = fma(_2312, _2312, _2318);
        float _2324 = sqrt(_2322);
        float _2326 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2328 = precise::min(_2324, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2330 = _2328 * _2320;
        float _2332 = _2326 * _2330;
        float _2334 = -_1774;
        float _2336 = _2334 + _2260;
        float _2338 = fma(_2306, _2332, _1782);
        float _2340 = fma(_2336, _2332, _1774);
        float _2342 = fma(_2316, _2332, _1486);
        _180 = _2302;
        _2274 = _2340;
        _2276 = _2338;
        _2292 = _2342;
        _2278 = _2332;
    }
    float _2344 = _180;
    float _2346 = _2274;
    float _2348 = _2276;
    float _2350 = _2292;
    float _2352 = _2278;
    float _2354 = _2344;
    float _2356 = _2352;
    if (_2190)
    {
        _2280 = 1.0;
    }
    float _2358 = _2280;
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2362 = _2192 * _2360;
    float _2364 = _2358;
    if (!_2190)
    {
        float _2366 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2368 = _2366 * 0.15915493667125701904296875;
        float _2370 = _2368 * 6.283185482025146484375;
        float _2372 = cos(_2370);
        float _2374 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2376 = _2374 * 0.15915493667125701904296875;
        float _2378 = _2368 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = 1.0 / _2372;
        float _2384 = _2376 * 6.283185482025146484375;
        float _2386 = cos(_2384);
        float _2388 = _2380 * _2382;
        float _2390 = _2376 * 6.283185482025146484375;
        float _2392 = sin(_2390);
        float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2394;
        float _2398 = _2386 * _2388;
        float _2400 = 1.0 / _2396;
        float _2402 = 1.0 / _2398;
        float _2404 = _2392 * _2402;
        float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2408 = fma(_2362, _2404, _2406);
        float _2410 = _2408 * _2400;
        float _2412 = precise::clamp(_2410, 0.0, 1.0);
        _2354 = _2376;
        _2356 = _2368;
        _2288 = _2412;
    }
    float _2414 = _2354;
    float _2416 = _2356;
    float _2418 = _2288;
    float _2420 = _2414;
    if (!_2190)
    {
        float _2422 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2424 = _2422 * 0.15915493667125701904296875;
        float _2426 = _2424 * 6.283185482025146484375;
        float _2428 = cos(_2426);
        float _2430 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2432 = _2430 * 0.15915493667125701904296875;
        float _2434 = _2424 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = 1.0 / _2428;
        float _2440 = _2432 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2436 * _2438;
        float _2446 = _2432 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = 1.0 / _2450;
        float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2456 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2454;
        float _2458 = 1.0 / _2456;
        float _2460 = _2448 * _2452;
        float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2464 = fma(_2362, _2460, _2462);
        float _2466 = _2464 * _2458;
        float _2468 = precise::clamp(_2466, 0.0, 1.0);
        float _2470 = -_2468;
        float _2472 = _2470 + 1.0;
        _2420 = _2438;
        _2364 = _2472;
    }
    float _2474 = _2420;
    float _2476 = _2364;
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2480 = _2346 + _2478;
    float _2482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2484 = _2348 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2488 = _2350 + _2486;
    float _2490 = _2480 * _2480;
    float _2492 = fma(_2484, _2484, _2490);
    float _2494 = fma(_2488, _2488, _2492);
    float _2496 = rsqrt(_2494);
    float _2498 = sqrt(_2494);
    float _2500 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2502 = _2484 * _2500;
    float _2504 = _2488 * _2500;
    float _2506 = _2502 * _2502;
    float _2508 = _2504 * _2504;
    float _2510 = _2506 + _2508;
    float _2512 = sqrt(_2510);
    bool _2514 = _2512 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2518 = _2512 + _2516;
    float _2520 = _2474;
    float _2522 = _2510;
    float _2524 = _2518;
    float _2526 = _2480;
    float _2528 = _2504;
    float _2530 = _2506;
    float _2532 = _2508;
    if (_2514)
    {
        float _2534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2534;
    }
    float _2536 = _2520;
    if (_2514)
    {
        float _2538 = rsqrt(_2510);
        _2522 = _2538;
    }
    float _2540 = _2522;
    if (_2514)
    {
        float _2542 = _2518 * _2536;
        _2524 = _2542;
    }
    float _2544 = _2524;
    if (_2514)
    {
        float _2546 = _2544 * 0.15915493667125701904296875;
        _2282 = _2546;
    }
    float _2548 = _2282;
    float _2550 = _2416;
    if (_2514)
    {
        float _2552 = _2548 * 6.283185482025146484375;
        float _2554 = sin(_2552);
        _2550 = _2554;
    }
    float _2556 = _2550;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2560 = precise::max(0.0, _2558);
    float _2562 = _2536;
    float _2564 = _2560;
    if (_2514)
    {
        float _2566 = _2548 * 6.283185482025146484375;
        float _2568 = cos(_2566);
        _2562 = _2568;
    }
    float _2570 = _2562;
    float _2572 = -_2500;
    float _2574 = -_2560;
    float _2576 = fma(_2480, _2572, _2574);
    if (_2514)
    {
        float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2526 = _2578;
    }
    float _2580 = _2526;
    float _2582 = _2580;
    float _2584 = _2556;
    if (_2514)
    {
        float _2586 = fma(_2556, _2580, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2564 = _2586;
    }
    float _2588 = _2564;
    float _2590 = _2588;
    if (!_2514)
    {
        _2582 = _2502;
    }
    float _2592 = _2582;
    float _2594 = _2592;
    if (_2514)
    {
        float _2596 = _2570 + (-1.0);
        _2584 = _2596;
    }
    float _2598 = _2584;
    float _2600 = _2598;
    if (_2514)
    {
        float _2602 = _2540 * _2588;
        _2284 = _2602;
    }
    float _2604 = _2284;
    if (!_2514)
    {
        _2590 = _2576;
    }
    float _2606 = _2590;
    float _2608 = _2606;
    if (_2514)
    {
        float _2610 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2600 = _2610;
    }
    float _2612 = _2600;
    if (_2514)
    {
        float _2614 = _2502 * _2604;
        _2594 = _2614;
    }
    float _2616 = _2594;
    if (_2514)
    {
        float _2618 = _2504 * _2604;
        _2528 = _2618;
    }
    float _2620 = _2528;
    if (_2514)
    {
        float _2622 = fma(_2576, _2570, _2612);
        _2608 = _2622;
    }
    float _2624 = _2608;
    if (_2514)
    {
        float _2626 = _2616 * _2616;
        _2530 = _2626;
    }
    float _2628 = _2530;
    if (_2514)
    {
        float _2630 = _2620 * _2620;
        _2532 = _2630;
    }
    float _2632 = _2532;
    float _2634 = fma(_2624, _2624, _2628);
    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2638 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2636);
    float _2640 = precise::clamp(_2638, 0.0, 1.0);
    float _2642 = _2634 + _2632;
    float _2644 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2646 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2648 = -_2640;
    float _2650 = _2648 + 1.0;
    float _2652 = rsqrt(_2642);
    float _2654 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2644);
    float _2656 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2660 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2654);
    float _2662 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2646);
    float _2664 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2666 = abs(_2650);
    float _2668 = log2(_2666);
    float _2670 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2656);
    float _2672 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2662);
    float _2674 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2664);
    float _2676 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2678 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2670);
    float _2680 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2682 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2674);
    float _2684 = _2652 * _2616;
    float _2686 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2688 = _2652 * _2624;
    float _2690 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2692 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2694 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2696 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2698 = _2652 * _2620;
    float _2700 = -_2692;
    float _2702 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2700);
    float _2704 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2694);
    float _2706 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2708 = -_2696;
    float _2710 = fma(_2708, _2658, 1.0);
    float _2712 = -_2698;
    float _2714 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2702);
    float _2716 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2704);
    float _2718 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2720 = log2(_2710);
    float _2722 = fma(_2714, -0.5, 0.5);
    float _2724 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2716);
    float _2726 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2728 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2718);
    float _2730 = fma(_2714, 0.5, 0.5);
    float _2732 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2726);
    float _2734 = exp2(_2706);
    float _2736 = _2688 + 1.0;
    float _2738 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2728);
    float _2740 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2732);
    float _2742 = fma(_2730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2744 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2740);
    float _2746 = 1.0 / _2724;
    float _2748 = fma(_2730, _2742, -0.212114393711090087890625);
    float _2750 = fma(_2730, _2748, 1.570728778839111328125);
    float _2752 = sqrt(_2722);
    float _2754 = -_2688;
    float _2756 = fma(_2734, _2736, _2754);
    float _2758 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2738);
    float _2760 = _2720 * 0.693147182464599609375;
    float _2762 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2764 = _2758 * _2746;
    float _2766 = _2744 * _2746;
    float _2768 = fma(_2764, 0.5, 0.5);
    float _2770 = fma(_2766, -0.5, 0.5);
    float _2772 = fma(_2756, 0.5, 0.5);
    float _2774 = _2752 * 0.636619746685028076171875;
    float _2776 = -_2750;
    float _2778 = fma(_2774, _2776, 1.0);
    float3 _7949 = float3(_2768, _2770, _2762);
    float _2780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7949, float3(0.0), isnan(_7949)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7949, float3(0.0), isnan(_7949)), level(0.0)).x;
    float3 _7960 = float3(_2768, _2770, _2762);
    float4 _2783 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7960, float3(0.0), isnan(_7960)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7960, float3(0.0), isnan(_7960)), level(0.0)).xyzw;
    float _2785 = _2783.x;
    float _2787 = _2783.y;
    float _2789 = _2783.z;
    float _2791 = _2783.w;
    float2 _7977 = float2(_2778, _2772);
    float3 _2795 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7977, float2(0.0), isnan(_7977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7977, float2(0.0), isnan(_7977)), level(0.0)).xyz;
    float _2797 = _2795.x;
    float _2799 = _2795.y;
    float _2801 = _2795.z;
    float _2803 = float(uint(_1344));
    float _2805 = trunc(_1714);
    int _2807 = int(_2805);
    int _2809 = ~_1344;
    int _2811 = _2809 + 1;
    float _2813 = _1724 * _152;
    int _2815 = ~_1344;
    int _2817 = _2815 + 1;
    out.m_61.x = _928;
    out.m_61.y = _930;
    out.m_61.z = _932;
    out.m_61.w = _936;
    int _2819 = _1344 + (-1);
    float _2821 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2823 = abs(_1616);
    float _2825 = 1.0 / _2803;
    float _2827 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2829 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2827);
    bool _2831 = !_1360;
    float _2833 = _2831 ? 7.345489978790283203125 : 1.0;
    float _2835 = float(uint(_2807));
    float _2837 = trunc(_2813);
    int _2839 = int(_2837);
    float _2841 = float(_2807);
    float _2843 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2829);
    float _2845 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2843);
    int _2847 = as_type<int>(_2825) + (-2);
    float _2849 = exp2(_2821);
    float _2851 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2851;
    float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2857 = _2855 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2859 = as_type<float>(_2847) * _2835;
    out.gl_Position.x = _2758;
    out.gl_Position.y = _2744;
    out.gl_Position.z = _2845;
    out.gl_Position.w = _2724;
    float _2861 = trunc(_2859);
    float _2863 = precise::max(_2861, 0.0);
    uint _2866 = uint(_2863);
    float _2868 = -_2849;
    float _2870 = _2868 + 1.0;
    int _2872 = _2811 * int(_2866);
    int _2874 = _2872 + _2807;
    float _2876 = float(uint(_2874));
    float _2878 = as_type<float>(_2847) * _2876;
    float _2880 = _2833 * _1340;
    bool _2882 = _2841 >= _1716;
    bool _2884 = isnan(_2841);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan(_1716);
    bool _2890 = _2886 || _2888;
    float _2892 = float(_2890);
    float _2894 = floor(_2880);
    float _2896 = trunc(_2878);
    float _2898 = precise::max(_2896, 0.0);
    uint _2900 = uint(_2898);
    float _2902 = trunc(_2892);
    int _2904 = int(_2902);
    float _2906 = -_2894;
    float _2908 = _2880 + _2906;
    int _2910 = int(_2866) + int(_2900);
    int _2912 = _2817 * _2910;
    int _2914 = _2912 + _2807;
    int _2916 = ~_2904;
    int _2918 = _2916 + 1;
    int _2920 = _2918 + 1;
    bool _2922 = uint(_2914) >= uint(_1344);
    bool _2924 = !_2922;
    int _2926 = _2924 ? 0 : (-1);
    bool _2928 = _1344 == 0;
    int _2930 = ~_2910;
    int _2932 = _2930 + _2926;
    int _2934 = _2932 + 1;
    float _2936 = _2908 * _1716;
    int _2938 = _1344 * _2934;
    int _2940 = _2938 + _2807;
    int _2942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2944 = _2942 != 0;
    float _2946 = trunc(_2936);
    int _2948 = int(_2946);
    int _2950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2952 = _2950 != 0;
    bool _2954 = !_2928;
    int _2956 = _2954 ? _2940 : (-1);
    bool _2958 = !_2944;
    int _2960 = _2958 ? 0 : 1;
    int _2962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2964 = _2962 != 0;
    int _2966 = _2956 * _2920;
    int _2968 = abs(_2960);
    int _2970 = abs(_1622);
    int _2972 = _2904 * _2819;
    int _2974 = _2972 + _2966;
    int _2976 = abs(_1626);
    int _2978 = _2974 * _2823;
    bool _2980 = !_2964;
    int _2982 = _2980 ? 0 : 1;
    int _2984 = _2948 * _2968;
    int _2986 = _2984 + _2807;
    int _2988 = abs(_2982);
    int _2990 = _2839 * _2970;
    int _2992 = _2990 + _2978;
    int _2994 = _2986 * _2976;
    int _2996 = _2994 + _2992;
    float _2998 = in.m_53.w;
    int _3000 = _2948 * _2988;
    int _3002 = _3000 + _2996;
    float _3004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3006 = _3004 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3008 = in.m_63.y;
    int _3010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3012 = _3010 != 0;
    float _3014 = float(uint(_3002));
    float _3016 = 1.0 / _3006;
    int _3018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3020 = _3018 != 0;
    float _3022 = as_type<float>(_2847) * _3014;
    int _3024 = ~_1344;
    int _3026 = _3024 + 1;
    int _3028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3030 = _3028 != 0;
    int _3032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3034 = _3032 != 0;
    float _3036 = trunc(_3022);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    bool _3042 = _2998 > 0.5;
    float _3044 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3050 = _3026 * int(_3040);
    int _3052 = _3050 + _3002;
    float _3054 = 1.0 / _3046;
    float _3056 = float(uint(_3052));
    float _3058 = _3048 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3060 = as_type<float>(_2847) * _3056;
    float _3062 = -_3008;
    float _3064 = _3062 + 1.0;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _3066 = trunc(_3060);
    float _3068 = precise::max(_3066, 0.0);
    uint _3070 = uint(_3068);
    int _3072 = _3042 ? as_type<int>(_3064) : as_type<int>(_3008);
    float _3074 = _2857 * _3054;
    bool _3076 = _1346 > 0.5;
    int _3078 = ~_1344;
    int _3080 = _3078 + 1;
    float _3082 = _3020 ? as_type<float>(_3072) : _3008;
    float _3084 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3086 = _3084 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _3088 = _2853 * _3016;
    float _3090 = _3008;
    bool _3092 = _3020;
    bool _3094 = _2952;
    int _3096 = as_type<int>(_2936);
    if (_2952)
    {
        float _3098 = _3076 ? _3064 : _3008;
        _3090 = _3098;
    }
    float _3100 = _3090;
    float _3102 = 1.0 / _3086;
    if (_3012)
    {
        bool _3104 = _1340 > 0.5;
        _3092 = _3104;
    }
    bool _3106 = _3092;
    float _3108 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3110 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _3108;
    int _3112 = int(_3040) + int(_3070);
    float _3114 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3116 = _1338 + _3114;
    float _3118 = float(uint(_2986));
    float _3120 = fma(_3082, _3058, -0.5);
    if (_3030)
    {
        bool _3122 = _1364 > 0.5;
        _3094 = _3122;
    }
    bool _3124 = _3094;
    int _3126 = _3080 * _3112;
    int _3128 = _3126 + _3002;
    float _3130 = fma(_3088, _3116, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _3132 = as_type<float>(_2847) * _3118;
    float _3134 = in.m_63.x;
    float _3136 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _3100, -0.5);
    bool _3138 = uint(_3128) >= uint(_1344);
    float _3140 = trunc(_3132);
    float _3142 = precise::max(_3140, 0.0);
    uint _3144 = uint(_3142);
    int _3146 = ~_1344;
    int _3148 = _3146 + 1;
    float _3150 = _3110 * _3102;
    bool _3152 = !_3138;
    int _3154 = _3152 ? 0 : (-1);
    float _3156 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3158 = _1338 + _3156;
    float _3160 = -_1696;
    float _3162 = fma(_1690, _3120, _3160);
    int _3164 = ~_1344;
    int _3166 = _3164 + 1;
    float _3168 = -_1648;
    float _3170 = fma(_1704, _3136, _3168);
    int _3172 = ~_3112;
    int _3174 = _3172 + _3154;
    int _3176 = _3174 + 1;
    float _3178 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3180 = _1338 + _3178;
    bool _3182 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3184 = isnan(_1338);
    bool _3186 = _3182 || _3184;
    bool _3188 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3190 = _3186 || _3188;
    float _3192 = float(_3190);
    float _3194 = fma(_3074, _3158, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3196 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3198 = isnan(_1338);
    bool _3200 = _3196 || _3198;
    bool _3202 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3204 = _3200 || _3202;
    float _3206 = float(_3204);
    int _3208 = _1344 * _3176;
    int _3210 = _3208 + _3002;
    float _3212 = fma(_3150, _3180, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _3214 = -_3192;
    float _3216 = _3214 + 1.0;
    bool _3218 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3220 = isnan(_1338);
    bool _3222 = _3218 || _3220;
    bool _3224 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3226 = _3222 || _3224;
    float _3228 = float(_3226);
    int _3230 = _3148 * int(_3144);
    int _3232 = _3230 + _2986;
    bool _3234 = !_2928;
    int _3236 = _3234 ? _3210 : (-1);
    float _3238 = _3206 * _3216;
    float _3240 = -_3206;
    float _3242 = _3240 + 1.0;
    bool _3244 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3246 = isnan(_1338);
    bool _3248 = _3244 || _3246;
    bool _3250 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3252 = _3248 || _3250;
    float _3254 = float(_3252);
    if (_3030)
    {
        float _3256 = -_3134;
        float _3258 = _3256 + 1.0;
        _3096 = as_type<int>(_3258);
    }
    int _3260 = _3096;
    int _3262 = _3236 >> 31;
    float _3264 = float(uint(_3232));
    float _3266 = _3228 * _3242;
    int _3268 = _3262 & 3;
    float _3270 = -_3228;
    float _3272 = _3270 + 1.0;
    float _3274 = as_type<float>(_2847) * _3264;
    int _3276 = _3236 + _3268;
    float _3278 = _3254 * _3272;
    float _3280 = -_3254;
    float _3282 = _3280 + 1.0;
    float _3284 = trunc(_3274);
    float _3286 = precise::max(_3284, 0.0);
    uint _3288 = uint(_3286);
    int _3290 = _3276 >> 2;
    float _3292 = _3130 * _3278;
    float _3294 = as_type<float>(_3268);
    float _3296 = as_type<float>(_3290);
    int _3298 = as_type<int>(_3274);
    if (!_3012)
    {
        _3294 = _3134;
    }
    float _3300 = _3294;
    int _3302 = _3290 << 4;
    int _3304 = _3302 + 368;
    float _3306 = fma(_3282, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3292);
    float _3308 = _3300;
    if (!_3030)
    {
        _3296 = _3134;
    }
    float _3310 = _3296;
    float _3312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3314 = uint(int(uint(_3304) >> uint(2)));
    uint _3316 = uint(int(uint(int(_3314)) >> uint(2)));
    int _3318 = int(_3314) & 3;
    float _3320 = (*spvDescriptorSet0.vp_c9)._m0[int(_3316)][_3318];
    int _3322 = int(_3314) + 1;
    uint _3324 = uint(int(uint(_3322) >> uint(2)));
    int _3326 = _3322 & 3;
    float _3328 = (*spvDescriptorSet0.vp_c9)._m0[int(_3324)][_3326];
    float _3330 = _3310;
    if (_3012)
    {
        float _3332 = -_3134;
        float _3334 = _3332 + 1.0;
        _3298 = as_type<int>(_3334);
    }
    int _3336 = _3298;
    if (_3030)
    {
        float _3338 = _3124 ? as_type<float>(_3260) : _3134;
        _3330 = _3338;
    }
    float _3340 = _3330;
    float _3342 = fma(_3194, _3266, _3306);
    int _3344 = _3236 & 3;
    bool _3346 = _3344 != 0;
    if (_3012)
    {
        float _3348 = _3106 ? as_type<float>(_3336) : _3134;
        _3308 = _3348;
    }
    float _3350 = _3308;
    float _3352 = fma(_3212, _3238, _3342);
    int _3354 = _3304 + 8;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    uint _3358 = uint(int(uint(int(_3356)) >> uint(2)));
    int _3360 = int(_3356) & 3;
    float _3362 = (*spvDescriptorSet0.vp_c9)._m0[int(_3358)][_3360];
    int _3364 = int(_3356) + 1;
    uint _3366 = uint(int(uint(_3364) >> uint(2)));
    int _3368 = _3364 & 3;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[int(_3366)][_3368];
    int _3372 = _3236 & 3;
    bool _3374 = _3372 != 0;
    bool _3376 = uint(_3344) > 1u;
    float _3378 = fma(_3350, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3380 = _3312 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3382 = _3374 ? 0 : 1;
    bool _3384 = _3344 != 3;
    float _3386 = fma(_3380, _3340, -0.5);
    int _3388 = int(_3144) + int(_3288);
    float _3390 = fma(_1700, _3378, _1466);
    bool _3392 = uint(_3344) >= 2u;
    float _3394 = fma(_1722, _3386, _1686);
    int _3396 = _3166 * _3388;
    int _3398 = _3396 + _2986;
    int _3400 = ~_3382;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    float _3406 = _3394 + 0.5;
    int _3408 = _3392 ? 0 : 1;
    int _3410 = _3404;
    if (!_3376)
    {
        int _3412 = ~_3382;
        int _3414 = _3412 + 1;
        _3410 = _3414;
    }
    int _3416 = _3410;
    bool _3418 = uint(_3398) >= uint(_1344);
    bool _3420 = !_3346;
    int _3422 = _3420 ? 0 : 1;
    int _3424 = ~_3408;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    int _3430 = abs(_3416);
    bool _3432 = _3344 != 3;
    int _3434 = _3428;
    if (_3384)
    {
        int _3436 = ~_3408;
        int _3438 = _3436 + 1;
        _3434 = _3438;
    }
    int _3440 = _3434;
    int _3442 = abs(_3422);
    bool _3444 = !_3432;
    int _3446 = _3444 ? 0 : (-1);
    int _3448 = ~_3430;
    int _3450 = _3448 + 1;
    int _3452 = _3450 + 1;
    int _3454 = abs(_3440);
    int _3456 = abs(_3446);
    int _3458 = _3452 * as_type<int>(_3328);
    int _3460 = ~_3442;
    int _3462 = _3460 + 1;
    int _3464 = _3462 + 1;
    bool _3466 = !_3034;
    int _3468 = _3466 ? 0 : 1;
    int _3470 = _3464 * as_type<int>(_3320);
    int _3472 = _3470 + _3458;
    int _3474 = ~_3454;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    bool _3480 = !_3418;
    int _3482 = _3480 ? 0 : (-1);
    int _3484 = abs(_3468);
    int _3486 = _3478 * as_type<int>(_3362);
    int _3488 = _3486 + _3472;
    int _3490 = ~_3456;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    float _3496 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3498 = ~_3388;
    int _3500 = _3498 + _3482;
    int _3502 = _3500 + 1;
    int _3504 = ~_3484;
    int _3506 = _3504 + 1;
    int _3508 = _3506 + 1;
    int _3510 = _3494 * as_type<int>(_3370);
    int _3512 = _3510 + _3488;
    float _3514 = fma(_3192, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3352);
    int _3516 = _1344 * _3502;
    int _3518 = _3516 + _2986;
    float _3520 = _3170 + 0.5;
    float _3522 = _3162 + 0.5;
    float _3524 = _3390 + 0.5;
    int _3526 = _3512 * _3508;
    float _3528 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3530 = !_2928;
    int _3532 = _3530 ? _3518 : (-1);
    float _3534 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3536 = _2418 * _2476;
    out.m_67.x = _3524;
    out.m_67.y = _3520;
    out.m_67.z = _3406;
    out.m_67.w = _3522;
    float _3538 = _3528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3540 = _3534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3542 = _3496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3544 = _3514 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3546 = _3532 * _3484;
    int _3548 = _3546 + _3526;
    bool _3550 = _2418 > 0.0;
    bool _3552 = isnan(_2418);
    bool _3554 = _3550 || _3552;
    bool _3556 = isnan(0.0);
    bool _3558 = _3554 || _3556;
    float _3560 = _3536 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _3538;
    out.m_69.y = _3540;
    out.m_69.z = _3542;
    out.m_69.w = _3544;
    bool _3562 = _2476 <= 0.0;
    bool _3564 = !_3558;
    bool _3566 = _3562 || _3564;
    float _3568 = _3560 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3570 = float(_3548);
    float _3572 = _2845 + _2724;
    float _3574 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3568;
    float _3576 = _3572 * 0.5;
    float _3578 = _3574 * _2780;
    out.m_71.x = _3570;
    float _3580 = _2801 * _3578;
    float _3582 = _2791 * _3578;
    float _3584 = -_3574;
    float _3586 = _3584 + 1.0;
    out.m_73.z = _3576;
    out.m_73.w = _2724;
    float _3588 = fma(_2797, _3582, _2785);
    float _3590 = fma(_2799, _3582, _2787);
    float _3592 = _2791 * _3586;
    float _3594 = fma(_2791, _3580, _2789);
    out.m_75.x = _3588;
    out.m_75.y = _3590;
    out.m_75.z = _3594;
    out.m_75.w = _3592;
    if (!_3566)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3596 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3596;
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
    bool _1336 = false;
    bool _958 = false;
    bool _860 = false;
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
        float _3665 = as_type<float>(_118);
        out.gl_Position.z = _3665;
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
        float _3720 = as_type<float>(_144);
        out.gl_Position.z = _3720;
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
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _506 = 1.0 / _486;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _510 = _472 + _508;
    bool _512 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _514 = isnan(_472);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _526 = 1.0 / _504;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _530 = _472 + _528;
    float _532 = _446 * _476;
    float _534 = _510 * _496;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _538 = _472 + _536;
    bool _540 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _542 = isnan(_472);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _554 = _472 + _552;
    float _556 = _448 * _478;
    float _558 = 1.0 / _494;
    float _560 = _530 * _506;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _564 = _472 + _562;
    bool _566 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _568 = isnan(_472);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _578;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _582;
    float _586 = _444 * _474;
    float _588 = 1.0 / _500;
    float _590 = _538 * _526;
    float _592 = -_550;
    float _594 = _592 + 1.0;
    float _596 = -_576;
    float _598 = _596 + 1.0;
    float _600 = _576 * _594;
    float _602 = fma(_580, _534, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _604 = 1.0 / _490;
    float _606 = _554 * _558;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _608;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _616 = fma(_610, _534, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _618 = fma(_614, _560, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _622 = _472 + _620;
    float _624 = _622 * _588;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _626;
    float _630 = _564 * _604;
    bool _632 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _634 = isnan(_472);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = fma(_628, _534, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _646 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _648 = isnan(_472);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = fma(_584, _630, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _660 = -_642;
    float _662 = _660 + 1.0;
    float _664 = _642 * _598;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _674 = _656 * _662;
    bool _676 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _678 = isnan(_472);
    bool _680 = _676 || _678;
    bool _682 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _684 = _680 || _682;
    float _686 = float(_684);
    float _688 = -_656;
    float _690 = _688 + 1.0;
    bool _692 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _694 = isnan(_472);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _700 = _696 || _698;
    float _702 = float(_700);
    float _704 = fma(_672, _560, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _706 = fma(_668, _560, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _708 = _522 * _690;
    float _710 = -_686;
    float _712 = _710 + 1.0;
    float _714 = -_522;
    float _716 = _714 + 1.0;
    float _718 = _702 * _712;
    float _720 = _686 * _716;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _722;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _726;
    float _730 = _602 * _718;
    float _732 = _616 * _718;
    float _734 = -_702;
    float _736 = _734 + 1.0;
    float _738 = _644 * _718;
    float _740 = fma(_724, _630, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _742 = fma(_728, _630, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _756 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[107].x, _730);
    float _758 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[107].y, _732);
    float _760 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[107].z, _738);
    float _762 = fma(_746, _606, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _764 = fma(_750, _606, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _766 = fma(_754, _606, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _768 = fma(_704, _720, _756);
    float _770 = fma(_706, _720, _758);
    float _772 = fma(_618, _720, _760);
    float _774 = fma(_740, _708, _768);
    float _776 = fma(_658, _708, _772);
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _778;
    float _782 = fma(_742, _708, _770);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _788;
    float _792 = fma(_780, _624, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _794 = fma(_786, _624, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _796 = fma(_762, _674, _774);
    float _798 = fma(_790, _624, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _800 = fma(_766, _674, _776);
    float _802 = fma(_764, _674, _782);
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _806 = _804 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _810 = _808 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _816 = fma(_792, _664, _796);
    float _818 = fma(_806, _590, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _820 = fma(_810, _590, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _822 = fma(_814, _590, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _824 = fma(_794, _664, _802);
    float _826 = fma(_798, _664, _800);
    float _828 = fma(_818, _600, _816);
    float _830 = fma(_820, _600, _824);
    float _832 = fma(_822, _600, _826);
    float _834 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[113].x, _828);
    float _836 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[113].y, _830);
    float _838 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[113].z, _832);
    bool _840 = !_524;
    float _858;
    if (!_840)
    {
        float _842 = in.m_53.x;
        float _844 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _846 = _842 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _850 = _848 * _844;
        float _852 = floor(_850);
        float _854 = -_852;
        float _856 = _850 + _854;
        _858 = _856;
        _860 = true;
    }
    else
    {
        _858 = _156;
    }
    _860 = false;
    float _862 = _858;
    bool _864 = _862 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = isnan(_862);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _876 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _880 = _862 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _882 = isnan(_862);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _892;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _862 + _896;
    float _900 = -_874;
    float _902 = _900 + 1.0;
    bool _904 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _906 = 1.0 / _878;
    float _908 = _890 * _902;
    float _910 = -_890;
    float _912 = _910 + 1.0;
    float _914 = _894 * _906;
    float _916 = _836 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _918 = fma(_914, _898, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _920 = _834 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _922 = _918 * _908;
    float _924 = _838 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _926 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[115].x, _922);
    float _928 = _920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _932 = _924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _934 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[116].x, _926);
    float _936 = _934 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _938 = !_904;
    float _956;
    if (!_938)
    {
        float _940 = in.m_53.x;
        float _942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _948 = _946 * _942;
        float _950 = floor(_948);
        float _952 = -_950;
        float _954 = _948 + _952;
        _956 = _954;
        _958 = true;
    }
    else
    {
        _956 = _156;
    }
    _958 = false;
    float _960 = _956;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _962;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _978;
    float _982 = 1.0 / _968;
    bool _984 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _986 = isnan(_960);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _1000 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1002 = isnan(_960);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = 1.0 / _964;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1016 = _960 + _1014;
    bool _1018 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1020 = isnan(_960);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_1010;
    float _1032 = _1030 + 1.0;
    bool _1034 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1036 = isnan(_960);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = 1.0 / _976;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1050 = _960 + _1048;
    float _1052 = _1016 * _982;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1056 = _960 + _1054;
    bool _1058 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1060 = isnan(_960);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1066 = _1062 || _1064;
    float _1068 = float(_1066);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _1072 = _960 + _1070;
    float _1074 = 1.0 / _972;
    float _1076 = _1050 * _1012;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1080 = _960 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1084 = _960 + _1082;
    float _1086 = 1.0 / _980;
    float _1088 = _1056 * _1046;
    float _1090 = -_994;
    float _1092 = _1090 + 1.0;
    bool _1094 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1096 = _1010 * _1092;
    float _1098 = _1080 * _1074;
    float _1100 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1100;
    float _1104 = 1.0 / _998;
    float _1106 = fma(_1102, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1108 = _1028 * _1032;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1114 = _1084 * _1086;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1116;
    float _1120 = -_1044;
    float _1122 = _1120 + 1.0;
    float _1124 = fma(_1112, _1052, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1126 = fma(_1118, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1128 = -_1028;
    float _1130 = _1128 + 1.0;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1140 = _1044 * _1130;
    float _1142 = fma(_1134, _1052, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1144 = fma(_1138, _1052, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1146 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1148 = isnan(_960);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1154 = _1150 || _1152;
    float _1156 = float(_1154);
    float _1158 = _1072 * _1104;
    bool _1160 = _960 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1162 = isnan(_960);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1168 = _1164 || _1166;
    float _1170 = float(_1168);
    float _1172 = _1068 * _1122;
    float _1174 = -_1068;
    float _1176 = _1174 + 1.0;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1182;
    float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1186;
    float _1190 = _1170 * _1176;
    float _1192 = -_1170;
    float _1194 = _1192 + 1.0;
    float _1196 = fma(_1180, _1076, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1198;
    float _1202 = fma(_1184, _1098, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1204 = _1156 * _1194;
    float _1206 = -_1156;
    float _1208 = _1206 + 1.0;
    float _1210 = fma(_1200, _1098, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1212 = fma(_1188, _1098, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1214 = _1106 * _1204;
    float _1216 = _1126 * _1204;
    float _1218 = _1196 * _1204;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1224 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1214);
    float _1226 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1216);
    float _1228 = fma(_1208, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1218);
    float _1230 = fma(_1222, _1088, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1238 = _1236 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1240 = fma(_1144, _1190, _1228);
    float _1242 = fma(_1142, _1190, _1224);
    float _1244 = fma(_1124, _1190, _1226);
    float _1246 = fma(_1234, _1088, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1248 = fma(_1238, _1088, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1250 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1250;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1260 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1258;
    float _1262 = fma(_1212, _1172, _1240);
    float _1264 = fma(_1210, _1172, _1242);
    float _1266 = fma(_1202, _1172, _1244);
    float _1268 = fma(_1252, _1114, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1270 = fma(_1256, _1114, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1272 = fma(_1260, _1114, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1274 = fma(_1248, _1140, _1262);
    float _1276 = fma(_1246, _1140, _1264);
    float _1278 = fma(_1230, _1140, _1266);
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1282 = _1280 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1290 = _1288 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1292 = fma(_1268, _1108, _1276);
    float _1294 = fma(_1282, _1158, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1296 = fma(_1286, _1158, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1298 = fma(_1270, _1108, _1278);
    float _1300 = fma(_1290, _1158, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1302 = fma(_1272, _1108, _1274);
    float _1304 = fma(_1294, _1096, _1292);
    float _1306 = fma(_1296, _1096, _1298);
    float _1308 = fma(_1300, _1096, _1302);
    float _1310 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1304);
    float _1312 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1306);
    float _1314 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1308);
    bool _1316 = !_1094;
    float _1334;
    if (!_1316)
    {
        float _1318 = in.m_53.x;
        float _1320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1322 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1326 = _1324 * _1320;
        float _1328 = floor(_1326);
        float _1330 = -_1328;
        float _1332 = _1326 + _1330;
        _1334 = _1332;
        _1336 = true;
    }
    else
    {
        _1334 = _156;
    }
    _1336 = false;
    float _1338 = _1334;
    float _1340 = in.m_53.x;
    float _1342 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1344 = int(_1342);
    float _1346 = in.m_53.y;
    float _1348 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1350 = in.m_42.x;
    float _1352 = in.m_42.y;
    float _1354 = in.m_42.z;
    float _1356 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1360 = _1358 != 0;
    float _1362 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1364 = in.m_53.z;
    float _1366 = _532 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1368 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1370 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1372 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1370);
    float _1374 = _1340 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1378 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1380 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1382 = -_1348;
    float _1384 = fma(_1374, 2.0, _1382);
    float _1386 = _1340 * 2.0;
    float _1388 = _1346 * 2.0;
    float _1390 = fma(_1380, -2.0, _1356);
    float _1392 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1394 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1396 = _1352 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1398 = floor(_1386);
    float _1400 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1402 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1392);
    float _1404 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1394);
    float _1406 = fma(_1350, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1396);
    float _1408 = _1340 + _1346;
    float _1410 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _1400);
    float _1412 = _1364 * 2.0;
    float _1414 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1402);
    float _1416 = _1408 + (-1.0);
    float _1418 = _1346 + _1364;
    float _1420 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1422 = log2(_1420);
    float _1424 = _1340 + _1364;
    float _1426 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1404);
    float _1428 = _1418 + (-1.0);
    float _1430 = fma(_1354, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1406);
    bool _1432 = _1398 > 0.0;
    float _1434 = _1424 + (-1.0);
    bool _1436 = _1398 >= 0.0;
    bool _1438 = isnan(_1398);
    bool _1440 = _1436 || _1438;
    bool _1442 = isnan(0.0);
    bool _1444 = _1440 || _1442;
    float _1446 = floor(_1412);
    float _1448 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1450 = _1428;
    float _1452 = _1404;
    if (!_1360)
    {
        _1450 = _1364;
    }
    float _1454 = _1450;
    float _1456 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1458 = _1454;
    if (_1360)
    {
        _1458 = _1346;
    }
    float _1460 = _1458;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1464 = -_100;
    float _1466 = fma(_1464, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1384);
    float _1468 = floor(_1388);
    float _1470 = fma(_1460, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1376);
    float _1472 = _1460;
    if (!_1360)
    {
        _1472 = _1364;
    }
    float _1474 = _1472;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1478 = _1474;
    if (_1360)
    {
        _1478 = _1346;
    }
    float _1480 = _1478;
    float _1482 = _1422 * _100;
    if (!_1360)
    {
        _1452 = _1346;
    }
    float _1484 = _1452;
    float _1486 = _1430 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1488 = _1446 > 0.0;
    float _1490 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1492 = _1484;
    if (_1360)
    {
        _1492 = _1340;
    }
    float _1494 = _1492;
    float _1496 = exp2(_1482);
    bool _1498 = _1446 >= 0.0;
    bool _1500 = isnan(_1446);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan(0.0);
    bool _1506 = _1502 || _1504;
    float _1508 = fma(_1490, -2.0, _1378);
    float _1510 = fma(_1494, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1476);
    float _1512 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1514 = _1506 ? 0 : 1;
    float _1516 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _1410);
    float _1518 = -_1462;
    float _1520 = fma(_1512, 2.0, _1518);
    float _1522 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1524 = int(_1522);
    int _1526 = ~_1514;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    float _1532 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1372);
    bool _1534 = _1468 >= 0.0;
    bool _1536 = isnan(_1468);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan(0.0);
    bool _1542 = _1538 || _1540;
    int _1544 = _1530;
    if (!_1488)
    {
        int _1546 = ~_1514;
        int _1548 = _1546 + 1;
        _1544 = _1548;
    }
    int _1550 = _1544;
    float _1552 = fma(_1416, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1554 = _1468 > 0.0;
    float _1556 = rsqrt(_1532);
    int _1558 = _1444 ? 0 : 1;
    bool _1560 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1562 = isnan(0.0);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1568 = _1564 || _1566;
    int _1570 = _1542 ? 0 : 1;
    int _1572 = ~_1558;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1580 = 1.0 + _1578;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1584 = _1582 != 0;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1588 = _1586 != 0;
    int _1590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1592 = _1590 != 0;
    int _1594 = _1576;
    if (!_1432)
    {
        int _1596 = ~_1558;
        int _1598 = _1596 + 1;
        _1594 = _1598;
    }
    int _1600 = _1594;
    float _1602 = 1.0 / _1580;
    bool _1604 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1606 = isnan(1.0);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1612 = _1608 || _1610;
    bool _1614 = !_1588;
    int _1616 = _1614 ? 0 : 1;
    float _1618 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1620 = !_1584;
    int _1622 = _1620 ? 0 : 1;
    bool _1624 = !_1592;
    int _1626 = _1624 ? 0 : 1;
    float _1628 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1618);
    int _1630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1632 = _1630 != 0;
    int _1634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1636 = _1634 != 0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1640 = _1638 != 0;
    float _1642 = -_1496;
    float _1644 = _1642 + 1.0;
    float _1646 = float(_1524);
    float _1648 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1390);
    int _1650 = ~_1570;
    int _1652 = _1650 + 1;
    int _1654 = _1652 + 1;
    int _1656 = _1654;
    if (!_1554)
    {
        int _1658 = ~_1570;
        int _1660 = _1658 + 1;
        _1656 = _1660;
    }
    int _1662 = _1656;
    float _1664 = in.m_57.x;
    float _1666 = in.m_57.y;
    float _1668 = in.m_57.z;
    bool _1670 = !_1632;
    int _1672 = _1670 ? 0 : 1;
    float _1674 = 1.0 / _1646;
    bool _1676 = !_1636;
    int _1678 = _1676 ? 0 : 1;
    float _1680 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1682 = abs(_1672);
    float _1684 = -_100;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1520);
    int _1688 = abs(_1678);
    float _1690 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1470);
    float _1692 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1680);
    float _1694 = float(_1600);
    float _1696 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1508);
    float _1698 = float(_1688);
    float _1700 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1692);
    float _1702 = float(_1682);
    float _1704 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1628);
    float _1706 = float(_1550);
    float _1708 = _1698 * _1694;
    bool _1710 = !_1640;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = _1674 * _100;
    float _1716 = float(_1344);
    float _1718 = _1702 * _1706;
    float _1720 = _1568 ? _1644 : 0.0;
    float _1722 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1510);
    float _1724 = _1716 * _100;
    int _1726 = abs(_1712);
    float _1728 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    if (_1612)
    {
        float _1730 = _1720 * _1602;
        _110 = _1730;
    }
    float _1732 = _110;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1734;
    float _1738 = _1718 * (-2.0);
    float _1740 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1742 = _1728 * _1728;
    float _1744 = _1340 + (-0.5);
    float _1746 = fma(_1738, _1664, _1664);
    float _1748 = fma(_1740, _1740, _1742);
    float _1750 = _1556 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1752 = float(_1662);
    float _1754 = fma(_1552, _1738, _1552);
    float _1756 = float(_1726);
    float _1758 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1746);
    float _1760 = _1708 * (-2.0);
    float _1762 = fma(_1750, _1750, _1748);
    float _1764 = 1.0 / _1736;
    float _1766 = _1756 * _1752;
    float _1768 = fma(_1754, _1732, _1758);
    float _1770 = fma(_1448, _1760, _1448);
    float _1772 = fma(_1760, _1666, _1666);
    float _1774 = _1426 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1776 = in.m_59.x;
    float _1778 = in.m_59.y;
    float _1780 = in.m_59.z;
    float _1782 = _1414 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1784 = _1768 * 0.15915493667125701904296875;
    float _1786 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1788 = _1346 + (-0.5);
    float _1790 = _1766 * (-2.0);
    float _1792 = rsqrt(_1762);
    float _1794 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1786);
    float _1796 = fma(_1788, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1772);
    float _1798 = fma(_1456, _1790, _1456);
    float _1800 = fma(_1790, _1668, _1668);
    float _1802 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1794);
    float _1804 = fma(_1770, _1732, _1796);
    float _1806 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1808 = _1364 + (-0.5);
    float _1810 = _1802 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1812 = _1804 * 0.15915493667125701904296875;
    float _1814 = _1784 * 6.283185482025146484375;
    float _1816 = sin(_1814);
    float _1818 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1800);
    float _1820 = -_1810;
    float _1822 = _1806 + _1820;
    float _1824 = fma(_1798, _1732, _1818);
    bool _1826 = _1810 >= _1806;
    bool _1828 = isnan(_1810);
    bool _1830 = _1826 || _1828;
    bool _1832 = isnan(_1806);
    bool _1834 = _1830 || _1832;
    float _1836 = _1740 * _1792;
    float _1838 = abs(_1822);
    float _1840 = precise::max(_1838, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1776);
    float _1844 = _1824 * 0.15915493667125701904296875;
    float _1846 = _1784 * 6.283185482025146484375;
    float _1848 = cos(_1846);
    float _1850 = precise::min(_1840, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1852 = _586 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1780);
    bool _1856 = !_1834;
    float _1858 = _1856 ? 1.0 : (-1.0);
    float _1860 = _1728 * _1792;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1864 = _1850 + _1862;
    float _1866 = _1852 * _1842;
    float _1868 = _1812 * 6.283185482025146484375;
    float _1870 = sin(_1868);
    float _1872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1778);
    float _1874 = _1362 * _1854;
    float _1876 = _1864 * _1764;
    float _1878 = _1750 * _1792;
    float _1880 = _1366 * _1872;
    float _1882 = _1858 * _1876;
    float _1884 = _1812 * 6.283185482025146484375;
    float _1886 = cos(_1884);
    float _1888 = _1368 * _1882;
    float _1890 = _1888 * 0.15915493667125701904296875;
    float _1892 = _1844 * 6.283185482025146484375;
    float _1894 = cos(_1892);
    float _1896 = _1816 * _1870;
    float _1898 = _1848 * _1870;
    float _1900 = _1844 * 6.283185482025146484375;
    float _1902 = sin(_1900);
    float _1904 = _1816 * _1886;
    float _1906 = _1894 * _1880;
    float _1908 = _1848 * _1886;
    float _1910 = _1870 * _1894;
    float _1912 = _1886 * _1894;
    float _1914 = _1890 * 6.283185482025146484375;
    float _1916 = cos(_1914);
    float _1918 = _1848 * _1906;
    float _1920 = _1816 * _1906;
    float _1922 = fma(_1902, _1908, _1896);
    float _1924 = -_1898;
    float _1926 = fma(_1902, _1904, _1924);
    float _1928 = -_1880;
    float _1930 = _1902 * _1928;
    float _1932 = -_1904;
    float _1934 = fma(_1902, _1898, _1932);
    float _1936 = fma(_1922, _1866, _1918);
    float _1938 = _1890 * 6.283185482025146484375;
    float _1940 = sin(_1938);
    float _1942 = fma(_1912, _1866, _1930);
    float _1944 = fma(_1902, _1896, _1908);
    float _1946 = fma(_1934, _1874, _1936);
    float _1948 = fma(_1926, _1866, _1920);
    float _1950 = fma(_1910, _1874, _1942);
    float _1952 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1954 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1956 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1958 = fma(_1944, _1874, _1948);
    float _1960 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1952);
    float _1962 = -_1916;
    float _1964 = _1962 + 1.0;
    float _1966 = _1878 * _1878;
    float _1968 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1954);
    float _1970 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1956);
    float _1972 = _1836 * _1940;
    float _1974 = _1860 * _1964;
    float _1976 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1960);
    float _1978 = _1860 * _1940;
    float _1980 = fma(_1964, _1966, _1916);
    float _1982 = _1878 * _1940;
    float _1984 = _1836 * _1964;
    float _1986 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1968);
    float _1988 = fma(_1878, _1974, _1972);
    float _1990 = _1976 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1992 = -_1982;
    float _1994 = fma(_1860, _1984, _1992);
    float _1996 = -_1978;
    float _1998 = fma(_1878, _1984, _1996);
    float _2000 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2002 = _1990 * _1988;
    float _2004 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1970);
    float _2006 = fma(_1836, _1984, _1916);
    float _2008 = _1990 * _1994;
    float _2010 = fma(_2000, _1998, _2002);
    float _2012 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2014 = fma(_1878, _1984, _1978);
    float _2016 = fma(_2000, _2006, _2008);
    float _2018 = fma(_1860, _1974, _1916);
    float _2020 = fma(_2012, _1980, _2010);
    float _2022 = fma(_1860, _1984, _1982);
    float _2024 = fma(_2012, _2014, _2016);
    float _2026 = _1990 * _2018;
    float _2028 = _1486 + _2020;
    float _2030 = -_1972;
    float _2032 = fma(_1878, _1974, _2030);
    float _2034 = _1782 + _2024;
    float _2036 = fma(_2000, _2022, _2026);
    float _2038 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2040 = _2028 + _2038;
    float _2042 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2046 = _2034 + _2044;
    float _2048 = fma(_2012, _2032, _2036);
    float _2050 = _2040 * _2040;
    float _2052 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2042);
    float _2054 = _1774 + _2048;
    float _2056 = fma(_2046, _2046, _2050);
    float _2058 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2052);
    float _2060 = sqrt(_2056);
    bool _2062 = _2060 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2064 = _2052;
    float _2066 = _1974;
    float _2068 = _2032;
    float _2070 = _2060;
    if (!_2062)
    {
        _2064 = _2034;
    }
    float _2072 = _2064;
    float _2074 = _2072;
    if (!_2062)
    {
        _2066 = _2028;
    }
    float _2076 = _2066;
    float _2078 = _2076;
    if (!_2062)
    {
        _2068 = _2054;
    }
    float _2080 = _2068;
    bool _2082 = !_2062;
    float _2084 = _2080;
    if (!_2082)
    {
        float _2086 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2090 = _2060 + _2088;
        float _2092 = rsqrt(_2056);
        float _2094 = _2090 * _2086;
        float _2096 = _2054 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2098 = _2094 * 0.15915493667125701904296875;
        float _2100 = _2098 * 6.283185482025146484375;
        float _2102 = cos(_2100);
        float _2104 = _2098 * 6.283185482025146484375;
        float _2106 = sin(_2104);
        float _2108 = _2102 + (-1.0);
        float _2110 = fma(_2106, _2096, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2112 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2114 = _2092 * _2110;
        float _2116 = fma(_2054, _2102, _2112);
        float _2118 = fma(_2046, _2114, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2120 = fma(_2040, _2114, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2084 = _2116;
        _2074 = _2118;
        _2078 = _2120;
    }
    float _2122 = _2084;
    float _2124 = _2074;
    float _2126 = _2078;
    float _2128 = -_1774;
    float _2130 = _2128 + _2122;
    float _2132 = -_1782;
    float _2134 = _2132 + _2124;
    float _2136 = _2058 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2138 = -_1486;
    float _2140 = _2138 + _2126;
    float _2142 = _2130 * _2130;
    float _2144 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2146 = 1.0 / _2136;
    float _2148 = fma(_2134, _2134, _2142);
    float _2150 = fma(_1782, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2144);
    float _2152 = fma(_2140, _2140, _2148);
    float _2154 = fma(_1486, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2150);
    float _2156 = sqrt(_2152);
    float _2158 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2160 = _2158 + _2136;
    float _2162 = _2160 * _2146;
    float _2164 = _2162 * 0.5;
    bool _2166 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2168 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2170 = _2166 || _2168;
    bool _2172 = isnan(0.5);
    bool _2174 = _2170 || _2172;
    bool _2176 = _2156 > 0.0;
    float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2180 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2178);
    bool _2182 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2184 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan(0.5);
    bool _2190 = _2186 || _2188;
    float _2192 = 1.0 / _2180;
    bool _2194 = !_2176;
    float _2196 = _2126;
    float _2198 = _2124;
    float _2200 = _2122;
    float _2202 = _2140;
    float _2204 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2206 = _2152;
    float _2208 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_2194)
    {
        float _2210 = _172 * _172;
        float _2212 = rsqrt(_2152);
        float _2214 = fma(_170, _170, _2210);
        float _2216 = fma(_174, _174, _2214);
        float _2218 = sqrt(_2216);
        float _2220 = _2140 * _2212;
        bool _2222 = _2218 > 0.0;
        float _2224 = _2134 * _2212;
        float _2226 = _2130 * _2212;
        bool _2228 = !_2222;
        _2204 = _2216;
        _2070 = _2220;
        _2208 = _2212;
        if (!_2228)
        {
            float _2230 = rsqrt(_2216);
            float _2232 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2234 = _172 * _2230;
            float _2236 = _170 * _2230;
            float _2238 = _2226 * _2234;
            float _2240 = _174 * _2230;
            float _2242 = fma(_2224, _2236, _2238);
            float _2244 = _2232 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2246 = fma(_2220, _2240, _2242);
            float _2248 = _2246 * _2244;
            float _2250 = fma(_170, _2248, _2124);
            float _2252 = fma(_172, _2248, _2122);
            float _2254 = fma(_174, _2248, _2126);
            _2196 = _2254;
            _2198 = _2250;
            _2200 = _2252;
            _2202 = _2248;
            _2204 = _2230;
            _2206 = _2232;
            _2208 = _2244;
        }
    }
    float _2256 = _2196;
    float _2258 = _2198;
    float _2260 = _2200;
    float _2262 = _2202;
    float _2264 = _2204;
    float _2266 = _2070;
    float _2268 = _2206;
    float _2270 = _2208;
    float _2272 = _2268;
    float _2274 = _2260;
    float _2276 = _2258;
    float _2278 = _2262;
    float _2280 = _2270;
    float _2282 = _2264;
    float _2284 = _2266;
    if (_2190)
    {
        _2272 = 1.0;
    }
    float _2286 = _2272;
    float _2288 = _2286;
    if (_2174)
    {
        _178 = _2256;
    }
    float _2290 = _178;
    float _2292 = _2290;
    if (!_2174)
    {
        float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2296 = _1774 + _2294;
        float _2298 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2300 = _1782 + _2298;
        float _2302 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2304 = -_1782;
        float _2306 = _2304 + _2258;
        float _2308 = _2296 * _2296;
        float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2312 = _1486 + _2310;
        float _2314 = -_1486;
        float _2316 = _2314 + _2256;
        float _2318 = fma(_2300, _2300, _2308);
        float _2320 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2322 = fma(_2312, _2312, _2318);
        float _2324 = sqrt(_2322);
        float _2326 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2328 = precise::min(_2324, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2330 = _2328 * _2320;
        float _2332 = _2326 * _2330;
        float _2334 = -_1774;
        float _2336 = _2334 + _2260;
        float _2338 = fma(_2306, _2332, _1782);
        float _2340 = fma(_2336, _2332, _1774);
        float _2342 = fma(_2316, _2332, _1486);
        _180 = _2302;
        _2274 = _2340;
        _2276 = _2338;
        _2292 = _2342;
        _2278 = _2332;
    }
    float _2344 = _180;
    float _2346 = _2274;
    float _2348 = _2276;
    float _2350 = _2292;
    float _2352 = _2278;
    float _2354 = _2344;
    float _2356 = _2352;
    if (_2190)
    {
        _2280 = 1.0;
    }
    float _2358 = _2280;
    float _2360 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2362 = _2192 * _2360;
    float _2364 = _2358;
    if (!_2190)
    {
        float _2366 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2368 = _2366 * 0.15915493667125701904296875;
        float _2370 = _2368 * 6.283185482025146484375;
        float _2372 = cos(_2370);
        float _2374 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2376 = _2374 * 0.15915493667125701904296875;
        float _2378 = _2368 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = 1.0 / _2372;
        float _2384 = _2376 * 6.283185482025146484375;
        float _2386 = cos(_2384);
        float _2388 = _2380 * _2382;
        float _2390 = _2376 * 6.283185482025146484375;
        float _2392 = sin(_2390);
        float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2394;
        float _2398 = _2386 * _2388;
        float _2400 = 1.0 / _2396;
        float _2402 = 1.0 / _2398;
        float _2404 = _2392 * _2402;
        float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2408 = fma(_2362, _2404, _2406);
        float _2410 = _2408 * _2400;
        float _2412 = precise::clamp(_2410, 0.0, 1.0);
        _2354 = _2376;
        _2356 = _2368;
        _2288 = _2412;
    }
    float _2414 = _2354;
    float _2416 = _2356;
    float _2418 = _2288;
    float _2420 = _2414;
    if (!_2190)
    {
        float _2422 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2424 = _2422 * 0.15915493667125701904296875;
        float _2426 = _2424 * 6.283185482025146484375;
        float _2428 = cos(_2426);
        float _2430 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2432 = _2430 * 0.15915493667125701904296875;
        float _2434 = _2424 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = 1.0 / _2428;
        float _2440 = _2432 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2436 * _2438;
        float _2446 = _2432 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = 1.0 / _2450;
        float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2456 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2454;
        float _2458 = 1.0 / _2456;
        float _2460 = _2448 * _2452;
        float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2464 = fma(_2362, _2460, _2462);
        float _2466 = _2464 * _2458;
        float _2468 = precise::clamp(_2466, 0.0, 1.0);
        float _2470 = -_2468;
        float _2472 = _2470 + 1.0;
        _2420 = _2438;
        _2364 = _2472;
    }
    float _2474 = _2420;
    float _2476 = _2364;
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2480 = _2346 + _2478;
    float _2482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2484 = _2348 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2488 = _2350 + _2486;
    float _2490 = _2480 * _2480;
    float _2492 = fma(_2484, _2484, _2490);
    float _2494 = fma(_2488, _2488, _2492);
    float _2496 = rsqrt(_2494);
    float _2498 = sqrt(_2494);
    float _2500 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2502 = _2484 * _2500;
    float _2504 = _2488 * _2500;
    float _2506 = _2502 * _2502;
    float _2508 = _2504 * _2504;
    float _2510 = _2506 + _2508;
    float _2512 = sqrt(_2510);
    bool _2514 = _2512 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2516 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2518 = _2512 + _2516;
    float _2520 = _2474;
    float _2522 = _2510;
    float _2524 = _2518;
    float _2526 = _2480;
    float _2528 = _2504;
    float _2530 = _2506;
    float _2532 = _2508;
    if (_2514)
    {
        float _2534 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2520 = _2534;
    }
    float _2536 = _2520;
    if (_2514)
    {
        float _2538 = rsqrt(_2510);
        _2522 = _2538;
    }
    float _2540 = _2522;
    if (_2514)
    {
        float _2542 = _2518 * _2536;
        _2524 = _2542;
    }
    float _2544 = _2524;
    if (_2514)
    {
        float _2546 = _2544 * 0.15915493667125701904296875;
        _2282 = _2546;
    }
    float _2548 = _2282;
    float _2550 = _2416;
    if (_2514)
    {
        float _2552 = _2548 * 6.283185482025146484375;
        float _2554 = sin(_2552);
        _2550 = _2554;
    }
    float _2556 = _2550;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2560 = precise::max(0.0, _2558);
    float _2562 = _2536;
    float _2564 = _2560;
    if (_2514)
    {
        float _2566 = _2548 * 6.283185482025146484375;
        float _2568 = cos(_2566);
        _2562 = _2568;
    }
    float _2570 = _2562;
    float _2572 = -_2500;
    float _2574 = -_2560;
    float _2576 = fma(_2480, _2572, _2574);
    if (_2514)
    {
        float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2526 = _2578;
    }
    float _2580 = _2526;
    float _2582 = _2580;
    float _2584 = _2556;
    if (_2514)
    {
        float _2586 = fma(_2556, _2580, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2564 = _2586;
    }
    float _2588 = _2564;
    float _2590 = _2588;
    if (!_2514)
    {
        _2582 = _2502;
    }
    float _2592 = _2582;
    float _2594 = _2592;
    if (_2514)
    {
        float _2596 = _2570 + (-1.0);
        _2584 = _2596;
    }
    float _2598 = _2584;
    float _2600 = _2598;
    if (_2514)
    {
        float _2602 = _2540 * _2588;
        _2284 = _2602;
    }
    float _2604 = _2284;
    if (!_2514)
    {
        _2590 = _2576;
    }
    float _2606 = _2590;
    float _2608 = _2606;
    if (_2514)
    {
        float _2610 = _2598 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2600 = _2610;
    }
    float _2612 = _2600;
    if (_2514)
    {
        float _2614 = _2502 * _2604;
        _2594 = _2614;
    }
    float _2616 = _2594;
    if (_2514)
    {
        float _2618 = _2504 * _2604;
        _2528 = _2618;
    }
    float _2620 = _2528;
    if (_2514)
    {
        float _2622 = fma(_2576, _2570, _2612);
        _2608 = _2622;
    }
    float _2624 = _2608;
    if (_2514)
    {
        float _2626 = _2616 * _2616;
        _2530 = _2626;
    }
    float _2628 = _2530;
    if (_2514)
    {
        float _2630 = _2620 * _2620;
        _2532 = _2630;
    }
    float _2632 = _2532;
    float _2634 = fma(_2624, _2624, _2628);
    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2638 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2636);
    float _2640 = precise::clamp(_2638, 0.0, 1.0);
    float _2642 = _2634 + _2632;
    float _2644 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2646 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2648 = -_2640;
    float _2650 = _2648 + 1.0;
    float _2652 = rsqrt(_2642);
    float _2654 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2644);
    float _2656 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2658 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2660 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2654);
    float _2662 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2646);
    float _2664 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2666 = abs(_2650);
    float _2668 = log2(_2666);
    float _2670 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2656);
    float _2672 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2662);
    float _2674 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2664);
    float _2676 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2678 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2670);
    float _2680 = _2672 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2682 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2674);
    float _2684 = _2652 * _2616;
    float _2686 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2688 = _2652 * _2624;
    float _2690 = _2682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2692 = _2684 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2694 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2696 = _2676 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2698 = _2652 * _2620;
    float _2700 = -_2692;
    float _2702 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2700);
    float _2704 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2694);
    float _2706 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2708 = -_2696;
    float _2710 = fma(_2708, _2658, 1.0);
    float _2712 = -_2698;
    float _2714 = fma(_2712, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2702);
    float _2716 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2704);
    float _2718 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2720 = log2(_2710);
    float _2722 = fma(_2714, -0.5, 0.5);
    float _2724 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2716);
    float _2726 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2728 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2718);
    float _2730 = fma(_2714, 0.5, 0.5);
    float _2732 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2726);
    float _2734 = exp2(_2706);
    float _2736 = _2688 + 1.0;
    float _2738 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2728);
    float _2740 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2732);
    float _2742 = fma(_2730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2744 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2740);
    float _2746 = 1.0 / _2724;
    float _2748 = fma(_2730, _2742, -0.212114393711090087890625);
    float _2750 = fma(_2730, _2748, 1.570728778839111328125);
    float _2752 = sqrt(_2722);
    float _2754 = -_2688;
    float _2756 = fma(_2734, _2736, _2754);
    float _2758 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2738);
    float _2760 = _2720 * 0.693147182464599609375;
    float _2762 = _2760 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2764 = _2758 * _2746;
    float _2766 = _2744 * _2746;
    float _2768 = fma(_2764, 0.5, 0.5);
    float _2770 = fma(_2766, -0.5, 0.5);
    float _2772 = fma(_2756, 0.5, 0.5);
    float _2774 = _2752 * 0.636619746685028076171875;
    float _2776 = -_2750;
    float _2778 = fma(_2774, _2776, 1.0);
    float3 _7949 = float3(_2768, _2770, _2762);
    float _2780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7949, float3(0.0), isnan(_7949)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7949, float3(0.0), isnan(_7949)), level(0.0)).x;
    float3 _7960 = float3(_2768, _2770, _2762);
    float4 _2783 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7960, float3(0.0), isnan(_7960)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7960, float3(0.0), isnan(_7960)), level(0.0)).xyzw;
    float _2785 = _2783.x;
    float _2787 = _2783.y;
    float _2789 = _2783.z;
    float _2791 = _2783.w;
    float2 _7977 = float2(_2778, _2772);
    float3 _2795 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7977, float2(0.0), isnan(_7977)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7977, float2(0.0), isnan(_7977)), level(0.0)).xyz;
    float _2797 = _2795.x;
    float _2799 = _2795.y;
    float _2801 = _2795.z;
    float _2803 = float(uint(_1344));
    float _2805 = trunc(_1714);
    int _2807 = int(_2805);
    int _2809 = ~_1344;
    int _2811 = _2809 + 1;
    float _2813 = _1724 * _152;
    int _2815 = ~_1344;
    int _2817 = _2815 + 1;
    out.m_61.x = _928;
    out.m_61.y = _930;
    out.m_61.z = _932;
    out.m_61.w = _936;
    int _2819 = _1344 + (-1);
    float _2821 = _2668 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2823 = abs(_1616);
    float _2825 = 1.0 / _2803;
    float _2827 = _2680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2829 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2827);
    bool _2831 = !_1360;
    float _2833 = _2831 ? 7.345489978790283203125 : 1.0;
    float _2835 = float(uint(_2807));
    float _2837 = trunc(_2813);
    int _2839 = int(_2837);
    float _2841 = float(_2807);
    float _2843 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2829);
    float _2845 = fma(_2690, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2843);
    int _2847 = as_type<int>(_2825) + (-2);
    float _2849 = exp2(_2821);
    float _2851 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2851;
    float _2855 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2857 = _2855 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2859 = as_type<float>(_2847) * _2835;
    out.gl_Position.x = _2758;
    out.gl_Position.y = _2744;
    out.gl_Position.z = _2845;
    out.gl_Position.w = _2724;
    float _2861 = trunc(_2859);
    float _2863 = precise::max(_2861, 0.0);
    uint _2866 = uint(_2863);
    float _2868 = -_2849;
    float _2870 = _2868 + 1.0;
    int _2872 = _2811 * int(_2866);
    int _2874 = _2872 + _2807;
    float _2876 = float(uint(_2874));
    float _2878 = as_type<float>(_2847) * _2876;
    float _2880 = _2833 * _1340;
    bool _2882 = _2841 >= _1716;
    bool _2884 = isnan(_2841);
    bool _2886 = _2882 || _2884;
    bool _2888 = isnan(_1716);
    bool _2890 = _2886 || _2888;
    float _2892 = float(_2890);
    float _2894 = floor(_2880);
    float _2896 = trunc(_2878);
    float _2898 = precise::max(_2896, 0.0);
    uint _2900 = uint(_2898);
    float _2902 = trunc(_2892);
    int _2904 = int(_2902);
    float _2906 = -_2894;
    float _2908 = _2880 + _2906;
    int _2910 = int(_2866) + int(_2900);
    int _2912 = _2817 * _2910;
    int _2914 = _2912 + _2807;
    int _2916 = ~_2904;
    int _2918 = _2916 + 1;
    int _2920 = _2918 + 1;
    bool _2922 = uint(_2914) >= uint(_1344);
    bool _2924 = !_2922;
    int _2926 = _2924 ? 0 : (-1);
    bool _2928 = _1344 == 0;
    int _2930 = ~_2910;
    int _2932 = _2930 + _2926;
    int _2934 = _2932 + 1;
    float _2936 = _2908 * _1716;
    int _2938 = _1344 * _2934;
    int _2940 = _2938 + _2807;
    int _2942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2944 = _2942 != 0;
    float _2946 = trunc(_2936);
    int _2948 = int(_2946);
    int _2950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2952 = _2950 != 0;
    bool _2954 = !_2928;
    int _2956 = _2954 ? _2940 : (-1);
    bool _2958 = !_2944;
    int _2960 = _2958 ? 0 : 1;
    int _2962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2964 = _2962 != 0;
    int _2966 = _2956 * _2920;
    int _2968 = abs(_2960);
    int _2970 = abs(_1622);
    int _2972 = _2904 * _2819;
    int _2974 = _2972 + _2966;
    int _2976 = abs(_1626);
    int _2978 = _2974 * _2823;
    bool _2980 = !_2964;
    int _2982 = _2980 ? 0 : 1;
    int _2984 = _2948 * _2968;
    int _2986 = _2984 + _2807;
    int _2988 = abs(_2982);
    int _2990 = _2839 * _2970;
    int _2992 = _2990 + _2978;
    int _2994 = _2986 * _2976;
    int _2996 = _2994 + _2992;
    float _2998 = in.m_53.w;
    int _3000 = _2948 * _2988;
    int _3002 = _3000 + _2996;
    float _3004 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3006 = _3004 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3008 = in.m_63.y;
    int _3010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _3012 = _3010 != 0;
    float _3014 = float(uint(_3002));
    float _3016 = 1.0 / _3006;
    int _3018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3020 = _3018 != 0;
    float _3022 = as_type<float>(_2847) * _3014;
    int _3024 = ~_1344;
    int _3026 = _3024 + 1;
    int _3028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _3030 = _3028 != 0;
    int _3032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3034 = _3032 != 0;
    float _3036 = trunc(_3022);
    float _3038 = precise::max(_3036, 0.0);
    uint _3040 = uint(_3038);
    bool _3042 = _2998 > 0.5;
    float _3044 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3046 = _3044 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3048 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3050 = _3026 * int(_3040);
    int _3052 = _3050 + _3002;
    float _3054 = 1.0 / _3046;
    float _3056 = float(uint(_3052));
    float _3058 = _3048 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3060 = as_type<float>(_2847) * _3056;
    float _3062 = -_3008;
    float _3064 = _3062 + 1.0;
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _3066 = trunc(_3060);
    float _3068 = precise::max(_3066, 0.0);
    uint _3070 = uint(_3068);
    int _3072 = _3042 ? as_type<int>(_3064) : as_type<int>(_3008);
    float _3074 = _2857 * _3054;
    bool _3076 = _1346 > 0.5;
    int _3078 = ~_1344;
    int _3080 = _3078 + 1;
    float _3082 = _3020 ? as_type<float>(_3072) : _3008;
    float _3084 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3086 = _3084 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _3088 = _2853 * _3016;
    float _3090 = _3008;
    bool _3092 = _3020;
    bool _3094 = _2952;
    int _3096 = as_type<int>(_2936);
    if (_2952)
    {
        float _3098 = _3076 ? _3064 : _3008;
        _3090 = _3098;
    }
    float _3100 = _3090;
    float _3102 = 1.0 / _3086;
    if (_3012)
    {
        bool _3104 = _1340 > 0.5;
        _3092 = _3104;
    }
    bool _3106 = _3092;
    float _3108 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _3110 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _3108;
    int _3112 = int(_3040) + int(_3070);
    float _3114 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _3116 = _1338 + _3114;
    float _3118 = float(uint(_2986));
    float _3120 = fma(_3082, _3058, -0.5);
    if (_3030)
    {
        bool _3122 = _1364 > 0.5;
        _3094 = _3122;
    }
    bool _3124 = _3094;
    int _3126 = _3080 * _3112;
    int _3128 = _3126 + _3002;
    float _3130 = fma(_3088, _3116, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _3132 = as_type<float>(_2847) * _3118;
    float _3134 = in.m_63.x;
    float _3136 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _3100, -0.5);
    bool _3138 = uint(_3128) >= uint(_1344);
    float _3140 = trunc(_3132);
    float _3142 = precise::max(_3140, 0.0);
    uint _3144 = uint(_3142);
    int _3146 = ~_1344;
    int _3148 = _3146 + 1;
    float _3150 = _3110 * _3102;
    bool _3152 = !_3138;
    int _3154 = _3152 ? 0 : (-1);
    float _3156 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _3158 = _1338 + _3156;
    float _3160 = -_1696;
    float _3162 = fma(_1690, _3120, _3160);
    int _3164 = ~_1344;
    int _3166 = _3164 + 1;
    float _3168 = -_1648;
    float _3170 = fma(_1704, _3136, _3168);
    int _3172 = ~_3112;
    int _3174 = _3172 + _3154;
    int _3176 = _3174 + 1;
    float _3178 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _3180 = _1338 + _3178;
    bool _3182 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _3184 = isnan(_1338);
    bool _3186 = _3182 || _3184;
    bool _3188 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _3190 = _3186 || _3188;
    float _3192 = float(_3190);
    float _3194 = fma(_3074, _3158, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _3196 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _3198 = isnan(_1338);
    bool _3200 = _3196 || _3198;
    bool _3202 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _3204 = _3200 || _3202;
    float _3206 = float(_3204);
    int _3208 = _1344 * _3176;
    int _3210 = _3208 + _3002;
    float _3212 = fma(_3150, _3180, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _3214 = -_3192;
    float _3216 = _3214 + 1.0;
    bool _3218 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _3220 = isnan(_1338);
    bool _3222 = _3218 || _3220;
    bool _3224 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _3226 = _3222 || _3224;
    float _3228 = float(_3226);
    int _3230 = _3148 * int(_3144);
    int _3232 = _3230 + _2986;
    bool _3234 = !_2928;
    int _3236 = _3234 ? _3210 : (-1);
    float _3238 = _3206 * _3216;
    float _3240 = -_3206;
    float _3242 = _3240 + 1.0;
    bool _3244 = _1338 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3246 = isnan(_1338);
    bool _3248 = _3244 || _3246;
    bool _3250 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3252 = _3248 || _3250;
    float _3254 = float(_3252);
    if (_3030)
    {
        float _3256 = -_3134;
        float _3258 = _3256 + 1.0;
        _3096 = as_type<int>(_3258);
    }
    int _3260 = _3096;
    int _3262 = _3236 >> 31;
    float _3264 = float(uint(_3232));
    float _3266 = _3228 * _3242;
    int _3268 = _3262 & 3;
    float _3270 = -_3228;
    float _3272 = _3270 + 1.0;
    float _3274 = as_type<float>(_2847) * _3264;
    int _3276 = _3236 + _3268;
    float _3278 = _3254 * _3272;
    float _3280 = -_3254;
    float _3282 = _3280 + 1.0;
    float _3284 = trunc(_3274);
    float _3286 = precise::max(_3284, 0.0);
    uint _3288 = uint(_3286);
    int _3290 = _3276 >> 2;
    float _3292 = _3130 * _3278;
    float _3294 = as_type<float>(_3268);
    float _3296 = as_type<float>(_3290);
    int _3298 = as_type<int>(_3274);
    if (!_3012)
    {
        _3294 = _3134;
    }
    float _3300 = _3294;
    int _3302 = _3290 << 4;
    int _3304 = _3302 + 368;
    float _3306 = fma(_3282, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3292);
    float _3308 = _3300;
    if (!_3030)
    {
        _3296 = _3134;
    }
    float _3310 = _3296;
    float _3312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3314 = uint(int(uint(_3304) >> uint(2)));
    uint _3316 = uint(int(uint(int(_3314)) >> uint(2)));
    int _3318 = int(_3314) & 3;
    float _3320 = (*spvDescriptorSet0.vp_c9)._m0[int(_3316)][_3318];
    int _3322 = int(_3314) + 1;
    uint _3324 = uint(int(uint(_3322) >> uint(2)));
    int _3326 = _3322 & 3;
    float _3328 = (*spvDescriptorSet0.vp_c9)._m0[int(_3324)][_3326];
    float _3330 = _3310;
    if (_3012)
    {
        float _3332 = -_3134;
        float _3334 = _3332 + 1.0;
        _3298 = as_type<int>(_3334);
    }
    int _3336 = _3298;
    if (_3030)
    {
        float _3338 = _3124 ? as_type<float>(_3260) : _3134;
        _3330 = _3338;
    }
    float _3340 = _3330;
    float _3342 = fma(_3194, _3266, _3306);
    int _3344 = _3236 & 3;
    bool _3346 = _3344 != 0;
    if (_3012)
    {
        float _3348 = _3106 ? as_type<float>(_3336) : _3134;
        _3308 = _3348;
    }
    float _3350 = _3308;
    float _3352 = fma(_3212, _3238, _3342);
    int _3354 = _3304 + 8;
    uint _3356 = uint(int(uint(_3354) >> uint(2)));
    uint _3358 = uint(int(uint(int(_3356)) >> uint(2)));
    int _3360 = int(_3356) & 3;
    float _3362 = (*spvDescriptorSet0.vp_c9)._m0[int(_3358)][_3360];
    int _3364 = int(_3356) + 1;
    uint _3366 = uint(int(uint(_3364) >> uint(2)));
    int _3368 = _3364 & 3;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[int(_3366)][_3368];
    int _3372 = _3236 & 3;
    bool _3374 = _3372 != 0;
    bool _3376 = uint(_3344) > 1u;
    float _3378 = fma(_3350, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _3380 = _3312 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3382 = _3374 ? 0 : 1;
    bool _3384 = _3344 != 3;
    float _3386 = fma(_3380, _3340, -0.5);
    int _3388 = int(_3144) + int(_3288);
    float _3390 = fma(_1700, _3378, _1466);
    bool _3392 = uint(_3344) >= 2u;
    float _3394 = fma(_1722, _3386, _1686);
    int _3396 = _3166 * _3388;
    int _3398 = _3396 + _2986;
    int _3400 = ~_3382;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    float _3406 = _3394 + 0.5;
    int _3408 = _3392 ? 0 : 1;
    int _3410 = _3404;
    if (!_3376)
    {
        int _3412 = ~_3382;
        int _3414 = _3412 + 1;
        _3410 = _3414;
    }
    int _3416 = _3410;
    bool _3418 = uint(_3398) >= uint(_1344);
    bool _3420 = !_3346;
    int _3422 = _3420 ? 0 : 1;
    int _3424 = ~_3408;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    int _3430 = abs(_3416);
    bool _3432 = _3344 != 3;
    int _3434 = _3428;
    if (_3384)
    {
        int _3436 = ~_3408;
        int _3438 = _3436 + 1;
        _3434 = _3438;
    }
    int _3440 = _3434;
    int _3442 = abs(_3422);
    bool _3444 = !_3432;
    int _3446 = _3444 ? 0 : (-1);
    int _3448 = ~_3430;
    int _3450 = _3448 + 1;
    int _3452 = _3450 + 1;
    int _3454 = abs(_3440);
    int _3456 = abs(_3446);
    int _3458 = _3452 * as_type<int>(_3328);
    int _3460 = ~_3442;
    int _3462 = _3460 + 1;
    int _3464 = _3462 + 1;
    bool _3466 = !_3034;
    int _3468 = _3466 ? 0 : 1;
    int _3470 = _3464 * as_type<int>(_3320);
    int _3472 = _3470 + _3458;
    int _3474 = ~_3454;
    int _3476 = _3474 + 1;
    int _3478 = _3476 + 1;
    bool _3480 = !_3418;
    int _3482 = _3480 ? 0 : (-1);
    int _3484 = abs(_3468);
    int _3486 = _3478 * as_type<int>(_3362);
    int _3488 = _3486 + _3472;
    int _3490 = ~_3456;
    int _3492 = _3490 + 1;
    int _3494 = _3492 + 1;
    float _3496 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3498 = ~_3388;
    int _3500 = _3498 + _3482;
    int _3502 = _3500 + 1;
    int _3504 = ~_3484;
    int _3506 = _3504 + 1;
    int _3508 = _3506 + 1;
    int _3510 = _3494 * as_type<int>(_3370);
    int _3512 = _3510 + _3488;
    float _3514 = fma(_3192, (*spvDescriptorSet0.vp_c9)._m0[134].x, _3352);
    int _3516 = _1344 * _3502;
    int _3518 = _3516 + _2986;
    float _3520 = _3170 + 0.5;
    float _3522 = _3162 + 0.5;
    float _3524 = _3390 + 0.5;
    int _3526 = _3512 * _3508;
    float _3528 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _3530 = !_2928;
    int _3532 = _3530 ? _3518 : (-1);
    float _3534 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3536 = _2418 * _2476;
    out.m_67.x = _3524;
    out.m_67.y = _3520;
    out.m_67.z = _3406;
    out.m_67.w = _3522;
    float _3538 = _3528 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3540 = _3534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3542 = _3496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3544 = _3514 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3546 = _3532 * _3484;
    int _3548 = _3546 + _3526;
    bool _3550 = _2418 > 0.0;
    bool _3552 = isnan(_2418);
    bool _3554 = _3550 || _3552;
    bool _3556 = isnan(0.0);
    bool _3558 = _3554 || _3556;
    float _3560 = _3536 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _3538;
    out.m_69.y = _3540;
    out.m_69.z = _3542;
    out.m_69.w = _3544;
    bool _3562 = _2476 <= 0.0;
    bool _3564 = !_3558;
    bool _3566 = _3562 || _3564;
    float _3568 = _3560 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3570 = float(_3548);
    float _3572 = _2845 + _2724;
    float _3574 = _2870 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3568;
    float _3576 = _3572 * 0.5;
    float _3578 = _3574 * _2780;
    out.m_71.x = _3570;
    float _3580 = _2801 * _3578;
    float _3582 = _2791 * _3578;
    float _3584 = -_3574;
    float _3586 = _3584 + 1.0;
    out.m_73.z = _3576;
    out.m_73.w = _2724;
    float _3588 = fma(_2797, _3582, _2785);
    float _3590 = fma(_2799, _3582, _2787);
    float _3592 = _2791 * _3586;
    float _3594 = fma(_2791, _3580, _2789);
    out.m_75.x = _3588;
    out.m_75.y = _3590;
    out.m_75.z = _3594;
    out.m_75.w = _3592;
    if (!_3566)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3596 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3596;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

