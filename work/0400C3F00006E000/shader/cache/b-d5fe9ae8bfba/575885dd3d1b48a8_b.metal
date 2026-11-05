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
    float4 m_55 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_49 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_61 [[attribute(10)]];
    float4 m_59 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1212 = false;
    bool _774 = false;
    bool _594 = false;
    bool _414 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2510 = as_type<float>(_106);
        out.gl_Position.z = _2510;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2580 = as_type<float>(_144);
        out.gl_Position.z = _2580;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.x;
    float _148 = in.m_49.y;
    float _150 = in.m_49.z;
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _154 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _160 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _160);
    float _168 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _164);
    bool _172 = !_152;
    float _190;
    if (!_172)
    {
        float _174 = in.m_51.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_90);
        float _196 = 1.0 / _194;
        float _198 = _124 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
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
        float _396 = in.m_51.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_53.x;
    float _426 = in.m_53.y;
    float _428 = in.m_53.z;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _432 = _422 + _430;
    bool _434 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _436 = isnan(_422);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _454 = 1.0 / _448;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _458 = 1.0 / _452;
    float _460 = -_444;
    float _462 = _460 + 1.0;
    float _464 = _392 * _428;
    float _466 = _432 * _454;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _470 = _422 + _468;
    bool _472 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _474 = isnan(_422);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _390 * _426;
    bool _486 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _488 = isnan(_422);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _498;
    float _502 = _388 * _424;
    float _504 = _470 * _458;
    float _506 = _496 * _462;
    float _508 = -_496;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _516;
    float _520 = fma(_500, _466, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _522 = _482 * _510;
    float _524 = fma(_514, _466, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _526 = fma(_518, _466, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _528 = -_482;
    float _530 = _528 + 1.0;
    float _532 = _520 * _522;
    float _534 = _524 * _522;
    float _536 = _526 * _522;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _550 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].x, _534);
    float _552 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].y, _536);
    float _554 = fma(_540, _504, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _556 = fma(_544, _504, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _558 = fma(_548, _504, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _560 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].z, _532);
    float _562 = fma(_554, _506, _550);
    float _564 = fma(_556, _506, _552);
    float _566 = fma(_558, _506, _560);
    float _568 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[109].x, _562);
    float _570 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[109].y, _564);
    float _572 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[109].z, _566);
    bool _574 = !_456;
    float _592;
    if (!_574)
    {
        float _576 = in.m_51.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_90);
        float _598 = 1.0 / _596;
        float _600 = _124 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _602 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _612 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _614 = isnan(_602);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _632 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _634 = isnan(_602);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = 1.0 / _610;
    float _646 = -_622;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _650;
    bool _654 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _656 = isnan(_602);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = _642 * _648;
    float _668 = -_642;
    float _670 = _668 + 1.0;
    bool _672 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _674 = 1.0 / _626;
    float _676 = _664 * _670;
    float _678 = -_664;
    float _680 = _678 + 1.0;
    float _682 = 1.0 / _630;
    float _684 = _652 * _644;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _690 = fma(_684, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _692 = _688 * _674;
    bool _694 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _696 = isnan(_602);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _712 = _602 + _710;
    float _714 = _690 * _676;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _718 = _602 + _716;
    float _720 = -_704;
    float _722 = _720 + 1.0;
    float _724 = fma(_692, _712, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _726 = _708 * _682;
    float _728 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[115].x, _714);
    float _730 = _622 * _722;
    float _732 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _734 = fma(_726, _718, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _736 = fma(_724, _666, _728);
    float _738 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _740 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = fma(_734, _730, _736);
    float _744 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[118].x, _742);
    float _750 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _748 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _740;
    out.m_55.y = _750;
    out.m_55.z = _746;
    out.m_55.w = _752;
    bool _754 = !_672;
    float _772;
    if (!_754)
    {
        float _756 = in.m_51.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_90);
        float _778 = 1.0 / _776;
        float _780 = _124 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _786 = _782 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _796;
    float _800 = 1.0 / _790;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _818 = 1.0 / _794;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _822 = _782 + _820;
    bool _824 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _826 = isnan(_782);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    bool _836 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _838 = isnan(_782);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _798;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _852 = _782 + _850;
    float _854 = _822 * _800;
    bool _856 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _858 = isnan(_782);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = 1.0 / _804;
    float _870 = _852 * _818;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _874 = _782 + _872;
    bool _876 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _878 = isnan(_782);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -_866;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _892;
    float _896 = 1.0 / _808;
    float _898 = _786 * _848;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _902 = _782 + _900;
    float _904 = -_886;
    float _906 = _904 + 1.0;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _910 = _782 + _908;
    float _912 = _886 * _890;
    bool _914 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _916 = 1.0 / _812;
    float _918 = _874 * _868;
    bool _920 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _922 = isnan(_782);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -_930;
    float _934 = _932 + 1.0;
    float _936 = 1.0 / _816;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _940 = _782 + _938;
    float _942 = _902 * _896;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _944;
    float _948 = _930 * _906;
    float _950 = fma(_946, _854, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _952 = _940 * _916;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _958;
    float _962 = -_834;
    float _964 = _962 + 1.0;
    float _966 = fma(_956, _854, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _968 = _834 * _934;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _974 = _910 * _936;
    float _976 = fma(_960, _854, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _986 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _988 = isnan(_782);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = _846 * _964;
    float _1000 = -_846;
    float _1002 = _1000 + 1.0;
    float _1004 = fma(_980, _870, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1006 = fma(_972, _870, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1008 = fma(_984, _870, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1010 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1012 = isnan(_782);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1022;
    bool _1026 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1028 = isnan(_782);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = _996 * _1002;
    float _1040 = -_996;
    float _1042 = _1040 + 1.0;
    float _1044 = fma(_1024, _898, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1046 = -_1036;
    float _1048 = _1046 + 1.0;
    float _1050 = _1036 * _1042;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1052;
    float _1056 = _1020 * _1048;
    float _1058 = -_1020;
    float _1060 = _1058 + 1.0;
    float _1062 = fma(_1054, _898, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1064 = fma(_894, _898, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1066 = _966 * _1056;
    float _1068 = _950 * _1056;
    float _1070 = _976 * _1056;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1084 = fma(_1074, _918, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1086 = fma(_1078, _918, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1088 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1066);
    float _1090 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1068);
    float _1092 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1070);
    float _1094 = fma(_1004, _1050, _1088);
    float _1096 = fma(_1006, _1050, _1090);
    float _1098 = fma(_1008, _1050, _1092);
    float _1100 = fma(_1082, _918, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1102;
    float _1106 = fma(_1062, _1038, _1094);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1108;
    float _1112 = fma(_1044, _1038, _1096);
    float _1114 = fma(_1064, _1038, _1098);
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1124 = fma(_1104, _952, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1126 = fma(_1084, _998, _1106);
    float _1128 = fma(_1110, _952, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1134 = fma(_1086, _998, _1112);
    float _1136 = fma(_1100, _998, _1114);
    float _1138 = fma(_1118, _952, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1140 = fma(_1122, _974, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1142 = fma(_1124, _968, _1126);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1148 = fma(_1132, _974, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1150 = fma(_1138, _968, _1136);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1152;
    float _1156 = fma(_1128, _968, _1134);
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1158;
    float _1162 = fma(_1146, _974, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1164;
    float _1168 = fma(_1140, _948, _1142);
    float _1170 = fma(_1154, _942, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1172 = fma(_1160, _942, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1174 = fma(_1148, _948, _1156);
    float _1176 = fma(_1166, _942, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1178 = fma(_1162, _948, _1150);
    float _1180 = fma(_1170, _912, _1168);
    float _1182 = fma(_1172, _912, _1174);
    float _1184 = fma(_1176, _912, _1178);
    float _1186 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1180);
    float _1188 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1182);
    float _1190 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1184);
    bool _1192 = !_914;
    float _1210;
    if (!_1192)
    {
        float _1194 = in.m_51.x;
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1198 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _1202 = _1200 * _1196;
        float _1204 = floor(_1202);
        float _1206 = -_1204;
        float _1208 = _1202 + _1206;
        _1210 = _1208;
        _1212 = true;
    }
    else
    {
        float _1214 = float(_90);
        float _1216 = 1.0 / _1214;
        float _1218 = _124 * _1216;
        _1210 = _1218;
    }
    _1212 = false;
    float _1220 = _1210;
    float _1222 = _168 * _168;
    float _1224 = in.m_57.x;
    float _1226 = in.m_57.y;
    float _1228 = in.m_57.z;
    float _1230 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1232 = fma(_166, _166, _1222);
    float _1234 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1236 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1238 = fma(_170, _170, _1232);
    bool _1240 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1242 = isnan(0.5);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1248 = _1244 || _1246;
    float _1250 = rsqrt(_1238);
    float _1252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1226);
    float _1254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1228);
    float _1256 = _170 * _1250;
    float _1258 = _166 * _1250;
    float _1260 = _168 * _1250;
    float _1262 = _1230 * _1252;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1266 = _1256 * _1264;
    float _1268 = _1236 * _1254;
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1272 = _1260 * _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1276 = -_1266;
    float _1278 = fma(_1258, _1274, _1276);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1282 = _1258 * _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1286 = -_1272;
    float _1288 = fma(_1256, _1284, _1286);
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1224);
    float _1292 = _1278 * _1278;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1296 = -_1282;
    float _1298 = fma(_1260, _1294, _1296);
    float _1300 = _1234 * _1290;
    float _1302 = fma(_1288, _1288, _1292);
    float _1304 = _1262 * _1256;
    float _1306 = fma(_1298, _1298, _1302);
    float _1308 = in.m_42.x;
    float _1310 = in.m_42.y;
    float _1312 = in.m_42.z;
    float _1314 = rsqrt(_1306);
    float _1316 = _1278 * _1314;
    float _1318 = _1298 * _1314;
    float _1320 = _1288 * _1314;
    float _1322 = _1258 * _1316;
    float _1324 = fma(_1300, _1318, _1304);
    float _1326 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1328 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1330 = -_1322;
    float _1332 = fma(_1260, _1320, _1330);
    float _1334 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1336 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1326);
    float _1338 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1328);
    float _1340 = fma(_1268, _1332, _1324);
    float _1342 = _1262 * _1258;
    float _1344 = _1260 * _1318;
    float _1346 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1336);
    float _1348 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1338);
    float _1350 = fma(_1300, _1320, _1342);
    float _1352 = -_1344;
    float _1354 = fma(_1256, _1316, _1352);
    float _1356 = _1346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1358 = _1348 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1360 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1334);
    float _1362 = fma(_1268, _1354, _1350);
    float _1364 = _1356 + _1340;
    float _1366 = _1262 * _1260;
    float _1368 = _1256 * _1320;
    float _1370 = _1358 + _1362;
    float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1374 = _1364 + _1372;
    float _1376 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1360);
    float _1378 = fma(_1300, _1316, _1366);
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1382 = _1370 + _1380;
    float _1384 = _1374 * _1374;
    float _1386 = -_1368;
    float _1388 = fma(_1258, _1318, _1386);
    float _1390 = _1376 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1392 = fma(_1382, _1382, _1384);
    float _1394 = fma(_1268, _1388, _1378);
    float _1396 = sqrt(_1392);
    float _1398 = _1390 + _1394;
    bool _1400 = _1396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1394;
    float _1404 = _1368;
    float _1406 = _1378;
    float _1408 = _1370;
    float _1410 = _1382;
    if (!_1400)
    {
        _1402 = _1370;
    }
    float _1412 = _1402;
    float _1414 = _1412;
    if (!_1400)
    {
        _1404 = _1364;
    }
    float _1416 = _1404;
    float _1418 = _1416;
    if (!_1400)
    {
        _1406 = _1398;
    }
    float _1420 = _1406;
    bool _1422 = !_1400;
    float _1424 = _1420;
    if (!_1422)
    {
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1430 = _1396 + _1428;
        float _1432 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1434 = rsqrt(_1392);
        float _1436 = _1430 * _1426;
        float _1438 = _1436 * 0.15915493667125701904296875;
        float _1440 = _1438 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = _1438 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = _1442 + (-1.0);
        float _1450 = fma(_1446, _1432, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1452 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1454 = _1434 * _1450;
        float _1456 = fma(_1398, _1442, _1452);
        float _1458 = fma(_1382, _1454, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1460 = fma(_1374, _1454, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1414 = _1458;
        _1424 = _1456;
        _1418 = _1460;
    }
    float _1462 = _1414;
    float _1464 = _1424;
    float _1466 = _1418;
    float _1468 = _1464;
    float _1470 = _1462;
    float _1472 = _1466;
    if (!_1248)
    {
        float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1476 = _1390 + _1474;
        float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1480 = _1358 + _1478;
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1484 = -_1358;
        float _1486 = _1484 + _1462;
        float _1488 = _1476 * _1476;
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1492 = _1356 + _1490;
        float _1494 = -_1390;
        float _1496 = _1494 + _1464;
        float _1498 = -_1356;
        float _1500 = _1498 + _1466;
        float _1502 = fma(_1480, _1480, _1488);
        float _1504 = fma(_1492, _1492, _1502);
        float _1506 = sqrt(_1504);
        float _1508 = precise::min(_1506, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1510 = _1508 * _1482;
        float _1512 = fma(_1486, _1510, _1358);
        float _1514 = fma(_1496, _1510, _1390);
        float _1516 = fma(_1500, _1510, _1356);
        _1468 = _1514;
        _1470 = _1512;
        _1472 = _1516;
    }
    float _1518 = _1468;
    float _1520 = _1470;
    float _1522 = _1472;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1518 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1520 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1522 + _1532;
    float _1536 = _1526 * _1526;
    float _1538 = fma(_1530, _1530, _1536);
    float _1540 = fma(_1534, _1534, _1538);
    float _1542 = rsqrt(_1540);
    float _1544 = sqrt(_1540);
    float _1546 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1530 * _1546;
    float _1550 = _1534 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 + _1554;
    float _1558 = sqrt(_1556);
    bool _1560 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = _1558 + _1562;
    float _1566 = _1534;
    float _1568 = _1556;
    float _1570 = _1564;
    float _1572 = _1526;
    if (_1560)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1574;
    }
    float _1576 = _1566;
    if (_1560)
    {
        float _1578 = rsqrt(_1556);
        _1568 = _1578;
    }
    float _1580 = _1568;
    float _1582 = _1580;
    if (_1560)
    {
        float _1584 = _1564 * _1576;
        _1570 = _1584;
    }
    float _1586 = _1570;
    if (_1560)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _1408 = _1588;
    }
    float _1590 = _1408;
    float _1592 = _1576;
    float _1594 = _1590;
    if (_1560)
    {
        float _1596 = _1590 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1604 = precise::max(0.0, _1602);
    float _1606 = _1536;
    float _1608 = _1604;
    if (_1560)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1546;
    float _1618 = -_1604;
    float _1620 = fma(_1526, _1616, _1618);
    if (_1560)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1622;
    }
    float _1624 = _1608;
    float _1626 = _1600;
    float _1628 = _1624;
    if (_1560)
    {
        float _1630 = fma(_1600, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1572 = _1630;
    }
    float _1632 = _1572;
    float _1634 = _1632;
    if (!_1560)
    {
        _1626 = _1548;
    }
    float _1636 = _1626;
    float _1638 = _1636;
    float _1640 = _1614;
    if (_1560)
    {
        float _1642 = _1614 + (-1.0);
        _1628 = _1642;
    }
    float _1644 = _1628;
    float _1646 = _1644;
    if (_1560)
    {
        float _1648 = _1580 * _1632;
        _1410 = _1648;
    }
    float _1650 = _1410;
    if (!_1560)
    {
        _1634 = _1620;
    }
    float _1652 = _1634;
    float _1654 = _1652;
    if (_1560)
    {
        float _1656 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1656;
    }
    float _1658 = _1594;
    if (_1560)
    {
        float _1660 = _1548 * _1650;
        _1638 = _1660;
    }
    float _1662 = _1638;
    if (!_1560)
    {
        _1646 = _1550;
    }
    float _1664 = _1646;
    float _1666 = _1664;
    if (_1560)
    {
        float _1668 = _1550 * _1650;
        _1666 = _1668;
    }
    float _1670 = _1666;
    if (!_1560)
    {
        _1582 = _1552;
    }
    float _1672 = _1582;
    float _1674 = _1672;
    if (_1560)
    {
        float _1676 = fma(_1620, _1614, _1658);
        _1654 = _1676;
    }
    float _1678 = _1654;
    if (_1560)
    {
        float _1680 = _1662 * _1662;
        _1674 = _1680;
    }
    float _1682 = _1674;
    if (!_1560)
    {
        _1640 = _1554;
    }
    float _1684 = _1640;
    float _1686 = _1684;
    if (_1560)
    {
        float _1688 = _1670 * _1670;
        _1686 = _1688;
    }
    float _1690 = _1686;
    float _1692 = fma(_1678, _1678, _1682);
    float _1694 = _1692 + _1690;
    float _1696 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1708 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1696);
    float _1710 = rsqrt(_1694);
    float _1712 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1714 = -_1702;
    float _1716 = _1714 + 1.0;
    float _1718 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1708);
    float _1720 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1722 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1712);
    float _1726 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1728 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1720);
    float _1730 = abs(_1716);
    float _1732 = log2(_1730);
    float _1734 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1724);
    float _1736 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1740 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1736);
    float _1746 = _1710 * _1662;
    float _1748 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = _1710 * _1678;
    float _1752 = _1710 * _1670;
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1756 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1758 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = -_1740;
    float _1762 = fma(_1760, _1706, 1.0);
    float _1764 = -_1754;
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1764);
    float _1768 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1770 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = -_1752;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1766);
    float _1778 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1768);
    float _1780 = exp2(_1770);
    float _1782 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1784 = fma(_1776, -0.5, 0.5);
    float _1786 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1788 = fma(_1776, 0.5, 0.5);
    float _1790 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1782);
    float _1792 = _1750 + 1.0;
    float _1794 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1786);
    float _1796 = log2(_1762);
    float _1798 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1800 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1802 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1804 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1798);
    float _1806 = fma(_1788, _1800, -0.212114393711090087890625);
    float _1808 = 1.0 / _1778;
    float _1810 = -_1750;
    float _1812 = fma(_1780, _1792, _1810);
    float _1814 = fma(_1788, _1806, 1.570728778839111328125);
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = sqrt(_1784);
    float _1820 = _1796 * 0.693147182464599609375;
    float _1822 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1824 = _1802 * _1808;
    float _1826 = _1804 * _1808;
    float _1828 = fma(_1824, 0.5, 0.5);
    float _1830 = fma(_1826, -0.5, 0.5);
    float _1832 = _1818 * 0.636619746685028076171875;
    float _1834 = -_1814;
    float _1836 = fma(_1832, _1834, 1.0);
    float3 _5366 = float3(_1828, _1830, _1822);
    float _1838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5366, float3(0.0), isnan(_5366)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5366, float3(0.0), isnan(_5366)), level(0.0)).x;
    float3 _5377 = float3(_1828, _1830, _1822);
    float4 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5377, float3(0.0), isnan(_5377)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5377, float3(0.0), isnan(_5377)), level(0.0)).xyzw;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1841.w;
    float2 _5394 = float2(_1836, _1816);
    float3 _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5394, float2(0.0), isnan(_5394)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5394, float2(0.0), isnan(_5394)), level(0.0)).xyz;
    float _1855 = _1853.x;
    float _1857 = _1853.y;
    float _1859 = _1853.z;
    float _1861 = in.m_51.w;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1865 = _1220 + _1863;
    float _1867 = in.m_59.x;
    int _1869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1871 = _1869 != 0;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1877 = _1875 != 0;
    float _1879 = in.m_59.y;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1883 = _1881 != 0;
    float _1885 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1889 = _1887 != 0;
    float _1891 = in.m_51.x;
    float _1893 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1897 = _1895 != 0;
    float _1899 = in.m_61.y;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1905 = in.m_51.y;
    float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1909 = _1907 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1911 = 1.0 / _1903;
    bool _1913 = _1861 > 0.5;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1917 = _1915 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1919 = 0.0;
    bool _1921 = _1889;
    bool _1923 = _1883;
    if (_1877)
    {
        float _1925 = in.m_51.z;
        _1919 = _1925;
    }
    float _1927 = _1919;
    float _1929 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1893);
    bool _1931 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1933 = isnan(0.5);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1939 = _1935 || _1937;
    out.m_63.x = _1867;
    float _1941 = 1.0 / _1909;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_63.y = _1879;
    float _1947 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1949 = in.m_61.x;
    float _1951 = 1.0 / _1917;
    float _1953 = -_1899;
    float _1955 = _1953 + 1.0;
    float _1957 = -_1943;
    float _1959 = fma(_1947, 2.0, _1957);
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1963 = _1905 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1965;
    int _1969 = _1913 ? as_type<int>(_1955) : as_type<int>(_1899);
    float _1971 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1973 = _1971 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1975 = fma(_1963, -2.0, _1945);
    bool _1977 = _1905 > 0.5;
    float _1979 = -_124;
    float _1981 = fma(_1979, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1959);
    float _1983 = _1883 ? as_type<float>(_1969) : _1899;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1985;
    float _1989 = _1967 * _1911;
    float _1991 = _1973 * _1951;
    float _1993 = _1987 * _1941;
    float _1995 = _1899;
    float _1997 = _1955;
    float _1999 = _1911;
    float _2001 = _1991;
    if (_1889)
    {
        float _2003 = _1977 ? _1955 : _1899;
        _1995 = _2003;
    }
    float _2005 = _1995;
    float _2007 = _1987;
    if (!_1897)
    {
        float _2009 = in.m_51.z;
        _2007 = _2009;
    }
    float _2011 = _2007;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1897)
    {
        _1997 = _1905;
    }
    float _2017 = _1997;
    float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2021 = _1220 + _2019;
    float _2023 = _2017;
    if (_1871)
    {
        bool _2025 = _1891 > 0.5;
        _1921 = _2025;
    }
    bool _2027 = _1921;
    float _2029 = fma(_1891, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2013);
    float _2031 = _2029;
    if (_1897)
    {
        _2023 = _1891;
    }
    float _2033 = _2023;
    float _2035 = fma(_1989, _2021, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1877)
    {
        bool _2037 = _1927 > 0.5;
        _1923 = _2037;
    }
    bool _2039 = _1923;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2043 = _1220 + _2041;
    bool _2045 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2047 = isnan(_1220);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    float _2057 = fma(_1993, _1865, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2059 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2061 = isnan(_1220);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2067 = _2063 || _2065;
    float _2069 = float(_2067);
    float _2071 = fma(_1991, _2043, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2073 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2075 = isnan(_1220);
    bool _2077 = _2073 || _2075;
    bool _2079 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2081 = _2077 || _2079;
    float _2083 = float(_2081);
    float _2085 = -_2055;
    float _2087 = _2085 + 1.0;
    bool _2089 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2091 = isnan(_1220);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2097 = _2093 || _2095;
    float _2099 = float(_2097);
    float _2101 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2103 = _2083;
    if (!_1871)
    {
        _1999 = _1949;
    }
    float _2105 = _1999;
    float _2107 = _2069 * _2087;
    float _2109 = -_2069;
    float _2111 = _2109 + 1.0;
    float _2113 = -_2083;
    float _2115 = _2113 + 1.0;
    float _2117 = _2105;
    if (!_1871)
    {
        _2001 = _2105;
    }
    float _2119 = _2001;
    float _2121 = exp2(_1885);
    float _2123 = _2119;
    if (_1871)
    {
        _2117 = _1949;
    }
    float _2125 = _2117;
    float _2127 = _2083 * _2111;
    float _2129 = _2011;
    float _2131 = _2125;
    if (!_1897)
    {
        _2103 = _2011;
    }
    float _2133 = _2103;
    float _2135 = _2099 * _2115;
    float _2137 = fma(_1905, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1961);
    float _2139 = _2133;
    if (_1897)
    {
        _2139 = _1905;
    }
    float _2141 = _2139;
    float _2143 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1897)
    {
        _2129 = _1905;
    }
    float _2145 = _2129;
    float _2147 = fma(_1983, _2101, -0.5);
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2151 = _2035 * _2135;
    float _2153 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2157 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2149);
    float _2159 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2161 = fma(_2153, _2005, -0.5);
    int _2163 = as_type<int>(_2153);
    if (_1871)
    {
        float _2165 = -_2125;
        float _2167 = _2165 + 1.0;
        _2163 = as_type<int>(_2167);
    }
    int _2169 = _2163;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2173 = -_2155;
    float _2175 = fma(_2159, 2.0, _2173);
    float _2177 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2143);
    float _2179 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1871)
    {
        float _2181 = _2027 ? as_type<float>(_2169) : _2125;
        _2123 = _2181;
    }
    float _2183 = _2123;
    float _2185 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2171);
    float _2187 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2177);
    float _2189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2191 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2179);
    float _2193 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2137);
    float _2195 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2197 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1975);
    float _2199 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2191);
    float _2201 = -_2099;
    float _2203 = _2201 + 1.0;
    float _2205 = 1.0 / _2195;
    float _2207 = -_2197;
    float _2209 = fma(_2193, _2161, _2207);
    float _2211 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2213 = _2141 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2217 = fma(_2203, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2151);
    float _2219 = -_124;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2175);
    int _2223 = 0;
    float _2225 = _2215;
    if (_1877)
    {
        float _2227 = -_2125;
        float _2229 = _2227 + 1.0;
        _2223 = as_type<int>(_2229);
    }
    int _2231 = _2223;
    float _2233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2235 = _2211 + _2195;
    float _2237 = _2189 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2239 = fma(_2213, -2.0, _2215);
    float _2241 = _2237;
    if (!_1939)
    {
        _2225 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2243 = _2225;
    float _2245 = fma(_2237, _2183, -0.5);
    float _2247 = fma(_2071, _2127, _2217);
    float _2249 = _2235 * _2205;
    float _2251 = _2249 * 0.5;
    float _2253 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2157);
    float _2255 = _2243;
    if (!_1939)
    {
        float _2257 = -_2243;
        float _2259 = _2257 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2241 = _2259;
    }
    float _2261 = _2241;
    float _2263 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2185);
    float _2265 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2267 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2265);
    float _2269 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2029);
    float _2271 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2239);
    float _2273 = fma(_2057, _2107, _2247);
    float _2275 = _2233 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2277 = _2233;
    float _2279 = _2273;
    if (!_1939)
    {
        _2277 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2281 = _2277;
    float _2283 = 1.0 / _2267;
    if (_1877)
    {
        float _2285 = _2039 ? as_type<float>(_2231) : _2125;
        _2131 = _2285;
    }
    float _2287 = _2131;
    float _2289 = fma(_2269, _2245, _1981);
    float _2291 = -_2271;
    float _2293 = fma(_2263, _2147, _2291);
    if (!_1939)
    {
        float _2295 = -_2281;
        float _2297 = _2295 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _126 = _2297;
    }
    float _2299 = _126;
    float _2301 = _2209 + 0.5;
    float _2303 = fma(_2275, _2287, -0.5);
    float _2305 = _2289 + 0.5;
    float _2307 = _2261;
    float _2309 = _2299;
    if (!_1939)
    {
        float _2311 = 1.0 / _2261;
        _2307 = _2311;
    }
    float _2313 = _2307;
    float _2315 = _2293 + 0.5;
    float _2317 = fma(_2253, _2303, _2221);
    float _2319 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2273);
    if (_1939)
    {
        _2279 = 1.0;
    }
    float _2321 = _2279;
    float _2323 = in.m_59.z;
    float _2325 = _2317 + 0.5;
    float _2327 = -_2121;
    float _2329 = _2327 + 1.0;
    float _2331 = _2057;
    float _2333 = _2321;
    if (!_1939)
    {
        float _2335 = 1.0 / _2299;
        _2331 = _2335;
    }
    float _2337 = _2331;
    if (!_1939)
    {
        float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2341 = -_2281;
        float _2343 = fma(_2283, _2339, _2341);
        _2031 = _2343;
    }
    float _2345 = _2031;
    float _2347 = in.m_59.w;
    float _2349 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_65.x = _2305;
    out.m_65.y = _2301;
    out.m_65.z = _2325;
    out.m_65.w = _2315;
    if (!_1939)
    {
        float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2353 = -_2243;
        float _2355 = fma(_2283, _2351, _2353);
        _2309 = _2355;
    }
    float _2357 = _2309;
    if (_1939)
    {
        _2255 = 1.0;
    }
    float _2359 = _2255;
    float _2361 = _2313;
    float _2363 = _2359;
    if (!_1939)
    {
        float _2365 = _2357 * _2313;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        _2361 = _2367;
    }
    float _2369 = _2361;
    float _2371 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1929);
    float _2373 = _1802 + _1778;
    if (!_1939)
    {
        float _2375 = _2345 * _2337;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        _2333 = _2377;
    }
    float _2379 = _2333;
    if (!_1939)
    {
        float _2381 = -_2369;
        float _2383 = _2381 + 1.0;
        _2363 = _2383;
    }
    float _2385 = _2363;
    float _2387 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2371);
    float _2389 = _1188 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2391 = _2379 * _2385;
    float _2393 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2395 = _2379 > 0.0;
    bool _2397 = isnan(_2379);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan(0.0);
    bool _2403 = _2399 || _2401;
    float _2405 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2407 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2409 = _1778 * 0.5;
    bool _2411 = _2385 <= 0.0;
    bool _2413 = !_2403;
    bool _2415 = _2411 || _2413;
    float _2417 = _2393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2419 = _2407 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2421 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2423 = _2405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2319 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2427 = fma(_1804, -0.5, _2409);
    float _2429 = -_2349;
    float _2431 = _2429 + 1.0;
    float _2433 = _2387 + _1778;
    out.m_45.x = _2419;
    float _2435 = _2373 * 0.5;
    float _2437 = _2433 * 0.5;
    out.m_67.x = _2417;
    out.m_67.y = _2421;
    out.m_67.z = _2423;
    out.m_67.w = _2425;
    out.m_63.z = _2323;
    out.m_63.w = _2347;
    out.gl_Position.x = _1802;
    out.gl_Position.y = _1804;
    out.gl_Position.z = _2387;
    out.gl_Position.w = _1778;
    out.m_69.x = _2435;
    out.m_69.y = _2427;
    out.m_69.z = _2437;
    out.m_69.w = _1778;
    float _2439 = _2349 * _1838;
    float _2441 = _1849 * _2431;
    float _2443 = _1849 * _2439;
    float _2445 = _1859 * _2439;
    float _2447 = fma(_1855, _2443, _1843);
    float _2449 = fma(_1857, _2443, _1845);
    float _2451 = fma(_1849, _2445, _1847);
    out.m_71.x = _2447;
    out.m_71.y = _2449;
    out.m_71.z = _2451;
    out.m_71.w = _2441;
    if (!_2415)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2453 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2453;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1212 = false;
    bool _774 = false;
    bool _594 = false;
    bool _414 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2510 = as_type<float>(_106);
        out.gl_Position.z = _2510;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2580 = as_type<float>(_144);
        out.gl_Position.z = _2580;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.x;
    float _148 = in.m_49.y;
    float _150 = in.m_49.z;
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _154 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _160 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _160);
    float _168 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _164);
    bool _172 = !_152;
    float _190;
    if (!_172)
    {
        float _174 = in.m_51.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_90);
        float _196 = 1.0 / _194;
        float _198 = _124 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
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
        float _396 = in.m_51.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_53.x;
    float _426 = in.m_53.y;
    float _428 = in.m_53.z;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _432 = _422 + _430;
    bool _434 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _436 = isnan(_422);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _454 = 1.0 / _448;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _458 = 1.0 / _452;
    float _460 = -_444;
    float _462 = _460 + 1.0;
    float _464 = _392 * _428;
    float _466 = _432 * _454;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _470 = _422 + _468;
    bool _472 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _474 = isnan(_422);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _390 * _426;
    bool _486 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _488 = isnan(_422);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _498;
    float _502 = _388 * _424;
    float _504 = _470 * _458;
    float _506 = _496 * _462;
    float _508 = -_496;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _516;
    float _520 = fma(_500, _466, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _522 = _482 * _510;
    float _524 = fma(_514, _466, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _526 = fma(_518, _466, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _528 = -_482;
    float _530 = _528 + 1.0;
    float _532 = _520 * _522;
    float _534 = _524 * _522;
    float _536 = _526 * _522;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _550 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].x, _534);
    float _552 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].y, _536);
    float _554 = fma(_540, _504, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _556 = fma(_544, _504, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _558 = fma(_548, _504, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _560 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].z, _532);
    float _562 = fma(_554, _506, _550);
    float _564 = fma(_556, _506, _552);
    float _566 = fma(_558, _506, _560);
    float _568 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[109].x, _562);
    float _570 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[109].y, _564);
    float _572 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[109].z, _566);
    bool _574 = !_456;
    float _592;
    if (!_574)
    {
        float _576 = in.m_51.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_90);
        float _598 = 1.0 / _596;
        float _600 = _124 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _602 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _612 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _614 = isnan(_602);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _632 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _634 = isnan(_602);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = 1.0 / _610;
    float _646 = -_622;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _650;
    bool _654 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _656 = isnan(_602);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = _642 * _648;
    float _668 = -_642;
    float _670 = _668 + 1.0;
    bool _672 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _674 = 1.0 / _626;
    float _676 = _664 * _670;
    float _678 = -_664;
    float _680 = _678 + 1.0;
    float _682 = 1.0 / _630;
    float _684 = _652 * _644;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _690 = fma(_684, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _692 = _688 * _674;
    bool _694 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _696 = isnan(_602);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _712 = _602 + _710;
    float _714 = _690 * _676;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _718 = _602 + _716;
    float _720 = -_704;
    float _722 = _720 + 1.0;
    float _724 = fma(_692, _712, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _726 = _708 * _682;
    float _728 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[115].x, _714);
    float _730 = _622 * _722;
    float _732 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _734 = fma(_726, _718, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _736 = fma(_724, _666, _728);
    float _738 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _740 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = fma(_734, _730, _736);
    float _744 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[118].x, _742);
    float _750 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _748 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _740;
    out.m_55.y = _750;
    out.m_55.z = _746;
    out.m_55.w = _752;
    bool _754 = !_672;
    float _772;
    if (!_754)
    {
        float _756 = in.m_51.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_90);
        float _778 = 1.0 / _776;
        float _780 = _124 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _786 = _782 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _796;
    float _800 = 1.0 / _790;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _818 = 1.0 / _794;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _822 = _782 + _820;
    bool _824 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _826 = isnan(_782);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    bool _836 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _838 = isnan(_782);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _798;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _852 = _782 + _850;
    float _854 = _822 * _800;
    bool _856 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _858 = isnan(_782);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = 1.0 / _804;
    float _870 = _852 * _818;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _874 = _782 + _872;
    bool _876 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _878 = isnan(_782);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -_866;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _892;
    float _896 = 1.0 / _808;
    float _898 = _786 * _848;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _902 = _782 + _900;
    float _904 = -_886;
    float _906 = _904 + 1.0;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _910 = _782 + _908;
    float _912 = _886 * _890;
    bool _914 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _916 = 1.0 / _812;
    float _918 = _874 * _868;
    bool _920 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _922 = isnan(_782);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -_930;
    float _934 = _932 + 1.0;
    float _936 = 1.0 / _816;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _940 = _782 + _938;
    float _942 = _902 * _896;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _944;
    float _948 = _930 * _906;
    float _950 = fma(_946, _854, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _952 = _940 * _916;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _958;
    float _962 = -_834;
    float _964 = _962 + 1.0;
    float _966 = fma(_956, _854, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _968 = _834 * _934;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _974 = _910 * _936;
    float _976 = fma(_960, _854, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _986 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _988 = isnan(_782);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = _846 * _964;
    float _1000 = -_846;
    float _1002 = _1000 + 1.0;
    float _1004 = fma(_980, _870, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1006 = fma(_972, _870, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1008 = fma(_984, _870, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1010 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1012 = isnan(_782);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1022;
    bool _1026 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1028 = isnan(_782);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = _996 * _1002;
    float _1040 = -_996;
    float _1042 = _1040 + 1.0;
    float _1044 = fma(_1024, _898, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1046 = -_1036;
    float _1048 = _1046 + 1.0;
    float _1050 = _1036 * _1042;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1052;
    float _1056 = _1020 * _1048;
    float _1058 = -_1020;
    float _1060 = _1058 + 1.0;
    float _1062 = fma(_1054, _898, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1064 = fma(_894, _898, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1066 = _966 * _1056;
    float _1068 = _950 * _1056;
    float _1070 = _976 * _1056;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1084 = fma(_1074, _918, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1086 = fma(_1078, _918, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1088 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1066);
    float _1090 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1068);
    float _1092 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1070);
    float _1094 = fma(_1004, _1050, _1088);
    float _1096 = fma(_1006, _1050, _1090);
    float _1098 = fma(_1008, _1050, _1092);
    float _1100 = fma(_1082, _918, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1102;
    float _1106 = fma(_1062, _1038, _1094);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1108;
    float _1112 = fma(_1044, _1038, _1096);
    float _1114 = fma(_1064, _1038, _1098);
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1124 = fma(_1104, _952, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1126 = fma(_1084, _998, _1106);
    float _1128 = fma(_1110, _952, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1134 = fma(_1086, _998, _1112);
    float _1136 = fma(_1100, _998, _1114);
    float _1138 = fma(_1118, _952, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1140 = fma(_1122, _974, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1142 = fma(_1124, _968, _1126);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1148 = fma(_1132, _974, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1150 = fma(_1138, _968, _1136);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1152;
    float _1156 = fma(_1128, _968, _1134);
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1158;
    float _1162 = fma(_1146, _974, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1164;
    float _1168 = fma(_1140, _948, _1142);
    float _1170 = fma(_1154, _942, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1172 = fma(_1160, _942, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1174 = fma(_1148, _948, _1156);
    float _1176 = fma(_1166, _942, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1178 = fma(_1162, _948, _1150);
    float _1180 = fma(_1170, _912, _1168);
    float _1182 = fma(_1172, _912, _1174);
    float _1184 = fma(_1176, _912, _1178);
    float _1186 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1180);
    float _1188 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1182);
    float _1190 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1184);
    bool _1192 = !_914;
    float _1210;
    if (!_1192)
    {
        float _1194 = in.m_51.x;
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1198 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _1202 = _1200 * _1196;
        float _1204 = floor(_1202);
        float _1206 = -_1204;
        float _1208 = _1202 + _1206;
        _1210 = _1208;
        _1212 = true;
    }
    else
    {
        float _1214 = float(_90);
        float _1216 = 1.0 / _1214;
        float _1218 = _124 * _1216;
        _1210 = _1218;
    }
    _1212 = false;
    float _1220 = _1210;
    float _1222 = _168 * _168;
    float _1224 = in.m_57.x;
    float _1226 = in.m_57.y;
    float _1228 = in.m_57.z;
    float _1230 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1232 = fma(_166, _166, _1222);
    float _1234 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1236 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1238 = fma(_170, _170, _1232);
    bool _1240 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1242 = isnan(0.5);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1248 = _1244 || _1246;
    float _1250 = rsqrt(_1238);
    float _1252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1226);
    float _1254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1228);
    float _1256 = _170 * _1250;
    float _1258 = _166 * _1250;
    float _1260 = _168 * _1250;
    float _1262 = _1230 * _1252;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1266 = _1256 * _1264;
    float _1268 = _1236 * _1254;
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1272 = _1260 * _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1276 = -_1266;
    float _1278 = fma(_1258, _1274, _1276);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1282 = _1258 * _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1286 = -_1272;
    float _1288 = fma(_1256, _1284, _1286);
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1224);
    float _1292 = _1278 * _1278;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1296 = -_1282;
    float _1298 = fma(_1260, _1294, _1296);
    float _1300 = _1234 * _1290;
    float _1302 = fma(_1288, _1288, _1292);
    float _1304 = _1262 * _1256;
    float _1306 = fma(_1298, _1298, _1302);
    float _1308 = in.m_42.x;
    float _1310 = in.m_42.y;
    float _1312 = in.m_42.z;
    float _1314 = rsqrt(_1306);
    float _1316 = _1278 * _1314;
    float _1318 = _1298 * _1314;
    float _1320 = _1288 * _1314;
    float _1322 = _1258 * _1316;
    float _1324 = fma(_1300, _1318, _1304);
    float _1326 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1328 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1330 = -_1322;
    float _1332 = fma(_1260, _1320, _1330);
    float _1334 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1336 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1326);
    float _1338 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1328);
    float _1340 = fma(_1268, _1332, _1324);
    float _1342 = _1262 * _1258;
    float _1344 = _1260 * _1318;
    float _1346 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1336);
    float _1348 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1338);
    float _1350 = fma(_1300, _1320, _1342);
    float _1352 = -_1344;
    float _1354 = fma(_1256, _1316, _1352);
    float _1356 = _1346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1358 = _1348 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1360 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1334);
    float _1362 = fma(_1268, _1354, _1350);
    float _1364 = _1356 + _1340;
    float _1366 = _1262 * _1260;
    float _1368 = _1256 * _1320;
    float _1370 = _1358 + _1362;
    float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1374 = _1364 + _1372;
    float _1376 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1360);
    float _1378 = fma(_1300, _1316, _1366);
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1382 = _1370 + _1380;
    float _1384 = _1374 * _1374;
    float _1386 = -_1368;
    float _1388 = fma(_1258, _1318, _1386);
    float _1390 = _1376 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1392 = fma(_1382, _1382, _1384);
    float _1394 = fma(_1268, _1388, _1378);
    float _1396 = sqrt(_1392);
    float _1398 = _1390 + _1394;
    bool _1400 = _1396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1394;
    float _1404 = _1368;
    float _1406 = _1378;
    float _1408 = _1370;
    float _1410 = _1382;
    if (!_1400)
    {
        _1402 = _1370;
    }
    float _1412 = _1402;
    float _1414 = _1412;
    if (!_1400)
    {
        _1404 = _1364;
    }
    float _1416 = _1404;
    float _1418 = _1416;
    if (!_1400)
    {
        _1406 = _1398;
    }
    float _1420 = _1406;
    bool _1422 = !_1400;
    float _1424 = _1420;
    if (!_1422)
    {
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1430 = _1396 + _1428;
        float _1432 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1434 = rsqrt(_1392);
        float _1436 = _1430 * _1426;
        float _1438 = _1436 * 0.15915493667125701904296875;
        float _1440 = _1438 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = _1438 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = _1442 + (-1.0);
        float _1450 = fma(_1446, _1432, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1452 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1454 = _1434 * _1450;
        float _1456 = fma(_1398, _1442, _1452);
        float _1458 = fma(_1382, _1454, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1460 = fma(_1374, _1454, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1414 = _1458;
        _1424 = _1456;
        _1418 = _1460;
    }
    float _1462 = _1414;
    float _1464 = _1424;
    float _1466 = _1418;
    float _1468 = _1464;
    float _1470 = _1462;
    float _1472 = _1466;
    if (!_1248)
    {
        float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1476 = _1390 + _1474;
        float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1480 = _1358 + _1478;
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1484 = -_1358;
        float _1486 = _1484 + _1462;
        float _1488 = _1476 * _1476;
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1492 = _1356 + _1490;
        float _1494 = -_1390;
        float _1496 = _1494 + _1464;
        float _1498 = -_1356;
        float _1500 = _1498 + _1466;
        float _1502 = fma(_1480, _1480, _1488);
        float _1504 = fma(_1492, _1492, _1502);
        float _1506 = sqrt(_1504);
        float _1508 = precise::min(_1506, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1510 = _1508 * _1482;
        float _1512 = fma(_1486, _1510, _1358);
        float _1514 = fma(_1496, _1510, _1390);
        float _1516 = fma(_1500, _1510, _1356);
        _1468 = _1514;
        _1470 = _1512;
        _1472 = _1516;
    }
    float _1518 = _1468;
    float _1520 = _1470;
    float _1522 = _1472;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1518 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1520 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1522 + _1532;
    float _1536 = _1526 * _1526;
    float _1538 = fma(_1530, _1530, _1536);
    float _1540 = fma(_1534, _1534, _1538);
    float _1542 = rsqrt(_1540);
    float _1544 = sqrt(_1540);
    float _1546 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1530 * _1546;
    float _1550 = _1534 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 + _1554;
    float _1558 = sqrt(_1556);
    bool _1560 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = _1558 + _1562;
    float _1566 = _1534;
    float _1568 = _1556;
    float _1570 = _1564;
    float _1572 = _1526;
    if (_1560)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1574;
    }
    float _1576 = _1566;
    if (_1560)
    {
        float _1578 = rsqrt(_1556);
        _1568 = _1578;
    }
    float _1580 = _1568;
    float _1582 = _1580;
    if (_1560)
    {
        float _1584 = _1564 * _1576;
        _1570 = _1584;
    }
    float _1586 = _1570;
    if (_1560)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _1408 = _1588;
    }
    float _1590 = _1408;
    float _1592 = _1576;
    float _1594 = _1590;
    if (_1560)
    {
        float _1596 = _1590 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1604 = precise::max(0.0, _1602);
    float _1606 = _1536;
    float _1608 = _1604;
    if (_1560)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1546;
    float _1618 = -_1604;
    float _1620 = fma(_1526, _1616, _1618);
    if (_1560)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1622;
    }
    float _1624 = _1608;
    float _1626 = _1600;
    float _1628 = _1624;
    if (_1560)
    {
        float _1630 = fma(_1600, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1572 = _1630;
    }
    float _1632 = _1572;
    float _1634 = _1632;
    if (!_1560)
    {
        _1626 = _1548;
    }
    float _1636 = _1626;
    float _1638 = _1636;
    float _1640 = _1614;
    if (_1560)
    {
        float _1642 = _1614 + (-1.0);
        _1628 = _1642;
    }
    float _1644 = _1628;
    float _1646 = _1644;
    if (_1560)
    {
        float _1648 = _1580 * _1632;
        _1410 = _1648;
    }
    float _1650 = _1410;
    if (!_1560)
    {
        _1634 = _1620;
    }
    float _1652 = _1634;
    float _1654 = _1652;
    if (_1560)
    {
        float _1656 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1656;
    }
    float _1658 = _1594;
    if (_1560)
    {
        float _1660 = _1548 * _1650;
        _1638 = _1660;
    }
    float _1662 = _1638;
    if (!_1560)
    {
        _1646 = _1550;
    }
    float _1664 = _1646;
    float _1666 = _1664;
    if (_1560)
    {
        float _1668 = _1550 * _1650;
        _1666 = _1668;
    }
    float _1670 = _1666;
    if (!_1560)
    {
        _1582 = _1552;
    }
    float _1672 = _1582;
    float _1674 = _1672;
    if (_1560)
    {
        float _1676 = fma(_1620, _1614, _1658);
        _1654 = _1676;
    }
    float _1678 = _1654;
    if (_1560)
    {
        float _1680 = _1662 * _1662;
        _1674 = _1680;
    }
    float _1682 = _1674;
    if (!_1560)
    {
        _1640 = _1554;
    }
    float _1684 = _1640;
    float _1686 = _1684;
    if (_1560)
    {
        float _1688 = _1670 * _1670;
        _1686 = _1688;
    }
    float _1690 = _1686;
    float _1692 = fma(_1678, _1678, _1682);
    float _1694 = _1692 + _1690;
    float _1696 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1708 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1696);
    float _1710 = rsqrt(_1694);
    float _1712 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1714 = -_1702;
    float _1716 = _1714 + 1.0;
    float _1718 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1708);
    float _1720 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1722 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1712);
    float _1726 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1728 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1720);
    float _1730 = abs(_1716);
    float _1732 = log2(_1730);
    float _1734 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1724);
    float _1736 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1740 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1736);
    float _1746 = _1710 * _1662;
    float _1748 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = _1710 * _1678;
    float _1752 = _1710 * _1670;
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1756 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1758 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = -_1740;
    float _1762 = fma(_1760, _1706, 1.0);
    float _1764 = -_1754;
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1764);
    float _1768 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1770 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = -_1752;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1766);
    float _1778 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1768);
    float _1780 = exp2(_1770);
    float _1782 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1784 = fma(_1776, -0.5, 0.5);
    float _1786 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1788 = fma(_1776, 0.5, 0.5);
    float _1790 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1782);
    float _1792 = _1750 + 1.0;
    float _1794 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1786);
    float _1796 = log2(_1762);
    float _1798 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1800 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1802 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1804 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1798);
    float _1806 = fma(_1788, _1800, -0.212114393711090087890625);
    float _1808 = 1.0 / _1778;
    float _1810 = -_1750;
    float _1812 = fma(_1780, _1792, _1810);
    float _1814 = fma(_1788, _1806, 1.570728778839111328125);
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = sqrt(_1784);
    float _1820 = _1796 * 0.693147182464599609375;
    float _1822 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1824 = _1802 * _1808;
    float _1826 = _1804 * _1808;
    float _1828 = fma(_1824, 0.5, 0.5);
    float _1830 = fma(_1826, -0.5, 0.5);
    float _1832 = _1818 * 0.636619746685028076171875;
    float _1834 = -_1814;
    float _1836 = fma(_1832, _1834, 1.0);
    float3 _5366 = float3(_1828, _1830, _1822);
    float _1838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5366, float3(0.0), isnan(_5366)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5366, float3(0.0), isnan(_5366)), level(0.0)).x;
    float3 _5377 = float3(_1828, _1830, _1822);
    float4 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5377, float3(0.0), isnan(_5377)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5377, float3(0.0), isnan(_5377)), level(0.0)).xyzw;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1841.w;
    float2 _5394 = float2(_1836, _1816);
    float3 _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5394, float2(0.0), isnan(_5394)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5394, float2(0.0), isnan(_5394)), level(0.0)).xyz;
    float _1855 = _1853.x;
    float _1857 = _1853.y;
    float _1859 = _1853.z;
    float _1861 = in.m_51.w;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1865 = _1220 + _1863;
    float _1867 = in.m_59.x;
    int _1869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1871 = _1869 != 0;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1877 = _1875 != 0;
    float _1879 = in.m_59.y;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1883 = _1881 != 0;
    float _1885 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1889 = _1887 != 0;
    float _1891 = in.m_51.x;
    float _1893 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1897 = _1895 != 0;
    float _1899 = in.m_61.y;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1905 = in.m_51.y;
    float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1909 = _1907 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1911 = 1.0 / _1903;
    bool _1913 = _1861 > 0.5;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1917 = _1915 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1919 = 0.0;
    bool _1921 = _1889;
    bool _1923 = _1883;
    if (_1877)
    {
        float _1925 = in.m_51.z;
        _1919 = _1925;
    }
    float _1927 = _1919;
    float _1929 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1893);
    bool _1931 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1933 = isnan(0.5);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1939 = _1935 || _1937;
    out.m_63.x = _1867;
    float _1941 = 1.0 / _1909;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_63.y = _1879;
    float _1947 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1949 = in.m_61.x;
    float _1951 = 1.0 / _1917;
    float _1953 = -_1899;
    float _1955 = _1953 + 1.0;
    float _1957 = -_1943;
    float _1959 = fma(_1947, 2.0, _1957);
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1963 = _1905 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1965;
    int _1969 = _1913 ? as_type<int>(_1955) : as_type<int>(_1899);
    float _1971 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1973 = _1971 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1975 = fma(_1963, -2.0, _1945);
    bool _1977 = _1905 > 0.5;
    float _1979 = -_124;
    float _1981 = fma(_1979, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1959);
    float _1983 = _1883 ? as_type<float>(_1969) : _1899;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1985;
    float _1989 = _1967 * _1911;
    float _1991 = _1973 * _1951;
    float _1993 = _1987 * _1941;
    float _1995 = _1899;
    float _1997 = _1955;
    float _1999 = _1911;
    float _2001 = _1991;
    if (_1889)
    {
        float _2003 = _1977 ? _1955 : _1899;
        _1995 = _2003;
    }
    float _2005 = _1995;
    float _2007 = _1987;
    if (!_1897)
    {
        float _2009 = in.m_51.z;
        _2007 = _2009;
    }
    float _2011 = _2007;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1897)
    {
        _1997 = _1905;
    }
    float _2017 = _1997;
    float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2021 = _1220 + _2019;
    float _2023 = _2017;
    if (_1871)
    {
        bool _2025 = _1891 > 0.5;
        _1921 = _2025;
    }
    bool _2027 = _1921;
    float _2029 = fma(_1891, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2013);
    float _2031 = _2029;
    if (_1897)
    {
        _2023 = _1891;
    }
    float _2033 = _2023;
    float _2035 = fma(_1989, _2021, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1877)
    {
        bool _2037 = _1927 > 0.5;
        _1923 = _2037;
    }
    bool _2039 = _1923;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2043 = _1220 + _2041;
    bool _2045 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2047 = isnan(_1220);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    float _2057 = fma(_1993, _1865, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2059 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2061 = isnan(_1220);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2067 = _2063 || _2065;
    float _2069 = float(_2067);
    float _2071 = fma(_1991, _2043, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2073 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2075 = isnan(_1220);
    bool _2077 = _2073 || _2075;
    bool _2079 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2081 = _2077 || _2079;
    float _2083 = float(_2081);
    float _2085 = -_2055;
    float _2087 = _2085 + 1.0;
    bool _2089 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2091 = isnan(_1220);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2097 = _2093 || _2095;
    float _2099 = float(_2097);
    float _2101 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2103 = _2083;
    if (!_1871)
    {
        _1999 = _1949;
    }
    float _2105 = _1999;
    float _2107 = _2069 * _2087;
    float _2109 = -_2069;
    float _2111 = _2109 + 1.0;
    float _2113 = -_2083;
    float _2115 = _2113 + 1.0;
    float _2117 = _2105;
    if (!_1871)
    {
        _2001 = _2105;
    }
    float _2119 = _2001;
    float _2121 = exp2(_1885);
    float _2123 = _2119;
    if (_1871)
    {
        _2117 = _1949;
    }
    float _2125 = _2117;
    float _2127 = _2083 * _2111;
    float _2129 = _2011;
    float _2131 = _2125;
    if (!_1897)
    {
        _2103 = _2011;
    }
    float _2133 = _2103;
    float _2135 = _2099 * _2115;
    float _2137 = fma(_1905, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1961);
    float _2139 = _2133;
    if (_1897)
    {
        _2139 = _1905;
    }
    float _2141 = _2139;
    float _2143 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1897)
    {
        _2129 = _1905;
    }
    float _2145 = _2129;
    float _2147 = fma(_1983, _2101, -0.5);
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2151 = _2035 * _2135;
    float _2153 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2157 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2149);
    float _2159 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2161 = fma(_2153, _2005, -0.5);
    int _2163 = as_type<int>(_2153);
    if (_1871)
    {
        float _2165 = -_2125;
        float _2167 = _2165 + 1.0;
        _2163 = as_type<int>(_2167);
    }
    int _2169 = _2163;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2173 = -_2155;
    float _2175 = fma(_2159, 2.0, _2173);
    float _2177 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2143);
    float _2179 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1871)
    {
        float _2181 = _2027 ? as_type<float>(_2169) : _2125;
        _2123 = _2181;
    }
    float _2183 = _2123;
    float _2185 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2171);
    float _2187 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2177);
    float _2189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2191 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2179);
    float _2193 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2137);
    float _2195 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2197 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1975);
    float _2199 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2191);
    float _2201 = -_2099;
    float _2203 = _2201 + 1.0;
    float _2205 = 1.0 / _2195;
    float _2207 = -_2197;
    float _2209 = fma(_2193, _2161, _2207);
    float _2211 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2213 = _2141 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2217 = fma(_2203, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2151);
    float _2219 = -_124;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2175);
    int _2223 = 0;
    float _2225 = _2215;
    if (_1877)
    {
        float _2227 = -_2125;
        float _2229 = _2227 + 1.0;
        _2223 = as_type<int>(_2229);
    }
    int _2231 = _2223;
    float _2233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2235 = _2211 + _2195;
    float _2237 = _2189 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2239 = fma(_2213, -2.0, _2215);
    float _2241 = _2237;
    if (!_1939)
    {
        _2225 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2243 = _2225;
    float _2245 = fma(_2237, _2183, -0.5);
    float _2247 = fma(_2071, _2127, _2217);
    float _2249 = _2235 * _2205;
    float _2251 = _2249 * 0.5;
    float _2253 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2157);
    float _2255 = _2243;
    if (!_1939)
    {
        float _2257 = -_2243;
        float _2259 = _2257 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2241 = _2259;
    }
    float _2261 = _2241;
    float _2263 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2185);
    float _2265 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2267 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2265);
    float _2269 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2029);
    float _2271 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2239);
    float _2273 = fma(_2057, _2107, _2247);
    float _2275 = _2233 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2277 = _2233;
    float _2279 = _2273;
    if (!_1939)
    {
        _2277 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2281 = _2277;
    float _2283 = 1.0 / _2267;
    if (_1877)
    {
        float _2285 = _2039 ? as_type<float>(_2231) : _2125;
        _2131 = _2285;
    }
    float _2287 = _2131;
    float _2289 = fma(_2269, _2245, _1981);
    float _2291 = -_2271;
    float _2293 = fma(_2263, _2147, _2291);
    if (!_1939)
    {
        float _2295 = -_2281;
        float _2297 = _2295 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _126 = _2297;
    }
    float _2299 = _126;
    float _2301 = _2209 + 0.5;
    float _2303 = fma(_2275, _2287, -0.5);
    float _2305 = _2289 + 0.5;
    float _2307 = _2261;
    float _2309 = _2299;
    if (!_1939)
    {
        float _2311 = 1.0 / _2261;
        _2307 = _2311;
    }
    float _2313 = _2307;
    float _2315 = _2293 + 0.5;
    float _2317 = fma(_2253, _2303, _2221);
    float _2319 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2273);
    if (_1939)
    {
        _2279 = 1.0;
    }
    float _2321 = _2279;
    float _2323 = in.m_59.z;
    float _2325 = _2317 + 0.5;
    float _2327 = -_2121;
    float _2329 = _2327 + 1.0;
    float _2331 = _2057;
    float _2333 = _2321;
    if (!_1939)
    {
        float _2335 = 1.0 / _2299;
        _2331 = _2335;
    }
    float _2337 = _2331;
    if (!_1939)
    {
        float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2341 = -_2281;
        float _2343 = fma(_2283, _2339, _2341);
        _2031 = _2343;
    }
    float _2345 = _2031;
    float _2347 = in.m_59.w;
    float _2349 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_65.x = _2305;
    out.m_65.y = _2301;
    out.m_65.z = _2325;
    out.m_65.w = _2315;
    if (!_1939)
    {
        float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2353 = -_2243;
        float _2355 = fma(_2283, _2351, _2353);
        _2309 = _2355;
    }
    float _2357 = _2309;
    if (_1939)
    {
        _2255 = 1.0;
    }
    float _2359 = _2255;
    float _2361 = _2313;
    float _2363 = _2359;
    if (!_1939)
    {
        float _2365 = _2357 * _2313;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        _2361 = _2367;
    }
    float _2369 = _2361;
    float _2371 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1929);
    float _2373 = _1802 + _1778;
    if (!_1939)
    {
        float _2375 = _2345 * _2337;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        _2333 = _2377;
    }
    float _2379 = _2333;
    if (!_1939)
    {
        float _2381 = -_2369;
        float _2383 = _2381 + 1.0;
        _2363 = _2383;
    }
    float _2385 = _2363;
    float _2387 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2371);
    float _2389 = _1188 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2391 = _2379 * _2385;
    float _2393 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2395 = _2379 > 0.0;
    bool _2397 = isnan(_2379);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan(0.0);
    bool _2403 = _2399 || _2401;
    float _2405 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2407 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2409 = _1778 * 0.5;
    bool _2411 = _2385 <= 0.0;
    bool _2413 = !_2403;
    bool _2415 = _2411 || _2413;
    float _2417 = _2393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2419 = _2407 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2421 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2423 = _2405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2319 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2427 = fma(_1804, -0.5, _2409);
    float _2429 = -_2349;
    float _2431 = _2429 + 1.0;
    float _2433 = _2387 + _1778;
    out.m_45.x = _2419;
    float _2435 = _2373 * 0.5;
    float _2437 = _2433 * 0.5;
    out.m_67.x = _2417;
    out.m_67.y = _2421;
    out.m_67.z = _2423;
    out.m_67.w = _2425;
    out.m_63.z = _2323;
    out.m_63.w = _2347;
    out.gl_Position.x = _1802;
    out.gl_Position.y = _1804;
    out.gl_Position.z = _2387;
    out.gl_Position.w = _1778;
    out.m_69.x = _2435;
    out.m_69.y = _2427;
    out.m_69.z = _2437;
    out.m_69.w = _1778;
    float _2439 = _2349 * _1838;
    float _2441 = _1849 * _2431;
    float _2443 = _1849 * _2439;
    float _2445 = _1859 * _2439;
    float _2447 = fma(_1855, _2443, _1843);
    float _2449 = fma(_1857, _2443, _1845);
    float _2451 = fma(_1849, _2445, _1847);
    out.m_71.x = _2447;
    out.m_71.y = _2449;
    out.m_71.z = _2451;
    out.m_71.w = _2441;
    if (!_2415)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2453 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2453;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1212 = false;
    bool _774 = false;
    bool _594 = false;
    bool _414 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_45.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2510 = as_type<float>(_106);
        out.gl_Position.z = _2510;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2580 = as_type<float>(_144);
        out.gl_Position.z = _2580;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.x;
    float _148 = in.m_49.y;
    float _150 = in.m_49.z;
    bool _152 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _154 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _156 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _160 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _158);
    float _166 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _160);
    float _168 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _164);
    bool _172 = !_152;
    float _190;
    if (!_172)
    {
        float _174 = in.m_51.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        float _194 = float(_90);
        float _196 = 1.0 / _194;
        float _198 = _124 * _196;
        _190 = _198;
    }
    _192 = false;
    float _200 = _190;
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
        float _396 = in.m_51.x;
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _400 = _396 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _402 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _404 = _402 * _398;
        float _406 = floor(_404);
        float _408 = -_406;
        float _410 = _404 + _408;
        _412 = _410;
        _414 = true;
    }
    else
    {
        float _416 = float(_90);
        float _418 = 1.0 / _416;
        float _420 = _124 * _418;
        _412 = _420;
    }
    _414 = false;
    float _422 = _412;
    float _424 = in.m_53.x;
    float _426 = in.m_53.y;
    float _428 = in.m_53.z;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _432 = _422 + _430;
    bool _434 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _436 = isnan(_422);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _454 = 1.0 / _448;
    bool _456 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _458 = 1.0 / _452;
    float _460 = -_444;
    float _462 = _460 + 1.0;
    float _464 = _392 * _428;
    float _466 = _432 * _454;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _470 = _422 + _468;
    bool _472 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _474 = isnan(_422);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = _390 * _426;
    bool _486 = _422 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _488 = isnan(_422);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _498;
    float _502 = _388 * _424;
    float _504 = _470 * _458;
    float _506 = _496 * _462;
    float _508 = -_496;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _518 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _516;
    float _520 = fma(_500, _466, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _522 = _482 * _510;
    float _524 = fma(_514, _466, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _526 = fma(_518, _466, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _528 = -_482;
    float _530 = _528 + 1.0;
    float _532 = _520 * _522;
    float _534 = _524 * _522;
    float _536 = _526 * _522;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _550 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].x, _534);
    float _552 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].y, _536);
    float _554 = fma(_540, _504, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _556 = fma(_544, _504, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _558 = fma(_548, _504, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _560 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].z, _532);
    float _562 = fma(_554, _506, _550);
    float _564 = fma(_556, _506, _552);
    float _566 = fma(_558, _506, _560);
    float _568 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[109].x, _562);
    float _570 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[109].y, _564);
    float _572 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[109].z, _566);
    bool _574 = !_456;
    float _592;
    if (!_574)
    {
        float _576 = in.m_51.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _592 = _590;
        _594 = true;
    }
    else
    {
        float _596 = float(_90);
        float _598 = 1.0 / _596;
        float _600 = _124 * _598;
        _592 = _600;
    }
    _594 = false;
    float _602 = _592;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _602 + _604;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _612 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _614 = isnan(_602);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _632 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _634 = isnan(_602);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = 1.0 / _610;
    float _646 = -_622;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _650;
    bool _654 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _656 = isnan(_602);
    bool _658 = _654 || _656;
    bool _660 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = _642 * _648;
    float _668 = -_642;
    float _670 = _668 + 1.0;
    bool _672 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _674 = 1.0 / _626;
    float _676 = _664 * _670;
    float _678 = -_664;
    float _680 = _678 + 1.0;
    float _682 = 1.0 / _630;
    float _684 = _652 * _644;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _690 = fma(_684, _606, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _692 = _688 * _674;
    bool _694 = _602 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _696 = isnan(_602);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _706;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _712 = _602 + _710;
    float _714 = _690 * _676;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _718 = _602 + _716;
    float _720 = -_704;
    float _722 = _720 + 1.0;
    float _724 = fma(_692, _712, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _726 = _708 * _682;
    float _728 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[115].x, _714);
    float _730 = _622 * _722;
    float _732 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _734 = fma(_726, _718, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _736 = fma(_724, _666, _728);
    float _738 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _740 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _742 = fma(_734, _730, _736);
    float _744 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _746 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[118].x, _742);
    float _750 = _744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _748 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _740;
    out.m_55.y = _750;
    out.m_55.z = _746;
    out.m_55.w = _752;
    bool _754 = !_672;
    float _772;
    if (!_754)
    {
        float _756 = in.m_51.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_90);
        float _778 = 1.0 / _776;
        float _780 = _124 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _786 = _782 + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _788;
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _796;
    float _800 = 1.0 / _790;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _804 = _802 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _808 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _806;
    float _810 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _810;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _816 = _814 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _818 = 1.0 / _794;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _822 = _782 + _820;
    bool _824 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _826 = isnan(_782);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    bool _836 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _838 = isnan(_782);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = 1.0 / _798;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _852 = _782 + _850;
    float _854 = _822 * _800;
    bool _856 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _858 = isnan(_782);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = 1.0 / _804;
    float _870 = _852 * _818;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _874 = _782 + _872;
    bool _876 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _878 = isnan(_782);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = -_866;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _892;
    float _896 = 1.0 / _808;
    float _898 = _786 * _848;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _902 = _782 + _900;
    float _904 = -_886;
    float _906 = _904 + 1.0;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _910 = _782 + _908;
    float _912 = _886 * _890;
    bool _914 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _916 = 1.0 / _812;
    float _918 = _874 * _868;
    bool _920 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _922 = isnan(_782);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -_930;
    float _934 = _932 + 1.0;
    float _936 = 1.0 / _816;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _940 = _782 + _938;
    float _942 = _902 * _896;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _944;
    float _948 = _930 * _906;
    float _950 = fma(_946, _854, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _952 = _940 * _916;
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _954;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _958;
    float _962 = -_834;
    float _964 = _962 + 1.0;
    float _966 = fma(_956, _854, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _968 = _834 * _934;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _974 = _910 * _936;
    float _976 = fma(_960, _854, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _978 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _980 = _978 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _986 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _988 = isnan(_782);
    bool _990 = _986 || _988;
    bool _992 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _994 = _990 || _992;
    float _996 = float(_994);
    float _998 = _846 * _964;
    float _1000 = -_846;
    float _1002 = _1000 + 1.0;
    float _1004 = fma(_980, _870, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1006 = fma(_972, _870, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1008 = fma(_984, _870, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1010 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1012 = isnan(_782);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1022;
    bool _1026 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1028 = isnan(_782);
    bool _1030 = _1026 || _1028;
    bool _1032 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1034 = _1030 || _1032;
    float _1036 = float(_1034);
    float _1038 = _996 * _1002;
    float _1040 = -_996;
    float _1042 = _1040 + 1.0;
    float _1044 = fma(_1024, _898, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1046 = -_1036;
    float _1048 = _1046 + 1.0;
    float _1050 = _1036 * _1042;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1052;
    float _1056 = _1020 * _1048;
    float _1058 = -_1020;
    float _1060 = _1058 + 1.0;
    float _1062 = fma(_1054, _898, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1064 = fma(_894, _898, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1066 = _966 * _1056;
    float _1068 = _950 * _1056;
    float _1070 = _976 * _1056;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1074 = _1072 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1082 = _1080 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1084 = fma(_1074, _918, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1086 = fma(_1078, _918, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1088 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1066);
    float _1090 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1068);
    float _1092 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1070);
    float _1094 = fma(_1004, _1050, _1088);
    float _1096 = fma(_1006, _1050, _1090);
    float _1098 = fma(_1008, _1050, _1092);
    float _1100 = fma(_1082, _918, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1102;
    float _1106 = fma(_1062, _1038, _1094);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1108;
    float _1112 = fma(_1044, _1038, _1096);
    float _1114 = fma(_1064, _1038, _1098);
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1116;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1124 = fma(_1104, _952, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1126 = fma(_1084, _998, _1106);
    float _1128 = fma(_1110, _952, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1134 = fma(_1086, _998, _1112);
    float _1136 = fma(_1100, _998, _1114);
    float _1138 = fma(_1118, _952, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1140 = fma(_1122, _974, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1142 = fma(_1124, _968, _1126);
    float _1144 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1146 = _1144 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1148 = fma(_1132, _974, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1150 = fma(_1138, _968, _1136);
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1152;
    float _1156 = fma(_1128, _968, _1134);
    float _1158 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1160 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1158;
    float _1162 = fma(_1146, _974, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1164;
    float _1168 = fma(_1140, _948, _1142);
    float _1170 = fma(_1154, _942, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1172 = fma(_1160, _942, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1174 = fma(_1148, _948, _1156);
    float _1176 = fma(_1166, _942, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1178 = fma(_1162, _948, _1150);
    float _1180 = fma(_1170, _912, _1168);
    float _1182 = fma(_1172, _912, _1174);
    float _1184 = fma(_1176, _912, _1178);
    float _1186 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1180);
    float _1188 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1182);
    float _1190 = fma(_866, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1184);
    bool _1192 = !_914;
    float _1210;
    if (!_1192)
    {
        float _1194 = in.m_51.x;
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1198 = _1194 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1200 = fma(_1198, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _1202 = _1200 * _1196;
        float _1204 = floor(_1202);
        float _1206 = -_1204;
        float _1208 = _1202 + _1206;
        _1210 = _1208;
        _1212 = true;
    }
    else
    {
        float _1214 = float(_90);
        float _1216 = 1.0 / _1214;
        float _1218 = _124 * _1216;
        _1210 = _1218;
    }
    _1212 = false;
    float _1220 = _1210;
    float _1222 = _168 * _168;
    float _1224 = in.m_57.x;
    float _1226 = in.m_57.y;
    float _1228 = in.m_57.z;
    float _1230 = _484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1232 = fma(_166, _166, _1222);
    float _1234 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1236 = _464 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1238 = fma(_170, _170, _1232);
    bool _1240 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1242 = isnan(0.5);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1248 = _1244 || _1246;
    float _1250 = rsqrt(_1238);
    float _1252 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1226);
    float _1254 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1228);
    float _1256 = _170 * _1250;
    float _1258 = _166 * _1250;
    float _1260 = _168 * _1250;
    float _1262 = _1230 * _1252;
    float _1264 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1266 = _1256 * _1264;
    float _1268 = _1236 * _1254;
    float _1270 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1272 = _1260 * _1270;
    float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1276 = -_1266;
    float _1278 = fma(_1258, _1274, _1276);
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1282 = _1258 * _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1286 = -_1272;
    float _1288 = fma(_1256, _1284, _1286);
    float _1290 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1224);
    float _1292 = _1278 * _1278;
    float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1296 = -_1282;
    float _1298 = fma(_1260, _1294, _1296);
    float _1300 = _1234 * _1290;
    float _1302 = fma(_1288, _1288, _1292);
    float _1304 = _1262 * _1256;
    float _1306 = fma(_1298, _1298, _1302);
    float _1308 = in.m_42.x;
    float _1310 = in.m_42.y;
    float _1312 = in.m_42.z;
    float _1314 = rsqrt(_1306);
    float _1316 = _1278 * _1314;
    float _1318 = _1298 * _1314;
    float _1320 = _1288 * _1314;
    float _1322 = _1258 * _1316;
    float _1324 = fma(_1300, _1318, _1304);
    float _1326 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1328 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1330 = -_1322;
    float _1332 = fma(_1260, _1320, _1330);
    float _1334 = _1310 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1336 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1326);
    float _1338 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1328);
    float _1340 = fma(_1268, _1332, _1324);
    float _1342 = _1262 * _1258;
    float _1344 = _1260 * _1318;
    float _1346 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1336);
    float _1348 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1338);
    float _1350 = fma(_1300, _1320, _1342);
    float _1352 = -_1344;
    float _1354 = fma(_1256, _1316, _1352);
    float _1356 = _1346 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1358 = _1348 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1360 = fma(_1308, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1334);
    float _1362 = fma(_1268, _1354, _1350);
    float _1364 = _1356 + _1340;
    float _1366 = _1262 * _1260;
    float _1368 = _1256 * _1320;
    float _1370 = _1358 + _1362;
    float _1372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1374 = _1364 + _1372;
    float _1376 = fma(_1312, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1360);
    float _1378 = fma(_1300, _1316, _1366);
    float _1380 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1382 = _1370 + _1380;
    float _1384 = _1374 * _1374;
    float _1386 = -_1368;
    float _1388 = fma(_1258, _1318, _1386);
    float _1390 = _1376 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1392 = fma(_1382, _1382, _1384);
    float _1394 = fma(_1268, _1388, _1378);
    float _1396 = sqrt(_1392);
    float _1398 = _1390 + _1394;
    bool _1400 = _1396 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1402 = _1394;
    float _1404 = _1368;
    float _1406 = _1378;
    float _1408 = _1370;
    float _1410 = _1382;
    if (!_1400)
    {
        _1402 = _1370;
    }
    float _1412 = _1402;
    float _1414 = _1412;
    if (!_1400)
    {
        _1404 = _1364;
    }
    float _1416 = _1404;
    float _1418 = _1416;
    if (!_1400)
    {
        _1406 = _1398;
    }
    float _1420 = _1406;
    bool _1422 = !_1400;
    float _1424 = _1420;
    if (!_1422)
    {
        float _1426 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1430 = _1396 + _1428;
        float _1432 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1434 = rsqrt(_1392);
        float _1436 = _1430 * _1426;
        float _1438 = _1436 * 0.15915493667125701904296875;
        float _1440 = _1438 * 6.283185482025146484375;
        float _1442 = cos(_1440);
        float _1444 = _1438 * 6.283185482025146484375;
        float _1446 = sin(_1444);
        float _1448 = _1442 + (-1.0);
        float _1450 = fma(_1446, _1432, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1452 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1454 = _1434 * _1450;
        float _1456 = fma(_1398, _1442, _1452);
        float _1458 = fma(_1382, _1454, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1460 = fma(_1374, _1454, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1414 = _1458;
        _1424 = _1456;
        _1418 = _1460;
    }
    float _1462 = _1414;
    float _1464 = _1424;
    float _1466 = _1418;
    float _1468 = _1464;
    float _1470 = _1462;
    float _1472 = _1466;
    if (!_1248)
    {
        float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1476 = _1390 + _1474;
        float _1478 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1480 = _1358 + _1478;
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1484 = -_1358;
        float _1486 = _1484 + _1462;
        float _1488 = _1476 * _1476;
        float _1490 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1492 = _1356 + _1490;
        float _1494 = -_1390;
        float _1496 = _1494 + _1464;
        float _1498 = -_1356;
        float _1500 = _1498 + _1466;
        float _1502 = fma(_1480, _1480, _1488);
        float _1504 = fma(_1492, _1492, _1502);
        float _1506 = sqrt(_1504);
        float _1508 = precise::min(_1506, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1510 = _1508 * _1482;
        float _1512 = fma(_1486, _1510, _1358);
        float _1514 = fma(_1496, _1510, _1390);
        float _1516 = fma(_1500, _1510, _1356);
        _1468 = _1514;
        _1470 = _1512;
        _1472 = _1516;
    }
    float _1518 = _1468;
    float _1520 = _1470;
    float _1522 = _1472;
    float _1524 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1526 = _1518 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1530 = _1520 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1534 = _1522 + _1532;
    float _1536 = _1526 * _1526;
    float _1538 = fma(_1530, _1530, _1536);
    float _1540 = fma(_1534, _1534, _1538);
    float _1542 = rsqrt(_1540);
    float _1544 = sqrt(_1540);
    float _1546 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1548 = _1530 * _1546;
    float _1550 = _1534 * _1546;
    float _1552 = _1548 * _1548;
    float _1554 = _1550 * _1550;
    float _1556 = _1552 + _1554;
    float _1558 = sqrt(_1556);
    bool _1560 = _1558 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1562 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1564 = _1558 + _1562;
    float _1566 = _1534;
    float _1568 = _1556;
    float _1570 = _1564;
    float _1572 = _1526;
    if (_1560)
    {
        float _1574 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1566 = _1574;
    }
    float _1576 = _1566;
    if (_1560)
    {
        float _1578 = rsqrt(_1556);
        _1568 = _1578;
    }
    float _1580 = _1568;
    float _1582 = _1580;
    if (_1560)
    {
        float _1584 = _1564 * _1576;
        _1570 = _1584;
    }
    float _1586 = _1570;
    if (_1560)
    {
        float _1588 = _1586 * 0.15915493667125701904296875;
        _1408 = _1588;
    }
    float _1590 = _1408;
    float _1592 = _1576;
    float _1594 = _1590;
    if (_1560)
    {
        float _1596 = _1590 * 6.283185482025146484375;
        float _1598 = sin(_1596);
        _1592 = _1598;
    }
    float _1600 = _1592;
    float _1602 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1604 = precise::max(0.0, _1602);
    float _1606 = _1536;
    float _1608 = _1604;
    if (_1560)
    {
        float _1610 = _1590 * 6.283185482025146484375;
        float _1612 = cos(_1610);
        _1606 = _1612;
    }
    float _1614 = _1606;
    float _1616 = -_1546;
    float _1618 = -_1604;
    float _1620 = fma(_1526, _1616, _1618);
    if (_1560)
    {
        float _1622 = _1620 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1608 = _1622;
    }
    float _1624 = _1608;
    float _1626 = _1600;
    float _1628 = _1624;
    if (_1560)
    {
        float _1630 = fma(_1600, _1624, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1572 = _1630;
    }
    float _1632 = _1572;
    float _1634 = _1632;
    if (!_1560)
    {
        _1626 = _1548;
    }
    float _1636 = _1626;
    float _1638 = _1636;
    float _1640 = _1614;
    if (_1560)
    {
        float _1642 = _1614 + (-1.0);
        _1628 = _1642;
    }
    float _1644 = _1628;
    float _1646 = _1644;
    if (_1560)
    {
        float _1648 = _1580 * _1632;
        _1410 = _1648;
    }
    float _1650 = _1410;
    if (!_1560)
    {
        _1634 = _1620;
    }
    float _1652 = _1634;
    float _1654 = _1652;
    if (_1560)
    {
        float _1656 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1594 = _1656;
    }
    float _1658 = _1594;
    if (_1560)
    {
        float _1660 = _1548 * _1650;
        _1638 = _1660;
    }
    float _1662 = _1638;
    if (!_1560)
    {
        _1646 = _1550;
    }
    float _1664 = _1646;
    float _1666 = _1664;
    if (_1560)
    {
        float _1668 = _1550 * _1650;
        _1666 = _1668;
    }
    float _1670 = _1666;
    if (!_1560)
    {
        _1582 = _1552;
    }
    float _1672 = _1582;
    float _1674 = _1672;
    if (_1560)
    {
        float _1676 = fma(_1620, _1614, _1658);
        _1654 = _1676;
    }
    float _1678 = _1654;
    if (_1560)
    {
        float _1680 = _1662 * _1662;
        _1674 = _1680;
    }
    float _1682 = _1674;
    if (!_1560)
    {
        _1640 = _1554;
    }
    float _1684 = _1640;
    float _1686 = _1684;
    if (_1560)
    {
        float _1688 = _1670 * _1670;
        _1686 = _1688;
    }
    float _1690 = _1686;
    float _1692 = fma(_1678, _1678, _1682);
    float _1694 = _1692 + _1690;
    float _1696 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1698 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1700 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1698);
    float _1702 = precise::clamp(_1700, 0.0, 1.0);
    float _1704 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1706 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1708 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1696);
    float _1710 = rsqrt(_1694);
    float _1712 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1714 = -_1702;
    float _1716 = _1714 + 1.0;
    float _1718 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1708);
    float _1720 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1704);
    float _1722 = _1518 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1712);
    float _1726 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1728 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1720);
    float _1730 = abs(_1716);
    float _1732 = log2(_1730);
    float _1734 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1724);
    float _1736 = fma(_1520, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1738 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1740 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1742 = _1734 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1744 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1736);
    float _1746 = _1710 * _1662;
    float _1748 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1750 = _1710 * _1678;
    float _1752 = _1710 * _1670;
    float _1754 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1756 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1748);
    float _1758 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1760 = -_1740;
    float _1762 = fma(_1760, _1706, 1.0);
    float _1764 = -_1754;
    float _1766 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1764);
    float _1768 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1756);
    float _1770 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1772 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1774 = -_1752;
    float _1776 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1766);
    float _1778 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1768);
    float _1780 = exp2(_1770);
    float _1782 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1784 = fma(_1776, -0.5, 0.5);
    float _1786 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1772);
    float _1788 = fma(_1776, 0.5, 0.5);
    float _1790 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1782);
    float _1792 = _1750 + 1.0;
    float _1794 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1786);
    float _1796 = log2(_1762);
    float _1798 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1790);
    float _1800 = fma(_1788, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1802 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1794);
    float _1804 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1798);
    float _1806 = fma(_1788, _1800, -0.212114393711090087890625);
    float _1808 = 1.0 / _1778;
    float _1810 = -_1750;
    float _1812 = fma(_1780, _1792, _1810);
    float _1814 = fma(_1788, _1806, 1.570728778839111328125);
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = sqrt(_1784);
    float _1820 = _1796 * 0.693147182464599609375;
    float _1822 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1824 = _1802 * _1808;
    float _1826 = _1804 * _1808;
    float _1828 = fma(_1824, 0.5, 0.5);
    float _1830 = fma(_1826, -0.5, 0.5);
    float _1832 = _1818 * 0.636619746685028076171875;
    float _1834 = -_1814;
    float _1836 = fma(_1832, _1834, 1.0);
    float3 _5366 = float3(_1828, _1830, _1822);
    float _1838 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5366, float3(0.0), isnan(_5366)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5366, float3(0.0), isnan(_5366)), level(0.0)).x;
    float3 _5377 = float3(_1828, _1830, _1822);
    float4 _1841 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5377, float3(0.0), isnan(_5377)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5377, float3(0.0), isnan(_5377)), level(0.0)).xyzw;
    float _1843 = _1841.x;
    float _1845 = _1841.y;
    float _1847 = _1841.z;
    float _1849 = _1841.w;
    float2 _5394 = float2(_1836, _1816);
    float3 _1853 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5394, float2(0.0), isnan(_5394)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5394, float2(0.0), isnan(_5394)), level(0.0)).xyz;
    float _1855 = _1853.x;
    float _1857 = _1853.y;
    float _1859 = _1853.z;
    float _1861 = in.m_51.w;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1865 = _1220 + _1863;
    float _1867 = in.m_59.x;
    int _1869 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1871 = _1869 != 0;
    float _1873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1877 = _1875 != 0;
    float _1879 = in.m_59.y;
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1883 = _1881 != 0;
    float _1885 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1889 = _1887 != 0;
    float _1891 = in.m_51.x;
    float _1893 = _1738 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1897 = _1895 != 0;
    float _1899 = in.m_61.y;
    float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1905 = in.m_51.y;
    float _1907 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1909 = _1907 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1911 = 1.0 / _1903;
    bool _1913 = _1861 > 0.5;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1917 = _1915 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1919 = 0.0;
    bool _1921 = _1889;
    bool _1923 = _1883;
    if (_1877)
    {
        float _1925 = in.m_51.z;
        _1919 = _1925;
    }
    float _1927 = _1919;
    float _1929 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1893);
    bool _1931 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1933 = isnan(0.5);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1939 = _1935 || _1937;
    out.m_63.x = _1867;
    float _1941 = 1.0 / _1909;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    out.m_63.y = _1879;
    float _1947 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1949 = in.m_61.x;
    float _1951 = 1.0 / _1917;
    float _1953 = -_1899;
    float _1955 = _1953 + 1.0;
    float _1957 = -_1943;
    float _1959 = fma(_1947, 2.0, _1957);
    float _1961 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1963 = _1905 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1967 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1965;
    int _1969 = _1913 ? as_type<int>(_1955) : as_type<int>(_1899);
    float _1971 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1973 = _1971 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1975 = fma(_1963, -2.0, _1945);
    bool _1977 = _1905 > 0.5;
    float _1979 = -_124;
    float _1981 = fma(_1979, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1959);
    float _1983 = _1883 ? as_type<float>(_1969) : _1899;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1987 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1985;
    float _1989 = _1967 * _1911;
    float _1991 = _1973 * _1951;
    float _1993 = _1987 * _1941;
    float _1995 = _1899;
    float _1997 = _1955;
    float _1999 = _1911;
    float _2001 = _1991;
    if (_1889)
    {
        float _2003 = _1977 ? _1955 : _1899;
        _1995 = _2003;
    }
    float _2005 = _1995;
    float _2007 = _1987;
    if (!_1897)
    {
        float _2009 = in.m_51.z;
        _2007 = _2009;
    }
    float _2011 = _2007;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2015 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (!_1897)
    {
        _1997 = _1905;
    }
    float _2017 = _1997;
    float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2021 = _1220 + _2019;
    float _2023 = _2017;
    if (_1871)
    {
        bool _2025 = _1891 > 0.5;
        _1921 = _2025;
    }
    bool _2027 = _1921;
    float _2029 = fma(_1891, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2013);
    float _2031 = _2029;
    if (_1897)
    {
        _2023 = _1891;
    }
    float _2033 = _2023;
    float _2035 = fma(_1989, _2021, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    if (_1877)
    {
        bool _2037 = _1927 > 0.5;
        _1923 = _2037;
    }
    bool _2039 = _1923;
    float _2041 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2043 = _1220 + _2041;
    bool _2045 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2047 = isnan(_1220);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    float _2057 = fma(_1993, _1865, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _2059 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2061 = isnan(_1220);
    bool _2063 = _2059 || _2061;
    bool _2065 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2067 = _2063 || _2065;
    float _2069 = float(_2067);
    float _2071 = fma(_1991, _2043, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2073 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2075 = isnan(_1220);
    bool _2077 = _2073 || _2075;
    bool _2079 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2081 = _2077 || _2079;
    float _2083 = float(_2081);
    float _2085 = -_2055;
    float _2087 = _2085 + 1.0;
    bool _2089 = _1220 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2091 = isnan(_1220);
    bool _2093 = _2089 || _2091;
    bool _2095 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2097 = _2093 || _2095;
    float _2099 = float(_2097);
    float _2101 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2103 = _2083;
    if (!_1871)
    {
        _1999 = _1949;
    }
    float _2105 = _1999;
    float _2107 = _2069 * _2087;
    float _2109 = -_2069;
    float _2111 = _2109 + 1.0;
    float _2113 = -_2083;
    float _2115 = _2113 + 1.0;
    float _2117 = _2105;
    if (!_1871)
    {
        _2001 = _2105;
    }
    float _2119 = _2001;
    float _2121 = exp2(_1885);
    float _2123 = _2119;
    if (_1871)
    {
        _2117 = _1949;
    }
    float _2125 = _2117;
    float _2127 = _2083 * _2111;
    float _2129 = _2011;
    float _2131 = _2125;
    if (!_1897)
    {
        _2103 = _2011;
    }
    float _2133 = _2103;
    float _2135 = _2099 * _2115;
    float _2137 = fma(_1905, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1961);
    float _2139 = _2133;
    if (_1897)
    {
        _2139 = _1905;
    }
    float _2141 = _2139;
    float _2143 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    if (_1897)
    {
        _2129 = _1905;
    }
    float _2145 = _2129;
    float _2147 = fma(_1983, _2101, -0.5);
    float _2149 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2151 = _2035 * _2135;
    float _2153 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2155 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2157 = fma(_2033, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2149);
    float _2159 = _2033 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2161 = fma(_2153, _2005, -0.5);
    int _2163 = as_type<int>(_2153);
    if (_1871)
    {
        float _2165 = -_2125;
        float _2167 = _2165 + 1.0;
        _2163 = as_type<int>(_2167);
    }
    int _2169 = _2163;
    float _2171 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2173 = -_2155;
    float _2175 = fma(_2159, 2.0, _2173);
    float _2177 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2143);
    float _2179 = _1390 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    if (_1871)
    {
        float _2181 = _2027 ? as_type<float>(_2169) : _2125;
        _2123 = _2181;
    }
    float _2183 = _2123;
    float _2185 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2171);
    float _2187 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2177);
    float _2189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2191 = fma(_1358, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2179);
    float _2193 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2137);
    float _2195 = _2187 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2197 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1975);
    float _2199 = fma(_1356, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2191);
    float _2201 = -_2099;
    float _2203 = _2201 + 1.0;
    float _2205 = 1.0 / _2195;
    float _2207 = -_2197;
    float _2209 = fma(_2193, _2161, _2207);
    float _2211 = _2199 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2213 = _2141 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2215 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2217 = fma(_2203, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2151);
    float _2219 = -_124;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2175);
    int _2223 = 0;
    float _2225 = _2215;
    if (_1877)
    {
        float _2227 = -_2125;
        float _2229 = _2227 + 1.0;
        _2223 = as_type<int>(_2229);
    }
    int _2231 = _2223;
    float _2233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2235 = _2211 + _2195;
    float _2237 = _2189 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2239 = fma(_2213, -2.0, _2215);
    float _2241 = _2237;
    if (!_1939)
    {
        _2225 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2243 = _2225;
    float _2245 = fma(_2237, _2183, -0.5);
    float _2247 = fma(_2071, _2127, _2217);
    float _2249 = _2235 * _2205;
    float _2251 = _2249 * 0.5;
    float _2253 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2157);
    float _2255 = _2243;
    if (!_1939)
    {
        float _2257 = -_2243;
        float _2259 = _2257 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2241 = _2259;
    }
    float _2261 = _2241;
    float _2263 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2185);
    float _2265 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2267 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2265);
    float _2269 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2029);
    float _2271 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2239);
    float _2273 = fma(_2057, _2107, _2247);
    float _2275 = _2233 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2277 = _2233;
    float _2279 = _2273;
    if (!_1939)
    {
        _2277 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2281 = _2277;
    float _2283 = 1.0 / _2267;
    if (_1877)
    {
        float _2285 = _2039 ? as_type<float>(_2231) : _2125;
        _2131 = _2285;
    }
    float _2287 = _2131;
    float _2289 = fma(_2269, _2245, _1981);
    float _2291 = -_2271;
    float _2293 = fma(_2263, _2147, _2291);
    if (!_1939)
    {
        float _2295 = -_2281;
        float _2297 = _2295 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _126 = _2297;
    }
    float _2299 = _126;
    float _2301 = _2209 + 0.5;
    float _2303 = fma(_2275, _2287, -0.5);
    float _2305 = _2289 + 0.5;
    float _2307 = _2261;
    float _2309 = _2299;
    if (!_1939)
    {
        float _2311 = 1.0 / _2261;
        _2307 = _2311;
    }
    float _2313 = _2307;
    float _2315 = _2293 + 0.5;
    float _2317 = fma(_2253, _2303, _2221);
    float _2319 = fma(_2055, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2273);
    if (_1939)
    {
        _2279 = 1.0;
    }
    float _2321 = _2279;
    float _2323 = in.m_59.z;
    float _2325 = _2317 + 0.5;
    float _2327 = -_2121;
    float _2329 = _2327 + 1.0;
    float _2331 = _2057;
    float _2333 = _2321;
    if (!_1939)
    {
        float _2335 = 1.0 / _2299;
        _2331 = _2335;
    }
    float _2337 = _2331;
    if (!_1939)
    {
        float _2339 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2341 = -_2281;
        float _2343 = fma(_2283, _2339, _2341);
        _2031 = _2343;
    }
    float _2345 = _2031;
    float _2347 = in.m_59.w;
    float _2349 = _2329 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_65.x = _2305;
    out.m_65.y = _2301;
    out.m_65.z = _2325;
    out.m_65.w = _2315;
    if (!_1939)
    {
        float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2353 = -_2243;
        float _2355 = fma(_2283, _2351, _2353);
        _2309 = _2355;
    }
    float _2357 = _2309;
    if (_1939)
    {
        _2255 = 1.0;
    }
    float _2359 = _2255;
    float _2361 = _2313;
    float _2363 = _2359;
    if (!_1939)
    {
        float _2365 = _2357 * _2313;
        float _2367 = precise::clamp(_2365, 0.0, 1.0);
        _2361 = _2367;
    }
    float _2369 = _2361;
    float _2371 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1929);
    float _2373 = _1802 + _1778;
    if (!_1939)
    {
        float _2375 = _2345 * _2337;
        float _2377 = precise::clamp(_2375, 0.0, 1.0);
        _2333 = _2377;
    }
    float _2379 = _2333;
    if (!_1939)
    {
        float _2381 = -_2369;
        float _2383 = _2381 + 1.0;
        _2363 = _2383;
    }
    float _2385 = _2363;
    float _2387 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2371);
    float _2389 = _1188 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2391 = _2379 * _2385;
    float _2393 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2395 = _2379 > 0.0;
    bool _2397 = isnan(_2379);
    bool _2399 = _2395 || _2397;
    bool _2401 = isnan(0.0);
    bool _2403 = _2399 || _2401;
    float _2405 = _1190 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2407 = _2391 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2409 = _1778 * 0.5;
    bool _2411 = _2385 <= 0.0;
    bool _2413 = !_2403;
    bool _2415 = _2411 || _2413;
    float _2417 = _2393 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2419 = _2407 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2421 = _2389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2423 = _2405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2425 = _2319 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2427 = fma(_1804, -0.5, _2409);
    float _2429 = -_2349;
    float _2431 = _2429 + 1.0;
    float _2433 = _2387 + _1778;
    out.m_45.x = _2419;
    float _2435 = _2373 * 0.5;
    float _2437 = _2433 * 0.5;
    out.m_67.x = _2417;
    out.m_67.y = _2421;
    out.m_67.z = _2423;
    out.m_67.w = _2425;
    out.m_63.z = _2323;
    out.m_63.w = _2347;
    out.gl_Position.x = _1802;
    out.gl_Position.y = _1804;
    out.gl_Position.z = _2387;
    out.gl_Position.w = _1778;
    out.m_69.x = _2435;
    out.m_69.y = _2427;
    out.m_69.z = _2437;
    out.m_69.w = _1778;
    float _2439 = _2349 * _1838;
    float _2441 = _1849 * _2431;
    float _2443 = _1849 * _2439;
    float _2445 = _1859 * _2439;
    float _2447 = fma(_1855, _2443, _1843);
    float _2449 = fma(_1857, _2443, _1845);
    float _2451 = fma(_1849, _2445, _1847);
    out.m_71.x = _2447;
    out.m_71.y = _2449;
    out.m_71.z = _2451;
    out.m_71.w = _2441;
    if (!_2415)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2453 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2453;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

