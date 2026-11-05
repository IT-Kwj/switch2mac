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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_77 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_69 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2271 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2569 = as_type<float>(_122);
        out.gl_Position.z = _2569;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _146;
    float _158 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _162 = _160 * 5.0;
        _124 = as_type<int>(_162);
    }
    int _164 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2642 = as_type<float>(_164);
        out.gl_Position.z = _2642;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = in.m_53.y;
    float _168 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_55.w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = in.m_44.x;
    float _190 = in.m_44.y;
    float _192 = in.m_44.z;
    float _194 = 0.0;
    float _196 = _168;
    if (!_180)
    {
        float _198 = _168 * _168;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    out.m_57.y = _166;
    bool _210 = !_180;
    float _212 = _208;
    float _214 = _166;
    if (!_210)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _168 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _168);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _244;
    }
    float _246 = _212;
    bool _248 = !_180;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _168 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _196 = _268;
    }
    float _270 = _196;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _274 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _280 = fma(_270, _182, _274);
    float _282 = fma(_270, _184, _276);
    float _284 = fma(_270, _186, _278);
    float _286 = fma(_280, _170, _188);
    float _288 = fma(_282, _170, _190);
    float _290 = fma(_284, _170, _192);
    bool _292 = !_272;
    float _310;
    if (!_292)
    {
        float _294 = in.m_59.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _146;
    }
    _312 = false;
    float _314 = _310;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _314 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _314 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = _314 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = 1.0 / _330;
    bool _346 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_314);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    bool _358 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_314);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = 1.0 / _334;
    float _372 = -_368;
    float _374 = _372 + 1.0;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _378 = 1.0 / _342;
    float _380 = _318 * _344;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _384 = _314 + _382;
    float _386 = 1.0 / _338;
    float _388 = _322 * _370;
    bool _390 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _392 = isnan(_314);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -_400;
    float _404 = _402 + 1.0;
    float _406 = _384 * _378;
    bool _408 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _410 = isnan(_314);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _420;
    float _424 = _418 * _404;
    float _426 = _326 * _386;
    bool _428 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _430 = isnan(_314);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -_418;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _448;
    float _452 = fma(_422, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = _438 * _442;
    float _456 = -_438;
    float _458 = _456 + 1.0;
    float _460 = fma(_446, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _462 = fma(_450, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _464 = -_356;
    float _466 = _464 + 1.0;
    float _468 = _356 * _458;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _482 = _368 * _466;
    float _484 = fma(_472, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _486 = fma(_476, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _488 = fma(_480, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _490 = _462 * _482;
    float _492 = _460 * _482;
    float _494 = _452 * _482;
    float _496 = in.m_55.x;
    float _498 = in.m_55.y;
    float _500 = in.m_55.z;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _502;
    float _506 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _490);
    float _508 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _492);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _514;
    float _518 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _494);
    float _520 = fma(_504, _426, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _522 = fma(_486, _468, _506);
    float _524 = fma(_484, _468, _508);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _534 = fma(_512, _426, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _536 = fma(_516, _426, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _542 = fma(_488, _468, _518);
    float _544 = fma(_528, _406, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _546 = fma(_532, _406, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _548 = fma(_540, _406, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _550 = fma(_534, _454, _524);
    float _552 = fma(_536, _454, _522);
    float _554 = fma(_520, _454, _542);
    float _556 = fma(_544, _424, _550);
    float _558 = fma(_546, _424, _552);
    float _560 = fma(_548, _424, _554);
    float _562 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[147].x, _556);
    float _564 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[147].y, _558);
    float _566 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[147].z, _560);
    float _568 = _562 * _496;
    float _570 = _564 * _498;
    float _572 = _566 * _500;
    bool _574 = !_376;
    if (!_574)
    {
        float _576 = in.m_59.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _156 = _590;
    }
    float _592 = _156;
    float _594 = in.m_59.z;
    float _596 = in.m_59.y;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _600 = _598 != 0;
    float _602 = in.m_59.x;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _618 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _620 = precise::max(_616, _618);
    bool _622 = _620 >= 16.0;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _626 = _594 * 2.0;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _630 = _596 * 2.0;
    float _632 = _596 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _634 = floor(_626);
    bool _636 = !_614;
    int _638 = _636 ? 0 : 1;
    float _640 = _602 * 2.0;
    float _642 = fma(_632, -2.0, _624);
    float _644 = _602 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _646 = !_610;
    int _648 = _646 ? 0 : 1;
    float _650 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _642);
    float _652 = floor(_630);
    float _654 = -_628;
    float _656 = fma(_644, 2.0, _654);
    float _658 = _602 + _596;
    float _660 = _658 + (-1.0);
    bool _662 = _634 > 0.0;
    float _664 = floor(_640);
    bool _666 = _634 >= 0.0;
    bool _668 = isnan(_634);
    bool _670 = _666 || _668;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    float _676 = _602 + _594;
    float _678 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _680 = _674 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _682 = _676 + (-1.0);
    bool _684 = _652 >= 0.0;
    bool _686 = isnan(_652);
    bool _688 = _684 || _686;
    bool _690 = isnan(0.0);
    bool _692 = _688 || _690;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _696 = ~as_type<int>(_680);
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _704 = _700;
    float _706 = _652;
    float _708 = _680;
    float _710 = _682;
    float _712 = _592;
    if (!_662)
    {
        int _714 = ~as_type<int>(_680);
        int _716 = _714 + 1;
        _704 = _716;
    }
    int _718 = _704;
    bool _720 = _652 > 0.0;
    if (!_600)
    {
        _706 = _596;
    }
    float _722 = _706;
    float _724 = _722;
    if (!_600)
    {
        _708 = _594;
    }
    float _726 = _708;
    float _728 = _726;
    if (!_600)
    {
        _710 = _594;
    }
    float _730 = _710;
    bool _732 = !_606;
    int _734 = _732 ? 0 : 1;
    float _736 = _730;
    if (_600)
    {
        _724 = _602;
    }
    float _738 = _724;
    if (_600)
    {
        _728 = _596;
    }
    float _740 = _728;
    if (_600)
    {
        _736 = _596;
    }
    float _742 = _736;
    bool _744 = _664 > 0.0;
    float _746 = _740 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _748 = _664 >= 0.0;
    bool _750 = isnan(_664);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _762 = abs(_734);
    float _764 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[83].z, _758);
    float _766 = _738 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _768 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[83].w, _760);
    float _770 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _772 = log2(_770);
    float _774 = float(_718);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _778 = float(_762);
    float _780 = -_694;
    float _782 = fma(_766, 2.0, _780);
    int _784 = _756 ? 0 : 1;
    float _786 = fma(_746, -2.0, _776);
    int _788 = _692 ? 0 : 1;
    float _790 = _778 * _774;
    int _792 = ~_784;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    float _798 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _764);
    int _800 = _796;
    if (!_744)
    {
        int _802 = ~_784;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    float _808 = _790 * (-2.0);
    float _810 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _768);
    float _812 = _772 * _134;
    float _814 = in.m_61.x;
    float _816 = in.m_61.y;
    float _818 = in.m_61.z;
    int _820 = ~_788;
    int _822 = _820 + 1;
    int _824 = _822 + 1;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _828 = _824;
    if (!_720)
    {
        int _830 = ~_788;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = exp2(_812);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _840 = 1.0 + _838;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[78].z, _826);
    float _846 = -_134;
    float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[76].x, _656);
    bool _850 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _852 = isnan(1.0);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _858 = _854 || _856;
    float _860 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    int _862 = abs(_638);
    float _864 = 1.0 / _840;
    bool _866 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _874 = _870 || _872;
    float _876 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _860);
    int _878 = abs(_648);
    float _880 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _844);
    float _882 = float(_862);
    float _884 = float(_834);
    float _886 = -_836;
    float _888 = _886 + 1.0;
    float _890 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _786);
    float _892 = float(_806);
    float _894 = _882 * _884;
    float _896 = _874 ? _888 : 0.0;
    float _898 = -_134;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[81].x, _782);
    float _902 = _894 * (-2.0);
    bool _904 = _858;
    if (_858)
    {
        float _906 = _896 * _864;
        _158 = _906;
    }
    float _908 = _158;
    float _910 = float(_878);
    float _912 = fma(_808, _814, _814);
    float _914 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _916 = fma(_678, _808, _678);
    float _918 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _920 = _910 * _892;
    float _922 = _602 + (-0.5);
    float _924 = _622 ? _914 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _926 = _596 + _594;
    float _928 = _622 ? _918 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _930 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[196].x, _912);
    float _932 = abs(_924);
    bool _934 = _932 != 0.0;
    bool _936 = isnan(_932);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _920 * (-2.0);
    float _946 = abs(_928);
    bool _948 = _946 == 0.0;
    float _950 = fma(_916, _908, _930);
    float _952 = abs(_928);
    bool _954 = _952 == 0.0;
    bool _956 = !_942;
    bool _958 = _954 && _956;
    float _960 = in.m_63.x;
    float _962 = in.m_63.y;
    float _964 = in.m_63.z;
    float _966 = _950 * 0.15915493667125701904296875;
    float _968 = _926 + (-1.0);
    float _970 = fma(_702, _902, _702);
    float _972 = fma(_902, _818, _818);
    float _974 = _966 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = fma(_944, _816, _816);
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _982 = _594 + (-0.5);
    float _984 = _596 + (-0.5);
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].y);
    int _988 = as_type<int>(_908);
    bool _990 = _948;
    if (_958)
    {
        bool _992 = as_type<int>(_928) >= 0;
        _904 = _992;
    }
    bool _994 = _904;
    float _996 = fma(_980, _944, _980);
    float _998 = _966 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _978);
    float _1004 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[196].z, _972);
    int _1006 = _994 ? (-1) : 0;
    if (_958)
    {
        int _1008 = _994 ? 0 : 1078530011;
        _986 = _1008;
    }
    int _1010 = _986;
    float _1012 = fma(_996, _908, _1002);
    float _1014 = fma(_970, _908, _1004);
    if (_958)
    {
        int _1016 = int(0x80000000) & as_type<int>(_924);
        int _1018 = _1010 | _1016;
        _988 = _1018;
    }
    int _1020 = _988;
    bool _1022 = !_942;
    bool _1024 = _1022 && _948;
    int _1026 = _1020;
    float _1028 = as_type<float>(_1020);
    if (!_1024)
    {
        float _1030 = abs(_924);
        bool _1032 = _1030 != as_type<float>(0x7f800000u /* inf */);
        bool _1034 = isnan(_1030);
        bool _1036 = _1032 || _1034;
        bool _1038 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1040 = _1036 || _1038;
        float _1042 = abs(_928);
        bool _1044 = _1042 == as_type<float>(0x7f800000u /* inf */);
        float _1046 = abs(_928);
        bool _1048 = _1046 == as_type<float>(0x7f800000u /* inf */);
        bool _1050 = !_1040;
        bool _1052 = _1048 && _1050;
        _990 = _1044;
        if (_1052)
        {
            bool _1054 = as_type<int>(_928) >= 0;
            _1006 = _1054 ? (-1) : 0;
        }
        int _1056 = _1006;
        if (_1052)
        {
            _1026 = 1075235812;
        }
        int _1058 = _1026;
        int _1060 = _1058;
        if (_1052)
        {
            int _1062 = ~_1056;
            int _1064 = (_1062 != 0) ? _1058 : 1061752795;
            _1060 = _1064;
        }
        int _1066 = _1060;
        float _1068 = as_type<float>(_1066);
        if (_1052)
        {
            int _1070 = int(0x80000000) & as_type<int>(_924);
            int _1072 = _1066 | _1070;
            _1068 = as_type<float>(_1072);
        }
        float _1074 = _1068;
        bool _1076 = !_1040;
        bool _1078 = _1076 && _1044;
        _1028 = _1074;
        if (!_1078)
        {
            float _1080 = abs(_924);
            float _1082 = abs(_928);
            float _1084 = precise::max(_1080, _1082);
            float _1086 = abs(_924);
            float _1088 = abs(_928);
            float _1090 = precise::min(_1086, _1088);
            float _1092 = 1.0 / _1084;
            float _1094 = abs(_924);
            float _1096 = abs(_928);
            bool _1098 = _1094 > _1096;
            bool _1100 = as_type<int>(_928) >= 0;
            float _1102 = abs(_924);
            float _1104 = abs(_928);
            float _1106 = _1102 + _1104;
            int _1108 = as_type<int>(_924) & int(0x80000000);
            bool _1110 = _1106 > as_type<float>(0x7f800000u /* inf */);
            bool _1112 = isnan(_1106);
            bool _1114 = _1110 || _1112;
            bool _1116 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1118 = _1114 || _1116;
            float _1120 = _1090 * _1092;
            float _1122 = _1120 * _1120;
            float _1124 = _1122 + 11.33538818359375;
            float _1126 = fma(_1122, _1124, 28.84246826171875);
            float _1128 = fma(_1122, _1126, 19.6966705322265625);
            float _1130 = fma(_1122, -0.82336294651031494140625, -5.674867153167724609375);
            float _1132 = fma(_1122, _1130, -6.565555095672607421875);
            float _1134 = 1.0 / _1128;
            float _1136 = _1122 * _1132;
            float _1138 = _1120 * _1136;
            float _1140 = fma(_1138, _1134, _1120);
            float _1142 = _1140;
            _1028 = _1106;
            if (_1098)
            {
                float _1144 = -_1140;
                float _1146 = _1144 + 1.57079637050628662109375;
                _1142 = _1146;
            }
            float _1148 = _1142;
            int _1150 = as_type<int>(_1148);
            if (!_1100)
            {
                float _1152 = -_1148;
                float _1154 = _1152 + 3.1415927410125732421875;
                _1150 = as_type<int>(_1154);
            }
            int _1156 = _1150;
            if (!_1118)
            {
                int _1158 = _1108 | _1156;
                _1028 = as_type<float>(_1158);
            }
        }
    }
    float _1160 = _1028;
    bool _1162 = _990;
    float _1164 = _1012 + _1160;
    float _1166 = _1014 * 0.15915493667125701904296875;
    float _1168 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1170 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1172 = _1164 * 0.15915493667125701904296875;
    float _1174 = _1166 * 6.283185482025146484375;
    float _1176 = cos(_1174);
    float _1178 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1168);
    float _1180 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1182 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1184 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _964);
    float _1188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _962);
    float _1190 = _1172 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1178);
    float _1196 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1170);
    float _1198 = _1180 * _1186;
    float _1200 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _960);
    float _1204 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1196);
    float _1206 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1208 = _1172 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _976 * _1176;
    float _1214 = _1200 * _1202;
    float _1216 = _1204 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1218 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1220 = isnan(0.5);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1226 = _1222 || _1224;
    float _1228 = _1166 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1182 * _1188;
    float _1234 = _1000 * _1192;
    float _1236 = _1212 * _1232;
    float _1238 = _976 * _1210;
    float _1240 = _976 * _1192;
    float _1242 = _1000 * _1210;
    float _1244 = _1210 * _1176;
    float _1246 = _1192 * _1176;
    float _1248 = _1000 * _1176;
    float _1250 = -_1234;
    float _1252 = fma(_1230, _1238, _1250);
    float _1254 = -_1232;
    float _1256 = _1230 * _1254;
    float _1258 = fma(_1230, _1240, _1242);
    float _1260 = fma(_1230, _1242, _1240);
    float _1262 = fma(_1252, _1214, _1236);
    float _1264 = fma(_1244, _1214, _1256);
    float _1266 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1184);
    float _1268 = _1248 * _1232;
    float _1270 = fma(_1258, _1198, _1262);
    float _1272 = fma(_1246, _1198, _1264);
    float _1274 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1266);
    float _1276 = -_1238;
    float _1278 = fma(_1230, _1234, _1276);
    float _1280 = _1206 + _1270;
    float _1282 = _1216 + _1272;
    float _1284 = _1274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1286 = fma(_1260, _1214, _1268);
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1294 = _1282 + _1292;
    float _1296 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1298 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1300 = _1290 * _1290;
    float _1302 = fma(_1278, _1198, _1286);
    float _1304 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1296);
    float _1306 = fma(_1294, _1294, _1300);
    float _1308 = _1284 + _1302;
    float _1310 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1304);
    float _1312 = sqrt(_1306);
    float _1314 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1316 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1298);
    float _1318 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1316);
    float _1320 = 1.0 / _1314;
    float _1322 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1324 = _1322 + _1314;
    bool _1326 = _1312 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1328 = _1314;
    float _1330 = _1302;
    float _1332 = _1214;
    float _1334 = _1206;
    float _1336 = _1234;
    float _1338 = _1282;
    bool _1340 = _1162;
    float _1342 = _1258;
    if (_1226)
    {
        _1328 = 1.0;
    }
    float _1344 = _1328;
    float _1346 = _1324 * _1320;
    float _1348 = _1346 * 0.5;
    float _1350 = _1320;
    float _1352 = _1344;
    if (!_1326)
    {
        _1330 = _1282;
    }
    float _1354 = _1330;
    float _1356 = _1354;
    if (!_1326)
    {
        _1332 = _1280;
    }
    float _1358 = _1332;
    float _1360 = _1358;
    if (!_1326)
    {
        _1350 = _1308;
    }
    float _1362 = _1350;
    bool _1364 = !_1326;
    float _1366 = _1362;
    if (!_1364)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1372 = _1312 + _1370;
        float _1374 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = rsqrt(_1306);
        float _1378 = _1372 * _1368;
        float _1380 = _1378 * 0.15915493667125701904296875;
        float _1382 = _1380 * 6.283185482025146484375;
        float _1384 = cos(_1382);
        float _1386 = _1380 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1384 + (-1.0);
        float _1392 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = fma(_1388, _1374, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1396 = fma(_1308, _1384, _1392);
        float _1398 = _1376 * _1394;
        float _1400 = fma(_1294, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = fma(_1290, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1366 = _1396;
        _1356 = _1400;
        _1360 = _1402;
        _1334 = _1398;
    }
    float _1404 = _1366;
    float _1406 = _1356;
    float _1408 = _1360;
    float _1410 = _1334;
    float _1412 = _1410;
    if (!_1226)
    {
        float _1414 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1416 = _1414 * 0.15915493667125701904296875;
        float _1418 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1422 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1420);
        float _1424 = _1416 * 6.283185482025146484375;
        float _1426 = cos(_1424);
        float _1428 = _1418 * 0.15915493667125701904296875;
        float _1430 = _1416 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = 1.0 / _1426;
        float _1436 = _1428 * 6.283185482025146484375;
        float _1438 = cos(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = _1428 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1448 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1446;
        float _1450 = _1438 * _1440;
        float _1452 = 1.0 / _1422;
        float _1454 = 1.0 / _1450;
        float _1456 = 1.0 / _1448;
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1460 = _1452 * _1458;
        float _1462 = _1444 * _1454;
        float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1466 = fma(_1462, _1460, _1464);
        float _1468 = _1466 * _1456;
        float _1470 = precise::clamp(_1468, 0.0, 1.0);
        _1336 = _1428;
        _1338 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _1412 = _1454;
        _1352 = _1470;
    }
    float _1472 = _1336;
    float _1474 = _1338;
    float _1476 = _1412;
    float _1478 = _1352;
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1482 = _1404 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1486 = _1406 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1490 = _1408 + _1488;
    float _1492 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1494 = _1482 * _1482;
    float _1496 = fma(_1486, _1486, _1494);
    float _1498 = fma(_1490, _1490, _1496);
    float _1500 = rsqrt(_1498);
    float _1502 = sqrt(_1498);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1486 * _1504;
    float _1508 = _1490 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1472;
    float _1526 = _1514;
    float _1528 = _1522;
    float _1530 = _1474;
    float _1532 = _1504;
    float _1534 = _1506;
    float _1536 = _1508;
    float _1538 = _1510;
    float _1540 = _1512;
    if (_1518)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1542;
    }
    float _1544 = _1524;
    if (_1518)
    {
        float _1546 = rsqrt(_1514);
        _1526 = _1546;
    }
    float _1548 = _1526;
    if (_1518)
    {
        float _1550 = _1522 * _1544;
        _1528 = _1550;
    }
    float _1552 = _1528;
    if (_1518)
    {
        float _1554 = _1552 * 0.15915493667125701904296875;
        _1530 = _1554;
    }
    float _1556 = _1530;
    float _1558 = _1544;
    if (_1518)
    {
        float _1560 = _1556 * 6.283185482025146484375;
        float _1562 = sin(_1560);
        _1558 = _1562;
    }
    float _1564 = _1558;
    float _1566 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1568 = precise::max(0.0, _1566);
    float _1570 = _1476;
    float _1572 = _1568;
    if (_1518)
    {
        float _1574 = _1556 * 6.283185482025146484375;
        float _1576 = cos(_1574);
        _1570 = _1576;
    }
    float _1578 = _1570;
    float _1580 = -_1504;
    float _1582 = -_1568;
    float _1584 = fma(_1482, _1580, _1582);
    float _1586 = _1584;
    if (_1518)
    {
        float _1588 = _1584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1588;
    }
    float _1590 = _1572;
    float _1592 = _1564;
    float _1594 = _1590;
    if (_1518)
    {
        float _1596 = fma(_1564, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = _1598;
    if (_1518)
    {
        float _1602 = _1578 + (-1.0);
        _1594 = _1602;
    }
    float _1604 = _1594;
    if (_1518)
    {
        float _1606 = _1548 * _1598;
        _1532 = _1606;
    }
    float _1608 = _1532;
    if (_1518)
    {
        float _1610 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1610;
    }
    float _1612 = _1600;
    if (_1518)
    {
        float _1614 = _1506 * _1608;
        _1534 = _1614;
    }
    float _1616 = _1534;
    if (_1518)
    {
        float _1618 = _1508 * _1608;
        _1536 = _1618;
    }
    float _1620 = _1536;
    if (_1518)
    {
        float _1622 = fma(_1584, _1578, _1612);
        _1586 = _1622;
    }
    float _1624 = _1586;
    if (_1518)
    {
        float _1626 = _1616 * _1616;
        _1538 = _1626;
    }
    float _1628 = _1538;
    if (_1518)
    {
        float _1630 = _1620 * _1620;
        _1540 = _1630;
    }
    float _1632 = _1540;
    float _1634 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1636 = fma(_1624, _1624, _1628);
    float _1638 = _1636 + _1632;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1642 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1640);
    float _1644 = precise::clamp(_1642, 0.0, 1.0);
    float _1646 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    float _1648 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1652 = -_1644;
    float _1654 = _1652 + 1.0;
    float _1656 = rsqrt(_1638);
    float _1658 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1660 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1662 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1664 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1650);
    float _1666 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1668 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1660);
    float _1670 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1662);
    float _1672 = abs(_1654);
    float _1674 = log2(_1672);
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1678 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1668);
    float _1680 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1682 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1664);
    float _1684 = -_1676;
    float _1686 = fma(_1684, _1492, 1.0);
    float _1688 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1690 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1692 = _1656 * _1616;
    float _1694 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1696 = _1656 * _1624;
    float _1698 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1690);
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1702 = _1656 * _1620;
    float _1704 = log2(_1686);
    float _1706 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1698);
    float _1708 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1710 = -_1700;
    float _1712 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1710);
    float _1714 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1706);
    float _1718 = -_1702;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1712);
    float _1722 = exp2(_1708);
    float _1724 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1714);
    float _1728 = fma(_1720, -0.5, 0.5);
    float _1730 = fma(_1720, 0.5, 0.5);
    float _1732 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1734 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1736 = 1.0 / _1716;
    float _1738 = _1696 + 1.0;
    float _1740 = fma(_1730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1732);
    float _1744 = _1704 * 0.693147182464599609375;
    float _1746 = fma(_1730, _1740, -0.212114393711090087890625);
    float _1748 = sqrt(_1728);
    float _1750 = -_1696;
    float _1752 = fma(_1722, _1738, _1750);
    float _1754 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1756 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1734);
    float _1758 = fma(_1730, _1746, 1.570728778839111328125);
    float _1760 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1762 = _1754 * _1736;
    float _1764 = _1756 * _1736;
    float _1766 = fma(_1762, 0.5, 0.5);
    float _1768 = fma(_1764, -0.5, 0.5);
    float _1770 = fma(_1752, 0.5, 0.5);
    float _1772 = _1748 * 0.636619746685028076171875;
    float _1774 = -_1758;
    float _1776 = fma(_1772, _1774, 1.0);
    float3 _5165 = float3(_1766, _1768, _1760);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5165, float3(0.0), isnan(_5165)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5165, float3(0.0), isnan(_5165)), level(0.0)).x;
    float3 _5176 = float3(_1766, _1768, _1760);
    float4 _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5176, float3(0.0), isnan(_5176)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5176, float3(0.0), isnan(_5176)), level(0.0)).xyzw;
    float _1783 = _1781.x;
    float _1785 = _1781.y;
    float _1787 = _1781.z;
    float _1789 = _1781.w;
    float2 _5193 = float2(_1776, _1770);
    float3 _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5193, float2(0.0), isnan(_5193)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5193, float2(0.0), isnan(_5193)), level(0.0)).xyz;
    float _1795 = _1793.x;
    float _1797 = _1793.y;
    float _1799 = _1793.z;
    float _1801 = in.m_65.w;
    float _1803 = in.m_59.w;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1811 = _1809 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1815 = _1813 != 0;
    out.m_67.x = _1200;
    out.m_67.y = _1182;
    out.m_67.z = _1180;
    float _1817 = 1.0 / _1807;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1821 = _1819 != 0;
    out.m_69.x = _1406;
    out.m_69.y = _1404;
    out.m_69.z = _1408;
    bool _1823 = _596 > 0.5;
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1825;
    float _1829 = -_166;
    float _1831 = _1829 + 1.0;
    float _1833 = 1.0 / _1811;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1841 = _1839 != 0;
    out.m_71.w = _1801;
    float _1843 = _1827 * _1817;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1847 = in.m_53.x;
    bool _1849 = _1803 > 0.5;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1855 = _1853 != 0;
    float _1857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1859 = _1849 ? as_type<int>(_1831) : as_type<int>(_166);
    float _1861 = _1837 * _1833;
    bool _1863 = _1849;
    float _1865 = _1756;
    float _1867 = _1754;
    if (_1815)
    {
        bool _1869 = _594 > 0.5;
        _1863 = _1869;
    }
    bool _1871 = _1863;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1877 = _592 + _1875;
    if (_1821)
    {
        bool _1879 = _602 > 0.5;
        _1340 = _1879;
    }
    bool _1881 = _1340;
    float _1883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1887 = _592 + _1885;
    bool _1889 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1891 = isnan(_592);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1897 = _1893 || _1895;
    float _1899 = float(_1897);
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1903 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1905 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1907 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1909 = fma(_1843, _1877, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1911 = fma(_1861, _1887, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1913 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1915 = isnan(_592);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = -_1899;
    float _1927 = _1925 + 1.0;
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1931 = _1841 ? as_type<float>(_1859) : _166;
    out.m_73.x = _1903;
    out.m_73.y = _1905;
    out.m_73.z = _1907;
    out.m_73.w = _1901;
    float _1933 = _1857 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1935 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1937 = isnan(_592);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = _1923 * _1927;
    float _1949 = -_1923;
    float _1951 = _1949 + 1.0;
    int _1953 = as_type<int>(_1933);
    if (_1855)
    {
        float _1955 = _1823 ? _1831 : _166;
        _214 = _1955;
    }
    float _1957 = _214;
    float _1959 = fma(_1931, _1933, -0.5);
    float _1961 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1963 = _1945 * _1951;
    int _1965 = as_type<int>(_1883);
    float _1967 = _1847;
    if (_1821)
    {
        float _1969 = -_1847;
        float _1971 = _1969 + 1.0;
        _1965 = as_type<int>(_1971);
    }
    int _1973 = _1965;
    if (!_1821)
    {
        _712 = _1847;
    }
    float _1975 = _712;
    float _1977 = fma(_1961, _1957, -0.5);
    float _1979 = _1909 * _1963;
    float _1981 = -_1945;
    float _1983 = _1981 + 1.0;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1987 = _1975;
    if (_1821)
    {
        float _1989 = _1881 ? as_type<float>(_1973) : _1847;
        _1987 = _1989;
    }
    float _1991 = _1987;
    float _1993 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1995 = fma(_1983, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1979);
    float _1997 = in.m_75.x;
    float _1999 = in.m_75.y;
    float _2001 = in.m_75.z;
    bool _2003 = _962 != 0.0;
    bool _2005 = isnan(_962);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(0.0);
    bool _2011 = _2007 || _2009;
    float _2013 = fma(_1993, _1991, -0.5);
    float _2015 = fma(_1911, _1947, _1995);
    float _2017 = -_650;
    float _2019 = fma(_876, _1977, _2017);
    bool _2021 = _960 == 0.0;
    bool _2023 = !_2011;
    bool _2025 = _2021 && _2023;
    float _2027 = fma(_880, _2013, _848);
    float _2029 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2015);
    if (_1815)
    {
        float _2031 = -_1847;
        float _2033 = _2031 + 1.0;
        _1953 = as_type<int>(_2033);
    }
    int _2035 = _1953;
    bool _2037 = _964 == 0.0;
    bool _2039 = _2037 && _2025;
    float _2041 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2043 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2047 = -_890;
    float _2049 = fma(_810, _1959, _2047);
    if (_1815)
    {
        float _2051 = _1871 ? as_type<float>(_2035) : _1847;
        _1967 = _2051;
    }
    float _2053 = _1967;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2057 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2061 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2063 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2065 = fma(_2043, _2053, -0.5);
    float _2067 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2069 = exp2(_2057);
    float _2071 = _2001;
    float _2073 = _1999;
    float _2075 = _1997;
    if (!_2039)
    {
        float _2077 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2001);
        _2071 = _2077;
    }
    float _2079 = _2071;
    if (!_2039)
    {
        float _2081 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1999);
        _2073 = _2081;
    }
    float _2083 = _2073;
    if (!_2039)
    {
        float _2085 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1997);
        _2075 = _2085;
    }
    float _2087 = _2075;
    out.m_77.x = _2061;
    out.m_77.y = _2063;
    out.m_77.z = _2067;
    out.m_77.w = _2041;
    float _2089 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2091 = -_2083;
    float _2093 = _1230 * _2091;
    float _2095 = _1248 * _2083;
    float _2097 = _1212 * _2083;
    float _2099 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2089);
    float _2101 = fma(_1244, _2087, _2093);
    float _2103 = fma(_1260, _2087, _2095);
    float _2105 = fma(_1252, _2087, _2097);
    float _2107 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2099);
    float _2109 = fma(_1246, _2079, _2101);
    float _2111 = fma(_1278, _2079, _2103);
    float _2113 = -_2069;
    float _2115 = _2113 + 1.0;
    float _2117 = fma(_1258, _2079, _2105);
    bool _2119 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2121 = isnan(_1502);
    bool _2123 = _2119 || _2121;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2127 = _2123 || _2125;
    float _2129 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2107);
    float _2131 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2133 = fma(_798, _2065, _900);
    out.m_79.x = _2109;
    out.m_79.y = _2111;
    out.m_79.z = _2117;
    float _2135 = _2129 + _1716;
    float _2137 = _2019 + 0.5;
    float _2139 = _2049 + 0.5;
    float _2141 = _2027 + 0.5;
    float _2143 = _2133 + 0.5;
    float _2145 = _2135 * 0.5;
    out.gl_Position.x = _1754;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _2129;
    out.gl_Position.w = _1716;
    float _2147 = _1716;
    float _2149 = _2145;
    if (!_2127)
    {
        _1342 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2151 = _1342;
    out.m_81.x = _2141;
    out.m_81.y = _2137;
    out.m_81.z = _2143;
    out.m_81.w = _2139;
    out.m_83.z = _2145;
    out.m_83.w = _1716;
    float _2153 = _2151;
    float _2155 = _2151;
    if (!_2127)
    {
        _1865 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2157 = _1865;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_2127)
    {
        _1867 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2163 = _1867;
    float _2165 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2167 = _2163;
    float _2169 = _2163;
    if (!_2127)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2171 = _2147;
    float _2173 = _2171;
    float _2175 = _2171;
    if (!_2127)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2177 = _2149;
    float _2179 = _2131 * _1778;
    float _2181 = -_2131;
    float _2183 = _2181 + 1.0;
    float _2185 = _1789 * _2179;
    float _2187 = _1799 * _2179;
    float _2189 = _1789 * _2183;
    float _2191 = _2183;
    float _2193 = _2177;
    float _2195 = _2177;
    if (!_2127)
    {
        _2191 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2197 = _2191;
    float _2199 = fma(_1795, _2185, _1783);
    float _2201 = fma(_1797, _2185, _1785);
    float _2203 = fma(_1789, _2187, _1787);
    out.m_85.x = _2199;
    out.m_85.y = _2201;
    out.m_85.z = _2203;
    out.m_85.w = _2189;
    bool _2205 = !_2127;
    float _2207 = _2197;
    float _2209 = _2197;
    if (!_2205)
    {
        bool _2211 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2213 = isnan(_1502);
        bool _2215 = _2211 || _2213;
        bool _2217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2219 = _2215 || _2217;
        if (!_2219)
        {
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2223 = _1502 + _2221;
            float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2227 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2225;
            float _2229 = 1.0 / _2227;
            float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2251 = _2223 * _2229;
            float _2253 = precise::clamp(_2251, 0.0, 1.0);
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2259 = fma(_2253, _2233, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2261 = fma(_2253, _2257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2263 = fma(_2253, _2237, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2265 = fma(_2253, _2241, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2267 = fma(_2253, _2245, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2269 = fma(_2253, _2249, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2169 = _2261;
            _2175 = _2267;
            _2161 = _2259;
            _2209 = _2265;
            _2155 = _2263;
            _2195 = _2269;
            _2271 = true;
        }
        else
        {
            bool _2273 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2275 = isnan(_1502);
            bool _2277 = _2273 || _2275;
            bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2281 = _2277 || _2279;
            if (!_2281)
            {
                _2159 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2283 = _2159;
            _2161 = _2283;
            if (!_2281)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2285 = _2167;
            _2169 = _2285;
            if (!_2281)
            {
                _2153 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2287 = _2153;
            _2155 = _2287;
            if (!_2281)
            {
                _2207 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2289 = _2207;
            _2209 = _2289;
            if (!_2281)
            {
                _2173 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2291 = _2173;
            _2175 = _2291;
            if (!_2281)
            {
                _2193 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2293 = _2193;
            bool _2295 = !_2281;
            _2195 = _2293;
            if (!_2295)
            {
                bool _2297 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2299 = isnan(_1502);
                bool _2301 = _2297 || _2299;
                bool _2303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2305 = _2301 || _2303;
                if (!_2305)
                {
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2309 = _1502 + _2307;
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2311;
                    float _2315 = 1.0 / _2313;
                    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2337 = _2309 * _2315;
                    float _2339 = precise::clamp(_2337, 0.0, 1.0);
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2345 = fma(_2339, _2319, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2347 = fma(_2339, _2343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2349 = fma(_2339, _2323, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2351 = fma(_2339, _2327, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2353 = fma(_2339, _2331, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2355 = fma(_2339, _2335, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2169 = _2347;
                    _2175 = _2353;
                    _2161 = _2345;
                    _2209 = _2351;
                    _2155 = _2349;
                    _2195 = _2355;
                    _2271 = true;
                }
                else
                {
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2175 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2161 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2209 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2155 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2195 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2271 = false;
    float _2357 = _2169;
    float _2359 = _2175;
    float _2361 = _2161;
    float _2363 = _2209;
    float _2365 = _2155;
    float _2367 = _2195;
    float _2369 = fma(_2111, -0.5, 0.5);
    float _2371 = precise::clamp(_2369, 0.0, 1.0);
    float _2373 = -_2357;
    float _2375 = _2373 + _2359;
    float _2377 = _2165 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2379 = -_2361;
    float _2381 = _2379 + _2363;
    float _2383 = fma(_2371, _2375, _2357);
    out.m_87.x = 0.0;
    float _2385 = -_2365;
    float _2387 = _2385 + _2367;
    float _2389 = fma(_2371, _2381, _2361);
    float _2391 = _2383 * 0.586610972881317138671875;
    out.m_47.x = _2377;
    bool _2393 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2395 = fma(_2371, _2387, _2365);
    float _2397 = fma(_2389, 0.298911988735198974609375, _2391);
    bool _2399 = _1478 > 0.0;
    bool _2401 = isnan(_1478);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(0.0);
    bool _2407 = _2403 || _2405;
    float _2409 = fma(_2395, 0.114477999508380889892578125, _2397);
    float _2411 = -_2409;
    float _2413 = _2389 + _2411;
    float _2415 = -_2409;
    float _2417 = _2383 + _2415;
    float _2419 = -_2409;
    float _2421 = _2395 + _2419;
    float _2423 = fma(_2413, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2409);
    float _2425 = fma(_2417, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2409);
    float _2427 = fma(_2421, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2409);
    bool _2429 = !_2393;
    if (!_2429)
    {
        float _2431 = -_1404;
        float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2435 = -_1406;
        float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2439 = -_1408;
        float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2443 = _2433 * _2433;
        float _2445 = fma(_2437, _2437, _2443);
        float _2447 = fma(_2441, _2441, _2445);
        float _2449 = sqrt(_2447);
        float _2451 = rsqrt(_2447);
        float _2453 = -_2449;
        float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2457 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        float _2461 = _2437 * _2451;
        float _2463 = _2433 * _2451;
        float _2465 = abs(_2459);
        float _2467 = log2(_2465);
        float _2469 = _2441 * _2451;
        float _2471 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2473 = _2111 * _2463;
        float _2475 = -_2463;
        float _2477 = -_2471;
        float _2479 = fma(_2475, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2477);
        float _2481 = fma(_2109, _2461, _2473);
        float _2483 = -_2469;
        float _2485 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2479);
        float _2487 = fma(_2117, _2469, _2481);
        float _2489 = precise::clamp(_2487, 0.0, 1.0);
        float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2493 = _2485 + _2491;
        float _2495 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2497 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2499 = precise::clamp(_2497, 0.0, 1.0);
        float _2501 = exp2(_2495);
        float _2503 = _2501 * _2499;
        float _2505 = _2489 * _2503;
        float _2507 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2509 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2511 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2507;
        out.m_87.y = _2509;
        out.m_87.z = _2511;
    }
    out.m_89.x = _2423;
    out.m_89.y = _2425;
    out.m_89.z = _2427;
    if (_2407)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2513 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2513;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2271 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2569 = as_type<float>(_122);
        out.gl_Position.z = _2569;
    }
    if (!_112)
    {
        return out;
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _146;
    float _158 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _162 = _160 * 5.0;
        _124 = as_type<int>(_162);
    }
    int _164 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2642 = as_type<float>(_164);
        out.gl_Position.z = _2642;
    }
    if (_152)
    {
        return out;
    }
    float _166 = in.m_53.y;
    float _168 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_55.w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = in.m_44.x;
    float _190 = in.m_44.y;
    float _192 = in.m_44.z;
    float _194 = 0.0;
    float _196 = _168;
    if (!_180)
    {
        float _198 = _168 * _168;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    out.m_57.y = _166;
    bool _210 = !_180;
    float _212 = _208;
    float _214 = _166;
    if (!_210)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _168 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _168);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _244;
    }
    float _246 = _212;
    bool _248 = !_180;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _168 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _196 = _268;
    }
    float _270 = _196;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _274 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _280 = fma(_270, _182, _274);
    float _282 = fma(_270, _184, _276);
    float _284 = fma(_270, _186, _278);
    float _286 = fma(_280, _170, _188);
    float _288 = fma(_282, _170, _190);
    float _290 = fma(_284, _170, _192);
    bool _292 = !_272;
    float _310;
    if (!_292)
    {
        float _294 = in.m_59.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _146;
    }
    _312 = false;
    float _314 = _310;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _314 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _314 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = _314 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = 1.0 / _330;
    bool _346 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_314);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    bool _358 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_314);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = 1.0 / _334;
    float _372 = -_368;
    float _374 = _372 + 1.0;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _378 = 1.0 / _342;
    float _380 = _318 * _344;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _384 = _314 + _382;
    float _386 = 1.0 / _338;
    float _388 = _322 * _370;
    bool _390 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _392 = isnan(_314);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -_400;
    float _404 = _402 + 1.0;
    float _406 = _384 * _378;
    bool _408 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _410 = isnan(_314);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _420;
    float _424 = _418 * _404;
    float _426 = _326 * _386;
    bool _428 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _430 = isnan(_314);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -_418;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _448;
    float _452 = fma(_422, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = _438 * _442;
    float _456 = -_438;
    float _458 = _456 + 1.0;
    float _460 = fma(_446, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _462 = fma(_450, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _464 = -_356;
    float _466 = _464 + 1.0;
    float _468 = _356 * _458;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _482 = _368 * _466;
    float _484 = fma(_472, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _486 = fma(_476, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _488 = fma(_480, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _490 = _462 * _482;
    float _492 = _460 * _482;
    float _494 = _452 * _482;
    float _496 = in.m_55.x;
    float _498 = in.m_55.y;
    float _500 = in.m_55.z;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _502;
    float _506 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _490);
    float _508 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _492);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _514;
    float _518 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _494);
    float _520 = fma(_504, _426, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _522 = fma(_486, _468, _506);
    float _524 = fma(_484, _468, _508);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _534 = fma(_512, _426, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _536 = fma(_516, _426, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _542 = fma(_488, _468, _518);
    float _544 = fma(_528, _406, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _546 = fma(_532, _406, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _548 = fma(_540, _406, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _550 = fma(_534, _454, _524);
    float _552 = fma(_536, _454, _522);
    float _554 = fma(_520, _454, _542);
    float _556 = fma(_544, _424, _550);
    float _558 = fma(_546, _424, _552);
    float _560 = fma(_548, _424, _554);
    float _562 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[147].x, _556);
    float _564 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[147].y, _558);
    float _566 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[147].z, _560);
    float _568 = _562 * _496;
    float _570 = _564 * _498;
    float _572 = _566 * _500;
    bool _574 = !_376;
    if (!_574)
    {
        float _576 = in.m_59.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _156 = _590;
    }
    float _592 = _156;
    float _594 = in.m_59.z;
    float _596 = in.m_59.y;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _600 = _598 != 0;
    float _602 = in.m_59.x;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _618 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _620 = precise::max(_616, _618);
    bool _622 = _620 >= 16.0;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _626 = _594 * 2.0;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _630 = _596 * 2.0;
    float _632 = _596 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _634 = floor(_626);
    bool _636 = !_614;
    int _638 = _636 ? 0 : 1;
    float _640 = _602 * 2.0;
    float _642 = fma(_632, -2.0, _624);
    float _644 = _602 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _646 = !_610;
    int _648 = _646 ? 0 : 1;
    float _650 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _642);
    float _652 = floor(_630);
    float _654 = -_628;
    float _656 = fma(_644, 2.0, _654);
    float _658 = _602 + _596;
    float _660 = _658 + (-1.0);
    bool _662 = _634 > 0.0;
    float _664 = floor(_640);
    bool _666 = _634 >= 0.0;
    bool _668 = isnan(_634);
    bool _670 = _666 || _668;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    float _676 = _602 + _594;
    float _678 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _680 = _674 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _682 = _676 + (-1.0);
    bool _684 = _652 >= 0.0;
    bool _686 = isnan(_652);
    bool _688 = _684 || _686;
    bool _690 = isnan(0.0);
    bool _692 = _688 || _690;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _696 = ~as_type<int>(_680);
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _704 = _700;
    float _706 = _652;
    float _708 = _680;
    float _710 = _682;
    float _712 = _592;
    if (!_662)
    {
        int _714 = ~as_type<int>(_680);
        int _716 = _714 + 1;
        _704 = _716;
    }
    int _718 = _704;
    bool _720 = _652 > 0.0;
    if (!_600)
    {
        _706 = _596;
    }
    float _722 = _706;
    float _724 = _722;
    if (!_600)
    {
        _708 = _594;
    }
    float _726 = _708;
    float _728 = _726;
    if (!_600)
    {
        _710 = _594;
    }
    float _730 = _710;
    bool _732 = !_606;
    int _734 = _732 ? 0 : 1;
    float _736 = _730;
    if (_600)
    {
        _724 = _602;
    }
    float _738 = _724;
    if (_600)
    {
        _728 = _596;
    }
    float _740 = _728;
    if (_600)
    {
        _736 = _596;
    }
    float _742 = _736;
    bool _744 = _664 > 0.0;
    float _746 = _740 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _748 = _664 >= 0.0;
    bool _750 = isnan(_664);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _762 = abs(_734);
    float _764 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[83].z, _758);
    float _766 = _738 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _768 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[83].w, _760);
    float _770 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _772 = log2(_770);
    float _774 = float(_718);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _778 = float(_762);
    float _780 = -_694;
    float _782 = fma(_766, 2.0, _780);
    int _784 = _756 ? 0 : 1;
    float _786 = fma(_746, -2.0, _776);
    int _788 = _692 ? 0 : 1;
    float _790 = _778 * _774;
    int _792 = ~_784;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    float _798 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _764);
    int _800 = _796;
    if (!_744)
    {
        int _802 = ~_784;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    float _808 = _790 * (-2.0);
    float _810 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _768);
    float _812 = _772 * _134;
    float _814 = in.m_61.x;
    float _816 = in.m_61.y;
    float _818 = in.m_61.z;
    int _820 = ~_788;
    int _822 = _820 + 1;
    int _824 = _822 + 1;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _828 = _824;
    if (!_720)
    {
        int _830 = ~_788;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = exp2(_812);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _840 = 1.0 + _838;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[78].z, _826);
    float _846 = -_134;
    float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[76].x, _656);
    bool _850 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _852 = isnan(1.0);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _858 = _854 || _856;
    float _860 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    int _862 = abs(_638);
    float _864 = 1.0 / _840;
    bool _866 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _874 = _870 || _872;
    float _876 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _860);
    int _878 = abs(_648);
    float _880 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _844);
    float _882 = float(_862);
    float _884 = float(_834);
    float _886 = -_836;
    float _888 = _886 + 1.0;
    float _890 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _786);
    float _892 = float(_806);
    float _894 = _882 * _884;
    float _896 = _874 ? _888 : 0.0;
    float _898 = -_134;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[81].x, _782);
    float _902 = _894 * (-2.0);
    bool _904 = _858;
    if (_858)
    {
        float _906 = _896 * _864;
        _158 = _906;
    }
    float _908 = _158;
    float _910 = float(_878);
    float _912 = fma(_808, _814, _814);
    float _914 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _916 = fma(_678, _808, _678);
    float _918 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _920 = _910 * _892;
    float _922 = _602 + (-0.5);
    float _924 = _622 ? _914 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _926 = _596 + _594;
    float _928 = _622 ? _918 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _930 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[196].x, _912);
    float _932 = abs(_924);
    bool _934 = _932 != 0.0;
    bool _936 = isnan(_932);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _920 * (-2.0);
    float _946 = abs(_928);
    bool _948 = _946 == 0.0;
    float _950 = fma(_916, _908, _930);
    float _952 = abs(_928);
    bool _954 = _952 == 0.0;
    bool _956 = !_942;
    bool _958 = _954 && _956;
    float _960 = in.m_63.x;
    float _962 = in.m_63.y;
    float _964 = in.m_63.z;
    float _966 = _950 * 0.15915493667125701904296875;
    float _968 = _926 + (-1.0);
    float _970 = fma(_702, _902, _702);
    float _972 = fma(_902, _818, _818);
    float _974 = _966 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = fma(_944, _816, _816);
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _982 = _594 + (-0.5);
    float _984 = _596 + (-0.5);
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].y);
    int _988 = as_type<int>(_908);
    bool _990 = _948;
    if (_958)
    {
        bool _992 = as_type<int>(_928) >= 0;
        _904 = _992;
    }
    bool _994 = _904;
    float _996 = fma(_980, _944, _980);
    float _998 = _966 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _978);
    float _1004 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[196].z, _972);
    int _1006 = _994 ? (-1) : 0;
    if (_958)
    {
        int _1008 = _994 ? 0 : 1078530011;
        _986 = _1008;
    }
    int _1010 = _986;
    float _1012 = fma(_996, _908, _1002);
    float _1014 = fma(_970, _908, _1004);
    if (_958)
    {
        int _1016 = int(0x80000000) & as_type<int>(_924);
        int _1018 = _1010 | _1016;
        _988 = _1018;
    }
    int _1020 = _988;
    bool _1022 = !_942;
    bool _1024 = _1022 && _948;
    int _1026 = _1020;
    float _1028 = as_type<float>(_1020);
    if (!_1024)
    {
        float _1030 = abs(_924);
        bool _1032 = _1030 != as_type<float>(0x7f800000u /* inf */);
        bool _1034 = isnan(_1030);
        bool _1036 = _1032 || _1034;
        bool _1038 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1040 = _1036 || _1038;
        float _1042 = abs(_928);
        bool _1044 = _1042 == as_type<float>(0x7f800000u /* inf */);
        float _1046 = abs(_928);
        bool _1048 = _1046 == as_type<float>(0x7f800000u /* inf */);
        bool _1050 = !_1040;
        bool _1052 = _1048 && _1050;
        _990 = _1044;
        if (_1052)
        {
            bool _1054 = as_type<int>(_928) >= 0;
            _1006 = _1054 ? (-1) : 0;
        }
        int _1056 = _1006;
        if (_1052)
        {
            _1026 = 1075235812;
        }
        int _1058 = _1026;
        int _1060 = _1058;
        if (_1052)
        {
            int _1062 = ~_1056;
            int _1064 = (_1062 != 0) ? _1058 : 1061752795;
            _1060 = _1064;
        }
        int _1066 = _1060;
        float _1068 = as_type<float>(_1066);
        if (_1052)
        {
            int _1070 = int(0x80000000) & as_type<int>(_924);
            int _1072 = _1066 | _1070;
            _1068 = as_type<float>(_1072);
        }
        float _1074 = _1068;
        bool _1076 = !_1040;
        bool _1078 = _1076 && _1044;
        _1028 = _1074;
        if (!_1078)
        {
            float _1080 = abs(_924);
            float _1082 = abs(_928);
            float _1084 = precise::max(_1080, _1082);
            float _1086 = abs(_924);
            float _1088 = abs(_928);
            float _1090 = precise::min(_1086, _1088);
            float _1092 = 1.0 / _1084;
            float _1094 = abs(_924);
            float _1096 = abs(_928);
            bool _1098 = _1094 > _1096;
            bool _1100 = as_type<int>(_928) >= 0;
            float _1102 = abs(_924);
            float _1104 = abs(_928);
            float _1106 = _1102 + _1104;
            int _1108 = as_type<int>(_924) & int(0x80000000);
            bool _1110 = _1106 > as_type<float>(0x7f800000u /* inf */);
            bool _1112 = isnan(_1106);
            bool _1114 = _1110 || _1112;
            bool _1116 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1118 = _1114 || _1116;
            float _1120 = _1090 * _1092;
            float _1122 = _1120 * _1120;
            float _1124 = _1122 + 11.33538818359375;
            float _1126 = fma(_1122, _1124, 28.84246826171875);
            float _1128 = fma(_1122, _1126, 19.6966705322265625);
            float _1130 = fma(_1122, -0.82336294651031494140625, -5.674867153167724609375);
            float _1132 = fma(_1122, _1130, -6.565555095672607421875);
            float _1134 = 1.0 / _1128;
            float _1136 = _1122 * _1132;
            float _1138 = _1120 * _1136;
            float _1140 = fma(_1138, _1134, _1120);
            float _1142 = _1140;
            _1028 = _1106;
            if (_1098)
            {
                float _1144 = -_1140;
                float _1146 = _1144 + 1.57079637050628662109375;
                _1142 = _1146;
            }
            float _1148 = _1142;
            int _1150 = as_type<int>(_1148);
            if (!_1100)
            {
                float _1152 = -_1148;
                float _1154 = _1152 + 3.1415927410125732421875;
                _1150 = as_type<int>(_1154);
            }
            int _1156 = _1150;
            if (!_1118)
            {
                int _1158 = _1108 | _1156;
                _1028 = as_type<float>(_1158);
            }
        }
    }
    float _1160 = _1028;
    bool _1162 = _990;
    float _1164 = _1012 + _1160;
    float _1166 = _1014 * 0.15915493667125701904296875;
    float _1168 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1170 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1172 = _1164 * 0.15915493667125701904296875;
    float _1174 = _1166 * 6.283185482025146484375;
    float _1176 = cos(_1174);
    float _1178 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1168);
    float _1180 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1182 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1184 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _964);
    float _1188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _962);
    float _1190 = _1172 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1178);
    float _1196 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1170);
    float _1198 = _1180 * _1186;
    float _1200 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _960);
    float _1204 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1196);
    float _1206 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1208 = _1172 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _976 * _1176;
    float _1214 = _1200 * _1202;
    float _1216 = _1204 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1218 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1220 = isnan(0.5);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1226 = _1222 || _1224;
    float _1228 = _1166 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1182 * _1188;
    float _1234 = _1000 * _1192;
    float _1236 = _1212 * _1232;
    float _1238 = _976 * _1210;
    float _1240 = _976 * _1192;
    float _1242 = _1000 * _1210;
    float _1244 = _1210 * _1176;
    float _1246 = _1192 * _1176;
    float _1248 = _1000 * _1176;
    float _1250 = -_1234;
    float _1252 = fma(_1230, _1238, _1250);
    float _1254 = -_1232;
    float _1256 = _1230 * _1254;
    float _1258 = fma(_1230, _1240, _1242);
    float _1260 = fma(_1230, _1242, _1240);
    float _1262 = fma(_1252, _1214, _1236);
    float _1264 = fma(_1244, _1214, _1256);
    float _1266 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1184);
    float _1268 = _1248 * _1232;
    float _1270 = fma(_1258, _1198, _1262);
    float _1272 = fma(_1246, _1198, _1264);
    float _1274 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1266);
    float _1276 = -_1238;
    float _1278 = fma(_1230, _1234, _1276);
    float _1280 = _1206 + _1270;
    float _1282 = _1216 + _1272;
    float _1284 = _1274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1286 = fma(_1260, _1214, _1268);
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1294 = _1282 + _1292;
    float _1296 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1298 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1300 = _1290 * _1290;
    float _1302 = fma(_1278, _1198, _1286);
    float _1304 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1296);
    float _1306 = fma(_1294, _1294, _1300);
    float _1308 = _1284 + _1302;
    float _1310 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1304);
    float _1312 = sqrt(_1306);
    float _1314 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1316 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1298);
    float _1318 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1316);
    float _1320 = 1.0 / _1314;
    float _1322 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1324 = _1322 + _1314;
    bool _1326 = _1312 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1328 = _1314;
    float _1330 = _1302;
    float _1332 = _1214;
    float _1334 = _1206;
    float _1336 = _1234;
    float _1338 = _1282;
    bool _1340 = _1162;
    float _1342 = _1258;
    if (_1226)
    {
        _1328 = 1.0;
    }
    float _1344 = _1328;
    float _1346 = _1324 * _1320;
    float _1348 = _1346 * 0.5;
    float _1350 = _1320;
    float _1352 = _1344;
    if (!_1326)
    {
        _1330 = _1282;
    }
    float _1354 = _1330;
    float _1356 = _1354;
    if (!_1326)
    {
        _1332 = _1280;
    }
    float _1358 = _1332;
    float _1360 = _1358;
    if (!_1326)
    {
        _1350 = _1308;
    }
    float _1362 = _1350;
    bool _1364 = !_1326;
    float _1366 = _1362;
    if (!_1364)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1372 = _1312 + _1370;
        float _1374 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = rsqrt(_1306);
        float _1378 = _1372 * _1368;
        float _1380 = _1378 * 0.15915493667125701904296875;
        float _1382 = _1380 * 6.283185482025146484375;
        float _1384 = cos(_1382);
        float _1386 = _1380 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1384 + (-1.0);
        float _1392 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = fma(_1388, _1374, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1396 = fma(_1308, _1384, _1392);
        float _1398 = _1376 * _1394;
        float _1400 = fma(_1294, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = fma(_1290, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1366 = _1396;
        _1356 = _1400;
        _1360 = _1402;
        _1334 = _1398;
    }
    float _1404 = _1366;
    float _1406 = _1356;
    float _1408 = _1360;
    float _1410 = _1334;
    float _1412 = _1410;
    if (!_1226)
    {
        float _1414 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1416 = _1414 * 0.15915493667125701904296875;
        float _1418 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1422 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1420);
        float _1424 = _1416 * 6.283185482025146484375;
        float _1426 = cos(_1424);
        float _1428 = _1418 * 0.15915493667125701904296875;
        float _1430 = _1416 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = 1.0 / _1426;
        float _1436 = _1428 * 6.283185482025146484375;
        float _1438 = cos(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = _1428 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1448 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1446;
        float _1450 = _1438 * _1440;
        float _1452 = 1.0 / _1422;
        float _1454 = 1.0 / _1450;
        float _1456 = 1.0 / _1448;
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1460 = _1452 * _1458;
        float _1462 = _1444 * _1454;
        float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1466 = fma(_1462, _1460, _1464);
        float _1468 = _1466 * _1456;
        float _1470 = precise::clamp(_1468, 0.0, 1.0);
        _1336 = _1428;
        _1338 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _1412 = _1454;
        _1352 = _1470;
    }
    float _1472 = _1336;
    float _1474 = _1338;
    float _1476 = _1412;
    float _1478 = _1352;
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1482 = _1404 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1486 = _1406 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1490 = _1408 + _1488;
    float _1492 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1494 = _1482 * _1482;
    float _1496 = fma(_1486, _1486, _1494);
    float _1498 = fma(_1490, _1490, _1496);
    float _1500 = rsqrt(_1498);
    float _1502 = sqrt(_1498);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1486 * _1504;
    float _1508 = _1490 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1472;
    float _1526 = _1514;
    float _1528 = _1522;
    float _1530 = _1474;
    float _1532 = _1504;
    float _1534 = _1506;
    float _1536 = _1508;
    float _1538 = _1510;
    float _1540 = _1512;
    if (_1518)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1542;
    }
    float _1544 = _1524;
    if (_1518)
    {
        float _1546 = rsqrt(_1514);
        _1526 = _1546;
    }
    float _1548 = _1526;
    if (_1518)
    {
        float _1550 = _1522 * _1544;
        _1528 = _1550;
    }
    float _1552 = _1528;
    if (_1518)
    {
        float _1554 = _1552 * 0.15915493667125701904296875;
        _1530 = _1554;
    }
    float _1556 = _1530;
    float _1558 = _1544;
    if (_1518)
    {
        float _1560 = _1556 * 6.283185482025146484375;
        float _1562 = sin(_1560);
        _1558 = _1562;
    }
    float _1564 = _1558;
    float _1566 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1568 = precise::max(0.0, _1566);
    float _1570 = _1476;
    float _1572 = _1568;
    if (_1518)
    {
        float _1574 = _1556 * 6.283185482025146484375;
        float _1576 = cos(_1574);
        _1570 = _1576;
    }
    float _1578 = _1570;
    float _1580 = -_1504;
    float _1582 = -_1568;
    float _1584 = fma(_1482, _1580, _1582);
    float _1586 = _1584;
    if (_1518)
    {
        float _1588 = _1584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1588;
    }
    float _1590 = _1572;
    float _1592 = _1564;
    float _1594 = _1590;
    if (_1518)
    {
        float _1596 = fma(_1564, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = _1598;
    if (_1518)
    {
        float _1602 = _1578 + (-1.0);
        _1594 = _1602;
    }
    float _1604 = _1594;
    if (_1518)
    {
        float _1606 = _1548 * _1598;
        _1532 = _1606;
    }
    float _1608 = _1532;
    if (_1518)
    {
        float _1610 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1610;
    }
    float _1612 = _1600;
    if (_1518)
    {
        float _1614 = _1506 * _1608;
        _1534 = _1614;
    }
    float _1616 = _1534;
    if (_1518)
    {
        float _1618 = _1508 * _1608;
        _1536 = _1618;
    }
    float _1620 = _1536;
    if (_1518)
    {
        float _1622 = fma(_1584, _1578, _1612);
        _1586 = _1622;
    }
    float _1624 = _1586;
    if (_1518)
    {
        float _1626 = _1616 * _1616;
        _1538 = _1626;
    }
    float _1628 = _1538;
    if (_1518)
    {
        float _1630 = _1620 * _1620;
        _1540 = _1630;
    }
    float _1632 = _1540;
    float _1634 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1636 = fma(_1624, _1624, _1628);
    float _1638 = _1636 + _1632;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1642 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1640);
    float _1644 = precise::clamp(_1642, 0.0, 1.0);
    float _1646 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    float _1648 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1652 = -_1644;
    float _1654 = _1652 + 1.0;
    float _1656 = rsqrt(_1638);
    float _1658 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1660 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1662 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1664 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1650);
    float _1666 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1668 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1660);
    float _1670 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1662);
    float _1672 = abs(_1654);
    float _1674 = log2(_1672);
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1678 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1668);
    float _1680 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1682 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1664);
    float _1684 = -_1676;
    float _1686 = fma(_1684, _1492, 1.0);
    float _1688 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1690 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1692 = _1656 * _1616;
    float _1694 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1696 = _1656 * _1624;
    float _1698 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1690);
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1702 = _1656 * _1620;
    float _1704 = log2(_1686);
    float _1706 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1698);
    float _1708 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1710 = -_1700;
    float _1712 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1710);
    float _1714 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1706);
    float _1718 = -_1702;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1712);
    float _1722 = exp2(_1708);
    float _1724 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1714);
    float _1728 = fma(_1720, -0.5, 0.5);
    float _1730 = fma(_1720, 0.5, 0.5);
    float _1732 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1734 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1736 = 1.0 / _1716;
    float _1738 = _1696 + 1.0;
    float _1740 = fma(_1730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1732);
    float _1744 = _1704 * 0.693147182464599609375;
    float _1746 = fma(_1730, _1740, -0.212114393711090087890625);
    float _1748 = sqrt(_1728);
    float _1750 = -_1696;
    float _1752 = fma(_1722, _1738, _1750);
    float _1754 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1756 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1734);
    float _1758 = fma(_1730, _1746, 1.570728778839111328125);
    float _1760 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1762 = _1754 * _1736;
    float _1764 = _1756 * _1736;
    float _1766 = fma(_1762, 0.5, 0.5);
    float _1768 = fma(_1764, -0.5, 0.5);
    float _1770 = fma(_1752, 0.5, 0.5);
    float _1772 = _1748 * 0.636619746685028076171875;
    float _1774 = -_1758;
    float _1776 = fma(_1772, _1774, 1.0);
    float3 _5165 = float3(_1766, _1768, _1760);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5165, float3(0.0), isnan(_5165)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5165, float3(0.0), isnan(_5165)), level(0.0)).x;
    float3 _5176 = float3(_1766, _1768, _1760);
    float4 _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5176, float3(0.0), isnan(_5176)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5176, float3(0.0), isnan(_5176)), level(0.0)).xyzw;
    float _1783 = _1781.x;
    float _1785 = _1781.y;
    float _1787 = _1781.z;
    float _1789 = _1781.w;
    float2 _5193 = float2(_1776, _1770);
    float3 _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5193, float2(0.0), isnan(_5193)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5193, float2(0.0), isnan(_5193)), level(0.0)).xyz;
    float _1795 = _1793.x;
    float _1797 = _1793.y;
    float _1799 = _1793.z;
    float _1801 = in.m_65.w;
    float _1803 = in.m_59.w;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1811 = _1809 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1815 = _1813 != 0;
    out.m_67.x = _1200;
    out.m_67.y = _1182;
    out.m_67.z = _1180;
    float _1817 = 1.0 / _1807;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1821 = _1819 != 0;
    out.m_69.x = _1406;
    out.m_69.y = _1404;
    out.m_69.z = _1408;
    bool _1823 = _596 > 0.5;
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1825;
    float _1829 = -_166;
    float _1831 = _1829 + 1.0;
    float _1833 = 1.0 / _1811;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1841 = _1839 != 0;
    out.m_71.w = _1801;
    float _1843 = _1827 * _1817;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1847 = in.m_53.x;
    bool _1849 = _1803 > 0.5;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1855 = _1853 != 0;
    float _1857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1859 = _1849 ? as_type<int>(_1831) : as_type<int>(_166);
    float _1861 = _1837 * _1833;
    bool _1863 = _1849;
    float _1865 = _1756;
    float _1867 = _1754;
    if (_1815)
    {
        bool _1869 = _594 > 0.5;
        _1863 = _1869;
    }
    bool _1871 = _1863;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1877 = _592 + _1875;
    if (_1821)
    {
        bool _1879 = _602 > 0.5;
        _1340 = _1879;
    }
    bool _1881 = _1340;
    float _1883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1887 = _592 + _1885;
    bool _1889 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1891 = isnan(_592);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1897 = _1893 || _1895;
    float _1899 = float(_1897);
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1903 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1905 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1907 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1909 = fma(_1843, _1877, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1911 = fma(_1861, _1887, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1913 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1915 = isnan(_592);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = -_1899;
    float _1927 = _1925 + 1.0;
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1931 = _1841 ? as_type<float>(_1859) : _166;
    out.m_73.x = _1903;
    out.m_73.y = _1905;
    out.m_73.z = _1907;
    out.m_73.w = _1901;
    float _1933 = _1857 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1935 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1937 = isnan(_592);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = _1923 * _1927;
    float _1949 = -_1923;
    float _1951 = _1949 + 1.0;
    int _1953 = as_type<int>(_1933);
    if (_1855)
    {
        float _1955 = _1823 ? _1831 : _166;
        _214 = _1955;
    }
    float _1957 = _214;
    float _1959 = fma(_1931, _1933, -0.5);
    float _1961 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1963 = _1945 * _1951;
    int _1965 = as_type<int>(_1883);
    float _1967 = _1847;
    if (_1821)
    {
        float _1969 = -_1847;
        float _1971 = _1969 + 1.0;
        _1965 = as_type<int>(_1971);
    }
    int _1973 = _1965;
    if (!_1821)
    {
        _712 = _1847;
    }
    float _1975 = _712;
    float _1977 = fma(_1961, _1957, -0.5);
    float _1979 = _1909 * _1963;
    float _1981 = -_1945;
    float _1983 = _1981 + 1.0;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1987 = _1975;
    if (_1821)
    {
        float _1989 = _1881 ? as_type<float>(_1973) : _1847;
        _1987 = _1989;
    }
    float _1991 = _1987;
    float _1993 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1995 = fma(_1983, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1979);
    float _1997 = in.m_75.x;
    float _1999 = in.m_75.y;
    float _2001 = in.m_75.z;
    bool _2003 = _962 != 0.0;
    bool _2005 = isnan(_962);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(0.0);
    bool _2011 = _2007 || _2009;
    float _2013 = fma(_1993, _1991, -0.5);
    float _2015 = fma(_1911, _1947, _1995);
    float _2017 = -_650;
    float _2019 = fma(_876, _1977, _2017);
    bool _2021 = _960 == 0.0;
    bool _2023 = !_2011;
    bool _2025 = _2021 && _2023;
    float _2027 = fma(_880, _2013, _848);
    float _2029 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2015);
    if (_1815)
    {
        float _2031 = -_1847;
        float _2033 = _2031 + 1.0;
        _1953 = as_type<int>(_2033);
    }
    int _2035 = _1953;
    bool _2037 = _964 == 0.0;
    bool _2039 = _2037 && _2025;
    float _2041 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2043 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2047 = -_890;
    float _2049 = fma(_810, _1959, _2047);
    if (_1815)
    {
        float _2051 = _1871 ? as_type<float>(_2035) : _1847;
        _1967 = _2051;
    }
    float _2053 = _1967;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2057 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2061 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2063 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2065 = fma(_2043, _2053, -0.5);
    float _2067 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2069 = exp2(_2057);
    float _2071 = _2001;
    float _2073 = _1999;
    float _2075 = _1997;
    if (!_2039)
    {
        float _2077 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2001);
        _2071 = _2077;
    }
    float _2079 = _2071;
    if (!_2039)
    {
        float _2081 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1999);
        _2073 = _2081;
    }
    float _2083 = _2073;
    if (!_2039)
    {
        float _2085 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1997);
        _2075 = _2085;
    }
    float _2087 = _2075;
    out.m_77.x = _2061;
    out.m_77.y = _2063;
    out.m_77.z = _2067;
    out.m_77.w = _2041;
    float _2089 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2091 = -_2083;
    float _2093 = _1230 * _2091;
    float _2095 = _1248 * _2083;
    float _2097 = _1212 * _2083;
    float _2099 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2089);
    float _2101 = fma(_1244, _2087, _2093);
    float _2103 = fma(_1260, _2087, _2095);
    float _2105 = fma(_1252, _2087, _2097);
    float _2107 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2099);
    float _2109 = fma(_1246, _2079, _2101);
    float _2111 = fma(_1278, _2079, _2103);
    float _2113 = -_2069;
    float _2115 = _2113 + 1.0;
    float _2117 = fma(_1258, _2079, _2105);
    bool _2119 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2121 = isnan(_1502);
    bool _2123 = _2119 || _2121;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2127 = _2123 || _2125;
    float _2129 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2107);
    float _2131 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2133 = fma(_798, _2065, _900);
    out.m_79.x = _2109;
    out.m_79.y = _2111;
    out.m_79.z = _2117;
    float _2135 = _2129 + _1716;
    float _2137 = _2019 + 0.5;
    float _2139 = _2049 + 0.5;
    float _2141 = _2027 + 0.5;
    float _2143 = _2133 + 0.5;
    float _2145 = _2135 * 0.5;
    out.gl_Position.x = _1754;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _2129;
    out.gl_Position.w = _1716;
    float _2147 = _1716;
    float _2149 = _2145;
    if (!_2127)
    {
        _1342 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2151 = _1342;
    out.m_81.x = _2141;
    out.m_81.y = _2137;
    out.m_81.z = _2143;
    out.m_81.w = _2139;
    out.m_83.z = _2145;
    out.m_83.w = _1716;
    float _2153 = _2151;
    float _2155 = _2151;
    if (!_2127)
    {
        _1865 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2157 = _1865;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_2127)
    {
        _1867 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2163 = _1867;
    float _2165 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2167 = _2163;
    float _2169 = _2163;
    if (!_2127)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2171 = _2147;
    float _2173 = _2171;
    float _2175 = _2171;
    if (!_2127)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2177 = _2149;
    float _2179 = _2131 * _1778;
    float _2181 = -_2131;
    float _2183 = _2181 + 1.0;
    float _2185 = _1789 * _2179;
    float _2187 = _1799 * _2179;
    float _2189 = _1789 * _2183;
    float _2191 = _2183;
    float _2193 = _2177;
    float _2195 = _2177;
    if (!_2127)
    {
        _2191 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2197 = _2191;
    float _2199 = fma(_1795, _2185, _1783);
    float _2201 = fma(_1797, _2185, _1785);
    float _2203 = fma(_1789, _2187, _1787);
    out.m_85.x = _2199;
    out.m_85.y = _2201;
    out.m_85.z = _2203;
    out.m_85.w = _2189;
    bool _2205 = !_2127;
    float _2207 = _2197;
    float _2209 = _2197;
    if (!_2205)
    {
        bool _2211 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2213 = isnan(_1502);
        bool _2215 = _2211 || _2213;
        bool _2217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2219 = _2215 || _2217;
        if (!_2219)
        {
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2223 = _1502 + _2221;
            float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2227 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2225;
            float _2229 = 1.0 / _2227;
            float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2251 = _2223 * _2229;
            float _2253 = precise::clamp(_2251, 0.0, 1.0);
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2259 = fma(_2253, _2233, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2261 = fma(_2253, _2257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2263 = fma(_2253, _2237, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2265 = fma(_2253, _2241, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2267 = fma(_2253, _2245, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2269 = fma(_2253, _2249, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2169 = _2261;
            _2175 = _2267;
            _2161 = _2259;
            _2209 = _2265;
            _2155 = _2263;
            _2195 = _2269;
            _2271 = true;
        }
        else
        {
            bool _2273 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2275 = isnan(_1502);
            bool _2277 = _2273 || _2275;
            bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2281 = _2277 || _2279;
            if (!_2281)
            {
                _2159 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2283 = _2159;
            _2161 = _2283;
            if (!_2281)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2285 = _2167;
            _2169 = _2285;
            if (!_2281)
            {
                _2153 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2287 = _2153;
            _2155 = _2287;
            if (!_2281)
            {
                _2207 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2289 = _2207;
            _2209 = _2289;
            if (!_2281)
            {
                _2173 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2291 = _2173;
            _2175 = _2291;
            if (!_2281)
            {
                _2193 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2293 = _2193;
            bool _2295 = !_2281;
            _2195 = _2293;
            if (!_2295)
            {
                bool _2297 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2299 = isnan(_1502);
                bool _2301 = _2297 || _2299;
                bool _2303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2305 = _2301 || _2303;
                if (!_2305)
                {
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2309 = _1502 + _2307;
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2311;
                    float _2315 = 1.0 / _2313;
                    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2337 = _2309 * _2315;
                    float _2339 = precise::clamp(_2337, 0.0, 1.0);
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2345 = fma(_2339, _2319, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2347 = fma(_2339, _2343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2349 = fma(_2339, _2323, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2351 = fma(_2339, _2327, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2353 = fma(_2339, _2331, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2355 = fma(_2339, _2335, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2169 = _2347;
                    _2175 = _2353;
                    _2161 = _2345;
                    _2209 = _2351;
                    _2155 = _2349;
                    _2195 = _2355;
                    _2271 = true;
                }
                else
                {
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2175 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2161 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2209 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2155 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2195 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2271 = false;
    float _2357 = _2169;
    float _2359 = _2175;
    float _2361 = _2161;
    float _2363 = _2209;
    float _2365 = _2155;
    float _2367 = _2195;
    float _2369 = fma(_2111, -0.5, 0.5);
    float _2371 = precise::clamp(_2369, 0.0, 1.0);
    float _2373 = -_2357;
    float _2375 = _2373 + _2359;
    float _2377 = _2165 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2379 = -_2361;
    float _2381 = _2379 + _2363;
    float _2383 = fma(_2371, _2375, _2357);
    out.m_87.x = 0.0;
    float _2385 = -_2365;
    float _2387 = _2385 + _2367;
    float _2389 = fma(_2371, _2381, _2361);
    float _2391 = _2383 * 0.586610972881317138671875;
    out.m_47.x = _2377;
    bool _2393 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2395 = fma(_2371, _2387, _2365);
    float _2397 = fma(_2389, 0.298911988735198974609375, _2391);
    bool _2399 = _1478 > 0.0;
    bool _2401 = isnan(_1478);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(0.0);
    bool _2407 = _2403 || _2405;
    float _2409 = fma(_2395, 0.114477999508380889892578125, _2397);
    float _2411 = -_2409;
    float _2413 = _2389 + _2411;
    float _2415 = -_2409;
    float _2417 = _2383 + _2415;
    float _2419 = -_2409;
    float _2421 = _2395 + _2419;
    float _2423 = fma(_2413, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2409);
    float _2425 = fma(_2417, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2409);
    float _2427 = fma(_2421, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2409);
    bool _2429 = !_2393;
    if (!_2429)
    {
        float _2431 = -_1404;
        float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2435 = -_1406;
        float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2439 = -_1408;
        float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2443 = _2433 * _2433;
        float _2445 = fma(_2437, _2437, _2443);
        float _2447 = fma(_2441, _2441, _2445);
        float _2449 = sqrt(_2447);
        float _2451 = rsqrt(_2447);
        float _2453 = -_2449;
        float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2457 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        float _2461 = _2437 * _2451;
        float _2463 = _2433 * _2451;
        float _2465 = abs(_2459);
        float _2467 = log2(_2465);
        float _2469 = _2441 * _2451;
        float _2471 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2473 = _2111 * _2463;
        float _2475 = -_2463;
        float _2477 = -_2471;
        float _2479 = fma(_2475, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2477);
        float _2481 = fma(_2109, _2461, _2473);
        float _2483 = -_2469;
        float _2485 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2479);
        float _2487 = fma(_2117, _2469, _2481);
        float _2489 = precise::clamp(_2487, 0.0, 1.0);
        float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2493 = _2485 + _2491;
        float _2495 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2497 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2499 = precise::clamp(_2497, 0.0, 1.0);
        float _2501 = exp2(_2495);
        float _2503 = _2501 * _2499;
        float _2505 = _2489 * _2503;
        float _2507 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2509 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2511 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2507;
        out.m_87.y = _2509;
        out.m_87.z = _2511;
    }
    out.m_89.x = _2423;
    out.m_89.y = _2425;
    out.m_89.z = _2427;
    if (_2407)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2513 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2513;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2271 = false;
    bool _312 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _118 = 0;
    if (!_112)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2569 = as_type<float>(_122);
        out.gl_Position.z = _2569;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
    float _128 = float(_108);
    float _130 = 1.0 / _128;
    float _132 = -_126;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_126);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = _134 * _130;
    bool _148 = _134 >= _128;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    out.m_51.x = _146;
    float _154 = _126;
    float _156 = _146;
    float _158 = _134;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _154;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _162 = _160 * 5.0;
        _124 = as_type<int>(_162);
    }
    int _164 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2642 = as_type<float>(_164);
        out.gl_Position.z = _2642;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = in.m_53.y;
    float _168 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _170 = in.m_55.w;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_49.x;
    float _184 = in.m_49.y;
    float _186 = in.m_49.z;
    float _188 = in.m_44.x;
    float _190 = in.m_44.y;
    float _192 = in.m_44.z;
    float _194 = 0.0;
    float _196 = _168;
    if (!_180)
    {
        float _198 = _168 * _168;
        float _200 = _198 * 0.5;
        _194 = _200;
    }
    float _202 = _194;
    float _204 = _202;
    if (!_180)
    {
        float _206 = _202 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _206;
    }
    float _208 = _204;
    out.m_57.y = _166;
    bool _210 = !_180;
    float _212 = _208;
    float _214 = _166;
    if (!_210)
    {
        float _216 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = log2(_216);
        float _220 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _222 = _220 + 1.0;
        float _224 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = _168 * _218;
        float _228 = 1.0 / _222;
        float _230 = _224 * 0.693147182464599609375;
        float _232 = exp2(_226);
        float _234 = 1.0 / _230;
        float _236 = _232 + (-1.0);
        float _238 = -_236;
        float _240 = fma(_238, _234, _168);
        float _242 = _240 * _228;
        float _244 = _242 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _212 = _244;
    }
    float _246 = _212;
    bool _248 = !_180;
    if (!_248)
    {
        float _250 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _252 = log2(_250);
        float _254 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _256 = _254 + 1.0;
        float _258 = 1.0 / _256;
        float _260 = _168 * _252;
        float _262 = exp2(_260);
        float _264 = -_262;
        float _266 = _264 + 1.0;
        float _268 = _266 * _258;
        _196 = _268;
    }
    float _270 = _196;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _274 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _276 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _278 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _280 = fma(_270, _182, _274);
    float _282 = fma(_270, _184, _276);
    float _284 = fma(_270, _186, _278);
    float _286 = fma(_280, _170, _188);
    float _288 = fma(_282, _170, _190);
    float _290 = fma(_284, _170, _192);
    bool _292 = !_272;
    float _310;
    if (!_292)
    {
        float _294 = in.m_59.x;
        float _296 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _298 = _294 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _302 = _300 * _296;
        float _304 = floor(_302);
        float _306 = -_304;
        float _308 = _302 + _306;
        _310 = _308;
        _312 = true;
    }
    else
    {
        _310 = _146;
    }
    _312 = false;
    float _314 = _310;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _318 = _314 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _322 = _314 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _326 = _314 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _336;
    float _340 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _342 = _340 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _344 = 1.0 / _330;
    bool _346 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_314);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    bool _358 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_314);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = 1.0 / _334;
    float _372 = -_368;
    float _374 = _372 + 1.0;
    bool _376 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _378 = 1.0 / _342;
    float _380 = _318 * _344;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _384 = _314 + _382;
    float _386 = 1.0 / _338;
    float _388 = _322 * _370;
    bool _390 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _392 = isnan(_314);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = -_400;
    float _404 = _402 + 1.0;
    float _406 = _384 * _378;
    bool _408 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _410 = isnan(_314);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _420;
    float _424 = _418 * _404;
    float _426 = _326 * _386;
    bool _428 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _430 = isnan(_314);
    bool _432 = _428 || _430;
    bool _434 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _436 = _432 || _434;
    float _438 = float(_436);
    float _440 = -_418;
    float _442 = _440 + 1.0;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _444;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _448;
    float _452 = fma(_422, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _454 = _438 * _442;
    float _456 = -_438;
    float _458 = _456 + 1.0;
    float _460 = fma(_446, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _462 = fma(_450, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _464 = -_356;
    float _466 = _464 + 1.0;
    float _468 = _356 * _458;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _482 = _368 * _466;
    float _484 = fma(_472, _388, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _486 = fma(_476, _388, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _488 = fma(_480, _388, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _490 = _462 * _482;
    float _492 = _460 * _482;
    float _494 = _452 * _482;
    float _496 = in.m_55.x;
    float _498 = in.m_55.y;
    float _500 = in.m_55.z;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _502;
    float _506 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _490);
    float _508 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _492);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _514;
    float _518 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _494);
    float _520 = fma(_504, _426, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _522 = fma(_486, _468, _506);
    float _524 = fma(_484, _468, _508);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _534 = fma(_512, _426, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _536 = fma(_516, _426, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _542 = fma(_488, _468, _518);
    float _544 = fma(_528, _406, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _546 = fma(_532, _406, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _548 = fma(_540, _406, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _550 = fma(_534, _454, _524);
    float _552 = fma(_536, _454, _522);
    float _554 = fma(_520, _454, _542);
    float _556 = fma(_544, _424, _550);
    float _558 = fma(_546, _424, _552);
    float _560 = fma(_548, _424, _554);
    float _562 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[147].x, _556);
    float _564 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[147].y, _558);
    float _566 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[147].z, _560);
    float _568 = _562 * _496;
    float _570 = _564 * _498;
    float _572 = _566 * _500;
    bool _574 = !_376;
    if (!_574)
    {
        float _576 = in.m_59.x;
        float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _580 = _576 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _582 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _584 = _582 * _578;
        float _586 = floor(_584);
        float _588 = -_586;
        float _590 = _584 + _588;
        _156 = _590;
    }
    float _592 = _156;
    float _594 = in.m_59.z;
    float _596 = in.m_59.y;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _600 = _598 != 0;
    float _602 = in.m_59.x;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _606 = _604 != 0;
    int _608 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _610 = _608 != 0;
    int _612 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _614 = _612 != 0;
    float _616 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _618 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _620 = precise::max(_616, _618);
    bool _622 = _620 >= 16.0;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _626 = _594 * 2.0;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _630 = _596 * 2.0;
    float _632 = _596 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _634 = floor(_626);
    bool _636 = !_614;
    int _638 = _636 ? 0 : 1;
    float _640 = _602 * 2.0;
    float _642 = fma(_632, -2.0, _624);
    float _644 = _602 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _646 = !_610;
    int _648 = _646 ? 0 : 1;
    float _650 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _642);
    float _652 = floor(_630);
    float _654 = -_628;
    float _656 = fma(_644, 2.0, _654);
    float _658 = _602 + _596;
    float _660 = _658 + (-1.0);
    bool _662 = _634 > 0.0;
    float _664 = floor(_640);
    bool _666 = _634 >= 0.0;
    bool _668 = isnan(_634);
    bool _670 = _666 || _668;
    bool _672 = isnan(0.0);
    bool _674 = _670 || _672;
    float _676 = _602 + _594;
    float _678 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _680 = _674 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _682 = _676 + (-1.0);
    bool _684 = _652 >= 0.0;
    bool _686 = isnan(_652);
    bool _688 = _684 || _686;
    bool _690 = isnan(0.0);
    bool _692 = _688 || _690;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _696 = ~as_type<int>(_680);
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _704 = _700;
    float _706 = _652;
    float _708 = _680;
    float _710 = _682;
    float _712 = _592;
    if (!_662)
    {
        int _714 = ~as_type<int>(_680);
        int _716 = _714 + 1;
        _704 = _716;
    }
    int _718 = _704;
    bool _720 = _652 > 0.0;
    if (!_600)
    {
        _706 = _596;
    }
    float _722 = _706;
    float _724 = _722;
    if (!_600)
    {
        _708 = _594;
    }
    float _726 = _708;
    float _728 = _726;
    if (!_600)
    {
        _710 = _594;
    }
    float _730 = _710;
    bool _732 = !_606;
    int _734 = _732 ? 0 : 1;
    float _736 = _730;
    if (_600)
    {
        _724 = _602;
    }
    float _738 = _724;
    if (_600)
    {
        _728 = _596;
    }
    float _740 = _728;
    if (_600)
    {
        _736 = _596;
    }
    float _742 = _736;
    bool _744 = _664 > 0.0;
    float _746 = _740 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _748 = _664 >= 0.0;
    bool _750 = isnan(_664);
    bool _752 = _748 || _750;
    bool _754 = isnan(0.0);
    bool _756 = _752 || _754;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _762 = abs(_734);
    float _764 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[83].z, _758);
    float _766 = _738 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _768 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[83].w, _760);
    float _770 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _772 = log2(_770);
    float _774 = float(_718);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _778 = float(_762);
    float _780 = -_694;
    float _782 = fma(_766, 2.0, _780);
    int _784 = _756 ? 0 : 1;
    float _786 = fma(_746, -2.0, _776);
    int _788 = _692 ? 0 : 1;
    float _790 = _778 * _774;
    int _792 = ~_784;
    int _794 = _792 + 1;
    int _796 = _794 + 1;
    float _798 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _764);
    int _800 = _796;
    if (!_744)
    {
        int _802 = ~_784;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    float _808 = _790 * (-2.0);
    float _810 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _768);
    float _812 = _772 * _134;
    float _814 = in.m_61.x;
    float _816 = in.m_61.y;
    float _818 = in.m_61.z;
    int _820 = ~_788;
    int _822 = _820 + 1;
    int _824 = _822 + 1;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _828 = _824;
    if (!_720)
    {
        int _830 = ~_788;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = exp2(_812);
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _840 = 1.0 + _838;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _844 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[78].z, _826);
    float _846 = -_134;
    float _848 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[76].x, _656);
    bool _850 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _852 = isnan(1.0);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _858 = _854 || _856;
    float _860 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    int _862 = abs(_638);
    float _864 = 1.0 / _840;
    bool _866 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    bool _872 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _874 = _870 || _872;
    float _876 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _860);
    int _878 = abs(_648);
    float _880 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _844);
    float _882 = float(_862);
    float _884 = float(_834);
    float _886 = -_836;
    float _888 = _886 + 1.0;
    float _890 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _786);
    float _892 = float(_806);
    float _894 = _882 * _884;
    float _896 = _874 ? _888 : 0.0;
    float _898 = -_134;
    float _900 = fma(_898, (*spvDescriptorSet0.vp_c9)._m0[81].x, _782);
    float _902 = _894 * (-2.0);
    bool _904 = _858;
    if (_858)
    {
        float _906 = _896 * _864;
        _158 = _906;
    }
    float _908 = _158;
    float _910 = float(_878);
    float _912 = fma(_808, _814, _814);
    float _914 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _916 = fma(_678, _808, _678);
    float _918 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _920 = _910 * _892;
    float _922 = _602 + (-0.5);
    float _924 = _622 ? _914 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _926 = _596 + _594;
    float _928 = _622 ? _918 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _930 = fma(_922, (*spvDescriptorSet0.vp_c9)._m0[196].x, _912);
    float _932 = abs(_924);
    bool _934 = _932 != 0.0;
    bool _936 = isnan(_932);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _920 * (-2.0);
    float _946 = abs(_928);
    bool _948 = _946 == 0.0;
    float _950 = fma(_916, _908, _930);
    float _952 = abs(_928);
    bool _954 = _952 == 0.0;
    bool _956 = !_942;
    bool _958 = _954 && _956;
    float _960 = in.m_63.x;
    float _962 = in.m_63.y;
    float _964 = in.m_63.z;
    float _966 = _950 * 0.15915493667125701904296875;
    float _968 = _926 + (-1.0);
    float _970 = fma(_702, _902, _702);
    float _972 = fma(_902, _818, _818);
    float _974 = _966 * 6.283185482025146484375;
    float _976 = sin(_974);
    float _978 = fma(_944, _816, _816);
    float _980 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _982 = _594 + (-0.5);
    float _984 = _596 + (-0.5);
    int _986 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].y);
    int _988 = as_type<int>(_908);
    bool _990 = _948;
    if (_958)
    {
        bool _992 = as_type<int>(_928) >= 0;
        _904 = _992;
    }
    bool _994 = _904;
    float _996 = fma(_980, _944, _980);
    float _998 = _966 * 6.283185482025146484375;
    float _1000 = cos(_998);
    float _1002 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].y, _978);
    float _1004 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[196].z, _972);
    int _1006 = _994 ? (-1) : 0;
    if (_958)
    {
        int _1008 = _994 ? 0 : 1078530011;
        _986 = _1008;
    }
    int _1010 = _986;
    float _1012 = fma(_996, _908, _1002);
    float _1014 = fma(_970, _908, _1004);
    if (_958)
    {
        int _1016 = int(0x80000000) & as_type<int>(_924);
        int _1018 = _1010 | _1016;
        _988 = _1018;
    }
    int _1020 = _988;
    bool _1022 = !_942;
    bool _1024 = _1022 && _948;
    int _1026 = _1020;
    float _1028 = as_type<float>(_1020);
    if (!_1024)
    {
        float _1030 = abs(_924);
        bool _1032 = _1030 != as_type<float>(0x7f800000u /* inf */);
        bool _1034 = isnan(_1030);
        bool _1036 = _1032 || _1034;
        bool _1038 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1040 = _1036 || _1038;
        float _1042 = abs(_928);
        bool _1044 = _1042 == as_type<float>(0x7f800000u /* inf */);
        float _1046 = abs(_928);
        bool _1048 = _1046 == as_type<float>(0x7f800000u /* inf */);
        bool _1050 = !_1040;
        bool _1052 = _1048 && _1050;
        _990 = _1044;
        if (_1052)
        {
            bool _1054 = as_type<int>(_928) >= 0;
            _1006 = _1054 ? (-1) : 0;
        }
        int _1056 = _1006;
        if (_1052)
        {
            _1026 = 1075235812;
        }
        int _1058 = _1026;
        int _1060 = _1058;
        if (_1052)
        {
            int _1062 = ~_1056;
            int _1064 = (_1062 != 0) ? _1058 : 1061752795;
            _1060 = _1064;
        }
        int _1066 = _1060;
        float _1068 = as_type<float>(_1066);
        if (_1052)
        {
            int _1070 = int(0x80000000) & as_type<int>(_924);
            int _1072 = _1066 | _1070;
            _1068 = as_type<float>(_1072);
        }
        float _1074 = _1068;
        bool _1076 = !_1040;
        bool _1078 = _1076 && _1044;
        _1028 = _1074;
        if (!_1078)
        {
            float _1080 = abs(_924);
            float _1082 = abs(_928);
            float _1084 = precise::max(_1080, _1082);
            float _1086 = abs(_924);
            float _1088 = abs(_928);
            float _1090 = precise::min(_1086, _1088);
            float _1092 = 1.0 / _1084;
            float _1094 = abs(_924);
            float _1096 = abs(_928);
            bool _1098 = _1094 > _1096;
            bool _1100 = as_type<int>(_928) >= 0;
            float _1102 = abs(_924);
            float _1104 = abs(_928);
            float _1106 = _1102 + _1104;
            int _1108 = as_type<int>(_924) & int(0x80000000);
            bool _1110 = _1106 > as_type<float>(0x7f800000u /* inf */);
            bool _1112 = isnan(_1106);
            bool _1114 = _1110 || _1112;
            bool _1116 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1118 = _1114 || _1116;
            float _1120 = _1090 * _1092;
            float _1122 = _1120 * _1120;
            float _1124 = _1122 + 11.33538818359375;
            float _1126 = fma(_1122, _1124, 28.84246826171875);
            float _1128 = fma(_1122, _1126, 19.6966705322265625);
            float _1130 = fma(_1122, -0.82336294651031494140625, -5.674867153167724609375);
            float _1132 = fma(_1122, _1130, -6.565555095672607421875);
            float _1134 = 1.0 / _1128;
            float _1136 = _1122 * _1132;
            float _1138 = _1120 * _1136;
            float _1140 = fma(_1138, _1134, _1120);
            float _1142 = _1140;
            _1028 = _1106;
            if (_1098)
            {
                float _1144 = -_1140;
                float _1146 = _1144 + 1.57079637050628662109375;
                _1142 = _1146;
            }
            float _1148 = _1142;
            int _1150 = as_type<int>(_1148);
            if (!_1100)
            {
                float _1152 = -_1148;
                float _1154 = _1152 + 3.1415927410125732421875;
                _1150 = as_type<int>(_1154);
            }
            int _1156 = _1150;
            if (!_1118)
            {
                int _1158 = _1108 | _1156;
                _1028 = as_type<float>(_1158);
            }
        }
    }
    float _1160 = _1028;
    bool _1162 = _990;
    float _1164 = _1012 + _1160;
    float _1166 = _1014 * 0.15915493667125701904296875;
    float _1168 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1170 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1172 = _1164 * 0.15915493667125701904296875;
    float _1174 = _1166 * 6.283185482025146484375;
    float _1176 = cos(_1174);
    float _1178 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1168);
    float _1180 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1182 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1184 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1186 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _964);
    float _1188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _962);
    float _1190 = _1172 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1178);
    float _1196 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1170);
    float _1198 = _1180 * _1186;
    float _1200 = _568 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1202 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _960);
    float _1204 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1196);
    float _1206 = _1194 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1208 = _1172 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _976 * _1176;
    float _1214 = _1200 * _1202;
    float _1216 = _1204 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1218 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1220 = isnan(0.5);
    bool _1222 = _1218 || _1220;
    bool _1224 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1226 = _1222 || _1224;
    float _1228 = _1166 * 6.283185482025146484375;
    float _1230 = sin(_1228);
    float _1232 = _1182 * _1188;
    float _1234 = _1000 * _1192;
    float _1236 = _1212 * _1232;
    float _1238 = _976 * _1210;
    float _1240 = _976 * _1192;
    float _1242 = _1000 * _1210;
    float _1244 = _1210 * _1176;
    float _1246 = _1192 * _1176;
    float _1248 = _1000 * _1176;
    float _1250 = -_1234;
    float _1252 = fma(_1230, _1238, _1250);
    float _1254 = -_1232;
    float _1256 = _1230 * _1254;
    float _1258 = fma(_1230, _1240, _1242);
    float _1260 = fma(_1230, _1242, _1240);
    float _1262 = fma(_1252, _1214, _1236);
    float _1264 = fma(_1244, _1214, _1256);
    float _1266 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1184);
    float _1268 = _1248 * _1232;
    float _1270 = fma(_1258, _1198, _1262);
    float _1272 = fma(_1246, _1198, _1264);
    float _1274 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1266);
    float _1276 = -_1238;
    float _1278 = fma(_1230, _1234, _1276);
    float _1280 = _1206 + _1270;
    float _1282 = _1216 + _1272;
    float _1284 = _1274 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1286 = fma(_1260, _1214, _1268);
    float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1290 = _1280 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1294 = _1282 + _1292;
    float _1296 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1298 = _1284 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1300 = _1290 * _1290;
    float _1302 = fma(_1278, _1198, _1286);
    float _1304 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1296);
    float _1306 = fma(_1294, _1294, _1300);
    float _1308 = _1284 + _1302;
    float _1310 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1304);
    float _1312 = sqrt(_1306);
    float _1314 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1316 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1298);
    float _1318 = fma(_1206, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1316);
    float _1320 = 1.0 / _1314;
    float _1322 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1324 = _1322 + _1314;
    bool _1326 = _1312 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1328 = _1314;
    float _1330 = _1302;
    float _1332 = _1214;
    float _1334 = _1206;
    float _1336 = _1234;
    float _1338 = _1282;
    bool _1340 = _1162;
    float _1342 = _1258;
    if (_1226)
    {
        _1328 = 1.0;
    }
    float _1344 = _1328;
    float _1346 = _1324 * _1320;
    float _1348 = _1346 * 0.5;
    float _1350 = _1320;
    float _1352 = _1344;
    if (!_1326)
    {
        _1330 = _1282;
    }
    float _1354 = _1330;
    float _1356 = _1354;
    if (!_1326)
    {
        _1332 = _1280;
    }
    float _1358 = _1332;
    float _1360 = _1358;
    if (!_1326)
    {
        _1350 = _1308;
    }
    float _1362 = _1350;
    bool _1364 = !_1326;
    float _1366 = _1362;
    if (!_1364)
    {
        float _1368 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1372 = _1312 + _1370;
        float _1374 = _1308 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1376 = rsqrt(_1306);
        float _1378 = _1372 * _1368;
        float _1380 = _1378 * 0.15915493667125701904296875;
        float _1382 = _1380 * 6.283185482025146484375;
        float _1384 = cos(_1382);
        float _1386 = _1380 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        float _1390 = _1384 + (-1.0);
        float _1392 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1394 = fma(_1388, _1374, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1396 = fma(_1308, _1384, _1392);
        float _1398 = _1376 * _1394;
        float _1400 = fma(_1294, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1402 = fma(_1290, _1398, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1366 = _1396;
        _1356 = _1400;
        _1360 = _1402;
        _1334 = _1398;
    }
    float _1404 = _1366;
    float _1406 = _1356;
    float _1408 = _1360;
    float _1410 = _1334;
    float _1412 = _1410;
    if (!_1226)
    {
        float _1414 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1416 = _1414 * 0.15915493667125701904296875;
        float _1418 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1422 = fma(_1348, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1420);
        float _1424 = _1416 * 6.283185482025146484375;
        float _1426 = cos(_1424);
        float _1428 = _1418 * 0.15915493667125701904296875;
        float _1430 = _1416 * 6.283185482025146484375;
        float _1432 = sin(_1430);
        float _1434 = 1.0 / _1426;
        float _1436 = _1428 * 6.283185482025146484375;
        float _1438 = cos(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = _1428 * 6.283185482025146484375;
        float _1444 = sin(_1442);
        float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1448 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1446;
        float _1450 = _1438 * _1440;
        float _1452 = 1.0 / _1422;
        float _1454 = 1.0 / _1450;
        float _1456 = 1.0 / _1448;
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1460 = _1452 * _1458;
        float _1462 = _1444 * _1454;
        float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1466 = fma(_1462, _1460, _1464);
        float _1468 = _1466 * _1456;
        float _1470 = precise::clamp(_1468, 0.0, 1.0);
        _1336 = _1428;
        _1338 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
        _1412 = _1454;
        _1352 = _1470;
    }
    float _1472 = _1336;
    float _1474 = _1338;
    float _1476 = _1412;
    float _1478 = _1352;
    float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1482 = _1404 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1486 = _1406 + _1484;
    float _1488 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1490 = _1408 + _1488;
    float _1492 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1494 = _1482 * _1482;
    float _1496 = fma(_1486, _1486, _1494);
    float _1498 = fma(_1490, _1490, _1496);
    float _1500 = rsqrt(_1498);
    float _1502 = sqrt(_1498);
    float _1504 = _1500 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1506 = _1486 * _1504;
    float _1508 = _1490 * _1504;
    float _1510 = _1506 * _1506;
    float _1512 = _1508 * _1508;
    float _1514 = _1510 + _1512;
    float _1516 = sqrt(_1514);
    bool _1518 = _1516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1520 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1522 = _1516 + _1520;
    float _1524 = _1472;
    float _1526 = _1514;
    float _1528 = _1522;
    float _1530 = _1474;
    float _1532 = _1504;
    float _1534 = _1506;
    float _1536 = _1508;
    float _1538 = _1510;
    float _1540 = _1512;
    if (_1518)
    {
        float _1542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1524 = _1542;
    }
    float _1544 = _1524;
    if (_1518)
    {
        float _1546 = rsqrt(_1514);
        _1526 = _1546;
    }
    float _1548 = _1526;
    if (_1518)
    {
        float _1550 = _1522 * _1544;
        _1528 = _1550;
    }
    float _1552 = _1528;
    if (_1518)
    {
        float _1554 = _1552 * 0.15915493667125701904296875;
        _1530 = _1554;
    }
    float _1556 = _1530;
    float _1558 = _1544;
    if (_1518)
    {
        float _1560 = _1556 * 6.283185482025146484375;
        float _1562 = sin(_1560);
        _1558 = _1562;
    }
    float _1564 = _1558;
    float _1566 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1568 = precise::max(0.0, _1566);
    float _1570 = _1476;
    float _1572 = _1568;
    if (_1518)
    {
        float _1574 = _1556 * 6.283185482025146484375;
        float _1576 = cos(_1574);
        _1570 = _1576;
    }
    float _1578 = _1570;
    float _1580 = -_1504;
    float _1582 = -_1568;
    float _1584 = fma(_1482, _1580, _1582);
    float _1586 = _1584;
    if (_1518)
    {
        float _1588 = _1584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1588;
    }
    float _1590 = _1572;
    float _1592 = _1564;
    float _1594 = _1590;
    if (_1518)
    {
        float _1596 = fma(_1564, _1590, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1592 = _1596;
    }
    float _1598 = _1592;
    float _1600 = _1598;
    if (_1518)
    {
        float _1602 = _1578 + (-1.0);
        _1594 = _1602;
    }
    float _1604 = _1594;
    if (_1518)
    {
        float _1606 = _1548 * _1598;
        _1532 = _1606;
    }
    float _1608 = _1532;
    if (_1518)
    {
        float _1610 = _1604 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1600 = _1610;
    }
    float _1612 = _1600;
    if (_1518)
    {
        float _1614 = _1506 * _1608;
        _1534 = _1614;
    }
    float _1616 = _1534;
    if (_1518)
    {
        float _1618 = _1508 * _1608;
        _1536 = _1618;
    }
    float _1620 = _1536;
    if (_1518)
    {
        float _1622 = fma(_1584, _1578, _1612);
        _1586 = _1622;
    }
    float _1624 = _1586;
    if (_1518)
    {
        float _1626 = _1616 * _1616;
        _1538 = _1626;
    }
    float _1628 = _1538;
    if (_1518)
    {
        float _1630 = _1620 * _1620;
        _1540 = _1630;
    }
    float _1632 = _1540;
    float _1634 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1636 = fma(_1624, _1624, _1628);
    float _1638 = _1636 + _1632;
    float _1640 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1642 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1640);
    float _1644 = precise::clamp(_1642, 0.0, 1.0);
    float _1646 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    float _1648 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1652 = -_1644;
    float _1654 = _1652 + 1.0;
    float _1656 = rsqrt(_1638);
    float _1658 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1660 = _1404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1662 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1664 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1650);
    float _1666 = _1658 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1668 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1660);
    float _1670 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1662);
    float _1672 = abs(_1654);
    float _1674 = log2(_1672);
    float _1676 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1678 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1668);
    float _1680 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1682 = fma(_1408, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1664);
    float _1684 = -_1676;
    float _1686 = fma(_1684, _1492, 1.0);
    float _1688 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1690 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1692 = _1656 * _1616;
    float _1694 = _1682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1696 = _1656 * _1624;
    float _1698 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1690);
    float _1700 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1702 = _1656 * _1620;
    float _1704 = log2(_1686);
    float _1706 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1698);
    float _1708 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1710 = -_1700;
    float _1712 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1710);
    float _1714 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1716 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1706);
    float _1718 = -_1702;
    float _1720 = fma(_1718, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1712);
    float _1722 = exp2(_1708);
    float _1724 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1714);
    float _1728 = fma(_1720, -0.5, 0.5);
    float _1730 = fma(_1720, 0.5, 0.5);
    float _1732 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1734 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1736 = 1.0 / _1716;
    float _1738 = _1696 + 1.0;
    float _1740 = fma(_1730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1742 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1732);
    float _1744 = _1704 * 0.693147182464599609375;
    float _1746 = fma(_1730, _1740, -0.212114393711090087890625);
    float _1748 = sqrt(_1728);
    float _1750 = -_1696;
    float _1752 = fma(_1722, _1738, _1750);
    float _1754 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1756 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1734);
    float _1758 = fma(_1730, _1746, 1.570728778839111328125);
    float _1760 = _1744 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1762 = _1754 * _1736;
    float _1764 = _1756 * _1736;
    float _1766 = fma(_1762, 0.5, 0.5);
    float _1768 = fma(_1764, -0.5, 0.5);
    float _1770 = fma(_1752, 0.5, 0.5);
    float _1772 = _1748 * 0.636619746685028076171875;
    float _1774 = -_1758;
    float _1776 = fma(_1772, _1774, 1.0);
    float3 _5165 = float3(_1766, _1768, _1760);
    float _1778 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5165, float3(0.0), isnan(_5165)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5165, float3(0.0), isnan(_5165)), level(0.0)).x;
    float3 _5176 = float3(_1766, _1768, _1760);
    float4 _1781 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5176, float3(0.0), isnan(_5176)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5176, float3(0.0), isnan(_5176)), level(0.0)).xyzw;
    float _1783 = _1781.x;
    float _1785 = _1781.y;
    float _1787 = _1781.z;
    float _1789 = _1781.w;
    float2 _5193 = float2(_1776, _1770);
    float3 _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5193, float2(0.0), isnan(_5193)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5193, float2(0.0), isnan(_5193)), level(0.0)).xyz;
    float _1795 = _1793.x;
    float _1797 = _1793.y;
    float _1799 = _1793.z;
    float _1801 = in.m_65.w;
    float _1803 = in.m_59.w;
    float _1805 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1807 = _1805 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1811 = _1809 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1815 = _1813 != 0;
    out.m_67.x = _1200;
    out.m_67.y = _1182;
    out.m_67.z = _1180;
    float _1817 = 1.0 / _1807;
    int _1819 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1821 = _1819 != 0;
    out.m_69.x = _1406;
    out.m_69.y = _1404;
    out.m_69.z = _1408;
    bool _1823 = _596 > 0.5;
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1825;
    float _1829 = -_166;
    float _1831 = _1829 + 1.0;
    float _1833 = 1.0 / _1811;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1837 = _1835 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1841 = _1839 != 0;
    out.m_71.w = _1801;
    float _1843 = _1827 * _1817;
    float _1845 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1847 = in.m_53.x;
    bool _1849 = _1803 > 0.5;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1855 = _1853 != 0;
    float _1857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1859 = _1849 ? as_type<int>(_1831) : as_type<int>(_166);
    float _1861 = _1837 * _1833;
    bool _1863 = _1849;
    float _1865 = _1756;
    float _1867 = _1754;
    if (_1815)
    {
        bool _1869 = _594 > 0.5;
        _1863 = _1869;
    }
    bool _1871 = _1863;
    float _1873 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1877 = _592 + _1875;
    if (_1821)
    {
        bool _1879 = _602 > 0.5;
        _1340 = _1879;
    }
    bool _1881 = _1340;
    float _1883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1887 = _592 + _1885;
    bool _1889 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1891 = isnan(_592);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1897 = _1893 || _1895;
    float _1899 = float(_1897);
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1903 = _1845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1905 = _1851 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1907 = _1873 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1909 = fma(_1843, _1877, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1911 = fma(_1861, _1887, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1913 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1915 = isnan(_592);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = -_1899;
    float _1927 = _1925 + 1.0;
    float _1929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1931 = _1841 ? as_type<float>(_1859) : _166;
    out.m_73.x = _1903;
    out.m_73.y = _1905;
    out.m_73.z = _1907;
    out.m_73.w = _1901;
    float _1933 = _1857 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1935 = _592 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1937 = isnan(_592);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = _1923 * _1927;
    float _1949 = -_1923;
    float _1951 = _1949 + 1.0;
    int _1953 = as_type<int>(_1933);
    if (_1855)
    {
        float _1955 = _1823 ? _1831 : _166;
        _214 = _1955;
    }
    float _1957 = _214;
    float _1959 = fma(_1931, _1933, -0.5);
    float _1961 = _1883 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1963 = _1945 * _1951;
    int _1965 = as_type<int>(_1883);
    float _1967 = _1847;
    if (_1821)
    {
        float _1969 = -_1847;
        float _1971 = _1969 + 1.0;
        _1965 = as_type<int>(_1971);
    }
    int _1973 = _1965;
    if (!_1821)
    {
        _712 = _1847;
    }
    float _1975 = _712;
    float _1977 = fma(_1961, _1957, -0.5);
    float _1979 = _1909 * _1963;
    float _1981 = -_1945;
    float _1983 = _1981 + 1.0;
    float _1985 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1987 = _1975;
    if (_1821)
    {
        float _1989 = _1881 ? as_type<float>(_1973) : _1847;
        _1987 = _1989;
    }
    float _1991 = _1987;
    float _1993 = _1929 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1995 = fma(_1983, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1979);
    float _1997 = in.m_75.x;
    float _1999 = in.m_75.y;
    float _2001 = in.m_75.z;
    bool _2003 = _962 != 0.0;
    bool _2005 = isnan(_962);
    bool _2007 = _2003 || _2005;
    bool _2009 = isnan(0.0);
    bool _2011 = _2007 || _2009;
    float _2013 = fma(_1993, _1991, -0.5);
    float _2015 = fma(_1911, _1947, _1995);
    float _2017 = -_650;
    float _2019 = fma(_876, _1977, _2017);
    bool _2021 = _960 == 0.0;
    bool _2023 = !_2011;
    bool _2025 = _2021 && _2023;
    float _2027 = fma(_880, _2013, _848);
    float _2029 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[117].x, _2015);
    if (_1815)
    {
        float _2031 = -_1847;
        float _2033 = _2031 + 1.0;
        _1953 = as_type<int>(_2033);
    }
    int _2035 = _1953;
    bool _2037 = _964 == 0.0;
    bool _2039 = _2037 && _2025;
    float _2041 = _2029 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2043 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2047 = -_890;
    float _2049 = fma(_810, _1959, _2047);
    if (_1815)
    {
        float _2051 = _1871 ? as_type<float>(_2035) : _1847;
        _1967 = _2051;
    }
    float _2053 = _1967;
    float _2055 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2057 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2061 = _2045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2063 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2065 = fma(_2043, _2053, -0.5);
    float _2067 = _2059 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2069 = exp2(_2057);
    float _2071 = _2001;
    float _2073 = _1999;
    float _2075 = _1997;
    if (!_2039)
    {
        float _2077 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2001);
        _2071 = _2077;
    }
    float _2079 = _2071;
    if (!_2039)
    {
        float _2081 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1999);
        _2073 = _2081;
    }
    float _2083 = _2073;
    if (!_2039)
    {
        float _2085 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1997);
        _2075 = _2085;
    }
    float _2087 = _2075;
    out.m_77.x = _2061;
    out.m_77.y = _2063;
    out.m_77.z = _2067;
    out.m_77.w = _2041;
    float _2089 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2091 = -_2083;
    float _2093 = _1230 * _2091;
    float _2095 = _1248 * _2083;
    float _2097 = _1212 * _2083;
    float _2099 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2089);
    float _2101 = fma(_1244, _2087, _2093);
    float _2103 = fma(_1260, _2087, _2095);
    float _2105 = fma(_1252, _2087, _2097);
    float _2107 = fma(_1666, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2099);
    float _2109 = fma(_1246, _2079, _2101);
    float _2111 = fma(_1278, _2079, _2103);
    float _2113 = -_2069;
    float _2115 = _2113 + 1.0;
    float _2117 = fma(_1258, _2079, _2105);
    bool _2119 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2121 = isnan(_1502);
    bool _2123 = _2119 || _2121;
    bool _2125 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2127 = _2123 || _2125;
    float _2129 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2107);
    float _2131 = _2115 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2133 = fma(_798, _2065, _900);
    out.m_79.x = _2109;
    out.m_79.y = _2111;
    out.m_79.z = _2117;
    float _2135 = _2129 + _1716;
    float _2137 = _2019 + 0.5;
    float _2139 = _2049 + 0.5;
    float _2141 = _2027 + 0.5;
    float _2143 = _2133 + 0.5;
    float _2145 = _2135 * 0.5;
    out.gl_Position.x = _1754;
    out.gl_Position.y = _1756;
    out.gl_Position.z = _2129;
    out.gl_Position.w = _1716;
    float _2147 = _1716;
    float _2149 = _2145;
    if (!_2127)
    {
        _1342 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2151 = _1342;
    out.m_81.x = _2141;
    out.m_81.y = _2137;
    out.m_81.z = _2143;
    out.m_81.w = _2139;
    out.m_83.z = _2145;
    out.m_83.w = _1716;
    float _2153 = _2151;
    float _2155 = _2151;
    if (!_2127)
    {
        _1865 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2157 = _1865;
    float _2159 = _2157;
    float _2161 = _2157;
    if (!_2127)
    {
        _1867 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2163 = _1867;
    float _2165 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2167 = _2163;
    float _2169 = _2163;
    if (!_2127)
    {
        _2147 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2171 = _2147;
    float _2173 = _2171;
    float _2175 = _2171;
    if (!_2127)
    {
        _2149 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2177 = _2149;
    float _2179 = _2131 * _1778;
    float _2181 = -_2131;
    float _2183 = _2181 + 1.0;
    float _2185 = _1789 * _2179;
    float _2187 = _1799 * _2179;
    float _2189 = _1789 * _2183;
    float _2191 = _2183;
    float _2193 = _2177;
    float _2195 = _2177;
    if (!_2127)
    {
        _2191 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2197 = _2191;
    float _2199 = fma(_1795, _2185, _1783);
    float _2201 = fma(_1797, _2185, _1785);
    float _2203 = fma(_1789, _2187, _1787);
    out.m_85.x = _2199;
    out.m_85.y = _2201;
    out.m_85.z = _2203;
    out.m_85.w = _2189;
    bool _2205 = !_2127;
    float _2207 = _2197;
    float _2209 = _2197;
    if (!_2205)
    {
        bool _2211 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2213 = isnan(_1502);
        bool _2215 = _2211 || _2213;
        bool _2217 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2219 = _2215 || _2217;
        if (!_2219)
        {
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2223 = _1502 + _2221;
            float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2227 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2225;
            float _2229 = 1.0 / _2227;
            float _2231 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2233 = _2231 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2235 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2237 = _2235 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2239 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2241 = _2239 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2245 = _2243 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2249 = _2247 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2251 = _2223 * _2229;
            float _2253 = precise::clamp(_2251, 0.0, 1.0);
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2259 = fma(_2253, _2233, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2261 = fma(_2253, _2257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2263 = fma(_2253, _2237, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2265 = fma(_2253, _2241, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2267 = fma(_2253, _2245, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2269 = fma(_2253, _2249, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2169 = _2261;
            _2175 = _2267;
            _2161 = _2259;
            _2209 = _2265;
            _2155 = _2263;
            _2195 = _2269;
            _2271 = true;
        }
        else
        {
            bool _2273 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2275 = isnan(_1502);
            bool _2277 = _2273 || _2275;
            bool _2279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2281 = _2277 || _2279;
            if (!_2281)
            {
                _2159 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2283 = _2159;
            _2161 = _2283;
            if (!_2281)
            {
                _2167 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2285 = _2167;
            _2169 = _2285;
            if (!_2281)
            {
                _2153 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2287 = _2153;
            _2155 = _2287;
            if (!_2281)
            {
                _2207 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2289 = _2207;
            _2209 = _2289;
            if (!_2281)
            {
                _2173 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2291 = _2173;
            _2175 = _2291;
            if (!_2281)
            {
                _2193 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2293 = _2193;
            bool _2295 = !_2281;
            _2195 = _2293;
            if (!_2295)
            {
                bool _2297 = _1502 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2299 = isnan(_1502);
                bool _2301 = _2297 || _2299;
                bool _2303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2305 = _2301 || _2303;
                if (!_2305)
                {
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2309 = _1502 + _2307;
                    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2311;
                    float _2315 = 1.0 / _2313;
                    float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2323 = _2321 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2329 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2331 = _2329 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2335 = _2333 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2337 = _2309 * _2315;
                    float _2339 = precise::clamp(_2337, 0.0, 1.0);
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2345 = fma(_2339, _2319, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2347 = fma(_2339, _2343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2349 = fma(_2339, _2323, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2351 = fma(_2339, _2327, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2353 = fma(_2339, _2331, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2355 = fma(_2339, _2335, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2169 = _2347;
                    _2175 = _2353;
                    _2161 = _2345;
                    _2209 = _2351;
                    _2155 = _2349;
                    _2195 = _2355;
                    _2271 = true;
                }
                else
                {
                    _2169 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2175 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2161 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2209 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2155 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2195 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2271 = false;
    float _2357 = _2169;
    float _2359 = _2175;
    float _2361 = _2161;
    float _2363 = _2209;
    float _2365 = _2155;
    float _2367 = _2195;
    float _2369 = fma(_2111, -0.5, 0.5);
    float _2371 = precise::clamp(_2369, 0.0, 1.0);
    float _2373 = -_2357;
    float _2375 = _2373 + _2359;
    float _2377 = _2165 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2379 = -_2361;
    float _2381 = _2379 + _2363;
    float _2383 = fma(_2371, _2375, _2357);
    out.m_87.x = 0.0;
    float _2385 = -_2365;
    float _2387 = _2385 + _2367;
    float _2389 = fma(_2371, _2381, _2361);
    float _2391 = _2383 * 0.586610972881317138671875;
    out.m_47.x = _2377;
    bool _2393 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2395 = fma(_2371, _2387, _2365);
    float _2397 = fma(_2389, 0.298911988735198974609375, _2391);
    bool _2399 = _1478 > 0.0;
    bool _2401 = isnan(_1478);
    bool _2403 = _2399 || _2401;
    bool _2405 = isnan(0.0);
    bool _2407 = _2403 || _2405;
    float _2409 = fma(_2395, 0.114477999508380889892578125, _2397);
    float _2411 = -_2409;
    float _2413 = _2389 + _2411;
    float _2415 = -_2409;
    float _2417 = _2383 + _2415;
    float _2419 = -_2409;
    float _2421 = _2395 + _2419;
    float _2423 = fma(_2413, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2409);
    float _2425 = fma(_2417, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2409);
    float _2427 = fma(_2421, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2409);
    bool _2429 = !_2393;
    if (!_2429)
    {
        float _2431 = -_1404;
        float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2435 = -_1406;
        float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2439 = -_1408;
        float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2443 = _2433 * _2433;
        float _2445 = fma(_2437, _2437, _2443);
        float _2447 = fma(_2441, _2441, _2445);
        float _2449 = sqrt(_2447);
        float _2451 = rsqrt(_2447);
        float _2453 = -_2449;
        float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2457 = _2455 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2459 = precise::clamp(_2457, 0.0, 1.0);
        float _2461 = _2437 * _2451;
        float _2463 = _2433 * _2451;
        float _2465 = abs(_2459);
        float _2467 = log2(_2465);
        float _2469 = _2441 * _2451;
        float _2471 = _2461 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2473 = _2111 * _2463;
        float _2475 = -_2463;
        float _2477 = -_2471;
        float _2479 = fma(_2475, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2477);
        float _2481 = fma(_2109, _2461, _2473);
        float _2483 = -_2469;
        float _2485 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2479);
        float _2487 = fma(_2117, _2469, _2481);
        float _2489 = precise::clamp(_2487, 0.0, 1.0);
        float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2493 = _2485 + _2491;
        float _2495 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2497 = _2493 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2499 = precise::clamp(_2497, 0.0, 1.0);
        float _2501 = exp2(_2495);
        float _2503 = _2501 * _2499;
        float _2505 = _2489 * _2503;
        float _2507 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2509 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2511 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2507;
        out.m_87.y = _2509;
        out.m_87.z = _2511;
    }
    out.m_89.x = _2423;
    out.m_89.y = _2425;
    out.m_89.z = _2427;
    if (_2407)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2513 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2513;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

