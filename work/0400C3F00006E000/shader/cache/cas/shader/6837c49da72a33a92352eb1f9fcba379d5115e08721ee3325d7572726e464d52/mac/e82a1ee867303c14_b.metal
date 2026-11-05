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
    float4 m_67 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_65 [[user(locn8)]];
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _688 = false;
    bool _590 = false;
    bool _416 = false;
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
        float _2777 = as_type<float>(_118);
        out.gl_Position.z = _2777;
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
        float _2832 = as_type<float>(_144);
        out.gl_Position.z = _2832;
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
    float _180 = _172;
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
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _202 + _208;
    bool _212 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _214 = isnan(_202);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = _202 + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = 1.0 / _226;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = 1.0 / _238;
    float _246 = 1.0 / _234;
    float _248 = _206 * _240;
    bool _250 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _252 = isnan(_202);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_222;
    float _264 = _262 + 1.0;
    float _266 = _260 * _264;
    float _268 = _210 * _244;
    bool _270 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_202);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    bool _286 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _288 = isnan(_202);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _302 = -_260;
    float _304 = _302 + 1.0;
    float _306 = -_280;
    float _308 = _306 + 1.0;
    float _310 = _230 * _246;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = _296 * _308;
    float _322 = fma(_284, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = fma(_314, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = fma(_318, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _328 = _280 * _304;
    float _330 = _322 * _320;
    float _332 = _324 * _320;
    float _334 = _326 * _320;
    float _336 = -_296;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_346, _268, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = fma(_300, _268, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_342, _268, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_362, _248, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_356, _328, _350);
    float _376 = fma(_364, _328, _348);
    float _378 = fma(_354, _248, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _380 = fma(_370, _248, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _382 = fma(_366, _328, _358);
    float _384 = fma(_372, _266, _374);
    float _386 = fma(_378, _266, _376);
    float _388 = fma(_380, _266, _382);
    float _390 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[146].z, _388);
    bool _396 = !_242;
    float _414;
    if (!_396)
    {
        float _398 = in.m_53.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        _414 = _156;
    }
    _416 = false;
    float _418 = _414;
    float _420 = in.m_55.x;
    float _422 = in.m_55.y;
    float _424 = in.m_55.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _428 = _418 + _426;
    bool _430 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _432 = isnan(_418);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _450 = 1.0 / _448;
    bool _452 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _454 = 1.0 / _444;
    float _456 = _390 * _422;
    float _458 = _394 * _424;
    bool _460 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _462 = isnan(_418);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -_440;
    float _474 = _472 + 1.0;
    bool _476 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _478 = isnan(_418);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _470 * _474;
    float _490 = -_470;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _498;
    float _502 = _428 * _454;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _418 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _508;
    float _512 = _486 * _492;
    float _514 = fma(_496, _502, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _516 = fma(_500, _502, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _518 = fma(_510, _502, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _520 = _506 * _450;
    float _522 = _514 * _512;
    float _524 = _516 * _512;
    float _526 = _518 * _512;
    float _528 = -_486;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _544 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].x, _522);
    float _546 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].y, _524);
    float _548 = fma(_534, _520, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _550 = fma(_538, _520, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _552 = fma(_542, _520, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _554 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].z, _526);
    float _556 = fma(_548, _488, _544);
    float _558 = fma(_550, _488, _546);
    float _560 = _392 * _420;
    float _562 = fma(_552, _488, _554);
    float _564 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[109].x, _556);
    float _566 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[109].y, _558);
    float _568 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[109].z, _562);
    bool _570 = !_452;
    float _588;
    if (!_570)
    {
        float _572 = in.m_53.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        _588 = _156;
    }
    _590 = false;
    float _592 = _588;
    bool _594 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _596 = isnan(_592);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _610 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _612 = isnan(_592);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _592 + _626;
    float _630 = -_604;
    float _632 = _630 + 1.0;
    bool _634 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _636 = 1.0 / _608;
    float _638 = _620 * _632;
    float _640 = -_620;
    float _642 = _640 + 1.0;
    float _644 = _624 * _636;
    float _646 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = fma(_644, _628, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _650 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = _648 * _638;
    float _654 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[115].x, _652);
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[116].x, _656);
    float _666 = _664 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _668 = !_634;
    float _686;
    if (!_668)
    {
        float _670 = in.m_53.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        _686 = _156;
    }
    _688 = false;
    float _690 = _686;
    float _692 = in.m_53.y;
    float _694 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _696 = in.m_53.z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _700 = in.m_53.x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    float _708 = in.m_42.x;
    float _710 = in.m_42.y;
    float _712 = in.m_42.z;
    float _714 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _720 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _722 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _724 = _692 * 2.0;
    float _726 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _720);
    float _728 = fma(_722, -2.0, _698);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _732 = floor(_724);
    float _734 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _736 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _738 = _710 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _740 = _710 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _742 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _736);
    float _744 = _696 * 2.0;
    float _746 = _710 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = -_702;
    float _750 = fma(_734, 2.0, _748);
    float _752 = _700 * 2.0;
    float _754 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[4].x, _738);
    float _756 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _758 = floor(_744);
    float _760 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    float _762 = _700 + _692;
    float _764 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[5].z, _756);
    float _766 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[6].z, _760);
    float _768 = _762 + (-1.0);
    float _770 = _692 + _696;
    float _772 = floor(_752);
    float _774 = _760;
    float _776 = _690;
    if (!_706)
    {
        _774 = _692;
    }
    float _778 = _774;
    float _780 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[4].z, _754);
    float _782 = _770 + (-1.0);
    float _784 = _778;
    float _786 = _782;
    if (_706)
    {
        _784 = _700;
    }
    float _788 = _784;
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _792 = _732 > 0.0;
    float _794 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _726);
    bool _796 = _758 > 0.0;
    float _798 = _700 + _696;
    bool _800 = _758 >= 0.0;
    bool _802 = isnan(_758);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _812 = int(_810);
    float _814 = _798 + (-1.0);
    bool _816 = _732 >= 0.0;
    bool _818 = isnan(_732);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    float _826 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _728);
    bool _828 = _772 > 0.0;
    float _830 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _834 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_706)
    {
        _786 = _696;
    }
    float _836 = _786;
    float _838 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _840 = int(_838);
    float _842 = _836;
    if (_706)
    {
        _842 = _692;
    }
    float _844 = _842;
    float _846 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[83].z, _832);
    float _848 = _788 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _850 = _772 >= 0.0;
    bool _852 = isnan(_772);
    bool _854 = _850 || _852;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    float _860 = _764 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _862 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[83].w, _716);
    float _864 = _844;
    if (!_706)
    {
        _864 = _696;
    }
    float _866 = _864;
    float _868 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _870 = log2(_868);
    float _872 = _866;
    if (_706)
    {
        _872 = _692;
    }
    float _874 = _872;
    float _876 = -_730;
    float _878 = fma(_848, 2.0, _876);
    float _880 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _862);
    float _882 = _874 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _884 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _742);
    int _886 = _858 ? 0 : 1;
    float _888 = fma(_882, -2.0, _718);
    int _890 = _808 ? 0 : 1;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _894 = ~_886;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = rsqrt(_794);
    int _902 = ~_890;
    int _904 = _902 + 1;
    int _906 = _904 + 1;
    float _908 = _870 * _100;
    int _910 = _906;
    int _912 = _898;
    if (!_796)
    {
        int _914 = ~_890;
        int _916 = _914 + 1;
        _910 = _916;
    }
    int _918 = _910;
    float _920 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _892);
    bool _922 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _930 = _926 || _928;
    float _932 = -_100;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _750);
    if (!_828)
    {
        int _936 = ~_886;
        int _938 = _936 + 1;
        _912 = _938;
    }
    int _940 = _912;
    float _942 = exp2(_908);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _946 = _824 ? 0 : 1;
    float _948 = _780 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _952 = _950 != 0;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _960 = _958 != 0;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _964 = 1.0 + _962;
    bool _966 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(1.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].z, _944);
    int _978 = ~_946;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = _860 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _986 = !_956;
    int _988 = _986 ? 0 : 1;
    float _990 = 1.0 / _964;
    bool _992 = !_952;
    int _994 = _992 ? 0 : 1;
    float _996 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _976);
    bool _998 = !_960;
    int _1000 = _998 ? 0 : 1;
    float _1002 = -_942;
    float _1004 = _1002 + 1.0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1016 = _1014 != 0;
    float _1018 = _766 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1020 = _982;
    if (!_792)
    {
        int _1022 = ~_946;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _984);
    float _1030 = float(_812);
    bool _1032 = !_1012;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = in.m_57.x;
    float _1038 = in.m_57.y;
    float _1040 = in.m_57.z;
    bool _1042 = !_1008;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = 1.0 / _1030;
    int _1048 = abs(_1034);
    float _1050 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1028);
    int _1052 = abs(_1044);
    float _1054 = -_100;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[81].x, _878);
    float _1058 = float(_840);
    float _1060 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _920);
    float _1062 = _930 ? _1004 : 0.0;
    float _1064 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    float _1066 = _1058 * _100;
    float _1068 = float(_940);
    float _1070 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _888);
    float _1072 = float(_1052);
    float _1074 = _1046 * _100;
    float _1076 = float(_918);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1078;
    float _1082 = float(_1048);
    if (_974)
    {
        float _1084 = _1062 * _990;
        _110 = _1084;
    }
    float _1086 = _110;
    bool _1088 = !_1016;
    int _1090 = _1088 ? 0 : 1;
    float _1092 = _1072 * _1076;
    float _1094 = float(_1026);
    float _1096 = _1082 * _1068;
    int _1098 = abs(_1090);
    float _1100 = _900 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1102 = _1092 * (-2.0);
    float _1104 = _1096 * (-2.0);
    float _1106 = _900 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1108 = _1100 * _1100;
    float _1110 = fma(_1102, _1036, _1036);
    float _1112 = _700 + (-0.5);
    float _1114 = float(_1098);
    float _1116 = fma(_1104, _1038, _1038);
    float _1118 = fma(_1106, _1106, _1108);
    float _1120 = _692 + (-0.5);
    float _1122 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1110);
    float _1124 = _1114 * _1094;
    float _1126 = fma(_790, _1102, _790);
    float _1128 = fma(_834, _1104, _834);
    float _1130 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1116);
    float _1132 = _1124 * (-2.0);
    float _1134 = fma(_1126, _1086, _1122);
    float _1136 = _884 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1138 = fma(_1128, _1086, _1130);
    float _1140 = in.m_59.x;
    float _1142 = in.m_59.y;
    float _1144 = in.m_59.z;
    float _1146 = fma(_830, _1132, _830);
    float _1148 = fma(_1132, _1040, _1040);
    float _1150 = _696 + (-0.5);
    float _1152 = _1138 * 0.15915493667125701904296875;
    float _1154 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1156 = 1.0 / _1080;
    float _1158 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1148);
    float _1160 = _900 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1162 = -_1154;
    float _1164 = _1136 + _1162;
    float _1166 = fma(_1146, _1086, _1158);
    bool _1168 = _1154 >= _1136;
    bool _1170 = isnan(_1154);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(_1136);
    bool _1176 = _1172 || _1174;
    float _1178 = fma(_1160, _1160, _1118);
    float _1180 = abs(_1164);
    float _1182 = precise::max(_1180, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1184 = _1166 * 0.15915493667125701904296875;
    float _1186 = _1134 * 0.15915493667125701904296875;
    float _1188 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1190 = precise::min(_1182, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1192 = rsqrt(_1178);
    bool _1194 = !_1176;
    float _1196 = _1194 ? 1.0 : (-1.0);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1200 = _1190 + _1198;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1142);
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1140);
    float _1206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1144);
    float _1208 = _1184 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1200 * _1156;
    float _1214 = _1188 * _1202;
    float _1216 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1218 = _714 * _1204;
    float _1220 = _1196 * _1212;
    float _1222 = _1216 * _1206;
    float _1224 = _1186 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = _694 * _1220;
    float _1230 = _1106 * _1192;
    float _1232 = _1100 * _1192;
    float _1234 = _1160 * _1192;
    float _1236 = _1228 * 0.15915493667125701904296875;
    float _1238 = _1186 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _1210 * _1214;
    float _1244 = _1152 * 6.283185482025146484375;
    float _1246 = sin(_1244);
    float _1248 = _1152 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1184 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1226 * _1246;
    float _1258 = _1240 * _1246;
    float _1260 = _1246 * _1210;
    float _1262 = _1240 * _1250;
    float _1264 = _1226 * _1250;
    float _1266 = _1250 * _1210;
    float _1268 = _1240 * _1242;
    float _1270 = _1236 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1226 * _1242;
    float _1276 = fma(_1254, _1262, _1256);
    float _1278 = -_1258;
    float _1280 = fma(_1254, _1264, _1278);
    float _1282 = -_1264;
    float _1284 = fma(_1254, _1258, _1282);
    float _1286 = -_1214;
    float _1288 = _1254 * _1286;
    float _1290 = fma(_1276, _1218, _1268);
    float _1292 = fma(_1254, _1256, _1262);
    float _1294 = _1236 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    float _1298 = fma(_1266, _1218, _1288);
    float _1300 = fma(_1284, _1222, _1290);
    float _1302 = fma(_1280, _1218, _1274);
    float _1304 = _1234 * _1234;
    float _1306 = fma(_1260, _1222, _1298);
    float _1308 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1312 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1314 = fma(_1292, _1222, _1302);
    float _1316 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1308);
    float _1318 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1310);
    float _1320 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1312);
    float _1322 = -_1272;
    float _1324 = _1322 + 1.0;
    float _1326 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1316);
    float _1328 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1318);
    float _1330 = _1230 * _1296;
    float _1332 = _1232 * _1324;
    float _1334 = _1232 * _1296;
    float _1336 = fma(_1324, _1304, _1272);
    float _1338 = _1234 * _1296;
    float _1340 = _1230 * _1324;
    float _1342 = fma(_1234, _1332, _1330);
    float _1344 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1346 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1348 = -_1338;
    float _1350 = fma(_1232, _1340, _1348);
    float _1352 = -_1334;
    float _1354 = fma(_1234, _1340, _1352);
    float _1356 = _1344 * _1342;
    float _1358 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1320);
    float _1360 = fma(_1230, _1340, _1272);
    float _1362 = _1344 * _1350;
    float _1364 = fma(_1346, _1354, _1356);
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1368 = fma(_1232, _1332, _1272);
    float _1370 = fma(_1346, _1360, _1362);
    float _1372 = fma(_1234, _1340, _1334);
    float _1374 = fma(_1366, _1336, _1364);
    float _1376 = fma(_1232, _1340, _1338);
    float _1378 = _1344 * _1368;
    float _1380 = fma(_1366, _1372, _1370);
    float _1382 = _1018 + _1374;
    float _1384 = -_1330;
    float _1386 = fma(_1234, _1332, _1384);
    float _1388 = fma(_1346, _1376, _1378);
    float _1390 = _948 + _1380;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1394 = _1382 + _1392;
    float _1396 = fma(_1366, _1386, _1388);
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1400 = _1390 + _1398;
    float _1402 = _1394 * _1394;
    float _1404 = _860 + _1396;
    float _1406 = fma(_1400, _1400, _1402);
    float _1408 = sqrt(_1406);
    bool _1410 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1386;
    float _1414 = _1340;
    float _1416 = _1376;
    if (!_1410)
    {
        _1412 = _1390;
    }
    float _1418 = _1412;
    float _1420 = _1418;
    if (!_1410)
    {
        _1414 = _1382;
    }
    float _1422 = _1414;
    float _1424 = _1422;
    if (!_1410)
    {
        _1416 = _1404;
    }
    float _1426 = _1416;
    bool _1428 = !_1410;
    float _1430 = _1426;
    if (!_1428)
    {
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1436 = _1408 + _1434;
        float _1438 = _1404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1440 = rsqrt(_1406);
        float _1442 = _1436 * _1432;
        float _1444 = _1442 * 0.15915493667125701904296875;
        float _1446 = _1444 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        float _1450 = _1444 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        float _1454 = _1448 + (-1.0);
        float _1456 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1458 = fma(_1452, _1438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1460 = fma(_1404, _1448, _1456);
        float _1462 = _1440 * _1458;
        float _1464 = fma(_1400, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1466 = fma(_1394, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1430 = _1460;
        _1420 = _1464;
        _1424 = _1466;
    }
    float _1468 = _1430;
    float _1470 = _1420;
    float _1472 = _1424;
    float _1474 = -_860;
    float _1476 = _1474 + _1468;
    float _1478 = -_948;
    float _1480 = _1478 + _1470;
    float _1482 = -_1018;
    float _1484 = _1482 + _1472;
    float _1486 = _860 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1488 = _1476 * _1476;
    float _1490 = _860 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1492 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1486);
    float _1494 = fma(_1480, _1480, _1488);
    float _1496 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1490);
    float _1498 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1492);
    float _1500 = fma(_1484, _1484, _1494);
    float _1502 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1496);
    float _1504 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1506 = sqrt(_1500);
    bool _1508 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan(0.5);
    bool _1516 = _1512 || _1514;
    float _1518 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1520 = _1518 + _1504;
    float _1522 = 1.0 / _1504;
    bool _1524 = _1506 > 0.0;
    float _1526 = _1506;
    float _1528 = _1468;
    float _1530 = _1470;
    float _1532 = _1472;
    float _1534 = _1480;
    float _1536 = _1518;
    if (_1516)
    {
        _1526 = 1.0;
    }
    float _1538 = _1526;
    float _1540 = _1520 * _1522;
    float _1542 = _1540 * 0.5;
    bool _1544 = !_1524;
    float _1546 = _1538;
    if (!_1544)
    {
        float _1548 = _172 * _172;
        float _1550 = rsqrt(_1500);
        float _1552 = fma(_170, _170, _1548);
        float _1554 = fma(_174, _174, _1552);
        float _1556 = sqrt(_1554);
        float _1558 = _1476 * _1550;
        float _1560 = _1484 * _1550;
        bool _1562 = _1556 > 0.0;
        float _1564 = _1480 * _1550;
        bool _1566 = !_1562;
        if (!_1566)
        {
            float _1568 = rsqrt(_1554);
            float _1570 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1572 = _172 * _1568;
            float _1574 = _170 * _1568;
            float _1576 = _1558 * _1572;
            float _1578 = _174 * _1568;
            float _1580 = fma(_1564, _1574, _1576);
            float _1582 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1584 = fma(_1560, _1578, _1580);
            float _1586 = _1584 * _1582;
            float _1588 = fma(_170, _1586, _1470);
            float _1590 = fma(_172, _1586, _1468);
            float _1592 = fma(_174, _1586, _1472);
            _1528 = _1590;
            _1530 = _1588;
            _1532 = _1592;
            _1534 = _1582;
        }
    }
    float _1594 = _1528;
    float _1596 = _1530;
    float _1598 = _1532;
    float _1600 = _1534;
    float _1602 = _1600;
    if (!_1516)
    {
        float _1604 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1608 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1606);
        float _1610 = _1604 * 0.15915493667125701904296875;
        float _1612 = _1610 * 6.283185482025146484375;
        float _1614 = cos(_1612);
        float _1616 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1618 = _1616 * 0.15915493667125701904296875;
        float _1620 = _1610 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = 1.0 / _1614;
        float _1626 = _1618 * 6.283185482025146484375;
        float _1628 = cos(_1626);
        float _1630 = _1622 * _1624;
        float _1632 = 1.0 / _1608;
        float _1634 = _1628 * _1630;
        float _1636 = _1618 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1642 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1646 = _1632 * _1644;
        float _1648 = 1.0 / _1634;
        float _1650 = 1.0 / _1642;
        float _1652 = _1638 * _1648;
        float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1656 = fma(_1652, _1646, _1654);
        float _1658 = _1656 * _1650;
        float _1660 = precise::clamp(_1658, 0.0, 1.0);
        _178 = _1618;
        _1602 = _1610;
        _180 = _1632;
        _1546 = _1660;
    }
    float _1662 = _178;
    float _1664 = _1602;
    float _1666 = _180;
    float _1668 = _1546;
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1672 = _1594 + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1676 = _1596 + _1674;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1680 = _1598 + _1678;
    float _1682 = _1672 * _1672;
    float _1684 = fma(_1676, _1676, _1682);
    float _1686 = fma(_1680, _1680, _1684);
    float _1688 = rsqrt(_1686);
    float _1690 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1692 = _1676 * _1690;
    float _1694 = _1680 * _1690;
    float _1696 = _1692 * _1692;
    float _1698 = _1694 * _1694;
    float _1700 = _1696 + _1698;
    float _1702 = sqrt(_1700);
    bool _1704 = _1702 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1708 = _1702 + _1706;
    float _1710 = _1662;
    float _1712 = _1708;
    float _1714 = _1664;
    float _1716 = _1672;
    float _1718 = _1692;
    if (_1704)
    {
        float _1720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1710 = _1720;
    }
    float _1722 = _1710;
    float _1724 = _1722;
    if (_1704)
    {
        float _1726 = _1708 * _1722;
        _1712 = _1726;
    }
    float _1728 = _1712;
    if (_1704)
    {
        float _1730 = rsqrt(_1700);
        _1724 = _1730;
    }
    float _1732 = _1724;
    float _1734 = _1732;
    if (_1704)
    {
        float _1736 = _1728 * 0.15915493667125701904296875;
        _1714 = _1736;
    }
    float _1738 = _1714;
    float _1740 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1742 = _1680;
    if (_1704)
    {
        float _1744 = _1738 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        _1742 = _1746;
    }
    float _1748 = _1742;
    float _1750 = precise::max(0.0, _1740);
    float _1752 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1754 = _1666;
    float _1756 = _1750;
    if (_1704)
    {
        float _1758 = _1738 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        _1754 = _1760;
    }
    float _1762 = _1754;
    float _1764 = -_1690;
    float _1766 = -_1750;
    float _1768 = fma(_1672, _1764, _1766);
    if (_1704)
    {
        float _1770 = _1768 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1716 = _1770;
    }
    float _1772 = _1716;
    float _1774 = sqrt(_1686);
    float _1776 = _1748;
    float _1778 = _1772;
    if (_1704)
    {
        float _1780 = fma(_1748, _1772, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1776 = _1780;
    }
    float _1782 = _1776;
    float _1784 = _1782;
    if (!_1704)
    {
        _1778 = _1768;
    }
    float _1786 = _1778;
    float _1788 = _1786;
    if (_1704)
    {
        float _1790 = _1732 * _1782;
        _1536 = _1790;
    }
    float _1792 = _1536;
    if (!_1704)
    {
        _1784 = _1696;
    }
    float _1794 = _1784;
    float _1796 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1798 = _1794;
    float _1800 = _1762;
    if (_1704)
    {
        float _1802 = _1762 + (-1.0);
        _1756 = _1802;
    }
    float _1804 = _1756;
    float _1806 = _1804;
    if (_1704)
    {
        float _1808 = _1692 * _1792;
        _1718 = _1808;
    }
    float _1810 = _1718;
    float _1812 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1796);
    if (_1704)
    {
        float _1814 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1814;
    }
    float _1816 = _1734;
    if (!_1704)
    {
        _1806 = _1694;
    }
    float _1818 = _1806;
    float _1820 = _1818;
    if (_1704)
    {
        float _1822 = _1694 * _1792;
        _1820 = _1822;
    }
    float _1824 = _1820;
    if (_1704)
    {
        float _1826 = _1810 * _1810;
        _1798 = _1826;
    }
    float _1828 = _1798;
    if (_1704)
    {
        float _1830 = fma(_1768, _1762, _1816);
        _1788 = _1830;
    }
    float _1832 = _1788;
    if (!_1704)
    {
        _1800 = _1698;
    }
    float _1834 = _1800;
    float _1836 = _1834;
    if (_1704)
    {
        float _1838 = _1824 * _1824;
        _1836 = _1838;
    }
    float _1840 = _1836;
    float _1842 = fma(_1832, _1832, _1828);
    float _1844 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1812);
    float _1846 = _1842 + _1840;
    float _1848 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1852 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1850);
    float _1854 = precise::clamp(_1852, 0.0, 1.0);
    float _1856 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1858 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1848);
    float _1860 = rsqrt(_1846);
    float _1862 = -_1854;
    float _1864 = _1862 + 1.0;
    float _1866 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1856);
    float _1868 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1858);
    float _1870 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1872 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1866);
    float _1874 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1876 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1870);
    float _1878 = abs(_1864);
    float _1880 = log2(_1878);
    float _1882 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1884 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1886 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1876);
    float _1888 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1890 = -_1884;
    float _1892 = fma(_1890, _1752, 1.0);
    float _1894 = _1860 * _1810;
    float _1896 = _1860 * _1832;
    float _1898 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1900 = _1860 * _1824;
    float _1902 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1904 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1906 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1888);
    float _1908 = log2(_1892);
    float _1910 = -_1902;
    float _1912 = fma(_1896, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1910);
    float _1914 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1916 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1906);
    float _1918 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1920 = -_1900;
    float _1922 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1912);
    float _1924 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1926 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1916);
    float _1928 = exp2(_1914);
    float _1930 = fma(_1922, -0.5, 0.5);
    float _1932 = fma(_1922, 0.5, 0.5);
    float _1934 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1924);
    float _1936 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1918);
    float _1938 = _1896 + 1.0;
    float _1940 = fma(_1932, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1942 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1934);
    float _1944 = 1.0 / _1926;
    float _1946 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1936);
    float _1948 = fma(_1932, _1940, -0.212114393711090087890625);
    float _1950 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1942);
    float _1952 = _1908 * 0.693147182464599609375;
    float _1954 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1946);
    float _1956 = fma(_1932, _1948, 1.570728778839111328125);
    float _1958 = sqrt(_1930);
    float _1960 = -_1896;
    float _1962 = fma(_1928, _1938, _1960);
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1966 = fma(_1962, 0.5, 0.5);
    float _1968 = _1950 * _1944;
    float _1970 = _1954 * _1944;
    float _1972 = fma(_1968, 0.5, 0.5);
    float _1974 = fma(_1970, -0.5, 0.5);
    float _1976 = _1958 * 0.636619746685028076171875;
    float _1978 = -_1956;
    float _1980 = fma(_1976, _1978, 1.0);
    float3 _5779 = float3(_1972, _1974, _1964);
    float _1982 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5779, float3(0.0), isnan(_5779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5779, float3(0.0), isnan(_5779)), level(0.0)).x;
    float3 _5790 = float3(_1972, _1974, _1964);
    float4 _1985 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5790, float3(0.0), isnan(_5790)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5790, float3(0.0), isnan(_5790)), level(0.0)).xyzw;
    float _1987 = _1985.x;
    float _1989 = _1985.y;
    float _1991 = _1985.z;
    float _1993 = _1985.w;
    float2 _5807 = float2(_1980, _1966);
    float3 _1997 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5807, float2(0.0), isnan(_5807)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5807, float2(0.0), isnan(_5807)), level(0.0)).xyz;
    float _1999 = _1997.x;
    float _2001 = _1997.y;
    float _2003 = _1997.z;
    float _2005 = float(uint(_840));
    float _2007 = trunc(_1074);
    int _2009 = int(_2007);
    int _2011 = ~_840;
    int _2013 = _2011 + 1;
    float _2015 = _1066 * _152;
    int _2017 = abs(_988);
    out.m_61.x = _658;
    out.m_61.y = _660;
    out.m_61.z = _662;
    out.m_61.w = _666;
    float _2019 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2021 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2023 = 1.0 / _2005;
    float _2025 = in.m_63.x;
    float _2027 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2021);
    bool _2029 = !_706;
    float _2031 = _2029 ? 7.345489978790283203125 : 1.0;
    out.m_65.x = _1596;
    out.m_65.y = _1594;
    out.m_65.z = _1598;
    float _2033 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2027);
    float _2035 = float(uint(_2009));
    float _2037 = trunc(_2015);
    int _2039 = int(_2037);
    float _2041 = _2031 * _700;
    float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2045 = _690 + _2043;
    float _2047 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2033);
    int _2049 = as_type<int>(_2023) + (-2);
    float _2051 = floor(_2041);
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2053;
    out.gl_Position.x = _1950;
    out.gl_Position.y = _1954;
    out.gl_Position.z = _2047;
    out.gl_Position.w = _1926;
    float _2057 = as_type<float>(_2049) * _2035;
    float _2059 = trunc(_2057);
    float _2061 = precise::max(_2059, 0.0);
    uint _2064 = uint(_2061);
    float _2066 = exp2(_2019);
    int _2068 = ~_840;
    int _2070 = _2068 + 1;
    int _2072 = _2013 * int(_2064);
    int _2074 = _2072 + _2009;
    float _2076 = float(uint(_2074));
    float _2078 = -_2066;
    float _2080 = _2078 + 1.0;
    float _2082 = as_type<float>(_2049) * _2076;
    float _2084 = trunc(_2082);
    float _2086 = precise::max(_2084, 0.0);
    uint _2088 = uint(_2086);
    int _2090 = int(_2064) + int(_2088);
    float _2092 = float(_2009);
    int _2094 = _2070 * _2090;
    int _2096 = _2094 + _2009;
    bool _2098 = _2092 >= _1058;
    bool _2100 = isnan(_2092);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan(_1058);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_2106);
    bool _2110 = uint(_2096) >= uint(_840);
    float _2112 = -_2051;
    float _2114 = _2041 + _2112;
    float _2116 = trunc(_2108);
    int _2118 = int(_2116);
    bool _2120 = !_2110;
    int _2122 = _2120 ? 0 : (-1);
    float _2124 = _2114 * _1058;
    bool _2126 = _840 == 0;
    int _2128 = ~_2090;
    int _2130 = _2128 + _2122;
    int _2132 = _2130 + 1;
    int _2134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2136 = _2134 != 0;
    float _2138 = trunc(_2124);
    int _2140 = int(_2138);
    int _2142 = _840 + (-1);
    int _2144 = _840 * _2132;
    int _2146 = _2144 + _2009;
    bool _2148 = !_2136;
    int _2150 = _2148 ? 0 : 1;
    int _2152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2154 = _2152 != 0;
    int _2156 = ~_2118;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    bool _2162 = !_2126;
    int _2164 = _2162 ? _2146 : (-1);
    int _2166 = abs(_2150);
    int _2168 = abs(_994);
    int _2170 = _2164 * _2160;
    bool _2172 = !_2154;
    int _2174 = _2172 ? 0 : 1;
    int _2176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2178 = _2176 != 0;
    int _2180 = _2118 * _2142;
    int _2182 = _2180 + _2170;
    int _2184 = abs(_1000);
    int _2186 = _2182 * _2017;
    int _2188 = _2140 * _2166;
    int _2190 = _2188 + _2009;
    int _2192 = abs(_2174);
    int _2194 = _2039 * _2168;
    int _2196 = _2194 + _2186;
    int _2198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2200 = _2198 != 0;
    int _2202 = _2190 * _2184;
    int _2204 = _2202 + _2196;
    int _2206 = ~_840;
    int _2208 = _2206 + 1;
    int _2210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2212 = _2210 != 0;
    int _2214 = _2140 * _2192;
    int _2216 = _2214 + _2204;
    int _2218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2220 = _2218 != 0;
    float _2222 = in.m_53.w;
    float _2224 = float(uint(_2216));
    float _2226 = as_type<float>(_2168);
    bool _2228 = _2220;
    if (!_2200)
    {
        _2226 = _2025;
    }
    float _2230 = _2226;
    float _2232 = as_type<float>(_2049) * _2224;
    float _2234 = trunc(_2232);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    int _2240 = ~_840;
    int _2242 = _2240 + 1;
    bool _2244 = _2222 > 0.5;
    int _2246 = _2208 * int(_2238);
    int _2248 = _2246 + _2216;
    float _2250 = float(uint(_2248));
    float _2252 = in.m_63.y;
    float _2254 = as_type<float>(_2049) * _2250;
    float _2256 = trunc(_2254);
    float _2258 = precise::max(_2256, 0.0);
    uint _2260 = uint(_2258);
    int _2262 = int(_2238) + int(_2260);
    float _2264 = -_2252;
    float _2266 = _2264 + 1.0;
    int _2268 = _2242 * _2262;
    int _2270 = _2268 + _2216;
    bool _2272 = uint(_2270) >= uint(_840);
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2276 = _2274 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2278 = !_2272;
    int _2280 = _2278 ? 0 : (-1);
    float _2282 = 1.0 / _2276;
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2286 = _2284 != 0;
    int _2288 = ~_2262;
    int _2290 = _2288 + _2280;
    int _2292 = _2290 + 1;
    int _2294 = _2244 ? as_type<int>(_2266) : as_type<int>(_2252);
    bool _2296 = _692 > 0.5;
    int _2298 = _840 * _2292;
    int _2300 = _2298 + _2216;
    float _2302 = float(uint(_2190));
    float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2306 = _2220 ? as_type<float>(_2294) : _2252;
    bool _2308 = !_2126;
    int _2310 = _2308 ? _2300 : (-1);
    float _2312 = as_type<float>(_2049) * _2302;
    float _2314 = _2252;
    bool _2316 = _2286;
    float _2318 = _2230;
    int _2320 = _2292;
    if (_2286)
    {
        float _2322 = _2296 ? _2266 : _2252;
        _2314 = _2322;
    }
    float _2324 = _2314;
    float _2326 = _2055 * _2282;
    if (_2178)
    {
        bool _2328 = _696 > 0.5;
        _2316 = _2328;
    }
    bool _2330 = _2316;
    int _2332 = _2310 >> 31;
    float _2334 = trunc(_2312);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    if (_2200)
    {
        bool _2340 = _700 > 0.5;
        _2228 = _2340;
    }
    bool _2342 = _2228;
    float _2344 = fma(_2326, _2045, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2346 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2348 = isnan(_690);
    bool _2350 = _2346 || _2348;
    bool _2352 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2354 = _2350 || _2352;
    float _2356 = float(_2354);
    int _2358 = _2332 & 3;
    float _2360 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2362 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2364 = isnan(_690);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2370 = _2366 || _2368;
    float _2372 = float(_2370);
    float _2374 = -_2356;
    float _2376 = _2374 + 1.0;
    int _2378 = _2310 + _2358;
    float _2380 = fma(_2306, _2360, -0.5);
    int _2382 = ~_840;
    int _2384 = _2382 + 1;
    float _2386 = _2372 * _2376;
    int _2388 = _2378 >> 2;
    float _2390 = -_1070;
    float _2392 = fma(_880, _2380, _2390);
    int _2394 = as_type<int>(_2344);
    float _2396 = as_type<float>(_2388);
    if (!_2200)
    {
        _776 = _2230;
    }
    float _2398 = _776;
    int _2400 = _2384 * int(_2338);
    int _2402 = _2400 + _2190;
    int _2404 = _2388 << 4;
    int _2406 = _2404 + 368;
    float _2408 = _2344 * _2386;
    float _2410 = _2398;
    if (_2200)
    {
        _2318 = _2025;
    }
    float _2412 = _2318;
    uint _2414 = uint(int(uint(_2406) >> uint(2)));
    uint _2416 = uint(int(uint(int(_2414)) >> uint(2)));
    int _2418 = int(_2414) & 3;
    float _2420 = (*spvDescriptorSet0.vp_c9)._m0[int(_2416)][_2418];
    int _2422 = int(_2414) + 1;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    int _2426 = _2422 & 3;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[int(_2424)][_2426];
    float _2430 = float(uint(_2402));
    if (_2200)
    {
        float _2432 = -_2412;
        float _2434 = _2432 + 1.0;
        _2394 = as_type<int>(_2434);
    }
    int _2436 = _2394;
    if (_2178)
    {
        float _2438 = -_2412;
        float _2440 = _2438 + 1.0;
        _2320 = as_type<int>(_2440);
    }
    int _2442 = _2320;
    float _2444 = as_type<float>(_2049) * _2430;
    float _2446 = -_2372;
    float _2448 = _2446 + 1.0;
    if (_2200)
    {
        float _2450 = _2342 ? as_type<float>(_2436) : _2412;
        _2410 = _2450;
    }
    float _2452 = _2410;
    float _2454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2456 = _2406 + 8;
    uint _2458 = uint(int(uint(_2456) >> uint(2)));
    uint _2460 = uint(int(uint(int(_2458)) >> uint(2)));
    int _2462 = int(_2458) & 3;
    float _2464 = (*spvDescriptorSet0.vp_c9)._m0[int(_2460)][_2462];
    int _2466 = int(_2458) + 1;
    uint _2468 = uint(int(uint(_2466) >> uint(2)));
    int _2470 = _2466 & 3;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[int(_2468)][_2470];
    float _2474 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2324, -0.5);
    int _2476 = _2310 & 3;
    bool _2478 = _2476 != 0;
    float _2480 = fma(_2448, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2408);
    if (!_2178)
    {
        _2396 = _2412;
    }
    float _2482 = _2396;
    float _2484 = -_826;
    float _2486 = fma(_1060, _2474, _2484);
    float _2488 = _2482;
    if (_2178)
    {
        float _2490 = _2330 ? as_type<float>(_2442) : _2412;
        _2488 = _2490;
    }
    float _2492 = _2488;
    float _2494 = trunc(_2444);
    float _2496 = precise::max(_2494, 0.0);
    uint _2498 = uint(_2496);
    bool _2500 = uint(_2476) > 1u;
    float _2502 = fma(_2356, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2480);
    int _2504 = _2310 & 3;
    bool _2506 = _2504 != 0;
    float _2508 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2510 = _2506 ? 0 : 1;
    float _2512 = _2454 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2514 = _2476 != 3;
    float _2516 = fma(_2452, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2518 = ~_2510;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    float _2524 = fma(_2512, _2492, -0.5);
    bool _2526 = uint(_2476) >= 2u;
    float _2528 = fma(_996, _2516, _934);
    int _2530 = _2522;
    if (!_2500)
    {
        int _2532 = ~_2510;
        int _2534 = _2532 + 1;
        _2530 = _2534;
    }
    int _2536 = _2530;
    float _2538 = fma(_1064, _2524, _1056);
    int _2540 = _2526 ? 0 : 1;
    out.m_67.w = _2508;
    int _2542 = abs(_2536);
    bool _2544 = !_2478;
    int _2546 = _2544 ? 0 : 1;
    int _2548 = int(_2338) + int(_2498);
    int _2550 = ~_840;
    int _2552 = _2550 + 1;
    int _2554 = ~_2540;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    bool _2560 = _2476 != 3;
    int _2562 = _2552 * _2548;
    int _2564 = _2562 + _2190;
    int _2566 = _2558;
    if (_2514)
    {
        int _2568 = ~_2540;
        int _2570 = _2568 + 1;
        _2566 = _2570;
    }
    int _2572 = _2566;
    int _2574 = abs(_2546);
    int _2576 = ~_2542;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    bool _2582 = !_2560;
    int _2584 = _2582 ? 0 : (-1);
    int _2586 = _2580 * as_type<int>(_2428);
    bool _2588 = uint(_2564) >= uint(_840);
    int _2590 = abs(_2584);
    int _2592 = abs(_2572);
    int _2594 = ~_2574;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    bool _2600 = !_2588;
    int _2602 = _2600 ? 0 : (-1);
    int _2604 = _2598 * as_type<int>(_2420);
    int _2606 = _2604 + _2586;
    int _2608 = ~_2592;
    int _2610 = _2608 + 1;
    int _2612 = _2610 + 1;
    bool _2614 = !_2212;
    int _2616 = _2614 ? 0 : 1;
    int _2618 = ~_2548;
    int _2620 = _2618 + _2602;
    int _2622 = _2620 + 1;
    int _2624 = _2612 * as_type<int>(_2464);
    int _2626 = _2624 + _2606;
    int _2628 = ~_2590;
    int _2630 = _2628 + 1;
    int _2632 = _2630 + 1;
    float _2634 = _1668 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2636 = abs(_2616);
    int _2638 = _840 * _2622;
    int _2640 = _2638 + _2190;
    float _2642 = _2486 + 0.5;
    int _2644 = _2632 * as_type<int>(_2472);
    int _2646 = _2644 + _2626;
    int _2648 = ~_2636;
    int _2650 = _2648 + 1;
    int _2652 = _2650 + 1;
    float _2654 = _2392 + 0.5;
    float _2656 = _2528 + 0.5;
    float _2658 = _2538 + 0.5;
    bool _2660 = !_2126;
    int _2662 = _2660 ? _2640 : (-1);
    int _2664 = _2646 * _2652;
    bool _2666 = _1668 > 0.0;
    bool _2668 = isnan(_1668);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan(0.0);
    bool _2674 = _2670 || _2672;
    out.m_69.x = _2656;
    out.m_69.y = _2642;
    out.m_69.z = _2658;
    out.m_69.w = _2654;
    int _2676 = _2662 * _2636;
    int _2678 = _2676 + _2664;
    float _2680 = _2047 + _1926;
    float _2682 = float(_2678);
    float _2684 = _2680 * 0.5;
    out.m_71.x = _2682;
    float _2686 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2688 = _2634 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.z = _2684;
    out.m_73.w = _1926;
    float _2690 = _2686 * _1982;
    float _2692 = -_2686;
    float _2694 = _2692 + 1.0;
    out.m_49.x = _2688;
    float _2696 = _1993 * _2690;
    float _2698 = _2003 * _2690;
    float _2700 = _1993 * _2694;
    float _2702 = fma(_1999, _2696, _1987);
    float _2704 = fma(_2001, _2696, _1989);
    float _2706 = fma(_1993, _2698, _1991);
    out.m_75.x = _2702;
    out.m_75.y = _2704;
    out.m_75.z = _2706;
    out.m_75.w = _2700;
    if (_2674)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2708 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2708;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _688 = false;
    bool _590 = false;
    bool _416 = false;
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
        float _2777 = as_type<float>(_118);
        out.gl_Position.z = _2777;
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
        float _2832 = as_type<float>(_144);
        out.gl_Position.z = _2832;
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
    float _180 = _172;
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
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _202 + _208;
    bool _212 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _214 = isnan(_202);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = _202 + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = 1.0 / _226;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = 1.0 / _238;
    float _246 = 1.0 / _234;
    float _248 = _206 * _240;
    bool _250 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _252 = isnan(_202);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_222;
    float _264 = _262 + 1.0;
    float _266 = _260 * _264;
    float _268 = _210 * _244;
    bool _270 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_202);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    bool _286 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _288 = isnan(_202);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _302 = -_260;
    float _304 = _302 + 1.0;
    float _306 = -_280;
    float _308 = _306 + 1.0;
    float _310 = _230 * _246;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = _296 * _308;
    float _322 = fma(_284, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = fma(_314, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = fma(_318, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _328 = _280 * _304;
    float _330 = _322 * _320;
    float _332 = _324 * _320;
    float _334 = _326 * _320;
    float _336 = -_296;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_346, _268, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = fma(_300, _268, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_342, _268, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_362, _248, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_356, _328, _350);
    float _376 = fma(_364, _328, _348);
    float _378 = fma(_354, _248, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _380 = fma(_370, _248, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _382 = fma(_366, _328, _358);
    float _384 = fma(_372, _266, _374);
    float _386 = fma(_378, _266, _376);
    float _388 = fma(_380, _266, _382);
    float _390 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[146].z, _388);
    bool _396 = !_242;
    float _414;
    if (!_396)
    {
        float _398 = in.m_53.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        _414 = _156;
    }
    _416 = false;
    float _418 = _414;
    float _420 = in.m_55.x;
    float _422 = in.m_55.y;
    float _424 = in.m_55.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _428 = _418 + _426;
    bool _430 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _432 = isnan(_418);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _450 = 1.0 / _448;
    bool _452 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _454 = 1.0 / _444;
    float _456 = _390 * _422;
    float _458 = _394 * _424;
    bool _460 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _462 = isnan(_418);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -_440;
    float _474 = _472 + 1.0;
    bool _476 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _478 = isnan(_418);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _470 * _474;
    float _490 = -_470;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _498;
    float _502 = _428 * _454;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _418 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _508;
    float _512 = _486 * _492;
    float _514 = fma(_496, _502, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _516 = fma(_500, _502, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _518 = fma(_510, _502, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _520 = _506 * _450;
    float _522 = _514 * _512;
    float _524 = _516 * _512;
    float _526 = _518 * _512;
    float _528 = -_486;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _544 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].x, _522);
    float _546 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].y, _524);
    float _548 = fma(_534, _520, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _550 = fma(_538, _520, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _552 = fma(_542, _520, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _554 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].z, _526);
    float _556 = fma(_548, _488, _544);
    float _558 = fma(_550, _488, _546);
    float _560 = _392 * _420;
    float _562 = fma(_552, _488, _554);
    float _564 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[109].x, _556);
    float _566 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[109].y, _558);
    float _568 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[109].z, _562);
    bool _570 = !_452;
    float _588;
    if (!_570)
    {
        float _572 = in.m_53.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        _588 = _156;
    }
    _590 = false;
    float _592 = _588;
    bool _594 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _596 = isnan(_592);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _610 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _612 = isnan(_592);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _592 + _626;
    float _630 = -_604;
    float _632 = _630 + 1.0;
    bool _634 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _636 = 1.0 / _608;
    float _638 = _620 * _632;
    float _640 = -_620;
    float _642 = _640 + 1.0;
    float _644 = _624 * _636;
    float _646 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = fma(_644, _628, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _650 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = _648 * _638;
    float _654 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[115].x, _652);
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[116].x, _656);
    float _666 = _664 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _668 = !_634;
    float _686;
    if (!_668)
    {
        float _670 = in.m_53.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        _686 = _156;
    }
    _688 = false;
    float _690 = _686;
    float _692 = in.m_53.y;
    float _694 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _696 = in.m_53.z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _700 = in.m_53.x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    float _708 = in.m_42.x;
    float _710 = in.m_42.y;
    float _712 = in.m_42.z;
    float _714 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _720 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _722 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _724 = _692 * 2.0;
    float _726 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _720);
    float _728 = fma(_722, -2.0, _698);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _732 = floor(_724);
    float _734 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _736 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _738 = _710 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _740 = _710 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _742 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _736);
    float _744 = _696 * 2.0;
    float _746 = _710 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = -_702;
    float _750 = fma(_734, 2.0, _748);
    float _752 = _700 * 2.0;
    float _754 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[4].x, _738);
    float _756 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _758 = floor(_744);
    float _760 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    float _762 = _700 + _692;
    float _764 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[5].z, _756);
    float _766 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[6].z, _760);
    float _768 = _762 + (-1.0);
    float _770 = _692 + _696;
    float _772 = floor(_752);
    float _774 = _760;
    float _776 = _690;
    if (!_706)
    {
        _774 = _692;
    }
    float _778 = _774;
    float _780 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[4].z, _754);
    float _782 = _770 + (-1.0);
    float _784 = _778;
    float _786 = _782;
    if (_706)
    {
        _784 = _700;
    }
    float _788 = _784;
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _792 = _732 > 0.0;
    float _794 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _726);
    bool _796 = _758 > 0.0;
    float _798 = _700 + _696;
    bool _800 = _758 >= 0.0;
    bool _802 = isnan(_758);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _812 = int(_810);
    float _814 = _798 + (-1.0);
    bool _816 = _732 >= 0.0;
    bool _818 = isnan(_732);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    float _826 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _728);
    bool _828 = _772 > 0.0;
    float _830 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _834 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_706)
    {
        _786 = _696;
    }
    float _836 = _786;
    float _838 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _840 = int(_838);
    float _842 = _836;
    if (_706)
    {
        _842 = _692;
    }
    float _844 = _842;
    float _846 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[83].z, _832);
    float _848 = _788 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _850 = _772 >= 0.0;
    bool _852 = isnan(_772);
    bool _854 = _850 || _852;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    float _860 = _764 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _862 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[83].w, _716);
    float _864 = _844;
    if (!_706)
    {
        _864 = _696;
    }
    float _866 = _864;
    float _868 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _870 = log2(_868);
    float _872 = _866;
    if (_706)
    {
        _872 = _692;
    }
    float _874 = _872;
    float _876 = -_730;
    float _878 = fma(_848, 2.0, _876);
    float _880 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _862);
    float _882 = _874 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _884 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _742);
    int _886 = _858 ? 0 : 1;
    float _888 = fma(_882, -2.0, _718);
    int _890 = _808 ? 0 : 1;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _894 = ~_886;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = rsqrt(_794);
    int _902 = ~_890;
    int _904 = _902 + 1;
    int _906 = _904 + 1;
    float _908 = _870 * _100;
    int _910 = _906;
    int _912 = _898;
    if (!_796)
    {
        int _914 = ~_890;
        int _916 = _914 + 1;
        _910 = _916;
    }
    int _918 = _910;
    float _920 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _892);
    bool _922 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _930 = _926 || _928;
    float _932 = -_100;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _750);
    if (!_828)
    {
        int _936 = ~_886;
        int _938 = _936 + 1;
        _912 = _938;
    }
    int _940 = _912;
    float _942 = exp2(_908);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _946 = _824 ? 0 : 1;
    float _948 = _780 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _952 = _950 != 0;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _960 = _958 != 0;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _964 = 1.0 + _962;
    bool _966 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(1.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].z, _944);
    int _978 = ~_946;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = _860 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _986 = !_956;
    int _988 = _986 ? 0 : 1;
    float _990 = 1.0 / _964;
    bool _992 = !_952;
    int _994 = _992 ? 0 : 1;
    float _996 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _976);
    bool _998 = !_960;
    int _1000 = _998 ? 0 : 1;
    float _1002 = -_942;
    float _1004 = _1002 + 1.0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1016 = _1014 != 0;
    float _1018 = _766 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1020 = _982;
    if (!_792)
    {
        int _1022 = ~_946;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _984);
    float _1030 = float(_812);
    bool _1032 = !_1012;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = in.m_57.x;
    float _1038 = in.m_57.y;
    float _1040 = in.m_57.z;
    bool _1042 = !_1008;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = 1.0 / _1030;
    int _1048 = abs(_1034);
    float _1050 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1028);
    int _1052 = abs(_1044);
    float _1054 = -_100;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[81].x, _878);
    float _1058 = float(_840);
    float _1060 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _920);
    float _1062 = _930 ? _1004 : 0.0;
    float _1064 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    float _1066 = _1058 * _100;
    float _1068 = float(_940);
    float _1070 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _888);
    float _1072 = float(_1052);
    float _1074 = _1046 * _100;
    float _1076 = float(_918);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1078;
    float _1082 = float(_1048);
    if (_974)
    {
        float _1084 = _1062 * _990;
        _110 = _1084;
    }
    float _1086 = _110;
    bool _1088 = !_1016;
    int _1090 = _1088 ? 0 : 1;
    float _1092 = _1072 * _1076;
    float _1094 = float(_1026);
    float _1096 = _1082 * _1068;
    int _1098 = abs(_1090);
    float _1100 = _900 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1102 = _1092 * (-2.0);
    float _1104 = _1096 * (-2.0);
    float _1106 = _900 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1108 = _1100 * _1100;
    float _1110 = fma(_1102, _1036, _1036);
    float _1112 = _700 + (-0.5);
    float _1114 = float(_1098);
    float _1116 = fma(_1104, _1038, _1038);
    float _1118 = fma(_1106, _1106, _1108);
    float _1120 = _692 + (-0.5);
    float _1122 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1110);
    float _1124 = _1114 * _1094;
    float _1126 = fma(_790, _1102, _790);
    float _1128 = fma(_834, _1104, _834);
    float _1130 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1116);
    float _1132 = _1124 * (-2.0);
    float _1134 = fma(_1126, _1086, _1122);
    float _1136 = _884 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1138 = fma(_1128, _1086, _1130);
    float _1140 = in.m_59.x;
    float _1142 = in.m_59.y;
    float _1144 = in.m_59.z;
    float _1146 = fma(_830, _1132, _830);
    float _1148 = fma(_1132, _1040, _1040);
    float _1150 = _696 + (-0.5);
    float _1152 = _1138 * 0.15915493667125701904296875;
    float _1154 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1156 = 1.0 / _1080;
    float _1158 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1148);
    float _1160 = _900 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1162 = -_1154;
    float _1164 = _1136 + _1162;
    float _1166 = fma(_1146, _1086, _1158);
    bool _1168 = _1154 >= _1136;
    bool _1170 = isnan(_1154);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(_1136);
    bool _1176 = _1172 || _1174;
    float _1178 = fma(_1160, _1160, _1118);
    float _1180 = abs(_1164);
    float _1182 = precise::max(_1180, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1184 = _1166 * 0.15915493667125701904296875;
    float _1186 = _1134 * 0.15915493667125701904296875;
    float _1188 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1190 = precise::min(_1182, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1192 = rsqrt(_1178);
    bool _1194 = !_1176;
    float _1196 = _1194 ? 1.0 : (-1.0);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1200 = _1190 + _1198;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1142);
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1140);
    float _1206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1144);
    float _1208 = _1184 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1200 * _1156;
    float _1214 = _1188 * _1202;
    float _1216 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1218 = _714 * _1204;
    float _1220 = _1196 * _1212;
    float _1222 = _1216 * _1206;
    float _1224 = _1186 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = _694 * _1220;
    float _1230 = _1106 * _1192;
    float _1232 = _1100 * _1192;
    float _1234 = _1160 * _1192;
    float _1236 = _1228 * 0.15915493667125701904296875;
    float _1238 = _1186 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _1210 * _1214;
    float _1244 = _1152 * 6.283185482025146484375;
    float _1246 = sin(_1244);
    float _1248 = _1152 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1184 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1226 * _1246;
    float _1258 = _1240 * _1246;
    float _1260 = _1246 * _1210;
    float _1262 = _1240 * _1250;
    float _1264 = _1226 * _1250;
    float _1266 = _1250 * _1210;
    float _1268 = _1240 * _1242;
    float _1270 = _1236 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1226 * _1242;
    float _1276 = fma(_1254, _1262, _1256);
    float _1278 = -_1258;
    float _1280 = fma(_1254, _1264, _1278);
    float _1282 = -_1264;
    float _1284 = fma(_1254, _1258, _1282);
    float _1286 = -_1214;
    float _1288 = _1254 * _1286;
    float _1290 = fma(_1276, _1218, _1268);
    float _1292 = fma(_1254, _1256, _1262);
    float _1294 = _1236 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    float _1298 = fma(_1266, _1218, _1288);
    float _1300 = fma(_1284, _1222, _1290);
    float _1302 = fma(_1280, _1218, _1274);
    float _1304 = _1234 * _1234;
    float _1306 = fma(_1260, _1222, _1298);
    float _1308 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1312 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1314 = fma(_1292, _1222, _1302);
    float _1316 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1308);
    float _1318 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1310);
    float _1320 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1312);
    float _1322 = -_1272;
    float _1324 = _1322 + 1.0;
    float _1326 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1316);
    float _1328 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1318);
    float _1330 = _1230 * _1296;
    float _1332 = _1232 * _1324;
    float _1334 = _1232 * _1296;
    float _1336 = fma(_1324, _1304, _1272);
    float _1338 = _1234 * _1296;
    float _1340 = _1230 * _1324;
    float _1342 = fma(_1234, _1332, _1330);
    float _1344 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1346 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1348 = -_1338;
    float _1350 = fma(_1232, _1340, _1348);
    float _1352 = -_1334;
    float _1354 = fma(_1234, _1340, _1352);
    float _1356 = _1344 * _1342;
    float _1358 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1320);
    float _1360 = fma(_1230, _1340, _1272);
    float _1362 = _1344 * _1350;
    float _1364 = fma(_1346, _1354, _1356);
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1368 = fma(_1232, _1332, _1272);
    float _1370 = fma(_1346, _1360, _1362);
    float _1372 = fma(_1234, _1340, _1334);
    float _1374 = fma(_1366, _1336, _1364);
    float _1376 = fma(_1232, _1340, _1338);
    float _1378 = _1344 * _1368;
    float _1380 = fma(_1366, _1372, _1370);
    float _1382 = _1018 + _1374;
    float _1384 = -_1330;
    float _1386 = fma(_1234, _1332, _1384);
    float _1388 = fma(_1346, _1376, _1378);
    float _1390 = _948 + _1380;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1394 = _1382 + _1392;
    float _1396 = fma(_1366, _1386, _1388);
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1400 = _1390 + _1398;
    float _1402 = _1394 * _1394;
    float _1404 = _860 + _1396;
    float _1406 = fma(_1400, _1400, _1402);
    float _1408 = sqrt(_1406);
    bool _1410 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1386;
    float _1414 = _1340;
    float _1416 = _1376;
    if (!_1410)
    {
        _1412 = _1390;
    }
    float _1418 = _1412;
    float _1420 = _1418;
    if (!_1410)
    {
        _1414 = _1382;
    }
    float _1422 = _1414;
    float _1424 = _1422;
    if (!_1410)
    {
        _1416 = _1404;
    }
    float _1426 = _1416;
    bool _1428 = !_1410;
    float _1430 = _1426;
    if (!_1428)
    {
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1436 = _1408 + _1434;
        float _1438 = _1404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1440 = rsqrt(_1406);
        float _1442 = _1436 * _1432;
        float _1444 = _1442 * 0.15915493667125701904296875;
        float _1446 = _1444 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        float _1450 = _1444 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        float _1454 = _1448 + (-1.0);
        float _1456 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1458 = fma(_1452, _1438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1460 = fma(_1404, _1448, _1456);
        float _1462 = _1440 * _1458;
        float _1464 = fma(_1400, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1466 = fma(_1394, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1430 = _1460;
        _1420 = _1464;
        _1424 = _1466;
    }
    float _1468 = _1430;
    float _1470 = _1420;
    float _1472 = _1424;
    float _1474 = -_860;
    float _1476 = _1474 + _1468;
    float _1478 = -_948;
    float _1480 = _1478 + _1470;
    float _1482 = -_1018;
    float _1484 = _1482 + _1472;
    float _1486 = _860 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1488 = _1476 * _1476;
    float _1490 = _860 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1492 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1486);
    float _1494 = fma(_1480, _1480, _1488);
    float _1496 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1490);
    float _1498 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1492);
    float _1500 = fma(_1484, _1484, _1494);
    float _1502 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1496);
    float _1504 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1506 = sqrt(_1500);
    bool _1508 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan(0.5);
    bool _1516 = _1512 || _1514;
    float _1518 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1520 = _1518 + _1504;
    float _1522 = 1.0 / _1504;
    bool _1524 = _1506 > 0.0;
    float _1526 = _1506;
    float _1528 = _1468;
    float _1530 = _1470;
    float _1532 = _1472;
    float _1534 = _1480;
    float _1536 = _1518;
    if (_1516)
    {
        _1526 = 1.0;
    }
    float _1538 = _1526;
    float _1540 = _1520 * _1522;
    float _1542 = _1540 * 0.5;
    bool _1544 = !_1524;
    float _1546 = _1538;
    if (!_1544)
    {
        float _1548 = _172 * _172;
        float _1550 = rsqrt(_1500);
        float _1552 = fma(_170, _170, _1548);
        float _1554 = fma(_174, _174, _1552);
        float _1556 = sqrt(_1554);
        float _1558 = _1476 * _1550;
        float _1560 = _1484 * _1550;
        bool _1562 = _1556 > 0.0;
        float _1564 = _1480 * _1550;
        bool _1566 = !_1562;
        if (!_1566)
        {
            float _1568 = rsqrt(_1554);
            float _1570 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1572 = _172 * _1568;
            float _1574 = _170 * _1568;
            float _1576 = _1558 * _1572;
            float _1578 = _174 * _1568;
            float _1580 = fma(_1564, _1574, _1576);
            float _1582 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1584 = fma(_1560, _1578, _1580);
            float _1586 = _1584 * _1582;
            float _1588 = fma(_170, _1586, _1470);
            float _1590 = fma(_172, _1586, _1468);
            float _1592 = fma(_174, _1586, _1472);
            _1528 = _1590;
            _1530 = _1588;
            _1532 = _1592;
            _1534 = _1582;
        }
    }
    float _1594 = _1528;
    float _1596 = _1530;
    float _1598 = _1532;
    float _1600 = _1534;
    float _1602 = _1600;
    if (!_1516)
    {
        float _1604 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1608 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1606);
        float _1610 = _1604 * 0.15915493667125701904296875;
        float _1612 = _1610 * 6.283185482025146484375;
        float _1614 = cos(_1612);
        float _1616 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1618 = _1616 * 0.15915493667125701904296875;
        float _1620 = _1610 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = 1.0 / _1614;
        float _1626 = _1618 * 6.283185482025146484375;
        float _1628 = cos(_1626);
        float _1630 = _1622 * _1624;
        float _1632 = 1.0 / _1608;
        float _1634 = _1628 * _1630;
        float _1636 = _1618 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1642 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1646 = _1632 * _1644;
        float _1648 = 1.0 / _1634;
        float _1650 = 1.0 / _1642;
        float _1652 = _1638 * _1648;
        float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1656 = fma(_1652, _1646, _1654);
        float _1658 = _1656 * _1650;
        float _1660 = precise::clamp(_1658, 0.0, 1.0);
        _178 = _1618;
        _1602 = _1610;
        _180 = _1632;
        _1546 = _1660;
    }
    float _1662 = _178;
    float _1664 = _1602;
    float _1666 = _180;
    float _1668 = _1546;
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1672 = _1594 + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1676 = _1596 + _1674;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1680 = _1598 + _1678;
    float _1682 = _1672 * _1672;
    float _1684 = fma(_1676, _1676, _1682);
    float _1686 = fma(_1680, _1680, _1684);
    float _1688 = rsqrt(_1686);
    float _1690 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1692 = _1676 * _1690;
    float _1694 = _1680 * _1690;
    float _1696 = _1692 * _1692;
    float _1698 = _1694 * _1694;
    float _1700 = _1696 + _1698;
    float _1702 = sqrt(_1700);
    bool _1704 = _1702 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1708 = _1702 + _1706;
    float _1710 = _1662;
    float _1712 = _1708;
    float _1714 = _1664;
    float _1716 = _1672;
    float _1718 = _1692;
    if (_1704)
    {
        float _1720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1710 = _1720;
    }
    float _1722 = _1710;
    float _1724 = _1722;
    if (_1704)
    {
        float _1726 = _1708 * _1722;
        _1712 = _1726;
    }
    float _1728 = _1712;
    if (_1704)
    {
        float _1730 = rsqrt(_1700);
        _1724 = _1730;
    }
    float _1732 = _1724;
    float _1734 = _1732;
    if (_1704)
    {
        float _1736 = _1728 * 0.15915493667125701904296875;
        _1714 = _1736;
    }
    float _1738 = _1714;
    float _1740 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1742 = _1680;
    if (_1704)
    {
        float _1744 = _1738 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        _1742 = _1746;
    }
    float _1748 = _1742;
    float _1750 = precise::max(0.0, _1740);
    float _1752 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1754 = _1666;
    float _1756 = _1750;
    if (_1704)
    {
        float _1758 = _1738 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        _1754 = _1760;
    }
    float _1762 = _1754;
    float _1764 = -_1690;
    float _1766 = -_1750;
    float _1768 = fma(_1672, _1764, _1766);
    if (_1704)
    {
        float _1770 = _1768 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1716 = _1770;
    }
    float _1772 = _1716;
    float _1774 = sqrt(_1686);
    float _1776 = _1748;
    float _1778 = _1772;
    if (_1704)
    {
        float _1780 = fma(_1748, _1772, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1776 = _1780;
    }
    float _1782 = _1776;
    float _1784 = _1782;
    if (!_1704)
    {
        _1778 = _1768;
    }
    float _1786 = _1778;
    float _1788 = _1786;
    if (_1704)
    {
        float _1790 = _1732 * _1782;
        _1536 = _1790;
    }
    float _1792 = _1536;
    if (!_1704)
    {
        _1784 = _1696;
    }
    float _1794 = _1784;
    float _1796 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1798 = _1794;
    float _1800 = _1762;
    if (_1704)
    {
        float _1802 = _1762 + (-1.0);
        _1756 = _1802;
    }
    float _1804 = _1756;
    float _1806 = _1804;
    if (_1704)
    {
        float _1808 = _1692 * _1792;
        _1718 = _1808;
    }
    float _1810 = _1718;
    float _1812 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1796);
    if (_1704)
    {
        float _1814 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1814;
    }
    float _1816 = _1734;
    if (!_1704)
    {
        _1806 = _1694;
    }
    float _1818 = _1806;
    float _1820 = _1818;
    if (_1704)
    {
        float _1822 = _1694 * _1792;
        _1820 = _1822;
    }
    float _1824 = _1820;
    if (_1704)
    {
        float _1826 = _1810 * _1810;
        _1798 = _1826;
    }
    float _1828 = _1798;
    if (_1704)
    {
        float _1830 = fma(_1768, _1762, _1816);
        _1788 = _1830;
    }
    float _1832 = _1788;
    if (!_1704)
    {
        _1800 = _1698;
    }
    float _1834 = _1800;
    float _1836 = _1834;
    if (_1704)
    {
        float _1838 = _1824 * _1824;
        _1836 = _1838;
    }
    float _1840 = _1836;
    float _1842 = fma(_1832, _1832, _1828);
    float _1844 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1812);
    float _1846 = _1842 + _1840;
    float _1848 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1852 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1850);
    float _1854 = precise::clamp(_1852, 0.0, 1.0);
    float _1856 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1858 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1848);
    float _1860 = rsqrt(_1846);
    float _1862 = -_1854;
    float _1864 = _1862 + 1.0;
    float _1866 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1856);
    float _1868 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1858);
    float _1870 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1872 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1866);
    float _1874 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1876 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1870);
    float _1878 = abs(_1864);
    float _1880 = log2(_1878);
    float _1882 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1884 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1886 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1876);
    float _1888 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1890 = -_1884;
    float _1892 = fma(_1890, _1752, 1.0);
    float _1894 = _1860 * _1810;
    float _1896 = _1860 * _1832;
    float _1898 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1900 = _1860 * _1824;
    float _1902 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1904 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1906 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1888);
    float _1908 = log2(_1892);
    float _1910 = -_1902;
    float _1912 = fma(_1896, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1910);
    float _1914 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1916 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1906);
    float _1918 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1920 = -_1900;
    float _1922 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1912);
    float _1924 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1926 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1916);
    float _1928 = exp2(_1914);
    float _1930 = fma(_1922, -0.5, 0.5);
    float _1932 = fma(_1922, 0.5, 0.5);
    float _1934 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1924);
    float _1936 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1918);
    float _1938 = _1896 + 1.0;
    float _1940 = fma(_1932, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1942 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1934);
    float _1944 = 1.0 / _1926;
    float _1946 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1936);
    float _1948 = fma(_1932, _1940, -0.212114393711090087890625);
    float _1950 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1942);
    float _1952 = _1908 * 0.693147182464599609375;
    float _1954 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1946);
    float _1956 = fma(_1932, _1948, 1.570728778839111328125);
    float _1958 = sqrt(_1930);
    float _1960 = -_1896;
    float _1962 = fma(_1928, _1938, _1960);
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1966 = fma(_1962, 0.5, 0.5);
    float _1968 = _1950 * _1944;
    float _1970 = _1954 * _1944;
    float _1972 = fma(_1968, 0.5, 0.5);
    float _1974 = fma(_1970, -0.5, 0.5);
    float _1976 = _1958 * 0.636619746685028076171875;
    float _1978 = -_1956;
    float _1980 = fma(_1976, _1978, 1.0);
    float3 _5779 = float3(_1972, _1974, _1964);
    float _1982 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5779, float3(0.0), isnan(_5779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5779, float3(0.0), isnan(_5779)), level(0.0)).x;
    float3 _5790 = float3(_1972, _1974, _1964);
    float4 _1985 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5790, float3(0.0), isnan(_5790)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5790, float3(0.0), isnan(_5790)), level(0.0)).xyzw;
    float _1987 = _1985.x;
    float _1989 = _1985.y;
    float _1991 = _1985.z;
    float _1993 = _1985.w;
    float2 _5807 = float2(_1980, _1966);
    float3 _1997 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5807, float2(0.0), isnan(_5807)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5807, float2(0.0), isnan(_5807)), level(0.0)).xyz;
    float _1999 = _1997.x;
    float _2001 = _1997.y;
    float _2003 = _1997.z;
    float _2005 = float(uint(_840));
    float _2007 = trunc(_1074);
    int _2009 = int(_2007);
    int _2011 = ~_840;
    int _2013 = _2011 + 1;
    float _2015 = _1066 * _152;
    int _2017 = abs(_988);
    out.m_61.x = _658;
    out.m_61.y = _660;
    out.m_61.z = _662;
    out.m_61.w = _666;
    float _2019 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2021 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2023 = 1.0 / _2005;
    float _2025 = in.m_63.x;
    float _2027 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2021);
    bool _2029 = !_706;
    float _2031 = _2029 ? 7.345489978790283203125 : 1.0;
    out.m_65.x = _1596;
    out.m_65.y = _1594;
    out.m_65.z = _1598;
    float _2033 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2027);
    float _2035 = float(uint(_2009));
    float _2037 = trunc(_2015);
    int _2039 = int(_2037);
    float _2041 = _2031 * _700;
    float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2045 = _690 + _2043;
    float _2047 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2033);
    int _2049 = as_type<int>(_2023) + (-2);
    float _2051 = floor(_2041);
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2053;
    out.gl_Position.x = _1950;
    out.gl_Position.y = _1954;
    out.gl_Position.z = _2047;
    out.gl_Position.w = _1926;
    float _2057 = as_type<float>(_2049) * _2035;
    float _2059 = trunc(_2057);
    float _2061 = precise::max(_2059, 0.0);
    uint _2064 = uint(_2061);
    float _2066 = exp2(_2019);
    int _2068 = ~_840;
    int _2070 = _2068 + 1;
    int _2072 = _2013 * int(_2064);
    int _2074 = _2072 + _2009;
    float _2076 = float(uint(_2074));
    float _2078 = -_2066;
    float _2080 = _2078 + 1.0;
    float _2082 = as_type<float>(_2049) * _2076;
    float _2084 = trunc(_2082);
    float _2086 = precise::max(_2084, 0.0);
    uint _2088 = uint(_2086);
    int _2090 = int(_2064) + int(_2088);
    float _2092 = float(_2009);
    int _2094 = _2070 * _2090;
    int _2096 = _2094 + _2009;
    bool _2098 = _2092 >= _1058;
    bool _2100 = isnan(_2092);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan(_1058);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_2106);
    bool _2110 = uint(_2096) >= uint(_840);
    float _2112 = -_2051;
    float _2114 = _2041 + _2112;
    float _2116 = trunc(_2108);
    int _2118 = int(_2116);
    bool _2120 = !_2110;
    int _2122 = _2120 ? 0 : (-1);
    float _2124 = _2114 * _1058;
    bool _2126 = _840 == 0;
    int _2128 = ~_2090;
    int _2130 = _2128 + _2122;
    int _2132 = _2130 + 1;
    int _2134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2136 = _2134 != 0;
    float _2138 = trunc(_2124);
    int _2140 = int(_2138);
    int _2142 = _840 + (-1);
    int _2144 = _840 * _2132;
    int _2146 = _2144 + _2009;
    bool _2148 = !_2136;
    int _2150 = _2148 ? 0 : 1;
    int _2152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2154 = _2152 != 0;
    int _2156 = ~_2118;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    bool _2162 = !_2126;
    int _2164 = _2162 ? _2146 : (-1);
    int _2166 = abs(_2150);
    int _2168 = abs(_994);
    int _2170 = _2164 * _2160;
    bool _2172 = !_2154;
    int _2174 = _2172 ? 0 : 1;
    int _2176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2178 = _2176 != 0;
    int _2180 = _2118 * _2142;
    int _2182 = _2180 + _2170;
    int _2184 = abs(_1000);
    int _2186 = _2182 * _2017;
    int _2188 = _2140 * _2166;
    int _2190 = _2188 + _2009;
    int _2192 = abs(_2174);
    int _2194 = _2039 * _2168;
    int _2196 = _2194 + _2186;
    int _2198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2200 = _2198 != 0;
    int _2202 = _2190 * _2184;
    int _2204 = _2202 + _2196;
    int _2206 = ~_840;
    int _2208 = _2206 + 1;
    int _2210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2212 = _2210 != 0;
    int _2214 = _2140 * _2192;
    int _2216 = _2214 + _2204;
    int _2218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2220 = _2218 != 0;
    float _2222 = in.m_53.w;
    float _2224 = float(uint(_2216));
    float _2226 = as_type<float>(_2168);
    bool _2228 = _2220;
    if (!_2200)
    {
        _2226 = _2025;
    }
    float _2230 = _2226;
    float _2232 = as_type<float>(_2049) * _2224;
    float _2234 = trunc(_2232);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    int _2240 = ~_840;
    int _2242 = _2240 + 1;
    bool _2244 = _2222 > 0.5;
    int _2246 = _2208 * int(_2238);
    int _2248 = _2246 + _2216;
    float _2250 = float(uint(_2248));
    float _2252 = in.m_63.y;
    float _2254 = as_type<float>(_2049) * _2250;
    float _2256 = trunc(_2254);
    float _2258 = precise::max(_2256, 0.0);
    uint _2260 = uint(_2258);
    int _2262 = int(_2238) + int(_2260);
    float _2264 = -_2252;
    float _2266 = _2264 + 1.0;
    int _2268 = _2242 * _2262;
    int _2270 = _2268 + _2216;
    bool _2272 = uint(_2270) >= uint(_840);
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2276 = _2274 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2278 = !_2272;
    int _2280 = _2278 ? 0 : (-1);
    float _2282 = 1.0 / _2276;
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2286 = _2284 != 0;
    int _2288 = ~_2262;
    int _2290 = _2288 + _2280;
    int _2292 = _2290 + 1;
    int _2294 = _2244 ? as_type<int>(_2266) : as_type<int>(_2252);
    bool _2296 = _692 > 0.5;
    int _2298 = _840 * _2292;
    int _2300 = _2298 + _2216;
    float _2302 = float(uint(_2190));
    float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2306 = _2220 ? as_type<float>(_2294) : _2252;
    bool _2308 = !_2126;
    int _2310 = _2308 ? _2300 : (-1);
    float _2312 = as_type<float>(_2049) * _2302;
    float _2314 = _2252;
    bool _2316 = _2286;
    float _2318 = _2230;
    int _2320 = _2292;
    if (_2286)
    {
        float _2322 = _2296 ? _2266 : _2252;
        _2314 = _2322;
    }
    float _2324 = _2314;
    float _2326 = _2055 * _2282;
    if (_2178)
    {
        bool _2328 = _696 > 0.5;
        _2316 = _2328;
    }
    bool _2330 = _2316;
    int _2332 = _2310 >> 31;
    float _2334 = trunc(_2312);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    if (_2200)
    {
        bool _2340 = _700 > 0.5;
        _2228 = _2340;
    }
    bool _2342 = _2228;
    float _2344 = fma(_2326, _2045, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2346 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2348 = isnan(_690);
    bool _2350 = _2346 || _2348;
    bool _2352 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2354 = _2350 || _2352;
    float _2356 = float(_2354);
    int _2358 = _2332 & 3;
    float _2360 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2362 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2364 = isnan(_690);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2370 = _2366 || _2368;
    float _2372 = float(_2370);
    float _2374 = -_2356;
    float _2376 = _2374 + 1.0;
    int _2378 = _2310 + _2358;
    float _2380 = fma(_2306, _2360, -0.5);
    int _2382 = ~_840;
    int _2384 = _2382 + 1;
    float _2386 = _2372 * _2376;
    int _2388 = _2378 >> 2;
    float _2390 = -_1070;
    float _2392 = fma(_880, _2380, _2390);
    int _2394 = as_type<int>(_2344);
    float _2396 = as_type<float>(_2388);
    if (!_2200)
    {
        _776 = _2230;
    }
    float _2398 = _776;
    int _2400 = _2384 * int(_2338);
    int _2402 = _2400 + _2190;
    int _2404 = _2388 << 4;
    int _2406 = _2404 + 368;
    float _2408 = _2344 * _2386;
    float _2410 = _2398;
    if (_2200)
    {
        _2318 = _2025;
    }
    float _2412 = _2318;
    uint _2414 = uint(int(uint(_2406) >> uint(2)));
    uint _2416 = uint(int(uint(int(_2414)) >> uint(2)));
    int _2418 = int(_2414) & 3;
    float _2420 = (*spvDescriptorSet0.vp_c9)._m0[int(_2416)][_2418];
    int _2422 = int(_2414) + 1;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    int _2426 = _2422 & 3;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[int(_2424)][_2426];
    float _2430 = float(uint(_2402));
    if (_2200)
    {
        float _2432 = -_2412;
        float _2434 = _2432 + 1.0;
        _2394 = as_type<int>(_2434);
    }
    int _2436 = _2394;
    if (_2178)
    {
        float _2438 = -_2412;
        float _2440 = _2438 + 1.0;
        _2320 = as_type<int>(_2440);
    }
    int _2442 = _2320;
    float _2444 = as_type<float>(_2049) * _2430;
    float _2446 = -_2372;
    float _2448 = _2446 + 1.0;
    if (_2200)
    {
        float _2450 = _2342 ? as_type<float>(_2436) : _2412;
        _2410 = _2450;
    }
    float _2452 = _2410;
    float _2454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2456 = _2406 + 8;
    uint _2458 = uint(int(uint(_2456) >> uint(2)));
    uint _2460 = uint(int(uint(int(_2458)) >> uint(2)));
    int _2462 = int(_2458) & 3;
    float _2464 = (*spvDescriptorSet0.vp_c9)._m0[int(_2460)][_2462];
    int _2466 = int(_2458) + 1;
    uint _2468 = uint(int(uint(_2466) >> uint(2)));
    int _2470 = _2466 & 3;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[int(_2468)][_2470];
    float _2474 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2324, -0.5);
    int _2476 = _2310 & 3;
    bool _2478 = _2476 != 0;
    float _2480 = fma(_2448, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2408);
    if (!_2178)
    {
        _2396 = _2412;
    }
    float _2482 = _2396;
    float _2484 = -_826;
    float _2486 = fma(_1060, _2474, _2484);
    float _2488 = _2482;
    if (_2178)
    {
        float _2490 = _2330 ? as_type<float>(_2442) : _2412;
        _2488 = _2490;
    }
    float _2492 = _2488;
    float _2494 = trunc(_2444);
    float _2496 = precise::max(_2494, 0.0);
    uint _2498 = uint(_2496);
    bool _2500 = uint(_2476) > 1u;
    float _2502 = fma(_2356, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2480);
    int _2504 = _2310 & 3;
    bool _2506 = _2504 != 0;
    float _2508 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2510 = _2506 ? 0 : 1;
    float _2512 = _2454 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2514 = _2476 != 3;
    float _2516 = fma(_2452, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2518 = ~_2510;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    float _2524 = fma(_2512, _2492, -0.5);
    bool _2526 = uint(_2476) >= 2u;
    float _2528 = fma(_996, _2516, _934);
    int _2530 = _2522;
    if (!_2500)
    {
        int _2532 = ~_2510;
        int _2534 = _2532 + 1;
        _2530 = _2534;
    }
    int _2536 = _2530;
    float _2538 = fma(_1064, _2524, _1056);
    int _2540 = _2526 ? 0 : 1;
    out.m_67.w = _2508;
    int _2542 = abs(_2536);
    bool _2544 = !_2478;
    int _2546 = _2544 ? 0 : 1;
    int _2548 = int(_2338) + int(_2498);
    int _2550 = ~_840;
    int _2552 = _2550 + 1;
    int _2554 = ~_2540;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    bool _2560 = _2476 != 3;
    int _2562 = _2552 * _2548;
    int _2564 = _2562 + _2190;
    int _2566 = _2558;
    if (_2514)
    {
        int _2568 = ~_2540;
        int _2570 = _2568 + 1;
        _2566 = _2570;
    }
    int _2572 = _2566;
    int _2574 = abs(_2546);
    int _2576 = ~_2542;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    bool _2582 = !_2560;
    int _2584 = _2582 ? 0 : (-1);
    int _2586 = _2580 * as_type<int>(_2428);
    bool _2588 = uint(_2564) >= uint(_840);
    int _2590 = abs(_2584);
    int _2592 = abs(_2572);
    int _2594 = ~_2574;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    bool _2600 = !_2588;
    int _2602 = _2600 ? 0 : (-1);
    int _2604 = _2598 * as_type<int>(_2420);
    int _2606 = _2604 + _2586;
    int _2608 = ~_2592;
    int _2610 = _2608 + 1;
    int _2612 = _2610 + 1;
    bool _2614 = !_2212;
    int _2616 = _2614 ? 0 : 1;
    int _2618 = ~_2548;
    int _2620 = _2618 + _2602;
    int _2622 = _2620 + 1;
    int _2624 = _2612 * as_type<int>(_2464);
    int _2626 = _2624 + _2606;
    int _2628 = ~_2590;
    int _2630 = _2628 + 1;
    int _2632 = _2630 + 1;
    float _2634 = _1668 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2636 = abs(_2616);
    int _2638 = _840 * _2622;
    int _2640 = _2638 + _2190;
    float _2642 = _2486 + 0.5;
    int _2644 = _2632 * as_type<int>(_2472);
    int _2646 = _2644 + _2626;
    int _2648 = ~_2636;
    int _2650 = _2648 + 1;
    int _2652 = _2650 + 1;
    float _2654 = _2392 + 0.5;
    float _2656 = _2528 + 0.5;
    float _2658 = _2538 + 0.5;
    bool _2660 = !_2126;
    int _2662 = _2660 ? _2640 : (-1);
    int _2664 = _2646 * _2652;
    bool _2666 = _1668 > 0.0;
    bool _2668 = isnan(_1668);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan(0.0);
    bool _2674 = _2670 || _2672;
    out.m_69.x = _2656;
    out.m_69.y = _2642;
    out.m_69.z = _2658;
    out.m_69.w = _2654;
    int _2676 = _2662 * _2636;
    int _2678 = _2676 + _2664;
    float _2680 = _2047 + _1926;
    float _2682 = float(_2678);
    float _2684 = _2680 * 0.5;
    out.m_71.x = _2682;
    float _2686 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2688 = _2634 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.z = _2684;
    out.m_73.w = _1926;
    float _2690 = _2686 * _1982;
    float _2692 = -_2686;
    float _2694 = _2692 + 1.0;
    out.m_49.x = _2688;
    float _2696 = _1993 * _2690;
    float _2698 = _2003 * _2690;
    float _2700 = _1993 * _2694;
    float _2702 = fma(_1999, _2696, _1987);
    float _2704 = fma(_2001, _2696, _1989);
    float _2706 = fma(_1993, _2698, _1991);
    out.m_75.x = _2702;
    out.m_75.y = _2704;
    out.m_75.z = _2706;
    out.m_75.w = _2700;
    if (_2674)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2708 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2708;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _688 = false;
    bool _590 = false;
    bool _416 = false;
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
        float _2777 = as_type<float>(_118);
        out.gl_Position.z = _2777;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2832 = as_type<float>(_144);
        out.gl_Position.z = _2832;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _180 = _172;
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
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = _202 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _202 + _208;
    bool _212 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _214 = isnan(_202);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = _202 + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _238 = _236 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _240 = 1.0 / _226;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _244 = 1.0 / _238;
    float _246 = 1.0 / _234;
    float _248 = _206 * _240;
    bool _250 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _252 = isnan(_202);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_222;
    float _264 = _262 + 1.0;
    float _266 = _260 * _264;
    float _268 = _210 * _244;
    bool _270 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _272 = isnan(_202);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    bool _286 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _288 = isnan(_202);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _302 = -_260;
    float _304 = _302 + 1.0;
    float _306 = -_280;
    float _308 = _306 + 1.0;
    float _310 = _230 * _246;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _316;
    float _320 = _296 * _308;
    float _322 = fma(_284, _310, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = fma(_314, _310, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = fma(_318, _310, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _328 = _280 * _304;
    float _330 = _322 * _320;
    float _332 = _324 * _320;
    float _334 = _326 * _320;
    float _336 = -_296;
    float _338 = _336 + 1.0;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _346 = _344 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].x, _334);
    float _350 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].y, _332);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _352;
    float _356 = fma(_346, _268, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _358 = fma(_338, (*spvDescriptorSet0.vp_c9)._m0[143].z, _330);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _360;
    float _364 = fma(_300, _268, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _366 = fma(_342, _268, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_362, _248, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _374 = fma(_356, _328, _350);
    float _376 = fma(_364, _328, _348);
    float _378 = fma(_354, _248, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _380 = fma(_370, _248, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _382 = fma(_366, _328, _358);
    float _384 = fma(_372, _266, _374);
    float _386 = fma(_378, _266, _376);
    float _388 = fma(_380, _266, _382);
    float _390 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[146].y, _384);
    float _392 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_222, (*spvDescriptorSet0.vp_c9)._m0[146].z, _388);
    bool _396 = !_242;
    float _414;
    if (!_396)
    {
        float _398 = in.m_53.x;
        float _400 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _402 = _398 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _404 = fma(_402, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _406 = _404 * _400;
        float _408 = floor(_406);
        float _410 = -_408;
        float _412 = _406 + _410;
        _414 = _412;
        _416 = true;
    }
    else
    {
        _414 = _156;
    }
    _416 = false;
    float _418 = _414;
    float _420 = in.m_55.x;
    float _422 = in.m_55.y;
    float _424 = in.m_55.z;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _428 = _418 + _426;
    bool _430 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _432 = isnan(_418);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _450 = 1.0 / _448;
    bool _452 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _454 = 1.0 / _444;
    float _456 = _390 * _422;
    float _458 = _394 * _424;
    bool _460 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _462 = isnan(_418);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _468 = _464 || _466;
    float _470 = float(_468);
    float _472 = -_440;
    float _474 = _472 + 1.0;
    bool _476 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _478 = isnan(_418);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _470 * _474;
    float _490 = -_470;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _498;
    float _502 = _428 * _454;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _506 = _418 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _510 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _508;
    float _512 = _486 * _492;
    float _514 = fma(_496, _502, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _516 = fma(_500, _502, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _518 = fma(_510, _502, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _520 = _506 * _450;
    float _522 = _514 * _512;
    float _524 = _516 * _512;
    float _526 = _518 * _512;
    float _528 = -_486;
    float _530 = _528 + 1.0;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _544 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].x, _522);
    float _546 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].y, _524);
    float _548 = fma(_534, _520, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _550 = fma(_538, _520, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _552 = fma(_542, _520, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _554 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[107].z, _526);
    float _556 = fma(_548, _488, _544);
    float _558 = fma(_550, _488, _546);
    float _560 = _392 * _420;
    float _562 = fma(_552, _488, _554);
    float _564 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[109].x, _556);
    float _566 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[109].y, _558);
    float _568 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[109].z, _562);
    bool _570 = !_452;
    float _588;
    if (!_570)
    {
        float _572 = in.m_53.x;
        float _574 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _576 = _572 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _578 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _580 = _578 * _574;
        float _582 = floor(_580);
        float _584 = -_582;
        float _586 = _580 + _584;
        _588 = _586;
        _590 = true;
    }
    else
    {
        _588 = _156;
    }
    _590 = false;
    float _592 = _588;
    bool _594 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _596 = isnan(_592);
    bool _598 = _594 || _596;
    bool _600 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _602 = _598 || _600;
    float _604 = float(_602);
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _610 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _612 = isnan(_592);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _622;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _592 + _626;
    float _630 = -_604;
    float _632 = _630 + 1.0;
    bool _634 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _636 = 1.0 / _608;
    float _638 = _620 * _632;
    float _640 = -_620;
    float _642 = _640 + 1.0;
    float _644 = _624 * _636;
    float _646 = _566 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _648 = fma(_644, _628, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _650 = _564 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _652 = _648 * _638;
    float _654 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _656 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[115].x, _652);
    float _658 = _650 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _660 = _646 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _664 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[116].x, _656);
    float _666 = _664 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _668 = !_634;
    float _686;
    if (!_668)
    {
        float _670 = in.m_53.x;
        float _672 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _674 = _670 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _676 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _678 = _676 * _672;
        float _680 = floor(_678);
        float _682 = -_680;
        float _684 = _678 + _682;
        _686 = _684;
        _688 = true;
    }
    else
    {
        _686 = _156;
    }
    _688 = false;
    float _690 = _686;
    float _692 = in.m_53.y;
    float _694 = _156 * (*spvDescriptorSet0.vp_c9)._m0[194].w;
    float _696 = in.m_53.z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _700 = in.m_53.x;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _706 = _704 != 0;
    float _708 = in.m_42.x;
    float _710 = in.m_42.y;
    float _712 = in.m_42.z;
    float _714 = _560 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _720 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _722 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _724 = _692 * 2.0;
    float _726 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _720);
    float _728 = fma(_722, -2.0, _698);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _732 = floor(_724);
    float _734 = _700 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _736 = (*spvDescriptorSet0.vp_c8)._m0[0].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _738 = _710 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _740 = _710 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _742 = fma((*spvDescriptorSet0.vp_c8)._m0[0].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _736);
    float _744 = _696 * 2.0;
    float _746 = _710 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _748 = -_702;
    float _750 = fma(_734, 2.0, _748);
    float _752 = _700 * 2.0;
    float _754 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[4].x, _738);
    float _756 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[5].x, _740);
    float _758 = floor(_744);
    float _760 = fma(_708, (*spvDescriptorSet0.vp_c10)._m0[6].x, _746);
    float _762 = _700 + _692;
    float _764 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[5].z, _756);
    float _766 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[6].z, _760);
    float _768 = _762 + (-1.0);
    float _770 = _692 + _696;
    float _772 = floor(_752);
    float _774 = _760;
    float _776 = _690;
    if (!_706)
    {
        _774 = _692;
    }
    float _778 = _774;
    float _780 = fma(_712, (*spvDescriptorSet0.vp_c10)._m0[4].z, _754);
    float _782 = _770 + (-1.0);
    float _784 = _778;
    float _786 = _782;
    if (_706)
    {
        _784 = _700;
    }
    float _788 = _784;
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _792 = _732 > 0.0;
    float _794 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _726);
    bool _796 = _758 > 0.0;
    float _798 = _700 + _696;
    bool _800 = _758 >= 0.0;
    bool _802 = isnan(_758);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    float _810 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _812 = int(_810);
    float _814 = _798 + (-1.0);
    bool _816 = _732 >= 0.0;
    bool _818 = isnan(_732);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    float _826 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _728);
    bool _828 = _772 > 0.0;
    float _830 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _832 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _834 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    if (!_706)
    {
        _786 = _696;
    }
    float _836 = _786;
    float _838 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _840 = int(_838);
    float _842 = _836;
    if (_706)
    {
        _842 = _692;
    }
    float _844 = _842;
    float _846 = fma(_788, (*spvDescriptorSet0.vp_c9)._m0[83].z, _832);
    float _848 = _788 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _850 = _772 >= 0.0;
    bool _852 = isnan(_772);
    bool _854 = _850 || _852;
    bool _856 = isnan(0.0);
    bool _858 = _854 || _856;
    float _860 = _764 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _862 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[83].w, _716);
    float _864 = _844;
    if (!_706)
    {
        _864 = _696;
    }
    float _866 = _864;
    float _868 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _870 = log2(_868);
    float _872 = _866;
    if (_706)
    {
        _872 = _692;
    }
    float _874 = _872;
    float _876 = -_730;
    float _878 = fma(_848, 2.0, _876);
    float _880 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].w, _862);
    float _882 = _874 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _884 = fma((*spvDescriptorSet0.vp_c8)._m0[0].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _742);
    int _886 = _858 ? 0 : 1;
    float _888 = fma(_882, -2.0, _718);
    int _890 = _808 ? 0 : 1;
    float _892 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _894 = ~_886;
    int _896 = _894 + 1;
    int _898 = _896 + 1;
    float _900 = rsqrt(_794);
    int _902 = ~_890;
    int _904 = _902 + 1;
    int _906 = _904 + 1;
    float _908 = _870 * _100;
    int _910 = _906;
    int _912 = _898;
    if (!_796)
    {
        int _914 = ~_890;
        int _916 = _914 + 1;
        _910 = _916;
    }
    int _918 = _910;
    float _920 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].w, _892);
    bool _922 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _924 = isnan(0.0);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _930 = _926 || _928;
    float _932 = -_100;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[76].x, _750);
    if (!_828)
    {
        int _936 = ~_886;
        int _938 = _936 + 1;
        _912 = _938;
    }
    int _940 = _912;
    float _942 = exp2(_908);
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _946 = _824 ? 0 : 1;
    float _948 = _780 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _950 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _952 = _950 != 0;
    int _954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _956 = _954 != 0;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _960 = _958 != 0;
    float _962 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _964 = 1.0 + _962;
    bool _966 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _968 = isnan(1.0);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _974 = _970 || _972;
    float _976 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[78].z, _944);
    int _978 = ~_946;
    int _980 = _978 + 1;
    int _982 = _980 + 1;
    float _984 = _860 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _986 = !_956;
    int _988 = _986 ? 0 : 1;
    float _990 = 1.0 / _964;
    bool _992 = !_952;
    int _994 = _992 ? 0 : 1;
    float _996 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _976);
    bool _998 = !_960;
    int _1000 = _998 ? 0 : 1;
    float _1002 = -_942;
    float _1004 = _1002 + 1.0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1016 = _1014 != 0;
    float _1018 = _766 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1020 = _982;
    if (!_792)
    {
        int _1022 = ~_946;
        int _1024 = _1022 + 1;
        _1020 = _1024;
    }
    int _1026 = _1020;
    float _1028 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _984);
    float _1030 = float(_812);
    bool _1032 = !_1012;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = in.m_57.x;
    float _1038 = in.m_57.y;
    float _1040 = in.m_57.z;
    bool _1042 = !_1008;
    int _1044 = _1042 ? 0 : 1;
    float _1046 = 1.0 / _1030;
    int _1048 = abs(_1034);
    float _1050 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1028);
    int _1052 = abs(_1044);
    float _1054 = -_100;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[81].x, _878);
    float _1058 = float(_840);
    float _1060 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _920);
    float _1062 = _930 ? _1004 : 0.0;
    float _1064 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[82].z, _846);
    float _1066 = _1058 * _100;
    float _1068 = float(_940);
    float _1070 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[81].y, _888);
    float _1072 = float(_1052);
    float _1074 = _1046 * _100;
    float _1076 = float(_918);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[194].z + _1078;
    float _1082 = float(_1048);
    if (_974)
    {
        float _1084 = _1062 * _990;
        _110 = _1084;
    }
    float _1086 = _110;
    bool _1088 = !_1016;
    int _1090 = _1088 ? 0 : 1;
    float _1092 = _1072 * _1076;
    float _1094 = float(_1026);
    float _1096 = _1082 * _1068;
    int _1098 = abs(_1090);
    float _1100 = _900 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1102 = _1092 * (-2.0);
    float _1104 = _1096 * (-2.0);
    float _1106 = _900 * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1108 = _1100 * _1100;
    float _1110 = fma(_1102, _1036, _1036);
    float _1112 = _700 + (-0.5);
    float _1114 = float(_1098);
    float _1116 = fma(_1104, _1038, _1038);
    float _1118 = fma(_1106, _1106, _1108);
    float _1120 = _692 + (-0.5);
    float _1122 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1110);
    float _1124 = _1114 * _1094;
    float _1126 = fma(_790, _1102, _790);
    float _1128 = fma(_834, _1104, _834);
    float _1130 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1116);
    float _1132 = _1124 * (-2.0);
    float _1134 = fma(_1126, _1086, _1122);
    float _1136 = _884 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1138 = fma(_1128, _1086, _1130);
    float _1140 = in.m_59.x;
    float _1142 = in.m_59.y;
    float _1144 = in.m_59.z;
    float _1146 = fma(_830, _1132, _830);
    float _1148 = fma(_1132, _1040, _1040);
    float _1150 = _696 + (-0.5);
    float _1152 = _1138 * 0.15915493667125701904296875;
    float _1154 = _1050 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1156 = 1.0 / _1080;
    float _1158 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1148);
    float _1160 = _900 * (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1162 = -_1154;
    float _1164 = _1136 + _1162;
    float _1166 = fma(_1146, _1086, _1158);
    bool _1168 = _1154 >= _1136;
    bool _1170 = isnan(_1154);
    bool _1172 = _1168 || _1170;
    bool _1174 = isnan(_1136);
    bool _1176 = _1172 || _1174;
    float _1178 = fma(_1160, _1160, _1118);
    float _1180 = abs(_1164);
    float _1182 = precise::max(_1180, (*spvDescriptorSet0.vp_c9)._m0[194].y);
    float _1184 = _1166 * 0.15915493667125701904296875;
    float _1186 = _1134 * 0.15915493667125701904296875;
    float _1188 = _456 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1190 = precise::min(_1182, (*spvDescriptorSet0.vp_c9)._m0[194].z);
    float _1192 = rsqrt(_1178);
    bool _1194 = !_1176;
    float _1196 = _1194 ? 1.0 : (-1.0);
    float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[194].y;
    float _1200 = _1190 + _1198;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1142);
    float _1204 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1140);
    float _1206 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1144);
    float _1208 = _1184 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1200 * _1156;
    float _1214 = _1188 * _1202;
    float _1216 = _458 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1218 = _714 * _1204;
    float _1220 = _1196 * _1212;
    float _1222 = _1216 * _1206;
    float _1224 = _1186 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = _694 * _1220;
    float _1230 = _1106 * _1192;
    float _1232 = _1100 * _1192;
    float _1234 = _1160 * _1192;
    float _1236 = _1228 * 0.15915493667125701904296875;
    float _1238 = _1186 * 6.283185482025146484375;
    float _1240 = cos(_1238);
    float _1242 = _1210 * _1214;
    float _1244 = _1152 * 6.283185482025146484375;
    float _1246 = sin(_1244);
    float _1248 = _1152 * 6.283185482025146484375;
    float _1250 = cos(_1248);
    float _1252 = _1184 * 6.283185482025146484375;
    float _1254 = sin(_1252);
    float _1256 = _1226 * _1246;
    float _1258 = _1240 * _1246;
    float _1260 = _1246 * _1210;
    float _1262 = _1240 * _1250;
    float _1264 = _1226 * _1250;
    float _1266 = _1250 * _1210;
    float _1268 = _1240 * _1242;
    float _1270 = _1236 * 6.283185482025146484375;
    float _1272 = cos(_1270);
    float _1274 = _1226 * _1242;
    float _1276 = fma(_1254, _1262, _1256);
    float _1278 = -_1258;
    float _1280 = fma(_1254, _1264, _1278);
    float _1282 = -_1264;
    float _1284 = fma(_1254, _1258, _1282);
    float _1286 = -_1214;
    float _1288 = _1254 * _1286;
    float _1290 = fma(_1276, _1218, _1268);
    float _1292 = fma(_1254, _1256, _1262);
    float _1294 = _1236 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    float _1298 = fma(_1266, _1218, _1288);
    float _1300 = fma(_1284, _1222, _1290);
    float _1302 = fma(_1280, _1218, _1274);
    float _1304 = _1234 * _1234;
    float _1306 = fma(_1260, _1222, _1298);
    float _1308 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1310 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1312 = _1300 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1314 = fma(_1292, _1222, _1302);
    float _1316 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1308);
    float _1318 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1310);
    float _1320 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1312);
    float _1322 = -_1272;
    float _1324 = _1322 + 1.0;
    float _1326 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1316);
    float _1328 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1318);
    float _1330 = _1230 * _1296;
    float _1332 = _1232 * _1324;
    float _1334 = _1232 * _1296;
    float _1336 = fma(_1324, _1304, _1272);
    float _1338 = _1234 * _1296;
    float _1340 = _1230 * _1324;
    float _1342 = fma(_1234, _1332, _1330);
    float _1344 = _1328 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1346 = _1326 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1348 = -_1338;
    float _1350 = fma(_1232, _1340, _1348);
    float _1352 = -_1334;
    float _1354 = fma(_1234, _1340, _1352);
    float _1356 = _1344 * _1342;
    float _1358 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1320);
    float _1360 = fma(_1230, _1340, _1272);
    float _1362 = _1344 * _1350;
    float _1364 = fma(_1346, _1354, _1356);
    float _1366 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1368 = fma(_1232, _1332, _1272);
    float _1370 = fma(_1346, _1360, _1362);
    float _1372 = fma(_1234, _1340, _1334);
    float _1374 = fma(_1366, _1336, _1364);
    float _1376 = fma(_1232, _1340, _1338);
    float _1378 = _1344 * _1368;
    float _1380 = fma(_1366, _1372, _1370);
    float _1382 = _1018 + _1374;
    float _1384 = -_1330;
    float _1386 = fma(_1234, _1332, _1384);
    float _1388 = fma(_1346, _1376, _1378);
    float _1390 = _948 + _1380;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1394 = _1382 + _1392;
    float _1396 = fma(_1366, _1386, _1388);
    float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1400 = _1390 + _1398;
    float _1402 = _1394 * _1394;
    float _1404 = _860 + _1396;
    float _1406 = fma(_1400, _1400, _1402);
    float _1408 = sqrt(_1406);
    bool _1410 = _1408 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = _1386;
    float _1414 = _1340;
    float _1416 = _1376;
    if (!_1410)
    {
        _1412 = _1390;
    }
    float _1418 = _1412;
    float _1420 = _1418;
    if (!_1410)
    {
        _1414 = _1382;
    }
    float _1422 = _1414;
    float _1424 = _1422;
    if (!_1410)
    {
        _1416 = _1404;
    }
    float _1426 = _1416;
    bool _1428 = !_1410;
    float _1430 = _1426;
    if (!_1428)
    {
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1436 = _1408 + _1434;
        float _1438 = _1404 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1440 = rsqrt(_1406);
        float _1442 = _1436 * _1432;
        float _1444 = _1442 * 0.15915493667125701904296875;
        float _1446 = _1444 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        float _1450 = _1444 * 6.283185482025146484375;
        float _1452 = sin(_1450);
        float _1454 = _1448 + (-1.0);
        float _1456 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1458 = fma(_1452, _1438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1460 = fma(_1404, _1448, _1456);
        float _1462 = _1440 * _1458;
        float _1464 = fma(_1400, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1466 = fma(_1394, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1430 = _1460;
        _1420 = _1464;
        _1424 = _1466;
    }
    float _1468 = _1430;
    float _1470 = _1420;
    float _1472 = _1424;
    float _1474 = -_860;
    float _1476 = _1474 + _1468;
    float _1478 = -_948;
    float _1480 = _1478 + _1470;
    float _1482 = -_1018;
    float _1484 = _1482 + _1472;
    float _1486 = _860 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1488 = _1476 * _1476;
    float _1490 = _860 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1492 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1486);
    float _1494 = fma(_1480, _1480, _1488);
    float _1496 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1490);
    float _1498 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1492);
    float _1500 = fma(_1484, _1484, _1494);
    float _1502 = fma(_1018, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1496);
    float _1504 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1506 = sqrt(_1500);
    bool _1508 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1510 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan(0.5);
    bool _1516 = _1512 || _1514;
    float _1518 = _1502 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1520 = _1518 + _1504;
    float _1522 = 1.0 / _1504;
    bool _1524 = _1506 > 0.0;
    float _1526 = _1506;
    float _1528 = _1468;
    float _1530 = _1470;
    float _1532 = _1472;
    float _1534 = _1480;
    float _1536 = _1518;
    if (_1516)
    {
        _1526 = 1.0;
    }
    float _1538 = _1526;
    float _1540 = _1520 * _1522;
    float _1542 = _1540 * 0.5;
    bool _1544 = !_1524;
    float _1546 = _1538;
    if (!_1544)
    {
        float _1548 = _172 * _172;
        float _1550 = rsqrt(_1500);
        float _1552 = fma(_170, _170, _1548);
        float _1554 = fma(_174, _174, _1552);
        float _1556 = sqrt(_1554);
        float _1558 = _1476 * _1550;
        float _1560 = _1484 * _1550;
        bool _1562 = _1556 > 0.0;
        float _1564 = _1480 * _1550;
        bool _1566 = !_1562;
        if (!_1566)
        {
            float _1568 = rsqrt(_1554);
            float _1570 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1572 = _172 * _1568;
            float _1574 = _170 * _1568;
            float _1576 = _1558 * _1572;
            float _1578 = _174 * _1568;
            float _1580 = fma(_1564, _1574, _1576);
            float _1582 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1584 = fma(_1560, _1578, _1580);
            float _1586 = _1584 * _1582;
            float _1588 = fma(_170, _1586, _1470);
            float _1590 = fma(_172, _1586, _1468);
            float _1592 = fma(_174, _1586, _1472);
            _1528 = _1590;
            _1530 = _1588;
            _1532 = _1592;
            _1534 = _1582;
        }
    }
    float _1594 = _1528;
    float _1596 = _1530;
    float _1598 = _1532;
    float _1600 = _1534;
    float _1602 = _1600;
    if (!_1516)
    {
        float _1604 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1608 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1606);
        float _1610 = _1604 * 0.15915493667125701904296875;
        float _1612 = _1610 * 6.283185482025146484375;
        float _1614 = cos(_1612);
        float _1616 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1618 = _1616 * 0.15915493667125701904296875;
        float _1620 = _1610 * 6.283185482025146484375;
        float _1622 = sin(_1620);
        float _1624 = 1.0 / _1614;
        float _1626 = _1618 * 6.283185482025146484375;
        float _1628 = cos(_1626);
        float _1630 = _1622 * _1624;
        float _1632 = 1.0 / _1608;
        float _1634 = _1628 * _1630;
        float _1636 = _1618 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1642 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1640;
        float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1646 = _1632 * _1644;
        float _1648 = 1.0 / _1634;
        float _1650 = 1.0 / _1642;
        float _1652 = _1638 * _1648;
        float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1656 = fma(_1652, _1646, _1654);
        float _1658 = _1656 * _1650;
        float _1660 = precise::clamp(_1658, 0.0, 1.0);
        _178 = _1618;
        _1602 = _1610;
        _180 = _1632;
        _1546 = _1660;
    }
    float _1662 = _178;
    float _1664 = _1602;
    float _1666 = _180;
    float _1668 = _1546;
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1672 = _1594 + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1676 = _1596 + _1674;
    float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1680 = _1598 + _1678;
    float _1682 = _1672 * _1672;
    float _1684 = fma(_1676, _1676, _1682);
    float _1686 = fma(_1680, _1680, _1684);
    float _1688 = rsqrt(_1686);
    float _1690 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1692 = _1676 * _1690;
    float _1694 = _1680 * _1690;
    float _1696 = _1692 * _1692;
    float _1698 = _1694 * _1694;
    float _1700 = _1696 + _1698;
    float _1702 = sqrt(_1700);
    bool _1704 = _1702 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1706 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1708 = _1702 + _1706;
    float _1710 = _1662;
    float _1712 = _1708;
    float _1714 = _1664;
    float _1716 = _1672;
    float _1718 = _1692;
    if (_1704)
    {
        float _1720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1710 = _1720;
    }
    float _1722 = _1710;
    float _1724 = _1722;
    if (_1704)
    {
        float _1726 = _1708 * _1722;
        _1712 = _1726;
    }
    float _1728 = _1712;
    if (_1704)
    {
        float _1730 = rsqrt(_1700);
        _1724 = _1730;
    }
    float _1732 = _1724;
    float _1734 = _1732;
    if (_1704)
    {
        float _1736 = _1728 * 0.15915493667125701904296875;
        _1714 = _1736;
    }
    float _1738 = _1714;
    float _1740 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1742 = _1680;
    if (_1704)
    {
        float _1744 = _1738 * 6.283185482025146484375;
        float _1746 = sin(_1744);
        _1742 = _1746;
    }
    float _1748 = _1742;
    float _1750 = precise::max(0.0, _1740);
    float _1752 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1754 = _1666;
    float _1756 = _1750;
    if (_1704)
    {
        float _1758 = _1738 * 6.283185482025146484375;
        float _1760 = cos(_1758);
        _1754 = _1760;
    }
    float _1762 = _1754;
    float _1764 = -_1690;
    float _1766 = -_1750;
    float _1768 = fma(_1672, _1764, _1766);
    if (_1704)
    {
        float _1770 = _1768 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1716 = _1770;
    }
    float _1772 = _1716;
    float _1774 = sqrt(_1686);
    float _1776 = _1748;
    float _1778 = _1772;
    if (_1704)
    {
        float _1780 = fma(_1748, _1772, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1776 = _1780;
    }
    float _1782 = _1776;
    float _1784 = _1782;
    if (!_1704)
    {
        _1778 = _1768;
    }
    float _1786 = _1778;
    float _1788 = _1786;
    if (_1704)
    {
        float _1790 = _1732 * _1782;
        _1536 = _1790;
    }
    float _1792 = _1536;
    if (!_1704)
    {
        _1784 = _1696;
    }
    float _1794 = _1784;
    float _1796 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1798 = _1794;
    float _1800 = _1762;
    if (_1704)
    {
        float _1802 = _1762 + (-1.0);
        _1756 = _1802;
    }
    float _1804 = _1756;
    float _1806 = _1804;
    if (_1704)
    {
        float _1808 = _1692 * _1792;
        _1718 = _1808;
    }
    float _1810 = _1718;
    float _1812 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1796);
    if (_1704)
    {
        float _1814 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1734 = _1814;
    }
    float _1816 = _1734;
    if (!_1704)
    {
        _1806 = _1694;
    }
    float _1818 = _1806;
    float _1820 = _1818;
    if (_1704)
    {
        float _1822 = _1694 * _1792;
        _1820 = _1822;
    }
    float _1824 = _1820;
    if (_1704)
    {
        float _1826 = _1810 * _1810;
        _1798 = _1826;
    }
    float _1828 = _1798;
    if (_1704)
    {
        float _1830 = fma(_1768, _1762, _1816);
        _1788 = _1830;
    }
    float _1832 = _1788;
    if (!_1704)
    {
        _1800 = _1698;
    }
    float _1834 = _1800;
    float _1836 = _1834;
    if (_1704)
    {
        float _1838 = _1824 * _1824;
        _1836 = _1838;
    }
    float _1840 = _1836;
    float _1842 = fma(_1832, _1832, _1828);
    float _1844 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1812);
    float _1846 = _1842 + _1840;
    float _1848 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1852 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1850);
    float _1854 = precise::clamp(_1852, 0.0, 1.0);
    float _1856 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1858 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1848);
    float _1860 = rsqrt(_1846);
    float _1862 = -_1854;
    float _1864 = _1862 + 1.0;
    float _1866 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1856);
    float _1868 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1858);
    float _1870 = _1594 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1872 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1866);
    float _1874 = _1868 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1876 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1870);
    float _1878 = abs(_1864);
    float _1880 = log2(_1878);
    float _1882 = _1872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1884 = _1874 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1886 = fma(_1598, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1876);
    float _1888 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1890 = -_1884;
    float _1892 = fma(_1890, _1752, 1.0);
    float _1894 = _1860 * _1810;
    float _1896 = _1860 * _1832;
    float _1898 = _1886 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1900 = _1860 * _1824;
    float _1902 = _1894 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1904 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1906 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1888);
    float _1908 = log2(_1892);
    float _1910 = -_1902;
    float _1912 = fma(_1896, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1910);
    float _1914 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1916 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1906);
    float _1918 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1920 = -_1900;
    float _1922 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1912);
    float _1924 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1926 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1916);
    float _1928 = exp2(_1914);
    float _1930 = fma(_1922, -0.5, 0.5);
    float _1932 = fma(_1922, 0.5, 0.5);
    float _1934 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1924);
    float _1936 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1918);
    float _1938 = _1896 + 1.0;
    float _1940 = fma(_1932, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1942 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1934);
    float _1944 = 1.0 / _1926;
    float _1946 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1936);
    float _1948 = fma(_1932, _1940, -0.212114393711090087890625);
    float _1950 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1942);
    float _1952 = _1908 * 0.693147182464599609375;
    float _1954 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1946);
    float _1956 = fma(_1932, _1948, 1.570728778839111328125);
    float _1958 = sqrt(_1930);
    float _1960 = -_1896;
    float _1962 = fma(_1928, _1938, _1960);
    float _1964 = _1952 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1966 = fma(_1962, 0.5, 0.5);
    float _1968 = _1950 * _1944;
    float _1970 = _1954 * _1944;
    float _1972 = fma(_1968, 0.5, 0.5);
    float _1974 = fma(_1970, -0.5, 0.5);
    float _1976 = _1958 * 0.636619746685028076171875;
    float _1978 = -_1956;
    float _1980 = fma(_1976, _1978, 1.0);
    float3 _5779 = float3(_1972, _1974, _1964);
    float _1982 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5779, float3(0.0), isnan(_5779)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5779, float3(0.0), isnan(_5779)), level(0.0)).x;
    float3 _5790 = float3(_1972, _1974, _1964);
    float4 _1985 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5790, float3(0.0), isnan(_5790)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5790, float3(0.0), isnan(_5790)), level(0.0)).xyzw;
    float _1987 = _1985.x;
    float _1989 = _1985.y;
    float _1991 = _1985.z;
    float _1993 = _1985.w;
    float2 _5807 = float2(_1980, _1966);
    float3 _1997 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5807, float2(0.0), isnan(_5807)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5807, float2(0.0), isnan(_5807)), level(0.0)).xyz;
    float _1999 = _1997.x;
    float _2001 = _1997.y;
    float _2003 = _1997.z;
    float _2005 = float(uint(_840));
    float _2007 = trunc(_1074);
    int _2009 = int(_2007);
    int _2011 = ~_840;
    int _2013 = _2011 + 1;
    float _2015 = _1066 * _152;
    int _2017 = abs(_988);
    out.m_61.x = _658;
    out.m_61.y = _660;
    out.m_61.z = _662;
    out.m_61.w = _666;
    float _2019 = _1880 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2021 = _1882 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2023 = 1.0 / _2005;
    float _2025 = in.m_63.x;
    float _2027 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2021);
    bool _2029 = !_706;
    float _2031 = _2029 ? 7.345489978790283203125 : 1.0;
    out.m_65.x = _1596;
    out.m_65.y = _1594;
    out.m_65.z = _1598;
    float _2033 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2027);
    float _2035 = float(uint(_2009));
    float _2037 = trunc(_2015);
    int _2039 = int(_2037);
    float _2041 = _2031 * _700;
    float _2043 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2045 = _690 + _2043;
    float _2047 = fma(_1904, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2033);
    int _2049 = as_type<int>(_2023) + (-2);
    float _2051 = floor(_2041);
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2053;
    out.gl_Position.x = _1950;
    out.gl_Position.y = _1954;
    out.gl_Position.z = _2047;
    out.gl_Position.w = _1926;
    float _2057 = as_type<float>(_2049) * _2035;
    float _2059 = trunc(_2057);
    float _2061 = precise::max(_2059, 0.0);
    uint _2064 = uint(_2061);
    float _2066 = exp2(_2019);
    int _2068 = ~_840;
    int _2070 = _2068 + 1;
    int _2072 = _2013 * int(_2064);
    int _2074 = _2072 + _2009;
    float _2076 = float(uint(_2074));
    float _2078 = -_2066;
    float _2080 = _2078 + 1.0;
    float _2082 = as_type<float>(_2049) * _2076;
    float _2084 = trunc(_2082);
    float _2086 = precise::max(_2084, 0.0);
    uint _2088 = uint(_2086);
    int _2090 = int(_2064) + int(_2088);
    float _2092 = float(_2009);
    int _2094 = _2070 * _2090;
    int _2096 = _2094 + _2009;
    bool _2098 = _2092 >= _1058;
    bool _2100 = isnan(_2092);
    bool _2102 = _2098 || _2100;
    bool _2104 = isnan(_1058);
    bool _2106 = _2102 || _2104;
    float _2108 = float(_2106);
    bool _2110 = uint(_2096) >= uint(_840);
    float _2112 = -_2051;
    float _2114 = _2041 + _2112;
    float _2116 = trunc(_2108);
    int _2118 = int(_2116);
    bool _2120 = !_2110;
    int _2122 = _2120 ? 0 : (-1);
    float _2124 = _2114 * _1058;
    bool _2126 = _840 == 0;
    int _2128 = ~_2090;
    int _2130 = _2128 + _2122;
    int _2132 = _2130 + 1;
    int _2134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2136 = _2134 != 0;
    float _2138 = trunc(_2124);
    int _2140 = int(_2138);
    int _2142 = _840 + (-1);
    int _2144 = _840 * _2132;
    int _2146 = _2144 + _2009;
    bool _2148 = !_2136;
    int _2150 = _2148 ? 0 : 1;
    int _2152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2154 = _2152 != 0;
    int _2156 = ~_2118;
    int _2158 = _2156 + 1;
    int _2160 = _2158 + 1;
    bool _2162 = !_2126;
    int _2164 = _2162 ? _2146 : (-1);
    int _2166 = abs(_2150);
    int _2168 = abs(_994);
    int _2170 = _2164 * _2160;
    bool _2172 = !_2154;
    int _2174 = _2172 ? 0 : 1;
    int _2176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2178 = _2176 != 0;
    int _2180 = _2118 * _2142;
    int _2182 = _2180 + _2170;
    int _2184 = abs(_1000);
    int _2186 = _2182 * _2017;
    int _2188 = _2140 * _2166;
    int _2190 = _2188 + _2009;
    int _2192 = abs(_2174);
    int _2194 = _2039 * _2168;
    int _2196 = _2194 + _2186;
    int _2198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2200 = _2198 != 0;
    int _2202 = _2190 * _2184;
    int _2204 = _2202 + _2196;
    int _2206 = ~_840;
    int _2208 = _2206 + 1;
    int _2210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2212 = _2210 != 0;
    int _2214 = _2140 * _2192;
    int _2216 = _2214 + _2204;
    int _2218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2220 = _2218 != 0;
    float _2222 = in.m_53.w;
    float _2224 = float(uint(_2216));
    float _2226 = as_type<float>(_2168);
    bool _2228 = _2220;
    if (!_2200)
    {
        _2226 = _2025;
    }
    float _2230 = _2226;
    float _2232 = as_type<float>(_2049) * _2224;
    float _2234 = trunc(_2232);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    int _2240 = ~_840;
    int _2242 = _2240 + 1;
    bool _2244 = _2222 > 0.5;
    int _2246 = _2208 * int(_2238);
    int _2248 = _2246 + _2216;
    float _2250 = float(uint(_2248));
    float _2252 = in.m_63.y;
    float _2254 = as_type<float>(_2049) * _2250;
    float _2256 = trunc(_2254);
    float _2258 = precise::max(_2256, 0.0);
    uint _2260 = uint(_2258);
    int _2262 = int(_2238) + int(_2260);
    float _2264 = -_2252;
    float _2266 = _2264 + 1.0;
    int _2268 = _2242 * _2262;
    int _2270 = _2268 + _2216;
    bool _2272 = uint(_2270) >= uint(_840);
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2276 = _2274 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2278 = !_2272;
    int _2280 = _2278 ? 0 : (-1);
    float _2282 = 1.0 / _2276;
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2286 = _2284 != 0;
    int _2288 = ~_2262;
    int _2290 = _2288 + _2280;
    int _2292 = _2290 + 1;
    int _2294 = _2244 ? as_type<int>(_2266) : as_type<int>(_2252);
    bool _2296 = _692 > 0.5;
    int _2298 = _840 * _2292;
    int _2300 = _2298 + _2216;
    float _2302 = float(uint(_2190));
    float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2306 = _2220 ? as_type<float>(_2294) : _2252;
    bool _2308 = !_2126;
    int _2310 = _2308 ? _2300 : (-1);
    float _2312 = as_type<float>(_2049) * _2302;
    float _2314 = _2252;
    bool _2316 = _2286;
    float _2318 = _2230;
    int _2320 = _2292;
    if (_2286)
    {
        float _2322 = _2296 ? _2266 : _2252;
        _2314 = _2322;
    }
    float _2324 = _2314;
    float _2326 = _2055 * _2282;
    if (_2178)
    {
        bool _2328 = _696 > 0.5;
        _2316 = _2328;
    }
    bool _2330 = _2316;
    int _2332 = _2310 >> 31;
    float _2334 = trunc(_2312);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    if (_2200)
    {
        bool _2340 = _700 > 0.5;
        _2228 = _2340;
    }
    bool _2342 = _2228;
    float _2344 = fma(_2326, _2045, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2346 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2348 = isnan(_690);
    bool _2350 = _2346 || _2348;
    bool _2352 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2354 = _2350 || _2352;
    float _2356 = float(_2354);
    int _2358 = _2332 & 3;
    float _2360 = _2304 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _2362 = _690 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2364 = isnan(_690);
    bool _2366 = _2362 || _2364;
    bool _2368 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2370 = _2366 || _2368;
    float _2372 = float(_2370);
    float _2374 = -_2356;
    float _2376 = _2374 + 1.0;
    int _2378 = _2310 + _2358;
    float _2380 = fma(_2306, _2360, -0.5);
    int _2382 = ~_840;
    int _2384 = _2382 + 1;
    float _2386 = _2372 * _2376;
    int _2388 = _2378 >> 2;
    float _2390 = -_1070;
    float _2392 = fma(_880, _2380, _2390);
    int _2394 = as_type<int>(_2344);
    float _2396 = as_type<float>(_2388);
    if (!_2200)
    {
        _776 = _2230;
    }
    float _2398 = _776;
    int _2400 = _2384 * int(_2338);
    int _2402 = _2400 + _2190;
    int _2404 = _2388 << 4;
    int _2406 = _2404 + 368;
    float _2408 = _2344 * _2386;
    float _2410 = _2398;
    if (_2200)
    {
        _2318 = _2025;
    }
    float _2412 = _2318;
    uint _2414 = uint(int(uint(_2406) >> uint(2)));
    uint _2416 = uint(int(uint(int(_2414)) >> uint(2)));
    int _2418 = int(_2414) & 3;
    float _2420 = (*spvDescriptorSet0.vp_c9)._m0[int(_2416)][_2418];
    int _2422 = int(_2414) + 1;
    uint _2424 = uint(int(uint(_2422) >> uint(2)));
    int _2426 = _2422 & 3;
    float _2428 = (*spvDescriptorSet0.vp_c9)._m0[int(_2424)][_2426];
    float _2430 = float(uint(_2402));
    if (_2200)
    {
        float _2432 = -_2412;
        float _2434 = _2432 + 1.0;
        _2394 = as_type<int>(_2434);
    }
    int _2436 = _2394;
    if (_2178)
    {
        float _2438 = -_2412;
        float _2440 = _2438 + 1.0;
        _2320 = as_type<int>(_2440);
    }
    int _2442 = _2320;
    float _2444 = as_type<float>(_2049) * _2430;
    float _2446 = -_2372;
    float _2448 = _2446 + 1.0;
    if (_2200)
    {
        float _2450 = _2342 ? as_type<float>(_2436) : _2412;
        _2410 = _2450;
    }
    float _2452 = _2410;
    float _2454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2456 = _2406 + 8;
    uint _2458 = uint(int(uint(_2456) >> uint(2)));
    uint _2460 = uint(int(uint(int(_2458)) >> uint(2)));
    int _2462 = int(_2458) & 3;
    float _2464 = (*spvDescriptorSet0.vp_c9)._m0[int(_2460)][_2462];
    int _2466 = int(_2458) + 1;
    uint _2468 = uint(int(uint(_2466) >> uint(2)));
    int _2470 = _2466 & 3;
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[int(_2468)][_2470];
    float _2474 = fma((*spvDescriptorSet0.vp_c9)._m0[80].y, _2324, -0.5);
    int _2476 = _2310 & 3;
    bool _2478 = _2476 != 0;
    float _2480 = fma(_2448, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2408);
    if (!_2178)
    {
        _2396 = _2412;
    }
    float _2482 = _2396;
    float _2484 = -_826;
    float _2486 = fma(_1060, _2474, _2484);
    float _2488 = _2482;
    if (_2178)
    {
        float _2490 = _2330 ? as_type<float>(_2442) : _2412;
        _2488 = _2490;
    }
    float _2492 = _2488;
    float _2494 = trunc(_2444);
    float _2496 = precise::max(_2494, 0.0);
    uint _2498 = uint(_2496);
    bool _2500 = uint(_2476) > 1u;
    float _2502 = fma(_2356, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2480);
    int _2504 = _2310 & 3;
    bool _2506 = _2504 != 0;
    float _2508 = _2502 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _2510 = _2506 ? 0 : 1;
    float _2512 = _2454 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _2514 = _2476 != 3;
    float _2516 = fma(_2452, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2518 = ~_2510;
    int _2520 = _2518 + 1;
    int _2522 = _2520 + 1;
    float _2524 = fma(_2512, _2492, -0.5);
    bool _2526 = uint(_2476) >= 2u;
    float _2528 = fma(_996, _2516, _934);
    int _2530 = _2522;
    if (!_2500)
    {
        int _2532 = ~_2510;
        int _2534 = _2532 + 1;
        _2530 = _2534;
    }
    int _2536 = _2530;
    float _2538 = fma(_1064, _2524, _1056);
    int _2540 = _2526 ? 0 : 1;
    out.m_67.w = _2508;
    int _2542 = abs(_2536);
    bool _2544 = !_2478;
    int _2546 = _2544 ? 0 : 1;
    int _2548 = int(_2338) + int(_2498);
    int _2550 = ~_840;
    int _2552 = _2550 + 1;
    int _2554 = ~_2540;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    bool _2560 = _2476 != 3;
    int _2562 = _2552 * _2548;
    int _2564 = _2562 + _2190;
    int _2566 = _2558;
    if (_2514)
    {
        int _2568 = ~_2540;
        int _2570 = _2568 + 1;
        _2566 = _2570;
    }
    int _2572 = _2566;
    int _2574 = abs(_2546);
    int _2576 = ~_2542;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    bool _2582 = !_2560;
    int _2584 = _2582 ? 0 : (-1);
    int _2586 = _2580 * as_type<int>(_2428);
    bool _2588 = uint(_2564) >= uint(_840);
    int _2590 = abs(_2584);
    int _2592 = abs(_2572);
    int _2594 = ~_2574;
    int _2596 = _2594 + 1;
    int _2598 = _2596 + 1;
    bool _2600 = !_2588;
    int _2602 = _2600 ? 0 : (-1);
    int _2604 = _2598 * as_type<int>(_2420);
    int _2606 = _2604 + _2586;
    int _2608 = ~_2592;
    int _2610 = _2608 + 1;
    int _2612 = _2610 + 1;
    bool _2614 = !_2212;
    int _2616 = _2614 ? 0 : 1;
    int _2618 = ~_2548;
    int _2620 = _2618 + _2602;
    int _2622 = _2620 + 1;
    int _2624 = _2612 * as_type<int>(_2464);
    int _2626 = _2624 + _2606;
    int _2628 = ~_2590;
    int _2630 = _2628 + 1;
    int _2632 = _2630 + 1;
    float _2634 = _1668 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _2636 = abs(_2616);
    int _2638 = _840 * _2622;
    int _2640 = _2638 + _2190;
    float _2642 = _2486 + 0.5;
    int _2644 = _2632 * as_type<int>(_2472);
    int _2646 = _2644 + _2626;
    int _2648 = ~_2636;
    int _2650 = _2648 + 1;
    int _2652 = _2650 + 1;
    float _2654 = _2392 + 0.5;
    float _2656 = _2528 + 0.5;
    float _2658 = _2538 + 0.5;
    bool _2660 = !_2126;
    int _2662 = _2660 ? _2640 : (-1);
    int _2664 = _2646 * _2652;
    bool _2666 = _1668 > 0.0;
    bool _2668 = isnan(_1668);
    bool _2670 = _2666 || _2668;
    bool _2672 = isnan(0.0);
    bool _2674 = _2670 || _2672;
    out.m_69.x = _2656;
    out.m_69.y = _2642;
    out.m_69.z = _2658;
    out.m_69.w = _2654;
    int _2676 = _2662 * _2636;
    int _2678 = _2676 + _2664;
    float _2680 = _2047 + _1926;
    float _2682 = float(_2678);
    float _2684 = _2680 * 0.5;
    out.m_71.x = _2682;
    float _2686 = _2080 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2688 = _2634 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_73.z = _2684;
    out.m_73.w = _1926;
    float _2690 = _2686 * _1982;
    float _2692 = -_2686;
    float _2694 = _2692 + 1.0;
    out.m_49.x = _2688;
    float _2696 = _1993 * _2690;
    float _2698 = _2003 * _2690;
    float _2700 = _1993 * _2694;
    float _2702 = fma(_1999, _2696, _1987);
    float _2704 = fma(_2001, _2696, _1989);
    float _2706 = fma(_1993, _2698, _1991);
    out.m_75.x = _2702;
    out.m_75.y = _2704;
    out.m_75.z = _2706;
    out.m_75.w = _2700;
    if (_2674)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2708 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2708;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

