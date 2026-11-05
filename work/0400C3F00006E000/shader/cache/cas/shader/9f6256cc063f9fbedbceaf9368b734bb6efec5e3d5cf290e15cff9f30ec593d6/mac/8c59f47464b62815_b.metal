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
    float4 m_83 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_57 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_71 [[user(locn11)]];
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2125 = false;
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
        float _2423 = as_type<float>(_122);
        out.gl_Position.z = _2423;
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
        float _2496 = as_type<float>(_164);
        out.gl_Position.z = _2496;
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
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _314 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _314 + _336;
    bool _340 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _342 = isnan(_314);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = 1.0 / _326;
    bool _354 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _356 = isnan(_314);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_350;
    float _368 = _366 + 1.0;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _334;
    float _374 = _364 * _368;
    float _376 = -_364;
    float _378 = _376 + 1.0;
    float _380 = 1.0 / _330;
    float _382 = _318 * _352;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = _322 * _372;
    bool _396 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _398 = isnan(_314);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _412 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _414 = isnan(_314);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = _338 * _380;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _430;
    float _434 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = -_406;
    float _442 = _440 + 1.0;
    float _444 = fma(_432, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = _406 * _378;
    float _448 = fma(_426, _428, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = fma(_438, _428, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _452 = fma(_410, _428, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _454 = _422 * _442;
    float _456 = in.m_55.x;
    float _458 = in.m_55.y;
    float _460 = in.m_55.z;
    float _462 = -_422;
    float _464 = _462 + 1.0;
    float _466 = _434 * _454;
    float _468 = _392 * _454;
    float _470 = _444 * _454;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _476;
    float _480 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _482 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _490 = fma(_478, _394, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _492 = fma(_450, _446, _482);
    float _494 = fma(_474, _394, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_486, _394, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _498 = fma(_448, _446, _480);
    float _500 = fma(_452, _446, _488);
    float _502 = fma(_490, _374, _492);
    float _504 = fma(_494, _374, _498);
    float _506 = fma(_496, _374, _500);
    float _508 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _512 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[146].z, _506);
    float _514 = _508 * _458;
    float _516 = _510 * _456;
    float _518 = _512 * _460;
    bool _520 = !_370;
    if (!_520)
    {
        float _522 = in.m_59.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _156 = _536;
    }
    float _538 = _156;
    float _540 = in.m_59.y;
    float _542 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _544 = in.m_59.z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _550 = _548 != 0;
    float _552 = in.m_59.x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _556 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _568 = _566 != 0;
    float _570 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _572 = !_564;
    int _574 = _572 ? 0 : 1;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _578 = !_568;
    int _580 = _578 ? 0 : 1;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _584 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _586 = _544 * 2.0;
    float _588 = fma(_584, -2.0, _546);
    float _590 = _540 * 2.0;
    float _592 = _552 * 2.0;
    float _594 = floor(_586);
    float _596 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _598 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _588);
    float _600 = -_554;
    float _602 = fma(_596, 2.0, _600);
    float _604 = floor(_592);
    float _606 = _552 + _540;
    float _608 = -_134;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[76].x, _602);
    float _612 = _606 + (-1.0);
    float _614 = floor(_590);
    bool _616 = _594 > 0.0;
    float _618 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _620 = _594 >= 0.0;
    bool _622 = isnan(_594);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    float _630 = _594;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _634 = _612;
    bool _636 = _564;
    float _638 = _538;
    if (!_550)
    {
        _630 = _540;
    }
    float _640 = _630;
    float _642 = _640;
    if (!_550)
    {
        _632 = _544;
    }
    float _644 = _632;
    float _646 = _644;
    if (!_550)
    {
        _634 = _544;
    }
    float _648 = _634;
    float _650 = _648;
    if (_550)
    {
        _642 = _552;
    }
    float _652 = _642;
    if (_550)
    {
        _646 = _540;
    }
    float _654 = _646;
    if (_550)
    {
        _650 = _540;
    }
    float _656 = _650;
    bool _658 = _604 > 0.0;
    float _660 = _654 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _662 = _604 >= 0.0;
    bool _664 = isnan(_604);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[83].w, _576);
    bool _674 = !_560;
    int _676 = _674 ? 0 : 1;
    int _678 = _628 ? 0 : 1;
    float _680 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _672);
    bool _682 = _614 > 0.0;
    bool _684 = _614 >= 0.0;
    bool _686 = isnan(_614);
    bool _688 = _684 || _686;
    bool _690 = isnan(0.0);
    bool _692 = _688 || _690;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _696 = _692 ? 0 : 1;
    float _698 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[83].z, _694);
    float _700 = _652 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _702 = ~_678;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _710 = log2(_708);
    int _712 = abs(_676);
    float _714 = -_582;
    float _716 = fma(_700, 2.0, _714);
    int _718 = _706;
    if (!_616)
    {
        int _720 = ~_678;
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _728 = ~_696;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _698);
    int _736 = _732;
    if (!_682)
    {
        int _738 = ~_696;
        int _740 = _738 + 1;
        _736 = _740;
    }
    int _742 = _736;
    float _744 = fma(_660, -2.0, _726);
    float _746 = float(_712);
    float _748 = float(_724);
    int _750 = _670 ? 0 : 1;
    float _752 = _710 * _134;
    float _754 = _746 * _748;
    float _756 = in.m_61.x;
    float _758 = in.m_61.y;
    float _760 = in.m_61.z;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _764 = ~_750;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    float _770 = exp2(_752);
    int _772 = _768;
    if (!_658)
    {
        int _774 = ~_750;
        int _776 = _774 + 1;
        _772 = _776;
    }
    int _778 = _772;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _782 = 1.0 + _780;
    float _784 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _762);
    bool _786 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _788 = isnan(1.0);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _794 = _790 || _792;
    float _796 = _754 * (-2.0);
    bool _798 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _806 = _802 || _804;
    float _808 = 1.0 / _782;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _812 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _784);
    int _814 = abs(_574);
    float _816 = _552 + (-0.5);
    float _818 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].w, _810);
    float _820 = float(_778);
    float _822 = fma(_618, _796, _618);
    float _824 = -_770;
    float _826 = _824 + 1.0;
    float _828 = float(_814);
    float _830 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _818);
    float _832 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _744);
    float _834 = fma(_796, _756, _756);
    float _836 = _806 ? _826 : 0.0;
    float _838 = -_134;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[81].x, _716);
    int _842 = abs(_580);
    float _844 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[196].x, _834);
    float _846 = _540 + _544;
    if (_794)
    {
        float _848 = _836 * _808;
        _158 = _848;
    }
    float _850 = _158;
    float _852 = _828 * _820;
    float _854 = _846 + (-1.0);
    float _856 = fma(_822, _850, _844);
    float _858 = float(_842);
    float _860 = _852 * (-2.0);
    float _862 = float(_742);
    float _864 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _866 = _552 + _544;
    float _868 = fma(_860, _758, _758);
    float _870 = _856 * 0.15915493667125701904296875;
    float _872 = _858 * _862;
    float _874 = _540 + (-0.5);
    float _876 = fma(_864, _860, _864);
    float _878 = _866 + (-1.0);
    float _880 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].y, _868);
    float _882 = _872 * (-2.0);
    float _884 = _870 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = fma(_876, _850, _880);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _892 = fma(_882, _760, _760);
    float _894 = _544 + (-0.5);
    float _896 = _888 * 0.15915493667125701904296875;
    float _898 = fma(_890, _882, _890);
    float _900 = _870 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].z, _892);
    float _906 = fma(_898, _850, _904);
    float _908 = _896 * 6.283185482025146484375;
    float _910 = sin(_908);
    float _912 = in.m_63.x;
    float _914 = in.m_63.y;
    float _916 = in.m_63.z;
    float _918 = _906 * 0.15915493667125701904296875;
    bool _920 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _922 = isnan(0.5);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _928 = _924 || _926;
    float _930 = _896 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _918 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = _886 * _910;
    float _940 = _902 * _910;
    float _942 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _944 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _942);
    float _946 = _918 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = _886 * _932;
    float _952 = _902 * _932;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _916);
    float _956 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _944);
    float _960 = _570 * _954;
    float _962 = _886 * _936;
    float _964 = _932 * _936;
    float _966 = _902 * _936;
    float _968 = _910 * _936;
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _914);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _912);
    float _974 = _958 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _976 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _978 = _542 * _970;
    float _980 = -_940;
    float _982 = fma(_948, _950, _980);
    float _984 = -_950;
    float _986 = fma(_948, _940, _984);
    float _988 = fma(_948, _952, _938);
    float _990 = _556 * _972;
    float _992 = _966 * _978;
    float _994 = fma(_948, _938, _952);
    float _996 = -_978;
    float _998 = _948 * _996;
    float _1000 = _962 * _978;
    float _1002 = fma(_988, _990, _992);
    float _1004 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _976);
    float _1006 = fma(_964, _990, _998);
    float _1008 = fma(_982, _990, _1000);
    float _1010 = fma(_986, _960, _1002);
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1014 = fma(_968, _960, _1006);
    float _1016 = fma(_994, _960, _1008);
    float _1018 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1024 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1026 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1020);
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1022);
    float _1030 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1032 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1024);
    float _1034 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1026);
    float _1036 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1028);
    float _1038 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = _974 + _1034;
    float _1042 = _1038 + _1036;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1040 + _1044;
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1030);
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1052 = _1042 + _1050;
    float _1054 = _1046 * _1046;
    float _1056 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1048);
    float _1058 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1060 = fma(_1052, _1052, _1054);
    float _1062 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1064 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1058);
    float _1066 = sqrt(_1060);
    float _1068 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1064);
    float _1070 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1072 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1074 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1070);
    float _1076 = 1.0 / _1062;
    float _1078 = _1070;
    float _1080 = _1010;
    float _1082 = _1016;
    float _1084 = _1042;
    if (_928)
    {
        _1078 = 1.0;
    }
    float _1086 = _1078;
    float _1088 = _1072 + _1062;
    float _1090 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1074);
    float _1092 = _1012 + _1090;
    bool _1094 = _1066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = _1088 * _1076;
    float _1098 = _1096 * 0.5;
    float _1100 = _1090;
    float _1102 = _1086;
    float _1104 = _1092;
    if (!_1094)
    {
        _1100 = _1042;
    }
    float _1106 = _1100;
    float _1108 = _1106;
    if (!_1094)
    {
        _1080 = _1040;
    }
    float _1110 = _1080;
    float _1112 = _1110;
    if (!_1094)
    {
        _1082 = _1092;
    }
    float _1114 = _1082;
    bool _1116 = !_1094;
    float _1118 = _1114;
    if (!_1116)
    {
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1124 = _1066 + _1122;
        float _1126 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = rsqrt(_1060);
        float _1130 = _1124 * _1120;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = _1132 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = _1136 + (-1.0);
        float _1144 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = fma(_1140, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1148 = fma(_1092, _1136, _1144);
        float _1150 = _1128 * _1146;
        float _1152 = fma(_1052, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1154 = fma(_1046, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1118 = _1148;
        _1108 = _1152;
        _1112 = _1154;
        _1084 = _1150;
    }
    float _1156 = _1118;
    float _1158 = _1108;
    float _1160 = _1112;
    float _1162 = _1084;
    float _1164 = _1162;
    if (!_928)
    {
        float _1166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1168 = _1166 * 0.15915493667125701904296875;
        float _1170 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1174 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1172);
        float _1176 = _1168 * 6.283185482025146484375;
        float _1178 = cos(_1176);
        float _1180 = _1170 * 0.15915493667125701904296875;
        float _1182 = _1168 * 6.283185482025146484375;
        float _1184 = sin(_1182);
        float _1186 = 1.0 / _1178;
        float _1188 = _1180 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = _1184 * _1186;
        float _1194 = _1180 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1198;
        float _1202 = _1190 * _1192;
        float _1204 = 1.0 / _1174;
        float _1206 = 1.0 / _1202;
        float _1208 = 1.0 / _1200;
        float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1212 = _1204 * _1210;
        float _1214 = _1196 * _1206;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1218 = fma(_1214, _1212, _1216);
        float _1220 = _1218 * _1208;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        _1164 = _1208;
        _1102 = _1222;
    }
    float _1224 = _1164;
    float _1226 = _1102;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1156 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1158 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1160 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1224;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1230;
    float _1278 = _1252;
    float _1280 = _1254;
    float _1282 = _1256;
    float _1284 = _1258;
    if (_1264)
    {
        float _1286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1286;
    }
    float _1288 = _1270;
    if (_1264)
    {
        float _1290 = rsqrt(_1260);
        _1272 = _1290;
    }
    float _1292 = _1272;
    if (_1264)
    {
        float _1294 = _1268 * _1288;
        _1274 = _1294;
    }
    float _1296 = _1274;
    if (_1264)
    {
        float _1298 = _1296 * 0.15915493667125701904296875;
        _1104 = _1298;
    }
    float _1300 = _1104;
    float _1302 = _1038;
    if (_1264)
    {
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = precise::max(0.0, _1310);
    float _1314 = _1062;
    float _1316 = _1310;
    float _1318 = _1312;
    if (_1264)
    {
        float _1320 = _1300 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        _1314 = _1322;
    }
    float _1324 = _1314;
    float _1326 = -_1250;
    float _1328 = -_1312;
    float _1330 = fma(_1230, _1326, _1328);
    if (_1264)
    {
        float _1332 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1276 = _1332;
    }
    float _1334 = _1276;
    float _1336 = _1308;
    float _1338 = _1334;
    if (_1264)
    {
        float _1340 = fma(_1308, _1334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1336 = _1340;
    }
    float _1342 = _1336;
    float _1344 = _1342;
    if (!_1264)
    {
        _1338 = _1330;
    }
    float _1346 = _1338;
    float _1348 = _1346;
    if (_1264)
    {
        float _1350 = _1324 + (-1.0);
        _1316 = _1350;
    }
    float _1352 = _1316;
    if (_1264)
    {
        float _1354 = _1292 * _1342;
        _1344 = _1354;
    }
    float _1356 = _1344;
    float _1358 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1264)
    {
        float _1360 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1360;
    }
    float _1362 = _1318;
    if (_1264)
    {
        float _1364 = _1252 * _1356;
        _1278 = _1364;
    }
    float _1366 = _1278;
    if (_1264)
    {
        float _1368 = _1254 * _1356;
        _1280 = _1368;
    }
    float _1370 = _1280;
    float _1372 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1264)
    {
        float _1374 = fma(_1330, _1324, _1362);
        _1348 = _1374;
    }
    float _1376 = _1348;
    if (_1264)
    {
        float _1378 = _1366 * _1366;
        _1282 = _1378;
    }
    float _1380 = _1282;
    if (_1264)
    {
        float _1382 = _1370 * _1370;
        _1284 = _1382;
    }
    float _1384 = _1284;
    float _1386 = fma(_1376, _1376, _1380);
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1390 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1388);
    float _1392 = precise::clamp(_1390, 0.0, 1.0);
    float _1394 = _1386 + _1384;
    float _1396 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1398 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1400 = -_1392;
    float _1402 = _1400 + 1.0;
    float _1404 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1406 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1396);
    float _1408 = rsqrt(_1394);
    float _1410 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1398);
    float _1414 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1416 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1404);
    float _1418 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1412);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1424 = abs(_1402);
    float _1426 = log2(_1424);
    float _1428 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1430 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1432 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1416);
    float _1434 = -_1422;
    float _1436 = fma(_1434, _1358, 1.0);
    float _1438 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1444 = _1408 * _1366;
    float _1446 = _1408 * _1376;
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1440);
    float _1450 = _1408 * _1370;
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1454 = log2(_1436);
    float _1456 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1448);
    float _1458 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1460 = -_1452;
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1460);
    float _1464 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1456);
    float _1466 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = exp2(_1458);
    float _1470 = -_1450;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1462);
    float _1474 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1476 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1478 = fma(_1472, -0.5, 0.5);
    float _1480 = fma(_1472, 0.5, 0.5);
    float _1482 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1474);
    float _1484 = 1.0 / _1464;
    float _1486 = _1446 + 1.0;
    float _1488 = fma(_1480, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1490 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1482);
    float _1492 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1476);
    float _1494 = _1454 * 0.693147182464599609375;
    float _1496 = fma(_1480, _1488, -0.212114393711090087890625);
    float _1498 = sqrt(_1478);
    float _1500 = -_1446;
    float _1502 = fma(_1468, _1486, _1500);
    float _1504 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1490);
    float _1506 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1492);
    float _1508 = fma(_1480, _1496, 1.570728778839111328125);
    float _1510 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1512 = _1504 * _1484;
    float _1514 = _1506 * _1484;
    float _1516 = fma(_1512, 0.5, 0.5);
    float _1518 = fma(_1514, -0.5, 0.5);
    float _1520 = fma(_1502, 0.5, 0.5);
    float _1522 = _1498 * 0.636619746685028076171875;
    float _1524 = -_1508;
    float _1526 = fma(_1522, _1524, 1.0);
    float3 _4660 = float3(_1516, _1518, _1510);
    float _1528 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4660, float3(0.0), isnan(_4660)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4660, float3(0.0), isnan(_4660)), level(0.0)).x;
    float3 _4671 = float3(_1516, _1518, _1510);
    float4 _1531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4671, float3(0.0), isnan(_4671)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4671, float3(0.0), isnan(_4671)), level(0.0)).xyzw;
    float _1533 = _1531.x;
    float _1535 = _1531.y;
    float _1537 = _1531.z;
    float _1539 = _1531.w;
    float2 _4688 = float2(_1526, _1520);
    float3 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4688, float2(0.0), isnan(_4688)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4688, float2(0.0), isnan(_4688)), level(0.0)).xyz;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = in.m_59.w;
    float _1553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1555 = in.m_65.w;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1561 = _540 > 0.5;
    out.m_67.x = _556;
    out.m_67.y = _542;
    out.m_67.z = _570;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1565 = _1563 != 0;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1569 = _538 + _1567;
    float _1571 = 1.0 / _1559;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1575 = _1573 != 0;
    float _1577 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1581 = _1579 != 0;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1589 = _1587 != 0;
    float _1591 = -_166;
    float _1593 = _1591 + 1.0;
    float _1595 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1597 = 1.0 / _1585;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1599;
    bool _1603 = _1551 > 0.5;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1607 = _1605 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    out.m_69.w = _1555;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1615 = 1.0 / _1607;
    bool _1617 = _1603;
    float _1619 = _1464;
    float _1621 = _1506;
    float _1623 = _1504;
    if (_1575)
    {
        bool _1625 = _552 > 0.5;
        _636 = _1625;
    }
    bool _1627 = _636;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1631 = _1603 ? _1593 : _166;
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1635 = _1631;
    if (_1565)
    {
        bool _1637 = _544 > 0.5;
        _1617 = _1637;
    }
    bool _1639 = _1617;
    float _1641 = _1601 * _1571;
    float _1643 = 1.0 / _1613;
    float _1645 = in.m_53.x;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1647;
    float _1651 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1655 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1657 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1663 = exp2(_1577);
    out.m_71.x = _1158;
    out.m_71.y = _1156;
    out.m_71.z = _1160;
    float _1665 = _1661 * _1615;
    out.m_73.x = _1651;
    out.m_73.y = _1655;
    out.m_73.z = _1657;
    out.m_73.w = _1653;
    float _1667 = _1649 * _1643;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1671 = _1669 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1675 = _538 + _1673;
    bool _1677 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1679 = isnan(_538);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    float _1689 = _1671 * _1597;
    bool _1691 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1693 = isnan(_538);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1705 = _538 + _1703;
    float _1707 = -_1663;
    float _1709 = _1707 + 1.0;
    float _1711 = fma(_1641, _1675, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1713 = -_1687;
    float _1715 = _1713 + 1.0;
    bool _1717 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1719 = isnan(_538);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = fma(_1665, _1569, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1733 = _1701 * _1715;
    float _1735 = -_1701;
    float _1737 = _1735 + 1.0;
    bool _1739 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1741 = isnan(_538);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    float _1751 = -_1727;
    float _1753 = _1751 + 1.0;
    float _1755 = fma(_1667, _1705, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1757 = _1727 * _1737;
    float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1761 = _538 + _1759;
    bool _1763 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1765 = isnan(_538);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = _1749 * _1753;
    int _1777 = as_type<int>(_1711);
    if (!_1575)
    {
        _638 = _1645;
    }
    float _1779 = _638;
    float _1781 = -_1749;
    float _1783 = _1781 + 1.0;
    float _1785 = _1581 ? _1631 : _166;
    float _1787 = fma(_1689, _1761, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1789 = _1779;
    if (!_1575)
    {
        _1635 = _1779;
    }
    float _1791 = _1635;
    float _1793 = _1773 * _1783;
    float _1795 = _1791;
    if (_1575)
    {
        _1789 = _1645;
    }
    float _1797 = _1789;
    float _1799 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1801 = _1797;
    if (_1589)
    {
        float _1803 = _1561 ? _1593 : _166;
        _214 = _1803;
    }
    float _1805 = _214;
    float _1807 = fma(_1785, _1595, -0.5);
    float _1809 = _1711 * _1793;
    int _1811 = as_type<int>(_1805);
    if (_1575)
    {
        float _1813 = -_1797;
        float _1815 = _1813 + 1.0;
        _1777 = as_type<int>(_1815);
    }
    int _1817 = _1777;
    float _1819 = -_1773;
    float _1821 = _1819 + 1.0;
    float _1823 = fma(_1799, _1805, -0.5);
    bool _1825 = _914 != 0.0;
    bool _1827 = isnan(_914);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan(0.0);
    bool _1833 = _1829 || _1831;
    float _1835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1575)
    {
        float _1837 = _1627 ? as_type<float>(_1817) : _1797;
        _1795 = _1837;
    }
    float _1839 = _1795;
    if (_1565)
    {
        float _1841 = -_1797;
        float _1843 = _1841 + 1.0;
        _1811 = as_type<int>(_1843);
    }
    int _1845 = _1811;
    float _1847 = in.m_75.x;
    float _1849 = in.m_75.y;
    float _1851 = in.m_75.z;
    bool _1853 = _912 == 0.0;
    bool _1855 = !_1833;
    bool _1857 = _1853 && _1855;
    float _1859 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1809);
    float _1861 = -_598;
    float _1863 = fma(_830, _1823, _1861);
    if (_1565)
    {
        float _1865 = _1639 ? as_type<float>(_1845) : _1797;
        _1801 = _1865;
    }
    float _1867 = _1801;
    float _1869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1871 = _916 == 0.0;
    bool _1873 = _1871 && _1857;
    float _1875 = fma(_1729, _1775, _1859);
    float _1877 = -_832;
    float _1879 = fma(_680, _1807, _1877);
    float _1881 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1883 = _1863 + 0.5;
    float _1885 = fma(_1755, _1757, _1875);
    float _1887 = _1835 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1889 = fma(_1787, _1733, _1885);
    float _1891 = fma(_1887, _1839, -0.5);
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1895 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1897 = fma(_812, _1891, _610);
    float _1899 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1889);
    float _1901 = _1849;
    float _1903 = _1847;
    float _1905 = _1851;
    if (!_1873)
    {
        float _1907 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1849);
        _1901 = _1907;
    }
    float _1909 = _1901;
    float _1911 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1873)
    {
        float _1913 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1847);
        _1903 = _1913;
    }
    float _1915 = _1903;
    if (!_1873)
    {
        float _1917 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1851);
        _1905 = _1917;
    }
    float _1919 = _1905;
    float _1921 = -_1909;
    float _1923 = _948 * _1921;
    float _1925 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1911);
    float _1927 = _966 * _1909;
    float _1929 = fma(_1895, _1867, -0.5);
    float _1931 = fma(_964, _1915, _1923);
    float _1933 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    float _1935 = _962 * _1909;
    float _1937 = fma(_988, _1915, _1927);
    float _1939 = fma(_968, _1919, _1931);
    float _1941 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1933);
    float _1943 = fma(_734, _1929, _840);
    float _1945 = fma(_982, _1915, _1935);
    float _1947 = fma(_986, _1919, _1937);
    float _1949 = _1941 + _1464;
    float _1951 = _1879 + 0.5;
    float _1953 = _1897 + 0.5;
    float _1955 = _1943 + 0.5;
    float _1957 = fma(_994, _1919, _1945);
    float _1959 = _1949 * 0.5;
    float _1961 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1963 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1965 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_77.x = _1953;
    out.m_77.y = _1883;
    out.m_77.z = _1955;
    out.m_77.w = _1951;
    float _1967 = fma(_1939, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1961);
    float _1969 = fma(_1939, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1963);
    float _1971 = fma(_1939, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1965);
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1967);
    float _1977 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1969);
    float _1979 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1971);
    float _1981 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.z = _1959;
    out.m_79.w = _1464;
    bool _1983 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1985 = isnan(_1248);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1991 = _1987 || _1989;
    float _1993 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_81.x = _1975;
    out.m_81.y = _1977;
    out.m_81.z = _1979;
    float _1997 = _1899 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1999 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1504;
    out.gl_Position.y = _1506;
    out.gl_Position.z = _1941;
    out.gl_Position.w = _1464;
    out.m_83.x = _1981;
    out.m_83.y = _1993;
    out.m_83.z = _1999;
    out.m_83.w = _1997;
    float _2001 = _1969;
    float _2003 = _1941;
    if (!_1991)
    {
        _2001 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2005 = _2001;
    float _2007 = _2005;
    float _2009 = _2005;
    if (!_1991)
    {
        _1619 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2011 = _1619;
    float _2013 = _2011;
    float _2015 = _2011;
    if (!_1991)
    {
        _2003 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2017 = _2003;
    float _2019 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2021 = _2017;
    float _2023 = _2017;
    if (!_1991)
    {
        _1621 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2025 = _1621;
    float _2027 = _2025;
    float _2029 = _2025;
    if (!_1991)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2031 = _1623;
    float _2033 = _1881 * _1528;
    float _2035 = -_1881;
    float _2037 = _2035 + 1.0;
    float _2039 = _1539 * _2033;
    float _2041 = _1549 * _2033;
    float _2043 = _1539 * _2037;
    float _2045 = _2033;
    float _2047 = _2031;
    float _2049 = _2031;
    if (!_1991)
    {
        _2045 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2051 = _2045;
    float _2053 = fma(_1545, _2039, _1533);
    float _2055 = fma(_1547, _2039, _1535);
    float _2057 = fma(_1539, _2041, _1537);
    out.m_85.x = _2053;
    out.m_85.y = _2055;
    out.m_85.z = _2057;
    out.m_85.w = _2043;
    bool _2059 = !_1991;
    float _2061 = _2051;
    float _2063 = _2051;
    if (!_2059)
    {
        bool _2065 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2067 = isnan(_1248);
        bool _2069 = _2065 || _2067;
        bool _2071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2073 = _2069 || _2071;
        if (!_2073)
        {
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2077 = _1248 + _2075;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2081 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2079;
            float _2083 = 1.0 / _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2105 = _2077 * _2083;
            float _2107 = precise::clamp(_2105, 0.0, 1.0);
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2113 = fma(_2107, _2087, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2115 = fma(_2107, _2111, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2117 = fma(_2107, _2091, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2119 = fma(_2107, _2095, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2121 = fma(_2107, _2099, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2123 = fma(_2107, _2103, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2063 = _2115;
            _2029 = _2121;
            _2009 = _2113;
            _2023 = _2119;
            _2015 = _2117;
            _2049 = _2123;
            _2125 = true;
        }
        else
        {
            bool _2127 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2129 = isnan(_1248);
            bool _2131 = _2127 || _2129;
            bool _2133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2135 = _2131 || _2133;
            if (!_2135)
            {
                _2007 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2137 = _2007;
            _2009 = _2137;
            if (!_2135)
            {
                _2061 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2139 = _2061;
            _2063 = _2139;
            if (!_2135)
            {
                _2013 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2141 = _2013;
            _2015 = _2141;
            if (!_2135)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2143 = _2021;
            _2023 = _2143;
            if (!_2135)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2145 = _2027;
            _2029 = _2145;
            if (!_2135)
            {
                _2047 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2147 = _2047;
            bool _2149 = !_2135;
            _2049 = _2147;
            if (!_2149)
            {
                bool _2151 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2153 = isnan(_1248);
                bool _2155 = _2151 || _2153;
                bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2159 = _2155 || _2157;
                if (!_2159)
                {
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2163 = _1248 + _2161;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2167 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2165;
                    float _2169 = 1.0 / _2167;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2191 = _2163 * _2169;
                    float _2193 = precise::clamp(_2191, 0.0, 1.0);
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2199 = fma(_2193, _2173, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2201 = fma(_2193, _2197, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2203 = fma(_2193, _2177, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2205 = fma(_2193, _2181, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2207 = fma(_2193, _2185, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2209 = fma(_2193, _2189, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2063 = _2201;
                    _2029 = _2207;
                    _2009 = _2199;
                    _2023 = _2205;
                    _2015 = _2203;
                    _2049 = _2209;
                    _2125 = true;
                }
                else
                {
                    _2063 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2009 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2015 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2049 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2125 = false;
    float _2211 = _2063;
    float _2213 = _2029;
    float _2215 = _2009;
    float _2217 = _2023;
    float _2219 = _2015;
    float _2221 = _2049;
    float _2223 = fma(_1977, -0.5, 0.5);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = -_2211;
    float _2229 = _2227 + _2213;
    float _2231 = _2019 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2233 = -_2215;
    float _2235 = _2233 + _2217;
    float _2237 = fma(_2225, _2229, _2211);
    out.m_87.x = 0.0;
    float _2239 = -_2219;
    float _2241 = _2239 + _2221;
    float _2243 = fma(_2225, _2235, _2215);
    float _2245 = _2237 * 0.586610972881317138671875;
    out.m_47.x = _2231;
    bool _2247 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2249 = fma(_2225, _2241, _2219);
    float _2251 = fma(_2243, 0.298911988735198974609375, _2245);
    bool _2253 = _1226 > 0.0;
    bool _2255 = isnan(_1226);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    float _2263 = fma(_2249, 0.114477999508380889892578125, _2251);
    float _2265 = -_2263;
    float _2267 = _2243 + _2265;
    float _2269 = -_2263;
    float _2271 = _2237 + _2269;
    float _2273 = -_2263;
    float _2275 = _2249 + _2273;
    float _2277 = fma(_2267, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2263);
    float _2279 = fma(_2271, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2263);
    float _2281 = fma(_2275, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2263);
    bool _2283 = !_2247;
    if (!_2283)
    {
        float _2285 = -_1156;
        float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2289 = -_1158;
        float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2293 = -_1160;
        float _2295 = _2293 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2297 = _2287 * _2287;
        float _2299 = fma(_2291, _2291, _2297);
        float _2301 = fma(_2295, _2295, _2299);
        float _2303 = sqrt(_2301);
        float _2305 = rsqrt(_2301);
        float _2307 = -_2303;
        float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2311 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        float _2315 = _2291 * _2305;
        float _2317 = _2287 * _2305;
        float _2319 = abs(_2313);
        float _2321 = log2(_2319);
        float _2323 = _2295 * _2305;
        float _2325 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2327 = _1977 * _2317;
        float _2329 = -_2317;
        float _2331 = -_2325;
        float _2333 = fma(_2329, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2331);
        float _2335 = fma(_1975, _2315, _2327);
        float _2337 = -_2323;
        float _2339 = fma(_2337, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2333);
        float _2341 = fma(_1979, _2323, _2335);
        float _2343 = precise::clamp(_2341, 0.0, 1.0);
        float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2347 = _2339 + _2345;
        float _2349 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2351 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2353 = precise::clamp(_2351, 0.0, 1.0);
        float _2355 = exp2(_2349);
        float _2357 = _2355 * _2353;
        float _2359 = _2343 * _2357;
        float _2361 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2363 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2365 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2361;
        out.m_87.y = _2363;
        out.m_87.z = _2365;
    }
    out.m_89.x = _2277;
    out.m_89.y = _2279;
    out.m_89.z = _2281;
    if (_2261)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2367 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2367;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2125 = false;
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
        float _2423 = as_type<float>(_122);
        out.gl_Position.z = _2423;
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
        float _2496 = as_type<float>(_164);
        out.gl_Position.z = _2496;
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
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _314 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _314 + _336;
    bool _340 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _342 = isnan(_314);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = 1.0 / _326;
    bool _354 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _356 = isnan(_314);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_350;
    float _368 = _366 + 1.0;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _334;
    float _374 = _364 * _368;
    float _376 = -_364;
    float _378 = _376 + 1.0;
    float _380 = 1.0 / _330;
    float _382 = _318 * _352;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = _322 * _372;
    bool _396 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _398 = isnan(_314);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _412 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _414 = isnan(_314);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = _338 * _380;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _430;
    float _434 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = -_406;
    float _442 = _440 + 1.0;
    float _444 = fma(_432, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = _406 * _378;
    float _448 = fma(_426, _428, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = fma(_438, _428, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _452 = fma(_410, _428, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _454 = _422 * _442;
    float _456 = in.m_55.x;
    float _458 = in.m_55.y;
    float _460 = in.m_55.z;
    float _462 = -_422;
    float _464 = _462 + 1.0;
    float _466 = _434 * _454;
    float _468 = _392 * _454;
    float _470 = _444 * _454;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _476;
    float _480 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _482 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _490 = fma(_478, _394, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _492 = fma(_450, _446, _482);
    float _494 = fma(_474, _394, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_486, _394, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _498 = fma(_448, _446, _480);
    float _500 = fma(_452, _446, _488);
    float _502 = fma(_490, _374, _492);
    float _504 = fma(_494, _374, _498);
    float _506 = fma(_496, _374, _500);
    float _508 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _512 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[146].z, _506);
    float _514 = _508 * _458;
    float _516 = _510 * _456;
    float _518 = _512 * _460;
    bool _520 = !_370;
    if (!_520)
    {
        float _522 = in.m_59.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _156 = _536;
    }
    float _538 = _156;
    float _540 = in.m_59.y;
    float _542 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _544 = in.m_59.z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _550 = _548 != 0;
    float _552 = in.m_59.x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _556 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _568 = _566 != 0;
    float _570 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _572 = !_564;
    int _574 = _572 ? 0 : 1;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _578 = !_568;
    int _580 = _578 ? 0 : 1;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _584 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _586 = _544 * 2.0;
    float _588 = fma(_584, -2.0, _546);
    float _590 = _540 * 2.0;
    float _592 = _552 * 2.0;
    float _594 = floor(_586);
    float _596 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _598 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _588);
    float _600 = -_554;
    float _602 = fma(_596, 2.0, _600);
    float _604 = floor(_592);
    float _606 = _552 + _540;
    float _608 = -_134;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[76].x, _602);
    float _612 = _606 + (-1.0);
    float _614 = floor(_590);
    bool _616 = _594 > 0.0;
    float _618 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _620 = _594 >= 0.0;
    bool _622 = isnan(_594);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    float _630 = _594;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _634 = _612;
    bool _636 = _564;
    float _638 = _538;
    if (!_550)
    {
        _630 = _540;
    }
    float _640 = _630;
    float _642 = _640;
    if (!_550)
    {
        _632 = _544;
    }
    float _644 = _632;
    float _646 = _644;
    if (!_550)
    {
        _634 = _544;
    }
    float _648 = _634;
    float _650 = _648;
    if (_550)
    {
        _642 = _552;
    }
    float _652 = _642;
    if (_550)
    {
        _646 = _540;
    }
    float _654 = _646;
    if (_550)
    {
        _650 = _540;
    }
    float _656 = _650;
    bool _658 = _604 > 0.0;
    float _660 = _654 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _662 = _604 >= 0.0;
    bool _664 = isnan(_604);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[83].w, _576);
    bool _674 = !_560;
    int _676 = _674 ? 0 : 1;
    int _678 = _628 ? 0 : 1;
    float _680 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _672);
    bool _682 = _614 > 0.0;
    bool _684 = _614 >= 0.0;
    bool _686 = isnan(_614);
    bool _688 = _684 || _686;
    bool _690 = isnan(0.0);
    bool _692 = _688 || _690;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _696 = _692 ? 0 : 1;
    float _698 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[83].z, _694);
    float _700 = _652 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _702 = ~_678;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _710 = log2(_708);
    int _712 = abs(_676);
    float _714 = -_582;
    float _716 = fma(_700, 2.0, _714);
    int _718 = _706;
    if (!_616)
    {
        int _720 = ~_678;
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _728 = ~_696;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _698);
    int _736 = _732;
    if (!_682)
    {
        int _738 = ~_696;
        int _740 = _738 + 1;
        _736 = _740;
    }
    int _742 = _736;
    float _744 = fma(_660, -2.0, _726);
    float _746 = float(_712);
    float _748 = float(_724);
    int _750 = _670 ? 0 : 1;
    float _752 = _710 * _134;
    float _754 = _746 * _748;
    float _756 = in.m_61.x;
    float _758 = in.m_61.y;
    float _760 = in.m_61.z;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _764 = ~_750;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    float _770 = exp2(_752);
    int _772 = _768;
    if (!_658)
    {
        int _774 = ~_750;
        int _776 = _774 + 1;
        _772 = _776;
    }
    int _778 = _772;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _782 = 1.0 + _780;
    float _784 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _762);
    bool _786 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _788 = isnan(1.0);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _794 = _790 || _792;
    float _796 = _754 * (-2.0);
    bool _798 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _806 = _802 || _804;
    float _808 = 1.0 / _782;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _812 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _784);
    int _814 = abs(_574);
    float _816 = _552 + (-0.5);
    float _818 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].w, _810);
    float _820 = float(_778);
    float _822 = fma(_618, _796, _618);
    float _824 = -_770;
    float _826 = _824 + 1.0;
    float _828 = float(_814);
    float _830 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _818);
    float _832 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _744);
    float _834 = fma(_796, _756, _756);
    float _836 = _806 ? _826 : 0.0;
    float _838 = -_134;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[81].x, _716);
    int _842 = abs(_580);
    float _844 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[196].x, _834);
    float _846 = _540 + _544;
    if (_794)
    {
        float _848 = _836 * _808;
        _158 = _848;
    }
    float _850 = _158;
    float _852 = _828 * _820;
    float _854 = _846 + (-1.0);
    float _856 = fma(_822, _850, _844);
    float _858 = float(_842);
    float _860 = _852 * (-2.0);
    float _862 = float(_742);
    float _864 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _866 = _552 + _544;
    float _868 = fma(_860, _758, _758);
    float _870 = _856 * 0.15915493667125701904296875;
    float _872 = _858 * _862;
    float _874 = _540 + (-0.5);
    float _876 = fma(_864, _860, _864);
    float _878 = _866 + (-1.0);
    float _880 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].y, _868);
    float _882 = _872 * (-2.0);
    float _884 = _870 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = fma(_876, _850, _880);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _892 = fma(_882, _760, _760);
    float _894 = _544 + (-0.5);
    float _896 = _888 * 0.15915493667125701904296875;
    float _898 = fma(_890, _882, _890);
    float _900 = _870 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].z, _892);
    float _906 = fma(_898, _850, _904);
    float _908 = _896 * 6.283185482025146484375;
    float _910 = sin(_908);
    float _912 = in.m_63.x;
    float _914 = in.m_63.y;
    float _916 = in.m_63.z;
    float _918 = _906 * 0.15915493667125701904296875;
    bool _920 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _922 = isnan(0.5);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _928 = _924 || _926;
    float _930 = _896 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _918 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = _886 * _910;
    float _940 = _902 * _910;
    float _942 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _944 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _942);
    float _946 = _918 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = _886 * _932;
    float _952 = _902 * _932;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _916);
    float _956 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _944);
    float _960 = _570 * _954;
    float _962 = _886 * _936;
    float _964 = _932 * _936;
    float _966 = _902 * _936;
    float _968 = _910 * _936;
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _914);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _912);
    float _974 = _958 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _976 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _978 = _542 * _970;
    float _980 = -_940;
    float _982 = fma(_948, _950, _980);
    float _984 = -_950;
    float _986 = fma(_948, _940, _984);
    float _988 = fma(_948, _952, _938);
    float _990 = _556 * _972;
    float _992 = _966 * _978;
    float _994 = fma(_948, _938, _952);
    float _996 = -_978;
    float _998 = _948 * _996;
    float _1000 = _962 * _978;
    float _1002 = fma(_988, _990, _992);
    float _1004 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _976);
    float _1006 = fma(_964, _990, _998);
    float _1008 = fma(_982, _990, _1000);
    float _1010 = fma(_986, _960, _1002);
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1014 = fma(_968, _960, _1006);
    float _1016 = fma(_994, _960, _1008);
    float _1018 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1024 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1026 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1020);
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1022);
    float _1030 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1032 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1024);
    float _1034 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1026);
    float _1036 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1028);
    float _1038 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = _974 + _1034;
    float _1042 = _1038 + _1036;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1040 + _1044;
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1030);
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1052 = _1042 + _1050;
    float _1054 = _1046 * _1046;
    float _1056 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1048);
    float _1058 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1060 = fma(_1052, _1052, _1054);
    float _1062 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1064 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1058);
    float _1066 = sqrt(_1060);
    float _1068 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1064);
    float _1070 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1072 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1074 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1070);
    float _1076 = 1.0 / _1062;
    float _1078 = _1070;
    float _1080 = _1010;
    float _1082 = _1016;
    float _1084 = _1042;
    if (_928)
    {
        _1078 = 1.0;
    }
    float _1086 = _1078;
    float _1088 = _1072 + _1062;
    float _1090 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1074);
    float _1092 = _1012 + _1090;
    bool _1094 = _1066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = _1088 * _1076;
    float _1098 = _1096 * 0.5;
    float _1100 = _1090;
    float _1102 = _1086;
    float _1104 = _1092;
    if (!_1094)
    {
        _1100 = _1042;
    }
    float _1106 = _1100;
    float _1108 = _1106;
    if (!_1094)
    {
        _1080 = _1040;
    }
    float _1110 = _1080;
    float _1112 = _1110;
    if (!_1094)
    {
        _1082 = _1092;
    }
    float _1114 = _1082;
    bool _1116 = !_1094;
    float _1118 = _1114;
    if (!_1116)
    {
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1124 = _1066 + _1122;
        float _1126 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = rsqrt(_1060);
        float _1130 = _1124 * _1120;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = _1132 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = _1136 + (-1.0);
        float _1144 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = fma(_1140, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1148 = fma(_1092, _1136, _1144);
        float _1150 = _1128 * _1146;
        float _1152 = fma(_1052, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1154 = fma(_1046, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1118 = _1148;
        _1108 = _1152;
        _1112 = _1154;
        _1084 = _1150;
    }
    float _1156 = _1118;
    float _1158 = _1108;
    float _1160 = _1112;
    float _1162 = _1084;
    float _1164 = _1162;
    if (!_928)
    {
        float _1166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1168 = _1166 * 0.15915493667125701904296875;
        float _1170 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1174 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1172);
        float _1176 = _1168 * 6.283185482025146484375;
        float _1178 = cos(_1176);
        float _1180 = _1170 * 0.15915493667125701904296875;
        float _1182 = _1168 * 6.283185482025146484375;
        float _1184 = sin(_1182);
        float _1186 = 1.0 / _1178;
        float _1188 = _1180 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = _1184 * _1186;
        float _1194 = _1180 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1198;
        float _1202 = _1190 * _1192;
        float _1204 = 1.0 / _1174;
        float _1206 = 1.0 / _1202;
        float _1208 = 1.0 / _1200;
        float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1212 = _1204 * _1210;
        float _1214 = _1196 * _1206;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1218 = fma(_1214, _1212, _1216);
        float _1220 = _1218 * _1208;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        _1164 = _1208;
        _1102 = _1222;
    }
    float _1224 = _1164;
    float _1226 = _1102;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1156 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1158 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1160 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1224;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1230;
    float _1278 = _1252;
    float _1280 = _1254;
    float _1282 = _1256;
    float _1284 = _1258;
    if (_1264)
    {
        float _1286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1286;
    }
    float _1288 = _1270;
    if (_1264)
    {
        float _1290 = rsqrt(_1260);
        _1272 = _1290;
    }
    float _1292 = _1272;
    if (_1264)
    {
        float _1294 = _1268 * _1288;
        _1274 = _1294;
    }
    float _1296 = _1274;
    if (_1264)
    {
        float _1298 = _1296 * 0.15915493667125701904296875;
        _1104 = _1298;
    }
    float _1300 = _1104;
    float _1302 = _1038;
    if (_1264)
    {
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = precise::max(0.0, _1310);
    float _1314 = _1062;
    float _1316 = _1310;
    float _1318 = _1312;
    if (_1264)
    {
        float _1320 = _1300 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        _1314 = _1322;
    }
    float _1324 = _1314;
    float _1326 = -_1250;
    float _1328 = -_1312;
    float _1330 = fma(_1230, _1326, _1328);
    if (_1264)
    {
        float _1332 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1276 = _1332;
    }
    float _1334 = _1276;
    float _1336 = _1308;
    float _1338 = _1334;
    if (_1264)
    {
        float _1340 = fma(_1308, _1334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1336 = _1340;
    }
    float _1342 = _1336;
    float _1344 = _1342;
    if (!_1264)
    {
        _1338 = _1330;
    }
    float _1346 = _1338;
    float _1348 = _1346;
    if (_1264)
    {
        float _1350 = _1324 + (-1.0);
        _1316 = _1350;
    }
    float _1352 = _1316;
    if (_1264)
    {
        float _1354 = _1292 * _1342;
        _1344 = _1354;
    }
    float _1356 = _1344;
    float _1358 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1264)
    {
        float _1360 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1360;
    }
    float _1362 = _1318;
    if (_1264)
    {
        float _1364 = _1252 * _1356;
        _1278 = _1364;
    }
    float _1366 = _1278;
    if (_1264)
    {
        float _1368 = _1254 * _1356;
        _1280 = _1368;
    }
    float _1370 = _1280;
    float _1372 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1264)
    {
        float _1374 = fma(_1330, _1324, _1362);
        _1348 = _1374;
    }
    float _1376 = _1348;
    if (_1264)
    {
        float _1378 = _1366 * _1366;
        _1282 = _1378;
    }
    float _1380 = _1282;
    if (_1264)
    {
        float _1382 = _1370 * _1370;
        _1284 = _1382;
    }
    float _1384 = _1284;
    float _1386 = fma(_1376, _1376, _1380);
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1390 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1388);
    float _1392 = precise::clamp(_1390, 0.0, 1.0);
    float _1394 = _1386 + _1384;
    float _1396 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1398 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1400 = -_1392;
    float _1402 = _1400 + 1.0;
    float _1404 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1406 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1396);
    float _1408 = rsqrt(_1394);
    float _1410 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1398);
    float _1414 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1416 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1404);
    float _1418 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1412);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1424 = abs(_1402);
    float _1426 = log2(_1424);
    float _1428 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1430 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1432 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1416);
    float _1434 = -_1422;
    float _1436 = fma(_1434, _1358, 1.0);
    float _1438 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1444 = _1408 * _1366;
    float _1446 = _1408 * _1376;
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1440);
    float _1450 = _1408 * _1370;
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1454 = log2(_1436);
    float _1456 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1448);
    float _1458 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1460 = -_1452;
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1460);
    float _1464 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1456);
    float _1466 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = exp2(_1458);
    float _1470 = -_1450;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1462);
    float _1474 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1476 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1478 = fma(_1472, -0.5, 0.5);
    float _1480 = fma(_1472, 0.5, 0.5);
    float _1482 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1474);
    float _1484 = 1.0 / _1464;
    float _1486 = _1446 + 1.0;
    float _1488 = fma(_1480, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1490 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1482);
    float _1492 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1476);
    float _1494 = _1454 * 0.693147182464599609375;
    float _1496 = fma(_1480, _1488, -0.212114393711090087890625);
    float _1498 = sqrt(_1478);
    float _1500 = -_1446;
    float _1502 = fma(_1468, _1486, _1500);
    float _1504 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1490);
    float _1506 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1492);
    float _1508 = fma(_1480, _1496, 1.570728778839111328125);
    float _1510 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1512 = _1504 * _1484;
    float _1514 = _1506 * _1484;
    float _1516 = fma(_1512, 0.5, 0.5);
    float _1518 = fma(_1514, -0.5, 0.5);
    float _1520 = fma(_1502, 0.5, 0.5);
    float _1522 = _1498 * 0.636619746685028076171875;
    float _1524 = -_1508;
    float _1526 = fma(_1522, _1524, 1.0);
    float3 _4660 = float3(_1516, _1518, _1510);
    float _1528 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4660, float3(0.0), isnan(_4660)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4660, float3(0.0), isnan(_4660)), level(0.0)).x;
    float3 _4671 = float3(_1516, _1518, _1510);
    float4 _1531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4671, float3(0.0), isnan(_4671)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4671, float3(0.0), isnan(_4671)), level(0.0)).xyzw;
    float _1533 = _1531.x;
    float _1535 = _1531.y;
    float _1537 = _1531.z;
    float _1539 = _1531.w;
    float2 _4688 = float2(_1526, _1520);
    float3 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4688, float2(0.0), isnan(_4688)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4688, float2(0.0), isnan(_4688)), level(0.0)).xyz;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = in.m_59.w;
    float _1553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1555 = in.m_65.w;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1561 = _540 > 0.5;
    out.m_67.x = _556;
    out.m_67.y = _542;
    out.m_67.z = _570;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1565 = _1563 != 0;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1569 = _538 + _1567;
    float _1571 = 1.0 / _1559;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1575 = _1573 != 0;
    float _1577 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1581 = _1579 != 0;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1589 = _1587 != 0;
    float _1591 = -_166;
    float _1593 = _1591 + 1.0;
    float _1595 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1597 = 1.0 / _1585;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1599;
    bool _1603 = _1551 > 0.5;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1607 = _1605 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    out.m_69.w = _1555;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1615 = 1.0 / _1607;
    bool _1617 = _1603;
    float _1619 = _1464;
    float _1621 = _1506;
    float _1623 = _1504;
    if (_1575)
    {
        bool _1625 = _552 > 0.5;
        _636 = _1625;
    }
    bool _1627 = _636;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1631 = _1603 ? _1593 : _166;
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1635 = _1631;
    if (_1565)
    {
        bool _1637 = _544 > 0.5;
        _1617 = _1637;
    }
    bool _1639 = _1617;
    float _1641 = _1601 * _1571;
    float _1643 = 1.0 / _1613;
    float _1645 = in.m_53.x;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1647;
    float _1651 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1655 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1657 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1663 = exp2(_1577);
    out.m_71.x = _1158;
    out.m_71.y = _1156;
    out.m_71.z = _1160;
    float _1665 = _1661 * _1615;
    out.m_73.x = _1651;
    out.m_73.y = _1655;
    out.m_73.z = _1657;
    out.m_73.w = _1653;
    float _1667 = _1649 * _1643;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1671 = _1669 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1675 = _538 + _1673;
    bool _1677 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1679 = isnan(_538);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    float _1689 = _1671 * _1597;
    bool _1691 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1693 = isnan(_538);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1705 = _538 + _1703;
    float _1707 = -_1663;
    float _1709 = _1707 + 1.0;
    float _1711 = fma(_1641, _1675, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1713 = -_1687;
    float _1715 = _1713 + 1.0;
    bool _1717 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1719 = isnan(_538);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = fma(_1665, _1569, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1733 = _1701 * _1715;
    float _1735 = -_1701;
    float _1737 = _1735 + 1.0;
    bool _1739 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1741 = isnan(_538);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    float _1751 = -_1727;
    float _1753 = _1751 + 1.0;
    float _1755 = fma(_1667, _1705, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1757 = _1727 * _1737;
    float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1761 = _538 + _1759;
    bool _1763 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1765 = isnan(_538);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = _1749 * _1753;
    int _1777 = as_type<int>(_1711);
    if (!_1575)
    {
        _638 = _1645;
    }
    float _1779 = _638;
    float _1781 = -_1749;
    float _1783 = _1781 + 1.0;
    float _1785 = _1581 ? _1631 : _166;
    float _1787 = fma(_1689, _1761, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1789 = _1779;
    if (!_1575)
    {
        _1635 = _1779;
    }
    float _1791 = _1635;
    float _1793 = _1773 * _1783;
    float _1795 = _1791;
    if (_1575)
    {
        _1789 = _1645;
    }
    float _1797 = _1789;
    float _1799 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1801 = _1797;
    if (_1589)
    {
        float _1803 = _1561 ? _1593 : _166;
        _214 = _1803;
    }
    float _1805 = _214;
    float _1807 = fma(_1785, _1595, -0.5);
    float _1809 = _1711 * _1793;
    int _1811 = as_type<int>(_1805);
    if (_1575)
    {
        float _1813 = -_1797;
        float _1815 = _1813 + 1.0;
        _1777 = as_type<int>(_1815);
    }
    int _1817 = _1777;
    float _1819 = -_1773;
    float _1821 = _1819 + 1.0;
    float _1823 = fma(_1799, _1805, -0.5);
    bool _1825 = _914 != 0.0;
    bool _1827 = isnan(_914);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan(0.0);
    bool _1833 = _1829 || _1831;
    float _1835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1575)
    {
        float _1837 = _1627 ? as_type<float>(_1817) : _1797;
        _1795 = _1837;
    }
    float _1839 = _1795;
    if (_1565)
    {
        float _1841 = -_1797;
        float _1843 = _1841 + 1.0;
        _1811 = as_type<int>(_1843);
    }
    int _1845 = _1811;
    float _1847 = in.m_75.x;
    float _1849 = in.m_75.y;
    float _1851 = in.m_75.z;
    bool _1853 = _912 == 0.0;
    bool _1855 = !_1833;
    bool _1857 = _1853 && _1855;
    float _1859 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1809);
    float _1861 = -_598;
    float _1863 = fma(_830, _1823, _1861);
    if (_1565)
    {
        float _1865 = _1639 ? as_type<float>(_1845) : _1797;
        _1801 = _1865;
    }
    float _1867 = _1801;
    float _1869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1871 = _916 == 0.0;
    bool _1873 = _1871 && _1857;
    float _1875 = fma(_1729, _1775, _1859);
    float _1877 = -_832;
    float _1879 = fma(_680, _1807, _1877);
    float _1881 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1883 = _1863 + 0.5;
    float _1885 = fma(_1755, _1757, _1875);
    float _1887 = _1835 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1889 = fma(_1787, _1733, _1885);
    float _1891 = fma(_1887, _1839, -0.5);
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1895 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1897 = fma(_812, _1891, _610);
    float _1899 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1889);
    float _1901 = _1849;
    float _1903 = _1847;
    float _1905 = _1851;
    if (!_1873)
    {
        float _1907 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1849);
        _1901 = _1907;
    }
    float _1909 = _1901;
    float _1911 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1873)
    {
        float _1913 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1847);
        _1903 = _1913;
    }
    float _1915 = _1903;
    if (!_1873)
    {
        float _1917 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1851);
        _1905 = _1917;
    }
    float _1919 = _1905;
    float _1921 = -_1909;
    float _1923 = _948 * _1921;
    float _1925 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1911);
    float _1927 = _966 * _1909;
    float _1929 = fma(_1895, _1867, -0.5);
    float _1931 = fma(_964, _1915, _1923);
    float _1933 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    float _1935 = _962 * _1909;
    float _1937 = fma(_988, _1915, _1927);
    float _1939 = fma(_968, _1919, _1931);
    float _1941 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1933);
    float _1943 = fma(_734, _1929, _840);
    float _1945 = fma(_982, _1915, _1935);
    float _1947 = fma(_986, _1919, _1937);
    float _1949 = _1941 + _1464;
    float _1951 = _1879 + 0.5;
    float _1953 = _1897 + 0.5;
    float _1955 = _1943 + 0.5;
    float _1957 = fma(_994, _1919, _1945);
    float _1959 = _1949 * 0.5;
    float _1961 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1963 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1965 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_77.x = _1953;
    out.m_77.y = _1883;
    out.m_77.z = _1955;
    out.m_77.w = _1951;
    float _1967 = fma(_1939, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1961);
    float _1969 = fma(_1939, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1963);
    float _1971 = fma(_1939, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1965);
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1967);
    float _1977 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1969);
    float _1979 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1971);
    float _1981 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.z = _1959;
    out.m_79.w = _1464;
    bool _1983 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1985 = isnan(_1248);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1991 = _1987 || _1989;
    float _1993 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_81.x = _1975;
    out.m_81.y = _1977;
    out.m_81.z = _1979;
    float _1997 = _1899 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1999 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1504;
    out.gl_Position.y = _1506;
    out.gl_Position.z = _1941;
    out.gl_Position.w = _1464;
    out.m_83.x = _1981;
    out.m_83.y = _1993;
    out.m_83.z = _1999;
    out.m_83.w = _1997;
    float _2001 = _1969;
    float _2003 = _1941;
    if (!_1991)
    {
        _2001 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2005 = _2001;
    float _2007 = _2005;
    float _2009 = _2005;
    if (!_1991)
    {
        _1619 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2011 = _1619;
    float _2013 = _2011;
    float _2015 = _2011;
    if (!_1991)
    {
        _2003 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2017 = _2003;
    float _2019 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2021 = _2017;
    float _2023 = _2017;
    if (!_1991)
    {
        _1621 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2025 = _1621;
    float _2027 = _2025;
    float _2029 = _2025;
    if (!_1991)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2031 = _1623;
    float _2033 = _1881 * _1528;
    float _2035 = -_1881;
    float _2037 = _2035 + 1.0;
    float _2039 = _1539 * _2033;
    float _2041 = _1549 * _2033;
    float _2043 = _1539 * _2037;
    float _2045 = _2033;
    float _2047 = _2031;
    float _2049 = _2031;
    if (!_1991)
    {
        _2045 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2051 = _2045;
    float _2053 = fma(_1545, _2039, _1533);
    float _2055 = fma(_1547, _2039, _1535);
    float _2057 = fma(_1539, _2041, _1537);
    out.m_85.x = _2053;
    out.m_85.y = _2055;
    out.m_85.z = _2057;
    out.m_85.w = _2043;
    bool _2059 = !_1991;
    float _2061 = _2051;
    float _2063 = _2051;
    if (!_2059)
    {
        bool _2065 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2067 = isnan(_1248);
        bool _2069 = _2065 || _2067;
        bool _2071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2073 = _2069 || _2071;
        if (!_2073)
        {
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2077 = _1248 + _2075;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2081 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2079;
            float _2083 = 1.0 / _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2105 = _2077 * _2083;
            float _2107 = precise::clamp(_2105, 0.0, 1.0);
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2113 = fma(_2107, _2087, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2115 = fma(_2107, _2111, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2117 = fma(_2107, _2091, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2119 = fma(_2107, _2095, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2121 = fma(_2107, _2099, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2123 = fma(_2107, _2103, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2063 = _2115;
            _2029 = _2121;
            _2009 = _2113;
            _2023 = _2119;
            _2015 = _2117;
            _2049 = _2123;
            _2125 = true;
        }
        else
        {
            bool _2127 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2129 = isnan(_1248);
            bool _2131 = _2127 || _2129;
            bool _2133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2135 = _2131 || _2133;
            if (!_2135)
            {
                _2007 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2137 = _2007;
            _2009 = _2137;
            if (!_2135)
            {
                _2061 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2139 = _2061;
            _2063 = _2139;
            if (!_2135)
            {
                _2013 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2141 = _2013;
            _2015 = _2141;
            if (!_2135)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2143 = _2021;
            _2023 = _2143;
            if (!_2135)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2145 = _2027;
            _2029 = _2145;
            if (!_2135)
            {
                _2047 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2147 = _2047;
            bool _2149 = !_2135;
            _2049 = _2147;
            if (!_2149)
            {
                bool _2151 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2153 = isnan(_1248);
                bool _2155 = _2151 || _2153;
                bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2159 = _2155 || _2157;
                if (!_2159)
                {
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2163 = _1248 + _2161;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2167 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2165;
                    float _2169 = 1.0 / _2167;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2191 = _2163 * _2169;
                    float _2193 = precise::clamp(_2191, 0.0, 1.0);
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2199 = fma(_2193, _2173, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2201 = fma(_2193, _2197, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2203 = fma(_2193, _2177, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2205 = fma(_2193, _2181, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2207 = fma(_2193, _2185, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2209 = fma(_2193, _2189, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2063 = _2201;
                    _2029 = _2207;
                    _2009 = _2199;
                    _2023 = _2205;
                    _2015 = _2203;
                    _2049 = _2209;
                    _2125 = true;
                }
                else
                {
                    _2063 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2009 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2015 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2049 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2125 = false;
    float _2211 = _2063;
    float _2213 = _2029;
    float _2215 = _2009;
    float _2217 = _2023;
    float _2219 = _2015;
    float _2221 = _2049;
    float _2223 = fma(_1977, -0.5, 0.5);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = -_2211;
    float _2229 = _2227 + _2213;
    float _2231 = _2019 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2233 = -_2215;
    float _2235 = _2233 + _2217;
    float _2237 = fma(_2225, _2229, _2211);
    out.m_87.x = 0.0;
    float _2239 = -_2219;
    float _2241 = _2239 + _2221;
    float _2243 = fma(_2225, _2235, _2215);
    float _2245 = _2237 * 0.586610972881317138671875;
    out.m_47.x = _2231;
    bool _2247 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2249 = fma(_2225, _2241, _2219);
    float _2251 = fma(_2243, 0.298911988735198974609375, _2245);
    bool _2253 = _1226 > 0.0;
    bool _2255 = isnan(_1226);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    float _2263 = fma(_2249, 0.114477999508380889892578125, _2251);
    float _2265 = -_2263;
    float _2267 = _2243 + _2265;
    float _2269 = -_2263;
    float _2271 = _2237 + _2269;
    float _2273 = -_2263;
    float _2275 = _2249 + _2273;
    float _2277 = fma(_2267, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2263);
    float _2279 = fma(_2271, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2263);
    float _2281 = fma(_2275, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2263);
    bool _2283 = !_2247;
    if (!_2283)
    {
        float _2285 = -_1156;
        float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2289 = -_1158;
        float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2293 = -_1160;
        float _2295 = _2293 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2297 = _2287 * _2287;
        float _2299 = fma(_2291, _2291, _2297);
        float _2301 = fma(_2295, _2295, _2299);
        float _2303 = sqrt(_2301);
        float _2305 = rsqrt(_2301);
        float _2307 = -_2303;
        float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2311 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        float _2315 = _2291 * _2305;
        float _2317 = _2287 * _2305;
        float _2319 = abs(_2313);
        float _2321 = log2(_2319);
        float _2323 = _2295 * _2305;
        float _2325 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2327 = _1977 * _2317;
        float _2329 = -_2317;
        float _2331 = -_2325;
        float _2333 = fma(_2329, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2331);
        float _2335 = fma(_1975, _2315, _2327);
        float _2337 = -_2323;
        float _2339 = fma(_2337, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2333);
        float _2341 = fma(_1979, _2323, _2335);
        float _2343 = precise::clamp(_2341, 0.0, 1.0);
        float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2347 = _2339 + _2345;
        float _2349 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2351 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2353 = precise::clamp(_2351, 0.0, 1.0);
        float _2355 = exp2(_2349);
        float _2357 = _2355 * _2353;
        float _2359 = _2343 * _2357;
        float _2361 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2363 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2365 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2361;
        out.m_87.y = _2363;
        out.m_87.z = _2365;
    }
    out.m_89.x = _2277;
    out.m_89.y = _2279;
    out.m_89.z = _2281;
    if (_2261)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2367 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2367;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2125 = false;
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
        float _2423 = as_type<float>(_122);
        out.gl_Position.z = _2423;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2496 = as_type<float>(_164);
        out.gl_Position.z = _2496;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _314 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _338 = _314 + _336;
    bool _340 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _342 = isnan(_314);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = 1.0 / _326;
    bool _354 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _356 = isnan(_314);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = -_350;
    float _368 = _366 + 1.0;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _334;
    float _374 = _364 * _368;
    float _376 = -_364;
    float _378 = _376 + 1.0;
    float _380 = 1.0 / _330;
    float _382 = _318 * _352;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _388;
    float _392 = fma(_390, _382, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _394 = _322 * _372;
    bool _396 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _398 = isnan(_314);
    bool _400 = _396 || _398;
    bool _402 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _404 = _400 || _402;
    float _406 = float(_404);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _412 = _314 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _414 = isnan(_314);
    bool _416 = _412 || _414;
    bool _418 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _420 = _416 || _418;
    float _422 = float(_420);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _426 = _424 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = _338 * _380;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _430;
    float _434 = fma(_386, _382, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = -_406;
    float _442 = _440 + 1.0;
    float _444 = fma(_432, _382, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = _406 * _378;
    float _448 = fma(_426, _428, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _450 = fma(_438, _428, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _452 = fma(_410, _428, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _454 = _422 * _442;
    float _456 = in.m_55.x;
    float _458 = in.m_55.y;
    float _460 = in.m_55.z;
    float _462 = -_422;
    float _464 = _462 + 1.0;
    float _466 = _434 * _454;
    float _468 = _392 * _454;
    float _470 = _444 * _454;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _476;
    float _480 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _466);
    float _482 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _484;
    float _488 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _470);
    float _490 = fma(_478, _394, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _492 = fma(_450, _446, _482);
    float _494 = fma(_474, _394, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _496 = fma(_486, _394, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _498 = fma(_448, _446, _480);
    float _500 = fma(_452, _446, _488);
    float _502 = fma(_490, _374, _492);
    float _504 = fma(_494, _374, _498);
    float _506 = fma(_496, _374, _500);
    float _508 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[146].y, _502);
    float _510 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[146].x, _504);
    float _512 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[146].z, _506);
    float _514 = _508 * _458;
    float _516 = _510 * _456;
    float _518 = _512 * _460;
    bool _520 = !_370;
    if (!_520)
    {
        float _522 = in.m_59.x;
        float _524 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _526 = _522 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _528 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _530 = _528 * _524;
        float _532 = floor(_530);
        float _534 = -_532;
        float _536 = _530 + _534;
        _156 = _536;
    }
    float _538 = _156;
    float _540 = in.m_59.y;
    float _542 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _544 = in.m_59.z;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _550 = _548 != 0;
    float _552 = in.m_59.x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _556 = _516 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _560 = _558 != 0;
    int _562 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _564 = _562 != 0;
    int _566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _568 = _566 != 0;
    float _570 = _518 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _572 = !_564;
    int _574 = _572 ? 0 : 1;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _578 = !_568;
    int _580 = _578 ? 0 : 1;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _584 = _540 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _586 = _544 * 2.0;
    float _588 = fma(_584, -2.0, _546);
    float _590 = _540 * 2.0;
    float _592 = _552 * 2.0;
    float _594 = floor(_586);
    float _596 = _552 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _598 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _588);
    float _600 = -_554;
    float _602 = fma(_596, 2.0, _600);
    float _604 = floor(_592);
    float _606 = _552 + _540;
    float _608 = -_134;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[76].x, _602);
    float _612 = _606 + (-1.0);
    float _614 = floor(_590);
    bool _616 = _594 > 0.0;
    float _618 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _620 = _594 >= 0.0;
    bool _622 = isnan(_594);
    bool _624 = _620 || _622;
    bool _626 = isnan(0.0);
    bool _628 = _624 || _626;
    float _630 = _594;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    float _634 = _612;
    bool _636 = _564;
    float _638 = _538;
    if (!_550)
    {
        _630 = _540;
    }
    float _640 = _630;
    float _642 = _640;
    if (!_550)
    {
        _632 = _544;
    }
    float _644 = _632;
    float _646 = _644;
    if (!_550)
    {
        _634 = _544;
    }
    float _648 = _634;
    float _650 = _648;
    if (_550)
    {
        _642 = _552;
    }
    float _652 = _642;
    if (_550)
    {
        _646 = _540;
    }
    float _654 = _646;
    if (_550)
    {
        _650 = _540;
    }
    float _656 = _650;
    bool _658 = _604 > 0.0;
    float _660 = _654 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _662 = _604 >= 0.0;
    bool _664 = isnan(_604);
    bool _666 = _662 || _664;
    bool _668 = isnan(0.0);
    bool _670 = _666 || _668;
    float _672 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[83].w, _576);
    bool _674 = !_560;
    int _676 = _674 ? 0 : 1;
    int _678 = _628 ? 0 : 1;
    float _680 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _672);
    bool _682 = _614 > 0.0;
    bool _684 = _614 >= 0.0;
    bool _686 = isnan(_614);
    bool _688 = _684 || _686;
    bool _690 = isnan(0.0);
    bool _692 = _688 || _690;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _696 = _692 ? 0 : 1;
    float _698 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[83].z, _694);
    float _700 = _652 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _702 = ~_678;
    int _704 = _702 + 1;
    int _706 = _704 + 1;
    float _708 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _710 = log2(_708);
    int _712 = abs(_676);
    float _714 = -_582;
    float _716 = fma(_700, 2.0, _714);
    int _718 = _706;
    if (!_616)
    {
        int _720 = ~_678;
        int _722 = _720 + 1;
        _718 = _722;
    }
    int _724 = _718;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _728 = ~_696;
    int _730 = _728 + 1;
    int _732 = _730 + 1;
    float _734 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _698);
    int _736 = _732;
    if (!_682)
    {
        int _738 = ~_696;
        int _740 = _738 + 1;
        _736 = _740;
    }
    int _742 = _736;
    float _744 = fma(_660, -2.0, _726);
    float _746 = float(_712);
    float _748 = float(_724);
    int _750 = _670 ? 0 : 1;
    float _752 = _710 * _134;
    float _754 = _746 * _748;
    float _756 = in.m_61.x;
    float _758 = in.m_61.y;
    float _760 = in.m_61.z;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _764 = ~_750;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    float _770 = exp2(_752);
    int _772 = _768;
    if (!_658)
    {
        int _774 = ~_750;
        int _776 = _774 + 1;
        _772 = _776;
    }
    int _778 = _772;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _782 = 1.0 + _780;
    float _784 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[78].z, _762);
    bool _786 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _788 = isnan(1.0);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _794 = _790 || _792;
    float _796 = _754 * (-2.0);
    bool _798 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _800 = isnan(0.0);
    bool _802 = _798 || _800;
    bool _804 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _806 = _802 || _804;
    float _808 = 1.0 / _782;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _812 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _784);
    int _814 = abs(_574);
    float _816 = _552 + (-0.5);
    float _818 = fma(_540, (*spvDescriptorSet0.vp_c9)._m0[78].w, _810);
    float _820 = float(_778);
    float _822 = fma(_618, _796, _618);
    float _824 = -_770;
    float _826 = _824 + 1.0;
    float _828 = float(_814);
    float _830 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _818);
    float _832 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _744);
    float _834 = fma(_796, _756, _756);
    float _836 = _806 ? _826 : 0.0;
    float _838 = -_134;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[81].x, _716);
    int _842 = abs(_580);
    float _844 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[196].x, _834);
    float _846 = _540 + _544;
    if (_794)
    {
        float _848 = _836 * _808;
        _158 = _848;
    }
    float _850 = _158;
    float _852 = _828 * _820;
    float _854 = _846 + (-1.0);
    float _856 = fma(_822, _850, _844);
    float _858 = float(_842);
    float _860 = _852 * (-2.0);
    float _862 = float(_742);
    float _864 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _866 = _552 + _544;
    float _868 = fma(_860, _758, _758);
    float _870 = _856 * 0.15915493667125701904296875;
    float _872 = _858 * _862;
    float _874 = _540 + (-0.5);
    float _876 = fma(_864, _860, _864);
    float _878 = _866 + (-1.0);
    float _880 = fma(_874, (*spvDescriptorSet0.vp_c9)._m0[196].y, _868);
    float _882 = _872 * (-2.0);
    float _884 = _870 * 6.283185482025146484375;
    float _886 = sin(_884);
    float _888 = fma(_876, _850, _880);
    float _890 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _892 = fma(_882, _760, _760);
    float _894 = _544 + (-0.5);
    float _896 = _888 * 0.15915493667125701904296875;
    float _898 = fma(_890, _882, _890);
    float _900 = _870 * 6.283185482025146484375;
    float _902 = cos(_900);
    float _904 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].z, _892);
    float _906 = fma(_898, _850, _904);
    float _908 = _896 * 6.283185482025146484375;
    float _910 = sin(_908);
    float _912 = in.m_63.x;
    float _914 = in.m_63.y;
    float _916 = in.m_63.z;
    float _918 = _906 * 0.15915493667125701904296875;
    bool _920 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _922 = isnan(0.5);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _928 = _924 || _926;
    float _930 = _896 * 6.283185482025146484375;
    float _932 = cos(_930);
    float _934 = _918 * 6.283185482025146484375;
    float _936 = cos(_934);
    float _938 = _886 * _910;
    float _940 = _902 * _910;
    float _942 = _288 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _944 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[6].x, _942);
    float _946 = _918 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = _886 * _932;
    float _952 = _902 * _932;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _916);
    float _956 = _288 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _958 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[6].z, _944);
    float _960 = _570 * _954;
    float _962 = _886 * _936;
    float _964 = _932 * _936;
    float _966 = _902 * _936;
    float _968 = _910 * _936;
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _914);
    float _972 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _912);
    float _974 = _958 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _976 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[5].x, _956);
    float _978 = _542 * _970;
    float _980 = -_940;
    float _982 = fma(_948, _950, _980);
    float _984 = -_950;
    float _986 = fma(_948, _940, _984);
    float _988 = fma(_948, _952, _938);
    float _990 = _556 * _972;
    float _992 = _966 * _978;
    float _994 = fma(_948, _938, _952);
    float _996 = -_978;
    float _998 = _948 * _996;
    float _1000 = _962 * _978;
    float _1002 = fma(_988, _990, _992);
    float _1004 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[5].z, _976);
    float _1006 = fma(_964, _990, _998);
    float _1008 = fma(_982, _990, _1000);
    float _1010 = fma(_986, _960, _1002);
    float _1012 = _1004 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1014 = fma(_968, _960, _1006);
    float _1016 = fma(_994, _960, _1008);
    float _1018 = _288 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1020 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1022 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1024 = fma(_286, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1018);
    float _1026 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1020);
    float _1028 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1022);
    float _1030 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1032 = fma(_290, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1024);
    float _1034 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1026);
    float _1036 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1028);
    float _1038 = _1032 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1040 = _974 + _1034;
    float _1042 = _1038 + _1036;
    float _1044 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1046 = _1040 + _1044;
    float _1048 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1030);
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1052 = _1042 + _1050;
    float _1054 = _1046 * _1046;
    float _1056 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1048);
    float _1058 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1060 = fma(_1052, _1052, _1054);
    float _1062 = _1056 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1064 = fma(_1038, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1058);
    float _1066 = sqrt(_1060);
    float _1068 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1064);
    float _1070 = _1010 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1072 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1074 = fma(_1014, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1070);
    float _1076 = 1.0 / _1062;
    float _1078 = _1070;
    float _1080 = _1010;
    float _1082 = _1016;
    float _1084 = _1042;
    if (_928)
    {
        _1078 = 1.0;
    }
    float _1086 = _1078;
    float _1088 = _1072 + _1062;
    float _1090 = fma(_1016, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1074);
    float _1092 = _1012 + _1090;
    bool _1094 = _1066 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1096 = _1088 * _1076;
    float _1098 = _1096 * 0.5;
    float _1100 = _1090;
    float _1102 = _1086;
    float _1104 = _1092;
    if (!_1094)
    {
        _1100 = _1042;
    }
    float _1106 = _1100;
    float _1108 = _1106;
    if (!_1094)
    {
        _1080 = _1040;
    }
    float _1110 = _1080;
    float _1112 = _1110;
    if (!_1094)
    {
        _1082 = _1092;
    }
    float _1114 = _1082;
    bool _1116 = !_1094;
    float _1118 = _1114;
    if (!_1116)
    {
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1122 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1124 = _1066 + _1122;
        float _1126 = _1092 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1128 = rsqrt(_1060);
        float _1130 = _1124 * _1120;
        float _1132 = _1130 * 0.15915493667125701904296875;
        float _1134 = _1132 * 6.283185482025146484375;
        float _1136 = cos(_1134);
        float _1138 = _1132 * 6.283185482025146484375;
        float _1140 = sin(_1138);
        float _1142 = _1136 + (-1.0);
        float _1144 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = fma(_1140, _1126, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1148 = fma(_1092, _1136, _1144);
        float _1150 = _1128 * _1146;
        float _1152 = fma(_1052, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1154 = fma(_1046, _1150, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1118 = _1148;
        _1108 = _1152;
        _1112 = _1154;
        _1084 = _1150;
    }
    float _1156 = _1118;
    float _1158 = _1108;
    float _1160 = _1112;
    float _1162 = _1084;
    float _1164 = _1162;
    if (!_928)
    {
        float _1166 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1168 = _1166 * 0.15915493667125701904296875;
        float _1170 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1174 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1172);
        float _1176 = _1168 * 6.283185482025146484375;
        float _1178 = cos(_1176);
        float _1180 = _1170 * 0.15915493667125701904296875;
        float _1182 = _1168 * 6.283185482025146484375;
        float _1184 = sin(_1182);
        float _1186 = 1.0 / _1178;
        float _1188 = _1180 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = _1184 * _1186;
        float _1194 = _1180 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        float _1198 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1200 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1198;
        float _1202 = _1190 * _1192;
        float _1204 = 1.0 / _1174;
        float _1206 = 1.0 / _1202;
        float _1208 = 1.0 / _1200;
        float _1210 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1212 = _1204 * _1210;
        float _1214 = _1196 * _1206;
        float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1218 = fma(_1214, _1212, _1216);
        float _1220 = _1218 * _1208;
        float _1222 = precise::clamp(_1220, 0.0, 1.0);
        _1164 = _1208;
        _1102 = _1222;
    }
    float _1224 = _1164;
    float _1226 = _1102;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1156 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1158 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1160 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1224;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1230;
    float _1278 = _1252;
    float _1280 = _1254;
    float _1282 = _1256;
    float _1284 = _1258;
    if (_1264)
    {
        float _1286 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1286;
    }
    float _1288 = _1270;
    if (_1264)
    {
        float _1290 = rsqrt(_1260);
        _1272 = _1290;
    }
    float _1292 = _1272;
    if (_1264)
    {
        float _1294 = _1268 * _1288;
        _1274 = _1294;
    }
    float _1296 = _1274;
    if (_1264)
    {
        float _1298 = _1296 * 0.15915493667125701904296875;
        _1104 = _1298;
    }
    float _1300 = _1104;
    float _1302 = _1038;
    if (_1264)
    {
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = precise::max(0.0, _1310);
    float _1314 = _1062;
    float _1316 = _1310;
    float _1318 = _1312;
    if (_1264)
    {
        float _1320 = _1300 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        _1314 = _1322;
    }
    float _1324 = _1314;
    float _1326 = -_1250;
    float _1328 = -_1312;
    float _1330 = fma(_1230, _1326, _1328);
    if (_1264)
    {
        float _1332 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1276 = _1332;
    }
    float _1334 = _1276;
    float _1336 = _1308;
    float _1338 = _1334;
    if (_1264)
    {
        float _1340 = fma(_1308, _1334, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1336 = _1340;
    }
    float _1342 = _1336;
    float _1344 = _1342;
    if (!_1264)
    {
        _1338 = _1330;
    }
    float _1346 = _1338;
    float _1348 = _1346;
    if (_1264)
    {
        float _1350 = _1324 + (-1.0);
        _1316 = _1350;
    }
    float _1352 = _1316;
    if (_1264)
    {
        float _1354 = _1292 * _1342;
        _1344 = _1354;
    }
    float _1356 = _1344;
    float _1358 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    if (_1264)
    {
        float _1360 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1318 = _1360;
    }
    float _1362 = _1318;
    if (_1264)
    {
        float _1364 = _1252 * _1356;
        _1278 = _1364;
    }
    float _1366 = _1278;
    if (_1264)
    {
        float _1368 = _1254 * _1356;
        _1280 = _1368;
    }
    float _1370 = _1280;
    float _1372 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1264)
    {
        float _1374 = fma(_1330, _1324, _1362);
        _1348 = _1374;
    }
    float _1376 = _1348;
    if (_1264)
    {
        float _1378 = _1366 * _1366;
        _1282 = _1378;
    }
    float _1380 = _1282;
    if (_1264)
    {
        float _1382 = _1370 * _1370;
        _1284 = _1382;
    }
    float _1384 = _1284;
    float _1386 = fma(_1376, _1376, _1380);
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1390 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1388);
    float _1392 = precise::clamp(_1390, 0.0, 1.0);
    float _1394 = _1386 + _1384;
    float _1396 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1372);
    float _1398 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1400 = -_1392;
    float _1402 = _1400 + 1.0;
    float _1404 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1406 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1396);
    float _1408 = rsqrt(_1394);
    float _1410 = _1156 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1412 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1398);
    float _1414 = _1406 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1416 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1404);
    float _1418 = fma(_1158, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1410);
    float _1420 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1412);
    float _1422 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1424 = abs(_1402);
    float _1426 = log2(_1424);
    float _1428 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1430 = _1420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1432 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1416);
    float _1434 = -_1422;
    float _1436 = fma(_1434, _1358, 1.0);
    float _1438 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1440 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1444 = _1408 * _1366;
    float _1446 = _1408 * _1376;
    float _1448 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1440);
    float _1450 = _1408 * _1370;
    float _1452 = _1444 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1454 = log2(_1436);
    float _1456 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1448);
    float _1458 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1460 = -_1452;
    float _1462 = fma(_1446, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1460);
    float _1464 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1456);
    float _1466 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = exp2(_1458);
    float _1470 = -_1450;
    float _1472 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1462);
    float _1474 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1476 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1478 = fma(_1472, -0.5, 0.5);
    float _1480 = fma(_1472, 0.5, 0.5);
    float _1482 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1474);
    float _1484 = 1.0 / _1464;
    float _1486 = _1446 + 1.0;
    float _1488 = fma(_1480, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1490 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1482);
    float _1492 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1476);
    float _1494 = _1454 * 0.693147182464599609375;
    float _1496 = fma(_1480, _1488, -0.212114393711090087890625);
    float _1498 = sqrt(_1478);
    float _1500 = -_1446;
    float _1502 = fma(_1468, _1486, _1500);
    float _1504 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1490);
    float _1506 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1492);
    float _1508 = fma(_1480, _1496, 1.570728778839111328125);
    float _1510 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1512 = _1504 * _1484;
    float _1514 = _1506 * _1484;
    float _1516 = fma(_1512, 0.5, 0.5);
    float _1518 = fma(_1514, -0.5, 0.5);
    float _1520 = fma(_1502, 0.5, 0.5);
    float _1522 = _1498 * 0.636619746685028076171875;
    float _1524 = -_1508;
    float _1526 = fma(_1522, _1524, 1.0);
    float3 _4660 = float3(_1516, _1518, _1510);
    float _1528 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4660, float3(0.0), isnan(_4660)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4660, float3(0.0), isnan(_4660)), level(0.0)).x;
    float3 _4671 = float3(_1516, _1518, _1510);
    float4 _1531 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4671, float3(0.0), isnan(_4671)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4671, float3(0.0), isnan(_4671)), level(0.0)).xyzw;
    float _1533 = _1531.x;
    float _1535 = _1531.y;
    float _1537 = _1531.z;
    float _1539 = _1531.w;
    float2 _4688 = float2(_1526, _1520);
    float3 _1543 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4688, float2(0.0), isnan(_4688)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4688, float2(0.0), isnan(_4688)), level(0.0)).xyz;
    float _1545 = _1543.x;
    float _1547 = _1543.y;
    float _1549 = _1543.z;
    float _1551 = in.m_59.w;
    float _1553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1555 = in.m_65.w;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1561 = _540 > 0.5;
    out.m_67.x = _556;
    out.m_67.y = _542;
    out.m_67.z = _570;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1565 = _1563 != 0;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1569 = _538 + _1567;
    float _1571 = 1.0 / _1559;
    int _1573 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1575 = _1573 != 0;
    float _1577 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1581 = _1579 != 0;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    int _1587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1589 = _1587 != 0;
    float _1591 = -_166;
    float _1593 = _1591 + 1.0;
    float _1595 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1597 = 1.0 / _1585;
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1599;
    bool _1603 = _1551 > 0.5;
    float _1605 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1607 = _1605 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    out.m_69.w = _1555;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1615 = 1.0 / _1607;
    bool _1617 = _1603;
    float _1619 = _1464;
    float _1621 = _1506;
    float _1623 = _1504;
    if (_1575)
    {
        bool _1625 = _552 > 0.5;
        _636 = _1625;
    }
    bool _1627 = _636;
    float _1629 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1631 = _1603 ? _1593 : _166;
    float _1633 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1635 = _1631;
    if (_1565)
    {
        bool _1637 = _544 > 0.5;
        _1617 = _1637;
    }
    bool _1639 = _1617;
    float _1641 = _1601 * _1571;
    float _1643 = 1.0 / _1613;
    float _1645 = in.m_53.x;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1647;
    float _1651 = _1609 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1653 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1655 = _1629 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1657 = _1633 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1663 = exp2(_1577);
    out.m_71.x = _1158;
    out.m_71.y = _1156;
    out.m_71.z = _1160;
    float _1665 = _1661 * _1615;
    out.m_73.x = _1651;
    out.m_73.y = _1655;
    out.m_73.z = _1657;
    out.m_73.w = _1653;
    float _1667 = _1649 * _1643;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1671 = _1669 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1675 = _538 + _1673;
    bool _1677 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1679 = isnan(_538);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1685 = _1681 || _1683;
    float _1687 = float(_1685);
    float _1689 = _1671 * _1597;
    bool _1691 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1693 = isnan(_538);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1705 = _538 + _1703;
    float _1707 = -_1663;
    float _1709 = _1707 + 1.0;
    float _1711 = fma(_1641, _1675, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1713 = -_1687;
    float _1715 = _1713 + 1.0;
    bool _1717 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1719 = isnan(_538);
    bool _1721 = _1717 || _1719;
    bool _1723 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1725 = _1721 || _1723;
    float _1727 = float(_1725);
    float _1729 = fma(_1665, _1569, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1731 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1733 = _1701 * _1715;
    float _1735 = -_1701;
    float _1737 = _1735 + 1.0;
    bool _1739 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1741 = isnan(_538);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    float _1751 = -_1727;
    float _1753 = _1751 + 1.0;
    float _1755 = fma(_1667, _1705, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1757 = _1727 * _1737;
    float _1759 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1761 = _538 + _1759;
    bool _1763 = _538 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1765 = isnan(_538);
    bool _1767 = _1763 || _1765;
    bool _1769 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1771 = _1767 || _1769;
    float _1773 = float(_1771);
    float _1775 = _1749 * _1753;
    int _1777 = as_type<int>(_1711);
    if (!_1575)
    {
        _638 = _1645;
    }
    float _1779 = _638;
    float _1781 = -_1749;
    float _1783 = _1781 + 1.0;
    float _1785 = _1581 ? _1631 : _166;
    float _1787 = fma(_1689, _1761, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1789 = _1779;
    if (!_1575)
    {
        _1635 = _1779;
    }
    float _1791 = _1635;
    float _1793 = _1773 * _1783;
    float _1795 = _1791;
    if (_1575)
    {
        _1789 = _1645;
    }
    float _1797 = _1789;
    float _1799 = _1731 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1801 = _1797;
    if (_1589)
    {
        float _1803 = _1561 ? _1593 : _166;
        _214 = _1803;
    }
    float _1805 = _214;
    float _1807 = fma(_1785, _1595, -0.5);
    float _1809 = _1711 * _1793;
    int _1811 = as_type<int>(_1805);
    if (_1575)
    {
        float _1813 = -_1797;
        float _1815 = _1813 + 1.0;
        _1777 = as_type<int>(_1815);
    }
    int _1817 = _1777;
    float _1819 = -_1773;
    float _1821 = _1819 + 1.0;
    float _1823 = fma(_1799, _1805, -0.5);
    bool _1825 = _914 != 0.0;
    bool _1827 = isnan(_914);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan(0.0);
    bool _1833 = _1829 || _1831;
    float _1835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1575)
    {
        float _1837 = _1627 ? as_type<float>(_1817) : _1797;
        _1795 = _1837;
    }
    float _1839 = _1795;
    if (_1565)
    {
        float _1841 = -_1797;
        float _1843 = _1841 + 1.0;
        _1811 = as_type<int>(_1843);
    }
    int _1845 = _1811;
    float _1847 = in.m_75.x;
    float _1849 = in.m_75.y;
    float _1851 = in.m_75.z;
    bool _1853 = _912 == 0.0;
    bool _1855 = !_1833;
    bool _1857 = _1853 && _1855;
    float _1859 = fma(_1821, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1809);
    float _1861 = -_598;
    float _1863 = fma(_830, _1823, _1861);
    if (_1565)
    {
        float _1865 = _1639 ? as_type<float>(_1845) : _1797;
        _1801 = _1865;
    }
    float _1867 = _1801;
    float _1869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1871 = _916 == 0.0;
    bool _1873 = _1871 && _1857;
    float _1875 = fma(_1729, _1775, _1859);
    float _1877 = -_832;
    float _1879 = fma(_680, _1807, _1877);
    float _1881 = _1709 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1883 = _1863 + 0.5;
    float _1885 = fma(_1755, _1757, _1875);
    float _1887 = _1835 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1889 = fma(_1787, _1733, _1885);
    float _1891 = fma(_1887, _1839, -0.5);
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1895 = _1869 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1897 = fma(_812, _1891, _610);
    float _1899 = fma(_1687, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1889);
    float _1901 = _1849;
    float _1903 = _1847;
    float _1905 = _1851;
    if (!_1873)
    {
        float _1907 = fma(_914, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1849);
        _1901 = _1907;
    }
    float _1909 = _1901;
    float _1911 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (!_1873)
    {
        float _1913 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1847);
        _1903 = _1913;
    }
    float _1915 = _1903;
    if (!_1873)
    {
        float _1917 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1851);
        _1905 = _1917;
    }
    float _1919 = _1905;
    float _1921 = -_1909;
    float _1923 = _948 * _1921;
    float _1925 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1911);
    float _1927 = _966 * _1909;
    float _1929 = fma(_1895, _1867, -0.5);
    float _1931 = fma(_964, _1915, _1923);
    float _1933 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1925);
    float _1935 = _962 * _1909;
    float _1937 = fma(_988, _1915, _1927);
    float _1939 = fma(_968, _1919, _1931);
    float _1941 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1933);
    float _1943 = fma(_734, _1929, _840);
    float _1945 = fma(_982, _1915, _1935);
    float _1947 = fma(_986, _1919, _1937);
    float _1949 = _1941 + _1464;
    float _1951 = _1879 + 0.5;
    float _1953 = _1897 + 0.5;
    float _1955 = _1943 + 0.5;
    float _1957 = fma(_994, _1919, _1945);
    float _1959 = _1949 * 0.5;
    float _1961 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1963 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1965 = _1947 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_77.x = _1953;
    out.m_77.y = _1883;
    out.m_77.z = _1955;
    out.m_77.w = _1951;
    float _1967 = fma(_1939, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1961);
    float _1969 = fma(_1939, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1963);
    float _1971 = fma(_1939, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1965);
    float _1973 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1967);
    float _1977 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1969);
    float _1979 = fma(_1957, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1971);
    float _1981 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_79.z = _1959;
    out.m_79.w = _1464;
    bool _1983 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1985 = isnan(_1248);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1991 = _1987 || _1989;
    float _1993 = _1893 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_81.x = _1975;
    out.m_81.y = _1977;
    out.m_81.z = _1979;
    float _1997 = _1899 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1999 = _1995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1504;
    out.gl_Position.y = _1506;
    out.gl_Position.z = _1941;
    out.gl_Position.w = _1464;
    out.m_83.x = _1981;
    out.m_83.y = _1993;
    out.m_83.z = _1999;
    out.m_83.w = _1997;
    float _2001 = _1969;
    float _2003 = _1941;
    if (!_1991)
    {
        _2001 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2005 = _2001;
    float _2007 = _2005;
    float _2009 = _2005;
    if (!_1991)
    {
        _1619 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2011 = _1619;
    float _2013 = _2011;
    float _2015 = _2011;
    if (!_1991)
    {
        _2003 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2017 = _2003;
    float _2019 = _1226 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2021 = _2017;
    float _2023 = _2017;
    if (!_1991)
    {
        _1621 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2025 = _1621;
    float _2027 = _2025;
    float _2029 = _2025;
    if (!_1991)
    {
        _1623 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2031 = _1623;
    float _2033 = _1881 * _1528;
    float _2035 = -_1881;
    float _2037 = _2035 + 1.0;
    float _2039 = _1539 * _2033;
    float _2041 = _1549 * _2033;
    float _2043 = _1539 * _2037;
    float _2045 = _2033;
    float _2047 = _2031;
    float _2049 = _2031;
    if (!_1991)
    {
        _2045 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2051 = _2045;
    float _2053 = fma(_1545, _2039, _1533);
    float _2055 = fma(_1547, _2039, _1535);
    float _2057 = fma(_1539, _2041, _1537);
    out.m_85.x = _2053;
    out.m_85.y = _2055;
    out.m_85.z = _2057;
    out.m_85.w = _2043;
    bool _2059 = !_1991;
    float _2061 = _2051;
    float _2063 = _2051;
    if (!_2059)
    {
        bool _2065 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2067 = isnan(_1248);
        bool _2069 = _2065 || _2067;
        bool _2071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2073 = _2069 || _2071;
        if (!_2073)
        {
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2077 = _1248 + _2075;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2081 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2079;
            float _2083 = 1.0 / _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2105 = _2077 * _2083;
            float _2107 = precise::clamp(_2105, 0.0, 1.0);
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2113 = fma(_2107, _2087, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2115 = fma(_2107, _2111, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2117 = fma(_2107, _2091, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2119 = fma(_2107, _2095, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2121 = fma(_2107, _2099, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2123 = fma(_2107, _2103, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2063 = _2115;
            _2029 = _2121;
            _2009 = _2113;
            _2023 = _2119;
            _2015 = _2117;
            _2049 = _2123;
            _2125 = true;
        }
        else
        {
            bool _2127 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2129 = isnan(_1248);
            bool _2131 = _2127 || _2129;
            bool _2133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2135 = _2131 || _2133;
            if (!_2135)
            {
                _2007 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2137 = _2007;
            _2009 = _2137;
            if (!_2135)
            {
                _2061 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2139 = _2061;
            _2063 = _2139;
            if (!_2135)
            {
                _2013 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2141 = _2013;
            _2015 = _2141;
            if (!_2135)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2143 = _2021;
            _2023 = _2143;
            if (!_2135)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2145 = _2027;
            _2029 = _2145;
            if (!_2135)
            {
                _2047 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2147 = _2047;
            bool _2149 = !_2135;
            _2049 = _2147;
            if (!_2149)
            {
                bool _2151 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2153 = isnan(_1248);
                bool _2155 = _2151 || _2153;
                bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2159 = _2155 || _2157;
                if (!_2159)
                {
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2163 = _1248 + _2161;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2167 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2165;
                    float _2169 = 1.0 / _2167;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2191 = _2163 * _2169;
                    float _2193 = precise::clamp(_2191, 0.0, 1.0);
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2199 = fma(_2193, _2173, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2201 = fma(_2193, _2197, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2203 = fma(_2193, _2177, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2205 = fma(_2193, _2181, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2207 = fma(_2193, _2185, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2209 = fma(_2193, _2189, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2063 = _2201;
                    _2029 = _2207;
                    _2009 = _2199;
                    _2023 = _2205;
                    _2015 = _2203;
                    _2049 = _2209;
                    _2125 = true;
                }
                else
                {
                    _2063 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2009 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2015 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2049 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2125 = false;
    float _2211 = _2063;
    float _2213 = _2029;
    float _2215 = _2009;
    float _2217 = _2023;
    float _2219 = _2015;
    float _2221 = _2049;
    float _2223 = fma(_1977, -0.5, 0.5);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = -_2211;
    float _2229 = _2227 + _2213;
    float _2231 = _2019 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2233 = -_2215;
    float _2235 = _2233 + _2217;
    float _2237 = fma(_2225, _2229, _2211);
    out.m_87.x = 0.0;
    float _2239 = -_2219;
    float _2241 = _2239 + _2221;
    float _2243 = fma(_2225, _2235, _2215);
    float _2245 = _2237 * 0.586610972881317138671875;
    out.m_47.x = _2231;
    bool _2247 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2249 = fma(_2225, _2241, _2219);
    float _2251 = fma(_2243, 0.298911988735198974609375, _2245);
    bool _2253 = _1226 > 0.0;
    bool _2255 = isnan(_1226);
    bool _2257 = _2253 || _2255;
    bool _2259 = isnan(0.0);
    bool _2261 = _2257 || _2259;
    float _2263 = fma(_2249, 0.114477999508380889892578125, _2251);
    float _2265 = -_2263;
    float _2267 = _2243 + _2265;
    float _2269 = -_2263;
    float _2271 = _2237 + _2269;
    float _2273 = -_2263;
    float _2275 = _2249 + _2273;
    float _2277 = fma(_2267, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2263);
    float _2279 = fma(_2271, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2263);
    float _2281 = fma(_2275, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2263);
    bool _2283 = !_2247;
    if (!_2283)
    {
        float _2285 = -_1156;
        float _2287 = _2285 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2289 = -_1158;
        float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2293 = -_1160;
        float _2295 = _2293 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2297 = _2287 * _2287;
        float _2299 = fma(_2291, _2291, _2297);
        float _2301 = fma(_2295, _2295, _2299);
        float _2303 = sqrt(_2301);
        float _2305 = rsqrt(_2301);
        float _2307 = -_2303;
        float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2311 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2313 = precise::clamp(_2311, 0.0, 1.0);
        float _2315 = _2291 * _2305;
        float _2317 = _2287 * _2305;
        float _2319 = abs(_2313);
        float _2321 = log2(_2319);
        float _2323 = _2295 * _2305;
        float _2325 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2327 = _1977 * _2317;
        float _2329 = -_2317;
        float _2331 = -_2325;
        float _2333 = fma(_2329, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2331);
        float _2335 = fma(_1975, _2315, _2327);
        float _2337 = -_2323;
        float _2339 = fma(_2337, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2333);
        float _2341 = fma(_1979, _2323, _2335);
        float _2343 = precise::clamp(_2341, 0.0, 1.0);
        float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2347 = _2339 + _2345;
        float _2349 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2351 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2353 = precise::clamp(_2351, 0.0, 1.0);
        float _2355 = exp2(_2349);
        float _2357 = _2355 * _2353;
        float _2359 = _2343 * _2357;
        float _2361 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2363 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2365 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2361;
        out.m_87.y = _2363;
        out.m_87.z = _2365;
    }
    out.m_89.x = _2277;
    out.m_89.y = _2279;
    out.m_89.z = _2281;
    if (_2261)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2367 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2367;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

