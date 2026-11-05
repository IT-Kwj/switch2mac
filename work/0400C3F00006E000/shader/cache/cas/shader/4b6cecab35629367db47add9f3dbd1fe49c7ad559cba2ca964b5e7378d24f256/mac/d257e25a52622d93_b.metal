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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_61 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_75 [[user(locn11)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_73 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_65 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3802 = false;
    bool _2168 = false;
    bool _1842 = false;
    bool _1524 = false;
    bool _1206 = false;
    bool _970 = false;
    bool _866 = false;
    bool _578 = false;
    bool _302 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4500 = as_type<float>(_120);
        out.gl_Position.z = _4500;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4569 = as_type<float>(_158);
        out.gl_Position.z = _4569;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.w;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_49.x;
    float _176 = in.m_49.y;
    float _178 = in.m_49.z;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _162);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _174, _264);
    float _272 = fma(_260, _176, _266);
    float _274 = fma(_260, _178, _268);
    float _276 = fma(_270, _160, _180);
    float _278 = fma(_272, _160, _182);
    float _280 = fma(_274, _160, _184);
    bool _282 = !_262;
    float _300;
    if (!_282)
    {
        float _284 = in.m_53.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_104);
        float _306 = 1.0 / _304;
        float _308 = _138 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = _310 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _310 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _310 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = 1.0 / _330;
    float _342 = 1.0 / _326;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _346 = 1.0 / _334;
    float _348 = 1.0 / _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _310 + _350;
    float _354 = _314 * _342;
    bool _356 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_310);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _352 * _340;
    bool _370 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _372 = isnan(_310);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _318 * _346;
    bool _384 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_310);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = -_380;
    float _402 = _400 + 1.0;
    bool _404 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _406 = isnan(_310);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = fma(_398, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = _366 * _402;
    float _420 = _322 * _348;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = -_366;
    float _432 = _430 + 1.0;
    bool _434 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _436 = isnan(_310);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = fma(_424, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = fma(_428, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _450 = -_394;
    float _452 = _450 + 1.0;
    float _454 = _394 * _432;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = _414 * _452;
    float _466 = -_414;
    float _468 = _466 + 1.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _474 = fma(_462, _420, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _476 = fma(_458, _420, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = _444 * _468;
    float _480 = fma(_472, _420, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _482 = -_444;
    float _484 = _482 + 1.0;
    float _486 = _416 * _478;
    float _488 = _446 * _478;
    float _490 = _448 * _478;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].y, _488);
    float _500 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].z, _490);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _506;
    float _510 = fma(_474, _464, _496);
    float _512 = fma(_476, _464, _498);
    float _514 = fma(_480, _464, _500);
    float _516 = fma(_494, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _518 = fma(_504, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _520 = fma(_508, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = fma(_516, _454, _510);
    float _536 = fma(_524, _368, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _538 = fma(_528, _368, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _540 = fma(_532, _368, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_518, _454, _512);
    float _544 = fma(_520, _454, _514);
    float _546 = fma(_536, _418, _534);
    float _548 = fma(_538, _418, _542);
    float _550 = fma(_540, _418, _544);
    float _552 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].x, _546);
    float _554 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].y, _548);
    float _556 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].z, _550);
    bool _558 = !_344;
    float _576;
    if (!_558)
    {
        float _560 = in.m_53.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_104);
        float _582 = 1.0 / _580;
        float _584 = _138 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = in.m_51.x;
    float _590 = in.m_51.y;
    float _592 = in.m_51.z;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _596 = _586 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _614 = 1.0 / _600;
    float _616 = 1.0 / _612;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _620 = _586 + _618;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _624 = 1.0 / _604;
    float _626 = _554 * _590;
    float _628 = _620 * _614;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _632 = _586 + _630;
    bool _634 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _636 = isnan(_586);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _556 * _592;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _650 = _586 + _648;
    float _652 = _552 * _588;
    float _654 = 1.0 / _608;
    float _656 = _596 * _616;
    bool _658 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _660 = isnan(_586);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _670;
    bool _674 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _676 = isnan(_586);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = fma(_672, _628, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _688 = _632 * _624;
    float _690 = -_644;
    float _692 = _690 + 1.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _694;
    bool _698 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _700 = isnan(_586);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = _668 * _692;
    float _712 = -_668;
    float _714 = _712 + 1.0;
    float _716 = fma(_696, _628, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _718 = _650 * _654;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _720;
    float _724 = -_684;
    float _726 = _724 + 1.0;
    float _728 = _684 * _714;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _734 = fma(_722, _628, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _736 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _738 = isnan(_586);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _708 * _726;
    float _750 = -_708;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _762 = fma(_732, _688, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _764 = _746 * _752;
    float _766 = fma(_756, _688, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _768 = fma(_760, _688, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _770 = -_746;
    float _772 = _770 + 1.0;
    float _774 = _734 * _764;
    float _776 = _686 * _764;
    float _778 = _716 * _764;
    float _780 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].x, _774);
    float _782 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].y, _776);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _784;
    float _788 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].z, _778);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _794;
    float _798 = fma(_786, _718, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _800 = fma(_766, _748, _780);
    float _802 = fma(_762, _748, _782);
    float _804 = fma(_768, _748, _788);
    float _806 = fma(_792, _718, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _808 = fma(_796, _718, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _822 = fma(_798, _728, _800);
    float _824 = fma(_812, _656, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _826 = fma(_816, _656, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _828 = fma(_820, _656, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _830 = fma(_806, _728, _802);
    float _832 = fma(_808, _728, _804);
    float _834 = fma(_824, _710, _822);
    float _836 = fma(_826, _710, _830);
    float _838 = fma(_828, _710, _832);
    float _840 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[111].x, _834);
    float _842 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[111].y, _836);
    float _844 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[111].z, _838);
    bool _846 = !_622;
    float _864;
    if (!_846)
    {
        float _848 = in.m_53.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        float _868 = float(_104);
        float _870 = 1.0 / _868;
        float _872 = _138 * _870;
        _864 = _872;
    }
    _866 = false;
    float _874 = _864;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _874 + _876;
    bool _880 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _882 = isnan(_874);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _898 = isnan(_874);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _908;
    float _912 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _914 = -_890;
    float _916 = _914 + 1.0;
    bool _918 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _920 = 1.0 / _894;
    float _922 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _906 * _916;
    float _926 = -_906;
    float _928 = _926 + 1.0;
    float _930 = _910 * _920;
    float _932 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _934 = fma(_930, _878, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _936 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _934 * _924;
    float _940 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _942 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[115].x, _938);
    float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[116].x, _942);
    float _948 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _922;
    out.m_55.y = _944;
    out.m_55.z = _936;
    out.m_55.w = _948;
    bool _950 = !_918;
    float _968;
    if (!_950)
    {
        float _952 = in.m_53.x;
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _956 = _952 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _960 = _958 * _954;
        float _962 = floor(_960);
        float _964 = -_962;
        float _966 = _960 + _964;
        _968 = _966;
        _970 = true;
    }
    else
    {
        float _972 = float(_104);
        float _974 = 1.0 / _972;
        float _976 = _138 * _974;
        _968 = _976;
    }
    _970 = false;
    float _978 = _968;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _982 = _978 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _986 = _978 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = _978 + _1000;
    float _1004 = 1.0 / _990;
    bool _1006 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1008 = isnan(_978);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    bool _1018 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1020 = isnan(_978);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = 1.0 / _994;
    bool _1032 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1034 = 1.0 / _998;
    float _1036 = _982 * _1004;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1042;
    float _1046 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1048 = fma(_1044, _1036, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1050 = _986 * _1030;
    bool _1052 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1054 = isnan(_978);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1064;
    float _1068 = fma(_1066, _1036, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1070 = -_1062;
    float _1072 = _1070 + 1.0;
    float _1074 = _1002 * _1034;
    float _1076 = -_1016;
    float _1078 = _1076 + 1.0;
    bool _1080 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1082 = isnan(_978);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1096 = _1062 * _1078;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1102 = _1028 * _1072;
    float _1104 = -_1028;
    float _1106 = _1104 + 1.0;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1112 = fma(_1094, _1050, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1114 = fma(_1100, _1050, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1116 = _1090 * _1106;
    float _1118 = fma(_1110, _1050, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1120 = -_1090;
    float _1122 = _1120 + 1.0;
    float _1124 = _1046 * _1116;
    float _1126 = _1048 * _1116;
    float _1128 = _1068 * _1116;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1130;
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1124);
    float _1136 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1126);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1142;
    float _1146 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1128);
    float _1148 = fma(_1132, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1150 = fma(_1140, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1152 = fma(_1144, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1154 = fma(_1112, _1102, _1134);
    float _1156 = fma(_1118, _1102, _1136);
    float _1158 = fma(_1114, _1102, _1146);
    float _1160 = fma(_1148, _1096, _1154);
    float _1162 = fma(_1150, _1096, _1156);
    float _1164 = fma(_1152, _1096, _1158);
    float _1166 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1160);
    float _1168 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1162);
    float _1170 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1164);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1180 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1180;
    out.m_57.y = _1182;
    out.m_57.z = _1184;
    out.m_57.w = _1172;
    bool _1186 = !_1032;
    float _1204;
    if (!_1186)
    {
        float _1188 = in.m_53.x;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1192 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        float _1208 = float(_104);
        float _1210 = 1.0 / _1208;
        float _1212 = _138 * _1210;
        _1204 = _1212;
    }
    _1206 = false;
    float _1214 = _1204;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1218 = _1214 + _1216;
    bool _1220 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1222 = isnan(_1214);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1236 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1238 = isnan(_1214);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1248;
    bool _1252 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1254 = isnan(_1214);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = -_1230;
    float _1266 = _1264 + 1.0;
    float _1268 = 1.0 / _1234;
    bool _1270 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1272 = isnan(_1214);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = -_1262;
    float _1284 = _1282 + 1.0;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1292 = 1.0 / _1288;
    float _1294 = _1250 * _1268;
    float _1296 = -_1246;
    float _1298 = _1296 + 1.0;
    float _1300 = _1246 * _1266;
    bool _1302 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1304 = isnan(_1214);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = fma(_1294, _1218, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1316 = _1262 * _1298;
    float _1318 = _1280 * _1284;
    float _1320 = -_1280;
    float _1322 = _1320 + 1.0;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1328 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1330 = isnan(_1214);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = _1312 * _1322;
    float _1342 = -_1312;
    float _1344 = _1342 + 1.0;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1350 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1352 = isnan(_1214);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1358 = _1354 || _1356;
    float _1360 = float(_1358);
    float _1362 = 1.0 / _1326;
    float _1364 = _1338 * _1344;
    float _1366 = -_1338;
    float _1368 = _1366 + 1.0;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1374 = _1360 * _1368;
    float _1376 = 1.0 / _1348;
    float _1378 = _1372 * _1292;
    float _1380 = -_1360;
    float _1382 = _1380 + 1.0;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1388;
    float _1392 = 1.0 / _1386;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1398 = _1314 * _1374;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1402 = _1214 + _1400;
    float _1404 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1398);
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1410 = 1.0 / _1396;
    float _1412 = fma(_1378, _1402, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1414 = _1390 * _1376;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1418 = _1214 + _1416;
    float _1420 = fma(_1412, _1364, _1404);
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1424 = _1214 + _1422;
    float _1426 = fma(_1414, _1418, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1428 = 1.0 / _1408;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1442 = _1432 * _1362;
    float _1444 = fma(_1426, _1340, _1420);
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1448 = _1214 + _1446;
    float _1450 = _1436 * _1410;
    float _1452 = fma(_1442, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1454;
    bool _1458 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1460 = isnan(_1214);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = _1440 * _1392;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1474 = _1214 + _1472;
    float _1476 = fma(_1450, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1478 = fma(_1452, _1318, _1444);
    float _1480 = _1456 * _1428;
    float _1482 = fma(_1470, _1474, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1484 = -_1468;
    float _1486 = _1484 + 1.0;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1490 = _1214 + _1488;
    float _1492 = fma(_1476, _1316, _1478);
    float _1494 = _1230 * _1486;
    float _1496 = fma(_1480, _1490, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1498 = fma(_1482, _1300, _1492);
    float _1500 = fma(_1496, _1494, _1498);
    float _1502 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1500);
    out.m_59.x = _1502;
    bool _1504 = !_1290;
    float _1522;
    if (!_1504)
    {
        float _1506 = in.m_53.x;
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1510 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[14].y, _138);
        float _1514 = _1512 * _1508;
        float _1516 = floor(_1514);
        float _1518 = -_1516;
        float _1520 = _1514 + _1518;
        _1522 = _1520;
        _1524 = true;
    }
    else
    {
        float _1526 = float(_104);
        float _1528 = 1.0 / _1526;
        float _1530 = _138 * _1528;
        _1522 = _1530;
    }
    _1524 = false;
    float _1532 = _1522;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1536 = _1532 + _1534;
    bool _1538 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1540 = isnan(_1532);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1554 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1556 = isnan(_1532);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1566;
    bool _1570 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1572 = isnan(_1532);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = -_1548;
    float _1584 = _1582 + 1.0;
    float _1586 = 1.0 / _1552;
    bool _1588 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1590 = isnan(_1532);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -_1580;
    float _1602 = _1600 + 1.0;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1608 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1610 = 1.0 / _1606;
    float _1612 = _1568 * _1586;
    float _1614 = -_1564;
    float _1616 = _1614 + 1.0;
    float _1618 = _1564 * _1584;
    bool _1620 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1622 = isnan(_1532);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1628 = _1624 || _1626;
    float _1630 = float(_1628);
    float _1632 = fma(_1612, _1536, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1634 = _1580 * _1616;
    float _1636 = _1598 * _1602;
    float _1638 = -_1598;
    float _1640 = _1638 + 1.0;
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1644 = _1642 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1646 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1648 = isnan(_1532);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1654 = _1650 || _1652;
    float _1656 = float(_1654);
    float _1658 = _1630 * _1640;
    float _1660 = -_1630;
    float _1662 = _1660 + 1.0;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1666 = _1664 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1668 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1670 = isnan(_1532);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = 1.0 / _1644;
    float _1682 = _1656 * _1662;
    float _1684 = -_1656;
    float _1686 = _1684 + 1.0;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1692 = _1678 * _1686;
    float _1694 = 1.0 / _1666;
    float _1696 = _1690 * _1610;
    float _1698 = -_1678;
    float _1700 = _1698 + 1.0;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1704 = _1702 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1706;
    float _1710 = 1.0 / _1704;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1716 = _1632 * _1692;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1720 = _1532 + _1718;
    float _1722 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1716);
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1728 = 1.0 / _1714;
    float _1730 = fma(_1696, _1720, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1732 = _1708 * _1694;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1736 = _1532 + _1734;
    float _1738 = fma(_1730, _1682, _1722);
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1742 = _1532 + _1740;
    float _1744 = fma(_1732, _1736, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1746 = 1.0 / _1726;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1752;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1760 = _1750 * _1680;
    float _1762 = fma(_1744, _1658, _1738);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1766 = _1532 + _1764;
    float _1768 = _1754 * _1728;
    float _1770 = fma(_1760, _1742, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1772;
    bool _1776 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1778 = isnan(_1532);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1758 * _1710;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1792 = _1532 + _1790;
    float _1794 = fma(_1768, _1766, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1796 = fma(_1770, _1636, _1762);
    float _1798 = _1774 * _1746;
    float _1800 = fma(_1788, _1792, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1802 = -_1786;
    float _1804 = _1802 + 1.0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1808 = _1532 + _1806;
    float _1810 = fma(_1794, _1634, _1796);
    float _1812 = _1548 * _1804;
    float _1814 = fma(_1798, _1808, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1816 = fma(_1800, _1618, _1810);
    float _1818 = fma(_1814, _1812, _1816);
    float _1820 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1818);
    out.m_61.x = _1820;
    bool _1822 = !_1608;
    float _1840;
    if (!_1822)
    {
        float _1824 = in.m_53.x;
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1828 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[14].z, _138);
        float _1832 = _1830 * _1826;
        float _1834 = floor(_1832);
        float _1836 = -_1834;
        float _1838 = _1832 + _1836;
        _1840 = _1838;
        _1842 = true;
    }
    else
    {
        float _1844 = float(_104);
        float _1846 = 1.0 / _1844;
        float _1848 = _138 * _1846;
        _1840 = _1848;
    }
    _1842 = false;
    float _1850 = _1840;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1854 = _1850 + _1852;
    bool _1856 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1858 = isnan(_1850);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1872 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1874 = isnan(_1850);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1880 = _1876 || _1878;
    float _1882 = float(_1880);
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1884;
    bool _1888 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1890 = isnan(_1850);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1896 = _1892 || _1894;
    float _1898 = float(_1896);
    float _1900 = -_1866;
    float _1902 = _1900 + 1.0;
    float _1904 = 1.0 / _1870;
    bool _1906 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1908 = isnan(_1850);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1914 = _1910 || _1912;
    float _1916 = float(_1914);
    float _1918 = -_1898;
    float _1920 = _1918 + 1.0;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1926 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1928 = 1.0 / _1924;
    float _1930 = _1886 * _1904;
    float _1932 = -_1882;
    float _1934 = _1932 + 1.0;
    float _1936 = _1882 * _1902;
    bool _1938 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1940 = isnan(_1850);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1946 = _1942 || _1944;
    float _1948 = float(_1946);
    float _1950 = fma(_1930, _1854, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1952 = _1898 * _1934;
    float _1954 = _1916 * _1920;
    float _1956 = -_1916;
    float _1958 = _1956 + 1.0;
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1962 = _1960 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1964 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1966 = isnan(_1850);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1972 = _1968 || _1970;
    float _1974 = float(_1972);
    float _1976 = _1948 * _1958;
    float _1978 = -_1948;
    float _1980 = _1978 + 1.0;
    float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1986 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1988 = isnan(_1850);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1994 = _1990 || _1992;
    float _1996 = float(_1994);
    float _1998 = 1.0 / _1962;
    float _2000 = _1974 * _1980;
    float _2002 = -_1974;
    float _2004 = _2002 + 1.0;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2010 = _1996 * _2004;
    float _2012 = 1.0 / _1984;
    float _2014 = _2008 * _1928;
    float _2016 = -_1996;
    float _2018 = _2016 + 1.0;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2024;
    float _2028 = 1.0 / _2022;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2034 = _1950 * _2010;
    float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2038 = _1850 + _2036;
    float _2040 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2034);
    float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2044 = _2042 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2046 = 1.0 / _2032;
    float _2048 = fma(_2014, _2038, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2050 = _2026 * _2012;
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2054 = _1850 + _2052;
    float _2056 = fma(_2048, _2000, _2040);
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2060 = _1850 + _2058;
    float _2062 = fma(_2050, _2054, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2064 = 1.0 / _2044;
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2068 = _2066 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2070;
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2076 = _2074 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2078 = _2068 * _1998;
    float _2080 = fma(_2062, _1976, _2056);
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2084 = _1850 + _2082;
    float _2086 = _2072 * _2046;
    float _2088 = fma(_2078, _2060, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _2090;
    bool _2094 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2096 = isnan(_1850);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2102 = _2098 || _2100;
    float _2104 = float(_2102);
    float _2106 = _2076 * _2028;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2110 = _1850 + _2108;
    float _2112 = fma(_2086, _2084, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2114 = fma(_2088, _1954, _2080);
    float _2116 = _2092 * _2064;
    float _2118 = fma(_2106, _2110, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2120 = -_2104;
    float _2122 = _2120 + 1.0;
    float _2124 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2126 = _1850 + _2124;
    float _2128 = fma(_2112, _1952, _2114);
    float _2130 = _1866 * _2122;
    float _2132 = fma(_2116, _2126, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2134 = fma(_2118, _1936, _2128);
    float _2136 = fma(_2132, _2130, _2134);
    float _2138 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2136);
    out.m_63.x = _2138;
    bool _2140 = !_1926;
    float _2142 = _1952;
    float _2144 = _2130;
    float _2146 = _2132;
    int _2164;
    float _2166;
    if (!_2140)
    {
        float _2148 = in.m_53.x;
        float _2150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _2152 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _2154 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[14].w, _138);
        float _2156 = _2154 * _2150;
        float _2158 = floor(_2156);
        float _2160 = -_2158;
        float _2162 = _2156 + _2160;
        _2164 = as_type<int>(_2156);
        _2166 = _2162;
        _2168 = true;
    }
    else
    {
        float _2170 = float(_104);
        float _2172 = 1.0 / _2170;
        float _2174 = _138 * _2172;
        _2164 = as_type<int>(_2172);
        _2166 = _2174;
    }
    _2168 = false;
    int _2176 = _2164;
    float _2178 = _2166;
    float _2180 = in.m_53.y;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2184 = _2182 != 0;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    float _2192 = 0.0;
    int _2194 = _2176;
    if (_2184)
    {
        float _2196 = in.m_53.x;
        _2192 = _2196;
    }
    float _2198 = _2192;
    float _2200 = 0.0;
    if (_2184)
    {
        float _2202 = in.m_53.z;
        _2200 = _2202;
    }
    float _2204 = _2200;
    float _2206 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2208 = as_type<int>(_2206);
    if (_2184)
    {
        _2142 = _2180;
    }
    float _2210 = _2142;
    float _2212 = fma(_2206, -2.0, _2186);
    float _2214 = _2210;
    if (_2184)
    {
        _2208 = 0;
        _2194 = 0;
    }
    int _2216 = _2208;
    int _2218 = _2194;
    int _2220 = _2216;
    int _2222 = _2218;
    float _2224 = _2198;
    if (_2184)
    {
        _2144 = _2198;
    }
    float _2226 = _2144;
    float _2228 = _2226;
    float _2230 = _2204;
    if (_2184)
    {
        _2146 = _2204;
    }
    float _2232 = _2146;
    float _2234 = _2232;
    if (!_2184)
    {
        float _2236 = in.m_53.x;
        float _2238 = _2180 * 3.1415927410125732421875;
        float _2240 = in.m_53.z;
        float _2242 = _2238 * 0.15915493667125701904296875;
        float _2244 = _2242 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = _2236 * 3.1415927410125732421875;
        float _2250 = _2248 * 0.15915493667125701904296875;
        float _2252 = _2240 * 3.1415927410125732421875;
        float _2254 = _2252 * 0.15915493667125701904296875;
        float _2256 = _2250 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        float _2260 = _2254 * 6.283185482025146484375;
        float _2262 = sin(_2260);
        _2220 = 2;
        _2234 = _2262;
        _2222 = 1;
        _2224 = _2236;
        _2214 = _2246;
        _2228 = _2258;
        _2230 = _2240;
    }
    int _2264 = _2220;
    float _2266 = _2234;
    int _2268 = _2222;
    float _2270 = _2224;
    float _2272 = _2214;
    float _2274 = _2228;
    float _2276 = _2230;
    bool _2278 = _2264 != 2;
    float _2280 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[94].z, _2190);
    bool _2282 = _2268 != 1;
    float _2284 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2286 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2288 = -_2188;
    float _2290 = fma(_2284, 2.0, _2288);
    float _2292 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2298 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2294);
    float _2300 = as_type<float>(_2264);
    float _2302 = as_type<float>(_2268);
    float _2304 = _2272;
    if (_2278)
    {
        _2300 = _2270;
    }
    float _2306 = _2300;
    float _2308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2310 = log2(_2308);
    float _2312 = _2306;
    if (!_2278)
    {
        _2312 = _2276;
    }
    float _2314 = _2312;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    if (!_2282)
    {
        _2302 = _2180;
    }
    float _2318 = _2302;
    float _2320 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2296);
    float _2322 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2324 = _2318;
    float _2326 = _2322;
    if (!_2282)
    {
        _2304 = _2318;
    }
    float _2328 = _2304;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2332 = _2328;
    float _2334 = _2330;
    if (_2282)
    {
        _2324 = _2270;
    }
    float _2336 = _2324;
    float _2338 = -_2316;
    float _2340 = fma(_2292, 2.0, _2338);
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2344 = fma(_2336, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2330);
    float _2346 = _2336;
    if (!_2282)
    {
        _2346 = _2276;
    }
    float _2348 = _2346;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2352 = _2348;
    if (_2282)
    {
        _2352 = _2180;
    }
    float _2354 = _2352;
    float _2356 = _2310 * _138;
    if (_2282)
    {
        _2332 = _2270;
    }
    float _2358 = _2332;
    float _2360 = -_2342;
    float _2362 = fma(_2322, 2.0, _2360);
    if (!_2282)
    {
        _2326 = _2276;
    }
    float _2364 = _2326;
    float _2366 = fma(_2354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2350);
    float _2368 = exp2(_2356);
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2372 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2374 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2376 = 1.0 + _2374;
    float _2378 = _2364;
    if (_2282)
    {
        _2378 = _2180;
    }
    float _2380 = _2378;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (_2278)
    {
        _2334 = _2180;
    }
    float _2384 = _2334;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2390 = _2384;
    if (!_2278)
    {
        _2390 = _2270;
    }
    float _2392 = _2390;
    float _2394 = -_2370;
    float _2396 = fma(_2372, 2.0, _2394);
    float _2398 = 1.0 / _2376;
    float _2400 = fma(_2286, -2.0, _2382);
    float _2402 = fma(_2388, -2.0, _2386);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2406 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2414 = _2412 != 0;
    float _2416 = fma(_2180, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2404);
    bool _2418 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2420 = isnan(1.0);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2426 = _2422 || _2424;
    float _2428 = fma(_2180, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2408);
    float _2430 = -_2368;
    float _2432 = _2430 + 1.0;
    float _2434 = fma(_2406, -2.0, _2410);
    bool _2436 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2438 = isnan(0.0);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2444 = _2440 || _2442;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2450 = _2180 * 2.0;
    float _2452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _2454 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2416);
    float _2456 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2428);
    float _2458 = _2444 ? _2432 : 0.0;
    float _2460 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2446);
    float _2462 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2448);
    float _2464 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2320);
    float _2466 = -_138;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2340);
    float _2470 = floor(_2450);
    float _2472 = in.m_65.x;
    float _2474 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2400);
    float _2476 = -_138;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2362);
    float _2480 = _138 * 0.00999999977648258209228515625;
    float _2482 = 0.0;
    if (_2414)
    {
        float _2484 = in.m_53.x;
        _2482 = _2484;
    }
    float _2486 = _2482;
    float _2488 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2212);
    float _2490 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2492 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2462);
    float _2494 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[94].x, _2280);
    float _2496 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2298);
    float _2498 = -_138;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2290);
    float _2502 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2344);
    float _2504 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2366);
    float _2506 = -_138;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2396);
    float _2510 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2402);
    float _2512 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2434);
    if (_2426)
    {
        float _2514 = _2458 * _2398;
        _142 = _2514;
    }
    float _2516 = _142;
    float _2518 = _2276 * 2.0;
    float _2520 = _2270 * 2.0;
    float _2522 = in.m_53.w;
    float _2524 = _2516 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _2526 = floor(_2518);
    bool _2528 = _2470 > 0.0;
    float _2530 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2532 = _2524 * _2452;
    bool _2534 = _2470 >= 0.0;
    bool _2536 = isnan(_2470);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = _278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2546 = in.m_65.y;
    float _2548 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[203].z, _2532);
    float _2550 = floor(_2520);
    int _2552 = as_type<int>(_2518);
    float _2554 = _2472;
    if (_2414)
    {
        float _2556 = -_2472;
        float _2558 = _2556 + 1.0;
        _2552 = as_type<int>(_2558);
    }
    int _2560 = _2552;
    bool _2562 = false;
    if (_2414)
    {
        bool _2564 = _2486 > 0.5;
        _2562 = _2564;
    }
    bool _2566 = _2562;
    float _2568 = _2548 + 0.25;
    float _2570 = 0.0;
    if (!_2414)
    {
        _2570 = _2472;
    }
    float _2572 = _2570;
    float _2574 = _278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2576 = _2572;
    if (_2414)
    {
        float _2578 = _2566 ? as_type<float>(_2560) : _2472;
        _2576 = _2578;
    }
    float _2580 = _2576;
    float _2582 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2544);
    float _2584 = floor(_2548);
    bool _2586 = _2526 > 0.0;
    float _2588 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2574);
    bool _2590 = _2526 >= 0.0;
    bool _2592 = isnan(_2526);
    bool _2594 = _2590 || _2592;
    bool _2596 = isnan(0.0);
    bool _2598 = _2594 || _2596;
    float _2600 = _2270 * 78.233001708984375;
    int _2602 = _2542 ? 0 : 1;
    float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2606 = _2178 + _2604;
    bool _2608 = _2522 > 0.5;
    float _2610 = floor(_2568);
    bool _2612 = _2550 > 0.0;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2616 = _2178 + _2614;
    bool _2618 = _2550 >= 0.0;
    bool _2620 = isnan(_2550);
    bool _2622 = _2618 || _2620;
    bool _2624 = isnan(0.0);
    bool _2626 = _2622 || _2624;
    float _2628 = _2180 + _2276;
    int _2630 = _2598 ? 0 : 1;
    float _2632 = -_2546;
    float _2634 = _2632 + 1.0;
    int _2636 = ~_2602;
    int _2638 = _2636 + 1;
    int _2640 = _2638 + 1;
    float _2642 = -_2584;
    float _2644 = _2548 + _2642;
    int _2646 = _2626 ? 0 : 1;
    float _2648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _2652 = _2650 != 0;
    int _2654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _2656 = _2654 != 0;
    int _2658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _2660 = _2658 != 0;
    float _2662 = _2628 + (-1.0);
    int _2664 = _2640;
    if (!_2528)
    {
        int _2666 = ~_2602;
        int _2668 = _2666 + 1;
        _2664 = _2668;
    }
    int _2670 = _2664;
    float _2672 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2674 = ~_2630;
    int _2676 = _2674 + 1;
    int _2678 = _2676 + 1;
    float _2680 = -_2610;
    float _2682 = _2568 + _2680;
    int _2684 = _2678;
    float _2686 = _2682;
    if (!_2586)
    {
        int _2688 = ~_2630;
        int _2690 = _2688 + 1;
        _2684 = _2690;
    }
    int _2692 = _2684;
    float _2694 = _278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2696 = _2644 >= 0.5;
    bool _2698 = isnan(_2644);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan(0.5);
    bool _2704 = _2700 || _2702;
    float _2706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2708 = _2180 > 0.5;
    float _2710 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2694);
    int _2712 = ~_2646;
    int _2714 = _2712 + 1;
    int _2716 = _2714 + 1;
    float _2718 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2710);
    int _2720 = _2716;
    if (!_2612)
    {
        int _2722 = ~_2646;
        int _2724 = _2722 + 1;
        _2720 = _2724;
    }
    int _2726 = _2720;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[191].z * 0.4799999892711639404296875;
    int _2730 = _2608 ? as_type<int>(_2634) : as_type<int>(_2546);
    float _2732 = _2718 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2736 = _2734 != 0;
    int _2738 = _2708 ? as_type<int>(_2634) : as_type<int>(_2546);
    float _2740 = 1.0 / _2728;
    float _2742 = _2736 ? as_type<float>(_2738) : _2546;
    int _2744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2746 = _2744 != 0;
    float _2748 = _2746 ? as_type<float>(_2730) : _2546;
    bool _2750 = _2682 > 0.5;
    bool _2752 = !_2660;
    int _2754 = _2752 ? 0 : 1;
    float _2756 = _2530 * _2740;
    int _2758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2760 = _2758 != 0;
    int _2762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2764 = _2762 != 0;
    int _2766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2768 = _2766 != 0;
    float _2770 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _2774 = !_2704;
    float _2776 = _2774 ? 0.5 : (-0.5);
    float _2778 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2582);
    int _2780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2782 = _2780 != 0;
    float _2784 = floor(_2756);
    bool _2786 = _2764;
    float _2788 = _2732;
    float _2790 = 0.5;
    if (_2750)
    {
        float _2792 = -_2682;
        float _2794 = _2792 + 1.0;
        _2686 = _2794;
    }
    float _2796 = _2686;
    bool _2798 = !_2652;
    int _2800 = _2798 ? 0 : 1;
    float _2802 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2588);
    bool _2804 = !_2656;
    int _2806 = _2804 ? 0 : 1;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2810 = _2808 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _2812 = !_2760;
    int _2814 = _2812 ? 0 : 1;
    float _2816 = 1.0 / _2772;
    int _2818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2820 = _2818 != 0;
    float _2822 = _2778 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2826 = _2824 != 0;
    float _2828 = _276;
    if (_2782)
    {
        float _2830 = in.m_53.z;
        _2828 = _2830;
    }
    float _2832 = _2828;
    int _2834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2836 = _2834 != 0;
    float _2838 = _2802 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2842 = _2840 != 0;
    float _2844 = 1.0 / _2810;
    float _2846 = fma(_2784, 12.98980045318603515625, _2600);
    float _2848 = fma(_2796, 4.0, -1.0);
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2852 = _2850 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2854 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _2856 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _2854;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2860 = _2858 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2864 = _2862 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    float _2866 = _2856 * _2816;
    float _2868 = 1.0 / _2852;
    float _2870 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _2872 = _2870 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2876 = _2874 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _2880 = _2878 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2882 = _2872 * _2844;
    float _2884 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2886 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _2884;
    float _2888 = 1.0 / _2864;
    float _2890 = _2846 * 0.15915493667125701904296875;
    float _2892 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2894 = _2892 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _2896 = !_2764;
    int _2898 = _2896 ? 0 : 1;
    float _2900 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2902 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2906 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _2904;
    if (_2782)
    {
        bool _2908 = _2832 > 0.5;
        _2786 = _2908;
    }
    bool _2910 = _2786;
    float _2912 = 1.0 / _2860;
    float _2914 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2916 = _2178 + _2914;
    float _2918 = _2902 * _2868;
    float _2920 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2922 = _2178 + _2920;
    int _2924 = abs(_2814);
    float _2926 = fma(_2882, _2916, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2930 = _2822 + _2928;
    float _2932 = fma(_2866, _2922, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    float _2934 = 1.0 / _2876;
    float _2936 = _2906 * _2888;
    float _2938 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2940 = _2178 + _2938;
    float _2942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2944 = _2732 + _2942;
    float _2946 = fma(_2918, _2606, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _2948 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2950 = in.m_67.w;
    float _2952 = float(_2924);
    float _2954 = _2890 * 6.283185482025146484375;
    float _2956 = sin(_2954);
    float _2958 = _2886 * _2912;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2962 = _2838 + _2960;
    float _2964 = fma(_2948, _2742, -0.5);
    float _2966 = _2706 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2968 = fma(_2958, _2940, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _2970 = _2930 * _2930;
    float _2972 = 1.0 / _2894;
    float _2974 = _2880 * _2934;
    float _2976 = fma(_2944, _2944, _2970);
    float _2978 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _2980 = _2978 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2982 = in.m_67.x;
    float _2984 = fma(_2974, _2616, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _2986 = fma(_2962, _2962, _2976);
    float _2988 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2990 = _2178 + _2988;
    float _2992 = _2956 * 43758.546875;
    float _2994 = fma(_2966, _2748, -0.5);
    float _2996 = rsqrt(_2986);
    float _2998 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3000 = _2178 + _2998;
    float _3002 = -_2488;
    float _3004 = fma(_2454, _2964, _3002);
    float _3006 = _2180 + _2270;
    float _3008 = fma(_2936, _3000, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3010 = _2980 * _2972;
    float _3012 = _2270 + _2276;
    float _3014 = floor(_2992);
    float _3016 = _3006 + (-1.0);
    float _3018 = fma(_3010, _2990, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    float _3020 = _3012 + (-1.0);
    float _3022 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3024 = _2548 * 6.283185482025146484375;
    float _3026 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3028 = fma(_3020, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3030 = _2962 * _2996;
    float _3032 = _3024 * 0.15915493667125701904296875;
    float _3034 = _2270 + (-0.5);
    bool _3036 = !_2768;
    int _3038 = _3036 ? 0 : 1;
    float _3040 = -_3030;
    float _3042 = fma(_3040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2962);
    out.m_69.w = _2950;
    float _3044 = -_3014;
    float _3046 = _2992 + _3044;
    float _3048 = _2930 * _2996;
    float _3050 = _2944 * _2996;
    float _3052 = _3032 * 6.283185482025146484375;
    float _3054 = sin(_3052);
    float _3056 = _3046 + _2982;
    float _3058 = -_3048;
    float _3060 = fma(_3058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2930);
    float _3062 = -_3050;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2944);
    float _3066 = _2848 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _3068 = _3056 * 6.283185482025146484375;
    float _3070 = _3060 * _3060;
    bool _3072 = _2180 > 0.5;
    float _3074 = fma(_3068, (*spvDescriptorSet0.vp_c9)._m0[191].y, 1.57079637050628662109375);
    float _3076 = fma(_3064, _3064, _3070);
    int _3078 = abs(_2898);
    float _3080 = in.m_71.x;
    float _3082 = in.m_71.y;
    float _3084 = in.m_71.z;
    float _3086 = float(_2692);
    float _3088 = _3074 * 0.15915493667125701904296875;
    float _3090 = float(_2726);
    float _3092 = fma(_3042, _3042, _3076);
    float _3094 = _2952 * _3086;
    float _3096 = _3088 * 6.283185482025146484375;
    float _3098 = cos(_3096);
    float _3100 = float(_3078);
    float _3102 = _3094 * (-2.0);
    float _3104 = (*spvDescriptorSet0.vp_c9)._m0[191].x + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _3106 = abs(_2806);
    float _3108 = _3100 * _3090;
    int _3110 = abs(_2800);
    float _3112 = 1.0 / _3104;
    int _3114 = as_type<int>(_3100);
    if (_2826)
    {
        float _3116 = -_2472;
        float _3118 = _3116 + 1.0;
        _3114 = as_type<int>(_3118);
    }
    int _3120 = _3114;
    float _3122 = fma(_3102, _3080, _3080);
    float _3124 = _3054 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _3126 = fma(_3022, _3102, _3022);
    float _3128 = _3108 * (-2.0);
    float _3130 = fma(_3034, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3122);
    float _3132 = _2950 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _3134 = abs(_3038);
    float _3136 = fma(_3128, _3082, _3082);
    float _3138 = float(_3106);
    float _3140 = _2776 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _3142 = _3140 * 2.0;
    float _3144 = fma(_3098, _3132, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _3146 = _2530 * 0.15915493667125701904296875;
    float _3148 = _3138 * _3142;
    float _3150 = float(_3110);
    float _3152 = _3144 * _3112;
    float _3154 = float(_2670);
    float _3156 = _2180 + (-0.5);
    int _3158 = abs(_2754);
    float _3160 = fma(_3150, _3124, _3148);
    float _3162 = _3146 * 6.283185482025146484375;
    float _3164 = cos(_3162);
    float _3166 = in.m_73.x;
    float _3168 = in.m_73.y;
    float _3170 = in.m_73.z;
    float _3172 = float(_3158);
    float _3174 = _3152 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _3176 = fma(_3156, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3136);
    float _3178 = fma(_3026, _3128, _3026);
    float _3180 = _2276 + (-0.5);
    float _3182 = fma(_3172, _3066, _3160);
    float _3184 = precise::max(0.0, _3174);
    float _3186 = sqrt(_3092);
    float _3188 = float(_3134);
    float _3190 = fma(_3182, 3.1415927410125732421875, _3084);
    float _3192 = precise::min(_3184, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _3194 = fma(_3126, _2516, _3130);
    float _3196 = fma(_3178, _2516, _3176);
    float _3198 = _3188 * _3154;
    float _3200 = fma(_3164, 0.5, 0.5);
    float _3202 = _3194 * 0.15915493667125701904296875;
    float _3204 = _3196 * 0.15915493667125701904296875;
    float _3206 = _3198 * (-2.0);
    float _3208 = fma(_3192, _3200, 1.0);
    float _3210 = _3202 * 6.283185482025146484375;
    float _3212 = sin(_3210);
    bool _3214 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3216 = isnan(_2178);
    bool _3218 = _3214 || _3216;
    bool _3220 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3222 = _3218 || _3220;
    float _3224 = float(_3222);
    float _3226 = fma(_3190, _3206, _3190);
    float _3228 = fma(_3028, _3206, _3028);
    float _3230 = _3208 * _3166;
    float _3232 = _2996 * _3186;
    float _3234 = fma(_3180, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3226);
    float _3236 = _3208 * _3170;
    float _3238 = _3202 * 6.283185482025146484375;
    float _3240 = cos(_3238);
    float _3242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3230);
    float _3244 = fma(_3228, _2516, _3234);
    float _3246 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3248 = _2672 * _3232;
    bool _3250 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3252 = isnan(_2178);
    bool _3254 = _3250 || _3252;
    bool _3256 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3258 = _3254 || _3256;
    float _3260 = float(_3258);
    float _3262 = _3244 * 0.15915493667125701904296875;
    float _3264 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3266 = _3204 * 6.283185482025146484375;
    float _3268 = sin(_3266);
    float _3270 = _3208 * _3168;
    float _3272 = _3246 * _3232;
    float _3274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3236);
    float _3276 = _3248 * _3242;
    float _3278 = _3264 * _3232;
    float _3280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3270);
    float _3282 = _3272 * _3274;
    float _3284 = _3204 * 6.283185482025146484375;
    float _3286 = cos(_3284);
    bool _3288 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3290 = isnan(_2178);
    bool _3292 = _3288 || _3290;
    bool _3294 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3296 = _3292 || _3294;
    float _3298 = float(_3296);
    float _3300 = _3278 * _3280;
    bool _3302 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3304 = isnan(_2178);
    bool _3306 = _3302 || _3304;
    bool _3308 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3310 = _3306 || _3308;
    float _3312 = float(_3310);
    bool _3314 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3316 = isnan(_2178);
    bool _3318 = _3314 || _3316;
    bool _3320 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3322 = _3318 || _3320;
    float _3324 = float(_3322);
    float _3326 = -_3298;
    float _3328 = _3326 + 1.0;
    bool _3330 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3332 = isnan(_2178);
    bool _3334 = _3330 || _3332;
    bool _3336 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3338 = _3334 || _3336;
    float _3340 = float(_3338);
    float _3342 = _3262 * 6.283185482025146484375;
    float _3344 = sin(_3342);
    float _3346 = _3240 * _3268;
    float _3348 = _3212 * _3268;
    float _3350 = -_3312;
    float _3352 = _3350 + 1.0;
    float _3354 = _3324 * _3328;
    bool _3356 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3358 = isnan(_2178);
    bool _3360 = _3356 || _3358;
    bool _3362 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3364 = _3360 || _3362;
    float _3366 = float(_3364);
    float _3368 = -_3340;
    float _3370 = _3368 + 1.0;
    float _3372 = _3262 * 6.283185482025146484375;
    float _3374 = cos(_3372);
    float _3376 = _3212 * _3286;
    float _3378 = _3240 * _3286;
    float _3380 = _3366 * _3370;
    float _3382 = -_3366;
    float _3384 = _3382 + 1.0;
    float _3386 = -_3346;
    float _3388 = fma(_3344, _3376, _3386);
    float _3390 = fma(_3344, _3378, _3348);
    float _3392 = -_3376;
    float _3394 = fma(_3344, _3346, _3392);
    float _3396 = fma(_3344, _3348, _3378);
    float _3398 = -_3324;
    float _3400 = _3398 + 1.0;
    float _3402 = -_3224;
    float _3404 = _3402 + 1.0;
    float _3406 = _3224 * _3352;
    float _3408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3410 = _3374 * _3282;
    float _3412 = _3286 * _3374;
    float _3414 = -_3282;
    float _3416 = _3344 * _3414;
    bool _3418 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3420 = isnan(_2178);
    bool _3422 = _3418 || _3420;
    bool _3424 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3426 = _3422 || _3424;
    float _3428 = float(_3426);
    float _3430 = _3260 * _3404;
    float _3432 = _3240 * _3410;
    float _3434 = -_3260;
    float _3436 = _3434 + 1.0;
    float _3438 = _3212 * _3410;
    float _3440 = _3268 * _3374;
    float _3442 = fma(_3390, _3276, _3432);
    float _3444 = _3428 * _3436;
    float _3446 = fma(_3412, _3276, _3416);
    float _3448 = fma(_3388, _3276, _3438);
    float _3450 = -_3300;
    float _3452 = fma(_3394, _3450, _3442);
    float _3454 = _2932 * _3444;
    float _3456 = -_3300;
    float _3458 = fma(_3440, _3456, _3446);
    float _3460 = -_3300;
    float _3462 = fma(_3396, _3460, _3448);
    float _3464 = _3452 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _3466 = _3452 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _3468 = as_type<int>(_3276);
    float _3470 = _3390;
    int _3472 = as_type<int>(_3394);
    float _3474 = _3396;
    if (_2782)
    {
        float _3476 = -_2472;
        float _3478 = _3476 + 1.0;
        _3468 = as_type<int>(_3478);
    }
    int _3480 = _3468;
    if (!_2782)
    {
        _3470 = _2472;
    }
    float _3482 = _3470;
    float _3484 = fma(_3458, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3464);
    float _3486 = fma(_3458, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3466);
    float _3488 = _3482;
    if (_2820)
    {
        float _3490 = -_2472;
        float _3492 = _3490 + 1.0;
        _3472 = as_type<int>(_3492);
    }
    int _3494 = _3472;
    if (_2782)
    {
        float _3496 = _2910 ? as_type<float>(_3480) : _2472;
        _3488 = _3496;
    }
    float _3498 = _3488;
    float _3500 = fma(_3462, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3484);
    float _3502 = fma(_3462, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3486);
    float _3504 = _3298 * _3384;
    float _3506 = -_3428;
    float _3508 = _3506 + 1.0;
    float _3510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3512 = _2732 + _3500;
    float _3514 = _2838 + _3502;
    float _3516 = _3504;
    float _3518 = _3514;
    float _3520 = _3512;
    if (!_2820)
    {
        _3474 = _2472;
    }
    float _3522 = _3474;
    float _3524 = _2494 * (-0.15915493667125701904296875);
    float _3526 = _3522;
    if (_2820)
    {
        float _3528 = _3072 ? as_type<float>(_3494) : _2472;
        _3526 = _3528;
    }
    float _3530 = _3526;
    float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3534 = _3512 + _3532;
    float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3538 = _3514 + _3536;
    float _3540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _3542 = _2276 > 0.5;
    float _3544 = _3534 * _3534;
    float _3546 = _3538 * _3538;
    float _3548 = fma(_3508, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3454);
    float _3550 = _3408 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3552 = _3312 * _3400;
    float _3554 = _3544 + _3546;
    float _3556 = _3510 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3560 = _3544;
    float _3562 = _3546;
    if (_2826)
    {
        float _3564 = _3072 ? as_type<float>(_3120) : _2472;
        _2554 = _3564;
    }
    float _3566 = _2554;
    float _3568 = fma(_2926, _3430, _3548);
    float _3570 = fma(_3556, _3498, -0.5);
    int _3572 = _3542 ? as_type<int>(_2634) : as_type<int>(_2546);
    float _3574 = _3452 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3576 = fma(_2968, _3406, _3568);
    float _3578 = _3540 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3580 = sqrt(_3554);
    float _3582 = _2836 ? as_type<float>(_3572) : _2546;
    float _3584 = fma(_3458, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3574);
    float _3586 = fma(_3578, _3566, -0.5);
    float _3588 = _2842 ? as_type<float>(_3572) : _2546;
    float _3590 = in.m_67.y;
    float _3592 = fma(_2984, _3552, _3576);
    float _3594 = fma(_3462, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3584);
    float _3596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3598 = _3558 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3600 = fma(_2946, _3354, _3592);
    float _3602 = _2822 + _3594;
    float _3604 = fma(_3550, _2580, -0.5);
    float _3606 = fma(_3598, _3588, -0.5);
    float _3608 = fma(_3018, _3504, _3600);
    float _3610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3612 = _3580 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3614 = fma(_2490, _3604, _2500);
    float _3616 = _3524 * 6.283185482025146484375;
    float _3618 = sin(_3616);
    float _3620 = _3596 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3622 = fma(_3620, _3530, -0.5);
    if (!_3612)
    {
        _3516 = _3602;
    }
    float _3624 = _3516;
    float _3626 = _3524 * 6.283185482025146484375;
    float _3628 = cos(_3626);
    float _3630 = _3610 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3632 = fma(_3630, _3582, -0.5);
    float _3634 = _3618 * _3606;
    float _3636 = _3628 * _3606;
    float _3638 = -_3634;
    float _3640 = fma(_3628, _3586, _3638);
    float _3642 = fma(_3618, _3586, _3636);
    bool _3644 = !_3612;
    float _3646 = _3624;
    if (!_3644)
    {
        float _3648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3652 = _3580 + _3650;
        float _3654 = _3602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3656 = rsqrt(_3554);
        float _3658 = _3652 * _3648;
        float _3660 = _3658 * 0.15915493667125701904296875;
        float _3662 = _3660 * 6.283185482025146484375;
        float _3664 = sin(_3662);
        float _3666 = _3660 * 6.283185482025146484375;
        float _3668 = cos(_3666);
        float _3670 = fma(_3664, _3654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3672 = _3656 * _3670;
        float _3674 = _3668 + (-1.0);
        float _3676 = fma(_3534, _3672, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3678 = fma(_3538, _3672, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3680 = _3674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3684 = _3676 + _3682;
        float _3686 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3688 = _3678 + _3686;
        float _3690 = fma(_3602, _3668, _3680);
        float _3692 = _3684 * _3684;
        float _3694 = _3688 * _3688;
        _3646 = _3690;
        _3560 = _3692;
        _3562 = _3694;
        _3518 = _3678;
        _3520 = _3676;
    }
    float _3696 = _3646;
    float _3698 = _3560;
    float _3700 = _3562;
    float _3702 = _3518;
    float _3704 = _3520;
    float _3706 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3708 = _3696 + _3706;
    float _3710 = fma(_2492, _3622, _2478);
    float _3712 = -_2474;
    float _3714 = fma(_2464, _3642, _3712);
    float _3716 = fma(_3008, _3380, _3608);
    float _3718 = fma(_3708, _3708, _3698);
    float _3720 = fma(_2496, _3640, _2468);
    float _3722 = fma(_2502, _3570, _2508);
    float _3724 = -_2510;
    float _3726 = fma(_2504, _2994, _3724);
    float _3728 = _3718 + _3700;
    float _3730 = -_2512;
    float _3732 = fma(_2456, _3632, _3730);
    float _3734 = _3710 + 0.5;
    float _3736 = _3714 + 0.5;
    float _3738 = fma(_3340, (*spvDescriptorSet0.vp_c9)._m0[190].x, _3716);
    float _3740 = _3004 + 0.5;
    float _3742 = sqrt(_3728);
    float _3744 = _3614 + 0.5;
    float _3746 = _3720 + 0.5;
    float _3748 = _3722 + 0.5;
    float _3750 = _3726 + 0.5;
    float _3752 = _3732 + 0.5;
    out.m_69.y = _3590;
    out.m_75.x = _3746;
    out.m_75.y = _3736;
    out.m_77.x = _3738;
    bool _3754 = _3742 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3756 = isnan(_3742);
    bool _3758 = _3754 || _3756;
    bool _3760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3762 = _3758 || _3760;
    out.m_79.x = _3744;
    out.m_79.y = _3740;
    out.m_79.z = _3748;
    out.m_79.w = _3750;
    out.m_81.x = _3734;
    out.m_81.y = _3752;
    float _3764 = _3716;
    float _3766 = _3750;
    if (!_3762)
    {
        _3764 = 1.0;
    }
    float _3768 = _3764;
    bool _3770 = !_3762;
    float _3772 = _3768;
    if (!_3770)
    {
        bool _3774 = _3742 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3776 = isnan(_3742);
        bool _3778 = _3774 || _3776;
        bool _3780 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3782 = _3778 || _3780;
        if (!_3782)
        {
            float _3784 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3786 = _3742 + _3784;
            float _3788 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3790 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3788;
            float _3792 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3794 = _3792 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3796 = 1.0 / _3790;
            float _3798 = _3786 * _3796;
            float _3800 = fma(_3798, _3794, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3772 = _3800;
            _3802 = true;
        }
        else
        {
            bool _3804 = _3742 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3806 = isnan(_3742);
            bool _3808 = _3804 || _3806;
            bool _3810 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3812 = _3808 || _3810;
            if (!_3812)
            {
                float _3814 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3816 = _3742 + _3814;
                float _3818 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3820 = _3818 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3822 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3824 = _3822 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3826 = 1.0 / _3820;
                float _3828 = _3816 * _3826;
                float _3830 = fma(_3828, _3824, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3772 = _3830;
                _3802 = true;
            }
            else
            {
                _3772 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3802 = false;
    float _3832 = _3772;
    float _3834 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3836 = _3696 + _3834;
    float _3838 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3840 = _3702 + _3838;
    float _3842 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3844 = _3704 + _3842;
    bool _3846 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3850 = _3846 || _3848;
    bool _3852 = isnan(0.5);
    bool _3854 = _3850 || _3852;
    float _3856 = fma(_3836, _3832, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3858 = fma(_3840, _3832, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3860 = fma(_3844, _3832, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3862 = -_3050;
    float _3864 = fma(_3862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2732);
    float _3866 = -_3048;
    float _3868 = fma(_3866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3856);
    float _3870 = -_3030;
    float _3872 = fma(_3870, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3858);
    float _3874 = -_3050;
    float _3876 = fma(_3874, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3860);
    float _3878 = -_3048;
    float _3880 = fma(_3878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2822);
    float _3882 = -_3030;
    float _3884 = fma(_3882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2838);
    float _3886 = _3868;
    float _3888 = _3876;
    float _3890 = _3872;
    float _3892 = _3858;
    if (!_3854)
    {
        float _3894 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3896 = _3880 + _3894;
        float _3898 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3900 = _3864 + _3898;
        float _3902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3904 = -_2838;
        float _3906 = _3904 + _3858;
        float _3908 = _3896 * _3896;
        float _3910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3912 = _3884 + _3910;
        float _3914 = -_2732;
        float _3916 = _3914 + _3860;
        float _3918 = fma(_3900, _3900, _3908);
        float _3920 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3922 = fma(_3912, _3912, _3918);
        float _3924 = sqrt(_3922);
        float _3926 = 1.0 / _3232;
        float _3928 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3930 = precise::min(_3924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3932 = _3930 * _3902;
        float _3934 = _3932 * _3926;
        float _3936 = -_2822;
        float _3938 = _3936 + _3856;
        float _3940 = _3928 * _3934;
        float _3942 = _3906 * _3934;
        float _3944 = fma(_3916, _3940, _3864);
        float _3946 = fma(_3938, _3940, _3880);
        float _3948 = fma(_3928, _3942, _3884);
        _3886 = _3946;
        _3888 = _3944;
        _3890 = _3948;
        _2788 = _3916;
    }
    float _3950 = _3886;
    float _3952 = _3888;
    float _3954 = _3890;
    float _3956 = _2788;
    float _3958 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3960 = _3950 + _3958;
    float _3962 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3964 = _3952 + _3962;
    float _3966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3968 = _3954 + _3966;
    float _3970 = _3960 * _3960;
    float _3972 = fma(_3964, _3964, _3970);
    float _3974 = fma(_3968, _3968, _3972);
    float _3976 = rsqrt(_3974);
    float _3978 = sqrt(_3974);
    float _3980 = _3976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3982 = _3964 * _3980;
    float _3984 = _3968 * _3980;
    float _3986 = _3982 * _3982;
    float _3988 = _3984 * _3984;
    float _3990 = _3986 + _3988;
    float _3992 = sqrt(_3990);
    bool _3994 = _3992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3998 = _3992 + _3996;
    float _4000 = _3968;
    float _4002 = _3970;
    float _4004 = _3998;
    float _4006 = _3960;
    float _4008 = _3956;
    float _4010 = _3982;
    if (_3994)
    {
        float _4012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4000 = _4012;
    }
    float _4014 = _4000;
    if (_3994)
    {
        float _4016 = rsqrt(_3990);
        _4002 = _4016;
    }
    float _4018 = _4002;
    float _4020 = _4018;
    if (_3994)
    {
        float _4022 = _3998 * _4014;
        _4004 = _4022;
    }
    float _4024 = _4004;
    if (_3994)
    {
        float _4026 = _4024 * 0.15915493667125701904296875;
        _3766 = _4026;
    }
    float _4028 = _3766;
    float _4030 = _3976;
    if (_3994)
    {
        float _4032 = _4028 * 6.283185482025146484375;
        float _4034 = sin(_4032);
        _4030 = _4034;
    }
    float _4036 = _4030;
    float _4038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4040 = precise::max(0.0, _4038);
    float _4042 = _4014;
    float _4044 = _4040;
    if (_3994)
    {
        float _4046 = _4028 * 6.283185482025146484375;
        float _4048 = cos(_4046);
        _4042 = _4048;
    }
    float _4050 = _4042;
    float _4052 = -_3980;
    float _4054 = -_4040;
    float _4056 = fma(_3960, _4052, _4054);
    if (_3994)
    {
        float _4058 = _4056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4006 = _4058;
    }
    float _4060 = _4006;
    float _4062 = _4036;
    float _4064 = _4060;
    if (_3994)
    {
        float _4066 = fma(_4036, _4060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4062 = _4066;
    }
    float _4068 = _4062;
    float _4070 = _4068;
    if (!_3994)
    {
        _4064 = _3988;
    }
    float _4072 = _4064;
    float _4074 = _4072;
    if (_3994)
    {
        float _4076 = _4050 + (-1.0);
        _4044 = _4076;
    }
    float _4078 = _4044;
    float _4080 = _4078;
    if (_3994)
    {
        float _4082 = _4018 * _4068;
        _4008 = _4082;
    }
    float _4084 = _4008;
    if (!_3994)
    {
        _4020 = _4056;
    }
    float _4086 = _4020;
    float _4088 = _4086;
    if (_3994)
    {
        float _4090 = _4078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3892 = _4090;
    }
    float _4092 = _3892;
    if (_3994)
    {
        float _4094 = _3982 * _4084;
        _4010 = _4094;
    }
    float _4096 = _4010;
    if (!_3994)
    {
        _4070 = _3984;
    }
    float _4098 = _4070;
    float _4100 = _4098;
    if (_3994)
    {
        float _4102 = _3984 * _4084;
        _4100 = _4102;
    }
    float _4104 = _4100;
    if (!_3994)
    {
        _4080 = _3986;
    }
    float _4106 = _4080;
    float _4108 = _4106;
    if (_3994)
    {
        float _4110 = fma(_4056, _4050, _4092);
        _4088 = _4110;
    }
    float _4112 = _4088;
    if (_3994)
    {
        float _4114 = _4096 * _4096;
        _4108 = _4114;
    }
    float _4116 = _4108;
    if (_3994)
    {
        float _4118 = _4104 * _4104;
        _4074 = _4118;
    }
    float _4120 = _4074;
    float _4122 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4124 = fma(_4112, _4112, _4116);
    float _4126 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4128 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4130 = _4124 + _4120;
    float _4132 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4122);
    float _4134 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4136 = fma(_3978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4134);
    float _4138 = precise::clamp(_4136, 0.0, 1.0);
    float _4140 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4142 = rsqrt(_4130);
    float _4144 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4132);
    float _4146 = -_4138;
    float _4148 = _4146 + 1.0;
    float _4150 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4140);
    float _4152 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4154 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4128);
    float _4156 = _4144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4158 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4150);
    float _4160 = abs(_4148);
    float _4162 = log2(_4160);
    float _4164 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4152);
    float _4166 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4154);
    float _4168 = _4158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4170 = _4156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4172 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4164);
    float _4174 = _4166 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4176 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4178 = _4142 * _4096;
    float _4180 = _4142 * _4112;
    float _4182 = _4142 * _4104;
    float _4184 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4176);
    float _4186 = _4178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4188 = -_4170;
    float _4190 = fma(_4188, _4126, 1.0);
    float _4192 = _4172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4194 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4184);
    float _4196 = -_4186;
    float _4198 = fma(_4180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4196);
    float _4200 = _4162 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4202 = log2(_4190);
    float _4204 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4206 = -_4182;
    float _4208 = fma(_4206, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4198);
    float _4210 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4212 = _4180 + 1.0;
    float _4214 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4204);
    float _4216 = fma(_4208, -0.5, 0.5);
    float _4218 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4210);
    float _4220 = exp2(_4200);
    float _4222 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4194);
    float _4224 = fma(_4208, 0.5, 0.5);
    float _4226 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4214);
    float _4228 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4218);
    float _4230 = fma(_4224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4232 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4226);
    float _4234 = 1.0 / _4222;
    float _4236 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4228);
    float _4238 = fma(_4224, _4230, -0.212114393711090087890625);
    float _4240 = _4202 * 0.693147182464599609375;
    float _4242 = fma(_4224, _4238, 1.570728778839111328125);
    float _4244 = _4240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4246 = sqrt(_4216);
    float _4248 = -_4180;
    float _4250 = fma(_4220, _4212, _4248);
    float _4252 = fma(_4250, 0.5, 0.5);
    float _4254 = _4232 * _4234;
    float _4256 = _4236 * _4234;
    float _4258 = fma(_4254, 0.5, 0.5);
    float _4260 = fma(_4256, -0.5, 0.5);
    float _4262 = _4246 * 0.636619746685028076171875;
    float3 _11076 = float3(_4258, _4260, _4244);
    float _4264 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11076, float3(0.0), isnan(_11076)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11076, float3(0.0), isnan(_11076)), level(0.0)).x;
    float3 _11087 = float3(_4258, _4260, _4244);
    float4 _4267 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11087, float3(0.0), isnan(_11087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11087, float3(0.0), isnan(_11087)), level(0.0)).xyzw;
    float _4269 = _4267.x;
    float _4271 = _4267.y;
    float _4273 = _4267.z;
    float _4275 = _4267.w;
    float _4277 = -_4242;
    float _4279 = fma(_4262, _4277, 1.0);
    float2 _11109 = float2(_4279, _4252);
    float3 _4283 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11109, float2(0.0), isnan(_11109)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11109, float2(0.0), isnan(_11109)), level(0.0)).xyz;
    float _4285 = _4283.x;
    float _4287 = _4283.y;
    float _4289 = _4283.z;
    float _4291 = _3880 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4293 = _3880 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4295 = _4162 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4297 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4291);
    float _4299 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4293);
    float _4301 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4297);
    float _4303 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4299);
    float _4305 = exp2(_4295);
    float _4307 = _4301 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4309 = _4303 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4311 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4313 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4315 = _4311 || _4313;
    bool _4317 = isnan(0.5);
    bool _4319 = _4315 || _4317;
    float _4321 = 1.0 / _4307;
    float _4323 = _4309 + _4307;
    float _4325 = -_4305;
    float _4327 = _4325 + 1.0;
    float _4329 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4331 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4333 = _4162;
    float _4335 = _4168;
    if (!_4319)
    {
        _4331 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4337 = _4331;
    float _4339 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4329);
    float _4341 = _4337;
    if (!_4319)
    {
        _2790 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4343 = _2790;
    float _4345 = _4327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4347 = _4323 * _4321;
    float _4349 = _4347 * 0.5;
    float _4351 = _4349;
    if (_4319)
    {
        _4333 = 1.0;
    }
    float _4353 = _4333;
    float _4355 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4339);
    float _4357 = _4232 + _4222;
    float _4359 = _4353;
    if (!_4319)
    {
        float _4361 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4363 = fma(_4349, _4337, _4361);
        _4341 = _4363;
    }
    float _4365 = _4341;
    if (!_4319)
    {
        float _4367 = -_4343;
        float _4369 = _4367 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4351 = _4369;
    }
    float _4371 = _4351;
    float _4373 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4355);
    float _4375 = _4365;
    if (!_4319)
    {
        float _4377 = 1.0 / _4365;
        _4375 = _4377;
    }
    float _4379 = _4375;
    float _4381 = _4371;
    if (!_4319)
    {
        float _4383 = 1.0 / _4371;
        _4381 = _4383;
    }
    float _4385 = _4381;
    out.gl_Position.x = _4232;
    out.gl_Position.y = _4236;
    out.gl_Position.z = _4373;
    out.gl_Position.w = _4222;
    if (!_4319)
    {
        float _4387 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4389 = -_4343;
        float _4391 = fma(_4379, _4387, _4389);
        _4335 = _4391;
    }
    float _4393 = _4335;
    float _4395 = _4357 * 0.5;
    float _4397 = _4373 + _4222;
    float _4399 = -_4345;
    float _4401 = _4399 + 1.0;
    float _4403 = _4397 * 0.5;
    if (!_4319)
    {
        float _4405 = _4393 * _4385;
        float _4407 = precise::clamp(_4405, 0.0, 1.0);
        _4359 = _4407;
    }
    float _4409 = _4359;
    float _4411 = _4222 * 0.5;
    float _4413 = _4409 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _4415 = _4409 > 0.0;
    bool _4417 = isnan(_4409);
    bool _4419 = _4415 || _4417;
    bool _4421 = isnan(0.0);
    bool _4423 = _4419 || _4421;
    float _4425 = fma(_4236, -0.5, _4411);
    float _4427 = _4413 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_83.x = _4395;
    out.m_83.y = _4425;
    out.m_83.z = _4403;
    out.m_83.w = _4222;
    out.m_47.x = _4427;
    float _4429 = _4345 * _4264;
    float _4431 = _4275 * _4401;
    float _4433 = _4275 * _4429;
    float _4435 = _4289 * _4429;
    float _4437 = fma(_4285, _4433, _4269);
    float _4439 = fma(_4287, _4433, _4271);
    float _4441 = fma(_4275, _4435, _4273);
    out.m_85.x = _4437;
    out.m_85.y = _4439;
    out.m_85.z = _4441;
    out.m_85.w = _4431;
    if (_4423)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4443 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4443;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3802 = false;
    bool _2168 = false;
    bool _1842 = false;
    bool _1524 = false;
    bool _1206 = false;
    bool _970 = false;
    bool _866 = false;
    bool _578 = false;
    bool _302 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4500 = as_type<float>(_120);
        out.gl_Position.z = _4500;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4569 = as_type<float>(_158);
        out.gl_Position.z = _4569;
    }
    if (_152)
    {
        return out;
    }
    float _160 = in.m_51.w;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_49.x;
    float _176 = in.m_49.y;
    float _178 = in.m_49.z;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _162);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _174, _264);
    float _272 = fma(_260, _176, _266);
    float _274 = fma(_260, _178, _268);
    float _276 = fma(_270, _160, _180);
    float _278 = fma(_272, _160, _182);
    float _280 = fma(_274, _160, _184);
    bool _282 = !_262;
    float _300;
    if (!_282)
    {
        float _284 = in.m_53.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_104);
        float _306 = 1.0 / _304;
        float _308 = _138 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = _310 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _310 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _310 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = 1.0 / _330;
    float _342 = 1.0 / _326;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _346 = 1.0 / _334;
    float _348 = 1.0 / _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _310 + _350;
    float _354 = _314 * _342;
    bool _356 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_310);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _352 * _340;
    bool _370 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _372 = isnan(_310);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _318 * _346;
    bool _384 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_310);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = -_380;
    float _402 = _400 + 1.0;
    bool _404 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _406 = isnan(_310);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = fma(_398, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = _366 * _402;
    float _420 = _322 * _348;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = -_366;
    float _432 = _430 + 1.0;
    bool _434 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _436 = isnan(_310);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = fma(_424, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = fma(_428, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _450 = -_394;
    float _452 = _450 + 1.0;
    float _454 = _394 * _432;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = _414 * _452;
    float _466 = -_414;
    float _468 = _466 + 1.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _474 = fma(_462, _420, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _476 = fma(_458, _420, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = _444 * _468;
    float _480 = fma(_472, _420, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _482 = -_444;
    float _484 = _482 + 1.0;
    float _486 = _416 * _478;
    float _488 = _446 * _478;
    float _490 = _448 * _478;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].y, _488);
    float _500 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].z, _490);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _506;
    float _510 = fma(_474, _464, _496);
    float _512 = fma(_476, _464, _498);
    float _514 = fma(_480, _464, _500);
    float _516 = fma(_494, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _518 = fma(_504, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _520 = fma(_508, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = fma(_516, _454, _510);
    float _536 = fma(_524, _368, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _538 = fma(_528, _368, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _540 = fma(_532, _368, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_518, _454, _512);
    float _544 = fma(_520, _454, _514);
    float _546 = fma(_536, _418, _534);
    float _548 = fma(_538, _418, _542);
    float _550 = fma(_540, _418, _544);
    float _552 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].x, _546);
    float _554 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].y, _548);
    float _556 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].z, _550);
    bool _558 = !_344;
    float _576;
    if (!_558)
    {
        float _560 = in.m_53.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_104);
        float _582 = 1.0 / _580;
        float _584 = _138 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = in.m_51.x;
    float _590 = in.m_51.y;
    float _592 = in.m_51.z;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _596 = _586 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _614 = 1.0 / _600;
    float _616 = 1.0 / _612;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _620 = _586 + _618;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _624 = 1.0 / _604;
    float _626 = _554 * _590;
    float _628 = _620 * _614;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _632 = _586 + _630;
    bool _634 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _636 = isnan(_586);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _556 * _592;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _650 = _586 + _648;
    float _652 = _552 * _588;
    float _654 = 1.0 / _608;
    float _656 = _596 * _616;
    bool _658 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _660 = isnan(_586);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _670;
    bool _674 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _676 = isnan(_586);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = fma(_672, _628, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _688 = _632 * _624;
    float _690 = -_644;
    float _692 = _690 + 1.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _694;
    bool _698 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _700 = isnan(_586);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = _668 * _692;
    float _712 = -_668;
    float _714 = _712 + 1.0;
    float _716 = fma(_696, _628, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _718 = _650 * _654;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _720;
    float _724 = -_684;
    float _726 = _724 + 1.0;
    float _728 = _684 * _714;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _734 = fma(_722, _628, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _736 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _738 = isnan(_586);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _708 * _726;
    float _750 = -_708;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _762 = fma(_732, _688, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _764 = _746 * _752;
    float _766 = fma(_756, _688, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _768 = fma(_760, _688, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _770 = -_746;
    float _772 = _770 + 1.0;
    float _774 = _734 * _764;
    float _776 = _686 * _764;
    float _778 = _716 * _764;
    float _780 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].x, _774);
    float _782 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].y, _776);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _784;
    float _788 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].z, _778);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _794;
    float _798 = fma(_786, _718, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _800 = fma(_766, _748, _780);
    float _802 = fma(_762, _748, _782);
    float _804 = fma(_768, _748, _788);
    float _806 = fma(_792, _718, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _808 = fma(_796, _718, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _822 = fma(_798, _728, _800);
    float _824 = fma(_812, _656, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _826 = fma(_816, _656, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _828 = fma(_820, _656, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _830 = fma(_806, _728, _802);
    float _832 = fma(_808, _728, _804);
    float _834 = fma(_824, _710, _822);
    float _836 = fma(_826, _710, _830);
    float _838 = fma(_828, _710, _832);
    float _840 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[111].x, _834);
    float _842 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[111].y, _836);
    float _844 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[111].z, _838);
    bool _846 = !_622;
    float _864;
    if (!_846)
    {
        float _848 = in.m_53.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        float _868 = float(_104);
        float _870 = 1.0 / _868;
        float _872 = _138 * _870;
        _864 = _872;
    }
    _866 = false;
    float _874 = _864;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _874 + _876;
    bool _880 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _882 = isnan(_874);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _898 = isnan(_874);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _908;
    float _912 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _914 = -_890;
    float _916 = _914 + 1.0;
    bool _918 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _920 = 1.0 / _894;
    float _922 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _906 * _916;
    float _926 = -_906;
    float _928 = _926 + 1.0;
    float _930 = _910 * _920;
    float _932 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _934 = fma(_930, _878, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _936 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _934 * _924;
    float _940 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _942 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[115].x, _938);
    float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[116].x, _942);
    float _948 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _922;
    out.m_55.y = _944;
    out.m_55.z = _936;
    out.m_55.w = _948;
    bool _950 = !_918;
    float _968;
    if (!_950)
    {
        float _952 = in.m_53.x;
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _956 = _952 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _960 = _958 * _954;
        float _962 = floor(_960);
        float _964 = -_962;
        float _966 = _960 + _964;
        _968 = _966;
        _970 = true;
    }
    else
    {
        float _972 = float(_104);
        float _974 = 1.0 / _972;
        float _976 = _138 * _974;
        _968 = _976;
    }
    _970 = false;
    float _978 = _968;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _982 = _978 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _986 = _978 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = _978 + _1000;
    float _1004 = 1.0 / _990;
    bool _1006 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1008 = isnan(_978);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    bool _1018 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1020 = isnan(_978);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = 1.0 / _994;
    bool _1032 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1034 = 1.0 / _998;
    float _1036 = _982 * _1004;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1042;
    float _1046 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1048 = fma(_1044, _1036, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1050 = _986 * _1030;
    bool _1052 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1054 = isnan(_978);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1064;
    float _1068 = fma(_1066, _1036, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1070 = -_1062;
    float _1072 = _1070 + 1.0;
    float _1074 = _1002 * _1034;
    float _1076 = -_1016;
    float _1078 = _1076 + 1.0;
    bool _1080 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1082 = isnan(_978);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1096 = _1062 * _1078;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1102 = _1028 * _1072;
    float _1104 = -_1028;
    float _1106 = _1104 + 1.0;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1112 = fma(_1094, _1050, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1114 = fma(_1100, _1050, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1116 = _1090 * _1106;
    float _1118 = fma(_1110, _1050, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1120 = -_1090;
    float _1122 = _1120 + 1.0;
    float _1124 = _1046 * _1116;
    float _1126 = _1048 * _1116;
    float _1128 = _1068 * _1116;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1130;
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1124);
    float _1136 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1126);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1142;
    float _1146 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1128);
    float _1148 = fma(_1132, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1150 = fma(_1140, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1152 = fma(_1144, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1154 = fma(_1112, _1102, _1134);
    float _1156 = fma(_1118, _1102, _1136);
    float _1158 = fma(_1114, _1102, _1146);
    float _1160 = fma(_1148, _1096, _1154);
    float _1162 = fma(_1150, _1096, _1156);
    float _1164 = fma(_1152, _1096, _1158);
    float _1166 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1160);
    float _1168 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1162);
    float _1170 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1164);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1180 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1180;
    out.m_57.y = _1182;
    out.m_57.z = _1184;
    out.m_57.w = _1172;
    bool _1186 = !_1032;
    float _1204;
    if (!_1186)
    {
        float _1188 = in.m_53.x;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1192 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        float _1208 = float(_104);
        float _1210 = 1.0 / _1208;
        float _1212 = _138 * _1210;
        _1204 = _1212;
    }
    _1206 = false;
    float _1214 = _1204;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1218 = _1214 + _1216;
    bool _1220 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1222 = isnan(_1214);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1236 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1238 = isnan(_1214);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1248;
    bool _1252 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1254 = isnan(_1214);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = -_1230;
    float _1266 = _1264 + 1.0;
    float _1268 = 1.0 / _1234;
    bool _1270 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1272 = isnan(_1214);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = -_1262;
    float _1284 = _1282 + 1.0;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1292 = 1.0 / _1288;
    float _1294 = _1250 * _1268;
    float _1296 = -_1246;
    float _1298 = _1296 + 1.0;
    float _1300 = _1246 * _1266;
    bool _1302 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1304 = isnan(_1214);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = fma(_1294, _1218, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1316 = _1262 * _1298;
    float _1318 = _1280 * _1284;
    float _1320 = -_1280;
    float _1322 = _1320 + 1.0;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1328 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1330 = isnan(_1214);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = _1312 * _1322;
    float _1342 = -_1312;
    float _1344 = _1342 + 1.0;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1350 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1352 = isnan(_1214);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1358 = _1354 || _1356;
    float _1360 = float(_1358);
    float _1362 = 1.0 / _1326;
    float _1364 = _1338 * _1344;
    float _1366 = -_1338;
    float _1368 = _1366 + 1.0;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1374 = _1360 * _1368;
    float _1376 = 1.0 / _1348;
    float _1378 = _1372 * _1292;
    float _1380 = -_1360;
    float _1382 = _1380 + 1.0;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1388;
    float _1392 = 1.0 / _1386;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1398 = _1314 * _1374;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1402 = _1214 + _1400;
    float _1404 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1398);
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1410 = 1.0 / _1396;
    float _1412 = fma(_1378, _1402, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1414 = _1390 * _1376;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1418 = _1214 + _1416;
    float _1420 = fma(_1412, _1364, _1404);
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1424 = _1214 + _1422;
    float _1426 = fma(_1414, _1418, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1428 = 1.0 / _1408;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1442 = _1432 * _1362;
    float _1444 = fma(_1426, _1340, _1420);
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1448 = _1214 + _1446;
    float _1450 = _1436 * _1410;
    float _1452 = fma(_1442, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1454;
    bool _1458 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1460 = isnan(_1214);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = _1440 * _1392;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1474 = _1214 + _1472;
    float _1476 = fma(_1450, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1478 = fma(_1452, _1318, _1444);
    float _1480 = _1456 * _1428;
    float _1482 = fma(_1470, _1474, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1484 = -_1468;
    float _1486 = _1484 + 1.0;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1490 = _1214 + _1488;
    float _1492 = fma(_1476, _1316, _1478);
    float _1494 = _1230 * _1486;
    float _1496 = fma(_1480, _1490, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1498 = fma(_1482, _1300, _1492);
    float _1500 = fma(_1496, _1494, _1498);
    float _1502 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1500);
    out.m_59.x = _1502;
    bool _1504 = !_1290;
    float _1522;
    if (!_1504)
    {
        float _1506 = in.m_53.x;
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1510 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[14].y, _138);
        float _1514 = _1512 * _1508;
        float _1516 = floor(_1514);
        float _1518 = -_1516;
        float _1520 = _1514 + _1518;
        _1522 = _1520;
        _1524 = true;
    }
    else
    {
        float _1526 = float(_104);
        float _1528 = 1.0 / _1526;
        float _1530 = _138 * _1528;
        _1522 = _1530;
    }
    _1524 = false;
    float _1532 = _1522;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1536 = _1532 + _1534;
    bool _1538 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1540 = isnan(_1532);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1554 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1556 = isnan(_1532);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1566;
    bool _1570 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1572 = isnan(_1532);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = -_1548;
    float _1584 = _1582 + 1.0;
    float _1586 = 1.0 / _1552;
    bool _1588 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1590 = isnan(_1532);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -_1580;
    float _1602 = _1600 + 1.0;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1608 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1610 = 1.0 / _1606;
    float _1612 = _1568 * _1586;
    float _1614 = -_1564;
    float _1616 = _1614 + 1.0;
    float _1618 = _1564 * _1584;
    bool _1620 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1622 = isnan(_1532);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1628 = _1624 || _1626;
    float _1630 = float(_1628);
    float _1632 = fma(_1612, _1536, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1634 = _1580 * _1616;
    float _1636 = _1598 * _1602;
    float _1638 = -_1598;
    float _1640 = _1638 + 1.0;
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1644 = _1642 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1646 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1648 = isnan(_1532);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1654 = _1650 || _1652;
    float _1656 = float(_1654);
    float _1658 = _1630 * _1640;
    float _1660 = -_1630;
    float _1662 = _1660 + 1.0;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1666 = _1664 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1668 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1670 = isnan(_1532);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = 1.0 / _1644;
    float _1682 = _1656 * _1662;
    float _1684 = -_1656;
    float _1686 = _1684 + 1.0;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1692 = _1678 * _1686;
    float _1694 = 1.0 / _1666;
    float _1696 = _1690 * _1610;
    float _1698 = -_1678;
    float _1700 = _1698 + 1.0;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1704 = _1702 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1706;
    float _1710 = 1.0 / _1704;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1716 = _1632 * _1692;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1720 = _1532 + _1718;
    float _1722 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1716);
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1728 = 1.0 / _1714;
    float _1730 = fma(_1696, _1720, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1732 = _1708 * _1694;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1736 = _1532 + _1734;
    float _1738 = fma(_1730, _1682, _1722);
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1742 = _1532 + _1740;
    float _1744 = fma(_1732, _1736, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1746 = 1.0 / _1726;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1752;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1760 = _1750 * _1680;
    float _1762 = fma(_1744, _1658, _1738);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1766 = _1532 + _1764;
    float _1768 = _1754 * _1728;
    float _1770 = fma(_1760, _1742, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1772;
    bool _1776 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1778 = isnan(_1532);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1758 * _1710;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1792 = _1532 + _1790;
    float _1794 = fma(_1768, _1766, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1796 = fma(_1770, _1636, _1762);
    float _1798 = _1774 * _1746;
    float _1800 = fma(_1788, _1792, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1802 = -_1786;
    float _1804 = _1802 + 1.0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1808 = _1532 + _1806;
    float _1810 = fma(_1794, _1634, _1796);
    float _1812 = _1548 * _1804;
    float _1814 = fma(_1798, _1808, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1816 = fma(_1800, _1618, _1810);
    float _1818 = fma(_1814, _1812, _1816);
    float _1820 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1818);
    out.m_61.x = _1820;
    bool _1822 = !_1608;
    float _1840;
    if (!_1822)
    {
        float _1824 = in.m_53.x;
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1828 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[14].z, _138);
        float _1832 = _1830 * _1826;
        float _1834 = floor(_1832);
        float _1836 = -_1834;
        float _1838 = _1832 + _1836;
        _1840 = _1838;
        _1842 = true;
    }
    else
    {
        float _1844 = float(_104);
        float _1846 = 1.0 / _1844;
        float _1848 = _138 * _1846;
        _1840 = _1848;
    }
    _1842 = false;
    float _1850 = _1840;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1854 = _1850 + _1852;
    bool _1856 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1858 = isnan(_1850);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1872 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1874 = isnan(_1850);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1880 = _1876 || _1878;
    float _1882 = float(_1880);
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1884;
    bool _1888 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1890 = isnan(_1850);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1896 = _1892 || _1894;
    float _1898 = float(_1896);
    float _1900 = -_1866;
    float _1902 = _1900 + 1.0;
    float _1904 = 1.0 / _1870;
    bool _1906 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1908 = isnan(_1850);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1914 = _1910 || _1912;
    float _1916 = float(_1914);
    float _1918 = -_1898;
    float _1920 = _1918 + 1.0;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1926 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1928 = 1.0 / _1924;
    float _1930 = _1886 * _1904;
    float _1932 = -_1882;
    float _1934 = _1932 + 1.0;
    float _1936 = _1882 * _1902;
    bool _1938 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1940 = isnan(_1850);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1946 = _1942 || _1944;
    float _1948 = float(_1946);
    float _1950 = fma(_1930, _1854, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1952 = _1898 * _1934;
    float _1954 = _1916 * _1920;
    float _1956 = -_1916;
    float _1958 = _1956 + 1.0;
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1962 = _1960 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1964 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1966 = isnan(_1850);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1972 = _1968 || _1970;
    float _1974 = float(_1972);
    float _1976 = _1948 * _1958;
    float _1978 = -_1948;
    float _1980 = _1978 + 1.0;
    float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1986 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1988 = isnan(_1850);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1994 = _1990 || _1992;
    float _1996 = float(_1994);
    float _1998 = 1.0 / _1962;
    float _2000 = _1974 * _1980;
    float _2002 = -_1974;
    float _2004 = _2002 + 1.0;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2010 = _1996 * _2004;
    float _2012 = 1.0 / _1984;
    float _2014 = _2008 * _1928;
    float _2016 = -_1996;
    float _2018 = _2016 + 1.0;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2024;
    float _2028 = 1.0 / _2022;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2034 = _1950 * _2010;
    float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2038 = _1850 + _2036;
    float _2040 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2034);
    float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2044 = _2042 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2046 = 1.0 / _2032;
    float _2048 = fma(_2014, _2038, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2050 = _2026 * _2012;
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2054 = _1850 + _2052;
    float _2056 = fma(_2048, _2000, _2040);
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2060 = _1850 + _2058;
    float _2062 = fma(_2050, _2054, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2064 = 1.0 / _2044;
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2068 = _2066 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2070;
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2076 = _2074 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2078 = _2068 * _1998;
    float _2080 = fma(_2062, _1976, _2056);
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2084 = _1850 + _2082;
    float _2086 = _2072 * _2046;
    float _2088 = fma(_2078, _2060, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _2090;
    bool _2094 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2096 = isnan(_1850);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2102 = _2098 || _2100;
    float _2104 = float(_2102);
    float _2106 = _2076 * _2028;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2110 = _1850 + _2108;
    float _2112 = fma(_2086, _2084, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2114 = fma(_2088, _1954, _2080);
    float _2116 = _2092 * _2064;
    float _2118 = fma(_2106, _2110, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2120 = -_2104;
    float _2122 = _2120 + 1.0;
    float _2124 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2126 = _1850 + _2124;
    float _2128 = fma(_2112, _1952, _2114);
    float _2130 = _1866 * _2122;
    float _2132 = fma(_2116, _2126, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2134 = fma(_2118, _1936, _2128);
    float _2136 = fma(_2132, _2130, _2134);
    float _2138 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2136);
    out.m_63.x = _2138;
    bool _2140 = !_1926;
    float _2142 = _1952;
    float _2144 = _2130;
    float _2146 = _2132;
    int _2164;
    float _2166;
    if (!_2140)
    {
        float _2148 = in.m_53.x;
        float _2150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _2152 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _2154 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[14].w, _138);
        float _2156 = _2154 * _2150;
        float _2158 = floor(_2156);
        float _2160 = -_2158;
        float _2162 = _2156 + _2160;
        _2164 = as_type<int>(_2156);
        _2166 = _2162;
        _2168 = true;
    }
    else
    {
        float _2170 = float(_104);
        float _2172 = 1.0 / _2170;
        float _2174 = _138 * _2172;
        _2164 = as_type<int>(_2172);
        _2166 = _2174;
    }
    _2168 = false;
    int _2176 = _2164;
    float _2178 = _2166;
    float _2180 = in.m_53.y;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2184 = _2182 != 0;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    float _2192 = 0.0;
    int _2194 = _2176;
    if (_2184)
    {
        float _2196 = in.m_53.x;
        _2192 = _2196;
    }
    float _2198 = _2192;
    float _2200 = 0.0;
    if (_2184)
    {
        float _2202 = in.m_53.z;
        _2200 = _2202;
    }
    float _2204 = _2200;
    float _2206 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2208 = as_type<int>(_2206);
    if (_2184)
    {
        _2142 = _2180;
    }
    float _2210 = _2142;
    float _2212 = fma(_2206, -2.0, _2186);
    float _2214 = _2210;
    if (_2184)
    {
        _2208 = 0;
        _2194 = 0;
    }
    int _2216 = _2208;
    int _2218 = _2194;
    int _2220 = _2216;
    int _2222 = _2218;
    float _2224 = _2198;
    if (_2184)
    {
        _2144 = _2198;
    }
    float _2226 = _2144;
    float _2228 = _2226;
    float _2230 = _2204;
    if (_2184)
    {
        _2146 = _2204;
    }
    float _2232 = _2146;
    float _2234 = _2232;
    if (!_2184)
    {
        float _2236 = in.m_53.x;
        float _2238 = _2180 * 3.1415927410125732421875;
        float _2240 = in.m_53.z;
        float _2242 = _2238 * 0.15915493667125701904296875;
        float _2244 = _2242 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = _2236 * 3.1415927410125732421875;
        float _2250 = _2248 * 0.15915493667125701904296875;
        float _2252 = _2240 * 3.1415927410125732421875;
        float _2254 = _2252 * 0.15915493667125701904296875;
        float _2256 = _2250 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        float _2260 = _2254 * 6.283185482025146484375;
        float _2262 = sin(_2260);
        _2220 = 2;
        _2234 = _2262;
        _2222 = 1;
        _2224 = _2236;
        _2214 = _2246;
        _2228 = _2258;
        _2230 = _2240;
    }
    int _2264 = _2220;
    float _2266 = _2234;
    int _2268 = _2222;
    float _2270 = _2224;
    float _2272 = _2214;
    float _2274 = _2228;
    float _2276 = _2230;
    bool _2278 = _2264 != 2;
    float _2280 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[94].z, _2190);
    bool _2282 = _2268 != 1;
    float _2284 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2286 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2288 = -_2188;
    float _2290 = fma(_2284, 2.0, _2288);
    float _2292 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2298 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2294);
    float _2300 = as_type<float>(_2264);
    float _2302 = as_type<float>(_2268);
    float _2304 = _2272;
    if (_2278)
    {
        _2300 = _2270;
    }
    float _2306 = _2300;
    float _2308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2310 = log2(_2308);
    float _2312 = _2306;
    if (!_2278)
    {
        _2312 = _2276;
    }
    float _2314 = _2312;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    if (!_2282)
    {
        _2302 = _2180;
    }
    float _2318 = _2302;
    float _2320 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2296);
    float _2322 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2324 = _2318;
    float _2326 = _2322;
    if (!_2282)
    {
        _2304 = _2318;
    }
    float _2328 = _2304;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2332 = _2328;
    float _2334 = _2330;
    if (_2282)
    {
        _2324 = _2270;
    }
    float _2336 = _2324;
    float _2338 = -_2316;
    float _2340 = fma(_2292, 2.0, _2338);
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2344 = fma(_2336, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2330);
    float _2346 = _2336;
    if (!_2282)
    {
        _2346 = _2276;
    }
    float _2348 = _2346;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2352 = _2348;
    if (_2282)
    {
        _2352 = _2180;
    }
    float _2354 = _2352;
    float _2356 = _2310 * _138;
    if (_2282)
    {
        _2332 = _2270;
    }
    float _2358 = _2332;
    float _2360 = -_2342;
    float _2362 = fma(_2322, 2.0, _2360);
    if (!_2282)
    {
        _2326 = _2276;
    }
    float _2364 = _2326;
    float _2366 = fma(_2354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2350);
    float _2368 = exp2(_2356);
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2372 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2374 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2376 = 1.0 + _2374;
    float _2378 = _2364;
    if (_2282)
    {
        _2378 = _2180;
    }
    float _2380 = _2378;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (_2278)
    {
        _2334 = _2180;
    }
    float _2384 = _2334;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2390 = _2384;
    if (!_2278)
    {
        _2390 = _2270;
    }
    float _2392 = _2390;
    float _2394 = -_2370;
    float _2396 = fma(_2372, 2.0, _2394);
    float _2398 = 1.0 / _2376;
    float _2400 = fma(_2286, -2.0, _2382);
    float _2402 = fma(_2388, -2.0, _2386);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2406 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2414 = _2412 != 0;
    float _2416 = fma(_2180, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2404);
    bool _2418 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2420 = isnan(1.0);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2426 = _2422 || _2424;
    float _2428 = fma(_2180, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2408);
    float _2430 = -_2368;
    float _2432 = _2430 + 1.0;
    float _2434 = fma(_2406, -2.0, _2410);
    bool _2436 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2438 = isnan(0.0);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2444 = _2440 || _2442;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2450 = _2180 * 2.0;
    float _2452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _2454 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2416);
    float _2456 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2428);
    float _2458 = _2444 ? _2432 : 0.0;
    float _2460 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2446);
    float _2462 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2448);
    float _2464 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2320);
    float _2466 = -_138;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2340);
    float _2470 = floor(_2450);
    float _2472 = in.m_65.x;
    float _2474 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2400);
    float _2476 = -_138;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2362);
    float _2480 = _138 * 0.00999999977648258209228515625;
    float _2482 = 0.0;
    if (_2414)
    {
        float _2484 = in.m_53.x;
        _2482 = _2484;
    }
    float _2486 = _2482;
    float _2488 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2212);
    float _2490 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2492 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2462);
    float _2494 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[94].x, _2280);
    float _2496 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2298);
    float _2498 = -_138;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2290);
    float _2502 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2344);
    float _2504 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2366);
    float _2506 = -_138;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2396);
    float _2510 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2402);
    float _2512 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2434);
    if (_2426)
    {
        float _2514 = _2458 * _2398;
        _142 = _2514;
    }
    float _2516 = _142;
    float _2518 = _2276 * 2.0;
    float _2520 = _2270 * 2.0;
    float _2522 = in.m_53.w;
    float _2524 = _2516 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _2526 = floor(_2518);
    bool _2528 = _2470 > 0.0;
    float _2530 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2532 = _2524 * _2452;
    bool _2534 = _2470 >= 0.0;
    bool _2536 = isnan(_2470);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = _278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2546 = in.m_65.y;
    float _2548 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[203].z, _2532);
    float _2550 = floor(_2520);
    int _2552 = as_type<int>(_2518);
    float _2554 = _2472;
    if (_2414)
    {
        float _2556 = -_2472;
        float _2558 = _2556 + 1.0;
        _2552 = as_type<int>(_2558);
    }
    int _2560 = _2552;
    bool _2562 = false;
    if (_2414)
    {
        bool _2564 = _2486 > 0.5;
        _2562 = _2564;
    }
    bool _2566 = _2562;
    float _2568 = _2548 + 0.25;
    float _2570 = 0.0;
    if (!_2414)
    {
        _2570 = _2472;
    }
    float _2572 = _2570;
    float _2574 = _278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2576 = _2572;
    if (_2414)
    {
        float _2578 = _2566 ? as_type<float>(_2560) : _2472;
        _2576 = _2578;
    }
    float _2580 = _2576;
    float _2582 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2544);
    float _2584 = floor(_2548);
    bool _2586 = _2526 > 0.0;
    float _2588 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2574);
    bool _2590 = _2526 >= 0.0;
    bool _2592 = isnan(_2526);
    bool _2594 = _2590 || _2592;
    bool _2596 = isnan(0.0);
    bool _2598 = _2594 || _2596;
    float _2600 = _2270 * 78.233001708984375;
    int _2602 = _2542 ? 0 : 1;
    float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2606 = _2178 + _2604;
    bool _2608 = _2522 > 0.5;
    float _2610 = floor(_2568);
    bool _2612 = _2550 > 0.0;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2616 = _2178 + _2614;
    bool _2618 = _2550 >= 0.0;
    bool _2620 = isnan(_2550);
    bool _2622 = _2618 || _2620;
    bool _2624 = isnan(0.0);
    bool _2626 = _2622 || _2624;
    float _2628 = _2180 + _2276;
    int _2630 = _2598 ? 0 : 1;
    float _2632 = -_2546;
    float _2634 = _2632 + 1.0;
    int _2636 = ~_2602;
    int _2638 = _2636 + 1;
    int _2640 = _2638 + 1;
    float _2642 = -_2584;
    float _2644 = _2548 + _2642;
    int _2646 = _2626 ? 0 : 1;
    float _2648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _2652 = _2650 != 0;
    int _2654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _2656 = _2654 != 0;
    int _2658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _2660 = _2658 != 0;
    float _2662 = _2628 + (-1.0);
    int _2664 = _2640;
    if (!_2528)
    {
        int _2666 = ~_2602;
        int _2668 = _2666 + 1;
        _2664 = _2668;
    }
    int _2670 = _2664;
    float _2672 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2674 = ~_2630;
    int _2676 = _2674 + 1;
    int _2678 = _2676 + 1;
    float _2680 = -_2610;
    float _2682 = _2568 + _2680;
    int _2684 = _2678;
    float _2686 = _2682;
    if (!_2586)
    {
        int _2688 = ~_2630;
        int _2690 = _2688 + 1;
        _2684 = _2690;
    }
    int _2692 = _2684;
    float _2694 = _278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2696 = _2644 >= 0.5;
    bool _2698 = isnan(_2644);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan(0.5);
    bool _2704 = _2700 || _2702;
    float _2706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2708 = _2180 > 0.5;
    float _2710 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2694);
    int _2712 = ~_2646;
    int _2714 = _2712 + 1;
    int _2716 = _2714 + 1;
    float _2718 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2710);
    int _2720 = _2716;
    if (!_2612)
    {
        int _2722 = ~_2646;
        int _2724 = _2722 + 1;
        _2720 = _2724;
    }
    int _2726 = _2720;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[191].z * 0.4799999892711639404296875;
    int _2730 = _2608 ? as_type<int>(_2634) : as_type<int>(_2546);
    float _2732 = _2718 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2736 = _2734 != 0;
    int _2738 = _2708 ? as_type<int>(_2634) : as_type<int>(_2546);
    float _2740 = 1.0 / _2728;
    float _2742 = _2736 ? as_type<float>(_2738) : _2546;
    int _2744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2746 = _2744 != 0;
    float _2748 = _2746 ? as_type<float>(_2730) : _2546;
    bool _2750 = _2682 > 0.5;
    bool _2752 = !_2660;
    int _2754 = _2752 ? 0 : 1;
    float _2756 = _2530 * _2740;
    int _2758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2760 = _2758 != 0;
    int _2762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2764 = _2762 != 0;
    int _2766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2768 = _2766 != 0;
    float _2770 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _2774 = !_2704;
    float _2776 = _2774 ? 0.5 : (-0.5);
    float _2778 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2582);
    int _2780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2782 = _2780 != 0;
    float _2784 = floor(_2756);
    bool _2786 = _2764;
    float _2788 = _2732;
    float _2790 = 0.5;
    if (_2750)
    {
        float _2792 = -_2682;
        float _2794 = _2792 + 1.0;
        _2686 = _2794;
    }
    float _2796 = _2686;
    bool _2798 = !_2652;
    int _2800 = _2798 ? 0 : 1;
    float _2802 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2588);
    bool _2804 = !_2656;
    int _2806 = _2804 ? 0 : 1;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2810 = _2808 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _2812 = !_2760;
    int _2814 = _2812 ? 0 : 1;
    float _2816 = 1.0 / _2772;
    int _2818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2820 = _2818 != 0;
    float _2822 = _2778 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2826 = _2824 != 0;
    float _2828 = _276;
    if (_2782)
    {
        float _2830 = in.m_53.z;
        _2828 = _2830;
    }
    float _2832 = _2828;
    int _2834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2836 = _2834 != 0;
    float _2838 = _2802 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2842 = _2840 != 0;
    float _2844 = 1.0 / _2810;
    float _2846 = fma(_2784, 12.98980045318603515625, _2600);
    float _2848 = fma(_2796, 4.0, -1.0);
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2852 = _2850 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2854 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _2856 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _2854;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2860 = _2858 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2864 = _2862 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    float _2866 = _2856 * _2816;
    float _2868 = 1.0 / _2852;
    float _2870 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _2872 = _2870 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2876 = _2874 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _2880 = _2878 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2882 = _2872 * _2844;
    float _2884 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2886 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _2884;
    float _2888 = 1.0 / _2864;
    float _2890 = _2846 * 0.15915493667125701904296875;
    float _2892 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2894 = _2892 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _2896 = !_2764;
    int _2898 = _2896 ? 0 : 1;
    float _2900 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2902 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2906 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _2904;
    if (_2782)
    {
        bool _2908 = _2832 > 0.5;
        _2786 = _2908;
    }
    bool _2910 = _2786;
    float _2912 = 1.0 / _2860;
    float _2914 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2916 = _2178 + _2914;
    float _2918 = _2902 * _2868;
    float _2920 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2922 = _2178 + _2920;
    int _2924 = abs(_2814);
    float _2926 = fma(_2882, _2916, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2930 = _2822 + _2928;
    float _2932 = fma(_2866, _2922, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    float _2934 = 1.0 / _2876;
    float _2936 = _2906 * _2888;
    float _2938 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2940 = _2178 + _2938;
    float _2942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2944 = _2732 + _2942;
    float _2946 = fma(_2918, _2606, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _2948 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2950 = in.m_67.w;
    float _2952 = float(_2924);
    float _2954 = _2890 * 6.283185482025146484375;
    float _2956 = sin(_2954);
    float _2958 = _2886 * _2912;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2962 = _2838 + _2960;
    float _2964 = fma(_2948, _2742, -0.5);
    float _2966 = _2706 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2968 = fma(_2958, _2940, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _2970 = _2930 * _2930;
    float _2972 = 1.0 / _2894;
    float _2974 = _2880 * _2934;
    float _2976 = fma(_2944, _2944, _2970);
    float _2978 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _2980 = _2978 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2982 = in.m_67.x;
    float _2984 = fma(_2974, _2616, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _2986 = fma(_2962, _2962, _2976);
    float _2988 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2990 = _2178 + _2988;
    float _2992 = _2956 * 43758.546875;
    float _2994 = fma(_2966, _2748, -0.5);
    float _2996 = rsqrt(_2986);
    float _2998 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3000 = _2178 + _2998;
    float _3002 = -_2488;
    float _3004 = fma(_2454, _2964, _3002);
    float _3006 = _2180 + _2270;
    float _3008 = fma(_2936, _3000, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3010 = _2980 * _2972;
    float _3012 = _2270 + _2276;
    float _3014 = floor(_2992);
    float _3016 = _3006 + (-1.0);
    float _3018 = fma(_3010, _2990, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    float _3020 = _3012 + (-1.0);
    float _3022 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3024 = _2548 * 6.283185482025146484375;
    float _3026 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3028 = fma(_3020, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3030 = _2962 * _2996;
    float _3032 = _3024 * 0.15915493667125701904296875;
    float _3034 = _2270 + (-0.5);
    bool _3036 = !_2768;
    int _3038 = _3036 ? 0 : 1;
    float _3040 = -_3030;
    float _3042 = fma(_3040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2962);
    out.m_69.w = _2950;
    float _3044 = -_3014;
    float _3046 = _2992 + _3044;
    float _3048 = _2930 * _2996;
    float _3050 = _2944 * _2996;
    float _3052 = _3032 * 6.283185482025146484375;
    float _3054 = sin(_3052);
    float _3056 = _3046 + _2982;
    float _3058 = -_3048;
    float _3060 = fma(_3058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2930);
    float _3062 = -_3050;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2944);
    float _3066 = _2848 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _3068 = _3056 * 6.283185482025146484375;
    float _3070 = _3060 * _3060;
    bool _3072 = _2180 > 0.5;
    float _3074 = fma(_3068, (*spvDescriptorSet0.vp_c9)._m0[191].y, 1.57079637050628662109375);
    float _3076 = fma(_3064, _3064, _3070);
    int _3078 = abs(_2898);
    float _3080 = in.m_71.x;
    float _3082 = in.m_71.y;
    float _3084 = in.m_71.z;
    float _3086 = float(_2692);
    float _3088 = _3074 * 0.15915493667125701904296875;
    float _3090 = float(_2726);
    float _3092 = fma(_3042, _3042, _3076);
    float _3094 = _2952 * _3086;
    float _3096 = _3088 * 6.283185482025146484375;
    float _3098 = cos(_3096);
    float _3100 = float(_3078);
    float _3102 = _3094 * (-2.0);
    float _3104 = (*spvDescriptorSet0.vp_c9)._m0[191].x + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _3106 = abs(_2806);
    float _3108 = _3100 * _3090;
    int _3110 = abs(_2800);
    float _3112 = 1.0 / _3104;
    int _3114 = as_type<int>(_3100);
    if (_2826)
    {
        float _3116 = -_2472;
        float _3118 = _3116 + 1.0;
        _3114 = as_type<int>(_3118);
    }
    int _3120 = _3114;
    float _3122 = fma(_3102, _3080, _3080);
    float _3124 = _3054 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _3126 = fma(_3022, _3102, _3022);
    float _3128 = _3108 * (-2.0);
    float _3130 = fma(_3034, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3122);
    float _3132 = _2950 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _3134 = abs(_3038);
    float _3136 = fma(_3128, _3082, _3082);
    float _3138 = float(_3106);
    float _3140 = _2776 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _3142 = _3140 * 2.0;
    float _3144 = fma(_3098, _3132, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _3146 = _2530 * 0.15915493667125701904296875;
    float _3148 = _3138 * _3142;
    float _3150 = float(_3110);
    float _3152 = _3144 * _3112;
    float _3154 = float(_2670);
    float _3156 = _2180 + (-0.5);
    int _3158 = abs(_2754);
    float _3160 = fma(_3150, _3124, _3148);
    float _3162 = _3146 * 6.283185482025146484375;
    float _3164 = cos(_3162);
    float _3166 = in.m_73.x;
    float _3168 = in.m_73.y;
    float _3170 = in.m_73.z;
    float _3172 = float(_3158);
    float _3174 = _3152 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _3176 = fma(_3156, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3136);
    float _3178 = fma(_3026, _3128, _3026);
    float _3180 = _2276 + (-0.5);
    float _3182 = fma(_3172, _3066, _3160);
    float _3184 = precise::max(0.0, _3174);
    float _3186 = sqrt(_3092);
    float _3188 = float(_3134);
    float _3190 = fma(_3182, 3.1415927410125732421875, _3084);
    float _3192 = precise::min(_3184, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _3194 = fma(_3126, _2516, _3130);
    float _3196 = fma(_3178, _2516, _3176);
    float _3198 = _3188 * _3154;
    float _3200 = fma(_3164, 0.5, 0.5);
    float _3202 = _3194 * 0.15915493667125701904296875;
    float _3204 = _3196 * 0.15915493667125701904296875;
    float _3206 = _3198 * (-2.0);
    float _3208 = fma(_3192, _3200, 1.0);
    float _3210 = _3202 * 6.283185482025146484375;
    float _3212 = sin(_3210);
    bool _3214 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3216 = isnan(_2178);
    bool _3218 = _3214 || _3216;
    bool _3220 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3222 = _3218 || _3220;
    float _3224 = float(_3222);
    float _3226 = fma(_3190, _3206, _3190);
    float _3228 = fma(_3028, _3206, _3028);
    float _3230 = _3208 * _3166;
    float _3232 = _2996 * _3186;
    float _3234 = fma(_3180, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3226);
    float _3236 = _3208 * _3170;
    float _3238 = _3202 * 6.283185482025146484375;
    float _3240 = cos(_3238);
    float _3242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3230);
    float _3244 = fma(_3228, _2516, _3234);
    float _3246 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3248 = _2672 * _3232;
    bool _3250 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3252 = isnan(_2178);
    bool _3254 = _3250 || _3252;
    bool _3256 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3258 = _3254 || _3256;
    float _3260 = float(_3258);
    float _3262 = _3244 * 0.15915493667125701904296875;
    float _3264 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3266 = _3204 * 6.283185482025146484375;
    float _3268 = sin(_3266);
    float _3270 = _3208 * _3168;
    float _3272 = _3246 * _3232;
    float _3274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3236);
    float _3276 = _3248 * _3242;
    float _3278 = _3264 * _3232;
    float _3280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3270);
    float _3282 = _3272 * _3274;
    float _3284 = _3204 * 6.283185482025146484375;
    float _3286 = cos(_3284);
    bool _3288 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3290 = isnan(_2178);
    bool _3292 = _3288 || _3290;
    bool _3294 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3296 = _3292 || _3294;
    float _3298 = float(_3296);
    float _3300 = _3278 * _3280;
    bool _3302 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3304 = isnan(_2178);
    bool _3306 = _3302 || _3304;
    bool _3308 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3310 = _3306 || _3308;
    float _3312 = float(_3310);
    bool _3314 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3316 = isnan(_2178);
    bool _3318 = _3314 || _3316;
    bool _3320 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3322 = _3318 || _3320;
    float _3324 = float(_3322);
    float _3326 = -_3298;
    float _3328 = _3326 + 1.0;
    bool _3330 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3332 = isnan(_2178);
    bool _3334 = _3330 || _3332;
    bool _3336 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3338 = _3334 || _3336;
    float _3340 = float(_3338);
    float _3342 = _3262 * 6.283185482025146484375;
    float _3344 = sin(_3342);
    float _3346 = _3240 * _3268;
    float _3348 = _3212 * _3268;
    float _3350 = -_3312;
    float _3352 = _3350 + 1.0;
    float _3354 = _3324 * _3328;
    bool _3356 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3358 = isnan(_2178);
    bool _3360 = _3356 || _3358;
    bool _3362 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3364 = _3360 || _3362;
    float _3366 = float(_3364);
    float _3368 = -_3340;
    float _3370 = _3368 + 1.0;
    float _3372 = _3262 * 6.283185482025146484375;
    float _3374 = cos(_3372);
    float _3376 = _3212 * _3286;
    float _3378 = _3240 * _3286;
    float _3380 = _3366 * _3370;
    float _3382 = -_3366;
    float _3384 = _3382 + 1.0;
    float _3386 = -_3346;
    float _3388 = fma(_3344, _3376, _3386);
    float _3390 = fma(_3344, _3378, _3348);
    float _3392 = -_3376;
    float _3394 = fma(_3344, _3346, _3392);
    float _3396 = fma(_3344, _3348, _3378);
    float _3398 = -_3324;
    float _3400 = _3398 + 1.0;
    float _3402 = -_3224;
    float _3404 = _3402 + 1.0;
    float _3406 = _3224 * _3352;
    float _3408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3410 = _3374 * _3282;
    float _3412 = _3286 * _3374;
    float _3414 = -_3282;
    float _3416 = _3344 * _3414;
    bool _3418 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3420 = isnan(_2178);
    bool _3422 = _3418 || _3420;
    bool _3424 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3426 = _3422 || _3424;
    float _3428 = float(_3426);
    float _3430 = _3260 * _3404;
    float _3432 = _3240 * _3410;
    float _3434 = -_3260;
    float _3436 = _3434 + 1.0;
    float _3438 = _3212 * _3410;
    float _3440 = _3268 * _3374;
    float _3442 = fma(_3390, _3276, _3432);
    float _3444 = _3428 * _3436;
    float _3446 = fma(_3412, _3276, _3416);
    float _3448 = fma(_3388, _3276, _3438);
    float _3450 = -_3300;
    float _3452 = fma(_3394, _3450, _3442);
    float _3454 = _2932 * _3444;
    float _3456 = -_3300;
    float _3458 = fma(_3440, _3456, _3446);
    float _3460 = -_3300;
    float _3462 = fma(_3396, _3460, _3448);
    float _3464 = _3452 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _3466 = _3452 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _3468 = as_type<int>(_3276);
    float _3470 = _3390;
    int _3472 = as_type<int>(_3394);
    float _3474 = _3396;
    if (_2782)
    {
        float _3476 = -_2472;
        float _3478 = _3476 + 1.0;
        _3468 = as_type<int>(_3478);
    }
    int _3480 = _3468;
    if (!_2782)
    {
        _3470 = _2472;
    }
    float _3482 = _3470;
    float _3484 = fma(_3458, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3464);
    float _3486 = fma(_3458, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3466);
    float _3488 = _3482;
    if (_2820)
    {
        float _3490 = -_2472;
        float _3492 = _3490 + 1.0;
        _3472 = as_type<int>(_3492);
    }
    int _3494 = _3472;
    if (_2782)
    {
        float _3496 = _2910 ? as_type<float>(_3480) : _2472;
        _3488 = _3496;
    }
    float _3498 = _3488;
    float _3500 = fma(_3462, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3484);
    float _3502 = fma(_3462, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3486);
    float _3504 = _3298 * _3384;
    float _3506 = -_3428;
    float _3508 = _3506 + 1.0;
    float _3510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3512 = _2732 + _3500;
    float _3514 = _2838 + _3502;
    float _3516 = _3504;
    float _3518 = _3514;
    float _3520 = _3512;
    if (!_2820)
    {
        _3474 = _2472;
    }
    float _3522 = _3474;
    float _3524 = _2494 * (-0.15915493667125701904296875);
    float _3526 = _3522;
    if (_2820)
    {
        float _3528 = _3072 ? as_type<float>(_3494) : _2472;
        _3526 = _3528;
    }
    float _3530 = _3526;
    float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3534 = _3512 + _3532;
    float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3538 = _3514 + _3536;
    float _3540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _3542 = _2276 > 0.5;
    float _3544 = _3534 * _3534;
    float _3546 = _3538 * _3538;
    float _3548 = fma(_3508, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3454);
    float _3550 = _3408 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3552 = _3312 * _3400;
    float _3554 = _3544 + _3546;
    float _3556 = _3510 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3560 = _3544;
    float _3562 = _3546;
    if (_2826)
    {
        float _3564 = _3072 ? as_type<float>(_3120) : _2472;
        _2554 = _3564;
    }
    float _3566 = _2554;
    float _3568 = fma(_2926, _3430, _3548);
    float _3570 = fma(_3556, _3498, -0.5);
    int _3572 = _3542 ? as_type<int>(_2634) : as_type<int>(_2546);
    float _3574 = _3452 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3576 = fma(_2968, _3406, _3568);
    float _3578 = _3540 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3580 = sqrt(_3554);
    float _3582 = _2836 ? as_type<float>(_3572) : _2546;
    float _3584 = fma(_3458, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3574);
    float _3586 = fma(_3578, _3566, -0.5);
    float _3588 = _2842 ? as_type<float>(_3572) : _2546;
    float _3590 = in.m_67.y;
    float _3592 = fma(_2984, _3552, _3576);
    float _3594 = fma(_3462, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3584);
    float _3596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3598 = _3558 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3600 = fma(_2946, _3354, _3592);
    float _3602 = _2822 + _3594;
    float _3604 = fma(_3550, _2580, -0.5);
    float _3606 = fma(_3598, _3588, -0.5);
    float _3608 = fma(_3018, _3504, _3600);
    float _3610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3612 = _3580 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3614 = fma(_2490, _3604, _2500);
    float _3616 = _3524 * 6.283185482025146484375;
    float _3618 = sin(_3616);
    float _3620 = _3596 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3622 = fma(_3620, _3530, -0.5);
    if (!_3612)
    {
        _3516 = _3602;
    }
    float _3624 = _3516;
    float _3626 = _3524 * 6.283185482025146484375;
    float _3628 = cos(_3626);
    float _3630 = _3610 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3632 = fma(_3630, _3582, -0.5);
    float _3634 = _3618 * _3606;
    float _3636 = _3628 * _3606;
    float _3638 = -_3634;
    float _3640 = fma(_3628, _3586, _3638);
    float _3642 = fma(_3618, _3586, _3636);
    bool _3644 = !_3612;
    float _3646 = _3624;
    if (!_3644)
    {
        float _3648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3652 = _3580 + _3650;
        float _3654 = _3602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3656 = rsqrt(_3554);
        float _3658 = _3652 * _3648;
        float _3660 = _3658 * 0.15915493667125701904296875;
        float _3662 = _3660 * 6.283185482025146484375;
        float _3664 = sin(_3662);
        float _3666 = _3660 * 6.283185482025146484375;
        float _3668 = cos(_3666);
        float _3670 = fma(_3664, _3654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3672 = _3656 * _3670;
        float _3674 = _3668 + (-1.0);
        float _3676 = fma(_3534, _3672, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3678 = fma(_3538, _3672, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3680 = _3674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3684 = _3676 + _3682;
        float _3686 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3688 = _3678 + _3686;
        float _3690 = fma(_3602, _3668, _3680);
        float _3692 = _3684 * _3684;
        float _3694 = _3688 * _3688;
        _3646 = _3690;
        _3560 = _3692;
        _3562 = _3694;
        _3518 = _3678;
        _3520 = _3676;
    }
    float _3696 = _3646;
    float _3698 = _3560;
    float _3700 = _3562;
    float _3702 = _3518;
    float _3704 = _3520;
    float _3706 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3708 = _3696 + _3706;
    float _3710 = fma(_2492, _3622, _2478);
    float _3712 = -_2474;
    float _3714 = fma(_2464, _3642, _3712);
    float _3716 = fma(_3008, _3380, _3608);
    float _3718 = fma(_3708, _3708, _3698);
    float _3720 = fma(_2496, _3640, _2468);
    float _3722 = fma(_2502, _3570, _2508);
    float _3724 = -_2510;
    float _3726 = fma(_2504, _2994, _3724);
    float _3728 = _3718 + _3700;
    float _3730 = -_2512;
    float _3732 = fma(_2456, _3632, _3730);
    float _3734 = _3710 + 0.5;
    float _3736 = _3714 + 0.5;
    float _3738 = fma(_3340, (*spvDescriptorSet0.vp_c9)._m0[190].x, _3716);
    float _3740 = _3004 + 0.5;
    float _3742 = sqrt(_3728);
    float _3744 = _3614 + 0.5;
    float _3746 = _3720 + 0.5;
    float _3748 = _3722 + 0.5;
    float _3750 = _3726 + 0.5;
    float _3752 = _3732 + 0.5;
    out.m_69.y = _3590;
    out.m_75.x = _3746;
    out.m_75.y = _3736;
    out.m_77.x = _3738;
    bool _3754 = _3742 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3756 = isnan(_3742);
    bool _3758 = _3754 || _3756;
    bool _3760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3762 = _3758 || _3760;
    out.m_79.x = _3744;
    out.m_79.y = _3740;
    out.m_79.z = _3748;
    out.m_79.w = _3750;
    out.m_81.x = _3734;
    out.m_81.y = _3752;
    float _3764 = _3716;
    float _3766 = _3750;
    if (!_3762)
    {
        _3764 = 1.0;
    }
    float _3768 = _3764;
    bool _3770 = !_3762;
    float _3772 = _3768;
    if (!_3770)
    {
        bool _3774 = _3742 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3776 = isnan(_3742);
        bool _3778 = _3774 || _3776;
        bool _3780 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3782 = _3778 || _3780;
        if (!_3782)
        {
            float _3784 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3786 = _3742 + _3784;
            float _3788 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3790 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3788;
            float _3792 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3794 = _3792 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3796 = 1.0 / _3790;
            float _3798 = _3786 * _3796;
            float _3800 = fma(_3798, _3794, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3772 = _3800;
            _3802 = true;
        }
        else
        {
            bool _3804 = _3742 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3806 = isnan(_3742);
            bool _3808 = _3804 || _3806;
            bool _3810 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3812 = _3808 || _3810;
            if (!_3812)
            {
                float _3814 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3816 = _3742 + _3814;
                float _3818 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3820 = _3818 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3822 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3824 = _3822 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3826 = 1.0 / _3820;
                float _3828 = _3816 * _3826;
                float _3830 = fma(_3828, _3824, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3772 = _3830;
                _3802 = true;
            }
            else
            {
                _3772 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3802 = false;
    float _3832 = _3772;
    float _3834 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3836 = _3696 + _3834;
    float _3838 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3840 = _3702 + _3838;
    float _3842 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3844 = _3704 + _3842;
    bool _3846 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3850 = _3846 || _3848;
    bool _3852 = isnan(0.5);
    bool _3854 = _3850 || _3852;
    float _3856 = fma(_3836, _3832, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3858 = fma(_3840, _3832, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3860 = fma(_3844, _3832, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3862 = -_3050;
    float _3864 = fma(_3862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2732);
    float _3866 = -_3048;
    float _3868 = fma(_3866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3856);
    float _3870 = -_3030;
    float _3872 = fma(_3870, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3858);
    float _3874 = -_3050;
    float _3876 = fma(_3874, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3860);
    float _3878 = -_3048;
    float _3880 = fma(_3878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2822);
    float _3882 = -_3030;
    float _3884 = fma(_3882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2838);
    float _3886 = _3868;
    float _3888 = _3876;
    float _3890 = _3872;
    float _3892 = _3858;
    if (!_3854)
    {
        float _3894 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3896 = _3880 + _3894;
        float _3898 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3900 = _3864 + _3898;
        float _3902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3904 = -_2838;
        float _3906 = _3904 + _3858;
        float _3908 = _3896 * _3896;
        float _3910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3912 = _3884 + _3910;
        float _3914 = -_2732;
        float _3916 = _3914 + _3860;
        float _3918 = fma(_3900, _3900, _3908);
        float _3920 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3922 = fma(_3912, _3912, _3918);
        float _3924 = sqrt(_3922);
        float _3926 = 1.0 / _3232;
        float _3928 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3930 = precise::min(_3924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3932 = _3930 * _3902;
        float _3934 = _3932 * _3926;
        float _3936 = -_2822;
        float _3938 = _3936 + _3856;
        float _3940 = _3928 * _3934;
        float _3942 = _3906 * _3934;
        float _3944 = fma(_3916, _3940, _3864);
        float _3946 = fma(_3938, _3940, _3880);
        float _3948 = fma(_3928, _3942, _3884);
        _3886 = _3946;
        _3888 = _3944;
        _3890 = _3948;
        _2788 = _3916;
    }
    float _3950 = _3886;
    float _3952 = _3888;
    float _3954 = _3890;
    float _3956 = _2788;
    float _3958 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3960 = _3950 + _3958;
    float _3962 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3964 = _3952 + _3962;
    float _3966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3968 = _3954 + _3966;
    float _3970 = _3960 * _3960;
    float _3972 = fma(_3964, _3964, _3970);
    float _3974 = fma(_3968, _3968, _3972);
    float _3976 = rsqrt(_3974);
    float _3978 = sqrt(_3974);
    float _3980 = _3976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3982 = _3964 * _3980;
    float _3984 = _3968 * _3980;
    float _3986 = _3982 * _3982;
    float _3988 = _3984 * _3984;
    float _3990 = _3986 + _3988;
    float _3992 = sqrt(_3990);
    bool _3994 = _3992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3998 = _3992 + _3996;
    float _4000 = _3968;
    float _4002 = _3970;
    float _4004 = _3998;
    float _4006 = _3960;
    float _4008 = _3956;
    float _4010 = _3982;
    if (_3994)
    {
        float _4012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4000 = _4012;
    }
    float _4014 = _4000;
    if (_3994)
    {
        float _4016 = rsqrt(_3990);
        _4002 = _4016;
    }
    float _4018 = _4002;
    float _4020 = _4018;
    if (_3994)
    {
        float _4022 = _3998 * _4014;
        _4004 = _4022;
    }
    float _4024 = _4004;
    if (_3994)
    {
        float _4026 = _4024 * 0.15915493667125701904296875;
        _3766 = _4026;
    }
    float _4028 = _3766;
    float _4030 = _3976;
    if (_3994)
    {
        float _4032 = _4028 * 6.283185482025146484375;
        float _4034 = sin(_4032);
        _4030 = _4034;
    }
    float _4036 = _4030;
    float _4038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4040 = precise::max(0.0, _4038);
    float _4042 = _4014;
    float _4044 = _4040;
    if (_3994)
    {
        float _4046 = _4028 * 6.283185482025146484375;
        float _4048 = cos(_4046);
        _4042 = _4048;
    }
    float _4050 = _4042;
    float _4052 = -_3980;
    float _4054 = -_4040;
    float _4056 = fma(_3960, _4052, _4054);
    if (_3994)
    {
        float _4058 = _4056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4006 = _4058;
    }
    float _4060 = _4006;
    float _4062 = _4036;
    float _4064 = _4060;
    if (_3994)
    {
        float _4066 = fma(_4036, _4060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4062 = _4066;
    }
    float _4068 = _4062;
    float _4070 = _4068;
    if (!_3994)
    {
        _4064 = _3988;
    }
    float _4072 = _4064;
    float _4074 = _4072;
    if (_3994)
    {
        float _4076 = _4050 + (-1.0);
        _4044 = _4076;
    }
    float _4078 = _4044;
    float _4080 = _4078;
    if (_3994)
    {
        float _4082 = _4018 * _4068;
        _4008 = _4082;
    }
    float _4084 = _4008;
    if (!_3994)
    {
        _4020 = _4056;
    }
    float _4086 = _4020;
    float _4088 = _4086;
    if (_3994)
    {
        float _4090 = _4078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3892 = _4090;
    }
    float _4092 = _3892;
    if (_3994)
    {
        float _4094 = _3982 * _4084;
        _4010 = _4094;
    }
    float _4096 = _4010;
    if (!_3994)
    {
        _4070 = _3984;
    }
    float _4098 = _4070;
    float _4100 = _4098;
    if (_3994)
    {
        float _4102 = _3984 * _4084;
        _4100 = _4102;
    }
    float _4104 = _4100;
    if (!_3994)
    {
        _4080 = _3986;
    }
    float _4106 = _4080;
    float _4108 = _4106;
    if (_3994)
    {
        float _4110 = fma(_4056, _4050, _4092);
        _4088 = _4110;
    }
    float _4112 = _4088;
    if (_3994)
    {
        float _4114 = _4096 * _4096;
        _4108 = _4114;
    }
    float _4116 = _4108;
    if (_3994)
    {
        float _4118 = _4104 * _4104;
        _4074 = _4118;
    }
    float _4120 = _4074;
    float _4122 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4124 = fma(_4112, _4112, _4116);
    float _4126 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4128 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4130 = _4124 + _4120;
    float _4132 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4122);
    float _4134 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4136 = fma(_3978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4134);
    float _4138 = precise::clamp(_4136, 0.0, 1.0);
    float _4140 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4142 = rsqrt(_4130);
    float _4144 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4132);
    float _4146 = -_4138;
    float _4148 = _4146 + 1.0;
    float _4150 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4140);
    float _4152 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4154 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4128);
    float _4156 = _4144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4158 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4150);
    float _4160 = abs(_4148);
    float _4162 = log2(_4160);
    float _4164 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4152);
    float _4166 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4154);
    float _4168 = _4158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4170 = _4156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4172 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4164);
    float _4174 = _4166 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4176 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4178 = _4142 * _4096;
    float _4180 = _4142 * _4112;
    float _4182 = _4142 * _4104;
    float _4184 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4176);
    float _4186 = _4178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4188 = -_4170;
    float _4190 = fma(_4188, _4126, 1.0);
    float _4192 = _4172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4194 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4184);
    float _4196 = -_4186;
    float _4198 = fma(_4180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4196);
    float _4200 = _4162 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4202 = log2(_4190);
    float _4204 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4206 = -_4182;
    float _4208 = fma(_4206, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4198);
    float _4210 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4212 = _4180 + 1.0;
    float _4214 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4204);
    float _4216 = fma(_4208, -0.5, 0.5);
    float _4218 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4210);
    float _4220 = exp2(_4200);
    float _4222 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4194);
    float _4224 = fma(_4208, 0.5, 0.5);
    float _4226 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4214);
    float _4228 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4218);
    float _4230 = fma(_4224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4232 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4226);
    float _4234 = 1.0 / _4222;
    float _4236 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4228);
    float _4238 = fma(_4224, _4230, -0.212114393711090087890625);
    float _4240 = _4202 * 0.693147182464599609375;
    float _4242 = fma(_4224, _4238, 1.570728778839111328125);
    float _4244 = _4240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4246 = sqrt(_4216);
    float _4248 = -_4180;
    float _4250 = fma(_4220, _4212, _4248);
    float _4252 = fma(_4250, 0.5, 0.5);
    float _4254 = _4232 * _4234;
    float _4256 = _4236 * _4234;
    float _4258 = fma(_4254, 0.5, 0.5);
    float _4260 = fma(_4256, -0.5, 0.5);
    float _4262 = _4246 * 0.636619746685028076171875;
    float3 _11076 = float3(_4258, _4260, _4244);
    float _4264 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11076, float3(0.0), isnan(_11076)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11076, float3(0.0), isnan(_11076)), level(0.0)).x;
    float3 _11087 = float3(_4258, _4260, _4244);
    float4 _4267 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11087, float3(0.0), isnan(_11087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11087, float3(0.0), isnan(_11087)), level(0.0)).xyzw;
    float _4269 = _4267.x;
    float _4271 = _4267.y;
    float _4273 = _4267.z;
    float _4275 = _4267.w;
    float _4277 = -_4242;
    float _4279 = fma(_4262, _4277, 1.0);
    float2 _11109 = float2(_4279, _4252);
    float3 _4283 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11109, float2(0.0), isnan(_11109)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11109, float2(0.0), isnan(_11109)), level(0.0)).xyz;
    float _4285 = _4283.x;
    float _4287 = _4283.y;
    float _4289 = _4283.z;
    float _4291 = _3880 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4293 = _3880 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4295 = _4162 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4297 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4291);
    float _4299 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4293);
    float _4301 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4297);
    float _4303 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4299);
    float _4305 = exp2(_4295);
    float _4307 = _4301 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4309 = _4303 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4311 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4313 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4315 = _4311 || _4313;
    bool _4317 = isnan(0.5);
    bool _4319 = _4315 || _4317;
    float _4321 = 1.0 / _4307;
    float _4323 = _4309 + _4307;
    float _4325 = -_4305;
    float _4327 = _4325 + 1.0;
    float _4329 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4331 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4333 = _4162;
    float _4335 = _4168;
    if (!_4319)
    {
        _4331 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4337 = _4331;
    float _4339 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4329);
    float _4341 = _4337;
    if (!_4319)
    {
        _2790 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4343 = _2790;
    float _4345 = _4327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4347 = _4323 * _4321;
    float _4349 = _4347 * 0.5;
    float _4351 = _4349;
    if (_4319)
    {
        _4333 = 1.0;
    }
    float _4353 = _4333;
    float _4355 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4339);
    float _4357 = _4232 + _4222;
    float _4359 = _4353;
    if (!_4319)
    {
        float _4361 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4363 = fma(_4349, _4337, _4361);
        _4341 = _4363;
    }
    float _4365 = _4341;
    if (!_4319)
    {
        float _4367 = -_4343;
        float _4369 = _4367 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4351 = _4369;
    }
    float _4371 = _4351;
    float _4373 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4355);
    float _4375 = _4365;
    if (!_4319)
    {
        float _4377 = 1.0 / _4365;
        _4375 = _4377;
    }
    float _4379 = _4375;
    float _4381 = _4371;
    if (!_4319)
    {
        float _4383 = 1.0 / _4371;
        _4381 = _4383;
    }
    float _4385 = _4381;
    out.gl_Position.x = _4232;
    out.gl_Position.y = _4236;
    out.gl_Position.z = _4373;
    out.gl_Position.w = _4222;
    if (!_4319)
    {
        float _4387 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4389 = -_4343;
        float _4391 = fma(_4379, _4387, _4389);
        _4335 = _4391;
    }
    float _4393 = _4335;
    float _4395 = _4357 * 0.5;
    float _4397 = _4373 + _4222;
    float _4399 = -_4345;
    float _4401 = _4399 + 1.0;
    float _4403 = _4397 * 0.5;
    if (!_4319)
    {
        float _4405 = _4393 * _4385;
        float _4407 = precise::clamp(_4405, 0.0, 1.0);
        _4359 = _4407;
    }
    float _4409 = _4359;
    float _4411 = _4222 * 0.5;
    float _4413 = _4409 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _4415 = _4409 > 0.0;
    bool _4417 = isnan(_4409);
    bool _4419 = _4415 || _4417;
    bool _4421 = isnan(0.0);
    bool _4423 = _4419 || _4421;
    float _4425 = fma(_4236, -0.5, _4411);
    float _4427 = _4413 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_83.x = _4395;
    out.m_83.y = _4425;
    out.m_83.z = _4403;
    out.m_83.w = _4222;
    out.m_47.x = _4427;
    float _4429 = _4345 * _4264;
    float _4431 = _4275 * _4401;
    float _4433 = _4275 * _4429;
    float _4435 = _4289 * _4429;
    float _4437 = fma(_4285, _4433, _4269);
    float _4439 = fma(_4287, _4433, _4271);
    float _4441 = fma(_4275, _4435, _4273);
    out.m_85.x = _4437;
    out.m_85.y = _4439;
    out.m_85.z = _4441;
    out.m_85.w = _4431;
    if (_4423)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4443 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4443;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3802 = false;
    bool _2168 = false;
    bool _1842 = false;
    bool _1524 = false;
    bool _1206 = false;
    bool _970 = false;
    bool _866 = false;
    bool _578 = false;
    bool _302 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4500 = as_type<float>(_120);
        out.gl_Position.z = _4500;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4569 = as_type<float>(_158);
        out.gl_Position.z = _4569;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.w;
    float _162 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _164 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _166 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _168 = _164 || _166;
    bool _170 = isnan(1.0);
    bool _172 = _168 || _170;
    float _174 = in.m_49.x;
    float _176 = in.m_49.y;
    float _178 = in.m_49.z;
    float _180 = in.m_44.x;
    float _182 = in.m_44.y;
    float _184 = in.m_44.z;
    float _186 = 0.0;
    float _188 = _162;
    if (!_172)
    {
        float _190 = _162 * _162;
        float _192 = _190 * 0.5;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _194;
    if (!_172)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_172;
    float _204 = _200;
    if (!_202)
    {
        float _206 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _208 = log2(_206);
        float _210 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _212 = _210 + 1.0;
        float _214 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _216 = _162 * _208;
        float _218 = 1.0 / _212;
        float _220 = _214 * 0.693147182464599609375;
        float _222 = exp2(_216);
        float _224 = 1.0 / _220;
        float _226 = _222 + (-1.0);
        float _228 = -_226;
        float _230 = fma(_228, _224, _162);
        float _232 = _230 * _218;
        float _234 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _234;
    }
    float _236 = _204;
    bool _238 = !_172;
    if (!_238)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = 1.0 / _246;
        float _250 = _162 * _242;
        float _252 = exp2(_250);
        float _254 = -_252;
        float _256 = _254 + 1.0;
        float _258 = _256 * _248;
        _188 = _258;
    }
    float _260 = _188;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _264 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _266 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _268 = _236 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _270 = fma(_260, _174, _264);
    float _272 = fma(_260, _176, _266);
    float _274 = fma(_260, _178, _268);
    float _276 = fma(_270, _160, _180);
    float _278 = fma(_272, _160, _182);
    float _280 = fma(_274, _160, _184);
    bool _282 = !_262;
    float _300;
    if (!_282)
    {
        float _284 = in.m_53.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_104);
        float _306 = 1.0 / _304;
        float _308 = _138 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _314 = _310 + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _310 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _310 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _340 = 1.0 / _330;
    float _342 = 1.0 / _326;
    bool _344 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _346 = 1.0 / _334;
    float _348 = 1.0 / _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _352 = _310 + _350;
    float _354 = _314 * _342;
    bool _356 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_310);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = _352 * _340;
    bool _370 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _372 = isnan(_310);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = _318 * _346;
    bool _384 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _386 = isnan(_310);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = -_380;
    float _402 = _400 + 1.0;
    bool _404 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _406 = isnan(_310);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = fma(_398, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _418 = _366 * _402;
    float _420 = _322 * _348;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _426;
    float _430 = -_366;
    float _432 = _430 + 1.0;
    bool _434 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _436 = isnan(_310);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = fma(_424, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = fma(_428, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _450 = -_394;
    float _452 = _450 + 1.0;
    float _454 = _394 * _432;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _462 = _460 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _464 = _414 * _452;
    float _466 = -_414;
    float _468 = _466 + 1.0;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _474 = fma(_462, _420, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _476 = fma(_458, _420, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _478 = _444 * _468;
    float _480 = fma(_472, _420, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _482 = -_444;
    float _484 = _482 + 1.0;
    float _486 = _416 * _478;
    float _488 = _446 * _478;
    float _490 = _448 * _478;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _492;
    float _496 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].x, _486);
    float _498 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].y, _488);
    float _500 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[143].z, _490);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _506;
    float _510 = fma(_474, _464, _496);
    float _512 = fma(_476, _464, _498);
    float _514 = fma(_480, _464, _500);
    float _516 = fma(_494, _354, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _518 = fma(_504, _354, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _520 = fma(_508, _354, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = fma(_516, _454, _510);
    float _536 = fma(_524, _368, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _538 = fma(_528, _368, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _540 = fma(_532, _368, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _542 = fma(_518, _454, _512);
    float _544 = fma(_520, _454, _514);
    float _546 = fma(_536, _418, _534);
    float _548 = fma(_538, _418, _542);
    float _550 = fma(_540, _418, _544);
    float _552 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].x, _546);
    float _554 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].y, _548);
    float _556 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[147].z, _550);
    bool _558 = !_344;
    float _576;
    if (!_558)
    {
        float _560 = in.m_53.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].x, _138);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        float _580 = float(_104);
        float _582 = 1.0 / _580;
        float _584 = _138 * _582;
        _576 = _584;
    }
    _578 = false;
    float _586 = _576;
    float _588 = in.m_51.x;
    float _590 = in.m_51.y;
    float _592 = in.m_51.z;
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _596 = _586 + _594;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _598;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _606;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _614 = 1.0 / _600;
    float _616 = 1.0 / _612;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _620 = _586 + _618;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _624 = 1.0 / _604;
    float _626 = _554 * _590;
    float _628 = _620 * _614;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _632 = _586 + _630;
    bool _634 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _636 = isnan(_586);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = _556 * _592;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _650 = _586 + _648;
    float _652 = _552 * _588;
    float _654 = 1.0 / _608;
    float _656 = _596 * _616;
    bool _658 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _660 = isnan(_586);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _670;
    bool _674 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _676 = isnan(_586);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _682 = _678 || _680;
    float _684 = float(_682);
    float _686 = fma(_672, _628, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _688 = _632 * _624;
    float _690 = -_644;
    float _692 = _690 + 1.0;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _694;
    bool _698 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _700 = isnan(_586);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = _668 * _692;
    float _712 = -_668;
    float _714 = _712 + 1.0;
    float _716 = fma(_696, _628, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _718 = _650 * _654;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _720;
    float _724 = -_684;
    float _726 = _724 + 1.0;
    float _728 = _684 * _714;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _734 = fma(_722, _628, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _736 = _586 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _738 = isnan(_586);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = _708 * _726;
    float _750 = -_708;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _762 = fma(_732, _688, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _764 = _746 * _752;
    float _766 = fma(_756, _688, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _768 = fma(_760, _688, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _770 = -_746;
    float _772 = _770 + 1.0;
    float _774 = _734 * _764;
    float _776 = _686 * _764;
    float _778 = _716 * _764;
    float _780 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].x, _774);
    float _782 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].y, _776);
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _784;
    float _788 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[107].z, _778);
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _790;
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _794;
    float _798 = fma(_786, _718, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _800 = fma(_766, _748, _780);
    float _802 = fma(_762, _748, _782);
    float _804 = fma(_768, _748, _788);
    float _806 = fma(_792, _718, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _808 = fma(_796, _718, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _812 = _810 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _822 = fma(_798, _728, _800);
    float _824 = fma(_812, _656, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _826 = fma(_816, _656, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _828 = fma(_820, _656, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _830 = fma(_806, _728, _802);
    float _832 = fma(_808, _728, _804);
    float _834 = fma(_824, _710, _822);
    float _836 = fma(_826, _710, _830);
    float _838 = fma(_828, _710, _832);
    float _840 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[111].x, _834);
    float _842 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[111].y, _836);
    float _844 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[111].z, _838);
    bool _846 = !_622;
    float _864;
    if (!_846)
    {
        float _848 = in.m_53.x;
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _852 = _848 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _854 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _856 = _854 * _850;
        float _858 = floor(_856);
        float _860 = -_858;
        float _862 = _856 + _860;
        _864 = _862;
        _866 = true;
    }
    else
    {
        float _868 = float(_104);
        float _870 = 1.0 / _868;
        float _872 = _138 * _870;
        _864 = _872;
    }
    _866 = false;
    float _874 = _864;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _878 = _874 + _876;
    bool _880 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _882 = isnan(_874);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _888 = _884 || _886;
    float _890 = float(_888);
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _896 = _874 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _898 = isnan(_874);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _908;
    float _912 = _840 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _914 = -_890;
    float _916 = _914 + 1.0;
    bool _918 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _920 = 1.0 / _894;
    float _922 = _912 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _924 = _906 * _916;
    float _926 = -_906;
    float _928 = _926 + 1.0;
    float _930 = _910 * _920;
    float _932 = _844 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _934 = fma(_930, _878, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _936 = _932 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _938 = _934 * _924;
    float _940 = _842 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _942 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[115].x, _938);
    float _944 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = fma(_890, (*spvDescriptorSet0.vp_c9)._m0[116].x, _942);
    float _948 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _922;
    out.m_55.y = _944;
    out.m_55.z = _936;
    out.m_55.w = _948;
    bool _950 = !_918;
    float _968;
    if (!_950)
    {
        float _952 = in.m_53.x;
        float _954 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _956 = _952 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _958 = fma(_956, (*spvDescriptorSet0.vp_c9)._m0[11].z, _138);
        float _960 = _958 * _954;
        float _962 = floor(_960);
        float _964 = -_962;
        float _966 = _960 + _964;
        _968 = _966;
        _970 = true;
    }
    else
    {
        float _972 = float(_104);
        float _974 = 1.0 / _972;
        float _976 = _138 * _974;
        _968 = _976;
    }
    _970 = false;
    float _978 = _968;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _982 = _978 + _980;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _986 = _978 + _984;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _988;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _996;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1002 = _978 + _1000;
    float _1004 = 1.0 / _990;
    bool _1006 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1008 = isnan(_978);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1014 = _1010 || _1012;
    float _1016 = float(_1014);
    bool _1018 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1020 = isnan(_978);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = 1.0 / _994;
    bool _1032 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1034 = 1.0 / _998;
    float _1036 = _982 * _1004;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1038;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1042;
    float _1046 = fma(_1040, _1036, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1048 = fma(_1044, _1036, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1050 = _986 * _1030;
    bool _1052 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1054 = isnan(_978);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1060 = _1056 || _1058;
    float _1062 = float(_1060);
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1064;
    float _1068 = fma(_1066, _1036, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1070 = -_1062;
    float _1072 = _1070 + 1.0;
    float _1074 = _1002 * _1034;
    float _1076 = -_1016;
    float _1078 = _1076 + 1.0;
    bool _1080 = _978 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1082 = isnan(_978);
    bool _1084 = _1080 || _1082;
    bool _1086 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1088 = _1084 || _1086;
    float _1090 = float(_1088);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1094 = _1092 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1096 = _1062 * _1078;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1100 = _1098 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1102 = _1028 * _1072;
    float _1104 = -_1028;
    float _1106 = _1104 + 1.0;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1112 = fma(_1094, _1050, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1114 = fma(_1100, _1050, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1116 = _1090 * _1106;
    float _1118 = fma(_1110, _1050, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1120 = -_1090;
    float _1122 = _1120 + 1.0;
    float _1124 = _1046 * _1116;
    float _1126 = _1048 * _1116;
    float _1128 = _1068 * _1116;
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1130;
    float _1134 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1124);
    float _1136 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1126);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1142;
    float _1146 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1128);
    float _1148 = fma(_1132, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1150 = fma(_1140, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1152 = fma(_1144, _1074, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1154 = fma(_1112, _1102, _1134);
    float _1156 = fma(_1118, _1102, _1136);
    float _1158 = fma(_1114, _1102, _1146);
    float _1160 = fma(_1148, _1096, _1154);
    float _1162 = fma(_1150, _1096, _1156);
    float _1164 = fma(_1152, _1096, _1158);
    float _1166 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[126].x, _1160);
    float _1168 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[126].y, _1162);
    float _1170 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[126].z, _1164);
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1174 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1176 = _1168 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1178 = _1170 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1180 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1182 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _1180;
    out.m_57.y = _1182;
    out.m_57.z = _1184;
    out.m_57.w = _1172;
    bool _1186 = !_1032;
    float _1204;
    if (!_1186)
    {
        float _1188 = in.m_53.x;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1192 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        float _1208 = float(_104);
        float _1210 = 1.0 / _1208;
        float _1212 = _138 * _1210;
        _1204 = _1212;
    }
    _1206 = false;
    float _1214 = _1204;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1218 = _1214 + _1216;
    bool _1220 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1222 = isnan(_1214);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1234 = _1232 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1236 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1238 = isnan(_1214);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1248;
    bool _1252 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1254 = isnan(_1214);
    bool _1256 = _1252 || _1254;
    bool _1258 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1260 = _1256 || _1258;
    float _1262 = float(_1260);
    float _1264 = -_1230;
    float _1266 = _1264 + 1.0;
    float _1268 = 1.0 / _1234;
    bool _1270 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1272 = isnan(_1214);
    bool _1274 = _1270 || _1272;
    bool _1276 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1278 = _1274 || _1276;
    float _1280 = float(_1278);
    float _1282 = -_1262;
    float _1284 = _1282 + 1.0;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1292 = 1.0 / _1288;
    float _1294 = _1250 * _1268;
    float _1296 = -_1246;
    float _1298 = _1296 + 1.0;
    float _1300 = _1246 * _1266;
    bool _1302 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1304 = isnan(_1214);
    bool _1306 = _1302 || _1304;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1310 = _1306 || _1308;
    float _1312 = float(_1310);
    float _1314 = fma(_1294, _1218, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1316 = _1262 * _1298;
    float _1318 = _1280 * _1284;
    float _1320 = -_1280;
    float _1322 = _1320 + 1.0;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1328 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1330 = isnan(_1214);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = _1312 * _1322;
    float _1342 = -_1312;
    float _1344 = _1342 + 1.0;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1348 = _1346 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1350 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1352 = isnan(_1214);
    bool _1354 = _1350 || _1352;
    bool _1356 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1358 = _1354 || _1356;
    float _1360 = float(_1358);
    float _1362 = 1.0 / _1326;
    float _1364 = _1338 * _1344;
    float _1366 = -_1338;
    float _1368 = _1366 + 1.0;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1374 = _1360 * _1368;
    float _1376 = 1.0 / _1348;
    float _1378 = _1372 * _1292;
    float _1380 = -_1360;
    float _1382 = _1380 + 1.0;
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1390 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1388;
    float _1392 = 1.0 / _1386;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1398 = _1314 * _1374;
    float _1400 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1402 = _1214 + _1400;
    float _1404 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1398);
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1410 = 1.0 / _1396;
    float _1412 = fma(_1378, _1402, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1414 = _1390 * _1376;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1418 = _1214 + _1416;
    float _1420 = fma(_1412, _1364, _1404);
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1424 = _1214 + _1422;
    float _1426 = fma(_1414, _1418, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1428 = 1.0 / _1408;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1434;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1442 = _1432 * _1362;
    float _1444 = fma(_1426, _1340, _1420);
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1448 = _1214 + _1446;
    float _1450 = _1436 * _1410;
    float _1452 = fma(_1442, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1454;
    bool _1458 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1460 = isnan(_1214);
    bool _1462 = _1458 || _1460;
    bool _1464 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1466 = _1462 || _1464;
    float _1468 = float(_1466);
    float _1470 = _1440 * _1392;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1474 = _1214 + _1472;
    float _1476 = fma(_1450, _1448, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1478 = fma(_1452, _1318, _1444);
    float _1480 = _1456 * _1428;
    float _1482 = fma(_1470, _1474, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1484 = -_1468;
    float _1486 = _1484 + 1.0;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1490 = _1214 + _1488;
    float _1492 = fma(_1476, _1316, _1478);
    float _1494 = _1230 * _1486;
    float _1496 = fma(_1480, _1490, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1498 = fma(_1482, _1300, _1492);
    float _1500 = fma(_1496, _1494, _1498);
    float _1502 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1500);
    out.m_59.x = _1502;
    bool _1504 = !_1290;
    float _1522;
    if (!_1504)
    {
        float _1506 = in.m_53.x;
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1510 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[14].y, _138);
        float _1514 = _1512 * _1508;
        float _1516 = floor(_1514);
        float _1518 = -_1516;
        float _1520 = _1514 + _1518;
        _1522 = _1520;
        _1524 = true;
    }
    else
    {
        float _1526 = float(_104);
        float _1528 = 1.0 / _1526;
        float _1530 = _138 * _1528;
        _1522 = _1530;
    }
    _1524 = false;
    float _1532 = _1522;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1536 = _1532 + _1534;
    bool _1538 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1540 = isnan(_1532);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1554 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1556 = isnan(_1532);
    bool _1558 = _1554 || _1556;
    bool _1560 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1562 = _1558 || _1560;
    float _1564 = float(_1562);
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1568 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1566;
    bool _1570 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1572 = isnan(_1532);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1578 = _1574 || _1576;
    float _1580 = float(_1578);
    float _1582 = -_1548;
    float _1584 = _1582 + 1.0;
    float _1586 = 1.0 / _1552;
    bool _1588 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1590 = isnan(_1532);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1596 = _1592 || _1594;
    float _1598 = float(_1596);
    float _1600 = -_1580;
    float _1602 = _1600 + 1.0;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1606 = _1604 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1608 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1610 = 1.0 / _1606;
    float _1612 = _1568 * _1586;
    float _1614 = -_1564;
    float _1616 = _1614 + 1.0;
    float _1618 = _1564 * _1584;
    bool _1620 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1622 = isnan(_1532);
    bool _1624 = _1620 || _1622;
    bool _1626 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1628 = _1624 || _1626;
    float _1630 = float(_1628);
    float _1632 = fma(_1612, _1536, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1634 = _1580 * _1616;
    float _1636 = _1598 * _1602;
    float _1638 = -_1598;
    float _1640 = _1638 + 1.0;
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1644 = _1642 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1646 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1648 = isnan(_1532);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1654 = _1650 || _1652;
    float _1656 = float(_1654);
    float _1658 = _1630 * _1640;
    float _1660 = -_1630;
    float _1662 = _1660 + 1.0;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1666 = _1664 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1668 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1670 = isnan(_1532);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = 1.0 / _1644;
    float _1682 = _1656 * _1662;
    float _1684 = -_1656;
    float _1686 = _1684 + 1.0;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1692 = _1678 * _1686;
    float _1694 = 1.0 / _1666;
    float _1696 = _1690 * _1610;
    float _1698 = -_1678;
    float _1700 = _1698 + 1.0;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1704 = _1702 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1708 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1706;
    float _1710 = 1.0 / _1704;
    float _1712 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1714 = _1712 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1716 = _1632 * _1692;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1720 = _1532 + _1718;
    float _1722 = fma(_1700, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1716);
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1728 = 1.0 / _1714;
    float _1730 = fma(_1696, _1720, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1732 = _1708 * _1694;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1736 = _1532 + _1734;
    float _1738 = fma(_1730, _1682, _1722);
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1742 = _1532 + _1740;
    float _1744 = fma(_1732, _1736, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1746 = 1.0 / _1726;
    float _1748 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1750 = _1748 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1752 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1752;
    float _1756 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1758 = _1756 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1760 = _1750 * _1680;
    float _1762 = fma(_1744, _1658, _1738);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1766 = _1532 + _1764;
    float _1768 = _1754 * _1728;
    float _1770 = fma(_1760, _1742, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1772;
    bool _1776 = _1532 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1778 = isnan(_1532);
    bool _1780 = _1776 || _1778;
    bool _1782 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1784 = _1780 || _1782;
    float _1786 = float(_1784);
    float _1788 = _1758 * _1710;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1792 = _1532 + _1790;
    float _1794 = fma(_1768, _1766, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1796 = fma(_1770, _1636, _1762);
    float _1798 = _1774 * _1746;
    float _1800 = fma(_1788, _1792, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1802 = -_1786;
    float _1804 = _1802 + 1.0;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1808 = _1532 + _1806;
    float _1810 = fma(_1794, _1634, _1796);
    float _1812 = _1548 * _1804;
    float _1814 = fma(_1798, _1808, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1816 = fma(_1800, _1618, _1810);
    float _1818 = fma(_1814, _1812, _1816);
    float _1820 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1818);
    out.m_61.x = _1820;
    bool _1822 = !_1608;
    float _1840;
    if (!_1822)
    {
        float _1824 = in.m_53.x;
        float _1826 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1828 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1830 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[14].z, _138);
        float _1832 = _1830 * _1826;
        float _1834 = floor(_1832);
        float _1836 = -_1834;
        float _1838 = _1832 + _1836;
        _1840 = _1838;
        _1842 = true;
    }
    else
    {
        float _1844 = float(_104);
        float _1846 = 1.0 / _1844;
        float _1848 = _138 * _1846;
        _1840 = _1848;
    }
    _1842 = false;
    float _1850 = _1840;
    float _1852 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1854 = _1850 + _1852;
    bool _1856 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1858 = isnan(_1850);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1872 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1874 = isnan(_1850);
    bool _1876 = _1872 || _1874;
    bool _1878 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1880 = _1876 || _1878;
    float _1882 = float(_1880);
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1884;
    bool _1888 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1890 = isnan(_1850);
    bool _1892 = _1888 || _1890;
    bool _1894 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1896 = _1892 || _1894;
    float _1898 = float(_1896);
    float _1900 = -_1866;
    float _1902 = _1900 + 1.0;
    float _1904 = 1.0 / _1870;
    bool _1906 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1908 = isnan(_1850);
    bool _1910 = _1906 || _1908;
    bool _1912 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1914 = _1910 || _1912;
    float _1916 = float(_1914);
    float _1918 = -_1898;
    float _1920 = _1918 + 1.0;
    float _1922 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1924 = _1922 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1926 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].w;
    float _1928 = 1.0 / _1924;
    float _1930 = _1886 * _1904;
    float _1932 = -_1882;
    float _1934 = _1932 + 1.0;
    float _1936 = _1882 * _1902;
    bool _1938 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1940 = isnan(_1850);
    bool _1942 = _1938 || _1940;
    bool _1944 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1946 = _1942 || _1944;
    float _1948 = float(_1946);
    float _1950 = fma(_1930, _1854, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1952 = _1898 * _1934;
    float _1954 = _1916 * _1920;
    float _1956 = -_1916;
    float _1958 = _1956 + 1.0;
    float _1960 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1962 = _1960 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1964 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1966 = isnan(_1850);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1972 = _1968 || _1970;
    float _1974 = float(_1972);
    float _1976 = _1948 * _1958;
    float _1978 = -_1948;
    float _1980 = _1978 + 1.0;
    float _1982 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1984 = _1982 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1986 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1988 = isnan(_1850);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1994 = _1990 || _1992;
    float _1996 = float(_1994);
    float _1998 = 1.0 / _1962;
    float _2000 = _1974 * _1980;
    float _2002 = -_1974;
    float _2004 = _2002 + 1.0;
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2008 = _2006 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2010 = _1996 * _2004;
    float _2012 = 1.0 / _1984;
    float _2014 = _2008 * _1928;
    float _2016 = -_1996;
    float _2018 = _2016 + 1.0;
    float _2020 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2022 = _2020 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2024 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2024;
    float _2028 = 1.0 / _2022;
    float _2030 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2032 = _2030 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2034 = _1950 * _2010;
    float _2036 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2038 = _1850 + _2036;
    float _2040 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2034);
    float _2042 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2044 = _2042 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2046 = 1.0 / _2032;
    float _2048 = fma(_2014, _2038, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2050 = _2026 * _2012;
    float _2052 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2054 = _1850 + _2052;
    float _2056 = fma(_2048, _2000, _2040);
    float _2058 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2060 = _1850 + _2058;
    float _2062 = fma(_2050, _2054, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2064 = 1.0 / _2044;
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2068 = _2066 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2070 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2070;
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2076 = _2074 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2078 = _2068 * _1998;
    float _2080 = fma(_2062, _1976, _2056);
    float _2082 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2084 = _1850 + _2082;
    float _2086 = _2072 * _2046;
    float _2088 = fma(_2078, _2060, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _2090;
    bool _2094 = _1850 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2096 = isnan(_1850);
    bool _2098 = _2094 || _2096;
    bool _2100 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2102 = _2098 || _2100;
    float _2104 = float(_2102);
    float _2106 = _2076 * _2028;
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2110 = _1850 + _2108;
    float _2112 = fma(_2086, _2084, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2114 = fma(_2088, _1954, _2080);
    float _2116 = _2092 * _2064;
    float _2118 = fma(_2106, _2110, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2120 = -_2104;
    float _2122 = _2120 + 1.0;
    float _2124 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2126 = _1850 + _2124;
    float _2128 = fma(_2112, _1952, _2114);
    float _2130 = _1866 * _2122;
    float _2132 = fma(_2116, _2126, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2134 = fma(_2118, _1936, _2128);
    float _2136 = fma(_2132, _2130, _2134);
    float _2138 = fma(_2104, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2136);
    out.m_63.x = _2138;
    bool _2140 = !_1926;
    float _2142 = _1952;
    float _2144 = _2130;
    float _2146 = _2132;
    int _2164;
    float _2166;
    if (!_2140)
    {
        float _2148 = in.m_53.x;
        float _2150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].w;
        float _2152 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[15].w;
        float _2154 = fma(_2152, (*spvDescriptorSet0.vp_c9)._m0[14].w, _138);
        float _2156 = _2154 * _2150;
        float _2158 = floor(_2156);
        float _2160 = -_2158;
        float _2162 = _2156 + _2160;
        _2164 = as_type<int>(_2156);
        _2166 = _2162;
        _2168 = true;
    }
    else
    {
        float _2170 = float(_104);
        float _2172 = 1.0 / _2170;
        float _2174 = _138 * _2172;
        _2164 = as_type<int>(_2172);
        _2166 = _2174;
    }
    _2168 = false;
    int _2176 = _2164;
    float _2178 = _2166;
    float _2180 = in.m_53.y;
    int _2182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2184 = _2182 != 0;
    float _2186 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[94].z + (*spvDescriptorSet0.vp_c9)._m0[94].y;
    float _2192 = 0.0;
    int _2194 = _2176;
    if (_2184)
    {
        float _2196 = in.m_53.x;
        _2192 = _2196;
    }
    float _2198 = _2192;
    float _2200 = 0.0;
    if (_2184)
    {
        float _2202 = in.m_53.z;
        _2200 = _2202;
    }
    float _2204 = _2200;
    float _2206 = _2180 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2208 = as_type<int>(_2206);
    if (_2184)
    {
        _2142 = _2180;
    }
    float _2210 = _2142;
    float _2212 = fma(_2206, -2.0, _2186);
    float _2214 = _2210;
    if (_2184)
    {
        _2208 = 0;
        _2194 = 0;
    }
    int _2216 = _2208;
    int _2218 = _2194;
    int _2220 = _2216;
    int _2222 = _2218;
    float _2224 = _2198;
    if (_2184)
    {
        _2144 = _2198;
    }
    float _2226 = _2144;
    float _2228 = _2226;
    float _2230 = _2204;
    if (_2184)
    {
        _2146 = _2204;
    }
    float _2232 = _2146;
    float _2234 = _2232;
    if (!_2184)
    {
        float _2236 = in.m_53.x;
        float _2238 = _2180 * 3.1415927410125732421875;
        float _2240 = in.m_53.z;
        float _2242 = _2238 * 0.15915493667125701904296875;
        float _2244 = _2242 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        float _2248 = _2236 * 3.1415927410125732421875;
        float _2250 = _2248 * 0.15915493667125701904296875;
        float _2252 = _2240 * 3.1415927410125732421875;
        float _2254 = _2252 * 0.15915493667125701904296875;
        float _2256 = _2250 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        float _2260 = _2254 * 6.283185482025146484375;
        float _2262 = sin(_2260);
        _2220 = 2;
        _2234 = _2262;
        _2222 = 1;
        _2224 = _2236;
        _2214 = _2246;
        _2228 = _2258;
        _2230 = _2240;
    }
    int _2264 = _2220;
    float _2266 = _2234;
    int _2268 = _2222;
    float _2270 = _2224;
    float _2272 = _2214;
    float _2274 = _2228;
    float _2276 = _2230;
    bool _2278 = _2264 != 2;
    float _2280 = fma(_2266, (*spvDescriptorSet0.vp_c9)._m0[94].z, _2190);
    bool _2282 = _2268 != 1;
    float _2284 = _2270 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2286 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2288 = -_2188;
    float _2290 = fma(_2284, 2.0, _2288);
    float _2292 = _2274 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2296 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2298 = fma(_2274, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2294);
    float _2300 = as_type<float>(_2264);
    float _2302 = as_type<float>(_2268);
    float _2304 = _2272;
    if (_2278)
    {
        _2300 = _2270;
    }
    float _2306 = _2300;
    float _2308 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2310 = log2(_2308);
    float _2312 = _2306;
    if (!_2278)
    {
        _2312 = _2276;
    }
    float _2314 = _2312;
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    if (!_2282)
    {
        _2302 = _2180;
    }
    float _2318 = _2302;
    float _2320 = fma(_2272, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2296);
    float _2322 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2324 = _2318;
    float _2326 = _2322;
    if (!_2282)
    {
        _2304 = _2318;
    }
    float _2328 = _2304;
    float _2330 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2332 = _2328;
    float _2334 = _2330;
    if (_2282)
    {
        _2324 = _2270;
    }
    float _2336 = _2324;
    float _2338 = -_2316;
    float _2340 = fma(_2292, 2.0, _2338);
    float _2342 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2344 = fma(_2336, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2330);
    float _2346 = _2336;
    if (!_2282)
    {
        _2346 = _2276;
    }
    float _2348 = _2346;
    float _2350 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2352 = _2348;
    if (_2282)
    {
        _2352 = _2180;
    }
    float _2354 = _2352;
    float _2356 = _2310 * _138;
    if (_2282)
    {
        _2332 = _2270;
    }
    float _2358 = _2332;
    float _2360 = -_2342;
    float _2362 = fma(_2322, 2.0, _2360);
    if (!_2282)
    {
        _2326 = _2276;
    }
    float _2364 = _2326;
    float _2366 = fma(_2354, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2350);
    float _2368 = exp2(_2356);
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2372 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2374 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2376 = 1.0 + _2374;
    float _2378 = _2364;
    if (_2282)
    {
        _2378 = _2180;
    }
    float _2380 = _2378;
    float _2382 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (_2278)
    {
        _2334 = _2180;
    }
    float _2384 = _2334;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2390 = _2384;
    if (!_2278)
    {
        _2390 = _2270;
    }
    float _2392 = _2390;
    float _2394 = -_2370;
    float _2396 = fma(_2372, 2.0, _2394);
    float _2398 = 1.0 / _2376;
    float _2400 = fma(_2286, -2.0, _2382);
    float _2402 = fma(_2388, -2.0, _2386);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2406 = _2392 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2408 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2410 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2414 = _2412 != 0;
    float _2416 = fma(_2180, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2404);
    bool _2418 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2420 = isnan(1.0);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2426 = _2422 || _2424;
    float _2428 = fma(_2180, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2408);
    float _2430 = -_2368;
    float _2432 = _2430 + 1.0;
    float _2434 = fma(_2406, -2.0, _2410);
    bool _2436 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2438 = isnan(0.0);
    bool _2440 = _2436 || _2438;
    bool _2442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2444 = _2440 || _2442;
    float _2446 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2450 = _2180 * 2.0;
    float _2452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _2454 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2416);
    float _2456 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2428);
    float _2458 = _2444 ? _2432 : 0.0;
    float _2460 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2446);
    float _2462 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2448);
    float _2464 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2320);
    float _2466 = -_138;
    float _2468 = fma(_2466, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2340);
    float _2470 = floor(_2450);
    float _2472 = in.m_65.x;
    float _2474 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2400);
    float _2476 = -_138;
    float _2478 = fma(_2476, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2362);
    float _2480 = _138 * 0.00999999977648258209228515625;
    float _2482 = 0.0;
    if (_2414)
    {
        float _2484 = in.m_53.x;
        _2482 = _2484;
    }
    float _2486 = _2482;
    float _2488 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2212);
    float _2490 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2460);
    float _2492 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2462);
    float _2494 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[94].x, _2280);
    float _2496 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2298);
    float _2498 = -_138;
    float _2500 = fma(_2498, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2290);
    float _2502 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2344);
    float _2504 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2366);
    float _2506 = -_138;
    float _2508 = fma(_2506, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2396);
    float _2510 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2402);
    float _2512 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2434);
    if (_2426)
    {
        float _2514 = _2458 * _2398;
        _142 = _2514;
    }
    float _2516 = _142;
    float _2518 = _2276 * 2.0;
    float _2520 = _2270 * 2.0;
    float _2522 = in.m_53.w;
    float _2524 = _2516 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _2526 = floor(_2518);
    bool _2528 = _2470 > 0.0;
    float _2530 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _2532 = _2524 * _2452;
    bool _2534 = _2470 >= 0.0;
    bool _2536 = isnan(_2470);
    bool _2538 = _2534 || _2536;
    bool _2540 = isnan(0.0);
    bool _2542 = _2538 || _2540;
    float _2544 = _278 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2546 = in.m_65.y;
    float _2548 = fma(_2270, (*spvDescriptorSet0.vp_c9)._m0[203].z, _2532);
    float _2550 = floor(_2520);
    int _2552 = as_type<int>(_2518);
    float _2554 = _2472;
    if (_2414)
    {
        float _2556 = -_2472;
        float _2558 = _2556 + 1.0;
        _2552 = as_type<int>(_2558);
    }
    int _2560 = _2552;
    bool _2562 = false;
    if (_2414)
    {
        bool _2564 = _2486 > 0.5;
        _2562 = _2564;
    }
    bool _2566 = _2562;
    float _2568 = _2548 + 0.25;
    float _2570 = 0.0;
    if (!_2414)
    {
        _2570 = _2472;
    }
    float _2572 = _2570;
    float _2574 = _278 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2576 = _2572;
    if (_2414)
    {
        float _2578 = _2566 ? as_type<float>(_2560) : _2472;
        _2576 = _2578;
    }
    float _2580 = _2576;
    float _2582 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2544);
    float _2584 = floor(_2548);
    bool _2586 = _2526 > 0.0;
    float _2588 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2574);
    bool _2590 = _2526 >= 0.0;
    bool _2592 = isnan(_2526);
    bool _2594 = _2590 || _2592;
    bool _2596 = isnan(0.0);
    bool _2598 = _2594 || _2596;
    float _2600 = _2270 * 78.233001708984375;
    int _2602 = _2542 ? 0 : 1;
    float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2606 = _2178 + _2604;
    bool _2608 = _2522 > 0.5;
    float _2610 = floor(_2568);
    bool _2612 = _2550 > 0.0;
    float _2614 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2616 = _2178 + _2614;
    bool _2618 = _2550 >= 0.0;
    bool _2620 = isnan(_2550);
    bool _2622 = _2618 || _2620;
    bool _2624 = isnan(0.0);
    bool _2626 = _2622 || _2624;
    float _2628 = _2180 + _2276;
    int _2630 = _2598 ? 0 : 1;
    float _2632 = -_2546;
    float _2634 = _2632 + 1.0;
    int _2636 = ~_2602;
    int _2638 = _2636 + 1;
    int _2640 = _2638 + 1;
    float _2642 = -_2584;
    float _2644 = _2548 + _2642;
    int _2646 = _2626 ? 0 : 1;
    float _2648 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _2652 = _2650 != 0;
    int _2654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _2656 = _2654 != 0;
    int _2658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _2660 = _2658 != 0;
    float _2662 = _2628 + (-1.0);
    int _2664 = _2640;
    if (!_2528)
    {
        int _2666 = ~_2602;
        int _2668 = _2666 + 1;
        _2664 = _2668;
    }
    int _2670 = _2664;
    float _2672 = _652 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2674 = ~_2630;
    int _2676 = _2674 + 1;
    int _2678 = _2676 + 1;
    float _2680 = -_2610;
    float _2682 = _2568 + _2680;
    int _2684 = _2678;
    float _2686 = _2682;
    if (!_2586)
    {
        int _2688 = ~_2630;
        int _2690 = _2688 + 1;
        _2684 = _2690;
    }
    int _2692 = _2684;
    float _2694 = _278 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _2696 = _2644 >= 0.5;
    bool _2698 = isnan(_2644);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan(0.5);
    bool _2704 = _2700 || _2702;
    float _2706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2708 = _2180 > 0.5;
    float _2710 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2694);
    int _2712 = ~_2646;
    int _2714 = _2712 + 1;
    int _2716 = _2714 + 1;
    float _2718 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2710);
    int _2720 = _2716;
    if (!_2612)
    {
        int _2722 = ~_2646;
        int _2724 = _2722 + 1;
        _2720 = _2724;
    }
    int _2726 = _2720;
    float _2728 = (*spvDescriptorSet0.vp_c9)._m0[191].z * 0.4799999892711639404296875;
    int _2730 = _2608 ? as_type<int>(_2634) : as_type<int>(_2546);
    float _2732 = _2718 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2736 = _2734 != 0;
    int _2738 = _2708 ? as_type<int>(_2634) : as_type<int>(_2546);
    float _2740 = 1.0 / _2728;
    float _2742 = _2736 ? as_type<float>(_2738) : _2546;
    int _2744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2746 = _2744 != 0;
    float _2748 = _2746 ? as_type<float>(_2730) : _2546;
    bool _2750 = _2682 > 0.5;
    bool _2752 = !_2660;
    int _2754 = _2752 ? 0 : 1;
    float _2756 = _2530 * _2740;
    int _2758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2760 = _2758 != 0;
    int _2762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2764 = _2762 != 0;
    int _2766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2768 = _2766 != 0;
    float _2770 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2772 = _2770 + (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _2774 = !_2704;
    float _2776 = _2774 ? 0.5 : (-0.5);
    float _2778 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2582);
    int _2780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2782 = _2780 != 0;
    float _2784 = floor(_2756);
    bool _2786 = _2764;
    float _2788 = _2732;
    float _2790 = 0.5;
    if (_2750)
    {
        float _2792 = -_2682;
        float _2794 = _2792 + 1.0;
        _2686 = _2794;
    }
    float _2796 = _2686;
    bool _2798 = !_2652;
    int _2800 = _2798 ? 0 : 1;
    float _2802 = fma(_280, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2588);
    bool _2804 = !_2656;
    int _2806 = _2804 ? 0 : 1;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2810 = _2808 + (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _2812 = !_2760;
    int _2814 = _2812 ? 0 : 1;
    float _2816 = 1.0 / _2772;
    int _2818 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2820 = _2818 != 0;
    float _2822 = _2778 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2826 = _2824 != 0;
    float _2828 = _276;
    if (_2782)
    {
        float _2830 = in.m_53.z;
        _2828 = _2830;
    }
    float _2832 = _2828;
    int _2834 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2836 = _2834 != 0;
    float _2838 = _2802 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2842 = _2840 != 0;
    float _2844 = 1.0 / _2810;
    float _2846 = fma(_2784, 12.98980045318603515625, _2600);
    float _2848 = fma(_2796, 4.0, -1.0);
    float _2850 = -(*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2852 = _2850 + (*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2854 = -(*spvDescriptorSet0.vp_c9)._m0[183].x;
    float _2856 = (*spvDescriptorSet0.vp_c9)._m0[184].x + _2854;
    float _2858 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2860 = _2858 + (*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _2864 = _2862 + (*spvDescriptorSet0.vp_c9)._m0[190].w;
    float _2866 = _2856 * _2816;
    float _2868 = 1.0 / _2852;
    float _2870 = -(*spvDescriptorSet0.vp_c9)._m0[184].x;
    float _2872 = _2870 + (*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2874 = -(*spvDescriptorSet0.vp_c9)._m0[186].w;
    float _2876 = _2874 + (*spvDescriptorSet0.vp_c9)._m0[187].w;
    float _2878 = -(*spvDescriptorSet0.vp_c9)._m0[186].x;
    float _2880 = _2878 + (*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2882 = _2872 * _2844;
    float _2884 = -(*spvDescriptorSet0.vp_c9)._m0[185].x;
    float _2886 = (*spvDescriptorSet0.vp_c9)._m0[186].x + _2884;
    float _2888 = 1.0 / _2864;
    float _2890 = _2846 * 0.15915493667125701904296875;
    float _2892 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2894 = _2892 + (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _2896 = !_2764;
    int _2898 = _2896 ? 0 : 1;
    float _2900 = -(*spvDescriptorSet0.vp_c9)._m0[187].x;
    float _2902 = (*spvDescriptorSet0.vp_c9)._m0[188].x + _2900;
    float _2904 = -(*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2906 = (*spvDescriptorSet0.vp_c9)._m0[190].x + _2904;
    if (_2782)
    {
        bool _2908 = _2832 > 0.5;
        _2786 = _2908;
    }
    bool _2910 = _2786;
    float _2912 = 1.0 / _2860;
    float _2914 = -(*spvDescriptorSet0.vp_c9)._m0[184].w;
    float _2916 = _2178 + _2914;
    float _2918 = _2902 * _2868;
    float _2920 = -(*spvDescriptorSet0.vp_c9)._m0[183].w;
    float _2922 = _2178 + _2920;
    int _2924 = abs(_2814);
    float _2926 = fma(_2882, _2916, (*spvDescriptorSet0.vp_c9)._m0[184].x);
    float _2928 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2930 = _2822 + _2928;
    float _2932 = fma(_2866, _2922, (*spvDescriptorSet0.vp_c9)._m0[183].x);
    float _2934 = 1.0 / _2876;
    float _2936 = _2906 * _2888;
    float _2938 = -(*spvDescriptorSet0.vp_c9)._m0[185].w;
    float _2940 = _2178 + _2938;
    float _2942 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2944 = _2732 + _2942;
    float _2946 = fma(_2918, _2606, (*spvDescriptorSet0.vp_c9)._m0[187].x);
    float _2948 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2950 = in.m_67.w;
    float _2952 = float(_2924);
    float _2954 = _2890 * 6.283185482025146484375;
    float _2956 = sin(_2954);
    float _2958 = _2886 * _2912;
    float _2960 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2962 = _2838 + _2960;
    float _2964 = fma(_2948, _2742, -0.5);
    float _2966 = _2706 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2968 = fma(_2958, _2940, (*spvDescriptorSet0.vp_c9)._m0[185].x);
    float _2970 = _2930 * _2930;
    float _2972 = 1.0 / _2894;
    float _2974 = _2880 * _2934;
    float _2976 = fma(_2944, _2944, _2970);
    float _2978 = -(*spvDescriptorSet0.vp_c9)._m0[188].x;
    float _2980 = _2978 + (*spvDescriptorSet0.vp_c9)._m0[189].x;
    float _2982 = in.m_67.x;
    float _2984 = fma(_2974, _2616, (*spvDescriptorSet0.vp_c9)._m0[186].x);
    float _2986 = fma(_2962, _2962, _2976);
    float _2988 = -(*spvDescriptorSet0.vp_c9)._m0[188].w;
    float _2990 = _2178 + _2988;
    float _2992 = _2956 * 43758.546875;
    float _2994 = fma(_2966, _2748, -0.5);
    float _2996 = rsqrt(_2986);
    float _2998 = -(*spvDescriptorSet0.vp_c9)._m0[189].w;
    float _3000 = _2178 + _2998;
    float _3002 = -_2488;
    float _3004 = fma(_2454, _2964, _3002);
    float _3006 = _2180 + _2270;
    float _3008 = fma(_2936, _3000, (*spvDescriptorSet0.vp_c9)._m0[189].x);
    float _3010 = _2980 * _2972;
    float _3012 = _2270 + _2276;
    float _3014 = floor(_2992);
    float _3016 = _3006 + (-1.0);
    float _3018 = fma(_3010, _2990, (*spvDescriptorSet0.vp_c9)._m0[188].x);
    float _3020 = _3012 + (-1.0);
    float _3022 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3024 = _2548 * 6.283185482025146484375;
    float _3026 = fma(_2662, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3028 = fma(_3020, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3030 = _2962 * _2996;
    float _3032 = _3024 * 0.15915493667125701904296875;
    float _3034 = _2270 + (-0.5);
    bool _3036 = !_2768;
    int _3038 = _3036 ? 0 : 1;
    float _3040 = -_3030;
    float _3042 = fma(_3040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2962);
    out.m_69.w = _2950;
    float _3044 = -_3014;
    float _3046 = _2992 + _3044;
    float _3048 = _2930 * _2996;
    float _3050 = _2944 * _2996;
    float _3052 = _3032 * 6.283185482025146484375;
    float _3054 = sin(_3052);
    float _3056 = _3046 + _2982;
    float _3058 = -_3048;
    float _3060 = fma(_3058, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2930);
    float _3062 = -_3050;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2944);
    float _3066 = _2848 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _3068 = _3056 * 6.283185482025146484375;
    float _3070 = _3060 * _3060;
    bool _3072 = _2180 > 0.5;
    float _3074 = fma(_3068, (*spvDescriptorSet0.vp_c9)._m0[191].y, 1.57079637050628662109375);
    float _3076 = fma(_3064, _3064, _3070);
    int _3078 = abs(_2898);
    float _3080 = in.m_71.x;
    float _3082 = in.m_71.y;
    float _3084 = in.m_71.z;
    float _3086 = float(_2692);
    float _3088 = _3074 * 0.15915493667125701904296875;
    float _3090 = float(_2726);
    float _3092 = fma(_3042, _3042, _3076);
    float _3094 = _2952 * _3086;
    float _3096 = _3088 * 6.283185482025146484375;
    float _3098 = cos(_3096);
    float _3100 = float(_3078);
    float _3102 = _3094 * (-2.0);
    float _3104 = (*spvDescriptorSet0.vp_c9)._m0[191].x + (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _3106 = abs(_2806);
    float _3108 = _3100 * _3090;
    int _3110 = abs(_2800);
    float _3112 = 1.0 / _3104;
    int _3114 = as_type<int>(_3100);
    if (_2826)
    {
        float _3116 = -_2472;
        float _3118 = _3116 + 1.0;
        _3114 = as_type<int>(_3118);
    }
    int _3120 = _3114;
    float _3122 = fma(_3102, _3080, _3080);
    float _3124 = _3054 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _3126 = fma(_3022, _3102, _3022);
    float _3128 = _3108 * (-2.0);
    float _3130 = fma(_3034, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3122);
    float _3132 = _2950 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _3134 = abs(_3038);
    float _3136 = fma(_3128, _3082, _3082);
    float _3138 = float(_3106);
    float _3140 = _2776 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _3142 = _3140 * 2.0;
    float _3144 = fma(_3098, _3132, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _3146 = _2530 * 0.15915493667125701904296875;
    float _3148 = _3138 * _3142;
    float _3150 = float(_3110);
    float _3152 = _3144 * _3112;
    float _3154 = float(_2670);
    float _3156 = _2180 + (-0.5);
    int _3158 = abs(_2754);
    float _3160 = fma(_3150, _3124, _3148);
    float _3162 = _3146 * 6.283185482025146484375;
    float _3164 = cos(_3162);
    float _3166 = in.m_73.x;
    float _3168 = in.m_73.y;
    float _3170 = in.m_73.z;
    float _3172 = float(_3158);
    float _3174 = _3152 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _3176 = fma(_3156, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3136);
    float _3178 = fma(_3026, _3128, _3026);
    float _3180 = _2276 + (-0.5);
    float _3182 = fma(_3172, _3066, _3160);
    float _3184 = precise::max(0.0, _3174);
    float _3186 = sqrt(_3092);
    float _3188 = float(_3134);
    float _3190 = fma(_3182, 3.1415927410125732421875, _3084);
    float _3192 = precise::min(_3184, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _3194 = fma(_3126, _2516, _3130);
    float _3196 = fma(_3178, _2516, _3176);
    float _3198 = _3188 * _3154;
    float _3200 = fma(_3164, 0.5, 0.5);
    float _3202 = _3194 * 0.15915493667125701904296875;
    float _3204 = _3196 * 0.15915493667125701904296875;
    float _3206 = _3198 * (-2.0);
    float _3208 = fma(_3192, _3200, 1.0);
    float _3210 = _3202 * 6.283185482025146484375;
    float _3212 = sin(_3210);
    bool _3214 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[185].w;
    bool _3216 = isnan(_2178);
    bool _3218 = _3214 || _3216;
    bool _3220 = isnan((*spvDescriptorSet0.vp_c9)._m0[185].w);
    bool _3222 = _3218 || _3220;
    float _3224 = float(_3222);
    float _3226 = fma(_3190, _3206, _3190);
    float _3228 = fma(_3028, _3206, _3028);
    float _3230 = _3208 * _3166;
    float _3232 = _2996 * _3186;
    float _3234 = fma(_3180, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3226);
    float _3236 = _3208 * _3170;
    float _3238 = _3202 * 6.283185482025146484375;
    float _3240 = cos(_3238);
    float _3242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3230);
    float _3244 = fma(_3228, _2516, _3234);
    float _3246 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3248 = _2672 * _3232;
    bool _3250 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[184].w;
    bool _3252 = isnan(_2178);
    bool _3254 = _3250 || _3252;
    bool _3256 = isnan((*spvDescriptorSet0.vp_c9)._m0[184].w);
    bool _3258 = _3254 || _3256;
    float _3260 = float(_3258);
    float _3262 = _3244 * 0.15915493667125701904296875;
    float _3264 = _626 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3266 = _3204 * 6.283185482025146484375;
    float _3268 = sin(_3266);
    float _3270 = _3208 * _3168;
    float _3272 = _3246 * _3232;
    float _3274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3236);
    float _3276 = _3248 * _3242;
    float _3278 = _3264 * _3232;
    float _3280 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3270);
    float _3282 = _3272 * _3274;
    float _3284 = _3204 * 6.283185482025146484375;
    float _3286 = cos(_3284);
    bool _3288 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[188].w;
    bool _3290 = isnan(_2178);
    bool _3292 = _3288 || _3290;
    bool _3294 = isnan((*spvDescriptorSet0.vp_c9)._m0[188].w);
    bool _3296 = _3292 || _3294;
    float _3298 = float(_3296);
    float _3300 = _3278 * _3280;
    bool _3302 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[186].w;
    bool _3304 = isnan(_2178);
    bool _3306 = _3302 || _3304;
    bool _3308 = isnan((*spvDescriptorSet0.vp_c9)._m0[186].w);
    bool _3310 = _3306 || _3308;
    float _3312 = float(_3310);
    bool _3314 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[187].w;
    bool _3316 = isnan(_2178);
    bool _3318 = _3314 || _3316;
    bool _3320 = isnan((*spvDescriptorSet0.vp_c9)._m0[187].w);
    bool _3322 = _3318 || _3320;
    float _3324 = float(_3322);
    float _3326 = -_3298;
    float _3328 = _3326 + 1.0;
    bool _3330 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[190].w;
    bool _3332 = isnan(_2178);
    bool _3334 = _3330 || _3332;
    bool _3336 = isnan((*spvDescriptorSet0.vp_c9)._m0[190].w);
    bool _3338 = _3334 || _3336;
    float _3340 = float(_3338);
    float _3342 = _3262 * 6.283185482025146484375;
    float _3344 = sin(_3342);
    float _3346 = _3240 * _3268;
    float _3348 = _3212 * _3268;
    float _3350 = -_3312;
    float _3352 = _3350 + 1.0;
    float _3354 = _3324 * _3328;
    bool _3356 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[189].w;
    bool _3358 = isnan(_2178);
    bool _3360 = _3356 || _3358;
    bool _3362 = isnan((*spvDescriptorSet0.vp_c9)._m0[189].w);
    bool _3364 = _3360 || _3362;
    float _3366 = float(_3364);
    float _3368 = -_3340;
    float _3370 = _3368 + 1.0;
    float _3372 = _3262 * 6.283185482025146484375;
    float _3374 = cos(_3372);
    float _3376 = _3212 * _3286;
    float _3378 = _3240 * _3286;
    float _3380 = _3366 * _3370;
    float _3382 = -_3366;
    float _3384 = _3382 + 1.0;
    float _3386 = -_3346;
    float _3388 = fma(_3344, _3376, _3386);
    float _3390 = fma(_3344, _3378, _3348);
    float _3392 = -_3376;
    float _3394 = fma(_3344, _3346, _3392);
    float _3396 = fma(_3344, _3348, _3378);
    float _3398 = -_3324;
    float _3400 = _3398 + 1.0;
    float _3402 = -_3224;
    float _3404 = _3402 + 1.0;
    float _3406 = _3224 * _3352;
    float _3408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3410 = _3374 * _3282;
    float _3412 = _3286 * _3374;
    float _3414 = -_3282;
    float _3416 = _3344 * _3414;
    bool _3418 = _2178 >= (*spvDescriptorSet0.vp_c9)._m0[183].w;
    bool _3420 = isnan(_2178);
    bool _3422 = _3418 || _3420;
    bool _3424 = isnan((*spvDescriptorSet0.vp_c9)._m0[183].w);
    bool _3426 = _3422 || _3424;
    float _3428 = float(_3426);
    float _3430 = _3260 * _3404;
    float _3432 = _3240 * _3410;
    float _3434 = -_3260;
    float _3436 = _3434 + 1.0;
    float _3438 = _3212 * _3410;
    float _3440 = _3268 * _3374;
    float _3442 = fma(_3390, _3276, _3432);
    float _3444 = _3428 * _3436;
    float _3446 = fma(_3412, _3276, _3416);
    float _3448 = fma(_3388, _3276, _3438);
    float _3450 = -_3300;
    float _3452 = fma(_3394, _3450, _3442);
    float _3454 = _2932 * _3444;
    float _3456 = -_3300;
    float _3458 = fma(_3440, _3456, _3446);
    float _3460 = -_3300;
    float _3462 = fma(_3396, _3460, _3448);
    float _3464 = _3452 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _3466 = _3452 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _3468 = as_type<int>(_3276);
    float _3470 = _3390;
    int _3472 = as_type<int>(_3394);
    float _3474 = _3396;
    if (_2782)
    {
        float _3476 = -_2472;
        float _3478 = _3476 + 1.0;
        _3468 = as_type<int>(_3478);
    }
    int _3480 = _3468;
    if (!_2782)
    {
        _3470 = _2472;
    }
    float _3482 = _3470;
    float _3484 = fma(_3458, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3464);
    float _3486 = fma(_3458, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3466);
    float _3488 = _3482;
    if (_2820)
    {
        float _3490 = -_2472;
        float _3492 = _3490 + 1.0;
        _3472 = as_type<int>(_3492);
    }
    int _3494 = _3472;
    if (_2782)
    {
        float _3496 = _2910 ? as_type<float>(_3480) : _2472;
        _3488 = _3496;
    }
    float _3498 = _3488;
    float _3500 = fma(_3462, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3484);
    float _3502 = fma(_3462, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3486);
    float _3504 = _3298 * _3384;
    float _3506 = -_3428;
    float _3508 = _3506 + 1.0;
    float _3510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3512 = _2732 + _3500;
    float _3514 = _2838 + _3502;
    float _3516 = _3504;
    float _3518 = _3514;
    float _3520 = _3512;
    if (!_2820)
    {
        _3474 = _2472;
    }
    float _3522 = _3474;
    float _3524 = _2494 * (-0.15915493667125701904296875);
    float _3526 = _3522;
    if (_2820)
    {
        float _3528 = _3072 ? as_type<float>(_3494) : _2472;
        _3526 = _3528;
    }
    float _3530 = _3526;
    float _3532 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3534 = _3512 + _3532;
    float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3538 = _3514 + _3536;
    float _3540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _3542 = _2276 > 0.5;
    float _3544 = _3534 * _3534;
    float _3546 = _3538 * _3538;
    float _3548 = fma(_3508, (*spvDescriptorSet0.vp_c9)._m0[183].x, _3454);
    float _3550 = _3408 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3552 = _3312 * _3400;
    float _3554 = _3544 + _3546;
    float _3556 = _3510 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3558 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3560 = _3544;
    float _3562 = _3546;
    if (_2826)
    {
        float _3564 = _3072 ? as_type<float>(_3120) : _2472;
        _2554 = _3564;
    }
    float _3566 = _2554;
    float _3568 = fma(_2926, _3430, _3548);
    float _3570 = fma(_3556, _3498, -0.5);
    int _3572 = _3542 ? as_type<int>(_2634) : as_type<int>(_2546);
    float _3574 = _3452 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3576 = fma(_2968, _3406, _3568);
    float _3578 = _3540 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3580 = sqrt(_3554);
    float _3582 = _2836 ? as_type<float>(_3572) : _2546;
    float _3584 = fma(_3458, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3574);
    float _3586 = fma(_3578, _3566, -0.5);
    float _3588 = _2842 ? as_type<float>(_3572) : _2546;
    float _3590 = in.m_67.y;
    float _3592 = fma(_2984, _3552, _3576);
    float _3594 = fma(_3462, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3584);
    float _3596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3598 = _3558 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3600 = fma(_2946, _3354, _3592);
    float _3602 = _2822 + _3594;
    float _3604 = fma(_3550, _2580, -0.5);
    float _3606 = fma(_3598, _3588, -0.5);
    float _3608 = fma(_3018, _3504, _3600);
    float _3610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3612 = _3580 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3614 = fma(_2490, _3604, _2500);
    float _3616 = _3524 * 6.283185482025146484375;
    float _3618 = sin(_3616);
    float _3620 = _3596 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3622 = fma(_3620, _3530, -0.5);
    if (!_3612)
    {
        _3516 = _3602;
    }
    float _3624 = _3516;
    float _3626 = _3524 * 6.283185482025146484375;
    float _3628 = cos(_3626);
    float _3630 = _3610 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3632 = fma(_3630, _3582, -0.5);
    float _3634 = _3618 * _3606;
    float _3636 = _3628 * _3606;
    float _3638 = -_3634;
    float _3640 = fma(_3628, _3586, _3638);
    float _3642 = fma(_3618, _3586, _3636);
    bool _3644 = !_3612;
    float _3646 = _3624;
    if (!_3644)
    {
        float _3648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3650 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3652 = _3580 + _3650;
        float _3654 = _3602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3656 = rsqrt(_3554);
        float _3658 = _3652 * _3648;
        float _3660 = _3658 * 0.15915493667125701904296875;
        float _3662 = _3660 * 6.283185482025146484375;
        float _3664 = sin(_3662);
        float _3666 = _3660 * 6.283185482025146484375;
        float _3668 = cos(_3666);
        float _3670 = fma(_3664, _3654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3672 = _3656 * _3670;
        float _3674 = _3668 + (-1.0);
        float _3676 = fma(_3534, _3672, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3678 = fma(_3538, _3672, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3680 = _3674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3682 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3684 = _3676 + _3682;
        float _3686 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3688 = _3678 + _3686;
        float _3690 = fma(_3602, _3668, _3680);
        float _3692 = _3684 * _3684;
        float _3694 = _3688 * _3688;
        _3646 = _3690;
        _3560 = _3692;
        _3562 = _3694;
        _3518 = _3678;
        _3520 = _3676;
    }
    float _3696 = _3646;
    float _3698 = _3560;
    float _3700 = _3562;
    float _3702 = _3518;
    float _3704 = _3520;
    float _3706 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3708 = _3696 + _3706;
    float _3710 = fma(_2492, _3622, _2478);
    float _3712 = -_2474;
    float _3714 = fma(_2464, _3642, _3712);
    float _3716 = fma(_3008, _3380, _3608);
    float _3718 = fma(_3708, _3708, _3698);
    float _3720 = fma(_2496, _3640, _2468);
    float _3722 = fma(_2502, _3570, _2508);
    float _3724 = -_2510;
    float _3726 = fma(_2504, _2994, _3724);
    float _3728 = _3718 + _3700;
    float _3730 = -_2512;
    float _3732 = fma(_2456, _3632, _3730);
    float _3734 = _3710 + 0.5;
    float _3736 = _3714 + 0.5;
    float _3738 = fma(_3340, (*spvDescriptorSet0.vp_c9)._m0[190].x, _3716);
    float _3740 = _3004 + 0.5;
    float _3742 = sqrt(_3728);
    float _3744 = _3614 + 0.5;
    float _3746 = _3720 + 0.5;
    float _3748 = _3722 + 0.5;
    float _3750 = _3726 + 0.5;
    float _3752 = _3732 + 0.5;
    out.m_69.y = _3590;
    out.m_75.x = _3746;
    out.m_75.y = _3736;
    out.m_77.x = _3738;
    bool _3754 = _3742 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3756 = isnan(_3742);
    bool _3758 = _3754 || _3756;
    bool _3760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3762 = _3758 || _3760;
    out.m_79.x = _3744;
    out.m_79.y = _3740;
    out.m_79.z = _3748;
    out.m_79.w = _3750;
    out.m_81.x = _3734;
    out.m_81.y = _3752;
    float _3764 = _3716;
    float _3766 = _3750;
    if (!_3762)
    {
        _3764 = 1.0;
    }
    float _3768 = _3764;
    bool _3770 = !_3762;
    float _3772 = _3768;
    if (!_3770)
    {
        bool _3774 = _3742 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3776 = isnan(_3742);
        bool _3778 = _3774 || _3776;
        bool _3780 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3782 = _3778 || _3780;
        if (!_3782)
        {
            float _3784 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3786 = _3742 + _3784;
            float _3788 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3790 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3788;
            float _3792 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3794 = _3792 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3796 = 1.0 / _3790;
            float _3798 = _3786 * _3796;
            float _3800 = fma(_3798, _3794, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3772 = _3800;
            _3802 = true;
        }
        else
        {
            bool _3804 = _3742 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3806 = isnan(_3742);
            bool _3808 = _3804 || _3806;
            bool _3810 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3812 = _3808 || _3810;
            if (!_3812)
            {
                float _3814 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3816 = _3742 + _3814;
                float _3818 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3820 = _3818 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3822 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3824 = _3822 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3826 = 1.0 / _3820;
                float _3828 = _3816 * _3826;
                float _3830 = fma(_3828, _3824, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3772 = _3830;
                _3802 = true;
            }
            else
            {
                _3772 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3802 = false;
    float _3832 = _3772;
    float _3834 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3836 = _3696 + _3834;
    float _3838 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3840 = _3702 + _3838;
    float _3842 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3844 = _3704 + _3842;
    bool _3846 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3848 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3850 = _3846 || _3848;
    bool _3852 = isnan(0.5);
    bool _3854 = _3850 || _3852;
    float _3856 = fma(_3836, _3832, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3858 = fma(_3840, _3832, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3860 = fma(_3844, _3832, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3862 = -_3050;
    float _3864 = fma(_3862, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2732);
    float _3866 = -_3048;
    float _3868 = fma(_3866, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3856);
    float _3870 = -_3030;
    float _3872 = fma(_3870, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3858);
    float _3874 = -_3050;
    float _3876 = fma(_3874, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3860);
    float _3878 = -_3048;
    float _3880 = fma(_3878, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2822);
    float _3882 = -_3030;
    float _3884 = fma(_3882, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2838);
    float _3886 = _3868;
    float _3888 = _3876;
    float _3890 = _3872;
    float _3892 = _3858;
    if (!_3854)
    {
        float _3894 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3896 = _3880 + _3894;
        float _3898 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3900 = _3864 + _3898;
        float _3902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3904 = -_2838;
        float _3906 = _3904 + _3858;
        float _3908 = _3896 * _3896;
        float _3910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3912 = _3884 + _3910;
        float _3914 = -_2732;
        float _3916 = _3914 + _3860;
        float _3918 = fma(_3900, _3900, _3908);
        float _3920 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3922 = fma(_3912, _3912, _3918);
        float _3924 = sqrt(_3922);
        float _3926 = 1.0 / _3232;
        float _3928 = _3920 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3930 = precise::min(_3924, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3932 = _3930 * _3902;
        float _3934 = _3932 * _3926;
        float _3936 = -_2822;
        float _3938 = _3936 + _3856;
        float _3940 = _3928 * _3934;
        float _3942 = _3906 * _3934;
        float _3944 = fma(_3916, _3940, _3864);
        float _3946 = fma(_3938, _3940, _3880);
        float _3948 = fma(_3928, _3942, _3884);
        _3886 = _3946;
        _3888 = _3944;
        _3890 = _3948;
        _2788 = _3916;
    }
    float _3950 = _3886;
    float _3952 = _3888;
    float _3954 = _3890;
    float _3956 = _2788;
    float _3958 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3960 = _3950 + _3958;
    float _3962 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3964 = _3952 + _3962;
    float _3966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3968 = _3954 + _3966;
    float _3970 = _3960 * _3960;
    float _3972 = fma(_3964, _3964, _3970);
    float _3974 = fma(_3968, _3968, _3972);
    float _3976 = rsqrt(_3974);
    float _3978 = sqrt(_3974);
    float _3980 = _3976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3982 = _3964 * _3980;
    float _3984 = _3968 * _3980;
    float _3986 = _3982 * _3982;
    float _3988 = _3984 * _3984;
    float _3990 = _3986 + _3988;
    float _3992 = sqrt(_3990);
    bool _3994 = _3992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3998 = _3992 + _3996;
    float _4000 = _3968;
    float _4002 = _3970;
    float _4004 = _3998;
    float _4006 = _3960;
    float _4008 = _3956;
    float _4010 = _3982;
    if (_3994)
    {
        float _4012 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4000 = _4012;
    }
    float _4014 = _4000;
    if (_3994)
    {
        float _4016 = rsqrt(_3990);
        _4002 = _4016;
    }
    float _4018 = _4002;
    float _4020 = _4018;
    if (_3994)
    {
        float _4022 = _3998 * _4014;
        _4004 = _4022;
    }
    float _4024 = _4004;
    if (_3994)
    {
        float _4026 = _4024 * 0.15915493667125701904296875;
        _3766 = _4026;
    }
    float _4028 = _3766;
    float _4030 = _3976;
    if (_3994)
    {
        float _4032 = _4028 * 6.283185482025146484375;
        float _4034 = sin(_4032);
        _4030 = _4034;
    }
    float _4036 = _4030;
    float _4038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4040 = precise::max(0.0, _4038);
    float _4042 = _4014;
    float _4044 = _4040;
    if (_3994)
    {
        float _4046 = _4028 * 6.283185482025146484375;
        float _4048 = cos(_4046);
        _4042 = _4048;
    }
    float _4050 = _4042;
    float _4052 = -_3980;
    float _4054 = -_4040;
    float _4056 = fma(_3960, _4052, _4054);
    if (_3994)
    {
        float _4058 = _4056 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4006 = _4058;
    }
    float _4060 = _4006;
    float _4062 = _4036;
    float _4064 = _4060;
    if (_3994)
    {
        float _4066 = fma(_4036, _4060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4062 = _4066;
    }
    float _4068 = _4062;
    float _4070 = _4068;
    if (!_3994)
    {
        _4064 = _3988;
    }
    float _4072 = _4064;
    float _4074 = _4072;
    if (_3994)
    {
        float _4076 = _4050 + (-1.0);
        _4044 = _4076;
    }
    float _4078 = _4044;
    float _4080 = _4078;
    if (_3994)
    {
        float _4082 = _4018 * _4068;
        _4008 = _4082;
    }
    float _4084 = _4008;
    if (!_3994)
    {
        _4020 = _4056;
    }
    float _4086 = _4020;
    float _4088 = _4086;
    if (_3994)
    {
        float _4090 = _4078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3892 = _4090;
    }
    float _4092 = _3892;
    if (_3994)
    {
        float _4094 = _3982 * _4084;
        _4010 = _4094;
    }
    float _4096 = _4010;
    if (!_3994)
    {
        _4070 = _3984;
    }
    float _4098 = _4070;
    float _4100 = _4098;
    if (_3994)
    {
        float _4102 = _3984 * _4084;
        _4100 = _4102;
    }
    float _4104 = _4100;
    if (!_3994)
    {
        _4080 = _3986;
    }
    float _4106 = _4080;
    float _4108 = _4106;
    if (_3994)
    {
        float _4110 = fma(_4056, _4050, _4092);
        _4088 = _4110;
    }
    float _4112 = _4088;
    if (_3994)
    {
        float _4114 = _4096 * _4096;
        _4108 = _4114;
    }
    float _4116 = _4108;
    if (_3994)
    {
        float _4118 = _4104 * _4104;
        _4074 = _4118;
    }
    float _4120 = _4074;
    float _4122 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4124 = fma(_4112, _4112, _4116);
    float _4126 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4128 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4130 = _4124 + _4120;
    float _4132 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4122);
    float _4134 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4136 = fma(_3978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4134);
    float _4138 = precise::clamp(_4136, 0.0, 1.0);
    float _4140 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4142 = rsqrt(_4130);
    float _4144 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4132);
    float _4146 = -_4138;
    float _4148 = _4146 + 1.0;
    float _4150 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4140);
    float _4152 = _3950 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4154 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4128);
    float _4156 = _4144 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4158 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4150);
    float _4160 = abs(_4148);
    float _4162 = log2(_4160);
    float _4164 = fma(_3952, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4152);
    float _4166 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4154);
    float _4168 = _4158 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4170 = _4156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4172 = fma(_3954, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4164);
    float _4174 = _4166 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4176 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4178 = _4142 * _4096;
    float _4180 = _4142 * _4112;
    float _4182 = _4142 * _4104;
    float _4184 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4176);
    float _4186 = _4178 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4188 = -_4170;
    float _4190 = fma(_4188, _4126, 1.0);
    float _4192 = _4172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4194 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4184);
    float _4196 = -_4186;
    float _4198 = fma(_4180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4196);
    float _4200 = _4162 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4202 = log2(_4190);
    float _4204 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4206 = -_4182;
    float _4208 = fma(_4206, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4198);
    float _4210 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4212 = _4180 + 1.0;
    float _4214 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4204);
    float _4216 = fma(_4208, -0.5, 0.5);
    float _4218 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4210);
    float _4220 = exp2(_4200);
    float _4222 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4194);
    float _4224 = fma(_4208, 0.5, 0.5);
    float _4226 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4214);
    float _4228 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4218);
    float _4230 = fma(_4224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4232 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4226);
    float _4234 = 1.0 / _4222;
    float _4236 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4228);
    float _4238 = fma(_4224, _4230, -0.212114393711090087890625);
    float _4240 = _4202 * 0.693147182464599609375;
    float _4242 = fma(_4224, _4238, 1.570728778839111328125);
    float _4244 = _4240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4246 = sqrt(_4216);
    float _4248 = -_4180;
    float _4250 = fma(_4220, _4212, _4248);
    float _4252 = fma(_4250, 0.5, 0.5);
    float _4254 = _4232 * _4234;
    float _4256 = _4236 * _4234;
    float _4258 = fma(_4254, 0.5, 0.5);
    float _4260 = fma(_4256, -0.5, 0.5);
    float _4262 = _4246 * 0.636619746685028076171875;
    float3 _11076 = float3(_4258, _4260, _4244);
    float _4264 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11076, float3(0.0), isnan(_11076)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11076, float3(0.0), isnan(_11076)), level(0.0)).x;
    float3 _11087 = float3(_4258, _4260, _4244);
    float4 _4267 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11087, float3(0.0), isnan(_11087)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11087, float3(0.0), isnan(_11087)), level(0.0)).xyzw;
    float _4269 = _4267.x;
    float _4271 = _4267.y;
    float _4273 = _4267.z;
    float _4275 = _4267.w;
    float _4277 = -_4242;
    float _4279 = fma(_4262, _4277, 1.0);
    float2 _11109 = float2(_4279, _4252);
    float3 _4283 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11109, float2(0.0), isnan(_11109)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11109, float2(0.0), isnan(_11109)), level(0.0)).xyz;
    float _4285 = _4283.x;
    float _4287 = _4283.y;
    float _4289 = _4283.z;
    float _4291 = _3880 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4293 = _3880 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4295 = _4162 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4297 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4291);
    float _4299 = fma(_3864, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4293);
    float _4301 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4297);
    float _4303 = fma(_3884, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4299);
    float _4305 = exp2(_4295);
    float _4307 = _4301 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4309 = _4303 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _4311 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4313 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4315 = _4311 || _4313;
    bool _4317 = isnan(0.5);
    bool _4319 = _4315 || _4317;
    float _4321 = 1.0 / _4307;
    float _4323 = _4309 + _4307;
    float _4325 = -_4305;
    float _4327 = _4325 + 1.0;
    float _4329 = _4168 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4331 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4333 = _4162;
    float _4335 = _4168;
    if (!_4319)
    {
        _4331 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4337 = _4331;
    float _4339 = fma(_4174, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4329);
    float _4341 = _4337;
    if (!_4319)
    {
        _2790 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4343 = _2790;
    float _4345 = _4327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4347 = _4323 * _4321;
    float _4349 = _4347 * 0.5;
    float _4351 = _4349;
    if (_4319)
    {
        _4333 = 1.0;
    }
    float _4353 = _4333;
    float _4355 = fma(_4156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4339);
    float _4357 = _4232 + _4222;
    float _4359 = _4353;
    if (!_4319)
    {
        float _4361 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4363 = fma(_4349, _4337, _4361);
        _4341 = _4363;
    }
    float _4365 = _4341;
    if (!_4319)
    {
        float _4367 = -_4343;
        float _4369 = _4367 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4351 = _4369;
    }
    float _4371 = _4351;
    float _4373 = fma(_4192, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4355);
    float _4375 = _4365;
    if (!_4319)
    {
        float _4377 = 1.0 / _4365;
        _4375 = _4377;
    }
    float _4379 = _4375;
    float _4381 = _4371;
    if (!_4319)
    {
        float _4383 = 1.0 / _4371;
        _4381 = _4383;
    }
    float _4385 = _4381;
    out.gl_Position.x = _4232;
    out.gl_Position.y = _4236;
    out.gl_Position.z = _4373;
    out.gl_Position.w = _4222;
    if (!_4319)
    {
        float _4387 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4389 = -_4343;
        float _4391 = fma(_4379, _4387, _4389);
        _4335 = _4391;
    }
    float _4393 = _4335;
    float _4395 = _4357 * 0.5;
    float _4397 = _4373 + _4222;
    float _4399 = -_4345;
    float _4401 = _4399 + 1.0;
    float _4403 = _4397 * 0.5;
    if (!_4319)
    {
        float _4405 = _4393 * _4385;
        float _4407 = precise::clamp(_4405, 0.0, 1.0);
        _4359 = _4407;
    }
    float _4409 = _4359;
    float _4411 = _4222 * 0.5;
    float _4413 = _4409 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _4415 = _4409 > 0.0;
    bool _4417 = isnan(_4409);
    bool _4419 = _4415 || _4417;
    bool _4421 = isnan(0.0);
    bool _4423 = _4419 || _4421;
    float _4425 = fma(_4236, -0.5, _4411);
    float _4427 = _4413 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_83.x = _4395;
    out.m_83.y = _4425;
    out.m_83.z = _4403;
    out.m_83.w = _4222;
    out.m_47.x = _4427;
    float _4429 = _4345 * _4264;
    float _4431 = _4275 * _4401;
    float _4433 = _4275 * _4429;
    float _4435 = _4289 * _4429;
    float _4437 = fma(_4285, _4433, _4269);
    float _4439 = fma(_4287, _4433, _4271);
    float _4441 = fma(_4275, _4435, _4273);
    out.m_85.x = _4437;
    out.m_85.y = _4439;
    out.m_85.z = _4441;
    out.m_85.w = _4431;
    if (_4423)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4443 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4443;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

