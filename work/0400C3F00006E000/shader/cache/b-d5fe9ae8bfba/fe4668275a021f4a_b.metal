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
    float4 m_71 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_89 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_63 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2425 = false;
    bool _188 = false;
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
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2710 = as_type<float>(_124);
        out.gl_Position.z = _2710;
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
    float _154 = _146;
    float _156 = _134;
    if (_152)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _116;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    int _160 = 0;
    if (_152)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2782 = as_type<float>(_164);
        out.gl_Position.z = _2782;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _146;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _194 = _190 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _200 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _212;
    float _216 = 1.0 / _202;
    bool _218 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _220 = isnan(_190);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = 1.0 / _210;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _234 = _190 + _232;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _238 = 1.0 / _198;
    float _240 = _194 * _216;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = _190 + _242;
    bool _246 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_190);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = 1.0 / _214;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = _190 + _260;
    float _264 = _234 * _230;
    bool _266 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _268 = isnan(_190);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_256;
    float _280 = _278 + 1.0;
    float _282 = 1.0 / _206;
    float _284 = _262 * _238;
    bool _286 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _288 = isnan(_190);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = _190 + _298;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _228 * _280;
    float _308 = -_228;
    float _310 = _308 + 1.0;
    float _312 = _244 * _258;
    bool _314 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_190);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_296;
    float _328 = _326 + 1.0;
    float _330 = _324 * _304;
    bool _332 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _334 = isnan(_190);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = _300 * _282;
    float _346 = _276 * _328;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = -_324;
    float _362 = _360 + 1.0;
    float _364 = fma(_350, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = _342 * _310;
    float _368 = fma(_354, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = fma(_358, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = _256 * _362;
    float _378 = _364 * _366;
    float _380 = -_342;
    float _382 = _380 + 1.0;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = fma(_374, _240, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _394 = _368 * _366;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _396;
    float _400 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _378);
    float _402 = fma(_386, _240, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _404 = fma(_390, _240, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _406 = _370 * _366;
    float _408 = fma(_398, _344, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _410 = fma(_392, _306, _400);
    float _412 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    float _424 = fma(_408, _376, _410);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _430 = fma(_404, _306, _412);
    float _432 = fma(_416, _344, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _438 = fma(_402, _306, _418);
    float _440 = fma(_422, _344, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _446 = fma(_428, _264, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _448 = fma(_436, _264, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _450 = fma(_432, _376, _438);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _456;
    float _460 = fma(_444, _264, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _462 = fma(_440, _376, _430);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _464;
    float _468 = fma(_446, _330, _424);
    float _470 = fma(_454, _312, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _472 = fma(_458, _312, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _474 = fma(_448, _330, _450);
    float _476 = fma(_466, _312, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _478 = fma(_460, _330, _462);
    float _480 = fma(_470, _346, _468);
    float _482 = fma(_472, _346, _474);
    float _484 = fma(_476, _346, _478);
    float _486 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].x, _480);
    float _488 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].y, _482);
    float _490 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].z, _484);
    bool _492 = !_236;
    if (!_492)
    {
        float _494 = in.m_53.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _154 = _508;
    }
    float _510 = _154;
    float _512 = in.m_53.z;
    float _514 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _516 = log2(_514);
    float _518 = in.m_53.x;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _522 = _520 != 0;
    float _524 = in.m_53.y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _528 = in.m_44.x;
    float _530 = in.m_44.y;
    float _532 = in.m_44.z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _546 = _544 != 0;
    float _548 = _512 * 2.0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _554 = _518 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _556 = _518 * 2.0;
    float _558 = floor(_548);
    float _560 = -_526;
    float _562 = fma(_554, 2.0, _560);
    float _564 = _524 + _512;
    float _566 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _568 = _524 * 2.0;
    float _570 = _530 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _572 = _530 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _574 = floor(_556);
    float _576 = _564 + (-1.0);
    float _578 = fma(_566, -2.0, _534);
    float _580 = _518 + _512;
    float _582 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[6].x, _572);
    float _584 = -_134;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[76].x, _562);
    float _588 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _578);
    float _590 = _580 + (-1.0);
    bool _592 = _558 > 0.0;
    float _594 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[6].z, _582);
    bool _596 = _558 >= 0.0;
    bool _598 = isnan(_558);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _530 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _608 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[5].x, _570);
    float _610 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _612 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[4].x, _606);
    float _614 = _528;
    float _616 = _608;
    int _618 = as_type<int>(_588);
    if (_522)
    {
        _614 = _518;
    }
    float _620 = _614;
    float _622 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _624 = _620;
    if (!_522)
    {
        _624 = _512;
    }
    float _626 = _624;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _630 = _604 ? 0 : 1;
    float _632 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    bool _634 = _574 > 0.0;
    float _636 = _626 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _638 = ~_630;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = floor(_568);
    int _646 = _642;
    float _648 = _636;
    if (!_592)
    {
        int _650 = ~_630;
        int _652 = _650 + 1;
        _646 = _652;
    }
    int _654 = _646;
    float _656 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    float _658 = -_628;
    float _660 = fma(_636, 2.0, _658);
    if (!_522)
    {
        _648 = _512;
    }
    float _662 = _648;
    bool _664 = _574 >= 0.0;
    bool _666 = isnan(_574);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _676 = _662;
    if (!_522)
    {
        _616 = _524;
    }
    float _678 = _616;
    float _680 = -_134;
    float _682 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[86].x, _660);
    float _684 = _678;
    if (_522)
    {
        _676 = _524;
    }
    float _686 = _676;
    float _688 = _594 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_522)
    {
        _684 = _518;
    }
    float _690 = _684;
    int _692 = _672 ? 0 : 1;
    float _694 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[83].w, _550);
    bool _696 = !_538;
    float _698 = _696 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[83].z, _674);
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _704 = ~_692;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _694);
    int _712 = _708;
    float _714 = _690;
    float _716 = _698;
    if (!_634)
    {
        int _718 = ~_692;
        int _720 = _718 + 1;
        _712 = _720;
    }
    int _722 = _712;
    float _724 = -_552;
    float _726 = fma(_702, 2.0, _724);
    bool _728 = !_542;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _700);
    int _734 = abs(as_type<int>(_698));
    float _736 = -_134;
    float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[81].x, _726);
    if (!_522)
    {
        _714 = _512;
    }
    float _740 = _714;
    float _742 = _740;
    if (_522)
    {
        _716 = _524;
    }
    float _744 = _716;
    float _746 = _744;
    if (_522)
    {
        _742 = _524;
    }
    float _748 = _742;
    if (!_522)
    {
        _746 = _518;
    }
    float _750 = _746;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _754 = _644 > 0.0;
    float _756 = _748 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _758 = _644 >= 0.0;
    bool _760 = isnan(_644);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    float _768 = _750 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _770 = fma(_756, -2.0, _752);
    int _772 = abs(_730);
    float _774 = float(_722);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _778 = float(_772);
    float _780 = _516 * _134;
    float _782 = float(_734);
    float _784 = fma(_768, -2.0, _776);
    float _786 = float(_654);
    float _788 = _778 * _774;
    float _790 = in.m_55.x;
    float _792 = in.m_55.y;
    float _794 = in.m_55.z;
    int _796 = _766 ? 0 : 1;
    float _798 = exp2(_780);
    float _800 = _782 * _786;
    float _802 = _788 * (-2.0);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _806 = ~_796;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _814 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[78].z, _804);
    int _816 = _810;
    if (!_754)
    {
        int _818 = ~_796;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _826 = 1.0 + _824;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _830 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].w, _812);
    float _832 = 1.0 / _826;
    float _834 = _656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _836 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _838 = isnan(1.0);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _844 = _840 || _842;
    float _846 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[88].w, _828);
    float _848 = fma(_610, _802, _610);
    float _850 = _632 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _854 = _834 + _852;
    float _856 = -_798;
    float _858 = _856 + 1.0;
    bool _860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _868 = _864 || _866;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _872 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _814);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _850 + _874;
    float _878 = _854 * _854;
    float _880 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[88].z, _870);
    float _882 = _868 ? _858 : 0.0;
    float _884 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _830);
    float _886 = fma(_802, _792, _792);
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _890 = _688 + _888;
    float _892 = fma(_876, _876, _878);
    float _894 = _524 + (-0.5);
    bool _896 = !_546;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _880);
    float _902 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _846);
    float _904 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _770);
    float _906 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _784);
    float _908 = _850;
    if (_844)
    {
        float _910 = _882 * _832;
        _156 = _910;
    }
    float _912 = _156;
    float _914 = fma(_890, _890, _892);
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].y, _886);
    int _918 = abs(_898);
    float _920 = _518 + _524;
    float _922 = float(_822);
    float _924 = fma(_848, _912, _916);
    float _926 = rsqrt(_914);
    float _928 = _920 + (-1.0);
    float _930 = float(_918);
    float _932 = _800 * (-2.0);
    float _934 = _924 * 0.15915493667125701904296875;
    float _936 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _938 = _518 + (-0.5);
    float _940 = _930 * _922;
    float _942 = fma(_932, _790, _790);
    float _944 = fma(_936, _932, _936);
    float _946 = _934 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = _940 * (-2.0);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].x, _942);
    float _954 = _512 + (-0.5);
    float _956 = fma(_622, _950, _622);
    float _958 = fma(_950, _794, _794);
    float _960 = fma(_944, _912, _952);
    float _962 = _854 * _926;
    float _964 = _876 * _926;
    float _966 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].z, _958);
    float _968 = _960 * 0.15915493667125701904296875;
    float _970 = -_962;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _974 = -_964;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _978 = fma(_956, _912, _966);
    float _980 = _890 * _926;
    float _982 = _972 * _972;
    float _984 = in.m_57.x;
    float _986 = in.m_57.y;
    float _988 = in.m_57.z;
    float _990 = _978 * 0.15915493667125701904296875;
    float _992 = -_980;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _996 = fma(_976, _976, _982);
    float _998 = in.m_59.x;
    float _1000 = in.m_59.y;
    float _1002 = in.m_59.z;
    float _1004 = _934 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = fma(_994, _994, _996);
    float _1010 = sqrt(_1008);
    float _1012 = _968 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = _490 * _988;
    float _1018 = _488 * _986;
    float _1020 = _486 * _984;
    float _1022 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1024 = _990 * 6.283185482025146484375;
    float _1026 = cos(_1024);
    float _1028 = _926 * _1010;
    float _1030 = _1028 * _1022;
    float _1032 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1002);
    float _1036 = _968 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _1014 * _1006;
    float _1042 = _1014 * _948;
    float _1044 = _1034 * _1030;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1000);
    float _1048 = _1028 * _1032;
    bool _1050 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1052 = isnan(0.5);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1058 = _1054 || _1056;
    float _1060 = _990 * 6.283185482025146484375;
    float _1062 = sin(_1060);
    float _1064 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1066 = _1014 * _1026;
    float _1068 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _998);
    float _1070 = _1006 * _1026;
    float _1072 = _1028 * _1064;
    float _1074 = _1066 * _1044;
    float _1076 = _1046 * _1048;
    float _1078 = _1038 * _948;
    float _1080 = _1038 * _1006;
    float _1082 = _1068 * _1072;
    float _1084 = _1038 * _1026;
    float _1086 = _948 * _1026;
    float _1088 = fma(_1062, _1040, _1078);
    float _1090 = -_1080;
    float _1092 = fma(_1062, _1042, _1090);
    float _1094 = -_1044;
    float _1096 = _1062 * _1094;
    float _1098 = -_1042;
    float _1100 = fma(_1062, _1080, _1098);
    float _1102 = fma(_1088, _1082, _1074);
    float _1104 = _1084 * _1044;
    float _1106 = fma(_1070, _1082, _1096);
    float _1108 = fma(_1062, _1078, _1040);
    float _1110 = -_1076;
    float _1112 = fma(_1092, _1110, _1102);
    float _1114 = fma(_1100, _1082, _1104);
    float _1116 = -_1076;
    float _1118 = fma(_1086, _1116, _1106);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = -_1076;
    float _1124 = fma(_1108, _1122, _1114);
    float _1126 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    float _1134 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1130);
    float _1136 = _688 + _1132;
    float _1138 = _850 + _1134;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1136 + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1146 = _1138 + _1144;
    float _1148 = _1142 * _1142;
    float _1150 = fma(_1146, _1146, _1148);
    float _1152 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1154 = sqrt(_1150);
    float _1156 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1152);
    float _1158 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1156);
    float _1160 = _834 + _1158;
    bool _1162 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1112;
    float _1166 = _1138;
    float _1168 = _1136;
    float _1170 = _964;
    if (!_1162)
    {
        _1164 = _1138;
    }
    float _1172 = _1164;
    float _1174 = _1172;
    if (!_1162)
    {
        _1166 = _1160;
    }
    float _1176 = _1166;
    bool _1178 = !_1162;
    float _1180 = _1176;
    if (!_1178)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1186 = _1154 + _1184;
        float _1188 = rsqrt(_1150);
        float _1190 = _1186 * _1182;
        float _1192 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1194 = _1190 * 0.15915493667125701904296875;
        float _1196 = _1194 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        float _1204 = fma(_1198, _1192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1206 = _1188 * _1204;
        float _1208 = _1202 + (-1.0);
        float _1210 = fma(_1146, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1212 = fma(_1142, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1214 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = fma(_1160, _1202, _1214);
        _1174 = _1210;
        _1180 = _1216;
        _1168 = _1212;
    }
    float _1218 = _1174;
    float _1220 = _1180;
    float _1222 = _1168;
    float _1224 = -_964;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1228 = -_962;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1232 = -_980;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1236 = _1230;
    float _1238 = _1226;
    float _1240 = _1234;
    if (!_1058)
    {
        float _1242 = -_962;
        float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
        float _1246 = -_964;
        float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
        float _1250 = -_980;
        float _1252 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1258 = _1244 + _1256;
        float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1262 = _1248 + _1260;
        float _1264 = -_688;
        float _1266 = _1264 + _1222;
        float _1268 = -_850;
        float _1270 = _1268 + _1218;
        float _1272 = _1258 * _1258;
        float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1276 = _1252 + _1274;
        float _1278 = -_834;
        float _1280 = _1278 + _1220;
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1284 = fma(_1262, _1262, _1272);
        float _1286 = fma(_1276, _1276, _1284);
        float _1288 = 1.0 / _1028;
        float _1290 = sqrt(_1286);
        float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1294 = precise::min(_1290, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1296 = _1294 * _1254;
        float _1298 = _1296 * _1288;
        float _1300 = _1292 * _1298;
        float _1302 = _1266 * _1298;
        float _1304 = fma(_1270, _1300, _1248);
        float _1306 = fma(_1280, _1300, _1244);
        float _1308 = fma(_1292, _1302, _1252);
        _1236 = _1306;
        _1238 = _1304;
        _1240 = _1308;
        _908 = _1270;
        _1170 = _1300;
    }
    float _1310 = _1236;
    float _1312 = _1238;
    float _1314 = _1240;
    float _1316 = _908;
    float _1318 = _1170;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1310 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1326 = _1312 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1330 = _1314 + _1328;
    float _1332 = _1322 * _1322;
    float _1334 = fma(_1326, _1326, _1332);
    float _1336 = fma(_1330, _1330, _1334);
    float _1338 = rsqrt(_1336);
    float _1340 = sqrt(_1336);
    float _1342 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1344 = _1326 * _1342;
    float _1346 = _1330 * _1342;
    float _1348 = _1344 * _1344;
    float _1350 = _1346 * _1346;
    float _1352 = _1348 + _1350;
    float _1354 = sqrt(_1352);
    bool _1356 = _1354 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = _1354 + _1358;
    float _1362 = _1338;
    float _1364 = _1360;
    float _1366 = _1316;
    float _1368 = _1322;
    float _1370 = _1342;
    if (_1356)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1362 = _1372;
    }
    float _1374 = _1362;
    float _1376 = _1374;
    if (_1356)
    {
        float _1378 = _1360 * _1374;
        _1364 = _1378;
    }
    float _1380 = _1364;
    if (_1356)
    {
        float _1382 = rsqrt(_1352);
        _1376 = _1382;
    }
    float _1384 = _1376;
    float _1386 = _1384;
    if (_1356)
    {
        float _1388 = _1380 * 0.15915493667125701904296875;
        _1366 = _1388;
    }
    float _1390 = _1366;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1394 = _1330;
    float _1396 = _1390;
    if (_1356)
    {
        float _1398 = _1390 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        _1394 = _1400;
    }
    float _1402 = _1394;
    float _1404 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1406 = precise::max(0.0, _1392);
    float _1408 = _1318;
    float _1410 = _1406;
    if (_1356)
    {
        float _1412 = _1390 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = -_1342;
    float _1420 = -_1406;
    float _1422 = fma(_1322, _1418, _1420);
    if (_1356)
    {
        float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1368 = _1424;
    }
    float _1426 = _1368;
    float _1428 = _1402;
    float _1430 = _1426;
    if (_1356)
    {
        float _1432 = fma(_1402, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1428 = _1432;
    }
    float _1434 = _1428;
    float _1436 = _1434;
    if (!_1356)
    {
        _1430 = _1422;
    }
    float _1438 = _1430;
    float _1440 = _1438;
    if (_1356)
    {
        float _1442 = _1384 * _1434;
        _1370 = _1442;
    }
    float _1444 = _1370;
    if (!_1356)
    {
        _1386 = _1344;
    }
    float _1446 = _1386;
    float _1448 = _1446;
    float _1450 = _1416;
    if (_1356)
    {
        float _1452 = _1416 + (-1.0);
        _1410 = _1452;
    }
    float _1454 = _1410;
    float _1456 = _1454;
    if (_1356)
    {
        float _1458 = _1344 * _1444;
        _1448 = _1458;
    }
    float _1460 = _1448;
    if (!_1356)
    {
        _1436 = _1348;
    }
    float _1462 = _1436;
    float _1464 = _1462;
    if (_1356)
    {
        float _1466 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1396 = _1466;
    }
    float _1468 = _1396;
    if (!_1356)
    {
        _1456 = _1346;
    }
    float _1470 = _1456;
    float _1472 = _1470;
    if (_1356)
    {
        float _1474 = _1346 * _1444;
        _1472 = _1474;
    }
    float _1476 = _1472;
    if (_1356)
    {
        float _1478 = _1460 * _1460;
        _1464 = _1478;
    }
    float _1480 = _1464;
    if (_1356)
    {
        float _1482 = fma(_1422, _1416, _1468);
        _1440 = _1482;
    }
    float _1484 = _1440;
    if (!_1356)
    {
        _1450 = _1350;
    }
    float _1486 = _1450;
    float _1488 = _1486;
    if (_1356)
    {
        float _1490 = _1476 * _1476;
        _1488 = _1490;
    }
    float _1492 = _1488;
    float _1494 = fma(_1484, _1484, _1480);
    float _1496 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = _1494 + _1492;
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1502 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1500);
    float _1504 = precise::clamp(_1502, 0.0, 1.0);
    float _1506 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    float _1508 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1510 = rsqrt(_1498);
    float _1512 = -_1504;
    float _1514 = _1512 + 1.0;
    float _1516 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1518 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1520 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1508);
    float _1522 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1524 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1526 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1518);
    float _1528 = abs(_1514);
    float _1530 = log2(_1528);
    float _1532 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1520);
    float _1534 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1522);
    float _1536 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1526);
    float _1538 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1542 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1534);
    float _1544 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1546 = _1510 * _1460;
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1550 = _1510 * _1484;
    float _1552 = _1510 * _1476;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1548);
    float _1558 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1560 = -_1538;
    float _1562 = fma(_1560, _1404, 1.0);
    float _1564 = -_1554;
    float _1566 = fma(_1550, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1564);
    float _1568 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1570 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1556);
    float _1572 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1574 = -_1552;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1566);
    float _1578 = exp2(_1568);
    float _1580 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1570);
    float _1582 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1584 = fma(_1576, -0.5, 0.5);
    float _1586 = fma(_1576, 0.5, 0.5);
    float _1588 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1572);
    float _1590 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1582);
    float _1592 = _1550 + 1.0;
    float _1594 = log2(_1562);
    float _1596 = fma(_1586, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1598 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1590);
    float _1600 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1588);
    float _1602 = fma(_1586, _1596, -0.212114393711090087890625);
    float _1604 = 1.0 / _1580;
    float _1606 = -_1550;
    float _1608 = fma(_1578, _1592, _1606);
    float _1610 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1598);
    float _1612 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1600);
    float _1614 = fma(_1586, _1602, 1.570728778839111328125);
    float _1616 = fma(_1608, 0.5, 0.5);
    float _1618 = sqrt(_1584);
    float _1620 = _1594 * 0.693147182464599609375;
    float _1622 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1624 = _1610 * _1604;
    float _1626 = _1612 * _1604;
    float _1628 = fma(_1624, 0.5, 0.5);
    float _1630 = fma(_1626, -0.5, 0.5);
    float _1632 = _1618 * 0.636619746685028076171875;
    float3 _5170 = float3(_1628, _1630, _1622);
    float _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5170, float3(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5170, float3(0.0), isnan(_5170)), level(0.0)).x;
    float _1636 = -_1614;
    float _1638 = fma(_1632, _1636, 1.0);
    float3 _5186 = float3(_1628, _1630, _1622);
    float4 _1641 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5186, float3(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5186, float3(0.0), isnan(_5186)), level(0.0)).xyzw;
    float _1643 = _1641.x;
    float _1645 = _1641.y;
    float _1647 = _1641.z;
    float _1649 = _1641.w;
    float2 _5203 = float2(_1638, _1616);
    float3 _1653 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5203, float2(0.0), isnan(_5203)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5203, float2(0.0), isnan(_5203)), level(0.0)).xyz;
    float _1655 = _1653.x;
    float _1657 = _1653.y;
    float _1659 = _1653.z;
    float _1661 = in.m_61.y;
    float _1663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1665 = in.m_53.w;
    bool _1667 = _524 > 0.5;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1669;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1675 = _1673 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1679 = _510 + _1677;
    float _1681 = 1.0 / _1671;
    int _1683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1685 = _1683 != 0;
    float _1687 = in.m_61.x;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1689;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1695 = _1693 != 0;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1699 = _1697 != 0;
    out.m_63.x = _1312;
    out.m_63.y = _1310;
    out.m_63.z = _1314;
    float _1701 = 1.0 / _1675;
    bool _1703 = _512 > 0.5;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1707 = _1705 != 0;
    float _1709 = -_1661;
    float _1711 = _1709 + 1.0;
    float _1713 = 1.0 / _1691;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1717 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1715;
    bool _1719 = _1665 > 0.5;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1723 = _1721 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    int _1725 = _1667 ? as_type<int>(_1711) : as_type<int>(_1661);
    int _1727 = _1719 ? as_type<int>(_1711) : as_type<int>(_1661);
    float _1729 = _1695 ? as_type<float>(_1725) : _1661;
    float _1731 = _1679 * _1681;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1735 = _1733 != 0;
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1739 = _510 + _1737;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1743 = _1741 != 0;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1745;
    float _1749 = _1699 ? as_type<float>(_1727) : _1661;
    float _1751 = _1739 * _1701;
    bool _1753 = _1699;
    float _1755 = _1661;
    float _1757 = _1731;
    float _1759 = _1580;
    float _1761 = _1612;
    float _1763 = _1610;
    if (_1685)
    {
        bool _1765 = _518 > 0.5;
        _1753 = _1765;
    }
    bool _1767 = _1753;
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1769;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1777 = _510 + _1775;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1781 = _1779 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1787 = fma(_1723, _1751, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1789 = _1777 * _1713;
    float _1791 = fma(_1781, _1751, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1793 = fma(_1785, _1751, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1797 = fma(_1717, _1731, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1799 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1801 = isnan(_510);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1811;
    float _1815 = _1687;
    if (_1743)
    {
        float _1817 = _1703 ? _1711 : _1661;
        _1755 = _1817;
    }
    float _1819 = _1755;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1821;
    float _1825 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1827 = fma(_1813, _1789, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    bool _1829 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1831 = isnan(_510);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1837 = _1833 || _1835;
    float _1839 = float(_1837);
    float _1841 = fma(_1823, _1789, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1843 = fma(_1825, _1729, -0.5);
    float _1845 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1847 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1849 = isnan(_510);
    bool _1851 = _1847 || _1849;
    bool _1853 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1855 = _1851 || _1853;
    float _1857 = float(_1855);
    float _1859 = -_1809;
    float _1861 = _1859 + 1.0;
    bool _1863 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1865 = isnan(_510);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1871 = _1867 || _1869;
    float _1873 = float(_1871);
    float _1875 = fma(_1749, _1845, -0.5);
    float _1877 = -_1839;
    float _1879 = _1877 + 1.0;
    float _1881 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1883 = fma(_1747, _1731, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1885 = fma(_1771, _1731, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1887 = _1873 * _1879;
    float _1889 = -_588;
    float _1891 = fma(_884, _1843, _1889);
    float _1893 = fma(_1881, _1819, -0.5);
    int _1895 = as_type<int>(_1881);
    float _1897 = _1843;
    if (_1685)
    {
        float _1899 = -_1687;
        float _1901 = _1899 + 1.0;
        _618 = as_type<int>(_1901);
    }
    int _1903 = _618;
    if (_1707)
    {
        float _1905 = -_1687;
        float _1907 = _1905 + 1.0;
        _1895 = as_type<int>(_1907);
    }
    int _1909 = _1895;
    float _1911 = _1857 * _1861;
    int _1913 = 0;
    float _1915 = as_type<float>(_1909);
    if (_1735)
    {
        float _1917 = -_1687;
        float _1919 = _1917 + 1.0;
        _1913 = as_type<int>(_1919);
    }
    int _1921 = _1913;
    float _1923 = -_1857;
    float _1925 = _1923 + 1.0;
    float _1927 = _1797 * _1887;
    float _1929 = _1883 * _1887;
    float _1931 = _1885 * _1887;
    float _1933 = -_1873;
    float _1935 = _1933 + 1.0;
    float _1937 = _1927;
    if (!_1685)
    {
        _1757 = _1687;
    }
    float _1939 = _1757;
    float _1941 = _1839 * _1925;
    float _1943 = 0.0;
    float _1945 = _1939;
    if (!_1707)
    {
        _1943 = _1687;
    }
    float _1947 = _1943;
    float _1949 = in.m_65.x;
    float _1951 = in.m_65.y;
    float _1953 = in.m_65.z;
    float _1955 = _1947;
    if (_1685)
    {
        float _1957 = _1767 ? as_type<float>(_1903) : _1687;
        _1945 = _1957;
    }
    float _1959 = _1945;
    float _1961 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1927);
    if (_1707)
    {
        float _1963 = _1703 ? as_type<float>(_1909) : _1687;
        _1955 = _1963;
    }
    float _1965 = _1955;
    float _1967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1735)
    {
        float _1969 = _1667 ? as_type<float>(_1921) : _1687;
        _1815 = _1969;
    }
    float _1971 = _1815;
    float _1973 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1929);
    float _1975 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1931);
    bool _1977 = _1000 != 0.0;
    bool _1979 = isnan(_1000);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.0);
    bool _1985 = _1981 || _1983;
    float _1987 = in.m_67.x;
    float _1989 = in.m_67.y;
    float _1991 = in.m_67.z;
    float _1993 = in.m_67.w;
    float _1995 = fma(_1787, _1941, _1961);
    float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1999 = _998 == 0.0;
    bool _2001 = !_1985;
    bool _2003 = _1999 && _2001;
    float _2005 = fma(_1791, _1941, _1973);
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _2007;
    float _2011 = fma(_1793, _1941, _1975);
    bool _2013 = _1002 == 0.0;
    bool _2015 = _2013 && _2003;
    float _2017 = fma(_1827, _1911, _1995);
    float _2019 = fma(_2009, _1789, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _2021 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2025 = fma(_1841, _1911, _2005);
    float _2027 = fma(_2019, _1911, _2011);
    float _2029 = fma(_2021, _1959, -0.5);
    float _2031 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[110].x, _2017);
    float _2033 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[110].y, _2025);
    float _2035 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[110].z, _2027);
    float _2037 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2039 = fma(_872, _2029, _586);
    if (_2015)
    {
        _1937 = _1949;
    }
    float _2041 = _1937;
    float _2043 = _2041;
    if (!_2015)
    {
        float _2045 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1949);
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = fma(_2037, _1965, -0.5);
    if (_2015)
    {
        _1915 = _1951;
    }
    float _2051 = _1915;
    float _2053 = _1987 * _1951;
    float _2055 = _2051;
    if (!_2015)
    {
        float _2057 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1951);
        _2055 = _2057;
    }
    float _2059 = _2055;
    float _2061 = _1991 * _1949;
    float _2063 = _1989 * _1953;
    float _2065 = fma(_732, _2049, _738);
    if (_2015)
    {
        _1897 = _1953;
    }
    float _2067 = _1897;
    float _2069 = -_2053;
    float _2071 = fma(_1989, _1949, _2069);
    float _2073 = _2067;
    if (!_2015)
    {
        float _2075 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1953);
        _2073 = _2075;
    }
    float _2077 = _2073;
    float _2079 = -_2061;
    float _2081 = fma(_1987, _1953, _2079);
    float _2083 = -_2063;
    float _2085 = fma(_1991, _1951, _2083);
    float _2087 = -_904;
    float _2089 = fma(_710, _1875, _2087);
    float _2091 = _2071 * _1993;
    float _2093 = -_906;
    float _2095 = fma(_902, _1893, _2093);
    float _2097 = _2085 * _1993;
    float _2099 = _1891 + 0.5;
    float _2101 = _2039 + 0.5;
    float _2103 = _2065 + 0.5;
    float _2105 = _2089 + 0.5;
    float _2107 = -_2077;
    float _2109 = _1062 * _2107;
    float _2111 = -_1991;
    float _2113 = _1062 * _2111;
    float _2115 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2117 = -_2091;
    float _2119 = _1062 * _2117;
    out.m_69.x = _2101;
    out.m_69.y = _2099;
    out.m_69.z = _2103;
    out.m_69.w = _2105;
    float _2121 = _2031 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2123 = fma(_2115, _1971, -0.5);
    float _2125 = fma(_1070, _2097, _2119);
    float _2127 = _1066 * _1991;
    float _2129 = _2033 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2131 = fma(_900, _2123, _682);
    float _2133 = _2081 * _1993;
    float _2135 = fma(_1070, _2047, _2109);
    float _2137 = fma(_1070, _1987, _2113);
    float _2139 = _2035 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2141 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2143 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = -_2059;
    float _2147 = fma(_1086, _2145, _2135);
    float _2149 = _1084 * _1991;
    float _2151 = _1066 * _2077;
    float _2153 = _1066 * _2091;
    float _2155 = _1084 * _2077;
    float _2157 = fma(_1100, _1987, _2149);
    float _2159 = fma(_1088, _2047, _2151);
    float _2161 = fma(_1088, _1987, _2127);
    float _2163 = fma(_1088, _2097, _2153);
    float _2165 = fma(_1100, _2047, _2155);
    float _2167 = -_2059;
    float _2169 = fma(_1092, _2167, _2159);
    float _2171 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2173 = -_2133;
    float _2175 = fma(_1092, _2173, _2163);
    float _2177 = -_2059;
    float _2179 = fma(_1108, _2177, _2165);
    float _2181 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2183 = -_2133;
    float _2185 = fma(_1086, _2183, _2125);
    float _2187 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_71.x = _2141;
    out.m_71.y = _2143;
    out.m_71.z = _2171;
    float _2189 = _1084 * _2091;
    float _2191 = -_1989;
    float _2193 = fma(_1108, _2191, _2157);
    float _2195 = -_1989;
    float _2197 = fma(_1092, _2195, _2161);
    float _2199 = -_1989;
    float _2201 = fma(_1086, _2199, _2137);
    float _2203 = fma(_1100, _2097, _2189);
    float _2205 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2207 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2209 = _2131 + 0.5;
    float _2211 = -_2133;
    float _2213 = fma(_1108, _2211, _2203);
    float _2215 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2217 = fma(_2201, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2207);
    float _2219 = fma(_2147, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2181);
    float _2221 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2187);
    float _2223 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2225 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2227 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2229 = fma(_2147, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2215);
    float _2231 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2233 = fma(_2147, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2225);
    float _2235 = exp2(_2223);
    float _2237 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2239 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2227);
    float _2241 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2243 = fma(_2201, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2231);
    float _2245 = fma(_2201, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2237);
    float _2247 = fma(_2193, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2217);
    float _2249 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2241);
    float _2251 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2205);
    float _2253 = _1580 * 0.5;
    float _2255 = fma(_2193, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2245);
    float _2257 = fma(_2193, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2243);
    float _2259 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2221);
    float _2261 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2249);
    float _2263 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2251);
    float _2265 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2239);
    float _2267 = -_2235;
    float _2269 = _2267 + 1.0;
    float _2271 = fma(_1612, -0.5, _2253);
    float _2273 = _1610 + _1580;
    float _2275 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2277 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _2259;
    out.m_73.y = _2261;
    out.m_73.z = _2263;
    float _2279 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2233);
    float _2281 = _2275 + _1580;
    float _2283 = _2095 + 0.5;
    float _2285 = _2273 * 0.5;
    float _2287 = _2281 * 0.5;
    float _2289 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2219);
    float _2291 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2229);
    out.m_75.x = _2209;
    out.m_75.y = _2283;
    bool _2293 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2295 = isnan(_1340);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2301 = _2297 || _2299;
    out.m_77.x = _2285;
    out.m_77.y = _2271;
    out.m_77.z = _2287;
    out.m_77.w = _1580;
    out.m_79.x = _2289;
    out.m_79.y = _2279;
    out.m_79.z = _2291;
    out.m_81.x = _2247;
    out.m_81.y = _2255;
    out.m_81.z = _2257;
    out.gl_Position.x = _1610;
    out.gl_Position.y = _1612;
    out.gl_Position.z = _2275;
    out.gl_Position.w = _1580;
    float _2303 = _2255;
    float _2305 = _2247;
    float _2307 = _2275;
    if (!_2301)
    {
        _2303 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2309 = _2303;
    float _2311 = _2309;
    float _2313 = _2309;
    if (!_2301)
    {
        _2305 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2315 = _2305;
    float _2317 = _2315;
    float _2319 = _2315;
    if (!_2301)
    {
        _1759 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2321 = _1759;
    float _2323 = _2321;
    float _2325 = _2321;
    if (!_2301)
    {
        _2307 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2327 = _2307;
    float _2329 = _2327;
    float _2331 = _2327;
    if (!_2301)
    {
        _1761 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2333 = _1761;
    float _2335 = _2333;
    float _2337 = _2333;
    if (!_2301)
    {
        _1763 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2339 = _1763;
    float _2341 = _2277 * _1634;
    float _2343 = -_2277;
    float _2345 = _2343 + 1.0;
    float _2347 = _1649 * _2341;
    float _2349 = _1649 * _2345;
    float _2351 = _1659 * _2341;
    float _2353 = fma(_1655, _2347, _1643);
    float _2355 = fma(_1657, _2347, _1645);
    float _2357 = fma(_1649, _2351, _1647);
    out.m_83.x = _2353;
    out.m_83.y = _2355;
    out.m_83.z = _2357;
    out.m_83.w = _2349;
    bool _2359 = !_2301;
    float _2361 = _2339;
    float _2363 = _2339;
    if (!_2359)
    {
        bool _2365 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2367 = isnan(_1340);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2373 = _2369 || _2371;
        if (!_2373)
        {
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2377 = _1340 + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2379;
            float _2383 = 1.0 / _2381;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2405 = _2377 * _2383;
            float _2407 = precise::clamp(_2405, 0.0, 1.0);
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2413 = fma(_2407, _2387, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2319 = _2415;
            _2337 = _2421;
            _2313 = _2413;
            _2331 = _2419;
            _2325 = _2417;
            _2363 = _2423;
            _2425 = true;
        }
        else
        {
            bool _2427 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2429 = isnan(_1340);
            bool _2431 = _2427 || _2429;
            bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2435 = _2431 || _2433;
            if (!_2435)
            {
                _2311 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2437 = _2311;
            _2313 = _2437;
            if (!_2435)
            {
                _2317 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2439 = _2317;
            _2319 = _2439;
            if (!_2435)
            {
                _2323 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2441 = _2323;
            _2325 = _2441;
            if (!_2435)
            {
                _2329 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2443 = _2329;
            _2331 = _2443;
            if (!_2435)
            {
                _2335 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2445 = _2335;
            _2337 = _2445;
            if (!_2435)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2447 = _2361;
            bool _2449 = !_2435;
            _2363 = _2447;
            if (!_2449)
            {
                bool _2451 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2453 = isnan(_1340);
                bool _2455 = _2451 || _2453;
                bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2459 = _2455 || _2457;
                if (!_2459)
                {
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2463 = _1340 + _2461;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2465;
                    float _2469 = 1.0 / _2467;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2491 = _2463 * _2469;
                    float _2493 = precise::clamp(_2491, 0.0, 1.0);
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2499 = fma(_2493, _2473, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2501 = fma(_2493, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2503 = fma(_2493, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2505 = fma(_2493, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2507 = fma(_2493, _2485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2509 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2319 = _2501;
                    _2337 = _2507;
                    _2313 = _2499;
                    _2331 = _2505;
                    _2325 = _2503;
                    _2363 = _2509;
                    _2425 = true;
                }
                else
                {
                    _2319 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2337 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2313 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2331 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2325 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2425 = false;
    float _2511 = _2319;
    float _2513 = _2337;
    float _2515 = _2313;
    float _2517 = _2331;
    float _2519 = _2325;
    float _2521 = _2363;
    float _2523 = fma(_2279, -0.5, 0.5);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = -_2511;
    float _2529 = _2527 + _2513;
    float _2531 = -_2515;
    float _2533 = _2531 + _2517;
    float _2535 = -_2519;
    float _2537 = _2535 + _2521;
    bool _2539 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2541 = fma(_2525, _2529, _2511);
    float _2543 = fma(_2525, _2533, _2515);
    float _2545 = fma(_2525, _2537, _2519);
    float _2547 = _2541 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2549 = fma(_2543, 0.298911988735198974609375, _2547);
    float _2551 = fma(_2545, 0.114477999508380889892578125, _2549);
    out.m_85.x = 0.0;
    float _2553 = -_2551;
    float _2555 = _2543 + _2553;
    float _2557 = -_2551;
    float _2559 = _2541 + _2557;
    float _2561 = -_2551;
    float _2563 = _2545 + _2561;
    float _2565 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2567 = fma(_2555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2551);
    float _2569 = fma(_2559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2551);
    float _2571 = fma(_2563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2551);
    out.m_87.w = _2565;
    out.m_89.x = _2567;
    out.m_89.y = _2569;
    out.m_89.z = _2571;
    if (!_2539)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2573 = -_1310;
    float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2577 = -_1312;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2581 = -_1314;
    float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2585 = _2575 * _2575;
    float _2587 = fma(_2579, _2579, _2585);
    float _2589 = fma(_2583, _2583, _2587);
    float _2591 = sqrt(_2589);
    float _2593 = rsqrt(_2589);
    float _2595 = -_2591;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2599 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = _2579 * _2593;
    float _2605 = _2575 * _2593;
    float _2607 = abs(_2601);
    float _2609 = log2(_2607);
    float _2611 = _2583 * _2593;
    float _2613 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2615 = _2279 * _2605;
    float _2617 = -_2605;
    float _2619 = -_2613;
    float _2621 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2619);
    float _2623 = fma(_2289, _2603, _2615);
    float _2625 = -_2611;
    float _2627 = fma(_2625, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2621);
    float _2629 = fma(_2291, _2611, _2623);
    float _2631 = precise::clamp(_2629, 0.0, 1.0);
    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2635 = _2627 + _2633;
    float _2637 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2639 = _2635 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2641 = precise::clamp(_2639, 0.0, 1.0);
    float _2643 = exp2(_2637);
    float _2645 = _2643 * _2641;
    float _2647 = _2631 * _2645;
    float _2649 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2651 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2653 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2649;
    out.m_85.y = _2651;
    out.m_85.z = _2653;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2425 = false;
    bool _188 = false;
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
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2710 = as_type<float>(_124);
        out.gl_Position.z = _2710;
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
    float _154 = _146;
    float _156 = _134;
    if (_152)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _116;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    int _160 = 0;
    if (_152)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2782 = as_type<float>(_164);
        out.gl_Position.z = _2782;
    }
    if (_152)
    {
        return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _146;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _194 = _190 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _200 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _212;
    float _216 = 1.0 / _202;
    bool _218 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _220 = isnan(_190);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = 1.0 / _210;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _234 = _190 + _232;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _238 = 1.0 / _198;
    float _240 = _194 * _216;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = _190 + _242;
    bool _246 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_190);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = 1.0 / _214;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = _190 + _260;
    float _264 = _234 * _230;
    bool _266 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _268 = isnan(_190);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_256;
    float _280 = _278 + 1.0;
    float _282 = 1.0 / _206;
    float _284 = _262 * _238;
    bool _286 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _288 = isnan(_190);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = _190 + _298;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _228 * _280;
    float _308 = -_228;
    float _310 = _308 + 1.0;
    float _312 = _244 * _258;
    bool _314 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_190);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_296;
    float _328 = _326 + 1.0;
    float _330 = _324 * _304;
    bool _332 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _334 = isnan(_190);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = _300 * _282;
    float _346 = _276 * _328;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = -_324;
    float _362 = _360 + 1.0;
    float _364 = fma(_350, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = _342 * _310;
    float _368 = fma(_354, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = fma(_358, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = _256 * _362;
    float _378 = _364 * _366;
    float _380 = -_342;
    float _382 = _380 + 1.0;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = fma(_374, _240, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _394 = _368 * _366;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _396;
    float _400 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _378);
    float _402 = fma(_386, _240, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _404 = fma(_390, _240, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _406 = _370 * _366;
    float _408 = fma(_398, _344, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _410 = fma(_392, _306, _400);
    float _412 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    float _424 = fma(_408, _376, _410);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _430 = fma(_404, _306, _412);
    float _432 = fma(_416, _344, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _438 = fma(_402, _306, _418);
    float _440 = fma(_422, _344, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _446 = fma(_428, _264, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _448 = fma(_436, _264, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _450 = fma(_432, _376, _438);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _456;
    float _460 = fma(_444, _264, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _462 = fma(_440, _376, _430);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _464;
    float _468 = fma(_446, _330, _424);
    float _470 = fma(_454, _312, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _472 = fma(_458, _312, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _474 = fma(_448, _330, _450);
    float _476 = fma(_466, _312, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _478 = fma(_460, _330, _462);
    float _480 = fma(_470, _346, _468);
    float _482 = fma(_472, _346, _474);
    float _484 = fma(_476, _346, _478);
    float _486 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].x, _480);
    float _488 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].y, _482);
    float _490 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].z, _484);
    bool _492 = !_236;
    if (!_492)
    {
        float _494 = in.m_53.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _154 = _508;
    }
    float _510 = _154;
    float _512 = in.m_53.z;
    float _514 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _516 = log2(_514);
    float _518 = in.m_53.x;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _522 = _520 != 0;
    float _524 = in.m_53.y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _528 = in.m_44.x;
    float _530 = in.m_44.y;
    float _532 = in.m_44.z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _546 = _544 != 0;
    float _548 = _512 * 2.0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _554 = _518 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _556 = _518 * 2.0;
    float _558 = floor(_548);
    float _560 = -_526;
    float _562 = fma(_554, 2.0, _560);
    float _564 = _524 + _512;
    float _566 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _568 = _524 * 2.0;
    float _570 = _530 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _572 = _530 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _574 = floor(_556);
    float _576 = _564 + (-1.0);
    float _578 = fma(_566, -2.0, _534);
    float _580 = _518 + _512;
    float _582 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[6].x, _572);
    float _584 = -_134;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[76].x, _562);
    float _588 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _578);
    float _590 = _580 + (-1.0);
    bool _592 = _558 > 0.0;
    float _594 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[6].z, _582);
    bool _596 = _558 >= 0.0;
    bool _598 = isnan(_558);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _530 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _608 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[5].x, _570);
    float _610 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _612 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[4].x, _606);
    float _614 = _528;
    float _616 = _608;
    int _618 = as_type<int>(_588);
    if (_522)
    {
        _614 = _518;
    }
    float _620 = _614;
    float _622 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _624 = _620;
    if (!_522)
    {
        _624 = _512;
    }
    float _626 = _624;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _630 = _604 ? 0 : 1;
    float _632 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    bool _634 = _574 > 0.0;
    float _636 = _626 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _638 = ~_630;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = floor(_568);
    int _646 = _642;
    float _648 = _636;
    if (!_592)
    {
        int _650 = ~_630;
        int _652 = _650 + 1;
        _646 = _652;
    }
    int _654 = _646;
    float _656 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    float _658 = -_628;
    float _660 = fma(_636, 2.0, _658);
    if (!_522)
    {
        _648 = _512;
    }
    float _662 = _648;
    bool _664 = _574 >= 0.0;
    bool _666 = isnan(_574);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _676 = _662;
    if (!_522)
    {
        _616 = _524;
    }
    float _678 = _616;
    float _680 = -_134;
    float _682 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[86].x, _660);
    float _684 = _678;
    if (_522)
    {
        _676 = _524;
    }
    float _686 = _676;
    float _688 = _594 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_522)
    {
        _684 = _518;
    }
    float _690 = _684;
    int _692 = _672 ? 0 : 1;
    float _694 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[83].w, _550);
    bool _696 = !_538;
    float _698 = _696 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[83].z, _674);
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _704 = ~_692;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _694);
    int _712 = _708;
    float _714 = _690;
    float _716 = _698;
    if (!_634)
    {
        int _718 = ~_692;
        int _720 = _718 + 1;
        _712 = _720;
    }
    int _722 = _712;
    float _724 = -_552;
    float _726 = fma(_702, 2.0, _724);
    bool _728 = !_542;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _700);
    int _734 = abs(as_type<int>(_698));
    float _736 = -_134;
    float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[81].x, _726);
    if (!_522)
    {
        _714 = _512;
    }
    float _740 = _714;
    float _742 = _740;
    if (_522)
    {
        _716 = _524;
    }
    float _744 = _716;
    float _746 = _744;
    if (_522)
    {
        _742 = _524;
    }
    float _748 = _742;
    if (!_522)
    {
        _746 = _518;
    }
    float _750 = _746;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _754 = _644 > 0.0;
    float _756 = _748 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _758 = _644 >= 0.0;
    bool _760 = isnan(_644);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    float _768 = _750 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _770 = fma(_756, -2.0, _752);
    int _772 = abs(_730);
    float _774 = float(_722);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _778 = float(_772);
    float _780 = _516 * _134;
    float _782 = float(_734);
    float _784 = fma(_768, -2.0, _776);
    float _786 = float(_654);
    float _788 = _778 * _774;
    float _790 = in.m_55.x;
    float _792 = in.m_55.y;
    float _794 = in.m_55.z;
    int _796 = _766 ? 0 : 1;
    float _798 = exp2(_780);
    float _800 = _782 * _786;
    float _802 = _788 * (-2.0);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _806 = ~_796;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _814 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[78].z, _804);
    int _816 = _810;
    if (!_754)
    {
        int _818 = ~_796;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _826 = 1.0 + _824;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _830 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].w, _812);
    float _832 = 1.0 / _826;
    float _834 = _656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _836 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _838 = isnan(1.0);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _844 = _840 || _842;
    float _846 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[88].w, _828);
    float _848 = fma(_610, _802, _610);
    float _850 = _632 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _854 = _834 + _852;
    float _856 = -_798;
    float _858 = _856 + 1.0;
    bool _860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _868 = _864 || _866;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _872 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _814);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _850 + _874;
    float _878 = _854 * _854;
    float _880 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[88].z, _870);
    float _882 = _868 ? _858 : 0.0;
    float _884 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _830);
    float _886 = fma(_802, _792, _792);
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _890 = _688 + _888;
    float _892 = fma(_876, _876, _878);
    float _894 = _524 + (-0.5);
    bool _896 = !_546;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _880);
    float _902 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _846);
    float _904 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _770);
    float _906 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _784);
    float _908 = _850;
    if (_844)
    {
        float _910 = _882 * _832;
        _156 = _910;
    }
    float _912 = _156;
    float _914 = fma(_890, _890, _892);
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].y, _886);
    int _918 = abs(_898);
    float _920 = _518 + _524;
    float _922 = float(_822);
    float _924 = fma(_848, _912, _916);
    float _926 = rsqrt(_914);
    float _928 = _920 + (-1.0);
    float _930 = float(_918);
    float _932 = _800 * (-2.0);
    float _934 = _924 * 0.15915493667125701904296875;
    float _936 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _938 = _518 + (-0.5);
    float _940 = _930 * _922;
    float _942 = fma(_932, _790, _790);
    float _944 = fma(_936, _932, _936);
    float _946 = _934 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = _940 * (-2.0);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].x, _942);
    float _954 = _512 + (-0.5);
    float _956 = fma(_622, _950, _622);
    float _958 = fma(_950, _794, _794);
    float _960 = fma(_944, _912, _952);
    float _962 = _854 * _926;
    float _964 = _876 * _926;
    float _966 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].z, _958);
    float _968 = _960 * 0.15915493667125701904296875;
    float _970 = -_962;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _974 = -_964;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _978 = fma(_956, _912, _966);
    float _980 = _890 * _926;
    float _982 = _972 * _972;
    float _984 = in.m_57.x;
    float _986 = in.m_57.y;
    float _988 = in.m_57.z;
    float _990 = _978 * 0.15915493667125701904296875;
    float _992 = -_980;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _996 = fma(_976, _976, _982);
    float _998 = in.m_59.x;
    float _1000 = in.m_59.y;
    float _1002 = in.m_59.z;
    float _1004 = _934 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = fma(_994, _994, _996);
    float _1010 = sqrt(_1008);
    float _1012 = _968 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = _490 * _988;
    float _1018 = _488 * _986;
    float _1020 = _486 * _984;
    float _1022 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1024 = _990 * 6.283185482025146484375;
    float _1026 = cos(_1024);
    float _1028 = _926 * _1010;
    float _1030 = _1028 * _1022;
    float _1032 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1002);
    float _1036 = _968 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _1014 * _1006;
    float _1042 = _1014 * _948;
    float _1044 = _1034 * _1030;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1000);
    float _1048 = _1028 * _1032;
    bool _1050 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1052 = isnan(0.5);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1058 = _1054 || _1056;
    float _1060 = _990 * 6.283185482025146484375;
    float _1062 = sin(_1060);
    float _1064 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1066 = _1014 * _1026;
    float _1068 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _998);
    float _1070 = _1006 * _1026;
    float _1072 = _1028 * _1064;
    float _1074 = _1066 * _1044;
    float _1076 = _1046 * _1048;
    float _1078 = _1038 * _948;
    float _1080 = _1038 * _1006;
    float _1082 = _1068 * _1072;
    float _1084 = _1038 * _1026;
    float _1086 = _948 * _1026;
    float _1088 = fma(_1062, _1040, _1078);
    float _1090 = -_1080;
    float _1092 = fma(_1062, _1042, _1090);
    float _1094 = -_1044;
    float _1096 = _1062 * _1094;
    float _1098 = -_1042;
    float _1100 = fma(_1062, _1080, _1098);
    float _1102 = fma(_1088, _1082, _1074);
    float _1104 = _1084 * _1044;
    float _1106 = fma(_1070, _1082, _1096);
    float _1108 = fma(_1062, _1078, _1040);
    float _1110 = -_1076;
    float _1112 = fma(_1092, _1110, _1102);
    float _1114 = fma(_1100, _1082, _1104);
    float _1116 = -_1076;
    float _1118 = fma(_1086, _1116, _1106);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = -_1076;
    float _1124 = fma(_1108, _1122, _1114);
    float _1126 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    float _1134 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1130);
    float _1136 = _688 + _1132;
    float _1138 = _850 + _1134;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1136 + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1146 = _1138 + _1144;
    float _1148 = _1142 * _1142;
    float _1150 = fma(_1146, _1146, _1148);
    float _1152 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1154 = sqrt(_1150);
    float _1156 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1152);
    float _1158 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1156);
    float _1160 = _834 + _1158;
    bool _1162 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1112;
    float _1166 = _1138;
    float _1168 = _1136;
    float _1170 = _964;
    if (!_1162)
    {
        _1164 = _1138;
    }
    float _1172 = _1164;
    float _1174 = _1172;
    if (!_1162)
    {
        _1166 = _1160;
    }
    float _1176 = _1166;
    bool _1178 = !_1162;
    float _1180 = _1176;
    if (!_1178)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1186 = _1154 + _1184;
        float _1188 = rsqrt(_1150);
        float _1190 = _1186 * _1182;
        float _1192 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1194 = _1190 * 0.15915493667125701904296875;
        float _1196 = _1194 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        float _1204 = fma(_1198, _1192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1206 = _1188 * _1204;
        float _1208 = _1202 + (-1.0);
        float _1210 = fma(_1146, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1212 = fma(_1142, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1214 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = fma(_1160, _1202, _1214);
        _1174 = _1210;
        _1180 = _1216;
        _1168 = _1212;
    }
    float _1218 = _1174;
    float _1220 = _1180;
    float _1222 = _1168;
    float _1224 = -_964;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1228 = -_962;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1232 = -_980;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1236 = _1230;
    float _1238 = _1226;
    float _1240 = _1234;
    if (!_1058)
    {
        float _1242 = -_962;
        float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
        float _1246 = -_964;
        float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
        float _1250 = -_980;
        float _1252 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1258 = _1244 + _1256;
        float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1262 = _1248 + _1260;
        float _1264 = -_688;
        float _1266 = _1264 + _1222;
        float _1268 = -_850;
        float _1270 = _1268 + _1218;
        float _1272 = _1258 * _1258;
        float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1276 = _1252 + _1274;
        float _1278 = -_834;
        float _1280 = _1278 + _1220;
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1284 = fma(_1262, _1262, _1272);
        float _1286 = fma(_1276, _1276, _1284);
        float _1288 = 1.0 / _1028;
        float _1290 = sqrt(_1286);
        float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1294 = precise::min(_1290, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1296 = _1294 * _1254;
        float _1298 = _1296 * _1288;
        float _1300 = _1292 * _1298;
        float _1302 = _1266 * _1298;
        float _1304 = fma(_1270, _1300, _1248);
        float _1306 = fma(_1280, _1300, _1244);
        float _1308 = fma(_1292, _1302, _1252);
        _1236 = _1306;
        _1238 = _1304;
        _1240 = _1308;
        _908 = _1270;
        _1170 = _1300;
    }
    float _1310 = _1236;
    float _1312 = _1238;
    float _1314 = _1240;
    float _1316 = _908;
    float _1318 = _1170;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1310 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1326 = _1312 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1330 = _1314 + _1328;
    float _1332 = _1322 * _1322;
    float _1334 = fma(_1326, _1326, _1332);
    float _1336 = fma(_1330, _1330, _1334);
    float _1338 = rsqrt(_1336);
    float _1340 = sqrt(_1336);
    float _1342 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1344 = _1326 * _1342;
    float _1346 = _1330 * _1342;
    float _1348 = _1344 * _1344;
    float _1350 = _1346 * _1346;
    float _1352 = _1348 + _1350;
    float _1354 = sqrt(_1352);
    bool _1356 = _1354 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = _1354 + _1358;
    float _1362 = _1338;
    float _1364 = _1360;
    float _1366 = _1316;
    float _1368 = _1322;
    float _1370 = _1342;
    if (_1356)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1362 = _1372;
    }
    float _1374 = _1362;
    float _1376 = _1374;
    if (_1356)
    {
        float _1378 = _1360 * _1374;
        _1364 = _1378;
    }
    float _1380 = _1364;
    if (_1356)
    {
        float _1382 = rsqrt(_1352);
        _1376 = _1382;
    }
    float _1384 = _1376;
    float _1386 = _1384;
    if (_1356)
    {
        float _1388 = _1380 * 0.15915493667125701904296875;
        _1366 = _1388;
    }
    float _1390 = _1366;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1394 = _1330;
    float _1396 = _1390;
    if (_1356)
    {
        float _1398 = _1390 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        _1394 = _1400;
    }
    float _1402 = _1394;
    float _1404 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1406 = precise::max(0.0, _1392);
    float _1408 = _1318;
    float _1410 = _1406;
    if (_1356)
    {
        float _1412 = _1390 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = -_1342;
    float _1420 = -_1406;
    float _1422 = fma(_1322, _1418, _1420);
    if (_1356)
    {
        float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1368 = _1424;
    }
    float _1426 = _1368;
    float _1428 = _1402;
    float _1430 = _1426;
    if (_1356)
    {
        float _1432 = fma(_1402, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1428 = _1432;
    }
    float _1434 = _1428;
    float _1436 = _1434;
    if (!_1356)
    {
        _1430 = _1422;
    }
    float _1438 = _1430;
    float _1440 = _1438;
    if (_1356)
    {
        float _1442 = _1384 * _1434;
        _1370 = _1442;
    }
    float _1444 = _1370;
    if (!_1356)
    {
        _1386 = _1344;
    }
    float _1446 = _1386;
    float _1448 = _1446;
    float _1450 = _1416;
    if (_1356)
    {
        float _1452 = _1416 + (-1.0);
        _1410 = _1452;
    }
    float _1454 = _1410;
    float _1456 = _1454;
    if (_1356)
    {
        float _1458 = _1344 * _1444;
        _1448 = _1458;
    }
    float _1460 = _1448;
    if (!_1356)
    {
        _1436 = _1348;
    }
    float _1462 = _1436;
    float _1464 = _1462;
    if (_1356)
    {
        float _1466 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1396 = _1466;
    }
    float _1468 = _1396;
    if (!_1356)
    {
        _1456 = _1346;
    }
    float _1470 = _1456;
    float _1472 = _1470;
    if (_1356)
    {
        float _1474 = _1346 * _1444;
        _1472 = _1474;
    }
    float _1476 = _1472;
    if (_1356)
    {
        float _1478 = _1460 * _1460;
        _1464 = _1478;
    }
    float _1480 = _1464;
    if (_1356)
    {
        float _1482 = fma(_1422, _1416, _1468);
        _1440 = _1482;
    }
    float _1484 = _1440;
    if (!_1356)
    {
        _1450 = _1350;
    }
    float _1486 = _1450;
    float _1488 = _1486;
    if (_1356)
    {
        float _1490 = _1476 * _1476;
        _1488 = _1490;
    }
    float _1492 = _1488;
    float _1494 = fma(_1484, _1484, _1480);
    float _1496 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = _1494 + _1492;
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1502 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1500);
    float _1504 = precise::clamp(_1502, 0.0, 1.0);
    float _1506 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    float _1508 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1510 = rsqrt(_1498);
    float _1512 = -_1504;
    float _1514 = _1512 + 1.0;
    float _1516 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1518 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1520 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1508);
    float _1522 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1524 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1526 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1518);
    float _1528 = abs(_1514);
    float _1530 = log2(_1528);
    float _1532 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1520);
    float _1534 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1522);
    float _1536 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1526);
    float _1538 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1542 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1534);
    float _1544 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1546 = _1510 * _1460;
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1550 = _1510 * _1484;
    float _1552 = _1510 * _1476;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1548);
    float _1558 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1560 = -_1538;
    float _1562 = fma(_1560, _1404, 1.0);
    float _1564 = -_1554;
    float _1566 = fma(_1550, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1564);
    float _1568 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1570 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1556);
    float _1572 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1574 = -_1552;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1566);
    float _1578 = exp2(_1568);
    float _1580 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1570);
    float _1582 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1584 = fma(_1576, -0.5, 0.5);
    float _1586 = fma(_1576, 0.5, 0.5);
    float _1588 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1572);
    float _1590 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1582);
    float _1592 = _1550 + 1.0;
    float _1594 = log2(_1562);
    float _1596 = fma(_1586, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1598 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1590);
    float _1600 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1588);
    float _1602 = fma(_1586, _1596, -0.212114393711090087890625);
    float _1604 = 1.0 / _1580;
    float _1606 = -_1550;
    float _1608 = fma(_1578, _1592, _1606);
    float _1610 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1598);
    float _1612 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1600);
    float _1614 = fma(_1586, _1602, 1.570728778839111328125);
    float _1616 = fma(_1608, 0.5, 0.5);
    float _1618 = sqrt(_1584);
    float _1620 = _1594 * 0.693147182464599609375;
    float _1622 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1624 = _1610 * _1604;
    float _1626 = _1612 * _1604;
    float _1628 = fma(_1624, 0.5, 0.5);
    float _1630 = fma(_1626, -0.5, 0.5);
    float _1632 = _1618 * 0.636619746685028076171875;
    float3 _5170 = float3(_1628, _1630, _1622);
    float _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5170, float3(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5170, float3(0.0), isnan(_5170)), level(0.0)).x;
    float _1636 = -_1614;
    float _1638 = fma(_1632, _1636, 1.0);
    float3 _5186 = float3(_1628, _1630, _1622);
    float4 _1641 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5186, float3(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5186, float3(0.0), isnan(_5186)), level(0.0)).xyzw;
    float _1643 = _1641.x;
    float _1645 = _1641.y;
    float _1647 = _1641.z;
    float _1649 = _1641.w;
    float2 _5203 = float2(_1638, _1616);
    float3 _1653 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5203, float2(0.0), isnan(_5203)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5203, float2(0.0), isnan(_5203)), level(0.0)).xyz;
    float _1655 = _1653.x;
    float _1657 = _1653.y;
    float _1659 = _1653.z;
    float _1661 = in.m_61.y;
    float _1663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1665 = in.m_53.w;
    bool _1667 = _524 > 0.5;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1669;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1675 = _1673 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1679 = _510 + _1677;
    float _1681 = 1.0 / _1671;
    int _1683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1685 = _1683 != 0;
    float _1687 = in.m_61.x;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1689;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1695 = _1693 != 0;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1699 = _1697 != 0;
    out.m_63.x = _1312;
    out.m_63.y = _1310;
    out.m_63.z = _1314;
    float _1701 = 1.0 / _1675;
    bool _1703 = _512 > 0.5;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1707 = _1705 != 0;
    float _1709 = -_1661;
    float _1711 = _1709 + 1.0;
    float _1713 = 1.0 / _1691;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1717 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1715;
    bool _1719 = _1665 > 0.5;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1723 = _1721 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    int _1725 = _1667 ? as_type<int>(_1711) : as_type<int>(_1661);
    int _1727 = _1719 ? as_type<int>(_1711) : as_type<int>(_1661);
    float _1729 = _1695 ? as_type<float>(_1725) : _1661;
    float _1731 = _1679 * _1681;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1735 = _1733 != 0;
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1739 = _510 + _1737;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1743 = _1741 != 0;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1745;
    float _1749 = _1699 ? as_type<float>(_1727) : _1661;
    float _1751 = _1739 * _1701;
    bool _1753 = _1699;
    float _1755 = _1661;
    float _1757 = _1731;
    float _1759 = _1580;
    float _1761 = _1612;
    float _1763 = _1610;
    if (_1685)
    {
        bool _1765 = _518 > 0.5;
        _1753 = _1765;
    }
    bool _1767 = _1753;
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1769;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1777 = _510 + _1775;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1781 = _1779 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1787 = fma(_1723, _1751, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1789 = _1777 * _1713;
    float _1791 = fma(_1781, _1751, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1793 = fma(_1785, _1751, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1797 = fma(_1717, _1731, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1799 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1801 = isnan(_510);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1811;
    float _1815 = _1687;
    if (_1743)
    {
        float _1817 = _1703 ? _1711 : _1661;
        _1755 = _1817;
    }
    float _1819 = _1755;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1821;
    float _1825 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1827 = fma(_1813, _1789, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    bool _1829 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1831 = isnan(_510);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1837 = _1833 || _1835;
    float _1839 = float(_1837);
    float _1841 = fma(_1823, _1789, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1843 = fma(_1825, _1729, -0.5);
    float _1845 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1847 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1849 = isnan(_510);
    bool _1851 = _1847 || _1849;
    bool _1853 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1855 = _1851 || _1853;
    float _1857 = float(_1855);
    float _1859 = -_1809;
    float _1861 = _1859 + 1.0;
    bool _1863 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1865 = isnan(_510);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1871 = _1867 || _1869;
    float _1873 = float(_1871);
    float _1875 = fma(_1749, _1845, -0.5);
    float _1877 = -_1839;
    float _1879 = _1877 + 1.0;
    float _1881 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1883 = fma(_1747, _1731, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1885 = fma(_1771, _1731, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1887 = _1873 * _1879;
    float _1889 = -_588;
    float _1891 = fma(_884, _1843, _1889);
    float _1893 = fma(_1881, _1819, -0.5);
    int _1895 = as_type<int>(_1881);
    float _1897 = _1843;
    if (_1685)
    {
        float _1899 = -_1687;
        float _1901 = _1899 + 1.0;
        _618 = as_type<int>(_1901);
    }
    int _1903 = _618;
    if (_1707)
    {
        float _1905 = -_1687;
        float _1907 = _1905 + 1.0;
        _1895 = as_type<int>(_1907);
    }
    int _1909 = _1895;
    float _1911 = _1857 * _1861;
    int _1913 = 0;
    float _1915 = as_type<float>(_1909);
    if (_1735)
    {
        float _1917 = -_1687;
        float _1919 = _1917 + 1.0;
        _1913 = as_type<int>(_1919);
    }
    int _1921 = _1913;
    float _1923 = -_1857;
    float _1925 = _1923 + 1.0;
    float _1927 = _1797 * _1887;
    float _1929 = _1883 * _1887;
    float _1931 = _1885 * _1887;
    float _1933 = -_1873;
    float _1935 = _1933 + 1.0;
    float _1937 = _1927;
    if (!_1685)
    {
        _1757 = _1687;
    }
    float _1939 = _1757;
    float _1941 = _1839 * _1925;
    float _1943 = 0.0;
    float _1945 = _1939;
    if (!_1707)
    {
        _1943 = _1687;
    }
    float _1947 = _1943;
    float _1949 = in.m_65.x;
    float _1951 = in.m_65.y;
    float _1953 = in.m_65.z;
    float _1955 = _1947;
    if (_1685)
    {
        float _1957 = _1767 ? as_type<float>(_1903) : _1687;
        _1945 = _1957;
    }
    float _1959 = _1945;
    float _1961 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1927);
    if (_1707)
    {
        float _1963 = _1703 ? as_type<float>(_1909) : _1687;
        _1955 = _1963;
    }
    float _1965 = _1955;
    float _1967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1735)
    {
        float _1969 = _1667 ? as_type<float>(_1921) : _1687;
        _1815 = _1969;
    }
    float _1971 = _1815;
    float _1973 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1929);
    float _1975 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1931);
    bool _1977 = _1000 != 0.0;
    bool _1979 = isnan(_1000);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.0);
    bool _1985 = _1981 || _1983;
    float _1987 = in.m_67.x;
    float _1989 = in.m_67.y;
    float _1991 = in.m_67.z;
    float _1993 = in.m_67.w;
    float _1995 = fma(_1787, _1941, _1961);
    float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1999 = _998 == 0.0;
    bool _2001 = !_1985;
    bool _2003 = _1999 && _2001;
    float _2005 = fma(_1791, _1941, _1973);
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _2007;
    float _2011 = fma(_1793, _1941, _1975);
    bool _2013 = _1002 == 0.0;
    bool _2015 = _2013 && _2003;
    float _2017 = fma(_1827, _1911, _1995);
    float _2019 = fma(_2009, _1789, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _2021 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2025 = fma(_1841, _1911, _2005);
    float _2027 = fma(_2019, _1911, _2011);
    float _2029 = fma(_2021, _1959, -0.5);
    float _2031 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[110].x, _2017);
    float _2033 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[110].y, _2025);
    float _2035 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[110].z, _2027);
    float _2037 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2039 = fma(_872, _2029, _586);
    if (_2015)
    {
        _1937 = _1949;
    }
    float _2041 = _1937;
    float _2043 = _2041;
    if (!_2015)
    {
        float _2045 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1949);
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = fma(_2037, _1965, -0.5);
    if (_2015)
    {
        _1915 = _1951;
    }
    float _2051 = _1915;
    float _2053 = _1987 * _1951;
    float _2055 = _2051;
    if (!_2015)
    {
        float _2057 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1951);
        _2055 = _2057;
    }
    float _2059 = _2055;
    float _2061 = _1991 * _1949;
    float _2063 = _1989 * _1953;
    float _2065 = fma(_732, _2049, _738);
    if (_2015)
    {
        _1897 = _1953;
    }
    float _2067 = _1897;
    float _2069 = -_2053;
    float _2071 = fma(_1989, _1949, _2069);
    float _2073 = _2067;
    if (!_2015)
    {
        float _2075 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1953);
        _2073 = _2075;
    }
    float _2077 = _2073;
    float _2079 = -_2061;
    float _2081 = fma(_1987, _1953, _2079);
    float _2083 = -_2063;
    float _2085 = fma(_1991, _1951, _2083);
    float _2087 = -_904;
    float _2089 = fma(_710, _1875, _2087);
    float _2091 = _2071 * _1993;
    float _2093 = -_906;
    float _2095 = fma(_902, _1893, _2093);
    float _2097 = _2085 * _1993;
    float _2099 = _1891 + 0.5;
    float _2101 = _2039 + 0.5;
    float _2103 = _2065 + 0.5;
    float _2105 = _2089 + 0.5;
    float _2107 = -_2077;
    float _2109 = _1062 * _2107;
    float _2111 = -_1991;
    float _2113 = _1062 * _2111;
    float _2115 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2117 = -_2091;
    float _2119 = _1062 * _2117;
    out.m_69.x = _2101;
    out.m_69.y = _2099;
    out.m_69.z = _2103;
    out.m_69.w = _2105;
    float _2121 = _2031 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2123 = fma(_2115, _1971, -0.5);
    float _2125 = fma(_1070, _2097, _2119);
    float _2127 = _1066 * _1991;
    float _2129 = _2033 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2131 = fma(_900, _2123, _682);
    float _2133 = _2081 * _1993;
    float _2135 = fma(_1070, _2047, _2109);
    float _2137 = fma(_1070, _1987, _2113);
    float _2139 = _2035 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2141 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2143 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = -_2059;
    float _2147 = fma(_1086, _2145, _2135);
    float _2149 = _1084 * _1991;
    float _2151 = _1066 * _2077;
    float _2153 = _1066 * _2091;
    float _2155 = _1084 * _2077;
    float _2157 = fma(_1100, _1987, _2149);
    float _2159 = fma(_1088, _2047, _2151);
    float _2161 = fma(_1088, _1987, _2127);
    float _2163 = fma(_1088, _2097, _2153);
    float _2165 = fma(_1100, _2047, _2155);
    float _2167 = -_2059;
    float _2169 = fma(_1092, _2167, _2159);
    float _2171 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2173 = -_2133;
    float _2175 = fma(_1092, _2173, _2163);
    float _2177 = -_2059;
    float _2179 = fma(_1108, _2177, _2165);
    float _2181 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2183 = -_2133;
    float _2185 = fma(_1086, _2183, _2125);
    float _2187 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_71.x = _2141;
    out.m_71.y = _2143;
    out.m_71.z = _2171;
    float _2189 = _1084 * _2091;
    float _2191 = -_1989;
    float _2193 = fma(_1108, _2191, _2157);
    float _2195 = -_1989;
    float _2197 = fma(_1092, _2195, _2161);
    float _2199 = -_1989;
    float _2201 = fma(_1086, _2199, _2137);
    float _2203 = fma(_1100, _2097, _2189);
    float _2205 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2207 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2209 = _2131 + 0.5;
    float _2211 = -_2133;
    float _2213 = fma(_1108, _2211, _2203);
    float _2215 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2217 = fma(_2201, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2207);
    float _2219 = fma(_2147, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2181);
    float _2221 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2187);
    float _2223 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2225 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2227 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2229 = fma(_2147, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2215);
    float _2231 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2233 = fma(_2147, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2225);
    float _2235 = exp2(_2223);
    float _2237 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2239 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2227);
    float _2241 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2243 = fma(_2201, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2231);
    float _2245 = fma(_2201, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2237);
    float _2247 = fma(_2193, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2217);
    float _2249 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2241);
    float _2251 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2205);
    float _2253 = _1580 * 0.5;
    float _2255 = fma(_2193, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2245);
    float _2257 = fma(_2193, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2243);
    float _2259 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2221);
    float _2261 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2249);
    float _2263 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2251);
    float _2265 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2239);
    float _2267 = -_2235;
    float _2269 = _2267 + 1.0;
    float _2271 = fma(_1612, -0.5, _2253);
    float _2273 = _1610 + _1580;
    float _2275 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2277 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _2259;
    out.m_73.y = _2261;
    out.m_73.z = _2263;
    float _2279 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2233);
    float _2281 = _2275 + _1580;
    float _2283 = _2095 + 0.5;
    float _2285 = _2273 * 0.5;
    float _2287 = _2281 * 0.5;
    float _2289 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2219);
    float _2291 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2229);
    out.m_75.x = _2209;
    out.m_75.y = _2283;
    bool _2293 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2295 = isnan(_1340);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2301 = _2297 || _2299;
    out.m_77.x = _2285;
    out.m_77.y = _2271;
    out.m_77.z = _2287;
    out.m_77.w = _1580;
    out.m_79.x = _2289;
    out.m_79.y = _2279;
    out.m_79.z = _2291;
    out.m_81.x = _2247;
    out.m_81.y = _2255;
    out.m_81.z = _2257;
    out.gl_Position.x = _1610;
    out.gl_Position.y = _1612;
    out.gl_Position.z = _2275;
    out.gl_Position.w = _1580;
    float _2303 = _2255;
    float _2305 = _2247;
    float _2307 = _2275;
    if (!_2301)
    {
        _2303 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2309 = _2303;
    float _2311 = _2309;
    float _2313 = _2309;
    if (!_2301)
    {
        _2305 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2315 = _2305;
    float _2317 = _2315;
    float _2319 = _2315;
    if (!_2301)
    {
        _1759 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2321 = _1759;
    float _2323 = _2321;
    float _2325 = _2321;
    if (!_2301)
    {
        _2307 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2327 = _2307;
    float _2329 = _2327;
    float _2331 = _2327;
    if (!_2301)
    {
        _1761 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2333 = _1761;
    float _2335 = _2333;
    float _2337 = _2333;
    if (!_2301)
    {
        _1763 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2339 = _1763;
    float _2341 = _2277 * _1634;
    float _2343 = -_2277;
    float _2345 = _2343 + 1.0;
    float _2347 = _1649 * _2341;
    float _2349 = _1649 * _2345;
    float _2351 = _1659 * _2341;
    float _2353 = fma(_1655, _2347, _1643);
    float _2355 = fma(_1657, _2347, _1645);
    float _2357 = fma(_1649, _2351, _1647);
    out.m_83.x = _2353;
    out.m_83.y = _2355;
    out.m_83.z = _2357;
    out.m_83.w = _2349;
    bool _2359 = !_2301;
    float _2361 = _2339;
    float _2363 = _2339;
    if (!_2359)
    {
        bool _2365 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2367 = isnan(_1340);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2373 = _2369 || _2371;
        if (!_2373)
        {
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2377 = _1340 + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2379;
            float _2383 = 1.0 / _2381;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2405 = _2377 * _2383;
            float _2407 = precise::clamp(_2405, 0.0, 1.0);
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2413 = fma(_2407, _2387, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2319 = _2415;
            _2337 = _2421;
            _2313 = _2413;
            _2331 = _2419;
            _2325 = _2417;
            _2363 = _2423;
            _2425 = true;
        }
        else
        {
            bool _2427 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2429 = isnan(_1340);
            bool _2431 = _2427 || _2429;
            bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2435 = _2431 || _2433;
            if (!_2435)
            {
                _2311 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2437 = _2311;
            _2313 = _2437;
            if (!_2435)
            {
                _2317 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2439 = _2317;
            _2319 = _2439;
            if (!_2435)
            {
                _2323 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2441 = _2323;
            _2325 = _2441;
            if (!_2435)
            {
                _2329 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2443 = _2329;
            _2331 = _2443;
            if (!_2435)
            {
                _2335 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2445 = _2335;
            _2337 = _2445;
            if (!_2435)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2447 = _2361;
            bool _2449 = !_2435;
            _2363 = _2447;
            if (!_2449)
            {
                bool _2451 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2453 = isnan(_1340);
                bool _2455 = _2451 || _2453;
                bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2459 = _2455 || _2457;
                if (!_2459)
                {
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2463 = _1340 + _2461;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2465;
                    float _2469 = 1.0 / _2467;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2491 = _2463 * _2469;
                    float _2493 = precise::clamp(_2491, 0.0, 1.0);
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2499 = fma(_2493, _2473, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2501 = fma(_2493, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2503 = fma(_2493, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2505 = fma(_2493, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2507 = fma(_2493, _2485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2509 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2319 = _2501;
                    _2337 = _2507;
                    _2313 = _2499;
                    _2331 = _2505;
                    _2325 = _2503;
                    _2363 = _2509;
                    _2425 = true;
                }
                else
                {
                    _2319 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2337 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2313 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2331 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2325 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2425 = false;
    float _2511 = _2319;
    float _2513 = _2337;
    float _2515 = _2313;
    float _2517 = _2331;
    float _2519 = _2325;
    float _2521 = _2363;
    float _2523 = fma(_2279, -0.5, 0.5);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = -_2511;
    float _2529 = _2527 + _2513;
    float _2531 = -_2515;
    float _2533 = _2531 + _2517;
    float _2535 = -_2519;
    float _2537 = _2535 + _2521;
    bool _2539 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2541 = fma(_2525, _2529, _2511);
    float _2543 = fma(_2525, _2533, _2515);
    float _2545 = fma(_2525, _2537, _2519);
    float _2547 = _2541 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2549 = fma(_2543, 0.298911988735198974609375, _2547);
    float _2551 = fma(_2545, 0.114477999508380889892578125, _2549);
    out.m_85.x = 0.0;
    float _2553 = -_2551;
    float _2555 = _2543 + _2553;
    float _2557 = -_2551;
    float _2559 = _2541 + _2557;
    float _2561 = -_2551;
    float _2563 = _2545 + _2561;
    float _2565 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2567 = fma(_2555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2551);
    float _2569 = fma(_2559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2551);
    float _2571 = fma(_2563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2551);
    out.m_87.w = _2565;
    out.m_89.x = _2567;
    out.m_89.y = _2569;
    out.m_89.z = _2571;
    if (!_2539)
    {
        return out;
    }
    float _2573 = -_1310;
    float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2577 = -_1312;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2581 = -_1314;
    float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2585 = _2575 * _2575;
    float _2587 = fma(_2579, _2579, _2585);
    float _2589 = fma(_2583, _2583, _2587);
    float _2591 = sqrt(_2589);
    float _2593 = rsqrt(_2589);
    float _2595 = -_2591;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2599 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = _2579 * _2593;
    float _2605 = _2575 * _2593;
    float _2607 = abs(_2601);
    float _2609 = log2(_2607);
    float _2611 = _2583 * _2593;
    float _2613 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2615 = _2279 * _2605;
    float _2617 = -_2605;
    float _2619 = -_2613;
    float _2621 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2619);
    float _2623 = fma(_2289, _2603, _2615);
    float _2625 = -_2611;
    float _2627 = fma(_2625, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2621);
    float _2629 = fma(_2291, _2611, _2623);
    float _2631 = precise::clamp(_2629, 0.0, 1.0);
    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2635 = _2627 + _2633;
    float _2637 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2639 = _2635 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2641 = precise::clamp(_2639, 0.0, 1.0);
    float _2643 = exp2(_2637);
    float _2645 = _2643 * _2641;
    float _2647 = _2631 * _2645;
    float _2649 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2651 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2653 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2649;
    out.m_85.y = _2651;
    out.m_85.z = _2653;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2425 = false;
    bool _188 = false;
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
    float _116 = as_type<float>(_108);
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _114;
    if (!_112)
    {
        out.m_47.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _118 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2710 = as_type<float>(_124);
        out.gl_Position.z = _2710;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _154 = _146;
    float _156 = _134;
    if (_152)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _116;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    int _160 = 0;
    if (_152)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2782 = as_type<float>(_164);
        out.gl_Position.z = _2782;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _146;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _194 = _190 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _198 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _200 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _212;
    float _216 = 1.0 / _202;
    bool _218 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _220 = isnan(_190);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = 1.0 / _210;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _234 = _190 + _232;
    bool _236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _238 = 1.0 / _198;
    float _240 = _194 * _216;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = _190 + _242;
    bool _246 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _248 = isnan(_190);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = 1.0 / _214;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = _190 + _260;
    float _264 = _234 * _230;
    bool _266 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _268 = isnan(_190);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = -_256;
    float _280 = _278 + 1.0;
    float _282 = 1.0 / _206;
    float _284 = _262 * _238;
    bool _286 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _288 = isnan(_190);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = _190 + _298;
    float _302 = -_276;
    float _304 = _302 + 1.0;
    float _306 = _228 * _280;
    float _308 = -_228;
    float _310 = _308 + 1.0;
    float _312 = _244 * _258;
    bool _314 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_190);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_296;
    float _328 = _326 + 1.0;
    float _330 = _324 * _304;
    bool _332 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _334 = isnan(_190);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    float _344 = _300 * _282;
    float _346 = _276 * _328;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _348;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _356;
    float _360 = -_324;
    float _362 = _360 + 1.0;
    float _364 = fma(_350, _284, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _366 = _342 * _310;
    float _368 = fma(_354, _284, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _370 = fma(_358, _284, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = _256 * _362;
    float _378 = _364 * _366;
    float _380 = -_342;
    float _382 = _380 + 1.0;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = fma(_374, _240, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _394 = _368 * _366;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _396;
    float _400 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _378);
    float _402 = fma(_386, _240, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _404 = fma(_390, _240, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _406 = _370 * _366;
    float _408 = fma(_398, _344, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _410 = fma(_392, _306, _400);
    float _412 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _394);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _420;
    float _424 = fma(_408, _376, _410);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _430 = fma(_404, _306, _412);
    float _432 = fma(_416, _344, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _438 = fma(_402, _306, _418);
    float _440 = fma(_422, _344, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _446 = fma(_428, _264, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _448 = fma(_436, _264, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _450 = fma(_432, _376, _438);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _456;
    float _460 = fma(_444, _264, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _462 = fma(_440, _376, _430);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _464;
    float _468 = fma(_446, _330, _424);
    float _470 = fma(_454, _312, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _472 = fma(_458, _312, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _474 = fma(_448, _330, _450);
    float _476 = fma(_466, _312, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _478 = fma(_460, _330, _462);
    float _480 = fma(_470, _346, _468);
    float _482 = fma(_472, _346, _474);
    float _484 = fma(_476, _346, _478);
    float _486 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].x, _480);
    float _488 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].y, _482);
    float _490 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].z, _484);
    bool _492 = !_236;
    if (!_492)
    {
        float _494 = in.m_53.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _154 = _508;
    }
    float _510 = _154;
    float _512 = in.m_53.z;
    float _514 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _516 = log2(_514);
    float _518 = in.m_53.x;
    int _520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _522 = _520 != 0;
    float _524 = in.m_53.y;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _528 = in.m_44.x;
    float _530 = in.m_44.y;
    float _532 = in.m_44.z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _546 = _544 != 0;
    float _548 = _512 * 2.0;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _554 = _518 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _556 = _518 * 2.0;
    float _558 = floor(_548);
    float _560 = -_526;
    float _562 = fma(_554, 2.0, _560);
    float _564 = _524 + _512;
    float _566 = _524 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _568 = _524 * 2.0;
    float _570 = _530 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _572 = _530 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _574 = floor(_556);
    float _576 = _564 + (-1.0);
    float _578 = fma(_566, -2.0, _534);
    float _580 = _518 + _512;
    float _582 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[6].x, _572);
    float _584 = -_134;
    float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[76].x, _562);
    float _588 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _578);
    float _590 = _580 + (-1.0);
    bool _592 = _558 > 0.0;
    float _594 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[6].z, _582);
    bool _596 = _558 >= 0.0;
    bool _598 = isnan(_558);
    bool _600 = _596 || _598;
    bool _602 = isnan(0.0);
    bool _604 = _600 || _602;
    float _606 = _530 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _608 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[5].x, _570);
    float _610 = fma(_576, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _612 = fma(_528, (*spvDescriptorSet0.vp_c10)._m0[4].x, _606);
    float _614 = _528;
    float _616 = _608;
    int _618 = as_type<int>(_588);
    if (_522)
    {
        _614 = _518;
    }
    float _620 = _614;
    float _622 = fma(_590, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _624 = _620;
    if (!_522)
    {
        _624 = _512;
    }
    float _626 = _624;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _630 = _604 ? 0 : 1;
    float _632 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[4].z, _612);
    bool _634 = _574 > 0.0;
    float _636 = _626 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _638 = ~_630;
    int _640 = _638 + 1;
    int _642 = _640 + 1;
    float _644 = floor(_568);
    int _646 = _642;
    float _648 = _636;
    if (!_592)
    {
        int _650 = ~_630;
        int _652 = _650 + 1;
        _646 = _652;
    }
    int _654 = _646;
    float _656 = fma(_532, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    float _658 = -_628;
    float _660 = fma(_636, 2.0, _658);
    if (!_522)
    {
        _648 = _512;
    }
    float _662 = _648;
    bool _664 = _574 >= 0.0;
    bool _666 = isnan(_574);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _676 = _662;
    if (!_522)
    {
        _616 = _524;
    }
    float _678 = _616;
    float _680 = -_134;
    float _682 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[86].x, _660);
    float _684 = _678;
    if (_522)
    {
        _676 = _524;
    }
    float _686 = _676;
    float _688 = _594 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_522)
    {
        _684 = _518;
    }
    float _690 = _684;
    int _692 = _672 ? 0 : 1;
    float _694 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[83].w, _550);
    bool _696 = !_538;
    float _698 = _696 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _700 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[83].z, _674);
    float _702 = _690 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _704 = ~_692;
    int _706 = _704 + 1;
    int _708 = _706 + 1;
    float _710 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _694);
    int _712 = _708;
    float _714 = _690;
    float _716 = _698;
    if (!_634)
    {
        int _718 = ~_692;
        int _720 = _718 + 1;
        _712 = _720;
    }
    int _722 = _712;
    float _724 = -_552;
    float _726 = fma(_702, 2.0, _724);
    bool _728 = !_542;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _700);
    int _734 = abs(as_type<int>(_698));
    float _736 = -_134;
    float _738 = fma(_736, (*spvDescriptorSet0.vp_c9)._m0[81].x, _726);
    if (!_522)
    {
        _714 = _512;
    }
    float _740 = _714;
    float _742 = _740;
    if (_522)
    {
        _716 = _524;
    }
    float _744 = _716;
    float _746 = _744;
    if (_522)
    {
        _742 = _524;
    }
    float _748 = _742;
    if (!_522)
    {
        _746 = _518;
    }
    float _750 = _746;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _754 = _644 > 0.0;
    float _756 = _748 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _758 = _644 >= 0.0;
    bool _760 = isnan(_644);
    bool _762 = _758 || _760;
    bool _764 = isnan(0.0);
    bool _766 = _762 || _764;
    float _768 = _750 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _770 = fma(_756, -2.0, _752);
    int _772 = abs(_730);
    float _774 = float(_722);
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _778 = float(_772);
    float _780 = _516 * _134;
    float _782 = float(_734);
    float _784 = fma(_768, -2.0, _776);
    float _786 = float(_654);
    float _788 = _778 * _774;
    float _790 = in.m_55.x;
    float _792 = in.m_55.y;
    float _794 = in.m_55.z;
    int _796 = _766 ? 0 : 1;
    float _798 = exp2(_780);
    float _800 = _782 * _786;
    float _802 = _788 * (-2.0);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _806 = ~_796;
    int _808 = _806 + 1;
    int _810 = _808 + 1;
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _814 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[78].z, _804);
    int _816 = _810;
    if (!_754)
    {
        int _818 = ~_796;
        int _820 = _818 + 1;
        _816 = _820;
    }
    int _822 = _816;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _826 = 1.0 + _824;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _830 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[78].w, _812);
    float _832 = 1.0 / _826;
    float _834 = _656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _836 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _838 = isnan(1.0);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _844 = _840 || _842;
    float _846 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[88].w, _828);
    float _848 = fma(_610, _802, _610);
    float _850 = _632 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _854 = _834 + _852;
    float _856 = -_798;
    float _858 = _856 + 1.0;
    bool _860 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _868 = _864 || _866;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _872 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _814);
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _850 + _874;
    float _878 = _854 * _854;
    float _880 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[88].z, _870);
    float _882 = _868 ? _858 : 0.0;
    float _884 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _830);
    float _886 = fma(_802, _792, _792);
    float _888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _890 = _688 + _888;
    float _892 = fma(_876, _876, _878);
    float _894 = _524 + (-0.5);
    bool _896 = !_546;
    int _898 = _896 ? 0 : 1;
    float _900 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _880);
    float _902 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _846);
    float _904 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _770);
    float _906 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _784);
    float _908 = _850;
    if (_844)
    {
        float _910 = _882 * _832;
        _156 = _910;
    }
    float _912 = _156;
    float _914 = fma(_890, _890, _892);
    float _916 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[196].y, _886);
    int _918 = abs(_898);
    float _920 = _518 + _524;
    float _922 = float(_822);
    float _924 = fma(_848, _912, _916);
    float _926 = rsqrt(_914);
    float _928 = _920 + (-1.0);
    float _930 = float(_918);
    float _932 = _800 * (-2.0);
    float _934 = _924 * 0.15915493667125701904296875;
    float _936 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _938 = _518 + (-0.5);
    float _940 = _930 * _922;
    float _942 = fma(_932, _790, _790);
    float _944 = fma(_936, _932, _936);
    float _946 = _934 * 6.283185482025146484375;
    float _948 = sin(_946);
    float _950 = _940 * (-2.0);
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].x, _942);
    float _954 = _512 + (-0.5);
    float _956 = fma(_622, _950, _622);
    float _958 = fma(_950, _794, _794);
    float _960 = fma(_944, _912, _952);
    float _962 = _854 * _926;
    float _964 = _876 * _926;
    float _966 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[196].z, _958);
    float _968 = _960 * 0.15915493667125701904296875;
    float _970 = -_962;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _854);
    float _974 = -_964;
    float _976 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _876);
    float _978 = fma(_956, _912, _966);
    float _980 = _890 * _926;
    float _982 = _972 * _972;
    float _984 = in.m_57.x;
    float _986 = in.m_57.y;
    float _988 = in.m_57.z;
    float _990 = _978 * 0.15915493667125701904296875;
    float _992 = -_980;
    float _994 = fma(_992, (*spvDescriptorSet0.vp_c9)._m0[18].w, _890);
    float _996 = fma(_976, _976, _982);
    float _998 = in.m_59.x;
    float _1000 = in.m_59.y;
    float _1002 = in.m_59.z;
    float _1004 = _934 * 6.283185482025146484375;
    float _1006 = cos(_1004);
    float _1008 = fma(_994, _994, _996);
    float _1010 = sqrt(_1008);
    float _1012 = _968 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = _490 * _988;
    float _1018 = _488 * _986;
    float _1020 = _486 * _984;
    float _1022 = _1016 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1024 = _990 * 6.283185482025146484375;
    float _1026 = cos(_1024);
    float _1028 = _926 * _1010;
    float _1030 = _1028 * _1022;
    float _1032 = _1018 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1002);
    float _1036 = _968 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _1014 * _1006;
    float _1042 = _1014 * _948;
    float _1044 = _1034 * _1030;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1000);
    float _1048 = _1028 * _1032;
    bool _1050 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1052 = isnan(0.5);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1058 = _1054 || _1056;
    float _1060 = _990 * 6.283185482025146484375;
    float _1062 = sin(_1060);
    float _1064 = _1020 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1066 = _1014 * _1026;
    float _1068 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _998);
    float _1070 = _1006 * _1026;
    float _1072 = _1028 * _1064;
    float _1074 = _1066 * _1044;
    float _1076 = _1046 * _1048;
    float _1078 = _1038 * _948;
    float _1080 = _1038 * _1006;
    float _1082 = _1068 * _1072;
    float _1084 = _1038 * _1026;
    float _1086 = _948 * _1026;
    float _1088 = fma(_1062, _1040, _1078);
    float _1090 = -_1080;
    float _1092 = fma(_1062, _1042, _1090);
    float _1094 = -_1044;
    float _1096 = _1062 * _1094;
    float _1098 = -_1042;
    float _1100 = fma(_1062, _1080, _1098);
    float _1102 = fma(_1088, _1082, _1074);
    float _1104 = _1084 * _1044;
    float _1106 = fma(_1070, _1082, _1096);
    float _1108 = fma(_1062, _1078, _1040);
    float _1110 = -_1076;
    float _1112 = fma(_1092, _1110, _1102);
    float _1114 = fma(_1100, _1082, _1104);
    float _1116 = -_1076;
    float _1118 = fma(_1086, _1116, _1106);
    float _1120 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1122 = -_1076;
    float _1124 = fma(_1108, _1122, _1114);
    float _1126 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1128 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1120);
    float _1130 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1126);
    float _1132 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1128);
    float _1134 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1130);
    float _1136 = _688 + _1132;
    float _1138 = _850 + _1134;
    float _1140 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1142 = _1136 + _1140;
    float _1144 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1146 = _1138 + _1144;
    float _1148 = _1142 * _1142;
    float _1150 = fma(_1146, _1146, _1148);
    float _1152 = _1112 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1154 = sqrt(_1150);
    float _1156 = fma(_1118, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1152);
    float _1158 = fma(_1124, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1156);
    float _1160 = _834 + _1158;
    bool _1162 = _1154 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1112;
    float _1166 = _1138;
    float _1168 = _1136;
    float _1170 = _964;
    if (!_1162)
    {
        _1164 = _1138;
    }
    float _1172 = _1164;
    float _1174 = _1172;
    if (!_1162)
    {
        _1166 = _1160;
    }
    float _1176 = _1166;
    bool _1178 = !_1162;
    float _1180 = _1176;
    if (!_1178)
    {
        float _1182 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1186 = _1154 + _1184;
        float _1188 = rsqrt(_1150);
        float _1190 = _1186 * _1182;
        float _1192 = _1160 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1194 = _1190 * 0.15915493667125701904296875;
        float _1196 = _1194 * 6.283185482025146484375;
        float _1198 = sin(_1196);
        float _1200 = _1194 * 6.283185482025146484375;
        float _1202 = cos(_1200);
        float _1204 = fma(_1198, _1192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1206 = _1188 * _1204;
        float _1208 = _1202 + (-1.0);
        float _1210 = fma(_1146, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1212 = fma(_1142, _1206, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1214 = _1208 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = fma(_1160, _1202, _1214);
        _1174 = _1210;
        _1180 = _1216;
        _1168 = _1212;
    }
    float _1218 = _1174;
    float _1220 = _1180;
    float _1222 = _1168;
    float _1224 = -_964;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1228 = -_962;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1232 = -_980;
    float _1234 = fma(_1232, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1222);
    float _1236 = _1230;
    float _1238 = _1226;
    float _1240 = _1234;
    if (!_1058)
    {
        float _1242 = -_962;
        float _1244 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
        float _1246 = -_964;
        float _1248 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
        float _1250 = -_980;
        float _1252 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[18].w, _688);
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1258 = _1244 + _1256;
        float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1262 = _1248 + _1260;
        float _1264 = -_688;
        float _1266 = _1264 + _1222;
        float _1268 = -_850;
        float _1270 = _1268 + _1218;
        float _1272 = _1258 * _1258;
        float _1274 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1276 = _1252 + _1274;
        float _1278 = -_834;
        float _1280 = _1278 + _1220;
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1284 = fma(_1262, _1262, _1272);
        float _1286 = fma(_1276, _1276, _1284);
        float _1288 = 1.0 / _1028;
        float _1290 = sqrt(_1286);
        float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1294 = precise::min(_1290, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1296 = _1294 * _1254;
        float _1298 = _1296 * _1288;
        float _1300 = _1292 * _1298;
        float _1302 = _1266 * _1298;
        float _1304 = fma(_1270, _1300, _1248);
        float _1306 = fma(_1280, _1300, _1244);
        float _1308 = fma(_1292, _1302, _1252);
        _1236 = _1306;
        _1238 = _1304;
        _1240 = _1308;
        _908 = _1270;
        _1170 = _1300;
    }
    float _1310 = _1236;
    float _1312 = _1238;
    float _1314 = _1240;
    float _1316 = _908;
    float _1318 = _1170;
    float _1320 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1322 = _1310 + _1320;
    float _1324 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1326 = _1312 + _1324;
    float _1328 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1330 = _1314 + _1328;
    float _1332 = _1322 * _1322;
    float _1334 = fma(_1326, _1326, _1332);
    float _1336 = fma(_1330, _1330, _1334);
    float _1338 = rsqrt(_1336);
    float _1340 = sqrt(_1336);
    float _1342 = _1338 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1344 = _1326 * _1342;
    float _1346 = _1330 * _1342;
    float _1348 = _1344 * _1344;
    float _1350 = _1346 * _1346;
    float _1352 = _1348 + _1350;
    float _1354 = sqrt(_1352);
    bool _1356 = _1354 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1358 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = _1354 + _1358;
    float _1362 = _1338;
    float _1364 = _1360;
    float _1366 = _1316;
    float _1368 = _1322;
    float _1370 = _1342;
    if (_1356)
    {
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1362 = _1372;
    }
    float _1374 = _1362;
    float _1376 = _1374;
    if (_1356)
    {
        float _1378 = _1360 * _1374;
        _1364 = _1378;
    }
    float _1380 = _1364;
    if (_1356)
    {
        float _1382 = rsqrt(_1352);
        _1376 = _1382;
    }
    float _1384 = _1376;
    float _1386 = _1384;
    if (_1356)
    {
        float _1388 = _1380 * 0.15915493667125701904296875;
        _1366 = _1388;
    }
    float _1390 = _1366;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1394 = _1330;
    float _1396 = _1390;
    if (_1356)
    {
        float _1398 = _1390 * 6.283185482025146484375;
        float _1400 = sin(_1398);
        _1394 = _1400;
    }
    float _1402 = _1394;
    float _1404 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1406 = precise::max(0.0, _1392);
    float _1408 = _1318;
    float _1410 = _1406;
    if (_1356)
    {
        float _1412 = _1390 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = -_1342;
    float _1420 = -_1406;
    float _1422 = fma(_1322, _1418, _1420);
    if (_1356)
    {
        float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1368 = _1424;
    }
    float _1426 = _1368;
    float _1428 = _1402;
    float _1430 = _1426;
    if (_1356)
    {
        float _1432 = fma(_1402, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1428 = _1432;
    }
    float _1434 = _1428;
    float _1436 = _1434;
    if (!_1356)
    {
        _1430 = _1422;
    }
    float _1438 = _1430;
    float _1440 = _1438;
    if (_1356)
    {
        float _1442 = _1384 * _1434;
        _1370 = _1442;
    }
    float _1444 = _1370;
    if (!_1356)
    {
        _1386 = _1344;
    }
    float _1446 = _1386;
    float _1448 = _1446;
    float _1450 = _1416;
    if (_1356)
    {
        float _1452 = _1416 + (-1.0);
        _1410 = _1452;
    }
    float _1454 = _1410;
    float _1456 = _1454;
    if (_1356)
    {
        float _1458 = _1344 * _1444;
        _1448 = _1458;
    }
    float _1460 = _1448;
    if (!_1356)
    {
        _1436 = _1348;
    }
    float _1462 = _1436;
    float _1464 = _1462;
    if (_1356)
    {
        float _1466 = _1454 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1396 = _1466;
    }
    float _1468 = _1396;
    if (!_1356)
    {
        _1456 = _1346;
    }
    float _1470 = _1456;
    float _1472 = _1470;
    if (_1356)
    {
        float _1474 = _1346 * _1444;
        _1472 = _1474;
    }
    float _1476 = _1472;
    if (_1356)
    {
        float _1478 = _1460 * _1460;
        _1464 = _1478;
    }
    float _1480 = _1464;
    if (_1356)
    {
        float _1482 = fma(_1422, _1416, _1468);
        _1440 = _1482;
    }
    float _1484 = _1440;
    if (!_1356)
    {
        _1450 = _1350;
    }
    float _1486 = _1450;
    float _1488 = _1486;
    if (_1356)
    {
        float _1490 = _1476 * _1476;
        _1488 = _1490;
    }
    float _1492 = _1488;
    float _1494 = fma(_1484, _1484, _1480);
    float _1496 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1498 = _1494 + _1492;
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1502 = fma(_1340, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1500);
    float _1504 = precise::clamp(_1502, 0.0, 1.0);
    float _1506 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1496);
    float _1508 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1510 = rsqrt(_1498);
    float _1512 = -_1504;
    float _1514 = _1512 + 1.0;
    float _1516 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1506);
    float _1518 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1520 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1508);
    float _1522 = _1310 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1524 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1526 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1518);
    float _1528 = abs(_1514);
    float _1530 = log2(_1528);
    float _1532 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1520);
    float _1534 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1522);
    float _1536 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1526);
    float _1538 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1542 = fma(_1314, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1534);
    float _1544 = _1536 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1546 = _1510 * _1460;
    float _1548 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1550 = _1510 * _1484;
    float _1552 = _1510 * _1476;
    float _1554 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1556 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1548);
    float _1558 = _1542 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1560 = -_1538;
    float _1562 = fma(_1560, _1404, 1.0);
    float _1564 = -_1554;
    float _1566 = fma(_1550, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1564);
    float _1568 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1570 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1556);
    float _1572 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1574 = -_1552;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1566);
    float _1578 = exp2(_1568);
    float _1580 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1570);
    float _1582 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1584 = fma(_1576, -0.5, 0.5);
    float _1586 = fma(_1576, 0.5, 0.5);
    float _1588 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1572);
    float _1590 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1582);
    float _1592 = _1550 + 1.0;
    float _1594 = log2(_1562);
    float _1596 = fma(_1586, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1598 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1590);
    float _1600 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1588);
    float _1602 = fma(_1586, _1596, -0.212114393711090087890625);
    float _1604 = 1.0 / _1580;
    float _1606 = -_1550;
    float _1608 = fma(_1578, _1592, _1606);
    float _1610 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1598);
    float _1612 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1600);
    float _1614 = fma(_1586, _1602, 1.570728778839111328125);
    float _1616 = fma(_1608, 0.5, 0.5);
    float _1618 = sqrt(_1584);
    float _1620 = _1594 * 0.693147182464599609375;
    float _1622 = _1620 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1624 = _1610 * _1604;
    float _1626 = _1612 * _1604;
    float _1628 = fma(_1624, 0.5, 0.5);
    float _1630 = fma(_1626, -0.5, 0.5);
    float _1632 = _1618 * 0.636619746685028076171875;
    float3 _5170 = float3(_1628, _1630, _1622);
    float _1634 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5170, float3(0.0), isnan(_5170)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5170, float3(0.0), isnan(_5170)), level(0.0)).x;
    float _1636 = -_1614;
    float _1638 = fma(_1632, _1636, 1.0);
    float3 _5186 = float3(_1628, _1630, _1622);
    float4 _1641 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5186, float3(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5186, float3(0.0), isnan(_5186)), level(0.0)).xyzw;
    float _1643 = _1641.x;
    float _1645 = _1641.y;
    float _1647 = _1641.z;
    float _1649 = _1641.w;
    float2 _5203 = float2(_1638, _1616);
    float3 _1653 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5203, float2(0.0), isnan(_5203)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5203, float2(0.0), isnan(_5203)), level(0.0)).xyz;
    float _1655 = _1653.x;
    float _1657 = _1653.y;
    float _1659 = _1653.z;
    float _1661 = in.m_61.y;
    float _1663 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1665 = in.m_53.w;
    bool _1667 = _524 > 0.5;
    float _1669 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1671 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1669;
    float _1673 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1675 = _1673 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1677 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1679 = _510 + _1677;
    float _1681 = 1.0 / _1671;
    int _1683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1685 = _1683 != 0;
    float _1687 = in.m_61.x;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1691 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _1689;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1695 = _1693 != 0;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1699 = _1697 != 0;
    out.m_63.x = _1312;
    out.m_63.y = _1310;
    out.m_63.z = _1314;
    float _1701 = 1.0 / _1675;
    bool _1703 = _512 > 0.5;
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1707 = _1705 != 0;
    float _1709 = -_1661;
    float _1711 = _1709 + 1.0;
    float _1713 = 1.0 / _1691;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1717 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1715;
    bool _1719 = _1665 > 0.5;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1723 = _1721 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    int _1725 = _1667 ? as_type<int>(_1711) : as_type<int>(_1661);
    int _1727 = _1719 ? as_type<int>(_1711) : as_type<int>(_1661);
    float _1729 = _1695 ? as_type<float>(_1725) : _1661;
    float _1731 = _1679 * _1681;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1735 = _1733 != 0;
    float _1737 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1739 = _510 + _1737;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1743 = _1741 != 0;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1747 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1745;
    float _1749 = _1699 ? as_type<float>(_1727) : _1661;
    float _1751 = _1739 * _1701;
    bool _1753 = _1699;
    float _1755 = _1661;
    float _1757 = _1731;
    float _1759 = _1580;
    float _1761 = _1612;
    float _1763 = _1610;
    if (_1685)
    {
        bool _1765 = _518 > 0.5;
        _1753 = _1765;
    }
    bool _1767 = _1753;
    float _1769 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1771 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1769;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _1777 = _510 + _1775;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1781 = _1779 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1787 = fma(_1723, _1751, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1789 = _1777 * _1713;
    float _1791 = fma(_1781, _1751, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1793 = fma(_1785, _1751, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1797 = fma(_1717, _1731, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1799 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _1801 = isnan(_510);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _1807 = _1803 || _1805;
    float _1809 = float(_1807);
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _1811;
    float _1815 = _1687;
    if (_1743)
    {
        float _1817 = _1703 ? _1711 : _1661;
        _1755 = _1817;
    }
    float _1819 = _1755;
    float _1821 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _1821;
    float _1825 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1827 = fma(_1813, _1789, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    bool _1829 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1831 = isnan(_510);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1837 = _1833 || _1835;
    float _1839 = float(_1837);
    float _1841 = fma(_1823, _1789, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _1843 = fma(_1825, _1729, -0.5);
    float _1845 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1847 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1849 = isnan(_510);
    bool _1851 = _1847 || _1849;
    bool _1853 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1855 = _1851 || _1853;
    float _1857 = float(_1855);
    float _1859 = -_1809;
    float _1861 = _1859 + 1.0;
    bool _1863 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1865 = isnan(_510);
    bool _1867 = _1863 || _1865;
    bool _1869 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1871 = _1867 || _1869;
    float _1873 = float(_1871);
    float _1875 = fma(_1749, _1845, -0.5);
    float _1877 = -_1839;
    float _1879 = _1877 + 1.0;
    float _1881 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1883 = fma(_1747, _1731, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1885 = fma(_1771, _1731, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1887 = _1873 * _1879;
    float _1889 = -_588;
    float _1891 = fma(_884, _1843, _1889);
    float _1893 = fma(_1881, _1819, -0.5);
    int _1895 = as_type<int>(_1881);
    float _1897 = _1843;
    if (_1685)
    {
        float _1899 = -_1687;
        float _1901 = _1899 + 1.0;
        _618 = as_type<int>(_1901);
    }
    int _1903 = _618;
    if (_1707)
    {
        float _1905 = -_1687;
        float _1907 = _1905 + 1.0;
        _1895 = as_type<int>(_1907);
    }
    int _1909 = _1895;
    float _1911 = _1857 * _1861;
    int _1913 = 0;
    float _1915 = as_type<float>(_1909);
    if (_1735)
    {
        float _1917 = -_1687;
        float _1919 = _1917 + 1.0;
        _1913 = as_type<int>(_1919);
    }
    int _1921 = _1913;
    float _1923 = -_1857;
    float _1925 = _1923 + 1.0;
    float _1927 = _1797 * _1887;
    float _1929 = _1883 * _1887;
    float _1931 = _1885 * _1887;
    float _1933 = -_1873;
    float _1935 = _1933 + 1.0;
    float _1937 = _1927;
    if (!_1685)
    {
        _1757 = _1687;
    }
    float _1939 = _1757;
    float _1941 = _1839 * _1925;
    float _1943 = 0.0;
    float _1945 = _1939;
    if (!_1707)
    {
        _1943 = _1687;
    }
    float _1947 = _1943;
    float _1949 = in.m_65.x;
    float _1951 = in.m_65.y;
    float _1953 = in.m_65.z;
    float _1955 = _1947;
    if (_1685)
    {
        float _1957 = _1767 ? as_type<float>(_1903) : _1687;
        _1945 = _1957;
    }
    float _1959 = _1945;
    float _1961 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1927);
    if (_1707)
    {
        float _1963 = _1703 ? as_type<float>(_1909) : _1687;
        _1955 = _1963;
    }
    float _1965 = _1955;
    float _1967 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1735)
    {
        float _1969 = _1667 ? as_type<float>(_1921) : _1687;
        _1815 = _1969;
    }
    float _1971 = _1815;
    float _1973 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1929);
    float _1975 = fma(_1935, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1931);
    bool _1977 = _1000 != 0.0;
    bool _1979 = isnan(_1000);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan(0.0);
    bool _1985 = _1981 || _1983;
    float _1987 = in.m_67.x;
    float _1989 = in.m_67.y;
    float _1991 = in.m_67.z;
    float _1993 = in.m_67.w;
    float _1995 = fma(_1787, _1941, _1961);
    float _1997 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1999 = _998 == 0.0;
    bool _2001 = !_1985;
    bool _2003 = _1999 && _2001;
    float _2005 = fma(_1791, _1941, _1973);
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _2007;
    float _2011 = fma(_1793, _1941, _1975);
    bool _2013 = _1002 == 0.0;
    bool _2015 = _2013 && _2003;
    float _2017 = fma(_1827, _1911, _1995);
    float _2019 = fma(_2009, _1789, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _2021 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2023 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2025 = fma(_1841, _1911, _2005);
    float _2027 = fma(_2019, _1911, _2011);
    float _2029 = fma(_2021, _1959, -0.5);
    float _2031 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[110].x, _2017);
    float _2033 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[110].y, _2025);
    float _2035 = fma(_1809, (*spvDescriptorSet0.vp_c9)._m0[110].z, _2027);
    float _2037 = _1997 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2039 = fma(_872, _2029, _586);
    if (_2015)
    {
        _1937 = _1949;
    }
    float _2041 = _1937;
    float _2043 = _2041;
    if (!_2015)
    {
        float _2045 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1949);
        _2043 = _2045;
    }
    float _2047 = _2043;
    float _2049 = fma(_2037, _1965, -0.5);
    if (_2015)
    {
        _1915 = _1951;
    }
    float _2051 = _1915;
    float _2053 = _1987 * _1951;
    float _2055 = _2051;
    if (!_2015)
    {
        float _2057 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1951);
        _2055 = _2057;
    }
    float _2059 = _2055;
    float _2061 = _1991 * _1949;
    float _2063 = _1989 * _1953;
    float _2065 = fma(_732, _2049, _738);
    if (_2015)
    {
        _1897 = _1953;
    }
    float _2067 = _1897;
    float _2069 = -_2053;
    float _2071 = fma(_1989, _1949, _2069);
    float _2073 = _2067;
    if (!_2015)
    {
        float _2075 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1953);
        _2073 = _2075;
    }
    float _2077 = _2073;
    float _2079 = -_2061;
    float _2081 = fma(_1987, _1953, _2079);
    float _2083 = -_2063;
    float _2085 = fma(_1991, _1951, _2083);
    float _2087 = -_904;
    float _2089 = fma(_710, _1875, _2087);
    float _2091 = _2071 * _1993;
    float _2093 = -_906;
    float _2095 = fma(_902, _1893, _2093);
    float _2097 = _2085 * _1993;
    float _2099 = _1891 + 0.5;
    float _2101 = _2039 + 0.5;
    float _2103 = _2065 + 0.5;
    float _2105 = _2089 + 0.5;
    float _2107 = -_2077;
    float _2109 = _1062 * _2107;
    float _2111 = -_1991;
    float _2113 = _1062 * _2111;
    float _2115 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2117 = -_2091;
    float _2119 = _1062 * _2117;
    out.m_69.x = _2101;
    out.m_69.y = _2099;
    out.m_69.z = _2103;
    out.m_69.w = _2105;
    float _2121 = _2031 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2123 = fma(_2115, _1971, -0.5);
    float _2125 = fma(_1070, _2097, _2119);
    float _2127 = _1066 * _1991;
    float _2129 = _2033 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2131 = fma(_900, _2123, _682);
    float _2133 = _2081 * _1993;
    float _2135 = fma(_1070, _2047, _2109);
    float _2137 = fma(_1070, _1987, _2113);
    float _2139 = _2035 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2141 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2143 = _2129 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2145 = -_2059;
    float _2147 = fma(_1086, _2145, _2135);
    float _2149 = _1084 * _1991;
    float _2151 = _1066 * _2077;
    float _2153 = _1066 * _2091;
    float _2155 = _1084 * _2077;
    float _2157 = fma(_1100, _1987, _2149);
    float _2159 = fma(_1088, _2047, _2151);
    float _2161 = fma(_1088, _1987, _2127);
    float _2163 = fma(_1088, _2097, _2153);
    float _2165 = fma(_1100, _2047, _2155);
    float _2167 = -_2059;
    float _2169 = fma(_1092, _2167, _2159);
    float _2171 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2173 = -_2133;
    float _2175 = fma(_1092, _2173, _2163);
    float _2177 = -_2059;
    float _2179 = fma(_1108, _2177, _2165);
    float _2181 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2183 = -_2133;
    float _2185 = fma(_1086, _2183, _2125);
    float _2187 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_71.x = _2141;
    out.m_71.y = _2143;
    out.m_71.z = _2171;
    float _2189 = _1084 * _2091;
    float _2191 = -_1989;
    float _2193 = fma(_1108, _2191, _2157);
    float _2195 = -_1989;
    float _2197 = fma(_1092, _2195, _2161);
    float _2199 = -_1989;
    float _2201 = fma(_1086, _2199, _2137);
    float _2203 = fma(_1100, _2097, _2189);
    float _2205 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2207 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2209 = _2131 + 0.5;
    float _2211 = -_2133;
    float _2213 = fma(_1108, _2211, _2203);
    float _2215 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2217 = fma(_2201, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2207);
    float _2219 = fma(_2147, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2181);
    float _2221 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2187);
    float _2223 = _1530 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2225 = _2169 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2227 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2229 = fma(_2147, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2215);
    float _2231 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2233 = fma(_2147, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2225);
    float _2235 = exp2(_2223);
    float _2237 = _2197 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2239 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2227);
    float _2241 = _2175 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2243 = fma(_2201, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2231);
    float _2245 = fma(_2201, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2237);
    float _2247 = fma(_2193, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2217);
    float _2249 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2241);
    float _2251 = fma(_2185, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2205);
    float _2253 = _1580 * 0.5;
    float _2255 = fma(_2193, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2245);
    float _2257 = fma(_2193, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2243);
    float _2259 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2221);
    float _2261 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2249);
    float _2263 = fma(_2213, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2251);
    float _2265 = fma(_1524, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2239);
    float _2267 = -_2235;
    float _2269 = _2267 + 1.0;
    float _2271 = fma(_1612, -0.5, _2253);
    float _2273 = _1610 + _1580;
    float _2275 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2277 = _2269 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _2259;
    out.m_73.y = _2261;
    out.m_73.z = _2263;
    float _2279 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2233);
    float _2281 = _2275 + _1580;
    float _2283 = _2095 + 0.5;
    float _2285 = _2273 * 0.5;
    float _2287 = _2281 * 0.5;
    float _2289 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2219);
    float _2291 = fma(_2179, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2229);
    out.m_75.x = _2209;
    out.m_75.y = _2283;
    bool _2293 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2295 = isnan(_1340);
    bool _2297 = _2293 || _2295;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2301 = _2297 || _2299;
    out.m_77.x = _2285;
    out.m_77.y = _2271;
    out.m_77.z = _2287;
    out.m_77.w = _1580;
    out.m_79.x = _2289;
    out.m_79.y = _2279;
    out.m_79.z = _2291;
    out.m_81.x = _2247;
    out.m_81.y = _2255;
    out.m_81.z = _2257;
    out.gl_Position.x = _1610;
    out.gl_Position.y = _1612;
    out.gl_Position.z = _2275;
    out.gl_Position.w = _1580;
    float _2303 = _2255;
    float _2305 = _2247;
    float _2307 = _2275;
    if (!_2301)
    {
        _2303 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2309 = _2303;
    float _2311 = _2309;
    float _2313 = _2309;
    if (!_2301)
    {
        _2305 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2315 = _2305;
    float _2317 = _2315;
    float _2319 = _2315;
    if (!_2301)
    {
        _1759 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2321 = _1759;
    float _2323 = _2321;
    float _2325 = _2321;
    if (!_2301)
    {
        _2307 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2327 = _2307;
    float _2329 = _2327;
    float _2331 = _2327;
    if (!_2301)
    {
        _1761 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2333 = _1761;
    float _2335 = _2333;
    float _2337 = _2333;
    if (!_2301)
    {
        _1763 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2339 = _1763;
    float _2341 = _2277 * _1634;
    float _2343 = -_2277;
    float _2345 = _2343 + 1.0;
    float _2347 = _1649 * _2341;
    float _2349 = _1649 * _2345;
    float _2351 = _1659 * _2341;
    float _2353 = fma(_1655, _2347, _1643);
    float _2355 = fma(_1657, _2347, _1645);
    float _2357 = fma(_1649, _2351, _1647);
    out.m_83.x = _2353;
    out.m_83.y = _2355;
    out.m_83.z = _2357;
    out.m_83.w = _2349;
    bool _2359 = !_2301;
    float _2361 = _2339;
    float _2363 = _2339;
    if (!_2359)
    {
        bool _2365 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2367 = isnan(_1340);
        bool _2369 = _2365 || _2367;
        bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2373 = _2369 || _2371;
        if (!_2373)
        {
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2377 = _1340 + _2375;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2381 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2379;
            float _2383 = 1.0 / _2381;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2397 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2399 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2405 = _2377 * _2383;
            float _2407 = precise::clamp(_2405, 0.0, 1.0);
            float _2409 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2413 = fma(_2407, _2387, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2415 = fma(_2407, _2411, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2417 = fma(_2407, _2391, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2419 = fma(_2407, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2421 = fma(_2407, _2399, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2423 = fma(_2407, _2403, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2319 = _2415;
            _2337 = _2421;
            _2313 = _2413;
            _2331 = _2419;
            _2325 = _2417;
            _2363 = _2423;
            _2425 = true;
        }
        else
        {
            bool _2427 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2429 = isnan(_1340);
            bool _2431 = _2427 || _2429;
            bool _2433 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2435 = _2431 || _2433;
            if (!_2435)
            {
                _2311 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2437 = _2311;
            _2313 = _2437;
            if (!_2435)
            {
                _2317 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2439 = _2317;
            _2319 = _2439;
            if (!_2435)
            {
                _2323 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2441 = _2323;
            _2325 = _2441;
            if (!_2435)
            {
                _2329 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2443 = _2329;
            _2331 = _2443;
            if (!_2435)
            {
                _2335 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2445 = _2335;
            _2337 = _2445;
            if (!_2435)
            {
                _2361 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2447 = _2361;
            bool _2449 = !_2435;
            _2363 = _2447;
            if (!_2449)
            {
                bool _2451 = _1340 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2453 = isnan(_1340);
                bool _2455 = _2451 || _2453;
                bool _2457 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2459 = _2455 || _2457;
                if (!_2459)
                {
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2463 = _1340 + _2461;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2467 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2465;
                    float _2469 = 1.0 / _2467;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2491 = _2463 * _2469;
                    float _2493 = precise::clamp(_2491, 0.0, 1.0);
                    float _2495 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2497 = _2495 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2499 = fma(_2493, _2473, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2501 = fma(_2493, _2497, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2503 = fma(_2493, _2477, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2505 = fma(_2493, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2507 = fma(_2493, _2485, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2509 = fma(_2493, _2489, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2319 = _2501;
                    _2337 = _2507;
                    _2313 = _2499;
                    _2331 = _2505;
                    _2325 = _2503;
                    _2363 = _2509;
                    _2425 = true;
                }
                else
                {
                    _2319 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2337 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2313 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2331 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2325 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2363 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2425 = false;
    float _2511 = _2319;
    float _2513 = _2337;
    float _2515 = _2313;
    float _2517 = _2331;
    float _2519 = _2325;
    float _2521 = _2363;
    float _2523 = fma(_2279, -0.5, 0.5);
    float _2525 = precise::clamp(_2523, 0.0, 1.0);
    float _2527 = -_2511;
    float _2529 = _2527 + _2513;
    float _2531 = -_2515;
    float _2533 = _2531 + _2517;
    float _2535 = -_2519;
    float _2537 = _2535 + _2521;
    bool _2539 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2541 = fma(_2525, _2529, _2511);
    float _2543 = fma(_2525, _2533, _2515);
    float _2545 = fma(_2525, _2537, _2519);
    float _2547 = _2541 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _2549 = fma(_2543, 0.298911988735198974609375, _2547);
    float _2551 = fma(_2545, 0.114477999508380889892578125, _2549);
    out.m_85.x = 0.0;
    float _2553 = -_2551;
    float _2555 = _2543 + _2553;
    float _2557 = -_2551;
    float _2559 = _2541 + _2557;
    float _2561 = -_2551;
    float _2563 = _2545 + _2561;
    float _2565 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2567 = fma(_2555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2551);
    float _2569 = fma(_2559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2551);
    float _2571 = fma(_2563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2551);
    out.m_87.w = _2565;
    out.m_89.x = _2567;
    out.m_89.y = _2569;
    out.m_89.z = _2571;
    if (!_2539)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2573 = -_1310;
    float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2577 = -_1312;
    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2581 = -_1314;
    float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2585 = _2575 * _2575;
    float _2587 = fma(_2579, _2579, _2585);
    float _2589 = fma(_2583, _2583, _2587);
    float _2591 = sqrt(_2589);
    float _2593 = rsqrt(_2589);
    float _2595 = -_2591;
    float _2597 = _2595 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2599 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2601 = precise::clamp(_2599, 0.0, 1.0);
    float _2603 = _2579 * _2593;
    float _2605 = _2575 * _2593;
    float _2607 = abs(_2601);
    float _2609 = log2(_2607);
    float _2611 = _2583 * _2593;
    float _2613 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2615 = _2279 * _2605;
    float _2617 = -_2605;
    float _2619 = -_2613;
    float _2621 = fma(_2617, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2619);
    float _2623 = fma(_2289, _2603, _2615);
    float _2625 = -_2611;
    float _2627 = fma(_2625, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2621);
    float _2629 = fma(_2291, _2611, _2623);
    float _2631 = precise::clamp(_2629, 0.0, 1.0);
    float _2633 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2635 = _2627 + _2633;
    float _2637 = _2609 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2639 = _2635 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2641 = precise::clamp(_2639, 0.0, 1.0);
    float _2643 = exp2(_2637);
    float _2645 = _2643 * _2641;
    float _2647 = _2631 * _2645;
    float _2649 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2651 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2653 = _2647 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2649;
    out.m_85.y = _2651;
    out.m_85.z = _2653;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

