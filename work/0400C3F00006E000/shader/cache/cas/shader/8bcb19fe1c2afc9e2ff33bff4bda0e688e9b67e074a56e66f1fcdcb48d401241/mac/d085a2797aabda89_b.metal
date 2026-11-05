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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_71 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_79 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1995 = false;
    bool _1360 = false;
    bool _352 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _2340 = as_type<float>(_120);
        out.gl_Position.z = _2340;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_51.w;
    float _126 = in.m_53.w;
    bool _128 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_124);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_124;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.w = _126;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_104);
        _114 = _144;
    }
    float _146 = _114;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2414 = as_type<float>(_160);
        out.gl_Position.z = _2414;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_104);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    bool _198 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _192 + _210;
    bool _214 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_192);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _232;
    float _252 = _244 * _248;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = 1.0 / _228;
    float _266 = _224 * _256;
    float _268 = -_224;
    float _270 = _268 + 1.0;
    float _272 = _212 * _250;
    float _274 = _196 * _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = fma(_260, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = fma(_282, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = _284 * _266;
    float _292 = _286 * _266;
    float _294 = _288 * _266;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _310 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _312 = fma(_298, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = fma(_302, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _316 = fma(_306, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_312, _252, _308);
    float _322 = fma(_314, _252, _310);
    float _324 = fma(_316, _252, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_262;
    float _350;
    if (!_332)
    {
        float _334 = in.m_53.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_104);
        float _356 = 1.0 / _354;
        float _358 = _140 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = in.m_57.x;
    float _364 = in.m_57.y;
    float _366 = in.m_57.z;
    float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _370 = log2(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _374 = _360 + _372;
    float _376 = in.m_53.x;
    float _378 = in.m_53.y;
    float _380 = in.m_53.z;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = _360 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _386;
    float _390 = in.m_46.x;
    float _392 = in.m_46.y;
    float _394 = in.m_46.z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _400 = 1.0 / _388;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _404 = _402 != 0;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _412 = _410 != 0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _414;
    bool _418 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _426 = _422 || _424;
    float _428 = 1.0 / _398;
    bool _430 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _432 = isnan(_360);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = _326 * _362;
    float _444 = _330 * _366;
    float _446 = _328 * _364;
    float _448 = 1.0 / _416;
    float _450 = _378 + _380;
    float _452 = _380 + _376;
    float _454 = _380 + (-0.5);
    float _456 = _380 * 2.0;
    float _458 = _370 * _140;
    float _460 = _378 + _376;
    float _462 = _376 + (-0.5);
    float _464 = _376 * 2.0;
    float _466 = exp2(_458);
    float _468 = _378 + (-0.5);
    float _470 = _378 * 2.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _474 = _360 + _472;
    float _476 = _392 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _478 = _392 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _480 = _392 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _482 = _474 * _400;
    float _484 = floor(_456);
    float _486 = in.m_59.x;
    float _488 = in.m_59.y;
    float _490 = in.m_59.z;
    float _492 = _450 + (-1.0);
    float _494 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].x, _476);
    float _496 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].x, _478);
    float _498 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].x, _480);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _502 = 1.0 + _500;
    float _504 = floor(_464);
    float _506 = _452 + (-1.0);
    bool _508 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _510 = isnan(1.0);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _516 = _512 || _514;
    float _518 = -_466;
    float _520 = _518 + 1.0;
    float _522 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _524 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _526 = _460 + (-1.0);
    float _528 = 1.0 / _502;
    bool _530 = _484 > 0.0;
    float _532 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _534 = _484 >= 0.0;
    bool _536 = isnan(_484);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _374 * _428;
    float _546 = _384 * _448;
    float _548 = floor(_470);
    int _550 = _542 ? 0 : 1;
    float _552 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _554 = _426 ? _520 : 0.0;
    float _556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _490);
    bool _558 = _504 > 0.0;
    float _560 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _562 = _504 >= 0.0;
    bool _564 = isnan(_504);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    int _574 = ~_550;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = _556 * _522;
    int _582 = _578;
    if (!_530)
    {
        int _584 = ~_550;
        int _586 = _584 + 1;
        _582 = _586;
    }
    int _588 = _582;
    float _590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _488);
    float _592 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_516)
    {
        float _594 = _554 * _528;
        _142 = _594;
    }
    float _596 = _142;
    float _598 = _572 * _560;
    float _600 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].z, _494);
    bool _602 = _548 > 0.0;
    float _604 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].z, _496);
    bool _606 = _548 >= 0.0;
    bool _608 = isnan(_548);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].z, _498);
    float _618 = _590 * _592;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _644 = fma(_630, _544, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _646 = fma(_634, _544, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _648 = fma(_626, _482, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _650 = fma(_642, _544, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _652 = fma(_622, _482, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _654 = fma(_638, _482, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _656 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _658 = isnan(_360);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _668;
    bool _672 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _674 = isnan(_360);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _688;
    float _692 = -_666;
    float _694 = _692 + 1.0;
    float _696 = fma(_670, _546, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _698 = fma(_686, _546, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _700 = fma(_690, _546, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _702 = _682 * _694;
    float _704 = -_682;
    float _706 = _704 + 1.0;
    bool _708 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _710 = isnan(_360);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _600 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = in.m_61.x;
    float _724 = in.m_61.y;
    float _726 = in.m_61.z;
    bool _728 = !_404;
    int _730 = _728 ? 0 : 1;
    float _732 = _440 * _706;
    bool _734 = !_408;
    int _736 = _734 ? 0 : 1;
    float _738 = _616 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _740 = abs(_730);
    float _742 = -_440;
    float _744 = _742 + 1.0;
    int _746 = _570 ? 0 : 1;
    float _748 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _750 = float(_740);
    float _752 = _718 * _744;
    int _754 = abs(_736);
    float _756 = float(_588);
    int _758 = ~_746;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    int _764 = _762;
    float _766 = _738;
    float _768 = _720;
    if (!_558)
    {
        int _770 = ~_746;
        int _772 = _770 + 1;
        _764 = _772;
    }
    int _774 = _764;
    float _776 = _750 * _756;
    float _778 = _652 * _752;
    float _780 = float(_774);
    float _782 = _776 * (-2.0);
    float _784 = float(_754);
    float _786 = _648 * _752;
    int _788 = _614 ? 0 : 1;
    float _790 = fma(_782, _722, _722);
    bool _792 = !_412;
    int _794 = _792 ? 0 : 1;
    float _796 = _784 * _780;
    float _798 = fma(_552, _782, _552);
    float _800 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[196].x, _790);
    int _802 = ~_788;
    int _804 = _802 + 1;
    int _806 = _804 + 1;
    float _808 = _796 * (-2.0);
    int _810 = abs(_794);
    float _812 = _654 * _752;
    int _814 = _806;
    float _816 = _786;
    if (!_602)
    {
        int _818 = ~_788;
        int _820 = _818 + 1;
        _814 = _820;
    }
    int _822 = _814;
    float _824 = in.m_63.x;
    float _826 = in.m_63.y;
    float _828 = in.m_63.z;
    float _830 = fma(_524, _808, _524);
    float _832 = fma(_808, _724, _724);
    float _834 = float(_810);
    float _836 = -_718;
    float _838 = _836 + 1.0;
    float _840 = float(_822);
    float _842 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[196].y, _832);
    bool _844 = _488 != 0.0;
    bool _846 = isnan(_488);
    bool _848 = _844 || _846;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    float _854 = fma(_798, _596, _800);
    float _856 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[107].x, _778);
    float _858 = _834 * _840;
    bool _860 = _486 == 0.0;
    bool _862 = !_852;
    bool _864 = _860 && _862;
    float _866 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[107].y, _786);
    float _868 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[107].z, _812);
    float _870 = _858 * (-2.0);
    bool _872 = _490 == 0.0;
    bool _874 = _872 && _864;
    float _876 = fma(_830, _596, _842);
    float _878 = _854 * 0.15915493667125701904296875;
    float _880 = fma(_870, _726, _726);
    float _882 = in.m_65.x;
    float _884 = in.m_65.y;
    float _886 = in.m_65.z;
    float _888 = in.m_65.w;
    float _890 = fma(_532, _870, _532);
    float _892 = _876 * 0.15915493667125701904296875;
    float _894 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _896 = _878 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = fma(_644, _732, _856);
    float _902 = fma(_646, _732, _866);
    float _904 = fma(_890, _596, _894);
    float _906 = fma(_650, _732, _868);
    float _908 = _876;
    float _910 = _890;
    float _912 = _880;
    float _914 = _858;
    if (_874)
    {
        _908 = _828;
    }
    float _916 = _908;
    float _918 = fma(_698, _702, _902);
    float _920 = _916;
    if (_874)
    {
        _816 = _826;
    }
    float _922 = _816;
    float _924 = _904 * 0.15915493667125701904296875;
    float _926 = _922;
    if (_874)
    {
        _910 = _916;
    }
    float _928 = _910;
    float _930 = _878 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _928;
    if (_874)
    {
        _912 = _922;
    }
    float _936 = _912;
    float _938 = fma(_700, _702, _906);
    float _940 = _936;
    if (!_874)
    {
        _920 = _828;
    }
    float _942 = _920;
    if (!_874)
    {
        _926 = _826;
    }
    float _944 = _926;
    if (_874)
    {
        _914 = _824;
    }
    float _946 = _914;
    float _948 = _892 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = _946;
    if (!_874)
    {
        float _954 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _942);
        _934 = _954;
    }
    float _956 = _934;
    float _958 = _882 * _944;
    float _960 = _886 * _824;
    if (!_874)
    {
        float _962 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _824);
        _952 = _962;
    }
    float _964 = _952;
    float _966 = fma(_696, _702, _900);
    if (!_874)
    {
        float _968 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _944);
        _940 = _968;
    }
    float _970 = _940;
    float _972 = -_958;
    float _974 = fma(_884, _824, _972);
    float _976 = _892 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _884 * _942;
    float _982 = -_960;
    float _984 = fma(_882, _942, _982);
    float _986 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].x, _966);
    float _988 = -_980;
    float _990 = fma(_886, _944, _988);
    float _992 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].y, _918);
    float _994 = _984 * _888;
    float _996 = _924 * 6.283185482025146484375;
    float _998 = cos(_996);
    float _1000 = _932 * _950;
    float _1002 = _898 * _950;
    float _1004 = _990 * _888;
    float _1006 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].z, _938);
    float _1008 = _924 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = _932 * _978;
    float _1014 = _932 * _998;
    float _1016 = _898 * _978;
    float _1018 = _898 * _998;
    float _1020 = _978 * _998;
    float _1022 = _950 * _998;
    float _1024 = _1014 * _618;
    float _1026 = _1018 * _618;
    float _1028 = _1014 * _884;
    float _1030 = fma(_1010, _1012, _1002);
    float _1032 = -_618;
    float _1034 = _1010 * _1032;
    float _1036 = -_1000;
    float _1038 = fma(_1010, _1016, _1036);
    float _1040 = -_1016;
    float _1042 = fma(_1010, _1000, _1040);
    float _1044 = fma(_1030, _598, _1024);
    float _1046 = fma(_1020, _598, _1034);
    float _1048 = fma(_1038, _598, _1026);
    float _1050 = fma(_1010, _1002, _1012);
    float _1052 = fma(_1042, _580, _1044);
    float _1054 = _974 * _888;
    float _1056 = fma(_1022, _580, _1046);
    float _1058 = -_884;
    float _1060 = _1010 * _1058;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1064 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1066 = fma(_1050, _580, _1048);
    float _1068 = fma(_1020, _882, _1060);
    float _1070 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1062);
    float _1072 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1064);
    float _1074 = -_970;
    float _1076 = _1010 * _1074;
    float _1078 = -_994;
    float _1080 = _1010 * _1078;
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1070);
    float _1084 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1072);
    float _1086 = _1018 * _884;
    float _1088 = fma(_1020, _964, _1076);
    float _1090 = _720 + _1082;
    float _1092 = _738 + _1084;
    float _1094 = fma(_1020, _1004, _1080);
    float _1096 = _1014 * _970;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1100 = _1090 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1104 = _1092 + _1102;
    float _1106 = _1018 * _970;
    float _1108 = _1014 * _994;
    float _1110 = _1100 * _1100;
    float _1112 = _1104 * _1104;
    float _1114 = _1018 * _994;
    float _1116 = fma(_1030, _964, _1096);
    float _1118 = fma(_1038, _964, _1106);
    float _1120 = _1110 + _1112;
    float _1122 = fma(_1030, _882, _1028);
    float _1124 = fma(_1038, _882, _1086);
    float _1126 = fma(_1030, _1004, _1108);
    float _1128 = sqrt(_1120);
    float _1130 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1132 = fma(_1038, _1004, _1114);
    float _1134 = fma(_1022, _956, _1088);
    float _1136 = fma(_1042, _956, _1116);
    float _1138 = fma(_1050, _956, _1118);
    float _1140 = fma(_1042, _1054, _1126);
    float _1142 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1130);
    float _1144 = fma(_1042, _886, _1122);
    float _1146 = fma(_1022, _886, _1068);
    float _1148 = fma(_1050, _886, _1124);
    float _1150 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1142);
    float _1152 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1154 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1156 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1158 = fma(_1050, _1054, _1132);
    bool _1160 = _1128 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1164 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1166 = _748 + _1150;
    float _1168 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1170 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1162);
    float _1172 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1164);
    float _1174 = fma(_1022, _1054, _1094);
    float _1176 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1152);
    float _1178 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1154);
    float _1180 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1156);
    float _1182 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1168);
    float _1184 = _1056;
    float _1186 = _1110;
    float _1188 = _1112;
    float _1190 = _1092;
    float _1192 = _1090;
    float _1194 = _1172;
    if (!_1160)
    {
        _1184 = _1166;
    }
    float _1196 = _1184;
    bool _1198 = !_1160;
    float _1200 = _1196;
    if (!_1198)
    {
        float _1202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1206 = _1128 + _1204;
        float _1208 = _1166 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = rsqrt(_1120);
        float _1212 = _1206 * _1202;
        float _1214 = _1212 * 0.15915493667125701904296875;
        float _1216 = _1214 * 6.283185482025146484375;
        float _1218 = sin(_1216);
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = cos(_1220);
        float _1224 = fma(_1218, _1208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1226 = _1210 * _1224;
        float _1228 = _1222 + (-1.0);
        float _1230 = fma(_1100, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1232 = fma(_1104, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1234 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1238 = _1230 + _1236;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1242 = _1232 + _1240;
        float _1244 = fma(_1166, _1222, _1234);
        float _1246 = _1238 * _1238;
        float _1248 = _1242 * _1242;
        _1200 = _1244;
        _1186 = _1246;
        _1188 = _1248;
        _1190 = _1232;
        _1192 = _1230;
    }
    float _1250 = _1200;
    float _1252 = _1186;
    float _1254 = _1188;
    float _1256 = _1190;
    float _1258 = _1192;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1262 = _1250 + _1260;
    float _1264 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1266 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1268 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1270 = fma(_1262, _1262, _1252);
    float _1272 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1264);
    float _1274 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1266);
    float _1276 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1268);
    float _1278 = _1270 + _1254;
    float _1280 = _986 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1282 = _992 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1284 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1286 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1272);
    float _1288 = fma(_1148, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1170);
    float _1290 = sqrt(_1278);
    float _1292 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1274);
    float _1294 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1276);
    float _1296 = fma(_1148, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1172);
    float _1298 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = fma(_1148, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1182);
    float _1304 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1176);
    float _1308 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1178);
    float _1310 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1180);
    out.m_67.x = _1288;
    out.m_67.y = _1296;
    out.m_67.z = _1302;
    out.m_69.x = _1298;
    out.m_69.y = _1300;
    out.m_69.z = _1304;
    bool _1312 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1314 = isnan(_1290);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1320 = _1316 || _1318;
    out.m_71.x = _1286;
    out.m_71.y = _1292;
    out.m_71.z = _1294;
    out.m_73.x = _1306;
    out.m_73.y = _1308;
    out.m_73.z = _1310;
    float _1322 = _1296;
    float _1324 = _1294;
    if (!_1320)
    {
        _1194 = 1.0;
    }
    float _1326 = _1194;
    bool _1328 = !_1320;
    float _1330 = _1326;
    if (!_1328)
    {
        bool _1332 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1334 = isnan(_1290);
        bool _1336 = _1332 || _1334;
        bool _1338 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1340 = _1336 || _1338;
        if (!_1340)
        {
            float _1342 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1344 = _1290 + _1342;
            float _1346 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1348 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1346;
            float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1352 = _1350 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1354 = 1.0 / _1348;
            float _1356 = _1344 * _1354;
            float _1358 = fma(_1356, _1352, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1330 = _1358;
            _1322 = _1354;
            _1360 = true;
        }
        else
        {
            bool _1362 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1364 = isnan(_1290);
            bool _1366 = _1362 || _1364;
            bool _1368 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1370 = _1366 || _1368;
            if (!_1370)
            {
                float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1374 = _1290 + _1372;
                float _1376 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1378 = _1376 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1380 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1382 = _1380 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1384 = 1.0 / _1378;
                float _1386 = _1374 * _1384;
                float _1388 = fma(_1386, _1382, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1330 = _1388;
                _1322 = _1384;
                _1360 = true;
            }
            else
            {
                _1330 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1360 = false;
    float _1390 = _1330;
    float _1392 = _1322;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1250 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1400 = _1256 + _1398;
    bool _1402 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.5);
    bool _1410 = _1406 || _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1414 = _1258 + _1412;
    float _1416 = fma(_1396, _1390, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1418 = fma(_1400, _1390, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1420 = fma(_1414, _1390, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1422 = _1414;
    float _1424 = _1392;
    float _1426 = _1396;
    if (_1410)
    {
        _1422 = _1420;
    }
    float _1428 = _1422;
    float _1430 = _1428;
    if (_1410)
    {
        _1424 = _1416;
    }
    float _1432 = _1424;
    float _1434 = _1432;
    if (_1410)
    {
        _1426 = _1418;
    }
    float _1436 = _1426;
    float _1438 = _1436;
    if (!_1410)
    {
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1442 = _748 + _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1446 = _720 + _1444;
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1450 = _1442 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1454 = _738 + _1452;
        float _1456 = fma(_1446, _1446, _1450);
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1460 = fma(_1454, _1454, _1456);
        float _1462 = sqrt(_1460);
        float _1464 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = -_748;
        float _1468 = _1466 + _1416;
        float _1470 = precise::min(_1462, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1472 = _1470 * _1458;
        float _1474 = -_720;
        float _1476 = _1474 + _1420;
        float _1478 = -_738;
        float _1480 = _1478 + _1418;
        float _1482 = _1464 * _1472;
        float _1484 = fma(_1476, _1482, _720);
        float _1486 = fma(_1468, _1482, _748);
        float _1488 = fma(_1480, _1482, _738);
        _1434 = _1486;
        _1430 = _1484;
        _1438 = _1488;
        _1324 = _1480;
    }
    float _1490 = _1434;
    float _1492 = _1430;
    float _1494 = _1438;
    float _1496 = _1324;
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1500 = _1490 + _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1504 = _1492 + _1502;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1508 = _1494 + _1506;
    float _1510 = _1500 * _1500;
    float _1512 = fma(_1504, _1504, _1510);
    float _1514 = fma(_1508, _1508, _1512);
    float _1516 = rsqrt(_1514);
    float _1518 = sqrt(_1514);
    float _1520 = _1504 * _1516;
    float _1522 = _1508 * _1516;
    float _1524 = _1500 * _1516;
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1528 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1530 = _1526 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 + _1532;
    float _1536 = sqrt(_1534);
    bool _1538 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = _1536 + _1540;
    float _1544 = _1496;
    float _1546 = _1542;
    float _1548 = _1526;
    if (_1538)
    {
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1550;
    }
    float _1552 = _1544;
    if (_1538)
    {
        float _1554 = _1542 * _1552;
        _1546 = _1554;
    }
    float _1556 = _1546;
    if (_1538)
    {
        float _1558 = _1556 * 0.15915493667125701904296875;
        _766 = _1558;
    }
    float _1560 = _766;
    float _1562 = _748;
    float _1564 = _1560;
    if (_1538)
    {
        float _1566 = _1560 * 6.283185482025146484375;
        float _1568 = sin(_1566);
        _1562 = _1568;
    }
    float _1570 = _1562;
    float _1572 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1574 = precise::max(0.0, _1572);
    float _1576 = _1552;
    float _1578 = _1574;
    if (_1538)
    {
        float _1580 = _1560 * 6.283185482025146484375;
        float _1582 = cos(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = -_1524;
    float _1588 = -_1574;
    float _1590 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1588);
    float _1592 = _1572;
    if (_1538)
    {
        float _1594 = rsqrt(_1534);
        _1592 = _1594;
    }
    float _1596 = _1592;
    if (_1538)
    {
        float _1598 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1598;
    }
    float _1600 = _1578;
    float _1602 = _1570;
    float _1604 = _1600;
    if (_1538)
    {
        float _1606 = fma(_1570, _1600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _768 = _1606;
    }
    float _1608 = _768;
    float _1610 = _1608;
    if (!_1538)
    {
        _1602 = _1590;
    }
    float _1612 = _1602;
    float _1614 = _1612;
    float _1616 = _1584;
    if (_1538)
    {
        float _1618 = _1584 + (-1.0);
        _1604 = _1618;
    }
    float _1620 = _1604;
    float _1622 = _1620;
    if (_1538)
    {
        float _1624 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1624;
    }
    float _1626 = _1564;
    if (!_1538)
    {
        _1622 = _1530;
    }
    float _1628 = _1622;
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1632 = _1596;
    float _1634 = _1628;
    if (_1538)
    {
        float _1636 = _1596 * _1608;
        _1610 = _1636;
    }
    float _1638 = _1610;
    if (!_1538)
    {
        _1632 = _1528;
    }
    float _1640 = _1632;
    float _1642 = _1640;
    if (_1538)
    {
        float _1644 = fma(_1590, _1584, _1626);
        _1614 = _1644;
    }
    float _1646 = _1614;
    if (!_1538)
    {
        _1616 = _1532;
    }
    float _1648 = _1616;
    float _1650 = _1648;
    if (_1538)
    {
        float _1652 = _1526 * _1638;
        _1548 = _1652;
    }
    float _1654 = _1548;
    if (_1538)
    {
        float _1656 = _1528 * _1638;
        _1642 = _1656;
    }
    float _1658 = _1642;
    float _1660 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1538)
    {
        float _1662 = _1654 * _1654;
        _1634 = _1662;
    }
    float _1664 = _1634;
    if (_1538)
    {
        float _1666 = _1658 * _1658;
        _1650 = _1666;
    }
    float _1668 = _1650;
    float _1670 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1660);
    float _1672 = fma(_1646, _1646, _1664);
    float _1674 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1670);
    float _1676 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1678 = _1672 + _1668;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1682 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1680);
    float _1684 = precise::clamp(_1682, 0.0, 1.0);
    float _1686 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1690 = rsqrt(_1678);
    float _1692 = -_1684;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1698 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1676);
    float _1700 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1702 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1704 = abs(_1694);
    float _1706 = log2(_1704);
    float _1708 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1696);
    float _1710 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1698);
    float _1712 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1700);
    float _1714 = -_1702;
    float _1716 = fma(_1714, _1630, 1.0);
    float _1718 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1722 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1712);
    float _1724 = _1690 * _1654;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = _1690 * _1646;
    float _1730 = _1690 * _1658;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1734 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1736 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1738 = log2(_1716);
    float _1740 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1742 = -_1732;
    float _1744 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1742);
    float _1746 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1748 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1750 = -_1730;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1744);
    float _1754 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1756 = exp2(_1740);
    float _1758 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = fma(_1752, -0.5, 0.5);
    float _1762 = fma(_1752, 0.5, 0.5);
    float _1764 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1748);
    float _1766 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1768 = _1728 + 1.0;
    float _1770 = fma(_1762, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1772 = 1.0 / _1754;
    float _1774 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1766);
    float _1776 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1778 = fma(_1762, _1770, -0.212114393711090087890625);
    float _1780 = _1738 * 0.693147182464599609375;
    float _1782 = fma(_1762, _1778, 1.570728778839111328125);
    float _1784 = sqrt(_1760);
    float _1786 = -_1728;
    float _1788 = fma(_1756, _1768, _1786);
    float _1790 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1774);
    float _1792 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1776);
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1796 = fma(_1788, 0.5, 0.5);
    float _1798 = _1790 * _1772;
    float _1800 = _1792 * _1772;
    float _1802 = fma(_1798, 0.5, 0.5);
    float _1804 = fma(_1800, -0.5, 0.5);
    float _1806 = _1784 * 0.636619746685028076171875;
    float3 _5091 = float3(_1802, _1804, _1794);
    float _1808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5091, float3(0.0), isnan(_5091)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5091, float3(0.0), isnan(_5091)), level(0.0)).x;
    float3 _5102 = float3(_1802, _1804, _1794);
    float4 _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5102, float3(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5102, float3(0.0), isnan(_5102)), level(0.0)).xyzw;
    float _1813 = _1811.x;
    float _1815 = _1811.y;
    float _1817 = _1811.z;
    float _1819 = _1811.w;
    float _1821 = -_1782;
    float _1823 = fma(_1806, _1821, 1.0);
    float2 _5124 = float2(_1823, _1796);
    float3 _1827 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5124, float2(0.0), isnan(_5124)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5124, float2(0.0), isnan(_5124)), level(0.0)).xyz;
    float _1829 = _1827.x;
    float _1831 = _1827.y;
    float _1833 = _1827.z;
    float _1835 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1837 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1492;
    out.m_75.y = _1490;
    out.m_75.z = _1494;
    bool _1839 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1841 = isnan(_1518);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1847 = _1843 || _1845;
    float _1849 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1837);
    float _1851 = exp2(_1835);
    float _1853 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1849);
    float _1855 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1857 = _1855 + _1754;
    out.gl_Position.x = _1790;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1754;
    float _1859 = _1857 * 0.5;
    float _1861 = -_1851;
    float _1863 = _1861 + 1.0;
    float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1859;
    out.m_77.w = _1754;
    float _1867 = -_1865;
    float _1869 = _1867 + 1.0;
    float _1871 = _1754;
    float _1873 = _1855;
    float _1875 = _1792;
    float _1877 = _1859;
    float _1879 = _1790;
    if (!_1847)
    {
        _1871 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1881 = _1871;
    float _1883 = _1881;
    float _1885 = _1881;
    if (!_1847)
    {
        _1873 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1887 = _1873;
    float _1889 = _1887;
    float _1891 = _1887;
    if (!_1847)
    {
        _1875 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1893 = _1875;
    float _1895 = _1893;
    float _1897 = _1893;
    if (!_1847)
    {
        _1877 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1899 = _1877;
    float _1901 = _1899;
    float _1903 = _1899;
    if (!_1847)
    {
        _1879 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1905 = _1879;
    float _1907 = _1865 * _1808;
    float _1909 = _1819 * _1907;
    float _1911 = _1833 * _1907;
    float _1913 = fma(_1829, _1909, _1813);
    float _1915 = fma(_1831, _1909, _1815);
    float _1917 = _1819 * _1869;
    float _1919 = fma(_1819, _1911, _1817);
    float _1921 = _1909;
    float _1923 = _1905;
    float _1925 = _1905;
    if (!_1847)
    {
        _1921 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1927 = _1921;
    out.m_79.x = _1913;
    out.m_79.y = _1915;
    out.m_79.z = _1919;
    out.m_79.w = _1917;
    bool _1929 = !_1847;
    float _1931 = _1927;
    float _1933 = _1927;
    if (!_1929)
    {
        bool _1935 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1937 = isnan(_1518);
        bool _1939 = _1935 || _1937;
        bool _1941 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1943 = _1939 || _1941;
        if (!_1943)
        {
            float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1947 = _1518 + _1945;
            float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1951 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1949;
            float _1953 = 1.0 / _1951;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1975 = _1947 * _1953;
            float _1977 = precise::clamp(_1975, 0.0, 1.0);
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1983 = fma(_1977, _1957, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1985 = fma(_1977, _1981, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1987 = fma(_1977, _1961, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1989 = fma(_1977, _1965, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1991 = fma(_1977, _1969, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1993 = fma(_1977, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1903 = _1985;
            _1897 = _1991;
            _1933 = _1983;
            _1891 = _1989;
            _1885 = _1987;
            _1925 = _1993;
            _1995 = true;
        }
        else
        {
            bool _1997 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1999 = isnan(_1518);
            bool _2001 = _1997 || _1999;
            bool _2003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2005 = _2001 || _2003;
            if (!_2005)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2007 = _1931;
            _1933 = _2007;
            if (!_2005)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2009 = _1901;
            _1903 = _2009;
            if (!_2005)
            {
                _1883 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2011 = _1883;
            _1885 = _2011;
            if (!_2005)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2013 = _1889;
            _1891 = _2013;
            if (!_2005)
            {
                _1895 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2015 = _1895;
            _1897 = _2015;
            if (!_2005)
            {
                _1923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2017 = _1923;
            bool _2019 = !_2005;
            _1925 = _2017;
            if (!_2019)
            {
                bool _2021 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2023 = isnan(_1518);
                bool _2025 = _2021 || _2023;
                bool _2027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2029 = _2025 || _2027;
                if (!_2029)
                {
                    float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2033 = _1518 + _2031;
                    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2035;
                    float _2039 = 1.0 / _2037;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2061 = _2033 * _2039;
                    float _2063 = precise::clamp(_2061, 0.0, 1.0);
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2069 = fma(_2063, _2043, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2071 = fma(_2063, _2067, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2073 = fma(_2063, _2047, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2075 = fma(_2063, _2051, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2077 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2079 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1903 = _2071;
                    _1897 = _2077;
                    _1933 = _2069;
                    _1891 = _2075;
                    _1885 = _2073;
                    _1925 = _2079;
                    _1995 = true;
                }
                else
                {
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1897 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1885 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1995 = false;
    float _2081 = _1903;
    float _2083 = _1897;
    float _2085 = _1933;
    float _2087 = _1891;
    float _2089 = _1885;
    float _2091 = _1925;
    float _2093 = fma(_1308, -0.5, 0.5);
    float _2095 = precise::clamp(_2093, 0.0, 1.0);
    float _2097 = -_2081;
    float _2099 = _2097 + _2083;
    float _2101 = -_2085;
    float _2103 = _2101 + _2087;
    float _2105 = -_2089;
    float _2107 = _2105 + _2091;
    bool _2109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = fma(_2095, _2099, _2081);
    float _2113 = fma(_2095, _2103, _2085);
    float _2115 = fma(_2095, _2107, _2089);
    float _2117 = _2111 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _2119 = fma(_2113, 0.298911988735198974609375, _2117);
    float _2121 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2123 = fma(_2115, 0.114477999508380889892578125, _2119);
    out.m_49.x = _2121;
    float _2125 = -_2123;
    float _2127 = _2113 + _2125;
    float _2129 = -_2123;
    float _2131 = _2111 + _2129;
    float _2133 = -_2123;
    float _2135 = _2115 + _2133;
    out.m_83.x = 0.0;
    float _2137 = fma(_2127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2123);
    float _2139 = fma(_2131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2123);
    float _2141 = fma(_2135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2123);
    out.m_85.x = _2137;
    out.m_85.y = _2139;
    out.m_85.z = _2141;
    if (!_2109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2143 = -_1490;
    float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2147 = -_1492;
    float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2151 = -_1494;
    float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2155 = _2145 * _2145;
    float _2157 = fma(_2149, _2149, _2155);
    float _2159 = fma(_2153, _2153, _2157);
    float _2161 = rsqrt(_2159);
    float _2163 = _2145 * _2161;
    float _2165 = _2149 * _2161;
    float _2167 = _2153 * _2161;
    float _2169 = sqrt(_2159);
    float _2171 = -_1524;
    float _2173 = _2171 + _2163;
    float _2175 = -_1520;
    float _2177 = _2175 + _2165;
    float _2179 = -_1522;
    float _2181 = _2179 + _2167;
    float _2183 = _2173 * _2173;
    float _2185 = fma(_2177, _2177, _2183);
    float _2187 = fma(_2181, _2181, _2185);
    float _2189 = -_2169;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2193 = rsqrt(_2187);
    float _2195 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = abs(_2197);
    float _2201 = log2(_2199);
    float _2203 = _2173 * _2193;
    float _2205 = _2177 * _2193;
    float _2207 = _2181 * _2193;
    float _2209 = _1308 * _2203;
    float _2211 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = _1308 * _2163;
    float _2217 = fma(_1306, _2205, _2209);
    float _2219 = _2213 * _2213;
    float _2221 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2223 = fma(_1306, _2165, _2215);
    float _2225 = fma(_1310, _2207, _2217);
    float _2227 = precise::clamp(_2225, 0.0, 1.0);
    float _2229 = _2219 + (-1.0);
    float _2231 = fma(_1310, _2167, _2223);
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = _2227 * _2227;
    float _2237 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2239 = exp2(_2221);
    float _2241 = fma(_2235, _2229, 1.0);
    float _2243 = -_2163;
    float _2245 = -_2237;
    float _2247 = fma(_2243, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2245);
    float _2249 = _2241 * _2241;
    float _2251 = -_2167;
    float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2247);
    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2257 = _2253 + _2255;
    float _2259 = 1.0 / _2249;
    float _2261 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2263 = precise::clamp(_2261, 0.0, 1.0);
    float _2265 = _2239 * _2263;
    float _2267 = _2233 * _2265;
    float _2269 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2271 = _2219 * _2259;
    float _2273 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2275 = _2267 * _2271;
    float _2277 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2279 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2281 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2283 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2269;
    out.m_81.y = _2273;
    out.m_81.z = _2277;
    out.m_83.x = _2279;
    out.m_83.y = _2281;
    out.m_83.z = _2283;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1995 = false;
    bool _1360 = false;
    bool _352 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _2340 = as_type<float>(_120);
        out.gl_Position.z = _2340;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_51.w;
    float _126 = in.m_53.w;
    bool _128 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_124);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_124;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.w = _126;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_104);
        _114 = _144;
    }
    float _146 = _114;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2414 = as_type<float>(_160);
        out.gl_Position.z = _2414;
    }
    if (_152)
    {
        return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_104);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    bool _198 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _192 + _210;
    bool _214 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_192);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _232;
    float _252 = _244 * _248;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = 1.0 / _228;
    float _266 = _224 * _256;
    float _268 = -_224;
    float _270 = _268 + 1.0;
    float _272 = _212 * _250;
    float _274 = _196 * _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = fma(_260, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = fma(_282, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = _284 * _266;
    float _292 = _286 * _266;
    float _294 = _288 * _266;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _310 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _312 = fma(_298, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = fma(_302, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _316 = fma(_306, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_312, _252, _308);
    float _322 = fma(_314, _252, _310);
    float _324 = fma(_316, _252, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_262;
    float _350;
    if (!_332)
    {
        float _334 = in.m_53.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_104);
        float _356 = 1.0 / _354;
        float _358 = _140 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = in.m_57.x;
    float _364 = in.m_57.y;
    float _366 = in.m_57.z;
    float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _370 = log2(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _374 = _360 + _372;
    float _376 = in.m_53.x;
    float _378 = in.m_53.y;
    float _380 = in.m_53.z;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = _360 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _386;
    float _390 = in.m_46.x;
    float _392 = in.m_46.y;
    float _394 = in.m_46.z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _400 = 1.0 / _388;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _404 = _402 != 0;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _412 = _410 != 0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _414;
    bool _418 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _426 = _422 || _424;
    float _428 = 1.0 / _398;
    bool _430 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _432 = isnan(_360);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = _326 * _362;
    float _444 = _330 * _366;
    float _446 = _328 * _364;
    float _448 = 1.0 / _416;
    float _450 = _378 + _380;
    float _452 = _380 + _376;
    float _454 = _380 + (-0.5);
    float _456 = _380 * 2.0;
    float _458 = _370 * _140;
    float _460 = _378 + _376;
    float _462 = _376 + (-0.5);
    float _464 = _376 * 2.0;
    float _466 = exp2(_458);
    float _468 = _378 + (-0.5);
    float _470 = _378 * 2.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _474 = _360 + _472;
    float _476 = _392 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _478 = _392 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _480 = _392 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _482 = _474 * _400;
    float _484 = floor(_456);
    float _486 = in.m_59.x;
    float _488 = in.m_59.y;
    float _490 = in.m_59.z;
    float _492 = _450 + (-1.0);
    float _494 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].x, _476);
    float _496 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].x, _478);
    float _498 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].x, _480);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _502 = 1.0 + _500;
    float _504 = floor(_464);
    float _506 = _452 + (-1.0);
    bool _508 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _510 = isnan(1.0);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _516 = _512 || _514;
    float _518 = -_466;
    float _520 = _518 + 1.0;
    float _522 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _524 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _526 = _460 + (-1.0);
    float _528 = 1.0 / _502;
    bool _530 = _484 > 0.0;
    float _532 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _534 = _484 >= 0.0;
    bool _536 = isnan(_484);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _374 * _428;
    float _546 = _384 * _448;
    float _548 = floor(_470);
    int _550 = _542 ? 0 : 1;
    float _552 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _554 = _426 ? _520 : 0.0;
    float _556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _490);
    bool _558 = _504 > 0.0;
    float _560 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _562 = _504 >= 0.0;
    bool _564 = isnan(_504);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    int _574 = ~_550;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = _556 * _522;
    int _582 = _578;
    if (!_530)
    {
        int _584 = ~_550;
        int _586 = _584 + 1;
        _582 = _586;
    }
    int _588 = _582;
    float _590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _488);
    float _592 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_516)
    {
        float _594 = _554 * _528;
        _142 = _594;
    }
    float _596 = _142;
    float _598 = _572 * _560;
    float _600 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].z, _494);
    bool _602 = _548 > 0.0;
    float _604 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].z, _496);
    bool _606 = _548 >= 0.0;
    bool _608 = isnan(_548);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].z, _498);
    float _618 = _590 * _592;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _644 = fma(_630, _544, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _646 = fma(_634, _544, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _648 = fma(_626, _482, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _650 = fma(_642, _544, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _652 = fma(_622, _482, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _654 = fma(_638, _482, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _656 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _658 = isnan(_360);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _668;
    bool _672 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _674 = isnan(_360);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _688;
    float _692 = -_666;
    float _694 = _692 + 1.0;
    float _696 = fma(_670, _546, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _698 = fma(_686, _546, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _700 = fma(_690, _546, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _702 = _682 * _694;
    float _704 = -_682;
    float _706 = _704 + 1.0;
    bool _708 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _710 = isnan(_360);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _600 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = in.m_61.x;
    float _724 = in.m_61.y;
    float _726 = in.m_61.z;
    bool _728 = !_404;
    int _730 = _728 ? 0 : 1;
    float _732 = _440 * _706;
    bool _734 = !_408;
    int _736 = _734 ? 0 : 1;
    float _738 = _616 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _740 = abs(_730);
    float _742 = -_440;
    float _744 = _742 + 1.0;
    int _746 = _570 ? 0 : 1;
    float _748 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _750 = float(_740);
    float _752 = _718 * _744;
    int _754 = abs(_736);
    float _756 = float(_588);
    int _758 = ~_746;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    int _764 = _762;
    float _766 = _738;
    float _768 = _720;
    if (!_558)
    {
        int _770 = ~_746;
        int _772 = _770 + 1;
        _764 = _772;
    }
    int _774 = _764;
    float _776 = _750 * _756;
    float _778 = _652 * _752;
    float _780 = float(_774);
    float _782 = _776 * (-2.0);
    float _784 = float(_754);
    float _786 = _648 * _752;
    int _788 = _614 ? 0 : 1;
    float _790 = fma(_782, _722, _722);
    bool _792 = !_412;
    int _794 = _792 ? 0 : 1;
    float _796 = _784 * _780;
    float _798 = fma(_552, _782, _552);
    float _800 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[196].x, _790);
    int _802 = ~_788;
    int _804 = _802 + 1;
    int _806 = _804 + 1;
    float _808 = _796 * (-2.0);
    int _810 = abs(_794);
    float _812 = _654 * _752;
    int _814 = _806;
    float _816 = _786;
    if (!_602)
    {
        int _818 = ~_788;
        int _820 = _818 + 1;
        _814 = _820;
    }
    int _822 = _814;
    float _824 = in.m_63.x;
    float _826 = in.m_63.y;
    float _828 = in.m_63.z;
    float _830 = fma(_524, _808, _524);
    float _832 = fma(_808, _724, _724);
    float _834 = float(_810);
    float _836 = -_718;
    float _838 = _836 + 1.0;
    float _840 = float(_822);
    float _842 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[196].y, _832);
    bool _844 = _488 != 0.0;
    bool _846 = isnan(_488);
    bool _848 = _844 || _846;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    float _854 = fma(_798, _596, _800);
    float _856 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[107].x, _778);
    float _858 = _834 * _840;
    bool _860 = _486 == 0.0;
    bool _862 = !_852;
    bool _864 = _860 && _862;
    float _866 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[107].y, _786);
    float _868 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[107].z, _812);
    float _870 = _858 * (-2.0);
    bool _872 = _490 == 0.0;
    bool _874 = _872 && _864;
    float _876 = fma(_830, _596, _842);
    float _878 = _854 * 0.15915493667125701904296875;
    float _880 = fma(_870, _726, _726);
    float _882 = in.m_65.x;
    float _884 = in.m_65.y;
    float _886 = in.m_65.z;
    float _888 = in.m_65.w;
    float _890 = fma(_532, _870, _532);
    float _892 = _876 * 0.15915493667125701904296875;
    float _894 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _896 = _878 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = fma(_644, _732, _856);
    float _902 = fma(_646, _732, _866);
    float _904 = fma(_890, _596, _894);
    float _906 = fma(_650, _732, _868);
    float _908 = _876;
    float _910 = _890;
    float _912 = _880;
    float _914 = _858;
    if (_874)
    {
        _908 = _828;
    }
    float _916 = _908;
    float _918 = fma(_698, _702, _902);
    float _920 = _916;
    if (_874)
    {
        _816 = _826;
    }
    float _922 = _816;
    float _924 = _904 * 0.15915493667125701904296875;
    float _926 = _922;
    if (_874)
    {
        _910 = _916;
    }
    float _928 = _910;
    float _930 = _878 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _928;
    if (_874)
    {
        _912 = _922;
    }
    float _936 = _912;
    float _938 = fma(_700, _702, _906);
    float _940 = _936;
    if (!_874)
    {
        _920 = _828;
    }
    float _942 = _920;
    if (!_874)
    {
        _926 = _826;
    }
    float _944 = _926;
    if (_874)
    {
        _914 = _824;
    }
    float _946 = _914;
    float _948 = _892 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = _946;
    if (!_874)
    {
        float _954 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _942);
        _934 = _954;
    }
    float _956 = _934;
    float _958 = _882 * _944;
    float _960 = _886 * _824;
    if (!_874)
    {
        float _962 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _824);
        _952 = _962;
    }
    float _964 = _952;
    float _966 = fma(_696, _702, _900);
    if (!_874)
    {
        float _968 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _944);
        _940 = _968;
    }
    float _970 = _940;
    float _972 = -_958;
    float _974 = fma(_884, _824, _972);
    float _976 = _892 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _884 * _942;
    float _982 = -_960;
    float _984 = fma(_882, _942, _982);
    float _986 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].x, _966);
    float _988 = -_980;
    float _990 = fma(_886, _944, _988);
    float _992 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].y, _918);
    float _994 = _984 * _888;
    float _996 = _924 * 6.283185482025146484375;
    float _998 = cos(_996);
    float _1000 = _932 * _950;
    float _1002 = _898 * _950;
    float _1004 = _990 * _888;
    float _1006 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].z, _938);
    float _1008 = _924 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = _932 * _978;
    float _1014 = _932 * _998;
    float _1016 = _898 * _978;
    float _1018 = _898 * _998;
    float _1020 = _978 * _998;
    float _1022 = _950 * _998;
    float _1024 = _1014 * _618;
    float _1026 = _1018 * _618;
    float _1028 = _1014 * _884;
    float _1030 = fma(_1010, _1012, _1002);
    float _1032 = -_618;
    float _1034 = _1010 * _1032;
    float _1036 = -_1000;
    float _1038 = fma(_1010, _1016, _1036);
    float _1040 = -_1016;
    float _1042 = fma(_1010, _1000, _1040);
    float _1044 = fma(_1030, _598, _1024);
    float _1046 = fma(_1020, _598, _1034);
    float _1048 = fma(_1038, _598, _1026);
    float _1050 = fma(_1010, _1002, _1012);
    float _1052 = fma(_1042, _580, _1044);
    float _1054 = _974 * _888;
    float _1056 = fma(_1022, _580, _1046);
    float _1058 = -_884;
    float _1060 = _1010 * _1058;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1064 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1066 = fma(_1050, _580, _1048);
    float _1068 = fma(_1020, _882, _1060);
    float _1070 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1062);
    float _1072 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1064);
    float _1074 = -_970;
    float _1076 = _1010 * _1074;
    float _1078 = -_994;
    float _1080 = _1010 * _1078;
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1070);
    float _1084 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1072);
    float _1086 = _1018 * _884;
    float _1088 = fma(_1020, _964, _1076);
    float _1090 = _720 + _1082;
    float _1092 = _738 + _1084;
    float _1094 = fma(_1020, _1004, _1080);
    float _1096 = _1014 * _970;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1100 = _1090 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1104 = _1092 + _1102;
    float _1106 = _1018 * _970;
    float _1108 = _1014 * _994;
    float _1110 = _1100 * _1100;
    float _1112 = _1104 * _1104;
    float _1114 = _1018 * _994;
    float _1116 = fma(_1030, _964, _1096);
    float _1118 = fma(_1038, _964, _1106);
    float _1120 = _1110 + _1112;
    float _1122 = fma(_1030, _882, _1028);
    float _1124 = fma(_1038, _882, _1086);
    float _1126 = fma(_1030, _1004, _1108);
    float _1128 = sqrt(_1120);
    float _1130 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1132 = fma(_1038, _1004, _1114);
    float _1134 = fma(_1022, _956, _1088);
    float _1136 = fma(_1042, _956, _1116);
    float _1138 = fma(_1050, _956, _1118);
    float _1140 = fma(_1042, _1054, _1126);
    float _1142 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1130);
    float _1144 = fma(_1042, _886, _1122);
    float _1146 = fma(_1022, _886, _1068);
    float _1148 = fma(_1050, _886, _1124);
    float _1150 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1142);
    float _1152 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1154 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1156 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1158 = fma(_1050, _1054, _1132);
    bool _1160 = _1128 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1164 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1166 = _748 + _1150;
    float _1168 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1170 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1162);
    float _1172 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1164);
    float _1174 = fma(_1022, _1054, _1094);
    float _1176 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1152);
    float _1178 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1154);
    float _1180 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1156);
    float _1182 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1168);
    float _1184 = _1056;
    float _1186 = _1110;
    float _1188 = _1112;
    float _1190 = _1092;
    float _1192 = _1090;
    float _1194 = _1172;
    if (!_1160)
    {
        _1184 = _1166;
    }
    float _1196 = _1184;
    bool _1198 = !_1160;
    float _1200 = _1196;
    if (!_1198)
    {
        float _1202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1206 = _1128 + _1204;
        float _1208 = _1166 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = rsqrt(_1120);
        float _1212 = _1206 * _1202;
        float _1214 = _1212 * 0.15915493667125701904296875;
        float _1216 = _1214 * 6.283185482025146484375;
        float _1218 = sin(_1216);
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = cos(_1220);
        float _1224 = fma(_1218, _1208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1226 = _1210 * _1224;
        float _1228 = _1222 + (-1.0);
        float _1230 = fma(_1100, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1232 = fma(_1104, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1234 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1238 = _1230 + _1236;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1242 = _1232 + _1240;
        float _1244 = fma(_1166, _1222, _1234);
        float _1246 = _1238 * _1238;
        float _1248 = _1242 * _1242;
        _1200 = _1244;
        _1186 = _1246;
        _1188 = _1248;
        _1190 = _1232;
        _1192 = _1230;
    }
    float _1250 = _1200;
    float _1252 = _1186;
    float _1254 = _1188;
    float _1256 = _1190;
    float _1258 = _1192;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1262 = _1250 + _1260;
    float _1264 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1266 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1268 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1270 = fma(_1262, _1262, _1252);
    float _1272 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1264);
    float _1274 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1266);
    float _1276 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1268);
    float _1278 = _1270 + _1254;
    float _1280 = _986 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1282 = _992 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1284 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1286 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1272);
    float _1288 = fma(_1148, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1170);
    float _1290 = sqrt(_1278);
    float _1292 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1274);
    float _1294 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1276);
    float _1296 = fma(_1148, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1172);
    float _1298 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = fma(_1148, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1182);
    float _1304 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1176);
    float _1308 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1178);
    float _1310 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1180);
    out.m_67.x = _1288;
    out.m_67.y = _1296;
    out.m_67.z = _1302;
    out.m_69.x = _1298;
    out.m_69.y = _1300;
    out.m_69.z = _1304;
    bool _1312 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1314 = isnan(_1290);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1320 = _1316 || _1318;
    out.m_71.x = _1286;
    out.m_71.y = _1292;
    out.m_71.z = _1294;
    out.m_73.x = _1306;
    out.m_73.y = _1308;
    out.m_73.z = _1310;
    float _1322 = _1296;
    float _1324 = _1294;
    if (!_1320)
    {
        _1194 = 1.0;
    }
    float _1326 = _1194;
    bool _1328 = !_1320;
    float _1330 = _1326;
    if (!_1328)
    {
        bool _1332 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1334 = isnan(_1290);
        bool _1336 = _1332 || _1334;
        bool _1338 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1340 = _1336 || _1338;
        if (!_1340)
        {
            float _1342 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1344 = _1290 + _1342;
            float _1346 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1348 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1346;
            float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1352 = _1350 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1354 = 1.0 / _1348;
            float _1356 = _1344 * _1354;
            float _1358 = fma(_1356, _1352, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1330 = _1358;
            _1322 = _1354;
            _1360 = true;
        }
        else
        {
            bool _1362 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1364 = isnan(_1290);
            bool _1366 = _1362 || _1364;
            bool _1368 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1370 = _1366 || _1368;
            if (!_1370)
            {
                float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1374 = _1290 + _1372;
                float _1376 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1378 = _1376 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1380 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1382 = _1380 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1384 = 1.0 / _1378;
                float _1386 = _1374 * _1384;
                float _1388 = fma(_1386, _1382, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1330 = _1388;
                _1322 = _1384;
                _1360 = true;
            }
            else
            {
                _1330 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1360 = false;
    float _1390 = _1330;
    float _1392 = _1322;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1250 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1400 = _1256 + _1398;
    bool _1402 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.5);
    bool _1410 = _1406 || _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1414 = _1258 + _1412;
    float _1416 = fma(_1396, _1390, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1418 = fma(_1400, _1390, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1420 = fma(_1414, _1390, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1422 = _1414;
    float _1424 = _1392;
    float _1426 = _1396;
    if (_1410)
    {
        _1422 = _1420;
    }
    float _1428 = _1422;
    float _1430 = _1428;
    if (_1410)
    {
        _1424 = _1416;
    }
    float _1432 = _1424;
    float _1434 = _1432;
    if (_1410)
    {
        _1426 = _1418;
    }
    float _1436 = _1426;
    float _1438 = _1436;
    if (!_1410)
    {
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1442 = _748 + _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1446 = _720 + _1444;
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1450 = _1442 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1454 = _738 + _1452;
        float _1456 = fma(_1446, _1446, _1450);
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1460 = fma(_1454, _1454, _1456);
        float _1462 = sqrt(_1460);
        float _1464 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = -_748;
        float _1468 = _1466 + _1416;
        float _1470 = precise::min(_1462, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1472 = _1470 * _1458;
        float _1474 = -_720;
        float _1476 = _1474 + _1420;
        float _1478 = -_738;
        float _1480 = _1478 + _1418;
        float _1482 = _1464 * _1472;
        float _1484 = fma(_1476, _1482, _720);
        float _1486 = fma(_1468, _1482, _748);
        float _1488 = fma(_1480, _1482, _738);
        _1434 = _1486;
        _1430 = _1484;
        _1438 = _1488;
        _1324 = _1480;
    }
    float _1490 = _1434;
    float _1492 = _1430;
    float _1494 = _1438;
    float _1496 = _1324;
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1500 = _1490 + _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1504 = _1492 + _1502;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1508 = _1494 + _1506;
    float _1510 = _1500 * _1500;
    float _1512 = fma(_1504, _1504, _1510);
    float _1514 = fma(_1508, _1508, _1512);
    float _1516 = rsqrt(_1514);
    float _1518 = sqrt(_1514);
    float _1520 = _1504 * _1516;
    float _1522 = _1508 * _1516;
    float _1524 = _1500 * _1516;
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1528 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1530 = _1526 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 + _1532;
    float _1536 = sqrt(_1534);
    bool _1538 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = _1536 + _1540;
    float _1544 = _1496;
    float _1546 = _1542;
    float _1548 = _1526;
    if (_1538)
    {
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1550;
    }
    float _1552 = _1544;
    if (_1538)
    {
        float _1554 = _1542 * _1552;
        _1546 = _1554;
    }
    float _1556 = _1546;
    if (_1538)
    {
        float _1558 = _1556 * 0.15915493667125701904296875;
        _766 = _1558;
    }
    float _1560 = _766;
    float _1562 = _748;
    float _1564 = _1560;
    if (_1538)
    {
        float _1566 = _1560 * 6.283185482025146484375;
        float _1568 = sin(_1566);
        _1562 = _1568;
    }
    float _1570 = _1562;
    float _1572 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1574 = precise::max(0.0, _1572);
    float _1576 = _1552;
    float _1578 = _1574;
    if (_1538)
    {
        float _1580 = _1560 * 6.283185482025146484375;
        float _1582 = cos(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = -_1524;
    float _1588 = -_1574;
    float _1590 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1588);
    float _1592 = _1572;
    if (_1538)
    {
        float _1594 = rsqrt(_1534);
        _1592 = _1594;
    }
    float _1596 = _1592;
    if (_1538)
    {
        float _1598 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1598;
    }
    float _1600 = _1578;
    float _1602 = _1570;
    float _1604 = _1600;
    if (_1538)
    {
        float _1606 = fma(_1570, _1600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _768 = _1606;
    }
    float _1608 = _768;
    float _1610 = _1608;
    if (!_1538)
    {
        _1602 = _1590;
    }
    float _1612 = _1602;
    float _1614 = _1612;
    float _1616 = _1584;
    if (_1538)
    {
        float _1618 = _1584 + (-1.0);
        _1604 = _1618;
    }
    float _1620 = _1604;
    float _1622 = _1620;
    if (_1538)
    {
        float _1624 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1624;
    }
    float _1626 = _1564;
    if (!_1538)
    {
        _1622 = _1530;
    }
    float _1628 = _1622;
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1632 = _1596;
    float _1634 = _1628;
    if (_1538)
    {
        float _1636 = _1596 * _1608;
        _1610 = _1636;
    }
    float _1638 = _1610;
    if (!_1538)
    {
        _1632 = _1528;
    }
    float _1640 = _1632;
    float _1642 = _1640;
    if (_1538)
    {
        float _1644 = fma(_1590, _1584, _1626);
        _1614 = _1644;
    }
    float _1646 = _1614;
    if (!_1538)
    {
        _1616 = _1532;
    }
    float _1648 = _1616;
    float _1650 = _1648;
    if (_1538)
    {
        float _1652 = _1526 * _1638;
        _1548 = _1652;
    }
    float _1654 = _1548;
    if (_1538)
    {
        float _1656 = _1528 * _1638;
        _1642 = _1656;
    }
    float _1658 = _1642;
    float _1660 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1538)
    {
        float _1662 = _1654 * _1654;
        _1634 = _1662;
    }
    float _1664 = _1634;
    if (_1538)
    {
        float _1666 = _1658 * _1658;
        _1650 = _1666;
    }
    float _1668 = _1650;
    float _1670 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1660);
    float _1672 = fma(_1646, _1646, _1664);
    float _1674 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1670);
    float _1676 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1678 = _1672 + _1668;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1682 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1680);
    float _1684 = precise::clamp(_1682, 0.0, 1.0);
    float _1686 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1690 = rsqrt(_1678);
    float _1692 = -_1684;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1698 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1676);
    float _1700 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1702 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1704 = abs(_1694);
    float _1706 = log2(_1704);
    float _1708 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1696);
    float _1710 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1698);
    float _1712 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1700);
    float _1714 = -_1702;
    float _1716 = fma(_1714, _1630, 1.0);
    float _1718 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1722 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1712);
    float _1724 = _1690 * _1654;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = _1690 * _1646;
    float _1730 = _1690 * _1658;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1734 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1736 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1738 = log2(_1716);
    float _1740 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1742 = -_1732;
    float _1744 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1742);
    float _1746 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1748 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1750 = -_1730;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1744);
    float _1754 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1756 = exp2(_1740);
    float _1758 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = fma(_1752, -0.5, 0.5);
    float _1762 = fma(_1752, 0.5, 0.5);
    float _1764 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1748);
    float _1766 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1768 = _1728 + 1.0;
    float _1770 = fma(_1762, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1772 = 1.0 / _1754;
    float _1774 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1766);
    float _1776 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1778 = fma(_1762, _1770, -0.212114393711090087890625);
    float _1780 = _1738 * 0.693147182464599609375;
    float _1782 = fma(_1762, _1778, 1.570728778839111328125);
    float _1784 = sqrt(_1760);
    float _1786 = -_1728;
    float _1788 = fma(_1756, _1768, _1786);
    float _1790 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1774);
    float _1792 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1776);
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1796 = fma(_1788, 0.5, 0.5);
    float _1798 = _1790 * _1772;
    float _1800 = _1792 * _1772;
    float _1802 = fma(_1798, 0.5, 0.5);
    float _1804 = fma(_1800, -0.5, 0.5);
    float _1806 = _1784 * 0.636619746685028076171875;
    float3 _5091 = float3(_1802, _1804, _1794);
    float _1808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5091, float3(0.0), isnan(_5091)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5091, float3(0.0), isnan(_5091)), level(0.0)).x;
    float3 _5102 = float3(_1802, _1804, _1794);
    float4 _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5102, float3(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5102, float3(0.0), isnan(_5102)), level(0.0)).xyzw;
    float _1813 = _1811.x;
    float _1815 = _1811.y;
    float _1817 = _1811.z;
    float _1819 = _1811.w;
    float _1821 = -_1782;
    float _1823 = fma(_1806, _1821, 1.0);
    float2 _5124 = float2(_1823, _1796);
    float3 _1827 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5124, float2(0.0), isnan(_5124)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5124, float2(0.0), isnan(_5124)), level(0.0)).xyz;
    float _1829 = _1827.x;
    float _1831 = _1827.y;
    float _1833 = _1827.z;
    float _1835 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1837 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1492;
    out.m_75.y = _1490;
    out.m_75.z = _1494;
    bool _1839 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1841 = isnan(_1518);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1847 = _1843 || _1845;
    float _1849 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1837);
    float _1851 = exp2(_1835);
    float _1853 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1849);
    float _1855 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1857 = _1855 + _1754;
    out.gl_Position.x = _1790;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1754;
    float _1859 = _1857 * 0.5;
    float _1861 = -_1851;
    float _1863 = _1861 + 1.0;
    float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1859;
    out.m_77.w = _1754;
    float _1867 = -_1865;
    float _1869 = _1867 + 1.0;
    float _1871 = _1754;
    float _1873 = _1855;
    float _1875 = _1792;
    float _1877 = _1859;
    float _1879 = _1790;
    if (!_1847)
    {
        _1871 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1881 = _1871;
    float _1883 = _1881;
    float _1885 = _1881;
    if (!_1847)
    {
        _1873 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1887 = _1873;
    float _1889 = _1887;
    float _1891 = _1887;
    if (!_1847)
    {
        _1875 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1893 = _1875;
    float _1895 = _1893;
    float _1897 = _1893;
    if (!_1847)
    {
        _1877 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1899 = _1877;
    float _1901 = _1899;
    float _1903 = _1899;
    if (!_1847)
    {
        _1879 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1905 = _1879;
    float _1907 = _1865 * _1808;
    float _1909 = _1819 * _1907;
    float _1911 = _1833 * _1907;
    float _1913 = fma(_1829, _1909, _1813);
    float _1915 = fma(_1831, _1909, _1815);
    float _1917 = _1819 * _1869;
    float _1919 = fma(_1819, _1911, _1817);
    float _1921 = _1909;
    float _1923 = _1905;
    float _1925 = _1905;
    if (!_1847)
    {
        _1921 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1927 = _1921;
    out.m_79.x = _1913;
    out.m_79.y = _1915;
    out.m_79.z = _1919;
    out.m_79.w = _1917;
    bool _1929 = !_1847;
    float _1931 = _1927;
    float _1933 = _1927;
    if (!_1929)
    {
        bool _1935 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1937 = isnan(_1518);
        bool _1939 = _1935 || _1937;
        bool _1941 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1943 = _1939 || _1941;
        if (!_1943)
        {
            float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1947 = _1518 + _1945;
            float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1951 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1949;
            float _1953 = 1.0 / _1951;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1975 = _1947 * _1953;
            float _1977 = precise::clamp(_1975, 0.0, 1.0);
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1983 = fma(_1977, _1957, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1985 = fma(_1977, _1981, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1987 = fma(_1977, _1961, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1989 = fma(_1977, _1965, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1991 = fma(_1977, _1969, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1993 = fma(_1977, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1903 = _1985;
            _1897 = _1991;
            _1933 = _1983;
            _1891 = _1989;
            _1885 = _1987;
            _1925 = _1993;
            _1995 = true;
        }
        else
        {
            bool _1997 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1999 = isnan(_1518);
            bool _2001 = _1997 || _1999;
            bool _2003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2005 = _2001 || _2003;
            if (!_2005)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2007 = _1931;
            _1933 = _2007;
            if (!_2005)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2009 = _1901;
            _1903 = _2009;
            if (!_2005)
            {
                _1883 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2011 = _1883;
            _1885 = _2011;
            if (!_2005)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2013 = _1889;
            _1891 = _2013;
            if (!_2005)
            {
                _1895 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2015 = _1895;
            _1897 = _2015;
            if (!_2005)
            {
                _1923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2017 = _1923;
            bool _2019 = !_2005;
            _1925 = _2017;
            if (!_2019)
            {
                bool _2021 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2023 = isnan(_1518);
                bool _2025 = _2021 || _2023;
                bool _2027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2029 = _2025 || _2027;
                if (!_2029)
                {
                    float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2033 = _1518 + _2031;
                    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2035;
                    float _2039 = 1.0 / _2037;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2061 = _2033 * _2039;
                    float _2063 = precise::clamp(_2061, 0.0, 1.0);
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2069 = fma(_2063, _2043, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2071 = fma(_2063, _2067, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2073 = fma(_2063, _2047, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2075 = fma(_2063, _2051, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2077 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2079 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1903 = _2071;
                    _1897 = _2077;
                    _1933 = _2069;
                    _1891 = _2075;
                    _1885 = _2073;
                    _1925 = _2079;
                    _1995 = true;
                }
                else
                {
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1897 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1885 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1995 = false;
    float _2081 = _1903;
    float _2083 = _1897;
    float _2085 = _1933;
    float _2087 = _1891;
    float _2089 = _1885;
    float _2091 = _1925;
    float _2093 = fma(_1308, -0.5, 0.5);
    float _2095 = precise::clamp(_2093, 0.0, 1.0);
    float _2097 = -_2081;
    float _2099 = _2097 + _2083;
    float _2101 = -_2085;
    float _2103 = _2101 + _2087;
    float _2105 = -_2089;
    float _2107 = _2105 + _2091;
    bool _2109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = fma(_2095, _2099, _2081);
    float _2113 = fma(_2095, _2103, _2085);
    float _2115 = fma(_2095, _2107, _2089);
    float _2117 = _2111 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _2119 = fma(_2113, 0.298911988735198974609375, _2117);
    float _2121 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2123 = fma(_2115, 0.114477999508380889892578125, _2119);
    out.m_49.x = _2121;
    float _2125 = -_2123;
    float _2127 = _2113 + _2125;
    float _2129 = -_2123;
    float _2131 = _2111 + _2129;
    float _2133 = -_2123;
    float _2135 = _2115 + _2133;
    out.m_83.x = 0.0;
    float _2137 = fma(_2127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2123);
    float _2139 = fma(_2131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2123);
    float _2141 = fma(_2135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2123);
    out.m_85.x = _2137;
    out.m_85.y = _2139;
    out.m_85.z = _2141;
    if (!_2109)
    {
        return out;
    }
    float _2143 = -_1490;
    float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2147 = -_1492;
    float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2151 = -_1494;
    float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2155 = _2145 * _2145;
    float _2157 = fma(_2149, _2149, _2155);
    float _2159 = fma(_2153, _2153, _2157);
    float _2161 = rsqrt(_2159);
    float _2163 = _2145 * _2161;
    float _2165 = _2149 * _2161;
    float _2167 = _2153 * _2161;
    float _2169 = sqrt(_2159);
    float _2171 = -_1524;
    float _2173 = _2171 + _2163;
    float _2175 = -_1520;
    float _2177 = _2175 + _2165;
    float _2179 = -_1522;
    float _2181 = _2179 + _2167;
    float _2183 = _2173 * _2173;
    float _2185 = fma(_2177, _2177, _2183);
    float _2187 = fma(_2181, _2181, _2185);
    float _2189 = -_2169;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2193 = rsqrt(_2187);
    float _2195 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = abs(_2197);
    float _2201 = log2(_2199);
    float _2203 = _2173 * _2193;
    float _2205 = _2177 * _2193;
    float _2207 = _2181 * _2193;
    float _2209 = _1308 * _2203;
    float _2211 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = _1308 * _2163;
    float _2217 = fma(_1306, _2205, _2209);
    float _2219 = _2213 * _2213;
    float _2221 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2223 = fma(_1306, _2165, _2215);
    float _2225 = fma(_1310, _2207, _2217);
    float _2227 = precise::clamp(_2225, 0.0, 1.0);
    float _2229 = _2219 + (-1.0);
    float _2231 = fma(_1310, _2167, _2223);
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = _2227 * _2227;
    float _2237 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2239 = exp2(_2221);
    float _2241 = fma(_2235, _2229, 1.0);
    float _2243 = -_2163;
    float _2245 = -_2237;
    float _2247 = fma(_2243, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2245);
    float _2249 = _2241 * _2241;
    float _2251 = -_2167;
    float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2247);
    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2257 = _2253 + _2255;
    float _2259 = 1.0 / _2249;
    float _2261 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2263 = precise::clamp(_2261, 0.0, 1.0);
    float _2265 = _2239 * _2263;
    float _2267 = _2233 * _2265;
    float _2269 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2271 = _2219 * _2259;
    float _2273 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2275 = _2267 * _2271;
    float _2277 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2279 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2281 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2283 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2269;
    out.m_81.y = _2273;
    out.m_81.z = _2277;
    out.m_83.x = _2279;
    out.m_83.y = _2281;
    out.m_83.z = _2283;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1995 = false;
    bool _1360 = false;
    bool _352 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
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
        out.m_49.x = 0.0;
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
        float _2340 = as_type<float>(_120);
        out.gl_Position.z = _2340;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_51.w;
    float _126 = in.m_53.w;
    bool _128 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_124);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_124;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.w = _126;
    float _142 = _140;
    if (_136)
    {
        float _144 = float(_104);
        _114 = _144;
    }
    float _146 = _114;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    float _154 = _146;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2414 = as_type<float>(_160);
        out.gl_Position.z = _2414;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_53.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_104);
        float _188 = 1.0 / _186;
        float _190 = _140 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = _192 + _194;
    bool _198 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _200 = isnan(_192);
    bool _202 = _198 || _200;
    bool _204 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _206 = _202 || _204;
    float _208 = float(_206);
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _192 + _210;
    bool _214 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _216 = isnan(_192);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _230 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _234 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_192);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -_208;
    float _248 = _246 + 1.0;
    float _250 = 1.0 / _232;
    float _252 = _244 * _248;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _258;
    bool _262 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _264 = 1.0 / _228;
    float _266 = _224 * _256;
    float _268 = -_224;
    float _270 = _268 + 1.0;
    float _272 = _212 * _250;
    float _274 = _196 * _264;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _280;
    float _284 = fma(_260, _274, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _286 = fma(_278, _274, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _288 = fma(_282, _274, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _290 = _284 * _266;
    float _292 = _286 * _266;
    float _294 = _288 * _266;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _308 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].x, _290);
    float _310 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].y, _292);
    float _312 = fma(_298, _272, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _314 = fma(_302, _272, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _316 = fma(_306, _272, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _318 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[143].z, _294);
    float _320 = fma(_312, _252, _308);
    float _322 = fma(_314, _252, _310);
    float _324 = fma(_316, _252, _318);
    float _326 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].x, _320);
    float _328 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].y, _322);
    float _330 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[145].z, _324);
    bool _332 = !_262;
    float _350;
    if (!_332)
    {
        float _334 = in.m_53.x;
        float _336 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _338 = _334 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _340 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[11].x, _140);
        float _342 = _340 * _336;
        float _344 = floor(_342);
        float _346 = -_344;
        float _348 = _342 + _346;
        _350 = _348;
        _352 = true;
    }
    else
    {
        float _354 = float(_104);
        float _356 = 1.0 / _354;
        float _358 = _140 * _356;
        _350 = _358;
    }
    _352 = false;
    float _360 = _350;
    float _362 = in.m_57.x;
    float _364 = in.m_57.y;
    float _366 = in.m_57.z;
    float _368 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _370 = log2(_368);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _374 = _360 + _372;
    float _376 = in.m_53.x;
    float _378 = in.m_53.y;
    float _380 = in.m_53.z;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _384 = _360 + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _386;
    float _390 = in.m_46.x;
    float _392 = in.m_46.y;
    float _394 = in.m_46.z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _400 = 1.0 / _388;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _404 = _402 != 0;
    int _406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _408 = _406 != 0;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _412 = _410 != 0;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _414;
    bool _418 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _426 = _422 || _424;
    float _428 = 1.0 / _398;
    bool _430 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _432 = isnan(_360);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = _326 * _362;
    float _444 = _330 * _366;
    float _446 = _328 * _364;
    float _448 = 1.0 / _416;
    float _450 = _378 + _380;
    float _452 = _380 + _376;
    float _454 = _380 + (-0.5);
    float _456 = _380 * 2.0;
    float _458 = _370 * _140;
    float _460 = _378 + _376;
    float _462 = _376 + (-0.5);
    float _464 = _376 * 2.0;
    float _466 = exp2(_458);
    float _468 = _378 + (-0.5);
    float _470 = _378 * 2.0;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _474 = _360 + _472;
    float _476 = _392 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _478 = _392 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _480 = _392 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _482 = _474 * _400;
    float _484 = floor(_456);
    float _486 = in.m_59.x;
    float _488 = in.m_59.y;
    float _490 = in.m_59.z;
    float _492 = _450 + (-1.0);
    float _494 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[4].x, _476);
    float _496 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[5].x, _478);
    float _498 = fma(_390, (*spvDescriptorSet0.vp_c10)._m0[6].x, _480);
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _502 = 1.0 + _500;
    float _504 = floor(_464);
    float _506 = _452 + (-1.0);
    bool _508 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _510 = isnan(1.0);
    bool _512 = _508 || _510;
    bool _514 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _516 = _512 || _514;
    float _518 = -_466;
    float _520 = _518 + 1.0;
    float _522 = _444 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _524 = fma(_492, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _526 = _460 + (-1.0);
    float _528 = 1.0 / _502;
    bool _530 = _484 > 0.0;
    float _532 = fma(_506, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _534 = _484 >= 0.0;
    bool _536 = isnan(_484);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = _374 * _428;
    float _546 = _384 * _448;
    float _548 = floor(_470);
    int _550 = _542 ? 0 : 1;
    float _552 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _554 = _426 ? _520 : 0.0;
    float _556 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _490);
    bool _558 = _504 > 0.0;
    float _560 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _562 = _504 >= 0.0;
    bool _564 = isnan(_504);
    bool _566 = _562 || _564;
    bool _568 = isnan(0.0);
    bool _570 = _566 || _568;
    float _572 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    int _574 = ~_550;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = _556 * _522;
    int _582 = _578;
    if (!_530)
    {
        int _584 = ~_550;
        int _586 = _584 + 1;
        _582 = _586;
    }
    int _588 = _582;
    float _590 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _488);
    float _592 = _446 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    if (_516)
    {
        float _594 = _554 * _528;
        _142 = _594;
    }
    float _596 = _142;
    float _598 = _572 * _560;
    float _600 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[4].z, _494);
    bool _602 = _548 > 0.0;
    float _604 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[5].z, _496);
    bool _606 = _548 >= 0.0;
    bool _608 = isnan(_548);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = fma(_394, (*spvDescriptorSet0.vp_c10)._m0[6].z, _498);
    float _618 = _590 * _592;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _624;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _630 = _628 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _642 = _640 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _644 = fma(_630, _544, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _646 = fma(_634, _544, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _648 = fma(_626, _482, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _650 = fma(_642, _544, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _652 = fma(_622, _482, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _654 = fma(_638, _482, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _656 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _658 = isnan(_360);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _668;
    bool _672 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _674 = isnan(_360);
    bool _676 = _672 || _674;
    bool _678 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _684;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _688;
    float _692 = -_666;
    float _694 = _692 + 1.0;
    float _696 = fma(_670, _546, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _698 = fma(_686, _546, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _700 = fma(_690, _546, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _702 = _682 * _694;
    float _704 = -_682;
    float _706 = _704 + 1.0;
    bool _708 = _360 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _710 = isnan(_360);
    bool _712 = _708 || _710;
    bool _714 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    float _720 = _600 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _722 = in.m_61.x;
    float _724 = in.m_61.y;
    float _726 = in.m_61.z;
    bool _728 = !_404;
    int _730 = _728 ? 0 : 1;
    float _732 = _440 * _706;
    bool _734 = !_408;
    int _736 = _734 ? 0 : 1;
    float _738 = _616 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _740 = abs(_730);
    float _742 = -_440;
    float _744 = _742 + 1.0;
    int _746 = _570 ? 0 : 1;
    float _748 = _604 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _750 = float(_740);
    float _752 = _718 * _744;
    int _754 = abs(_736);
    float _756 = float(_588);
    int _758 = ~_746;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    int _764 = _762;
    float _766 = _738;
    float _768 = _720;
    if (!_558)
    {
        int _770 = ~_746;
        int _772 = _770 + 1;
        _764 = _772;
    }
    int _774 = _764;
    float _776 = _750 * _756;
    float _778 = _652 * _752;
    float _780 = float(_774);
    float _782 = _776 * (-2.0);
    float _784 = float(_754);
    float _786 = _648 * _752;
    int _788 = _614 ? 0 : 1;
    float _790 = fma(_782, _722, _722);
    bool _792 = !_412;
    int _794 = _792 ? 0 : 1;
    float _796 = _784 * _780;
    float _798 = fma(_552, _782, _552);
    float _800 = fma(_462, (*spvDescriptorSet0.vp_c9)._m0[196].x, _790);
    int _802 = ~_788;
    int _804 = _802 + 1;
    int _806 = _804 + 1;
    float _808 = _796 * (-2.0);
    int _810 = abs(_794);
    float _812 = _654 * _752;
    int _814 = _806;
    float _816 = _786;
    if (!_602)
    {
        int _818 = ~_788;
        int _820 = _818 + 1;
        _814 = _820;
    }
    int _822 = _814;
    float _824 = in.m_63.x;
    float _826 = in.m_63.y;
    float _828 = in.m_63.z;
    float _830 = fma(_524, _808, _524);
    float _832 = fma(_808, _724, _724);
    float _834 = float(_810);
    float _836 = -_718;
    float _838 = _836 + 1.0;
    float _840 = float(_822);
    float _842 = fma(_468, (*spvDescriptorSet0.vp_c9)._m0[196].y, _832);
    bool _844 = _488 != 0.0;
    bool _846 = isnan(_488);
    bool _848 = _844 || _846;
    bool _850 = isnan(0.0);
    bool _852 = _848 || _850;
    float _854 = fma(_798, _596, _800);
    float _856 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[107].x, _778);
    float _858 = _834 * _840;
    bool _860 = _486 == 0.0;
    bool _862 = !_852;
    bool _864 = _860 && _862;
    float _866 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[107].y, _786);
    float _868 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[107].z, _812);
    float _870 = _858 * (-2.0);
    bool _872 = _490 == 0.0;
    bool _874 = _872 && _864;
    float _876 = fma(_830, _596, _842);
    float _878 = _854 * 0.15915493667125701904296875;
    float _880 = fma(_870, _726, _726);
    float _882 = in.m_65.x;
    float _884 = in.m_65.y;
    float _886 = in.m_65.z;
    float _888 = in.m_65.w;
    float _890 = fma(_532, _870, _532);
    float _892 = _876 * 0.15915493667125701904296875;
    float _894 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[196].z, _880);
    float _896 = _878 * 6.283185482025146484375;
    float _898 = sin(_896);
    float _900 = fma(_644, _732, _856);
    float _902 = fma(_646, _732, _866);
    float _904 = fma(_890, _596, _894);
    float _906 = fma(_650, _732, _868);
    float _908 = _876;
    float _910 = _890;
    float _912 = _880;
    float _914 = _858;
    if (_874)
    {
        _908 = _828;
    }
    float _916 = _908;
    float _918 = fma(_698, _702, _902);
    float _920 = _916;
    if (_874)
    {
        _816 = _826;
    }
    float _922 = _816;
    float _924 = _904 * 0.15915493667125701904296875;
    float _926 = _922;
    if (_874)
    {
        _910 = _916;
    }
    float _928 = _910;
    float _930 = _878 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _928;
    if (_874)
    {
        _912 = _922;
    }
    float _936 = _912;
    float _938 = fma(_700, _702, _906);
    float _940 = _936;
    if (!_874)
    {
        _920 = _828;
    }
    float _942 = _920;
    if (!_874)
    {
        _926 = _826;
    }
    float _944 = _926;
    if (_874)
    {
        _914 = _824;
    }
    float _946 = _914;
    float _948 = _892 * 6.283185482025146484375;
    float _950 = sin(_948);
    float _952 = _946;
    if (!_874)
    {
        float _954 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[17].y, _942);
        _934 = _954;
    }
    float _956 = _934;
    float _958 = _882 * _944;
    float _960 = _886 * _824;
    if (!_874)
    {
        float _962 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _824);
        _952 = _962;
    }
    float _964 = _952;
    float _966 = fma(_696, _702, _900);
    if (!_874)
    {
        float _968 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[17].y, _944);
        _940 = _968;
    }
    float _970 = _940;
    float _972 = -_958;
    float _974 = fma(_884, _824, _972);
    float _976 = _892 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _884 * _942;
    float _982 = -_960;
    float _984 = fma(_882, _942, _982);
    float _986 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].x, _966);
    float _988 = -_980;
    float _990 = fma(_886, _944, _988);
    float _992 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].y, _918);
    float _994 = _984 * _888;
    float _996 = _924 * 6.283185482025146484375;
    float _998 = cos(_996);
    float _1000 = _932 * _950;
    float _1002 = _898 * _950;
    float _1004 = _990 * _888;
    float _1006 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[110].z, _938);
    float _1008 = _924 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = _932 * _978;
    float _1014 = _932 * _998;
    float _1016 = _898 * _978;
    float _1018 = _898 * _998;
    float _1020 = _978 * _998;
    float _1022 = _950 * _998;
    float _1024 = _1014 * _618;
    float _1026 = _1018 * _618;
    float _1028 = _1014 * _884;
    float _1030 = fma(_1010, _1012, _1002);
    float _1032 = -_618;
    float _1034 = _1010 * _1032;
    float _1036 = -_1000;
    float _1038 = fma(_1010, _1016, _1036);
    float _1040 = -_1016;
    float _1042 = fma(_1010, _1000, _1040);
    float _1044 = fma(_1030, _598, _1024);
    float _1046 = fma(_1020, _598, _1034);
    float _1048 = fma(_1038, _598, _1026);
    float _1050 = fma(_1010, _1002, _1012);
    float _1052 = fma(_1042, _580, _1044);
    float _1054 = _974 * _888;
    float _1056 = fma(_1022, _580, _1046);
    float _1058 = -_884;
    float _1060 = _1010 * _1058;
    float _1062 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1064 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1066 = fma(_1050, _580, _1048);
    float _1068 = fma(_1020, _882, _1060);
    float _1070 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1062);
    float _1072 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1064);
    float _1074 = -_970;
    float _1076 = _1010 * _1074;
    float _1078 = -_994;
    float _1080 = _1010 * _1078;
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1070);
    float _1084 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1072);
    float _1086 = _1018 * _884;
    float _1088 = fma(_1020, _964, _1076);
    float _1090 = _720 + _1082;
    float _1092 = _738 + _1084;
    float _1094 = fma(_1020, _1004, _1080);
    float _1096 = _1014 * _970;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1100 = _1090 + _1098;
    float _1102 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1104 = _1092 + _1102;
    float _1106 = _1018 * _970;
    float _1108 = _1014 * _994;
    float _1110 = _1100 * _1100;
    float _1112 = _1104 * _1104;
    float _1114 = _1018 * _994;
    float _1116 = fma(_1030, _964, _1096);
    float _1118 = fma(_1038, _964, _1106);
    float _1120 = _1110 + _1112;
    float _1122 = fma(_1030, _882, _1028);
    float _1124 = fma(_1038, _882, _1086);
    float _1126 = fma(_1030, _1004, _1108);
    float _1128 = sqrt(_1120);
    float _1130 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1132 = fma(_1038, _1004, _1114);
    float _1134 = fma(_1022, _956, _1088);
    float _1136 = fma(_1042, _956, _1116);
    float _1138 = fma(_1050, _956, _1118);
    float _1140 = fma(_1042, _1054, _1126);
    float _1142 = fma(_1056, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1130);
    float _1144 = fma(_1042, _886, _1122);
    float _1146 = fma(_1022, _886, _1068);
    float _1148 = fma(_1050, _886, _1124);
    float _1150 = fma(_1066, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1142);
    float _1152 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1154 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1156 = _1136 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1158 = fma(_1050, _1054, _1132);
    bool _1160 = _1128 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1164 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1166 = _748 + _1150;
    float _1168 = _1144 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1170 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1162);
    float _1172 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1164);
    float _1174 = fma(_1022, _1054, _1094);
    float _1176 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1152);
    float _1178 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1154);
    float _1180 = fma(_1134, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1156);
    float _1182 = fma(_1146, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1168);
    float _1184 = _1056;
    float _1186 = _1110;
    float _1188 = _1112;
    float _1190 = _1092;
    float _1192 = _1090;
    float _1194 = _1172;
    if (!_1160)
    {
        _1184 = _1166;
    }
    float _1196 = _1184;
    bool _1198 = !_1160;
    float _1200 = _1196;
    if (!_1198)
    {
        float _1202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1206 = _1128 + _1204;
        float _1208 = _1166 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = rsqrt(_1120);
        float _1212 = _1206 * _1202;
        float _1214 = _1212 * 0.15915493667125701904296875;
        float _1216 = _1214 * 6.283185482025146484375;
        float _1218 = sin(_1216);
        float _1220 = _1214 * 6.283185482025146484375;
        float _1222 = cos(_1220);
        float _1224 = fma(_1218, _1208, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1226 = _1210 * _1224;
        float _1228 = _1222 + (-1.0);
        float _1230 = fma(_1100, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1232 = fma(_1104, _1226, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1234 = _1228 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1238 = _1230 + _1236;
        float _1240 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1242 = _1232 + _1240;
        float _1244 = fma(_1166, _1222, _1234);
        float _1246 = _1238 * _1238;
        float _1248 = _1242 * _1242;
        _1200 = _1244;
        _1186 = _1246;
        _1188 = _1248;
        _1190 = _1232;
        _1192 = _1230;
    }
    float _1250 = _1200;
    float _1252 = _1186;
    float _1254 = _1188;
    float _1256 = _1190;
    float _1258 = _1192;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1262 = _1250 + _1260;
    float _1264 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1266 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1268 = _1140 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1270 = fma(_1262, _1262, _1252);
    float _1272 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1264);
    float _1274 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1266);
    float _1276 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1268);
    float _1278 = _1270 + _1254;
    float _1280 = _986 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1282 = _992 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1284 = _1006 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1286 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1272);
    float _1288 = fma(_1148, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1170);
    float _1290 = sqrt(_1278);
    float _1292 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1274);
    float _1294 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1276);
    float _1296 = fma(_1148, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1172);
    float _1298 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = fma(_1148, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1182);
    float _1304 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1176);
    float _1308 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1178);
    float _1310 = fma(_1138, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1180);
    out.m_67.x = _1288;
    out.m_67.y = _1296;
    out.m_67.z = _1302;
    out.m_69.x = _1298;
    out.m_69.y = _1300;
    out.m_69.z = _1304;
    bool _1312 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1314 = isnan(_1290);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1320 = _1316 || _1318;
    out.m_71.x = _1286;
    out.m_71.y = _1292;
    out.m_71.z = _1294;
    out.m_73.x = _1306;
    out.m_73.y = _1308;
    out.m_73.z = _1310;
    float _1322 = _1296;
    float _1324 = _1294;
    if (!_1320)
    {
        _1194 = 1.0;
    }
    float _1326 = _1194;
    bool _1328 = !_1320;
    float _1330 = _1326;
    if (!_1328)
    {
        bool _1332 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1334 = isnan(_1290);
        bool _1336 = _1332 || _1334;
        bool _1338 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1340 = _1336 || _1338;
        if (!_1340)
        {
            float _1342 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1344 = _1290 + _1342;
            float _1346 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1348 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1346;
            float _1350 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1352 = _1350 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1354 = 1.0 / _1348;
            float _1356 = _1344 * _1354;
            float _1358 = fma(_1356, _1352, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1330 = _1358;
            _1322 = _1354;
            _1360 = true;
        }
        else
        {
            bool _1362 = _1290 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1364 = isnan(_1290);
            bool _1366 = _1362 || _1364;
            bool _1368 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1370 = _1366 || _1368;
            if (!_1370)
            {
                float _1372 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1374 = _1290 + _1372;
                float _1376 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1378 = _1376 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1380 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1382 = _1380 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1384 = 1.0 / _1378;
                float _1386 = _1374 * _1384;
                float _1388 = fma(_1386, _1382, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1330 = _1388;
                _1322 = _1384;
                _1360 = true;
            }
            else
            {
                _1330 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1360 = false;
    float _1390 = _1330;
    float _1392 = _1322;
    float _1394 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1396 = _1250 + _1394;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1400 = _1256 + _1398;
    bool _1402 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1404 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1406 = _1402 || _1404;
    bool _1408 = isnan(0.5);
    bool _1410 = _1406 || _1408;
    float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1414 = _1258 + _1412;
    float _1416 = fma(_1396, _1390, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1418 = fma(_1400, _1390, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1420 = fma(_1414, _1390, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1422 = _1414;
    float _1424 = _1392;
    float _1426 = _1396;
    if (_1410)
    {
        _1422 = _1420;
    }
    float _1428 = _1422;
    float _1430 = _1428;
    if (_1410)
    {
        _1424 = _1416;
    }
    float _1432 = _1424;
    float _1434 = _1432;
    if (_1410)
    {
        _1426 = _1418;
    }
    float _1436 = _1426;
    float _1438 = _1436;
    if (!_1410)
    {
        float _1440 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1442 = _748 + _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1446 = _720 + _1444;
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1450 = _1442 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1454 = _738 + _1452;
        float _1456 = fma(_1446, _1446, _1450);
        float _1458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1460 = fma(_1454, _1454, _1456);
        float _1462 = sqrt(_1460);
        float _1464 = _1448 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1466 = -_748;
        float _1468 = _1466 + _1416;
        float _1470 = precise::min(_1462, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1472 = _1470 * _1458;
        float _1474 = -_720;
        float _1476 = _1474 + _1420;
        float _1478 = -_738;
        float _1480 = _1478 + _1418;
        float _1482 = _1464 * _1472;
        float _1484 = fma(_1476, _1482, _720);
        float _1486 = fma(_1468, _1482, _748);
        float _1488 = fma(_1480, _1482, _738);
        _1434 = _1486;
        _1430 = _1484;
        _1438 = _1488;
        _1324 = _1480;
    }
    float _1490 = _1434;
    float _1492 = _1430;
    float _1494 = _1438;
    float _1496 = _1324;
    float _1498 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1500 = _1490 + _1498;
    float _1502 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1504 = _1492 + _1502;
    float _1506 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1508 = _1494 + _1506;
    float _1510 = _1500 * _1500;
    float _1512 = fma(_1504, _1504, _1510);
    float _1514 = fma(_1508, _1508, _1512);
    float _1516 = rsqrt(_1514);
    float _1518 = sqrt(_1514);
    float _1520 = _1504 * _1516;
    float _1522 = _1508 * _1516;
    float _1524 = _1500 * _1516;
    float _1526 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1528 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1530 = _1526 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 + _1532;
    float _1536 = sqrt(_1534);
    bool _1538 = _1536 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1540 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = _1536 + _1540;
    float _1544 = _1496;
    float _1546 = _1542;
    float _1548 = _1526;
    if (_1538)
    {
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1544 = _1550;
    }
    float _1552 = _1544;
    if (_1538)
    {
        float _1554 = _1542 * _1552;
        _1546 = _1554;
    }
    float _1556 = _1546;
    if (_1538)
    {
        float _1558 = _1556 * 0.15915493667125701904296875;
        _766 = _1558;
    }
    float _1560 = _766;
    float _1562 = _748;
    float _1564 = _1560;
    if (_1538)
    {
        float _1566 = _1560 * 6.283185482025146484375;
        float _1568 = sin(_1566);
        _1562 = _1568;
    }
    float _1570 = _1562;
    float _1572 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1574 = precise::max(0.0, _1572);
    float _1576 = _1552;
    float _1578 = _1574;
    if (_1538)
    {
        float _1580 = _1560 * 6.283185482025146484375;
        float _1582 = cos(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = -_1524;
    float _1588 = -_1574;
    float _1590 = fma(_1586, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1588);
    float _1592 = _1572;
    if (_1538)
    {
        float _1594 = rsqrt(_1534);
        _1592 = _1594;
    }
    float _1596 = _1592;
    if (_1538)
    {
        float _1598 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1598;
    }
    float _1600 = _1578;
    float _1602 = _1570;
    float _1604 = _1600;
    if (_1538)
    {
        float _1606 = fma(_1570, _1600, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _768 = _1606;
    }
    float _1608 = _768;
    float _1610 = _1608;
    if (!_1538)
    {
        _1602 = _1590;
    }
    float _1612 = _1602;
    float _1614 = _1612;
    float _1616 = _1584;
    if (_1538)
    {
        float _1618 = _1584 + (-1.0);
        _1604 = _1618;
    }
    float _1620 = _1604;
    float _1622 = _1620;
    if (_1538)
    {
        float _1624 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1564 = _1624;
    }
    float _1626 = _1564;
    if (!_1538)
    {
        _1622 = _1530;
    }
    float _1628 = _1622;
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1632 = _1596;
    float _1634 = _1628;
    if (_1538)
    {
        float _1636 = _1596 * _1608;
        _1610 = _1636;
    }
    float _1638 = _1610;
    if (!_1538)
    {
        _1632 = _1528;
    }
    float _1640 = _1632;
    float _1642 = _1640;
    if (_1538)
    {
        float _1644 = fma(_1590, _1584, _1626);
        _1614 = _1644;
    }
    float _1646 = _1614;
    if (!_1538)
    {
        _1616 = _1532;
    }
    float _1648 = _1616;
    float _1650 = _1648;
    if (_1538)
    {
        float _1652 = _1526 * _1638;
        _1548 = _1652;
    }
    float _1654 = _1548;
    if (_1538)
    {
        float _1656 = _1528 * _1638;
        _1642 = _1656;
    }
    float _1658 = _1642;
    float _1660 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1538)
    {
        float _1662 = _1654 * _1654;
        _1634 = _1662;
    }
    float _1664 = _1634;
    if (_1538)
    {
        float _1666 = _1658 * _1658;
        _1650 = _1666;
    }
    float _1668 = _1650;
    float _1670 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1660);
    float _1672 = fma(_1646, _1646, _1664);
    float _1674 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1670);
    float _1676 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1678 = _1672 + _1668;
    float _1680 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1682 = fma(_1518, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1680);
    float _1684 = precise::clamp(_1682, 0.0, 1.0);
    float _1686 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1688 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1690 = rsqrt(_1678);
    float _1692 = -_1684;
    float _1694 = _1692 + 1.0;
    float _1696 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1686);
    float _1698 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1676);
    float _1700 = _1490 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1702 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1704 = abs(_1694);
    float _1706 = log2(_1704);
    float _1708 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1696);
    float _1710 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1698);
    float _1712 = fma(_1492, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1700);
    float _1714 = -_1702;
    float _1716 = fma(_1714, _1630, 1.0);
    float _1718 = _1708 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1720 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1722 = fma(_1494, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1712);
    float _1724 = _1690 * _1654;
    float _1726 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1728 = _1690 * _1646;
    float _1730 = _1690 * _1658;
    float _1732 = _1724 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1734 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1726);
    float _1736 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1738 = log2(_1716);
    float _1740 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1742 = -_1732;
    float _1744 = fma(_1728, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1742);
    float _1746 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1734);
    float _1748 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1750 = -_1730;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1744);
    float _1754 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1746);
    float _1756 = exp2(_1740);
    float _1758 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1760 = fma(_1752, -0.5, 0.5);
    float _1762 = fma(_1752, 0.5, 0.5);
    float _1764 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1748);
    float _1766 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1758);
    float _1768 = _1728 + 1.0;
    float _1770 = fma(_1762, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1772 = 1.0 / _1754;
    float _1774 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1766);
    float _1776 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1764);
    float _1778 = fma(_1762, _1770, -0.212114393711090087890625);
    float _1780 = _1738 * 0.693147182464599609375;
    float _1782 = fma(_1762, _1778, 1.570728778839111328125);
    float _1784 = sqrt(_1760);
    float _1786 = -_1728;
    float _1788 = fma(_1756, _1768, _1786);
    float _1790 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1774);
    float _1792 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1776);
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1796 = fma(_1788, 0.5, 0.5);
    float _1798 = _1790 * _1772;
    float _1800 = _1792 * _1772;
    float _1802 = fma(_1798, 0.5, 0.5);
    float _1804 = fma(_1800, -0.5, 0.5);
    float _1806 = _1784 * 0.636619746685028076171875;
    float3 _5091 = float3(_1802, _1804, _1794);
    float _1808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5091, float3(0.0), isnan(_5091)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5091, float3(0.0), isnan(_5091)), level(0.0)).x;
    float3 _5102 = float3(_1802, _1804, _1794);
    float4 _1811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5102, float3(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5102, float3(0.0), isnan(_5102)), level(0.0)).xyzw;
    float _1813 = _1811.x;
    float _1815 = _1811.y;
    float _1817 = _1811.z;
    float _1819 = _1811.w;
    float _1821 = -_1782;
    float _1823 = fma(_1806, _1821, 1.0);
    float2 _5124 = float2(_1823, _1796);
    float3 _1827 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5124, float2(0.0), isnan(_5124)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5124, float2(0.0), isnan(_5124)), level(0.0)).xyz;
    float _1829 = _1827.x;
    float _1831 = _1827.y;
    float _1833 = _1827.z;
    float _1835 = _1706 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1837 = _1718 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _1492;
    out.m_75.y = _1490;
    out.m_75.z = _1494;
    bool _1839 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1841 = isnan(_1518);
    bool _1843 = _1839 || _1841;
    bool _1845 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1847 = _1843 || _1845;
    float _1849 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1837);
    float _1851 = exp2(_1835);
    float _1853 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1849);
    float _1855 = fma(_1736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1853);
    float _1857 = _1855 + _1754;
    out.gl_Position.x = _1790;
    out.gl_Position.y = _1792;
    out.gl_Position.z = _1855;
    out.gl_Position.w = _1754;
    float _1859 = _1857 * 0.5;
    float _1861 = -_1851;
    float _1863 = _1861 + 1.0;
    float _1865 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_77.z = _1859;
    out.m_77.w = _1754;
    float _1867 = -_1865;
    float _1869 = _1867 + 1.0;
    float _1871 = _1754;
    float _1873 = _1855;
    float _1875 = _1792;
    float _1877 = _1859;
    float _1879 = _1790;
    if (!_1847)
    {
        _1871 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1881 = _1871;
    float _1883 = _1881;
    float _1885 = _1881;
    if (!_1847)
    {
        _1873 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1887 = _1873;
    float _1889 = _1887;
    float _1891 = _1887;
    if (!_1847)
    {
        _1875 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1893 = _1875;
    float _1895 = _1893;
    float _1897 = _1893;
    if (!_1847)
    {
        _1877 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1899 = _1877;
    float _1901 = _1899;
    float _1903 = _1899;
    if (!_1847)
    {
        _1879 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1905 = _1879;
    float _1907 = _1865 * _1808;
    float _1909 = _1819 * _1907;
    float _1911 = _1833 * _1907;
    float _1913 = fma(_1829, _1909, _1813);
    float _1915 = fma(_1831, _1909, _1815);
    float _1917 = _1819 * _1869;
    float _1919 = fma(_1819, _1911, _1817);
    float _1921 = _1909;
    float _1923 = _1905;
    float _1925 = _1905;
    if (!_1847)
    {
        _1921 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1927 = _1921;
    out.m_79.x = _1913;
    out.m_79.y = _1915;
    out.m_79.z = _1919;
    out.m_79.w = _1917;
    bool _1929 = !_1847;
    float _1931 = _1927;
    float _1933 = _1927;
    if (!_1929)
    {
        bool _1935 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1937 = isnan(_1518);
        bool _1939 = _1935 || _1937;
        bool _1941 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1943 = _1939 || _1941;
        if (!_1943)
        {
            float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1947 = _1518 + _1945;
            float _1949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1951 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1949;
            float _1953 = 1.0 / _1951;
            float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1957 = _1955 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1959 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1961 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1963 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1965 = _1963 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1969 = _1967 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1973 = _1971 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1975 = _1947 * _1953;
            float _1977 = precise::clamp(_1975, 0.0, 1.0);
            float _1979 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1981 = _1979 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1983 = fma(_1977, _1957, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1985 = fma(_1977, _1981, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1987 = fma(_1977, _1961, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1989 = fma(_1977, _1965, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1991 = fma(_1977, _1969, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1993 = fma(_1977, _1973, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1903 = _1985;
            _1897 = _1991;
            _1933 = _1983;
            _1891 = _1989;
            _1885 = _1987;
            _1925 = _1993;
            _1995 = true;
        }
        else
        {
            bool _1997 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1999 = isnan(_1518);
            bool _2001 = _1997 || _1999;
            bool _2003 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2005 = _2001 || _2003;
            if (!_2005)
            {
                _1931 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2007 = _1931;
            _1933 = _2007;
            if (!_2005)
            {
                _1901 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2009 = _1901;
            _1903 = _2009;
            if (!_2005)
            {
                _1883 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2011 = _1883;
            _1885 = _2011;
            if (!_2005)
            {
                _1889 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2013 = _1889;
            _1891 = _2013;
            if (!_2005)
            {
                _1895 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2015 = _1895;
            _1897 = _2015;
            if (!_2005)
            {
                _1923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2017 = _1923;
            bool _2019 = !_2005;
            _1925 = _2017;
            if (!_2019)
            {
                bool _2021 = _1518 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2023 = isnan(_1518);
                bool _2025 = _2021 || _2023;
                bool _2027 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2029 = _2025 || _2027;
                if (!_2029)
                {
                    float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2033 = _1518 + _2031;
                    float _2035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2037 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2035;
                    float _2039 = 1.0 / _2037;
                    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2043 = _2041 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2045 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2047 = _2045 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2051 = _2049 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2055 = _2053 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2059 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2061 = _2033 * _2039;
                    float _2063 = precise::clamp(_2061, 0.0, 1.0);
                    float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2069 = fma(_2063, _2043, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2071 = fma(_2063, _2067, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2073 = fma(_2063, _2047, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2075 = fma(_2063, _2051, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2077 = fma(_2063, _2055, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2079 = fma(_2063, _2059, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1903 = _2071;
                    _1897 = _2077;
                    _1933 = _2069;
                    _1891 = _2075;
                    _1885 = _2073;
                    _1925 = _2079;
                    _1995 = true;
                }
                else
                {
                    _1903 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1897 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1933 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1891 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1885 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1995 = false;
    float _2081 = _1903;
    float _2083 = _1897;
    float _2085 = _1933;
    float _2087 = _1891;
    float _2089 = _1885;
    float _2091 = _1925;
    float _2093 = fma(_1308, -0.5, 0.5);
    float _2095 = precise::clamp(_2093, 0.0, 1.0);
    float _2097 = -_2081;
    float _2099 = _2097 + _2083;
    float _2101 = -_2085;
    float _2103 = _2101 + _2087;
    float _2105 = -_2089;
    float _2107 = _2105 + _2091;
    bool _2109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2111 = fma(_2095, _2099, _2081);
    float _2113 = fma(_2095, _2103, _2085);
    float _2115 = fma(_2095, _2107, _2089);
    float _2117 = _2111 * 0.586610972881317138671875;
    out.m_81.x = 0.0;
    float _2119 = fma(_2113, 0.298911988735198974609375, _2117);
    float _2121 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2123 = fma(_2115, 0.114477999508380889892578125, _2119);
    out.m_49.x = _2121;
    float _2125 = -_2123;
    float _2127 = _2113 + _2125;
    float _2129 = -_2123;
    float _2131 = _2111 + _2129;
    float _2133 = -_2123;
    float _2135 = _2115 + _2133;
    out.m_83.x = 0.0;
    float _2137 = fma(_2127, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2123);
    float _2139 = fma(_2131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2123);
    float _2141 = fma(_2135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2123);
    out.m_85.x = _2137;
    out.m_85.y = _2139;
    out.m_85.z = _2141;
    if (!_2109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2143 = -_1490;
    float _2145 = _2143 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2147 = -_1492;
    float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2151 = -_1494;
    float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2155 = _2145 * _2145;
    float _2157 = fma(_2149, _2149, _2155);
    float _2159 = fma(_2153, _2153, _2157);
    float _2161 = rsqrt(_2159);
    float _2163 = _2145 * _2161;
    float _2165 = _2149 * _2161;
    float _2167 = _2153 * _2161;
    float _2169 = sqrt(_2159);
    float _2171 = -_1524;
    float _2173 = _2171 + _2163;
    float _2175 = -_1520;
    float _2177 = _2175 + _2165;
    float _2179 = -_1522;
    float _2181 = _2179 + _2167;
    float _2183 = _2173 * _2173;
    float _2185 = fma(_2177, _2177, _2183);
    float _2187 = fma(_2181, _2181, _2185);
    float _2189 = -_2169;
    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2193 = rsqrt(_2187);
    float _2195 = _2191 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = abs(_2197);
    float _2201 = log2(_2199);
    float _2203 = _2173 * _2193;
    float _2205 = _2177 * _2193;
    float _2207 = _2181 * _2193;
    float _2209 = _1308 * _2203;
    float _2211 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = _1308 * _2163;
    float _2217 = fma(_1306, _2205, _2209);
    float _2219 = _2213 * _2213;
    float _2221 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2223 = fma(_1306, _2165, _2215);
    float _2225 = fma(_1310, _2207, _2217);
    float _2227 = precise::clamp(_2225, 0.0, 1.0);
    float _2229 = _2219 + (-1.0);
    float _2231 = fma(_1310, _2167, _2223);
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = _2227 * _2227;
    float _2237 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2239 = exp2(_2221);
    float _2241 = fma(_2235, _2229, 1.0);
    float _2243 = -_2163;
    float _2245 = -_2237;
    float _2247 = fma(_2243, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2245);
    float _2249 = _2241 * _2241;
    float _2251 = -_2167;
    float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2247);
    float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2257 = _2253 + _2255;
    float _2259 = 1.0 / _2249;
    float _2261 = _2257 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2263 = precise::clamp(_2261, 0.0, 1.0);
    float _2265 = _2239 * _2263;
    float _2267 = _2233 * _2265;
    float _2269 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2271 = _2219 * _2259;
    float _2273 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2275 = _2267 * _2271;
    float _2277 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2279 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2281 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2283 = _2275 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2269;
    out.m_81.y = _2273;
    out.m_81.z = _2277;
    out.m_83.x = _2279;
    out.m_83.y = _2281;
    out.m_83.z = _2283;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

