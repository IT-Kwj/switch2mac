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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_95 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_55 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_91 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_65 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3248 = false;
    bool _2481 = false;
    bool _902 = false;
    bool _740 = false;
    bool _528 = false;
    bool _354 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = in.m_50.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = _111;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _126;
    if (!_124)
    {
        out.m_55.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3543 = as_type<float>(_136);
        out.gl_Position.z = _3543;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _140 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_111);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = float(_116);
    bool _152 = _120 >= _150;
    bool _154 = !_148;
    bool _156 = _152 || _154;
    if (_156)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _128;
    if (_156)
    {
        out.m_55.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _138 = as_type<int>(_160);
    }
    int _162 = _138;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3598 = as_type<float>(_162);
        out.gl_Position.z = _3598;
    }
    if (_156)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = 1.0 / _150;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _120 * _164;
    bool _170 = !_166;
    float _172 = _168;
    float _190;
    if (!_170)
    {
        float _174 = in.m_57.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        _190 = _168;
    }
    _192 = false;
    float _194 = _190;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _214 = _194 + _212;
    bool _216 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _218 = isnan(_194);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _238 = isnan(_194);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_210;
    float _250 = _248 + 1.0;
    float _252 = 1.0 / _234;
    float _254 = _246 * _250;
    float _256 = -_246;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _266 = 1.0 / _230;
    float _268 = _226 * _258;
    float _270 = -_226;
    float _272 = _270 + 1.0;
    float _274 = _214 * _252;
    float _276 = _198 * _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_262, _276, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_280, _276, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_284, _276, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = _286 * _268;
    float _294 = _288 * _268;
    float _296 = _290 * _268;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _310 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].x, _292);
    float _312 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _314 = fma(_300, _274, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_304, _274, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_308, _274, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _320 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].z, _296);
    float _322 = fma(_314, _254, _310);
    float _324 = fma(_316, _254, _312);
    float _326 = fma(_318, _254, _320);
    float _328 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].x, _322);
    float _330 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].y, _324);
    float _332 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].z, _326);
    bool _334 = !_264;
    float _352;
    if (!_334)
    {
        float _336 = in.m_57.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        _352 = _168;
    }
    _354 = false;
    float _356 = _352;
    float _358 = in.m_59.x;
    float _360 = in.m_59.y;
    float _362 = in.m_59.z;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _366 = _356 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _370;
    float _376 = _332 * _362;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _382 = _330 * _360;
    bool _384 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _386 = isnan(_356);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _366 * _374;
    float _398 = 1.0 / _380;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _402 = _356 + _400;
    bool _404 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _406 = isnan(_356);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -_394;
    float _418 = _416 + 1.0;
    bool _420 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _422 = isnan(_356);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _432;
    float _436 = _430 * _418;
    float _438 = -_430;
    float _440 = _438 + 1.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _446;
    float _450 = fma(_434, _396, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _452 = _414 * _440;
    float _454 = fma(_444, _396, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _456 = fma(_448, _396, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _458 = _402 * _398;
    float _460 = _450 * _452;
    float _462 = _454 * _452;
    float _464 = _456 * _452;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _470 = -_414;
    float _472 = _470 + 1.0;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _482 = fma(_468, _458, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _484 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[107].x, _462);
    float _486 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[107].y, _460);
    float _488 = fma(_476, _458, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _490 = fma(_480, _458, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _492 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[107].z, _464);
    float _494 = fma(_482, _436, _486);
    float _496 = fma(_488, _436, _484);
    float _498 = fma(_490, _436, _492);
    float _500 = _328 * _358;
    float _502 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[109].y, _494);
    float _504 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[109].x, _496);
    float _506 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[109].z, _498);
    bool _508 = !_372;
    float _526;
    if (!_508)
    {
        float _510 = in.m_57.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        _526 = _168;
    }
    _528 = false;
    float _530 = _526;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _530 + _532;
    float _536 = _504 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    bool _550 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_530);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _540;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _570 = isnan(_530);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _582 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _584 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _586 = 1.0 / _544;
    float _588 = _548 * _562;
    bool _590 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_530);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = 1.0 / _566;
    float _604 = -_560;
    float _606 = _604 + 1.0;
    float _608 = fma(_588, _534, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _614 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _616 = isnan(_530);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = -_600;
    float _628 = _626 + 1.0;
    float _630 = _600 * _606;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = 1.0 / _612;
    float _638 = -_624;
    float _640 = _638 + 1.0;
    float _642 = _578 * _628;
    float _644 = _634 * _586;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _646;
    float _650 = _560 * _640;
    float _652 = _608 * _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _530 + _654;
    float _658 = -_578;
    float _660 = _658 + 1.0;
    float _662 = _648 * _602;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _666 = _530 + _664;
    bool _668 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _670 = isnan(_530);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _684 = fma(_644, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _686 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[115].x, _652);
    float _688 = fma(_662, _666, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _690 = _682 * _636;
    float _692 = -_678;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _698 = _530 + _696;
    float _700 = fma(_684, _630, _686);
    float _702 = _624 * _694;
    float _704 = fma(_690, _698, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _706 = fma(_688, _650, _700);
    float _708 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = fma(_704, _702, _706);
    float _712 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[119].x, _710);
    float _716 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _708;
    out.m_61.y = _712;
    out.m_61.z = _716;
    out.m_61.w = _718;
    bool _720 = !_584;
    float _738;
    if (!_720)
    {
        float _722 = in.m_57.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _738 = _736;
        _740 = true;
    }
    else
    {
        _738 = _168;
    }
    _740 = false;
    float _742 = _738;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _746 = _742 + _744;
    bool _748 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _750 = isnan(_742);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _762 = _742 + _760;
    bool _764 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _766 = isnan(_742);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _784 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _786 = isnan(_742);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -_758;
    float _798 = _796 + 1.0;
    float _800 = 1.0 / _782;
    float _802 = _794 * _798;
    float _804 = -_794;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _808;
    bool _812 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _814 = 1.0 / _778;
    float _816 = _774 * _806;
    float _818 = -_774;
    float _820 = _818 + 1.0;
    float _822 = _746 * _814;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _824;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _828;
    float _832 = fma(_810, _822, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _834 = fma(_826, _822, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _836 = fma(_830, _822, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _838 = _762 * _800;
    float _840 = _832 * _816;
    float _842 = _834 * _816;
    float _844 = _836 * _816;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _858 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[123].x, _840);
    float _860 = fma(_848, _838, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _862 = fma(_852, _838, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _864 = fma(_856, _838, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _866 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[123].y, _842);
    float _868 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[123].z, _844);
    float _870 = fma(_860, _802, _858);
    float _872 = fma(_862, _802, _866);
    float _874 = fma(_864, _802, _868);
    float _876 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[125].x, _870);
    float _878 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[125].y, _872);
    float _880 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[125].z, _874);
    bool _882 = !_812;
    float _900;
    if (!_882)
    {
        float _884 = in.m_57.x;
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _888 = _884 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _892 = _890 * _886;
        float _894 = floor(_892);
        float _896 = -_894;
        float _898 = _892 + _896;
        _900 = _898;
        _902 = true;
    }
    else
    {
        _900 = _168;
    }
    _902 = false;
    float _904 = _900;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _908 = _904 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _918 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _920 = isnan(_904);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _934 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _936 = isnan(_904);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = 1.0 / _912;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _948;
    float _952 = -_928;
    float _954 = _952 + 1.0;
    bool _956 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _958 = isnan(_904);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _970 = 1.0 / _916;
    float _972 = 1.0 / _932;
    float _974 = _950 * _946;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _980 = _944 * _954;
    float _982 = -_944;
    float _984 = _982 + 1.0;
    float _986 = fma(_974, _908, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _988 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _990 = isnan(_904);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = _966 * _984;
    float _1002 = _978 * _970;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _904 + _1008;
    float _1012 = _986 * _1000;
    float _1014 = -_966;
    float _1016 = _1014 + 1.0;
    float _1018 = -_998;
    float _1020 = _1018 + 1.0;
    float _1022 = fma(_1002, _1010, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1024 = _1006 * _972;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1028 = _904 + _1026;
    float _1030 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1012);
    float _1032 = _928 * _1020;
    float _1034 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1036 = fma(_1024, _1028, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1038 = fma(_1022, _980, _1030);
    float _1040 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1042 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = fma(_1036, _1032, _1038);
    float _1046 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1044);
    float _1052 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1052;
    out.m_63.y = _1048;
    out.m_63.z = _1042;
    out.m_63.w = _1054;
    bool _1056 = !_968;
    float _1058 = _1052;
    if (!_1056)
    {
        float _1060 = in.m_57.x;
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1064 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[14].x, _120);
        float _1068 = _1066 * _1062;
        float _1070 = floor(_1068);
        float _1072 = -_1070;
        float _1074 = _1068 + _1072;
        _172 = _1074;
    }
    float _1076 = _172;
    float _1078 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1080 = int(_1078);
    float _1082 = in.m_65.y;
    float _1084 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1086 = in.m_57.y;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1090 = _1088 != 0;
    float _1092 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1094 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1096 = int(_1094);
    float _1098 = in.m_57.z;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1102 = _1100 != 0;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1108 = _1106 != 0;
    float _1110 = in.m_65.x;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1114 = _1112 != 0;
    float _1116 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1118 = float(_1080);
    float _1120 = in.m_57.x;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1124 = _1076 + _1122;
    float _1126 = 1.0 / _1118;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1132 = float(uint(_1096));
    float _1134 = -_1082;
    float _1136 = _1134 + 1.0;
    int _1138 = ~_1096;
    int _1140 = _1138 + 1;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1146 = 1.0 / _1132;
    bool _1148 = _1086 > 0.5;
    bool _1150 = _1098 > 0.5;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1156 = _1150 ? as_type<int>(_1136) : as_type<int>(_1082);
    float _1158 = _120 * _1126;
    bool _1160 = _1108;
    float _1162 = _1082;
    float _1164 = _1076;
    float _1166 = _1110;
    float _1168 = _1098;
    if (!_1090)
    {
        _1058 = _1110;
    }
    float _1170 = _1058;
    float _1172 = in.m_57.w;
    float _1174 = _1114 ? as_type<float>(_1156) : _1082;
    float _1176 = 1.0 / _1130;
    float _1178 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1180 = as_type<int>(_1146) + (-2);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1184 = trunc(_1158);
    int _1186 = int(_1184);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1192 = fma(_1178, -2.0, _1182);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1202 = 1.0 / _1144;
    float _1204 = float(_1096);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1206;
    bool _1210 = _1172 > 0.5;
    float _1212 = 1.0 / _1154;
    float _1214 = float(uint(_1186));
    int _1216 = ~_1096;
    int _1218 = _1216 + 1;
    float _1220 = as_type<float>(_1180) * _1214;
    float _1222 = 1.0 / _1190;
    float _1224 = trunc(_1220);
    float _1226 = precise::max(_1224, 0.0);
    uint _1229 = uint(_1226);
    float _1231 = 1.0 / _1196;
    int _1233 = _1140 * int(_1229);
    int _1235 = _1233 + _1186;
    float _1237 = 1.0 / _1200;
    float _1239 = float(uint(_1235));
    float _1241 = as_type<float>(_1180) * _1239;
    float _1243 = in.m_67.w;
    float _1245 = trunc(_1241);
    float _1247 = precise::max(_1245, 0.0);
    uint _1249 = uint(_1247);
    float _1251 = _1208 * _1237;
    int _1253 = _1148 ? as_type<int>(_1136) : as_type<int>(_1082);
    float _1255 = _1108 ? as_type<float>(_1253) : _1082;
    int _1257 = _1253;
    float _1259 = _1170;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[80].y);
    if (_1090)
    {
        float _1263 = -_1110;
        float _1265 = _1263 + 1.0;
        _1257 = as_type<int>(_1265);
    }
    int _1267 = _1257;
    if (_1090)
    {
        bool _1269 = _1120 > 0.5;
        _1160 = _1269;
    }
    bool _1271 = _1160;
    int _1273 = int(_1229) + int(_1249);
    float _1275 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    if (_1102)
    {
        float _1277 = _1210 ? _1136 : _1082;
        _1162 = _1277;
    }
    float _1279 = _1162;
    float _1281 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1090)
    {
        float _1283 = _1271 ? as_type<float>(_1267) : _1110;
        _1259 = _1283;
    }
    float _1285 = _1259;
    int _1287 = _1218 * _1273;
    int _1289 = _1287 + _1186;
    out.m_69.w = _1243;
    float _1291 = -_1104;
    float _1293 = fma(_1281, 2.0, _1291);
    bool _1295 = uint(_1289) >= uint(_1096);
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1299 = _1297 != 0;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1303 = _1301 != 0;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1307 = _1305 != 0;
    bool _1309 = !_1295;
    int _1311 = _1309 ? 0 : (-1);
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1319 = _1317 != 0;
    float _1321 = in.m_71.x;
    float _1323 = in.m_71.y;
    float _1325 = in.m_71.z;
    bool _1327 = !_1303;
    int _1329 = _1327 ? 0 : 1;
    bool _1331 = !_1299;
    int _1333 = _1331 ? 0 : 1;
    bool _1335 = !_1307;
    int _1337 = _1335 ? 0 : 1;
    bool _1339 = !_1315;
    int _1341 = _1339 ? 0 : 1;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1345 = _1343 != 0;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1349 = _1347 != 0;
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1353 = _1351 != 0;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1357 = _1355 != 0;
    float _1359 = in.m_48.x;
    float _1361 = in.m_48.y;
    float _1363 = in.m_48.z;
    bool _1365 = !_1319;
    float _1367 = _1365 ? 7.345489978790283203125 : 1.0;
    bool _1369 = !_1345;
    int _1371 = _1369 ? 0 : 1;
    int _1373 = ~_1273;
    int _1375 = _1373 + _1311;
    int _1377 = _1375 + 1;
    float _1379 = _1367 * _1120;
    float _1381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1325);
    float _1383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1321);
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1323);
    bool _1387 = _1323 != 0.0;
    bool _1389 = isnan(_1323);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.0);
    bool _1395 = _1391 || _1393;
    float _1397 = _1092 * _1381;
    float _1399 = _1084 * _1383;
    float _1401 = _1116 * _1385;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1403;
    bool _1407 = _1321 == 0.0;
    bool _1409 = !_1395;
    bool _1411 = _1407 && _1409;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1417 = abs(_1371);
    float _1419 = _1405 * _1176;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1425 = 1.0 / _1415;
    bool _1427 = _1325 == 0.0;
    bool _1429 = _1427 && _1411;
    float _1431 = fma(_1419, _1124, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1433 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1435 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1437 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1439 = _1423 * _1212;
    float _1441 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1433);
    float _1443 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1435);
    float _1445 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1437);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1449 = _1447 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1451 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1441);
    float _1453 = _1449 * _1202;
    float _1455 = _120 * _1204;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1463 = _1461 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1465;
    float _1469 = _1455 * _164;
    float _1471 = _1459 * _1222;
    float _1473 = _1463 * _1231;
    float _1475 = in.m_73.x;
    float _1477 = in.m_73.y;
    float _1479 = in.m_73.z;
    float _1481 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1443);
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1485 = _1076 + _1483;
    float _1487 = _1467 * _1425;
    float _1489 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1445);
    float _1491 = floor(_1379);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1495 = _1076 + _1493;
    float _1497 = fma(_1453, _1485, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1499 = float(_1186);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1503 = _1076 + _1501;
    float _1505 = fma(_1251, _1495, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1509 = _1076 + _1507;
    bool _1511 = _1499 >= _1204;
    bool _1513 = isnan(_1499);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan(_1204);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1525 = _1076 + _1523;
    float _1527 = fma(_1439, _1503, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1529 = fma(_1471, _1509, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1531 = trunc(_1469);
    int _1533 = int(_1531);
    float _1535 = fma(_1473, _1525, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1537 = as_type<float>(_1377);
    if (_1357)
    {
        float _1539 = -_1110;
        float _1541 = _1539 + 1.0;
        _1261 = as_type<int>(_1541);
    }
    int _1543 = _1261;
    float _1545 = _1451 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1547 = -_1491;
    float _1549 = _1379 + _1547;
    float _1551 = _1489 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1555 = trunc(_1521);
    int _1557 = int(_1555);
    float _1559 = _1549 * _1204;
    float _1561 = _1477;
    float _1563 = _1475;
    float _1565 = _1479;
    if (!_1429)
    {
        float _1567 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1477);
        _1561 = _1567;
    }
    float _1569 = _1561;
    if (!_1429)
    {
        float _1571 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1475);
        _1563 = _1571;
    }
    float _1573 = _1563;
    if (!_1429)
    {
        float _1575 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1479);
        _1565 = _1575;
    }
    float _1577 = _1565;
    int _1579 = _1096 * _1377;
    int _1581 = _1579 + _1186;
    bool _1583 = _1096 == 0;
    float _1585 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1553);
    float _1587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1589 = ~_1096;
    int _1591 = _1589 + 1;
    bool _1593 = !_1583;
    int _1595 = _1593 ? _1581 : (-1);
    float _1597 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1585);
    int _1599 = _1591;
    if (!_1319)
    {
        _1537 = _1086;
    }
    float _1601 = _1537;
    float _1603 = _1601;
    if (_1319)
    {
        _1603 = _1120;
    }
    float _1605 = _1603;
    float _1607 = trunc(_1559);
    int _1609 = int(_1607);
    int _1611 = ~_1557;
    int _1613 = _1611 + 1;
    int _1615 = _1613 + 1;
    int _1617 = _1595 * _1615;
    int _1619 = _1096 + (-1);
    float _1621 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1623 = abs(_1329);
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1627 = fma(_1174, _1621, -0.5);
    int _1629 = abs(_1333);
    int _1631 = _1557 * _1619;
    int _1633 = _1631 + _1617;
    int _1635 = _1609 * _1417;
    int _1637 = _1635 + _1186;
    float _1639 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1625);
    int _1641 = abs(_1337);
    int _1643 = _1633 * _1623;
    bool _1645 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1647 = isnan(_1076);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1659 = _1076 + _1657;
    bool _1661 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1663 = isnan(_1076);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1669 = _1665 || _1667;
    float _1671 = float(_1669);
    int _1673 = _1533 * _1629;
    int _1675 = _1673 + _1643;
    bool _1677 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1679 = isnan(_1076);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    float _1689 = -_1655;
    float _1691 = _1689 + 1.0;
    float _1693 = fma(_1487, _1659, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1695 = _1637 * _1641;
    int _1697 = _1695 + _1675;
    int _1699 = abs(_1341);
    float _1701 = _1671 * _1691;
    float _1703 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1705 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1707 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1709 = isnan(_1076);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1715 = _1711 || _1713;
    float _1717 = float(_1715);
    float _1719 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1721 = -_1671;
    float _1723 = _1721 + 1.0;
    int _1725 = _1609 * _1699;
    int _1727 = _1725 + _1697;
    float _1729 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1705);
    float _1731 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1719);
    float _1733 = _1717 * _1723;
    bool _1735 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1737 = isnan(_1076);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = -_1717;
    float _1749 = _1747 + 1.0;
    float _1751 = float(uint(_1727));
    float _1753 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1703);
    bool _1755 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1757 = isnan(_1076);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1769 = _1745 * _1749;
    float _1771 = as_type<float>(_1180) * _1751;
    float _1773 = -_1745;
    float _1775 = _1773 + 1.0;
    float _1777 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1192);
    bool _1779 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1781 = isnan(_1076);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1787 = _1783 || _1785;
    float _1789 = float(_1787);
    float _1791 = _1765 * _1775;
    float _1793 = trunc(_1771);
    float _1795 = precise::max(_1793, 0.0);
    uint _1797 = uint(_1795);
    float _1799 = -_1765;
    float _1801 = _1799 + 1.0;
    float _1803 = -_1777;
    float _1805 = fma(_1597, _1275, _1803);
    bool _1807 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1809 = isnan(_1076);
    bool _1811 = _1807 || _1809;
    bool _1813 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1815 = _1811 || _1813;
    float _1817 = float(_1815);
    float _1819 = _1789 * _1801;
    float _1821 = -_1789;
    float _1823 = _1821 + 1.0;
    float _1825 = _1729;
    if (_1319)
    {
        _1164 = _1120;
    }
    float _1827 = _1164;
    float _1829 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1831 = _1827;
    if (!_1319)
    {
        _1831 = _1098;
    }
    float _1833 = _1831;
    float _1835 = _1817 * _1823;
    float _1837 = -_1817;
    float _1839 = _1837 + 1.0;
    float _1841 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1843 = _1687 * _1839;
    float _1845 = fma(_1829, _1279, -0.5);
    int _1847 = _1591 * int(_1797);
    int _1849 = _1847 + _1727;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1853 = _1431 * _1843;
    float _1855 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1753);
    float _1857 = _1851;
    float _1859 = _1853;
    if (_1353)
    {
        float _1861 = -_1110;
        float _1863 = _1861 + 1.0;
        _1599 = as_type<int>(_1863);
    }
    int _1865 = _1599;
    float _1867 = float(uint(_1849));
    float _1869 = -_1851;
    float _1871 = fma(_1841, 2.0, _1869);
    float _1873 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1729);
    float _1875 = _1873;
    if (!_1353)
    {
        _1825 = _1110;
    }
    float _1877 = _1825;
    float _1879 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1731);
    float _1881 = as_type<float>(_1180) * _1867;
    float _1883 = _1877;
    if (_1353)
    {
        float _1885 = _1150 ? as_type<float>(_1865) : _1110;
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = -_1687;
    float _1891 = _1889 + 1.0;
    float _1893 = trunc(_1881);
    float _1895 = precise::max(_1893, 0.0);
    uint _1897 = uint(_1895);
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1357)
    {
        _1857 = _1110;
    }
    float _1901 = _1857;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1905 = _1901;
    if (_1357)
    {
        float _1907 = _1148 ? as_type<float>(_1543) : _1110;
        _1905 = _1907;
    }
    float _1909 = _1905;
    float _1911 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1899);
    float _1913 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1917 = float(uint(_1637));
    float _1919 = fma(_1891, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1853);
    float _1921 = -_1903;
    float _1923 = fma(_1913, 2.0, _1921);
    int _1925 = int(_1797) + int(_1897);
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1929 = ~_1096;
    int _1931 = _1929 + 1;
    float _1933 = as_type<float>(_1180) * _1917;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1319)
    {
        _1166 = _1098;
    }
    float _1937 = _1166;
    float _1939 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1927);
    int _1941 = _1931 * _1925;
    int _1943 = _1941 + _1727;
    float _1945 = _1937;
    if (!_1319)
    {
        _1859 = _1098;
    }
    float _1947 = _1859;
    float _1949 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1935);
    float _1951 = _1947;
    if (_1319)
    {
        _1168 = _1086;
    }
    float _1953 = _1168;
    float _1955 = trunc(_1933);
    float _1957 = precise::max(_1955, 0.0);
    uint _1959 = uint(_1957);
    float _1961 = _1953;
    if (_1319)
    {
        _1945 = _1086;
    }
    float _1963 = _1945;
    float _1965 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1319)
    {
        _1951 = _1086;
    }
    float _1967 = _1951;
    float _1969 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1319)
    {
        _1961 = _1120;
    }
    float _1971 = _1961;
    float _1973 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1975 = uint(_1943) >= uint(_1096);
    float _1977 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1969);
    float _1979 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1965);
    float _1981 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1973);
    bool _1983 = !_1975;
    int _1985 = _1983 ? 0 : (-1);
    float _1987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1989 = fma(_1497, _1835, _1919);
    int _1991 = ~_1096;
    int _1993 = _1991 + 1;
    float _1995 = fma(_1963, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1915);
    int _1997 = ~_1925;
    int _1999 = _1997 + _1985;
    int _2001 = _1999 + 1;
    float _2003 = fma(_1505, _1819, _1989);
    float _2005 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1939);
    int _2007 = _1096 * _2001;
    int _2009 = _2007 + _1727;
    float _2011 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2013 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2015 = _1993 * int(_1959);
    int _2017 = _2015 + _1637;
    bool _2019 = !_1583;
    int _2021 = _2019 ? _2009 : (-1);
    float _2023 = -_120;
    float _2025 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1923);
    float _2027 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2029 = -_120;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1871);
    float _2033 = float(uint(_2017));
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2037 = _2021 >> 31;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2041 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2043 = as_type<float>(_1180) * _2033;
    int _2045 = _2037 & 3;
    float _2047 = -_120;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1293);
    float _2051 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2053 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1911);
    int _2055 = _2021 + _2045;
    float _2057 = fma(_2005, _2013, _2049);
    float _2059 = fma(_2051, _1887, -0.5);
    float _2061 = trunc(_2043);
    float _2063 = precise::max(_2061, 0.0);
    uint _2065 = uint(_2063);
    int _2067 = _2055 >> 2;
    float _2069 = fma(_2027, _1909, -0.5);
    float _2071 = fma(_2053, _2059, _2025);
    float _2073 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1949);
    int _2075 = _2067 << 4;
    int _2077 = _2075 + 368;
    float _2079 = fma(_2041, -2.0, _2039);
    float _2081 = fma(_1527, _1791, _2003);
    float _2083 = fma(_2073, _2069, _2031);
    uint _2085 = uint(int(uint(_2077) >> uint(2)));
    uint _2087 = uint(int(uint(int(_2085)) >> uint(2)));
    int _2089 = int(_2085) & 3;
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[int(_2087)][_2089];
    int _2093 = int(_2085) + 1;
    uint _2095 = uint(int(uint(_2093) >> uint(2)));
    int _2097 = _2093 & 3;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[int(_2095)][_2097];
    float _2101 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2103 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2105 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2079);
    float _2107 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1995);
    float _2109 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2111 = _1545 + _2101;
    float _2113 = _1551 + _2103;
    float _2115 = -_2105;
    float _2117 = fma(_2107, _1845, _2115);
    int _2119 = _2021 & 3;
    bool _2121 = _2119 != 0;
    int _2123 = _2077 + 8;
    uint _2125 = uint(int(uint(_2123) >> uint(2)));
    uint _2127 = uint(int(uint(int(_2125)) >> uint(2)));
    int _2129 = int(_2125) & 3;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[int(_2127)][_2129];
    int _2133 = int(_2125) + 1;
    uint _2135 = uint(int(uint(_2133) >> uint(2)));
    int _2137 = _2133 & 3;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[int(_2135)][_2137];
    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2143 = _2111 + _2141;
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2147 = _2113 + _2145;
    int _2149 = ~_1096;
    int _2151 = _2149 + 1;
    float _2153 = fma(_2109, -2.0, _2035);
    int _2155 = int(_1959) + int(_2065);
    float _2157 = _2143 * _2143;
    int _2159 = _2021 & 3;
    bool _2161 = _2159 != 0;
    float _2163 = _2147 * _2147;
    bool _2165 = uint(_2119) > 1u;
    int _2167 = _2151 * _2155;
    int _2169 = _2167 + _1637;
    int _2171 = _2161 ? 0 : 1;
    float _2173 = _2157 + _2163;
    float _2175 = fma(_1529, _1769, _2081);
    float _2177 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1639);
    bool _2179 = uint(_2169) >= uint(_1096);
    float _2181 = sqrt(_2173);
    int _2183 = ~_2171;
    int _2185 = _2183 + 1;
    int _2187 = _2185 + 1;
    float _2189 = fma(_1535, _1733, _2175);
    bool _2191 = !_2179;
    int _2193 = _2191 ? 0 : (-1);
    float _2195 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2153);
    bool _2197 = uint(_2119) >= 2u;
    int _2199 = _2187;
    float _2201 = _2157;
    float _2203 = _2163;
    float _2205 = _2111;
    float _2207 = _2113;
    float _2209 = _2071;
    if (!_2165)
    {
        int _2211 = ~_2171;
        int _2213 = _2211 + 1;
        _2199 = _2213;
    }
    int _2215 = _2199;
    bool _2217 = _2119 != 3;
    int _2219 = ~_2155;
    int _2221 = _2219 + _2193;
    int _2223 = _2221 + 1;
    bool _2225 = !_2121;
    int _2227 = _2225 ? 0 : 1;
    int _2229 = abs(_2215);
    float _2231 = _1873 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2233 = abs(_2227);
    int _2235 = ~_2229;
    int _2237 = _2235 + 1;
    int _2239 = _2237 + 1;
    int _2241 = _2197 ? 0 : 1;
    bool _2243 = _2119 != 3;
    int _2245 = _2239 * as_type<int>(_2099);
    float _2247 = _1481 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2249 = _2181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2251 = ~_2241;
    int _2253 = _2251 + 1;
    int _2255 = _2253 + 1;
    int _2257 = _2255;
    if (_2217)
    {
        int _2259 = ~_2241;
        int _2261 = _2259 + 1;
        _2257 = _2261;
    }
    int _2263 = _2257;
    int _2265 = ~_2233;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    bool _2271 = !_2243;
    int _2273 = _2271 ? 0 : (-1);
    int _2275 = abs(_2263);
    int _2277 = _2269 * as_type<int>(_2091);
    int _2279 = _2277 + _2245;
    float _2281 = _2247 + _2231;
    int _2283 = abs(_2273);
    bool _2285 = !_1349;
    int _2287 = _2285 ? 0 : 1;
    int _2289 = abs(_2287);
    int _2291 = ~_2275;
    int _2293 = _2291 + 1;
    int _2295 = _2293 + 1;
    if (!_2249)
    {
        _1875 = _2281;
    }
    float _2297 = _1875;
    bool _2299 = !_2249;
    float _2301 = _2297;
    if (!_2299)
    {
        float _2303 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2307 = _2181 + _2305;
        float _2309 = rsqrt(_2173);
        float _2311 = _2307 * _2303;
        float _2313 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2315 = _2311 * 0.15915493667125701904296875;
        float _2317 = _2315 * 6.283185482025146484375;
        float _2319 = sin(_2317);
        float _2321 = _2315 * 6.283185482025146484375;
        float _2323 = cos(_2321);
        float _2325 = fma(_2319, _2313, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2327 = _2309 * _2325;
        float _2329 = fma(_2143, _2327, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2331 = _2323 + (-1.0);
        float _2333 = fma(_2147, _2327, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2337 = _2329 + _2335;
        float _2339 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2343 = _2333 + _2341;
        float _2345 = _2337 * _2337;
        float _2347 = fma(_2281, _2323, _2339);
        float _2349 = _2343 * _2343;
        _2301 = _2347;
        _2201 = _2345;
        _2203 = _2349;
        _2205 = _2329;
        _2207 = _2333;
    }
    float _2351 = _2301;
    float _2353 = _2201;
    float _2355 = _2203;
    float _2357 = _2205;
    float _2359 = _2207;
    int _2361 = _1096 * _2223;
    int _2363 = _2361 + _1637;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2367 = _2351 + _2365;
    int _2369 = _2295 * as_type<int>(_2131);
    int _2371 = _2369 + _2279;
    int _2373 = ~_2283;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = fma(_2367, _2367, _2353);
    int _2381 = ~_2289;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    float _2387 = -_2195;
    float _2389 = fma(_2177, _1627, _2387);
    float _2391 = fma(_1693, _1701, _2189);
    int _2393 = _2377 * as_type<int>(_2139);
    int _2395 = _2393 + _2371;
    float _2397 = _2379 + _2355;
    bool _2399 = !_1583;
    int _2401 = _2399 ? _2363 : (-1);
    float _2403 = _2389 + 0.5;
    int _2405 = _2395 * _2385;
    float _2407 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2391);
    float _2409 = _2083 + 0.5;
    float _2411 = sqrt(_2397);
    int _2413 = _2401 * _2289;
    int _2415 = _2413 + _2405;
    float _2417 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1977);
    float _2419 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1979);
    float _2421 = _1805 + 0.5;
    float _2423 = _2057 + 0.5;
    float _2425 = _2071 + 0.5;
    float _2427 = _2117 + 0.5;
    float _2429 = float(_2415);
    float _2431 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1981);
    out.m_75.x = _2409;
    out.m_75.y = _2403;
    out.m_77.x = _2423;
    out.m_77.y = _2421;
    out.m_77.z = _2425;
    out.m_77.w = _2427;
    bool _2433 = _2411 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2435 = isnan(_2411);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2441 = _2437 || _2439;
    out.m_79.x = _2407;
    out.m_81.x = _2429;
    out.m_83.x = _2417;
    out.m_83.y = _2419;
    out.m_83.z = _2431;
    float _2443 = as_type<float>(_2415);
    float _2445 = _2367;
    if (!_2441)
    {
        _2443 = 1.0;
    }
    float _2447 = _2443;
    bool _2449 = !_2441;
    float _2451 = _2447;
    if (!_2449)
    {
        bool _2453 = _2411 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2455 = isnan(_2411);
        bool _2457 = _2453 || _2455;
        bool _2459 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2461 = _2457 || _2459;
        if (!_2461)
        {
            float _2463 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2465 = _2411 + _2463;
            float _2467 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2469 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2467;
            float _2471 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2473 = _2471 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2475 = 1.0 / _2469;
            float _2477 = _2465 * _2475;
            float _2479 = fma(_2477, _2473, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2451 = _2479;
            _2445 = _2473;
            _2481 = true;
        }
        else
        {
            bool _2483 = _2411 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2485 = isnan(_2411);
            bool _2487 = _2483 || _2485;
            bool _2489 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2491 = _2487 || _2489;
            if (!_2491)
            {
                float _2493 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2495 = _2411 + _2493;
                float _2497 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2499 = _2497 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2501 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2503 = _2501 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2505 = 1.0 / _2499;
                float _2507 = _2495 * _2505;
                float _2509 = fma(_2507, _2503, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2451 = _2509;
                _2445 = _2503;
                _2481 = true;
            }
            else
            {
                _2451 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2481 = false;
    float _2511 = _2451;
    float _2513 = _2445;
    float _2515 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2517 = _2357 + _2515;
    float _2519 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2521 = _2351 + _2519;
    float _2523 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2525 = _2359 + _2523;
    bool _2527 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2529 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2531 = _2527 || _2529;
    bool _2533 = isnan(0.5);
    bool _2535 = _2531 || _2533;
    float _2537 = fma(_2517, _2511, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2539 = fma(_2521, _2511, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2541 = fma(_2525, _2511, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2543 = _2511;
    float _2545 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2547 = _2513;
    if (_2535)
    {
        _2543 = _2537;
    }
    float _2549 = _2543;
    float _2551 = _2549;
    if (_2535)
    {
        _2545 = _2539;
    }
    float _2553 = _2545;
    float _2555 = _2553;
    if (_2535)
    {
        _2547 = _2541;
    }
    float _2557 = _2547;
    float _2559 = _2557;
    if (!_2535)
    {
        float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2563 = _2247 + _2561;
        float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2567 = _1545 + _2565;
        float _2569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2571 = _2563 * _2563;
        float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2575 = _1551 + _2573;
        float _2577 = fma(_2567, _2567, _2571);
        float _2579 = fma(_2575, _2575, _2577);
        float _2581 = -_1545;
        float _2583 = _2581 + _2537;
        float _2585 = -_2247;
        float _2587 = _2585 + _2539;
        float _2589 = -_1551;
        float _2591 = _2589 + _2541;
        float _2593 = sqrt(_2579);
        float _2595 = precise::min(_2593, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2597 = _2595 * _2569;
        float _2599 = fma(_2583, _2597, _1545);
        float _2601 = fma(_2587, _2597, _2247);
        float _2603 = fma(_2591, _2597, _1551);
        _2555 = _2601;
        _2551 = _2599;
        _2559 = _2603;
    }
    float _2605 = _2555;
    float _2607 = _2551;
    float _2609 = _2559;
    float _2611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2613 = _2605 + _2611;
    float _2615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2617 = _2607 + _2615;
    float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2621 = _2609 + _2619;
    float _2623 = _2613 * _2613;
    float _2625 = fma(_2617, _2617, _2623);
    float _2627 = fma(_2621, _2621, _2625);
    float _2629 = rsqrt(_2627);
    float _2631 = sqrt(_2627);
    float _2633 = _2629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2635 = _2617 * _2633;
    float _2637 = _2621 * _2633;
    float _2639 = _2635 * _2635;
    float _2641 = _2637 * _2637;
    float _2643 = _2639 + _2641;
    float _2645 = sqrt(_2643);
    bool _2647 = _2645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2651 = _2645 + _2649;
    float _2653 = _2629;
    float _2655 = _2643;
    float _2657 = _2651;
    float _2659 = _2613;
    float _2661 = _2633;
    if (_2647)
    {
        float _2663 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2653 = _2663;
    }
    float _2665 = _2653;
    if (_2647)
    {
        float _2667 = rsqrt(_2643);
        _2655 = _2667;
    }
    float _2669 = _2655;
    float _2671 = _2669;
    if (_2647)
    {
        float _2673 = _2651 * _2665;
        _2657 = _2673;
    }
    float _2675 = _2657;
    if (_2647)
    {
        float _2677 = _2675 * 0.15915493667125701904296875;
        _2209 = _2677;
    }
    float _2679 = _2209;
    float _2681 = _2665;
    float _2683 = _2679;
    if (_2647)
    {
        float _2685 = _2679 * 6.283185482025146484375;
        float _2687 = sin(_2685);
        _2681 = _2687;
    }
    float _2689 = _2681;
    float _2691 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2693 = precise::max(0.0, _2691);
    float _2695 = _2621;
    float _2697 = _2693;
    if (_2647)
    {
        float _2699 = _2679 * 6.283185482025146484375;
        float _2701 = cos(_2699);
        _2695 = _2701;
    }
    float _2703 = _2695;
    float _2705 = -_2633;
    float _2707 = -_2693;
    float _2709 = fma(_2613, _2705, _2707);
    if (_2647)
    {
        float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2697 = _2711;
    }
    float _2713 = _2697;
    float _2715 = _2713;
    if (!_2647)
    {
        _2683 = _2635;
    }
    float _2717 = _2683;
    float _2719 = _2689;
    float _2721 = _2717;
    if (_2647)
    {
        float _2723 = fma(_2689, _2713, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2715 = _2723;
    }
    float _2725 = _2715;
    if (!_2647)
    {
        _2719 = _2709;
    }
    float _2727 = _2719;
    float _2729 = _2727;
    float _2731 = _2703;
    if (_2647)
    {
        float _2733 = _2703 + (-1.0);
        _2659 = _2733;
    }
    float _2735 = _2659;
    float _2737 = _2735;
    if (_2647)
    {
        float _2739 = _2669 * _2725;
        _2661 = _2739;
    }
    float _2741 = _2661;
    if (!_2647)
    {
        _2671 = _2641;
    }
    float _2743 = _2671;
    float _2745 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2747 = _2743;
    if (_2647)
    {
        float _2749 = _2735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2737 = _2749;
    }
    float _2751 = _2737;
    float _2753 = _2751;
    if (_2647)
    {
        float _2755 = _2635 * _2741;
        _2721 = _2755;
    }
    float _2757 = _2721;
    if (_2647)
    {
        float _2759 = fma(_2709, _2703, _2751);
        _2729 = _2759;
    }
    float _2761 = _2729;
    if (!_2647)
    {
        _2753 = _2637;
    }
    float _2763 = _2753;
    float _2765 = _2763;
    if (_2647)
    {
        float _2767 = _2637 * _2741;
        _2765 = _2767;
    }
    float _2769 = _2765;
    if (!_2647)
    {
        _2731 = _2639;
    }
    float _2771 = _2731;
    float _2773 = _2771;
    if (_2647)
    {
        float _2775 = _2757 * _2757;
        _2773 = _2775;
    }
    float _2777 = _2773;
    if (_2647)
    {
        float _2779 = _2769 * _2769;
        _2747 = _2779;
    }
    float _2781 = _2747;
    float _2783 = fma(_2761, _2761, _2777);
    float _2785 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2787 = fma(_1545, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2789 = _2783 + _2781;
    float _2791 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2785);
    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2795 = fma(_2631, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2793);
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = rsqrt(_2789);
    float _2801 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2791);
    float _2803 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2805 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2807 = -_2797;
    float _2809 = _2807 + 1.0;
    float _2811 = _2801 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2813 = floor(_2787);
    float _2815 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2817 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2819 = -_2815;
    float _2821 = fma(_2819, _2805, 1.0);
    float _2823 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2825 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2817);
    float _2827 = _2799 * _2757;
    float _2829 = _2799 * _2761;
    float _2831 = _2799 * _2769;
    float _2833 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2823);
    float _2835 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2825);
    float _2837 = abs(_2809);
    float _2839 = log2(_2837);
    float _2841 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2843 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2833);
    float _2845 = _2835 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2847 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2745);
    float _2849 = -_2841;
    float _2851 = fma(_2829, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2849);
    float _2853 = _2843 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2855 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2857 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2847);
    float _2859 = -_2831;
    float _2861 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2851);
    float _2863 = floor(_2803);
    float _2865 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2855);
    float _2867 = _2857 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2869 = fma(_2861, -0.5, 0.5);
    float _2871 = -_2813;
    float _2873 = _2787 + _2871;
    float _2875 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2865);
    float _2877 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2879 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2881 = fma(_2861, 0.5, 0.5);
    float _2883 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2875);
    float _2885 = log2(_2821);
    float _2887 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2889 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2879);
    float _2891 = _2829 + 1.0;
    float _2893 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2887);
    float _2895 = -_2863;
    float _2897 = _2803 + _2895;
    float _2899 = exp2(_2877);
    float _2901 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2893);
    float _2903 = fma(_2881, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2905 = fma(_2881, _2903, -0.212114393711090087890625);
    float _2907 = 1.0 / _2883;
    float _2909 = _2885 * 0.693147182464599609375;
    float _2911 = sqrt(_2869);
    float _2913 = -_2829;
    float _2915 = fma(_2899, _2891, _2913);
    float2 _8014 = float2(_2873, _2897);
    float _2917 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8014, float2(0.0), isnan(_8014)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8014, float2(0.0), isnan(_8014)), level(0.0)).x;
    float _2919 = fma(_2881, _2905, 1.570728778839111328125);
    float _2921 = fma(_2915, 0.5, 0.5);
    float _2923 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2889);
    float _2925 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2923);
    float _2927 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2901);
    float _2929 = _2911 * 0.636619746685028076171875;
    float _2931 = _2925 * _2907;
    float _2933 = _2927 * _2907;
    float _2935 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2937 = -_2919;
    float _2939 = fma(_2929, _2937, 1.0);
    float _2941 = fma(_2931, 0.5, 0.5);
    float _2943 = fma(_2933, -0.5, 0.5);
    float3 _8068 = float3(_2941, _2943, _2935);
    float _2945 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8068, float3(0.0), isnan(_8068)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8068, float3(0.0), isnan(_8068)), level(0.0)).x;
    float3 _8079 = float3(_2941, _2943, _2935);
    float4 _2948 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8079, float3(0.0), isnan(_8079)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8079, float3(0.0), isnan(_8079)), level(0.0)).xyzw;
    float _2950 = _2948.x;
    float _2952 = _2948.y;
    float _2954 = _2948.z;
    float _2956 = _2948.w;
    float2 _8095 = float2(_2939, _2921);
    float3 _2960 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8095, float2(0.0), isnan(_8095)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8095, float2(0.0), isnan(_8095)), level(0.0)).xyz;
    float _2962 = _2960.x;
    float _2964 = _2960.y;
    float _2966 = _2960.z;
    float _2968 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2970 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2972 = _2811 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2974 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2976 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2968);
    float _2978 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2970);
    float _2980 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2974);
    float _2982 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2976);
    float _2984 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2978);
    bool _2986 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2988 = isnan(_2631);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2994 = _2990 || _2992;
    float _2996 = _2982 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2998 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3000 = 1.0 / _2996;
    float _3002 = _2998 + _2996;
    float _3004 = _3002 * 0.5;
    float _3006 = _3004 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3008 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3010 = fma(_3006, _3000, _3008);
    float _3012 = _3004 + _3010;
    float _3014 = _3012 * _3000;
    float _3016 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3018 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3016);
    float _3020 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2865);
    float _3022 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2980);
    float _3024 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3020);
    float _3026 = 1.0 / _3018;
    float _3028 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3022);
    float _3030 = _2925 + _2883;
    float _3032 = _3030 * 0.5;
    float _3034 = 1.0 / _3024;
    float _3036 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3038 = _3026 * _3036;
    float _3040 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3042 = abs(_3038);
    float _3044 = log2(_3042);
    float _3046 = _3028 * _3034;
    bool _3048 = _3038 <= 8000.0;
    bool _3050 = isnan(_3038);
    bool _3052 = _3048 || _3050;
    bool _3054 = isnan(8000.0);
    bool _3056 = _3052 || _3054;
    float _3058 = float(_3056);
    float _3060 = in.m_85.x;
    float _3062 = exp2(_3040);
    float _3064 = _2883 * _3046;
    out.gl_Position.x = _2925;
    out.gl_Position.y = _2927;
    out.gl_Position.z = _3064;
    out.gl_Position.w = _2883;
    float _3066 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3068 = exp2(_3066);
    float _3070 = -_3062;
    float _3072 = _3070 + 1.0;
    float _3074 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3076 = _2925;
    float _3078 = _3064;
    float _3080 = _2883;
    float _3082 = _2927;
    if (!_2994)
    {
        _3076 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3084 = _3076;
    float _3086 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3088 = precise::clamp(_3086, 0.0, 1.0);
    float _3090 = fma(_3088, -2.0, 3.0);
    float _3092 = _3088 * _3088;
    float _3094 = _3092 * _3090;
    float _3096 = _2883 + _3064;
    float _3098 = _3084;
    float _3100 = _3084;
    if (!_2994)
    {
        _3078 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3102 = _3078;
    float _3104 = -_3094;
    float _3106 = _3104 + 1.0;
    float _3108 = _3096 * 0.5;
    float _3110 = fma(_3106, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3094);
    float _3112 = _2883 * 0.5;
    float _3114 = _3102;
    float _3116 = _3102;
    if (!_2994)
    {
        _3080 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3118 = _3080;
    float _3120 = _3058 * _3110;
    float _3122 = fma(_2927, -0.5, _3112);
    float _3124 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3126 = _3118;
    float _3128 = _3118;
    if (!_2994)
    {
        _3082 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3130 = _3082;
    out.m_87.x = _3032;
    out.m_87.y = _3122;
    out.m_87.z = _3108;
    out.m_87.w = _2883;
    float _3132 = -_2917;
    float _3134 = _3132 + 1.0;
    float _3136 = _3134 * _3124;
    float _3138 = precise::clamp(_3136, 0.0, 1.0);
    float _3140 = -_3138;
    float _3142 = fma(_3140, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3144 = -_3074;
    float _3146 = _3144 + 1.0;
    float _3148 = _3142 * _3060;
    float _3150 = _3148 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3152 = _3148;
    float _3154 = _3146;
    float _3156 = _3130;
    float _3158 = _3130;
    if (!_2994)
    {
        _3152 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3160 = _3152;
    out.m_89.x = _3150;
    float _3162 = _3074 * _2945;
    float _3164 = _2956 * _3162;
    float _3166 = _2966 * _3162;
    float _3168 = fma(_2962, _3164, _2950);
    float _3170 = fma(_2964, _3164, _2952);
    float _3172 = _2956 * _3146;
    float _3174 = fma(_2956, _3166, _2954);
    float _3176 = _3160;
    float _3178 = _3160;
    if (!_2994)
    {
        _3154 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3180 = _3154;
    out.m_91.x = _3168;
    out.m_91.y = _3170;
    out.m_91.z = _3174;
    out.m_91.w = _3172;
    bool _3182 = !_2994;
    float _3184 = _3180;
    float _3186 = _3180;
    if (!_3182)
    {
        bool _3188 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3190 = isnan(_2631);
        bool _3192 = _3188 || _3190;
        bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3196 = _3192 || _3194;
        if (!_3196)
        {
            float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3200 = _2631 + _3198;
            float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3204 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3202;
            float _3206 = 1.0 / _3204;
            float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3210 = _3208 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3212 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3214 = _3212 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3216 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3218 = _3216 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3228 = _3200 * _3206;
            float _3230 = precise::clamp(_3228, 0.0, 1.0);
            float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3236 = fma(_3230, _3210, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3238 = fma(_3230, _3234, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3240 = fma(_3230, _3214, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3242 = fma(_3230, _3218, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3244 = fma(_3230, _3222, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3246 = fma(_3230, _3226, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3178 = _3236;
            _3100 = _3244;
            _3116 = _3238;
            _3158 = _3242;
            _3128 = _3240;
            _3186 = _3246;
            _3248 = true;
        }
        else
        {
            bool _3250 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3252 = isnan(_2631);
            bool _3254 = _3250 || _3252;
            bool _3256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3258 = _3254 || _3256;
            if (!_3258)
            {
                _3114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3260 = _3114;
            _3116 = _3260;
            if (!_3258)
            {
                _3176 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3262 = _3176;
            _3178 = _3262;
            if (!_3258)
            {
                _3126 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3264 = _3126;
            _3128 = _3264;
            if (!_3258)
            {
                _3156 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3266 = _3156;
            _3158 = _3266;
            if (!_3258)
            {
                _3098 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3268 = _3098;
            _3100 = _3268;
            if (!_3258)
            {
                _3184 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3270 = _3184;
            bool _3272 = !_3258;
            _3186 = _3270;
            if (!_3272)
            {
                bool _3274 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3276 = isnan(_2631);
                bool _3278 = _3274 || _3276;
                bool _3280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3282 = _3278 || _3280;
                if (!_3282)
                {
                    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3286 = _2631 + _3284;
                    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3290 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3288;
                    float _3292 = 1.0 / _3290;
                    float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3296 = _3294 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3300 = _3298 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3314 = _3286 * _3292;
                    float _3316 = precise::clamp(_3314, 0.0, 1.0);
                    float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3322 = fma(_3316, _3296, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3324 = fma(_3316, _3320, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3326 = fma(_3316, _3300, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3328 = fma(_3316, _3304, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3330 = fma(_3316, _3308, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3332 = fma(_3316, _3312, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3178 = _3322;
                    _3100 = _3330;
                    _3116 = _3324;
                    _3158 = _3328;
                    _3128 = _3326;
                    _3186 = _3332;
                    _3248 = true;
                }
                else
                {
                    _3178 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3100 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3158 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3128 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3186 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3248 = false;
    float _3334 = _3178;
    float _3336 = _3100;
    float _3338 = _3116;
    float _3340 = _3158;
    float _3342 = _3128;
    float _3344 = _3186;
    float _3346 = fma(_2419, -0.5, 0.5);
    float _3348 = precise::clamp(_3346, 0.0, 1.0);
    float _3350 = -_3334;
    float _3352 = _3350 + _3336;
    float _3354 = -_3338;
    float _3356 = _3354 + _3340;
    float _3358 = -_3342;
    float _3360 = _3358 + _3344;
    bool _3362 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3364 = fma(_3348, _3352, _3334);
    float _3366 = fma(_3348, _3356, _3338);
    float _3368 = fma(_3348, _3360, _3342);
    float _3370 = _3364 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3372 = fma(_3366, 0.298911988735198974609375, _3370);
    float _3374 = fma(_3368, 0.114477999508380889892578125, _3372);
    float _3376 = -_3374;
    float _3378 = _3366 + _3376;
    float _3380 = -_3374;
    float _3382 = _3364 + _3380;
    float _3384 = -_3374;
    float _3386 = _3368 + _3384;
    float _3388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3390 = fma(_3378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3374);
    float _3392 = fma(_3382, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3374);
    float _3394 = fma(_3386, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3374);
    out.m_55.x = _3388;
    out.m_95.x = _3390;
    out.m_95.y = _3392;
    out.m_95.z = _3394;
    if (!_3362)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3396 = -_2605;
    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3400 = -_2607;
    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3404 = -_2609;
    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3408 = _3398 * _3398;
    float _3410 = fma(_3402, _3402, _3408);
    float _3412 = fma(_3406, _3406, _3410);
    float _3414 = sqrt(_3412);
    float _3416 = rsqrt(_3412);
    float _3418 = -_3414;
    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3422 = _3420 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3424 = precise::clamp(_3422, 0.0, 1.0);
    float _3426 = _3402 * _3416;
    float _3428 = _3398 * _3416;
    float _3430 = abs(_3424);
    float _3432 = log2(_3430);
    float _3434 = _3406 * _3416;
    float _3436 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3438 = _2419 * _3428;
    float _3440 = -_3428;
    float _3442 = -_3436;
    float _3444 = fma(_3440, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3442);
    float _3446 = fma(_2417, _3426, _3438);
    float _3448 = -_3434;
    float _3450 = fma(_3448, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3444);
    float _3452 = fma(_2431, _3434, _3446);
    float _3454 = precise::clamp(_3452, 0.0, 1.0);
    float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3458 = _3450 + _3456;
    float _3460 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3462 = _3458 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3464 = precise::clamp(_3462, 0.0, 1.0);
    float _3466 = exp2(_3460);
    float _3468 = _3466 * _3464;
    float _3470 = _3454 * _3468;
    float _3472 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3474 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3476 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3472;
    out.m_93.y = _3474;
    out.m_93.z = _3476;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3248 = false;
    bool _2481 = false;
    bool _902 = false;
    bool _740 = false;
    bool _528 = false;
    bool _354 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = in.m_50.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = _111;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _126;
    if (!_124)
    {
        out.m_55.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3543 = as_type<float>(_136);
        out.gl_Position.z = _3543;
    }
    if (!_124)
    {
        return out;
    }
    bool _140 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_111);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = float(_116);
    bool _152 = _120 >= _150;
    bool _154 = !_148;
    bool _156 = _152 || _154;
    if (_156)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _128;
    if (_156)
    {
        out.m_55.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _138 = as_type<int>(_160);
    }
    int _162 = _138;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3598 = as_type<float>(_162);
        out.gl_Position.z = _3598;
    }
    if (_156)
    {
        return out;
    }
    float _164 = 1.0 / _150;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _120 * _164;
    bool _170 = !_166;
    float _172 = _168;
    float _190;
    if (!_170)
    {
        float _174 = in.m_57.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        _190 = _168;
    }
    _192 = false;
    float _194 = _190;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _214 = _194 + _212;
    bool _216 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _218 = isnan(_194);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _238 = isnan(_194);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_210;
    float _250 = _248 + 1.0;
    float _252 = 1.0 / _234;
    float _254 = _246 * _250;
    float _256 = -_246;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _266 = 1.0 / _230;
    float _268 = _226 * _258;
    float _270 = -_226;
    float _272 = _270 + 1.0;
    float _274 = _214 * _252;
    float _276 = _198 * _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_262, _276, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_280, _276, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_284, _276, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = _286 * _268;
    float _294 = _288 * _268;
    float _296 = _290 * _268;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _310 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].x, _292);
    float _312 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _314 = fma(_300, _274, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_304, _274, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_308, _274, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _320 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].z, _296);
    float _322 = fma(_314, _254, _310);
    float _324 = fma(_316, _254, _312);
    float _326 = fma(_318, _254, _320);
    float _328 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].x, _322);
    float _330 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].y, _324);
    float _332 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].z, _326);
    bool _334 = !_264;
    float _352;
    if (!_334)
    {
        float _336 = in.m_57.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        _352 = _168;
    }
    _354 = false;
    float _356 = _352;
    float _358 = in.m_59.x;
    float _360 = in.m_59.y;
    float _362 = in.m_59.z;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _366 = _356 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _370;
    float _376 = _332 * _362;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _382 = _330 * _360;
    bool _384 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _386 = isnan(_356);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _366 * _374;
    float _398 = 1.0 / _380;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _402 = _356 + _400;
    bool _404 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _406 = isnan(_356);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -_394;
    float _418 = _416 + 1.0;
    bool _420 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _422 = isnan(_356);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _432;
    float _436 = _430 * _418;
    float _438 = -_430;
    float _440 = _438 + 1.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _446;
    float _450 = fma(_434, _396, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _452 = _414 * _440;
    float _454 = fma(_444, _396, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _456 = fma(_448, _396, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _458 = _402 * _398;
    float _460 = _450 * _452;
    float _462 = _454 * _452;
    float _464 = _456 * _452;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _470 = -_414;
    float _472 = _470 + 1.0;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _482 = fma(_468, _458, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _484 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[107].x, _462);
    float _486 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[107].y, _460);
    float _488 = fma(_476, _458, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _490 = fma(_480, _458, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _492 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[107].z, _464);
    float _494 = fma(_482, _436, _486);
    float _496 = fma(_488, _436, _484);
    float _498 = fma(_490, _436, _492);
    float _500 = _328 * _358;
    float _502 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[109].y, _494);
    float _504 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[109].x, _496);
    float _506 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[109].z, _498);
    bool _508 = !_372;
    float _526;
    if (!_508)
    {
        float _510 = in.m_57.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        _526 = _168;
    }
    _528 = false;
    float _530 = _526;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _530 + _532;
    float _536 = _504 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    bool _550 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_530);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _540;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _570 = isnan(_530);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _582 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _584 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _586 = 1.0 / _544;
    float _588 = _548 * _562;
    bool _590 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_530);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = 1.0 / _566;
    float _604 = -_560;
    float _606 = _604 + 1.0;
    float _608 = fma(_588, _534, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _614 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _616 = isnan(_530);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = -_600;
    float _628 = _626 + 1.0;
    float _630 = _600 * _606;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = 1.0 / _612;
    float _638 = -_624;
    float _640 = _638 + 1.0;
    float _642 = _578 * _628;
    float _644 = _634 * _586;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _646;
    float _650 = _560 * _640;
    float _652 = _608 * _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _530 + _654;
    float _658 = -_578;
    float _660 = _658 + 1.0;
    float _662 = _648 * _602;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _666 = _530 + _664;
    bool _668 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _670 = isnan(_530);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _684 = fma(_644, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _686 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[115].x, _652);
    float _688 = fma(_662, _666, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _690 = _682 * _636;
    float _692 = -_678;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _698 = _530 + _696;
    float _700 = fma(_684, _630, _686);
    float _702 = _624 * _694;
    float _704 = fma(_690, _698, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _706 = fma(_688, _650, _700);
    float _708 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = fma(_704, _702, _706);
    float _712 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[119].x, _710);
    float _716 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _708;
    out.m_61.y = _712;
    out.m_61.z = _716;
    out.m_61.w = _718;
    bool _720 = !_584;
    float _738;
    if (!_720)
    {
        float _722 = in.m_57.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _738 = _736;
        _740 = true;
    }
    else
    {
        _738 = _168;
    }
    _740 = false;
    float _742 = _738;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _746 = _742 + _744;
    bool _748 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _750 = isnan(_742);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _762 = _742 + _760;
    bool _764 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _766 = isnan(_742);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _784 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _786 = isnan(_742);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -_758;
    float _798 = _796 + 1.0;
    float _800 = 1.0 / _782;
    float _802 = _794 * _798;
    float _804 = -_794;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _808;
    bool _812 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _814 = 1.0 / _778;
    float _816 = _774 * _806;
    float _818 = -_774;
    float _820 = _818 + 1.0;
    float _822 = _746 * _814;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _824;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _828;
    float _832 = fma(_810, _822, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _834 = fma(_826, _822, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _836 = fma(_830, _822, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _838 = _762 * _800;
    float _840 = _832 * _816;
    float _842 = _834 * _816;
    float _844 = _836 * _816;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _858 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[123].x, _840);
    float _860 = fma(_848, _838, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _862 = fma(_852, _838, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _864 = fma(_856, _838, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _866 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[123].y, _842);
    float _868 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[123].z, _844);
    float _870 = fma(_860, _802, _858);
    float _872 = fma(_862, _802, _866);
    float _874 = fma(_864, _802, _868);
    float _876 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[125].x, _870);
    float _878 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[125].y, _872);
    float _880 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[125].z, _874);
    bool _882 = !_812;
    float _900;
    if (!_882)
    {
        float _884 = in.m_57.x;
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _888 = _884 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _892 = _890 * _886;
        float _894 = floor(_892);
        float _896 = -_894;
        float _898 = _892 + _896;
        _900 = _898;
        _902 = true;
    }
    else
    {
        _900 = _168;
    }
    _902 = false;
    float _904 = _900;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _908 = _904 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _918 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _920 = isnan(_904);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _934 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _936 = isnan(_904);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = 1.0 / _912;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _948;
    float _952 = -_928;
    float _954 = _952 + 1.0;
    bool _956 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _958 = isnan(_904);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _970 = 1.0 / _916;
    float _972 = 1.0 / _932;
    float _974 = _950 * _946;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _980 = _944 * _954;
    float _982 = -_944;
    float _984 = _982 + 1.0;
    float _986 = fma(_974, _908, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _988 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _990 = isnan(_904);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = _966 * _984;
    float _1002 = _978 * _970;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _904 + _1008;
    float _1012 = _986 * _1000;
    float _1014 = -_966;
    float _1016 = _1014 + 1.0;
    float _1018 = -_998;
    float _1020 = _1018 + 1.0;
    float _1022 = fma(_1002, _1010, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1024 = _1006 * _972;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1028 = _904 + _1026;
    float _1030 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1012);
    float _1032 = _928 * _1020;
    float _1034 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1036 = fma(_1024, _1028, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1038 = fma(_1022, _980, _1030);
    float _1040 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1042 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = fma(_1036, _1032, _1038);
    float _1046 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1044);
    float _1052 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1052;
    out.m_63.y = _1048;
    out.m_63.z = _1042;
    out.m_63.w = _1054;
    bool _1056 = !_968;
    float _1058 = _1052;
    if (!_1056)
    {
        float _1060 = in.m_57.x;
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1064 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[14].x, _120);
        float _1068 = _1066 * _1062;
        float _1070 = floor(_1068);
        float _1072 = -_1070;
        float _1074 = _1068 + _1072;
        _172 = _1074;
    }
    float _1076 = _172;
    float _1078 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1080 = int(_1078);
    float _1082 = in.m_65.y;
    float _1084 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1086 = in.m_57.y;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1090 = _1088 != 0;
    float _1092 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1094 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1096 = int(_1094);
    float _1098 = in.m_57.z;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1102 = _1100 != 0;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1108 = _1106 != 0;
    float _1110 = in.m_65.x;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1114 = _1112 != 0;
    float _1116 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1118 = float(_1080);
    float _1120 = in.m_57.x;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1124 = _1076 + _1122;
    float _1126 = 1.0 / _1118;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1132 = float(uint(_1096));
    float _1134 = -_1082;
    float _1136 = _1134 + 1.0;
    int _1138 = ~_1096;
    int _1140 = _1138 + 1;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1146 = 1.0 / _1132;
    bool _1148 = _1086 > 0.5;
    bool _1150 = _1098 > 0.5;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1156 = _1150 ? as_type<int>(_1136) : as_type<int>(_1082);
    float _1158 = _120 * _1126;
    bool _1160 = _1108;
    float _1162 = _1082;
    float _1164 = _1076;
    float _1166 = _1110;
    float _1168 = _1098;
    if (!_1090)
    {
        _1058 = _1110;
    }
    float _1170 = _1058;
    float _1172 = in.m_57.w;
    float _1174 = _1114 ? as_type<float>(_1156) : _1082;
    float _1176 = 1.0 / _1130;
    float _1178 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1180 = as_type<int>(_1146) + (-2);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1184 = trunc(_1158);
    int _1186 = int(_1184);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1192 = fma(_1178, -2.0, _1182);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1202 = 1.0 / _1144;
    float _1204 = float(_1096);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1206;
    bool _1210 = _1172 > 0.5;
    float _1212 = 1.0 / _1154;
    float _1214 = float(uint(_1186));
    int _1216 = ~_1096;
    int _1218 = _1216 + 1;
    float _1220 = as_type<float>(_1180) * _1214;
    float _1222 = 1.0 / _1190;
    float _1224 = trunc(_1220);
    float _1226 = precise::max(_1224, 0.0);
    uint _1229 = uint(_1226);
    float _1231 = 1.0 / _1196;
    int _1233 = _1140 * int(_1229);
    int _1235 = _1233 + _1186;
    float _1237 = 1.0 / _1200;
    float _1239 = float(uint(_1235));
    float _1241 = as_type<float>(_1180) * _1239;
    float _1243 = in.m_67.w;
    float _1245 = trunc(_1241);
    float _1247 = precise::max(_1245, 0.0);
    uint _1249 = uint(_1247);
    float _1251 = _1208 * _1237;
    int _1253 = _1148 ? as_type<int>(_1136) : as_type<int>(_1082);
    float _1255 = _1108 ? as_type<float>(_1253) : _1082;
    int _1257 = _1253;
    float _1259 = _1170;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[80].y);
    if (_1090)
    {
        float _1263 = -_1110;
        float _1265 = _1263 + 1.0;
        _1257 = as_type<int>(_1265);
    }
    int _1267 = _1257;
    if (_1090)
    {
        bool _1269 = _1120 > 0.5;
        _1160 = _1269;
    }
    bool _1271 = _1160;
    int _1273 = int(_1229) + int(_1249);
    float _1275 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    if (_1102)
    {
        float _1277 = _1210 ? _1136 : _1082;
        _1162 = _1277;
    }
    float _1279 = _1162;
    float _1281 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1090)
    {
        float _1283 = _1271 ? as_type<float>(_1267) : _1110;
        _1259 = _1283;
    }
    float _1285 = _1259;
    int _1287 = _1218 * _1273;
    int _1289 = _1287 + _1186;
    out.m_69.w = _1243;
    float _1291 = -_1104;
    float _1293 = fma(_1281, 2.0, _1291);
    bool _1295 = uint(_1289) >= uint(_1096);
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1299 = _1297 != 0;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1303 = _1301 != 0;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1307 = _1305 != 0;
    bool _1309 = !_1295;
    int _1311 = _1309 ? 0 : (-1);
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1319 = _1317 != 0;
    float _1321 = in.m_71.x;
    float _1323 = in.m_71.y;
    float _1325 = in.m_71.z;
    bool _1327 = !_1303;
    int _1329 = _1327 ? 0 : 1;
    bool _1331 = !_1299;
    int _1333 = _1331 ? 0 : 1;
    bool _1335 = !_1307;
    int _1337 = _1335 ? 0 : 1;
    bool _1339 = !_1315;
    int _1341 = _1339 ? 0 : 1;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1345 = _1343 != 0;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1349 = _1347 != 0;
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1353 = _1351 != 0;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1357 = _1355 != 0;
    float _1359 = in.m_48.x;
    float _1361 = in.m_48.y;
    float _1363 = in.m_48.z;
    bool _1365 = !_1319;
    float _1367 = _1365 ? 7.345489978790283203125 : 1.0;
    bool _1369 = !_1345;
    int _1371 = _1369 ? 0 : 1;
    int _1373 = ~_1273;
    int _1375 = _1373 + _1311;
    int _1377 = _1375 + 1;
    float _1379 = _1367 * _1120;
    float _1381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1325);
    float _1383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1321);
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1323);
    bool _1387 = _1323 != 0.0;
    bool _1389 = isnan(_1323);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.0);
    bool _1395 = _1391 || _1393;
    float _1397 = _1092 * _1381;
    float _1399 = _1084 * _1383;
    float _1401 = _1116 * _1385;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1403;
    bool _1407 = _1321 == 0.0;
    bool _1409 = !_1395;
    bool _1411 = _1407 && _1409;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1417 = abs(_1371);
    float _1419 = _1405 * _1176;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1425 = 1.0 / _1415;
    bool _1427 = _1325 == 0.0;
    bool _1429 = _1427 && _1411;
    float _1431 = fma(_1419, _1124, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1433 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1435 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1437 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1439 = _1423 * _1212;
    float _1441 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1433);
    float _1443 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1435);
    float _1445 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1437);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1449 = _1447 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1451 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1441);
    float _1453 = _1449 * _1202;
    float _1455 = _120 * _1204;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1463 = _1461 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1465;
    float _1469 = _1455 * _164;
    float _1471 = _1459 * _1222;
    float _1473 = _1463 * _1231;
    float _1475 = in.m_73.x;
    float _1477 = in.m_73.y;
    float _1479 = in.m_73.z;
    float _1481 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1443);
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1485 = _1076 + _1483;
    float _1487 = _1467 * _1425;
    float _1489 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1445);
    float _1491 = floor(_1379);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1495 = _1076 + _1493;
    float _1497 = fma(_1453, _1485, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1499 = float(_1186);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1503 = _1076 + _1501;
    float _1505 = fma(_1251, _1495, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1509 = _1076 + _1507;
    bool _1511 = _1499 >= _1204;
    bool _1513 = isnan(_1499);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan(_1204);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1525 = _1076 + _1523;
    float _1527 = fma(_1439, _1503, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1529 = fma(_1471, _1509, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1531 = trunc(_1469);
    int _1533 = int(_1531);
    float _1535 = fma(_1473, _1525, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1537 = as_type<float>(_1377);
    if (_1357)
    {
        float _1539 = -_1110;
        float _1541 = _1539 + 1.0;
        _1261 = as_type<int>(_1541);
    }
    int _1543 = _1261;
    float _1545 = _1451 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1547 = -_1491;
    float _1549 = _1379 + _1547;
    float _1551 = _1489 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1555 = trunc(_1521);
    int _1557 = int(_1555);
    float _1559 = _1549 * _1204;
    float _1561 = _1477;
    float _1563 = _1475;
    float _1565 = _1479;
    if (!_1429)
    {
        float _1567 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1477);
        _1561 = _1567;
    }
    float _1569 = _1561;
    if (!_1429)
    {
        float _1571 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1475);
        _1563 = _1571;
    }
    float _1573 = _1563;
    if (!_1429)
    {
        float _1575 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1479);
        _1565 = _1575;
    }
    float _1577 = _1565;
    int _1579 = _1096 * _1377;
    int _1581 = _1579 + _1186;
    bool _1583 = _1096 == 0;
    float _1585 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1553);
    float _1587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1589 = ~_1096;
    int _1591 = _1589 + 1;
    bool _1593 = !_1583;
    int _1595 = _1593 ? _1581 : (-1);
    float _1597 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1585);
    int _1599 = _1591;
    if (!_1319)
    {
        _1537 = _1086;
    }
    float _1601 = _1537;
    float _1603 = _1601;
    if (_1319)
    {
        _1603 = _1120;
    }
    float _1605 = _1603;
    float _1607 = trunc(_1559);
    int _1609 = int(_1607);
    int _1611 = ~_1557;
    int _1613 = _1611 + 1;
    int _1615 = _1613 + 1;
    int _1617 = _1595 * _1615;
    int _1619 = _1096 + (-1);
    float _1621 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1623 = abs(_1329);
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1627 = fma(_1174, _1621, -0.5);
    int _1629 = abs(_1333);
    int _1631 = _1557 * _1619;
    int _1633 = _1631 + _1617;
    int _1635 = _1609 * _1417;
    int _1637 = _1635 + _1186;
    float _1639 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1625);
    int _1641 = abs(_1337);
    int _1643 = _1633 * _1623;
    bool _1645 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1647 = isnan(_1076);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1659 = _1076 + _1657;
    bool _1661 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1663 = isnan(_1076);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1669 = _1665 || _1667;
    float _1671 = float(_1669);
    int _1673 = _1533 * _1629;
    int _1675 = _1673 + _1643;
    bool _1677 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1679 = isnan(_1076);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    float _1689 = -_1655;
    float _1691 = _1689 + 1.0;
    float _1693 = fma(_1487, _1659, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1695 = _1637 * _1641;
    int _1697 = _1695 + _1675;
    int _1699 = abs(_1341);
    float _1701 = _1671 * _1691;
    float _1703 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1705 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1707 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1709 = isnan(_1076);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1715 = _1711 || _1713;
    float _1717 = float(_1715);
    float _1719 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1721 = -_1671;
    float _1723 = _1721 + 1.0;
    int _1725 = _1609 * _1699;
    int _1727 = _1725 + _1697;
    float _1729 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1705);
    float _1731 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1719);
    float _1733 = _1717 * _1723;
    bool _1735 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1737 = isnan(_1076);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = -_1717;
    float _1749 = _1747 + 1.0;
    float _1751 = float(uint(_1727));
    float _1753 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1703);
    bool _1755 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1757 = isnan(_1076);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1769 = _1745 * _1749;
    float _1771 = as_type<float>(_1180) * _1751;
    float _1773 = -_1745;
    float _1775 = _1773 + 1.0;
    float _1777 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1192);
    bool _1779 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1781 = isnan(_1076);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1787 = _1783 || _1785;
    float _1789 = float(_1787);
    float _1791 = _1765 * _1775;
    float _1793 = trunc(_1771);
    float _1795 = precise::max(_1793, 0.0);
    uint _1797 = uint(_1795);
    float _1799 = -_1765;
    float _1801 = _1799 + 1.0;
    float _1803 = -_1777;
    float _1805 = fma(_1597, _1275, _1803);
    bool _1807 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1809 = isnan(_1076);
    bool _1811 = _1807 || _1809;
    bool _1813 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1815 = _1811 || _1813;
    float _1817 = float(_1815);
    float _1819 = _1789 * _1801;
    float _1821 = -_1789;
    float _1823 = _1821 + 1.0;
    float _1825 = _1729;
    if (_1319)
    {
        _1164 = _1120;
    }
    float _1827 = _1164;
    float _1829 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1831 = _1827;
    if (!_1319)
    {
        _1831 = _1098;
    }
    float _1833 = _1831;
    float _1835 = _1817 * _1823;
    float _1837 = -_1817;
    float _1839 = _1837 + 1.0;
    float _1841 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1843 = _1687 * _1839;
    float _1845 = fma(_1829, _1279, -0.5);
    int _1847 = _1591 * int(_1797);
    int _1849 = _1847 + _1727;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1853 = _1431 * _1843;
    float _1855 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1753);
    float _1857 = _1851;
    float _1859 = _1853;
    if (_1353)
    {
        float _1861 = -_1110;
        float _1863 = _1861 + 1.0;
        _1599 = as_type<int>(_1863);
    }
    int _1865 = _1599;
    float _1867 = float(uint(_1849));
    float _1869 = -_1851;
    float _1871 = fma(_1841, 2.0, _1869);
    float _1873 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1729);
    float _1875 = _1873;
    if (!_1353)
    {
        _1825 = _1110;
    }
    float _1877 = _1825;
    float _1879 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1731);
    float _1881 = as_type<float>(_1180) * _1867;
    float _1883 = _1877;
    if (_1353)
    {
        float _1885 = _1150 ? as_type<float>(_1865) : _1110;
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = -_1687;
    float _1891 = _1889 + 1.0;
    float _1893 = trunc(_1881);
    float _1895 = precise::max(_1893, 0.0);
    uint _1897 = uint(_1895);
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1357)
    {
        _1857 = _1110;
    }
    float _1901 = _1857;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1905 = _1901;
    if (_1357)
    {
        float _1907 = _1148 ? as_type<float>(_1543) : _1110;
        _1905 = _1907;
    }
    float _1909 = _1905;
    float _1911 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1899);
    float _1913 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1917 = float(uint(_1637));
    float _1919 = fma(_1891, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1853);
    float _1921 = -_1903;
    float _1923 = fma(_1913, 2.0, _1921);
    int _1925 = int(_1797) + int(_1897);
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1929 = ~_1096;
    int _1931 = _1929 + 1;
    float _1933 = as_type<float>(_1180) * _1917;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1319)
    {
        _1166 = _1098;
    }
    float _1937 = _1166;
    float _1939 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1927);
    int _1941 = _1931 * _1925;
    int _1943 = _1941 + _1727;
    float _1945 = _1937;
    if (!_1319)
    {
        _1859 = _1098;
    }
    float _1947 = _1859;
    float _1949 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1935);
    float _1951 = _1947;
    if (_1319)
    {
        _1168 = _1086;
    }
    float _1953 = _1168;
    float _1955 = trunc(_1933);
    float _1957 = precise::max(_1955, 0.0);
    uint _1959 = uint(_1957);
    float _1961 = _1953;
    if (_1319)
    {
        _1945 = _1086;
    }
    float _1963 = _1945;
    float _1965 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1319)
    {
        _1951 = _1086;
    }
    float _1967 = _1951;
    float _1969 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1319)
    {
        _1961 = _1120;
    }
    float _1971 = _1961;
    float _1973 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1975 = uint(_1943) >= uint(_1096);
    float _1977 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1969);
    float _1979 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1965);
    float _1981 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1973);
    bool _1983 = !_1975;
    int _1985 = _1983 ? 0 : (-1);
    float _1987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1989 = fma(_1497, _1835, _1919);
    int _1991 = ~_1096;
    int _1993 = _1991 + 1;
    float _1995 = fma(_1963, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1915);
    int _1997 = ~_1925;
    int _1999 = _1997 + _1985;
    int _2001 = _1999 + 1;
    float _2003 = fma(_1505, _1819, _1989);
    float _2005 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1939);
    int _2007 = _1096 * _2001;
    int _2009 = _2007 + _1727;
    float _2011 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2013 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2015 = _1993 * int(_1959);
    int _2017 = _2015 + _1637;
    bool _2019 = !_1583;
    int _2021 = _2019 ? _2009 : (-1);
    float _2023 = -_120;
    float _2025 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1923);
    float _2027 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2029 = -_120;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1871);
    float _2033 = float(uint(_2017));
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2037 = _2021 >> 31;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2041 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2043 = as_type<float>(_1180) * _2033;
    int _2045 = _2037 & 3;
    float _2047 = -_120;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1293);
    float _2051 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2053 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1911);
    int _2055 = _2021 + _2045;
    float _2057 = fma(_2005, _2013, _2049);
    float _2059 = fma(_2051, _1887, -0.5);
    float _2061 = trunc(_2043);
    float _2063 = precise::max(_2061, 0.0);
    uint _2065 = uint(_2063);
    int _2067 = _2055 >> 2;
    float _2069 = fma(_2027, _1909, -0.5);
    float _2071 = fma(_2053, _2059, _2025);
    float _2073 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1949);
    int _2075 = _2067 << 4;
    int _2077 = _2075 + 368;
    float _2079 = fma(_2041, -2.0, _2039);
    float _2081 = fma(_1527, _1791, _2003);
    float _2083 = fma(_2073, _2069, _2031);
    uint _2085 = uint(int(uint(_2077) >> uint(2)));
    uint _2087 = uint(int(uint(int(_2085)) >> uint(2)));
    int _2089 = int(_2085) & 3;
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[int(_2087)][_2089];
    int _2093 = int(_2085) + 1;
    uint _2095 = uint(int(uint(_2093) >> uint(2)));
    int _2097 = _2093 & 3;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[int(_2095)][_2097];
    float _2101 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2103 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2105 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2079);
    float _2107 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1995);
    float _2109 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2111 = _1545 + _2101;
    float _2113 = _1551 + _2103;
    float _2115 = -_2105;
    float _2117 = fma(_2107, _1845, _2115);
    int _2119 = _2021 & 3;
    bool _2121 = _2119 != 0;
    int _2123 = _2077 + 8;
    uint _2125 = uint(int(uint(_2123) >> uint(2)));
    uint _2127 = uint(int(uint(int(_2125)) >> uint(2)));
    int _2129 = int(_2125) & 3;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[int(_2127)][_2129];
    int _2133 = int(_2125) + 1;
    uint _2135 = uint(int(uint(_2133) >> uint(2)));
    int _2137 = _2133 & 3;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[int(_2135)][_2137];
    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2143 = _2111 + _2141;
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2147 = _2113 + _2145;
    int _2149 = ~_1096;
    int _2151 = _2149 + 1;
    float _2153 = fma(_2109, -2.0, _2035);
    int _2155 = int(_1959) + int(_2065);
    float _2157 = _2143 * _2143;
    int _2159 = _2021 & 3;
    bool _2161 = _2159 != 0;
    float _2163 = _2147 * _2147;
    bool _2165 = uint(_2119) > 1u;
    int _2167 = _2151 * _2155;
    int _2169 = _2167 + _1637;
    int _2171 = _2161 ? 0 : 1;
    float _2173 = _2157 + _2163;
    float _2175 = fma(_1529, _1769, _2081);
    float _2177 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1639);
    bool _2179 = uint(_2169) >= uint(_1096);
    float _2181 = sqrt(_2173);
    int _2183 = ~_2171;
    int _2185 = _2183 + 1;
    int _2187 = _2185 + 1;
    float _2189 = fma(_1535, _1733, _2175);
    bool _2191 = !_2179;
    int _2193 = _2191 ? 0 : (-1);
    float _2195 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2153);
    bool _2197 = uint(_2119) >= 2u;
    int _2199 = _2187;
    float _2201 = _2157;
    float _2203 = _2163;
    float _2205 = _2111;
    float _2207 = _2113;
    float _2209 = _2071;
    if (!_2165)
    {
        int _2211 = ~_2171;
        int _2213 = _2211 + 1;
        _2199 = _2213;
    }
    int _2215 = _2199;
    bool _2217 = _2119 != 3;
    int _2219 = ~_2155;
    int _2221 = _2219 + _2193;
    int _2223 = _2221 + 1;
    bool _2225 = !_2121;
    int _2227 = _2225 ? 0 : 1;
    int _2229 = abs(_2215);
    float _2231 = _1873 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2233 = abs(_2227);
    int _2235 = ~_2229;
    int _2237 = _2235 + 1;
    int _2239 = _2237 + 1;
    int _2241 = _2197 ? 0 : 1;
    bool _2243 = _2119 != 3;
    int _2245 = _2239 * as_type<int>(_2099);
    float _2247 = _1481 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2249 = _2181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2251 = ~_2241;
    int _2253 = _2251 + 1;
    int _2255 = _2253 + 1;
    int _2257 = _2255;
    if (_2217)
    {
        int _2259 = ~_2241;
        int _2261 = _2259 + 1;
        _2257 = _2261;
    }
    int _2263 = _2257;
    int _2265 = ~_2233;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    bool _2271 = !_2243;
    int _2273 = _2271 ? 0 : (-1);
    int _2275 = abs(_2263);
    int _2277 = _2269 * as_type<int>(_2091);
    int _2279 = _2277 + _2245;
    float _2281 = _2247 + _2231;
    int _2283 = abs(_2273);
    bool _2285 = !_1349;
    int _2287 = _2285 ? 0 : 1;
    int _2289 = abs(_2287);
    int _2291 = ~_2275;
    int _2293 = _2291 + 1;
    int _2295 = _2293 + 1;
    if (!_2249)
    {
        _1875 = _2281;
    }
    float _2297 = _1875;
    bool _2299 = !_2249;
    float _2301 = _2297;
    if (!_2299)
    {
        float _2303 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2307 = _2181 + _2305;
        float _2309 = rsqrt(_2173);
        float _2311 = _2307 * _2303;
        float _2313 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2315 = _2311 * 0.15915493667125701904296875;
        float _2317 = _2315 * 6.283185482025146484375;
        float _2319 = sin(_2317);
        float _2321 = _2315 * 6.283185482025146484375;
        float _2323 = cos(_2321);
        float _2325 = fma(_2319, _2313, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2327 = _2309 * _2325;
        float _2329 = fma(_2143, _2327, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2331 = _2323 + (-1.0);
        float _2333 = fma(_2147, _2327, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2337 = _2329 + _2335;
        float _2339 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2343 = _2333 + _2341;
        float _2345 = _2337 * _2337;
        float _2347 = fma(_2281, _2323, _2339);
        float _2349 = _2343 * _2343;
        _2301 = _2347;
        _2201 = _2345;
        _2203 = _2349;
        _2205 = _2329;
        _2207 = _2333;
    }
    float _2351 = _2301;
    float _2353 = _2201;
    float _2355 = _2203;
    float _2357 = _2205;
    float _2359 = _2207;
    int _2361 = _1096 * _2223;
    int _2363 = _2361 + _1637;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2367 = _2351 + _2365;
    int _2369 = _2295 * as_type<int>(_2131);
    int _2371 = _2369 + _2279;
    int _2373 = ~_2283;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = fma(_2367, _2367, _2353);
    int _2381 = ~_2289;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    float _2387 = -_2195;
    float _2389 = fma(_2177, _1627, _2387);
    float _2391 = fma(_1693, _1701, _2189);
    int _2393 = _2377 * as_type<int>(_2139);
    int _2395 = _2393 + _2371;
    float _2397 = _2379 + _2355;
    bool _2399 = !_1583;
    int _2401 = _2399 ? _2363 : (-1);
    float _2403 = _2389 + 0.5;
    int _2405 = _2395 * _2385;
    float _2407 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2391);
    float _2409 = _2083 + 0.5;
    float _2411 = sqrt(_2397);
    int _2413 = _2401 * _2289;
    int _2415 = _2413 + _2405;
    float _2417 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1977);
    float _2419 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1979);
    float _2421 = _1805 + 0.5;
    float _2423 = _2057 + 0.5;
    float _2425 = _2071 + 0.5;
    float _2427 = _2117 + 0.5;
    float _2429 = float(_2415);
    float _2431 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1981);
    out.m_75.x = _2409;
    out.m_75.y = _2403;
    out.m_77.x = _2423;
    out.m_77.y = _2421;
    out.m_77.z = _2425;
    out.m_77.w = _2427;
    bool _2433 = _2411 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2435 = isnan(_2411);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2441 = _2437 || _2439;
    out.m_79.x = _2407;
    out.m_81.x = _2429;
    out.m_83.x = _2417;
    out.m_83.y = _2419;
    out.m_83.z = _2431;
    float _2443 = as_type<float>(_2415);
    float _2445 = _2367;
    if (!_2441)
    {
        _2443 = 1.0;
    }
    float _2447 = _2443;
    bool _2449 = !_2441;
    float _2451 = _2447;
    if (!_2449)
    {
        bool _2453 = _2411 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2455 = isnan(_2411);
        bool _2457 = _2453 || _2455;
        bool _2459 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2461 = _2457 || _2459;
        if (!_2461)
        {
            float _2463 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2465 = _2411 + _2463;
            float _2467 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2469 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2467;
            float _2471 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2473 = _2471 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2475 = 1.0 / _2469;
            float _2477 = _2465 * _2475;
            float _2479 = fma(_2477, _2473, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2451 = _2479;
            _2445 = _2473;
            _2481 = true;
        }
        else
        {
            bool _2483 = _2411 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2485 = isnan(_2411);
            bool _2487 = _2483 || _2485;
            bool _2489 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2491 = _2487 || _2489;
            if (!_2491)
            {
                float _2493 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2495 = _2411 + _2493;
                float _2497 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2499 = _2497 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2501 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2503 = _2501 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2505 = 1.0 / _2499;
                float _2507 = _2495 * _2505;
                float _2509 = fma(_2507, _2503, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2451 = _2509;
                _2445 = _2503;
                _2481 = true;
            }
            else
            {
                _2451 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2481 = false;
    float _2511 = _2451;
    float _2513 = _2445;
    float _2515 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2517 = _2357 + _2515;
    float _2519 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2521 = _2351 + _2519;
    float _2523 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2525 = _2359 + _2523;
    bool _2527 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2529 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2531 = _2527 || _2529;
    bool _2533 = isnan(0.5);
    bool _2535 = _2531 || _2533;
    float _2537 = fma(_2517, _2511, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2539 = fma(_2521, _2511, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2541 = fma(_2525, _2511, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2543 = _2511;
    float _2545 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2547 = _2513;
    if (_2535)
    {
        _2543 = _2537;
    }
    float _2549 = _2543;
    float _2551 = _2549;
    if (_2535)
    {
        _2545 = _2539;
    }
    float _2553 = _2545;
    float _2555 = _2553;
    if (_2535)
    {
        _2547 = _2541;
    }
    float _2557 = _2547;
    float _2559 = _2557;
    if (!_2535)
    {
        float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2563 = _2247 + _2561;
        float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2567 = _1545 + _2565;
        float _2569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2571 = _2563 * _2563;
        float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2575 = _1551 + _2573;
        float _2577 = fma(_2567, _2567, _2571);
        float _2579 = fma(_2575, _2575, _2577);
        float _2581 = -_1545;
        float _2583 = _2581 + _2537;
        float _2585 = -_2247;
        float _2587 = _2585 + _2539;
        float _2589 = -_1551;
        float _2591 = _2589 + _2541;
        float _2593 = sqrt(_2579);
        float _2595 = precise::min(_2593, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2597 = _2595 * _2569;
        float _2599 = fma(_2583, _2597, _1545);
        float _2601 = fma(_2587, _2597, _2247);
        float _2603 = fma(_2591, _2597, _1551);
        _2555 = _2601;
        _2551 = _2599;
        _2559 = _2603;
    }
    float _2605 = _2555;
    float _2607 = _2551;
    float _2609 = _2559;
    float _2611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2613 = _2605 + _2611;
    float _2615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2617 = _2607 + _2615;
    float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2621 = _2609 + _2619;
    float _2623 = _2613 * _2613;
    float _2625 = fma(_2617, _2617, _2623);
    float _2627 = fma(_2621, _2621, _2625);
    float _2629 = rsqrt(_2627);
    float _2631 = sqrt(_2627);
    float _2633 = _2629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2635 = _2617 * _2633;
    float _2637 = _2621 * _2633;
    float _2639 = _2635 * _2635;
    float _2641 = _2637 * _2637;
    float _2643 = _2639 + _2641;
    float _2645 = sqrt(_2643);
    bool _2647 = _2645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2651 = _2645 + _2649;
    float _2653 = _2629;
    float _2655 = _2643;
    float _2657 = _2651;
    float _2659 = _2613;
    float _2661 = _2633;
    if (_2647)
    {
        float _2663 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2653 = _2663;
    }
    float _2665 = _2653;
    if (_2647)
    {
        float _2667 = rsqrt(_2643);
        _2655 = _2667;
    }
    float _2669 = _2655;
    float _2671 = _2669;
    if (_2647)
    {
        float _2673 = _2651 * _2665;
        _2657 = _2673;
    }
    float _2675 = _2657;
    if (_2647)
    {
        float _2677 = _2675 * 0.15915493667125701904296875;
        _2209 = _2677;
    }
    float _2679 = _2209;
    float _2681 = _2665;
    float _2683 = _2679;
    if (_2647)
    {
        float _2685 = _2679 * 6.283185482025146484375;
        float _2687 = sin(_2685);
        _2681 = _2687;
    }
    float _2689 = _2681;
    float _2691 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2693 = precise::max(0.0, _2691);
    float _2695 = _2621;
    float _2697 = _2693;
    if (_2647)
    {
        float _2699 = _2679 * 6.283185482025146484375;
        float _2701 = cos(_2699);
        _2695 = _2701;
    }
    float _2703 = _2695;
    float _2705 = -_2633;
    float _2707 = -_2693;
    float _2709 = fma(_2613, _2705, _2707);
    if (_2647)
    {
        float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2697 = _2711;
    }
    float _2713 = _2697;
    float _2715 = _2713;
    if (!_2647)
    {
        _2683 = _2635;
    }
    float _2717 = _2683;
    float _2719 = _2689;
    float _2721 = _2717;
    if (_2647)
    {
        float _2723 = fma(_2689, _2713, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2715 = _2723;
    }
    float _2725 = _2715;
    if (!_2647)
    {
        _2719 = _2709;
    }
    float _2727 = _2719;
    float _2729 = _2727;
    float _2731 = _2703;
    if (_2647)
    {
        float _2733 = _2703 + (-1.0);
        _2659 = _2733;
    }
    float _2735 = _2659;
    float _2737 = _2735;
    if (_2647)
    {
        float _2739 = _2669 * _2725;
        _2661 = _2739;
    }
    float _2741 = _2661;
    if (!_2647)
    {
        _2671 = _2641;
    }
    float _2743 = _2671;
    float _2745 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2747 = _2743;
    if (_2647)
    {
        float _2749 = _2735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2737 = _2749;
    }
    float _2751 = _2737;
    float _2753 = _2751;
    if (_2647)
    {
        float _2755 = _2635 * _2741;
        _2721 = _2755;
    }
    float _2757 = _2721;
    if (_2647)
    {
        float _2759 = fma(_2709, _2703, _2751);
        _2729 = _2759;
    }
    float _2761 = _2729;
    if (!_2647)
    {
        _2753 = _2637;
    }
    float _2763 = _2753;
    float _2765 = _2763;
    if (_2647)
    {
        float _2767 = _2637 * _2741;
        _2765 = _2767;
    }
    float _2769 = _2765;
    if (!_2647)
    {
        _2731 = _2639;
    }
    float _2771 = _2731;
    float _2773 = _2771;
    if (_2647)
    {
        float _2775 = _2757 * _2757;
        _2773 = _2775;
    }
    float _2777 = _2773;
    if (_2647)
    {
        float _2779 = _2769 * _2769;
        _2747 = _2779;
    }
    float _2781 = _2747;
    float _2783 = fma(_2761, _2761, _2777);
    float _2785 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2787 = fma(_1545, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2789 = _2783 + _2781;
    float _2791 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2785);
    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2795 = fma(_2631, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2793);
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = rsqrt(_2789);
    float _2801 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2791);
    float _2803 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2805 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2807 = -_2797;
    float _2809 = _2807 + 1.0;
    float _2811 = _2801 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2813 = floor(_2787);
    float _2815 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2817 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2819 = -_2815;
    float _2821 = fma(_2819, _2805, 1.0);
    float _2823 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2825 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2817);
    float _2827 = _2799 * _2757;
    float _2829 = _2799 * _2761;
    float _2831 = _2799 * _2769;
    float _2833 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2823);
    float _2835 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2825);
    float _2837 = abs(_2809);
    float _2839 = log2(_2837);
    float _2841 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2843 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2833);
    float _2845 = _2835 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2847 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2745);
    float _2849 = -_2841;
    float _2851 = fma(_2829, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2849);
    float _2853 = _2843 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2855 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2857 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2847);
    float _2859 = -_2831;
    float _2861 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2851);
    float _2863 = floor(_2803);
    float _2865 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2855);
    float _2867 = _2857 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2869 = fma(_2861, -0.5, 0.5);
    float _2871 = -_2813;
    float _2873 = _2787 + _2871;
    float _2875 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2865);
    float _2877 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2879 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2881 = fma(_2861, 0.5, 0.5);
    float _2883 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2875);
    float _2885 = log2(_2821);
    float _2887 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2889 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2879);
    float _2891 = _2829 + 1.0;
    float _2893 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2887);
    float _2895 = -_2863;
    float _2897 = _2803 + _2895;
    float _2899 = exp2(_2877);
    float _2901 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2893);
    float _2903 = fma(_2881, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2905 = fma(_2881, _2903, -0.212114393711090087890625);
    float _2907 = 1.0 / _2883;
    float _2909 = _2885 * 0.693147182464599609375;
    float _2911 = sqrt(_2869);
    float _2913 = -_2829;
    float _2915 = fma(_2899, _2891, _2913);
    float2 _8014 = float2(_2873, _2897);
    float _2917 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8014, float2(0.0), isnan(_8014)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8014, float2(0.0), isnan(_8014)), level(0.0)).x;
    float _2919 = fma(_2881, _2905, 1.570728778839111328125);
    float _2921 = fma(_2915, 0.5, 0.5);
    float _2923 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2889);
    float _2925 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2923);
    float _2927 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2901);
    float _2929 = _2911 * 0.636619746685028076171875;
    float _2931 = _2925 * _2907;
    float _2933 = _2927 * _2907;
    float _2935 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2937 = -_2919;
    float _2939 = fma(_2929, _2937, 1.0);
    float _2941 = fma(_2931, 0.5, 0.5);
    float _2943 = fma(_2933, -0.5, 0.5);
    float3 _8068 = float3(_2941, _2943, _2935);
    float _2945 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8068, float3(0.0), isnan(_8068)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8068, float3(0.0), isnan(_8068)), level(0.0)).x;
    float3 _8079 = float3(_2941, _2943, _2935);
    float4 _2948 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8079, float3(0.0), isnan(_8079)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8079, float3(0.0), isnan(_8079)), level(0.0)).xyzw;
    float _2950 = _2948.x;
    float _2952 = _2948.y;
    float _2954 = _2948.z;
    float _2956 = _2948.w;
    float2 _8095 = float2(_2939, _2921);
    float3 _2960 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8095, float2(0.0), isnan(_8095)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8095, float2(0.0), isnan(_8095)), level(0.0)).xyz;
    float _2962 = _2960.x;
    float _2964 = _2960.y;
    float _2966 = _2960.z;
    float _2968 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2970 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2972 = _2811 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2974 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2976 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2968);
    float _2978 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2970);
    float _2980 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2974);
    float _2982 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2976);
    float _2984 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2978);
    bool _2986 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2988 = isnan(_2631);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2994 = _2990 || _2992;
    float _2996 = _2982 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2998 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3000 = 1.0 / _2996;
    float _3002 = _2998 + _2996;
    float _3004 = _3002 * 0.5;
    float _3006 = _3004 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3008 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3010 = fma(_3006, _3000, _3008);
    float _3012 = _3004 + _3010;
    float _3014 = _3012 * _3000;
    float _3016 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3018 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3016);
    float _3020 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2865);
    float _3022 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2980);
    float _3024 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3020);
    float _3026 = 1.0 / _3018;
    float _3028 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3022);
    float _3030 = _2925 + _2883;
    float _3032 = _3030 * 0.5;
    float _3034 = 1.0 / _3024;
    float _3036 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3038 = _3026 * _3036;
    float _3040 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3042 = abs(_3038);
    float _3044 = log2(_3042);
    float _3046 = _3028 * _3034;
    bool _3048 = _3038 <= 8000.0;
    bool _3050 = isnan(_3038);
    bool _3052 = _3048 || _3050;
    bool _3054 = isnan(8000.0);
    bool _3056 = _3052 || _3054;
    float _3058 = float(_3056);
    float _3060 = in.m_85.x;
    float _3062 = exp2(_3040);
    float _3064 = _2883 * _3046;
    out.gl_Position.x = _2925;
    out.gl_Position.y = _2927;
    out.gl_Position.z = _3064;
    out.gl_Position.w = _2883;
    float _3066 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3068 = exp2(_3066);
    float _3070 = -_3062;
    float _3072 = _3070 + 1.0;
    float _3074 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3076 = _2925;
    float _3078 = _3064;
    float _3080 = _2883;
    float _3082 = _2927;
    if (!_2994)
    {
        _3076 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3084 = _3076;
    float _3086 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3088 = precise::clamp(_3086, 0.0, 1.0);
    float _3090 = fma(_3088, -2.0, 3.0);
    float _3092 = _3088 * _3088;
    float _3094 = _3092 * _3090;
    float _3096 = _2883 + _3064;
    float _3098 = _3084;
    float _3100 = _3084;
    if (!_2994)
    {
        _3078 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3102 = _3078;
    float _3104 = -_3094;
    float _3106 = _3104 + 1.0;
    float _3108 = _3096 * 0.5;
    float _3110 = fma(_3106, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3094);
    float _3112 = _2883 * 0.5;
    float _3114 = _3102;
    float _3116 = _3102;
    if (!_2994)
    {
        _3080 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3118 = _3080;
    float _3120 = _3058 * _3110;
    float _3122 = fma(_2927, -0.5, _3112);
    float _3124 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3126 = _3118;
    float _3128 = _3118;
    if (!_2994)
    {
        _3082 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3130 = _3082;
    out.m_87.x = _3032;
    out.m_87.y = _3122;
    out.m_87.z = _3108;
    out.m_87.w = _2883;
    float _3132 = -_2917;
    float _3134 = _3132 + 1.0;
    float _3136 = _3134 * _3124;
    float _3138 = precise::clamp(_3136, 0.0, 1.0);
    float _3140 = -_3138;
    float _3142 = fma(_3140, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3144 = -_3074;
    float _3146 = _3144 + 1.0;
    float _3148 = _3142 * _3060;
    float _3150 = _3148 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3152 = _3148;
    float _3154 = _3146;
    float _3156 = _3130;
    float _3158 = _3130;
    if (!_2994)
    {
        _3152 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3160 = _3152;
    out.m_89.x = _3150;
    float _3162 = _3074 * _2945;
    float _3164 = _2956 * _3162;
    float _3166 = _2966 * _3162;
    float _3168 = fma(_2962, _3164, _2950);
    float _3170 = fma(_2964, _3164, _2952);
    float _3172 = _2956 * _3146;
    float _3174 = fma(_2956, _3166, _2954);
    float _3176 = _3160;
    float _3178 = _3160;
    if (!_2994)
    {
        _3154 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3180 = _3154;
    out.m_91.x = _3168;
    out.m_91.y = _3170;
    out.m_91.z = _3174;
    out.m_91.w = _3172;
    bool _3182 = !_2994;
    float _3184 = _3180;
    float _3186 = _3180;
    if (!_3182)
    {
        bool _3188 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3190 = isnan(_2631);
        bool _3192 = _3188 || _3190;
        bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3196 = _3192 || _3194;
        if (!_3196)
        {
            float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3200 = _2631 + _3198;
            float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3204 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3202;
            float _3206 = 1.0 / _3204;
            float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3210 = _3208 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3212 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3214 = _3212 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3216 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3218 = _3216 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3228 = _3200 * _3206;
            float _3230 = precise::clamp(_3228, 0.0, 1.0);
            float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3236 = fma(_3230, _3210, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3238 = fma(_3230, _3234, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3240 = fma(_3230, _3214, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3242 = fma(_3230, _3218, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3244 = fma(_3230, _3222, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3246 = fma(_3230, _3226, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3178 = _3236;
            _3100 = _3244;
            _3116 = _3238;
            _3158 = _3242;
            _3128 = _3240;
            _3186 = _3246;
            _3248 = true;
        }
        else
        {
            bool _3250 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3252 = isnan(_2631);
            bool _3254 = _3250 || _3252;
            bool _3256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3258 = _3254 || _3256;
            if (!_3258)
            {
                _3114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3260 = _3114;
            _3116 = _3260;
            if (!_3258)
            {
                _3176 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3262 = _3176;
            _3178 = _3262;
            if (!_3258)
            {
                _3126 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3264 = _3126;
            _3128 = _3264;
            if (!_3258)
            {
                _3156 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3266 = _3156;
            _3158 = _3266;
            if (!_3258)
            {
                _3098 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3268 = _3098;
            _3100 = _3268;
            if (!_3258)
            {
                _3184 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3270 = _3184;
            bool _3272 = !_3258;
            _3186 = _3270;
            if (!_3272)
            {
                bool _3274 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3276 = isnan(_2631);
                bool _3278 = _3274 || _3276;
                bool _3280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3282 = _3278 || _3280;
                if (!_3282)
                {
                    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3286 = _2631 + _3284;
                    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3290 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3288;
                    float _3292 = 1.0 / _3290;
                    float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3296 = _3294 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3300 = _3298 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3314 = _3286 * _3292;
                    float _3316 = precise::clamp(_3314, 0.0, 1.0);
                    float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3322 = fma(_3316, _3296, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3324 = fma(_3316, _3320, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3326 = fma(_3316, _3300, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3328 = fma(_3316, _3304, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3330 = fma(_3316, _3308, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3332 = fma(_3316, _3312, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3178 = _3322;
                    _3100 = _3330;
                    _3116 = _3324;
                    _3158 = _3328;
                    _3128 = _3326;
                    _3186 = _3332;
                    _3248 = true;
                }
                else
                {
                    _3178 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3100 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3158 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3128 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3186 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3248 = false;
    float _3334 = _3178;
    float _3336 = _3100;
    float _3338 = _3116;
    float _3340 = _3158;
    float _3342 = _3128;
    float _3344 = _3186;
    float _3346 = fma(_2419, -0.5, 0.5);
    float _3348 = precise::clamp(_3346, 0.0, 1.0);
    float _3350 = -_3334;
    float _3352 = _3350 + _3336;
    float _3354 = -_3338;
    float _3356 = _3354 + _3340;
    float _3358 = -_3342;
    float _3360 = _3358 + _3344;
    bool _3362 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3364 = fma(_3348, _3352, _3334);
    float _3366 = fma(_3348, _3356, _3338);
    float _3368 = fma(_3348, _3360, _3342);
    float _3370 = _3364 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3372 = fma(_3366, 0.298911988735198974609375, _3370);
    float _3374 = fma(_3368, 0.114477999508380889892578125, _3372);
    float _3376 = -_3374;
    float _3378 = _3366 + _3376;
    float _3380 = -_3374;
    float _3382 = _3364 + _3380;
    float _3384 = -_3374;
    float _3386 = _3368 + _3384;
    float _3388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3390 = fma(_3378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3374);
    float _3392 = fma(_3382, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3374);
    float _3394 = fma(_3386, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3374);
    out.m_55.x = _3388;
    out.m_95.x = _3390;
    out.m_95.y = _3392;
    out.m_95.z = _3394;
    if (!_3362)
    {
        return out;
    }
    float _3396 = -_2605;
    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3400 = -_2607;
    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3404 = -_2609;
    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3408 = _3398 * _3398;
    float _3410 = fma(_3402, _3402, _3408);
    float _3412 = fma(_3406, _3406, _3410);
    float _3414 = sqrt(_3412);
    float _3416 = rsqrt(_3412);
    float _3418 = -_3414;
    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3422 = _3420 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3424 = precise::clamp(_3422, 0.0, 1.0);
    float _3426 = _3402 * _3416;
    float _3428 = _3398 * _3416;
    float _3430 = abs(_3424);
    float _3432 = log2(_3430);
    float _3434 = _3406 * _3416;
    float _3436 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3438 = _2419 * _3428;
    float _3440 = -_3428;
    float _3442 = -_3436;
    float _3444 = fma(_3440, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3442);
    float _3446 = fma(_2417, _3426, _3438);
    float _3448 = -_3434;
    float _3450 = fma(_3448, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3444);
    float _3452 = fma(_2431, _3434, _3446);
    float _3454 = precise::clamp(_3452, 0.0, 1.0);
    float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3458 = _3450 + _3456;
    float _3460 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3462 = _3458 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3464 = precise::clamp(_3462, 0.0, 1.0);
    float _3466 = exp2(_3460);
    float _3468 = _3466 * _3464;
    float _3470 = _3454 * _3468;
    float _3472 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3474 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3476 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3472;
    out.m_93.y = _3474;
    out.m_93.z = _3476;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3248 = false;
    bool _2481 = false;
    bool _902 = false;
    bool _740 = false;
    bool _528 = false;
    bool _354 = false;
    bool _192 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_48.w;
    float _111 = in.m_50.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = _111;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _126;
    if (!_124)
    {
        out.m_55.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3543 = as_type<float>(_136);
        out.gl_Position.z = _3543;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _140 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_111);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = float(_116);
    bool _152 = _120 >= _150;
    bool _154 = !_148;
    bool _156 = _152 || _154;
    if (_156)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _128;
    if (_156)
    {
        out.m_55.x = 0.0;
    }
    if (_156)
    {
        float _160 = _158 * 5.0;
        _138 = as_type<int>(_160);
    }
    int _162 = _138;
    if (_156)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3598 = as_type<float>(_162);
        out.gl_Position.z = _3598;
    }
    if (_156)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = 1.0 / _150;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _120 * _164;
    bool _170 = !_166;
    float _172 = _168;
    float _190;
    if (!_170)
    {
        float _174 = in.m_57.x;
        float _176 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _178 = _174 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _180 = fma(_178, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _182 = _180 * _176;
        float _184 = floor(_182);
        float _186 = -_184;
        float _188 = _182 + _186;
        _190 = _188;
        _192 = true;
    }
    else
    {
        _190 = _168;
    }
    _192 = false;
    float _194 = _190;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = _194 + _196;
    bool _200 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _202 = isnan(_194);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _214 = _194 + _212;
    bool _216 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _218 = isnan(_194);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _236 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _238 = isnan(_194);
    bool _240 = _236 || _238;
    bool _242 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _244 = _240 || _242;
    float _246 = float(_244);
    float _248 = -_210;
    float _250 = _248 + 1.0;
    float _252 = 1.0 / _234;
    float _254 = _246 * _250;
    float _256 = -_246;
    float _258 = _256 + 1.0;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _260;
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _266 = 1.0 / _230;
    float _268 = _226 * _258;
    float _270 = -_226;
    float _272 = _270 + 1.0;
    float _274 = _214 * _252;
    float _276 = _198 * _266;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_262, _276, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = fma(_280, _276, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _290 = fma(_284, _276, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _292 = _286 * _268;
    float _294 = _288 * _268;
    float _296 = _290 * _268;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _308 = _306 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _310 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].x, _292);
    float _312 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].y, _294);
    float _314 = fma(_300, _274, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _316 = fma(_304, _274, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _318 = fma(_308, _274, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _320 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[143].z, _296);
    float _322 = fma(_314, _254, _310);
    float _324 = fma(_316, _254, _312);
    float _326 = fma(_318, _254, _320);
    float _328 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].x, _322);
    float _330 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].y, _324);
    float _332 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[145].z, _326);
    bool _334 = !_264;
    float _352;
    if (!_334)
    {
        float _336 = in.m_57.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].x, _120);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        _352 = _168;
    }
    _354 = false;
    float _356 = _352;
    float _358 = in.m_59.x;
    float _360 = in.m_59.y;
    float _362 = in.m_59.z;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _366 = _356 + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _368;
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _374 = 1.0 / _370;
    float _376 = _332 * _362;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _382 = _330 * _360;
    bool _384 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _386 = isnan(_356);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = _366 * _374;
    float _398 = 1.0 / _380;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _402 = _356 + _400;
    bool _404 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _406 = isnan(_356);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -_394;
    float _418 = _416 + 1.0;
    bool _420 = _356 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _422 = isnan(_356);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _432;
    float _436 = _430 * _418;
    float _438 = -_430;
    float _440 = _438 + 1.0;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _446;
    float _450 = fma(_434, _396, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _452 = _414 * _440;
    float _454 = fma(_444, _396, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _456 = fma(_448, _396, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _458 = _402 * _398;
    float _460 = _450 * _452;
    float _462 = _454 * _452;
    float _464 = _456 * _452;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _470 = -_414;
    float _472 = _470 + 1.0;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _482 = fma(_468, _458, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _484 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[107].x, _462);
    float _486 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[107].y, _460);
    float _488 = fma(_476, _458, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _490 = fma(_480, _458, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _492 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[107].z, _464);
    float _494 = fma(_482, _436, _486);
    float _496 = fma(_488, _436, _484);
    float _498 = fma(_490, _436, _492);
    float _500 = _328 * _358;
    float _502 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[109].y, _494);
    float _504 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[109].x, _496);
    float _506 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[109].z, _498);
    bool _508 = !_372;
    float _526;
    if (!_508)
    {
        float _510 = in.m_57.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _120);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        _526 = _168;
    }
    _528 = false;
    float _530 = _526;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _530 + _532;
    float _536 = _504 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _546;
    bool _550 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_530);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = 1.0 / _540;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _570 = isnan(_530);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = _502 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _582 = _506 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _584 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _586 = 1.0 / _544;
    float _588 = _548 * _562;
    bool _590 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_530);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = 1.0 / _566;
    float _604 = -_560;
    float _606 = _604 + 1.0;
    float _608 = fma(_588, _534, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _614 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _616 = isnan(_530);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = -_600;
    float _628 = _626 + 1.0;
    float _630 = _600 * _606;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _634 = _632 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _636 = 1.0 / _612;
    float _638 = -_624;
    float _640 = _638 + 1.0;
    float _642 = _578 * _628;
    float _644 = _634 * _586;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _646;
    float _650 = _560 * _640;
    float _652 = _608 * _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _530 + _654;
    float _658 = -_578;
    float _660 = _658 + 1.0;
    float _662 = _648 * _602;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _666 = _530 + _664;
    bool _668 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _670 = isnan(_530);
    bool _672 = _668 || _670;
    bool _674 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _676 = _672 || _674;
    float _678 = float(_676);
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _684 = fma(_644, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _686 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[115].x, _652);
    float _688 = fma(_662, _666, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _690 = _682 * _636;
    float _692 = -_678;
    float _694 = _692 + 1.0;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _698 = _530 + _696;
    float _700 = fma(_684, _630, _686);
    float _702 = _624 * _694;
    float _704 = fma(_690, _698, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _706 = fma(_688, _650, _700);
    float _708 = _536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = fma(_704, _702, _706);
    float _712 = _580 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[119].x, _710);
    float _716 = _582 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _714 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _708;
    out.m_61.y = _712;
    out.m_61.z = _716;
    out.m_61.w = _718;
    bool _720 = !_584;
    float _738;
    if (!_720)
    {
        float _722 = in.m_57.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].z, _120);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _738 = _736;
        _740 = true;
    }
    else
    {
        _738 = _168;
    }
    _740 = false;
    float _742 = _738;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _746 = _742 + _744;
    bool _748 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _750 = isnan(_742);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _762 = _742 + _760;
    bool _764 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _766 = isnan(_742);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _784 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _786 = isnan(_742);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -_758;
    float _798 = _796 + 1.0;
    float _800 = 1.0 / _782;
    float _802 = _794 * _798;
    float _804 = -_794;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _808;
    bool _812 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _814 = 1.0 / _778;
    float _816 = _774 * _806;
    float _818 = -_774;
    float _820 = _818 + 1.0;
    float _822 = _746 * _814;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _824;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _828;
    float _832 = fma(_810, _822, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _834 = fma(_826, _822, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _836 = fma(_830, _822, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _838 = _762 * _800;
    float _840 = _832 * _816;
    float _842 = _834 * _816;
    float _844 = _836 * _816;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _852 = _850 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _858 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[123].x, _840);
    float _860 = fma(_848, _838, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _862 = fma(_852, _838, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _864 = fma(_856, _838, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _866 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[123].y, _842);
    float _868 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[123].z, _844);
    float _870 = fma(_860, _802, _858);
    float _872 = fma(_862, _802, _866);
    float _874 = fma(_864, _802, _868);
    float _876 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[125].x, _870);
    float _878 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[125].y, _872);
    float _880 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[125].z, _874);
    bool _882 = !_812;
    float _900;
    if (!_882)
    {
        float _884 = in.m_57.x;
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _888 = _884 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _890 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _892 = _890 * _886;
        float _894 = floor(_892);
        float _896 = -_894;
        float _898 = _892 + _896;
        _900 = _898;
        _902 = true;
    }
    else
    {
        _900 = _168;
    }
    _902 = false;
    float _904 = _900;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _908 = _904 + _906;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _916 = _914 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _918 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _920 = isnan(_904);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _934 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _936 = isnan(_904);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = 1.0 / _912;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _950 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _948;
    float _952 = -_928;
    float _954 = _952 + 1.0;
    bool _956 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _958 = isnan(_904);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    bool _968 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _970 = 1.0 / _916;
    float _972 = 1.0 / _932;
    float _974 = _950 * _946;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _980 = _944 * _954;
    float _982 = -_944;
    float _984 = _982 + 1.0;
    float _986 = fma(_974, _908, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _988 = _904 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _990 = isnan(_904);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = _966 * _984;
    float _1002 = _978 * _970;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1010 = _904 + _1008;
    float _1012 = _986 * _1000;
    float _1014 = -_966;
    float _1016 = _1014 + 1.0;
    float _1018 = -_998;
    float _1020 = _1018 + 1.0;
    float _1022 = fma(_1002, _1010, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1024 = _1006 * _972;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1028 = _904 + _1026;
    float _1030 = fma(_1016, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1012);
    float _1032 = _928 * _1020;
    float _1034 = _880 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1036 = fma(_1024, _1028, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1038 = fma(_1022, _980, _1030);
    float _1040 = _878 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1042 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1044 = fma(_1036, _1032, _1038);
    float _1046 = _876 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1048 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1050 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1044);
    float _1052 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1054 = _1050 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_63.x = _1052;
    out.m_63.y = _1048;
    out.m_63.z = _1042;
    out.m_63.w = _1054;
    bool _1056 = !_968;
    float _1058 = _1052;
    if (!_1056)
    {
        float _1060 = in.m_57.x;
        float _1062 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1064 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1066 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[14].x, _120);
        float _1068 = _1066 * _1062;
        float _1070 = floor(_1068);
        float _1072 = -_1070;
        float _1074 = _1068 + _1072;
        _172 = _1074;
    }
    float _1076 = _172;
    float _1078 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1080 = int(_1078);
    float _1082 = in.m_65.y;
    float _1084 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1086 = in.m_57.y;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1090 = _1088 != 0;
    float _1092 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1094 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1096 = int(_1094);
    float _1098 = in.m_57.z;
    int _1100 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1102 = _1100 != 0;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1106 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1108 = _1106 != 0;
    float _1110 = in.m_65.x;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1114 = _1112 != 0;
    float _1116 = _382 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1118 = float(_1080);
    float _1120 = in.m_57.x;
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1124 = _1076 + _1122;
    float _1126 = 1.0 / _1118;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1130 = _1128 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1132 = float(uint(_1096));
    float _1134 = -_1082;
    float _1136 = _1134 + 1.0;
    int _1138 = ~_1096;
    int _1140 = _1138 + 1;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1144 = _1142 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1146 = 1.0 / _1132;
    bool _1148 = _1086 > 0.5;
    bool _1150 = _1098 > 0.5;
    float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1154 = _1152 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _1156 = _1150 ? as_type<int>(_1136) : as_type<int>(_1082);
    float _1158 = _120 * _1126;
    bool _1160 = _1108;
    float _1162 = _1082;
    float _1164 = _1076;
    float _1166 = _1110;
    float _1168 = _1098;
    if (!_1090)
    {
        _1058 = _1110;
    }
    float _1170 = _1058;
    float _1172 = in.m_57.w;
    float _1174 = _1114 ? as_type<float>(_1156) : _1082;
    float _1176 = 1.0 / _1130;
    float _1178 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1180 = as_type<int>(_1146) + (-2);
    float _1182 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1184 = trunc(_1158);
    int _1186 = int(_1184);
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1190 = _1188 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1192 = fma(_1178, -2.0, _1182);
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1196 = _1194 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1200 = _1198 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1202 = 1.0 / _1144;
    float _1204 = float(_1096);
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1206;
    bool _1210 = _1172 > 0.5;
    float _1212 = 1.0 / _1154;
    float _1214 = float(uint(_1186));
    int _1216 = ~_1096;
    int _1218 = _1216 + 1;
    float _1220 = as_type<float>(_1180) * _1214;
    float _1222 = 1.0 / _1190;
    float _1224 = trunc(_1220);
    float _1226 = precise::max(_1224, 0.0);
    uint _1229 = uint(_1226);
    float _1231 = 1.0 / _1196;
    int _1233 = _1140 * int(_1229);
    int _1235 = _1233 + _1186;
    float _1237 = 1.0 / _1200;
    float _1239 = float(uint(_1235));
    float _1241 = as_type<float>(_1180) * _1239;
    float _1243 = in.m_67.w;
    float _1245 = trunc(_1241);
    float _1247 = precise::max(_1245, 0.0);
    uint _1249 = uint(_1247);
    float _1251 = _1208 * _1237;
    int _1253 = _1148 ? as_type<int>(_1136) : as_type<int>(_1082);
    float _1255 = _1108 ? as_type<float>(_1253) : _1082;
    int _1257 = _1253;
    float _1259 = _1170;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[80].y);
    if (_1090)
    {
        float _1263 = -_1110;
        float _1265 = _1263 + 1.0;
        _1257 = as_type<int>(_1265);
    }
    int _1267 = _1257;
    if (_1090)
    {
        bool _1269 = _1120 > 0.5;
        _1160 = _1269;
    }
    bool _1271 = _1160;
    int _1273 = int(_1229) + int(_1249);
    float _1275 = fma(_1255, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    if (_1102)
    {
        float _1277 = _1210 ? _1136 : _1082;
        _1162 = _1277;
    }
    float _1279 = _1162;
    float _1281 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1090)
    {
        float _1283 = _1271 ? as_type<float>(_1267) : _1110;
        _1259 = _1283;
    }
    float _1285 = _1259;
    int _1287 = _1218 * _1273;
    int _1289 = _1287 + _1186;
    out.m_69.w = _1243;
    float _1291 = -_1104;
    float _1293 = fma(_1281, 2.0, _1291);
    bool _1295 = uint(_1289) >= uint(_1096);
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1299 = _1297 != 0;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1303 = _1301 != 0;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1307 = _1305 != 0;
    bool _1309 = !_1295;
    int _1311 = _1309 ? 0 : (-1);
    int _1313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1315 = _1313 != 0;
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1319 = _1317 != 0;
    float _1321 = in.m_71.x;
    float _1323 = in.m_71.y;
    float _1325 = in.m_71.z;
    bool _1327 = !_1303;
    int _1329 = _1327 ? 0 : 1;
    bool _1331 = !_1299;
    int _1333 = _1331 ? 0 : 1;
    bool _1335 = !_1307;
    int _1337 = _1335 ? 0 : 1;
    bool _1339 = !_1315;
    int _1341 = _1339 ? 0 : 1;
    int _1343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1345 = _1343 != 0;
    int _1347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1349 = _1347 != 0;
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1353 = _1351 != 0;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1357 = _1355 != 0;
    float _1359 = in.m_48.x;
    float _1361 = in.m_48.y;
    float _1363 = in.m_48.z;
    bool _1365 = !_1319;
    float _1367 = _1365 ? 7.345489978790283203125 : 1.0;
    bool _1369 = !_1345;
    int _1371 = _1369 ? 0 : 1;
    int _1373 = ~_1273;
    int _1375 = _1373 + _1311;
    int _1377 = _1375 + 1;
    float _1379 = _1367 * _1120;
    float _1381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1325);
    float _1383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1321);
    float _1385 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1323);
    bool _1387 = _1323 != 0.0;
    bool _1389 = isnan(_1323);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan(0.0);
    bool _1395 = _1391 || _1393;
    float _1397 = _1092 * _1381;
    float _1399 = _1084 * _1383;
    float _1401 = _1116 * _1385;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1405 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1403;
    bool _1407 = _1321 == 0.0;
    bool _1409 = !_1395;
    bool _1411 = _1407 && _1409;
    float _1413 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1415 = _1413 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _1417 = abs(_1371);
    float _1419 = _1405 * _1176;
    float _1421 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1425 = 1.0 / _1415;
    bool _1427 = _1325 == 0.0;
    bool _1429 = _1427 && _1411;
    float _1431 = fma(_1419, _1124, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1433 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1435 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1437 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1439 = _1423 * _1212;
    float _1441 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1433);
    float _1443 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1435);
    float _1445 = fma(_1359, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1437);
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1449 = _1447 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1451 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1441);
    float _1453 = _1449 * _1202;
    float _1455 = _120 * _1204;
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1463 = _1461 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1465;
    float _1469 = _1455 * _164;
    float _1471 = _1459 * _1222;
    float _1473 = _1463 * _1231;
    float _1475 = in.m_73.x;
    float _1477 = in.m_73.y;
    float _1479 = in.m_73.z;
    float _1481 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1443);
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1485 = _1076 + _1483;
    float _1487 = _1467 * _1425;
    float _1489 = fma(_1363, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1445);
    float _1491 = floor(_1379);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1495 = _1076 + _1493;
    float _1497 = fma(_1453, _1485, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1499 = float(_1186);
    float _1501 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1503 = _1076 + _1501;
    float _1505 = fma(_1251, _1495, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1509 = _1076 + _1507;
    bool _1511 = _1499 >= _1204;
    bool _1513 = isnan(_1499);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan(_1204);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1525 = _1076 + _1523;
    float _1527 = fma(_1439, _1503, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1529 = fma(_1471, _1509, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1531 = trunc(_1469);
    int _1533 = int(_1531);
    float _1535 = fma(_1473, _1525, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1537 = as_type<float>(_1377);
    if (_1357)
    {
        float _1539 = -_1110;
        float _1541 = _1539 + 1.0;
        _1261 = as_type<int>(_1541);
    }
    int _1543 = _1261;
    float _1545 = _1451 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1547 = -_1491;
    float _1549 = _1379 + _1547;
    float _1551 = _1489 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1555 = trunc(_1521);
    int _1557 = int(_1555);
    float _1559 = _1549 * _1204;
    float _1561 = _1477;
    float _1563 = _1475;
    float _1565 = _1479;
    if (!_1429)
    {
        float _1567 = fma(_1323, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1477);
        _1561 = _1567;
    }
    float _1569 = _1561;
    if (!_1429)
    {
        float _1571 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1475);
        _1563 = _1571;
    }
    float _1573 = _1563;
    if (!_1429)
    {
        float _1575 = fma(_1325, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1479);
        _1565 = _1575;
    }
    float _1577 = _1565;
    int _1579 = _1096 * _1377;
    int _1581 = _1579 + _1186;
    bool _1583 = _1096 == 0;
    float _1585 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1553);
    float _1587 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1589 = ~_1096;
    int _1591 = _1589 + 1;
    bool _1593 = !_1583;
    int _1595 = _1593 ? _1581 : (-1);
    float _1597 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1585);
    int _1599 = _1591;
    if (!_1319)
    {
        _1537 = _1086;
    }
    float _1601 = _1537;
    float _1603 = _1601;
    if (_1319)
    {
        _1603 = _1120;
    }
    float _1605 = _1603;
    float _1607 = trunc(_1559);
    int _1609 = int(_1607);
    int _1611 = ~_1557;
    int _1613 = _1611 + 1;
    int _1615 = _1613 + 1;
    int _1617 = _1595 * _1615;
    int _1619 = _1096 + (-1);
    float _1621 = _1587 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1623 = abs(_1329);
    float _1625 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1627 = fma(_1174, _1621, -0.5);
    int _1629 = abs(_1333);
    int _1631 = _1557 * _1619;
    int _1633 = _1631 + _1617;
    int _1635 = _1609 * _1417;
    int _1637 = _1635 + _1186;
    float _1639 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1625);
    int _1641 = abs(_1337);
    int _1643 = _1633 * _1623;
    bool _1645 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1647 = isnan(_1076);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1659 = _1076 + _1657;
    bool _1661 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1663 = isnan(_1076);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1669 = _1665 || _1667;
    float _1671 = float(_1669);
    int _1673 = _1533 * _1629;
    int _1675 = _1673 + _1643;
    bool _1677 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1679 = isnan(_1076);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    float _1689 = -_1655;
    float _1691 = _1689 + 1.0;
    float _1693 = fma(_1487, _1659, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _1695 = _1637 * _1641;
    int _1697 = _1695 + _1675;
    int _1699 = abs(_1341);
    float _1701 = _1671 * _1691;
    float _1703 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1705 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1707 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1709 = isnan(_1076);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1715 = _1711 || _1713;
    float _1717 = float(_1715);
    float _1719 = _1401 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1721 = -_1671;
    float _1723 = _1721 + 1.0;
    int _1725 = _1609 * _1699;
    int _1727 = _1725 + _1697;
    float _1729 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1705);
    float _1731 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1719);
    float _1733 = _1717 * _1723;
    bool _1735 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1737 = isnan(_1076);
    bool _1739 = _1735 || _1737;
    bool _1741 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1743 = _1739 || _1741;
    float _1745 = float(_1743);
    float _1747 = -_1717;
    float _1749 = _1747 + 1.0;
    float _1751 = float(uint(_1727));
    float _1753 = fma(_1399, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1703);
    bool _1755 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1757 = isnan(_1076);
    bool _1759 = _1755 || _1757;
    bool _1761 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1763 = _1759 || _1761;
    float _1765 = float(_1763);
    float _1767 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1769 = _1745 * _1749;
    float _1771 = as_type<float>(_1180) * _1751;
    float _1773 = -_1745;
    float _1775 = _1773 + 1.0;
    float _1777 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1192);
    bool _1779 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1781 = isnan(_1076);
    bool _1783 = _1779 || _1781;
    bool _1785 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1787 = _1783 || _1785;
    float _1789 = float(_1787);
    float _1791 = _1765 * _1775;
    float _1793 = trunc(_1771);
    float _1795 = precise::max(_1793, 0.0);
    uint _1797 = uint(_1795);
    float _1799 = -_1765;
    float _1801 = _1799 + 1.0;
    float _1803 = -_1777;
    float _1805 = fma(_1597, _1275, _1803);
    bool _1807 = _1076 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1809 = isnan(_1076);
    bool _1811 = _1807 || _1809;
    bool _1813 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1815 = _1811 || _1813;
    float _1817 = float(_1815);
    float _1819 = _1789 * _1801;
    float _1821 = -_1789;
    float _1823 = _1821 + 1.0;
    float _1825 = _1729;
    if (_1319)
    {
        _1164 = _1120;
    }
    float _1827 = _1164;
    float _1829 = _1767 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1831 = _1827;
    if (!_1319)
    {
        _1831 = _1098;
    }
    float _1833 = _1831;
    float _1835 = _1817 * _1823;
    float _1837 = -_1817;
    float _1839 = _1837 + 1.0;
    float _1841 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1843 = _1687 * _1839;
    float _1845 = fma(_1829, _1279, -0.5);
    int _1847 = _1591 * int(_1797);
    int _1849 = _1847 + _1727;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1853 = _1431 * _1843;
    float _1855 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1753);
    float _1857 = _1851;
    float _1859 = _1853;
    if (_1353)
    {
        float _1861 = -_1110;
        float _1863 = _1861 + 1.0;
        _1599 = as_type<int>(_1863);
    }
    int _1865 = _1599;
    float _1867 = float(uint(_1849));
    float _1869 = -_1851;
    float _1871 = fma(_1841, 2.0, _1869);
    float _1873 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1729);
    float _1875 = _1873;
    if (!_1353)
    {
        _1825 = _1110;
    }
    float _1877 = _1825;
    float _1879 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1731);
    float _1881 = as_type<float>(_1180) * _1867;
    float _1883 = _1877;
    if (_1353)
    {
        float _1885 = _1150 ? as_type<float>(_1865) : _1110;
        _1883 = _1885;
    }
    float _1887 = _1883;
    float _1889 = -_1687;
    float _1891 = _1889 + 1.0;
    float _1893 = trunc(_1881);
    float _1895 = precise::max(_1893, 0.0);
    uint _1897 = uint(_1895);
    float _1899 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1357)
    {
        _1857 = _1110;
    }
    float _1901 = _1857;
    float _1903 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1905 = _1901;
    if (_1357)
    {
        float _1907 = _1148 ? as_type<float>(_1543) : _1110;
        _1905 = _1907;
    }
    float _1909 = _1905;
    float _1911 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1899);
    float _1913 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1915 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1917 = float(uint(_1637));
    float _1919 = fma(_1891, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1853);
    float _1921 = -_1903;
    float _1923 = fma(_1913, 2.0, _1921);
    int _1925 = int(_1797) + int(_1897);
    float _1927 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1929 = ~_1096;
    int _1931 = _1929 + 1;
    float _1933 = as_type<float>(_1180) * _1917;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (!_1319)
    {
        _1166 = _1098;
    }
    float _1937 = _1166;
    float _1939 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1927);
    int _1941 = _1931 * _1925;
    int _1943 = _1941 + _1727;
    float _1945 = _1937;
    if (!_1319)
    {
        _1859 = _1098;
    }
    float _1947 = _1859;
    float _1949 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1935);
    float _1951 = _1947;
    if (_1319)
    {
        _1168 = _1086;
    }
    float _1953 = _1168;
    float _1955 = trunc(_1933);
    float _1957 = precise::max(_1955, 0.0);
    uint _1959 = uint(_1957);
    float _1961 = _1953;
    if (_1319)
    {
        _1945 = _1086;
    }
    float _1963 = _1945;
    float _1965 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1319)
    {
        _1951 = _1086;
    }
    float _1967 = _1951;
    float _1969 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_1319)
    {
        _1961 = _1120;
    }
    float _1971 = _1961;
    float _1973 = _1569 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1975 = uint(_1943) >= uint(_1096);
    float _1977 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1969);
    float _1979 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1965);
    float _1981 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1973);
    bool _1983 = !_1975;
    int _1985 = _1983 ? 0 : (-1);
    float _1987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1989 = fma(_1497, _1835, _1919);
    int _1991 = ~_1096;
    int _1993 = _1991 + 1;
    float _1995 = fma(_1963, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1915);
    int _1997 = ~_1925;
    int _1999 = _1997 + _1985;
    int _2001 = _1999 + 1;
    float _2003 = fma(_1505, _1819, _1989);
    float _2005 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1939);
    int _2007 = _1096 * _2001;
    int _2009 = _2007 + _1727;
    float _2011 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2013 = fma(_1285, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2015 = _1993 * int(_1959);
    int _2017 = _2015 + _1637;
    bool _2019 = !_1583;
    int _2021 = _2019 ? _2009 : (-1);
    float _2023 = -_120;
    float _2025 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1923);
    float _2027 = _1987 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2029 = -_120;
    float _2031 = fma(_2029, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1871);
    float _2033 = float(uint(_2017));
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2037 = _2021 >> 31;
    float _2039 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2041 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2043 = as_type<float>(_1180) * _2033;
    int _2045 = _2037 & 3;
    float _2047 = -_120;
    float _2049 = fma(_2047, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1293);
    float _2051 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2053 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1911);
    int _2055 = _2021 + _2045;
    float _2057 = fma(_2005, _2013, _2049);
    float _2059 = fma(_2051, _1887, -0.5);
    float _2061 = trunc(_2043);
    float _2063 = precise::max(_2061, 0.0);
    uint _2065 = uint(_2063);
    int _2067 = _2055 >> 2;
    float _2069 = fma(_2027, _1909, -0.5);
    float _2071 = fma(_2053, _2059, _2025);
    float _2073 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1949);
    int _2075 = _2067 << 4;
    int _2077 = _2075 + 368;
    float _2079 = fma(_2041, -2.0, _2039);
    float _2081 = fma(_1527, _1791, _2003);
    float _2083 = fma(_2073, _2069, _2031);
    uint _2085 = uint(int(uint(_2077) >> uint(2)));
    uint _2087 = uint(int(uint(int(_2085)) >> uint(2)));
    int _2089 = int(_2085) & 3;
    float _2091 = (*spvDescriptorSet0.vp_c9)._m0[int(_2087)][_2089];
    int _2093 = int(_2085) + 1;
    uint _2095 = uint(int(uint(_2093) >> uint(2)));
    int _2097 = _2093 & 3;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[int(_2095)][_2097];
    float _2101 = _1855 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2103 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2105 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2079);
    float _2107 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1995);
    float _2109 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2111 = _1545 + _2101;
    float _2113 = _1551 + _2103;
    float _2115 = -_2105;
    float _2117 = fma(_2107, _1845, _2115);
    int _2119 = _2021 & 3;
    bool _2121 = _2119 != 0;
    int _2123 = _2077 + 8;
    uint _2125 = uint(int(uint(_2123) >> uint(2)));
    uint _2127 = uint(int(uint(int(_2125)) >> uint(2)));
    int _2129 = int(_2125) & 3;
    float _2131 = (*spvDescriptorSet0.vp_c9)._m0[int(_2127)][_2129];
    int _2133 = int(_2125) + 1;
    uint _2135 = uint(int(uint(_2133) >> uint(2)));
    int _2137 = _2133 & 3;
    float _2139 = (*spvDescriptorSet0.vp_c9)._m0[int(_2135)][_2137];
    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2143 = _2111 + _2141;
    float _2145 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2147 = _2113 + _2145;
    int _2149 = ~_1096;
    int _2151 = _2149 + 1;
    float _2153 = fma(_2109, -2.0, _2035);
    int _2155 = int(_1959) + int(_2065);
    float _2157 = _2143 * _2143;
    int _2159 = _2021 & 3;
    bool _2161 = _2159 != 0;
    float _2163 = _2147 * _2147;
    bool _2165 = uint(_2119) > 1u;
    int _2167 = _2151 * _2155;
    int _2169 = _2167 + _1637;
    int _2171 = _2161 ? 0 : 1;
    float _2173 = _2157 + _2163;
    float _2175 = fma(_1529, _1769, _2081);
    float _2177 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1639);
    bool _2179 = uint(_2169) >= uint(_1096);
    float _2181 = sqrt(_2173);
    int _2183 = ~_2171;
    int _2185 = _2183 + 1;
    int _2187 = _2185 + 1;
    float _2189 = fma(_1535, _1733, _2175);
    bool _2191 = !_2179;
    int _2193 = _2191 ? 0 : (-1);
    float _2195 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2153);
    bool _2197 = uint(_2119) >= 2u;
    int _2199 = _2187;
    float _2201 = _2157;
    float _2203 = _2163;
    float _2205 = _2111;
    float _2207 = _2113;
    float _2209 = _2071;
    if (!_2165)
    {
        int _2211 = ~_2171;
        int _2213 = _2211 + 1;
        _2199 = _2213;
    }
    int _2215 = _2199;
    bool _2217 = _2119 != 3;
    int _2219 = ~_2155;
    int _2221 = _2219 + _2193;
    int _2223 = _2221 + 1;
    bool _2225 = !_2121;
    int _2227 = _2225 ? 0 : 1;
    int _2229 = abs(_2215);
    float _2231 = _1873 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2233 = abs(_2227);
    int _2235 = ~_2229;
    int _2237 = _2235 + 1;
    int _2239 = _2237 + 1;
    int _2241 = _2197 ? 0 : 1;
    bool _2243 = _2119 != 3;
    int _2245 = _2239 * as_type<int>(_2099);
    float _2247 = _1481 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2249 = _2181 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _2251 = ~_2241;
    int _2253 = _2251 + 1;
    int _2255 = _2253 + 1;
    int _2257 = _2255;
    if (_2217)
    {
        int _2259 = ~_2241;
        int _2261 = _2259 + 1;
        _2257 = _2261;
    }
    int _2263 = _2257;
    int _2265 = ~_2233;
    int _2267 = _2265 + 1;
    int _2269 = _2267 + 1;
    bool _2271 = !_2243;
    int _2273 = _2271 ? 0 : (-1);
    int _2275 = abs(_2263);
    int _2277 = _2269 * as_type<int>(_2091);
    int _2279 = _2277 + _2245;
    float _2281 = _2247 + _2231;
    int _2283 = abs(_2273);
    bool _2285 = !_1349;
    int _2287 = _2285 ? 0 : 1;
    int _2289 = abs(_2287);
    int _2291 = ~_2275;
    int _2293 = _2291 + 1;
    int _2295 = _2293 + 1;
    if (!_2249)
    {
        _1875 = _2281;
    }
    float _2297 = _1875;
    bool _2299 = !_2249;
    float _2301 = _2297;
    if (!_2299)
    {
        float _2303 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2307 = _2181 + _2305;
        float _2309 = rsqrt(_2173);
        float _2311 = _2307 * _2303;
        float _2313 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2315 = _2311 * 0.15915493667125701904296875;
        float _2317 = _2315 * 6.283185482025146484375;
        float _2319 = sin(_2317);
        float _2321 = _2315 * 6.283185482025146484375;
        float _2323 = cos(_2321);
        float _2325 = fma(_2319, _2313, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2327 = _2309 * _2325;
        float _2329 = fma(_2143, _2327, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2331 = _2323 + (-1.0);
        float _2333 = fma(_2147, _2327, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2337 = _2329 + _2335;
        float _2339 = _2331 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2343 = _2333 + _2341;
        float _2345 = _2337 * _2337;
        float _2347 = fma(_2281, _2323, _2339);
        float _2349 = _2343 * _2343;
        _2301 = _2347;
        _2201 = _2345;
        _2203 = _2349;
        _2205 = _2329;
        _2207 = _2333;
    }
    float _2351 = _2301;
    float _2353 = _2201;
    float _2355 = _2203;
    float _2357 = _2205;
    float _2359 = _2207;
    int _2361 = _1096 * _2223;
    int _2363 = _2361 + _1637;
    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2367 = _2351 + _2365;
    int _2369 = _2295 * as_type<int>(_2131);
    int _2371 = _2369 + _2279;
    int _2373 = ~_2283;
    int _2375 = _2373 + 1;
    int _2377 = _2375 + 1;
    float _2379 = fma(_2367, _2367, _2353);
    int _2381 = ~_2289;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    float _2387 = -_2195;
    float _2389 = fma(_2177, _1627, _2387);
    float _2391 = fma(_1693, _1701, _2189);
    int _2393 = _2377 * as_type<int>(_2139);
    int _2395 = _2393 + _2371;
    float _2397 = _2379 + _2355;
    bool _2399 = !_1583;
    int _2401 = _2399 ? _2363 : (-1);
    float _2403 = _2389 + 0.5;
    int _2405 = _2395 * _2385;
    float _2407 = fma(_1655, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2391);
    float _2409 = _2083 + 0.5;
    float _2411 = sqrt(_2397);
    int _2413 = _2401 * _2289;
    int _2415 = _2413 + _2405;
    float _2417 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1977);
    float _2419 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1979);
    float _2421 = _1805 + 0.5;
    float _2423 = _2057 + 0.5;
    float _2425 = _2071 + 0.5;
    float _2427 = _2117 + 0.5;
    float _2429 = float(_2415);
    float _2431 = fma(_1577, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1981);
    out.m_75.x = _2409;
    out.m_75.y = _2403;
    out.m_77.x = _2423;
    out.m_77.y = _2421;
    out.m_77.z = _2425;
    out.m_77.w = _2427;
    bool _2433 = _2411 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2435 = isnan(_2411);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2441 = _2437 || _2439;
    out.m_79.x = _2407;
    out.m_81.x = _2429;
    out.m_83.x = _2417;
    out.m_83.y = _2419;
    out.m_83.z = _2431;
    float _2443 = as_type<float>(_2415);
    float _2445 = _2367;
    if (!_2441)
    {
        _2443 = 1.0;
    }
    float _2447 = _2443;
    bool _2449 = !_2441;
    float _2451 = _2447;
    if (!_2449)
    {
        bool _2453 = _2411 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2455 = isnan(_2411);
        bool _2457 = _2453 || _2455;
        bool _2459 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2461 = _2457 || _2459;
        if (!_2461)
        {
            float _2463 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2465 = _2411 + _2463;
            float _2467 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2469 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2467;
            float _2471 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2473 = _2471 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2475 = 1.0 / _2469;
            float _2477 = _2465 * _2475;
            float _2479 = fma(_2477, _2473, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2451 = _2479;
            _2445 = _2473;
            _2481 = true;
        }
        else
        {
            bool _2483 = _2411 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2485 = isnan(_2411);
            bool _2487 = _2483 || _2485;
            bool _2489 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2491 = _2487 || _2489;
            if (!_2491)
            {
                float _2493 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2495 = _2411 + _2493;
                float _2497 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2499 = _2497 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2501 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2503 = _2501 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2505 = 1.0 / _2499;
                float _2507 = _2495 * _2505;
                float _2509 = fma(_2507, _2503, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2451 = _2509;
                _2445 = _2503;
                _2481 = true;
            }
            else
            {
                _2451 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2481 = false;
    float _2511 = _2451;
    float _2513 = _2445;
    float _2515 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2517 = _2357 + _2515;
    float _2519 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2521 = _2351 + _2519;
    float _2523 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2525 = _2359 + _2523;
    bool _2527 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2529 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2531 = _2527 || _2529;
    bool _2533 = isnan(0.5);
    bool _2535 = _2531 || _2533;
    float _2537 = fma(_2517, _2511, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2539 = fma(_2521, _2511, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2541 = fma(_2525, _2511, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2543 = _2511;
    float _2545 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2547 = _2513;
    if (_2535)
    {
        _2543 = _2537;
    }
    float _2549 = _2543;
    float _2551 = _2549;
    if (_2535)
    {
        _2545 = _2539;
    }
    float _2553 = _2545;
    float _2555 = _2553;
    if (_2535)
    {
        _2547 = _2541;
    }
    float _2557 = _2547;
    float _2559 = _2557;
    if (!_2535)
    {
        float _2561 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2563 = _2247 + _2561;
        float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2567 = _1545 + _2565;
        float _2569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2571 = _2563 * _2563;
        float _2573 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2575 = _1551 + _2573;
        float _2577 = fma(_2567, _2567, _2571);
        float _2579 = fma(_2575, _2575, _2577);
        float _2581 = -_1545;
        float _2583 = _2581 + _2537;
        float _2585 = -_2247;
        float _2587 = _2585 + _2539;
        float _2589 = -_1551;
        float _2591 = _2589 + _2541;
        float _2593 = sqrt(_2579);
        float _2595 = precise::min(_2593, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2597 = _2595 * _2569;
        float _2599 = fma(_2583, _2597, _1545);
        float _2601 = fma(_2587, _2597, _2247);
        float _2603 = fma(_2591, _2597, _1551);
        _2555 = _2601;
        _2551 = _2599;
        _2559 = _2603;
    }
    float _2605 = _2555;
    float _2607 = _2551;
    float _2609 = _2559;
    float _2611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2613 = _2605 + _2611;
    float _2615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2617 = _2607 + _2615;
    float _2619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2621 = _2609 + _2619;
    float _2623 = _2613 * _2613;
    float _2625 = fma(_2617, _2617, _2623);
    float _2627 = fma(_2621, _2621, _2625);
    float _2629 = rsqrt(_2627);
    float _2631 = sqrt(_2627);
    float _2633 = _2629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2635 = _2617 * _2633;
    float _2637 = _2621 * _2633;
    float _2639 = _2635 * _2635;
    float _2641 = _2637 * _2637;
    float _2643 = _2639 + _2641;
    float _2645 = sqrt(_2643);
    bool _2647 = _2645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2651 = _2645 + _2649;
    float _2653 = _2629;
    float _2655 = _2643;
    float _2657 = _2651;
    float _2659 = _2613;
    float _2661 = _2633;
    if (_2647)
    {
        float _2663 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2653 = _2663;
    }
    float _2665 = _2653;
    if (_2647)
    {
        float _2667 = rsqrt(_2643);
        _2655 = _2667;
    }
    float _2669 = _2655;
    float _2671 = _2669;
    if (_2647)
    {
        float _2673 = _2651 * _2665;
        _2657 = _2673;
    }
    float _2675 = _2657;
    if (_2647)
    {
        float _2677 = _2675 * 0.15915493667125701904296875;
        _2209 = _2677;
    }
    float _2679 = _2209;
    float _2681 = _2665;
    float _2683 = _2679;
    if (_2647)
    {
        float _2685 = _2679 * 6.283185482025146484375;
        float _2687 = sin(_2685);
        _2681 = _2687;
    }
    float _2689 = _2681;
    float _2691 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2693 = precise::max(0.0, _2691);
    float _2695 = _2621;
    float _2697 = _2693;
    if (_2647)
    {
        float _2699 = _2679 * 6.283185482025146484375;
        float _2701 = cos(_2699);
        _2695 = _2701;
    }
    float _2703 = _2695;
    float _2705 = -_2633;
    float _2707 = -_2693;
    float _2709 = fma(_2613, _2705, _2707);
    if (_2647)
    {
        float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2697 = _2711;
    }
    float _2713 = _2697;
    float _2715 = _2713;
    if (!_2647)
    {
        _2683 = _2635;
    }
    float _2717 = _2683;
    float _2719 = _2689;
    float _2721 = _2717;
    if (_2647)
    {
        float _2723 = fma(_2689, _2713, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2715 = _2723;
    }
    float _2725 = _2715;
    if (!_2647)
    {
        _2719 = _2709;
    }
    float _2727 = _2719;
    float _2729 = _2727;
    float _2731 = _2703;
    if (_2647)
    {
        float _2733 = _2703 + (-1.0);
        _2659 = _2733;
    }
    float _2735 = _2659;
    float _2737 = _2735;
    if (_2647)
    {
        float _2739 = _2669 * _2725;
        _2661 = _2739;
    }
    float _2741 = _2661;
    if (!_2647)
    {
        _2671 = _2641;
    }
    float _2743 = _2671;
    float _2745 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2747 = _2743;
    if (_2647)
    {
        float _2749 = _2735 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2737 = _2749;
    }
    float _2751 = _2737;
    float _2753 = _2751;
    if (_2647)
    {
        float _2755 = _2635 * _2741;
        _2721 = _2755;
    }
    float _2757 = _2721;
    if (_2647)
    {
        float _2759 = fma(_2709, _2703, _2751);
        _2729 = _2759;
    }
    float _2761 = _2729;
    if (!_2647)
    {
        _2753 = _2637;
    }
    float _2763 = _2753;
    float _2765 = _2763;
    if (_2647)
    {
        float _2767 = _2637 * _2741;
        _2765 = _2767;
    }
    float _2769 = _2765;
    if (!_2647)
    {
        _2731 = _2639;
    }
    float _2771 = _2731;
    float _2773 = _2771;
    if (_2647)
    {
        float _2775 = _2757 * _2757;
        _2773 = _2775;
    }
    float _2777 = _2773;
    if (_2647)
    {
        float _2779 = _2769 * _2769;
        _2747 = _2779;
    }
    float _2781 = _2747;
    float _2783 = fma(_2761, _2761, _2777);
    float _2785 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2787 = fma(_1545, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2789 = _2783 + _2781;
    float _2791 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2785);
    float _2793 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2795 = fma(_2631, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2793);
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = rsqrt(_2789);
    float _2801 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2791);
    float _2803 = fma(_1551, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2805 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2807 = -_2797;
    float _2809 = _2807 + 1.0;
    float _2811 = _2801 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2813 = floor(_2787);
    float _2815 = _2811 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2817 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2819 = -_2815;
    float _2821 = fma(_2819, _2805, 1.0);
    float _2823 = _2605 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2825 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2817);
    float _2827 = _2799 * _2757;
    float _2829 = _2799 * _2761;
    float _2831 = _2799 * _2769;
    float _2833 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2823);
    float _2835 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2825);
    float _2837 = abs(_2809);
    float _2839 = log2(_2837);
    float _2841 = _2827 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2843 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2833);
    float _2845 = _2835 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2847 = fma(_2607, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2745);
    float _2849 = -_2841;
    float _2851 = fma(_2829, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2849);
    float _2853 = _2843 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2855 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2857 = fma(_2609, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2847);
    float _2859 = -_2831;
    float _2861 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2851);
    float _2863 = floor(_2803);
    float _2865 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2855);
    float _2867 = _2857 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2869 = fma(_2861, -0.5, 0.5);
    float _2871 = -_2813;
    float _2873 = _2787 + _2871;
    float _2875 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2865);
    float _2877 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2879 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2881 = fma(_2861, 0.5, 0.5);
    float _2883 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2875);
    float _2885 = log2(_2821);
    float _2887 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2889 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2879);
    float _2891 = _2829 + 1.0;
    float _2893 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2887);
    float _2895 = -_2863;
    float _2897 = _2803 + _2895;
    float _2899 = exp2(_2877);
    float _2901 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2893);
    float _2903 = fma(_2881, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2905 = fma(_2881, _2903, -0.212114393711090087890625);
    float _2907 = 1.0 / _2883;
    float _2909 = _2885 * 0.693147182464599609375;
    float _2911 = sqrt(_2869);
    float _2913 = -_2829;
    float _2915 = fma(_2899, _2891, _2913);
    float2 _8014 = float2(_2873, _2897);
    float _2917 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8014, float2(0.0), isnan(_8014)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8014, float2(0.0), isnan(_8014)), level(0.0)).x;
    float _2919 = fma(_2881, _2905, 1.570728778839111328125);
    float _2921 = fma(_2915, 0.5, 0.5);
    float _2923 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2889);
    float _2925 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2923);
    float _2927 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2901);
    float _2929 = _2911 * 0.636619746685028076171875;
    float _2931 = _2925 * _2907;
    float _2933 = _2927 * _2907;
    float _2935 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2937 = -_2919;
    float _2939 = fma(_2929, _2937, 1.0);
    float _2941 = fma(_2931, 0.5, 0.5);
    float _2943 = fma(_2933, -0.5, 0.5);
    float3 _8068 = float3(_2941, _2943, _2935);
    float _2945 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8068, float3(0.0), isnan(_8068)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8068, float3(0.0), isnan(_8068)), level(0.0)).x;
    float3 _8079 = float3(_2941, _2943, _2935);
    float4 _2948 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8079, float3(0.0), isnan(_8079)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8079, float3(0.0), isnan(_8079)), level(0.0)).xyzw;
    float _2950 = _2948.x;
    float _2952 = _2948.y;
    float _2954 = _2948.z;
    float _2956 = _2948.w;
    float2 _8095 = float2(_2939, _2921);
    float3 _2960 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8095, float2(0.0), isnan(_8095)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8095, float2(0.0), isnan(_8095)), level(0.0)).xyz;
    float _2962 = _2960.x;
    float _2964 = _2960.y;
    float _2966 = _2960.z;
    float _2968 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2970 = _2247 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2972 = _2811 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2974 = _2845 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2976 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2968);
    float _2978 = fma(_1545, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2970);
    float _2980 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2974);
    float _2982 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2976);
    float _2984 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2978);
    bool _2986 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2988 = isnan(_2631);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2994 = _2990 || _2992;
    float _2996 = _2982 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2998 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3000 = 1.0 / _2996;
    float _3002 = _2998 + _2996;
    float _3004 = _3002 * 0.5;
    float _3006 = _3004 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3008 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _3010 = fma(_3006, _3000, _3008);
    float _3012 = _3004 + _3010;
    float _3014 = _3012 * _3000;
    float _3016 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3018 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3016);
    float _3020 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2865);
    float _3022 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2980);
    float _3024 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3020);
    float _3026 = 1.0 / _3018;
    float _3028 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3022);
    float _3030 = _2925 + _2883;
    float _3032 = _3030 * 0.5;
    float _3034 = 1.0 / _3024;
    float _3036 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3038 = _3026 * _3036;
    float _3040 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3042 = abs(_3038);
    float _3044 = log2(_3042);
    float _3046 = _3028 * _3034;
    bool _3048 = _3038 <= 8000.0;
    bool _3050 = isnan(_3038);
    bool _3052 = _3048 || _3050;
    bool _3054 = isnan(8000.0);
    bool _3056 = _3052 || _3054;
    float _3058 = float(_3056);
    float _3060 = in.m_85.x;
    float _3062 = exp2(_3040);
    float _3064 = _2883 * _3046;
    out.gl_Position.x = _2925;
    out.gl_Position.y = _2927;
    out.gl_Position.z = _3064;
    out.gl_Position.w = _2883;
    float _3066 = _3044 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3068 = exp2(_3066);
    float _3070 = -_3062;
    float _3072 = _3070 + 1.0;
    float _3074 = _3072 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3076 = _2925;
    float _3078 = _3064;
    float _3080 = _2883;
    float _3082 = _2927;
    if (!_2994)
    {
        _3076 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3084 = _3076;
    float _3086 = fma(_3068, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3088 = precise::clamp(_3086, 0.0, 1.0);
    float _3090 = fma(_3088, -2.0, 3.0);
    float _3092 = _3088 * _3088;
    float _3094 = _3092 * _3090;
    float _3096 = _2883 + _3064;
    float _3098 = _3084;
    float _3100 = _3084;
    if (!_2994)
    {
        _3078 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3102 = _3078;
    float _3104 = -_3094;
    float _3106 = _3104 + 1.0;
    float _3108 = _3096 * 0.5;
    float _3110 = fma(_3106, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3094);
    float _3112 = _2883 * 0.5;
    float _3114 = _3102;
    float _3116 = _3102;
    if (!_2994)
    {
        _3080 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3118 = _3080;
    float _3120 = _3058 * _3110;
    float _3122 = fma(_2927, -0.5, _3112);
    float _3124 = _3120 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3126 = _3118;
    float _3128 = _3118;
    if (!_2994)
    {
        _3082 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3130 = _3082;
    out.m_87.x = _3032;
    out.m_87.y = _3122;
    out.m_87.z = _3108;
    out.m_87.w = _2883;
    float _3132 = -_2917;
    float _3134 = _3132 + 1.0;
    float _3136 = _3134 * _3124;
    float _3138 = precise::clamp(_3136, 0.0, 1.0);
    float _3140 = -_3138;
    float _3142 = fma(_3140, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3144 = -_3074;
    float _3146 = _3144 + 1.0;
    float _3148 = _3142 * _3060;
    float _3150 = _3148 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3152 = _3148;
    float _3154 = _3146;
    float _3156 = _3130;
    float _3158 = _3130;
    if (!_2994)
    {
        _3152 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3160 = _3152;
    out.m_89.x = _3150;
    float _3162 = _3074 * _2945;
    float _3164 = _2956 * _3162;
    float _3166 = _2966 * _3162;
    float _3168 = fma(_2962, _3164, _2950);
    float _3170 = fma(_2964, _3164, _2952);
    float _3172 = _2956 * _3146;
    float _3174 = fma(_2956, _3166, _2954);
    float _3176 = _3160;
    float _3178 = _3160;
    if (!_2994)
    {
        _3154 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3180 = _3154;
    out.m_91.x = _3168;
    out.m_91.y = _3170;
    out.m_91.z = _3174;
    out.m_91.w = _3172;
    bool _3182 = !_2994;
    float _3184 = _3180;
    float _3186 = _3180;
    if (!_3182)
    {
        bool _3188 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3190 = isnan(_2631);
        bool _3192 = _3188 || _3190;
        bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3196 = _3192 || _3194;
        if (!_3196)
        {
            float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3200 = _2631 + _3198;
            float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3204 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3202;
            float _3206 = 1.0 / _3204;
            float _3208 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3210 = _3208 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3212 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3214 = _3212 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3216 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3218 = _3216 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3220 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3222 = _3220 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3224 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3226 = _3224 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3228 = _3200 * _3206;
            float _3230 = precise::clamp(_3228, 0.0, 1.0);
            float _3232 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3234 = _3232 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3236 = fma(_3230, _3210, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3238 = fma(_3230, _3234, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3240 = fma(_3230, _3214, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3242 = fma(_3230, _3218, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3244 = fma(_3230, _3222, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3246 = fma(_3230, _3226, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3178 = _3236;
            _3100 = _3244;
            _3116 = _3238;
            _3158 = _3242;
            _3128 = _3240;
            _3186 = _3246;
            _3248 = true;
        }
        else
        {
            bool _3250 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3252 = isnan(_2631);
            bool _3254 = _3250 || _3252;
            bool _3256 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3258 = _3254 || _3256;
            if (!_3258)
            {
                _3114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3260 = _3114;
            _3116 = _3260;
            if (!_3258)
            {
                _3176 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3262 = _3176;
            _3178 = _3262;
            if (!_3258)
            {
                _3126 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3264 = _3126;
            _3128 = _3264;
            if (!_3258)
            {
                _3156 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3266 = _3156;
            _3158 = _3266;
            if (!_3258)
            {
                _3098 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3268 = _3098;
            _3100 = _3268;
            if (!_3258)
            {
                _3184 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3270 = _3184;
            bool _3272 = !_3258;
            _3186 = _3270;
            if (!_3272)
            {
                bool _3274 = _2631 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3276 = isnan(_2631);
                bool _3278 = _3274 || _3276;
                bool _3280 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3282 = _3278 || _3280;
                if (!_3282)
                {
                    float _3284 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3286 = _2631 + _3284;
                    float _3288 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3290 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3288;
                    float _3292 = 1.0 / _3290;
                    float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3296 = _3294 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3300 = _3298 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3302 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3304 = _3302 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3306 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3308 = _3306 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3312 = _3310 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3314 = _3286 * _3292;
                    float _3316 = precise::clamp(_3314, 0.0, 1.0);
                    float _3318 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3320 = _3318 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3322 = fma(_3316, _3296, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3324 = fma(_3316, _3320, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3326 = fma(_3316, _3300, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3328 = fma(_3316, _3304, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3330 = fma(_3316, _3308, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3332 = fma(_3316, _3312, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3178 = _3322;
                    _3100 = _3330;
                    _3116 = _3324;
                    _3158 = _3328;
                    _3128 = _3326;
                    _3186 = _3332;
                    _3248 = true;
                }
                else
                {
                    _3178 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3100 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3158 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3128 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3186 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3248 = false;
    float _3334 = _3178;
    float _3336 = _3100;
    float _3338 = _3116;
    float _3340 = _3158;
    float _3342 = _3128;
    float _3344 = _3186;
    float _3346 = fma(_2419, -0.5, 0.5);
    float _3348 = precise::clamp(_3346, 0.0, 1.0);
    float _3350 = -_3334;
    float _3352 = _3350 + _3336;
    float _3354 = -_3338;
    float _3356 = _3354 + _3340;
    float _3358 = -_3342;
    float _3360 = _3358 + _3344;
    bool _3362 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3364 = fma(_3348, _3352, _3334);
    float _3366 = fma(_3348, _3356, _3338);
    float _3368 = fma(_3348, _3360, _3342);
    float _3370 = _3364 * 0.586610972881317138671875;
    out.m_93.x = 0.0;
    float _3372 = fma(_3366, 0.298911988735198974609375, _3370);
    float _3374 = fma(_3368, 0.114477999508380889892578125, _3372);
    float _3376 = -_3374;
    float _3378 = _3366 + _3376;
    float _3380 = -_3374;
    float _3382 = _3364 + _3380;
    float _3384 = -_3374;
    float _3386 = _3368 + _3384;
    float _3388 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3390 = fma(_3378, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3374);
    float _3392 = fma(_3382, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3374);
    float _3394 = fma(_3386, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3374);
    out.m_55.x = _3388;
    out.m_95.x = _3390;
    out.m_95.y = _3392;
    out.m_95.z = _3394;
    if (!_3362)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3396 = -_2605;
    float _3398 = _3396 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3400 = -_2607;
    float _3402 = _3400 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3404 = -_2609;
    float _3406 = _3404 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3408 = _3398 * _3398;
    float _3410 = fma(_3402, _3402, _3408);
    float _3412 = fma(_3406, _3406, _3410);
    float _3414 = sqrt(_3412);
    float _3416 = rsqrt(_3412);
    float _3418 = -_3414;
    float _3420 = _3418 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3422 = _3420 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3424 = precise::clamp(_3422, 0.0, 1.0);
    float _3426 = _3402 * _3416;
    float _3428 = _3398 * _3416;
    float _3430 = abs(_3424);
    float _3432 = log2(_3430);
    float _3434 = _3406 * _3416;
    float _3436 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3438 = _2419 * _3428;
    float _3440 = -_3428;
    float _3442 = -_3436;
    float _3444 = fma(_3440, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3442);
    float _3446 = fma(_2417, _3426, _3438);
    float _3448 = -_3434;
    float _3450 = fma(_3448, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3444);
    float _3452 = fma(_2431, _3434, _3446);
    float _3454 = precise::clamp(_3452, 0.0, 1.0);
    float _3456 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3458 = _3450 + _3456;
    float _3460 = _3432 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3462 = _3458 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3464 = precise::clamp(_3462, 0.0, 1.0);
    float _3466 = exp2(_3460);
    float _3468 = _3466 * _3464;
    float _3470 = _3454 * _3468;
    float _3472 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3474 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3476 = _3470 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_93.x = _3472;
    out.m_93.y = _3474;
    out.m_93.z = _3476;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

