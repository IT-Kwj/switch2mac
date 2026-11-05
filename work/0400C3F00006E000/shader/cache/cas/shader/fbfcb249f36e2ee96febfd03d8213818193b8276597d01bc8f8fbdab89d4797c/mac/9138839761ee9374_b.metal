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
    bool _900 = false;
    bool _684 = false;
    bool _586 = false;
    bool _358 = false;
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
        float _3110 = as_type<float>(_118);
        out.gl_Position.z = _3110;
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
        float _3165 = as_type<float>(_144);
        out.gl_Position.z = _3165;
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
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = _198 + _200;
    bool _204 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _206 = isnan(_198);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _212 = _208 || _210;
    float _214 = float(_212);
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _198 + _216;
    bool _220 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_198);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _242 = isnan(_198);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_214;
    float _254 = _252 + 1.0;
    float _256 = 1.0 / _238;
    float _258 = _250 * _254;
    float _260 = -_250;
    float _262 = _260 + 1.0;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _270 = 1.0 / _234;
    float _272 = _230 * _262;
    float _274 = -_230;
    float _276 = _274 + 1.0;
    float _278 = _218 * _256;
    float _280 = _202 * _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _286;
    float _290 = fma(_266, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _292 = fma(_284, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = fma(_288, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _296 = _290 * _272;
    float _298 = _292 * _272;
    float _300 = _294 * _272;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _314 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _316 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _318 = fma(_304, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _320 = fma(_308, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _322 = fma(_312, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _324 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _326 = fma(_318, _258, _314);
    float _328 = fma(_320, _258, _316);
    float _330 = fma(_322, _258, _324);
    float _332 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[145].x, _326);
    float _334 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[145].y, _328);
    float _336 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[145].z, _330);
    bool _338 = !_268;
    float _356;
    if (!_338)
    {
        float _340 = in.m_53.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        _356 = _156;
    }
    _358 = false;
    float _360 = _356;
    float _362 = in.m_55.x;
    float _364 = in.m_55.y;
    float _366 = in.m_55.z;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _370 = _360 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _374 = _360 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _388 = 1.0 / _378;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _392 = 1.0 / _386;
    float _394 = _334 * _364;
    bool _396 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _398 = isnan(_360);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = _336 * _366;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _412 = _360 + _410;
    float _414 = 1.0 / _382;
    float _416 = _370 * _388;
    bool _418 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _420 = isnan(_360);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -_406;
    float _432 = _430 + 1.0;
    float _434 = _332 * _362;
    float _436 = _428 * _432;
    float _438 = _374 * _392;
    bool _440 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _442 = isnan(_360);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _452;
    bool _456 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _458 = isnan(_360);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _472 = -_428;
    float _474 = _472 + 1.0;
    float _476 = -_450;
    float _478 = _476 + 1.0;
    float _480 = _412 * _414;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _486;
    float _490 = _466 * _478;
    float _492 = fma(_454, _480, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _494 = fma(_484, _480, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _496 = fma(_488, _480, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _498 = _450 * _474;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _504 = _494 * _490;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _510 = _496 * _490;
    float _512 = -_466;
    float _514 = _512 + 1.0;
    float _516 = _492 * _490;
    float _518 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[107].x, _510);
    float _520 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[107].y, _504);
    float _522 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[107].z, _516);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _524;
    float _528 = fma(_470, _438, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _530 = fma(_502, _438, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _532 = fma(_508, _438, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _538;
    float _542 = fma(_528, _498, _518);
    float _544 = fma(_526, _416, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _546 = fma(_536, _416, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _548 = fma(_540, _416, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _550 = fma(_530, _498, _520);
    float _552 = fma(_532, _498, _522);
    float _554 = fma(_544, _436, _542);
    float _556 = fma(_546, _436, _550);
    float _558 = fma(_548, _436, _552);
    float _560 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[110].x, _554);
    float _562 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[110].y, _556);
    float _564 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[110].z, _558);
    bool _566 = !_390;
    float _584;
    if (!_566)
    {
        float _568 = in.m_53.x;
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        _584 = _156;
    }
    _586 = false;
    float _588 = _584;
    bool _590 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_588);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_588);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _588 + _622;
    float _626 = -_600;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _632 = 1.0 / _604;
    float _634 = _616 * _628;
    float _636 = -_616;
    float _638 = _636 + 1.0;
    float _640 = _620 * _632;
    float _642 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = fma(_640, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = _644 * _634;
    float _650 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[116].x, _652);
    float _662 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _664 = !_630;
    float _682;
    if (!_664)
    {
        float _666 = in.m_53.x;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _670 = _666 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _682 = _680;
        _684 = true;
    }
    else
    {
        _682 = _156;
    }
    _684 = false;
    float _686 = _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _694 = _686 + _692;
    bool _696 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _698 = isnan(_686);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _714 = _686 + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _724 = 1.0 / _710;
    bool _726 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _728 = 1.0 / _722;
    float _730 = 1.0 / _718;
    float _732 = _690 * _724;
    bool _734 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _736 = isnan(_686);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_706;
    float _748 = _746 + 1.0;
    float _750 = _744 * _748;
    float _752 = _694 * _728;
    bool _754 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _756 = isnan(_686);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _766;
    bool _770 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _772 = isnan(_686);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _786 = -_744;
    float _788 = _786 + 1.0;
    float _790 = -_764;
    float _792 = _790 + 1.0;
    float _794 = _714 * _730;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _800;
    float _804 = _780 * _792;
    float _806 = fma(_768, _794, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _808 = fma(_798, _794, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _810 = fma(_802, _794, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _812 = _764 * _788;
    float _814 = _806 * _804;
    float _816 = _808 * _804;
    float _818 = _810 * _804;
    float _820 = -_780;
    float _822 = _820 + 1.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _832 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].x, _818);
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].y, _816);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _836;
    float _840 = fma(_784, _752, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _842 = fma(_826, _752, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _844 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].z, _814);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _846;
    float _850 = fma(_830, _752, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _852;
    float _856 = fma(_840, _812, _832);
    float _858 = fma(_838, _732, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _860 = fma(_848, _732, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _862 = fma(_842, _812, _834);
    float _864 = fma(_854, _732, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _866 = fma(_850, _812, _844);
    float _868 = fma(_858, _750, _856);
    float _870 = fma(_860, _750, _862);
    float _872 = fma(_864, _750, _866);
    float _874 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[126].x, _868);
    float _876 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[126].y, _870);
    float _878 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[126].z, _872);
    bool _880 = !_726;
    float _898;
    if (!_880)
    {
        float _882 = in.m_53.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        _898 = _156;
    }
    _900 = false;
    float _902 = _898;
    float _904 = in.m_53.x;
    float _906 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _908 = int(_906);
    float _910 = in.m_53.y;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _914 = in.m_42.x;
    float _916 = in.m_42.y;
    float _918 = in.m_42.z;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _922 = _920 != 0;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _926 = in.m_53.z;
    float _928 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _930 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _928);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _936 = _904 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _938 = _904 * 2.0;
    float _940 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _942 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _944 = -_912;
    float _946 = fma(_936, 2.0, _944);
    float _948 = floor(_938);
    float _950 = _910 * 2.0;
    float _952 = fma(_942, -2.0, _924);
    float _954 = _916 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _956 = _916 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = _916 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _940);
    float _962 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _964 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _966 = _926 * 2.0;
    float _968 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _970 = _904 + _910;
    float _972 = _904 + _926;
    float _974 = floor(_950);
    float _976 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[4].z, _962);
    float _978 = _970 + (-1.0);
    float _980 = _910 + _926;
    float _982 = _972 + (-1.0);
    bool _984 = _948 > 0.0;
    float _986 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[5].z, _964);
    float _988 = _980 + (-1.0);
    float _990 = floor(_966);
    float _992 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[6].z, _968);
    bool _994 = _948 >= 0.0;
    bool _996 = isnan(_948);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    float _1004 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _960);
    float _1006 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1010 = _988;
    if (!_922)
    {
        _1010 = _926;
    }
    float _1012 = _1010;
    float _1014 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1016 = int(_1014);
    float _1018 = _1012;
    if (_922)
    {
        _1018 = _910;
    }
    float _1020 = _1018;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1024 = _974 >= 0.0;
    bool _1026 = isnan(_974);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    float _1034 = -_100;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[76].x, _946);
    bool _1038 = _974 > 0.0;
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1022);
    bool _1042 = _990 > 0.0;
    float _1044 = _992 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1046 = _990 >= 0.0;
    bool _1048 = isnan(_990);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan(0.0);
    bool _1054 = _1050 || _1052;
    float _1056 = _1022;
    float _1058 = _1020;
    if (!_922)
    {
        _1056 = _910;
    }
    float _1060 = _1056;
    float _1062 = _1060;
    if (_922)
    {
        _1062 = _904;
    }
    float _1064 = _1062;
    float _1066 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _930);
    if (!_922)
    {
        _1058 = _926;
    }
    float _1068 = _1058;
    float _1070 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1072 = log2(_1070);
    float _1074 = _1068;
    if (_922)
    {
        _1074 = _910;
    }
    float _1076 = _1074;
    float _1078 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _932);
    float _1080 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1082 = _1032 ? 0 : 1;
    float _1084 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _952);
    float _1086 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1088 = -_934;
    float _1090 = fma(_1080, 2.0, _1088);
    int _1092 = _1002 ? 0 : 1;
    float _1094 = rsqrt(_1066);
    int _1096 = _1054 ? 0 : 1;
    int _1098 = ~_1092;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = ~_1096;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    int _1110 = _1102;
    int _1112 = _1108;
    if (!_984)
    {
        int _1114 = ~_1092;
        int _1116 = _1114 + 1;
        _1110 = _1116;
    }
    int _1118 = _1110;
    float _1120 = _1072 * _100;
    if (!_1042)
    {
        int _1122 = ~_1096;
        int _1124 = _1122 + 1;
        _1112 = _1124;
    }
    int _1126 = _1112;
    bool _1128 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1130 = isnan(0.0);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1136 = _1132 || _1134;
    float _1138 = exp2(_1120);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1144 = _1142 != 0;
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1152 = _1150 != 0;
    float _1154 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1140);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1158 = 1.0 + _1156;
    bool _1160 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1162 = isnan(1.0);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1168 = _1164 || _1166;
    float _1170 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1172 = float(_1016);
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1176 = !_1148;
    int _1178 = _1176 ? 0 : 1;
    float _1180 = 1.0 / _1158;
    bool _1182 = !_1144;
    int _1184 = _1182 ? 0 : 1;
    float _1186 = fma(_1086, -2.0, _1174);
    bool _1188 = !_1152;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = -_1138;
    float _1194 = _1192 + 1.0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1206 = _1204 != 0;
    float _1208 = 1.0 / _1172;
    int _1210 = ~_1082;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    if (!_1038)
    {
        int _1218 = ~_1082;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1226 = !_1198;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = in.m_57.x;
    float _1232 = in.m_57.y;
    float _1234 = in.m_57.z;
    bool _1236 = !_1202;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1224);
    int _1242 = abs(_1228);
    float _1244 = -_100;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1090);
    int _1248 = abs(_1238);
    float _1250 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1040);
    float _1252 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1240);
    float _1254 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1154);
    float _1256 = float(_908);
    float _1258 = _1208 * _100;
    float _1260 = float(_1118);
    float _1262 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1186);
    float _1264 = _1136 ? _1194 : 0.0;
    float _1266 = _1256 * _100;
    float _1268 = float(_1242);
    float _1270 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1078);
    float _1272 = float(_1126);
    if (_1168)
    {
        float _1274 = _1264 * _1180;
        _110 = _1274;
    }
    float _1276 = _110;
    bool _1278 = !_1206;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = float(_1248);
    float _1284 = _1268 * _1272;
    int _1286 = abs(_1280);
    float _1288 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1290 = _1282 * _1260;
    float _1292 = _1284 * (-2.0);
    float _1294 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1296 = _1288 * _1288;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1298;
    float _1302 = _904 + (-0.5);
    float _1304 = fma(_1292, _1230, _1230);
    float _1306 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1308 = fma(_1294, _1294, _1296);
    float _1310 = float(_1222);
    float _1312 = fma(_1170, _1292, _1170);
    float _1314 = float(_1286);
    float _1316 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1304);
    float _1318 = fma(_1306, _1306, _1308);
    float _1320 = _1290 * (-2.0);
    float _1322 = 1.0 / _1300;
    float _1324 = _1314 * _1310;
    float _1326 = fma(_1312, _1276, _1316);
    float _1328 = _986 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1330 = fma(_1008, _1320, _1008);
    float _1332 = fma(_1320, _1232, _1232);
    float _1334 = _910 + (-0.5);
    float _1336 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1340 = in.m_59.x;
    float _1342 = in.m_59.y;
    float _1344 = in.m_59.z;
    float _1346 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1332);
    float _1348 = _1324 * (-2.0);
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1338);
    float _1352 = rsqrt(_1318);
    float _1354 = fma(_1330, _1276, _1346);
    float _1356 = fma(_1006, _1348, _1006);
    float _1358 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1350);
    float _1360 = fma(_1348, _1234, _1234);
    float _1362 = _1354 * 0.15915493667125701904296875;
    float _1364 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1368 = _1326 * 0.15915493667125701904296875;
    float _1370 = _926 + (-0.5);
    float _1372 = _1362 * 6.283185482025146484375;
    float _1374 = sin(_1372);
    bool _1376 = _1366 >= _1364;
    bool _1378 = isnan(_1366);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(_1364);
    bool _1384 = _1380 || _1382;
    float _1386 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1360);
    float _1388 = -_1366;
    float _1390 = _1364 + _1388;
    float _1392 = _1294 * _1352;
    float _1394 = fma(_1356, _1276, _1386);
    float _1396 = _1368 * 6.283185482025146484375;
    float _1398 = sin(_1396);
    float _1400 = abs(_1390);
    float _1402 = precise::max(_1400, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1342);
    float _1406 = _1394 * 0.15915493667125701904296875;
    float _1408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1340);
    float _1410 = precise::min(_1402, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1412 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1414 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1416 = _1368 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1288 * _1352;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1424 = _1410 + _1422;
    float _1426 = _1412 * _1404;
    float _1428 = _1306 * _1352;
    float _1430 = _1424 * _1322;
    float _1432 = _1406 * 6.283185482025146484375;
    float _1434 = cos(_1432);
    float _1436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1344);
    float _1438 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1440 = !_1384;
    float _1442 = _1440 ? 1.0 : (-1.0);
    float _1444 = _1414 * _1436;
    float _1446 = _1438 * _1408;
    float _1448 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1450 = _1362 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    float _1454 = _1442 * _1430;
    float _1456 = _1418 * _1374;
    float _1458 = _1448 * _1454;
    float _1460 = _1398 * _1374;
    float _1462 = _1406 * 6.283185482025146484375;
    float _1464 = sin(_1462);
    float _1466 = _1374 * _1434;
    float _1468 = _1458 * 0.15915493667125701904296875;
    float _1470 = _1434 * _1426;
    float _1472 = _1418 * _1452;
    float _1474 = _1398 * _1452;
    float _1476 = _1468 * 6.283185482025146484375;
    float _1478 = cos(_1476);
    float _1480 = _1418 * _1470;
    float _1482 = _1452 * _1434;
    float _1484 = _1398 * _1470;
    float _1486 = fma(_1464, _1472, _1460);
    float _1488 = -_1456;
    float _1490 = fma(_1464, _1474, _1488);
    float _1492 = -_1474;
    float _1494 = fma(_1464, _1456, _1492);
    float _1496 = -_1426;
    float _1498 = _1464 * _1496;
    float _1500 = fma(_1486, _1446, _1480);
    float _1502 = _1468 * 6.283185482025146484375;
    float _1504 = sin(_1502);
    float _1506 = fma(_1464, _1460, _1472);
    float _1508 = fma(_1482, _1446, _1498);
    float _1510 = fma(_1494, _1444, _1500);
    float _1512 = fma(_1490, _1446, _1484);
    float _1514 = -_1478;
    float _1516 = _1514 + 1.0;
    float _1518 = fma(_1466, _1444, _1508);
    float _1520 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1522 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1524 = fma(_1506, _1444, _1512);
    float _1526 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1520);
    float _1530 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1522);
    float _1532 = _1420 * _1516;
    float _1534 = _1428 * _1428;
    float _1536 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1528);
    float _1538 = _1392 * _1504;
    float _1540 = _1420 * _1504;
    float _1542 = _1428 * _1504;
    float _1544 = _1392 * _1516;
    float _1546 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1526);
    float _1548 = fma(_1428, _1532, _1538);
    float _1550 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1530);
    float _1552 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1554 = fma(_1516, _1534, _1478);
    float _1556 = -_1542;
    float _1558 = fma(_1420, _1544, _1556);
    float _1560 = -_1540;
    float _1562 = fma(_1428, _1544, _1560);
    float _1564 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1566 = _1552 * _1548;
    float _1568 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1546);
    float _1570 = fma(_1392, _1544, _1478);
    float _1572 = _1552 * _1558;
    float _1574 = fma(_1564, _1562, _1566);
    float _1576 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1578 = fma(_1420, _1532, _1478);
    float _1580 = fma(_1564, _1570, _1572);
    float _1582 = fma(_1428, _1544, _1540);
    float _1584 = fma(_1576, _1554, _1574);
    float _1586 = fma(_1420, _1544, _1542);
    float _1588 = _1552 * _1578;
    float _1590 = fma(_1576, _1582, _1580);
    float _1592 = _1044 + _1584;
    float _1594 = -_1538;
    float _1596 = fma(_1428, _1532, _1594);
    float _1598 = fma(_1564, _1586, _1588);
    float _1600 = _1336 + _1590;
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1604 = _1592 + _1602;
    float _1606 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1608 = fma(_1576, _1596, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1612 = _1600 + _1610;
    float _1614 = _1604 * _1604;
    float _1616 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1606);
    float _1618 = _1328 + _1608;
    float _1620 = fma(_1612, _1612, _1614);
    float _1622 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1616);
    float _1624 = sqrt(_1620);
    bool _1626 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1628 = _1616;
    float _1630 = _1608;
    float _1632 = _1532;
    float _1634 = _1624;
    if (!_1626)
    {
        _1628 = _1600;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    if (!_1626)
    {
        _1630 = _1592;
    }
    float _1640 = _1630;
    float _1642 = _1640;
    if (!_1626)
    {
        _1632 = _1618;
    }
    float _1644 = _1632;
    bool _1646 = !_1626;
    float _1648 = _1644;
    if (!_1646)
    {
        float _1650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1654 = _1624 + _1652;
        float _1656 = rsqrt(_1620);
        float _1658 = _1654 * _1650;
        float _1660 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1662 = _1658 * 0.15915493667125701904296875;
        float _1664 = _1662 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        float _1672 = _1666 + (-1.0);
        float _1674 = fma(_1670, _1660, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1676 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1678 = _1656 * _1674;
        float _1680 = fma(_1618, _1666, _1676);
        float _1682 = fma(_1612, _1678, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1684 = fma(_1604, _1678, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1648 = _1680;
        _1638 = _1682;
        _1642 = _1684;
    }
    float _1686 = _1648;
    float _1688 = _1638;
    float _1690 = _1642;
    float _1692 = -_1328;
    float _1694 = _1692 + _1686;
    float _1696 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1698 = -_1336;
    float _1700 = _1698 + _1688;
    float _1702 = -_1044;
    float _1704 = _1702 + _1690;
    float _1706 = _1694 * _1694;
    float _1708 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1710 = 1.0 / _1696;
    float _1712 = fma(_1700, _1700, _1706);
    float _1714 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1708);
    float _1716 = fma(_1704, _1704, _1712);
    float _1718 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1714);
    bool _1720 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan(0.5);
    bool _1728 = _1724 || _1726;
    float _1730 = sqrt(_1716);
    float _1732 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1734 = _1732 + _1696;
    float _1736 = _1734 * _1710;
    float _1738 = _1736 * 0.5;
    bool _1740 = _1730 > 0.0;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1744 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1742);
    float _1746 = _1738;
    float _1748 = _1700;
    float _1750 = _1686;
    float _1752 = _1688;
    float _1754 = _1690;
    float _1756 = _1704;
    float _1758 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1760 = _1696;
    if (_1728)
    {
        _1746 = 1.0;
    }
    float _1762 = _1746;
    float _1764 = 1.0 / _1744;
    bool _1766 = !_1740;
    float _1768 = _1762;
    if (!_1766)
    {
        float _1770 = _172 * _172;
        float _1772 = rsqrt(_1716);
        float _1774 = fma(_170, _170, _1770);
        float _1776 = fma(_174, _174, _1774);
        float _1778 = sqrt(_1776);
        float _1780 = _1694 * _1772;
        float _1782 = _1704 * _1772;
        bool _1784 = _1778 > 0.0;
        float _1786 = _1700 * _1772;
        bool _1788 = !_1784;
        _1758 = _1782;
        _1760 = _1786;
        if (!_1788)
        {
            float _1790 = rsqrt(_1776);
            float _1792 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1794 = _172 * _1790;
            float _1796 = _170 * _1790;
            float _1798 = _174 * _1790;
            float _1800 = _1780 * _1794;
            float _1802 = fma(_1786, _1796, _1800);
            float _1804 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1806 = fma(_1782, _1798, _1802);
            float _1808 = _1806 * _1804;
            float _1810 = fma(_170, _1808, _1688);
            float _1812 = fma(_172, _1808, _1686);
            float _1814 = fma(_174, _1808, _1690);
            _1748 = _1802;
            _1750 = _1812;
            _1752 = _1810;
            _1754 = _1814;
            _1756 = _1800;
        }
    }
    float _1816 = _1748;
    float _1818 = _1750;
    float _1820 = _1752;
    float _1822 = _1754;
    float _1824 = _1756;
    float _1826 = _1758;
    float _1828 = _1760;
    float _1830 = _1828;
    float _1832 = _1816;
    float _1834 = _1824;
    float _1836 = _1826;
    if (_1728)
    {
        _1830 = 1.0;
    }
    float _1838 = _1830;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1842 = _1764 * _1840;
    float _1844 = _1838;
    if (!_1728)
    {
        float _1846 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1848 = _1846 * 0.15915493667125701904296875;
        float _1850 = _1848 * 6.283185482025146484375;
        float _1852 = cos(_1850);
        float _1854 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1856 = _1854 * 0.15915493667125701904296875;
        float _1858 = _1848 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        float _1862 = 1.0 / _1852;
        float _1864 = _1856 * 6.283185482025146484375;
        float _1866 = cos(_1864);
        float _1868 = _1860 * _1862;
        float _1870 = _1856 * 6.283185482025146484375;
        float _1872 = sin(_1870);
        float _1874 = _1866 * _1868;
        float _1876 = 1.0 / _1874;
        float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1880 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1878;
        float _1882 = 1.0 / _1880;
        float _1884 = _1872 * _1876;
        float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1888 = fma(_1842, _1884, _1886);
        float _1890 = _1888 * _1882;
        float _1892 = precise::clamp(_1890, 0.0, 1.0);
        _1832 = _1856;
        _1834 = _1848;
        _1768 = _1892;
    }
    float _1894 = _1832;
    float _1896 = _1834;
    float _1898 = _1768;
    float _1900 = _1894;
    if (!_1728)
    {
        float _1902 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1904 = _1902 * 0.15915493667125701904296875;
        float _1906 = _1904 * 6.283185482025146484375;
        float _1908 = cos(_1906);
        float _1910 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1912 = _1910 * 0.15915493667125701904296875;
        float _1914 = _1904 * 6.283185482025146484375;
        float _1916 = sin(_1914);
        float _1918 = 1.0 / _1908;
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
        float _1944 = fma(_1842, _1940, _1942);
        float _1946 = _1944 * _1938;
        float _1948 = precise::clamp(_1946, 0.0, 1.0);
        float _1950 = -_1948;
        float _1952 = _1950 + 1.0;
        _1900 = _1918;
        _1844 = _1952;
    }
    float _1954 = _1900;
    float _1956 = _1844;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1960 = _1818 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1964 = _1820 + _1962;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1968 = _1822 + _1966;
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
    float _2000 = _1954;
    float _2002 = _1990;
    float _2004 = _1998;
    float _2006 = _1960;
    float _2008 = _1984;
    float _2010 = _1986;
    float _2012 = _1988;
    if (_1994)
    {
        float _2014 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2000 = _2014;
    }
    float _2016 = _2000;
    if (_1994)
    {
        float _2018 = rsqrt(_1990);
        _2002 = _2018;
    }
    float _2020 = _2002;
    if (_1994)
    {
        float _2022 = _1998 * _2016;
        _2004 = _2022;
    }
    float _2024 = _2004;
    if (_1994)
    {
        float _2026 = _2024 * 0.15915493667125701904296875;
        _1836 = _2026;
    }
    float _2028 = _1836;
    float _2030 = _1896;
    if (_1994)
    {
        float _2032 = _2028 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _2030 = _2034;
    }
    float _2036 = _2030;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = precise::max(0.0, _2038);
    float _2042 = _2016;
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
        _2006 = _2058;
    }
    float _2060 = _2006;
    float _2062 = _2060;
    float _2064 = _2036;
    if (_1994)
    {
        float _2066 = fma(_2036, _2060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2044 = _2066;
    }
    float _2068 = _2044;
    float _2070 = _2068;
    if (!_1994)
    {
        _2062 = _1982;
    }
    float _2072 = _2062;
    float _2074 = _2072;
    if (_1994)
    {
        float _2076 = _2050 + (-1.0);
        _2064 = _2076;
    }
    float _2078 = _2064;
    float _2080 = _2078;
    if (_1994)
    {
        float _2082 = _2020 * _2068;
        _1634 = _2082;
    }
    float _2084 = _1634;
    if (!_1994)
    {
        _2070 = _2056;
    }
    float _2086 = _2070;
    float _2088 = _2086;
    if (_1994)
    {
        float _2090 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2080 = _2090;
    }
    float _2092 = _2080;
    if (_1994)
    {
        float _2094 = _1982 * _2084;
        _2074 = _2094;
    }
    float _2096 = _2074;
    if (_1994)
    {
        float _2098 = _1984 * _2084;
        _2008 = _2098;
    }
    float _2100 = _2008;
    if (_1994)
    {
        float _2102 = fma(_2056, _2050, _2092);
        _2088 = _2102;
    }
    float _2104 = _2088;
    if (_1994)
    {
        float _2106 = _2096 * _2096;
        _2010 = _2106;
    }
    float _2108 = _2010;
    if (_1994)
    {
        float _2110 = _2100 * _2100;
        _2012 = _2110;
    }
    float _2112 = _2012;
    float _2114 = fma(_2104, _2104, _2108);
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2118 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2116);
    float _2120 = precise::clamp(_2118, 0.0, 1.0);
    float _2122 = _2114 + _2112;
    float _2124 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2126 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2128 = -_2120;
    float _2130 = _2128 + 1.0;
    float _2132 = rsqrt(_2122);
    float _2134 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2124);
    float _2136 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2140 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2134);
    float _2142 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2126);
    float _2144 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2146 = abs(_2130);
    float _2148 = log2(_2146);
    float _2150 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2136);
    float _2152 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2142);
    float _2154 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2144);
    float _2156 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2158 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2150);
    float _2160 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2162 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2154);
    float _2164 = _2132 * _2096;
    float _2166 = _2132 * _2104;
    float _2168 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2170 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2172 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2174 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2176 = _2132 * _2100;
    float _2178 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2170);
    float _2180 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2182 = -_2172;
    float _2184 = fma(_2166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2182);
    float _2186 = -_2174;
    float _2188 = fma(_2186, _2138, 1.0);
    float _2190 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2192 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2178);
    float _2194 = -_2176;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2184);
    float _2198 = exp2(_2180);
    float _2200 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2202 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2192);
    float _2204 = fma(_2196, -0.5, 0.5);
    float _2206 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2208 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2200);
    float _2210 = fma(_2196, 0.5, 0.5);
    float _2212 = log2(_2188);
    float _2214 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2206);
    float _2216 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2208);
    float _2218 = fma(_2210, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2220 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2214);
    float _2222 = fma(_2210, _2218, -0.212114393711090087890625);
    float _2224 = 1.0 / _2202;
    float _2226 = _2166 + 1.0;
    float _2228 = fma(_2210, _2222, 1.570728778839111328125);
    float _2230 = -_2166;
    float _2232 = fma(_2198, _2226, _2230);
    float _2234 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2216);
    float _2236 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2220);
    float _2238 = sqrt(_2204);
    float _2240 = _2212 * 0.693147182464599609375;
    float _2242 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2244 = _2234 * _2224;
    float _2246 = _2236 * _2224;
    float _2248 = fma(_2244, 0.5, 0.5);
    float _2250 = _2238 * 0.636619746685028076171875;
    float _2252 = fma(_2246, -0.5, 0.5);
    float _2254 = fma(_2232, 0.5, 0.5);
    float _2256 = -_2228;
    float _2258 = fma(_2250, _2256, 1.0);
    float3 _6542 = float3(_2248, _2252, _2242);
    float _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6542, float3(0.0), isnan(_6542)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6542, float3(0.0), isnan(_6542)), level(0.0)).x;
    float3 _6553 = float3(_2248, _2252, _2242);
    float4 _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6553, float3(0.0), isnan(_6553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6553, float3(0.0), isnan(_6553)), level(0.0)).xyzw;
    float _2265 = _2263.x;
    float _2267 = _2263.y;
    float _2269 = _2263.z;
    float _2271 = _2263.w;
    float2 _6570 = float2(_2258, _2254);
    float3 _2275 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6570, float2(0.0), isnan(_6570)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6570, float2(0.0), isnan(_6570)), level(0.0)).xyz;
    float _2277 = _2275.x;
    float _2279 = _2275.y;
    float _2281 = _2275.z;
    float _2283 = float(uint(_908));
    float _2285 = trunc(_1258);
    int _2287 = int(_2285);
    int _2289 = ~_908;
    int _2291 = _2289 + 1;
    float _2293 = _1266 * _152;
    int _2295 = abs(_1178);
    out.m_61.x = _654;
    out.m_61.y = _656;
    out.m_61.z = _658;
    out.m_61.w = _662;
    float _2297 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2299 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2301 = 1.0 / _2283;
    float _2303 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2299);
    float _2305 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2303);
    float _2307 = float(uint(_2287));
    float _2309 = trunc(_2293);
    int _2311 = int(_2309);
    float _2313 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2305);
    out.gl_Position.x = _2234;
    out.gl_Position.y = _2236;
    out.gl_Position.z = _2313;
    out.gl_Position.w = _2202;
    int _2315 = as_type<int>(_2301) + (-2);
    float _2317 = exp2(_2297);
    float _2319 = as_type<float>(_2315) * _2307;
    float _2321 = trunc(_2319);
    float _2323 = precise::max(_2321, 0.0);
    uint _2326 = uint(_2323);
    float _2328 = -_2317;
    float _2330 = _2328 + 1.0;
    int _2332 = ~_908;
    int _2334 = _2332 + 1;
    int _2336 = _2291 * int(_2326);
    int _2338 = _2336 + _2287;
    float _2340 = float(uint(_2338));
    float _2342 = as_type<float>(_2315) * _2340;
    float _2344 = trunc(_2342);
    float _2346 = precise::max(_2344, 0.0);
    uint _2348 = uint(_2346);
    bool _2350 = !_922;
    float _2352 = _2350 ? 7.345489978790283203125 : 1.0;
    float _2354 = _2352 * _904;
    int _2356 = _908 + (-1);
    float _2358 = floor(_2354);
    int _2360 = int(_2326) + int(_2348);
    float _2362 = float(_2287);
    int _2364 = _2334 * _2360;
    int _2366 = _2364 + _2287;
    bool _2368 = _2362 >= _1256;
    bool _2370 = isnan(_2362);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(_1256);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    bool _2380 = uint(_2366) >= uint(_908);
    float _2382 = -_2358;
    float _2384 = _2354 + _2382;
    float _2386 = trunc(_2378);
    int _2388 = int(_2386);
    int _2390 = ~_908;
    int _2392 = _2390 + 1;
    bool _2394 = !_2380;
    int _2396 = _2394 ? 0 : (-1);
    float _2398 = _2384 * _1256;
    bool _2400 = _908 == 0;
    int _2402 = ~_2360;
    int _2404 = _2402 + _2396;
    int _2406 = _2404 + 1;
    float _2408 = trunc(_2398);
    int _2410 = int(_2408);
    int _2412 = _908 * _2406;
    int _2414 = _2412 + _2287;
    int _2416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2418 = _2416 != 0;
    int _2420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2422 = _2420 != 0;
    int _2424 = ~_2388;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    bool _2430 = !_2400;
    int _2432 = _2430 ? _2414 : (-1);
    bool _2434 = !_2418;
    int _2436 = _2434 ? 0 : 1;
    int _2438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2440 = _2438 != 0;
    int _2442 = _2432 * _2428;
    int _2444 = abs(_2436);
    int _2446 = abs(_1190);
    int _2448 = _2388 * _2356;
    int _2450 = _2448 + _2442;
    int _2452 = abs(_1184);
    bool _2454 = !_2440;
    int _2456 = _2454 ? 0 : 1;
    int _2458 = _2450 * _2295;
    int _2460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2462 = _2460 != 0;
    int _2464 = _2410 * _2444;
    int _2466 = _2464 + _2287;
    int _2468 = abs(_2456);
    int _2470 = _2311 * _2452;
    int _2472 = _2470 + _2458;
    float _2474 = in.m_53.w;
    float _2476 = float(uint(_2466));
    int _2478 = _2466 * _2446;
    int _2480 = _2478 + _2472;
    int _2482 = ~_908;
    int _2484 = _2482 + 1;
    int _2486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2488 = _2486 != 0;
    int _2490 = _2410 * _2468;
    int _2492 = _2490 + _2480;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2500 = _2498 != 0;
    float _2502 = float(uint(_2492));
    float _2504 = 1.0 / _2496;
    float _2506 = as_type<float>(_2315) * _2502;
    float _2508 = trunc(_2506);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    bool _2514 = _2474 > 0.5;
    int _2516 = _2484 * int(_2512);
    int _2518 = _2516 + _2492;
    float _2520 = float(uint(_2518));
    float _2522 = as_type<float>(_2315) * _2520;
    float _2524 = in.m_63.y;
    float _2526 = trunc(_2522);
    float _2528 = precise::max(_2526, 0.0);
    uint _2530 = uint(_2528);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2532 = as_type<float>(_2315) * _2476;
    int _2534 = int(_2512) + int(_2530);
    float _2536 = trunc(_2532);
    float _2538 = precise::max(_2536, 0.0);
    uint _2540 = uint(_2538);
    float _2542 = -_2524;
    float _2544 = _2542 + 1.0;
    int _2546 = _2392 * _2534;
    int _2548 = _2546 + _2492;
    int _2550 = _2514 ? as_type<int>(_2544) : as_type<int>(_2524);
    bool _2552 = uint(_2548) >= uint(_908);
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2556 = _2554 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2558 = _910 > 0.5;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2562 = _902 + _2560;
    bool _2564 = !_2552;
    int _2566 = _2564 ? 0 : (-1);
    float _2568 = 1.0 / _2556;
    int _2570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2572 = _2570 != 0;
    int _2574 = ~_2534;
    int _2576 = _2574 + _2566;
    int _2578 = _2576 + 1;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2580;
    float _2584 = _2572 ? as_type<float>(_2550) : _2524;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2590 = _2524;
    bool _2592 = _2558;
    bool _2594 = _2572;
    int _2596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].w);
    if (_2422)
    {
        float _2598 = _2558 ? _2544 : _2524;
        _2590 = _2598;
    }
    float _2600 = _2590;
    int _2602 = _908 * _2578;
    int _2604 = _2602 + _2492;
    float _2606 = in.m_63.x;
    if (_2462)
    {
        bool _2608 = _926 > 0.5;
        _2592 = _2608;
    }
    bool _2610 = _2592;
    float _2612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2614 = ~_908;
    int _2616 = _2614 + 1;
    float _2618 = _2582 * _2504;
    bool _2620 = !_2400;
    int _2622 = _2620 ? _2604 : (-1);
    if (_2488)
    {
        bool _2624 = _904 > 0.5;
        _2594 = _2624;
    }
    bool _2626 = _2594;
    int _2628 = _2616 * int(_2540);
    int _2630 = _2628 + _2466;
    int _2632 = _2622 >> 31;
    float _2634 = _2588 * _2568;
    bool _2636 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2638 = isnan(_902);
    bool _2640 = _2636 || _2638;
    bool _2642 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2644 = _2640 || _2642;
    float _2646 = float(_2644);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2650 = _902 + _2648;
    float _2652 = float(uint(_2630));
    float _2654 = fma(_2634, _2562, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2656 = _2632 & 3;
    float _2658 = -_2646;
    float _2660 = _2658 + 1.0;
    bool _2662 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2664 = isnan(_902);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = as_type<float>(_2315) * _2652;
    int _2676 = _2622 + _2656;
    float _2678 = fma(_2618, _2650, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2680 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2682 = isnan(_902);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2688 = _2684 || _2686;
    float _2690 = float(_2688);
    float _2692 = _2672 * _2660;
    float _2694 = -_2672;
    float _2696 = _2694 + 1.0;
    int _2698 = _2676 >> 2;
    float _2700 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2702 = _2612;
    float _2704 = _2696;
    int _2706 = _2698;
    if (!_2488)
    {
        _2702 = _2606;
    }
    float _2708 = _2702;
    float _2710 = _2690 * _2696;
    int _2712 = _2698 << 4;
    int _2714 = _2712 + 368;
    float _2716 = fma(_2584, _2700, -0.5);
    float _2718 = _2708;
    if (!_2488)
    {
        _2704 = _2708;
    }
    float _2720 = _2704;
    float _2722 = _2678 * _2710;
    float _2724 = _2720;
    if (_2488)
    {
        _2718 = _2606;
    }
    float _2726 = _2718;
    float _2728 = -_2690;
    float _2730 = _2728 + 1.0;
    uint _2732 = uint(int(uint(_2714) >> uint(2)));
    uint _2734 = uint(int(uint(int(_2732)) >> uint(2)));
    int _2736 = int(_2732) & 3;
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[int(_2734)][_2736];
    int _2740 = int(_2732) + 1;
    uint _2742 = uint(int(uint(_2740) >> uint(2)));
    int _2744 = _2740 & 3;
    float _2746 = (*spvDescriptorSet0.vp_c9)._m0[int(_2742)][_2744];
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2750 = _2726;
    if (_2488)
    {
        float _2752 = -_2726;
        float _2754 = _2752 + 1.0;
        _2706 = as_type<int>(_2754);
    }
    int _2756 = _2706;
    if (_2462)
    {
        float _2758 = -_2726;
        float _2760 = _2758 + 1.0;
        _2596 = as_type<int>(_2760);
    }
    int _2762 = _2596;
    float _2764 = -_1262;
    float _2766 = fma(_1250, _2716, _2764);
    float _2768 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2600, -0.5);
    float _2770 = fma(_2730, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2722);
    if (_2488)
    {
        float _2772 = _2626 ? as_type<float>(_2756) : _2726;
        _2724 = _2772;
    }
    float _2774 = _2724;
    int _2776 = _2714 + 8;
    uint _2778 = uint(int(uint(_2776) >> uint(2)));
    uint _2780 = uint(int(uint(int(_2778)) >> uint(2)));
    int _2782 = int(_2778) & 3;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[int(_2780)][_2782];
    int _2786 = int(_2778) + 1;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    int _2790 = _2786 & 3;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[int(_2788)][_2790];
    if (_2462)
    {
        float _2794 = _2610 ? as_type<float>(_2762) : _2726;
        _2750 = _2794;
    }
    float _2796 = _2750;
    float _2798 = fma(_2654, _2692, _2770);
    int _2800 = _2622 & 3;
    bool _2802 = _2800 != 0;
    float _2804 = trunc(_2674);
    float _2806 = precise::max(_2804, 0.0);
    uint _2808 = uint(_2806);
    float _2810 = -_1084;
    float _2812 = fma(_1254, _2768, _2810);
    bool _2814 = uint(_2800) > 1u;
    float _2816 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2818 = _2622 & 3;
    bool _2820 = _2818 != 0;
    float _2822 = fma(_2774, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2824 = uint(_2800) >= 2u;
    float _2826 = fma(_2816, _2796, -0.5);
    int _2828 = _2820 ? 0 : 1;
    float _2830 = fma(_1252, _2822, _1036);
    bool _2832 = _2800 != 3;
    float _2834 = fma(_1270, _2826, _1246);
    int _2836 = ~_2828;
    int _2838 = _2836 + 1;
    int _2840 = _2838 + 1;
    int _2842 = int(_2540) + int(_2808);
    float _2844 = _2834 + 0.5;
    int _2846 = _2840;
    if (!_2814)
    {
        int _2848 = ~_2828;
        int _2850 = _2848 + 1;
        _2846 = _2850;
    }
    int _2852 = _2846;
    int _2854 = ~_908;
    int _2856 = _2854 + 1;
    int _2858 = abs(_2852);
    bool _2860 = !_2802;
    int _2862 = _2860 ? 0 : 1;
    int _2864 = _2856 * _2842;
    int _2866 = _2864 + _2466;
    int _2868 = _2824 ? 0 : 1;
    bool _2870 = _2800 != 3;
    int _2872 = ~_2868;
    int _2874 = _2872 + 1;
    int _2876 = _2874 + 1;
    bool _2878 = !_2870;
    int _2880 = _2878 ? 0 : (-1);
    int _2882 = abs(_2862);
    int _2884 = _2876;
    if (_2832)
    {
        int _2886 = ~_2868;
        int _2888 = _2886 + 1;
        _2884 = _2888;
    }
    int _2890 = _2884;
    int _2892 = ~_2858;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    bool _2898 = uint(_2866) >= uint(_908);
    int _2900 = abs(_2880);
    int _2902 = _2896 * as_type<int>(_2746);
    int _2904 = abs(_2890);
    int _2906 = ~_2882;
    int _2908 = _2906 + 1;
    int _2910 = _2908 + 1;
    bool _2912 = !_2500;
    int _2914 = _2912 ? 0 : 1;
    int _2916 = _2910 * as_type<int>(_2738);
    int _2918 = _2916 + _2902;
    int _2920 = ~_2904;
    int _2922 = _2920 + 1;
    int _2924 = _2922 + 1;
    bool _2926 = !_2898;
    int _2928 = _2926 ? 0 : (-1);
    int _2930 = abs(_2914);
    int _2932 = _2924 * as_type<int>(_2784);
    int _2934 = _2932 + _2918;
    int _2936 = ~_2900;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    float _2942 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2944 = ~_2842;
    int _2946 = _2944 + _2928;
    int _2948 = _2946 + 1;
    int _2950 = ~_2930;
    int _2952 = _2950 + 1;
    int _2954 = _2952 + 1;
    int _2956 = _2940 * as_type<int>(_2792);
    int _2958 = _2956 + _2934;
    float _2960 = fma(_2646, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2798);
    int _2962 = _908 * _2948;
    int _2964 = _2962 + _2466;
    float _2966 = _2830 + 0.5;
    int _2968 = _2958 * _2954;
    float _2970 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2972 = _2812 + 0.5;
    float _2974 = _2766 + 0.5;
    float _2976 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2978 = !_2400;
    int _2980 = _2978 ? _2964 : (-1);
    float _2982 = _1898 * _1956;
    float _2984 = _2970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _2966;
    out.m_67.y = _2972;
    out.m_67.z = _2844;
    out.m_67.w = _2974;
    float _2986 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2988 = _2942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2990 = _2960 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2992 = _2980 * _2930;
    int _2994 = _2992 + _2968;
    float _2996 = _2982 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2998 = _1898 > 0.0;
    bool _3000 = isnan(_1898);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan(0.0);
    bool _3006 = _3002 || _3004;
    out.m_69.x = _2984;
    out.m_69.y = _2986;
    out.m_69.z = _2988;
    out.m_69.w = _2990;
    float _3008 = _2996 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3010 = _1956 <= 0.0;
    bool _3012 = !_3006;
    bool _3014 = _3010 || _3012;
    float _3016 = float(_2994);
    float _3018 = _2313 + _2202;
    float _3020 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3008;
    float _3022 = _3018 * 0.5;
    float _3024 = _3020 * _2260;
    out.m_71.x = _3016;
    float _3026 = _2271 * _3024;
    float _3028 = _2281 * _3024;
    float _3030 = -_3020;
    float _3032 = _3030 + 1.0;
    out.m_73.z = _3022;
    out.m_73.w = _2202;
    float _3034 = fma(_2277, _3026, _2265);
    float _3036 = fma(_2279, _3026, _2267);
    float _3038 = _2271 * _3032;
    float _3040 = fma(_2271, _3028, _2269);
    out.m_75.x = _3034;
    out.m_75.y = _3036;
    out.m_75.z = _3040;
    out.m_75.w = _3038;
    if (!_3014)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3042 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3042;
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
    bool _900 = false;
    bool _684 = false;
    bool _586 = false;
    bool _358 = false;
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
        float _3110 = as_type<float>(_118);
        out.gl_Position.z = _3110;
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
        float _3165 = as_type<float>(_144);
        out.gl_Position.z = _3165;
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
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = _198 + _200;
    bool _204 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _206 = isnan(_198);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _212 = _208 || _210;
    float _214 = float(_212);
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _198 + _216;
    bool _220 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_198);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _242 = isnan(_198);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_214;
    float _254 = _252 + 1.0;
    float _256 = 1.0 / _238;
    float _258 = _250 * _254;
    float _260 = -_250;
    float _262 = _260 + 1.0;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _270 = 1.0 / _234;
    float _272 = _230 * _262;
    float _274 = -_230;
    float _276 = _274 + 1.0;
    float _278 = _218 * _256;
    float _280 = _202 * _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _286;
    float _290 = fma(_266, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _292 = fma(_284, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = fma(_288, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _296 = _290 * _272;
    float _298 = _292 * _272;
    float _300 = _294 * _272;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _314 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _316 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _318 = fma(_304, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _320 = fma(_308, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _322 = fma(_312, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _324 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _326 = fma(_318, _258, _314);
    float _328 = fma(_320, _258, _316);
    float _330 = fma(_322, _258, _324);
    float _332 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[145].x, _326);
    float _334 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[145].y, _328);
    float _336 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[145].z, _330);
    bool _338 = !_268;
    float _356;
    if (!_338)
    {
        float _340 = in.m_53.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        _356 = _156;
    }
    _358 = false;
    float _360 = _356;
    float _362 = in.m_55.x;
    float _364 = in.m_55.y;
    float _366 = in.m_55.z;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _370 = _360 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _374 = _360 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _388 = 1.0 / _378;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _392 = 1.0 / _386;
    float _394 = _334 * _364;
    bool _396 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _398 = isnan(_360);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = _336 * _366;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _412 = _360 + _410;
    float _414 = 1.0 / _382;
    float _416 = _370 * _388;
    bool _418 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _420 = isnan(_360);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -_406;
    float _432 = _430 + 1.0;
    float _434 = _332 * _362;
    float _436 = _428 * _432;
    float _438 = _374 * _392;
    bool _440 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _442 = isnan(_360);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _452;
    bool _456 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _458 = isnan(_360);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _472 = -_428;
    float _474 = _472 + 1.0;
    float _476 = -_450;
    float _478 = _476 + 1.0;
    float _480 = _412 * _414;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _486;
    float _490 = _466 * _478;
    float _492 = fma(_454, _480, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _494 = fma(_484, _480, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _496 = fma(_488, _480, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _498 = _450 * _474;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _504 = _494 * _490;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _510 = _496 * _490;
    float _512 = -_466;
    float _514 = _512 + 1.0;
    float _516 = _492 * _490;
    float _518 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[107].x, _510);
    float _520 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[107].y, _504);
    float _522 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[107].z, _516);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _524;
    float _528 = fma(_470, _438, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _530 = fma(_502, _438, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _532 = fma(_508, _438, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _538;
    float _542 = fma(_528, _498, _518);
    float _544 = fma(_526, _416, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _546 = fma(_536, _416, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _548 = fma(_540, _416, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _550 = fma(_530, _498, _520);
    float _552 = fma(_532, _498, _522);
    float _554 = fma(_544, _436, _542);
    float _556 = fma(_546, _436, _550);
    float _558 = fma(_548, _436, _552);
    float _560 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[110].x, _554);
    float _562 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[110].y, _556);
    float _564 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[110].z, _558);
    bool _566 = !_390;
    float _584;
    if (!_566)
    {
        float _568 = in.m_53.x;
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        _584 = _156;
    }
    _586 = false;
    float _588 = _584;
    bool _590 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_588);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_588);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _588 + _622;
    float _626 = -_600;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _632 = 1.0 / _604;
    float _634 = _616 * _628;
    float _636 = -_616;
    float _638 = _636 + 1.0;
    float _640 = _620 * _632;
    float _642 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = fma(_640, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = _644 * _634;
    float _650 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[116].x, _652);
    float _662 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _664 = !_630;
    float _682;
    if (!_664)
    {
        float _666 = in.m_53.x;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _670 = _666 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _682 = _680;
        _684 = true;
    }
    else
    {
        _682 = _156;
    }
    _684 = false;
    float _686 = _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _694 = _686 + _692;
    bool _696 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _698 = isnan(_686);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _714 = _686 + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _724 = 1.0 / _710;
    bool _726 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _728 = 1.0 / _722;
    float _730 = 1.0 / _718;
    float _732 = _690 * _724;
    bool _734 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _736 = isnan(_686);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_706;
    float _748 = _746 + 1.0;
    float _750 = _744 * _748;
    float _752 = _694 * _728;
    bool _754 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _756 = isnan(_686);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _766;
    bool _770 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _772 = isnan(_686);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _786 = -_744;
    float _788 = _786 + 1.0;
    float _790 = -_764;
    float _792 = _790 + 1.0;
    float _794 = _714 * _730;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _800;
    float _804 = _780 * _792;
    float _806 = fma(_768, _794, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _808 = fma(_798, _794, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _810 = fma(_802, _794, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _812 = _764 * _788;
    float _814 = _806 * _804;
    float _816 = _808 * _804;
    float _818 = _810 * _804;
    float _820 = -_780;
    float _822 = _820 + 1.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _832 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].x, _818);
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].y, _816);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _836;
    float _840 = fma(_784, _752, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _842 = fma(_826, _752, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _844 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].z, _814);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _846;
    float _850 = fma(_830, _752, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _852;
    float _856 = fma(_840, _812, _832);
    float _858 = fma(_838, _732, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _860 = fma(_848, _732, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _862 = fma(_842, _812, _834);
    float _864 = fma(_854, _732, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _866 = fma(_850, _812, _844);
    float _868 = fma(_858, _750, _856);
    float _870 = fma(_860, _750, _862);
    float _872 = fma(_864, _750, _866);
    float _874 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[126].x, _868);
    float _876 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[126].y, _870);
    float _878 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[126].z, _872);
    bool _880 = !_726;
    float _898;
    if (!_880)
    {
        float _882 = in.m_53.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        _898 = _156;
    }
    _900 = false;
    float _902 = _898;
    float _904 = in.m_53.x;
    float _906 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _908 = int(_906);
    float _910 = in.m_53.y;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _914 = in.m_42.x;
    float _916 = in.m_42.y;
    float _918 = in.m_42.z;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _922 = _920 != 0;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _926 = in.m_53.z;
    float _928 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _930 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _928);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _936 = _904 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _938 = _904 * 2.0;
    float _940 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _942 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _944 = -_912;
    float _946 = fma(_936, 2.0, _944);
    float _948 = floor(_938);
    float _950 = _910 * 2.0;
    float _952 = fma(_942, -2.0, _924);
    float _954 = _916 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _956 = _916 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = _916 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _940);
    float _962 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _964 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _966 = _926 * 2.0;
    float _968 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _970 = _904 + _910;
    float _972 = _904 + _926;
    float _974 = floor(_950);
    float _976 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[4].z, _962);
    float _978 = _970 + (-1.0);
    float _980 = _910 + _926;
    float _982 = _972 + (-1.0);
    bool _984 = _948 > 0.0;
    float _986 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[5].z, _964);
    float _988 = _980 + (-1.0);
    float _990 = floor(_966);
    float _992 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[6].z, _968);
    bool _994 = _948 >= 0.0;
    bool _996 = isnan(_948);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    float _1004 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _960);
    float _1006 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1010 = _988;
    if (!_922)
    {
        _1010 = _926;
    }
    float _1012 = _1010;
    float _1014 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1016 = int(_1014);
    float _1018 = _1012;
    if (_922)
    {
        _1018 = _910;
    }
    float _1020 = _1018;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1024 = _974 >= 0.0;
    bool _1026 = isnan(_974);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    float _1034 = -_100;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[76].x, _946);
    bool _1038 = _974 > 0.0;
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1022);
    bool _1042 = _990 > 0.0;
    float _1044 = _992 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1046 = _990 >= 0.0;
    bool _1048 = isnan(_990);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan(0.0);
    bool _1054 = _1050 || _1052;
    float _1056 = _1022;
    float _1058 = _1020;
    if (!_922)
    {
        _1056 = _910;
    }
    float _1060 = _1056;
    float _1062 = _1060;
    if (_922)
    {
        _1062 = _904;
    }
    float _1064 = _1062;
    float _1066 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _930);
    if (!_922)
    {
        _1058 = _926;
    }
    float _1068 = _1058;
    float _1070 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1072 = log2(_1070);
    float _1074 = _1068;
    if (_922)
    {
        _1074 = _910;
    }
    float _1076 = _1074;
    float _1078 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _932);
    float _1080 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1082 = _1032 ? 0 : 1;
    float _1084 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _952);
    float _1086 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1088 = -_934;
    float _1090 = fma(_1080, 2.0, _1088);
    int _1092 = _1002 ? 0 : 1;
    float _1094 = rsqrt(_1066);
    int _1096 = _1054 ? 0 : 1;
    int _1098 = ~_1092;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = ~_1096;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    int _1110 = _1102;
    int _1112 = _1108;
    if (!_984)
    {
        int _1114 = ~_1092;
        int _1116 = _1114 + 1;
        _1110 = _1116;
    }
    int _1118 = _1110;
    float _1120 = _1072 * _100;
    if (!_1042)
    {
        int _1122 = ~_1096;
        int _1124 = _1122 + 1;
        _1112 = _1124;
    }
    int _1126 = _1112;
    bool _1128 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1130 = isnan(0.0);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1136 = _1132 || _1134;
    float _1138 = exp2(_1120);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1144 = _1142 != 0;
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1152 = _1150 != 0;
    float _1154 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1140);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1158 = 1.0 + _1156;
    bool _1160 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1162 = isnan(1.0);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1168 = _1164 || _1166;
    float _1170 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1172 = float(_1016);
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1176 = !_1148;
    int _1178 = _1176 ? 0 : 1;
    float _1180 = 1.0 / _1158;
    bool _1182 = !_1144;
    int _1184 = _1182 ? 0 : 1;
    float _1186 = fma(_1086, -2.0, _1174);
    bool _1188 = !_1152;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = -_1138;
    float _1194 = _1192 + 1.0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1206 = _1204 != 0;
    float _1208 = 1.0 / _1172;
    int _1210 = ~_1082;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    if (!_1038)
    {
        int _1218 = ~_1082;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1226 = !_1198;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = in.m_57.x;
    float _1232 = in.m_57.y;
    float _1234 = in.m_57.z;
    bool _1236 = !_1202;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1224);
    int _1242 = abs(_1228);
    float _1244 = -_100;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1090);
    int _1248 = abs(_1238);
    float _1250 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1040);
    float _1252 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1240);
    float _1254 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1154);
    float _1256 = float(_908);
    float _1258 = _1208 * _100;
    float _1260 = float(_1118);
    float _1262 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1186);
    float _1264 = _1136 ? _1194 : 0.0;
    float _1266 = _1256 * _100;
    float _1268 = float(_1242);
    float _1270 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1078);
    float _1272 = float(_1126);
    if (_1168)
    {
        float _1274 = _1264 * _1180;
        _110 = _1274;
    }
    float _1276 = _110;
    bool _1278 = !_1206;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = float(_1248);
    float _1284 = _1268 * _1272;
    int _1286 = abs(_1280);
    float _1288 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1290 = _1282 * _1260;
    float _1292 = _1284 * (-2.0);
    float _1294 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1296 = _1288 * _1288;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1298;
    float _1302 = _904 + (-0.5);
    float _1304 = fma(_1292, _1230, _1230);
    float _1306 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1308 = fma(_1294, _1294, _1296);
    float _1310 = float(_1222);
    float _1312 = fma(_1170, _1292, _1170);
    float _1314 = float(_1286);
    float _1316 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1304);
    float _1318 = fma(_1306, _1306, _1308);
    float _1320 = _1290 * (-2.0);
    float _1322 = 1.0 / _1300;
    float _1324 = _1314 * _1310;
    float _1326 = fma(_1312, _1276, _1316);
    float _1328 = _986 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1330 = fma(_1008, _1320, _1008);
    float _1332 = fma(_1320, _1232, _1232);
    float _1334 = _910 + (-0.5);
    float _1336 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1340 = in.m_59.x;
    float _1342 = in.m_59.y;
    float _1344 = in.m_59.z;
    float _1346 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1332);
    float _1348 = _1324 * (-2.0);
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1338);
    float _1352 = rsqrt(_1318);
    float _1354 = fma(_1330, _1276, _1346);
    float _1356 = fma(_1006, _1348, _1006);
    float _1358 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1350);
    float _1360 = fma(_1348, _1234, _1234);
    float _1362 = _1354 * 0.15915493667125701904296875;
    float _1364 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1368 = _1326 * 0.15915493667125701904296875;
    float _1370 = _926 + (-0.5);
    float _1372 = _1362 * 6.283185482025146484375;
    float _1374 = sin(_1372);
    bool _1376 = _1366 >= _1364;
    bool _1378 = isnan(_1366);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(_1364);
    bool _1384 = _1380 || _1382;
    float _1386 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1360);
    float _1388 = -_1366;
    float _1390 = _1364 + _1388;
    float _1392 = _1294 * _1352;
    float _1394 = fma(_1356, _1276, _1386);
    float _1396 = _1368 * 6.283185482025146484375;
    float _1398 = sin(_1396);
    float _1400 = abs(_1390);
    float _1402 = precise::max(_1400, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1342);
    float _1406 = _1394 * 0.15915493667125701904296875;
    float _1408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1340);
    float _1410 = precise::min(_1402, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1412 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1414 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1416 = _1368 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1288 * _1352;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1424 = _1410 + _1422;
    float _1426 = _1412 * _1404;
    float _1428 = _1306 * _1352;
    float _1430 = _1424 * _1322;
    float _1432 = _1406 * 6.283185482025146484375;
    float _1434 = cos(_1432);
    float _1436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1344);
    float _1438 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1440 = !_1384;
    float _1442 = _1440 ? 1.0 : (-1.0);
    float _1444 = _1414 * _1436;
    float _1446 = _1438 * _1408;
    float _1448 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1450 = _1362 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    float _1454 = _1442 * _1430;
    float _1456 = _1418 * _1374;
    float _1458 = _1448 * _1454;
    float _1460 = _1398 * _1374;
    float _1462 = _1406 * 6.283185482025146484375;
    float _1464 = sin(_1462);
    float _1466 = _1374 * _1434;
    float _1468 = _1458 * 0.15915493667125701904296875;
    float _1470 = _1434 * _1426;
    float _1472 = _1418 * _1452;
    float _1474 = _1398 * _1452;
    float _1476 = _1468 * 6.283185482025146484375;
    float _1478 = cos(_1476);
    float _1480 = _1418 * _1470;
    float _1482 = _1452 * _1434;
    float _1484 = _1398 * _1470;
    float _1486 = fma(_1464, _1472, _1460);
    float _1488 = -_1456;
    float _1490 = fma(_1464, _1474, _1488);
    float _1492 = -_1474;
    float _1494 = fma(_1464, _1456, _1492);
    float _1496 = -_1426;
    float _1498 = _1464 * _1496;
    float _1500 = fma(_1486, _1446, _1480);
    float _1502 = _1468 * 6.283185482025146484375;
    float _1504 = sin(_1502);
    float _1506 = fma(_1464, _1460, _1472);
    float _1508 = fma(_1482, _1446, _1498);
    float _1510 = fma(_1494, _1444, _1500);
    float _1512 = fma(_1490, _1446, _1484);
    float _1514 = -_1478;
    float _1516 = _1514 + 1.0;
    float _1518 = fma(_1466, _1444, _1508);
    float _1520 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1522 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1524 = fma(_1506, _1444, _1512);
    float _1526 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1520);
    float _1530 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1522);
    float _1532 = _1420 * _1516;
    float _1534 = _1428 * _1428;
    float _1536 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1528);
    float _1538 = _1392 * _1504;
    float _1540 = _1420 * _1504;
    float _1542 = _1428 * _1504;
    float _1544 = _1392 * _1516;
    float _1546 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1526);
    float _1548 = fma(_1428, _1532, _1538);
    float _1550 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1530);
    float _1552 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1554 = fma(_1516, _1534, _1478);
    float _1556 = -_1542;
    float _1558 = fma(_1420, _1544, _1556);
    float _1560 = -_1540;
    float _1562 = fma(_1428, _1544, _1560);
    float _1564 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1566 = _1552 * _1548;
    float _1568 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1546);
    float _1570 = fma(_1392, _1544, _1478);
    float _1572 = _1552 * _1558;
    float _1574 = fma(_1564, _1562, _1566);
    float _1576 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1578 = fma(_1420, _1532, _1478);
    float _1580 = fma(_1564, _1570, _1572);
    float _1582 = fma(_1428, _1544, _1540);
    float _1584 = fma(_1576, _1554, _1574);
    float _1586 = fma(_1420, _1544, _1542);
    float _1588 = _1552 * _1578;
    float _1590 = fma(_1576, _1582, _1580);
    float _1592 = _1044 + _1584;
    float _1594 = -_1538;
    float _1596 = fma(_1428, _1532, _1594);
    float _1598 = fma(_1564, _1586, _1588);
    float _1600 = _1336 + _1590;
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1604 = _1592 + _1602;
    float _1606 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1608 = fma(_1576, _1596, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1612 = _1600 + _1610;
    float _1614 = _1604 * _1604;
    float _1616 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1606);
    float _1618 = _1328 + _1608;
    float _1620 = fma(_1612, _1612, _1614);
    float _1622 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1616);
    float _1624 = sqrt(_1620);
    bool _1626 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1628 = _1616;
    float _1630 = _1608;
    float _1632 = _1532;
    float _1634 = _1624;
    if (!_1626)
    {
        _1628 = _1600;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    if (!_1626)
    {
        _1630 = _1592;
    }
    float _1640 = _1630;
    float _1642 = _1640;
    if (!_1626)
    {
        _1632 = _1618;
    }
    float _1644 = _1632;
    bool _1646 = !_1626;
    float _1648 = _1644;
    if (!_1646)
    {
        float _1650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1654 = _1624 + _1652;
        float _1656 = rsqrt(_1620);
        float _1658 = _1654 * _1650;
        float _1660 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1662 = _1658 * 0.15915493667125701904296875;
        float _1664 = _1662 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        float _1672 = _1666 + (-1.0);
        float _1674 = fma(_1670, _1660, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1676 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1678 = _1656 * _1674;
        float _1680 = fma(_1618, _1666, _1676);
        float _1682 = fma(_1612, _1678, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1684 = fma(_1604, _1678, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1648 = _1680;
        _1638 = _1682;
        _1642 = _1684;
    }
    float _1686 = _1648;
    float _1688 = _1638;
    float _1690 = _1642;
    float _1692 = -_1328;
    float _1694 = _1692 + _1686;
    float _1696 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1698 = -_1336;
    float _1700 = _1698 + _1688;
    float _1702 = -_1044;
    float _1704 = _1702 + _1690;
    float _1706 = _1694 * _1694;
    float _1708 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1710 = 1.0 / _1696;
    float _1712 = fma(_1700, _1700, _1706);
    float _1714 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1708);
    float _1716 = fma(_1704, _1704, _1712);
    float _1718 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1714);
    bool _1720 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan(0.5);
    bool _1728 = _1724 || _1726;
    float _1730 = sqrt(_1716);
    float _1732 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1734 = _1732 + _1696;
    float _1736 = _1734 * _1710;
    float _1738 = _1736 * 0.5;
    bool _1740 = _1730 > 0.0;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1744 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1742);
    float _1746 = _1738;
    float _1748 = _1700;
    float _1750 = _1686;
    float _1752 = _1688;
    float _1754 = _1690;
    float _1756 = _1704;
    float _1758 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1760 = _1696;
    if (_1728)
    {
        _1746 = 1.0;
    }
    float _1762 = _1746;
    float _1764 = 1.0 / _1744;
    bool _1766 = !_1740;
    float _1768 = _1762;
    if (!_1766)
    {
        float _1770 = _172 * _172;
        float _1772 = rsqrt(_1716);
        float _1774 = fma(_170, _170, _1770);
        float _1776 = fma(_174, _174, _1774);
        float _1778 = sqrt(_1776);
        float _1780 = _1694 * _1772;
        float _1782 = _1704 * _1772;
        bool _1784 = _1778 > 0.0;
        float _1786 = _1700 * _1772;
        bool _1788 = !_1784;
        _1758 = _1782;
        _1760 = _1786;
        if (!_1788)
        {
            float _1790 = rsqrt(_1776);
            float _1792 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1794 = _172 * _1790;
            float _1796 = _170 * _1790;
            float _1798 = _174 * _1790;
            float _1800 = _1780 * _1794;
            float _1802 = fma(_1786, _1796, _1800);
            float _1804 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1806 = fma(_1782, _1798, _1802);
            float _1808 = _1806 * _1804;
            float _1810 = fma(_170, _1808, _1688);
            float _1812 = fma(_172, _1808, _1686);
            float _1814 = fma(_174, _1808, _1690);
            _1748 = _1802;
            _1750 = _1812;
            _1752 = _1810;
            _1754 = _1814;
            _1756 = _1800;
        }
    }
    float _1816 = _1748;
    float _1818 = _1750;
    float _1820 = _1752;
    float _1822 = _1754;
    float _1824 = _1756;
    float _1826 = _1758;
    float _1828 = _1760;
    float _1830 = _1828;
    float _1832 = _1816;
    float _1834 = _1824;
    float _1836 = _1826;
    if (_1728)
    {
        _1830 = 1.0;
    }
    float _1838 = _1830;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1842 = _1764 * _1840;
    float _1844 = _1838;
    if (!_1728)
    {
        float _1846 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1848 = _1846 * 0.15915493667125701904296875;
        float _1850 = _1848 * 6.283185482025146484375;
        float _1852 = cos(_1850);
        float _1854 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1856 = _1854 * 0.15915493667125701904296875;
        float _1858 = _1848 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        float _1862 = 1.0 / _1852;
        float _1864 = _1856 * 6.283185482025146484375;
        float _1866 = cos(_1864);
        float _1868 = _1860 * _1862;
        float _1870 = _1856 * 6.283185482025146484375;
        float _1872 = sin(_1870);
        float _1874 = _1866 * _1868;
        float _1876 = 1.0 / _1874;
        float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1880 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1878;
        float _1882 = 1.0 / _1880;
        float _1884 = _1872 * _1876;
        float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1888 = fma(_1842, _1884, _1886);
        float _1890 = _1888 * _1882;
        float _1892 = precise::clamp(_1890, 0.0, 1.0);
        _1832 = _1856;
        _1834 = _1848;
        _1768 = _1892;
    }
    float _1894 = _1832;
    float _1896 = _1834;
    float _1898 = _1768;
    float _1900 = _1894;
    if (!_1728)
    {
        float _1902 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1904 = _1902 * 0.15915493667125701904296875;
        float _1906 = _1904 * 6.283185482025146484375;
        float _1908 = cos(_1906);
        float _1910 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1912 = _1910 * 0.15915493667125701904296875;
        float _1914 = _1904 * 6.283185482025146484375;
        float _1916 = sin(_1914);
        float _1918 = 1.0 / _1908;
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
        float _1944 = fma(_1842, _1940, _1942);
        float _1946 = _1944 * _1938;
        float _1948 = precise::clamp(_1946, 0.0, 1.0);
        float _1950 = -_1948;
        float _1952 = _1950 + 1.0;
        _1900 = _1918;
        _1844 = _1952;
    }
    float _1954 = _1900;
    float _1956 = _1844;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1960 = _1818 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1964 = _1820 + _1962;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1968 = _1822 + _1966;
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
    float _2000 = _1954;
    float _2002 = _1990;
    float _2004 = _1998;
    float _2006 = _1960;
    float _2008 = _1984;
    float _2010 = _1986;
    float _2012 = _1988;
    if (_1994)
    {
        float _2014 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2000 = _2014;
    }
    float _2016 = _2000;
    if (_1994)
    {
        float _2018 = rsqrt(_1990);
        _2002 = _2018;
    }
    float _2020 = _2002;
    if (_1994)
    {
        float _2022 = _1998 * _2016;
        _2004 = _2022;
    }
    float _2024 = _2004;
    if (_1994)
    {
        float _2026 = _2024 * 0.15915493667125701904296875;
        _1836 = _2026;
    }
    float _2028 = _1836;
    float _2030 = _1896;
    if (_1994)
    {
        float _2032 = _2028 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _2030 = _2034;
    }
    float _2036 = _2030;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = precise::max(0.0, _2038);
    float _2042 = _2016;
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
        _2006 = _2058;
    }
    float _2060 = _2006;
    float _2062 = _2060;
    float _2064 = _2036;
    if (_1994)
    {
        float _2066 = fma(_2036, _2060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2044 = _2066;
    }
    float _2068 = _2044;
    float _2070 = _2068;
    if (!_1994)
    {
        _2062 = _1982;
    }
    float _2072 = _2062;
    float _2074 = _2072;
    if (_1994)
    {
        float _2076 = _2050 + (-1.0);
        _2064 = _2076;
    }
    float _2078 = _2064;
    float _2080 = _2078;
    if (_1994)
    {
        float _2082 = _2020 * _2068;
        _1634 = _2082;
    }
    float _2084 = _1634;
    if (!_1994)
    {
        _2070 = _2056;
    }
    float _2086 = _2070;
    float _2088 = _2086;
    if (_1994)
    {
        float _2090 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2080 = _2090;
    }
    float _2092 = _2080;
    if (_1994)
    {
        float _2094 = _1982 * _2084;
        _2074 = _2094;
    }
    float _2096 = _2074;
    if (_1994)
    {
        float _2098 = _1984 * _2084;
        _2008 = _2098;
    }
    float _2100 = _2008;
    if (_1994)
    {
        float _2102 = fma(_2056, _2050, _2092);
        _2088 = _2102;
    }
    float _2104 = _2088;
    if (_1994)
    {
        float _2106 = _2096 * _2096;
        _2010 = _2106;
    }
    float _2108 = _2010;
    if (_1994)
    {
        float _2110 = _2100 * _2100;
        _2012 = _2110;
    }
    float _2112 = _2012;
    float _2114 = fma(_2104, _2104, _2108);
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2118 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2116);
    float _2120 = precise::clamp(_2118, 0.0, 1.0);
    float _2122 = _2114 + _2112;
    float _2124 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2126 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2128 = -_2120;
    float _2130 = _2128 + 1.0;
    float _2132 = rsqrt(_2122);
    float _2134 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2124);
    float _2136 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2140 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2134);
    float _2142 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2126);
    float _2144 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2146 = abs(_2130);
    float _2148 = log2(_2146);
    float _2150 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2136);
    float _2152 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2142);
    float _2154 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2144);
    float _2156 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2158 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2150);
    float _2160 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2162 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2154);
    float _2164 = _2132 * _2096;
    float _2166 = _2132 * _2104;
    float _2168 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2170 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2172 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2174 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2176 = _2132 * _2100;
    float _2178 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2170);
    float _2180 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2182 = -_2172;
    float _2184 = fma(_2166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2182);
    float _2186 = -_2174;
    float _2188 = fma(_2186, _2138, 1.0);
    float _2190 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2192 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2178);
    float _2194 = -_2176;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2184);
    float _2198 = exp2(_2180);
    float _2200 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2202 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2192);
    float _2204 = fma(_2196, -0.5, 0.5);
    float _2206 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2208 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2200);
    float _2210 = fma(_2196, 0.5, 0.5);
    float _2212 = log2(_2188);
    float _2214 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2206);
    float _2216 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2208);
    float _2218 = fma(_2210, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2220 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2214);
    float _2222 = fma(_2210, _2218, -0.212114393711090087890625);
    float _2224 = 1.0 / _2202;
    float _2226 = _2166 + 1.0;
    float _2228 = fma(_2210, _2222, 1.570728778839111328125);
    float _2230 = -_2166;
    float _2232 = fma(_2198, _2226, _2230);
    float _2234 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2216);
    float _2236 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2220);
    float _2238 = sqrt(_2204);
    float _2240 = _2212 * 0.693147182464599609375;
    float _2242 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2244 = _2234 * _2224;
    float _2246 = _2236 * _2224;
    float _2248 = fma(_2244, 0.5, 0.5);
    float _2250 = _2238 * 0.636619746685028076171875;
    float _2252 = fma(_2246, -0.5, 0.5);
    float _2254 = fma(_2232, 0.5, 0.5);
    float _2256 = -_2228;
    float _2258 = fma(_2250, _2256, 1.0);
    float3 _6542 = float3(_2248, _2252, _2242);
    float _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6542, float3(0.0), isnan(_6542)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6542, float3(0.0), isnan(_6542)), level(0.0)).x;
    float3 _6553 = float3(_2248, _2252, _2242);
    float4 _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6553, float3(0.0), isnan(_6553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6553, float3(0.0), isnan(_6553)), level(0.0)).xyzw;
    float _2265 = _2263.x;
    float _2267 = _2263.y;
    float _2269 = _2263.z;
    float _2271 = _2263.w;
    float2 _6570 = float2(_2258, _2254);
    float3 _2275 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6570, float2(0.0), isnan(_6570)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6570, float2(0.0), isnan(_6570)), level(0.0)).xyz;
    float _2277 = _2275.x;
    float _2279 = _2275.y;
    float _2281 = _2275.z;
    float _2283 = float(uint(_908));
    float _2285 = trunc(_1258);
    int _2287 = int(_2285);
    int _2289 = ~_908;
    int _2291 = _2289 + 1;
    float _2293 = _1266 * _152;
    int _2295 = abs(_1178);
    out.m_61.x = _654;
    out.m_61.y = _656;
    out.m_61.z = _658;
    out.m_61.w = _662;
    float _2297 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2299 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2301 = 1.0 / _2283;
    float _2303 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2299);
    float _2305 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2303);
    float _2307 = float(uint(_2287));
    float _2309 = trunc(_2293);
    int _2311 = int(_2309);
    float _2313 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2305);
    out.gl_Position.x = _2234;
    out.gl_Position.y = _2236;
    out.gl_Position.z = _2313;
    out.gl_Position.w = _2202;
    int _2315 = as_type<int>(_2301) + (-2);
    float _2317 = exp2(_2297);
    float _2319 = as_type<float>(_2315) * _2307;
    float _2321 = trunc(_2319);
    float _2323 = precise::max(_2321, 0.0);
    uint _2326 = uint(_2323);
    float _2328 = -_2317;
    float _2330 = _2328 + 1.0;
    int _2332 = ~_908;
    int _2334 = _2332 + 1;
    int _2336 = _2291 * int(_2326);
    int _2338 = _2336 + _2287;
    float _2340 = float(uint(_2338));
    float _2342 = as_type<float>(_2315) * _2340;
    float _2344 = trunc(_2342);
    float _2346 = precise::max(_2344, 0.0);
    uint _2348 = uint(_2346);
    bool _2350 = !_922;
    float _2352 = _2350 ? 7.345489978790283203125 : 1.0;
    float _2354 = _2352 * _904;
    int _2356 = _908 + (-1);
    float _2358 = floor(_2354);
    int _2360 = int(_2326) + int(_2348);
    float _2362 = float(_2287);
    int _2364 = _2334 * _2360;
    int _2366 = _2364 + _2287;
    bool _2368 = _2362 >= _1256;
    bool _2370 = isnan(_2362);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(_1256);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    bool _2380 = uint(_2366) >= uint(_908);
    float _2382 = -_2358;
    float _2384 = _2354 + _2382;
    float _2386 = trunc(_2378);
    int _2388 = int(_2386);
    int _2390 = ~_908;
    int _2392 = _2390 + 1;
    bool _2394 = !_2380;
    int _2396 = _2394 ? 0 : (-1);
    float _2398 = _2384 * _1256;
    bool _2400 = _908 == 0;
    int _2402 = ~_2360;
    int _2404 = _2402 + _2396;
    int _2406 = _2404 + 1;
    float _2408 = trunc(_2398);
    int _2410 = int(_2408);
    int _2412 = _908 * _2406;
    int _2414 = _2412 + _2287;
    int _2416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2418 = _2416 != 0;
    int _2420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2422 = _2420 != 0;
    int _2424 = ~_2388;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    bool _2430 = !_2400;
    int _2432 = _2430 ? _2414 : (-1);
    bool _2434 = !_2418;
    int _2436 = _2434 ? 0 : 1;
    int _2438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2440 = _2438 != 0;
    int _2442 = _2432 * _2428;
    int _2444 = abs(_2436);
    int _2446 = abs(_1190);
    int _2448 = _2388 * _2356;
    int _2450 = _2448 + _2442;
    int _2452 = abs(_1184);
    bool _2454 = !_2440;
    int _2456 = _2454 ? 0 : 1;
    int _2458 = _2450 * _2295;
    int _2460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2462 = _2460 != 0;
    int _2464 = _2410 * _2444;
    int _2466 = _2464 + _2287;
    int _2468 = abs(_2456);
    int _2470 = _2311 * _2452;
    int _2472 = _2470 + _2458;
    float _2474 = in.m_53.w;
    float _2476 = float(uint(_2466));
    int _2478 = _2466 * _2446;
    int _2480 = _2478 + _2472;
    int _2482 = ~_908;
    int _2484 = _2482 + 1;
    int _2486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2488 = _2486 != 0;
    int _2490 = _2410 * _2468;
    int _2492 = _2490 + _2480;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2500 = _2498 != 0;
    float _2502 = float(uint(_2492));
    float _2504 = 1.0 / _2496;
    float _2506 = as_type<float>(_2315) * _2502;
    float _2508 = trunc(_2506);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    bool _2514 = _2474 > 0.5;
    int _2516 = _2484 * int(_2512);
    int _2518 = _2516 + _2492;
    float _2520 = float(uint(_2518));
    float _2522 = as_type<float>(_2315) * _2520;
    float _2524 = in.m_63.y;
    float _2526 = trunc(_2522);
    float _2528 = precise::max(_2526, 0.0);
    uint _2530 = uint(_2528);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2532 = as_type<float>(_2315) * _2476;
    int _2534 = int(_2512) + int(_2530);
    float _2536 = trunc(_2532);
    float _2538 = precise::max(_2536, 0.0);
    uint _2540 = uint(_2538);
    float _2542 = -_2524;
    float _2544 = _2542 + 1.0;
    int _2546 = _2392 * _2534;
    int _2548 = _2546 + _2492;
    int _2550 = _2514 ? as_type<int>(_2544) : as_type<int>(_2524);
    bool _2552 = uint(_2548) >= uint(_908);
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2556 = _2554 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2558 = _910 > 0.5;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2562 = _902 + _2560;
    bool _2564 = !_2552;
    int _2566 = _2564 ? 0 : (-1);
    float _2568 = 1.0 / _2556;
    int _2570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2572 = _2570 != 0;
    int _2574 = ~_2534;
    int _2576 = _2574 + _2566;
    int _2578 = _2576 + 1;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2580;
    float _2584 = _2572 ? as_type<float>(_2550) : _2524;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2590 = _2524;
    bool _2592 = _2558;
    bool _2594 = _2572;
    int _2596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].w);
    if (_2422)
    {
        float _2598 = _2558 ? _2544 : _2524;
        _2590 = _2598;
    }
    float _2600 = _2590;
    int _2602 = _908 * _2578;
    int _2604 = _2602 + _2492;
    float _2606 = in.m_63.x;
    if (_2462)
    {
        bool _2608 = _926 > 0.5;
        _2592 = _2608;
    }
    bool _2610 = _2592;
    float _2612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2614 = ~_908;
    int _2616 = _2614 + 1;
    float _2618 = _2582 * _2504;
    bool _2620 = !_2400;
    int _2622 = _2620 ? _2604 : (-1);
    if (_2488)
    {
        bool _2624 = _904 > 0.5;
        _2594 = _2624;
    }
    bool _2626 = _2594;
    int _2628 = _2616 * int(_2540);
    int _2630 = _2628 + _2466;
    int _2632 = _2622 >> 31;
    float _2634 = _2588 * _2568;
    bool _2636 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2638 = isnan(_902);
    bool _2640 = _2636 || _2638;
    bool _2642 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2644 = _2640 || _2642;
    float _2646 = float(_2644);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2650 = _902 + _2648;
    float _2652 = float(uint(_2630));
    float _2654 = fma(_2634, _2562, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2656 = _2632 & 3;
    float _2658 = -_2646;
    float _2660 = _2658 + 1.0;
    bool _2662 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2664 = isnan(_902);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = as_type<float>(_2315) * _2652;
    int _2676 = _2622 + _2656;
    float _2678 = fma(_2618, _2650, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2680 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2682 = isnan(_902);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2688 = _2684 || _2686;
    float _2690 = float(_2688);
    float _2692 = _2672 * _2660;
    float _2694 = -_2672;
    float _2696 = _2694 + 1.0;
    int _2698 = _2676 >> 2;
    float _2700 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2702 = _2612;
    float _2704 = _2696;
    int _2706 = _2698;
    if (!_2488)
    {
        _2702 = _2606;
    }
    float _2708 = _2702;
    float _2710 = _2690 * _2696;
    int _2712 = _2698 << 4;
    int _2714 = _2712 + 368;
    float _2716 = fma(_2584, _2700, -0.5);
    float _2718 = _2708;
    if (!_2488)
    {
        _2704 = _2708;
    }
    float _2720 = _2704;
    float _2722 = _2678 * _2710;
    float _2724 = _2720;
    if (_2488)
    {
        _2718 = _2606;
    }
    float _2726 = _2718;
    float _2728 = -_2690;
    float _2730 = _2728 + 1.0;
    uint _2732 = uint(int(uint(_2714) >> uint(2)));
    uint _2734 = uint(int(uint(int(_2732)) >> uint(2)));
    int _2736 = int(_2732) & 3;
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[int(_2734)][_2736];
    int _2740 = int(_2732) + 1;
    uint _2742 = uint(int(uint(_2740) >> uint(2)));
    int _2744 = _2740 & 3;
    float _2746 = (*spvDescriptorSet0.vp_c9)._m0[int(_2742)][_2744];
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2750 = _2726;
    if (_2488)
    {
        float _2752 = -_2726;
        float _2754 = _2752 + 1.0;
        _2706 = as_type<int>(_2754);
    }
    int _2756 = _2706;
    if (_2462)
    {
        float _2758 = -_2726;
        float _2760 = _2758 + 1.0;
        _2596 = as_type<int>(_2760);
    }
    int _2762 = _2596;
    float _2764 = -_1262;
    float _2766 = fma(_1250, _2716, _2764);
    float _2768 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2600, -0.5);
    float _2770 = fma(_2730, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2722);
    if (_2488)
    {
        float _2772 = _2626 ? as_type<float>(_2756) : _2726;
        _2724 = _2772;
    }
    float _2774 = _2724;
    int _2776 = _2714 + 8;
    uint _2778 = uint(int(uint(_2776) >> uint(2)));
    uint _2780 = uint(int(uint(int(_2778)) >> uint(2)));
    int _2782 = int(_2778) & 3;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[int(_2780)][_2782];
    int _2786 = int(_2778) + 1;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    int _2790 = _2786 & 3;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[int(_2788)][_2790];
    if (_2462)
    {
        float _2794 = _2610 ? as_type<float>(_2762) : _2726;
        _2750 = _2794;
    }
    float _2796 = _2750;
    float _2798 = fma(_2654, _2692, _2770);
    int _2800 = _2622 & 3;
    bool _2802 = _2800 != 0;
    float _2804 = trunc(_2674);
    float _2806 = precise::max(_2804, 0.0);
    uint _2808 = uint(_2806);
    float _2810 = -_1084;
    float _2812 = fma(_1254, _2768, _2810);
    bool _2814 = uint(_2800) > 1u;
    float _2816 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2818 = _2622 & 3;
    bool _2820 = _2818 != 0;
    float _2822 = fma(_2774, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2824 = uint(_2800) >= 2u;
    float _2826 = fma(_2816, _2796, -0.5);
    int _2828 = _2820 ? 0 : 1;
    float _2830 = fma(_1252, _2822, _1036);
    bool _2832 = _2800 != 3;
    float _2834 = fma(_1270, _2826, _1246);
    int _2836 = ~_2828;
    int _2838 = _2836 + 1;
    int _2840 = _2838 + 1;
    int _2842 = int(_2540) + int(_2808);
    float _2844 = _2834 + 0.5;
    int _2846 = _2840;
    if (!_2814)
    {
        int _2848 = ~_2828;
        int _2850 = _2848 + 1;
        _2846 = _2850;
    }
    int _2852 = _2846;
    int _2854 = ~_908;
    int _2856 = _2854 + 1;
    int _2858 = abs(_2852);
    bool _2860 = !_2802;
    int _2862 = _2860 ? 0 : 1;
    int _2864 = _2856 * _2842;
    int _2866 = _2864 + _2466;
    int _2868 = _2824 ? 0 : 1;
    bool _2870 = _2800 != 3;
    int _2872 = ~_2868;
    int _2874 = _2872 + 1;
    int _2876 = _2874 + 1;
    bool _2878 = !_2870;
    int _2880 = _2878 ? 0 : (-1);
    int _2882 = abs(_2862);
    int _2884 = _2876;
    if (_2832)
    {
        int _2886 = ~_2868;
        int _2888 = _2886 + 1;
        _2884 = _2888;
    }
    int _2890 = _2884;
    int _2892 = ~_2858;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    bool _2898 = uint(_2866) >= uint(_908);
    int _2900 = abs(_2880);
    int _2902 = _2896 * as_type<int>(_2746);
    int _2904 = abs(_2890);
    int _2906 = ~_2882;
    int _2908 = _2906 + 1;
    int _2910 = _2908 + 1;
    bool _2912 = !_2500;
    int _2914 = _2912 ? 0 : 1;
    int _2916 = _2910 * as_type<int>(_2738);
    int _2918 = _2916 + _2902;
    int _2920 = ~_2904;
    int _2922 = _2920 + 1;
    int _2924 = _2922 + 1;
    bool _2926 = !_2898;
    int _2928 = _2926 ? 0 : (-1);
    int _2930 = abs(_2914);
    int _2932 = _2924 * as_type<int>(_2784);
    int _2934 = _2932 + _2918;
    int _2936 = ~_2900;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    float _2942 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2944 = ~_2842;
    int _2946 = _2944 + _2928;
    int _2948 = _2946 + 1;
    int _2950 = ~_2930;
    int _2952 = _2950 + 1;
    int _2954 = _2952 + 1;
    int _2956 = _2940 * as_type<int>(_2792);
    int _2958 = _2956 + _2934;
    float _2960 = fma(_2646, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2798);
    int _2962 = _908 * _2948;
    int _2964 = _2962 + _2466;
    float _2966 = _2830 + 0.5;
    int _2968 = _2958 * _2954;
    float _2970 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2972 = _2812 + 0.5;
    float _2974 = _2766 + 0.5;
    float _2976 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2978 = !_2400;
    int _2980 = _2978 ? _2964 : (-1);
    float _2982 = _1898 * _1956;
    float _2984 = _2970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _2966;
    out.m_67.y = _2972;
    out.m_67.z = _2844;
    out.m_67.w = _2974;
    float _2986 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2988 = _2942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2990 = _2960 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2992 = _2980 * _2930;
    int _2994 = _2992 + _2968;
    float _2996 = _2982 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2998 = _1898 > 0.0;
    bool _3000 = isnan(_1898);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan(0.0);
    bool _3006 = _3002 || _3004;
    out.m_69.x = _2984;
    out.m_69.y = _2986;
    out.m_69.z = _2988;
    out.m_69.w = _2990;
    float _3008 = _2996 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3010 = _1956 <= 0.0;
    bool _3012 = !_3006;
    bool _3014 = _3010 || _3012;
    float _3016 = float(_2994);
    float _3018 = _2313 + _2202;
    float _3020 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3008;
    float _3022 = _3018 * 0.5;
    float _3024 = _3020 * _2260;
    out.m_71.x = _3016;
    float _3026 = _2271 * _3024;
    float _3028 = _2281 * _3024;
    float _3030 = -_3020;
    float _3032 = _3030 + 1.0;
    out.m_73.z = _3022;
    out.m_73.w = _2202;
    float _3034 = fma(_2277, _3026, _2265);
    float _3036 = fma(_2279, _3026, _2267);
    float _3038 = _2271 * _3032;
    float _3040 = fma(_2271, _3028, _2269);
    out.m_75.x = _3034;
    out.m_75.y = _3036;
    out.m_75.z = _3040;
    out.m_75.w = _3038;
    if (!_3014)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3042 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3042;
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
    bool _900 = false;
    bool _684 = false;
    bool _586 = false;
    bool _358 = false;
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
        float _3110 = as_type<float>(_118);
        out.gl_Position.z = _3110;
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
        float _3165 = as_type<float>(_144);
        out.gl_Position.z = _3165;
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
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = _198 + _200;
    bool _204 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _206 = isnan(_198);
    bool _208 = _204 || _206;
    bool _210 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _212 = _208 || _210;
    float _214 = float(_212);
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _198 + _216;
    bool _220 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _222 = isnan(_198);
    bool _224 = _220 || _222;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _228 = _224 || _226;
    float _230 = float(_228);
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _242 = isnan(_198);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = -_214;
    float _254 = _252 + 1.0;
    float _256 = 1.0 / _238;
    float _258 = _250 * _254;
    float _260 = -_250;
    float _262 = _260 + 1.0;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _264;
    bool _268 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _270 = 1.0 / _234;
    float _272 = _230 * _262;
    float _274 = -_230;
    float _276 = _274 + 1.0;
    float _278 = _218 * _256;
    float _280 = _202 * _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _286;
    float _290 = fma(_266, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _292 = fma(_284, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _294 = fma(_288, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _296 = _290 * _272;
    float _298 = _292 * _272;
    float _300 = _294 * _272;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _312 = _310 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _314 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _316 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].y, _298);
    float _318 = fma(_304, _278, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _320 = fma(_308, _278, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _322 = fma(_312, _278, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _324 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[143].z, _300);
    float _326 = fma(_318, _258, _314);
    float _328 = fma(_320, _258, _316);
    float _330 = fma(_322, _258, _324);
    float _332 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[145].x, _326);
    float _334 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[145].y, _328);
    float _336 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[145].z, _330);
    bool _338 = !_268;
    float _356;
    if (!_338)
    {
        float _340 = in.m_53.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        _356 = _156;
    }
    _358 = false;
    float _360 = _356;
    float _362 = in.m_55.x;
    float _364 = in.m_55.y;
    float _366 = in.m_55.z;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _370 = _360 + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _374 = _360 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _376;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _388 = 1.0 / _378;
    bool _390 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _392 = 1.0 / _386;
    float _394 = _334 * _364;
    bool _396 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _398 = isnan(_360);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = _336 * _366;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _412 = _360 + _410;
    float _414 = 1.0 / _382;
    float _416 = _370 * _388;
    bool _418 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _420 = isnan(_360);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -_406;
    float _432 = _430 + 1.0;
    float _434 = _332 * _362;
    float _436 = _428 * _432;
    float _438 = _374 * _392;
    bool _440 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _442 = isnan(_360);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _452;
    bool _456 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _458 = isnan(_360);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _472 = -_428;
    float _474 = _472 + 1.0;
    float _476 = -_450;
    float _478 = _476 + 1.0;
    float _480 = _412 * _414;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _486;
    float _490 = _466 * _478;
    float _492 = fma(_454, _480, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _494 = fma(_484, _480, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _496 = fma(_488, _480, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _498 = _450 * _474;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _502 = _500 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _504 = _494 * _490;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _510 = _496 * _490;
    float _512 = -_466;
    float _514 = _512 + 1.0;
    float _516 = _492 * _490;
    float _518 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[107].x, _510);
    float _520 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[107].y, _504);
    float _522 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[107].z, _516);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _524;
    float _528 = fma(_470, _438, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _530 = fma(_502, _438, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _532 = fma(_508, _438, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _538;
    float _542 = fma(_528, _498, _518);
    float _544 = fma(_526, _416, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _546 = fma(_536, _416, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _548 = fma(_540, _416, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _550 = fma(_530, _498, _520);
    float _552 = fma(_532, _498, _522);
    float _554 = fma(_544, _436, _542);
    float _556 = fma(_546, _436, _550);
    float _558 = fma(_548, _436, _552);
    float _560 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[110].x, _554);
    float _562 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[110].y, _556);
    float _564 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[110].z, _558);
    bool _566 = !_390;
    float _584;
    if (!_566)
    {
        float _568 = in.m_53.x;
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        _584 = _156;
    }
    _586 = false;
    float _588 = _584;
    bool _590 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_588);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_588);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _588 + _622;
    float _626 = -_600;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _632 = 1.0 / _604;
    float _634 = _616 * _628;
    float _636 = -_616;
    float _638 = _636 + 1.0;
    float _640 = _620 * _632;
    float _642 = _562 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = fma(_640, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _648 = _644 * _634;
    float _650 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _648);
    float _654 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[116].x, _652);
    float _662 = _660 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _664 = !_630;
    float _682;
    if (!_664)
    {
        float _666 = in.m_53.x;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _670 = _666 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _682 = _680;
        _684 = true;
    }
    else
    {
        _682 = _156;
    }
    _684 = false;
    float _686 = _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _694 = _686 + _692;
    bool _696 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _698 = isnan(_686);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _708;
    float _712 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _714 = _686 + _712;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _724 = 1.0 / _710;
    bool _726 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _728 = 1.0 / _722;
    float _730 = 1.0 / _718;
    float _732 = _690 * _724;
    bool _734 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _736 = isnan(_686);
    bool _738 = _734 || _736;
    bool _740 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _742 = _738 || _740;
    float _744 = float(_742);
    float _746 = -_706;
    float _748 = _746 + 1.0;
    float _750 = _744 * _748;
    float _752 = _694 * _728;
    bool _754 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _756 = isnan(_686);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _766;
    bool _770 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _772 = isnan(_686);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _784 = _782 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _786 = -_744;
    float _788 = _786 + 1.0;
    float _790 = -_764;
    float _792 = _790 + 1.0;
    float _794 = _714 * _730;
    float _796 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _796;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _800;
    float _804 = _780 * _792;
    float _806 = fma(_768, _794, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _808 = fma(_798, _794, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _810 = fma(_802, _794, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _812 = _764 * _788;
    float _814 = _806 * _804;
    float _816 = _808 * _804;
    float _818 = _810 * _804;
    float _820 = -_780;
    float _822 = _820 + 1.0;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _830 = _828 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _832 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].x, _818);
    float _834 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].y, _816);
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _836;
    float _840 = fma(_784, _752, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _842 = fma(_826, _752, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _844 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[123].z, _814);
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _846;
    float _850 = fma(_830, _752, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _852;
    float _856 = fma(_840, _812, _832);
    float _858 = fma(_838, _732, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _860 = fma(_848, _732, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _862 = fma(_842, _812, _834);
    float _864 = fma(_854, _732, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _866 = fma(_850, _812, _844);
    float _868 = fma(_858, _750, _856);
    float _870 = fma(_860, _750, _862);
    float _872 = fma(_864, _750, _866);
    float _874 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[126].x, _868);
    float _876 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[126].y, _870);
    float _878 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[126].z, _872);
    bool _880 = !_726;
    float _898;
    if (!_880)
    {
        float _882 = in.m_53.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        _898 = _156;
    }
    _900 = false;
    float _902 = _898;
    float _904 = in.m_53.x;
    float _906 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _908 = int(_906);
    float _910 = in.m_53.y;
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _914 = in.m_42.x;
    float _916 = in.m_42.y;
    float _918 = in.m_42.z;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _922 = _920 != 0;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _926 = in.m_53.z;
    float _928 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _930 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _928);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _936 = _904 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _938 = _904 * 2.0;
    float _940 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _942 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _944 = -_912;
    float _946 = fma(_936, 2.0, _944);
    float _948 = floor(_938);
    float _950 = _910 * 2.0;
    float _952 = fma(_942, -2.0, _924);
    float _954 = _916 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _956 = _916 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = _916 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _960 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _940);
    float _962 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[4].x, _954);
    float _964 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _966 = _926 * 2.0;
    float _968 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[6].x, _958);
    float _970 = _904 + _910;
    float _972 = _904 + _926;
    float _974 = floor(_950);
    float _976 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[4].z, _962);
    float _978 = _970 + (-1.0);
    float _980 = _910 + _926;
    float _982 = _972 + (-1.0);
    bool _984 = _948 > 0.0;
    float _986 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[5].z, _964);
    float _988 = _980 + (-1.0);
    float _990 = floor(_966);
    float _992 = fma(_918, (*spvDescriptorSet0.vp_c10)._m0[6].z, _968);
    bool _994 = _948 >= 0.0;
    bool _996 = isnan(_948);
    bool _998 = _994 || _996;
    bool _1000 = isnan(0.0);
    bool _1002 = _998 || _1000;
    float _1004 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _960);
    float _1006 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1008 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1010 = _988;
    if (!_922)
    {
        _1010 = _926;
    }
    float _1012 = _1010;
    float _1014 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1016 = int(_1014);
    float _1018 = _1012;
    if (_922)
    {
        _1018 = _910;
    }
    float _1020 = _1018;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1024 = _974 >= 0.0;
    bool _1026 = isnan(_974);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan(0.0);
    bool _1032 = _1028 || _1030;
    float _1034 = -_100;
    float _1036 = fma(_1034, (*spvDescriptorSet0.vp_c9)._m0[76].x, _946);
    bool _1038 = _974 > 0.0;
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1022);
    bool _1042 = _990 > 0.0;
    float _1044 = _992 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1046 = _990 >= 0.0;
    bool _1048 = isnan(_990);
    bool _1050 = _1046 || _1048;
    bool _1052 = isnan(0.0);
    bool _1054 = _1050 || _1052;
    float _1056 = _1022;
    float _1058 = _1020;
    if (!_922)
    {
        _1056 = _910;
    }
    float _1060 = _1056;
    float _1062 = _1060;
    if (_922)
    {
        _1062 = _904;
    }
    float _1064 = _1062;
    float _1066 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _930);
    if (!_922)
    {
        _1058 = _926;
    }
    float _1068 = _1058;
    float _1070 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1072 = log2(_1070);
    float _1074 = _1068;
    if (_922)
    {
        _1074 = _910;
    }
    float _1076 = _1074;
    float _1078 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[83].z, _932);
    float _1080 = _1064 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1082 = _1032 ? 0 : 1;
    float _1084 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _952);
    float _1086 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1088 = -_934;
    float _1090 = fma(_1080, 2.0, _1088);
    int _1092 = _1002 ? 0 : 1;
    float _1094 = rsqrt(_1066);
    int _1096 = _1054 ? 0 : 1;
    int _1098 = ~_1092;
    int _1100 = _1098 + 1;
    int _1102 = _1100 + 1;
    int _1104 = ~_1096;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    int _1110 = _1102;
    int _1112 = _1108;
    if (!_984)
    {
        int _1114 = ~_1092;
        int _1116 = _1114 + 1;
        _1110 = _1116;
    }
    int _1118 = _1110;
    float _1120 = _1072 * _100;
    if (!_1042)
    {
        int _1122 = ~_1096;
        int _1124 = _1122 + 1;
        _1112 = _1124;
    }
    int _1126 = _1112;
    bool _1128 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1130 = isnan(0.0);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1136 = _1132 || _1134;
    float _1138 = exp2(_1120);
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1144 = _1142 != 0;
    int _1146 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1148 = _1146 != 0;
    int _1150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1152 = _1150 != 0;
    float _1154 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1140);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1158 = 1.0 + _1156;
    bool _1160 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1162 = isnan(1.0);
    bool _1164 = _1160 || _1162;
    bool _1166 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1168 = _1164 || _1166;
    float _1170 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1172 = float(_1016);
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1176 = !_1148;
    int _1178 = _1176 ? 0 : 1;
    float _1180 = 1.0 / _1158;
    bool _1182 = !_1144;
    int _1184 = _1182 ? 0 : 1;
    float _1186 = fma(_1086, -2.0, _1174);
    bool _1188 = !_1152;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = -_1138;
    float _1194 = _1192 + 1.0;
    int _1196 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1198 = _1196 != 0;
    int _1200 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1202 = _1200 != 0;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1206 = _1204 != 0;
    float _1208 = 1.0 / _1172;
    int _1210 = ~_1082;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    if (!_1038)
    {
        int _1218 = ~_1082;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    float _1224 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1226 = !_1198;
    int _1228 = _1226 ? 0 : 1;
    float _1230 = in.m_57.x;
    float _1232 = in.m_57.y;
    float _1234 = in.m_57.z;
    bool _1236 = !_1202;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1224);
    int _1242 = abs(_1228);
    float _1244 = -_100;
    float _1246 = fma(_1244, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1090);
    int _1248 = abs(_1238);
    float _1250 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1040);
    float _1252 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1240);
    float _1254 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1154);
    float _1256 = float(_908);
    float _1258 = _1208 * _100;
    float _1260 = float(_1118);
    float _1262 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1186);
    float _1264 = _1136 ? _1194 : 0.0;
    float _1266 = _1256 * _100;
    float _1268 = float(_1242);
    float _1270 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1078);
    float _1272 = float(_1126);
    if (_1168)
    {
        float _1274 = _1264 * _1180;
        _110 = _1274;
    }
    float _1276 = _110;
    bool _1278 = !_1206;
    int _1280 = _1278 ? 0 : 1;
    float _1282 = float(_1248);
    float _1284 = _1268 * _1272;
    int _1286 = abs(_1280);
    float _1288 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1290 = _1282 * _1260;
    float _1292 = _1284 * (-2.0);
    float _1294 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1296 = _1288 * _1288;
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1298;
    float _1302 = _904 + (-0.5);
    float _1304 = fma(_1292, _1230, _1230);
    float _1306 = _1094 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1308 = fma(_1294, _1294, _1296);
    float _1310 = float(_1222);
    float _1312 = fma(_1170, _1292, _1170);
    float _1314 = float(_1286);
    float _1316 = fma(_1302, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1304);
    float _1318 = fma(_1306, _1306, _1308);
    float _1320 = _1290 * (-2.0);
    float _1322 = 1.0 / _1300;
    float _1324 = _1314 * _1310;
    float _1326 = fma(_1312, _1276, _1316);
    float _1328 = _986 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1330 = fma(_1008, _1320, _1008);
    float _1332 = fma(_1320, _1232, _1232);
    float _1334 = _910 + (-0.5);
    float _1336 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1338 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1340 = in.m_59.x;
    float _1342 = in.m_59.y;
    float _1344 = in.m_59.z;
    float _1346 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1332);
    float _1348 = _1324 * (-2.0);
    float _1350 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1338);
    float _1352 = rsqrt(_1318);
    float _1354 = fma(_1330, _1276, _1346);
    float _1356 = fma(_1006, _1348, _1006);
    float _1358 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1350);
    float _1360 = fma(_1348, _1234, _1234);
    float _1362 = _1354 * 0.15915493667125701904296875;
    float _1364 = _1004 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1368 = _1326 * 0.15915493667125701904296875;
    float _1370 = _926 + (-0.5);
    float _1372 = _1362 * 6.283185482025146484375;
    float _1374 = sin(_1372);
    bool _1376 = _1366 >= _1364;
    bool _1378 = isnan(_1366);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan(_1364);
    bool _1384 = _1380 || _1382;
    float _1386 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1360);
    float _1388 = -_1366;
    float _1390 = _1364 + _1388;
    float _1392 = _1294 * _1352;
    float _1394 = fma(_1356, _1276, _1386);
    float _1396 = _1368 * 6.283185482025146484375;
    float _1398 = sin(_1396);
    float _1400 = abs(_1390);
    float _1402 = precise::max(_1400, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1404 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1342);
    float _1406 = _1394 * 0.15915493667125701904296875;
    float _1408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1340);
    float _1410 = precise::min(_1402, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1412 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1414 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1416 = _1368 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1288 * _1352;
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1424 = _1410 + _1422;
    float _1426 = _1412 * _1404;
    float _1428 = _1306 * _1352;
    float _1430 = _1424 * _1322;
    float _1432 = _1406 * 6.283185482025146484375;
    float _1434 = cos(_1432);
    float _1436 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1344);
    float _1438 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1440 = !_1384;
    float _1442 = _1440 ? 1.0 : (-1.0);
    float _1444 = _1414 * _1436;
    float _1446 = _1438 * _1408;
    float _1448 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _1450 = _1362 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    float _1454 = _1442 * _1430;
    float _1456 = _1418 * _1374;
    float _1458 = _1448 * _1454;
    float _1460 = _1398 * _1374;
    float _1462 = _1406 * 6.283185482025146484375;
    float _1464 = sin(_1462);
    float _1466 = _1374 * _1434;
    float _1468 = _1458 * 0.15915493667125701904296875;
    float _1470 = _1434 * _1426;
    float _1472 = _1418 * _1452;
    float _1474 = _1398 * _1452;
    float _1476 = _1468 * 6.283185482025146484375;
    float _1478 = cos(_1476);
    float _1480 = _1418 * _1470;
    float _1482 = _1452 * _1434;
    float _1484 = _1398 * _1470;
    float _1486 = fma(_1464, _1472, _1460);
    float _1488 = -_1456;
    float _1490 = fma(_1464, _1474, _1488);
    float _1492 = -_1474;
    float _1494 = fma(_1464, _1456, _1492);
    float _1496 = -_1426;
    float _1498 = _1464 * _1496;
    float _1500 = fma(_1486, _1446, _1480);
    float _1502 = _1468 * 6.283185482025146484375;
    float _1504 = sin(_1502);
    float _1506 = fma(_1464, _1460, _1472);
    float _1508 = fma(_1482, _1446, _1498);
    float _1510 = fma(_1494, _1444, _1500);
    float _1512 = fma(_1490, _1446, _1484);
    float _1514 = -_1478;
    float _1516 = _1514 + 1.0;
    float _1518 = fma(_1466, _1444, _1508);
    float _1520 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1522 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1524 = fma(_1506, _1444, _1512);
    float _1526 = _1510 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1528 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1520);
    float _1530 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1522);
    float _1532 = _1420 * _1516;
    float _1534 = _1428 * _1428;
    float _1536 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1528);
    float _1538 = _1392 * _1504;
    float _1540 = _1420 * _1504;
    float _1542 = _1428 * _1504;
    float _1544 = _1392 * _1516;
    float _1546 = fma(_1518, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1526);
    float _1548 = fma(_1428, _1532, _1538);
    float _1550 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1530);
    float _1552 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1554 = fma(_1516, _1534, _1478);
    float _1556 = -_1542;
    float _1558 = fma(_1420, _1544, _1556);
    float _1560 = -_1540;
    float _1562 = fma(_1428, _1544, _1560);
    float _1564 = _1550 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1566 = _1552 * _1548;
    float _1568 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1546);
    float _1570 = fma(_1392, _1544, _1478);
    float _1572 = _1552 * _1558;
    float _1574 = fma(_1564, _1562, _1566);
    float _1576 = _1568 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1578 = fma(_1420, _1532, _1478);
    float _1580 = fma(_1564, _1570, _1572);
    float _1582 = fma(_1428, _1544, _1540);
    float _1584 = fma(_1576, _1554, _1574);
    float _1586 = fma(_1420, _1544, _1542);
    float _1588 = _1552 * _1578;
    float _1590 = fma(_1576, _1582, _1580);
    float _1592 = _1044 + _1584;
    float _1594 = -_1538;
    float _1596 = fma(_1428, _1532, _1594);
    float _1598 = fma(_1564, _1586, _1588);
    float _1600 = _1336 + _1590;
    float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1604 = _1592 + _1602;
    float _1606 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1608 = fma(_1576, _1596, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1612 = _1600 + _1610;
    float _1614 = _1604 * _1604;
    float _1616 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1606);
    float _1618 = _1328 + _1608;
    float _1620 = fma(_1612, _1612, _1614);
    float _1622 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1616);
    float _1624 = sqrt(_1620);
    bool _1626 = _1624 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1628 = _1616;
    float _1630 = _1608;
    float _1632 = _1532;
    float _1634 = _1624;
    if (!_1626)
    {
        _1628 = _1600;
    }
    float _1636 = _1628;
    float _1638 = _1636;
    if (!_1626)
    {
        _1630 = _1592;
    }
    float _1640 = _1630;
    float _1642 = _1640;
    if (!_1626)
    {
        _1632 = _1618;
    }
    float _1644 = _1632;
    bool _1646 = !_1626;
    float _1648 = _1644;
    if (!_1646)
    {
        float _1650 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1654 = _1624 + _1652;
        float _1656 = rsqrt(_1620);
        float _1658 = _1654 * _1650;
        float _1660 = _1618 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1662 = _1658 * 0.15915493667125701904296875;
        float _1664 = _1662 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        float _1668 = _1662 * 6.283185482025146484375;
        float _1670 = sin(_1668);
        float _1672 = _1666 + (-1.0);
        float _1674 = fma(_1670, _1660, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1676 = _1672 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1678 = _1656 * _1674;
        float _1680 = fma(_1618, _1666, _1676);
        float _1682 = fma(_1612, _1678, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1684 = fma(_1604, _1678, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1648 = _1680;
        _1638 = _1682;
        _1642 = _1684;
    }
    float _1686 = _1648;
    float _1688 = _1638;
    float _1690 = _1642;
    float _1692 = -_1328;
    float _1694 = _1692 + _1686;
    float _1696 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1698 = -_1336;
    float _1700 = _1698 + _1688;
    float _1702 = -_1044;
    float _1704 = _1702 + _1690;
    float _1706 = _1694 * _1694;
    float _1708 = _1328 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1710 = 1.0 / _1696;
    float _1712 = fma(_1700, _1700, _1706);
    float _1714 = fma(_1336, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1708);
    float _1716 = fma(_1704, _1704, _1712);
    float _1718 = fma(_1044, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1714);
    bool _1720 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1722 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1724 = _1720 || _1722;
    bool _1726 = isnan(0.5);
    bool _1728 = _1724 || _1726;
    float _1730 = sqrt(_1716);
    float _1732 = _1718 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1734 = _1732 + _1696;
    float _1736 = _1734 * _1710;
    float _1738 = _1736 * 0.5;
    bool _1740 = _1730 > 0.0;
    float _1742 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1744 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1742);
    float _1746 = _1738;
    float _1748 = _1700;
    float _1750 = _1686;
    float _1752 = _1688;
    float _1754 = _1690;
    float _1756 = _1704;
    float _1758 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1760 = _1696;
    if (_1728)
    {
        _1746 = 1.0;
    }
    float _1762 = _1746;
    float _1764 = 1.0 / _1744;
    bool _1766 = !_1740;
    float _1768 = _1762;
    if (!_1766)
    {
        float _1770 = _172 * _172;
        float _1772 = rsqrt(_1716);
        float _1774 = fma(_170, _170, _1770);
        float _1776 = fma(_174, _174, _1774);
        float _1778 = sqrt(_1776);
        float _1780 = _1694 * _1772;
        float _1782 = _1704 * _1772;
        bool _1784 = _1778 > 0.0;
        float _1786 = _1700 * _1772;
        bool _1788 = !_1784;
        _1758 = _1782;
        _1760 = _1786;
        if (!_1788)
        {
            float _1790 = rsqrt(_1776);
            float _1792 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1794 = _172 * _1790;
            float _1796 = _170 * _1790;
            float _1798 = _174 * _1790;
            float _1800 = _1780 * _1794;
            float _1802 = fma(_1786, _1796, _1800);
            float _1804 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1806 = fma(_1782, _1798, _1802);
            float _1808 = _1806 * _1804;
            float _1810 = fma(_170, _1808, _1688);
            float _1812 = fma(_172, _1808, _1686);
            float _1814 = fma(_174, _1808, _1690);
            _1748 = _1802;
            _1750 = _1812;
            _1752 = _1810;
            _1754 = _1814;
            _1756 = _1800;
        }
    }
    float _1816 = _1748;
    float _1818 = _1750;
    float _1820 = _1752;
    float _1822 = _1754;
    float _1824 = _1756;
    float _1826 = _1758;
    float _1828 = _1760;
    float _1830 = _1828;
    float _1832 = _1816;
    float _1834 = _1824;
    float _1836 = _1826;
    if (_1728)
    {
        _1830 = 1.0;
    }
    float _1838 = _1830;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1842 = _1764 * _1840;
    float _1844 = _1838;
    if (!_1728)
    {
        float _1846 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1848 = _1846 * 0.15915493667125701904296875;
        float _1850 = _1848 * 6.283185482025146484375;
        float _1852 = cos(_1850);
        float _1854 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1856 = _1854 * 0.15915493667125701904296875;
        float _1858 = _1848 * 6.283185482025146484375;
        float _1860 = sin(_1858);
        float _1862 = 1.0 / _1852;
        float _1864 = _1856 * 6.283185482025146484375;
        float _1866 = cos(_1864);
        float _1868 = _1860 * _1862;
        float _1870 = _1856 * 6.283185482025146484375;
        float _1872 = sin(_1870);
        float _1874 = _1866 * _1868;
        float _1876 = 1.0 / _1874;
        float _1878 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1880 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1878;
        float _1882 = 1.0 / _1880;
        float _1884 = _1872 * _1876;
        float _1886 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1888 = fma(_1842, _1884, _1886);
        float _1890 = _1888 * _1882;
        float _1892 = precise::clamp(_1890, 0.0, 1.0);
        _1832 = _1856;
        _1834 = _1848;
        _1768 = _1892;
    }
    float _1894 = _1832;
    float _1896 = _1834;
    float _1898 = _1768;
    float _1900 = _1894;
    if (!_1728)
    {
        float _1902 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1904 = _1902 * 0.15915493667125701904296875;
        float _1906 = _1904 * 6.283185482025146484375;
        float _1908 = cos(_1906);
        float _1910 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1912 = _1910 * 0.15915493667125701904296875;
        float _1914 = _1904 * 6.283185482025146484375;
        float _1916 = sin(_1914);
        float _1918 = 1.0 / _1908;
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
        float _1944 = fma(_1842, _1940, _1942);
        float _1946 = _1944 * _1938;
        float _1948 = precise::clamp(_1946, 0.0, 1.0);
        float _1950 = -_1948;
        float _1952 = _1950 + 1.0;
        _1900 = _1918;
        _1844 = _1952;
    }
    float _1954 = _1900;
    float _1956 = _1844;
    float _1958 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1960 = _1818 + _1958;
    float _1962 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1964 = _1820 + _1962;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1968 = _1822 + _1966;
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
    float _2000 = _1954;
    float _2002 = _1990;
    float _2004 = _1998;
    float _2006 = _1960;
    float _2008 = _1984;
    float _2010 = _1986;
    float _2012 = _1988;
    if (_1994)
    {
        float _2014 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2000 = _2014;
    }
    float _2016 = _2000;
    if (_1994)
    {
        float _2018 = rsqrt(_1990);
        _2002 = _2018;
    }
    float _2020 = _2002;
    if (_1994)
    {
        float _2022 = _1998 * _2016;
        _2004 = _2022;
    }
    float _2024 = _2004;
    if (_1994)
    {
        float _2026 = _2024 * 0.15915493667125701904296875;
        _1836 = _2026;
    }
    float _2028 = _1836;
    float _2030 = _1896;
    if (_1994)
    {
        float _2032 = _2028 * 6.283185482025146484375;
        float _2034 = sin(_2032);
        _2030 = _2034;
    }
    float _2036 = _2030;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = precise::max(0.0, _2038);
    float _2042 = _2016;
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
        _2006 = _2058;
    }
    float _2060 = _2006;
    float _2062 = _2060;
    float _2064 = _2036;
    if (_1994)
    {
        float _2066 = fma(_2036, _2060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2044 = _2066;
    }
    float _2068 = _2044;
    float _2070 = _2068;
    if (!_1994)
    {
        _2062 = _1982;
    }
    float _2072 = _2062;
    float _2074 = _2072;
    if (_1994)
    {
        float _2076 = _2050 + (-1.0);
        _2064 = _2076;
    }
    float _2078 = _2064;
    float _2080 = _2078;
    if (_1994)
    {
        float _2082 = _2020 * _2068;
        _1634 = _2082;
    }
    float _2084 = _1634;
    if (!_1994)
    {
        _2070 = _2056;
    }
    float _2086 = _2070;
    float _2088 = _2086;
    if (_1994)
    {
        float _2090 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2080 = _2090;
    }
    float _2092 = _2080;
    if (_1994)
    {
        float _2094 = _1982 * _2084;
        _2074 = _2094;
    }
    float _2096 = _2074;
    if (_1994)
    {
        float _2098 = _1984 * _2084;
        _2008 = _2098;
    }
    float _2100 = _2008;
    if (_1994)
    {
        float _2102 = fma(_2056, _2050, _2092);
        _2088 = _2102;
    }
    float _2104 = _2088;
    if (_1994)
    {
        float _2106 = _2096 * _2096;
        _2010 = _2106;
    }
    float _2108 = _2010;
    if (_1994)
    {
        float _2110 = _2100 * _2100;
        _2012 = _2110;
    }
    float _2112 = _2012;
    float _2114 = fma(_2104, _2104, _2108);
    float _2116 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2118 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2116);
    float _2120 = precise::clamp(_2118, 0.0, 1.0);
    float _2122 = _2114 + _2112;
    float _2124 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2126 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2128 = -_2120;
    float _2130 = _2128 + 1.0;
    float _2132 = rsqrt(_2122);
    float _2134 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2124);
    float _2136 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2138 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2140 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2134);
    float _2142 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2126);
    float _2144 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2146 = abs(_2130);
    float _2148 = log2(_2146);
    float _2150 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2136);
    float _2152 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2142);
    float _2154 = fma(_1820, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2144);
    float _2156 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2158 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2150);
    float _2160 = _2152 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2162 = fma(_1822, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2154);
    float _2164 = _2132 * _2096;
    float _2166 = _2132 * _2104;
    float _2168 = _2158 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2170 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2172 = _2164 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2174 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2176 = _2132 * _2100;
    float _2178 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2170);
    float _2180 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2182 = -_2172;
    float _2184 = fma(_2166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2182);
    float _2186 = -_2174;
    float _2188 = fma(_2186, _2138, 1.0);
    float _2190 = _2162 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2192 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2178);
    float _2194 = -_2176;
    float _2196 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2184);
    float _2198 = exp2(_2180);
    float _2200 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2202 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2192);
    float _2204 = fma(_2196, -0.5, 0.5);
    float _2206 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2208 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2200);
    float _2210 = fma(_2196, 0.5, 0.5);
    float _2212 = log2(_2188);
    float _2214 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2206);
    float _2216 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2208);
    float _2218 = fma(_2210, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2220 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2214);
    float _2222 = fma(_2210, _2218, -0.212114393711090087890625);
    float _2224 = 1.0 / _2202;
    float _2226 = _2166 + 1.0;
    float _2228 = fma(_2210, _2222, 1.570728778839111328125);
    float _2230 = -_2166;
    float _2232 = fma(_2198, _2226, _2230);
    float _2234 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2216);
    float _2236 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2220);
    float _2238 = sqrt(_2204);
    float _2240 = _2212 * 0.693147182464599609375;
    float _2242 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2244 = _2234 * _2224;
    float _2246 = _2236 * _2224;
    float _2248 = fma(_2244, 0.5, 0.5);
    float _2250 = _2238 * 0.636619746685028076171875;
    float _2252 = fma(_2246, -0.5, 0.5);
    float _2254 = fma(_2232, 0.5, 0.5);
    float _2256 = -_2228;
    float _2258 = fma(_2250, _2256, 1.0);
    float3 _6542 = float3(_2248, _2252, _2242);
    float _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6542, float3(0.0), isnan(_6542)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6542, float3(0.0), isnan(_6542)), level(0.0)).x;
    float3 _6553 = float3(_2248, _2252, _2242);
    float4 _2263 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6553, float3(0.0), isnan(_6553)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6553, float3(0.0), isnan(_6553)), level(0.0)).xyzw;
    float _2265 = _2263.x;
    float _2267 = _2263.y;
    float _2269 = _2263.z;
    float _2271 = _2263.w;
    float2 _6570 = float2(_2258, _2254);
    float3 _2275 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6570, float2(0.0), isnan(_6570)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6570, float2(0.0), isnan(_6570)), level(0.0)).xyz;
    float _2277 = _2275.x;
    float _2279 = _2275.y;
    float _2281 = _2275.z;
    float _2283 = float(uint(_908));
    float _2285 = trunc(_1258);
    int _2287 = int(_2285);
    int _2289 = ~_908;
    int _2291 = _2289 + 1;
    float _2293 = _1266 * _152;
    int _2295 = abs(_1178);
    out.m_61.x = _654;
    out.m_61.y = _656;
    out.m_61.z = _658;
    out.m_61.w = _662;
    float _2297 = _2148 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2299 = _2160 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2301 = 1.0 / _2283;
    float _2303 = fma(_2168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2299);
    float _2305 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2303);
    float _2307 = float(uint(_2287));
    float _2309 = trunc(_2293);
    int _2311 = int(_2309);
    float _2313 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2305);
    out.gl_Position.x = _2234;
    out.gl_Position.y = _2236;
    out.gl_Position.z = _2313;
    out.gl_Position.w = _2202;
    int _2315 = as_type<int>(_2301) + (-2);
    float _2317 = exp2(_2297);
    float _2319 = as_type<float>(_2315) * _2307;
    float _2321 = trunc(_2319);
    float _2323 = precise::max(_2321, 0.0);
    uint _2326 = uint(_2323);
    float _2328 = -_2317;
    float _2330 = _2328 + 1.0;
    int _2332 = ~_908;
    int _2334 = _2332 + 1;
    int _2336 = _2291 * int(_2326);
    int _2338 = _2336 + _2287;
    float _2340 = float(uint(_2338));
    float _2342 = as_type<float>(_2315) * _2340;
    float _2344 = trunc(_2342);
    float _2346 = precise::max(_2344, 0.0);
    uint _2348 = uint(_2346);
    bool _2350 = !_922;
    float _2352 = _2350 ? 7.345489978790283203125 : 1.0;
    float _2354 = _2352 * _904;
    int _2356 = _908 + (-1);
    float _2358 = floor(_2354);
    int _2360 = int(_2326) + int(_2348);
    float _2362 = float(_2287);
    int _2364 = _2334 * _2360;
    int _2366 = _2364 + _2287;
    bool _2368 = _2362 >= _1256;
    bool _2370 = isnan(_2362);
    bool _2372 = _2368 || _2370;
    bool _2374 = isnan(_1256);
    bool _2376 = _2372 || _2374;
    float _2378 = float(_2376);
    bool _2380 = uint(_2366) >= uint(_908);
    float _2382 = -_2358;
    float _2384 = _2354 + _2382;
    float _2386 = trunc(_2378);
    int _2388 = int(_2386);
    int _2390 = ~_908;
    int _2392 = _2390 + 1;
    bool _2394 = !_2380;
    int _2396 = _2394 ? 0 : (-1);
    float _2398 = _2384 * _1256;
    bool _2400 = _908 == 0;
    int _2402 = ~_2360;
    int _2404 = _2402 + _2396;
    int _2406 = _2404 + 1;
    float _2408 = trunc(_2398);
    int _2410 = int(_2408);
    int _2412 = _908 * _2406;
    int _2414 = _2412 + _2287;
    int _2416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2418 = _2416 != 0;
    int _2420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2422 = _2420 != 0;
    int _2424 = ~_2388;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    bool _2430 = !_2400;
    int _2432 = _2430 ? _2414 : (-1);
    bool _2434 = !_2418;
    int _2436 = _2434 ? 0 : 1;
    int _2438 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2440 = _2438 != 0;
    int _2442 = _2432 * _2428;
    int _2444 = abs(_2436);
    int _2446 = abs(_1190);
    int _2448 = _2388 * _2356;
    int _2450 = _2448 + _2442;
    int _2452 = abs(_1184);
    bool _2454 = !_2440;
    int _2456 = _2454 ? 0 : 1;
    int _2458 = _2450 * _2295;
    int _2460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2462 = _2460 != 0;
    int _2464 = _2410 * _2444;
    int _2466 = _2464 + _2287;
    int _2468 = abs(_2456);
    int _2470 = _2311 * _2452;
    int _2472 = _2470 + _2458;
    float _2474 = in.m_53.w;
    float _2476 = float(uint(_2466));
    int _2478 = _2466 * _2446;
    int _2480 = _2478 + _2472;
    int _2482 = ~_908;
    int _2484 = _2482 + 1;
    int _2486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2488 = _2486 != 0;
    int _2490 = _2410 * _2468;
    int _2492 = _2490 + _2480;
    float _2494 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2500 = _2498 != 0;
    float _2502 = float(uint(_2492));
    float _2504 = 1.0 / _2496;
    float _2506 = as_type<float>(_2315) * _2502;
    float _2508 = trunc(_2506);
    float _2510 = precise::max(_2508, 0.0);
    uint _2512 = uint(_2510);
    bool _2514 = _2474 > 0.5;
    int _2516 = _2484 * int(_2512);
    int _2518 = _2516 + _2492;
    float _2520 = float(uint(_2518));
    float _2522 = as_type<float>(_2315) * _2520;
    float _2524 = in.m_63.y;
    float _2526 = trunc(_2522);
    float _2528 = precise::max(_2526, 0.0);
    uint _2530 = uint(_2528);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _2532 = as_type<float>(_2315) * _2476;
    int _2534 = int(_2512) + int(_2530);
    float _2536 = trunc(_2532);
    float _2538 = precise::max(_2536, 0.0);
    uint _2540 = uint(_2538);
    float _2542 = -_2524;
    float _2544 = _2542 + 1.0;
    int _2546 = _2392 * _2534;
    int _2548 = _2546 + _2492;
    int _2550 = _2514 ? as_type<int>(_2544) : as_type<int>(_2524);
    bool _2552 = uint(_2548) >= uint(_908);
    float _2554 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2556 = _2554 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2558 = _910 > 0.5;
    float _2560 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2562 = _902 + _2560;
    bool _2564 = !_2552;
    int _2566 = _2564 ? 0 : (-1);
    float _2568 = 1.0 / _2556;
    int _2570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2572 = _2570 != 0;
    int _2574 = ~_2534;
    int _2576 = _2574 + _2566;
    int _2578 = _2576 + 1;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2580;
    float _2584 = _2572 ? as_type<float>(_2550) : _2524;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2590 = _2524;
    bool _2592 = _2558;
    bool _2594 = _2572;
    int _2596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].w);
    if (_2422)
    {
        float _2598 = _2558 ? _2544 : _2524;
        _2590 = _2598;
    }
    float _2600 = _2590;
    int _2602 = _908 * _2578;
    int _2604 = _2602 + _2492;
    float _2606 = in.m_63.x;
    if (_2462)
    {
        bool _2608 = _926 > 0.5;
        _2592 = _2608;
    }
    bool _2610 = _2592;
    float _2612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2614 = ~_908;
    int _2616 = _2614 + 1;
    float _2618 = _2582 * _2504;
    bool _2620 = !_2400;
    int _2622 = _2620 ? _2604 : (-1);
    if (_2488)
    {
        bool _2624 = _904 > 0.5;
        _2594 = _2624;
    }
    bool _2626 = _2594;
    int _2628 = _2616 * int(_2540);
    int _2630 = _2628 + _2466;
    int _2632 = _2622 >> 31;
    float _2634 = _2588 * _2568;
    bool _2636 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2638 = isnan(_902);
    bool _2640 = _2636 || _2638;
    bool _2642 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2644 = _2640 || _2642;
    float _2646 = float(_2644);
    float _2648 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2650 = _902 + _2648;
    float _2652 = float(uint(_2630));
    float _2654 = fma(_2634, _2562, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2656 = _2632 & 3;
    float _2658 = -_2646;
    float _2660 = _2658 + 1.0;
    bool _2662 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2664 = isnan(_902);
    bool _2666 = _2662 || _2664;
    bool _2668 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2670 = _2666 || _2668;
    float _2672 = float(_2670);
    float _2674 = as_type<float>(_2315) * _2652;
    int _2676 = _2622 + _2656;
    float _2678 = fma(_2618, _2650, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2680 = _902 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2682 = isnan(_902);
    bool _2684 = _2680 || _2682;
    bool _2686 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2688 = _2684 || _2686;
    float _2690 = float(_2688);
    float _2692 = _2672 * _2660;
    float _2694 = -_2672;
    float _2696 = _2694 + 1.0;
    int _2698 = _2676 >> 2;
    float _2700 = _2612 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2702 = _2612;
    float _2704 = _2696;
    int _2706 = _2698;
    if (!_2488)
    {
        _2702 = _2606;
    }
    float _2708 = _2702;
    float _2710 = _2690 * _2696;
    int _2712 = _2698 << 4;
    int _2714 = _2712 + 368;
    float _2716 = fma(_2584, _2700, -0.5);
    float _2718 = _2708;
    if (!_2488)
    {
        _2704 = _2708;
    }
    float _2720 = _2704;
    float _2722 = _2678 * _2710;
    float _2724 = _2720;
    if (_2488)
    {
        _2718 = _2606;
    }
    float _2726 = _2718;
    float _2728 = -_2690;
    float _2730 = _2728 + 1.0;
    uint _2732 = uint(int(uint(_2714) >> uint(2)));
    uint _2734 = uint(int(uint(int(_2732)) >> uint(2)));
    int _2736 = int(_2732) & 3;
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[int(_2734)][_2736];
    int _2740 = int(_2732) + 1;
    uint _2742 = uint(int(uint(_2740) >> uint(2)));
    int _2744 = _2740 & 3;
    float _2746 = (*spvDescriptorSet0.vp_c9)._m0[int(_2742)][_2744];
    float _2748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2750 = _2726;
    if (_2488)
    {
        float _2752 = -_2726;
        float _2754 = _2752 + 1.0;
        _2706 = as_type<int>(_2754);
    }
    int _2756 = _2706;
    if (_2462)
    {
        float _2758 = -_2726;
        float _2760 = _2758 + 1.0;
        _2596 = as_type<int>(_2760);
    }
    int _2762 = _2596;
    float _2764 = -_1262;
    float _2766 = fma(_1250, _2716, _2764);
    float _2768 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2600, -0.5);
    float _2770 = fma(_2730, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2722);
    if (_2488)
    {
        float _2772 = _2626 ? as_type<float>(_2756) : _2726;
        _2724 = _2772;
    }
    float _2774 = _2724;
    int _2776 = _2714 + 8;
    uint _2778 = uint(int(uint(_2776) >> uint(2)));
    uint _2780 = uint(int(uint(int(_2778)) >> uint(2)));
    int _2782 = int(_2778) & 3;
    float _2784 = (*spvDescriptorSet0.vp_c9)._m0[int(_2780)][_2782];
    int _2786 = int(_2778) + 1;
    uint _2788 = uint(int(uint(_2786) >> uint(2)));
    int _2790 = _2786 & 3;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[int(_2788)][_2790];
    if (_2462)
    {
        float _2794 = _2610 ? as_type<float>(_2762) : _2726;
        _2750 = _2794;
    }
    float _2796 = _2750;
    float _2798 = fma(_2654, _2692, _2770);
    int _2800 = _2622 & 3;
    bool _2802 = _2800 != 0;
    float _2804 = trunc(_2674);
    float _2806 = precise::max(_2804, 0.0);
    uint _2808 = uint(_2806);
    float _2810 = -_1084;
    float _2812 = fma(_1254, _2768, _2810);
    bool _2814 = uint(_2800) > 1u;
    float _2816 = _2748 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2818 = _2622 & 3;
    bool _2820 = _2818 != 0;
    float _2822 = fma(_2774, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _2824 = uint(_2800) >= 2u;
    float _2826 = fma(_2816, _2796, -0.5);
    int _2828 = _2820 ? 0 : 1;
    float _2830 = fma(_1252, _2822, _1036);
    bool _2832 = _2800 != 3;
    float _2834 = fma(_1270, _2826, _1246);
    int _2836 = ~_2828;
    int _2838 = _2836 + 1;
    int _2840 = _2838 + 1;
    int _2842 = int(_2540) + int(_2808);
    float _2844 = _2834 + 0.5;
    int _2846 = _2840;
    if (!_2814)
    {
        int _2848 = ~_2828;
        int _2850 = _2848 + 1;
        _2846 = _2850;
    }
    int _2852 = _2846;
    int _2854 = ~_908;
    int _2856 = _2854 + 1;
    int _2858 = abs(_2852);
    bool _2860 = !_2802;
    int _2862 = _2860 ? 0 : 1;
    int _2864 = _2856 * _2842;
    int _2866 = _2864 + _2466;
    int _2868 = _2824 ? 0 : 1;
    bool _2870 = _2800 != 3;
    int _2872 = ~_2868;
    int _2874 = _2872 + 1;
    int _2876 = _2874 + 1;
    bool _2878 = !_2870;
    int _2880 = _2878 ? 0 : (-1);
    int _2882 = abs(_2862);
    int _2884 = _2876;
    if (_2832)
    {
        int _2886 = ~_2868;
        int _2888 = _2886 + 1;
        _2884 = _2888;
    }
    int _2890 = _2884;
    int _2892 = ~_2858;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    bool _2898 = uint(_2866) >= uint(_908);
    int _2900 = abs(_2880);
    int _2902 = _2896 * as_type<int>(_2746);
    int _2904 = abs(_2890);
    int _2906 = ~_2882;
    int _2908 = _2906 + 1;
    int _2910 = _2908 + 1;
    bool _2912 = !_2500;
    int _2914 = _2912 ? 0 : 1;
    int _2916 = _2910 * as_type<int>(_2738);
    int _2918 = _2916 + _2902;
    int _2920 = ~_2904;
    int _2922 = _2920 + 1;
    int _2924 = _2922 + 1;
    bool _2926 = !_2898;
    int _2928 = _2926 ? 0 : (-1);
    int _2930 = abs(_2914);
    int _2932 = _2924 * as_type<int>(_2784);
    int _2934 = _2932 + _2918;
    int _2936 = ~_2900;
    int _2938 = _2936 + 1;
    int _2940 = _2938 + 1;
    float _2942 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2944 = ~_2842;
    int _2946 = _2944 + _2928;
    int _2948 = _2946 + 1;
    int _2950 = ~_2930;
    int _2952 = _2950 + 1;
    int _2954 = _2952 + 1;
    int _2956 = _2940 * as_type<int>(_2792);
    int _2958 = _2956 + _2934;
    float _2960 = fma(_2646, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2798);
    int _2962 = _908 * _2948;
    int _2964 = _2962 + _2466;
    float _2966 = _2830 + 0.5;
    int _2968 = _2958 * _2954;
    float _2970 = _874 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2972 = _2812 + 0.5;
    float _2974 = _2766 + 0.5;
    float _2976 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2978 = !_2400;
    int _2980 = _2978 ? _2964 : (-1);
    float _2982 = _1898 * _1956;
    float _2984 = _2970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _2966;
    out.m_67.y = _2972;
    out.m_67.z = _2844;
    out.m_67.w = _2974;
    float _2986 = _2976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2988 = _2942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2990 = _2960 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2992 = _2980 * _2930;
    int _2994 = _2992 + _2968;
    float _2996 = _2982 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2998 = _1898 > 0.0;
    bool _3000 = isnan(_1898);
    bool _3002 = _2998 || _3000;
    bool _3004 = isnan(0.0);
    bool _3006 = _3002 || _3004;
    out.m_69.x = _2984;
    out.m_69.y = _2986;
    out.m_69.z = _2988;
    out.m_69.w = _2990;
    float _3008 = _2996 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3010 = _1956 <= 0.0;
    bool _3012 = !_3006;
    bool _3014 = _3010 || _3012;
    float _3016 = float(_2994);
    float _3018 = _2313 + _2202;
    float _3020 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_49.x = _3008;
    float _3022 = _3018 * 0.5;
    float _3024 = _3020 * _2260;
    out.m_71.x = _3016;
    float _3026 = _2271 * _3024;
    float _3028 = _2281 * _3024;
    float _3030 = -_3020;
    float _3032 = _3030 + 1.0;
    out.m_73.z = _3022;
    out.m_73.w = _2202;
    float _3034 = fma(_2277, _3026, _2265);
    float _3036 = fma(_2279, _3026, _2267);
    float _3038 = _2271 * _3032;
    float _3040 = fma(_2271, _3028, _2269);
    out.m_75.x = _3034;
    out.m_75.y = _3036;
    out.m_75.z = _3040;
    out.m_75.w = _3038;
    if (!_3014)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3042 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3042;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

