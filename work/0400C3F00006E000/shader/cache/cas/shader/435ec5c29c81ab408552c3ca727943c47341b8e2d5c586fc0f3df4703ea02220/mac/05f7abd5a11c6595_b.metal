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
    bool _956 = false;
    bool _740 = false;
    bool _642 = false;
    bool _414 = false;
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
        float _3254 = as_type<float>(_118);
        out.gl_Position.z = _3254;
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
        float _3309 = as_type<float>(_144);
        out.gl_Position.z = _3309;
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
    float _178 = _174;
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
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _200 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _200 + _206;
    bool _210 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _212 = isnan(_200);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _200 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _224;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _242 = 1.0 / _236;
    float _244 = 1.0 / _232;
    float _246 = _204 * _238;
    bool _248 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_200);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_220;
    float _262 = _260 + 1.0;
    float _264 = _258 * _262;
    float _266 = _208 * _242;
    bool _268 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_200);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    bool _284 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_200);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -_258;
    float _302 = _300 + 1.0;
    float _304 = -_278;
    float _306 = _304 + 1.0;
    float _308 = _228 * _244;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _314;
    float _318 = _294 * _306;
    float _320 = fma(_282, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = fma(_312, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = fma(_316, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _326 = _278 * _302;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = _322 * _318;
    float _334 = _324 * _318;
    float _336 = _320 * _318;
    float _338 = -_294;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _348 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _350 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _336);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_298, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_344, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_330, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_356, _326, _346);
    float _372 = fma(_354, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_364, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _376 = fma(_368, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _378 = fma(_358, _326, _348);
    float _380 = fma(_360, _326, _350);
    float _382 = fma(_372, _264, _370);
    float _384 = fma(_374, _264, _378);
    float _386 = fma(_376, _264, _380);
    float _388 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].x, _382);
    float _390 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].z, _386);
    bool _394 = !_240;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        _412 = _156;
    }
    _414 = false;
    float _416 = _412;
    float _418 = in.m_55.x;
    float _420 = in.m_55.y;
    float _422 = in.m_55.z;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = _416 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _416 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _438 = _416 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _448 = 1.0 / _434;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = 1.0 / _442;
    float _454 = _392 * _422;
    float _456 = 1.0 / _446;
    bool _458 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _460 = isnan(_416);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = _426 * _448;
    bool _472 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_416);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _390 * _420;
    bool _486 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _488 = isnan(_416);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = _388 * _418;
    float _500 = _430 * _452;
    float _502 = -_468;
    float _504 = _502 + 1.0;
    float _506 = -_496;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _510;
    float _514 = _482 * _504;
    bool _516 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _518 = isnan(_416);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _532 = _438 * _456;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _538;
    float _542 = -_482;
    float _544 = _542 + 1.0;
    float _546 = _526 * _508;
    float _548 = fma(_536, _500, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _550 = fma(_512, _500, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _552 = fma(_540, _500, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _554 = _496 * _544;
    float _556 = _548 * _546;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _562 = _550 * _546;
    float _564 = _552 * _546;
    float _566 = -_526;
    float _568 = _566 + 1.0;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _574 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].x, _562);
    float _576 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].y, _556);
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].z, _564);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _580;
    float _584 = fma(_530, _532, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _586 = fma(_572, _532, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _588 = fma(_560, _532, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _594;
    float _598 = fma(_584, _554, _574);
    float _600 = fma(_582, _470, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _602 = fma(_592, _470, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _604 = fma(_596, _470, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _606 = fma(_586, _554, _576);
    float _608 = fma(_588, _554, _578);
    float _610 = fma(_600, _514, _598);
    float _612 = fma(_602, _514, _606);
    float _614 = fma(_604, _514, _608);
    float _616 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[110].x, _610);
    float _618 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[110].y, _612);
    float _620 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[110].z, _614);
    bool _622 = !_450;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        _640 = _156;
    }
    _642 = false;
    float _644 = _640;
    bool _646 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _648 = isnan(_644);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _662 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _664 = isnan(_644);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _680 = _644 + _678;
    float _682 = -_656;
    float _684 = _682 + 1.0;
    bool _686 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _688 = 1.0 / _660;
    float _690 = _672 * _684;
    float _692 = -_672;
    float _694 = _692 + 1.0;
    float _696 = _676 * _688;
    float _698 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _700 = fma(_696, _680, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _702 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _704 = _700 * _690;
    float _706 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _708 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[115].x, _704);
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[116].x, _708);
    float _718 = _716 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _720 = !_686;
    float _738;
    if (!_720)
    {
        float _722 = in.m_53.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _738 = _736;
        _740 = true;
    }
    else
    {
        _738 = _156;
    }
    _740 = false;
    float _742 = _738;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _746 = _742 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _750 = _742 + _748;
    bool _752 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _754 = isnan(_742);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _770 = _742 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _780 = 1.0 / _766;
    bool _782 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _784 = 1.0 / _778;
    float _786 = 1.0 / _774;
    float _788 = _746 * _780;
    bool _790 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _792 = isnan(_742);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = -_762;
    float _804 = _802 + 1.0;
    float _806 = _800 * _804;
    float _808 = _750 * _784;
    bool _810 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _812 = isnan(_742);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _822;
    bool _826 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _828 = isnan(_742);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _842 = -_800;
    float _844 = _842 + 1.0;
    float _846 = -_820;
    float _848 = _846 + 1.0;
    float _850 = _770 * _786;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _852;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _856;
    float _860 = _836 * _848;
    float _862 = fma(_824, _850, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _864 = fma(_854, _850, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _866 = fma(_858, _850, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _868 = _820 * _844;
    float _870 = _862 * _860;
    float _872 = _864 * _860;
    float _874 = _866 * _860;
    float _876 = -_836;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[123].x, _874);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[123].y, _872);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _892;
    float _896 = fma(_840, _808, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _898 = fma(_882, _808, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _900 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[123].z, _870);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _902;
    float _906 = fma(_886, _808, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _908;
    float _912 = fma(_896, _868, _888);
    float _914 = fma(_894, _788, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _916 = fma(_904, _788, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _918 = fma(_898, _868, _890);
    float _920 = fma(_910, _788, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _922 = fma(_906, _868, _900);
    float _924 = fma(_914, _806, _912);
    float _926 = fma(_916, _806, _918);
    float _928 = fma(_920, _806, _922);
    float _930 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[126].x, _924);
    float _932 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[126].y, _926);
    float _934 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[126].z, _928);
    bool _936 = !_782;
    float _954;
    if (!_936)
    {
        float _938 = in.m_53.x;
        float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _942 = _938 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _946 = _944 * _940;
        float _948 = floor(_946);
        float _950 = -_948;
        float _952 = _946 + _950;
        _954 = _952;
        _956 = true;
    }
    else
    {
        _954 = _156;
    }
    _956 = false;
    float _958 = _954;
    float _960 = in.m_53.x;
    float _962 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _964 = int(_962);
    float _966 = in.m_53.z;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _970 = _968 != 0;
    float _972 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _974 = in.m_53.y;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _978 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _980 = in.m_42.x;
    float _982 = in.m_42.y;
    float _984 = in.m_42.z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _988 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _990 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _992 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _988);
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _996 = _960 * 2.0;
    float _998 = _960 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1000 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1002 = floor(_996);
    float _1004 = -_976;
    float _1006 = fma(_998, 2.0, _1004);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1010 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1000);
    float _1012 = _974 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1014 = _974 * 2.0;
    float _1016 = fma(_1012, -2.0, _986);
    float _1018 = _966 * 2.0;
    float _1020 = _982 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1022 = _982 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1024 = _982 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1026 = floor(_1014);
    float _1028 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1020);
    float _1030 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1022);
    float _1032 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1024);
    float _1034 = _960 + _974;
    float _1036 = _960 + _966;
    float _1038 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1028);
    float _1040 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1030);
    float _1042 = floor(_1018);
    float _1044 = _1034 + (-1.0);
    float _1046 = _974 + _966;
    float _1048 = _1036 + (-1.0);
    float _1050 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1032);
    bool _1052 = _1002 > 0.0;
    float _1054 = _1046 + (-1.0);
    float _1056 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1058 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1060 = int(_1058);
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1064 = _1054;
    if (!_970)
    {
        _1064 = _966;
    }
    float _1066 = _1064;
    float _1068 = -_100;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1006);
    float _1072 = _1066;
    if (_970)
    {
        _1072 = _974;
    }
    float _1074 = _1072;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1078 = _1042 > 0.0;
    float _1080 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1082 = _1042 >= 0.0;
    bool _1084 = isnan(_1042);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1076);
    float _1094 = _1074;
    float _1096 = _1076;
    if (!_970)
    {
        _1094 = _966;
    }
    float _1098 = _1094;
    float _1100 = _1098;
    if (!_970)
    {
        _1096 = _974;
    }
    float _1102 = _1096;
    float _1104 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _992);
    float _1106 = _1102;
    if (_970)
    {
        _1100 = _974;
    }
    float _1108 = _1100;
    float _1110 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1112 = log2(_1110);
    if (_970)
    {
        _1106 = _960;
    }
    float _1114 = _1106;
    bool _1116 = _1002 >= 0.0;
    bool _1118 = isnan(_1002);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1128 = _1090 ? 0 : 1;
    float _1130 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].z, _994);
    float _1132 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1134 = ~_1128;
    int _1136 = _1134 + 1;
    int _1138 = _1136 + 1;
    float _1140 = -_1008;
    float _1142 = fma(_1132, 2.0, _1140);
    bool _1144 = _1026 >= 0.0;
    bool _1146 = isnan(_1026);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    float _1154 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1010);
    int _1156 = _1138;
    if (!_1078)
    {
        int _1158 = ~_1128;
        int _1160 = _1158 + 1;
        _1156 = _1160;
    }
    int _1162 = _1156;
    float _1164 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1016);
    float _1166 = _1112 * _100;
    bool _1168 = _1026 > 0.0;
    int _1170 = _1124 ? 0 : 1;
    float _1172 = rsqrt(_1154);
    bool _1174 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1182 = _1178 || _1180;
    int _1184 = _1152 ? 0 : 1;
    float _1186 = float(_1060);
    float _1188 = exp2(_1166);
    int _1190 = ~_1170;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1198 = 1.0 + _1196;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1210 = _1208 != 0;
    int _1212 = _1194;
    if (!_1052)
    {
        int _1214 = ~_1170;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = 1.0 / _1186;
    float _1222 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1224 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1226 = isnan(1.0);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1232 = _1228 || _1230;
    bool _1234 = !_1206;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1240 = !_1202;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = 1.0 / _1198;
    bool _1246 = !_1210;
    int _1248 = _1246 ? 0 : 1;
    float _1250 = fma(_1126, -2.0, _1238);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1262 = _1260 != 0;
    float _1264 = -_1188;
    float _1266 = _1264 + 1.0;
    int _1268 = ~_1184;
    int _1270 = _1268 + 1;
    int _1272 = _1270 + 1;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1276 = _1272;
    if (!_1168)
    {
        int _1278 = ~_1184;
        int _1280 = _1278 + 1;
        _1276 = _1280;
    }
    int _1282 = _1276;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1286 = !_1254;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = in.m_57.x;
    float _1292 = in.m_57.y;
    float _1294 = in.m_57.z;
    bool _1296 = !_1258;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1274);
    int _1302 = abs(_1288);
    float _1304 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1284);
    int _1306 = abs(_1298);
    float _1308 = -_100;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1142);
    float _1312 = _1220 * _100;
    float _1314 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1092);
    float _1316 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1300);
    float _1318 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1304);
    float _1320 = float(_964);
    float _1322 = float(_1218);
    float _1324 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1250);
    float _1326 = _1182 ? _1266 : 0.0;
    float _1328 = _1320 * _100;
    float _1330 = float(_1302);
    float _1332 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1130);
    float _1334 = float(_1162);
    if (_1232)
    {
        float _1336 = _1326 * _1244;
        _110 = _1336;
    }
    float _1338 = _110;
    bool _1340 = !_1262;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = float(_1306);
    float _1346 = _1330 * _1334;
    int _1348 = abs(_1342);
    float _1350 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1352 = _1344 * _1322;
    float _1354 = _1346 * (-2.0);
    float _1356 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1358 = _1350 * _1350;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1360;
    float _1364 = _960 + (-0.5);
    float _1366 = fma(_1354, _1290, _1290);
    float _1368 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1370 = fma(_1356, _1356, _1358);
    float _1372 = float(_1282);
    float _1374 = fma(_1222, _1354, _1222);
    float _1376 = float(_1348);
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1366);
    float _1380 = fma(_1368, _1368, _1370);
    float _1382 = _1352 * (-2.0);
    float _1384 = 1.0 / _1362;
    float _1386 = _1376 * _1372;
    float _1388 = fma(_1374, _1338, _1378);
    float _1390 = _1040 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1392 = fma(_1062, _1382, _1062);
    float _1394 = fma(_1382, _1292, _1292);
    float _1396 = _974 + (-0.5);
    float _1398 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1400 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1402 = in.m_59.x;
    float _1404 = in.m_59.y;
    float _1406 = in.m_59.z;
    float _1408 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1394);
    float _1410 = _1386 * (-2.0);
    float _1412 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1400);
    float _1414 = rsqrt(_1380);
    float _1416 = fma(_1392, _1338, _1408);
    float _1418 = fma(_1056, _1410, _1056);
    float _1420 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1412);
    float _1422 = fma(_1410, _1294, _1294);
    float _1424 = _1416 * 0.15915493667125701904296875;
    float _1426 = _1104 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1428 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1430 = _1388 * 0.15915493667125701904296875;
    float _1432 = _966 + (-0.5);
    float _1434 = _1424 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    bool _1438 = _1428 >= _1426;
    bool _1440 = isnan(_1428);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan(_1426);
    bool _1446 = _1442 || _1444;
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1422);
    float _1450 = -_1428;
    float _1452 = _1426 + _1450;
    float _1454 = _1356 * _1414;
    float _1456 = fma(_1418, _1338, _1448);
    float _1458 = _1430 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = abs(_1452);
    float _1464 = precise::max(_1462, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1402);
    float _1468 = _1456 * 0.15915493667125701904296875;
    float _1470 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1404);
    float _1472 = precise::min(_1464, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1474 = _1350 * _1414;
    bool _1476 = !_1446;
    float _1478 = _1476 ? 1.0 : (-1.0);
    float _1480 = _1430 * 6.283185482025146484375;
    float _1482 = cos(_1480);
    float _1484 = _1368 * _1414;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1488 = _1472 + _1486;
    float _1490 = _1488 * _1384;
    float _1492 = _1424 * 6.283185482025146484375;
    float _1494 = cos(_1492);
    float _1496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1406);
    float _1498 = _972 * _1466;
    float _1500 = _978 * _1470;
    float _1502 = _1478 * _1490;
    float _1504 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1506 = _1460 * _1436;
    float _1508 = _990 * _1496;
    float _1510 = _1468 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = _1504 * _1502;
    float _1516 = _1482 * _1436;
    float _1518 = _1514 * 0.15915493667125701904296875;
    float _1520 = _1468 * 6.283185482025146484375;
    float _1522 = sin(_1520);
    float _1524 = _1482 * _1494;
    float _1526 = _1460 * _1494;
    float _1528 = _1436 * _1512;
    float _1530 = _1512 * _1500;
    float _1532 = _1494 * _1512;
    float _1534 = _1518 * 6.283185482025146484375;
    float _1536 = cos(_1534);
    float _1538 = _1482 * _1530;
    float _1540 = _1460 * _1530;
    float _1542 = fma(_1522, _1524, _1506);
    float _1544 = -_1516;
    float _1546 = fma(_1522, _1526, _1544);
    float _1548 = -_1500;
    float _1550 = _1522 * _1548;
    float _1552 = -_1526;
    float _1554 = fma(_1522, _1516, _1552);
    float _1556 = fma(_1542, _1498, _1538);
    float _1558 = _1518 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = fma(_1532, _1498, _1550);
    float _1564 = fma(_1522, _1506, _1524);
    float _1566 = fma(_1554, _1508, _1556);
    float _1568 = fma(_1546, _1498, _1540);
    float _1570 = fma(_1528, _1508, _1562);
    float _1572 = _1484 * _1484;
    float _1574 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1576 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1578 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1580 = fma(_1564, _1508, _1568);
    float _1582 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1574);
    float _1584 = -_1536;
    float _1586 = _1584 + 1.0;
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    float _1590 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1578);
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1582);
    float _1594 = _1454 * _1560;
    float _1596 = _1474 * _1586;
    float _1598 = fma(_1586, _1572, _1536);
    float _1600 = _1454 * _1586;
    float _1602 = _1474 * _1560;
    float _1604 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1588);
    float _1606 = _1484 * _1560;
    float _1608 = fma(_1484, _1596, _1594);
    float _1610 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1612 = -_1602;
    float _1614 = fma(_1484, _1600, _1612);
    float _1616 = -_1606;
    float _1618 = fma(_1474, _1600, _1616);
    float _1620 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1622 = _1610 * _1608;
    float _1624 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1590);
    float _1626 = fma(_1454, _1600, _1536);
    float _1628 = _1610 * _1618;
    float _1630 = fma(_1620, _1614, _1622);
    float _1632 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1634 = fma(_1484, _1600, _1602);
    float _1636 = fma(_1620, _1626, _1628);
    float _1638 = fma(_1474, _1596, _1536);
    float _1640 = fma(_1632, _1598, _1630);
    float _1642 = fma(_1474, _1600, _1606);
    float _1644 = fma(_1632, _1634, _1636);
    float _1646 = _1610 * _1638;
    float _1648 = _1080 + _1640;
    float _1650 = -_1594;
    float _1652 = fma(_1484, _1596, _1650);
    float _1654 = _1398 + _1644;
    float _1656 = fma(_1620, _1642, _1646);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1660 = _1648 + _1658;
    float _1662 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1666 = _1654 + _1664;
    float _1668 = fma(_1632, _1652, _1656);
    float _1670 = _1660 * _1660;
    float _1672 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1662);
    float _1674 = _1390 + _1668;
    float _1676 = fma(_1666, _1666, _1670);
    float _1678 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1672);
    float _1680 = sqrt(_1676);
    bool _1682 = _1680 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1684 = _1652;
    float _1686 = _1672;
    float _1688 = _1596;
    float _1690 = _1660;
    float _1692 = _1648;
    if (!_1682)
    {
        _1684 = _1654;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (!_1682)
    {
        _1686 = _1648;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (!_1682)
    {
        _1688 = _1674;
    }
    float _1702 = _1688;
    bool _1704 = !_1682;
    float _1706 = _1702;
    if (!_1704)
    {
        float _1708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1712 = _1680 + _1710;
        float _1714 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = rsqrt(_1676);
        float _1718 = _1712 * _1708;
        float _1720 = _1718 * 0.15915493667125701904296875;
        float _1722 = _1720 * 6.283185482025146484375;
        float _1724 = cos(_1722);
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = sin(_1726);
        float _1730 = _1724 + (-1.0);
        float _1732 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1734 = fma(_1728, _1714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1736 = fma(_1674, _1724, _1732);
        float _1738 = _1716 * _1734;
        float _1740 = fma(_1666, _1738, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1742 = fma(_1660, _1738, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1706 = _1736;
        _1696 = _1740;
        _1700 = _1742;
    }
    float _1744 = _1706;
    float _1746 = _1696;
    float _1748 = _1700;
    float _1750 = -_1390;
    float _1752 = _1750 + _1744;
    float _1754 = -_1398;
    float _1756 = _1754 + _1746;
    float _1758 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1760 = -_1080;
    float _1762 = _1760 + _1748;
    float _1764 = _1752 * _1752;
    float _1766 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1768 = 1.0 / _1758;
    float _1770 = fma(_1756, _1756, _1764);
    float _1772 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1766);
    float _1774 = fma(_1762, _1762, _1770);
    float _1776 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1772);
    float _1778 = sqrt(_1774);
    float _1780 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1782 = _1780 + _1758;
    float _1784 = _1782 * _1768;
    float _1786 = _1784 * 0.5;
    bool _1788 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1790 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan(0.5);
    bool _1796 = _1792 || _1794;
    bool _1798 = _1778 > 0.0;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1802 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1800);
    bool _1804 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(0.5);
    bool _1812 = _1808 || _1810;
    float _1814 = 1.0 / _1802;
    float _1816 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1818 = _1748;
    float _1820 = _1746;
    float _1822 = _1752;
    float _1824 = _1756;
    float _1826 = _1762;
    float _1828 = _1774;
    float _1830 = _1744;
    if (!_1798)
    {
        _1816 = _1744;
    }
    float _1832 = _1816;
    bool _1834 = !_1798;
    float _1836 = _1832;
    if (!_1834)
    {
        float _1838 = _172 * _172;
        float _1840 = rsqrt(_1774);
        float _1842 = fma(_170, _170, _1838);
        float _1844 = fma(_174, _174, _1842);
        float _1846 = sqrt(_1844);
        float _1848 = _1762 * _1840;
        bool _1850 = _1846 > 0.0;
        float _1852 = _1756 * _1840;
        float _1854 = _1752 * _1840;
        float _1856 = _1840;
        _1824 = _1854;
        _1690 = _1852;
        if (!_1850)
        {
            _1856 = _1744;
        }
        float _1858 = _1856;
        bool _1860 = !_1850;
        _1836 = _1858;
        if (!_1860)
        {
            float _1862 = rsqrt(_1844);
            float _1864 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1866 = _172 * _1862;
            float _1868 = _170 * _1862;
            float _1870 = _1854 * _1866;
            float _1872 = _174 * _1862;
            float _1874 = fma(_1852, _1868, _1870);
            float _1876 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1878 = fma(_1848, _1872, _1874);
            float _1880 = _1878 * _1876;
            float _1882 = fma(_170, _1880, _1746);
            float _1884 = fma(_172, _1880, _1744);
            float _1886 = fma(_174, _1880, _1748);
            _1836 = _1884;
            _1818 = _1886;
            _1820 = _1882;
            _1822 = _1868;
            _1824 = _1874;
            _1826 = _1880;
            _1828 = _1864;
        }
    }
    float _1888 = _1836;
    float _1890 = _1818;
    float _1892 = _1820;
    float _1894 = _1822;
    float _1896 = _1824;
    float _1898 = _1690;
    float _1900 = _1826;
    float _1902 = _1828;
    float _1904 = _1902;
    float _1906 = _1894;
    float _1908 = _1892;
    float _1910 = _1888;
    float _1912 = _1896;
    float _1914 = _1898;
    if (_1812)
    {
        _1904 = 1.0;
    }
    float _1916 = _1904;
    float _1918 = _1916;
    if (_1796)
    {
        _1906 = _1888;
    }
    float _1920 = _1906;
    float _1922 = _1920;
    if (_1796)
    {
        _1830 = _1890;
    }
    float _1924 = _1830;
    float _1926 = _1924;
    if (!_1796)
    {
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1930 = _1390 + _1928;
        float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1934 = _1398 + _1932;
        float _1936 = -_1398;
        float _1938 = _1936 + _1892;
        float _1940 = -_1390;
        float _1942 = _1940 + _1888;
        float _1944 = _1930 * _1930;
        float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1948 = _1080 + _1946;
        float _1950 = -_1080;
        float _1952 = _1950 + _1890;
        float _1954 = fma(_1934, _1934, _1944);
        float _1956 = fma(_1948, _1948, _1954);
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1960 = sqrt(_1956);
        float _1962 = precise::min(_1960, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1964 = _1962 * _1958;
        float _1966 = fma(_1938, _1964, _1398);
        float _1968 = fma(_1942, _1964, _1390);
        float _1970 = fma(_1952, _1964, _1080);
        _1922 = _1968;
        _1908 = _1966;
        _1926 = _1970;
        _1910 = _1942;
    }
    float _1972 = _1922;
    float _1974 = _1908;
    float _1976 = _1926;
    float _1978 = _1910;
    float _1980 = _1978;
    if (_1812)
    {
        _1980 = 1.0;
    }
    float _1982 = _1980;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1986 = _1814 * _1984;
    float _1988 = _1982;
    if (!_1812)
    {
        float _1990 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1992 = _1990 * 0.15915493667125701904296875;
        float _1994 = _1992 * 6.283185482025146484375;
        float _1996 = cos(_1994);
        float _1998 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2000 = _1998 * 0.15915493667125701904296875;
        float _2002 = _1992 * 6.283185482025146484375;
        float _2004 = sin(_2002);
        float _2006 = 1.0 / _1996;
        float _2008 = _2000 * 6.283185482025146484375;
        float _2010 = cos(_2008);
        float _2012 = _2004 * _2006;
        float _2014 = _2000 * 6.283185482025146484375;
        float _2016 = sin(_2014);
        float _2018 = _2010 * _2012;
        float _2020 = 1.0 / _2018;
        float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2024 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2022;
        float _2026 = 1.0 / _2024;
        float _2028 = _2016 * _2020;
        float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2032 = fma(_1986, _2028, _2030);
        float _2034 = _2032 * _2026;
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        _178 = _2026;
        _1918 = _2036;
    }
    float _2038 = _178;
    float _2040 = _1918;
    float _2042 = _2038;
    if (!_1812)
    {
        float _2044 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2046 = _2044 * 0.15915493667125701904296875;
        float _2048 = _2046 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2054 = _2052 * 0.15915493667125701904296875;
        float _2056 = _2046 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        float _2060 = 1.0 / _2050;
        float _2062 = _2054 * 6.283185482025146484375;
        float _2064 = cos(_2062);
        float _2066 = _2058 * _2060;
        float _2068 = _2054 * 6.283185482025146484375;
        float _2070 = sin(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = 1.0 / _2072;
        float _2076 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2078 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2076;
        float _2080 = 1.0 / _2078;
        float _2082 = _2070 * _2074;
        float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2086 = fma(_1986, _2082, _2084);
        float _2088 = _2086 * _2080;
        float _2090 = precise::clamp(_2088, 0.0, 1.0);
        float _2092 = -_2090;
        float _2094 = _2092 + 1.0;
        _2042 = _2060;
        _1912 = _2074;
        _1988 = _2094;
    }
    float _2096 = _2042;
    float _2098 = _1912;
    float _2100 = _1988;
    float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2104 = _1972 + _2102;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2108 = _1974 + _2106;
    float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2112 = _1976 + _2110;
    float _2114 = _2104 * _2104;
    float _2116 = fma(_2108, _2108, _2114);
    float _2118 = fma(_2112, _2112, _2116);
    float _2120 = rsqrt(_2118);
    float _2122 = sqrt(_2118);
    float _2124 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2126 = _2108 * _2124;
    float _2128 = _2112 * _2124;
    float _2130 = _2126 * _2126;
    float _2132 = _2128 * _2128;
    float _2134 = _2130 + _2132;
    float _2136 = sqrt(_2134);
    bool _2138 = _2136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2142 = _2136 + _2140;
    float _2144 = _2096;
    float _2146 = _2134;
    float _2148 = _2142;
    float _2150 = _2104;
    float _2152 = _2128;
    float _2154 = _2130;
    float _2156 = _2132;
    if (_2138)
    {
        float _2158 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2158;
    }
    float _2160 = _2144;
    if (_2138)
    {
        float _2162 = rsqrt(_2134);
        _2146 = _2162;
    }
    float _2164 = _2146;
    if (_2138)
    {
        float _2166 = _2142 * _2160;
        _2148 = _2166;
    }
    float _2168 = _2148;
    if (_2138)
    {
        float _2170 = _2168 * 0.15915493667125701904296875;
        _1914 = _2170;
    }
    float _2172 = _1914;
    float _2174 = _2098;
    if (_2138)
    {
        float _2176 = _2172 * 6.283185482025146484375;
        float _2178 = sin(_2176);
        _2174 = _2178;
    }
    float _2180 = _2174;
    float _2182 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2184 = precise::max(0.0, _2182);
    float _2186 = _1900;
    float _2188 = _2182;
    float _2190 = _2184;
    if (_2138)
    {
        float _2192 = _2172 * 6.283185482025146484375;
        float _2194 = cos(_2192);
        _2186 = _2194;
    }
    float _2196 = _2186;
    float _2198 = -_2124;
    float _2200 = -_2184;
    float _2202 = fma(_2104, _2198, _2200);
    if (!_2138)
    {
        _2150 = _2126;
    }
    float _2204 = _2150;
    float _2206 = _2204;
    if (_2138)
    {
        float _2208 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2188 = _2208;
    }
    float _2210 = _2188;
    float _2212 = _2180;
    float _2214 = _2210;
    if (_2138)
    {
        float _2216 = fma(_2180, _2210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2212 = _2216;
    }
    float _2218 = _2212;
    if (!_2138)
    {
        _2214 = _2202;
    }
    float _2220 = _2214;
    float _2222 = _2220;
    if (_2138)
    {
        float _2224 = _2196 + (-1.0);
        _2190 = _2224;
    }
    float _2226 = _2190;
    float _2228 = _2226;
    if (_2138)
    {
        float _2230 = _2164 * _2218;
        _1692 = _2230;
    }
    float _2232 = _1692;
    if (_2138)
    {
        float _2234 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2228 = _2234;
    }
    float _2236 = _2228;
    if (_2138)
    {
        float _2238 = _2126 * _2232;
        _2206 = _2238;
    }
    float _2240 = _2206;
    if (_2138)
    {
        float _2242 = _2128 * _2232;
        _2152 = _2242;
    }
    float _2244 = _2152;
    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2248 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2246);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    if (_2138)
    {
        float _2252 = fma(_2202, _2196, _2236);
        _2222 = _2252;
    }
    float _2254 = _2222;
    if (_2138)
    {
        float _2256 = _2240 * _2240;
        _2154 = _2256;
    }
    float _2258 = _2154;
    if (_2138)
    {
        float _2260 = _2244 * _2244;
        _2156 = _2260;
    }
    float _2262 = _2156;
    float _2264 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2266 = -_2250;
    float _2268 = _2266 + 1.0;
    float _2270 = fma(_2254, _2254, _2258);
    float _2272 = abs(_2268);
    float _2274 = log2(_2272);
    float _2276 = _2270 + _2262;
    float _2278 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2280 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2282 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2278);
    float _2284 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2286 = rsqrt(_2276);
    float _2288 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2282);
    float _2290 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2264);
    float _2292 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2294 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2284);
    float _2296 = _2288 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2298 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2290);
    float _2300 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2292);
    float _2302 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2294);
    float _2304 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2308 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2300);
    float _2310 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2312 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2316 = _2286 * _2240;
    float _2318 = _2286 * _2254;
    float _2320 = _2286 * _2244;
    float _2322 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2314);
    float _2324 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2326 = -_2304;
    float _2328 = fma(_2326, _2280, 1.0);
    float _2330 = _2308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2332 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2322);
    float _2334 = -_2324;
    float _2336 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2334);
    float _2338 = exp2(_2312);
    float _2340 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2342 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2332);
    float _2344 = -_2320;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2336);
    float _2348 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2350 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2340);
    float _2352 = fma(_2346, -0.5, 0.5);
    float _2354 = log2(_2328);
    float _2356 = fma(_2346, 0.5, 0.5);
    float _2358 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2348);
    float _2360 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2350);
    float _2362 = fma(_2356, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2364 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2358);
    float _2366 = 1.0 / _2342;
    float _2368 = _2318 + 1.0;
    float _2370 = fma(_2356, _2362, -0.212114393711090087890625);
    float _2372 = -_2318;
    float _2374 = fma(_2338, _2368, _2372);
    float _2376 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2364);
    float _2378 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2360);
    float _2380 = sqrt(_2352);
    float _2382 = fma(_2356, _2370, 1.570728778839111328125);
    float _2384 = _2354 * 0.693147182464599609375;
    float _2386 = fma(_2374, 0.5, 0.5);
    float _2388 = _2384 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2390 = _2376 * _2366;
    float _2392 = _2378 * _2366;
    float _2394 = fma(_2390, 0.5, 0.5);
    float _2396 = fma(_2392, -0.5, 0.5);
    float _2398 = _2380 * 0.636619746685028076171875;
    float _2400 = -_2382;
    float _2402 = fma(_2398, _2400, 1.0);
    float3 _6907 = float3(_2394, _2396, _2388);
    float _2404 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6907, float3(0.0), isnan(_6907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6907, float3(0.0), isnan(_6907)), level(0.0)).x;
    float3 _6918 = float3(_2394, _2396, _2388);
    float4 _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6918, float3(0.0), isnan(_6918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6918, float3(0.0), isnan(_6918)), level(0.0)).xyzw;
    float _2409 = _2407.x;
    float _2411 = _2407.y;
    float _2413 = _2407.z;
    float _2415 = _2407.w;
    float2 _6935 = float2(_2402, _2386);
    float3 _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6935, float2(0.0), isnan(_6935)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6935, float2(0.0), isnan(_6935)), level(0.0)).xyz;
    float _2421 = _2419.x;
    float _2423 = _2419.y;
    float _2425 = _2419.z;
    float _2427 = float(uint(_964));
    float _2429 = trunc(_1312);
    int _2431 = int(_2429);
    int _2433 = ~_964;
    int _2435 = _2433 + 1;
    out.m_61.x = _710;
    out.m_61.y = _712;
    out.m_61.z = _714;
    out.m_61.w = _718;
    int _2437 = ~_964;
    int _2439 = _2437 + 1;
    float _2441 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2443 = abs(_1236);
    float _2445 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2447 = 1.0 / _2427;
    float _2449 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2445);
    float _2451 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2449);
    float _2453 = float(uint(_2431));
    float _2455 = exp2(_2441);
    float _2457 = float(_2431);
    float _2459 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2451);
    int _2461 = as_type<int>(_2447) + (-2);
    out.gl_Position.x = _2376;
    out.gl_Position.y = _2378;
    out.gl_Position.z = _2459;
    out.gl_Position.w = _2342;
    float _2463 = as_type<float>(_2461) * _2453;
    float _2465 = trunc(_2463);
    float _2467 = precise::max(_2465, 0.0);
    uint _2470 = uint(_2467);
    float _2472 = -_2455;
    float _2474 = _2472 + 1.0;
    int _2476 = _2435 * int(_2470);
    int _2478 = _2476 + _2431;
    float _2480 = float(uint(_2478));
    float _2482 = as_type<float>(_2461) * _2480;
    bool _2484 = !_970;
    float _2486 = _2484 ? 7.345489978790283203125 : 1.0;
    float _2488 = trunc(_2482);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    float _2494 = _2486 * _960;
    bool _2496 = _2457 >= _1320;
    bool _2498 = isnan(_2457);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan(_1320);
    bool _2504 = _2500 || _2502;
    float _2506 = float(_2504);
    float _2508 = floor(_2494);
    int _2510 = int(_2470) + int(_2492);
    float _2512 = trunc(_2506);
    int _2514 = int(_2512);
    int _2516 = _2439 * _2510;
    int _2518 = _2516 + _2431;
    float _2520 = -_2508;
    float _2522 = _2494 + _2520;
    bool _2524 = uint(_2518) >= uint(_964);
    bool _2526 = !_2524;
    int _2528 = _2526 ? 0 : (-1);
    bool _2530 = _964 == 0;
    int _2532 = ~_2510;
    int _2534 = _2532 + _2528;
    int _2536 = _2534 + 1;
    float _2538 = _2522 * _1320;
    float _2540 = _1328 * _152;
    int _2542 = ~_2514;
    int _2544 = _2542 + 1;
    int _2546 = _2544 + 1;
    int _2548 = _964 * _2536;
    int _2550 = _2548 + _2431;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2554 = _2552 != 0;
    float _2556 = trunc(_2538);
    int _2558 = int(_2556);
    int _2560 = _964 + (-1);
    bool _2562 = !_2530;
    int _2564 = _2562 ? _2550 : (-1);
    bool _2566 = !_2554;
    int _2568 = _2566 ? 0 : 1;
    int _2570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2572 = _2570 != 0;
    float _2574 = trunc(_2540);
    int _2576 = int(_2574);
    int _2578 = _2564 * _2546;
    int _2580 = abs(_2568);
    int _2582 = abs(_1248);
    int _2584 = _2514 * _2560;
    int _2586 = _2584 + _2578;
    int _2588 = abs(_1242);
    int _2590 = _2586 * _2443;
    bool _2592 = !_2572;
    int _2594 = _2592 ? 0 : 1;
    int _2596 = _2558 * _2580;
    int _2598 = _2596 + _2431;
    int _2600 = abs(_2594);
    float _2602 = in.m_53.w;
    int _2604 = _2576 * _2588;
    int _2606 = _2604 + _2590;
    int _2608 = ~_964;
    int _2610 = _2608 + 1;
    int _2612 = _2598 * _2582;
    int _2614 = _2612 + _2606;
    float _2616 = float(uint(_2598));
    int _2618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2620 = _2618 != 0;
    int _2622 = _2558 * _2600;
    int _2624 = _2622 + _2614;
    int _2626 = ~_964;
    int _2628 = _2626 + 1;
    int _2630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2632 = _2630 != 0;
    float _2634 = float(uint(_2624));
    int _2636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2638 = _2636 != 0;
    float _2640 = as_type<float>(_2461) * _2634;
    int _2642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2644 = _2642 != 0;
    float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2648 = _2646 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2650 = trunc(_2640);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    bool _2656 = _2602 > 0.5;
    float _2658 = 1.0 / _2648;
    int _2660 = _2628 * int(_2654);
    int _2662 = _2660 + _2624;
    float _2664 = float(uint(_2662));
    float _2666 = as_type<float>(_2461) * _2664;
    float _2668 = in.m_63.y;
    float _2670 = trunc(_2666);
    float _2672 = precise::max(_2670, 0.0);
    uint _2674 = uint(_2672);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2676 = as_type<float>(_2461) * _2616;
    int _2678 = int(_2654) + int(_2674);
    float _2680 = trunc(_2676);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    float _2686 = -_2668;
    float _2688 = _2686 + 1.0;
    int _2690 = _2610 * _2678;
    int _2692 = _2690 + _2624;
    int _2694 = _2656 ? as_type<int>(_2688) : as_type<int>(_2668);
    bool _2696 = uint(_2692) >= uint(_964);
    float _2698 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2702 = _974 > 0.5;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2706 = _958 + _2704;
    bool _2708 = !_2696;
    int _2710 = _2708 ? 0 : (-1);
    float _2712 = 1.0 / _2700;
    int _2714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2716 = _2714 != 0;
    int _2718 = ~_2678;
    int _2720 = _2718 + _2710;
    int _2722 = _2720 + 1;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2724;
    float _2728 = _2716 ? as_type<float>(_2694) : _2668;
    float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2732 = _2730 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2734 = _2668;
    bool _2736 = _2702;
    bool _2738 = _2716;
    int _2740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].w);
    if (_2620)
    {
        float _2742 = _2702 ? _2688 : _2668;
        _2734 = _2742;
    }
    float _2744 = _2734;
    int _2746 = _964 * _2722;
    int _2748 = _2746 + _2624;
    float _2750 = in.m_63.x;
    if (_2632)
    {
        bool _2752 = _966 > 0.5;
        _2736 = _2752;
    }
    bool _2754 = _2736;
    float _2756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2758 = ~_964;
    int _2760 = _2758 + 1;
    float _2762 = _2726 * _2658;
    bool _2764 = !_2530;
    int _2766 = _2764 ? _2748 : (-1);
    if (_2638)
    {
        bool _2768 = _960 > 0.5;
        _2738 = _2768;
    }
    bool _2770 = _2738;
    int _2772 = _2760 * int(_2684);
    int _2774 = _2772 + _2598;
    int _2776 = _2766 >> 31;
    float _2778 = _2732 * _2712;
    bool _2780 = _958 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2782 = isnan(_958);
    bool _2784 = _2780 || _2782;
    bool _2786 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2788 = _2784 || _2786;
    float _2790 = float(_2788);
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2794 = _958 + _2792;
    float _2796 = float(uint(_2774));
    float _2798 = fma(_2778, _2706, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2800 = _2776 & 3;
    float _2802 = -_2790;
    float _2804 = _2802 + 1.0;
    bool _2806 = _958 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2808 = isnan(_958);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = as_type<float>(_2461) * _2796;
    int _2820 = _2766 + _2800;
    float _2822 = fma(_2762, _2794, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2824 = _958 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2826 = isnan(_958);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2832 = _2828 || _2830;
    float _2834 = float(_2832);
    float _2836 = _2816 * _2804;
    float _2838 = -_2816;
    float _2840 = _2838 + 1.0;
    int _2842 = _2820 >> 2;
    float _2844 = _2756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2846 = _2756;
    float _2848 = _2840;
    int _2850 = _2842;
    if (!_2638)
    {
        _2846 = _2750;
    }
    float _2852 = _2846;
    float _2854 = _2834 * _2840;
    int _2856 = _2842 << 4;
    int _2858 = _2856 + 368;
    float _2860 = fma(_2728, _2844, -0.5);
    float _2862 = _2852;
    if (!_2638)
    {
        _2848 = _2852;
    }
    float _2864 = _2848;
    float _2866 = _2822 * _2854;
    float _2868 = _2864;
    if (_2638)
    {
        _2862 = _2750;
    }
    float _2870 = _2862;
    float _2872 = -_2834;
    float _2874 = _2872 + 1.0;
    uint _2876 = uint(int(uint(_2858) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    float _2892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2894 = _2870;
    if (_2638)
    {
        float _2896 = -_2870;
        float _2898 = _2896 + 1.0;
        _2850 = as_type<int>(_2898);
    }
    int _2900 = _2850;
    if (_2632)
    {
        float _2902 = -_2870;
        float _2904 = _2902 + 1.0;
        _2740 = as_type<int>(_2904);
    }
    int _2906 = _2740;
    float _2908 = -_1324;
    float _2910 = fma(_1314, _2860, _2908);
    float _2912 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2744, -0.5);
    float _2914 = fma(_2874, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2866);
    if (_2638)
    {
        float _2916 = _2770 ? as_type<float>(_2900) : _2870;
        _2868 = _2916;
    }
    float _2918 = _2868;
    int _2920 = _2858 + 8;
    uint _2922 = uint(int(uint(_2920) >> uint(2)));
    uint _2924 = uint(int(uint(int(_2922)) >> uint(2)));
    int _2926 = int(_2922) & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    int _2930 = int(_2922) + 1;
    uint _2932 = uint(int(uint(_2930) >> uint(2)));
    int _2934 = _2930 & 3;
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[int(_2932)][_2934];
    if (_2632)
    {
        float _2938 = _2754 ? as_type<float>(_2906) : _2870;
        _2894 = _2938;
    }
    float _2940 = _2894;
    float _2942 = fma(_2798, _2836, _2914);
    int _2944 = _2766 & 3;
    bool _2946 = _2944 != 0;
    float _2948 = trunc(_2818);
    float _2950 = precise::max(_2948, 0.0);
    uint _2952 = uint(_2950);
    float _2954 = -_1164;
    float _2956 = fma(_1318, _2912, _2954);
    bool _2958 = uint(_2944) > 1u;
    float _2960 = _2892 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2962 = _2766 & 3;
    bool _2964 = _2962 != 0;
    float _2966 = fma(_2918, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2968 = uint(_2944) >= 2u;
    float _2970 = fma(_2960, _2940, -0.5);
    int _2972 = _2964 ? 0 : 1;
    float _2974 = fma(_1316, _2966, _1070);
    bool _2976 = _2944 != 3;
    float _2978 = fma(_1332, _2970, _1310);
    int _2980 = ~_2972;
    int _2982 = _2980 + 1;
    int _2984 = _2982 + 1;
    int _2986 = int(_2684) + int(_2952);
    float _2988 = _2978 + 0.5;
    int _2990 = _2984;
    if (!_2958)
    {
        int _2992 = ~_2972;
        int _2994 = _2992 + 1;
        _2990 = _2994;
    }
    int _2996 = _2990;
    int _2998 = ~_964;
    int _3000 = _2998 + 1;
    int _3002 = abs(_2996);
    bool _3004 = !_2946;
    int _3006 = _3004 ? 0 : 1;
    int _3008 = _3000 * _2986;
    int _3010 = _3008 + _2598;
    int _3012 = _2968 ? 0 : 1;
    bool _3014 = _2944 != 3;
    int _3016 = ~_3012;
    int _3018 = _3016 + 1;
    int _3020 = _3018 + 1;
    bool _3022 = !_3014;
    int _3024 = _3022 ? 0 : (-1);
    int _3026 = abs(_3006);
    int _3028 = _3020;
    if (_2976)
    {
        int _3030 = ~_3012;
        int _3032 = _3030 + 1;
        _3028 = _3032;
    }
    int _3034 = _3028;
    int _3036 = ~_3002;
    int _3038 = _3036 + 1;
    int _3040 = _3038 + 1;
    bool _3042 = uint(_3010) >= uint(_964);
    int _3044 = abs(_3024);
    int _3046 = _3040 * as_type<int>(_2890);
    int _3048 = abs(_3034);
    int _3050 = ~_3026;
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    bool _3056 = !_2644;
    int _3058 = _3056 ? 0 : 1;
    int _3060 = _3054 * as_type<int>(_2882);
    int _3062 = _3060 + _3046;
    int _3064 = ~_3048;
    int _3066 = _3064 + 1;
    int _3068 = _3066 + 1;
    bool _3070 = !_3042;
    int _3072 = _3070 ? 0 : (-1);
    int _3074 = abs(_3058);
    int _3076 = _3068 * as_type<int>(_2928);
    int _3078 = _3076 + _3062;
    int _3080 = ~_3044;
    int _3082 = _3080 + 1;
    int _3084 = _3082 + 1;
    float _3086 = _934 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3088 = ~_2986;
    int _3090 = _3088 + _3072;
    int _3092 = _3090 + 1;
    int _3094 = ~_3074;
    int _3096 = _3094 + 1;
    int _3098 = _3096 + 1;
    int _3100 = _3084 * as_type<int>(_2936);
    int _3102 = _3100 + _3078;
    float _3104 = fma(_2790, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2942);
    int _3106 = _964 * _3092;
    int _3108 = _3106 + _2598;
    float _3110 = _2974 + 0.5;
    int _3112 = _3102 * _3098;
    float _3114 = _930 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3116 = _2956 + 0.5;
    float _3118 = _2910 + 0.5;
    bool _3120 = !_2530;
    int _3122 = _3120 ? _3108 : (-1);
    float _3124 = _932 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3126 = _3114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3128 = _3086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _3110;
    out.m_67.y = _3116;
    out.m_67.z = _2988;
    out.m_67.w = _3118;
    float _3130 = _3124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3132 = _2040 * _2100;
    float _3134 = _3104 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3136 = _3122 * _3074;
    int _3138 = _3136 + _3112;
    bool _3140 = _2040 > 0.0;
    bool _3142 = isnan(_2040);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(0.0);
    bool _3148 = _3144 || _3146;
    float _3150 = _3132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _3126;
    out.m_69.y = _3130;
    out.m_69.z = _3128;
    out.m_69.w = _3134;
    bool _3152 = _2100 <= 0.0;
    bool _3154 = !_3148;
    bool _3156 = _3152 || _3154;
    float _3158 = _3150 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3160 = float(_3138);
    float _3162 = _2459 + _2342;
    float _3164 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3158;
    float _3166 = _3162 * 0.5;
    float _3168 = _3164 * _2404;
    out.m_71.x = _3160;
    float _3170 = _2415 * _3168;
    float _3172 = _2425 * _3168;
    float _3174 = -_3164;
    float _3176 = _3174 + 1.0;
    out.m_73.z = _3166;
    out.m_73.w = _2342;
    float _3178 = fma(_2421, _3170, _2409);
    float _3180 = fma(_2423, _3170, _2411);
    float _3182 = _2415 * _3176;
    float _3184 = fma(_2415, _3172, _2413);
    out.m_75.x = _3178;
    out.m_75.y = _3180;
    out.m_75.z = _3184;
    out.m_75.w = _3182;
    if (!_3156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3186 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3186;
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
    bool _956 = false;
    bool _740 = false;
    bool _642 = false;
    bool _414 = false;
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
        float _3254 = as_type<float>(_118);
        out.gl_Position.z = _3254;
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
        float _3309 = as_type<float>(_144);
        out.gl_Position.z = _3309;
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
    float _178 = _174;
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
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _200 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _200 + _206;
    bool _210 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _212 = isnan(_200);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _200 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _224;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _242 = 1.0 / _236;
    float _244 = 1.0 / _232;
    float _246 = _204 * _238;
    bool _248 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_200);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_220;
    float _262 = _260 + 1.0;
    float _264 = _258 * _262;
    float _266 = _208 * _242;
    bool _268 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_200);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    bool _284 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_200);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -_258;
    float _302 = _300 + 1.0;
    float _304 = -_278;
    float _306 = _304 + 1.0;
    float _308 = _228 * _244;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _314;
    float _318 = _294 * _306;
    float _320 = fma(_282, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = fma(_312, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = fma(_316, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _326 = _278 * _302;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = _322 * _318;
    float _334 = _324 * _318;
    float _336 = _320 * _318;
    float _338 = -_294;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _348 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _350 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _336);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_298, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_344, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_330, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_356, _326, _346);
    float _372 = fma(_354, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_364, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _376 = fma(_368, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _378 = fma(_358, _326, _348);
    float _380 = fma(_360, _326, _350);
    float _382 = fma(_372, _264, _370);
    float _384 = fma(_374, _264, _378);
    float _386 = fma(_376, _264, _380);
    float _388 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].x, _382);
    float _390 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].z, _386);
    bool _394 = !_240;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        _412 = _156;
    }
    _414 = false;
    float _416 = _412;
    float _418 = in.m_55.x;
    float _420 = in.m_55.y;
    float _422 = in.m_55.z;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = _416 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _416 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _438 = _416 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _448 = 1.0 / _434;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = 1.0 / _442;
    float _454 = _392 * _422;
    float _456 = 1.0 / _446;
    bool _458 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _460 = isnan(_416);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = _426 * _448;
    bool _472 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_416);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _390 * _420;
    bool _486 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _488 = isnan(_416);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = _388 * _418;
    float _500 = _430 * _452;
    float _502 = -_468;
    float _504 = _502 + 1.0;
    float _506 = -_496;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _510;
    float _514 = _482 * _504;
    bool _516 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _518 = isnan(_416);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _532 = _438 * _456;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _538;
    float _542 = -_482;
    float _544 = _542 + 1.0;
    float _546 = _526 * _508;
    float _548 = fma(_536, _500, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _550 = fma(_512, _500, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _552 = fma(_540, _500, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _554 = _496 * _544;
    float _556 = _548 * _546;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _562 = _550 * _546;
    float _564 = _552 * _546;
    float _566 = -_526;
    float _568 = _566 + 1.0;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _574 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].x, _562);
    float _576 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].y, _556);
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].z, _564);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _580;
    float _584 = fma(_530, _532, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _586 = fma(_572, _532, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _588 = fma(_560, _532, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _594;
    float _598 = fma(_584, _554, _574);
    float _600 = fma(_582, _470, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _602 = fma(_592, _470, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _604 = fma(_596, _470, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _606 = fma(_586, _554, _576);
    float _608 = fma(_588, _554, _578);
    float _610 = fma(_600, _514, _598);
    float _612 = fma(_602, _514, _606);
    float _614 = fma(_604, _514, _608);
    float _616 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[110].x, _610);
    float _618 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[110].y, _612);
    float _620 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[110].z, _614);
    bool _622 = !_450;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        _640 = _156;
    }
    _642 = false;
    float _644 = _640;
    bool _646 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _648 = isnan(_644);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _662 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _664 = isnan(_644);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _680 = _644 + _678;
    float _682 = -_656;
    float _684 = _682 + 1.0;
    bool _686 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _688 = 1.0 / _660;
    float _690 = _672 * _684;
    float _692 = -_672;
    float _694 = _692 + 1.0;
    float _696 = _676 * _688;
    float _698 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _700 = fma(_696, _680, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _702 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _704 = _700 * _690;
    float _706 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _708 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[115].x, _704);
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[116].x, _708);
    float _718 = _716 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _720 = !_686;
    float _738;
    if (!_720)
    {
        float _722 = in.m_53.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _738 = _736;
        _740 = true;
    }
    else
    {
        _738 = _156;
    }
    _740 = false;
    float _742 = _738;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _746 = _742 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _750 = _742 + _748;
    bool _752 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _754 = isnan(_742);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _770 = _742 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _780 = 1.0 / _766;
    bool _782 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _784 = 1.0 / _778;
    float _786 = 1.0 / _774;
    float _788 = _746 * _780;
    bool _790 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _792 = isnan(_742);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = -_762;
    float _804 = _802 + 1.0;
    float _806 = _800 * _804;
    float _808 = _750 * _784;
    bool _810 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _812 = isnan(_742);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _822;
    bool _826 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _828 = isnan(_742);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _842 = -_800;
    float _844 = _842 + 1.0;
    float _846 = -_820;
    float _848 = _846 + 1.0;
    float _850 = _770 * _786;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _852;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _856;
    float _860 = _836 * _848;
    float _862 = fma(_824, _850, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _864 = fma(_854, _850, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _866 = fma(_858, _850, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _868 = _820 * _844;
    float _870 = _862 * _860;
    float _872 = _864 * _860;
    float _874 = _866 * _860;
    float _876 = -_836;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[123].x, _874);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[123].y, _872);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _892;
    float _896 = fma(_840, _808, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _898 = fma(_882, _808, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _900 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[123].z, _870);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _902;
    float _906 = fma(_886, _808, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _908;
    float _912 = fma(_896, _868, _888);
    float _914 = fma(_894, _788, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _916 = fma(_904, _788, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _918 = fma(_898, _868, _890);
    float _920 = fma(_910, _788, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _922 = fma(_906, _868, _900);
    float _924 = fma(_914, _806, _912);
    float _926 = fma(_916, _806, _918);
    float _928 = fma(_920, _806, _922);
    float _930 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[126].x, _924);
    float _932 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[126].y, _926);
    float _934 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[126].z, _928);
    bool _936 = !_782;
    float _954;
    if (!_936)
    {
        float _938 = in.m_53.x;
        float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _942 = _938 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _946 = _944 * _940;
        float _948 = floor(_946);
        float _950 = -_948;
        float _952 = _946 + _950;
        _954 = _952;
        _956 = true;
    }
    else
    {
        _954 = _156;
    }
    _956 = false;
    float _958 = _954;
    float _960 = in.m_53.x;
    float _962 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _964 = int(_962);
    float _966 = in.m_53.z;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _970 = _968 != 0;
    float _972 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _974 = in.m_53.y;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _978 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _980 = in.m_42.x;
    float _982 = in.m_42.y;
    float _984 = in.m_42.z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _988 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _990 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _992 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _988);
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _996 = _960 * 2.0;
    float _998 = _960 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1000 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1002 = floor(_996);
    float _1004 = -_976;
    float _1006 = fma(_998, 2.0, _1004);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1010 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1000);
    float _1012 = _974 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1014 = _974 * 2.0;
    float _1016 = fma(_1012, -2.0, _986);
    float _1018 = _966 * 2.0;
    float _1020 = _982 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1022 = _982 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1024 = _982 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1026 = floor(_1014);
    float _1028 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1020);
    float _1030 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1022);
    float _1032 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1024);
    float _1034 = _960 + _974;
    float _1036 = _960 + _966;
    float _1038 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1028);
    float _1040 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1030);
    float _1042 = floor(_1018);
    float _1044 = _1034 + (-1.0);
    float _1046 = _974 + _966;
    float _1048 = _1036 + (-1.0);
    float _1050 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1032);
    bool _1052 = _1002 > 0.0;
    float _1054 = _1046 + (-1.0);
    float _1056 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1058 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1060 = int(_1058);
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1064 = _1054;
    if (!_970)
    {
        _1064 = _966;
    }
    float _1066 = _1064;
    float _1068 = -_100;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1006);
    float _1072 = _1066;
    if (_970)
    {
        _1072 = _974;
    }
    float _1074 = _1072;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1078 = _1042 > 0.0;
    float _1080 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1082 = _1042 >= 0.0;
    bool _1084 = isnan(_1042);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1076);
    float _1094 = _1074;
    float _1096 = _1076;
    if (!_970)
    {
        _1094 = _966;
    }
    float _1098 = _1094;
    float _1100 = _1098;
    if (!_970)
    {
        _1096 = _974;
    }
    float _1102 = _1096;
    float _1104 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _992);
    float _1106 = _1102;
    if (_970)
    {
        _1100 = _974;
    }
    float _1108 = _1100;
    float _1110 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1112 = log2(_1110);
    if (_970)
    {
        _1106 = _960;
    }
    float _1114 = _1106;
    bool _1116 = _1002 >= 0.0;
    bool _1118 = isnan(_1002);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1128 = _1090 ? 0 : 1;
    float _1130 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].z, _994);
    float _1132 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1134 = ~_1128;
    int _1136 = _1134 + 1;
    int _1138 = _1136 + 1;
    float _1140 = -_1008;
    float _1142 = fma(_1132, 2.0, _1140);
    bool _1144 = _1026 >= 0.0;
    bool _1146 = isnan(_1026);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    float _1154 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1010);
    int _1156 = _1138;
    if (!_1078)
    {
        int _1158 = ~_1128;
        int _1160 = _1158 + 1;
        _1156 = _1160;
    }
    int _1162 = _1156;
    float _1164 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1016);
    float _1166 = _1112 * _100;
    bool _1168 = _1026 > 0.0;
    int _1170 = _1124 ? 0 : 1;
    float _1172 = rsqrt(_1154);
    bool _1174 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1182 = _1178 || _1180;
    int _1184 = _1152 ? 0 : 1;
    float _1186 = float(_1060);
    float _1188 = exp2(_1166);
    int _1190 = ~_1170;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1198 = 1.0 + _1196;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1210 = _1208 != 0;
    int _1212 = _1194;
    if (!_1052)
    {
        int _1214 = ~_1170;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = 1.0 / _1186;
    float _1222 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1224 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1226 = isnan(1.0);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1232 = _1228 || _1230;
    bool _1234 = !_1206;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1240 = !_1202;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = 1.0 / _1198;
    bool _1246 = !_1210;
    int _1248 = _1246 ? 0 : 1;
    float _1250 = fma(_1126, -2.0, _1238);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1262 = _1260 != 0;
    float _1264 = -_1188;
    float _1266 = _1264 + 1.0;
    int _1268 = ~_1184;
    int _1270 = _1268 + 1;
    int _1272 = _1270 + 1;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1276 = _1272;
    if (!_1168)
    {
        int _1278 = ~_1184;
        int _1280 = _1278 + 1;
        _1276 = _1280;
    }
    int _1282 = _1276;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1286 = !_1254;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = in.m_57.x;
    float _1292 = in.m_57.y;
    float _1294 = in.m_57.z;
    bool _1296 = !_1258;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1274);
    int _1302 = abs(_1288);
    float _1304 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1284);
    int _1306 = abs(_1298);
    float _1308 = -_100;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1142);
    float _1312 = _1220 * _100;
    float _1314 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1092);
    float _1316 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1300);
    float _1318 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1304);
    float _1320 = float(_964);
    float _1322 = float(_1218);
    float _1324 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1250);
    float _1326 = _1182 ? _1266 : 0.0;
    float _1328 = _1320 * _100;
    float _1330 = float(_1302);
    float _1332 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1130);
    float _1334 = float(_1162);
    if (_1232)
    {
        float _1336 = _1326 * _1244;
        _110 = _1336;
    }
    float _1338 = _110;
    bool _1340 = !_1262;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = float(_1306);
    float _1346 = _1330 * _1334;
    int _1348 = abs(_1342);
    float _1350 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1352 = _1344 * _1322;
    float _1354 = _1346 * (-2.0);
    float _1356 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1358 = _1350 * _1350;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1360;
    float _1364 = _960 + (-0.5);
    float _1366 = fma(_1354, _1290, _1290);
    float _1368 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1370 = fma(_1356, _1356, _1358);
    float _1372 = float(_1282);
    float _1374 = fma(_1222, _1354, _1222);
    float _1376 = float(_1348);
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1366);
    float _1380 = fma(_1368, _1368, _1370);
    float _1382 = _1352 * (-2.0);
    float _1384 = 1.0 / _1362;
    float _1386 = _1376 * _1372;
    float _1388 = fma(_1374, _1338, _1378);
    float _1390 = _1040 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1392 = fma(_1062, _1382, _1062);
    float _1394 = fma(_1382, _1292, _1292);
    float _1396 = _974 + (-0.5);
    float _1398 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1400 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1402 = in.m_59.x;
    float _1404 = in.m_59.y;
    float _1406 = in.m_59.z;
    float _1408 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1394);
    float _1410 = _1386 * (-2.0);
    float _1412 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1400);
    float _1414 = rsqrt(_1380);
    float _1416 = fma(_1392, _1338, _1408);
    float _1418 = fma(_1056, _1410, _1056);
    float _1420 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1412);
    float _1422 = fma(_1410, _1294, _1294);
    float _1424 = _1416 * 0.15915493667125701904296875;
    float _1426 = _1104 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1428 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1430 = _1388 * 0.15915493667125701904296875;
    float _1432 = _966 + (-0.5);
    float _1434 = _1424 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    bool _1438 = _1428 >= _1426;
    bool _1440 = isnan(_1428);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan(_1426);
    bool _1446 = _1442 || _1444;
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1422);
    float _1450 = -_1428;
    float _1452 = _1426 + _1450;
    float _1454 = _1356 * _1414;
    float _1456 = fma(_1418, _1338, _1448);
    float _1458 = _1430 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = abs(_1452);
    float _1464 = precise::max(_1462, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1402);
    float _1468 = _1456 * 0.15915493667125701904296875;
    float _1470 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1404);
    float _1472 = precise::min(_1464, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1474 = _1350 * _1414;
    bool _1476 = !_1446;
    float _1478 = _1476 ? 1.0 : (-1.0);
    float _1480 = _1430 * 6.283185482025146484375;
    float _1482 = cos(_1480);
    float _1484 = _1368 * _1414;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1488 = _1472 + _1486;
    float _1490 = _1488 * _1384;
    float _1492 = _1424 * 6.283185482025146484375;
    float _1494 = cos(_1492);
    float _1496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1406);
    float _1498 = _972 * _1466;
    float _1500 = _978 * _1470;
    float _1502 = _1478 * _1490;
    float _1504 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1506 = _1460 * _1436;
    float _1508 = _990 * _1496;
    float _1510 = _1468 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = _1504 * _1502;
    float _1516 = _1482 * _1436;
    float _1518 = _1514 * 0.15915493667125701904296875;
    float _1520 = _1468 * 6.283185482025146484375;
    float _1522 = sin(_1520);
    float _1524 = _1482 * _1494;
    float _1526 = _1460 * _1494;
    float _1528 = _1436 * _1512;
    float _1530 = _1512 * _1500;
    float _1532 = _1494 * _1512;
    float _1534 = _1518 * 6.283185482025146484375;
    float _1536 = cos(_1534);
    float _1538 = _1482 * _1530;
    float _1540 = _1460 * _1530;
    float _1542 = fma(_1522, _1524, _1506);
    float _1544 = -_1516;
    float _1546 = fma(_1522, _1526, _1544);
    float _1548 = -_1500;
    float _1550 = _1522 * _1548;
    float _1552 = -_1526;
    float _1554 = fma(_1522, _1516, _1552);
    float _1556 = fma(_1542, _1498, _1538);
    float _1558 = _1518 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = fma(_1532, _1498, _1550);
    float _1564 = fma(_1522, _1506, _1524);
    float _1566 = fma(_1554, _1508, _1556);
    float _1568 = fma(_1546, _1498, _1540);
    float _1570 = fma(_1528, _1508, _1562);
    float _1572 = _1484 * _1484;
    float _1574 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1576 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1578 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1580 = fma(_1564, _1508, _1568);
    float _1582 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1574);
    float _1584 = -_1536;
    float _1586 = _1584 + 1.0;
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    float _1590 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1578);
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1582);
    float _1594 = _1454 * _1560;
    float _1596 = _1474 * _1586;
    float _1598 = fma(_1586, _1572, _1536);
    float _1600 = _1454 * _1586;
    float _1602 = _1474 * _1560;
    float _1604 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1588);
    float _1606 = _1484 * _1560;
    float _1608 = fma(_1484, _1596, _1594);
    float _1610 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1612 = -_1602;
    float _1614 = fma(_1484, _1600, _1612);
    float _1616 = -_1606;
    float _1618 = fma(_1474, _1600, _1616);
    float _1620 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1622 = _1610 * _1608;
    float _1624 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1590);
    float _1626 = fma(_1454, _1600, _1536);
    float _1628 = _1610 * _1618;
    float _1630 = fma(_1620, _1614, _1622);
    float _1632 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1634 = fma(_1484, _1600, _1602);
    float _1636 = fma(_1620, _1626, _1628);
    float _1638 = fma(_1474, _1596, _1536);
    float _1640 = fma(_1632, _1598, _1630);
    float _1642 = fma(_1474, _1600, _1606);
    float _1644 = fma(_1632, _1634, _1636);
    float _1646 = _1610 * _1638;
    float _1648 = _1080 + _1640;
    float _1650 = -_1594;
    float _1652 = fma(_1484, _1596, _1650);
    float _1654 = _1398 + _1644;
    float _1656 = fma(_1620, _1642, _1646);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1660 = _1648 + _1658;
    float _1662 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1666 = _1654 + _1664;
    float _1668 = fma(_1632, _1652, _1656);
    float _1670 = _1660 * _1660;
    float _1672 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1662);
    float _1674 = _1390 + _1668;
    float _1676 = fma(_1666, _1666, _1670);
    float _1678 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1672);
    float _1680 = sqrt(_1676);
    bool _1682 = _1680 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1684 = _1652;
    float _1686 = _1672;
    float _1688 = _1596;
    float _1690 = _1660;
    float _1692 = _1648;
    if (!_1682)
    {
        _1684 = _1654;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (!_1682)
    {
        _1686 = _1648;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (!_1682)
    {
        _1688 = _1674;
    }
    float _1702 = _1688;
    bool _1704 = !_1682;
    float _1706 = _1702;
    if (!_1704)
    {
        float _1708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1712 = _1680 + _1710;
        float _1714 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = rsqrt(_1676);
        float _1718 = _1712 * _1708;
        float _1720 = _1718 * 0.15915493667125701904296875;
        float _1722 = _1720 * 6.283185482025146484375;
        float _1724 = cos(_1722);
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = sin(_1726);
        float _1730 = _1724 + (-1.0);
        float _1732 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1734 = fma(_1728, _1714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1736 = fma(_1674, _1724, _1732);
        float _1738 = _1716 * _1734;
        float _1740 = fma(_1666, _1738, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1742 = fma(_1660, _1738, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1706 = _1736;
        _1696 = _1740;
        _1700 = _1742;
    }
    float _1744 = _1706;
    float _1746 = _1696;
    float _1748 = _1700;
    float _1750 = -_1390;
    float _1752 = _1750 + _1744;
    float _1754 = -_1398;
    float _1756 = _1754 + _1746;
    float _1758 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1760 = -_1080;
    float _1762 = _1760 + _1748;
    float _1764 = _1752 * _1752;
    float _1766 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1768 = 1.0 / _1758;
    float _1770 = fma(_1756, _1756, _1764);
    float _1772 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1766);
    float _1774 = fma(_1762, _1762, _1770);
    float _1776 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1772);
    float _1778 = sqrt(_1774);
    float _1780 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1782 = _1780 + _1758;
    float _1784 = _1782 * _1768;
    float _1786 = _1784 * 0.5;
    bool _1788 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1790 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan(0.5);
    bool _1796 = _1792 || _1794;
    bool _1798 = _1778 > 0.0;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1802 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1800);
    bool _1804 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(0.5);
    bool _1812 = _1808 || _1810;
    float _1814 = 1.0 / _1802;
    float _1816 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1818 = _1748;
    float _1820 = _1746;
    float _1822 = _1752;
    float _1824 = _1756;
    float _1826 = _1762;
    float _1828 = _1774;
    float _1830 = _1744;
    if (!_1798)
    {
        _1816 = _1744;
    }
    float _1832 = _1816;
    bool _1834 = !_1798;
    float _1836 = _1832;
    if (!_1834)
    {
        float _1838 = _172 * _172;
        float _1840 = rsqrt(_1774);
        float _1842 = fma(_170, _170, _1838);
        float _1844 = fma(_174, _174, _1842);
        float _1846 = sqrt(_1844);
        float _1848 = _1762 * _1840;
        bool _1850 = _1846 > 0.0;
        float _1852 = _1756 * _1840;
        float _1854 = _1752 * _1840;
        float _1856 = _1840;
        _1824 = _1854;
        _1690 = _1852;
        if (!_1850)
        {
            _1856 = _1744;
        }
        float _1858 = _1856;
        bool _1860 = !_1850;
        _1836 = _1858;
        if (!_1860)
        {
            float _1862 = rsqrt(_1844);
            float _1864 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1866 = _172 * _1862;
            float _1868 = _170 * _1862;
            float _1870 = _1854 * _1866;
            float _1872 = _174 * _1862;
            float _1874 = fma(_1852, _1868, _1870);
            float _1876 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1878 = fma(_1848, _1872, _1874);
            float _1880 = _1878 * _1876;
            float _1882 = fma(_170, _1880, _1746);
            float _1884 = fma(_172, _1880, _1744);
            float _1886 = fma(_174, _1880, _1748);
            _1836 = _1884;
            _1818 = _1886;
            _1820 = _1882;
            _1822 = _1868;
            _1824 = _1874;
            _1826 = _1880;
            _1828 = _1864;
        }
    }
    float _1888 = _1836;
    float _1890 = _1818;
    float _1892 = _1820;
    float _1894 = _1822;
    float _1896 = _1824;
    float _1898 = _1690;
    float _1900 = _1826;
    float _1902 = _1828;
    float _1904 = _1902;
    float _1906 = _1894;
    float _1908 = _1892;
    float _1910 = _1888;
    float _1912 = _1896;
    float _1914 = _1898;
    if (_1812)
    {
        _1904 = 1.0;
    }
    float _1916 = _1904;
    float _1918 = _1916;
    if (_1796)
    {
        _1906 = _1888;
    }
    float _1920 = _1906;
    float _1922 = _1920;
    if (_1796)
    {
        _1830 = _1890;
    }
    float _1924 = _1830;
    float _1926 = _1924;
    if (!_1796)
    {
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1930 = _1390 + _1928;
        float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1934 = _1398 + _1932;
        float _1936 = -_1398;
        float _1938 = _1936 + _1892;
        float _1940 = -_1390;
        float _1942 = _1940 + _1888;
        float _1944 = _1930 * _1930;
        float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1948 = _1080 + _1946;
        float _1950 = -_1080;
        float _1952 = _1950 + _1890;
        float _1954 = fma(_1934, _1934, _1944);
        float _1956 = fma(_1948, _1948, _1954);
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1960 = sqrt(_1956);
        float _1962 = precise::min(_1960, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1964 = _1962 * _1958;
        float _1966 = fma(_1938, _1964, _1398);
        float _1968 = fma(_1942, _1964, _1390);
        float _1970 = fma(_1952, _1964, _1080);
        _1922 = _1968;
        _1908 = _1966;
        _1926 = _1970;
        _1910 = _1942;
    }
    float _1972 = _1922;
    float _1974 = _1908;
    float _1976 = _1926;
    float _1978 = _1910;
    float _1980 = _1978;
    if (_1812)
    {
        _1980 = 1.0;
    }
    float _1982 = _1980;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1986 = _1814 * _1984;
    float _1988 = _1982;
    if (!_1812)
    {
        float _1990 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1992 = _1990 * 0.15915493667125701904296875;
        float _1994 = _1992 * 6.283185482025146484375;
        float _1996 = cos(_1994);
        float _1998 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2000 = _1998 * 0.15915493667125701904296875;
        float _2002 = _1992 * 6.283185482025146484375;
        float _2004 = sin(_2002);
        float _2006 = 1.0 / _1996;
        float _2008 = _2000 * 6.283185482025146484375;
        float _2010 = cos(_2008);
        float _2012 = _2004 * _2006;
        float _2014 = _2000 * 6.283185482025146484375;
        float _2016 = sin(_2014);
        float _2018 = _2010 * _2012;
        float _2020 = 1.0 / _2018;
        float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2024 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2022;
        float _2026 = 1.0 / _2024;
        float _2028 = _2016 * _2020;
        float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2032 = fma(_1986, _2028, _2030);
        float _2034 = _2032 * _2026;
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        _178 = _2026;
        _1918 = _2036;
    }
    float _2038 = _178;
    float _2040 = _1918;
    float _2042 = _2038;
    if (!_1812)
    {
        float _2044 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2046 = _2044 * 0.15915493667125701904296875;
        float _2048 = _2046 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2054 = _2052 * 0.15915493667125701904296875;
        float _2056 = _2046 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        float _2060 = 1.0 / _2050;
        float _2062 = _2054 * 6.283185482025146484375;
        float _2064 = cos(_2062);
        float _2066 = _2058 * _2060;
        float _2068 = _2054 * 6.283185482025146484375;
        float _2070 = sin(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = 1.0 / _2072;
        float _2076 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2078 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2076;
        float _2080 = 1.0 / _2078;
        float _2082 = _2070 * _2074;
        float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2086 = fma(_1986, _2082, _2084);
        float _2088 = _2086 * _2080;
        float _2090 = precise::clamp(_2088, 0.0, 1.0);
        float _2092 = -_2090;
        float _2094 = _2092 + 1.0;
        _2042 = _2060;
        _1912 = _2074;
        _1988 = _2094;
    }
    float _2096 = _2042;
    float _2098 = _1912;
    float _2100 = _1988;
    float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2104 = _1972 + _2102;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2108 = _1974 + _2106;
    float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2112 = _1976 + _2110;
    float _2114 = _2104 * _2104;
    float _2116 = fma(_2108, _2108, _2114);
    float _2118 = fma(_2112, _2112, _2116);
    float _2120 = rsqrt(_2118);
    float _2122 = sqrt(_2118);
    float _2124 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2126 = _2108 * _2124;
    float _2128 = _2112 * _2124;
    float _2130 = _2126 * _2126;
    float _2132 = _2128 * _2128;
    float _2134 = _2130 + _2132;
    float _2136 = sqrt(_2134);
    bool _2138 = _2136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2142 = _2136 + _2140;
    float _2144 = _2096;
    float _2146 = _2134;
    float _2148 = _2142;
    float _2150 = _2104;
    float _2152 = _2128;
    float _2154 = _2130;
    float _2156 = _2132;
    if (_2138)
    {
        float _2158 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2158;
    }
    float _2160 = _2144;
    if (_2138)
    {
        float _2162 = rsqrt(_2134);
        _2146 = _2162;
    }
    float _2164 = _2146;
    if (_2138)
    {
        float _2166 = _2142 * _2160;
        _2148 = _2166;
    }
    float _2168 = _2148;
    if (_2138)
    {
        float _2170 = _2168 * 0.15915493667125701904296875;
        _1914 = _2170;
    }
    float _2172 = _1914;
    float _2174 = _2098;
    if (_2138)
    {
        float _2176 = _2172 * 6.283185482025146484375;
        float _2178 = sin(_2176);
        _2174 = _2178;
    }
    float _2180 = _2174;
    float _2182 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2184 = precise::max(0.0, _2182);
    float _2186 = _1900;
    float _2188 = _2182;
    float _2190 = _2184;
    if (_2138)
    {
        float _2192 = _2172 * 6.283185482025146484375;
        float _2194 = cos(_2192);
        _2186 = _2194;
    }
    float _2196 = _2186;
    float _2198 = -_2124;
    float _2200 = -_2184;
    float _2202 = fma(_2104, _2198, _2200);
    if (!_2138)
    {
        _2150 = _2126;
    }
    float _2204 = _2150;
    float _2206 = _2204;
    if (_2138)
    {
        float _2208 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2188 = _2208;
    }
    float _2210 = _2188;
    float _2212 = _2180;
    float _2214 = _2210;
    if (_2138)
    {
        float _2216 = fma(_2180, _2210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2212 = _2216;
    }
    float _2218 = _2212;
    if (!_2138)
    {
        _2214 = _2202;
    }
    float _2220 = _2214;
    float _2222 = _2220;
    if (_2138)
    {
        float _2224 = _2196 + (-1.0);
        _2190 = _2224;
    }
    float _2226 = _2190;
    float _2228 = _2226;
    if (_2138)
    {
        float _2230 = _2164 * _2218;
        _1692 = _2230;
    }
    float _2232 = _1692;
    if (_2138)
    {
        float _2234 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2228 = _2234;
    }
    float _2236 = _2228;
    if (_2138)
    {
        float _2238 = _2126 * _2232;
        _2206 = _2238;
    }
    float _2240 = _2206;
    if (_2138)
    {
        float _2242 = _2128 * _2232;
        _2152 = _2242;
    }
    float _2244 = _2152;
    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2248 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2246);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    if (_2138)
    {
        float _2252 = fma(_2202, _2196, _2236);
        _2222 = _2252;
    }
    float _2254 = _2222;
    if (_2138)
    {
        float _2256 = _2240 * _2240;
        _2154 = _2256;
    }
    float _2258 = _2154;
    if (_2138)
    {
        float _2260 = _2244 * _2244;
        _2156 = _2260;
    }
    float _2262 = _2156;
    float _2264 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2266 = -_2250;
    float _2268 = _2266 + 1.0;
    float _2270 = fma(_2254, _2254, _2258);
    float _2272 = abs(_2268);
    float _2274 = log2(_2272);
    float _2276 = _2270 + _2262;
    float _2278 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2280 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2282 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2278);
    float _2284 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2286 = rsqrt(_2276);
    float _2288 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2282);
    float _2290 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2264);
    float _2292 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2294 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2284);
    float _2296 = _2288 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2298 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2290);
    float _2300 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2292);
    float _2302 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2294);
    float _2304 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2308 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2300);
    float _2310 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2312 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2316 = _2286 * _2240;
    float _2318 = _2286 * _2254;
    float _2320 = _2286 * _2244;
    float _2322 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2314);
    float _2324 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2326 = -_2304;
    float _2328 = fma(_2326, _2280, 1.0);
    float _2330 = _2308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2332 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2322);
    float _2334 = -_2324;
    float _2336 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2334);
    float _2338 = exp2(_2312);
    float _2340 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2342 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2332);
    float _2344 = -_2320;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2336);
    float _2348 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2350 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2340);
    float _2352 = fma(_2346, -0.5, 0.5);
    float _2354 = log2(_2328);
    float _2356 = fma(_2346, 0.5, 0.5);
    float _2358 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2348);
    float _2360 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2350);
    float _2362 = fma(_2356, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2364 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2358);
    float _2366 = 1.0 / _2342;
    float _2368 = _2318 + 1.0;
    float _2370 = fma(_2356, _2362, -0.212114393711090087890625);
    float _2372 = -_2318;
    float _2374 = fma(_2338, _2368, _2372);
    float _2376 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2364);
    float _2378 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2360);
    float _2380 = sqrt(_2352);
    float _2382 = fma(_2356, _2370, 1.570728778839111328125);
    float _2384 = _2354 * 0.693147182464599609375;
    float _2386 = fma(_2374, 0.5, 0.5);
    float _2388 = _2384 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2390 = _2376 * _2366;
    float _2392 = _2378 * _2366;
    float _2394 = fma(_2390, 0.5, 0.5);
    float _2396 = fma(_2392, -0.5, 0.5);
    float _2398 = _2380 * 0.636619746685028076171875;
    float _2400 = -_2382;
    float _2402 = fma(_2398, _2400, 1.0);
    float3 _6907 = float3(_2394, _2396, _2388);
    float _2404 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6907, float3(0.0), isnan(_6907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6907, float3(0.0), isnan(_6907)), level(0.0)).x;
    float3 _6918 = float3(_2394, _2396, _2388);
    float4 _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6918, float3(0.0), isnan(_6918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6918, float3(0.0), isnan(_6918)), level(0.0)).xyzw;
    float _2409 = _2407.x;
    float _2411 = _2407.y;
    float _2413 = _2407.z;
    float _2415 = _2407.w;
    float2 _6935 = float2(_2402, _2386);
    float3 _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6935, float2(0.0), isnan(_6935)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6935, float2(0.0), isnan(_6935)), level(0.0)).xyz;
    float _2421 = _2419.x;
    float _2423 = _2419.y;
    float _2425 = _2419.z;
    float _2427 = float(uint(_964));
    float _2429 = trunc(_1312);
    int _2431 = int(_2429);
    int _2433 = ~_964;
    int _2435 = _2433 + 1;
    out.m_61.x = _710;
    out.m_61.y = _712;
    out.m_61.z = _714;
    out.m_61.w = _718;
    int _2437 = ~_964;
    int _2439 = _2437 + 1;
    float _2441 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2443 = abs(_1236);
    float _2445 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2447 = 1.0 / _2427;
    float _2449 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2445);
    float _2451 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2449);
    float _2453 = float(uint(_2431));
    float _2455 = exp2(_2441);
    float _2457 = float(_2431);
    float _2459 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2451);
    int _2461 = as_type<int>(_2447) + (-2);
    out.gl_Position.x = _2376;
    out.gl_Position.y = _2378;
    out.gl_Position.z = _2459;
    out.gl_Position.w = _2342;
    float _2463 = as_type<float>(_2461) * _2453;
    float _2465 = trunc(_2463);
    float _2467 = precise::max(_2465, 0.0);
    uint _2470 = uint(_2467);
    float _2472 = -_2455;
    float _2474 = _2472 + 1.0;
    int _2476 = _2435 * int(_2470);
    int _2478 = _2476 + _2431;
    float _2480 = float(uint(_2478));
    float _2482 = as_type<float>(_2461) * _2480;
    bool _2484 = !_970;
    float _2486 = _2484 ? 7.345489978790283203125 : 1.0;
    float _2488 = trunc(_2482);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    float _2494 = _2486 * _960;
    bool _2496 = _2457 >= _1320;
    bool _2498 = isnan(_2457);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan(_1320);
    bool _2504 = _2500 || _2502;
    float _2506 = float(_2504);
    float _2508 = floor(_2494);
    int _2510 = int(_2470) + int(_2492);
    float _2512 = trunc(_2506);
    int _2514 = int(_2512);
    int _2516 = _2439 * _2510;
    int _2518 = _2516 + _2431;
    float _2520 = -_2508;
    float _2522 = _2494 + _2520;
    bool _2524 = uint(_2518) >= uint(_964);
    bool _2526 = !_2524;
    int _2528 = _2526 ? 0 : (-1);
    bool _2530 = _964 == 0;
    int _2532 = ~_2510;
    int _2534 = _2532 + _2528;
    int _2536 = _2534 + 1;
    float _2538 = _2522 * _1320;
    float _2540 = _1328 * _152;
    int _2542 = ~_2514;
    int _2544 = _2542 + 1;
    int _2546 = _2544 + 1;
    int _2548 = _964 * _2536;
    int _2550 = _2548 + _2431;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2554 = _2552 != 0;
    float _2556 = trunc(_2538);
    int _2558 = int(_2556);
    int _2560 = _964 + (-1);
    bool _2562 = !_2530;
    int _2564 = _2562 ? _2550 : (-1);
    bool _2566 = !_2554;
    int _2568 = _2566 ? 0 : 1;
    int _2570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2572 = _2570 != 0;
    float _2574 = trunc(_2540);
    int _2576 = int(_2574);
    int _2578 = _2564 * _2546;
    int _2580 = abs(_2568);
    int _2582 = abs(_1248);
    int _2584 = _2514 * _2560;
    int _2586 = _2584 + _2578;
    int _2588 = abs(_1242);
    int _2590 = _2586 * _2443;
    bool _2592 = !_2572;
    int _2594 = _2592 ? 0 : 1;
    int _2596 = _2558 * _2580;
    int _2598 = _2596 + _2431;
    int _2600 = abs(_2594);
    float _2602 = in.m_53.w;
    int _2604 = _2576 * _2588;
    int _2606 = _2604 + _2590;
    int _2608 = ~_964;
    int _2610 = _2608 + 1;
    int _2612 = _2598 * _2582;
    int _2614 = _2612 + _2606;
    float _2616 = float(uint(_2598));
    int _2618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2620 = _2618 != 0;
    int _2622 = _2558 * _2600;
    int _2624 = _2622 + _2614;
    int _2626 = ~_964;
    int _2628 = _2626 + 1;
    int _2630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2632 = _2630 != 0;
    float _2634 = float(uint(_2624));
    int _2636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2638 = _2636 != 0;
    float _2640 = as_type<float>(_2461) * _2634;
    int _2642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2644 = _2642 != 0;
    float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2648 = _2646 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2650 = trunc(_2640);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    bool _2656 = _2602 > 0.5;
    float _2658 = 1.0 / _2648;
    int _2660 = _2628 * int(_2654);
    int _2662 = _2660 + _2624;
    float _2664 = float(uint(_2662));
    float _2666 = as_type<float>(_2461) * _2664;
    float _2668 = in.m_63.y;
    float _2670 = trunc(_2666);
    float _2672 = precise::max(_2670, 0.0);
    uint _2674 = uint(_2672);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2676 = as_type<float>(_2461) * _2616;
    int _2678 = int(_2654) + int(_2674);
    float _2680 = trunc(_2676);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    float _2686 = -_2668;
    float _2688 = _2686 + 1.0;
    int _2690 = _2610 * _2678;
    int _2692 = _2690 + _2624;
    int _2694 = _2656 ? as_type<int>(_2688) : as_type<int>(_2668);
    bool _2696 = uint(_2692) >= uint(_964);
    float _2698 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2702 = _974 > 0.5;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2706 = _958 + _2704;
    bool _2708 = !_2696;
    int _2710 = _2708 ? 0 : (-1);
    float _2712 = 1.0 / _2700;
    int _2714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2716 = _2714 != 0;
    int _2718 = ~_2678;
    int _2720 = _2718 + _2710;
    int _2722 = _2720 + 1;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2724;
    float _2728 = _2716 ? as_type<float>(_2694) : _2668;
    float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2732 = _2730 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2734 = _2668;
    bool _2736 = _2702;
    bool _2738 = _2716;
    int _2740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].w);
    if (_2620)
    {
        float _2742 = _2702 ? _2688 : _2668;
        _2734 = _2742;
    }
    float _2744 = _2734;
    int _2746 = _964 * _2722;
    int _2748 = _2746 + _2624;
    float _2750 = in.m_63.x;
    if (_2632)
    {
        bool _2752 = _966 > 0.5;
        _2736 = _2752;
    }
    bool _2754 = _2736;
    float _2756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2758 = ~_964;
    int _2760 = _2758 + 1;
    float _2762 = _2726 * _2658;
    bool _2764 = !_2530;
    int _2766 = _2764 ? _2748 : (-1);
    if (_2638)
    {
        bool _2768 = _960 > 0.5;
        _2738 = _2768;
    }
    bool _2770 = _2738;
    int _2772 = _2760 * int(_2684);
    int _2774 = _2772 + _2598;
    int _2776 = _2766 >> 31;
    float _2778 = _2732 * _2712;
    bool _2780 = _958 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2782 = isnan(_958);
    bool _2784 = _2780 || _2782;
    bool _2786 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2788 = _2784 || _2786;
    float _2790 = float(_2788);
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2794 = _958 + _2792;
    float _2796 = float(uint(_2774));
    float _2798 = fma(_2778, _2706, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2800 = _2776 & 3;
    float _2802 = -_2790;
    float _2804 = _2802 + 1.0;
    bool _2806 = _958 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2808 = isnan(_958);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = as_type<float>(_2461) * _2796;
    int _2820 = _2766 + _2800;
    float _2822 = fma(_2762, _2794, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2824 = _958 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2826 = isnan(_958);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2832 = _2828 || _2830;
    float _2834 = float(_2832);
    float _2836 = _2816 * _2804;
    float _2838 = -_2816;
    float _2840 = _2838 + 1.0;
    int _2842 = _2820 >> 2;
    float _2844 = _2756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2846 = _2756;
    float _2848 = _2840;
    int _2850 = _2842;
    if (!_2638)
    {
        _2846 = _2750;
    }
    float _2852 = _2846;
    float _2854 = _2834 * _2840;
    int _2856 = _2842 << 4;
    int _2858 = _2856 + 368;
    float _2860 = fma(_2728, _2844, -0.5);
    float _2862 = _2852;
    if (!_2638)
    {
        _2848 = _2852;
    }
    float _2864 = _2848;
    float _2866 = _2822 * _2854;
    float _2868 = _2864;
    if (_2638)
    {
        _2862 = _2750;
    }
    float _2870 = _2862;
    float _2872 = -_2834;
    float _2874 = _2872 + 1.0;
    uint _2876 = uint(int(uint(_2858) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    float _2892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2894 = _2870;
    if (_2638)
    {
        float _2896 = -_2870;
        float _2898 = _2896 + 1.0;
        _2850 = as_type<int>(_2898);
    }
    int _2900 = _2850;
    if (_2632)
    {
        float _2902 = -_2870;
        float _2904 = _2902 + 1.0;
        _2740 = as_type<int>(_2904);
    }
    int _2906 = _2740;
    float _2908 = -_1324;
    float _2910 = fma(_1314, _2860, _2908);
    float _2912 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2744, -0.5);
    float _2914 = fma(_2874, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2866);
    if (_2638)
    {
        float _2916 = _2770 ? as_type<float>(_2900) : _2870;
        _2868 = _2916;
    }
    float _2918 = _2868;
    int _2920 = _2858 + 8;
    uint _2922 = uint(int(uint(_2920) >> uint(2)));
    uint _2924 = uint(int(uint(int(_2922)) >> uint(2)));
    int _2926 = int(_2922) & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    int _2930 = int(_2922) + 1;
    uint _2932 = uint(int(uint(_2930) >> uint(2)));
    int _2934 = _2930 & 3;
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[int(_2932)][_2934];
    if (_2632)
    {
        float _2938 = _2754 ? as_type<float>(_2906) : _2870;
        _2894 = _2938;
    }
    float _2940 = _2894;
    float _2942 = fma(_2798, _2836, _2914);
    int _2944 = _2766 & 3;
    bool _2946 = _2944 != 0;
    float _2948 = trunc(_2818);
    float _2950 = precise::max(_2948, 0.0);
    uint _2952 = uint(_2950);
    float _2954 = -_1164;
    float _2956 = fma(_1318, _2912, _2954);
    bool _2958 = uint(_2944) > 1u;
    float _2960 = _2892 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2962 = _2766 & 3;
    bool _2964 = _2962 != 0;
    float _2966 = fma(_2918, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2968 = uint(_2944) >= 2u;
    float _2970 = fma(_2960, _2940, -0.5);
    int _2972 = _2964 ? 0 : 1;
    float _2974 = fma(_1316, _2966, _1070);
    bool _2976 = _2944 != 3;
    float _2978 = fma(_1332, _2970, _1310);
    int _2980 = ~_2972;
    int _2982 = _2980 + 1;
    int _2984 = _2982 + 1;
    int _2986 = int(_2684) + int(_2952);
    float _2988 = _2978 + 0.5;
    int _2990 = _2984;
    if (!_2958)
    {
        int _2992 = ~_2972;
        int _2994 = _2992 + 1;
        _2990 = _2994;
    }
    int _2996 = _2990;
    int _2998 = ~_964;
    int _3000 = _2998 + 1;
    int _3002 = abs(_2996);
    bool _3004 = !_2946;
    int _3006 = _3004 ? 0 : 1;
    int _3008 = _3000 * _2986;
    int _3010 = _3008 + _2598;
    int _3012 = _2968 ? 0 : 1;
    bool _3014 = _2944 != 3;
    int _3016 = ~_3012;
    int _3018 = _3016 + 1;
    int _3020 = _3018 + 1;
    bool _3022 = !_3014;
    int _3024 = _3022 ? 0 : (-1);
    int _3026 = abs(_3006);
    int _3028 = _3020;
    if (_2976)
    {
        int _3030 = ~_3012;
        int _3032 = _3030 + 1;
        _3028 = _3032;
    }
    int _3034 = _3028;
    int _3036 = ~_3002;
    int _3038 = _3036 + 1;
    int _3040 = _3038 + 1;
    bool _3042 = uint(_3010) >= uint(_964);
    int _3044 = abs(_3024);
    int _3046 = _3040 * as_type<int>(_2890);
    int _3048 = abs(_3034);
    int _3050 = ~_3026;
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    bool _3056 = !_2644;
    int _3058 = _3056 ? 0 : 1;
    int _3060 = _3054 * as_type<int>(_2882);
    int _3062 = _3060 + _3046;
    int _3064 = ~_3048;
    int _3066 = _3064 + 1;
    int _3068 = _3066 + 1;
    bool _3070 = !_3042;
    int _3072 = _3070 ? 0 : (-1);
    int _3074 = abs(_3058);
    int _3076 = _3068 * as_type<int>(_2928);
    int _3078 = _3076 + _3062;
    int _3080 = ~_3044;
    int _3082 = _3080 + 1;
    int _3084 = _3082 + 1;
    float _3086 = _934 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3088 = ~_2986;
    int _3090 = _3088 + _3072;
    int _3092 = _3090 + 1;
    int _3094 = ~_3074;
    int _3096 = _3094 + 1;
    int _3098 = _3096 + 1;
    int _3100 = _3084 * as_type<int>(_2936);
    int _3102 = _3100 + _3078;
    float _3104 = fma(_2790, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2942);
    int _3106 = _964 * _3092;
    int _3108 = _3106 + _2598;
    float _3110 = _2974 + 0.5;
    int _3112 = _3102 * _3098;
    float _3114 = _930 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3116 = _2956 + 0.5;
    float _3118 = _2910 + 0.5;
    bool _3120 = !_2530;
    int _3122 = _3120 ? _3108 : (-1);
    float _3124 = _932 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3126 = _3114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3128 = _3086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _3110;
    out.m_67.y = _3116;
    out.m_67.z = _2988;
    out.m_67.w = _3118;
    float _3130 = _3124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3132 = _2040 * _2100;
    float _3134 = _3104 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3136 = _3122 * _3074;
    int _3138 = _3136 + _3112;
    bool _3140 = _2040 > 0.0;
    bool _3142 = isnan(_2040);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(0.0);
    bool _3148 = _3144 || _3146;
    float _3150 = _3132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _3126;
    out.m_69.y = _3130;
    out.m_69.z = _3128;
    out.m_69.w = _3134;
    bool _3152 = _2100 <= 0.0;
    bool _3154 = !_3148;
    bool _3156 = _3152 || _3154;
    float _3158 = _3150 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3160 = float(_3138);
    float _3162 = _2459 + _2342;
    float _3164 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3158;
    float _3166 = _3162 * 0.5;
    float _3168 = _3164 * _2404;
    out.m_71.x = _3160;
    float _3170 = _2415 * _3168;
    float _3172 = _2425 * _3168;
    float _3174 = -_3164;
    float _3176 = _3174 + 1.0;
    out.m_73.z = _3166;
    out.m_73.w = _2342;
    float _3178 = fma(_2421, _3170, _2409);
    float _3180 = fma(_2423, _3170, _2411);
    float _3182 = _2415 * _3176;
    float _3184 = fma(_2415, _3172, _2413);
    out.m_75.x = _3178;
    out.m_75.y = _3180;
    out.m_75.z = _3184;
    out.m_75.w = _3182;
    if (!_3156)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3186 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3186;
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
    bool _956 = false;
    bool _740 = false;
    bool _642 = false;
    bool _414 = false;
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
        float _3254 = as_type<float>(_118);
        out.gl_Position.z = _3254;
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
        float _3309 = as_type<float>(_144);
        out.gl_Position.z = _3309;
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
    float _178 = _174;
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
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = _200 + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _200 + _206;
    bool _210 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _212 = isnan(_200);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _222;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _200 + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = 1.0 / _224;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _242 = 1.0 / _236;
    float _244 = 1.0 / _232;
    float _246 = _204 * _238;
    bool _248 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _250 = isnan(_200);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _256 = _252 || _254;
    float _258 = float(_256);
    float _260 = -_220;
    float _262 = _260 + 1.0;
    float _264 = _258 * _262;
    float _266 = _208 * _242;
    bool _268 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _270 = isnan(_200);
    bool _272 = _268 || _270;
    bool _274 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _276 = _272 || _274;
    float _278 = float(_276);
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    bool _284 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_200);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -_258;
    float _302 = _300 + 1.0;
    float _304 = -_278;
    float _306 = _304 + 1.0;
    float _308 = _228 * _244;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _314;
    float _318 = _294 * _306;
    float _320 = fma(_282, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = fma(_312, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = fma(_316, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _326 = _278 * _302;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _332 = _322 * _318;
    float _334 = _324 * _318;
    float _336 = _320 * _318;
    float _338 = -_294;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _346 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _348 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _350 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _336);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_298, _266, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _358 = fma(_344, _266, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _360 = fma(_330, _266, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _366;
    float _370 = fma(_356, _326, _346);
    float _372 = fma(_354, _246, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_364, _246, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _376 = fma(_368, _246, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _378 = fma(_358, _326, _348);
    float _380 = fma(_360, _326, _350);
    float _382 = fma(_372, _264, _370);
    float _384 = fma(_374, _264, _378);
    float _386 = fma(_376, _264, _380);
    float _388 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].x, _382);
    float _390 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[146].z, _386);
    bool _394 = !_240;
    float _412;
    if (!_394)
    {
        float _396 = in.m_53.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        _412 = _156;
    }
    _414 = false;
    float _416 = _412;
    float _418 = in.m_55.x;
    float _420 = in.m_55.y;
    float _422 = in.m_55.z;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _426 = _416 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _430 = _416 + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _438 = _416 + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _448 = 1.0 / _434;
    bool _450 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _452 = 1.0 / _442;
    float _454 = _392 * _422;
    float _456 = 1.0 / _446;
    bool _458 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _460 = isnan(_416);
    bool _462 = _458 || _460;
    bool _464 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _466 = _462 || _464;
    float _468 = float(_466);
    float _470 = _426 * _448;
    bool _472 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _474 = isnan(_416);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _390 * _420;
    bool _486 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _488 = isnan(_416);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = _388 * _418;
    float _500 = _430 * _452;
    float _502 = -_468;
    float _504 = _502 + 1.0;
    float _506 = -_496;
    float _508 = _506 + 1.0;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _510;
    float _514 = _482 * _504;
    bool _516 = _416 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _518 = isnan(_416);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _532 = _438 * _456;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _538;
    float _542 = -_482;
    float _544 = _542 + 1.0;
    float _546 = _526 * _508;
    float _548 = fma(_536, _500, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _550 = fma(_512, _500, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _552 = fma(_540, _500, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _554 = _496 * _544;
    float _556 = _548 * _546;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _562 = _550 * _546;
    float _564 = _552 * _546;
    float _566 = -_526;
    float _568 = _566 + 1.0;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _574 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].x, _562);
    float _576 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].y, _556);
    float _578 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[107].z, _564);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _580;
    float _584 = fma(_530, _532, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _586 = fma(_572, _532, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _588 = fma(_560, _532, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _590;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _594;
    float _598 = fma(_584, _554, _574);
    float _600 = fma(_582, _470, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _602 = fma(_592, _470, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _604 = fma(_596, _470, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _606 = fma(_586, _554, _576);
    float _608 = fma(_588, _554, _578);
    float _610 = fma(_600, _514, _598);
    float _612 = fma(_602, _514, _606);
    float _614 = fma(_604, _514, _608);
    float _616 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[110].x, _610);
    float _618 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[110].y, _612);
    float _620 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[110].z, _614);
    bool _622 = !_450;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        _640 = _156;
    }
    _642 = false;
    float _644 = _640;
    bool _646 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _648 = isnan(_644);
    bool _650 = _646 || _648;
    bool _652 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _654 = _650 || _652;
    float _656 = float(_654);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _662 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _664 = isnan(_644);
    bool _666 = _662 || _664;
    bool _668 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _670 = _666 || _668;
    float _672 = float(_670);
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _674;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _680 = _644 + _678;
    float _682 = -_656;
    float _684 = _682 + 1.0;
    bool _686 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _688 = 1.0 / _660;
    float _690 = _672 * _684;
    float _692 = -_672;
    float _694 = _692 + 1.0;
    float _696 = _676 * _688;
    float _698 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _700 = fma(_696, _680, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _702 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _704 = _700 * _690;
    float _706 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _708 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[115].x, _704);
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[116].x, _708);
    float _718 = _716 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _720 = !_686;
    float _738;
    if (!_720)
    {
        float _722 = in.m_53.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _738 = _736;
        _740 = true;
    }
    else
    {
        _738 = _156;
    }
    _740 = false;
    float _742 = _738;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _746 = _742 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _750 = _742 + _748;
    bool _752 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _754 = isnan(_742);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _770 = _742 + _768;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _774 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _772;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _780 = 1.0 / _766;
    bool _782 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _784 = 1.0 / _778;
    float _786 = 1.0 / _774;
    float _788 = _746 * _780;
    bool _790 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _792 = isnan(_742);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = -_762;
    float _804 = _802 + 1.0;
    float _806 = _800 * _804;
    float _808 = _750 * _784;
    bool _810 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _812 = isnan(_742);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _822;
    bool _826 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _828 = isnan(_742);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _842 = -_800;
    float _844 = _842 + 1.0;
    float _846 = -_820;
    float _848 = _846 + 1.0;
    float _850 = _770 * _786;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _852;
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _856;
    float _860 = _836 * _848;
    float _862 = fma(_824, _850, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _864 = fma(_854, _850, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _866 = fma(_858, _850, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _868 = _820 * _844;
    float _870 = _862 * _860;
    float _872 = _864 * _860;
    float _874 = _866 * _860;
    float _876 = -_836;
    float _878 = _876 + 1.0;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[123].x, _874);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[123].y, _872);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _892;
    float _896 = fma(_840, _808, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _898 = fma(_882, _808, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _900 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[123].z, _870);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _902;
    float _906 = fma(_886, _808, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _908;
    float _912 = fma(_896, _868, _888);
    float _914 = fma(_894, _788, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _916 = fma(_904, _788, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _918 = fma(_898, _868, _890);
    float _920 = fma(_910, _788, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _922 = fma(_906, _868, _900);
    float _924 = fma(_914, _806, _912);
    float _926 = fma(_916, _806, _918);
    float _928 = fma(_920, _806, _922);
    float _930 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[126].x, _924);
    float _932 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[126].y, _926);
    float _934 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[126].z, _928);
    bool _936 = !_782;
    float _954;
    if (!_936)
    {
        float _938 = in.m_53.x;
        float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _942 = _938 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _944 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _946 = _944 * _940;
        float _948 = floor(_946);
        float _950 = -_948;
        float _952 = _946 + _950;
        _954 = _952;
        _956 = true;
    }
    else
    {
        _954 = _156;
    }
    _956 = false;
    float _958 = _954;
    float _960 = in.m_53.x;
    float _962 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _964 = int(_962);
    float _966 = in.m_53.z;
    int _968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _970 = _968 != 0;
    float _972 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _974 = in.m_53.y;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _978 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _980 = in.m_42.x;
    float _982 = in.m_42.y;
    float _984 = in.m_42.z;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _988 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _990 = _454 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _992 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _988);
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _996 = _960 * 2.0;
    float _998 = _960 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1000 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1002 = floor(_996);
    float _1004 = -_976;
    float _1006 = fma(_998, 2.0, _1004);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1010 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1000);
    float _1012 = _974 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1014 = _974 * 2.0;
    float _1016 = fma(_1012, -2.0, _986);
    float _1018 = _966 * 2.0;
    float _1020 = _982 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1022 = _982 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1024 = _982 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1026 = floor(_1014);
    float _1028 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1020);
    float _1030 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1022);
    float _1032 = fma(_980, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1024);
    float _1034 = _960 + _974;
    float _1036 = _960 + _966;
    float _1038 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1028);
    float _1040 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1030);
    float _1042 = floor(_1018);
    float _1044 = _1034 + (-1.0);
    float _1046 = _974 + _966;
    float _1048 = _1036 + (-1.0);
    float _1050 = fma(_984, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1032);
    bool _1052 = _1002 > 0.0;
    float _1054 = _1046 + (-1.0);
    float _1056 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1058 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1060 = int(_1058);
    float _1062 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1064 = _1054;
    if (!_970)
    {
        _1064 = _966;
    }
    float _1066 = _1064;
    float _1068 = -_100;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1006);
    float _1072 = _1066;
    if (_970)
    {
        _1072 = _974;
    }
    float _1074 = _1072;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1078 = _1042 > 0.0;
    float _1080 = _1050 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1082 = _1042 >= 0.0;
    bool _1084 = isnan(_1042);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1076);
    float _1094 = _1074;
    float _1096 = _1076;
    if (!_970)
    {
        _1094 = _966;
    }
    float _1098 = _1094;
    float _1100 = _1098;
    if (!_970)
    {
        _1096 = _974;
    }
    float _1102 = _1096;
    float _1104 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _992);
    float _1106 = _1102;
    if (_970)
    {
        _1100 = _974;
    }
    float _1108 = _1100;
    float _1110 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1112 = log2(_1110);
    if (_970)
    {
        _1106 = _960;
    }
    float _1114 = _1106;
    bool _1116 = _1002 >= 0.0;
    bool _1118 = isnan(_1002);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1128 = _1090 ? 0 : 1;
    float _1130 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[83].z, _994);
    float _1132 = _1114 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1134 = ~_1128;
    int _1136 = _1134 + 1;
    int _1138 = _1136 + 1;
    float _1140 = -_1008;
    float _1142 = fma(_1132, 2.0, _1140);
    bool _1144 = _1026 >= 0.0;
    bool _1146 = isnan(_1026);
    bool _1148 = _1144 || _1146;
    bool _1150 = isnan(0.0);
    bool _1152 = _1148 || _1150;
    float _1154 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1010);
    int _1156 = _1138;
    if (!_1078)
    {
        int _1158 = ~_1128;
        int _1160 = _1158 + 1;
        _1156 = _1160;
    }
    int _1162 = _1156;
    float _1164 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1016);
    float _1166 = _1112 * _100;
    bool _1168 = _1026 > 0.0;
    int _1170 = _1124 ? 0 : 1;
    float _1172 = rsqrt(_1154);
    bool _1174 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1176 = isnan(0.0);
    bool _1178 = _1174 || _1176;
    bool _1180 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1182 = _1178 || _1180;
    int _1184 = _1152 ? 0 : 1;
    float _1186 = float(_1060);
    float _1188 = exp2(_1166);
    int _1190 = ~_1170;
    int _1192 = _1190 + 1;
    int _1194 = _1192 + 1;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1198 = 1.0 + _1196;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1206 = _1204 != 0;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1210 = _1208 != 0;
    int _1212 = _1194;
    if (!_1052)
    {
        int _1214 = ~_1170;
        int _1216 = _1214 + 1;
        _1212 = _1216;
    }
    int _1218 = _1212;
    float _1220 = 1.0 / _1186;
    float _1222 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1224 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1226 = isnan(1.0);
    bool _1228 = _1224 || _1226;
    bool _1230 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1232 = _1228 || _1230;
    bool _1234 = !_1206;
    int _1236 = _1234 ? 0 : 1;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1240 = !_1202;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = 1.0 / _1198;
    bool _1246 = !_1210;
    int _1248 = _1246 ? 0 : 1;
    float _1250 = fma(_1126, -2.0, _1238);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1254 = _1252 != 0;
    int _1256 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1258 = _1256 != 0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1262 = _1260 != 0;
    float _1264 = -_1188;
    float _1266 = _1264 + 1.0;
    int _1268 = ~_1184;
    int _1270 = _1268 + 1;
    int _1272 = _1270 + 1;
    float _1274 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1276 = _1272;
    if (!_1168)
    {
        int _1278 = ~_1184;
        int _1280 = _1278 + 1;
        _1276 = _1280;
    }
    int _1282 = _1276;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1286 = !_1254;
    int _1288 = _1286 ? 0 : 1;
    float _1290 = in.m_57.x;
    float _1292 = in.m_57.y;
    float _1294 = in.m_57.z;
    bool _1296 = !_1258;
    int _1298 = _1296 ? 0 : 1;
    float _1300 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1274);
    int _1302 = abs(_1288);
    float _1304 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1284);
    int _1306 = abs(_1298);
    float _1308 = -_100;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1142);
    float _1312 = _1220 * _100;
    float _1314 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1092);
    float _1316 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1300);
    float _1318 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1304);
    float _1320 = float(_964);
    float _1322 = float(_1218);
    float _1324 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1250);
    float _1326 = _1182 ? _1266 : 0.0;
    float _1328 = _1320 * _100;
    float _1330 = float(_1302);
    float _1332 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1130);
    float _1334 = float(_1162);
    if (_1232)
    {
        float _1336 = _1326 * _1244;
        _110 = _1336;
    }
    float _1338 = _110;
    bool _1340 = !_1262;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = float(_1306);
    float _1346 = _1330 * _1334;
    int _1348 = abs(_1342);
    float _1350 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1352 = _1344 * _1322;
    float _1354 = _1346 * (-2.0);
    float _1356 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1358 = _1350 * _1350;
    float _1360 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1362 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1360;
    float _1364 = _960 + (-0.5);
    float _1366 = fma(_1354, _1290, _1290);
    float _1368 = _1172 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1370 = fma(_1356, _1356, _1358);
    float _1372 = float(_1282);
    float _1374 = fma(_1222, _1354, _1222);
    float _1376 = float(_1348);
    float _1378 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1366);
    float _1380 = fma(_1368, _1368, _1370);
    float _1382 = _1352 * (-2.0);
    float _1384 = 1.0 / _1362;
    float _1386 = _1376 * _1372;
    float _1388 = fma(_1374, _1338, _1378);
    float _1390 = _1040 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1392 = fma(_1062, _1382, _1062);
    float _1394 = fma(_1382, _1292, _1292);
    float _1396 = _974 + (-0.5);
    float _1398 = _1038 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1400 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1402 = in.m_59.x;
    float _1404 = in.m_59.y;
    float _1406 = in.m_59.z;
    float _1408 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1394);
    float _1410 = _1386 * (-2.0);
    float _1412 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1400);
    float _1414 = rsqrt(_1380);
    float _1416 = fma(_1392, _1338, _1408);
    float _1418 = fma(_1056, _1410, _1056);
    float _1420 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1412);
    float _1422 = fma(_1410, _1294, _1294);
    float _1424 = _1416 * 0.15915493667125701904296875;
    float _1426 = _1104 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1428 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1430 = _1388 * 0.15915493667125701904296875;
    float _1432 = _966 + (-0.5);
    float _1434 = _1424 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    bool _1438 = _1428 >= _1426;
    bool _1440 = isnan(_1428);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan(_1426);
    bool _1446 = _1442 || _1444;
    float _1448 = fma(_1432, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1422);
    float _1450 = -_1428;
    float _1452 = _1426 + _1450;
    float _1454 = _1356 * _1414;
    float _1456 = fma(_1418, _1338, _1448);
    float _1458 = _1430 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = abs(_1452);
    float _1464 = precise::max(_1462, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1466 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1402);
    float _1468 = _1456 * 0.15915493667125701904296875;
    float _1470 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1404);
    float _1472 = precise::min(_1464, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1474 = _1350 * _1414;
    bool _1476 = !_1446;
    float _1478 = _1476 ? 1.0 : (-1.0);
    float _1480 = _1430 * 6.283185482025146484375;
    float _1482 = cos(_1480);
    float _1484 = _1368 * _1414;
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1488 = _1472 + _1486;
    float _1490 = _1488 * _1384;
    float _1492 = _1424 * 6.283185482025146484375;
    float _1494 = cos(_1492);
    float _1496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1406);
    float _1498 = _972 * _1466;
    float _1500 = _978 * _1470;
    float _1502 = _1478 * _1490;
    float _1504 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1506 = _1460 * _1436;
    float _1508 = _990 * _1496;
    float _1510 = _1468 * 6.283185482025146484375;
    float _1512 = cos(_1510);
    float _1514 = _1504 * _1502;
    float _1516 = _1482 * _1436;
    float _1518 = _1514 * 0.15915493667125701904296875;
    float _1520 = _1468 * 6.283185482025146484375;
    float _1522 = sin(_1520);
    float _1524 = _1482 * _1494;
    float _1526 = _1460 * _1494;
    float _1528 = _1436 * _1512;
    float _1530 = _1512 * _1500;
    float _1532 = _1494 * _1512;
    float _1534 = _1518 * 6.283185482025146484375;
    float _1536 = cos(_1534);
    float _1538 = _1482 * _1530;
    float _1540 = _1460 * _1530;
    float _1542 = fma(_1522, _1524, _1506);
    float _1544 = -_1516;
    float _1546 = fma(_1522, _1526, _1544);
    float _1548 = -_1500;
    float _1550 = _1522 * _1548;
    float _1552 = -_1526;
    float _1554 = fma(_1522, _1516, _1552);
    float _1556 = fma(_1542, _1498, _1538);
    float _1558 = _1518 * 6.283185482025146484375;
    float _1560 = sin(_1558);
    float _1562 = fma(_1532, _1498, _1550);
    float _1564 = fma(_1522, _1506, _1524);
    float _1566 = fma(_1554, _1508, _1556);
    float _1568 = fma(_1546, _1498, _1540);
    float _1570 = fma(_1528, _1508, _1562);
    float _1572 = _1484 * _1484;
    float _1574 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1576 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1578 = _1566 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1580 = fma(_1564, _1508, _1568);
    float _1582 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1574);
    float _1584 = -_1536;
    float _1586 = _1584 + 1.0;
    float _1588 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1576);
    float _1590 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1578);
    float _1592 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1582);
    float _1594 = _1454 * _1560;
    float _1596 = _1474 * _1586;
    float _1598 = fma(_1586, _1572, _1536);
    float _1600 = _1454 * _1586;
    float _1602 = _1474 * _1560;
    float _1604 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1588);
    float _1606 = _1484 * _1560;
    float _1608 = fma(_1484, _1596, _1594);
    float _1610 = _1592 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1612 = -_1602;
    float _1614 = fma(_1484, _1600, _1612);
    float _1616 = -_1606;
    float _1618 = fma(_1474, _1600, _1616);
    float _1620 = _1604 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1622 = _1610 * _1608;
    float _1624 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1590);
    float _1626 = fma(_1454, _1600, _1536);
    float _1628 = _1610 * _1618;
    float _1630 = fma(_1620, _1614, _1622);
    float _1632 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1634 = fma(_1484, _1600, _1602);
    float _1636 = fma(_1620, _1626, _1628);
    float _1638 = fma(_1474, _1596, _1536);
    float _1640 = fma(_1632, _1598, _1630);
    float _1642 = fma(_1474, _1600, _1606);
    float _1644 = fma(_1632, _1634, _1636);
    float _1646 = _1610 * _1638;
    float _1648 = _1080 + _1640;
    float _1650 = -_1594;
    float _1652 = fma(_1484, _1596, _1650);
    float _1654 = _1398 + _1644;
    float _1656 = fma(_1620, _1642, _1646);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1660 = _1648 + _1658;
    float _1662 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1666 = _1654 + _1664;
    float _1668 = fma(_1632, _1652, _1656);
    float _1670 = _1660 * _1660;
    float _1672 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1662);
    float _1674 = _1390 + _1668;
    float _1676 = fma(_1666, _1666, _1670);
    float _1678 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1672);
    float _1680 = sqrt(_1676);
    bool _1682 = _1680 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1684 = _1652;
    float _1686 = _1672;
    float _1688 = _1596;
    float _1690 = _1660;
    float _1692 = _1648;
    if (!_1682)
    {
        _1684 = _1654;
    }
    float _1694 = _1684;
    float _1696 = _1694;
    if (!_1682)
    {
        _1686 = _1648;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (!_1682)
    {
        _1688 = _1674;
    }
    float _1702 = _1688;
    bool _1704 = !_1682;
    float _1706 = _1702;
    if (!_1704)
    {
        float _1708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1712 = _1680 + _1710;
        float _1714 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = rsqrt(_1676);
        float _1718 = _1712 * _1708;
        float _1720 = _1718 * 0.15915493667125701904296875;
        float _1722 = _1720 * 6.283185482025146484375;
        float _1724 = cos(_1722);
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = sin(_1726);
        float _1730 = _1724 + (-1.0);
        float _1732 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1734 = fma(_1728, _1714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1736 = fma(_1674, _1724, _1732);
        float _1738 = _1716 * _1734;
        float _1740 = fma(_1666, _1738, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1742 = fma(_1660, _1738, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1706 = _1736;
        _1696 = _1740;
        _1700 = _1742;
    }
    float _1744 = _1706;
    float _1746 = _1696;
    float _1748 = _1700;
    float _1750 = -_1390;
    float _1752 = _1750 + _1744;
    float _1754 = -_1398;
    float _1756 = _1754 + _1746;
    float _1758 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1760 = -_1080;
    float _1762 = _1760 + _1748;
    float _1764 = _1752 * _1752;
    float _1766 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1768 = 1.0 / _1758;
    float _1770 = fma(_1756, _1756, _1764);
    float _1772 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1766);
    float _1774 = fma(_1762, _1762, _1770);
    float _1776 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1772);
    float _1778 = sqrt(_1774);
    float _1780 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1782 = _1780 + _1758;
    float _1784 = _1782 * _1768;
    float _1786 = _1784 * 0.5;
    bool _1788 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1790 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1792 = _1788 || _1790;
    bool _1794 = isnan(0.5);
    bool _1796 = _1792 || _1794;
    bool _1798 = _1778 > 0.0;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1802 = fma(_1786, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1800);
    bool _1804 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan(0.5);
    bool _1812 = _1808 || _1810;
    float _1814 = 1.0 / _1802;
    float _1816 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1818 = _1748;
    float _1820 = _1746;
    float _1822 = _1752;
    float _1824 = _1756;
    float _1826 = _1762;
    float _1828 = _1774;
    float _1830 = _1744;
    if (!_1798)
    {
        _1816 = _1744;
    }
    float _1832 = _1816;
    bool _1834 = !_1798;
    float _1836 = _1832;
    if (!_1834)
    {
        float _1838 = _172 * _172;
        float _1840 = rsqrt(_1774);
        float _1842 = fma(_170, _170, _1838);
        float _1844 = fma(_174, _174, _1842);
        float _1846 = sqrt(_1844);
        float _1848 = _1762 * _1840;
        bool _1850 = _1846 > 0.0;
        float _1852 = _1756 * _1840;
        float _1854 = _1752 * _1840;
        float _1856 = _1840;
        _1824 = _1854;
        _1690 = _1852;
        if (!_1850)
        {
            _1856 = _1744;
        }
        float _1858 = _1856;
        bool _1860 = !_1850;
        _1836 = _1858;
        if (!_1860)
        {
            float _1862 = rsqrt(_1844);
            float _1864 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1866 = _172 * _1862;
            float _1868 = _170 * _1862;
            float _1870 = _1854 * _1866;
            float _1872 = _174 * _1862;
            float _1874 = fma(_1852, _1868, _1870);
            float _1876 = _1864 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1878 = fma(_1848, _1872, _1874);
            float _1880 = _1878 * _1876;
            float _1882 = fma(_170, _1880, _1746);
            float _1884 = fma(_172, _1880, _1744);
            float _1886 = fma(_174, _1880, _1748);
            _1836 = _1884;
            _1818 = _1886;
            _1820 = _1882;
            _1822 = _1868;
            _1824 = _1874;
            _1826 = _1880;
            _1828 = _1864;
        }
    }
    float _1888 = _1836;
    float _1890 = _1818;
    float _1892 = _1820;
    float _1894 = _1822;
    float _1896 = _1824;
    float _1898 = _1690;
    float _1900 = _1826;
    float _1902 = _1828;
    float _1904 = _1902;
    float _1906 = _1894;
    float _1908 = _1892;
    float _1910 = _1888;
    float _1912 = _1896;
    float _1914 = _1898;
    if (_1812)
    {
        _1904 = 1.0;
    }
    float _1916 = _1904;
    float _1918 = _1916;
    if (_1796)
    {
        _1906 = _1888;
    }
    float _1920 = _1906;
    float _1922 = _1920;
    if (_1796)
    {
        _1830 = _1890;
    }
    float _1924 = _1830;
    float _1926 = _1924;
    if (!_1796)
    {
        float _1928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1930 = _1390 + _1928;
        float _1932 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1934 = _1398 + _1932;
        float _1936 = -_1398;
        float _1938 = _1936 + _1892;
        float _1940 = -_1390;
        float _1942 = _1940 + _1888;
        float _1944 = _1930 * _1930;
        float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1948 = _1080 + _1946;
        float _1950 = -_1080;
        float _1952 = _1950 + _1890;
        float _1954 = fma(_1934, _1934, _1944);
        float _1956 = fma(_1948, _1948, _1954);
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1960 = sqrt(_1956);
        float _1962 = precise::min(_1960, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1964 = _1962 * _1958;
        float _1966 = fma(_1938, _1964, _1398);
        float _1968 = fma(_1942, _1964, _1390);
        float _1970 = fma(_1952, _1964, _1080);
        _1922 = _1968;
        _1908 = _1966;
        _1926 = _1970;
        _1910 = _1942;
    }
    float _1972 = _1922;
    float _1974 = _1908;
    float _1976 = _1926;
    float _1978 = _1910;
    float _1980 = _1978;
    if (_1812)
    {
        _1980 = 1.0;
    }
    float _1982 = _1980;
    float _1984 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1986 = _1814 * _1984;
    float _1988 = _1982;
    if (!_1812)
    {
        float _1990 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1992 = _1990 * 0.15915493667125701904296875;
        float _1994 = _1992 * 6.283185482025146484375;
        float _1996 = cos(_1994);
        float _1998 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2000 = _1998 * 0.15915493667125701904296875;
        float _2002 = _1992 * 6.283185482025146484375;
        float _2004 = sin(_2002);
        float _2006 = 1.0 / _1996;
        float _2008 = _2000 * 6.283185482025146484375;
        float _2010 = cos(_2008);
        float _2012 = _2004 * _2006;
        float _2014 = _2000 * 6.283185482025146484375;
        float _2016 = sin(_2014);
        float _2018 = _2010 * _2012;
        float _2020 = 1.0 / _2018;
        float _2022 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2024 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2022;
        float _2026 = 1.0 / _2024;
        float _2028 = _2016 * _2020;
        float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2032 = fma(_1986, _2028, _2030);
        float _2034 = _2032 * _2026;
        float _2036 = precise::clamp(_2034, 0.0, 1.0);
        _178 = _2026;
        _1918 = _2036;
    }
    float _2038 = _178;
    float _2040 = _1918;
    float _2042 = _2038;
    if (!_1812)
    {
        float _2044 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2046 = _2044 * 0.15915493667125701904296875;
        float _2048 = _2046 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        float _2052 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2054 = _2052 * 0.15915493667125701904296875;
        float _2056 = _2046 * 6.283185482025146484375;
        float _2058 = sin(_2056);
        float _2060 = 1.0 / _2050;
        float _2062 = _2054 * 6.283185482025146484375;
        float _2064 = cos(_2062);
        float _2066 = _2058 * _2060;
        float _2068 = _2054 * 6.283185482025146484375;
        float _2070 = sin(_2068);
        float _2072 = _2064 * _2066;
        float _2074 = 1.0 / _2072;
        float _2076 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2078 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2076;
        float _2080 = 1.0 / _2078;
        float _2082 = _2070 * _2074;
        float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2086 = fma(_1986, _2082, _2084);
        float _2088 = _2086 * _2080;
        float _2090 = precise::clamp(_2088, 0.0, 1.0);
        float _2092 = -_2090;
        float _2094 = _2092 + 1.0;
        _2042 = _2060;
        _1912 = _2074;
        _1988 = _2094;
    }
    float _2096 = _2042;
    float _2098 = _1912;
    float _2100 = _1988;
    float _2102 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2104 = _1972 + _2102;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2108 = _1974 + _2106;
    float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2112 = _1976 + _2110;
    float _2114 = _2104 * _2104;
    float _2116 = fma(_2108, _2108, _2114);
    float _2118 = fma(_2112, _2112, _2116);
    float _2120 = rsqrt(_2118);
    float _2122 = sqrt(_2118);
    float _2124 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2126 = _2108 * _2124;
    float _2128 = _2112 * _2124;
    float _2130 = _2126 * _2126;
    float _2132 = _2128 * _2128;
    float _2134 = _2130 + _2132;
    float _2136 = sqrt(_2134);
    bool _2138 = _2136 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2142 = _2136 + _2140;
    float _2144 = _2096;
    float _2146 = _2134;
    float _2148 = _2142;
    float _2150 = _2104;
    float _2152 = _2128;
    float _2154 = _2130;
    float _2156 = _2132;
    if (_2138)
    {
        float _2158 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2158;
    }
    float _2160 = _2144;
    if (_2138)
    {
        float _2162 = rsqrt(_2134);
        _2146 = _2162;
    }
    float _2164 = _2146;
    if (_2138)
    {
        float _2166 = _2142 * _2160;
        _2148 = _2166;
    }
    float _2168 = _2148;
    if (_2138)
    {
        float _2170 = _2168 * 0.15915493667125701904296875;
        _1914 = _2170;
    }
    float _2172 = _1914;
    float _2174 = _2098;
    if (_2138)
    {
        float _2176 = _2172 * 6.283185482025146484375;
        float _2178 = sin(_2176);
        _2174 = _2178;
    }
    float _2180 = _2174;
    float _2182 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2184 = precise::max(0.0, _2182);
    float _2186 = _1900;
    float _2188 = _2182;
    float _2190 = _2184;
    if (_2138)
    {
        float _2192 = _2172 * 6.283185482025146484375;
        float _2194 = cos(_2192);
        _2186 = _2194;
    }
    float _2196 = _2186;
    float _2198 = -_2124;
    float _2200 = -_2184;
    float _2202 = fma(_2104, _2198, _2200);
    if (!_2138)
    {
        _2150 = _2126;
    }
    float _2204 = _2150;
    float _2206 = _2204;
    if (_2138)
    {
        float _2208 = _2202 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2188 = _2208;
    }
    float _2210 = _2188;
    float _2212 = _2180;
    float _2214 = _2210;
    if (_2138)
    {
        float _2216 = fma(_2180, _2210, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2212 = _2216;
    }
    float _2218 = _2212;
    if (!_2138)
    {
        _2214 = _2202;
    }
    float _2220 = _2214;
    float _2222 = _2220;
    if (_2138)
    {
        float _2224 = _2196 + (-1.0);
        _2190 = _2224;
    }
    float _2226 = _2190;
    float _2228 = _2226;
    if (_2138)
    {
        float _2230 = _2164 * _2218;
        _1692 = _2230;
    }
    float _2232 = _1692;
    if (_2138)
    {
        float _2234 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2228 = _2234;
    }
    float _2236 = _2228;
    if (_2138)
    {
        float _2238 = _2126 * _2232;
        _2206 = _2238;
    }
    float _2240 = _2206;
    if (_2138)
    {
        float _2242 = _2128 * _2232;
        _2152 = _2242;
    }
    float _2244 = _2152;
    float _2246 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2248 = fma(_2122, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2246);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    if (_2138)
    {
        float _2252 = fma(_2202, _2196, _2236);
        _2222 = _2252;
    }
    float _2254 = _2222;
    if (_2138)
    {
        float _2256 = _2240 * _2240;
        _2154 = _2256;
    }
    float _2258 = _2154;
    if (_2138)
    {
        float _2260 = _2244 * _2244;
        _2156 = _2260;
    }
    float _2262 = _2156;
    float _2264 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2266 = -_2250;
    float _2268 = _2266 + 1.0;
    float _2270 = fma(_2254, _2254, _2258);
    float _2272 = abs(_2268);
    float _2274 = log2(_2272);
    float _2276 = _2270 + _2262;
    float _2278 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2280 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2282 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2278);
    float _2284 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2286 = rsqrt(_2276);
    float _2288 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2282);
    float _2290 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2264);
    float _2292 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2294 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2284);
    float _2296 = _2288 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2298 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2290);
    float _2300 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2292);
    float _2302 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2294);
    float _2304 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2306 = _2298 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2308 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2300);
    float _2310 = _2302 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2312 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2314 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2316 = _2286 * _2240;
    float _2318 = _2286 * _2254;
    float _2320 = _2286 * _2244;
    float _2322 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2314);
    float _2324 = _2316 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2326 = -_2304;
    float _2328 = fma(_2326, _2280, 1.0);
    float _2330 = _2308 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2332 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2322);
    float _2334 = -_2324;
    float _2336 = fma(_2318, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2334);
    float _2338 = exp2(_2312);
    float _2340 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2342 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2332);
    float _2344 = -_2320;
    float _2346 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2336);
    float _2348 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2350 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2340);
    float _2352 = fma(_2346, -0.5, 0.5);
    float _2354 = log2(_2328);
    float _2356 = fma(_2346, 0.5, 0.5);
    float _2358 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2348);
    float _2360 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2350);
    float _2362 = fma(_2356, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2364 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2358);
    float _2366 = 1.0 / _2342;
    float _2368 = _2318 + 1.0;
    float _2370 = fma(_2356, _2362, -0.212114393711090087890625);
    float _2372 = -_2318;
    float _2374 = fma(_2338, _2368, _2372);
    float _2376 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2364);
    float _2378 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2360);
    float _2380 = sqrt(_2352);
    float _2382 = fma(_2356, _2370, 1.570728778839111328125);
    float _2384 = _2354 * 0.693147182464599609375;
    float _2386 = fma(_2374, 0.5, 0.5);
    float _2388 = _2384 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2390 = _2376 * _2366;
    float _2392 = _2378 * _2366;
    float _2394 = fma(_2390, 0.5, 0.5);
    float _2396 = fma(_2392, -0.5, 0.5);
    float _2398 = _2380 * 0.636619746685028076171875;
    float _2400 = -_2382;
    float _2402 = fma(_2398, _2400, 1.0);
    float3 _6907 = float3(_2394, _2396, _2388);
    float _2404 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6907, float3(0.0), isnan(_6907)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6907, float3(0.0), isnan(_6907)), level(0.0)).x;
    float3 _6918 = float3(_2394, _2396, _2388);
    float4 _2407 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6918, float3(0.0), isnan(_6918)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6918, float3(0.0), isnan(_6918)), level(0.0)).xyzw;
    float _2409 = _2407.x;
    float _2411 = _2407.y;
    float _2413 = _2407.z;
    float _2415 = _2407.w;
    float2 _6935 = float2(_2402, _2386);
    float3 _2419 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6935, float2(0.0), isnan(_6935)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6935, float2(0.0), isnan(_6935)), level(0.0)).xyz;
    float _2421 = _2419.x;
    float _2423 = _2419.y;
    float _2425 = _2419.z;
    float _2427 = float(uint(_964));
    float _2429 = trunc(_1312);
    int _2431 = int(_2429);
    int _2433 = ~_964;
    int _2435 = _2433 + 1;
    out.m_61.x = _710;
    out.m_61.y = _712;
    out.m_61.z = _714;
    out.m_61.w = _718;
    int _2437 = ~_964;
    int _2439 = _2437 + 1;
    float _2441 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2443 = abs(_1236);
    float _2445 = _2306 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2447 = 1.0 / _2427;
    float _2449 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2445);
    float _2451 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2449);
    float _2453 = float(uint(_2431));
    float _2455 = exp2(_2441);
    float _2457 = float(_2431);
    float _2459 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2451);
    int _2461 = as_type<int>(_2447) + (-2);
    out.gl_Position.x = _2376;
    out.gl_Position.y = _2378;
    out.gl_Position.z = _2459;
    out.gl_Position.w = _2342;
    float _2463 = as_type<float>(_2461) * _2453;
    float _2465 = trunc(_2463);
    float _2467 = precise::max(_2465, 0.0);
    uint _2470 = uint(_2467);
    float _2472 = -_2455;
    float _2474 = _2472 + 1.0;
    int _2476 = _2435 * int(_2470);
    int _2478 = _2476 + _2431;
    float _2480 = float(uint(_2478));
    float _2482 = as_type<float>(_2461) * _2480;
    bool _2484 = !_970;
    float _2486 = _2484 ? 7.345489978790283203125 : 1.0;
    float _2488 = trunc(_2482);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    float _2494 = _2486 * _960;
    bool _2496 = _2457 >= _1320;
    bool _2498 = isnan(_2457);
    bool _2500 = _2496 || _2498;
    bool _2502 = isnan(_1320);
    bool _2504 = _2500 || _2502;
    float _2506 = float(_2504);
    float _2508 = floor(_2494);
    int _2510 = int(_2470) + int(_2492);
    float _2512 = trunc(_2506);
    int _2514 = int(_2512);
    int _2516 = _2439 * _2510;
    int _2518 = _2516 + _2431;
    float _2520 = -_2508;
    float _2522 = _2494 + _2520;
    bool _2524 = uint(_2518) >= uint(_964);
    bool _2526 = !_2524;
    int _2528 = _2526 ? 0 : (-1);
    bool _2530 = _964 == 0;
    int _2532 = ~_2510;
    int _2534 = _2532 + _2528;
    int _2536 = _2534 + 1;
    float _2538 = _2522 * _1320;
    float _2540 = _1328 * _152;
    int _2542 = ~_2514;
    int _2544 = _2542 + 1;
    int _2546 = _2544 + 1;
    int _2548 = _964 * _2536;
    int _2550 = _2548 + _2431;
    int _2552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2554 = _2552 != 0;
    float _2556 = trunc(_2538);
    int _2558 = int(_2556);
    int _2560 = _964 + (-1);
    bool _2562 = !_2530;
    int _2564 = _2562 ? _2550 : (-1);
    bool _2566 = !_2554;
    int _2568 = _2566 ? 0 : 1;
    int _2570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2572 = _2570 != 0;
    float _2574 = trunc(_2540);
    int _2576 = int(_2574);
    int _2578 = _2564 * _2546;
    int _2580 = abs(_2568);
    int _2582 = abs(_1248);
    int _2584 = _2514 * _2560;
    int _2586 = _2584 + _2578;
    int _2588 = abs(_1242);
    int _2590 = _2586 * _2443;
    bool _2592 = !_2572;
    int _2594 = _2592 ? 0 : 1;
    int _2596 = _2558 * _2580;
    int _2598 = _2596 + _2431;
    int _2600 = abs(_2594);
    float _2602 = in.m_53.w;
    int _2604 = _2576 * _2588;
    int _2606 = _2604 + _2590;
    int _2608 = ~_964;
    int _2610 = _2608 + 1;
    int _2612 = _2598 * _2582;
    int _2614 = _2612 + _2606;
    float _2616 = float(uint(_2598));
    int _2618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2620 = _2618 != 0;
    int _2622 = _2558 * _2600;
    int _2624 = _2622 + _2614;
    int _2626 = ~_964;
    int _2628 = _2626 + 1;
    int _2630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2632 = _2630 != 0;
    float _2634 = float(uint(_2624));
    int _2636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2638 = _2636 != 0;
    float _2640 = as_type<float>(_2461) * _2634;
    int _2642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2644 = _2642 != 0;
    float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2648 = _2646 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2650 = trunc(_2640);
    float _2652 = precise::max(_2650, 0.0);
    uint _2654 = uint(_2652);
    bool _2656 = _2602 > 0.5;
    float _2658 = 1.0 / _2648;
    int _2660 = _2628 * int(_2654);
    int _2662 = _2660 + _2624;
    float _2664 = float(uint(_2662));
    float _2666 = as_type<float>(_2461) * _2664;
    float _2668 = in.m_63.y;
    float _2670 = trunc(_2666);
    float _2672 = precise::max(_2670, 0.0);
    uint _2674 = uint(_2672);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2676 = as_type<float>(_2461) * _2616;
    int _2678 = int(_2654) + int(_2674);
    float _2680 = trunc(_2676);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    float _2686 = -_2668;
    float _2688 = _2686 + 1.0;
    int _2690 = _2610 * _2678;
    int _2692 = _2690 + _2624;
    int _2694 = _2656 ? as_type<int>(_2688) : as_type<int>(_2668);
    bool _2696 = uint(_2692) >= uint(_964);
    float _2698 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2700 = _2698 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2702 = _974 > 0.5;
    float _2704 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2706 = _958 + _2704;
    bool _2708 = !_2696;
    int _2710 = _2708 ? 0 : (-1);
    float _2712 = 1.0 / _2700;
    int _2714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2716 = _2714 != 0;
    int _2718 = ~_2678;
    int _2720 = _2718 + _2710;
    int _2722 = _2720 + 1;
    float _2724 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2724;
    float _2728 = _2716 ? as_type<float>(_2694) : _2668;
    float _2730 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2732 = _2730 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2734 = _2668;
    bool _2736 = _2702;
    bool _2738 = _2716;
    int _2740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].w);
    if (_2620)
    {
        float _2742 = _2702 ? _2688 : _2668;
        _2734 = _2742;
    }
    float _2744 = _2734;
    int _2746 = _964 * _2722;
    int _2748 = _2746 + _2624;
    float _2750 = in.m_63.x;
    if (_2632)
    {
        bool _2752 = _966 > 0.5;
        _2736 = _2752;
    }
    bool _2754 = _2736;
    float _2756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2758 = ~_964;
    int _2760 = _2758 + 1;
    float _2762 = _2726 * _2658;
    bool _2764 = !_2530;
    int _2766 = _2764 ? _2748 : (-1);
    if (_2638)
    {
        bool _2768 = _960 > 0.5;
        _2738 = _2768;
    }
    bool _2770 = _2738;
    int _2772 = _2760 * int(_2684);
    int _2774 = _2772 + _2598;
    int _2776 = _2766 >> 31;
    float _2778 = _2732 * _2712;
    bool _2780 = _958 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2782 = isnan(_958);
    bool _2784 = _2780 || _2782;
    bool _2786 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2788 = _2784 || _2786;
    float _2790 = float(_2788);
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2794 = _958 + _2792;
    float _2796 = float(uint(_2774));
    float _2798 = fma(_2778, _2706, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2800 = _2776 & 3;
    float _2802 = -_2790;
    float _2804 = _2802 + 1.0;
    bool _2806 = _958 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2808 = isnan(_958);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = as_type<float>(_2461) * _2796;
    int _2820 = _2766 + _2800;
    float _2822 = fma(_2762, _2794, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2824 = _958 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2826 = isnan(_958);
    bool _2828 = _2824 || _2826;
    bool _2830 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2832 = _2828 || _2830;
    float _2834 = float(_2832);
    float _2836 = _2816 * _2804;
    float _2838 = -_2816;
    float _2840 = _2838 + 1.0;
    int _2842 = _2820 >> 2;
    float _2844 = _2756 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2846 = _2756;
    float _2848 = _2840;
    int _2850 = _2842;
    if (!_2638)
    {
        _2846 = _2750;
    }
    float _2852 = _2846;
    float _2854 = _2834 * _2840;
    int _2856 = _2842 << 4;
    int _2858 = _2856 + 368;
    float _2860 = fma(_2728, _2844, -0.5);
    float _2862 = _2852;
    if (!_2638)
    {
        _2848 = _2852;
    }
    float _2864 = _2848;
    float _2866 = _2822 * _2854;
    float _2868 = _2864;
    if (_2638)
    {
        _2862 = _2750;
    }
    float _2870 = _2862;
    float _2872 = -_2834;
    float _2874 = _2872 + 1.0;
    uint _2876 = uint(int(uint(_2858) >> uint(2)));
    uint _2878 = uint(int(uint(int(_2876)) >> uint(2)));
    int _2880 = int(_2876) & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    int _2884 = int(_2876) + 1;
    uint _2886 = uint(int(uint(_2884) >> uint(2)));
    int _2888 = _2884 & 3;
    float _2890 = (*spvDescriptorSet0.vp_c9)._m0[int(_2886)][_2888];
    float _2892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2894 = _2870;
    if (_2638)
    {
        float _2896 = -_2870;
        float _2898 = _2896 + 1.0;
        _2850 = as_type<int>(_2898);
    }
    int _2900 = _2850;
    if (_2632)
    {
        float _2902 = -_2870;
        float _2904 = _2902 + 1.0;
        _2740 = as_type<int>(_2904);
    }
    int _2906 = _2740;
    float _2908 = -_1324;
    float _2910 = fma(_1314, _2860, _2908);
    float _2912 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2744, -0.5);
    float _2914 = fma(_2874, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2866);
    if (_2638)
    {
        float _2916 = _2770 ? as_type<float>(_2900) : _2870;
        _2868 = _2916;
    }
    float _2918 = _2868;
    int _2920 = _2858 + 8;
    uint _2922 = uint(int(uint(_2920) >> uint(2)));
    uint _2924 = uint(int(uint(int(_2922)) >> uint(2)));
    int _2926 = int(_2922) & 3;
    float _2928 = (*spvDescriptorSet0.vp_c9)._m0[int(_2924)][_2926];
    int _2930 = int(_2922) + 1;
    uint _2932 = uint(int(uint(_2930) >> uint(2)));
    int _2934 = _2930 & 3;
    float _2936 = (*spvDescriptorSet0.vp_c9)._m0[int(_2932)][_2934];
    if (_2632)
    {
        float _2938 = _2754 ? as_type<float>(_2906) : _2870;
        _2894 = _2938;
    }
    float _2940 = _2894;
    float _2942 = fma(_2798, _2836, _2914);
    int _2944 = _2766 & 3;
    bool _2946 = _2944 != 0;
    float _2948 = trunc(_2818);
    float _2950 = precise::max(_2948, 0.0);
    uint _2952 = uint(_2950);
    float _2954 = -_1164;
    float _2956 = fma(_1318, _2912, _2954);
    bool _2958 = uint(_2944) > 1u;
    float _2960 = _2892 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2962 = _2766 & 3;
    bool _2964 = _2962 != 0;
    float _2966 = fma(_2918, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2968 = uint(_2944) >= 2u;
    float _2970 = fma(_2960, _2940, -0.5);
    int _2972 = _2964 ? 0 : 1;
    float _2974 = fma(_1316, _2966, _1070);
    bool _2976 = _2944 != 3;
    float _2978 = fma(_1332, _2970, _1310);
    int _2980 = ~_2972;
    int _2982 = _2980 + 1;
    int _2984 = _2982 + 1;
    int _2986 = int(_2684) + int(_2952);
    float _2988 = _2978 + 0.5;
    int _2990 = _2984;
    if (!_2958)
    {
        int _2992 = ~_2972;
        int _2994 = _2992 + 1;
        _2990 = _2994;
    }
    int _2996 = _2990;
    int _2998 = ~_964;
    int _3000 = _2998 + 1;
    int _3002 = abs(_2996);
    bool _3004 = !_2946;
    int _3006 = _3004 ? 0 : 1;
    int _3008 = _3000 * _2986;
    int _3010 = _3008 + _2598;
    int _3012 = _2968 ? 0 : 1;
    bool _3014 = _2944 != 3;
    int _3016 = ~_3012;
    int _3018 = _3016 + 1;
    int _3020 = _3018 + 1;
    bool _3022 = !_3014;
    int _3024 = _3022 ? 0 : (-1);
    int _3026 = abs(_3006);
    int _3028 = _3020;
    if (_2976)
    {
        int _3030 = ~_3012;
        int _3032 = _3030 + 1;
        _3028 = _3032;
    }
    int _3034 = _3028;
    int _3036 = ~_3002;
    int _3038 = _3036 + 1;
    int _3040 = _3038 + 1;
    bool _3042 = uint(_3010) >= uint(_964);
    int _3044 = abs(_3024);
    int _3046 = _3040 * as_type<int>(_2890);
    int _3048 = abs(_3034);
    int _3050 = ~_3026;
    int _3052 = _3050 + 1;
    int _3054 = _3052 + 1;
    bool _3056 = !_2644;
    int _3058 = _3056 ? 0 : 1;
    int _3060 = _3054 * as_type<int>(_2882);
    int _3062 = _3060 + _3046;
    int _3064 = ~_3048;
    int _3066 = _3064 + 1;
    int _3068 = _3066 + 1;
    bool _3070 = !_3042;
    int _3072 = _3070 ? 0 : (-1);
    int _3074 = abs(_3058);
    int _3076 = _3068 * as_type<int>(_2928);
    int _3078 = _3076 + _3062;
    int _3080 = ~_3044;
    int _3082 = _3080 + 1;
    int _3084 = _3082 + 1;
    float _3086 = _934 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3088 = ~_2986;
    int _3090 = _3088 + _3072;
    int _3092 = _3090 + 1;
    int _3094 = ~_3074;
    int _3096 = _3094 + 1;
    int _3098 = _3096 + 1;
    int _3100 = _3084 * as_type<int>(_2936);
    int _3102 = _3100 + _3078;
    float _3104 = fma(_2790, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2942);
    int _3106 = _964 * _3092;
    int _3108 = _3106 + _2598;
    float _3110 = _2974 + 0.5;
    int _3112 = _3102 * _3098;
    float _3114 = _930 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3116 = _2956 + 0.5;
    float _3118 = _2910 + 0.5;
    bool _3120 = !_2530;
    int _3122 = _3120 ? _3108 : (-1);
    float _3124 = _932 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3126 = _3114 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3128 = _3086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _3110;
    out.m_67.y = _3116;
    out.m_67.z = _2988;
    out.m_67.w = _3118;
    float _3130 = _3124 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3132 = _2040 * _2100;
    float _3134 = _3104 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3136 = _3122 * _3074;
    int _3138 = _3136 + _3112;
    bool _3140 = _2040 > 0.0;
    bool _3142 = isnan(_2040);
    bool _3144 = _3140 || _3142;
    bool _3146 = isnan(0.0);
    bool _3148 = _3144 || _3146;
    float _3150 = _3132 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_69.x = _3126;
    out.m_69.y = _3130;
    out.m_69.z = _3128;
    out.m_69.w = _3134;
    bool _3152 = _2100 <= 0.0;
    bool _3154 = !_3148;
    bool _3156 = _3152 || _3154;
    float _3158 = _3150 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3160 = float(_3138);
    float _3162 = _2459 + _2342;
    float _3164 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3158;
    float _3166 = _3162 * 0.5;
    float _3168 = _3164 * _2404;
    out.m_71.x = _3160;
    float _3170 = _2415 * _3168;
    float _3172 = _2425 * _3168;
    float _3174 = -_3164;
    float _3176 = _3174 + 1.0;
    out.m_73.z = _3166;
    out.m_73.w = _2342;
    float _3178 = fma(_2421, _3170, _2409);
    float _3180 = fma(_2423, _3170, _2411);
    float _3182 = _2415 * _3176;
    float _3184 = fma(_2415, _3172, _2413);
    out.m_75.x = _3178;
    out.m_75.y = _3180;
    out.m_75.z = _3184;
    out.m_75.w = _3182;
    if (!_3156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3186 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3186;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

