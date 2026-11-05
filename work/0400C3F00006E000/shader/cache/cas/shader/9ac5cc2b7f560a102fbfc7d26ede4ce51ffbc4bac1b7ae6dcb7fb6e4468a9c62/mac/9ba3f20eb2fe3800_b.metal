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
    bool _740 = false;
    bool _642 = false;
    bool _306 = false;
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
        float _3101 = as_type<float>(_118);
        out.gl_Position.z = _3101;
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
        float _3156 = as_type<float>(_144);
        out.gl_Position.z = _3156;
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
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -_216;
    float _224 = _222 + 1.0;
    bool _226 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_200);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = 1.0 / _220;
    float _246 = _236 * _224;
    float _248 = -_236;
    float _250 = _248 + 1.0;
    float _252 = _204 * _244;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _254;
    float _258 = fma(_240, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = fma(_256, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = _258 * _246;
    float _268 = fma(_262, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _270 = _264 * _246;
    float _272 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].x, _266);
    float _274 = _268 * _246;
    float _276 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].z, _270);
    float _278 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].x, _272);
    float _280 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].y, _274);
    float _282 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].y, _280);
    float _284 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].z, _276);
    bool _286 = !_242;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _156;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_55.x;
    float _312 = in.m_55.y;
    float _314 = in.m_55.z;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _332 = 1.0 / _318;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _334;
    float _338 = 1.0 / _322;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _342 = _308 + _340;
    bool _344 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _346 = isnan(_308);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    bool _356 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _358 = isnan(_308);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _284 * _314;
    float _370 = _282 * _312;
    float _372 = 1.0 / _326;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _376 = _308 + _374;
    float _378 = _342 * _332;
    bool _380 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _382 = isnan(_308);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _394 = _308 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _398 = _308 + _396;
    bool _400 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _402 = isnan(_308);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -_354;
    float _414 = _412 + 1.0;
    float _416 = 1.0 / _330;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _420 = _308 + _418;
    float _422 = _376 * _338;
    bool _424 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _426 = isnan(_308);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -_390;
    float _438 = _436 + 1.0;
    float _440 = -_366;
    float _442 = _440 + 1.0;
    float _444 = _410 * _414;
    float _446 = -_410;
    float _448 = _446 + 1.0;
    float _450 = 1.0 / _336;
    float _452 = _394 * _372;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _454;
    float _458 = _434 * _438;
    float _460 = -_434;
    float _462 = _460 + 1.0;
    float _464 = fma(_456, _378, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _466 = _420 * _416;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _468;
    float _472 = _366 * _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _478 = fma(_470, _378, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _480 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _482 = fma(_476, _422, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _484 = _398 * _450;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _486;
    float _490 = _278 * _310;
    float _492 = fma(_488, _378, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _494 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _496 = isnan(_308);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _354 * _442;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _516 = _504 * _448;
    float _518 = fma(_510, _422, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _520 = fma(_514, _422, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _522;
    float _526 = _478 * _516;
    float _528 = _492 * _516;
    float _530 = _464 * _516;
    float _532 = -_504;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _540;
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].x, _526);
    float _546 = fma(_538, _452, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _552 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].y, _528);
    float _554 = fma(_518, _444, _544);
    float _556 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].z, _530);
    float _558 = fma(_542, _452, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _560 = fma(_550, _466, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _562 = fma(_546, _506, _554);
    float _564 = fma(_524, _452, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _566 = fma(_482, _444, _552);
    float _568 = fma(_520, _444, _556);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _578 = fma(_564, _506, _568);
    float _580 = fma(_572, _466, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _586;
    float _590 = fma(_576, _466, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _592 = fma(_558, _506, _566);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _594;
    float _598 = fma(_584, _484, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _600 = fma(_588, _484, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _602 = fma(_560, _472, _562);
    float _604 = fma(_596, _484, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _606 = fma(_580, _472, _592);
    float _608 = fma(_590, _472, _578);
    float _610 = fma(_598, _458, _602);
    float _612 = fma(_600, _458, _606);
    float _614 = fma(_604, _458, _608);
    float _616 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[112].x, _610);
    float _618 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[112].y, _612);
    float _620 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[112].z, _614);
    bool _622 = !_480;
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
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _648 = _644 + _646;
    bool _650 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _652 = isnan(_644);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _666 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _668 = isnan(_644);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _678;
    float _682 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = -_660;
    float _686 = _684 + 1.0;
    bool _688 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _690 = 1.0 / _664;
    float _692 = _676 * _686;
    float _694 = -_676;
    float _696 = _694 + 1.0;
    float _698 = _680 * _690;
    float _700 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _702 = fma(_698, _648, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _704 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _702 * _692;
    float _708 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[115].x, _706);
    float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[116].x, _710);
    float _716 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _716;
    out.m_57.y = _712;
    out.m_57.z = _704;
    out.m_57.w = _718;
    bool _720 = !_688;
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
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _746 = _742 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _750 = _742 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _754 = _742 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _772 = 1.0 / _758;
    bool _774 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _776 = isnan(_742);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = 1.0 / _770;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _790 = _742 + _788;
    bool _792 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _794 = isnan(_742);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    bool _804 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _806 = 1.0 / _766;
    float _808 = _746 * _772;
    bool _810 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _812 = isnan(_742);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = 1.0 / _762;
    float _824 = _790 * _786;
    bool _826 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _828 = isnan(_742);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_820;
    float _840 = _838 + 1.0;
    float _842 = _836 * _840;
    float _844 = _750 * _806;
    bool _846 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _848 = isnan(_742);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_836;
    float _860 = _858 + 1.0;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _866;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _874 = _856 * _860;
    float _876 = fma(_864, _808, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _878 = _754 * _822;
    float _880 = -_856;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _896 = _784 * _882;
    float _898 = -_784;
    float _900 = _898 + 1.0;
    float _902 = fma(_886, _808, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _904 = fma(_868, _808, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _906 = fma(_872, _878, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _908 = _802 * _900;
    float _910 = fma(_890, _878, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _912 = fma(_894, _878, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _914 = -_802;
    float _916 = _914 + 1.0;
    float _918 = _876 * _908;
    float _920 = _902 * _908;
    float _922 = _904 * _908;
    float _924 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].x, _918);
    float _926 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].y, _920);
    float _928 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].z, _922);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _938;
    float _942 = fma(_906, _896, _924);
    float _944 = fma(_912, _896, _928);
    float _946 = fma(_932, _844, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _948 = fma(_936, _844, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _950 = fma(_910, _896, _926);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _960 = fma(_940, _844, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _966 = fma(_946, _874, _942);
    float _968 = fma(_954, _824, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _970 = fma(_958, _824, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _972 = fma(_948, _874, _950);
    float _974 = fma(_964, _824, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _976 = fma(_960, _874, _944);
    float _978 = fma(_968, _842, _966);
    float _980 = fma(_970, _842, _972);
    float _982 = fma(_974, _842, _976);
    float _984 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[127].x, _978);
    float _986 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[127].y, _980);
    float _988 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[127].z, _982);
    bool _990 = !_804;
    if (!_990)
    {
        float _992 = in.m_53.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _178 = _1006;
    }
    float _1008 = _178;
    float _1010 = in.m_53.x;
    float _1012 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1014 = log2(_1012);
    float _1016 = in.m_53.z;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1020 = _1018 != 0;
    float _1022 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = in.m_53.y;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1028 = _1026 != 0;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1032 = _1030 != 0;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1036 = _1034 != 0;
    float _1038 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1040 = int(_1038);
    float _1042 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1044 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1046 = !_1032;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1052 = !_1028;
    int _1054 = _1052 ? 0 : 1;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1058 = !_1036;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1064 = int(_1062);
    float _1066 = _1010 * 2.0;
    float _1068 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1072 = float(_1040);
    float _1074 = _1016 * 2.0;
    float _1076 = floor(_1066);
    float _1078 = -_1050;
    float _1080 = fma(_1068, 2.0, _1078);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1084 = _1024 * 2.0;
    float _1086 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1088 = -_100;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1080);
    float _1092 = floor(_1074);
    float _1094 = _1010 + _1024;
    float _1096 = fma(_1086, -2.0, _1056);
    float _1098 = _1086;
    if (!_1020)
    {
        _1098 = _1016;
    }
    float _1100 = _1098;
    float _1102 = _1094 + (-1.0);
    float _1104 = _1100;
    float _1106 = _1102;
    if (_1020)
    {
        _1104 = _1024;
    }
    float _1108 = _1104;
    float _1110 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1096);
    bool _1112 = _1076 > 0.0;
    float _1114 = floor(_1084);
    bool _1116 = _1076 >= 0.0;
    bool _1118 = isnan(_1076);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1128 = _1108;
    if (!_1020)
    {
        _1106 = _1024;
    }
    float _1130 = _1106;
    bool _1132 = _1092 >= 0.0;
    bool _1134 = isnan(_1092);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.0);
    bool _1140 = _1136 || _1138;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1144 = _1130;
    if (_1020)
    {
        _1144 = _1010;
    }
    float _1146 = _1144;
    float _1148 = 1.0 / _1072;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1156 = _1154 != 0;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1160 = _1158 != 0;
    int _1162 = _1140 ? 0 : 1;
    float _1164 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1166 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1142);
    bool _1168 = !_1152;
    int _1170 = _1168 ? 0 : 1;
    bool _1172 = _1092 > 0.0;
    float _1174 = -_1070;
    float _1176 = fma(_1164, 2.0, _1174);
    int _1178 = ~_1162;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1124 ? 0 : 1;
    float _1186 = -_100;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1176);
    bool _1190 = _1114 > 0.0;
    float _1192 = _1148 * _100;
    bool _1194 = _1114 >= 0.0;
    bool _1196 = isnan(_1114);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1206 = abs(_1170);
    int _1208 = _1182;
    if (!_1172)
    {
        int _1210 = ~_1162;
        int _1212 = _1210 + 1;
        _1208 = _1212;
    }
    int _1214 = _1208;
    float _1216 = _1014 * _100;
    int _1218 = _1202 ? 0 : 1;
    float _1220 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1204);
    if (!_1020)
    {
        _1128 = _1016;
    }
    float _1222 = _1128;
    float _1224 = _1222;
    if (_1020)
    {
        _1224 = _1024;
    }
    float _1226 = _1224;
    float _1228 = exp2(_1216);
    int _1230 = ~_1218;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1240 = float(_1214);
    float _1242 = fma(_1236, -2.0, _1082);
    int _1244 = _1234;
    if (!_1190)
    {
        int _1246 = ~_1218;
        int _1248 = _1246 + 1;
        _1244 = _1248;
    }
    int _1250 = _1244;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1254 = float(_1206);
    float _1256 = in.m_59.x;
    float _1258 = in.m_59.y;
    float _1260 = in.m_59.z;
    int _1262 = ~_1184;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    float _1268 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1252);
    float _1270 = _1254 * _1240;
    float _1272 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1238);
    bool _1274 = !_1156;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = -_1228;
    float _1280 = _1278 + 1.0;
    int _1282 = _1266;
    if (!_1112)
    {
        int _1284 = ~_1184;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1272);
    bool _1292 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1294 = isnan(0.0);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1300 = _1296 || _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1304 = 1.0 + _1302;
    int _1306 = abs(_1276);
    float _1308 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1268);
    float _1310 = _1300 ? _1280 : 0.0;
    float _1312 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1166);
    float _1314 = 1.0 / _1304;
    float _1316 = float(_1288);
    float _1318 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1242);
    float _1320 = float(_1306);
    float _1322 = _1270 * (-2.0);
    bool _1324 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1326 = isnan(1.0);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1064);
    float _1336 = _1320 * _1316;
    float _1338 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1220);
    bool _1340 = !_1160;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = fma(_1322, _1256, _1256);
    float _1346 = _1010 + (-0.5);
    float _1348 = fma(_1126, _1322, _1126);
    int _1350 = abs(_1342);
    float _1352 = _1024 + _1016;
    float _1354 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1344);
    float _1356 = float(_1250);
    float _1358 = _1336 * (-2.0);
    float _1360 = _1352 + (-1.0);
    float _1362 = _1334 * _100;
    float _1364 = float(_1350);
    if (_1332)
    {
        float _1366 = _1310 * _1314;
        _110 = _1366;
    }
    float _1368 = _110;
    float _1370 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1372 = _1364 * _1356;
    float _1374 = _1024 + (-0.5);
    float _1376 = fma(_1358, _1258, _1258);
    float _1378 = fma(_1370, _1358, _1370);
    float _1380 = _1010 + _1016;
    float _1382 = _1372 * (-2.0);
    float _1384 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1376);
    float _1386 = fma(_1348, _1368, _1354);
    float _1388 = in.m_61.x;
    float _1390 = in.m_61.y;
    float _1392 = in.m_61.z;
    float _1394 = _1380 + (-1.0);
    float _1396 = fma(_1378, _1368, _1384);
    float _1398 = _1386 * 0.15915493667125701904296875;
    float _1400 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1402 = fma(_1382, _1260, _1260);
    float _1404 = _1016 + (-0.5);
    float _1406 = _1396 * 0.15915493667125701904296875;
    float _1408 = fma(_1400, _1382, _1400);
    float _1410 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1402);
    float _1412 = _1398 * 6.283185482025146484375;
    float _1414 = sin(_1412);
    float _1416 = fma(_1408, _1368, _1410);
    float _1418 = _1416 * 0.15915493667125701904296875;
    float _1420 = _1398 * 6.283185482025146484375;
    float _1422 = cos(_1420);
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1388);
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1390);
    float _1428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1392);
    float _1430 = _1406 * 6.283185482025146484375;
    float _1432 = sin(_1430);
    float _1434 = _1022 * _1426;
    float _1436 = _1042 * _1424;
    float _1438 = _1044 * _1428;
    float _1440 = _1406 * 6.283185482025146484375;
    float _1442 = cos(_1440);
    float _1444 = _1418 * 6.283185482025146484375;
    float _1446 = cos(_1444);
    float _1448 = in.m_42.x;
    float _1450 = in.m_42.y;
    float _1452 = in.m_42.z;
    float _1454 = _1414 * _1432;
    float _1456 = _1422 * _1432;
    float _1458 = _1418 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = _1422 * _1442;
    float _1464 = _1442 * _1446;
    float _1466 = _1446 * _1434;
    float _1468 = _1414 * _1442;
    float _1470 = _1432 * _1446;
    float _1472 = _1422 * _1466;
    float _1474 = _1414 * _1466;
    float _1476 = fma(_1460, _1462, _1454);
    float _1478 = -_1456;
    float _1480 = fma(_1460, _1468, _1478);
    float _1482 = -_1434;
    float _1484 = _1460 * _1482;
    float _1486 = -_1468;
    float _1488 = fma(_1460, _1456, _1486);
    float _1490 = fma(_1476, _1436, _1472);
    float _1492 = fma(_1460, _1454, _1462);
    float _1494 = fma(_1464, _1436, _1484);
    float _1496 = fma(_1480, _1436, _1474);
    float _1498 = fma(_1488, _1438, _1490);
    float _1500 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1502 = fma(_1470, _1438, _1494);
    float _1504 = fma(_1492, _1438, _1496);
    float _1506 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1508 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1510 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1500);
    float _1512 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1514 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1506);
    float _1516 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1508);
    float _1518 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1510);
    float _1520 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1512);
    float _1522 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1514);
    float _1524 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1516);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1528 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1520);
    float _1530 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1534 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1536 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1538 = _1526 + _1530;
    float _1540 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1542 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1534);
    float _1544 = _1532 + _1536;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1548 = _1538 + _1546;
    float _1550 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1540);
    float _1552 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1542);
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1556 = _1544 + _1554;
    float _1558 = _1548 * _1548;
    float _1560 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1550);
    float _1562 = _1552 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1564 = fma(_1556, _1556, _1558);
    float _1566 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1568 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1570 = sqrt(_1564);
    float _1572 = _1562 + _1566;
    float _1574 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1568);
    float _1576 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1574);
    bool _1578 = _1570 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = _1574;
    float _1582 = _1448;
    float _1584 = _1452;
    float _1586 = _1436;
    if (!_1578)
    {
        _1580 = _1544;
    }
    float _1588 = _1580;
    float _1590 = _1588;
    if (!_1578)
    {
        _1582 = _1538;
    }
    float _1592 = _1582;
    float _1594 = _1592;
    if (!_1578)
    {
        _1584 = _1572;
    }
    float _1596 = _1584;
    bool _1598 = !_1578;
    float _1600 = _1596;
    if (!_1598)
    {
        float _1602 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1606 = _1570 + _1604;
        float _1608 = _1572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1610 = rsqrt(_1564);
        float _1612 = _1606 * _1602;
        float _1614 = _1612 * 0.15915493667125701904296875;
        float _1616 = _1614 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = _1614 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = _1618 + (-1.0);
        float _1626 = fma(_1622, _1608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1628 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = _1610 * _1626;
        float _1632 = fma(_1572, _1618, _1628);
        float _1634 = fma(_1556, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1636 = fma(_1548, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1600 = _1632;
        _1590 = _1634;
        _1594 = _1636;
    }
    float _1638 = _1600;
    float _1640 = _1590;
    float _1642 = _1594;
    float _1644 = -_1562;
    float _1646 = _1644 + _1638;
    float _1648 = -_1532;
    float _1650 = _1648 + _1640;
    float _1652 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1654 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1656 = _1646 * _1646;
    float _1658 = -_1526;
    float _1660 = _1658 + _1642;
    float _1662 = 1.0 / _1652;
    float _1664 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1654);
    float _1666 = fma(_1650, _1650, _1656);
    bool _1668 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1670 = isnan(0.5);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1676 = _1672 || _1674;
    float _1678 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1664);
    float _1680 = fma(_1660, _1660, _1666);
    float _1682 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1684 = sqrt(_1680);
    float _1686 = _1682 + _1652;
    float _1688 = _1652;
    float _1690 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1692 = _1640;
    float _1694 = _1642;
    float _1696 = _1660;
    if (_1676)
    {
        _1688 = 1.0;
    }
    float _1698 = _1688;
    float _1700 = _1686 * _1662;
    float _1702 = _1700 * 0.5;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1706 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1704);
    float _1708 = 1.0 / _1706;
    bool _1710 = _1684 > 0.0;
    float _1712 = _1684;
    float _1714 = _1698;
    if (!_1710)
    {
        _1712 = _1638;
    }
    float _1716 = _1712;
    bool _1718 = !_1710;
    float _1720 = _1716;
    if (!_1718)
    {
        float _1722 = _172 * _172;
        float _1724 = fma(_170, _170, _1722);
        float _1726 = fma(_174, _174, _1724);
        float _1728 = rsqrt(_1680);
        float _1730 = sqrt(_1726);
        float _1732 = _1650 * _1728;
        float _1734 = _1646 * _1728;
        float _1736 = _1660 * _1728;
        bool _1738 = _1730 > 0.0;
        float _1740 = _1728;
        _1690 = _1730;
        if (!_1738)
        {
            _1740 = _1638;
        }
        float _1742 = _1740;
        bool _1744 = !_1738;
        _1720 = _1742;
        if (!_1744)
        {
            float _1746 = rsqrt(_1726);
            float _1748 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1750 = _172 * _1746;
            float _1752 = _170 * _1746;
            float _1754 = _174 * _1746;
            float _1756 = _1734 * _1750;
            float _1758 = fma(_1732, _1752, _1756);
            float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1762 = fma(_1736, _1754, _1758);
            float _1764 = _1762 * _1760;
            float _1766 = fma(_170, _1764, _1640);
            float _1768 = fma(_172, _1764, _1638);
            float _1770 = fma(_174, _1764, _1642);
            _1690 = _1752;
            _1720 = _1768;
            _1692 = _1766;
            _1694 = _1770;
            _1696 = _1764;
        }
    }
    float _1772 = _1690;
    float _1774 = _1720;
    float _1776 = _1692;
    float _1778 = _1694;
    float _1780 = _1696;
    float _1782 = _1780;
    float _1784 = _1772;
    if (_1676)
    {
        _1782 = 1.0;
    }
    float _1786 = _1782;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1790 = _1708 * _1788;
    float _1792 = _1786;
    if (!_1676)
    {
        float _1794 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1796 = _1794 * 0.15915493667125701904296875;
        float _1798 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1800 = _1796 * 6.283185482025146484375;
        float _1802 = cos(_1800);
        float _1804 = _1798 * 0.15915493667125701904296875;
        float _1806 = _1796 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = 1.0 / _1802;
        float _1812 = _1804 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1808 * _1810;
        float _1818 = _1804 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = _1814 * _1816;
        float _1824 = 1.0 / _1822;
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1826;
        float _1830 = 1.0 / _1828;
        float _1832 = _1820 * _1824;
        float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1836 = fma(_1790, _1832, _1834);
        float _1838 = _1836 * _1830;
        float _1840 = precise::clamp(_1838, 0.0, 1.0);
        _1784 = _1810;
        _1714 = _1840;
    }
    float _1842 = _1784;
    float _1844 = _1714;
    float _1846 = _1842;
    if (!_1676)
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
        float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1882 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1880;
        float _1884 = 1.0 / _1882;
        float _1886 = _1874 * _1878;
        float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1890 = fma(_1790, _1886, _1888);
        float _1892 = _1890 * _1884;
        float _1894 = precise::clamp(_1892, 0.0, 1.0);
        float _1896 = -_1894;
        float _1898 = _1896 + 1.0;
        _1846 = _1878;
        _1792 = _1898;
    }
    float _1900 = _1846;
    float _1902 = _1792;
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1906 = _1774 + _1904;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1910 = _1776 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1914 = _1778 + _1912;
    float _1916 = _1906 * _1906;
    float _1918 = fma(_1910, _1910, _1916);
    float _1920 = fma(_1914, _1914, _1918);
    float _1922 = rsqrt(_1920);
    float _1924 = sqrt(_1920);
    float _1926 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1928 = _1910 * _1926;
    float _1930 = _1914 * _1926;
    float _1932 = _1928 * _1928;
    float _1934 = _1930 * _1930;
    float _1936 = _1932 + _1934;
    float _1938 = sqrt(_1936);
    bool _1940 = _1938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1944 = _1938 + _1942;
    float _1946 = _1922;
    float _1948 = _1936;
    float _1950 = _1944;
    float _1952 = _1900;
    float _1954 = _1906;
    float _1956 = _1926;
    if (_1940)
    {
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1946 = _1958;
    }
    float _1960 = _1946;
    if (_1940)
    {
        float _1962 = rsqrt(_1936);
        _1948 = _1962;
    }
    float _1964 = _1948;
    float _1966 = _1964;
    if (_1940)
    {
        float _1968 = _1944 * _1960;
        _1950 = _1968;
    }
    float _1970 = _1950;
    if (_1940)
    {
        float _1972 = _1970 * 0.15915493667125701904296875;
        _1952 = _1972;
    }
    float _1974 = _1952;
    float _1976 = _1960;
    if (_1940)
    {
        float _1978 = _1974 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        _1976 = _1980;
    }
    float _1982 = _1976;
    float _1984 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1986 = precise::max(0.0, _1984);
    float _1988 = _1914;
    float _1990 = _1986;
    if (_1940)
    {
        float _1992 = _1974 * 6.283185482025146484375;
        float _1994 = cos(_1992);
        _1988 = _1994;
    }
    float _1996 = _1988;
    float _1998 = -_1926;
    float _2000 = -_1986;
    float _2002 = fma(_1906, _1998, _2000);
    if (_1940)
    {
        float _2004 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1990 = _2004;
    }
    float _2006 = _1990;
    float _2008 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2010 = _2006;
    float _2012 = _1982;
    if (_1940)
    {
        float _2014 = fma(_1982, _2006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _2016;
    if (!_1940)
    {
        _2012 = _1928;
    }
    float _2020 = _2012;
    float _2022 = _2020;
    float _2024 = _1996;
    if (_1940)
    {
        float _2026 = _1996 + (-1.0);
        _1954 = _2026;
    }
    float _2028 = _1954;
    float _2030 = _2028;
    if (_1940)
    {
        float _2032 = _1964 * _2016;
        _1586 = _2032;
    }
    float _2034 = _1586;
    if (!_1940)
    {
        _2018 = _2002;
    }
    float _2036 = _2018;
    float _2038 = _2036;
    if (_1940)
    {
        float _2040 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1956 = _2040;
    }
    float _2042 = _1956;
    if (_1940)
    {
        float _2044 = _1928 * _2034;
        _2022 = _2044;
    }
    float _2046 = _2022;
    if (!_1940)
    {
        _2030 = _1930;
    }
    float _2048 = _2030;
    float _2050 = _2048;
    if (_1940)
    {
        float _2052 = _1930 * _2034;
        _2050 = _2052;
    }
    float _2054 = _2050;
    if (!_1940)
    {
        _1966 = _1932;
    }
    float _2056 = _1966;
    float _2058 = _2056;
    if (_1940)
    {
        float _2060 = fma(_2002, _1996, _2042);
        _2038 = _2060;
    }
    float _2062 = _2038;
    if (_1940)
    {
        float _2064 = _2046 * _2046;
        _2058 = _2064;
    }
    float _2066 = _2058;
    if (!_1940)
    {
        _2024 = _1934;
    }
    float _2068 = _2024;
    float _2070 = _2068;
    if (_1940)
    {
        float _2072 = _2054 * _2054;
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = fma(_2062, _2062, _2066);
    float _2078 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2080 = _2076 + _2074;
    float _2082 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2008);
    float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2086 = fma(_1924, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2084);
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    float _2090 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2092 = rsqrt(_2080);
    float _2094 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2082);
    float _2096 = -_2088;
    float _2098 = _2096 + 1.0;
    float _2100 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2102 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2090);
    float _2104 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2106 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2108 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2100);
    float _2110 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2102);
    float _2112 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2114 = abs(_2098);
    float _2116 = log2(_2114);
    float _2118 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2108);
    float _2120 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2106);
    float _2122 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2124 = -_2112;
    float _2126 = fma(_2124, _2078, 1.0);
    float _2128 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2130 = _2092 * _2046;
    float _2132 = _2092 * _2062;
    float _2134 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2136 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2120);
    float _2138 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2140 = _2092 * _2054;
    float _2142 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2134);
    float _2144 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2146 = -_2138;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2146);
    float _2150 = log2(_2126);
    float _2152 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2142);
    float _2154 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = -_2140;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2148);
    float _2160 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2162 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2152);
    float _2164 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2166 = fma(_2158, -0.5, 0.5);
    float _2168 = exp2(_2154);
    float _2170 = fma(_2158, 0.5, 0.5);
    float _2172 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2160);
    float _2174 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2164);
    float _2176 = _2132 + 1.0;
    float _2178 = fma(_2170, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2180 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2172);
    float _2182 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2174);
    float _2184 = 1.0 / _2162;
    float _2186 = fma(_2170, _2178, -0.212114393711090087890625);
    float _2188 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2180);
    float _2190 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2182);
    float _2192 = _2150 * 0.693147182464599609375;
    float _2194 = fma(_2170, _2186, 1.570728778839111328125);
    float _2196 = sqrt(_2166);
    float _2198 = -_2132;
    float _2200 = fma(_2168, _2176, _2198);
    float _2202 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2204 = fma(_2200, 0.5, 0.5);
    float _2206 = _2188 * _2184;
    float _2208 = _2190 * _2184;
    float _2210 = fma(_2206, 0.5, 0.5);
    float _2212 = fma(_2208, -0.5, 0.5);
    float _2214 = _2196 * 0.636619746685028076171875;
    float _2216 = -_2194;
    float _2218 = fma(_2214, _2216, 1.0);
    float3 _6487 = float3(_2210, _2212, _2202);
    float _2220 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6487, float3(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6487, float3(0.0), isnan(_6487)), level(0.0)).x;
    float3 _6498 = float3(_2210, _2212, _2202);
    float4 _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6498, float3(0.0), isnan(_6498)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6498, float3(0.0), isnan(_6498)), level(0.0)).xyzw;
    float _2225 = _2223.x;
    float _2227 = _2223.y;
    float _2229 = _2223.z;
    float _2231 = _2223.w;
    float2 _6515 = float2(_2218, _2204);
    float3 _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6515, float2(0.0), isnan(_6515)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6515, float2(0.0), isnan(_6515)), level(0.0)).xyz;
    float _2237 = _2235.x;
    float _2239 = _2235.y;
    float _2241 = _2235.z;
    float _2243 = float(uint(_1064));
    float _2245 = trunc(_1192);
    int _2247 = int(_2245);
    int _2249 = ~_1064;
    int _2251 = _2249 + 1;
    float _2253 = _1362 * _152;
    int _2255 = ~_1064;
    int _2257 = _2255 + 1;
    float _2259 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2261 = abs(_1054);
    float _2263 = _986 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2265 = abs(_1060);
    float _2267 = 1.0 / _2243;
    int _2269 = _1064 + (-1);
    float _2271 = _984 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2273 = float(uint(_2247));
    float _2275 = trunc(_2253);
    int _2277 = int(_2275);
    int _2279 = as_type<int>(_2267) + (-2);
    float _2281 = exp2(_2259);
    float _2283 = as_type<float>(_2279) * _2273;
    float _2285 = trunc(_2283);
    float _2287 = precise::max(_2285, 0.0);
    uint _2290 = uint(_2287);
    float _2292 = -_2281;
    float _2294 = _2292 + 1.0;
    float _2296 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2298 = _2251 * int(_2290);
    int _2300 = _2298 + _2247;
    float _2302 = float(uint(_2300));
    float _2304 = as_type<float>(_2279) * _2302;
    bool _2306 = !_1020;
    float _2308 = _2306 ? 7.345489978790283203125 : 1.0;
    float _2310 = trunc(_2304);
    float _2312 = precise::max(_2310, 0.0);
    uint _2314 = uint(_2312);
    float _2316 = _2308 * _1010;
    float _2318 = float(_2247);
    bool _2320 = _2318 >= _1334;
    bool _2322 = isnan(_2318);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan(_1334);
    bool _2328 = _2324 || _2326;
    float _2330 = float(_2328);
    float _2332 = floor(_2316);
    int _2334 = int(_2290) + int(_2314);
    float _2336 = trunc(_2330);
    int _2338 = int(_2336);
    int _2340 = _2257 * _2334;
    int _2342 = _2340 + _2247;
    float _2344 = -_2332;
    float _2346 = _2316 + _2344;
    bool _2348 = uint(_2342) >= uint(_1064);
    bool _2350 = !_2348;
    int _2352 = _2350 ? 0 : (-1);
    bool _2354 = _1064 == 0;
    int _2356 = ~_2334;
    int _2358 = _2356 + _2352;
    int _2360 = _2358 + 1;
    float _2362 = _2346 * _1334;
    int _2364 = ~_2338;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    int _2370 = _1064 * _2360;
    int _2372 = _2370 + _2247;
    float _2374 = trunc(_2362);
    int _2376 = int(_2374);
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2380 = _2378 != 0;
    int _2382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2384 = _2382 != 0;
    bool _2386 = !_2354;
    int _2388 = _2386 ? _2372 : (-1);
    bool _2390 = !_2380;
    int _2392 = _2390 ? 0 : 1;
    int _2394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2396 = _2394 != 0;
    int _2398 = _2388 * _2368;
    int _2400 = abs(_1048);
    int _2402 = abs(_2392);
    int _2404 = _2338 * _2269;
    int _2406 = _2404 + _2398;
    bool _2408 = !_2396;
    int _2410 = _2408 ? 0 : 1;
    int _2412 = _2406 * _2400;
    int _2414 = abs(_2410);
    int _2416 = _2376 * _2402;
    int _2418 = _2416 + _2247;
    int _2420 = _2277 * _2261;
    int _2422 = _2420 + _2412;
    float _2424 = in.m_53.w;
    int _2426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2428 = _2426 != 0;
    int _2430 = _2418 * _2265;
    int _2432 = _2430 + _2422;
    float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2436 = _2434 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2440 = _2438 != 0;
    int _2442 = _2376 * _2414;
    int _2444 = _2442 + _2432;
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2448 = _2446 != 0;
    float _2450 = in.m_63.y;
    float _2452 = 1.0 / _2436;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2456 = _2454 != 0;
    float _2458 = float(uint(_2444));
    float _2460 = as_type<float>(_2279) * _2458;
    int _2462 = ~_1064;
    int _2464 = _2462 + 1;
    float _2466 = trunc(_2460);
    float _2468 = precise::max(_2466, 0.0);
    uint _2470 = uint(_2468);
    bool _2472 = _2424 > 0.5;
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2478 = 1.0 / _2476;
    int _2480 = _2464 * int(_2470);
    int _2482 = _2480 + _2444;
    float _2484 = float(uint(_2482));
    float _2486 = as_type<float>(_2279) * _2484;
    float _2488 = trunc(_2486);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2494 = -_2450;
    float _2496 = _2494 + 1.0;
    int _2498 = _2472 ? as_type<int>(_2496) : as_type<int>(_2450);
    float _2500 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2502 = _2500 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2504 = _1024 > 0.5;
    int _2506 = ~_1064;
    int _2508 = _2506 + 1;
    float _2510 = 1.0 / _2502;
    int _2512 = int(_2470) + int(_2492);
    float _2514 = _2428 ? as_type<float>(_2498) : _2450;
    float _2516 = _2450;
    bool _2518 = _2384;
    bool _2520 = _2428;
    if (_2384)
    {
        float _2522 = _2504 ? _2496 : _2450;
        _2516 = _2522;
    }
    float _2524 = _2516;
    int _2526 = _2508 * _2512;
    int _2528 = _2526 + _2444;
    float _2530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2440)
    {
        bool _2532 = _1016 > 0.5;
        _2518 = _2532;
    }
    bool _2534 = _2518;
    bool _2536 = uint(_2528) >= uint(_1064);
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2538;
    if (_2448)
    {
        bool _2542 = _1010 > 0.5;
        _2520 = _2542;
    }
    bool _2544 = _2520;
    float _2546 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2548 = _2546 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2550 = !_2536;
    int _2552 = _2550 ? 0 : (-1);
    float _2554 = _2540 * _2452;
    float _2556 = _2548 * _2478;
    int _2558 = ~_2512;
    int _2560 = _2558 + _2552;
    int _2562 = _2560 + 1;
    float _2564 = in.m_63.x;
    float _2566 = float(uint(_2418));
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2568;
    bool _2572 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2574 = isnan(_1008);
    bool _2576 = _2572 || _2574;
    bool _2578 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2580 = _2576 || _2578;
    float _2582 = float(_2580);
    int _2584 = _1064 * _2562;
    int _2586 = _2584 + _2444;
    int _2588 = ~_1064;
    int _2590 = _2588 + 1;
    float _2592 = _2570 * _2510;
    float _2594 = as_type<float>(_2279) * _2566;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2598 = _1008 + _2596;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2602 = _1008 + _2600;
    bool _2604 = !_2354;
    int _2606 = _2604 ? _2586 : (-1);
    float _2608 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2610 = fma(_2554, _2598, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2614 = _1008 + _2612;
    float _2616 = trunc(_2594);
    float _2618 = precise::max(_2616, 0.0);
    uint _2620 = uint(_2618);
    float _2622 = fma(_2556, _2602, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2624 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2626 = isnan(_1008);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    float _2636 = fma(_2592, _2614, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2638 = _2606 >> 31;
    float _2640 = fma(_2514, _2608, -0.5);
    bool _2642 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2644 = isnan(_1008);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2650 = _2646 || _2648;
    float _2652 = float(_2650);
    float _2654 = -_2634;
    float _2656 = _2654 + 1.0;
    int _2658 = _2638 & 3;
    float _2660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2662 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2664 = isnan(_1008);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = _2652 * _2656;
    int _2676 = _2606 + _2658;
    float _2678 = -_2652;
    float _2680 = _2678 + 1.0;
    float _2682 = _2656;
    int _2684 = as_type<int>(_2610);
    float _2686 = _2564;
    if (!_2448)
    {
        _2682 = _2564;
    }
    float _2688 = _2682;
    int _2690 = 0;
    float _2692 = _2688;
    if (_2440)
    {
        float _2694 = -_2564;
        float _2696 = _2694 + 1.0;
        _2690 = as_type<int>(_2696);
    }
    int _2698 = _2690;
    int _2700 = _2676 >> 2;
    float _2702 = _2672 * _2680;
    float _2704 = -_2672;
    float _2706 = _2704 + 1.0;
    int _2708 = _2590 * int(_2620);
    int _2710 = _2708 + _2418;
    int _2712 = _2700 << 4;
    int _2714 = _2712 + 368;
    float _2716 = -_1318;
    float _2718 = fma(_1338, _2640, _2716);
    float _2720 = _2582 * _2706;
    float _2722 = -_2582;
    float _2724 = _2722 + 1.0;
    float _2726 = float(uint(_2710));
    float _2728 = _2660 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2730 = uint(int(uint(_2714) >> uint(2)));
    uint _2732 = uint(int(uint(int(_2730)) >> uint(2)));
    int _2734 = int(_2730) & 3;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[int(_2732)][_2734];
    int _2738 = int(_2730) + 1;
    uint _2740 = uint(int(uint(_2738) >> uint(2)));
    int _2742 = _2738 & 3;
    float _2744 = (*spvDescriptorSet0.vp_c9)._m0[int(_2740)][_2742];
    float _2746 = _2610 * _2720;
    if (_2448)
    {
        float _2748 = -_2564;
        float _2750 = _2748 + 1.0;
        _2684 = as_type<int>(_2750);
    }
    int _2752 = _2684;
    float _2754 = as_type<float>(_2279) * _2726;
    float _2756 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2524, -0.5);
    float _2758 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2746);
    if (_2448)
    {
        float _2760 = _2544 ? as_type<float>(_2752) : _2564;
        _2692 = _2760;
    }
    float _2762 = _2692;
    float _2764 = -_1110;
    float _2766 = fma(_1308, _2756, _2764);
    float _2768 = trunc(_2754);
    float _2770 = precise::max(_2768, 0.0);
    uint _2772 = uint(_2770);
    int _2774 = _2606 & 3;
    bool _2776 = _2774 != 0;
    int _2778 = _2714 + 8;
    uint _2780 = uint(int(uint(_2778) >> uint(2)));
    uint _2782 = uint(int(uint(int(_2780)) >> uint(2)));
    int _2784 = int(_2780) & 3;
    float _2786 = (*spvDescriptorSet0.vp_c9)._m0[int(_2782)][_2784];
    int _2788 = int(_2780) + 1;
    uint _2790 = uint(int(uint(_2788) >> uint(2)));
    int _2792 = _2788 & 3;
    float _2794 = (*spvDescriptorSet0.vp_c9)._m0[int(_2790)][_2792];
    if (_2440)
    {
        float _2796 = _2534 ? as_type<float>(_2698) : _2564;
        _2686 = _2796;
    }
    float _2798 = _2686;
    float _2800 = fma(_2622, _2702, _2758);
    bool _2802 = uint(_2774) > 1u;
    int _2804 = _2606 & 3;
    bool _2806 = _2804 != 0;
    float _2808 = fma(_2636, _2674, _2800);
    float _2810 = fma(_2728, _2798, -0.5);
    int _2812 = ~_1064;
    int _2814 = _2812 + 1;
    int _2816 = _2806 ? 0 : 1;
    float _2818 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2820 = fma(_1312, _2810, _1188);
    int _2822 = int(_2620) + int(_2772);
    int _2824 = ~_2816;
    int _2826 = _2824 + 1;
    int _2828 = _2826 + 1;
    float _2830 = fma(_1290, _2818, _1090);
    int _2832 = _2828;
    if (!_2802)
    {
        int _2834 = ~_2816;
        int _2836 = _2834 + 1;
        _2832 = _2836;
    }
    int _2838 = _2832;
    int _2840 = _2814 * _2822;
    int _2842 = _2840 + _2418;
    bool _2844 = _2774 != 3;
    int _2846 = abs(_2838);
    float _2848 = _2296 * _2220;
    bool _2850 = uint(_2842) >= uint(_1064);
    float _2852 = fma(_2634, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2808);
    bool _2854 = uint(_2774) >= 2u;
    bool _2856 = !_2850;
    int _2858 = _2856 ? 0 : (-1);
    int _2860 = ~_2846;
    int _2862 = _2860 + 1;
    int _2864 = _2862 + 1;
    int _2866 = _2854 ? 0 : 1;
    int _2868 = ~_2822;
    int _2870 = _2868 + _2858;
    int _2872 = _2870 + 1;
    int _2874 = _2864 * as_type<int>(_2744);
    bool _2876 = !_2776;
    int _2878 = _2876 ? 0 : 1;
    int _2880 = ~_2866;
    int _2882 = _2880 + 1;
    int _2884 = _2882 + 1;
    int _2886 = _1064 * _2872;
    int _2888 = _2886 + _2418;
    bool _2890 = _2774 != 3;
    float _2892 = _2718 + 0.5;
    int _2894 = _2884;
    if (_2844)
    {
        int _2896 = ~_2866;
        int _2898 = _2896 + 1;
        _2894 = _2898;
    }
    int _2900 = _2894;
    float _2902 = _2766 + 0.5;
    int _2904 = abs(_2878);
    float _2906 = _2830 + 0.5;
    bool _2908 = !_2890;
    int _2910 = _2908 ? 0 : (-1);
    int _2912 = abs(_2900);
    int _2914 = ~_2904;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    int _2920 = abs(_2910);
    float _2922 = _2820 + 0.5;
    int _2924 = ~_2912;
    int _2926 = _2924 + 1;
    int _2928 = _2926 + 1;
    int _2930 = _2918 * as_type<int>(_2736);
    int _2932 = _2930 + _2874;
    bool _2934 = !_2456;
    int _2936 = _2934 ? 0 : 1;
    float _2938 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2940 = ~_2920;
    int _2942 = _2940 + 1;
    int _2944 = _2942 + 1;
    int _2946 = _2928 * as_type<int>(_2786);
    int _2948 = _2946 + _2932;
    int _2950 = abs(_2936);
    out.m_67.x = _2906;
    out.m_67.y = _2902;
    out.m_67.z = _2922;
    out.m_67.w = _2892;
    float _2952 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2938);
    int _2954 = _2944 * as_type<int>(_2794);
    int _2956 = _2954 + _2948;
    float _2958 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2952);
    float _2960 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2958);
    float _2962 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2964 = ~_2950;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2972 = _2271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2974 = !_2354;
    int _2976 = _2974 ? _2888 : (-1);
    float _2978 = _1844 * _1902;
    int _2980 = _2956 * _2968;
    float _2982 = _2962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2984 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2986 = _2978 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2988 = _2976 * _2950;
    int _2990 = _2988 + _2980;
    float _2992 = _2960 + _2162;
    bool _2994 = _1844 > 0.0;
    bool _2996 = isnan(_1844);
    bool _2998 = _2994 || _2996;
    bool _3000 = isnan(0.0);
    bool _3002 = _2998 || _3000;
    float _3004 = _2986 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2972;
    out.m_69.y = _2970;
    out.m_69.z = _2982;
    out.m_69.w = _2984;
    float _3006 = _2992 * 0.5;
    bool _3008 = _1902 <= 0.0;
    bool _3010 = !_3002;
    bool _3012 = _3008 || _3010;
    float _3014 = float(_2990);
    float _3016 = _2241 * _2848;
    out.m_49.x = _3004;
    out.m_71.x = _3014;
    float _3018 = _2231 * _2848;
    float _3020 = -_2296;
    float _3022 = _3020 + 1.0;
    out.gl_Position.x = _2188;
    out.gl_Position.y = _2190;
    out.gl_Position.z = _2960;
    out.gl_Position.w = _2162;
    float _3024 = fma(_2237, _3018, _2225);
    float _3026 = fma(_2239, _3018, _2227);
    float _3028 = _2231 * _3022;
    float _3030 = fma(_2231, _3016, _2229);
    out.m_73.z = _3006;
    out.m_73.w = _2162;
    out.m_75.x = _3024;
    out.m_75.y = _3026;
    out.m_75.z = _3030;
    out.m_75.w = _3028;
    if (!_3012)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3032 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3032;
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
    bool _740 = false;
    bool _642 = false;
    bool _306 = false;
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
        float _3101 = as_type<float>(_118);
        out.gl_Position.z = _3101;
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
        float _3156 = as_type<float>(_144);
        out.gl_Position.z = _3156;
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
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -_216;
    float _224 = _222 + 1.0;
    bool _226 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_200);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = 1.0 / _220;
    float _246 = _236 * _224;
    float _248 = -_236;
    float _250 = _248 + 1.0;
    float _252 = _204 * _244;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _254;
    float _258 = fma(_240, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = fma(_256, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = _258 * _246;
    float _268 = fma(_262, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _270 = _264 * _246;
    float _272 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].x, _266);
    float _274 = _268 * _246;
    float _276 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].z, _270);
    float _278 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].x, _272);
    float _280 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].y, _274);
    float _282 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].y, _280);
    float _284 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].z, _276);
    bool _286 = !_242;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _156;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_55.x;
    float _312 = in.m_55.y;
    float _314 = in.m_55.z;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _332 = 1.0 / _318;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _334;
    float _338 = 1.0 / _322;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _342 = _308 + _340;
    bool _344 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _346 = isnan(_308);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    bool _356 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _358 = isnan(_308);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _284 * _314;
    float _370 = _282 * _312;
    float _372 = 1.0 / _326;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _376 = _308 + _374;
    float _378 = _342 * _332;
    bool _380 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _382 = isnan(_308);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _394 = _308 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _398 = _308 + _396;
    bool _400 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _402 = isnan(_308);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -_354;
    float _414 = _412 + 1.0;
    float _416 = 1.0 / _330;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _420 = _308 + _418;
    float _422 = _376 * _338;
    bool _424 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _426 = isnan(_308);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -_390;
    float _438 = _436 + 1.0;
    float _440 = -_366;
    float _442 = _440 + 1.0;
    float _444 = _410 * _414;
    float _446 = -_410;
    float _448 = _446 + 1.0;
    float _450 = 1.0 / _336;
    float _452 = _394 * _372;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _454;
    float _458 = _434 * _438;
    float _460 = -_434;
    float _462 = _460 + 1.0;
    float _464 = fma(_456, _378, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _466 = _420 * _416;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _468;
    float _472 = _366 * _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _478 = fma(_470, _378, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _480 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _482 = fma(_476, _422, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _484 = _398 * _450;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _486;
    float _490 = _278 * _310;
    float _492 = fma(_488, _378, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _494 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _496 = isnan(_308);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _354 * _442;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _516 = _504 * _448;
    float _518 = fma(_510, _422, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _520 = fma(_514, _422, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _522;
    float _526 = _478 * _516;
    float _528 = _492 * _516;
    float _530 = _464 * _516;
    float _532 = -_504;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _540;
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].x, _526);
    float _546 = fma(_538, _452, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _552 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].y, _528);
    float _554 = fma(_518, _444, _544);
    float _556 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].z, _530);
    float _558 = fma(_542, _452, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _560 = fma(_550, _466, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _562 = fma(_546, _506, _554);
    float _564 = fma(_524, _452, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _566 = fma(_482, _444, _552);
    float _568 = fma(_520, _444, _556);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _578 = fma(_564, _506, _568);
    float _580 = fma(_572, _466, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _586;
    float _590 = fma(_576, _466, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _592 = fma(_558, _506, _566);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _594;
    float _598 = fma(_584, _484, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _600 = fma(_588, _484, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _602 = fma(_560, _472, _562);
    float _604 = fma(_596, _484, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _606 = fma(_580, _472, _592);
    float _608 = fma(_590, _472, _578);
    float _610 = fma(_598, _458, _602);
    float _612 = fma(_600, _458, _606);
    float _614 = fma(_604, _458, _608);
    float _616 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[112].x, _610);
    float _618 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[112].y, _612);
    float _620 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[112].z, _614);
    bool _622 = !_480;
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
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _648 = _644 + _646;
    bool _650 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _652 = isnan(_644);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _666 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _668 = isnan(_644);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _678;
    float _682 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = -_660;
    float _686 = _684 + 1.0;
    bool _688 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _690 = 1.0 / _664;
    float _692 = _676 * _686;
    float _694 = -_676;
    float _696 = _694 + 1.0;
    float _698 = _680 * _690;
    float _700 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _702 = fma(_698, _648, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _704 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _702 * _692;
    float _708 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[115].x, _706);
    float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[116].x, _710);
    float _716 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _716;
    out.m_57.y = _712;
    out.m_57.z = _704;
    out.m_57.w = _718;
    bool _720 = !_688;
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
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _746 = _742 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _750 = _742 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _754 = _742 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _772 = 1.0 / _758;
    bool _774 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _776 = isnan(_742);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = 1.0 / _770;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _790 = _742 + _788;
    bool _792 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _794 = isnan(_742);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    bool _804 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _806 = 1.0 / _766;
    float _808 = _746 * _772;
    bool _810 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _812 = isnan(_742);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = 1.0 / _762;
    float _824 = _790 * _786;
    bool _826 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _828 = isnan(_742);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_820;
    float _840 = _838 + 1.0;
    float _842 = _836 * _840;
    float _844 = _750 * _806;
    bool _846 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _848 = isnan(_742);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_836;
    float _860 = _858 + 1.0;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _866;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _874 = _856 * _860;
    float _876 = fma(_864, _808, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _878 = _754 * _822;
    float _880 = -_856;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _896 = _784 * _882;
    float _898 = -_784;
    float _900 = _898 + 1.0;
    float _902 = fma(_886, _808, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _904 = fma(_868, _808, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _906 = fma(_872, _878, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _908 = _802 * _900;
    float _910 = fma(_890, _878, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _912 = fma(_894, _878, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _914 = -_802;
    float _916 = _914 + 1.0;
    float _918 = _876 * _908;
    float _920 = _902 * _908;
    float _922 = _904 * _908;
    float _924 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].x, _918);
    float _926 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].y, _920);
    float _928 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].z, _922);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _938;
    float _942 = fma(_906, _896, _924);
    float _944 = fma(_912, _896, _928);
    float _946 = fma(_932, _844, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _948 = fma(_936, _844, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _950 = fma(_910, _896, _926);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _960 = fma(_940, _844, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _966 = fma(_946, _874, _942);
    float _968 = fma(_954, _824, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _970 = fma(_958, _824, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _972 = fma(_948, _874, _950);
    float _974 = fma(_964, _824, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _976 = fma(_960, _874, _944);
    float _978 = fma(_968, _842, _966);
    float _980 = fma(_970, _842, _972);
    float _982 = fma(_974, _842, _976);
    float _984 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[127].x, _978);
    float _986 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[127].y, _980);
    float _988 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[127].z, _982);
    bool _990 = !_804;
    if (!_990)
    {
        float _992 = in.m_53.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _178 = _1006;
    }
    float _1008 = _178;
    float _1010 = in.m_53.x;
    float _1012 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1014 = log2(_1012);
    float _1016 = in.m_53.z;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1020 = _1018 != 0;
    float _1022 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = in.m_53.y;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1028 = _1026 != 0;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1032 = _1030 != 0;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1036 = _1034 != 0;
    float _1038 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1040 = int(_1038);
    float _1042 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1044 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1046 = !_1032;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1052 = !_1028;
    int _1054 = _1052 ? 0 : 1;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1058 = !_1036;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1064 = int(_1062);
    float _1066 = _1010 * 2.0;
    float _1068 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1072 = float(_1040);
    float _1074 = _1016 * 2.0;
    float _1076 = floor(_1066);
    float _1078 = -_1050;
    float _1080 = fma(_1068, 2.0, _1078);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1084 = _1024 * 2.0;
    float _1086 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1088 = -_100;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1080);
    float _1092 = floor(_1074);
    float _1094 = _1010 + _1024;
    float _1096 = fma(_1086, -2.0, _1056);
    float _1098 = _1086;
    if (!_1020)
    {
        _1098 = _1016;
    }
    float _1100 = _1098;
    float _1102 = _1094 + (-1.0);
    float _1104 = _1100;
    float _1106 = _1102;
    if (_1020)
    {
        _1104 = _1024;
    }
    float _1108 = _1104;
    float _1110 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1096);
    bool _1112 = _1076 > 0.0;
    float _1114 = floor(_1084);
    bool _1116 = _1076 >= 0.0;
    bool _1118 = isnan(_1076);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1128 = _1108;
    if (!_1020)
    {
        _1106 = _1024;
    }
    float _1130 = _1106;
    bool _1132 = _1092 >= 0.0;
    bool _1134 = isnan(_1092);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.0);
    bool _1140 = _1136 || _1138;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1144 = _1130;
    if (_1020)
    {
        _1144 = _1010;
    }
    float _1146 = _1144;
    float _1148 = 1.0 / _1072;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1156 = _1154 != 0;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1160 = _1158 != 0;
    int _1162 = _1140 ? 0 : 1;
    float _1164 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1166 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1142);
    bool _1168 = !_1152;
    int _1170 = _1168 ? 0 : 1;
    bool _1172 = _1092 > 0.0;
    float _1174 = -_1070;
    float _1176 = fma(_1164, 2.0, _1174);
    int _1178 = ~_1162;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1124 ? 0 : 1;
    float _1186 = -_100;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1176);
    bool _1190 = _1114 > 0.0;
    float _1192 = _1148 * _100;
    bool _1194 = _1114 >= 0.0;
    bool _1196 = isnan(_1114);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1206 = abs(_1170);
    int _1208 = _1182;
    if (!_1172)
    {
        int _1210 = ~_1162;
        int _1212 = _1210 + 1;
        _1208 = _1212;
    }
    int _1214 = _1208;
    float _1216 = _1014 * _100;
    int _1218 = _1202 ? 0 : 1;
    float _1220 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1204);
    if (!_1020)
    {
        _1128 = _1016;
    }
    float _1222 = _1128;
    float _1224 = _1222;
    if (_1020)
    {
        _1224 = _1024;
    }
    float _1226 = _1224;
    float _1228 = exp2(_1216);
    int _1230 = ~_1218;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1240 = float(_1214);
    float _1242 = fma(_1236, -2.0, _1082);
    int _1244 = _1234;
    if (!_1190)
    {
        int _1246 = ~_1218;
        int _1248 = _1246 + 1;
        _1244 = _1248;
    }
    int _1250 = _1244;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1254 = float(_1206);
    float _1256 = in.m_59.x;
    float _1258 = in.m_59.y;
    float _1260 = in.m_59.z;
    int _1262 = ~_1184;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    float _1268 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1252);
    float _1270 = _1254 * _1240;
    float _1272 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1238);
    bool _1274 = !_1156;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = -_1228;
    float _1280 = _1278 + 1.0;
    int _1282 = _1266;
    if (!_1112)
    {
        int _1284 = ~_1184;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1272);
    bool _1292 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1294 = isnan(0.0);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1300 = _1296 || _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1304 = 1.0 + _1302;
    int _1306 = abs(_1276);
    float _1308 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1268);
    float _1310 = _1300 ? _1280 : 0.0;
    float _1312 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1166);
    float _1314 = 1.0 / _1304;
    float _1316 = float(_1288);
    float _1318 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1242);
    float _1320 = float(_1306);
    float _1322 = _1270 * (-2.0);
    bool _1324 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1326 = isnan(1.0);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1064);
    float _1336 = _1320 * _1316;
    float _1338 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1220);
    bool _1340 = !_1160;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = fma(_1322, _1256, _1256);
    float _1346 = _1010 + (-0.5);
    float _1348 = fma(_1126, _1322, _1126);
    int _1350 = abs(_1342);
    float _1352 = _1024 + _1016;
    float _1354 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1344);
    float _1356 = float(_1250);
    float _1358 = _1336 * (-2.0);
    float _1360 = _1352 + (-1.0);
    float _1362 = _1334 * _100;
    float _1364 = float(_1350);
    if (_1332)
    {
        float _1366 = _1310 * _1314;
        _110 = _1366;
    }
    float _1368 = _110;
    float _1370 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1372 = _1364 * _1356;
    float _1374 = _1024 + (-0.5);
    float _1376 = fma(_1358, _1258, _1258);
    float _1378 = fma(_1370, _1358, _1370);
    float _1380 = _1010 + _1016;
    float _1382 = _1372 * (-2.0);
    float _1384 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1376);
    float _1386 = fma(_1348, _1368, _1354);
    float _1388 = in.m_61.x;
    float _1390 = in.m_61.y;
    float _1392 = in.m_61.z;
    float _1394 = _1380 + (-1.0);
    float _1396 = fma(_1378, _1368, _1384);
    float _1398 = _1386 * 0.15915493667125701904296875;
    float _1400 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1402 = fma(_1382, _1260, _1260);
    float _1404 = _1016 + (-0.5);
    float _1406 = _1396 * 0.15915493667125701904296875;
    float _1408 = fma(_1400, _1382, _1400);
    float _1410 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1402);
    float _1412 = _1398 * 6.283185482025146484375;
    float _1414 = sin(_1412);
    float _1416 = fma(_1408, _1368, _1410);
    float _1418 = _1416 * 0.15915493667125701904296875;
    float _1420 = _1398 * 6.283185482025146484375;
    float _1422 = cos(_1420);
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1388);
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1390);
    float _1428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1392);
    float _1430 = _1406 * 6.283185482025146484375;
    float _1432 = sin(_1430);
    float _1434 = _1022 * _1426;
    float _1436 = _1042 * _1424;
    float _1438 = _1044 * _1428;
    float _1440 = _1406 * 6.283185482025146484375;
    float _1442 = cos(_1440);
    float _1444 = _1418 * 6.283185482025146484375;
    float _1446 = cos(_1444);
    float _1448 = in.m_42.x;
    float _1450 = in.m_42.y;
    float _1452 = in.m_42.z;
    float _1454 = _1414 * _1432;
    float _1456 = _1422 * _1432;
    float _1458 = _1418 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = _1422 * _1442;
    float _1464 = _1442 * _1446;
    float _1466 = _1446 * _1434;
    float _1468 = _1414 * _1442;
    float _1470 = _1432 * _1446;
    float _1472 = _1422 * _1466;
    float _1474 = _1414 * _1466;
    float _1476 = fma(_1460, _1462, _1454);
    float _1478 = -_1456;
    float _1480 = fma(_1460, _1468, _1478);
    float _1482 = -_1434;
    float _1484 = _1460 * _1482;
    float _1486 = -_1468;
    float _1488 = fma(_1460, _1456, _1486);
    float _1490 = fma(_1476, _1436, _1472);
    float _1492 = fma(_1460, _1454, _1462);
    float _1494 = fma(_1464, _1436, _1484);
    float _1496 = fma(_1480, _1436, _1474);
    float _1498 = fma(_1488, _1438, _1490);
    float _1500 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1502 = fma(_1470, _1438, _1494);
    float _1504 = fma(_1492, _1438, _1496);
    float _1506 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1508 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1510 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1500);
    float _1512 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1514 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1506);
    float _1516 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1508);
    float _1518 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1510);
    float _1520 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1512);
    float _1522 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1514);
    float _1524 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1516);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1528 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1520);
    float _1530 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1534 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1536 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1538 = _1526 + _1530;
    float _1540 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1542 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1534);
    float _1544 = _1532 + _1536;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1548 = _1538 + _1546;
    float _1550 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1540);
    float _1552 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1542);
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1556 = _1544 + _1554;
    float _1558 = _1548 * _1548;
    float _1560 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1550);
    float _1562 = _1552 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1564 = fma(_1556, _1556, _1558);
    float _1566 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1568 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1570 = sqrt(_1564);
    float _1572 = _1562 + _1566;
    float _1574 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1568);
    float _1576 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1574);
    bool _1578 = _1570 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = _1574;
    float _1582 = _1448;
    float _1584 = _1452;
    float _1586 = _1436;
    if (!_1578)
    {
        _1580 = _1544;
    }
    float _1588 = _1580;
    float _1590 = _1588;
    if (!_1578)
    {
        _1582 = _1538;
    }
    float _1592 = _1582;
    float _1594 = _1592;
    if (!_1578)
    {
        _1584 = _1572;
    }
    float _1596 = _1584;
    bool _1598 = !_1578;
    float _1600 = _1596;
    if (!_1598)
    {
        float _1602 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1606 = _1570 + _1604;
        float _1608 = _1572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1610 = rsqrt(_1564);
        float _1612 = _1606 * _1602;
        float _1614 = _1612 * 0.15915493667125701904296875;
        float _1616 = _1614 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = _1614 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = _1618 + (-1.0);
        float _1626 = fma(_1622, _1608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1628 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = _1610 * _1626;
        float _1632 = fma(_1572, _1618, _1628);
        float _1634 = fma(_1556, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1636 = fma(_1548, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1600 = _1632;
        _1590 = _1634;
        _1594 = _1636;
    }
    float _1638 = _1600;
    float _1640 = _1590;
    float _1642 = _1594;
    float _1644 = -_1562;
    float _1646 = _1644 + _1638;
    float _1648 = -_1532;
    float _1650 = _1648 + _1640;
    float _1652 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1654 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1656 = _1646 * _1646;
    float _1658 = -_1526;
    float _1660 = _1658 + _1642;
    float _1662 = 1.0 / _1652;
    float _1664 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1654);
    float _1666 = fma(_1650, _1650, _1656);
    bool _1668 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1670 = isnan(0.5);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1676 = _1672 || _1674;
    float _1678 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1664);
    float _1680 = fma(_1660, _1660, _1666);
    float _1682 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1684 = sqrt(_1680);
    float _1686 = _1682 + _1652;
    float _1688 = _1652;
    float _1690 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1692 = _1640;
    float _1694 = _1642;
    float _1696 = _1660;
    if (_1676)
    {
        _1688 = 1.0;
    }
    float _1698 = _1688;
    float _1700 = _1686 * _1662;
    float _1702 = _1700 * 0.5;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1706 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1704);
    float _1708 = 1.0 / _1706;
    bool _1710 = _1684 > 0.0;
    float _1712 = _1684;
    float _1714 = _1698;
    if (!_1710)
    {
        _1712 = _1638;
    }
    float _1716 = _1712;
    bool _1718 = !_1710;
    float _1720 = _1716;
    if (!_1718)
    {
        float _1722 = _172 * _172;
        float _1724 = fma(_170, _170, _1722);
        float _1726 = fma(_174, _174, _1724);
        float _1728 = rsqrt(_1680);
        float _1730 = sqrt(_1726);
        float _1732 = _1650 * _1728;
        float _1734 = _1646 * _1728;
        float _1736 = _1660 * _1728;
        bool _1738 = _1730 > 0.0;
        float _1740 = _1728;
        _1690 = _1730;
        if (!_1738)
        {
            _1740 = _1638;
        }
        float _1742 = _1740;
        bool _1744 = !_1738;
        _1720 = _1742;
        if (!_1744)
        {
            float _1746 = rsqrt(_1726);
            float _1748 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1750 = _172 * _1746;
            float _1752 = _170 * _1746;
            float _1754 = _174 * _1746;
            float _1756 = _1734 * _1750;
            float _1758 = fma(_1732, _1752, _1756);
            float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1762 = fma(_1736, _1754, _1758);
            float _1764 = _1762 * _1760;
            float _1766 = fma(_170, _1764, _1640);
            float _1768 = fma(_172, _1764, _1638);
            float _1770 = fma(_174, _1764, _1642);
            _1690 = _1752;
            _1720 = _1768;
            _1692 = _1766;
            _1694 = _1770;
            _1696 = _1764;
        }
    }
    float _1772 = _1690;
    float _1774 = _1720;
    float _1776 = _1692;
    float _1778 = _1694;
    float _1780 = _1696;
    float _1782 = _1780;
    float _1784 = _1772;
    if (_1676)
    {
        _1782 = 1.0;
    }
    float _1786 = _1782;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1790 = _1708 * _1788;
    float _1792 = _1786;
    if (!_1676)
    {
        float _1794 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1796 = _1794 * 0.15915493667125701904296875;
        float _1798 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1800 = _1796 * 6.283185482025146484375;
        float _1802 = cos(_1800);
        float _1804 = _1798 * 0.15915493667125701904296875;
        float _1806 = _1796 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = 1.0 / _1802;
        float _1812 = _1804 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1808 * _1810;
        float _1818 = _1804 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = _1814 * _1816;
        float _1824 = 1.0 / _1822;
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1826;
        float _1830 = 1.0 / _1828;
        float _1832 = _1820 * _1824;
        float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1836 = fma(_1790, _1832, _1834);
        float _1838 = _1836 * _1830;
        float _1840 = precise::clamp(_1838, 0.0, 1.0);
        _1784 = _1810;
        _1714 = _1840;
    }
    float _1842 = _1784;
    float _1844 = _1714;
    float _1846 = _1842;
    if (!_1676)
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
        float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1882 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1880;
        float _1884 = 1.0 / _1882;
        float _1886 = _1874 * _1878;
        float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1890 = fma(_1790, _1886, _1888);
        float _1892 = _1890 * _1884;
        float _1894 = precise::clamp(_1892, 0.0, 1.0);
        float _1896 = -_1894;
        float _1898 = _1896 + 1.0;
        _1846 = _1878;
        _1792 = _1898;
    }
    float _1900 = _1846;
    float _1902 = _1792;
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1906 = _1774 + _1904;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1910 = _1776 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1914 = _1778 + _1912;
    float _1916 = _1906 * _1906;
    float _1918 = fma(_1910, _1910, _1916);
    float _1920 = fma(_1914, _1914, _1918);
    float _1922 = rsqrt(_1920);
    float _1924 = sqrt(_1920);
    float _1926 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1928 = _1910 * _1926;
    float _1930 = _1914 * _1926;
    float _1932 = _1928 * _1928;
    float _1934 = _1930 * _1930;
    float _1936 = _1932 + _1934;
    float _1938 = sqrt(_1936);
    bool _1940 = _1938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1944 = _1938 + _1942;
    float _1946 = _1922;
    float _1948 = _1936;
    float _1950 = _1944;
    float _1952 = _1900;
    float _1954 = _1906;
    float _1956 = _1926;
    if (_1940)
    {
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1946 = _1958;
    }
    float _1960 = _1946;
    if (_1940)
    {
        float _1962 = rsqrt(_1936);
        _1948 = _1962;
    }
    float _1964 = _1948;
    float _1966 = _1964;
    if (_1940)
    {
        float _1968 = _1944 * _1960;
        _1950 = _1968;
    }
    float _1970 = _1950;
    if (_1940)
    {
        float _1972 = _1970 * 0.15915493667125701904296875;
        _1952 = _1972;
    }
    float _1974 = _1952;
    float _1976 = _1960;
    if (_1940)
    {
        float _1978 = _1974 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        _1976 = _1980;
    }
    float _1982 = _1976;
    float _1984 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1986 = precise::max(0.0, _1984);
    float _1988 = _1914;
    float _1990 = _1986;
    if (_1940)
    {
        float _1992 = _1974 * 6.283185482025146484375;
        float _1994 = cos(_1992);
        _1988 = _1994;
    }
    float _1996 = _1988;
    float _1998 = -_1926;
    float _2000 = -_1986;
    float _2002 = fma(_1906, _1998, _2000);
    if (_1940)
    {
        float _2004 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1990 = _2004;
    }
    float _2006 = _1990;
    float _2008 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2010 = _2006;
    float _2012 = _1982;
    if (_1940)
    {
        float _2014 = fma(_1982, _2006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _2016;
    if (!_1940)
    {
        _2012 = _1928;
    }
    float _2020 = _2012;
    float _2022 = _2020;
    float _2024 = _1996;
    if (_1940)
    {
        float _2026 = _1996 + (-1.0);
        _1954 = _2026;
    }
    float _2028 = _1954;
    float _2030 = _2028;
    if (_1940)
    {
        float _2032 = _1964 * _2016;
        _1586 = _2032;
    }
    float _2034 = _1586;
    if (!_1940)
    {
        _2018 = _2002;
    }
    float _2036 = _2018;
    float _2038 = _2036;
    if (_1940)
    {
        float _2040 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1956 = _2040;
    }
    float _2042 = _1956;
    if (_1940)
    {
        float _2044 = _1928 * _2034;
        _2022 = _2044;
    }
    float _2046 = _2022;
    if (!_1940)
    {
        _2030 = _1930;
    }
    float _2048 = _2030;
    float _2050 = _2048;
    if (_1940)
    {
        float _2052 = _1930 * _2034;
        _2050 = _2052;
    }
    float _2054 = _2050;
    if (!_1940)
    {
        _1966 = _1932;
    }
    float _2056 = _1966;
    float _2058 = _2056;
    if (_1940)
    {
        float _2060 = fma(_2002, _1996, _2042);
        _2038 = _2060;
    }
    float _2062 = _2038;
    if (_1940)
    {
        float _2064 = _2046 * _2046;
        _2058 = _2064;
    }
    float _2066 = _2058;
    if (!_1940)
    {
        _2024 = _1934;
    }
    float _2068 = _2024;
    float _2070 = _2068;
    if (_1940)
    {
        float _2072 = _2054 * _2054;
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = fma(_2062, _2062, _2066);
    float _2078 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2080 = _2076 + _2074;
    float _2082 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2008);
    float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2086 = fma(_1924, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2084);
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    float _2090 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2092 = rsqrt(_2080);
    float _2094 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2082);
    float _2096 = -_2088;
    float _2098 = _2096 + 1.0;
    float _2100 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2102 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2090);
    float _2104 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2106 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2108 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2100);
    float _2110 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2102);
    float _2112 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2114 = abs(_2098);
    float _2116 = log2(_2114);
    float _2118 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2108);
    float _2120 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2106);
    float _2122 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2124 = -_2112;
    float _2126 = fma(_2124, _2078, 1.0);
    float _2128 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2130 = _2092 * _2046;
    float _2132 = _2092 * _2062;
    float _2134 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2136 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2120);
    float _2138 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2140 = _2092 * _2054;
    float _2142 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2134);
    float _2144 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2146 = -_2138;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2146);
    float _2150 = log2(_2126);
    float _2152 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2142);
    float _2154 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = -_2140;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2148);
    float _2160 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2162 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2152);
    float _2164 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2166 = fma(_2158, -0.5, 0.5);
    float _2168 = exp2(_2154);
    float _2170 = fma(_2158, 0.5, 0.5);
    float _2172 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2160);
    float _2174 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2164);
    float _2176 = _2132 + 1.0;
    float _2178 = fma(_2170, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2180 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2172);
    float _2182 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2174);
    float _2184 = 1.0 / _2162;
    float _2186 = fma(_2170, _2178, -0.212114393711090087890625);
    float _2188 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2180);
    float _2190 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2182);
    float _2192 = _2150 * 0.693147182464599609375;
    float _2194 = fma(_2170, _2186, 1.570728778839111328125);
    float _2196 = sqrt(_2166);
    float _2198 = -_2132;
    float _2200 = fma(_2168, _2176, _2198);
    float _2202 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2204 = fma(_2200, 0.5, 0.5);
    float _2206 = _2188 * _2184;
    float _2208 = _2190 * _2184;
    float _2210 = fma(_2206, 0.5, 0.5);
    float _2212 = fma(_2208, -0.5, 0.5);
    float _2214 = _2196 * 0.636619746685028076171875;
    float _2216 = -_2194;
    float _2218 = fma(_2214, _2216, 1.0);
    float3 _6487 = float3(_2210, _2212, _2202);
    float _2220 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6487, float3(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6487, float3(0.0), isnan(_6487)), level(0.0)).x;
    float3 _6498 = float3(_2210, _2212, _2202);
    float4 _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6498, float3(0.0), isnan(_6498)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6498, float3(0.0), isnan(_6498)), level(0.0)).xyzw;
    float _2225 = _2223.x;
    float _2227 = _2223.y;
    float _2229 = _2223.z;
    float _2231 = _2223.w;
    float2 _6515 = float2(_2218, _2204);
    float3 _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6515, float2(0.0), isnan(_6515)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6515, float2(0.0), isnan(_6515)), level(0.0)).xyz;
    float _2237 = _2235.x;
    float _2239 = _2235.y;
    float _2241 = _2235.z;
    float _2243 = float(uint(_1064));
    float _2245 = trunc(_1192);
    int _2247 = int(_2245);
    int _2249 = ~_1064;
    int _2251 = _2249 + 1;
    float _2253 = _1362 * _152;
    int _2255 = ~_1064;
    int _2257 = _2255 + 1;
    float _2259 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2261 = abs(_1054);
    float _2263 = _986 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2265 = abs(_1060);
    float _2267 = 1.0 / _2243;
    int _2269 = _1064 + (-1);
    float _2271 = _984 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2273 = float(uint(_2247));
    float _2275 = trunc(_2253);
    int _2277 = int(_2275);
    int _2279 = as_type<int>(_2267) + (-2);
    float _2281 = exp2(_2259);
    float _2283 = as_type<float>(_2279) * _2273;
    float _2285 = trunc(_2283);
    float _2287 = precise::max(_2285, 0.0);
    uint _2290 = uint(_2287);
    float _2292 = -_2281;
    float _2294 = _2292 + 1.0;
    float _2296 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2298 = _2251 * int(_2290);
    int _2300 = _2298 + _2247;
    float _2302 = float(uint(_2300));
    float _2304 = as_type<float>(_2279) * _2302;
    bool _2306 = !_1020;
    float _2308 = _2306 ? 7.345489978790283203125 : 1.0;
    float _2310 = trunc(_2304);
    float _2312 = precise::max(_2310, 0.0);
    uint _2314 = uint(_2312);
    float _2316 = _2308 * _1010;
    float _2318 = float(_2247);
    bool _2320 = _2318 >= _1334;
    bool _2322 = isnan(_2318);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan(_1334);
    bool _2328 = _2324 || _2326;
    float _2330 = float(_2328);
    float _2332 = floor(_2316);
    int _2334 = int(_2290) + int(_2314);
    float _2336 = trunc(_2330);
    int _2338 = int(_2336);
    int _2340 = _2257 * _2334;
    int _2342 = _2340 + _2247;
    float _2344 = -_2332;
    float _2346 = _2316 + _2344;
    bool _2348 = uint(_2342) >= uint(_1064);
    bool _2350 = !_2348;
    int _2352 = _2350 ? 0 : (-1);
    bool _2354 = _1064 == 0;
    int _2356 = ~_2334;
    int _2358 = _2356 + _2352;
    int _2360 = _2358 + 1;
    float _2362 = _2346 * _1334;
    int _2364 = ~_2338;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    int _2370 = _1064 * _2360;
    int _2372 = _2370 + _2247;
    float _2374 = trunc(_2362);
    int _2376 = int(_2374);
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2380 = _2378 != 0;
    int _2382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2384 = _2382 != 0;
    bool _2386 = !_2354;
    int _2388 = _2386 ? _2372 : (-1);
    bool _2390 = !_2380;
    int _2392 = _2390 ? 0 : 1;
    int _2394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2396 = _2394 != 0;
    int _2398 = _2388 * _2368;
    int _2400 = abs(_1048);
    int _2402 = abs(_2392);
    int _2404 = _2338 * _2269;
    int _2406 = _2404 + _2398;
    bool _2408 = !_2396;
    int _2410 = _2408 ? 0 : 1;
    int _2412 = _2406 * _2400;
    int _2414 = abs(_2410);
    int _2416 = _2376 * _2402;
    int _2418 = _2416 + _2247;
    int _2420 = _2277 * _2261;
    int _2422 = _2420 + _2412;
    float _2424 = in.m_53.w;
    int _2426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2428 = _2426 != 0;
    int _2430 = _2418 * _2265;
    int _2432 = _2430 + _2422;
    float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2436 = _2434 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2440 = _2438 != 0;
    int _2442 = _2376 * _2414;
    int _2444 = _2442 + _2432;
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2448 = _2446 != 0;
    float _2450 = in.m_63.y;
    float _2452 = 1.0 / _2436;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2456 = _2454 != 0;
    float _2458 = float(uint(_2444));
    float _2460 = as_type<float>(_2279) * _2458;
    int _2462 = ~_1064;
    int _2464 = _2462 + 1;
    float _2466 = trunc(_2460);
    float _2468 = precise::max(_2466, 0.0);
    uint _2470 = uint(_2468);
    bool _2472 = _2424 > 0.5;
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2478 = 1.0 / _2476;
    int _2480 = _2464 * int(_2470);
    int _2482 = _2480 + _2444;
    float _2484 = float(uint(_2482));
    float _2486 = as_type<float>(_2279) * _2484;
    float _2488 = trunc(_2486);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2494 = -_2450;
    float _2496 = _2494 + 1.0;
    int _2498 = _2472 ? as_type<int>(_2496) : as_type<int>(_2450);
    float _2500 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2502 = _2500 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2504 = _1024 > 0.5;
    int _2506 = ~_1064;
    int _2508 = _2506 + 1;
    float _2510 = 1.0 / _2502;
    int _2512 = int(_2470) + int(_2492);
    float _2514 = _2428 ? as_type<float>(_2498) : _2450;
    float _2516 = _2450;
    bool _2518 = _2384;
    bool _2520 = _2428;
    if (_2384)
    {
        float _2522 = _2504 ? _2496 : _2450;
        _2516 = _2522;
    }
    float _2524 = _2516;
    int _2526 = _2508 * _2512;
    int _2528 = _2526 + _2444;
    float _2530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2440)
    {
        bool _2532 = _1016 > 0.5;
        _2518 = _2532;
    }
    bool _2534 = _2518;
    bool _2536 = uint(_2528) >= uint(_1064);
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2538;
    if (_2448)
    {
        bool _2542 = _1010 > 0.5;
        _2520 = _2542;
    }
    bool _2544 = _2520;
    float _2546 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2548 = _2546 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2550 = !_2536;
    int _2552 = _2550 ? 0 : (-1);
    float _2554 = _2540 * _2452;
    float _2556 = _2548 * _2478;
    int _2558 = ~_2512;
    int _2560 = _2558 + _2552;
    int _2562 = _2560 + 1;
    float _2564 = in.m_63.x;
    float _2566 = float(uint(_2418));
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2568;
    bool _2572 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2574 = isnan(_1008);
    bool _2576 = _2572 || _2574;
    bool _2578 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2580 = _2576 || _2578;
    float _2582 = float(_2580);
    int _2584 = _1064 * _2562;
    int _2586 = _2584 + _2444;
    int _2588 = ~_1064;
    int _2590 = _2588 + 1;
    float _2592 = _2570 * _2510;
    float _2594 = as_type<float>(_2279) * _2566;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2598 = _1008 + _2596;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2602 = _1008 + _2600;
    bool _2604 = !_2354;
    int _2606 = _2604 ? _2586 : (-1);
    float _2608 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2610 = fma(_2554, _2598, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2614 = _1008 + _2612;
    float _2616 = trunc(_2594);
    float _2618 = precise::max(_2616, 0.0);
    uint _2620 = uint(_2618);
    float _2622 = fma(_2556, _2602, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2624 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2626 = isnan(_1008);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    float _2636 = fma(_2592, _2614, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2638 = _2606 >> 31;
    float _2640 = fma(_2514, _2608, -0.5);
    bool _2642 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2644 = isnan(_1008);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2650 = _2646 || _2648;
    float _2652 = float(_2650);
    float _2654 = -_2634;
    float _2656 = _2654 + 1.0;
    int _2658 = _2638 & 3;
    float _2660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2662 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2664 = isnan(_1008);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = _2652 * _2656;
    int _2676 = _2606 + _2658;
    float _2678 = -_2652;
    float _2680 = _2678 + 1.0;
    float _2682 = _2656;
    int _2684 = as_type<int>(_2610);
    float _2686 = _2564;
    if (!_2448)
    {
        _2682 = _2564;
    }
    float _2688 = _2682;
    int _2690 = 0;
    float _2692 = _2688;
    if (_2440)
    {
        float _2694 = -_2564;
        float _2696 = _2694 + 1.0;
        _2690 = as_type<int>(_2696);
    }
    int _2698 = _2690;
    int _2700 = _2676 >> 2;
    float _2702 = _2672 * _2680;
    float _2704 = -_2672;
    float _2706 = _2704 + 1.0;
    int _2708 = _2590 * int(_2620);
    int _2710 = _2708 + _2418;
    int _2712 = _2700 << 4;
    int _2714 = _2712 + 368;
    float _2716 = -_1318;
    float _2718 = fma(_1338, _2640, _2716);
    float _2720 = _2582 * _2706;
    float _2722 = -_2582;
    float _2724 = _2722 + 1.0;
    float _2726 = float(uint(_2710));
    float _2728 = _2660 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2730 = uint(int(uint(_2714) >> uint(2)));
    uint _2732 = uint(int(uint(int(_2730)) >> uint(2)));
    int _2734 = int(_2730) & 3;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[int(_2732)][_2734];
    int _2738 = int(_2730) + 1;
    uint _2740 = uint(int(uint(_2738) >> uint(2)));
    int _2742 = _2738 & 3;
    float _2744 = (*spvDescriptorSet0.vp_c9)._m0[int(_2740)][_2742];
    float _2746 = _2610 * _2720;
    if (_2448)
    {
        float _2748 = -_2564;
        float _2750 = _2748 + 1.0;
        _2684 = as_type<int>(_2750);
    }
    int _2752 = _2684;
    float _2754 = as_type<float>(_2279) * _2726;
    float _2756 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2524, -0.5);
    float _2758 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2746);
    if (_2448)
    {
        float _2760 = _2544 ? as_type<float>(_2752) : _2564;
        _2692 = _2760;
    }
    float _2762 = _2692;
    float _2764 = -_1110;
    float _2766 = fma(_1308, _2756, _2764);
    float _2768 = trunc(_2754);
    float _2770 = precise::max(_2768, 0.0);
    uint _2772 = uint(_2770);
    int _2774 = _2606 & 3;
    bool _2776 = _2774 != 0;
    int _2778 = _2714 + 8;
    uint _2780 = uint(int(uint(_2778) >> uint(2)));
    uint _2782 = uint(int(uint(int(_2780)) >> uint(2)));
    int _2784 = int(_2780) & 3;
    float _2786 = (*spvDescriptorSet0.vp_c9)._m0[int(_2782)][_2784];
    int _2788 = int(_2780) + 1;
    uint _2790 = uint(int(uint(_2788) >> uint(2)));
    int _2792 = _2788 & 3;
    float _2794 = (*spvDescriptorSet0.vp_c9)._m0[int(_2790)][_2792];
    if (_2440)
    {
        float _2796 = _2534 ? as_type<float>(_2698) : _2564;
        _2686 = _2796;
    }
    float _2798 = _2686;
    float _2800 = fma(_2622, _2702, _2758);
    bool _2802 = uint(_2774) > 1u;
    int _2804 = _2606 & 3;
    bool _2806 = _2804 != 0;
    float _2808 = fma(_2636, _2674, _2800);
    float _2810 = fma(_2728, _2798, -0.5);
    int _2812 = ~_1064;
    int _2814 = _2812 + 1;
    int _2816 = _2806 ? 0 : 1;
    float _2818 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2820 = fma(_1312, _2810, _1188);
    int _2822 = int(_2620) + int(_2772);
    int _2824 = ~_2816;
    int _2826 = _2824 + 1;
    int _2828 = _2826 + 1;
    float _2830 = fma(_1290, _2818, _1090);
    int _2832 = _2828;
    if (!_2802)
    {
        int _2834 = ~_2816;
        int _2836 = _2834 + 1;
        _2832 = _2836;
    }
    int _2838 = _2832;
    int _2840 = _2814 * _2822;
    int _2842 = _2840 + _2418;
    bool _2844 = _2774 != 3;
    int _2846 = abs(_2838);
    float _2848 = _2296 * _2220;
    bool _2850 = uint(_2842) >= uint(_1064);
    float _2852 = fma(_2634, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2808);
    bool _2854 = uint(_2774) >= 2u;
    bool _2856 = !_2850;
    int _2858 = _2856 ? 0 : (-1);
    int _2860 = ~_2846;
    int _2862 = _2860 + 1;
    int _2864 = _2862 + 1;
    int _2866 = _2854 ? 0 : 1;
    int _2868 = ~_2822;
    int _2870 = _2868 + _2858;
    int _2872 = _2870 + 1;
    int _2874 = _2864 * as_type<int>(_2744);
    bool _2876 = !_2776;
    int _2878 = _2876 ? 0 : 1;
    int _2880 = ~_2866;
    int _2882 = _2880 + 1;
    int _2884 = _2882 + 1;
    int _2886 = _1064 * _2872;
    int _2888 = _2886 + _2418;
    bool _2890 = _2774 != 3;
    float _2892 = _2718 + 0.5;
    int _2894 = _2884;
    if (_2844)
    {
        int _2896 = ~_2866;
        int _2898 = _2896 + 1;
        _2894 = _2898;
    }
    int _2900 = _2894;
    float _2902 = _2766 + 0.5;
    int _2904 = abs(_2878);
    float _2906 = _2830 + 0.5;
    bool _2908 = !_2890;
    int _2910 = _2908 ? 0 : (-1);
    int _2912 = abs(_2900);
    int _2914 = ~_2904;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    int _2920 = abs(_2910);
    float _2922 = _2820 + 0.5;
    int _2924 = ~_2912;
    int _2926 = _2924 + 1;
    int _2928 = _2926 + 1;
    int _2930 = _2918 * as_type<int>(_2736);
    int _2932 = _2930 + _2874;
    bool _2934 = !_2456;
    int _2936 = _2934 ? 0 : 1;
    float _2938 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2940 = ~_2920;
    int _2942 = _2940 + 1;
    int _2944 = _2942 + 1;
    int _2946 = _2928 * as_type<int>(_2786);
    int _2948 = _2946 + _2932;
    int _2950 = abs(_2936);
    out.m_67.x = _2906;
    out.m_67.y = _2902;
    out.m_67.z = _2922;
    out.m_67.w = _2892;
    float _2952 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2938);
    int _2954 = _2944 * as_type<int>(_2794);
    int _2956 = _2954 + _2948;
    float _2958 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2952);
    float _2960 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2958);
    float _2962 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2964 = ~_2950;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2972 = _2271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2974 = !_2354;
    int _2976 = _2974 ? _2888 : (-1);
    float _2978 = _1844 * _1902;
    int _2980 = _2956 * _2968;
    float _2982 = _2962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2984 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2986 = _2978 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2988 = _2976 * _2950;
    int _2990 = _2988 + _2980;
    float _2992 = _2960 + _2162;
    bool _2994 = _1844 > 0.0;
    bool _2996 = isnan(_1844);
    bool _2998 = _2994 || _2996;
    bool _3000 = isnan(0.0);
    bool _3002 = _2998 || _3000;
    float _3004 = _2986 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2972;
    out.m_69.y = _2970;
    out.m_69.z = _2982;
    out.m_69.w = _2984;
    float _3006 = _2992 * 0.5;
    bool _3008 = _1902 <= 0.0;
    bool _3010 = !_3002;
    bool _3012 = _3008 || _3010;
    float _3014 = float(_2990);
    float _3016 = _2241 * _2848;
    out.m_49.x = _3004;
    out.m_71.x = _3014;
    float _3018 = _2231 * _2848;
    float _3020 = -_2296;
    float _3022 = _3020 + 1.0;
    out.gl_Position.x = _2188;
    out.gl_Position.y = _2190;
    out.gl_Position.z = _2960;
    out.gl_Position.w = _2162;
    float _3024 = fma(_2237, _3018, _2225);
    float _3026 = fma(_2239, _3018, _2227);
    float _3028 = _2231 * _3022;
    float _3030 = fma(_2231, _3016, _2229);
    out.m_73.z = _3006;
    out.m_73.w = _2162;
    out.m_75.x = _3024;
    out.m_75.y = _3026;
    out.m_75.z = _3030;
    out.m_75.w = _3028;
    if (!_3012)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3032 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3032;
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
    bool _740 = false;
    bool _642 = false;
    bool _306 = false;
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
        float _3101 = as_type<float>(_118);
        out.gl_Position.z = _3101;
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
        float _3156 = as_type<float>(_144);
        out.gl_Position.z = _3156;
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
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    float _222 = -_216;
    float _224 = _222 + 1.0;
    bool _226 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_200);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _238;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = 1.0 / _220;
    float _246 = _236 * _224;
    float _248 = -_236;
    float _250 = _248 + 1.0;
    float _252 = _204 * _244;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _254;
    float _258 = fma(_240, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = fma(_256, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = _258 * _246;
    float _268 = fma(_262, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _270 = _264 * _246;
    float _272 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].x, _266);
    float _274 = _268 * _246;
    float _276 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].z, _270);
    float _278 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].x, _272);
    float _280 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].y, _274);
    float _282 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].y, _280);
    float _284 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].z, _276);
    bool _286 = !_242;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _156;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_55.x;
    float _312 = in.m_55.y;
    float _314 = in.m_55.z;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _332 = 1.0 / _318;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _334;
    float _338 = 1.0 / _322;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _342 = _308 + _340;
    bool _344 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _346 = isnan(_308);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    bool _356 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _358 = isnan(_308);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _284 * _314;
    float _370 = _282 * _312;
    float _372 = 1.0 / _326;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _376 = _308 + _374;
    float _378 = _342 * _332;
    bool _380 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _382 = isnan(_308);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _394 = _308 + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _398 = _308 + _396;
    bool _400 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _402 = isnan(_308);
    bool _404 = _400 || _402;
    bool _406 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _408 = _404 || _406;
    float _410 = float(_408);
    float _412 = -_354;
    float _414 = _412 + 1.0;
    float _416 = 1.0 / _330;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _420 = _308 + _418;
    float _422 = _376 * _338;
    bool _424 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _426 = isnan(_308);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = -_390;
    float _438 = _436 + 1.0;
    float _440 = -_366;
    float _442 = _440 + 1.0;
    float _444 = _410 * _414;
    float _446 = -_410;
    float _448 = _446 + 1.0;
    float _450 = 1.0 / _336;
    float _452 = _394 * _372;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _454;
    float _458 = _434 * _438;
    float _460 = -_434;
    float _462 = _460 + 1.0;
    float _464 = fma(_456, _378, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _466 = _420 * _416;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _468;
    float _472 = _366 * _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _478 = fma(_470, _378, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _480 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _482 = fma(_476, _422, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _484 = _398 * _450;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _486;
    float _490 = _278 * _310;
    float _492 = fma(_488, _378, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _494 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _496 = isnan(_308);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = _354 * _442;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _516 = _504 * _448;
    float _518 = fma(_510, _422, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _520 = fma(_514, _422, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _522;
    float _526 = _478 * _516;
    float _528 = _492 * _516;
    float _530 = _464 * _516;
    float _532 = -_504;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _536;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _540;
    float _544 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].x, _526);
    float _546 = fma(_538, _452, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _552 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].y, _528);
    float _554 = fma(_518, _444, _544);
    float _556 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[107].z, _530);
    float _558 = fma(_542, _452, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _560 = fma(_550, _466, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _562 = fma(_546, _506, _554);
    float _564 = fma(_524, _452, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _566 = fma(_482, _444, _552);
    float _568 = fma(_520, _444, _556);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _572 = _570 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _578 = fma(_564, _506, _568);
    float _580 = fma(_572, _466, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _586;
    float _590 = fma(_576, _466, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _592 = fma(_558, _506, _566);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _594;
    float _598 = fma(_584, _484, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _600 = fma(_588, _484, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _602 = fma(_560, _472, _562);
    float _604 = fma(_596, _484, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _606 = fma(_580, _472, _592);
    float _608 = fma(_590, _472, _578);
    float _610 = fma(_598, _458, _602);
    float _612 = fma(_600, _458, _606);
    float _614 = fma(_604, _458, _608);
    float _616 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[112].x, _610);
    float _618 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[112].y, _612);
    float _620 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[112].z, _614);
    bool _622 = !_480;
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
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _648 = _644 + _646;
    bool _650 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _652 = isnan(_644);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _666 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _668 = isnan(_644);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _678;
    float _682 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _684 = -_660;
    float _686 = _684 + 1.0;
    bool _688 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _690 = 1.0 / _664;
    float _692 = _676 * _686;
    float _694 = -_676;
    float _696 = _694 + 1.0;
    float _698 = _680 * _690;
    float _700 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _702 = fma(_698, _648, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _704 = _700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _702 * _692;
    float _708 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _710 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[115].x, _706);
    float _712 = _708 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[116].x, _710);
    float _716 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _716;
    out.m_57.y = _712;
    out.m_57.z = _704;
    out.m_57.w = _718;
    bool _720 = !_688;
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
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _746 = _742 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _750 = _742 + _748;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _754 = _742 + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _756;
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _762 = _760 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _764;
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _770 = _768 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _772 = 1.0 / _758;
    bool _774 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _776 = isnan(_742);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = 1.0 / _770;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _790 = _742 + _788;
    bool _792 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _794 = isnan(_742);
    bool _796 = _792 || _794;
    bool _798 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _800 = _796 || _798;
    float _802 = float(_800);
    bool _804 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _806 = 1.0 / _766;
    float _808 = _746 * _772;
    bool _810 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _812 = isnan(_742);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = 1.0 / _762;
    float _824 = _790 * _786;
    bool _826 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _828 = isnan(_742);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_820;
    float _840 = _838 + 1.0;
    float _842 = _836 * _840;
    float _844 = _750 * _806;
    bool _846 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _848 = isnan(_742);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_836;
    float _860 = _858 + 1.0;
    float _862 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _862;
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _866;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _874 = _856 * _860;
    float _876 = fma(_864, _808, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _878 = _754 * _822;
    float _880 = -_856;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _884;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _896 = _784 * _882;
    float _898 = -_784;
    float _900 = _898 + 1.0;
    float _902 = fma(_886, _808, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _904 = fma(_868, _808, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _906 = fma(_872, _878, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _908 = _802 * _900;
    float _910 = fma(_890, _878, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _912 = fma(_894, _878, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _914 = -_802;
    float _916 = _914 + 1.0;
    float _918 = _876 * _908;
    float _920 = _902 * _908;
    float _922 = _904 * _908;
    float _924 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].x, _918);
    float _926 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].y, _920);
    float _928 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[123].z, _922);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _938;
    float _942 = fma(_906, _896, _924);
    float _944 = fma(_912, _896, _928);
    float _946 = fma(_932, _844, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _948 = fma(_936, _844, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _950 = fma(_910, _896, _926);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _960 = fma(_940, _844, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _964 = _962 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _966 = fma(_946, _874, _942);
    float _968 = fma(_954, _824, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _970 = fma(_958, _824, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _972 = fma(_948, _874, _950);
    float _974 = fma(_964, _824, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _976 = fma(_960, _874, _944);
    float _978 = fma(_968, _842, _966);
    float _980 = fma(_970, _842, _972);
    float _982 = fma(_974, _842, _976);
    float _984 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[127].x, _978);
    float _986 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[127].y, _980);
    float _988 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[127].z, _982);
    bool _990 = !_804;
    if (!_990)
    {
        float _992 = in.m_53.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _178 = _1006;
    }
    float _1008 = _178;
    float _1010 = in.m_53.x;
    float _1012 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1014 = log2(_1012);
    float _1016 = in.m_53.z;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1020 = _1018 != 0;
    float _1022 = _370 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1024 = in.m_53.y;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1028 = _1026 != 0;
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1032 = _1030 != 0;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1036 = _1034 != 0;
    float _1038 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1040 = int(_1038);
    float _1042 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1044 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _1046 = !_1032;
    int _1048 = _1046 ? 0 : 1;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1052 = !_1028;
    int _1054 = _1052 ? 0 : 1;
    float _1056 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1058 = !_1036;
    int _1060 = _1058 ? 0 : 1;
    float _1062 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1064 = int(_1062);
    float _1066 = _1010 * 2.0;
    float _1068 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1072 = float(_1040);
    float _1074 = _1016 * 2.0;
    float _1076 = floor(_1066);
    float _1078 = -_1050;
    float _1080 = fma(_1068, 2.0, _1078);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1084 = _1024 * 2.0;
    float _1086 = _1024 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1088 = -_100;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1080);
    float _1092 = floor(_1074);
    float _1094 = _1010 + _1024;
    float _1096 = fma(_1086, -2.0, _1056);
    float _1098 = _1086;
    if (!_1020)
    {
        _1098 = _1016;
    }
    float _1100 = _1098;
    float _1102 = _1094 + (-1.0);
    float _1104 = _1100;
    float _1106 = _1102;
    if (_1020)
    {
        _1104 = _1024;
    }
    float _1108 = _1104;
    float _1110 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1096);
    bool _1112 = _1076 > 0.0;
    float _1114 = floor(_1084);
    bool _1116 = _1076 >= 0.0;
    bool _1118 = isnan(_1076);
    bool _1120 = _1116 || _1118;
    bool _1122 = isnan(0.0);
    bool _1124 = _1120 || _1122;
    float _1126 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1128 = _1108;
    if (!_1020)
    {
        _1106 = _1024;
    }
    float _1130 = _1106;
    bool _1132 = _1092 >= 0.0;
    bool _1134 = isnan(_1092);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan(0.0);
    bool _1140 = _1136 || _1138;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1144 = _1130;
    if (_1020)
    {
        _1144 = _1010;
    }
    float _1146 = _1144;
    float _1148 = 1.0 / _1072;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1152 = _1150 != 0;
    int _1154 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1156 = _1154 != 0;
    int _1158 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1160 = _1158 != 0;
    int _1162 = _1140 ? 0 : 1;
    float _1164 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1166 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1142);
    bool _1168 = !_1152;
    int _1170 = _1168 ? 0 : 1;
    bool _1172 = _1092 > 0.0;
    float _1174 = -_1070;
    float _1176 = fma(_1164, 2.0, _1174);
    int _1178 = ~_1162;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    int _1184 = _1124 ? 0 : 1;
    float _1186 = -_100;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1176);
    bool _1190 = _1114 > 0.0;
    float _1192 = _1148 * _100;
    bool _1194 = _1114 >= 0.0;
    bool _1196 = isnan(_1114);
    bool _1198 = _1194 || _1196;
    bool _1200 = isnan(0.0);
    bool _1202 = _1198 || _1200;
    float _1204 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _1206 = abs(_1170);
    int _1208 = _1182;
    if (!_1172)
    {
        int _1210 = ~_1162;
        int _1212 = _1210 + 1;
        _1208 = _1212;
    }
    int _1214 = _1208;
    float _1216 = _1014 * _100;
    int _1218 = _1202 ? 0 : 1;
    float _1220 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1204);
    if (!_1020)
    {
        _1128 = _1016;
    }
    float _1222 = _1128;
    float _1224 = _1222;
    if (_1020)
    {
        _1224 = _1024;
    }
    float _1226 = _1224;
    float _1228 = exp2(_1216);
    int _1230 = ~_1218;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = _1226 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1240 = float(_1214);
    float _1242 = fma(_1236, -2.0, _1082);
    int _1244 = _1234;
    if (!_1190)
    {
        int _1246 = ~_1218;
        int _1248 = _1246 + 1;
        _1244 = _1248;
    }
    int _1250 = _1244;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1254 = float(_1206);
    float _1256 = in.m_59.x;
    float _1258 = in.m_59.y;
    float _1260 = in.m_59.z;
    int _1262 = ~_1184;
    int _1264 = _1262 + 1;
    int _1266 = _1264 + 1;
    float _1268 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1252);
    float _1270 = _1254 * _1240;
    float _1272 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1238);
    bool _1274 = !_1156;
    int _1276 = _1274 ? 0 : 1;
    float _1278 = -_1228;
    float _1280 = _1278 + 1.0;
    int _1282 = _1266;
    if (!_1112)
    {
        int _1284 = ~_1184;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1272);
    bool _1292 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1294 = isnan(0.0);
    bool _1296 = _1292 || _1294;
    bool _1298 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1300 = _1296 || _1298;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1304 = 1.0 + _1302;
    int _1306 = abs(_1276);
    float _1308 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1268);
    float _1310 = _1300 ? _1280 : 0.0;
    float _1312 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1166);
    float _1314 = 1.0 / _1304;
    float _1316 = float(_1288);
    float _1318 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1242);
    float _1320 = float(_1306);
    float _1322 = _1270 * (-2.0);
    bool _1324 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1326 = isnan(1.0);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1064);
    float _1336 = _1320 * _1316;
    float _1338 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1220);
    bool _1340 = !_1160;
    int _1342 = _1340 ? 0 : 1;
    float _1344 = fma(_1322, _1256, _1256);
    float _1346 = _1010 + (-0.5);
    float _1348 = fma(_1126, _1322, _1126);
    int _1350 = abs(_1342);
    float _1352 = _1024 + _1016;
    float _1354 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1344);
    float _1356 = float(_1250);
    float _1358 = _1336 * (-2.0);
    float _1360 = _1352 + (-1.0);
    float _1362 = _1334 * _100;
    float _1364 = float(_1350);
    if (_1332)
    {
        float _1366 = _1310 * _1314;
        _110 = _1366;
    }
    float _1368 = _110;
    float _1370 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1372 = _1364 * _1356;
    float _1374 = _1024 + (-0.5);
    float _1376 = fma(_1358, _1258, _1258);
    float _1378 = fma(_1370, _1358, _1370);
    float _1380 = _1010 + _1016;
    float _1382 = _1372 * (-2.0);
    float _1384 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1376);
    float _1386 = fma(_1348, _1368, _1354);
    float _1388 = in.m_61.x;
    float _1390 = in.m_61.y;
    float _1392 = in.m_61.z;
    float _1394 = _1380 + (-1.0);
    float _1396 = fma(_1378, _1368, _1384);
    float _1398 = _1386 * 0.15915493667125701904296875;
    float _1400 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1402 = fma(_1382, _1260, _1260);
    float _1404 = _1016 + (-0.5);
    float _1406 = _1396 * 0.15915493667125701904296875;
    float _1408 = fma(_1400, _1382, _1400);
    float _1410 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1402);
    float _1412 = _1398 * 6.283185482025146484375;
    float _1414 = sin(_1412);
    float _1416 = fma(_1408, _1368, _1410);
    float _1418 = _1416 * 0.15915493667125701904296875;
    float _1420 = _1398 * 6.283185482025146484375;
    float _1422 = cos(_1420);
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1388);
    float _1426 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1390);
    float _1428 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1392);
    float _1430 = _1406 * 6.283185482025146484375;
    float _1432 = sin(_1430);
    float _1434 = _1022 * _1426;
    float _1436 = _1042 * _1424;
    float _1438 = _1044 * _1428;
    float _1440 = _1406 * 6.283185482025146484375;
    float _1442 = cos(_1440);
    float _1444 = _1418 * 6.283185482025146484375;
    float _1446 = cos(_1444);
    float _1448 = in.m_42.x;
    float _1450 = in.m_42.y;
    float _1452 = in.m_42.z;
    float _1454 = _1414 * _1432;
    float _1456 = _1422 * _1432;
    float _1458 = _1418 * 6.283185482025146484375;
    float _1460 = sin(_1458);
    float _1462 = _1422 * _1442;
    float _1464 = _1442 * _1446;
    float _1466 = _1446 * _1434;
    float _1468 = _1414 * _1442;
    float _1470 = _1432 * _1446;
    float _1472 = _1422 * _1466;
    float _1474 = _1414 * _1466;
    float _1476 = fma(_1460, _1462, _1454);
    float _1478 = -_1456;
    float _1480 = fma(_1460, _1468, _1478);
    float _1482 = -_1434;
    float _1484 = _1460 * _1482;
    float _1486 = -_1468;
    float _1488 = fma(_1460, _1456, _1486);
    float _1490 = fma(_1476, _1436, _1472);
    float _1492 = fma(_1460, _1454, _1462);
    float _1494 = fma(_1464, _1436, _1484);
    float _1496 = fma(_1480, _1436, _1474);
    float _1498 = fma(_1488, _1438, _1490);
    float _1500 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1502 = fma(_1470, _1438, _1494);
    float _1504 = fma(_1492, _1438, _1496);
    float _1506 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1508 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1510 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1500);
    float _1512 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1514 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1506);
    float _1516 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1508);
    float _1518 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1510);
    float _1520 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1512);
    float _1522 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1514);
    float _1524 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1516);
    float _1526 = _1518 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1528 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1520);
    float _1530 = _1522 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1534 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1536 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1538 = _1526 + _1530;
    float _1540 = _1498 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1542 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1534);
    float _1544 = _1532 + _1536;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1548 = _1538 + _1546;
    float _1550 = fma(_1502, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1540);
    float _1552 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1542);
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1556 = _1544 + _1554;
    float _1558 = _1548 * _1548;
    float _1560 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1550);
    float _1562 = _1552 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1564 = fma(_1556, _1556, _1558);
    float _1566 = _1560 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1568 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1570 = sqrt(_1564);
    float _1572 = _1562 + _1566;
    float _1574 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1568);
    float _1576 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1574);
    bool _1578 = _1570 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1580 = _1574;
    float _1582 = _1448;
    float _1584 = _1452;
    float _1586 = _1436;
    if (!_1578)
    {
        _1580 = _1544;
    }
    float _1588 = _1580;
    float _1590 = _1588;
    if (!_1578)
    {
        _1582 = _1538;
    }
    float _1592 = _1582;
    float _1594 = _1592;
    if (!_1578)
    {
        _1584 = _1572;
    }
    float _1596 = _1584;
    bool _1598 = !_1578;
    float _1600 = _1596;
    if (!_1598)
    {
        float _1602 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1606 = _1570 + _1604;
        float _1608 = _1572 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1610 = rsqrt(_1564);
        float _1612 = _1606 * _1602;
        float _1614 = _1612 * 0.15915493667125701904296875;
        float _1616 = _1614 * 6.283185482025146484375;
        float _1618 = cos(_1616);
        float _1620 = _1614 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = _1618 + (-1.0);
        float _1626 = fma(_1622, _1608, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1628 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = _1610 * _1626;
        float _1632 = fma(_1572, _1618, _1628);
        float _1634 = fma(_1556, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1636 = fma(_1548, _1630, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1600 = _1632;
        _1590 = _1634;
        _1594 = _1636;
    }
    float _1638 = _1600;
    float _1640 = _1590;
    float _1642 = _1594;
    float _1644 = -_1562;
    float _1646 = _1644 + _1638;
    float _1648 = -_1532;
    float _1650 = _1648 + _1640;
    float _1652 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1654 = _1562 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1656 = _1646 * _1646;
    float _1658 = -_1526;
    float _1660 = _1658 + _1642;
    float _1662 = 1.0 / _1652;
    float _1664 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1654);
    float _1666 = fma(_1650, _1650, _1656);
    bool _1668 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1670 = isnan(0.5);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1676 = _1672 || _1674;
    float _1678 = fma(_1526, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1664);
    float _1680 = fma(_1660, _1660, _1666);
    float _1682 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1684 = sqrt(_1680);
    float _1686 = _1682 + _1652;
    float _1688 = _1652;
    float _1690 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1692 = _1640;
    float _1694 = _1642;
    float _1696 = _1660;
    if (_1676)
    {
        _1688 = 1.0;
    }
    float _1698 = _1688;
    float _1700 = _1686 * _1662;
    float _1702 = _1700 * 0.5;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1706 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1704);
    float _1708 = 1.0 / _1706;
    bool _1710 = _1684 > 0.0;
    float _1712 = _1684;
    float _1714 = _1698;
    if (!_1710)
    {
        _1712 = _1638;
    }
    float _1716 = _1712;
    bool _1718 = !_1710;
    float _1720 = _1716;
    if (!_1718)
    {
        float _1722 = _172 * _172;
        float _1724 = fma(_170, _170, _1722);
        float _1726 = fma(_174, _174, _1724);
        float _1728 = rsqrt(_1680);
        float _1730 = sqrt(_1726);
        float _1732 = _1650 * _1728;
        float _1734 = _1646 * _1728;
        float _1736 = _1660 * _1728;
        bool _1738 = _1730 > 0.0;
        float _1740 = _1728;
        _1690 = _1730;
        if (!_1738)
        {
            _1740 = _1638;
        }
        float _1742 = _1740;
        bool _1744 = !_1738;
        _1720 = _1742;
        if (!_1744)
        {
            float _1746 = rsqrt(_1726);
            float _1748 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1750 = _172 * _1746;
            float _1752 = _170 * _1746;
            float _1754 = _174 * _1746;
            float _1756 = _1734 * _1750;
            float _1758 = fma(_1732, _1752, _1756);
            float _1760 = _1748 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1762 = fma(_1736, _1754, _1758);
            float _1764 = _1762 * _1760;
            float _1766 = fma(_170, _1764, _1640);
            float _1768 = fma(_172, _1764, _1638);
            float _1770 = fma(_174, _1764, _1642);
            _1690 = _1752;
            _1720 = _1768;
            _1692 = _1766;
            _1694 = _1770;
            _1696 = _1764;
        }
    }
    float _1772 = _1690;
    float _1774 = _1720;
    float _1776 = _1692;
    float _1778 = _1694;
    float _1780 = _1696;
    float _1782 = _1780;
    float _1784 = _1772;
    if (_1676)
    {
        _1782 = 1.0;
    }
    float _1786 = _1782;
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1790 = _1708 * _1788;
    float _1792 = _1786;
    if (!_1676)
    {
        float _1794 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1796 = _1794 * 0.15915493667125701904296875;
        float _1798 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1800 = _1796 * 6.283185482025146484375;
        float _1802 = cos(_1800);
        float _1804 = _1798 * 0.15915493667125701904296875;
        float _1806 = _1796 * 6.283185482025146484375;
        float _1808 = sin(_1806);
        float _1810 = 1.0 / _1802;
        float _1812 = _1804 * 6.283185482025146484375;
        float _1814 = cos(_1812);
        float _1816 = _1808 * _1810;
        float _1818 = _1804 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = _1814 * _1816;
        float _1824 = 1.0 / _1822;
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1826;
        float _1830 = 1.0 / _1828;
        float _1832 = _1820 * _1824;
        float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1836 = fma(_1790, _1832, _1834);
        float _1838 = _1836 * _1830;
        float _1840 = precise::clamp(_1838, 0.0, 1.0);
        _1784 = _1810;
        _1714 = _1840;
    }
    float _1842 = _1784;
    float _1844 = _1714;
    float _1846 = _1842;
    if (!_1676)
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
        float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1882 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1880;
        float _1884 = 1.0 / _1882;
        float _1886 = _1874 * _1878;
        float _1888 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1890 = fma(_1790, _1886, _1888);
        float _1892 = _1890 * _1884;
        float _1894 = precise::clamp(_1892, 0.0, 1.0);
        float _1896 = -_1894;
        float _1898 = _1896 + 1.0;
        _1846 = _1878;
        _1792 = _1898;
    }
    float _1900 = _1846;
    float _1902 = _1792;
    float _1904 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1906 = _1774 + _1904;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1910 = _1776 + _1908;
    float _1912 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1914 = _1778 + _1912;
    float _1916 = _1906 * _1906;
    float _1918 = fma(_1910, _1910, _1916);
    float _1920 = fma(_1914, _1914, _1918);
    float _1922 = rsqrt(_1920);
    float _1924 = sqrt(_1920);
    float _1926 = _1922 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1928 = _1910 * _1926;
    float _1930 = _1914 * _1926;
    float _1932 = _1928 * _1928;
    float _1934 = _1930 * _1930;
    float _1936 = _1932 + _1934;
    float _1938 = sqrt(_1936);
    bool _1940 = _1938 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1942 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1944 = _1938 + _1942;
    float _1946 = _1922;
    float _1948 = _1936;
    float _1950 = _1944;
    float _1952 = _1900;
    float _1954 = _1906;
    float _1956 = _1926;
    if (_1940)
    {
        float _1958 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1946 = _1958;
    }
    float _1960 = _1946;
    if (_1940)
    {
        float _1962 = rsqrt(_1936);
        _1948 = _1962;
    }
    float _1964 = _1948;
    float _1966 = _1964;
    if (_1940)
    {
        float _1968 = _1944 * _1960;
        _1950 = _1968;
    }
    float _1970 = _1950;
    if (_1940)
    {
        float _1972 = _1970 * 0.15915493667125701904296875;
        _1952 = _1972;
    }
    float _1974 = _1952;
    float _1976 = _1960;
    if (_1940)
    {
        float _1978 = _1974 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        _1976 = _1980;
    }
    float _1982 = _1976;
    float _1984 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1986 = precise::max(0.0, _1984);
    float _1988 = _1914;
    float _1990 = _1986;
    if (_1940)
    {
        float _1992 = _1974 * 6.283185482025146484375;
        float _1994 = cos(_1992);
        _1988 = _1994;
    }
    float _1996 = _1988;
    float _1998 = -_1926;
    float _2000 = -_1986;
    float _2002 = fma(_1906, _1998, _2000);
    if (_1940)
    {
        float _2004 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1990 = _2004;
    }
    float _2006 = _1990;
    float _2008 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2010 = _2006;
    float _2012 = _1982;
    if (_1940)
    {
        float _2014 = fma(_1982, _2006, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _2016;
    if (!_1940)
    {
        _2012 = _1928;
    }
    float _2020 = _2012;
    float _2022 = _2020;
    float _2024 = _1996;
    if (_1940)
    {
        float _2026 = _1996 + (-1.0);
        _1954 = _2026;
    }
    float _2028 = _1954;
    float _2030 = _2028;
    if (_1940)
    {
        float _2032 = _1964 * _2016;
        _1586 = _2032;
    }
    float _2034 = _1586;
    if (!_1940)
    {
        _2018 = _2002;
    }
    float _2036 = _2018;
    float _2038 = _2036;
    if (_1940)
    {
        float _2040 = _2028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1956 = _2040;
    }
    float _2042 = _1956;
    if (_1940)
    {
        float _2044 = _1928 * _2034;
        _2022 = _2044;
    }
    float _2046 = _2022;
    if (!_1940)
    {
        _2030 = _1930;
    }
    float _2048 = _2030;
    float _2050 = _2048;
    if (_1940)
    {
        float _2052 = _1930 * _2034;
        _2050 = _2052;
    }
    float _2054 = _2050;
    if (!_1940)
    {
        _1966 = _1932;
    }
    float _2056 = _1966;
    float _2058 = _2056;
    if (_1940)
    {
        float _2060 = fma(_2002, _1996, _2042);
        _2038 = _2060;
    }
    float _2062 = _2038;
    if (_1940)
    {
        float _2064 = _2046 * _2046;
        _2058 = _2064;
    }
    float _2066 = _2058;
    if (!_1940)
    {
        _2024 = _1934;
    }
    float _2068 = _2024;
    float _2070 = _2068;
    if (_1940)
    {
        float _2072 = _2054 * _2054;
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = fma(_2062, _2062, _2066);
    float _2078 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2080 = _2076 + _2074;
    float _2082 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2008);
    float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2086 = fma(_1924, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2084);
    float _2088 = precise::clamp(_2086, 0.0, 1.0);
    float _2090 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2092 = rsqrt(_2080);
    float _2094 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2082);
    float _2096 = -_2088;
    float _2098 = _2096 + 1.0;
    float _2100 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2102 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2090);
    float _2104 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2106 = _1774 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2108 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2100);
    float _2110 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2102);
    float _2112 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2114 = abs(_2098);
    float _2116 = log2(_2114);
    float _2118 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2108);
    float _2120 = fma(_1776, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2106);
    float _2122 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2124 = -_2112;
    float _2126 = fma(_2124, _2078, 1.0);
    float _2128 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2130 = _2092 * _2046;
    float _2132 = _2092 * _2062;
    float _2134 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2136 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2120);
    float _2138 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2140 = _2092 * _2054;
    float _2142 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2134);
    float _2144 = _2136 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2146 = -_2138;
    float _2148 = fma(_2132, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2146);
    float _2150 = log2(_2126);
    float _2152 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2142);
    float _2154 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = -_2140;
    float _2158 = fma(_2156, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2148);
    float _2160 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2162 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2152);
    float _2164 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2166 = fma(_2158, -0.5, 0.5);
    float _2168 = exp2(_2154);
    float _2170 = fma(_2158, 0.5, 0.5);
    float _2172 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2160);
    float _2174 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2164);
    float _2176 = _2132 + 1.0;
    float _2178 = fma(_2170, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2180 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2172);
    float _2182 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2174);
    float _2184 = 1.0 / _2162;
    float _2186 = fma(_2170, _2178, -0.212114393711090087890625);
    float _2188 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2180);
    float _2190 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2182);
    float _2192 = _2150 * 0.693147182464599609375;
    float _2194 = fma(_2170, _2186, 1.570728778839111328125);
    float _2196 = sqrt(_2166);
    float _2198 = -_2132;
    float _2200 = fma(_2168, _2176, _2198);
    float _2202 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2204 = fma(_2200, 0.5, 0.5);
    float _2206 = _2188 * _2184;
    float _2208 = _2190 * _2184;
    float _2210 = fma(_2206, 0.5, 0.5);
    float _2212 = fma(_2208, -0.5, 0.5);
    float _2214 = _2196 * 0.636619746685028076171875;
    float _2216 = -_2194;
    float _2218 = fma(_2214, _2216, 1.0);
    float3 _6487 = float3(_2210, _2212, _2202);
    float _2220 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6487, float3(0.0), isnan(_6487)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6487, float3(0.0), isnan(_6487)), level(0.0)).x;
    float3 _6498 = float3(_2210, _2212, _2202);
    float4 _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6498, float3(0.0), isnan(_6498)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6498, float3(0.0), isnan(_6498)), level(0.0)).xyzw;
    float _2225 = _2223.x;
    float _2227 = _2223.y;
    float _2229 = _2223.z;
    float _2231 = _2223.w;
    float2 _6515 = float2(_2218, _2204);
    float3 _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6515, float2(0.0), isnan(_6515)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6515, float2(0.0), isnan(_6515)), level(0.0)).xyz;
    float _2237 = _2235.x;
    float _2239 = _2235.y;
    float _2241 = _2235.z;
    float _2243 = float(uint(_1064));
    float _2245 = trunc(_1192);
    int _2247 = int(_2245);
    int _2249 = ~_1064;
    int _2251 = _2249 + 1;
    float _2253 = _1362 * _152;
    int _2255 = ~_1064;
    int _2257 = _2255 + 1;
    float _2259 = _2116 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2261 = abs(_1054);
    float _2263 = _986 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2265 = abs(_1060);
    float _2267 = 1.0 / _2243;
    int _2269 = _1064 + (-1);
    float _2271 = _984 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2273 = float(uint(_2247));
    float _2275 = trunc(_2253);
    int _2277 = int(_2275);
    int _2279 = as_type<int>(_2267) + (-2);
    float _2281 = exp2(_2259);
    float _2283 = as_type<float>(_2279) * _2273;
    float _2285 = trunc(_2283);
    float _2287 = precise::max(_2285, 0.0);
    uint _2290 = uint(_2287);
    float _2292 = -_2281;
    float _2294 = _2292 + 1.0;
    float _2296 = _2294 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2298 = _2251 * int(_2290);
    int _2300 = _2298 + _2247;
    float _2302 = float(uint(_2300));
    float _2304 = as_type<float>(_2279) * _2302;
    bool _2306 = !_1020;
    float _2308 = _2306 ? 7.345489978790283203125 : 1.0;
    float _2310 = trunc(_2304);
    float _2312 = precise::max(_2310, 0.0);
    uint _2314 = uint(_2312);
    float _2316 = _2308 * _1010;
    float _2318 = float(_2247);
    bool _2320 = _2318 >= _1334;
    bool _2322 = isnan(_2318);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan(_1334);
    bool _2328 = _2324 || _2326;
    float _2330 = float(_2328);
    float _2332 = floor(_2316);
    int _2334 = int(_2290) + int(_2314);
    float _2336 = trunc(_2330);
    int _2338 = int(_2336);
    int _2340 = _2257 * _2334;
    int _2342 = _2340 + _2247;
    float _2344 = -_2332;
    float _2346 = _2316 + _2344;
    bool _2348 = uint(_2342) >= uint(_1064);
    bool _2350 = !_2348;
    int _2352 = _2350 ? 0 : (-1);
    bool _2354 = _1064 == 0;
    int _2356 = ~_2334;
    int _2358 = _2356 + _2352;
    int _2360 = _2358 + 1;
    float _2362 = _2346 * _1334;
    int _2364 = ~_2338;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    int _2370 = _1064 * _2360;
    int _2372 = _2370 + _2247;
    float _2374 = trunc(_2362);
    int _2376 = int(_2374);
    int _2378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2380 = _2378 != 0;
    int _2382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2384 = _2382 != 0;
    bool _2386 = !_2354;
    int _2388 = _2386 ? _2372 : (-1);
    bool _2390 = !_2380;
    int _2392 = _2390 ? 0 : 1;
    int _2394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2396 = _2394 != 0;
    int _2398 = _2388 * _2368;
    int _2400 = abs(_1048);
    int _2402 = abs(_2392);
    int _2404 = _2338 * _2269;
    int _2406 = _2404 + _2398;
    bool _2408 = !_2396;
    int _2410 = _2408 ? 0 : 1;
    int _2412 = _2406 * _2400;
    int _2414 = abs(_2410);
    int _2416 = _2376 * _2402;
    int _2418 = _2416 + _2247;
    int _2420 = _2277 * _2261;
    int _2422 = _2420 + _2412;
    float _2424 = in.m_53.w;
    int _2426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2428 = _2426 != 0;
    int _2430 = _2418 * _2265;
    int _2432 = _2430 + _2422;
    float _2434 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2436 = _2434 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2440 = _2438 != 0;
    int _2442 = _2376 * _2414;
    int _2444 = _2442 + _2432;
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2448 = _2446 != 0;
    float _2450 = in.m_63.y;
    float _2452 = 1.0 / _2436;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2456 = _2454 != 0;
    float _2458 = float(uint(_2444));
    float _2460 = as_type<float>(_2279) * _2458;
    int _2462 = ~_1064;
    int _2464 = _2462 + 1;
    float _2466 = trunc(_2460);
    float _2468 = precise::max(_2466, 0.0);
    uint _2470 = uint(_2468);
    bool _2472 = _2424 > 0.5;
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2478 = 1.0 / _2476;
    int _2480 = _2464 * int(_2470);
    int _2482 = _2480 + _2444;
    float _2484 = float(uint(_2482));
    float _2486 = as_type<float>(_2279) * _2484;
    float _2488 = trunc(_2486);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2494 = -_2450;
    float _2496 = _2494 + 1.0;
    int _2498 = _2472 ? as_type<int>(_2496) : as_type<int>(_2450);
    float _2500 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2502 = _2500 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2504 = _1024 > 0.5;
    int _2506 = ~_1064;
    int _2508 = _2506 + 1;
    float _2510 = 1.0 / _2502;
    int _2512 = int(_2470) + int(_2492);
    float _2514 = _2428 ? as_type<float>(_2498) : _2450;
    float _2516 = _2450;
    bool _2518 = _2384;
    bool _2520 = _2428;
    if (_2384)
    {
        float _2522 = _2504 ? _2496 : _2450;
        _2516 = _2522;
    }
    float _2524 = _2516;
    int _2526 = _2508 * _2512;
    int _2528 = _2526 + _2444;
    float _2530 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_2440)
    {
        bool _2532 = _1016 > 0.5;
        _2518 = _2532;
    }
    bool _2534 = _2518;
    bool _2536 = uint(_2528) >= uint(_1064);
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2540 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2538;
    if (_2448)
    {
        bool _2542 = _1010 > 0.5;
        _2520 = _2542;
    }
    bool _2544 = _2520;
    float _2546 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2548 = _2546 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2550 = !_2536;
    int _2552 = _2550 ? 0 : (-1);
    float _2554 = _2540 * _2452;
    float _2556 = _2548 * _2478;
    int _2558 = ~_2512;
    int _2560 = _2558 + _2552;
    int _2562 = _2560 + 1;
    float _2564 = in.m_63.x;
    float _2566 = float(uint(_2418));
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2568;
    bool _2572 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2574 = isnan(_1008);
    bool _2576 = _2572 || _2574;
    bool _2578 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2580 = _2576 || _2578;
    float _2582 = float(_2580);
    int _2584 = _1064 * _2562;
    int _2586 = _2584 + _2444;
    int _2588 = ~_1064;
    int _2590 = _2588 + 1;
    float _2592 = _2570 * _2510;
    float _2594 = as_type<float>(_2279) * _2566;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2598 = _1008 + _2596;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2602 = _1008 + _2600;
    bool _2604 = !_2354;
    int _2606 = _2604 ? _2586 : (-1);
    float _2608 = _2530 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2610 = fma(_2554, _2598, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2612 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2614 = _1008 + _2612;
    float _2616 = trunc(_2594);
    float _2618 = precise::max(_2616, 0.0);
    uint _2620 = uint(_2618);
    float _2622 = fma(_2556, _2602, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2624 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2626 = isnan(_1008);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2632 = _2628 || _2630;
    float _2634 = float(_2632);
    float _2636 = fma(_2592, _2614, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2638 = _2606 >> 31;
    float _2640 = fma(_2514, _2608, -0.5);
    bool _2642 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2644 = isnan(_1008);
    bool _2646 = _2642 || _2644;
    bool _2648 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2650 = _2646 || _2648;
    float _2652 = float(_2650);
    float _2654 = -_2634;
    float _2656 = _2654 + 1.0;
    int _2658 = _2638 & 3;
    float _2660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2662 = _1008 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2664 = isnan(_1008);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = _2652 * _2656;
    int _2676 = _2606 + _2658;
    float _2678 = -_2652;
    float _2680 = _2678 + 1.0;
    float _2682 = _2656;
    int _2684 = as_type<int>(_2610);
    float _2686 = _2564;
    if (!_2448)
    {
        _2682 = _2564;
    }
    float _2688 = _2682;
    int _2690 = 0;
    float _2692 = _2688;
    if (_2440)
    {
        float _2694 = -_2564;
        float _2696 = _2694 + 1.0;
        _2690 = as_type<int>(_2696);
    }
    int _2698 = _2690;
    int _2700 = _2676 >> 2;
    float _2702 = _2672 * _2680;
    float _2704 = -_2672;
    float _2706 = _2704 + 1.0;
    int _2708 = _2590 * int(_2620);
    int _2710 = _2708 + _2418;
    int _2712 = _2700 << 4;
    int _2714 = _2712 + 368;
    float _2716 = -_1318;
    float _2718 = fma(_1338, _2640, _2716);
    float _2720 = _2582 * _2706;
    float _2722 = -_2582;
    float _2724 = _2722 + 1.0;
    float _2726 = float(uint(_2710));
    float _2728 = _2660 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _2730 = uint(int(uint(_2714) >> uint(2)));
    uint _2732 = uint(int(uint(int(_2730)) >> uint(2)));
    int _2734 = int(_2730) & 3;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[int(_2732)][_2734];
    int _2738 = int(_2730) + 1;
    uint _2740 = uint(int(uint(_2738) >> uint(2)));
    int _2742 = _2738 & 3;
    float _2744 = (*spvDescriptorSet0.vp_c9)._m0[int(_2740)][_2742];
    float _2746 = _2610 * _2720;
    if (_2448)
    {
        float _2748 = -_2564;
        float _2750 = _2748 + 1.0;
        _2684 = as_type<int>(_2750);
    }
    int _2752 = _2684;
    float _2754 = as_type<float>(_2279) * _2726;
    float _2756 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2524, -0.5);
    float _2758 = fma(_2724, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2746);
    if (_2448)
    {
        float _2760 = _2544 ? as_type<float>(_2752) : _2564;
        _2692 = _2760;
    }
    float _2762 = _2692;
    float _2764 = -_1110;
    float _2766 = fma(_1308, _2756, _2764);
    float _2768 = trunc(_2754);
    float _2770 = precise::max(_2768, 0.0);
    uint _2772 = uint(_2770);
    int _2774 = _2606 & 3;
    bool _2776 = _2774 != 0;
    int _2778 = _2714 + 8;
    uint _2780 = uint(int(uint(_2778) >> uint(2)));
    uint _2782 = uint(int(uint(int(_2780)) >> uint(2)));
    int _2784 = int(_2780) & 3;
    float _2786 = (*spvDescriptorSet0.vp_c9)._m0[int(_2782)][_2784];
    int _2788 = int(_2780) + 1;
    uint _2790 = uint(int(uint(_2788) >> uint(2)));
    int _2792 = _2788 & 3;
    float _2794 = (*spvDescriptorSet0.vp_c9)._m0[int(_2790)][_2792];
    if (_2440)
    {
        float _2796 = _2534 ? as_type<float>(_2698) : _2564;
        _2686 = _2796;
    }
    float _2798 = _2686;
    float _2800 = fma(_2622, _2702, _2758);
    bool _2802 = uint(_2774) > 1u;
    int _2804 = _2606 & 3;
    bool _2806 = _2804 != 0;
    float _2808 = fma(_2636, _2674, _2800);
    float _2810 = fma(_2728, _2798, -0.5);
    int _2812 = ~_1064;
    int _2814 = _2812 + 1;
    int _2816 = _2806 ? 0 : 1;
    float _2818 = fma(_2762, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2820 = fma(_1312, _2810, _1188);
    int _2822 = int(_2620) + int(_2772);
    int _2824 = ~_2816;
    int _2826 = _2824 + 1;
    int _2828 = _2826 + 1;
    float _2830 = fma(_1290, _2818, _1090);
    int _2832 = _2828;
    if (!_2802)
    {
        int _2834 = ~_2816;
        int _2836 = _2834 + 1;
        _2832 = _2836;
    }
    int _2838 = _2832;
    int _2840 = _2814 * _2822;
    int _2842 = _2840 + _2418;
    bool _2844 = _2774 != 3;
    int _2846 = abs(_2838);
    float _2848 = _2296 * _2220;
    bool _2850 = uint(_2842) >= uint(_1064);
    float _2852 = fma(_2634, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2808);
    bool _2854 = uint(_2774) >= 2u;
    bool _2856 = !_2850;
    int _2858 = _2856 ? 0 : (-1);
    int _2860 = ~_2846;
    int _2862 = _2860 + 1;
    int _2864 = _2862 + 1;
    int _2866 = _2854 ? 0 : 1;
    int _2868 = ~_2822;
    int _2870 = _2868 + _2858;
    int _2872 = _2870 + 1;
    int _2874 = _2864 * as_type<int>(_2744);
    bool _2876 = !_2776;
    int _2878 = _2876 ? 0 : 1;
    int _2880 = ~_2866;
    int _2882 = _2880 + 1;
    int _2884 = _2882 + 1;
    int _2886 = _1064 * _2872;
    int _2888 = _2886 + _2418;
    bool _2890 = _2774 != 3;
    float _2892 = _2718 + 0.5;
    int _2894 = _2884;
    if (_2844)
    {
        int _2896 = ~_2866;
        int _2898 = _2896 + 1;
        _2894 = _2898;
    }
    int _2900 = _2894;
    float _2902 = _2766 + 0.5;
    int _2904 = abs(_2878);
    float _2906 = _2830 + 0.5;
    bool _2908 = !_2890;
    int _2910 = _2908 ? 0 : (-1);
    int _2912 = abs(_2900);
    int _2914 = ~_2904;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    int _2920 = abs(_2910);
    float _2922 = _2820 + 0.5;
    int _2924 = ~_2912;
    int _2926 = _2924 + 1;
    int _2928 = _2926 + 1;
    int _2930 = _2918 * as_type<int>(_2736);
    int _2932 = _2930 + _2874;
    bool _2934 = !_2456;
    int _2936 = _2934 ? 0 : 1;
    float _2938 = _2122 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2940 = ~_2920;
    int _2942 = _2940 + 1;
    int _2944 = _2942 + 1;
    int _2946 = _2928 * as_type<int>(_2786);
    int _2948 = _2946 + _2932;
    int _2950 = abs(_2936);
    out.m_67.x = _2906;
    out.m_67.y = _2902;
    out.m_67.z = _2922;
    out.m_67.w = _2892;
    float _2952 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2938);
    int _2954 = _2944 * as_type<int>(_2794);
    int _2956 = _2954 + _2948;
    float _2958 = fma(_2104, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2952);
    float _2960 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2958);
    float _2962 = _988 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2964 = ~_2950;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = _2263 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2972 = _2271 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2974 = !_2354;
    int _2976 = _2974 ? _2888 : (-1);
    float _2978 = _1844 * _1902;
    int _2980 = _2956 * _2968;
    float _2982 = _2962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2984 = _2852 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2986 = _2978 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2988 = _2976 * _2950;
    int _2990 = _2988 + _2980;
    float _2992 = _2960 + _2162;
    bool _2994 = _1844 > 0.0;
    bool _2996 = isnan(_1844);
    bool _2998 = _2994 || _2996;
    bool _3000 = isnan(0.0);
    bool _3002 = _2998 || _3000;
    float _3004 = _2986 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _2972;
    out.m_69.y = _2970;
    out.m_69.z = _2982;
    out.m_69.w = _2984;
    float _3006 = _2992 * 0.5;
    bool _3008 = _1902 <= 0.0;
    bool _3010 = !_3002;
    bool _3012 = _3008 || _3010;
    float _3014 = float(_2990);
    float _3016 = _2241 * _2848;
    out.m_49.x = _3004;
    out.m_71.x = _3014;
    float _3018 = _2231 * _2848;
    float _3020 = -_2296;
    float _3022 = _3020 + 1.0;
    out.gl_Position.x = _2188;
    out.gl_Position.y = _2190;
    out.gl_Position.z = _2960;
    out.gl_Position.w = _2162;
    float _3024 = fma(_2237, _3018, _2225);
    float _3026 = fma(_2239, _3018, _2227);
    float _3028 = _2231 * _3022;
    float _3030 = fma(_2231, _3016, _2229);
    out.m_73.z = _3006;
    out.m_73.w = _2162;
    out.m_75.x = _3024;
    out.m_75.y = _3026;
    out.m_75.z = _3030;
    out.m_75.w = _3028;
    if (!_3012)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3032 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3032;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

