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
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
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
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1010 = false;
    bool _732 = false;
    bool _590 = false;
    bool _302 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2212 = as_type<float>(_104);
        out.gl_Position.z = _2212;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2281 = as_type<float>(_140);
        out.gl_Position.z = _2281;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = _144 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _152 = _144 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _156 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _150);
    float _158 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _152);
    float _160 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].z, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].z, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].z, _160);
    bool _168 = !_148;
    float _186;
    if (!_168)
    {
        float _170 = in.m_51.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_88);
        float _192 = 1.0 / _190;
        float _194 = _122 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    bool _218 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _220 = isnan(_196);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -_212;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = 1.0 / _216;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _242 = _228 * _232;
    float _244 = -_228;
    float _246 = _244 + 1.0;
    float _248 = _200 * _238;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = fma(_236, _248, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _256;
    float _260 = fma(_252, _248, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _262 = fma(_258, _248, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = _254 * _242;
    float _266 = _262 * _242;
    float _268 = _260 * _242;
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].x, _264);
    float _272 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].y, _266);
    float _274 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].z, _268);
    float _276 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _270);
    float _278 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    float _280 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _274);
    bool _282 = !_240;
    float _300;
    if (!_282)
    {
        float _284 = in.m_51.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_88);
        float _306 = 1.0 / _304;
        float _308 = _122 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = in.m_53.x;
    float _314 = in.m_53.y;
    float _316 = in.m_53.z;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _334 = 1.0 / _320;
    bool _336 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _338 = isnan(_310);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _328;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _352 = _310 + _350;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _356 = _280 * _316;
    float _358 = _278 * _314;
    float _360 = 1.0 / _324;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _364 = _310 + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _368 = _310 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _372 = _310 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _374;
    float _378 = _364 * _334;
    bool _380 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _382 = isnan(_310);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _276 * _312;
    float _394 = 1.0 / _332;
    float _396 = _352 * _348;
    bool _398 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _400 = isnan(_310);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = fma(_376, _378, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _412 = _368 * _360;
    float _414 = -_390;
    float _416 = _414 + 1.0;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _418;
    float _422 = _408 * _416;
    float _424 = -_408;
    float _426 = _424 + 1.0;
    float _428 = fma(_420, _378, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _430 = _372 * _394;
    bool _432 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _434 = isnan(_310);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _444;
    float _448 = -_442;
    float _450 = _448 + 1.0;
    float _452 = _442 * _426;
    float _454 = fma(_446, _378, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _460 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _462 = isnan(_310);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _346 * _450;
    float _474 = -_346;
    float _476 = _474 + 1.0;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _486 = fma(_458, _412, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _488 = _470 * _476;
    float _490 = fma(_480, _412, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _492 = fma(_484, _412, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _494 = -_470;
    float _496 = _494 + 1.0;
    float _498 = _428 * _488;
    float _500 = _410 * _488;
    float _502 = _454 * _488;
    float _504 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[107].x, _498);
    float _506 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[107].y, _500);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _508;
    float _512 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[107].z, _502);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _518;
    float _522 = fma(_490, _472, _504);
    float _524 = fma(_486, _472, _506);
    float _526 = fma(_492, _472, _512);
    float _528 = fma(_516, _396, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _530 = fma(_510, _396, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _532 = fma(_520, _396, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _546 = fma(_528, _452, _522);
    float _548 = fma(_536, _430, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _550 = fma(_540, _430, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _552 = fma(_544, _430, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _554 = fma(_530, _452, _524);
    float _556 = fma(_532, _452, _526);
    float _558 = fma(_548, _422, _546);
    float _560 = fma(_550, _422, _554);
    float _562 = fma(_552, _422, _556);
    float _564 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[111].x, _558);
    float _566 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[111].y, _560);
    float _568 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[111].z, _562);
    bool _570 = !_354;
    float _588;
    if (!_570)
    {
        float _572 = in.m_51.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_88);
        float _594 = 1.0 / _592;
        float _596 = _122 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _598 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _610 = isnan(_598);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _624 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _626 = isnan(_598);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _636;
    bool _640 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _642 = isnan(_598);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = 1.0 / _606;
    float _654 = -_618;
    float _656 = _654 + 1.0;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _660 = _634 * _656;
    float _662 = -_634;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _622;
    float _668 = _638 * _652;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = fma(_668, _602, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = _672 * _666;
    float _678 = _674 * _660;
    float _680 = -_650;
    float _682 = _680 + 1.0;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _686 = _598 + _684;
    float _688 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _690 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _678);
    float _692 = _618 * _682;
    float _694 = fma(_676, _686, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _696 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _698 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_694, _692, _690);
    float _702 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[117].x, _700);
    float _708 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _698;
    out.m_55.y = _708;
    out.m_55.z = _704;
    out.m_55.w = _710;
    bool _712 = !_658;
    float _730;
    if (!_712)
    {
        float _714 = in.m_51.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_88);
        float _736 = 1.0 / _734;
        float _738 = _122 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _744 = _740 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _740 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _752 = _740 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _770 = 1.0 / _756;
    bool _772 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _774 = isnan(_740);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = 1.0 / _760;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _788 = _740 + _786;
    bool _790 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _792 = 1.0 / _764;
    float _794 = _744 * _770;
    bool _796 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _798 = isnan(_740);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _808;
    float _812 = fma(_810, _794, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _814 = 1.0 / _768;
    float _816 = _748 * _784;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _818;
    bool _822 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _824 = isnan(_740);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = fma(_820, _794, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _836 = _752 * _792;
    bool _838 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _840 = isnan(_740);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _850;
    float _854 = fma(_852, _794, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _856 = -_848;
    float _858 = _856 + 1.0;
    float _860 = _788 * _814;
    bool _862 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _864 = isnan(_740);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_806;
    float _876 = _874 + 1.0;
    float _878 = _782 * _858;
    float _880 = -_782;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _888 = _872 * _876;
    float _890 = -_872;
    float _892 = _890 + 1.0;
    float _894 = _832 * _882;
    float _896 = fma(_886, _816, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _898 = -_832;
    float _900 = _898 + 1.0;
    float _902 = _848 * _892;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _912 = _812 * _894;
    float _914 = _834 * _894;
    float _916 = fma(_906, _816, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _918 = fma(_910, _816, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _920 = _854 * _894;
    float _922 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[123].x, _912);
    float _924 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[123].y, _914);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _934;
    float _938 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[123].z, _920);
    float _940 = fma(_896, _878, _922);
    float _942 = fma(_932, _836, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _944 = fma(_916, _878, _924);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _950 = fma(_928, _836, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _956 = fma(_936, _836, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _958 = fma(_918, _878, _938);
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _964 = fma(_942, _902, _940);
    float _966 = fma(_948, _860, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _968 = fma(_954, _860, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _970 = fma(_950, _902, _944);
    float _972 = fma(_962, _860, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _974 = fma(_956, _902, _958);
    float _976 = fma(_966, _888, _964);
    float _978 = fma(_968, _888, _970);
    float _980 = fma(_972, _888, _974);
    float _982 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[127].x, _976);
    float _984 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[127].y, _978);
    float _986 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[127].z, _980);
    bool _988 = !_790;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1008;
    if (!_988)
    {
        float _992 = in.m_51.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _1008 = _1006;
        _1010 = true;
    }
    else
    {
        float _1012 = float(_88);
        float _1014 = 1.0 / _1012;
        float _1016 = _122 * _1014;
        _1008 = _1016;
    }
    _1010 = false;
    float _1018 = _1008;
    float _1020 = in.m_57.x;
    float _1022 = in.m_57.y;
    float _1024 = in.m_57.z;
    float _1026 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1028 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = in.m_42.x;
    float _1032 = in.m_42.y;
    float _1034 = in.m_42.z;
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1022);
    float _1038 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1020);
    float _1040 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1024);
    float _1044 = _1026 * _1036;
    float _1046 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1048 = _1040 * _1038;
    float _1050 = _1028 * _1042;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1054 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1056 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1046);
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1052);
    float _1062 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1054);
    float _1064 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1056);
    float _1066 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1068 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1060);
    float _1070 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1074 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1066);
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1080 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1082 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1084 = _1072 + _1076;
    float _1086 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1080);
    float _1088 = _1078 + _1082;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1092 = _1084 + _1090;
    float _1094 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1086);
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1098 = _1088 + _1096;
    float _1100 = _1092 * _1092;
    float _1102 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1104 = fma(_1098, _1098, _1100);
    float _1106 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1108 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1110 = sqrt(_1104);
    float _1112 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1106);
    float _1114 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1108);
    float _1116 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1112);
    float _1118 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1114);
    float _1120 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1122 = _1102 + _1120;
    bool _1124 = _1110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1126 = _1108;
    float _1128 = _1120;
    float _1130 = _1114;
    if (!_1124)
    {
        _1126 = _1088;
    }
    float _1132 = _1126;
    float _1134 = _1132;
    if (!_1124)
    {
        _1128 = _1084;
    }
    float _1136 = _1128;
    float _1138 = _1136;
    if (!_1124)
    {
        _1130 = _1122;
    }
    float _1140 = _1130;
    bool _1142 = !_1124;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1150 = _1110 + _1148;
        float _1152 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1154 = rsqrt(_1104);
        float _1156 = _1150 * _1146;
        float _1158 = _1156 * 0.15915493667125701904296875;
        float _1160 = _1158 * 6.283185482025146484375;
        float _1162 = cos(_1160);
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1162 + (-1.0);
        float _1170 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1172 = fma(_1166, _1152, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1174 = fma(_1122, _1162, _1170);
        float _1176 = _1154 * _1172;
        float _1178 = fma(_1098, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1180 = fma(_1092, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1144 = _1174;
        _1134 = _1178;
        _1138 = _1180;
    }
    float _1182 = _1144;
    float _1184 = _1134;
    float _1186 = _1138;
    float _1188 = -_1102;
    float _1190 = _1188 + _1182;
    float _1192 = -_1078;
    float _1194 = _1192 + _1184;
    float _1196 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1198 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1200 = _1190 * _1190;
    float _1202 = -_1072;
    float _1204 = _1202 + _1186;
    float _1206 = 1.0 / _1196;
    float _1208 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1198);
    float _1210 = fma(_1194, _1194, _1200);
    bool _1212 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1214 = isnan(0.5);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1220 = _1216 || _1218;
    float _1222 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1208);
    float _1224 = fma(_1204, _1204, _1210);
    float _1226 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1228 = sqrt(_1224);
    float _1230 = _1226 + _1196;
    float _1232 = _1230 * _1206;
    float _1234 = _1232 * 0.5;
    float _1236 = _1206;
    float _1238 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1240 = _1184;
    float _1242 = _1186;
    float _1244 = _1190;
    float _1246 = _1182;
    if (_1220)
    {
        _1236 = 1.0;
    }
    float _1248 = _1236;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1250);
    float _1254 = 1.0 / _1252;
    bool _1256 = _1228 > 0.0;
    float _1258 = _1248;
    if (!_1256)
    {
        _1238 = _1182;
    }
    float _1260 = _1238;
    bool _1262 = !_1256;
    float _1264 = _1260;
    if (!_1262)
    {
        float _1266 = _164 * _164;
        float _1268 = fma(_162, _162, _1266);
        float _1270 = fma(_166, _166, _1268);
        float _1272 = rsqrt(_1224);
        float _1274 = sqrt(_1270);
        float _1276 = _1194 * _1272;
        float _1278 = _1190 * _1272;
        float _1280 = _1204 * _1272;
        bool _1282 = _1274 > 0.0;
        float _1284 = _1274;
        if (!_1282)
        {
            _1284 = _1182;
        }
        float _1286 = _1284;
        bool _1288 = !_1282;
        _1264 = _1286;
        if (!_1288)
        {
            float _1290 = rsqrt(_1270);
            float _1292 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1294 = _164 * _1290;
            float _1296 = _162 * _1290;
            float _1298 = _166 * _1290;
            float _1300 = _1278 * _1294;
            float _1302 = fma(_1276, _1296, _1300);
            float _1304 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1306 = fma(_1280, _1298, _1302);
            float _1308 = _1306 * _1304;
            float _1310 = fma(_162, _1308, _1184);
            float _1312 = fma(_164, _1308, _1182);
            float _1314 = fma(_166, _1308, _1186);
            _1264 = _1312;
            _1240 = _1310;
            _1242 = _1314;
            _1244 = _1304;
        }
    }
    float _1316 = _1264;
    float _1318 = _1240;
    float _1320 = _1242;
    float _1322 = _1244;
    float _1324 = _1322;
    if (_1220)
    {
        _1324 = 1.0;
    }
    float _1326 = _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1330 = _1254 * _1328;
    float _1332 = _1326;
    if (!_1220)
    {
        float _1334 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1336 = _1334 * 0.15915493667125701904296875;
        float _1338 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1340 = _1336 * 6.283185482025146484375;
        float _1342 = cos(_1340);
        float _1344 = _1338 * 0.15915493667125701904296875;
        float _1346 = _1336 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = 1.0 / _1342;
        float _1352 = _1344 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = _1348 * _1350;
        float _1358 = _1344 * 6.283185482025146484375;
        float _1360 = sin(_1358);
        float _1362 = _1354 * _1356;
        float _1364 = 1.0 / _1362;
        float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1368 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1366;
        float _1370 = 1.0 / _1368;
        float _1372 = _1360 * _1364;
        float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1376 = fma(_1330, _1372, _1374);
        float _1378 = _1376 * _1370;
        float _1380 = precise::clamp(_1378, 0.0, 1.0);
        _1246 = _1344;
        _1258 = _1380;
    }
    float _1382 = _1246;
    float _1384 = _1258;
    float _1386 = _1382;
    if (!_1220)
    {
        float _1388 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1394 = _1390 * 6.283185482025146484375;
        float _1396 = cos(_1394);
        float _1398 = _1392 * 0.15915493667125701904296875;
        float _1400 = _1390 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = 1.0 / _1396;
        float _1406 = _1398 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = _1402 * _1404;
        float _1412 = _1398 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = _1408 * _1410;
        float _1418 = 1.0 / _1416;
        float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1422 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1420;
        float _1424 = 1.0 / _1422;
        float _1426 = _1414 * _1418;
        float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1430 = fma(_1330, _1426, _1428);
        float _1432 = _1430 * _1424;
        float _1434 = precise::clamp(_1432, 0.0, 1.0);
        float _1436 = -_1434;
        float _1438 = _1436 + 1.0;
        _1386 = _1404;
        _1332 = _1438;
    }
    float _1440 = _1386;
    float _1442 = _1332;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1446 = _1316 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1450 = _1318 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1454 = _1320 + _1452;
    float _1456 = _1446 * _1446;
    float _1458 = fma(_1450, _1450, _1456);
    float _1460 = fma(_1454, _1454, _1458);
    float _1462 = rsqrt(_1460);
    float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1466 = _1450 * _1464;
    float _1468 = _1454 * _1464;
    float _1470 = _1466 * _1466;
    float _1472 = _1468 * _1468;
    float _1474 = _1470 + _1472;
    float _1476 = sqrt(_1474);
    bool _1478 = _1476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1482 = _1476 + _1480;
    float _1484 = _1462;
    float _1486 = _1474;
    float _1488 = _1482;
    float _1490 = _1440;
    float _1492 = _1446;
    float _1494 = _1466;
    if (_1478)
    {
        float _1496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1484 = _1496;
    }
    float _1498 = _1484;
    if (_1478)
    {
        float _1500 = rsqrt(_1474);
        _1486 = _1500;
    }
    float _1502 = _1486;
    if (_1478)
    {
        float _1504 = _1482 * _1498;
        _1488 = _1504;
    }
    float _1506 = _1488;
    if (_1478)
    {
        float _1508 = _1506 * 0.15915493667125701904296875;
        _1490 = _1508;
    }
    float _1510 = _1490;
    float _1512 = _1498;
    float _1514 = _1510;
    if (_1478)
    {
        float _1516 = _1510 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        _1512 = _1518;
    }
    float _1520 = _1512;
    float _1522 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1524 = precise::max(0.0, _1522);
    float _1526 = _1454;
    float _1528 = _1524;
    if (_1478)
    {
        float _1530 = _1510 * 6.283185482025146484375;
        float _1532 = cos(_1530);
        _1526 = _1532;
    }
    float _1534 = _1526;
    float _1536 = -_1464;
    float _1538 = -_1524;
    float _1540 = fma(_1446, _1536, _1538);
    if (!_1478)
    {
        _1492 = _1468;
    }
    float _1542 = _1492;
    float _1544 = _1542;
    if (_1478)
    {
        float _1546 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1528 = _1546;
    }
    float _1548 = _1528;
    float _1550 = _1520;
    float _1552 = _1548;
    if (_1478)
    {
        float _1554 = fma(_1520, _1548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1550 = _1554;
    }
    float _1556 = _1550;
    float _1558 = _1556;
    float _1560 = _1534;
    if (_1478)
    {
        float _1562 = _1534 + (-1.0);
        _1552 = _1562;
    }
    float _1564 = _1552;
    float _1566 = _1564;
    if (_1478)
    {
        float _1568 = _1502 * _1556;
        _990 = _1568;
    }
    float _1570 = _990;
    if (!_1478)
    {
        _1558 = _1540;
    }
    float _1572 = _1558;
    float _1574 = sqrt(_1460);
    float _1576 = _1572;
    if (_1478)
    {
        float _1578 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1578;
    }
    float _1580 = _1514;
    if (_1478)
    {
        float _1582 = _1466 * _1570;
        _1494 = _1582;
    }
    float _1584 = _1494;
    if (!_1478)
    {
        _1566 = _1470;
    }
    float _1586 = _1566;
    float _1588 = _1586;
    if (_1478)
    {
        float _1590 = _1468 * _1570;
        _1544 = _1590;
    }
    float _1592 = _1544;
    if (_1478)
    {
        float _1594 = fma(_1540, _1534, _1580);
        _1576 = _1594;
    }
    float _1596 = _1576;
    if (_1478)
    {
        float _1598 = _1584 * _1584;
        _1588 = _1598;
    }
    float _1600 = _1588;
    if (!_1478)
    {
        _1560 = _1472;
    }
    float _1602 = _1560;
    float _1604 = _1602;
    if (_1478)
    {
        float _1606 = _1592 * _1592;
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = fma(_1596, _1596, _1600);
    float _1612 = _1610 + _1608;
    float _1614 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1618 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1616);
    float _1620 = precise::clamp(_1618, 0.0, 1.0);
    float _1622 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1624 = rsqrt(_1612);
    float _1626 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1614);
    float _1628 = -_1620;
    float _1630 = _1628 + 1.0;
    float _1632 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1634 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1622);
    float _1636 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1638 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1626);
    float _1640 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1632);
    float _1642 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1634);
    float _1644 = abs(_1630);
    float _1646 = log2(_1644);
    float _1648 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1636);
    float _1650 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1640);
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1654 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1648);
    float _1656 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1658 = _1624 * _1584;
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1662 = _1624 * _1596;
    float _1664 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1666 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1668 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1660);
    float _1670 = _1624 * _1592;
    float _1672 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1674 = -_1666;
    float _1676 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1674);
    float _1678 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1682 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1668);
    float _1684 = -_1670;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1676);
    float _1688 = -_1678;
    float _1690 = fma(_1688, _1672, 1.0);
    float _1692 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1682);
    float _1696 = fma(_1686, -0.5, 0.5);
    float _1698 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1700 = exp2(_1692);
    float _1702 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1704 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1698);
    float _1706 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1702);
    float _1708 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1704);
    float _1710 = log2(_1690);
    float _1712 = fma(_1686, 0.5, 0.5);
    float _1714 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1706);
    float _1716 = _1662 + 1.0;
    float _1718 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1708);
    float _1720 = fma(_1712, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1722 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1714);
    float _1724 = 1.0 / _1694;
    float _1726 = -_1662;
    float _1728 = fma(_1700, _1716, _1726);
    float _1730 = fma(_1712, _1720, -0.212114393711090087890625);
    float _1732 = fma(_1728, 0.5, 0.5);
    float _1734 = fma(_1712, _1730, 1.570728778839111328125);
    float _1736 = sqrt(_1696);
    float _1738 = _1710 * 0.693147182464599609375;
    float _1740 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1742 = _1718 * _1724;
    float _1744 = _1722 * _1724;
    float _1746 = fma(_1742, 0.5, 0.5);
    float _1748 = fma(_1744, -0.5, 0.5);
    float _1750 = _1736 * 0.636619746685028076171875;
    float3 _4908 = float3(_1746, _1748, _1740);
    float _1752 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4908, float3(0.0), isnan(_4908)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4908, float3(0.0), isnan(_4908)), level(0.0)).x;
    float3 _4919 = float3(_1746, _1748, _1740);
    float4 _1755 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4919, float3(0.0), isnan(_4919)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4919, float3(0.0), isnan(_4919)), level(0.0)).xyzw;
    float _1757 = _1755.x;
    float _1759 = _1755.y;
    float _1761 = _1755.z;
    float _1763 = _1755.w;
    float _1765 = -_1734;
    float _1767 = fma(_1750, _1765, 1.0);
    float2 _4941 = float2(_1767, _1732);
    float3 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4941, float2(0.0), isnan(_4941)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4941, float2(0.0), isnan(_4941)), level(0.0)).xyz;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = in.m_51.w;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1783 = in.m_59.y;
    float _1785 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1791 = _1789 != 0;
    float _1793 = in.m_51.x;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1797 = _1795 != 0;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1801 = _1799 != 0;
    float _1803 = in.m_59.x;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1807 = _1805 != 0;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1811 = _1809 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1817 = _1815 != 0;
    float _1819 = 1.0 / _1811;
    bool _1821 = _1779 > 0.5;
    float _1823 = 0.0;
    bool _1825 = _1821;
    if (_1797)
    {
        float _1827 = in.m_51.z;
        _1823 = _1827;
    }
    float _1829 = _1823;
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1831;
    float _1835 = -_1783;
    float _1837 = _1835 + 1.0;
    float _1839 = _1026 * _1783;
    float _1841 = in.m_51.y;
    float _1843 = _1783;
    float _1845 = _1839;
    if (_1801)
    {
        float _1847 = _1821 ? _1837 : _1783;
        _1843 = _1847;
    }
    float _1849 = _1843;
    float _1851 = _1811;
    if (!_1791)
    {
        float _1853 = in.m_51.z;
        _1851 = _1853;
    }
    float _1855 = _1851;
    float _1857 = -_1839;
    float _1859 = _1857 + 1.0;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1863 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1865 = _1833 * _1819;
    float _1867 = -_1813;
    float _1869 = fma(_1863, 2.0, _1867);
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1875 = _1829;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1879 = _1865;
    if (_1797)
    {
        bool _1881 = _1829 > 0.5;
        _1825 = _1881;
    }
    bool _1883 = _1825;
    if (!_1797)
    {
        _1875 = _1803;
    }
    float _1885 = _1875;
    float _1887 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1873);
    float _1889 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1891 = _1841 > 0.5;
    float _1893 = _1885;
    if (!_1791)
    {
        _1877 = _1841;
    }
    float _1895 = _1877;
    float _1897 = fma(_1889, -2.0, _1861);
    float _1899 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1901 = _1895;
    if (_1807)
    {
        float _1903 = _1891 ? _1859 : _1839;
        _1845 = _1903;
    }
    float _1905 = _1845;
    float _1907 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1909 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1897);
    float _1911 = fma(_1899, _1849, -0.5);
    float _1913 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1871);
    float _1915 = fma(_1907, _1905, -0.5);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1919 = _1018 + _1917;
    float _1921 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1913);
    float _1923 = _1913;
    float _1925 = _1855;
    if (!_1791)
    {
        _1923 = _1855;
    }
    float _1927 = _1923;
    float _1929 = fma(_1865, _1919, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1931 = _1927;
    if (_1791)
    {
        _1931 = _1841;
    }
    float _1933 = _1931;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1791)
    {
        _1925 = _1841;
    }
    float _1937 = _1925;
    float _1939 = -_1909;
    float _1941 = fma(_1921, _1915, _1939);
    bool _1943 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1945 = isnan(_1018);
    bool _1947 = _1943 || _1945;
    bool _1949 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1951 = _1947 || _1949;
    float _1953 = float(_1951);
    float _1955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1957 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1959 = isnan(_1018);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1971 = as_type<int>(_1937);
    if (_1791)
    {
        _1901 = _1793;
    }
    float _1973 = _1901;
    float _1975 = -_1953;
    float _1977 = _1975 + 1.0;
    if (!_1797)
    {
        _1879 = _1885;
    }
    float _1979 = _1879;
    float _1981 = _1979;
    if (_1797)
    {
        _1893 = _1803;
    }
    float _1983 = _1893;
    float _1985 = _1967 * _1977;
    float _1987 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1935);
    float _1989 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1991 = _1929 * _1985;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1997 = _1040 * _1983;
    float _1999 = -_1993;
    float _2001 = fma(_1989, 2.0, _1999);
    bool _2003 = _1793 > 0.5;
    float _2005 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1995);
    float _2007 = _1997;
    if (_1797)
    {
        float _2009 = -_1983;
        float _2011 = _2009 + 1.0;
        _1971 = as_type<int>(_2011);
    }
    int _2013 = _1971;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2017 = -_1967;
    float _2019 = _2017 + 1.0;
    float _2021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2023 = -_122;
    float _2025 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2001);
    if (_1797)
    {
        float _2027 = _1883 ? as_type<float>(_2013) : _1983;
        _1981 = _2027;
    }
    float _2029 = _1981;
    float _2031 = fma(_1969, -2.0, _2015);
    float _2033 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2035 = -_1997;
    float _2037 = _2035 + 1.0;
    float _2039 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1991);
    float _2041 = -_122;
    float _2043 = fma(_2041, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1869);
    float _2045 = fma(_2033, _2029, -0.5);
    float _2047 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1887);
    float _2049 = _986 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1817)
    {
        float _2051 = _2003 ? _2037 : _1997;
        _2007 = _2051;
    }
    float _2053 = _2007;
    float _2055 = exp2(_1785);
    float _2057 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1987);
    float _2059 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2039);
    float _2061 = _982 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2063 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2065 = fma(_2057, _2045, _2025);
    float _2067 = _984 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2069 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2005);
    float _2071 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2031);
    float _2073 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2077 = _2049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2059 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2081 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2063);
    float _2083 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2085 = _1384 > 0.0;
    bool _2087 = isnan(_1384);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.0);
    bool _2093 = _2089 || _2091;
    float _2095 = -_2055;
    float _2097 = _2095 + 1.0;
    out.m_63.x = _2073;
    out.m_63.y = _2075;
    out.m_63.z = _2077;
    out.m_63.w = _2079;
    float _2099 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2081);
    float _2101 = fma(_2083, _2053, -0.5);
    float _2103 = _1384 * _1442;
    bool _2105 = _1442 <= 0.0;
    bool _2107 = !_2093;
    bool _2109 = _2105 || _2107;
    float _2111 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2099);
    float _2113 = fma(_2047, _2101, _2043);
    float _2115 = _2103 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2117 = -_2071;
    float _2119 = fma(_2069, _1911, _2117);
    float _2121 = _2111 + _1694;
    float _2123 = _2113 + 0.5;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2127 = _1941 + 0.5;
    float _2129 = _2065 + 0.5;
    float _2131 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2133 = _2119 + 0.5;
    float _2135 = _2121 * 0.5;
    float _2137 = -_2131;
    float _2139 = _2137 + 1.0;
    out.m_65.x = _2123;
    out.m_65.y = _2127;
    out.m_65.z = _2129;
    out.m_65.w = _2133;
    out.m_45.x = _2125;
    out.gl_Position.x = _1718;
    out.gl_Position.y = _1722;
    out.gl_Position.z = _2111;
    out.gl_Position.w = _1694;
    out.m_67.z = _2135;
    out.m_67.w = _1694;
    float _2141 = _2131 * _1752;
    float _2143 = _1763 * _2139;
    float _2145 = _1763 * _2141;
    float _2147 = _1777 * _2141;
    float _2149 = fma(_1773, _2145, _1757);
    float _2151 = fma(_1775, _2145, _1759);
    float _2153 = fma(_1763, _2147, _1761);
    out.m_69.x = _2149;
    out.m_69.y = _2151;
    out.m_69.z = _2153;
    out.m_69.w = _2143;
    if (!_2109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2155 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2155;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1010 = false;
    bool _732 = false;
    bool _590 = false;
    bool _302 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2212 = as_type<float>(_104);
        out.gl_Position.z = _2212;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2281 = as_type<float>(_140);
        out.gl_Position.z = _2281;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = _144 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _152 = _144 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _156 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _150);
    float _158 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _152);
    float _160 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].z, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].z, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].z, _160);
    bool _168 = !_148;
    float _186;
    if (!_168)
    {
        float _170 = in.m_51.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_88);
        float _192 = 1.0 / _190;
        float _194 = _122 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    bool _218 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _220 = isnan(_196);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -_212;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = 1.0 / _216;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _242 = _228 * _232;
    float _244 = -_228;
    float _246 = _244 + 1.0;
    float _248 = _200 * _238;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = fma(_236, _248, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _256;
    float _260 = fma(_252, _248, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _262 = fma(_258, _248, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = _254 * _242;
    float _266 = _262 * _242;
    float _268 = _260 * _242;
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].x, _264);
    float _272 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].y, _266);
    float _274 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].z, _268);
    float _276 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _270);
    float _278 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    float _280 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _274);
    bool _282 = !_240;
    float _300;
    if (!_282)
    {
        float _284 = in.m_51.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_88);
        float _306 = 1.0 / _304;
        float _308 = _122 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = in.m_53.x;
    float _314 = in.m_53.y;
    float _316 = in.m_53.z;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _334 = 1.0 / _320;
    bool _336 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _338 = isnan(_310);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _328;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _352 = _310 + _350;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _356 = _280 * _316;
    float _358 = _278 * _314;
    float _360 = 1.0 / _324;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _364 = _310 + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _368 = _310 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _372 = _310 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _374;
    float _378 = _364 * _334;
    bool _380 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _382 = isnan(_310);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _276 * _312;
    float _394 = 1.0 / _332;
    float _396 = _352 * _348;
    bool _398 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _400 = isnan(_310);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = fma(_376, _378, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _412 = _368 * _360;
    float _414 = -_390;
    float _416 = _414 + 1.0;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _418;
    float _422 = _408 * _416;
    float _424 = -_408;
    float _426 = _424 + 1.0;
    float _428 = fma(_420, _378, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _430 = _372 * _394;
    bool _432 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _434 = isnan(_310);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _444;
    float _448 = -_442;
    float _450 = _448 + 1.0;
    float _452 = _442 * _426;
    float _454 = fma(_446, _378, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _460 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _462 = isnan(_310);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _346 * _450;
    float _474 = -_346;
    float _476 = _474 + 1.0;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _486 = fma(_458, _412, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _488 = _470 * _476;
    float _490 = fma(_480, _412, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _492 = fma(_484, _412, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _494 = -_470;
    float _496 = _494 + 1.0;
    float _498 = _428 * _488;
    float _500 = _410 * _488;
    float _502 = _454 * _488;
    float _504 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[107].x, _498);
    float _506 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[107].y, _500);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _508;
    float _512 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[107].z, _502);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _518;
    float _522 = fma(_490, _472, _504);
    float _524 = fma(_486, _472, _506);
    float _526 = fma(_492, _472, _512);
    float _528 = fma(_516, _396, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _530 = fma(_510, _396, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _532 = fma(_520, _396, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _546 = fma(_528, _452, _522);
    float _548 = fma(_536, _430, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _550 = fma(_540, _430, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _552 = fma(_544, _430, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _554 = fma(_530, _452, _524);
    float _556 = fma(_532, _452, _526);
    float _558 = fma(_548, _422, _546);
    float _560 = fma(_550, _422, _554);
    float _562 = fma(_552, _422, _556);
    float _564 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[111].x, _558);
    float _566 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[111].y, _560);
    float _568 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[111].z, _562);
    bool _570 = !_354;
    float _588;
    if (!_570)
    {
        float _572 = in.m_51.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_88);
        float _594 = 1.0 / _592;
        float _596 = _122 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _598 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _610 = isnan(_598);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _624 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _626 = isnan(_598);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _636;
    bool _640 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _642 = isnan(_598);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = 1.0 / _606;
    float _654 = -_618;
    float _656 = _654 + 1.0;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _660 = _634 * _656;
    float _662 = -_634;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _622;
    float _668 = _638 * _652;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = fma(_668, _602, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = _672 * _666;
    float _678 = _674 * _660;
    float _680 = -_650;
    float _682 = _680 + 1.0;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _686 = _598 + _684;
    float _688 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _690 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _678);
    float _692 = _618 * _682;
    float _694 = fma(_676, _686, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _696 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _698 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_694, _692, _690);
    float _702 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[117].x, _700);
    float _708 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _698;
    out.m_55.y = _708;
    out.m_55.z = _704;
    out.m_55.w = _710;
    bool _712 = !_658;
    float _730;
    if (!_712)
    {
        float _714 = in.m_51.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_88);
        float _736 = 1.0 / _734;
        float _738 = _122 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _744 = _740 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _740 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _752 = _740 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _770 = 1.0 / _756;
    bool _772 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _774 = isnan(_740);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = 1.0 / _760;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _788 = _740 + _786;
    bool _790 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _792 = 1.0 / _764;
    float _794 = _744 * _770;
    bool _796 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _798 = isnan(_740);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _808;
    float _812 = fma(_810, _794, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _814 = 1.0 / _768;
    float _816 = _748 * _784;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _818;
    bool _822 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _824 = isnan(_740);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = fma(_820, _794, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _836 = _752 * _792;
    bool _838 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _840 = isnan(_740);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _850;
    float _854 = fma(_852, _794, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _856 = -_848;
    float _858 = _856 + 1.0;
    float _860 = _788 * _814;
    bool _862 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _864 = isnan(_740);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_806;
    float _876 = _874 + 1.0;
    float _878 = _782 * _858;
    float _880 = -_782;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _888 = _872 * _876;
    float _890 = -_872;
    float _892 = _890 + 1.0;
    float _894 = _832 * _882;
    float _896 = fma(_886, _816, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _898 = -_832;
    float _900 = _898 + 1.0;
    float _902 = _848 * _892;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _912 = _812 * _894;
    float _914 = _834 * _894;
    float _916 = fma(_906, _816, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _918 = fma(_910, _816, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _920 = _854 * _894;
    float _922 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[123].x, _912);
    float _924 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[123].y, _914);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _934;
    float _938 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[123].z, _920);
    float _940 = fma(_896, _878, _922);
    float _942 = fma(_932, _836, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _944 = fma(_916, _878, _924);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _950 = fma(_928, _836, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _956 = fma(_936, _836, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _958 = fma(_918, _878, _938);
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _964 = fma(_942, _902, _940);
    float _966 = fma(_948, _860, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _968 = fma(_954, _860, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _970 = fma(_950, _902, _944);
    float _972 = fma(_962, _860, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _974 = fma(_956, _902, _958);
    float _976 = fma(_966, _888, _964);
    float _978 = fma(_968, _888, _970);
    float _980 = fma(_972, _888, _974);
    float _982 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[127].x, _976);
    float _984 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[127].y, _978);
    float _986 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[127].z, _980);
    bool _988 = !_790;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1008;
    if (!_988)
    {
        float _992 = in.m_51.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _1008 = _1006;
        _1010 = true;
    }
    else
    {
        float _1012 = float(_88);
        float _1014 = 1.0 / _1012;
        float _1016 = _122 * _1014;
        _1008 = _1016;
    }
    _1010 = false;
    float _1018 = _1008;
    float _1020 = in.m_57.x;
    float _1022 = in.m_57.y;
    float _1024 = in.m_57.z;
    float _1026 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1028 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = in.m_42.x;
    float _1032 = in.m_42.y;
    float _1034 = in.m_42.z;
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1022);
    float _1038 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1020);
    float _1040 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1024);
    float _1044 = _1026 * _1036;
    float _1046 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1048 = _1040 * _1038;
    float _1050 = _1028 * _1042;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1054 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1056 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1046);
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1052);
    float _1062 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1054);
    float _1064 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1056);
    float _1066 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1068 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1060);
    float _1070 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1074 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1066);
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1080 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1082 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1084 = _1072 + _1076;
    float _1086 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1080);
    float _1088 = _1078 + _1082;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1092 = _1084 + _1090;
    float _1094 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1086);
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1098 = _1088 + _1096;
    float _1100 = _1092 * _1092;
    float _1102 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1104 = fma(_1098, _1098, _1100);
    float _1106 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1108 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1110 = sqrt(_1104);
    float _1112 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1106);
    float _1114 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1108);
    float _1116 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1112);
    float _1118 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1114);
    float _1120 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1122 = _1102 + _1120;
    bool _1124 = _1110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1126 = _1108;
    float _1128 = _1120;
    float _1130 = _1114;
    if (!_1124)
    {
        _1126 = _1088;
    }
    float _1132 = _1126;
    float _1134 = _1132;
    if (!_1124)
    {
        _1128 = _1084;
    }
    float _1136 = _1128;
    float _1138 = _1136;
    if (!_1124)
    {
        _1130 = _1122;
    }
    float _1140 = _1130;
    bool _1142 = !_1124;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1150 = _1110 + _1148;
        float _1152 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1154 = rsqrt(_1104);
        float _1156 = _1150 * _1146;
        float _1158 = _1156 * 0.15915493667125701904296875;
        float _1160 = _1158 * 6.283185482025146484375;
        float _1162 = cos(_1160);
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1162 + (-1.0);
        float _1170 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1172 = fma(_1166, _1152, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1174 = fma(_1122, _1162, _1170);
        float _1176 = _1154 * _1172;
        float _1178 = fma(_1098, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1180 = fma(_1092, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1144 = _1174;
        _1134 = _1178;
        _1138 = _1180;
    }
    float _1182 = _1144;
    float _1184 = _1134;
    float _1186 = _1138;
    float _1188 = -_1102;
    float _1190 = _1188 + _1182;
    float _1192 = -_1078;
    float _1194 = _1192 + _1184;
    float _1196 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1198 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1200 = _1190 * _1190;
    float _1202 = -_1072;
    float _1204 = _1202 + _1186;
    float _1206 = 1.0 / _1196;
    float _1208 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1198);
    float _1210 = fma(_1194, _1194, _1200);
    bool _1212 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1214 = isnan(0.5);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1220 = _1216 || _1218;
    float _1222 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1208);
    float _1224 = fma(_1204, _1204, _1210);
    float _1226 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1228 = sqrt(_1224);
    float _1230 = _1226 + _1196;
    float _1232 = _1230 * _1206;
    float _1234 = _1232 * 0.5;
    float _1236 = _1206;
    float _1238 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1240 = _1184;
    float _1242 = _1186;
    float _1244 = _1190;
    float _1246 = _1182;
    if (_1220)
    {
        _1236 = 1.0;
    }
    float _1248 = _1236;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1250);
    float _1254 = 1.0 / _1252;
    bool _1256 = _1228 > 0.0;
    float _1258 = _1248;
    if (!_1256)
    {
        _1238 = _1182;
    }
    float _1260 = _1238;
    bool _1262 = !_1256;
    float _1264 = _1260;
    if (!_1262)
    {
        float _1266 = _164 * _164;
        float _1268 = fma(_162, _162, _1266);
        float _1270 = fma(_166, _166, _1268);
        float _1272 = rsqrt(_1224);
        float _1274 = sqrt(_1270);
        float _1276 = _1194 * _1272;
        float _1278 = _1190 * _1272;
        float _1280 = _1204 * _1272;
        bool _1282 = _1274 > 0.0;
        float _1284 = _1274;
        if (!_1282)
        {
            _1284 = _1182;
        }
        float _1286 = _1284;
        bool _1288 = !_1282;
        _1264 = _1286;
        if (!_1288)
        {
            float _1290 = rsqrt(_1270);
            float _1292 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1294 = _164 * _1290;
            float _1296 = _162 * _1290;
            float _1298 = _166 * _1290;
            float _1300 = _1278 * _1294;
            float _1302 = fma(_1276, _1296, _1300);
            float _1304 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1306 = fma(_1280, _1298, _1302);
            float _1308 = _1306 * _1304;
            float _1310 = fma(_162, _1308, _1184);
            float _1312 = fma(_164, _1308, _1182);
            float _1314 = fma(_166, _1308, _1186);
            _1264 = _1312;
            _1240 = _1310;
            _1242 = _1314;
            _1244 = _1304;
        }
    }
    float _1316 = _1264;
    float _1318 = _1240;
    float _1320 = _1242;
    float _1322 = _1244;
    float _1324 = _1322;
    if (_1220)
    {
        _1324 = 1.0;
    }
    float _1326 = _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1330 = _1254 * _1328;
    float _1332 = _1326;
    if (!_1220)
    {
        float _1334 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1336 = _1334 * 0.15915493667125701904296875;
        float _1338 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1340 = _1336 * 6.283185482025146484375;
        float _1342 = cos(_1340);
        float _1344 = _1338 * 0.15915493667125701904296875;
        float _1346 = _1336 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = 1.0 / _1342;
        float _1352 = _1344 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = _1348 * _1350;
        float _1358 = _1344 * 6.283185482025146484375;
        float _1360 = sin(_1358);
        float _1362 = _1354 * _1356;
        float _1364 = 1.0 / _1362;
        float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1368 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1366;
        float _1370 = 1.0 / _1368;
        float _1372 = _1360 * _1364;
        float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1376 = fma(_1330, _1372, _1374);
        float _1378 = _1376 * _1370;
        float _1380 = precise::clamp(_1378, 0.0, 1.0);
        _1246 = _1344;
        _1258 = _1380;
    }
    float _1382 = _1246;
    float _1384 = _1258;
    float _1386 = _1382;
    if (!_1220)
    {
        float _1388 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1394 = _1390 * 6.283185482025146484375;
        float _1396 = cos(_1394);
        float _1398 = _1392 * 0.15915493667125701904296875;
        float _1400 = _1390 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = 1.0 / _1396;
        float _1406 = _1398 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = _1402 * _1404;
        float _1412 = _1398 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = _1408 * _1410;
        float _1418 = 1.0 / _1416;
        float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1422 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1420;
        float _1424 = 1.0 / _1422;
        float _1426 = _1414 * _1418;
        float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1430 = fma(_1330, _1426, _1428);
        float _1432 = _1430 * _1424;
        float _1434 = precise::clamp(_1432, 0.0, 1.0);
        float _1436 = -_1434;
        float _1438 = _1436 + 1.0;
        _1386 = _1404;
        _1332 = _1438;
    }
    float _1440 = _1386;
    float _1442 = _1332;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1446 = _1316 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1450 = _1318 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1454 = _1320 + _1452;
    float _1456 = _1446 * _1446;
    float _1458 = fma(_1450, _1450, _1456);
    float _1460 = fma(_1454, _1454, _1458);
    float _1462 = rsqrt(_1460);
    float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1466 = _1450 * _1464;
    float _1468 = _1454 * _1464;
    float _1470 = _1466 * _1466;
    float _1472 = _1468 * _1468;
    float _1474 = _1470 + _1472;
    float _1476 = sqrt(_1474);
    bool _1478 = _1476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1482 = _1476 + _1480;
    float _1484 = _1462;
    float _1486 = _1474;
    float _1488 = _1482;
    float _1490 = _1440;
    float _1492 = _1446;
    float _1494 = _1466;
    if (_1478)
    {
        float _1496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1484 = _1496;
    }
    float _1498 = _1484;
    if (_1478)
    {
        float _1500 = rsqrt(_1474);
        _1486 = _1500;
    }
    float _1502 = _1486;
    if (_1478)
    {
        float _1504 = _1482 * _1498;
        _1488 = _1504;
    }
    float _1506 = _1488;
    if (_1478)
    {
        float _1508 = _1506 * 0.15915493667125701904296875;
        _1490 = _1508;
    }
    float _1510 = _1490;
    float _1512 = _1498;
    float _1514 = _1510;
    if (_1478)
    {
        float _1516 = _1510 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        _1512 = _1518;
    }
    float _1520 = _1512;
    float _1522 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1524 = precise::max(0.0, _1522);
    float _1526 = _1454;
    float _1528 = _1524;
    if (_1478)
    {
        float _1530 = _1510 * 6.283185482025146484375;
        float _1532 = cos(_1530);
        _1526 = _1532;
    }
    float _1534 = _1526;
    float _1536 = -_1464;
    float _1538 = -_1524;
    float _1540 = fma(_1446, _1536, _1538);
    if (!_1478)
    {
        _1492 = _1468;
    }
    float _1542 = _1492;
    float _1544 = _1542;
    if (_1478)
    {
        float _1546 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1528 = _1546;
    }
    float _1548 = _1528;
    float _1550 = _1520;
    float _1552 = _1548;
    if (_1478)
    {
        float _1554 = fma(_1520, _1548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1550 = _1554;
    }
    float _1556 = _1550;
    float _1558 = _1556;
    float _1560 = _1534;
    if (_1478)
    {
        float _1562 = _1534 + (-1.0);
        _1552 = _1562;
    }
    float _1564 = _1552;
    float _1566 = _1564;
    if (_1478)
    {
        float _1568 = _1502 * _1556;
        _990 = _1568;
    }
    float _1570 = _990;
    if (!_1478)
    {
        _1558 = _1540;
    }
    float _1572 = _1558;
    float _1574 = sqrt(_1460);
    float _1576 = _1572;
    if (_1478)
    {
        float _1578 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1578;
    }
    float _1580 = _1514;
    if (_1478)
    {
        float _1582 = _1466 * _1570;
        _1494 = _1582;
    }
    float _1584 = _1494;
    if (!_1478)
    {
        _1566 = _1470;
    }
    float _1586 = _1566;
    float _1588 = _1586;
    if (_1478)
    {
        float _1590 = _1468 * _1570;
        _1544 = _1590;
    }
    float _1592 = _1544;
    if (_1478)
    {
        float _1594 = fma(_1540, _1534, _1580);
        _1576 = _1594;
    }
    float _1596 = _1576;
    if (_1478)
    {
        float _1598 = _1584 * _1584;
        _1588 = _1598;
    }
    float _1600 = _1588;
    if (!_1478)
    {
        _1560 = _1472;
    }
    float _1602 = _1560;
    float _1604 = _1602;
    if (_1478)
    {
        float _1606 = _1592 * _1592;
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = fma(_1596, _1596, _1600);
    float _1612 = _1610 + _1608;
    float _1614 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1618 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1616);
    float _1620 = precise::clamp(_1618, 0.0, 1.0);
    float _1622 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1624 = rsqrt(_1612);
    float _1626 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1614);
    float _1628 = -_1620;
    float _1630 = _1628 + 1.0;
    float _1632 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1634 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1622);
    float _1636 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1638 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1626);
    float _1640 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1632);
    float _1642 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1634);
    float _1644 = abs(_1630);
    float _1646 = log2(_1644);
    float _1648 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1636);
    float _1650 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1640);
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1654 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1648);
    float _1656 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1658 = _1624 * _1584;
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1662 = _1624 * _1596;
    float _1664 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1666 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1668 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1660);
    float _1670 = _1624 * _1592;
    float _1672 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1674 = -_1666;
    float _1676 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1674);
    float _1678 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1682 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1668);
    float _1684 = -_1670;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1676);
    float _1688 = -_1678;
    float _1690 = fma(_1688, _1672, 1.0);
    float _1692 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1682);
    float _1696 = fma(_1686, -0.5, 0.5);
    float _1698 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1700 = exp2(_1692);
    float _1702 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1704 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1698);
    float _1706 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1702);
    float _1708 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1704);
    float _1710 = log2(_1690);
    float _1712 = fma(_1686, 0.5, 0.5);
    float _1714 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1706);
    float _1716 = _1662 + 1.0;
    float _1718 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1708);
    float _1720 = fma(_1712, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1722 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1714);
    float _1724 = 1.0 / _1694;
    float _1726 = -_1662;
    float _1728 = fma(_1700, _1716, _1726);
    float _1730 = fma(_1712, _1720, -0.212114393711090087890625);
    float _1732 = fma(_1728, 0.5, 0.5);
    float _1734 = fma(_1712, _1730, 1.570728778839111328125);
    float _1736 = sqrt(_1696);
    float _1738 = _1710 * 0.693147182464599609375;
    float _1740 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1742 = _1718 * _1724;
    float _1744 = _1722 * _1724;
    float _1746 = fma(_1742, 0.5, 0.5);
    float _1748 = fma(_1744, -0.5, 0.5);
    float _1750 = _1736 * 0.636619746685028076171875;
    float3 _4908 = float3(_1746, _1748, _1740);
    float _1752 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4908, float3(0.0), isnan(_4908)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4908, float3(0.0), isnan(_4908)), level(0.0)).x;
    float3 _4919 = float3(_1746, _1748, _1740);
    float4 _1755 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4919, float3(0.0), isnan(_4919)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4919, float3(0.0), isnan(_4919)), level(0.0)).xyzw;
    float _1757 = _1755.x;
    float _1759 = _1755.y;
    float _1761 = _1755.z;
    float _1763 = _1755.w;
    float _1765 = -_1734;
    float _1767 = fma(_1750, _1765, 1.0);
    float2 _4941 = float2(_1767, _1732);
    float3 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4941, float2(0.0), isnan(_4941)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4941, float2(0.0), isnan(_4941)), level(0.0)).xyz;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = in.m_51.w;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1783 = in.m_59.y;
    float _1785 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1791 = _1789 != 0;
    float _1793 = in.m_51.x;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1797 = _1795 != 0;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1801 = _1799 != 0;
    float _1803 = in.m_59.x;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1807 = _1805 != 0;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1811 = _1809 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1817 = _1815 != 0;
    float _1819 = 1.0 / _1811;
    bool _1821 = _1779 > 0.5;
    float _1823 = 0.0;
    bool _1825 = _1821;
    if (_1797)
    {
        float _1827 = in.m_51.z;
        _1823 = _1827;
    }
    float _1829 = _1823;
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1831;
    float _1835 = -_1783;
    float _1837 = _1835 + 1.0;
    float _1839 = _1026 * _1783;
    float _1841 = in.m_51.y;
    float _1843 = _1783;
    float _1845 = _1839;
    if (_1801)
    {
        float _1847 = _1821 ? _1837 : _1783;
        _1843 = _1847;
    }
    float _1849 = _1843;
    float _1851 = _1811;
    if (!_1791)
    {
        float _1853 = in.m_51.z;
        _1851 = _1853;
    }
    float _1855 = _1851;
    float _1857 = -_1839;
    float _1859 = _1857 + 1.0;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1863 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1865 = _1833 * _1819;
    float _1867 = -_1813;
    float _1869 = fma(_1863, 2.0, _1867);
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1875 = _1829;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1879 = _1865;
    if (_1797)
    {
        bool _1881 = _1829 > 0.5;
        _1825 = _1881;
    }
    bool _1883 = _1825;
    if (!_1797)
    {
        _1875 = _1803;
    }
    float _1885 = _1875;
    float _1887 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1873);
    float _1889 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1891 = _1841 > 0.5;
    float _1893 = _1885;
    if (!_1791)
    {
        _1877 = _1841;
    }
    float _1895 = _1877;
    float _1897 = fma(_1889, -2.0, _1861);
    float _1899 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1901 = _1895;
    if (_1807)
    {
        float _1903 = _1891 ? _1859 : _1839;
        _1845 = _1903;
    }
    float _1905 = _1845;
    float _1907 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1909 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1897);
    float _1911 = fma(_1899, _1849, -0.5);
    float _1913 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1871);
    float _1915 = fma(_1907, _1905, -0.5);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1919 = _1018 + _1917;
    float _1921 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1913);
    float _1923 = _1913;
    float _1925 = _1855;
    if (!_1791)
    {
        _1923 = _1855;
    }
    float _1927 = _1923;
    float _1929 = fma(_1865, _1919, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1931 = _1927;
    if (_1791)
    {
        _1931 = _1841;
    }
    float _1933 = _1931;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1791)
    {
        _1925 = _1841;
    }
    float _1937 = _1925;
    float _1939 = -_1909;
    float _1941 = fma(_1921, _1915, _1939);
    bool _1943 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1945 = isnan(_1018);
    bool _1947 = _1943 || _1945;
    bool _1949 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1951 = _1947 || _1949;
    float _1953 = float(_1951);
    float _1955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1957 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1959 = isnan(_1018);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1971 = as_type<int>(_1937);
    if (_1791)
    {
        _1901 = _1793;
    }
    float _1973 = _1901;
    float _1975 = -_1953;
    float _1977 = _1975 + 1.0;
    if (!_1797)
    {
        _1879 = _1885;
    }
    float _1979 = _1879;
    float _1981 = _1979;
    if (_1797)
    {
        _1893 = _1803;
    }
    float _1983 = _1893;
    float _1985 = _1967 * _1977;
    float _1987 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1935);
    float _1989 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1991 = _1929 * _1985;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1997 = _1040 * _1983;
    float _1999 = -_1993;
    float _2001 = fma(_1989, 2.0, _1999);
    bool _2003 = _1793 > 0.5;
    float _2005 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1995);
    float _2007 = _1997;
    if (_1797)
    {
        float _2009 = -_1983;
        float _2011 = _2009 + 1.0;
        _1971 = as_type<int>(_2011);
    }
    int _2013 = _1971;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2017 = -_1967;
    float _2019 = _2017 + 1.0;
    float _2021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2023 = -_122;
    float _2025 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2001);
    if (_1797)
    {
        float _2027 = _1883 ? as_type<float>(_2013) : _1983;
        _1981 = _2027;
    }
    float _2029 = _1981;
    float _2031 = fma(_1969, -2.0, _2015);
    float _2033 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2035 = -_1997;
    float _2037 = _2035 + 1.0;
    float _2039 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1991);
    float _2041 = -_122;
    float _2043 = fma(_2041, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1869);
    float _2045 = fma(_2033, _2029, -0.5);
    float _2047 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1887);
    float _2049 = _986 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1817)
    {
        float _2051 = _2003 ? _2037 : _1997;
        _2007 = _2051;
    }
    float _2053 = _2007;
    float _2055 = exp2(_1785);
    float _2057 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1987);
    float _2059 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2039);
    float _2061 = _982 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2063 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2065 = fma(_2057, _2045, _2025);
    float _2067 = _984 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2069 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2005);
    float _2071 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2031);
    float _2073 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2077 = _2049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2059 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2081 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2063);
    float _2083 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2085 = _1384 > 0.0;
    bool _2087 = isnan(_1384);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.0);
    bool _2093 = _2089 || _2091;
    float _2095 = -_2055;
    float _2097 = _2095 + 1.0;
    out.m_63.x = _2073;
    out.m_63.y = _2075;
    out.m_63.z = _2077;
    out.m_63.w = _2079;
    float _2099 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2081);
    float _2101 = fma(_2083, _2053, -0.5);
    float _2103 = _1384 * _1442;
    bool _2105 = _1442 <= 0.0;
    bool _2107 = !_2093;
    bool _2109 = _2105 || _2107;
    float _2111 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2099);
    float _2113 = fma(_2047, _2101, _2043);
    float _2115 = _2103 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2117 = -_2071;
    float _2119 = fma(_2069, _1911, _2117);
    float _2121 = _2111 + _1694;
    float _2123 = _2113 + 0.5;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2127 = _1941 + 0.5;
    float _2129 = _2065 + 0.5;
    float _2131 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2133 = _2119 + 0.5;
    float _2135 = _2121 * 0.5;
    float _2137 = -_2131;
    float _2139 = _2137 + 1.0;
    out.m_65.x = _2123;
    out.m_65.y = _2127;
    out.m_65.z = _2129;
    out.m_65.w = _2133;
    out.m_45.x = _2125;
    out.gl_Position.x = _1718;
    out.gl_Position.y = _1722;
    out.gl_Position.z = _2111;
    out.gl_Position.w = _1694;
    out.m_67.z = _2135;
    out.m_67.w = _1694;
    float _2141 = _2131 * _1752;
    float _2143 = _1763 * _2139;
    float _2145 = _1763 * _2141;
    float _2147 = _1777 * _2141;
    float _2149 = fma(_1773, _2145, _1757);
    float _2151 = fma(_1775, _2145, _1759);
    float _2153 = fma(_1763, _2147, _1761);
    out.m_69.x = _2149;
    out.m_69.y = _2151;
    out.m_69.z = _2153;
    out.m_69.w = _2143;
    if (!_2109)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2155 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2155;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1010 = false;
    bool _732 = false;
    bool _590 = false;
    bool _302 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_45.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2212 = as_type<float>(_104);
        out.gl_Position.z = _2212;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_45.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2281 = as_type<float>(_140);
        out.gl_Position.z = _2281;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    bool _148 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _150 = _144 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _152 = _144 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _154 = _144 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _156 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[4].x, _150);
    float _158 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[5].x, _152);
    float _160 = fma(_142, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _162 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].z, _156);
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].z, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].z, _160);
    bool _168 = !_148;
    float _186;
    if (!_168)
    {
        float _170 = in.m_51.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_88);
        float _192 = 1.0 / _190;
        float _194 = _122 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _196 + _198;
    bool _202 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _204 = isnan(_196);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _214;
    bool _218 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _220 = isnan(_196);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -_212;
    float _232 = _230 + 1.0;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _234;
    float _238 = 1.0 / _216;
    bool _240 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _242 = _228 * _232;
    float _244 = -_228;
    float _246 = _244 + 1.0;
    float _248 = _200 * _238;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _250;
    float _254 = fma(_236, _248, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _256;
    float _260 = fma(_252, _248, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _262 = fma(_258, _248, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _264 = _254 * _242;
    float _266 = _262 * _242;
    float _268 = _260 * _242;
    float _270 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].x, _264);
    float _272 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].y, _266);
    float _274 = fma(_246, (*spvDescriptorSet0.vp_c9)._m0[143].z, _268);
    float _276 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].x, _270);
    float _278 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].y, _272);
    float _280 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[144].z, _274);
    bool _282 = !_240;
    float _300;
    if (!_282)
    {
        float _284 = in.m_51.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        float _304 = float(_88);
        float _306 = 1.0 / _304;
        float _308 = _122 * _306;
        _300 = _308;
    }
    _302 = false;
    float _310 = _300;
    float _312 = in.m_53.x;
    float _314 = in.m_53.y;
    float _316 = in.m_53.z;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _334 = 1.0 / _320;
    bool _336 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _338 = isnan(_310);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = 1.0 / _328;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _352 = _310 + _350;
    bool _354 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _356 = _280 * _316;
    float _358 = _278 * _314;
    float _360 = 1.0 / _324;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _364 = _310 + _362;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _368 = _310 + _366;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _372 = _310 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _374;
    float _378 = _364 * _334;
    bool _380 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _382 = isnan(_310);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _276 * _312;
    float _394 = 1.0 / _332;
    float _396 = _352 * _348;
    bool _398 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _400 = isnan(_310);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = fma(_376, _378, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _412 = _368 * _360;
    float _414 = -_390;
    float _416 = _414 + 1.0;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _418;
    float _422 = _408 * _416;
    float _424 = -_408;
    float _426 = _424 + 1.0;
    float _428 = fma(_420, _378, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _430 = _372 * _394;
    bool _432 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _434 = isnan(_310);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _444;
    float _448 = -_442;
    float _450 = _448 + 1.0;
    float _452 = _442 * _426;
    float _454 = fma(_446, _378, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _460 = _310 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _462 = isnan(_310);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = _346 * _450;
    float _474 = -_346;
    float _476 = _474 + 1.0;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _486 = fma(_458, _412, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _488 = _470 * _476;
    float _490 = fma(_480, _412, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _492 = fma(_484, _412, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _494 = -_470;
    float _496 = _494 + 1.0;
    float _498 = _428 * _488;
    float _500 = _410 * _488;
    float _502 = _454 * _488;
    float _504 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[107].x, _498);
    float _506 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[107].y, _500);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _508;
    float _512 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[107].z, _502);
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _514;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _518;
    float _522 = fma(_490, _472, _504);
    float _524 = fma(_486, _472, _506);
    float _526 = fma(_492, _472, _512);
    float _528 = fma(_516, _396, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _530 = fma(_510, _396, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _532 = fma(_520, _396, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _546 = fma(_528, _452, _522);
    float _548 = fma(_536, _430, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _550 = fma(_540, _430, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _552 = fma(_544, _430, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _554 = fma(_530, _452, _524);
    float _556 = fma(_532, _452, _526);
    float _558 = fma(_548, _422, _546);
    float _560 = fma(_550, _422, _554);
    float _562 = fma(_552, _422, _556);
    float _564 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[111].x, _558);
    float _566 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[111].y, _560);
    float _568 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[111].z, _562);
    bool _570 = !_354;
    float _588;
    if (!_570)
    {
        float _572 = in.m_51.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        float _592 = float(_88);
        float _594 = 1.0 / _592;
        float _596 = _122 * _594;
        _588 = _596;
    }
    _590 = false;
    float _598 = _588;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _598 + _600;
    float _604 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _606 = _604 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _608 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _610 = isnan(_598);
    bool _612 = _608 || _610;
    bool _614 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _616 = _612 || _614;
    float _618 = float(_616);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _624 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _626 = isnan(_598);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _636;
    bool _640 = _598 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _642 = isnan(_598);
    bool _644 = _640 || _642;
    bool _646 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _648 = _644 || _646;
    float _650 = float(_648);
    float _652 = 1.0 / _606;
    float _654 = -_618;
    float _656 = _654 + 1.0;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _660 = _634 * _656;
    float _662 = -_634;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _622;
    float _668 = _638 * _652;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = fma(_668, _602, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = _672 * _666;
    float _678 = _674 * _660;
    float _680 = -_650;
    float _682 = _680 + 1.0;
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _686 = _598 + _684;
    float _688 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _690 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _678);
    float _692 = _618 * _682;
    float _694 = fma(_676, _686, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _696 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _698 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_694, _692, _690);
    float _702 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[117].x, _700);
    float _708 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _706 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _698;
    out.m_55.y = _708;
    out.m_55.z = _704;
    out.m_55.w = _710;
    bool _712 = !_658;
    float _730;
    if (!_712)
    {
        float _714 = in.m_51.x;
        float _716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _718 = _714 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _720 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _722 = _720 * _716;
        float _724 = floor(_722);
        float _726 = -_724;
        float _728 = _722 + _726;
        _730 = _728;
        _732 = true;
    }
    else
    {
        float _734 = float(_88);
        float _736 = 1.0 / _734;
        float _738 = _122 * _736;
        _730 = _738;
    }
    _732 = false;
    float _740 = _730;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _744 = _740 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _748 = _740 + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _752 = _740 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _754;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _770 = 1.0 / _756;
    bool _772 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _774 = isnan(_740);
    bool _776 = _772 || _774;
    bool _778 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _780 = _776 || _778;
    float _782 = float(_780);
    float _784 = 1.0 / _760;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _788 = _740 + _786;
    bool _790 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _792 = 1.0 / _764;
    float _794 = _744 * _770;
    bool _796 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _798 = isnan(_740);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _808;
    float _812 = fma(_810, _794, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _814 = 1.0 / _768;
    float _816 = _748 * _784;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _818;
    bool _822 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _824 = isnan(_740);
    bool _826 = _822 || _824;
    bool _828 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _830 = _826 || _828;
    float _832 = float(_830);
    float _834 = fma(_820, _794, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _836 = _752 * _792;
    bool _838 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _840 = isnan(_740);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _850;
    float _854 = fma(_852, _794, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _856 = -_848;
    float _858 = _856 + 1.0;
    float _860 = _788 * _814;
    bool _862 = _740 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _864 = isnan(_740);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_806;
    float _876 = _874 + 1.0;
    float _878 = _782 * _858;
    float _880 = -_782;
    float _882 = _880 + 1.0;
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _886 = _884 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _888 = _872 * _876;
    float _890 = -_872;
    float _892 = _890 + 1.0;
    float _894 = _832 * _882;
    float _896 = fma(_886, _816, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _898 = -_832;
    float _900 = _898 + 1.0;
    float _902 = _848 * _892;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _912 = _812 * _894;
    float _914 = _834 * _894;
    float _916 = fma(_906, _816, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _918 = fma(_910, _816, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _920 = _854 * _894;
    float _922 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[123].x, _912);
    float _924 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[123].y, _914);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _928 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _926;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _930;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _934;
    float _938 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[123].z, _920);
    float _940 = fma(_896, _878, _922);
    float _942 = fma(_932, _836, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _944 = fma(_916, _878, _924);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _950 = fma(_928, _836, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _956 = fma(_936, _836, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _958 = fma(_918, _878, _938);
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _964 = fma(_942, _902, _940);
    float _966 = fma(_948, _860, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _968 = fma(_954, _860, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _970 = fma(_950, _902, _944);
    float _972 = fma(_962, _860, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _974 = fma(_956, _902, _958);
    float _976 = fma(_966, _888, _964);
    float _978 = fma(_968, _888, _970);
    float _980 = fma(_972, _888, _974);
    float _982 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[127].x, _976);
    float _984 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[127].y, _978);
    float _986 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[127].z, _980);
    bool _988 = !_790;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1008;
    if (!_988)
    {
        float _992 = in.m_51.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _1008 = _1006;
        _1010 = true;
    }
    else
    {
        float _1012 = float(_88);
        float _1014 = 1.0 / _1012;
        float _1016 = _122 * _1014;
        _1008 = _1016;
    }
    _1010 = false;
    float _1018 = _1008;
    float _1020 = in.m_57.x;
    float _1022 = in.m_57.y;
    float _1024 = in.m_57.z;
    float _1026 = _358 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1028 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1030 = in.m_42.x;
    float _1032 = in.m_42.y;
    float _1034 = in.m_42.z;
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1022);
    float _1038 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1020);
    float _1040 = _392 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1024);
    float _1044 = _1026 * _1036;
    float _1046 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1048 = _1040 * _1038;
    float _1050 = _1028 * _1042;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1054 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1056 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1046);
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1052);
    float _1062 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1054);
    float _1064 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1056);
    float _1066 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1068 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1060);
    float _1070 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1062);
    float _1072 = _1064 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1074 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1066);
    float _1076 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1080 = _1032 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1082 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1084 = _1072 + _1076;
    float _1086 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1080);
    float _1088 = _1078 + _1082;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1092 = _1084 + _1090;
    float _1094 = fma(_1034, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1086);
    float _1096 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1098 = _1088 + _1096;
    float _1100 = _1092 * _1092;
    float _1102 = _1094 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1104 = fma(_1098, _1098, _1100);
    float _1106 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1108 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1110 = sqrt(_1104);
    float _1112 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1106);
    float _1114 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1108);
    float _1116 = fma(_1050, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1112);
    float _1118 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1114);
    float _1120 = _1116 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1122 = _1102 + _1120;
    bool _1124 = _1110 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1126 = _1108;
    float _1128 = _1120;
    float _1130 = _1114;
    if (!_1124)
    {
        _1126 = _1088;
    }
    float _1132 = _1126;
    float _1134 = _1132;
    if (!_1124)
    {
        _1128 = _1084;
    }
    float _1136 = _1128;
    float _1138 = _1136;
    if (!_1124)
    {
        _1130 = _1122;
    }
    float _1140 = _1130;
    bool _1142 = !_1124;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1150 = _1110 + _1148;
        float _1152 = _1122 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1154 = rsqrt(_1104);
        float _1156 = _1150 * _1146;
        float _1158 = _1156 * 0.15915493667125701904296875;
        float _1160 = _1158 * 6.283185482025146484375;
        float _1162 = cos(_1160);
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = sin(_1164);
        float _1168 = _1162 + (-1.0);
        float _1170 = _1168 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1172 = fma(_1166, _1152, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1174 = fma(_1122, _1162, _1170);
        float _1176 = _1154 * _1172;
        float _1178 = fma(_1098, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1180 = fma(_1092, _1176, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1144 = _1174;
        _1134 = _1178;
        _1138 = _1180;
    }
    float _1182 = _1144;
    float _1184 = _1134;
    float _1186 = _1138;
    float _1188 = -_1102;
    float _1190 = _1188 + _1182;
    float _1192 = -_1078;
    float _1194 = _1192 + _1184;
    float _1196 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1198 = _1102 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1200 = _1190 * _1190;
    float _1202 = -_1072;
    float _1204 = _1202 + _1186;
    float _1206 = 1.0 / _1196;
    float _1208 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1198);
    float _1210 = fma(_1194, _1194, _1200);
    bool _1212 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1214 = isnan(0.5);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1220 = _1216 || _1218;
    float _1222 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1208);
    float _1224 = fma(_1204, _1204, _1210);
    float _1226 = _1222 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1228 = sqrt(_1224);
    float _1230 = _1226 + _1196;
    float _1232 = _1230 * _1206;
    float _1234 = _1232 * 0.5;
    float _1236 = _1206;
    float _1238 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1240 = _1184;
    float _1242 = _1186;
    float _1244 = _1190;
    float _1246 = _1182;
    if (_1220)
    {
        _1236 = 1.0;
    }
    float _1248 = _1236;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1252 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1250);
    float _1254 = 1.0 / _1252;
    bool _1256 = _1228 > 0.0;
    float _1258 = _1248;
    if (!_1256)
    {
        _1238 = _1182;
    }
    float _1260 = _1238;
    bool _1262 = !_1256;
    float _1264 = _1260;
    if (!_1262)
    {
        float _1266 = _164 * _164;
        float _1268 = fma(_162, _162, _1266);
        float _1270 = fma(_166, _166, _1268);
        float _1272 = rsqrt(_1224);
        float _1274 = sqrt(_1270);
        float _1276 = _1194 * _1272;
        float _1278 = _1190 * _1272;
        float _1280 = _1204 * _1272;
        bool _1282 = _1274 > 0.0;
        float _1284 = _1274;
        if (!_1282)
        {
            _1284 = _1182;
        }
        float _1286 = _1284;
        bool _1288 = !_1282;
        _1264 = _1286;
        if (!_1288)
        {
            float _1290 = rsqrt(_1270);
            float _1292 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1294 = _164 * _1290;
            float _1296 = _162 * _1290;
            float _1298 = _166 * _1290;
            float _1300 = _1278 * _1294;
            float _1302 = fma(_1276, _1296, _1300);
            float _1304 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1306 = fma(_1280, _1298, _1302);
            float _1308 = _1306 * _1304;
            float _1310 = fma(_162, _1308, _1184);
            float _1312 = fma(_164, _1308, _1182);
            float _1314 = fma(_166, _1308, _1186);
            _1264 = _1312;
            _1240 = _1310;
            _1242 = _1314;
            _1244 = _1304;
        }
    }
    float _1316 = _1264;
    float _1318 = _1240;
    float _1320 = _1242;
    float _1322 = _1244;
    float _1324 = _1322;
    if (_1220)
    {
        _1324 = 1.0;
    }
    float _1326 = _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1330 = _1254 * _1328;
    float _1332 = _1326;
    if (!_1220)
    {
        float _1334 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1336 = _1334 * 0.15915493667125701904296875;
        float _1338 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1340 = _1336 * 6.283185482025146484375;
        float _1342 = cos(_1340);
        float _1344 = _1338 * 0.15915493667125701904296875;
        float _1346 = _1336 * 6.283185482025146484375;
        float _1348 = sin(_1346);
        float _1350 = 1.0 / _1342;
        float _1352 = _1344 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = _1348 * _1350;
        float _1358 = _1344 * 6.283185482025146484375;
        float _1360 = sin(_1358);
        float _1362 = _1354 * _1356;
        float _1364 = 1.0 / _1362;
        float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1368 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1366;
        float _1370 = 1.0 / _1368;
        float _1372 = _1360 * _1364;
        float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1376 = fma(_1330, _1372, _1374);
        float _1378 = _1376 * _1370;
        float _1380 = precise::clamp(_1378, 0.0, 1.0);
        _1246 = _1344;
        _1258 = _1380;
    }
    float _1382 = _1246;
    float _1384 = _1258;
    float _1386 = _1382;
    if (!_1220)
    {
        float _1388 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1390 = _1388 * 0.15915493667125701904296875;
        float _1392 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1394 = _1390 * 6.283185482025146484375;
        float _1396 = cos(_1394);
        float _1398 = _1392 * 0.15915493667125701904296875;
        float _1400 = _1390 * 6.283185482025146484375;
        float _1402 = sin(_1400);
        float _1404 = 1.0 / _1396;
        float _1406 = _1398 * 6.283185482025146484375;
        float _1408 = cos(_1406);
        float _1410 = _1402 * _1404;
        float _1412 = _1398 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        float _1416 = _1408 * _1410;
        float _1418 = 1.0 / _1416;
        float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1422 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1420;
        float _1424 = 1.0 / _1422;
        float _1426 = _1414 * _1418;
        float _1428 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1430 = fma(_1330, _1426, _1428);
        float _1432 = _1430 * _1424;
        float _1434 = precise::clamp(_1432, 0.0, 1.0);
        float _1436 = -_1434;
        float _1438 = _1436 + 1.0;
        _1386 = _1404;
        _1332 = _1438;
    }
    float _1440 = _1386;
    float _1442 = _1332;
    float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1446 = _1316 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1450 = _1318 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1454 = _1320 + _1452;
    float _1456 = _1446 * _1446;
    float _1458 = fma(_1450, _1450, _1456);
    float _1460 = fma(_1454, _1454, _1458);
    float _1462 = rsqrt(_1460);
    float _1464 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1466 = _1450 * _1464;
    float _1468 = _1454 * _1464;
    float _1470 = _1466 * _1466;
    float _1472 = _1468 * _1468;
    float _1474 = _1470 + _1472;
    float _1476 = sqrt(_1474);
    bool _1478 = _1476 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1482 = _1476 + _1480;
    float _1484 = _1462;
    float _1486 = _1474;
    float _1488 = _1482;
    float _1490 = _1440;
    float _1492 = _1446;
    float _1494 = _1466;
    if (_1478)
    {
        float _1496 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1484 = _1496;
    }
    float _1498 = _1484;
    if (_1478)
    {
        float _1500 = rsqrt(_1474);
        _1486 = _1500;
    }
    float _1502 = _1486;
    if (_1478)
    {
        float _1504 = _1482 * _1498;
        _1488 = _1504;
    }
    float _1506 = _1488;
    if (_1478)
    {
        float _1508 = _1506 * 0.15915493667125701904296875;
        _1490 = _1508;
    }
    float _1510 = _1490;
    float _1512 = _1498;
    float _1514 = _1510;
    if (_1478)
    {
        float _1516 = _1510 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        _1512 = _1518;
    }
    float _1520 = _1512;
    float _1522 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1524 = precise::max(0.0, _1522);
    float _1526 = _1454;
    float _1528 = _1524;
    if (_1478)
    {
        float _1530 = _1510 * 6.283185482025146484375;
        float _1532 = cos(_1530);
        _1526 = _1532;
    }
    float _1534 = _1526;
    float _1536 = -_1464;
    float _1538 = -_1524;
    float _1540 = fma(_1446, _1536, _1538);
    if (!_1478)
    {
        _1492 = _1468;
    }
    float _1542 = _1492;
    float _1544 = _1542;
    if (_1478)
    {
        float _1546 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1528 = _1546;
    }
    float _1548 = _1528;
    float _1550 = _1520;
    float _1552 = _1548;
    if (_1478)
    {
        float _1554 = fma(_1520, _1548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1550 = _1554;
    }
    float _1556 = _1550;
    float _1558 = _1556;
    float _1560 = _1534;
    if (_1478)
    {
        float _1562 = _1534 + (-1.0);
        _1552 = _1562;
    }
    float _1564 = _1552;
    float _1566 = _1564;
    if (_1478)
    {
        float _1568 = _1502 * _1556;
        _990 = _1568;
    }
    float _1570 = _990;
    if (!_1478)
    {
        _1558 = _1540;
    }
    float _1572 = _1558;
    float _1574 = sqrt(_1460);
    float _1576 = _1572;
    if (_1478)
    {
        float _1578 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1514 = _1578;
    }
    float _1580 = _1514;
    if (_1478)
    {
        float _1582 = _1466 * _1570;
        _1494 = _1582;
    }
    float _1584 = _1494;
    if (!_1478)
    {
        _1566 = _1470;
    }
    float _1586 = _1566;
    float _1588 = _1586;
    if (_1478)
    {
        float _1590 = _1468 * _1570;
        _1544 = _1590;
    }
    float _1592 = _1544;
    if (_1478)
    {
        float _1594 = fma(_1540, _1534, _1580);
        _1576 = _1594;
    }
    float _1596 = _1576;
    if (_1478)
    {
        float _1598 = _1584 * _1584;
        _1588 = _1598;
    }
    float _1600 = _1588;
    if (!_1478)
    {
        _1560 = _1472;
    }
    float _1602 = _1560;
    float _1604 = _1602;
    if (_1478)
    {
        float _1606 = _1592 * _1592;
        _1604 = _1606;
    }
    float _1608 = _1604;
    float _1610 = fma(_1596, _1596, _1600);
    float _1612 = _1610 + _1608;
    float _1614 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1618 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1616);
    float _1620 = precise::clamp(_1618, 0.0, 1.0);
    float _1622 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1624 = rsqrt(_1612);
    float _1626 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1614);
    float _1628 = -_1620;
    float _1630 = _1628 + 1.0;
    float _1632 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1634 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1622);
    float _1636 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1638 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1626);
    float _1640 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1632);
    float _1642 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1634);
    float _1644 = abs(_1630);
    float _1646 = log2(_1644);
    float _1648 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1636);
    float _1650 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1640);
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1654 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1648);
    float _1656 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1658 = _1624 * _1584;
    float _1660 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1662 = _1624 * _1596;
    float _1664 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1666 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1668 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1660);
    float _1670 = _1624 * _1592;
    float _1672 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1674 = -_1666;
    float _1676 = fma(_1662, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1674);
    float _1678 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1680 = _1654 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1682 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1668);
    float _1684 = -_1670;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1676);
    float _1688 = -_1678;
    float _1690 = fma(_1688, _1672, 1.0);
    float _1692 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1694 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1682);
    float _1696 = fma(_1686, -0.5, 0.5);
    float _1698 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1700 = exp2(_1692);
    float _1702 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1704 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1698);
    float _1706 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1702);
    float _1708 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1704);
    float _1710 = log2(_1690);
    float _1712 = fma(_1686, 0.5, 0.5);
    float _1714 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1706);
    float _1716 = _1662 + 1.0;
    float _1718 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1708);
    float _1720 = fma(_1712, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1722 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1714);
    float _1724 = 1.0 / _1694;
    float _1726 = -_1662;
    float _1728 = fma(_1700, _1716, _1726);
    float _1730 = fma(_1712, _1720, -0.212114393711090087890625);
    float _1732 = fma(_1728, 0.5, 0.5);
    float _1734 = fma(_1712, _1730, 1.570728778839111328125);
    float _1736 = sqrt(_1696);
    float _1738 = _1710 * 0.693147182464599609375;
    float _1740 = _1738 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1742 = _1718 * _1724;
    float _1744 = _1722 * _1724;
    float _1746 = fma(_1742, 0.5, 0.5);
    float _1748 = fma(_1744, -0.5, 0.5);
    float _1750 = _1736 * 0.636619746685028076171875;
    float3 _4908 = float3(_1746, _1748, _1740);
    float _1752 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4908, float3(0.0), isnan(_4908)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4908, float3(0.0), isnan(_4908)), level(0.0)).x;
    float3 _4919 = float3(_1746, _1748, _1740);
    float4 _1755 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4919, float3(0.0), isnan(_4919)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4919, float3(0.0), isnan(_4919)), level(0.0)).xyzw;
    float _1757 = _1755.x;
    float _1759 = _1755.y;
    float _1761 = _1755.z;
    float _1763 = _1755.w;
    float _1765 = -_1734;
    float _1767 = fma(_1750, _1765, 1.0);
    float2 _4941 = float2(_1767, _1732);
    float3 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4941, float2(0.0), isnan(_4941)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4941, float2(0.0), isnan(_4941)), level(0.0)).xyz;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = in.m_51.w;
    float _1781 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1783 = in.m_59.y;
    float _1785 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    float _1787 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1789 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1791 = _1789 != 0;
    float _1793 = in.m_51.x;
    int _1795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1797 = _1795 != 0;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1801 = _1799 != 0;
    float _1803 = in.m_59.x;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1807 = _1805 != 0;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1811 = _1809 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1817 = _1815 != 0;
    float _1819 = 1.0 / _1811;
    bool _1821 = _1779 > 0.5;
    float _1823 = 0.0;
    bool _1825 = _1821;
    if (_1797)
    {
        float _1827 = in.m_51.z;
        _1823 = _1827;
    }
    float _1829 = _1823;
    float _1831 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1831;
    float _1835 = -_1783;
    float _1837 = _1835 + 1.0;
    float _1839 = _1026 * _1783;
    float _1841 = in.m_51.y;
    float _1843 = _1783;
    float _1845 = _1839;
    if (_1801)
    {
        float _1847 = _1821 ? _1837 : _1783;
        _1843 = _1847;
    }
    float _1849 = _1843;
    float _1851 = _1811;
    if (!_1791)
    {
        float _1853 = in.m_51.z;
        _1851 = _1853;
    }
    float _1855 = _1851;
    float _1857 = -_1839;
    float _1859 = _1857 + 1.0;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1863 = _1793 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1865 = _1833 * _1819;
    float _1867 = -_1813;
    float _1869 = fma(_1863, 2.0, _1867);
    float _1871 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1875 = _1829;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1879 = _1865;
    if (_1797)
    {
        bool _1881 = _1829 > 0.5;
        _1825 = _1881;
    }
    bool _1883 = _1825;
    if (!_1797)
    {
        _1875 = _1803;
    }
    float _1885 = _1875;
    float _1887 = fma(_1793, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1873);
    float _1889 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1891 = _1841 > 0.5;
    float _1893 = _1885;
    if (!_1791)
    {
        _1877 = _1841;
    }
    float _1895 = _1877;
    float _1897 = fma(_1889, -2.0, _1861);
    float _1899 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1901 = _1895;
    if (_1807)
    {
        float _1903 = _1891 ? _1859 : _1839;
        _1845 = _1903;
    }
    float _1905 = _1845;
    float _1907 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1909 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1897);
    float _1911 = fma(_1899, _1849, -0.5);
    float _1913 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1871);
    float _1915 = fma(_1907, _1905, -0.5);
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1919 = _1018 + _1917;
    float _1921 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1913);
    float _1923 = _1913;
    float _1925 = _1855;
    if (!_1791)
    {
        _1923 = _1855;
    }
    float _1927 = _1923;
    float _1929 = fma(_1865, _1919, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1931 = _1927;
    if (_1791)
    {
        _1931 = _1841;
    }
    float _1933 = _1931;
    float _1935 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_1791)
    {
        _1925 = _1841;
    }
    float _1937 = _1925;
    float _1939 = -_1909;
    float _1941 = fma(_1921, _1915, _1939);
    bool _1943 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1945 = isnan(_1018);
    bool _1947 = _1943 || _1945;
    bool _1949 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1951 = _1947 || _1949;
    float _1953 = float(_1951);
    float _1955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1957 = _1018 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1959 = isnan(_1018);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1965 = _1961 || _1963;
    float _1967 = float(_1965);
    float _1969 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1971 = as_type<int>(_1937);
    if (_1791)
    {
        _1901 = _1793;
    }
    float _1973 = _1901;
    float _1975 = -_1953;
    float _1977 = _1975 + 1.0;
    if (!_1797)
    {
        _1879 = _1885;
    }
    float _1979 = _1879;
    float _1981 = _1979;
    if (_1797)
    {
        _1893 = _1803;
    }
    float _1983 = _1893;
    float _1985 = _1967 * _1977;
    float _1987 = fma(_1973, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1935);
    float _1989 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1991 = _1929 * _1985;
    float _1993 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1997 = _1040 * _1983;
    float _1999 = -_1993;
    float _2001 = fma(_1989, 2.0, _1999);
    bool _2003 = _1793 > 0.5;
    float _2005 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1995);
    float _2007 = _1997;
    if (_1797)
    {
        float _2009 = -_1983;
        float _2011 = _2009 + 1.0;
        _1971 = as_type<int>(_2011);
    }
    int _2013 = _1971;
    float _2015 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2017 = -_1967;
    float _2019 = _2017 + 1.0;
    float _2021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2023 = -_122;
    float _2025 = fma(_2023, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2001);
    if (_1797)
    {
        float _2027 = _1883 ? as_type<float>(_2013) : _1983;
        _1981 = _2027;
    }
    float _2029 = _1981;
    float _2031 = fma(_1969, -2.0, _2015);
    float _2033 = _1955 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2035 = -_1997;
    float _2037 = _2035 + 1.0;
    float _2039 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1991);
    float _2041 = -_122;
    float _2043 = fma(_2041, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1869);
    float _2045 = fma(_2033, _2029, -0.5);
    float _2047 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1887);
    float _2049 = _986 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1817)
    {
        float _2051 = _2003 ? _2037 : _1997;
        _2007 = _2051;
    }
    float _2053 = _2007;
    float _2055 = exp2(_1785);
    float _2057 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1987);
    float _2059 = fma(_1953, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2039);
    float _2061 = _982 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2063 = _1652 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2065 = fma(_2057, _2045, _2025);
    float _2067 = _984 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2069 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2005);
    float _2071 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2031);
    float _2073 = _2061 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2075 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2077 = _2049 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2079 = _2059 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2081 = fma(_1656, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2063);
    float _2083 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2085 = _1384 > 0.0;
    bool _2087 = isnan(_1384);
    bool _2089 = _2085 || _2087;
    bool _2091 = isnan(0.0);
    bool _2093 = _2089 || _2091;
    float _2095 = -_2055;
    float _2097 = _2095 + 1.0;
    out.m_63.x = _2073;
    out.m_63.y = _2075;
    out.m_63.z = _2077;
    out.m_63.w = _2079;
    float _2099 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2081);
    float _2101 = fma(_2083, _2053, -0.5);
    float _2103 = _1384 * _1442;
    bool _2105 = _1442 <= 0.0;
    bool _2107 = !_2093;
    bool _2109 = _2105 || _2107;
    float _2111 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2099);
    float _2113 = fma(_2047, _2101, _2043);
    float _2115 = _2103 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2117 = -_2071;
    float _2119 = fma(_2069, _1911, _2117);
    float _2121 = _2111 + _1694;
    float _2123 = _2113 + 0.5;
    float _2125 = _2115 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2127 = _1941 + 0.5;
    float _2129 = _2065 + 0.5;
    float _2131 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2133 = _2119 + 0.5;
    float _2135 = _2121 * 0.5;
    float _2137 = -_2131;
    float _2139 = _2137 + 1.0;
    out.m_65.x = _2123;
    out.m_65.y = _2127;
    out.m_65.z = _2129;
    out.m_65.w = _2133;
    out.m_45.x = _2125;
    out.gl_Position.x = _1718;
    out.gl_Position.y = _1722;
    out.gl_Position.z = _2111;
    out.gl_Position.w = _1694;
    out.m_67.z = _2135;
    out.m_67.w = _1694;
    float _2141 = _2131 * _1752;
    float _2143 = _1763 * _2139;
    float _2145 = _1763 * _2141;
    float _2147 = _1777 * _2141;
    float _2149 = fma(_1773, _2145, _1757);
    float _2151 = fma(_1775, _2145, _1759);
    float _2153 = fma(_1763, _2147, _1761);
    out.m_69.x = _2149;
    out.m_69.y = _2151;
    out.m_69.z = _2153;
    out.m_69.w = _2143;
    if (!_2109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2155 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2155;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

