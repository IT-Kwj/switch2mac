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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_93 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3380 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = in.m_48.w;
    float _111 = trunc(_107);
    int _114 = int(_111);
    float _116 = -_109;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _118;
    bool _122 = _114 >= 1;
    float _124 = 0.0;
    float _126 = as_type<float>(_114);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3696 = as_type<float>(_134);
        out.gl_Position.z = _3696;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_109);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_114);
    bool _150 = _118 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _126;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3751 = as_type<float>(_160);
        out.gl_Position.z = _3751;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _118 * _162;
    bool _168 = !_164;
    float _170 = _166;
    float _188;
    if (!_168)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        _188 = _166;
    }
    _190 = false;
    float _192 = _188;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _214;
    float _218 = 1.0 / _200;
    float _220 = 1.0 / _212;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _222;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _208;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _232 = _192 + _230;
    float _234 = 1.0 / _204;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = _192 + _236;
    float _240 = _196 * _220;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = _192 + _242;
    bool _246 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _248 = isnan(_192);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = 1.0 / _216;
    float _260 = _238 * _228;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _192 + _262;
    bool _266 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _268 = isnan(_192);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = fma(_224, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = _264 * _218;
    float _282 = _232 * _234;
    bool _284 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _286 = isnan(_192);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    bool _296 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_192);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -_294;
    float _310 = _308 + 1.0;
    float _312 = _244 * _258;
    bool _314 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_192);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_276;
    float _328 = _326 + 1.0;
    float _330 = -_306;
    float _332 = _330 + 1.0;
    float _334 = _294 * _328;
    float _336 = _324 * _310;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    bool _346 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_192);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_324;
    float _360 = _358 + 1.0;
    float _362 = fma(_340, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = fma(_344, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _370 = _356 * _332;
    float _372 = -_356;
    float _374 = _372 + 1.0;
    float _376 = _306 * _360;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = _256 * _374;
    float _384 = -_256;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = fma(_368, _240, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _394 = _362 * _382;
    float _396 = _364 * _382;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _398;
    float _402 = _278 * _382;
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _406 = fma(_380, _240, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _408 = fma(_390, _240, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _410 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _412 = fma(_400, _280, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_392, _370, _404);
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_406, _370, _410);
    float _428 = fma(_412, _376, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _434 = fma(_408, _370, _416);
    float _436 = fma(_420, _280, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _442 = fma(_424, _280, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _448 = fma(_432, _282, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _450 = fma(_440, _282, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _452 = fma(_436, _376, _426);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _458;
    float _462 = fma(_446, _282, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _464 = fma(_442, _376, _434);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _466;
    float _470 = fma(_448, _336, _428);
    float _472 = fma(_456, _312, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _474 = fma(_460, _312, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _476 = fma(_450, _336, _452);
    float _478 = fma(_468, _312, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _480 = fma(_462, _336, _464);
    float _482 = fma(_472, _334, _470);
    float _484 = fma(_474, _334, _476);
    float _486 = fma(_478, _334, _480);
    float _488 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[148].x, _482);
    float _490 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[148].y, _484);
    float _492 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[148].z, _486);
    bool _494 = !_226;
    if (!_494)
    {
        float _496 = in.m_55.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _170 = _510;
    }
    float _512 = _170;
    float _514 = in.m_55.x;
    float _516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _518 = log2(_516);
    float _520 = in.m_55.z;
    float _522 = in.m_46.x;
    float _524 = in.m_46.y;
    float _526 = in.m_46.z;
    float _528 = in.m_55.y;
    float _530 = in.m_57.y;
    float _532 = _118 * _518;
    float _534 = exp2(_532);
    float _536 = _514 * 2.0;
    float _538 = _520 * 2.0;
    float _540 = floor(_536);
    float _542 = _524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _544 = fma(_522, (*spvDescriptorSet0.vp_c10)._m0[6].x, _542);
    float _546 = _528 * 2.0;
    float _548 = floor(_538);
    float _550 = -_534;
    float _552 = _550 + 1.0;
    bool _554 = _540 > 0.0;
    float _556 = floor(_546);
    bool _558 = _540 >= 0.0;
    bool _560 = isnan(_540);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = _524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _570 = _566 ? 0 : 1;
    float _572 = fma(_522, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
    int _574 = ~_570;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[4].z, _572);
    int _582 = _578;
    float _584 = _528;
    if (!_554)
    {
        int _586 = ~_570;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _606 = _604 != 0;
    float _608 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _620 = _618 != 0;
    float _622 = _524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _624 = !_598;
    int _626 = _624 ? 0 : 1;
    bool _628 = !_594;
    int _630 = _628 ? 0 : 1;
    float _632 = fma(_522, (*spvDescriptorSet0.vp_c10)._m0[5].x, _622);
    bool _634 = !_612;
    int _636 = _634 ? 0 : 1;
    float _638 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _640 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[5].z, _632);
    bool _642 = _548 >= 0.0;
    bool _644 = isnan(_548);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    bool _652 = !_620;
    int _654 = _652 ? 0 : 1;
    float _656 = -_638;
    float _658 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _656);
    int _660 = _650 ? 0 : 1;
    float _662 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _664 = _548 > 0.0;
    float _666 = _528 + _520;
    float _668 = -_662;
    float _670 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _668);
    int _672 = ~_660;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    float _678 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    bool _680 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _688 = _684 || _686;
    float _690 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _692 = _666 + (-1.0);
    float _694 = -_678;
    float _696 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _694);
    float _698 = _688 ? _552 : 0.0;
    float _700 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _690);
    float _702 = _514 + _528;
    int _704 = _676;
    bool _706 = _598;
    int _708 = _602 ? (-1) : 0;
    if (!_664)
    {
        int _710 = ~_660;
        int _712 = _710 + 1;
        _704 = _712;
    }
    int _714 = _704;
    float _716 = _514 + _520;
    bool _718 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _720 = isnan(1.0);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _726 = _722 || _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _730 = 1.0 + _728;
    bool _732 = _556 >= 0.0;
    bool _734 = isnan(_556);
    bool _736 = _732 || _734;
    bool _738 = isnan(0.0);
    bool _740 = _736 || _738;
    float _742 = _716 + (-1.0);
    float _744 = _702 + (-1.0);
    int _746 = abs(_654);
    float _748 = 1.0 / _730;
    float _750 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _752 = _740 ? 0 : 1;
    float _754 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _756 = _556 > 0.0;
    float _758 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[6].z, _544);
    int _760 = abs(_636);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = _608 + _762;
    float _766 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _768 = _758 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _770 = float(_760);
    float _772 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _700);
    float _774 = _764 * 0.0625;
    float _776 = -_768;
    float _778 = _776 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _782 = _768 + _780;
    float _784 = rsqrt(_772);
    float _786 = _698 * _748;
    int _788 = ~_752;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    float _794 = _514 * 6.283185482025146484375;
    float _796 = float(_714);
    int _798 = _792;
    float _800 = _778;
    if (!_756)
    {
        int _802 = ~_752;
        int _804 = _802 + 1;
        _798 = _804;
    }
    int _806 = _798;
    float _808 = fma(_118, 0.02999999932944774627685546875, _794);
    float _810 = _770 * _796;
    float _812 = abs(_764);
    float _814 = abs(_778);
    float _816 = precise::max(_812, _814);
    float _818 = _808 * 0.15915493667125701904296875;
    float _820 = float(_746);
    float _822 = _640 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _824 = _816 >= 16.0;
    float _826 = _810 * (-2.0);
    float _828 = float(_806);
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _832 = _822 + _830;
    float _834 = _824 ? _774 : _764;
    float _836 = fma(_766, _826, _766);
    bool _838 = !_616;
    int _840 = _838 ? 0 : 1;
    float _842 = _832 * _832;
    float _844 = _820 * _828;
    float _846 = _784 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _848 = !_726;
    int _850 = _848 ? as_type<int>(_118) : as_type<int>(_786);
    float _852 = fma(_764, _764, _842);
    float _854 = _844 * (-2.0);
    float _856 = _658 * _658;
    int _858 = abs(_840);
    float _860 = fma(_782, _782, _852);
    float _862 = _514 + (-0.5);
    float _864 = fma(_670, _670, _856);
    float _866 = fma(_750, _854, _750);
    float _868 = _520 + (-0.5);
    float _870 = _862 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _872 = rsqrt(_860);
    float _874 = fma(_696, _696, _864);
    float _876 = float(_858);
    float _878 = _868 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _880 = float(_590);
    int _882 = _850;
    float _884 = _822;
    if (_824)
    {
        float _886 = _778 * 0.0625;
        _800 = _886;
    }
    float _888 = _800;
    float _890 = abs(_834);
    bool _892 = _890 != 0.0;
    bool _894 = isnan(_890);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = _846 * (-0.699999988079071044921875);
    float _904 = fma(as_type<float>(_850), _836, _870);
    float _906 = _876 * _880;
    float _908 = fma(as_type<float>(_850), _866, _878);
    float _910 = abs(_888);
    bool _912 = _910 == 0.0;
    bool _914 = !_900;
    bool _916 = _912 && _914;
    float _918 = in.m_59.x;
    float _920 = in.m_59.y;
    float _922 = in.m_59.z;
    float _924 = _904 * 0.15915493667125701904296875;
    float _926 = _902 * 0.15915493667125701904296875;
    float _928 = _908 * 0.15915493667125701904296875;
    float _930 = _832 * _872;
    float _932 = in.m_61.x;
    float _934 = in.m_61.y;
    float _936 = in.m_61.z;
    float _938 = _764 * _872;
    float _940 = abs(_888);
    bool _942 = _940 == 0.0;
    float _944 = -_930;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _948 = _906 * (-2.0);
    float _950 = -_938;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _764);
    float _954 = _528 + (-0.5);
    float _956 = _946 * _946;
    float _958 = _818 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = fma(_754, _948, _754);
    if (_916)
    {
        bool _964 = as_type<int>(_888) >= 0;
        _706 = _964;
    }
    bool _966 = _706;
    float _968 = fma(_952, _952, _956);
    float _970 = _954 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _972 = _782 * _872;
    bool _974 = !_602;
    int _976 = _974 ? 0 : 1;
    float _978 = rsqrt(_874);
    float _980 = fma(as_type<float>(_850), _962, _970);
    float _982 = -_972;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    if (_916)
    {
        int _986 = _966 ? 0 : 1078530011;
        _882 = _986;
    }
    int _988 = _882;
    bool _990 = !_606;
    int _992 = _990 ? 0 : 1;
    float _994 = fma(_984, _984, _968);
    int _996 = _988;
    if (_916)
    {
        int _998 = int(0x80000000) & as_type<int>(_834);
        int _1000 = _988 | _998;
        _996 = _1000;
    }
    int _1002 = _996;
    float _1004 = _926 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _924 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = _924 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = _928 * 6.283185482025146484375;
    float _1018 = cos(_1016);
    bool _1020 = !_900;
    bool _1022 = _1020 && _942;
    int _1024 = _1002;
    float _1026 = as_type<float>(_1002);
    if (!_1022)
    {
        float _1028 = abs(_834);
        bool _1030 = _1028 != as_type<float>(0x7f800000u /* inf */);
        bool _1032 = isnan(_1028);
        bool _1034 = _1030 || _1032;
        bool _1036 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1038 = _1034 || _1036;
        float _1040 = abs(_888);
        bool _1042 = _1040 == as_type<float>(0x7f800000u /* inf */);
        float _1044 = abs(_888);
        bool _1046 = _1044 == as_type<float>(0x7f800000u /* inf */);
        bool _1048 = !_1038;
        bool _1050 = _1046 && _1048;
        if (_1050)
        {
            bool _1052 = as_type<int>(_888) >= 0;
            _708 = _1052 ? (-1) : 0;
        }
        int _1054 = _708;
        if (_1050)
        {
            _1024 = 1075235812;
        }
        int _1056 = _1024;
        int _1058 = _1056;
        if (_1050)
        {
            int _1060 = ~_1054;
            int _1062 = (_1060 != 0) ? _1056 : 1061752795;
            _1058 = _1062;
        }
        int _1064 = _1058;
        float _1066 = as_type<float>(_1064);
        if (_1050)
        {
            int _1068 = int(0x80000000) & as_type<int>(_834);
            int _1070 = _1064 | _1068;
            _1066 = as_type<float>(_1070);
        }
        float _1072 = _1066;
        bool _1074 = !_1038;
        bool _1076 = _1074 && _1042;
        _1026 = _1072;
        if (!_1076)
        {
            float _1078 = abs(_888);
            float _1080 = abs(_834);
            float _1082 = precise::max(_1078, _1080);
            float _1084 = abs(_888);
            float _1086 = abs(_834);
            float _1088 = precise::min(_1084, _1086);
            float _1090 = 1.0 / _1082;
            float _1092 = abs(_834);
            float _1094 = abs(_888);
            bool _1096 = _1092 > _1094;
            bool _1098 = as_type<int>(_888) >= 0;
            float _1100 = _1088 * _1090;
            float _1102 = abs(_888);
            float _1104 = abs(_834);
            float _1106 = _1102 + _1104;
            int _1108 = as_type<int>(_834) & int(0x80000000);
            float _1110 = _1100 * _1100;
            bool _1112 = _1106 > as_type<float>(0x7f800000u /* inf */);
            bool _1114 = isnan(_1106);
            bool _1116 = _1112 || _1114;
            bool _1118 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1120 = _1116 || _1118;
            float _1122 = _1110 + 11.33538818359375;
            float _1124 = fma(_1110, _1122, 28.84246826171875);
            float _1126 = fma(_1110, _1124, 19.6966705322265625);
            float _1128 = fma(_1110, -0.82336294651031494140625, -5.674867153167724609375);
            float _1130 = fma(_1110, _1128, -6.565555095672607421875);
            float _1132 = 1.0 / _1126;
            float _1134 = _1110 * _1130;
            float _1136 = _1100 * _1134;
            float _1138 = fma(_1136, _1132, _1100);
            float _1140 = _1138;
            _1026 = _1106;
            if (_1096)
            {
                float _1142 = -_1138;
                float _1144 = _1142 + 1.57079637050628662109375;
                _1140 = _1144;
            }
            float _1146 = _1140;
            int _1148 = as_type<int>(_1146);
            if (!_1098)
            {
                float _1150 = -_1146;
                float _1152 = _1150 + 3.1415927410125732421875;
                _1148 = as_type<int>(_1152);
            }
            int _1154 = _1148;
            if (!_1120)
            {
                int _1156 = _1108 | _1154;
                _1026 = as_type<float>(_1156);
            }
        }
    }
    float _1158 = _1026;
    float _1160 = sqrt(_994);
    float _1162 = -_1158;
    float _1164 = _980 + _1162;
    float _1166 = _492 * _922;
    float _1168 = -_530;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1172 = _488 * _918;
    float _1174 = _1164 * 0.15915493667125701904296875;
    float _1176 = _490 * _920;
    float _1178 = _960 * _1170;
    float _1180 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1182 = _1174 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = _658 * _978;
    float _1188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _932);
    float _1190 = _670 * _978;
    float _1192 = _872 * _1160;
    float _1194 = _696 * _978;
    float _1196 = _1174 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1202 = _1192 * _1180;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1206 = fma(_1204, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _1208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _934);
    float _1210 = _1192 * _1200;
    float _1212 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1214 = _1010 * _1018;
    float _1216 = _928 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _1202 * _1188;
    float _1222 = _1186 * _1186;
    float _1224 = _1210 * _1208;
    float _1226 = _1014 * _1018;
    float _1228 = _1184 * _1018;
    float _1230 = fma(_1190, _1190, _1222);
    float _1232 = _1014 * _1184;
    float _1234 = _1010 * _1198;
    float _1236 = _1014 * _1198;
    float _1238 = fma(_1194, _1194, _1230);
    float _1240 = _1198 * _1018;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _936);
    float _1244 = _1192 * _1212;
    float _1246 = rsqrt(_1238);
    float _1248 = _1010 * _1184;
    float _1250 = -_1224;
    float _1252 = _1218 * _1250;
    float _1254 = _1244 * _1242;
    float _1256 = fma(_1218, _1232, _1234);
    float _1258 = _1226 * _1224;
    float _1260 = fma(_1228, _1220, _1252);
    float _1262 = -_1236;
    float _1264 = fma(_1218, _1248, _1262);
    float _1266 = _926 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = -_1248;
    float _1272 = fma(_1218, _1236, _1270);
    float _1274 = fma(_1256, _1220, _1258);
    float _1276 = fma(_1240, _1254, _1260);
    float _1278 = fma(_1218, _1234, _1232);
    float _1280 = _1206 * _1178;
    float _1282 = _1214 * _1224;
    float _1284 = fma(_1272, _1254, _1274);
    float _1286 = _608 + _1276;
    float _1288 = _1190 * _1246;
    float _1290 = fma(_1264, _1220, _1282);
    float _1292 = _822 + _1284;
    float _1294 = fma(_1190, _1280, _1286);
    float _1296 = _1186 * _1246;
    float _1298 = _1194 * _1246;
    float _1300 = fma(_1278, _1254, _1290);
    float _1302 = -_1268;
    float _1304 = _1302 + 1.0;
    float _1306 = _1288 * _1006;
    float _1308 = _1298 * _1006;
    float _1310 = _1296 * _1006;
    float _1312 = fma(_1186, _1280, _1292);
    float _1314 = _1288 * _1304;
    float _1316 = _1296 * _1304;
    float _1318 = _768 + _1300;
    float _1320 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1322 = _1312 + _1320;
    float _1324 = fma(_1296, _1314, _1308);
    float _1326 = fma(_1296, _1316, _1268);
    float _1328 = -_1308;
    float _1330 = fma(_1296, _1314, _1328);
    float _1332 = fma(_1288, _1314, _1268);
    float _1334 = -_1310;
    float _1336 = fma(_1298, _1314, _1334);
    float _1338 = fma(_1298, _1314, _1310);
    float _1340 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1342 = _1294 + _1340;
    float _1344 = _1326 * _1322;
    float _1346 = fma(_1194, _1280, _1318);
    float _1348 = fma(_1298, _1316, _1306);
    float _1350 = -_1306;
    float _1352 = fma(_1298, _1316, _1350);
    float _1354 = fma(_1324, _1342, _1344);
    float _1356 = _1330 * _1322;
    float _1358 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1360 = _1346 + _1358;
    float _1362 = _1298 * _1298;
    float _1364 = _1348 * _1322;
    float _1366 = fma(_1332, _1342, _1356);
    float _1368 = fma(_1352, _1360, _1354);
    float _1370 = fma(_1304, _1362, _1268);
    float _1372 = fma(_1336, _1342, _1364);
    float _1374 = fma(_1338, _1360, _1366);
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1380 = fma(_1370, _1360, _1372);
    float _1382 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1376);
    float _1384 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1378);
    float _1386 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1388 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1382);
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1384);
    float _1392 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1386);
    float _1394 = _1388 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1396 = _1390 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1398 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1392);
    float _1400 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1402 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1404 = _1398 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1400);
    float _1408 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1402);
    float _1410 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1406);
    float _1412 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1408);
    float _1414 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1416 = _1412 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1420 = _1414 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1424 = _1416 + _1422;
    bool _1426 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(0.5);
    bool _1434 = _1430 || _1432;
    float _1436 = _1420 * _1420;
    float _1438 = fma(_1424, _1424, _1436);
    float _1440 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1442 = sqrt(_1438);
    float _1444 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1440);
    float _1446 = -_938;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _1450 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1444);
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1454 = _1442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1458 = _1450;
    float _1460 = _1416;
    float _1462 = _1404;
    float _1464 = _1442;
    float _1466 = _1452;
    if (!_1454)
    {
        _1456 = _1416;
    }
    float _1468 = _1456;
    float _1470 = _1468;
    if (!_1454)
    {
        _1458 = _1414;
    }
    float _1472 = _1458;
    float _1474 = _1472;
    if (!_1454)
    {
        _1460 = _1452;
    }
    float _1476 = _1460;
    bool _1478 = !_1454;
    float _1480 = _1476;
    if (!_1478)
    {
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1486 = _1442 + _1484;
        float _1488 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = rsqrt(_1438);
        float _1492 = _1486 * _1482;
        float _1494 = _1492 * 0.15915493667125701904296875;
        float _1496 = _1494 * 6.283185482025146484375;
        float _1498 = cos(_1496);
        float _1500 = _1494 * 6.283185482025146484375;
        float _1502 = sin(_1500);
        float _1504 = _1498 + (-1.0);
        float _1506 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1508 = fma(_1502, _1488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1510 = fma(_1452, _1498, _1506);
        float _1512 = _1490 * _1508;
        float _1514 = fma(_1424, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1516 = fma(_1420, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1470 = _1514;
        _1480 = _1510;
        _1474 = _1516;
        _1462 = _1494;
        _1464 = _1506;
    }
    float _1518 = _1470;
    float _1520 = _1480;
    float _1522 = _1474;
    float _1524 = _1462;
    float _1526 = _1464;
    float _1528 = -_938;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1518);
    float _1532 = -_930;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    float _1536 = -_972;
    float _1538 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _1540 = -_930;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _1544 = -_972;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _768);
    float _1548 = _1534;
    float _1550 = _1530;
    float _1552 = _1538;
    float _1554 = _1524;
    float _1556 = _1520;
    float _1558 = _1526;
    if (!_1434)
    {
        float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1562 = _1542 + _1560;
        float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1566 = _1448 + _1564;
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1570 = -_608;
        float _1572 = _1570 + _1518;
        float _1574 = _1562 * _1562;
        float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1578 = _1546 + _1576;
        float _1580 = -_822;
        float _1582 = _1580 + _1520;
        float _1584 = -_768;
        float _1586 = _1584 + _1522;
        float _1588 = fma(_1566, _1566, _1574);
        float _1590 = 1.0 / _1192;
        float _1592 = fma(_1578, _1578, _1588);
        float _1594 = sqrt(_1592);
        float _1596 = precise::min(_1594, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1598 = _1596 * _1568;
        float _1600 = _1598 * _1590;
        float _1602 = fma(_1572, _1600, _1448);
        float _1604 = fma(_1582, _1600, _1542);
        float _1606 = fma(_1586, _1600, _1546);
        _1548 = _1604;
        _1550 = _1602;
        _1552 = _1606;
        _1554 = _1568;
        _1556 = _1582;
        _1558 = _1594;
        _1466 = _1574;
    }
    float _1608 = _1548;
    float _1610 = _1550;
    float _1612 = _1552;
    float _1614 = _1554;
    float _1616 = _1556;
    float _1618 = _1558;
    float _1620 = _1466;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1624 = _1608 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1610 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1612 + _1630;
    float _1634 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1636 = _1624 * _1624;
    float _1638 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1640 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    float _1642 = fma(_1628, _1628, _1636);
    float _1644 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1638);
    float _1646 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1640);
    float _1648 = fma(_1632, _1632, _1642);
    float _1650 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1644);
    float _1652 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1654 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1656 = rsqrt(_1648);
    float _1658 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1660 = sqrt(_1648);
    float _1662 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1664 = _1628 * _1662;
    float _1666 = _1632 * _1662;
    float _1668 = _1664 * _1664;
    float _1670 = _1666 * _1666;
    float _1672 = _1668 + _1670;
    float _1674 = sqrt(_1672);
    bool _1676 = _1674 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1680 = _1674 + _1678;
    float _1682 = _1642;
    float _1684 = _1618;
    float _1686 = _1680;
    float _1688 = _1614;
    float _1690 = _1620;
    float _1692 = _1662;
    float _1694 = _1672;
    float _1696 = _1668;
    bool _1698 = _1676;
    float _1700 = _1628;
    float _1702 = _1624;
    if (_1676)
    {
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1682 = _1704;
    }
    float _1706 = _1682;
    if (_1676)
    {
        float _1708 = rsqrt(_1672);
        _1684 = _1708;
    }
    float _1710 = _1684;
    float _1712 = _1710;
    if (_1676)
    {
        float _1714 = _1680 * _1706;
        _1686 = _1714;
    }
    float _1716 = _1686;
    if (_1676)
    {
        float _1718 = _1716 * 0.15915493667125701904296875;
        _1688 = _1718;
    }
    float _1720 = _1688;
    float _1722 = _1706;
    float _1724 = _1720;
    if (_1676)
    {
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = sin(_1726);
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1734 = precise::max(0.0, _1732);
    float _1736 = _1616;
    if (_1676)
    {
        float _1738 = _1720 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        _1736 = _1740;
    }
    float _1742 = _1736;
    float _1744 = -_1662;
    float _1746 = -_1734;
    float _1748 = fma(_1624, _1744, _1746);
    if (_1676)
    {
        float _1750 = _1748 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _884 = _1750;
    }
    float _1752 = _884;
    float _1754 = _1752;
    if (!_1676)
    {
        _1724 = _1666;
    }
    float _1756 = _1724;
    float _1758 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1760 = _1756;
    if (_1676)
    {
        float _1762 = fma(_1730, _1752, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1690 = _1762;
    }
    float _1764 = _1690;
    float _1766 = floor(_1758);
    float _1768 = _1764;
    float _1770 = _1742;
    if (_1676)
    {
        float _1772 = _1742 + (-1.0);
        _1754 = _1772;
    }
    float _1774 = _1754;
    if (_1676)
    {
        float _1776 = _1710 * _1764;
        _1692 = _1776;
    }
    float _1778 = _1692;
    if (!_1676)
    {
        _1712 = _1664;
    }
    float _1780 = _1712;
    float _1782 = _1780;
    if (_1676)
    {
        float _1784 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1694 = _1784;
    }
    float _1786 = _1694;
    if (_1676)
    {
        float _1788 = _1664 * _1778;
        _1782 = _1788;
    }
    float _1790 = _1782;
    if (!_1676)
    {
        _1768 = _1748;
    }
    float _1792 = _1768;
    float _1794 = _1792;
    if (_1676)
    {
        float _1796 = _1666 * _1778;
        _1760 = _1796;
    }
    float _1798 = _1760;
    if (_1676)
    {
        float _1800 = fma(_1748, _1742, _1786);
        _1794 = _1800;
    }
    float _1802 = _1794;
    if (_1676)
    {
        float _1804 = _1790 * _1790;
        _1696 = _1804;
    }
    float _1806 = _1696;
    float _1808 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1676)
    {
        _1770 = _1670;
    }
    float _1810 = _1770;
    float _1812 = _1810;
    if (_1676)
    {
        float _1814 = _1798 * _1798;
        _1812 = _1814;
    }
    float _1816 = _1812;
    float _1818 = fma(_1802, _1802, _1806);
    float _1820 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1822 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1824 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1808);
    float _1826 = _1818 + _1816;
    float _1828 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1822);
    float _1830 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1824);
    float _1832 = floor(_1820);
    float _1834 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1836 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1828);
    float _1838 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1660, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = -_1834;
    float _1848 = fma(_1846, _1652, 1.0);
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1852 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1854 = rsqrt(_1826);
    float _1856 = -_1844;
    float _1858 = _1856 + 1.0;
    float _1860 = -_1766;
    float _1862 = _1758 + _1860;
    float _1864 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1852);
    float _1866 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1868 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1864);
    float _1870 = abs(_1858);
    float _1872 = log2(_1870);
    float _1874 = -_1832;
    float _1876 = _1820 + _1874;
    float _1878 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1866);
    float _1880 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1878);
    float _1882 = _1854 * _1790;
    float _1884 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1886 = _1854 * _1802;
    float _1888 = _1854 * _1798;
    float _1890 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1892 = log2(_1848);
    float _1894 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1880);
    float _1896 = -_1890;
    float _1898 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1896);
    float _1900 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1902 = -_1888;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1898);
    float _1906 = 1.0 / _1884;
    float _1908 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1910 = fma(_1904, -0.5, 0.5);
    float _1912 = fma(_1904, 0.5, 0.5);
    float _1914 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1908);
    float _1916 = _1886 + 1.0;
    float _1918 = exp2(_1900);
    float _1920 = fma(_1912, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1922 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1914);
    float _1924 = _1892 * 0.693147182464599609375;
    float _1926 = fma(_1912, _1920, -0.212114393711090087890625);
    float _1928 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1922);
    float _1930 = _1924 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1932 = sqrt(_1910);
    float _1934 = fma(_1912, _1926, 1.570728778839111328125);
    float _1936 = _1894 * _1906;
    float2 _6544 = float2(_1862, _1876);
    float _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6544, float2(0.0), isnan(_6544)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6544, float2(0.0), isnan(_6544)), level(0.0)).x;
    float _1940 = fma(_1936, 0.5, 0.5);
    float _1942 = -_1886;
    float _1944 = fma(_1918, _1916, _1942);
    float _1946 = _1928 * _1906;
    float _1948 = fma(_1946, -0.5, 0.5);
    float _1950 = _1932 * 0.636619746685028076171875;
    float _1952 = -_1934;
    float _1954 = fma(_1950, _1952, 1.0);
    float _1956 = fma(_1944, 0.5, 0.5);
    float3 _6578 = float3(_1940, _1948, _1930);
    float _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6578, float3(0.0), isnan(_6578)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6578, float3(0.0), isnan(_6578)), level(0.0)).x;
    float3 _6589 = float3(_1940, _1948, _1930);
    float4 _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6589, float3(0.0), isnan(_6589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6589, float3(0.0), isnan(_6589)), level(0.0)).xyzw;
    float _1963 = _1961.x;
    float _1965 = _1961.y;
    float _1967 = _1961.z;
    float _1969 = _1961.w;
    float2 _6605 = float2(_1954, _1956);
    float3 _1973 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6605, float2(0.0), isnan(_6605)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6605, float2(0.0), isnan(_6605)), level(0.0)).xyz;
    float _1975 = _1973.x;
    float _1977 = _1973.y;
    float _1979 = _1973.z;
    float _1981 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1983 = int(_1981);
    float _1985 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1987 = int(_1985);
    float _1989 = in.m_57.x;
    int _1991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1993 = _1991 != 0;
    float _1995 = -_530;
    float _1997 = _1995 + 1.0;
    int _1999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2001 = _1999 != 0;
    float _2003 = in.m_63.w;
    bool _2005 = _520 > 0.5;
    float _2007 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2009 = float(_1983);
    out.m_65.x = _1628;
    out.m_65.y = _1624;
    out.m_65.z = _1632;
    bool _2011 = _528 > 0.5;
    float _2013 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2007);
    float _2015 = 1.0 / _2009;
    float _2017 = _1930;
    float _2019 = _1884;
    float _2021 = _1928;
    if (_1993)
    {
        bool _2023 = _514 > 0.5;
        _1698 = _2023;
    }
    bool _2025 = _1698;
    float _2027 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2013);
    float _2029 = float(uint(_1987));
    float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2033 = _2031 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2037 = _2035 != 0;
    float _2039 = 1.0 / _2029;
    int _2041 = ~_1987;
    int _2043 = _2041 + 1;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2047 = _118 * _2015;
    out.m_67.w = _2003;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2051 = _2049 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2053 = 1.0 / _2033;
    int _2055 = abs(_630);
    float _2057 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2057;
    int _2061 = as_type<int>(_2039) + (-2);
    float _2063 = trunc(_2047);
    int _2065 = int(_2063);
    float _2067 = _2039;
    if (!_1993)
    {
        _2067 = _1989;
    }
    float _2069 = _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2075;
    float _2079 = _2069;
    if (!_1993)
    {
        _2017 = _2069;
    }
    float _2081 = _2017;
    float _2083 = _2081;
    if (_1993)
    {
        _2079 = _1989;
    }
    float _2085 = _2079;
    float _2087 = 1.0 / _2051;
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2093 = 0.0;
    if (!_2001)
    {
        _2093 = _2085;
    }
    float _2095 = _2093;
    int _2097 = 0;
    float _2099 = _2095;
    if (_2001)
    {
        float _2101 = -_2085;
        float _2103 = _2101 + 1.0;
        _2097 = as_type<int>(_2103);
    }
    int _2105 = _2097;
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2109 = _2107 != 0;
    float _2111 = _2059 * _2053;
    int _2113 = _2011 ? as_type<int>(_1997) : as_type<int>(_530);
    float _2115 = 1.0 / _2091;
    float _2117 = float(uint(_2065));
    if (_2001)
    {
        float _2119 = _2005 ? as_type<float>(_2105) : _2085;
        _2099 = _2119;
    }
    float _2121 = _2099;
    int _2123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2125 = _2123 != 0;
    float _2127 = as_type<float>(_2061) * _2117;
    bool _2129 = !_2109;
    float _2131 = _2129 ? 1.2345600128173828125 : 1.0;
    float _2133 = _2073 * _2087;
    float _2135 = _2125 ? as_type<float>(_2113) : _530;
    float _2137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2141 = _2139 != 0;
    float _2143 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _2145 = !_2109;
    float _2147 = _2145 ? _528 : _514;
    int _2149 = abs(_992);
    float _2151 = trunc(_2127);
    float _2153 = precise::max(_2151, 0.0);
    uint _2156 = uint(_2153);
    float _2158 = _2147 * _2131;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2162 = float(_1987);
    float _2164 = floor(_2158);
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2168 = _2043 * int(_2156);
    int _2170 = _2168 + _2065;
    float _2172 = float(uint(_2170));
    float _2174 = as_type<float>(_2061) * _2172;
    float _2176 = in.m_55.w;
    float _2178 = trunc(_2174);
    float _2180 = precise::max(_2178, 0.0);
    uint _2182 = uint(_2180);
    int _2184 = int(_2156) + int(_2182);
    int _2186 = int(_2156);
    float _2188 = as_type<float>(_2184);
    if (_1993)
    {
        float _2190 = -_2085;
        float _2192 = _2190 + 1.0;
        _2186 = as_type<int>(_2192);
    }
    int _2194 = _2186;
    int _2196 = ~_1987;
    int _2198 = _2196 + 1;
    if (_1993)
    {
        float _2200 = _2025 ? as_type<float>(_2194) : _2085;
        _2083 = _2200;
    }
    float _2202 = _2083;
    int _2204 = _2198 * _2184;
    int _2206 = _2204 + _2065;
    int _2208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2210 = _2208 != 0;
    float _2212 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2214 = uint(_2206) >= uint(_1987);
    int _2216 = _2005 ? as_type<int>(_1997) : as_type<int>(_530);
    bool _2218 = !_2214;
    int _2220 = _2218 ? 0 : (-1);
    int _2222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2224 = _2222 != 0;
    int _2226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2228 = _2226 != 0;
    float _2230 = _2224 ? as_type<float>(_2216) : _530;
    bool _2232 = _2176 > 0.5;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2236 = _528 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2238 = _2232 ? as_type<int>(_1997) : as_type<int>(_530);
    float _2240 = -_2234;
    float _2242 = fma(_2212, 2.0, _2240);
    bool _2244 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2246 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan(0.5);
    bool _2252 = _2248 || _2250;
    float _2254 = fma(_2236, -2.0, _2045);
    float _2256 = -_118;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2242);
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2262 = _2141 ? as_type<float>(_2238) : _530;
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2266 = ~_2184;
    int _2268 = _2266 + _2220;
    int _2270 = _2268 + 1;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2274 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2276 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2278 = _1987 == 0;
    float _2280 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2109)
    {
        _2188 = _528;
    }
    float _2282 = _2188;
    float _2284 = fma(_2262, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2286 = _2282;
    if (_2109)
    {
        _2286 = _514;
    }
    float _2288 = _2286;
    out.m_69.x = _2274;
    out.m_69.y = _2276;
    out.m_69.z = _2280;
    out.m_69.w = _2160;
    if (_2252)
    {
        _1700 = 1.0;
    }
    float _2290 = _1700;
    float _2292 = _2290;
    if (_2252)
    {
        _1702 = 1.0;
    }
    float _2294 = _1702;
    float _2296 = _118 * _2162;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2300 = _512 + _2298;
    float _2302 = _2077 * _2115;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2306 = _512 + _2304;
    float _2308 = _2296 * _162;
    float _2310 = fma(_2111, _2300, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2312 = float(_2065);
    float _2314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2316 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2318 = -_2164;
    float _2320 = _2158 + _2318;
    bool _2322 = _2312 >= _2162;
    bool _2324 = isnan(_2312);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan(_2162);
    bool _2330 = _2326 || _2328;
    float _2332 = float(_2330);
    float _2334 = fma(_2302, _2306, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2338 = _512 + _2336;
    float _2340 = trunc(_2332);
    int _2342 = int(_2340);
    float _2344 = fma(_2316, _2135, -0.5);
    float _2346 = fma(_2133, _2338, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2350 = _1987 * _2270;
    int _2352 = _2350 + _2065;
    float _2354 = _2320 * _2162;
    bool _2356 = !_2210;
    int _2358 = _2356 ? 0 : 1;
    float _2360 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2348);
    float _2362 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2366 = !_2278;
    int _2368 = _2366 ? _2352 : (-1);
    float _2370 = trunc(_2354);
    int _2372 = int(_2370);
    bool _2374 = _934 != 0.0;
    bool _2376 = isnan(_934);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan(0.0);
    bool _2382 = _2378 || _2380;
    float _2384 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2364);
    float _2386 = fma(_2230, _2362, -0.5);
    float _2388 = in.m_71.x;
    float _2390 = in.m_71.y;
    float _2392 = in.m_71.z;
    int _2394 = ~_2342;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    bool _2400 = _932 == 0.0;
    bool _2402 = !_2382;
    bool _2404 = _2400 && _2402;
    float _2406 = trunc(_2308);
    int _2408 = int(_2406);
    int _2410 = abs(_626);
    int _2412 = _2368 * _2398;
    int _2414 = _1987 + (-1);
    int _2416 = abs(_2358);
    bool _2418 = _936 == 0.0;
    bool _2420 = _2418 && _2404;
    int _2422 = _2342 * _2414;
    int _2424 = _2422 + _2412;
    bool _2426 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2428 = isnan(_512);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2434 = _2430 || _2432;
    float _2436 = float(_2434);
    int _2438 = _2424 * _2410;
    bool _2440 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2442 = isnan(_512);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2448 = _2444 || _2446;
    float _2450 = float(_2448);
    float _2452 = -_2436;
    float _2454 = _2452 + 1.0;
    int _2456 = _2372 * _2416;
    int _2458 = _2456 + _2065;
    bool _2460 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2462 = isnan(_512);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2468 = _2464 || _2466;
    float _2470 = float(_2468);
    int _2472 = _2408 * _2055;
    int _2474 = _2472 + _2438;
    float _2476 = _2450 * _2454;
    float _2478 = -_2450;
    float _2480 = _2478 + 1.0;
    float _2482 = _2388;
    float _2484 = _2392;
    float _2486 = _2390;
    int _2488 = _2474;
    float _2490 = _2294;
    if (!_2420)
    {
        float _2492 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2388);
        _2482 = _2492;
    }
    float _2494 = _2482;
    int _2496 = abs(_976);
    float _2498 = as_type<float>(_2496);
    if (!_2420)
    {
        float _2500 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2392);
        _2484 = _2500;
    }
    float _2502 = _2484;
    bool _2504 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2506 = isnan(_512);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2512 = _2508 || _2510;
    float _2514 = float(_2512);
    float _2516 = _2470 * _2480;
    float _2518 = -_2470;
    float _2520 = _2518 + 1.0;
    if (!_2420)
    {
        float _2522 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2390);
        _2486 = _2522;
    }
    float _2524 = _2486;
    int _2526 = _2458 * _2496;
    int _2528 = _2526 + _2474;
    if (_2109)
    {
        _2498 = _514;
    }
    float _2530 = _2498;
    float _2532 = _2514 * _2520;
    float _2534 = _2530;
    float _2536 = _2532;
    if (!_2109)
    {
        _2534 = _520;
    }
    float _2538 = _2534;
    float _2540 = -_2514;
    float _2542 = _2540 + 1.0;
    float _2544 = _2310 * _2532;
    int _2546 = _2372 * _2149;
    int _2548 = _2546 + _2528;
    float _2550 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2254);
    float _2552 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2554 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2360);
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2558 = float(uint(_2548));
    float _2560 = -_2550;
    float _2562 = fma(_2554, _2344, _2560);
    int _2564 = ~_1987;
    int _2566 = _2564 + 1;
    float _2568 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2570 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2572 = as_type<float>(_2061) * _2558;
    float _2574 = _2542;
    float _2576 = as_type<float>(_2566);
    if (_2228)
    {
        float _2578 = -_2085;
        float _2580 = _2578 + 1.0;
        _2488 = as_type<int>(_2580);
    }
    int _2582 = _2488;
    float _2584 = fma(_2288, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2568);
    float _2586 = -_2556;
    float _2588 = fma(_2570, 2.0, _2586);
    float _2590 = fma(_2542, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2544);
    float _2592 = trunc(_2572);
    float _2594 = precise::max(_2592, 0.0);
    uint _2596 = uint(_2594);
    float _2598 = -_118;
    float _2600 = fma(_2598, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2588);
    if (!_2228)
    {
        _2536 = _2085;
    }
    float _2602 = _2536;
    float _2604 = fma(_2346, _2516, _2590);
    float _2606 = _2602;
    if (_2228)
    {
        float _2608 = _2011 ? as_type<float>(_2582) : _2085;
        _2606 = _2608;
    }
    float _2610 = _2606;
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_2109)
    {
        _2574 = _520;
    }
    float _2614 = _2574;
    float _2616 = fma(_2334, _2476, _2604);
    float _2618 = -_2612;
    float _2620 = fma(_2552, 2.0, _2618);
    float _2622 = _2614;
    if (_2109)
    {
        _2622 = _528;
    }
    float _2624 = _2622;
    float _2626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2628 = ~_1987;
    int _2630 = _2628 + 1;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2634 = ~_1987;
    int _2636 = _2634 + 1;
    int _2638 = _2566 * int(_2596);
    int _2640 = _2638 + _2548;
    if (!_2109)
    {
        _2576 = _520;
    }
    float _2642 = _2576;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2646 = _2642;
    if (_2109)
    {
        _2646 = _528;
    }
    float _2648 = _2646;
    float _2650 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2632);
    float _2652 = float(uint(_2640));
    float _2654 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2644);
    float _2656 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2166);
    if (!_2109)
    {
        _584 = _514;
    }
    float _2658 = _584;
    float _2660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2662 = as_type<float>(_2061) * _2652;
    float _2664 = float(uint(_2458));
    float _2666 = _2626 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2668 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2654);
    float _2670 = -_118;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2620);
    float _2674 = as_type<float>(_2061) * _2664;
    float _2676 = trunc(_2662);
    float _2678 = precise::max(_2676, 0.0);
    uint _2680 = uint(_2678);
    float _2682 = fma(_2666, _2202, -0.5);
    float _2684 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2688 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2690 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2616);
    float _2692 = _2562 + 0.5;
    float _2694 = -_2524;
    float _2696 = _1218 * _2694;
    float _2698 = trunc(_2674);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    float _2704 = _2660 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2706 = fma(_2688, -2.0, _2686);
    float _2708 = _1226 * _2524;
    float _2710 = _1214 * _2524;
    float _2712 = fma(_2704, _2610, -0.5);
    float _2714 = fma(_2668, _2682, _2258);
    float _2716 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2718 = int(_2596) + int(_2680);
    float _2720 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2684);
    float _2722 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2584);
    float _2724 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2716);
    float _2726 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2706);
    int _2728 = _2630 * _2718;
    int _2730 = _2728 + _2548;
    float _2732 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2720);
    float _2734 = fma(_2722, _2143, _2600);
    int _2736 = _2636 * int(_2702);
    int _2738 = _2736 + _2458;
    float _2740 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2656);
    bool _2742 = uint(_2730) >= uint(_1987);
    float _2744 = _2732 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2746 = fma(_2740, _2712, _2672);
    bool _2748 = !_2742;
    int _2750 = _2748 ? 0 : (-1);
    float _2752 = _2658 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2754 = float(uint(_2738));
    float _2756 = fma(_1228, _2494, _2696);
    int _2758 = ~_2718;
    int _2760 = _2758 + _2750;
    int _2762 = _2760 + 1;
    float _2764 = fma(_1256, _2494, _2708);
    float _2766 = 1.0 / _2744;
    float _2768 = as_type<float>(_2061) * _2754;
    float _2770 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2724);
    int _2772 = _1987 * _2762;
    int _2774 = _2772 + _2548;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2778 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2650);
    float _2780 = _2770 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2782 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2384);
    float _2784 = fma(_2752, -2.0, _2776);
    bool _2786 = !_2278;
    int _2788 = _2786 ? _2774 : (-1);
    float _2790 = trunc(_2768);
    float _2792 = precise::max(_2790, 0.0);
    uint _2794 = uint(_2792);
    float _2796 = -_2726;
    float _2798 = fma(_2778, _2284, _2796);
    float _2800 = _2780 + _2744;
    int _2802 = _2788 >> 31;
    float _2804 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2784);
    float _2806 = _2800 * _2766;
    float _2808 = _2806 * 0.5;
    int _2810 = _2802 & 3;
    float _2812 = -_2804;
    float _2814 = fma(_2782, _2386, _2812);
    float _2816 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2818 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2816);
    int _2820 = _2788 + _2810;
    float _2822 = fma(_1264, _2494, _2710);
    float _2824 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2826 = _2820 >> 2;
    float _2828 = 1.0 / _2818;
    int _2830 = int(_2702) + int(_2794);
    float _2832 = _2824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2834 = ~_1987;
    int _2836 = _2834 + 1;
    int _2838 = _2826 << 4;
    int _2840 = _2838 + 512;
    float _2842 = _2714 + 0.5;
    float _2844 = _2734 + 0.5;
    float _2846 = _2798 + 0.5;
    int _2848 = _2836 * _2830;
    int _2850 = _2848 + _2458;
    uint _2852 = uint(int(uint(_2840) >> uint(2)));
    uint _2854 = uint(int(uint(int(_2852)) >> uint(2)));
    int _2856 = int(_2852) & 3;
    float _2858 = (*spvDescriptorSet0.vp_c9)._m0[int(_2854)][_2856];
    int _2860 = int(_2852) + 1;
    uint _2862 = uint(int(uint(_2860) >> uint(2)));
    int _2864 = _2860 & 3;
    float _2866 = (*spvDescriptorSet0.vp_c9)._m0[int(_2862)][_2864];
    int _2868 = _2788 & 3;
    bool _2870 = _2868 != 0;
    out.m_73.x = _2842;
    out.m_73.y = _2692;
    out.m_73.z = _2844;
    out.m_73.w = _2846;
    bool _2872 = uint(_2850) >= uint(_1987);
    float _2874 = _2814 + 0.5;
    bool _2876 = !_2872;
    int _2878 = _2876 ? 0 : (-1);
    int _2880 = _2788 & 3;
    bool _2882 = _2880 != 0;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2886 = ~_2830;
    int _2888 = _2886 + _2878;
    int _2890 = _2888 + 1;
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2894 = _2828 * _2892;
    int _2896 = _2840 + 8;
    uint _2898 = uint(int(uint(_2896) >> uint(2)));
    uint _2900 = uint(int(uint(int(_2898)) >> uint(2)));
    int _2902 = int(_2898) & 3;
    float _2904 = (*spvDescriptorSet0.vp_c9)._m0[int(_2900)][_2902];
    int _2906 = int(_2898) + 1;
    uint _2908 = uint(int(uint(_2906) >> uint(2)));
    int _2910 = _2906 & 3;
    float _2912 = (*spvDescriptorSet0.vp_c9)._m0[int(_2908)][_2910];
    bool _2914 = uint(_2868) > 1u;
    float _2916 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2918 = abs(_2894);
    float _2920 = log2(_2918);
    float _2922 = _2884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2924 = _2690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2926 = _2916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2928 = _2882 ? 0 : 1;
    float _2930 = _2746 + 0.5;
    bool _2932 = uint(_2868) >= 2u;
    int _2934 = _1987 * _2890;
    int _2936 = _2934 + _2458;
    out.m_75.x = _2832;
    out.m_75.y = _2922;
    out.m_75.z = _2926;
    out.m_75.w = _2924;
    int _2938 = ~_2928;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    int _2944 = _2942;
    float _2946 = _2894;
    if (!_2914)
    {
        int _2948 = ~_2928;
        int _2950 = _2948 + 1;
        _2944 = _2950;
    }
    int _2952 = _2944;
    out.m_77.x = _2930;
    out.m_77.y = _2874;
    bool _2954 = _2868 != 3;
    bool _2956 = !_2870;
    int _2958 = _2956 ? 0 : 1;
    bool _2960 = _2868 != 3;
    int _2962 = _2932 ? 0 : 1;
    int _2964 = abs(_2952);
    float _2966 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2968 = abs(_2958);
    float _2970 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2972 = !_2960;
    int _2974 = _2972 ? 0 : (-1);
    float _2976 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2027);
    int _2978 = ~_2962;
    int _2980 = _2978 + 1;
    int _2982 = _2980 + 1;
    float _2984 = exp2(_2966);
    int _2986 = ~_2964;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    int _2992 = _2982;
    float _2994 = _2976;
    if (_2954)
    {
        int _2996 = ~_2962;
        int _2998 = _2996 + 1;
        _2992 = _2998;
    }
    int _3000 = _2992;
    int _3002 = _2990 * as_type<int>(_2866);
    bool _3004 = !_2037;
    int _3006 = _3004 ? 0 : 1;
    float _3008 = exp2(_2970);
    int _3010 = abs(_2974);
    float _3012 = fma(_1240, _2502, _2756);
    float _3014 = fma(_1272, _2502, _2764);
    int _3016 = ~_2968;
    int _3018 = _3016 + 1;
    int _3020 = _3018 + 1;
    float _3022 = fma(_1278, _2502, _2822);
    int _3024 = abs(_3006);
    float _3026 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3028 = precise::clamp(_3026, 0.0, 1.0);
    int _3030 = _3020 * as_type<int>(_2858);
    int _3032 = _3030 + _3002;
    int _3034 = abs(_3000);
    int _3036 = ~_3010;
    int _3038 = _3036 + 1;
    int _3040 = _3038 + 1;
    float _3042 = fma(_3028, -2.0, 3.0);
    float _3044 = _3028 * _3028;
    int _3046 = ~_3034;
    int _3048 = _3046 + 1;
    int _3050 = _3048 + 1;
    int _3052 = ~_3024;
    int _3054 = _3052 + 1;
    int _3056 = _3054 + 1;
    float _3058 = _3044 * _3042;
    bool _3060 = !_2278;
    int _3062 = _3060 ? _2936 : (-1);
    float _3064 = in.m_79.x;
    int _3066 = _3050 * as_type<int>(_2904);
    int _3068 = _3066 + _3032;
    float _3070 = -_3058;
    float _3072 = _3070 + 1.0;
    int _3074 = _3040 * as_type<int>(_2912);
    int _3076 = _3074 + _3068;
    float _3078 = fma(_3072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3058);
    float _3080 = _2976 + _1884;
    int _3082 = _3076 * _3056;
    bool _3084 = _2894 <= 8000.0;
    bool _3086 = isnan(_2894);
    bool _3088 = _3084 || _3086;
    bool _3090 = isnan(8000.0);
    bool _3092 = _3088 || _3090;
    float _3094 = float(_3092);
    float _3096 = _3080 * 0.5;
    int _3098 = _3062 * _3024;
    int _3100 = _3098 + _3082;
    float _3102 = _1884 * 0.5;
    float _3104 = _3094 * _3078;
    float _3106 = _1894 + _1884;
    float _3108 = float(_3100);
    float _3110 = fma(_1928, -0.5, _3102);
    float _3112 = _3106 * 0.5;
    if (!_2252)
    {
        float _3114 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3118 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3116;
        float _3120 = _3114 * 0.15915493667125701904296875;
        float _3122 = _3120 * 6.283185482025146484375;
        float _3124 = cos(_3122);
        float _3126 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3128 = _3126 * 0.15915493667125701904296875;
        float _3130 = _3120 * 6.283185482025146484375;
        float _3132 = sin(_3130);
        float _3134 = 1.0 / _3124;
        float _3136 = _3128 * 6.283185482025146484375;
        float _3138 = cos(_3136);
        float _3140 = _3132 * _3134;
        float _3142 = _3128 * 6.283185482025146484375;
        float _3144 = sin(_3142);
        float _3146 = _3138 * _3140;
        float _3148 = 1.0 / _3118;
        float _3150 = 1.0 / _3146;
        float _3152 = _3144 * _3150;
        float _3154 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3156 = fma(_2894, _3152, _3154);
        float _3158 = _3156 * _3148;
        float _3160 = precise::clamp(_3158, 0.0, 1.0);
        _2490 = _3160;
    }
    float _3162 = _2490;
    if (!_2252)
    {
        float _3164 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3166 = _3164 * 0.15915493667125701904296875;
        float _3168 = _3166 * 6.283185482025146484375;
        float _3170 = cos(_3168);
        float _3172 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3174 = _3172 * 0.15915493667125701904296875;
        float _3176 = _3166 * 6.283185482025146484375;
        float _3178 = sin(_3176);
        float _3180 = 1.0 / _3170;
        float _3182 = _3174 * 6.283185482025146484375;
        float _3184 = cos(_3182);
        float _3186 = _3178 * _3180;
        float _3188 = _3174 * 6.283185482025146484375;
        float _3190 = sin(_3188);
        float _3192 = _3184 * _3186;
        float _3194 = 1.0 / _3192;
        float _3196 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3198 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3196;
        float _3200 = 1.0 / _3198;
        float _3202 = _3190 * _3194;
        float _3204 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3206 = fma(_2894, _3202, _3204);
        float _3208 = _3206 * _3200;
        float _3210 = precise::clamp(_3208, 0.0, 1.0);
        float _3212 = -_3210;
        float _3214 = _3212 + 1.0;
        _2292 = _3214;
        _2946 = _3210;
    }
    float _3216 = _2292;
    float _3218 = _2946;
    float _3220 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3222 = -_3008;
    float _3224 = _3222 + 1.0;
    float _3226 = -_1938;
    float _3228 = _3226 + 1.0;
    out.m_81.y = _3108;
    float _3230 = _3224 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3232 = _3228 * _3220;
    float _3234 = precise::clamp(_3232, 0.0, 1.0);
    bool _3236 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3238 = isnan(_1660);
    bool _3240 = _3236 || _3238;
    bool _3242 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3244 = _3240 || _3242;
    out.m_83.x = _3012;
    out.m_83.y = _3014;
    out.m_83.z = _3022;
    float _3246 = _3230 * _1958;
    float _3248 = -_3234;
    float _3250 = fma(_3248, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3252 = -_3230;
    float _3254 = _3252 + 1.0;
    out.gl_Position.x = _1894;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _2976;
    out.gl_Position.w = _1884;
    float _3256 = _1969 * _3246;
    float _3258 = _3250 * _3064;
    float _3260 = _1979 * _3246;
    float _3262 = _1969 * _3254;
    float _3264 = fma(_1975, _3256, _1963);
    float _3266 = fma(_1977, _3256, _1965);
    float _3268 = _3258 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3270 = fma(_1969, _3260, _1967);
    out.m_85.x = _3112;
    out.m_85.y = _3110;
    out.m_85.z = _3096;
    out.m_85.w = _1884;
    float _3272 = _3218;
    float _3274 = _3256;
    if (!_3244)
    {
        _3272 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3276 = _3272;
    float _3278 = _3276;
    float _3280 = _3276;
    if (!_3244)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3282 = _3274;
    out.m_87.x = _3268;
    float _3284 = _3162 * _3216;
    float _3286 = _3284;
    float _3288 = _3282;
    float _3290 = _3282;
    if (!_3244)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3292 = _2019;
    out.m_89.x = _3264;
    out.m_89.y = _3266;
    out.m_89.z = _3270;
    out.m_89.w = _3262;
    float _3294 = _3292;
    float _3296 = _3292;
    if (!_3244)
    {
        _2994 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3298 = _2994;
    float _3300 = _3298;
    float _3302 = _3298;
    if (!_3244)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3304 = _2021;
    float _3306 = _3284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3308 = _3304;
    float _3310 = _3304;
    if (!_3244)
    {
        _3286 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3312 = _3286;
    bool _3314 = !_3244;
    float _3316 = _3312;
    float _3318 = _3312;
    if (!_3314)
    {
        bool _3320 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3322 = isnan(_1660);
        bool _3324 = _3320 || _3322;
        bool _3326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3328 = _3324 || _3326;
        if (!_3328)
        {
            float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3332 = _1660 + _3330;
            float _3334 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3336 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3334;
            float _3338 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3340 = _3338 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3342 = 1.0 / _3336;
            float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3356 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3358 = _3356 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3360 = _3332 * _3342;
            float _3362 = precise::clamp(_3360, 0.0, 1.0);
            float _3364 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3366 = _3364 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3368 = fma(_3362, _3340, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3370 = fma(_3362, _3366, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3372 = fma(_3362, _3346, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3374 = fma(_3362, _3350, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3376 = fma(_3362, _3354, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3378 = fma(_3362, _3358, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3290 = _3372;
            _3310 = _3376;
            _3280 = _3368;
            _3302 = _3374;
            _3296 = _3370;
            _3318 = _3378;
            _3380 = true;
        }
        else
        {
            bool _3382 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3384 = isnan(_1660);
            bool _3386 = _3382 || _3384;
            bool _3388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3390 = _3386 || _3388;
            if (!_3390)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3392 = _3278;
            _3280 = _3392;
            if (!_3390)
            {
                _3288 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3394 = _3288;
            _3290 = _3394;
            if (!_3390)
            {
                _3294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3396 = _3294;
            _3296 = _3396;
            if (!_3390)
            {
                _3300 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3398 = _3300;
            _3302 = _3398;
            if (!_3390)
            {
                _3308 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3400 = _3308;
            _3310 = _3400;
            if (!_3390)
            {
                _3316 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3402 = _3316;
            bool _3404 = !_3390;
            _3318 = _3402;
            if (!_3404)
            {
                bool _3406 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3408 = isnan(_1660);
                bool _3410 = _3406 || _3408;
                bool _3412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3414 = _3410 || _3412;
                if (!_3414)
                {
                    float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3418 = _1660 + _3416;
                    float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3422 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3420;
                    float _3424 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3428 = 1.0 / _3422;
                    float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3432 = _3430 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3434 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3436 = _3434 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3440 = _3438 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3442 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3444 = _3442 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3446 = _3418 * _3428;
                    float _3448 = precise::clamp(_3446, 0.0, 1.0);
                    float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3454 = fma(_3448, _3426, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3456 = fma(_3448, _3452, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3458 = fma(_3448, _3432, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3460 = fma(_3448, _3436, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3462 = fma(_3448, _3440, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3464 = fma(_3448, _3444, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3290 = _3458;
                    _3310 = _3462;
                    _3280 = _3454;
                    _3302 = _3460;
                    _3296 = _3456;
                    _3318 = _3464;
                    _3380 = true;
                }
                else
                {
                    _3290 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3310 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3302 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3318 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3380 = false;
    float _3466 = _3290;
    float _3468 = _3310;
    float _3470 = _3280;
    float _3472 = _3302;
    float _3474 = _3296;
    float _3476 = _3318;
    float _3478 = fma(_3014, -0.5, 0.5);
    float _3480 = precise::clamp(_3478, 0.0, 1.0);
    float _3482 = -_3466;
    float _3484 = _3482 + _3468;
    float _3486 = _3306 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3488 = -_3470;
    float _3490 = _3488 + _3472;
    float _3492 = fma(_3480, _3484, _3466);
    out.m_91.x = 0.0;
    float _3494 = -_3474;
    float _3496 = _3494 + _3476;
    float _3498 = fma(_3480, _3490, _3470);
    float _3500 = _3492 * 0.586610972881317138671875;
    out.m_53.x = _3486;
    bool _3502 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3504 = fma(_3480, _3496, _3474);
    float _3506 = fma(_3498, 0.298911988735198974609375, _3500);
    bool _3508 = _3162 > 0.0;
    bool _3510 = isnan(_3162);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan(0.0);
    bool _3516 = _3512 || _3514;
    float _3518 = fma(_3504, 0.114477999508380889892578125, _3506);
    bool _3520 = _3216 <= 0.0;
    bool _3522 = !_3516;
    bool _3524 = _3520 || _3522;
    float _3526 = -_3518;
    float _3528 = _3498 + _3526;
    float _3530 = -_3518;
    float _3532 = _3492 + _3530;
    float _3534 = -_3518;
    float _3536 = _3504 + _3534;
    float _3538 = fma(_3528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3518);
    float _3540 = fma(_3532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3518);
    float _3542 = fma(_3536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3518);
    bool _3544 = !_3502;
    if (!_3544)
    {
        float _3546 = -_1608;
        float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3550 = -_1610;
        float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3554 = -_1612;
        float _3556 = _3554 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3558 = _3548 * _3548;
        float _3560 = fma(_3552, _3552, _3558);
        float _3562 = fma(_3556, _3556, _3560);
        float _3564 = sqrt(_3562);
        float _3566 = rsqrt(_3562);
        float _3568 = -_3564;
        float _3570 = _3568 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3572 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3574 = precise::clamp(_3572, 0.0, 1.0);
        float _3576 = _3552 * _3566;
        float _3578 = _3548 * _3566;
        float _3580 = abs(_3574);
        float _3582 = log2(_3580);
        float _3584 = _3556 * _3566;
        float _3586 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3588 = _3014 * _3578;
        float _3590 = -_3578;
        float _3592 = -_3586;
        float _3594 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3592);
        float _3596 = fma(_3012, _3576, _3588);
        float _3598 = -_3584;
        float _3600 = fma(_3598, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3594);
        float _3602 = fma(_3022, _3584, _3596);
        float _3604 = precise::clamp(_3602, 0.0, 1.0);
        float _3606 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3608 = _3600 + _3606;
        float _3610 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3614 = precise::clamp(_3612, 0.0, 1.0);
        float _3616 = exp2(_3610);
        float _3618 = _3616 * _3614;
        float _3620 = _3604 * _3618;
        float _3622 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3624 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3626 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3622;
        out.m_91.y = _3624;
        out.m_91.z = _3626;
    }
    out.m_93.x = _3538;
    out.m_93.y = _3540;
    out.m_93.z = _3542;
    if (!_3524)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3628 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3628;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3380 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = in.m_48.w;
    float _111 = trunc(_107);
    int _114 = int(_111);
    float _116 = -_109;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _118;
    bool _122 = _114 >= 1;
    float _124 = 0.0;
    float _126 = as_type<float>(_114);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3696 = as_type<float>(_134);
        out.gl_Position.z = _3696;
    }
    if (!_122)
    {
        return out;
    }
    bool _138 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_109);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_114);
    bool _150 = _118 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _126;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3751 = as_type<float>(_160);
        out.gl_Position.z = _3751;
    }
    if (_154)
    {
        return out;
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _118 * _162;
    bool _168 = !_164;
    float _170 = _166;
    float _188;
    if (!_168)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        _188 = _166;
    }
    _190 = false;
    float _192 = _188;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _214;
    float _218 = 1.0 / _200;
    float _220 = 1.0 / _212;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _222;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _208;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _232 = _192 + _230;
    float _234 = 1.0 / _204;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = _192 + _236;
    float _240 = _196 * _220;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = _192 + _242;
    bool _246 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _248 = isnan(_192);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = 1.0 / _216;
    float _260 = _238 * _228;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _192 + _262;
    bool _266 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _268 = isnan(_192);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = fma(_224, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = _264 * _218;
    float _282 = _232 * _234;
    bool _284 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _286 = isnan(_192);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    bool _296 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_192);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -_294;
    float _310 = _308 + 1.0;
    float _312 = _244 * _258;
    bool _314 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_192);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_276;
    float _328 = _326 + 1.0;
    float _330 = -_306;
    float _332 = _330 + 1.0;
    float _334 = _294 * _328;
    float _336 = _324 * _310;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    bool _346 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_192);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_324;
    float _360 = _358 + 1.0;
    float _362 = fma(_340, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = fma(_344, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _370 = _356 * _332;
    float _372 = -_356;
    float _374 = _372 + 1.0;
    float _376 = _306 * _360;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = _256 * _374;
    float _384 = -_256;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = fma(_368, _240, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _394 = _362 * _382;
    float _396 = _364 * _382;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _398;
    float _402 = _278 * _382;
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _406 = fma(_380, _240, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _408 = fma(_390, _240, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _410 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _412 = fma(_400, _280, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_392, _370, _404);
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_406, _370, _410);
    float _428 = fma(_412, _376, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _434 = fma(_408, _370, _416);
    float _436 = fma(_420, _280, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _442 = fma(_424, _280, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _448 = fma(_432, _282, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _450 = fma(_440, _282, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _452 = fma(_436, _376, _426);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _458;
    float _462 = fma(_446, _282, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _464 = fma(_442, _376, _434);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _466;
    float _470 = fma(_448, _336, _428);
    float _472 = fma(_456, _312, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _474 = fma(_460, _312, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _476 = fma(_450, _336, _452);
    float _478 = fma(_468, _312, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _480 = fma(_462, _336, _464);
    float _482 = fma(_472, _334, _470);
    float _484 = fma(_474, _334, _476);
    float _486 = fma(_478, _334, _480);
    float _488 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[148].x, _482);
    float _490 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[148].y, _484);
    float _492 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[148].z, _486);
    bool _494 = !_226;
    if (!_494)
    {
        float _496 = in.m_55.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _170 = _510;
    }
    float _512 = _170;
    float _514 = in.m_55.x;
    float _516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _518 = log2(_516);
    float _520 = in.m_55.z;
    float _522 = in.m_46.x;
    float _524 = in.m_46.y;
    float _526 = in.m_46.z;
    float _528 = in.m_55.y;
    float _530 = in.m_57.y;
    float _532 = _118 * _518;
    float _534 = exp2(_532);
    float _536 = _514 * 2.0;
    float _538 = _520 * 2.0;
    float _540 = floor(_536);
    float _542 = _524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _544 = fma(_522, (*spvDescriptorSet0.vp_c10)._m0[6].x, _542);
    float _546 = _528 * 2.0;
    float _548 = floor(_538);
    float _550 = -_534;
    float _552 = _550 + 1.0;
    bool _554 = _540 > 0.0;
    float _556 = floor(_546);
    bool _558 = _540 >= 0.0;
    bool _560 = isnan(_540);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = _524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _570 = _566 ? 0 : 1;
    float _572 = fma(_522, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
    int _574 = ~_570;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[4].z, _572);
    int _582 = _578;
    float _584 = _528;
    if (!_554)
    {
        int _586 = ~_570;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _606 = _604 != 0;
    float _608 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _620 = _618 != 0;
    float _622 = _524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _624 = !_598;
    int _626 = _624 ? 0 : 1;
    bool _628 = !_594;
    int _630 = _628 ? 0 : 1;
    float _632 = fma(_522, (*spvDescriptorSet0.vp_c10)._m0[5].x, _622);
    bool _634 = !_612;
    int _636 = _634 ? 0 : 1;
    float _638 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _640 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[5].z, _632);
    bool _642 = _548 >= 0.0;
    bool _644 = isnan(_548);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    bool _652 = !_620;
    int _654 = _652 ? 0 : 1;
    float _656 = -_638;
    float _658 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _656);
    int _660 = _650 ? 0 : 1;
    float _662 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _664 = _548 > 0.0;
    float _666 = _528 + _520;
    float _668 = -_662;
    float _670 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _668);
    int _672 = ~_660;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    float _678 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    bool _680 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _688 = _684 || _686;
    float _690 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _692 = _666 + (-1.0);
    float _694 = -_678;
    float _696 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _694);
    float _698 = _688 ? _552 : 0.0;
    float _700 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _690);
    float _702 = _514 + _528;
    int _704 = _676;
    bool _706 = _598;
    int _708 = _602 ? (-1) : 0;
    if (!_664)
    {
        int _710 = ~_660;
        int _712 = _710 + 1;
        _704 = _712;
    }
    int _714 = _704;
    float _716 = _514 + _520;
    bool _718 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _720 = isnan(1.0);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _726 = _722 || _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _730 = 1.0 + _728;
    bool _732 = _556 >= 0.0;
    bool _734 = isnan(_556);
    bool _736 = _732 || _734;
    bool _738 = isnan(0.0);
    bool _740 = _736 || _738;
    float _742 = _716 + (-1.0);
    float _744 = _702 + (-1.0);
    int _746 = abs(_654);
    float _748 = 1.0 / _730;
    float _750 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _752 = _740 ? 0 : 1;
    float _754 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _756 = _556 > 0.0;
    float _758 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[6].z, _544);
    int _760 = abs(_636);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = _608 + _762;
    float _766 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _768 = _758 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _770 = float(_760);
    float _772 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _700);
    float _774 = _764 * 0.0625;
    float _776 = -_768;
    float _778 = _776 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _782 = _768 + _780;
    float _784 = rsqrt(_772);
    float _786 = _698 * _748;
    int _788 = ~_752;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    float _794 = _514 * 6.283185482025146484375;
    float _796 = float(_714);
    int _798 = _792;
    float _800 = _778;
    if (!_756)
    {
        int _802 = ~_752;
        int _804 = _802 + 1;
        _798 = _804;
    }
    int _806 = _798;
    float _808 = fma(_118, 0.02999999932944774627685546875, _794);
    float _810 = _770 * _796;
    float _812 = abs(_764);
    float _814 = abs(_778);
    float _816 = precise::max(_812, _814);
    float _818 = _808 * 0.15915493667125701904296875;
    float _820 = float(_746);
    float _822 = _640 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _824 = _816 >= 16.0;
    float _826 = _810 * (-2.0);
    float _828 = float(_806);
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _832 = _822 + _830;
    float _834 = _824 ? _774 : _764;
    float _836 = fma(_766, _826, _766);
    bool _838 = !_616;
    int _840 = _838 ? 0 : 1;
    float _842 = _832 * _832;
    float _844 = _820 * _828;
    float _846 = _784 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _848 = !_726;
    int _850 = _848 ? as_type<int>(_118) : as_type<int>(_786);
    float _852 = fma(_764, _764, _842);
    float _854 = _844 * (-2.0);
    float _856 = _658 * _658;
    int _858 = abs(_840);
    float _860 = fma(_782, _782, _852);
    float _862 = _514 + (-0.5);
    float _864 = fma(_670, _670, _856);
    float _866 = fma(_750, _854, _750);
    float _868 = _520 + (-0.5);
    float _870 = _862 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _872 = rsqrt(_860);
    float _874 = fma(_696, _696, _864);
    float _876 = float(_858);
    float _878 = _868 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _880 = float(_590);
    int _882 = _850;
    float _884 = _822;
    if (_824)
    {
        float _886 = _778 * 0.0625;
        _800 = _886;
    }
    float _888 = _800;
    float _890 = abs(_834);
    bool _892 = _890 != 0.0;
    bool _894 = isnan(_890);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = _846 * (-0.699999988079071044921875);
    float _904 = fma(as_type<float>(_850), _836, _870);
    float _906 = _876 * _880;
    float _908 = fma(as_type<float>(_850), _866, _878);
    float _910 = abs(_888);
    bool _912 = _910 == 0.0;
    bool _914 = !_900;
    bool _916 = _912 && _914;
    float _918 = in.m_59.x;
    float _920 = in.m_59.y;
    float _922 = in.m_59.z;
    float _924 = _904 * 0.15915493667125701904296875;
    float _926 = _902 * 0.15915493667125701904296875;
    float _928 = _908 * 0.15915493667125701904296875;
    float _930 = _832 * _872;
    float _932 = in.m_61.x;
    float _934 = in.m_61.y;
    float _936 = in.m_61.z;
    float _938 = _764 * _872;
    float _940 = abs(_888);
    bool _942 = _940 == 0.0;
    float _944 = -_930;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _948 = _906 * (-2.0);
    float _950 = -_938;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _764);
    float _954 = _528 + (-0.5);
    float _956 = _946 * _946;
    float _958 = _818 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = fma(_754, _948, _754);
    if (_916)
    {
        bool _964 = as_type<int>(_888) >= 0;
        _706 = _964;
    }
    bool _966 = _706;
    float _968 = fma(_952, _952, _956);
    float _970 = _954 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _972 = _782 * _872;
    bool _974 = !_602;
    int _976 = _974 ? 0 : 1;
    float _978 = rsqrt(_874);
    float _980 = fma(as_type<float>(_850), _962, _970);
    float _982 = -_972;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    if (_916)
    {
        int _986 = _966 ? 0 : 1078530011;
        _882 = _986;
    }
    int _988 = _882;
    bool _990 = !_606;
    int _992 = _990 ? 0 : 1;
    float _994 = fma(_984, _984, _968);
    int _996 = _988;
    if (_916)
    {
        int _998 = int(0x80000000) & as_type<int>(_834);
        int _1000 = _988 | _998;
        _996 = _1000;
    }
    int _1002 = _996;
    float _1004 = _926 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _924 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = _924 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = _928 * 6.283185482025146484375;
    float _1018 = cos(_1016);
    bool _1020 = !_900;
    bool _1022 = _1020 && _942;
    int _1024 = _1002;
    float _1026 = as_type<float>(_1002);
    if (!_1022)
    {
        float _1028 = abs(_834);
        bool _1030 = _1028 != as_type<float>(0x7f800000u /* inf */);
        bool _1032 = isnan(_1028);
        bool _1034 = _1030 || _1032;
        bool _1036 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1038 = _1034 || _1036;
        float _1040 = abs(_888);
        bool _1042 = _1040 == as_type<float>(0x7f800000u /* inf */);
        float _1044 = abs(_888);
        bool _1046 = _1044 == as_type<float>(0x7f800000u /* inf */);
        bool _1048 = !_1038;
        bool _1050 = _1046 && _1048;
        if (_1050)
        {
            bool _1052 = as_type<int>(_888) >= 0;
            _708 = _1052 ? (-1) : 0;
        }
        int _1054 = _708;
        if (_1050)
        {
            _1024 = 1075235812;
        }
        int _1056 = _1024;
        int _1058 = _1056;
        if (_1050)
        {
            int _1060 = ~_1054;
            int _1062 = (_1060 != 0) ? _1056 : 1061752795;
            _1058 = _1062;
        }
        int _1064 = _1058;
        float _1066 = as_type<float>(_1064);
        if (_1050)
        {
            int _1068 = int(0x80000000) & as_type<int>(_834);
            int _1070 = _1064 | _1068;
            _1066 = as_type<float>(_1070);
        }
        float _1072 = _1066;
        bool _1074 = !_1038;
        bool _1076 = _1074 && _1042;
        _1026 = _1072;
        if (!_1076)
        {
            float _1078 = abs(_888);
            float _1080 = abs(_834);
            float _1082 = precise::max(_1078, _1080);
            float _1084 = abs(_888);
            float _1086 = abs(_834);
            float _1088 = precise::min(_1084, _1086);
            float _1090 = 1.0 / _1082;
            float _1092 = abs(_834);
            float _1094 = abs(_888);
            bool _1096 = _1092 > _1094;
            bool _1098 = as_type<int>(_888) >= 0;
            float _1100 = _1088 * _1090;
            float _1102 = abs(_888);
            float _1104 = abs(_834);
            float _1106 = _1102 + _1104;
            int _1108 = as_type<int>(_834) & int(0x80000000);
            float _1110 = _1100 * _1100;
            bool _1112 = _1106 > as_type<float>(0x7f800000u /* inf */);
            bool _1114 = isnan(_1106);
            bool _1116 = _1112 || _1114;
            bool _1118 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1120 = _1116 || _1118;
            float _1122 = _1110 + 11.33538818359375;
            float _1124 = fma(_1110, _1122, 28.84246826171875);
            float _1126 = fma(_1110, _1124, 19.6966705322265625);
            float _1128 = fma(_1110, -0.82336294651031494140625, -5.674867153167724609375);
            float _1130 = fma(_1110, _1128, -6.565555095672607421875);
            float _1132 = 1.0 / _1126;
            float _1134 = _1110 * _1130;
            float _1136 = _1100 * _1134;
            float _1138 = fma(_1136, _1132, _1100);
            float _1140 = _1138;
            _1026 = _1106;
            if (_1096)
            {
                float _1142 = -_1138;
                float _1144 = _1142 + 1.57079637050628662109375;
                _1140 = _1144;
            }
            float _1146 = _1140;
            int _1148 = as_type<int>(_1146);
            if (!_1098)
            {
                float _1150 = -_1146;
                float _1152 = _1150 + 3.1415927410125732421875;
                _1148 = as_type<int>(_1152);
            }
            int _1154 = _1148;
            if (!_1120)
            {
                int _1156 = _1108 | _1154;
                _1026 = as_type<float>(_1156);
            }
        }
    }
    float _1158 = _1026;
    float _1160 = sqrt(_994);
    float _1162 = -_1158;
    float _1164 = _980 + _1162;
    float _1166 = _492 * _922;
    float _1168 = -_530;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1172 = _488 * _918;
    float _1174 = _1164 * 0.15915493667125701904296875;
    float _1176 = _490 * _920;
    float _1178 = _960 * _1170;
    float _1180 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1182 = _1174 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = _658 * _978;
    float _1188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _932);
    float _1190 = _670 * _978;
    float _1192 = _872 * _1160;
    float _1194 = _696 * _978;
    float _1196 = _1174 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1202 = _1192 * _1180;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1206 = fma(_1204, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _1208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _934);
    float _1210 = _1192 * _1200;
    float _1212 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1214 = _1010 * _1018;
    float _1216 = _928 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _1202 * _1188;
    float _1222 = _1186 * _1186;
    float _1224 = _1210 * _1208;
    float _1226 = _1014 * _1018;
    float _1228 = _1184 * _1018;
    float _1230 = fma(_1190, _1190, _1222);
    float _1232 = _1014 * _1184;
    float _1234 = _1010 * _1198;
    float _1236 = _1014 * _1198;
    float _1238 = fma(_1194, _1194, _1230);
    float _1240 = _1198 * _1018;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _936);
    float _1244 = _1192 * _1212;
    float _1246 = rsqrt(_1238);
    float _1248 = _1010 * _1184;
    float _1250 = -_1224;
    float _1252 = _1218 * _1250;
    float _1254 = _1244 * _1242;
    float _1256 = fma(_1218, _1232, _1234);
    float _1258 = _1226 * _1224;
    float _1260 = fma(_1228, _1220, _1252);
    float _1262 = -_1236;
    float _1264 = fma(_1218, _1248, _1262);
    float _1266 = _926 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = -_1248;
    float _1272 = fma(_1218, _1236, _1270);
    float _1274 = fma(_1256, _1220, _1258);
    float _1276 = fma(_1240, _1254, _1260);
    float _1278 = fma(_1218, _1234, _1232);
    float _1280 = _1206 * _1178;
    float _1282 = _1214 * _1224;
    float _1284 = fma(_1272, _1254, _1274);
    float _1286 = _608 + _1276;
    float _1288 = _1190 * _1246;
    float _1290 = fma(_1264, _1220, _1282);
    float _1292 = _822 + _1284;
    float _1294 = fma(_1190, _1280, _1286);
    float _1296 = _1186 * _1246;
    float _1298 = _1194 * _1246;
    float _1300 = fma(_1278, _1254, _1290);
    float _1302 = -_1268;
    float _1304 = _1302 + 1.0;
    float _1306 = _1288 * _1006;
    float _1308 = _1298 * _1006;
    float _1310 = _1296 * _1006;
    float _1312 = fma(_1186, _1280, _1292);
    float _1314 = _1288 * _1304;
    float _1316 = _1296 * _1304;
    float _1318 = _768 + _1300;
    float _1320 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1322 = _1312 + _1320;
    float _1324 = fma(_1296, _1314, _1308);
    float _1326 = fma(_1296, _1316, _1268);
    float _1328 = -_1308;
    float _1330 = fma(_1296, _1314, _1328);
    float _1332 = fma(_1288, _1314, _1268);
    float _1334 = -_1310;
    float _1336 = fma(_1298, _1314, _1334);
    float _1338 = fma(_1298, _1314, _1310);
    float _1340 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1342 = _1294 + _1340;
    float _1344 = _1326 * _1322;
    float _1346 = fma(_1194, _1280, _1318);
    float _1348 = fma(_1298, _1316, _1306);
    float _1350 = -_1306;
    float _1352 = fma(_1298, _1316, _1350);
    float _1354 = fma(_1324, _1342, _1344);
    float _1356 = _1330 * _1322;
    float _1358 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1360 = _1346 + _1358;
    float _1362 = _1298 * _1298;
    float _1364 = _1348 * _1322;
    float _1366 = fma(_1332, _1342, _1356);
    float _1368 = fma(_1352, _1360, _1354);
    float _1370 = fma(_1304, _1362, _1268);
    float _1372 = fma(_1336, _1342, _1364);
    float _1374 = fma(_1338, _1360, _1366);
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1380 = fma(_1370, _1360, _1372);
    float _1382 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1376);
    float _1384 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1378);
    float _1386 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1388 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1382);
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1384);
    float _1392 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1386);
    float _1394 = _1388 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1396 = _1390 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1398 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1392);
    float _1400 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1402 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1404 = _1398 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1400);
    float _1408 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1402);
    float _1410 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1406);
    float _1412 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1408);
    float _1414 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1416 = _1412 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1420 = _1414 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1424 = _1416 + _1422;
    bool _1426 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(0.5);
    bool _1434 = _1430 || _1432;
    float _1436 = _1420 * _1420;
    float _1438 = fma(_1424, _1424, _1436);
    float _1440 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1442 = sqrt(_1438);
    float _1444 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1440);
    float _1446 = -_938;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _1450 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1444);
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1454 = _1442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1458 = _1450;
    float _1460 = _1416;
    float _1462 = _1404;
    float _1464 = _1442;
    float _1466 = _1452;
    if (!_1454)
    {
        _1456 = _1416;
    }
    float _1468 = _1456;
    float _1470 = _1468;
    if (!_1454)
    {
        _1458 = _1414;
    }
    float _1472 = _1458;
    float _1474 = _1472;
    if (!_1454)
    {
        _1460 = _1452;
    }
    float _1476 = _1460;
    bool _1478 = !_1454;
    float _1480 = _1476;
    if (!_1478)
    {
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1486 = _1442 + _1484;
        float _1488 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = rsqrt(_1438);
        float _1492 = _1486 * _1482;
        float _1494 = _1492 * 0.15915493667125701904296875;
        float _1496 = _1494 * 6.283185482025146484375;
        float _1498 = cos(_1496);
        float _1500 = _1494 * 6.283185482025146484375;
        float _1502 = sin(_1500);
        float _1504 = _1498 + (-1.0);
        float _1506 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1508 = fma(_1502, _1488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1510 = fma(_1452, _1498, _1506);
        float _1512 = _1490 * _1508;
        float _1514 = fma(_1424, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1516 = fma(_1420, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1470 = _1514;
        _1480 = _1510;
        _1474 = _1516;
        _1462 = _1494;
        _1464 = _1506;
    }
    float _1518 = _1470;
    float _1520 = _1480;
    float _1522 = _1474;
    float _1524 = _1462;
    float _1526 = _1464;
    float _1528 = -_938;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1518);
    float _1532 = -_930;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    float _1536 = -_972;
    float _1538 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _1540 = -_930;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _1544 = -_972;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _768);
    float _1548 = _1534;
    float _1550 = _1530;
    float _1552 = _1538;
    float _1554 = _1524;
    float _1556 = _1520;
    float _1558 = _1526;
    if (!_1434)
    {
        float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1562 = _1542 + _1560;
        float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1566 = _1448 + _1564;
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1570 = -_608;
        float _1572 = _1570 + _1518;
        float _1574 = _1562 * _1562;
        float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1578 = _1546 + _1576;
        float _1580 = -_822;
        float _1582 = _1580 + _1520;
        float _1584 = -_768;
        float _1586 = _1584 + _1522;
        float _1588 = fma(_1566, _1566, _1574);
        float _1590 = 1.0 / _1192;
        float _1592 = fma(_1578, _1578, _1588);
        float _1594 = sqrt(_1592);
        float _1596 = precise::min(_1594, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1598 = _1596 * _1568;
        float _1600 = _1598 * _1590;
        float _1602 = fma(_1572, _1600, _1448);
        float _1604 = fma(_1582, _1600, _1542);
        float _1606 = fma(_1586, _1600, _1546);
        _1548 = _1604;
        _1550 = _1602;
        _1552 = _1606;
        _1554 = _1568;
        _1556 = _1582;
        _1558 = _1594;
        _1466 = _1574;
    }
    float _1608 = _1548;
    float _1610 = _1550;
    float _1612 = _1552;
    float _1614 = _1554;
    float _1616 = _1556;
    float _1618 = _1558;
    float _1620 = _1466;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1624 = _1608 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1610 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1612 + _1630;
    float _1634 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1636 = _1624 * _1624;
    float _1638 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1640 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    float _1642 = fma(_1628, _1628, _1636);
    float _1644 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1638);
    float _1646 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1640);
    float _1648 = fma(_1632, _1632, _1642);
    float _1650 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1644);
    float _1652 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1654 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1656 = rsqrt(_1648);
    float _1658 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1660 = sqrt(_1648);
    float _1662 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1664 = _1628 * _1662;
    float _1666 = _1632 * _1662;
    float _1668 = _1664 * _1664;
    float _1670 = _1666 * _1666;
    float _1672 = _1668 + _1670;
    float _1674 = sqrt(_1672);
    bool _1676 = _1674 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1680 = _1674 + _1678;
    float _1682 = _1642;
    float _1684 = _1618;
    float _1686 = _1680;
    float _1688 = _1614;
    float _1690 = _1620;
    float _1692 = _1662;
    float _1694 = _1672;
    float _1696 = _1668;
    bool _1698 = _1676;
    float _1700 = _1628;
    float _1702 = _1624;
    if (_1676)
    {
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1682 = _1704;
    }
    float _1706 = _1682;
    if (_1676)
    {
        float _1708 = rsqrt(_1672);
        _1684 = _1708;
    }
    float _1710 = _1684;
    float _1712 = _1710;
    if (_1676)
    {
        float _1714 = _1680 * _1706;
        _1686 = _1714;
    }
    float _1716 = _1686;
    if (_1676)
    {
        float _1718 = _1716 * 0.15915493667125701904296875;
        _1688 = _1718;
    }
    float _1720 = _1688;
    float _1722 = _1706;
    float _1724 = _1720;
    if (_1676)
    {
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = sin(_1726);
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1734 = precise::max(0.0, _1732);
    float _1736 = _1616;
    if (_1676)
    {
        float _1738 = _1720 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        _1736 = _1740;
    }
    float _1742 = _1736;
    float _1744 = -_1662;
    float _1746 = -_1734;
    float _1748 = fma(_1624, _1744, _1746);
    if (_1676)
    {
        float _1750 = _1748 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _884 = _1750;
    }
    float _1752 = _884;
    float _1754 = _1752;
    if (!_1676)
    {
        _1724 = _1666;
    }
    float _1756 = _1724;
    float _1758 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1760 = _1756;
    if (_1676)
    {
        float _1762 = fma(_1730, _1752, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1690 = _1762;
    }
    float _1764 = _1690;
    float _1766 = floor(_1758);
    float _1768 = _1764;
    float _1770 = _1742;
    if (_1676)
    {
        float _1772 = _1742 + (-1.0);
        _1754 = _1772;
    }
    float _1774 = _1754;
    if (_1676)
    {
        float _1776 = _1710 * _1764;
        _1692 = _1776;
    }
    float _1778 = _1692;
    if (!_1676)
    {
        _1712 = _1664;
    }
    float _1780 = _1712;
    float _1782 = _1780;
    if (_1676)
    {
        float _1784 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1694 = _1784;
    }
    float _1786 = _1694;
    if (_1676)
    {
        float _1788 = _1664 * _1778;
        _1782 = _1788;
    }
    float _1790 = _1782;
    if (!_1676)
    {
        _1768 = _1748;
    }
    float _1792 = _1768;
    float _1794 = _1792;
    if (_1676)
    {
        float _1796 = _1666 * _1778;
        _1760 = _1796;
    }
    float _1798 = _1760;
    if (_1676)
    {
        float _1800 = fma(_1748, _1742, _1786);
        _1794 = _1800;
    }
    float _1802 = _1794;
    if (_1676)
    {
        float _1804 = _1790 * _1790;
        _1696 = _1804;
    }
    float _1806 = _1696;
    float _1808 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1676)
    {
        _1770 = _1670;
    }
    float _1810 = _1770;
    float _1812 = _1810;
    if (_1676)
    {
        float _1814 = _1798 * _1798;
        _1812 = _1814;
    }
    float _1816 = _1812;
    float _1818 = fma(_1802, _1802, _1806);
    float _1820 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1822 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1824 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1808);
    float _1826 = _1818 + _1816;
    float _1828 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1822);
    float _1830 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1824);
    float _1832 = floor(_1820);
    float _1834 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1836 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1828);
    float _1838 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1660, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = -_1834;
    float _1848 = fma(_1846, _1652, 1.0);
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1852 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1854 = rsqrt(_1826);
    float _1856 = -_1844;
    float _1858 = _1856 + 1.0;
    float _1860 = -_1766;
    float _1862 = _1758 + _1860;
    float _1864 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1852);
    float _1866 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1868 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1864);
    float _1870 = abs(_1858);
    float _1872 = log2(_1870);
    float _1874 = -_1832;
    float _1876 = _1820 + _1874;
    float _1878 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1866);
    float _1880 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1878);
    float _1882 = _1854 * _1790;
    float _1884 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1886 = _1854 * _1802;
    float _1888 = _1854 * _1798;
    float _1890 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1892 = log2(_1848);
    float _1894 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1880);
    float _1896 = -_1890;
    float _1898 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1896);
    float _1900 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1902 = -_1888;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1898);
    float _1906 = 1.0 / _1884;
    float _1908 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1910 = fma(_1904, -0.5, 0.5);
    float _1912 = fma(_1904, 0.5, 0.5);
    float _1914 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1908);
    float _1916 = _1886 + 1.0;
    float _1918 = exp2(_1900);
    float _1920 = fma(_1912, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1922 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1914);
    float _1924 = _1892 * 0.693147182464599609375;
    float _1926 = fma(_1912, _1920, -0.212114393711090087890625);
    float _1928 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1922);
    float _1930 = _1924 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1932 = sqrt(_1910);
    float _1934 = fma(_1912, _1926, 1.570728778839111328125);
    float _1936 = _1894 * _1906;
    float2 _6544 = float2(_1862, _1876);
    float _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6544, float2(0.0), isnan(_6544)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6544, float2(0.0), isnan(_6544)), level(0.0)).x;
    float _1940 = fma(_1936, 0.5, 0.5);
    float _1942 = -_1886;
    float _1944 = fma(_1918, _1916, _1942);
    float _1946 = _1928 * _1906;
    float _1948 = fma(_1946, -0.5, 0.5);
    float _1950 = _1932 * 0.636619746685028076171875;
    float _1952 = -_1934;
    float _1954 = fma(_1950, _1952, 1.0);
    float _1956 = fma(_1944, 0.5, 0.5);
    float3 _6578 = float3(_1940, _1948, _1930);
    float _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6578, float3(0.0), isnan(_6578)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6578, float3(0.0), isnan(_6578)), level(0.0)).x;
    float3 _6589 = float3(_1940, _1948, _1930);
    float4 _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6589, float3(0.0), isnan(_6589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6589, float3(0.0), isnan(_6589)), level(0.0)).xyzw;
    float _1963 = _1961.x;
    float _1965 = _1961.y;
    float _1967 = _1961.z;
    float _1969 = _1961.w;
    float2 _6605 = float2(_1954, _1956);
    float3 _1973 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6605, float2(0.0), isnan(_6605)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6605, float2(0.0), isnan(_6605)), level(0.0)).xyz;
    float _1975 = _1973.x;
    float _1977 = _1973.y;
    float _1979 = _1973.z;
    float _1981 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1983 = int(_1981);
    float _1985 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1987 = int(_1985);
    float _1989 = in.m_57.x;
    int _1991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1993 = _1991 != 0;
    float _1995 = -_530;
    float _1997 = _1995 + 1.0;
    int _1999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2001 = _1999 != 0;
    float _2003 = in.m_63.w;
    bool _2005 = _520 > 0.5;
    float _2007 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2009 = float(_1983);
    out.m_65.x = _1628;
    out.m_65.y = _1624;
    out.m_65.z = _1632;
    bool _2011 = _528 > 0.5;
    float _2013 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2007);
    float _2015 = 1.0 / _2009;
    float _2017 = _1930;
    float _2019 = _1884;
    float _2021 = _1928;
    if (_1993)
    {
        bool _2023 = _514 > 0.5;
        _1698 = _2023;
    }
    bool _2025 = _1698;
    float _2027 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2013);
    float _2029 = float(uint(_1987));
    float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2033 = _2031 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2037 = _2035 != 0;
    float _2039 = 1.0 / _2029;
    int _2041 = ~_1987;
    int _2043 = _2041 + 1;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2047 = _118 * _2015;
    out.m_67.w = _2003;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2051 = _2049 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2053 = 1.0 / _2033;
    int _2055 = abs(_630);
    float _2057 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2057;
    int _2061 = as_type<int>(_2039) + (-2);
    float _2063 = trunc(_2047);
    int _2065 = int(_2063);
    float _2067 = _2039;
    if (!_1993)
    {
        _2067 = _1989;
    }
    float _2069 = _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2075;
    float _2079 = _2069;
    if (!_1993)
    {
        _2017 = _2069;
    }
    float _2081 = _2017;
    float _2083 = _2081;
    if (_1993)
    {
        _2079 = _1989;
    }
    float _2085 = _2079;
    float _2087 = 1.0 / _2051;
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2093 = 0.0;
    if (!_2001)
    {
        _2093 = _2085;
    }
    float _2095 = _2093;
    int _2097 = 0;
    float _2099 = _2095;
    if (_2001)
    {
        float _2101 = -_2085;
        float _2103 = _2101 + 1.0;
        _2097 = as_type<int>(_2103);
    }
    int _2105 = _2097;
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2109 = _2107 != 0;
    float _2111 = _2059 * _2053;
    int _2113 = _2011 ? as_type<int>(_1997) : as_type<int>(_530);
    float _2115 = 1.0 / _2091;
    float _2117 = float(uint(_2065));
    if (_2001)
    {
        float _2119 = _2005 ? as_type<float>(_2105) : _2085;
        _2099 = _2119;
    }
    float _2121 = _2099;
    int _2123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2125 = _2123 != 0;
    float _2127 = as_type<float>(_2061) * _2117;
    bool _2129 = !_2109;
    float _2131 = _2129 ? 1.2345600128173828125 : 1.0;
    float _2133 = _2073 * _2087;
    float _2135 = _2125 ? as_type<float>(_2113) : _530;
    float _2137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2141 = _2139 != 0;
    float _2143 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _2145 = !_2109;
    float _2147 = _2145 ? _528 : _514;
    int _2149 = abs(_992);
    float _2151 = trunc(_2127);
    float _2153 = precise::max(_2151, 0.0);
    uint _2156 = uint(_2153);
    float _2158 = _2147 * _2131;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2162 = float(_1987);
    float _2164 = floor(_2158);
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2168 = _2043 * int(_2156);
    int _2170 = _2168 + _2065;
    float _2172 = float(uint(_2170));
    float _2174 = as_type<float>(_2061) * _2172;
    float _2176 = in.m_55.w;
    float _2178 = trunc(_2174);
    float _2180 = precise::max(_2178, 0.0);
    uint _2182 = uint(_2180);
    int _2184 = int(_2156) + int(_2182);
    int _2186 = int(_2156);
    float _2188 = as_type<float>(_2184);
    if (_1993)
    {
        float _2190 = -_2085;
        float _2192 = _2190 + 1.0;
        _2186 = as_type<int>(_2192);
    }
    int _2194 = _2186;
    int _2196 = ~_1987;
    int _2198 = _2196 + 1;
    if (_1993)
    {
        float _2200 = _2025 ? as_type<float>(_2194) : _2085;
        _2083 = _2200;
    }
    float _2202 = _2083;
    int _2204 = _2198 * _2184;
    int _2206 = _2204 + _2065;
    int _2208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2210 = _2208 != 0;
    float _2212 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2214 = uint(_2206) >= uint(_1987);
    int _2216 = _2005 ? as_type<int>(_1997) : as_type<int>(_530);
    bool _2218 = !_2214;
    int _2220 = _2218 ? 0 : (-1);
    int _2222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2224 = _2222 != 0;
    int _2226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2228 = _2226 != 0;
    float _2230 = _2224 ? as_type<float>(_2216) : _530;
    bool _2232 = _2176 > 0.5;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2236 = _528 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2238 = _2232 ? as_type<int>(_1997) : as_type<int>(_530);
    float _2240 = -_2234;
    float _2242 = fma(_2212, 2.0, _2240);
    bool _2244 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2246 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan(0.5);
    bool _2252 = _2248 || _2250;
    float _2254 = fma(_2236, -2.0, _2045);
    float _2256 = -_118;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2242);
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2262 = _2141 ? as_type<float>(_2238) : _530;
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2266 = ~_2184;
    int _2268 = _2266 + _2220;
    int _2270 = _2268 + 1;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2274 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2276 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2278 = _1987 == 0;
    float _2280 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2109)
    {
        _2188 = _528;
    }
    float _2282 = _2188;
    float _2284 = fma(_2262, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2286 = _2282;
    if (_2109)
    {
        _2286 = _514;
    }
    float _2288 = _2286;
    out.m_69.x = _2274;
    out.m_69.y = _2276;
    out.m_69.z = _2280;
    out.m_69.w = _2160;
    if (_2252)
    {
        _1700 = 1.0;
    }
    float _2290 = _1700;
    float _2292 = _2290;
    if (_2252)
    {
        _1702 = 1.0;
    }
    float _2294 = _1702;
    float _2296 = _118 * _2162;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2300 = _512 + _2298;
    float _2302 = _2077 * _2115;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2306 = _512 + _2304;
    float _2308 = _2296 * _162;
    float _2310 = fma(_2111, _2300, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2312 = float(_2065);
    float _2314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2316 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2318 = -_2164;
    float _2320 = _2158 + _2318;
    bool _2322 = _2312 >= _2162;
    bool _2324 = isnan(_2312);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan(_2162);
    bool _2330 = _2326 || _2328;
    float _2332 = float(_2330);
    float _2334 = fma(_2302, _2306, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2338 = _512 + _2336;
    float _2340 = trunc(_2332);
    int _2342 = int(_2340);
    float _2344 = fma(_2316, _2135, -0.5);
    float _2346 = fma(_2133, _2338, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2350 = _1987 * _2270;
    int _2352 = _2350 + _2065;
    float _2354 = _2320 * _2162;
    bool _2356 = !_2210;
    int _2358 = _2356 ? 0 : 1;
    float _2360 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2348);
    float _2362 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2366 = !_2278;
    int _2368 = _2366 ? _2352 : (-1);
    float _2370 = trunc(_2354);
    int _2372 = int(_2370);
    bool _2374 = _934 != 0.0;
    bool _2376 = isnan(_934);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan(0.0);
    bool _2382 = _2378 || _2380;
    float _2384 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2364);
    float _2386 = fma(_2230, _2362, -0.5);
    float _2388 = in.m_71.x;
    float _2390 = in.m_71.y;
    float _2392 = in.m_71.z;
    int _2394 = ~_2342;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    bool _2400 = _932 == 0.0;
    bool _2402 = !_2382;
    bool _2404 = _2400 && _2402;
    float _2406 = trunc(_2308);
    int _2408 = int(_2406);
    int _2410 = abs(_626);
    int _2412 = _2368 * _2398;
    int _2414 = _1987 + (-1);
    int _2416 = abs(_2358);
    bool _2418 = _936 == 0.0;
    bool _2420 = _2418 && _2404;
    int _2422 = _2342 * _2414;
    int _2424 = _2422 + _2412;
    bool _2426 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2428 = isnan(_512);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2434 = _2430 || _2432;
    float _2436 = float(_2434);
    int _2438 = _2424 * _2410;
    bool _2440 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2442 = isnan(_512);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2448 = _2444 || _2446;
    float _2450 = float(_2448);
    float _2452 = -_2436;
    float _2454 = _2452 + 1.0;
    int _2456 = _2372 * _2416;
    int _2458 = _2456 + _2065;
    bool _2460 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2462 = isnan(_512);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2468 = _2464 || _2466;
    float _2470 = float(_2468);
    int _2472 = _2408 * _2055;
    int _2474 = _2472 + _2438;
    float _2476 = _2450 * _2454;
    float _2478 = -_2450;
    float _2480 = _2478 + 1.0;
    float _2482 = _2388;
    float _2484 = _2392;
    float _2486 = _2390;
    int _2488 = _2474;
    float _2490 = _2294;
    if (!_2420)
    {
        float _2492 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2388);
        _2482 = _2492;
    }
    float _2494 = _2482;
    int _2496 = abs(_976);
    float _2498 = as_type<float>(_2496);
    if (!_2420)
    {
        float _2500 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2392);
        _2484 = _2500;
    }
    float _2502 = _2484;
    bool _2504 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2506 = isnan(_512);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2512 = _2508 || _2510;
    float _2514 = float(_2512);
    float _2516 = _2470 * _2480;
    float _2518 = -_2470;
    float _2520 = _2518 + 1.0;
    if (!_2420)
    {
        float _2522 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2390);
        _2486 = _2522;
    }
    float _2524 = _2486;
    int _2526 = _2458 * _2496;
    int _2528 = _2526 + _2474;
    if (_2109)
    {
        _2498 = _514;
    }
    float _2530 = _2498;
    float _2532 = _2514 * _2520;
    float _2534 = _2530;
    float _2536 = _2532;
    if (!_2109)
    {
        _2534 = _520;
    }
    float _2538 = _2534;
    float _2540 = -_2514;
    float _2542 = _2540 + 1.0;
    float _2544 = _2310 * _2532;
    int _2546 = _2372 * _2149;
    int _2548 = _2546 + _2528;
    float _2550 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2254);
    float _2552 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2554 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2360);
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2558 = float(uint(_2548));
    float _2560 = -_2550;
    float _2562 = fma(_2554, _2344, _2560);
    int _2564 = ~_1987;
    int _2566 = _2564 + 1;
    float _2568 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2570 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2572 = as_type<float>(_2061) * _2558;
    float _2574 = _2542;
    float _2576 = as_type<float>(_2566);
    if (_2228)
    {
        float _2578 = -_2085;
        float _2580 = _2578 + 1.0;
        _2488 = as_type<int>(_2580);
    }
    int _2582 = _2488;
    float _2584 = fma(_2288, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2568);
    float _2586 = -_2556;
    float _2588 = fma(_2570, 2.0, _2586);
    float _2590 = fma(_2542, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2544);
    float _2592 = trunc(_2572);
    float _2594 = precise::max(_2592, 0.0);
    uint _2596 = uint(_2594);
    float _2598 = -_118;
    float _2600 = fma(_2598, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2588);
    if (!_2228)
    {
        _2536 = _2085;
    }
    float _2602 = _2536;
    float _2604 = fma(_2346, _2516, _2590);
    float _2606 = _2602;
    if (_2228)
    {
        float _2608 = _2011 ? as_type<float>(_2582) : _2085;
        _2606 = _2608;
    }
    float _2610 = _2606;
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_2109)
    {
        _2574 = _520;
    }
    float _2614 = _2574;
    float _2616 = fma(_2334, _2476, _2604);
    float _2618 = -_2612;
    float _2620 = fma(_2552, 2.0, _2618);
    float _2622 = _2614;
    if (_2109)
    {
        _2622 = _528;
    }
    float _2624 = _2622;
    float _2626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2628 = ~_1987;
    int _2630 = _2628 + 1;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2634 = ~_1987;
    int _2636 = _2634 + 1;
    int _2638 = _2566 * int(_2596);
    int _2640 = _2638 + _2548;
    if (!_2109)
    {
        _2576 = _520;
    }
    float _2642 = _2576;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2646 = _2642;
    if (_2109)
    {
        _2646 = _528;
    }
    float _2648 = _2646;
    float _2650 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2632);
    float _2652 = float(uint(_2640));
    float _2654 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2644);
    float _2656 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2166);
    if (!_2109)
    {
        _584 = _514;
    }
    float _2658 = _584;
    float _2660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2662 = as_type<float>(_2061) * _2652;
    float _2664 = float(uint(_2458));
    float _2666 = _2626 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2668 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2654);
    float _2670 = -_118;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2620);
    float _2674 = as_type<float>(_2061) * _2664;
    float _2676 = trunc(_2662);
    float _2678 = precise::max(_2676, 0.0);
    uint _2680 = uint(_2678);
    float _2682 = fma(_2666, _2202, -0.5);
    float _2684 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2688 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2690 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2616);
    float _2692 = _2562 + 0.5;
    float _2694 = -_2524;
    float _2696 = _1218 * _2694;
    float _2698 = trunc(_2674);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    float _2704 = _2660 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2706 = fma(_2688, -2.0, _2686);
    float _2708 = _1226 * _2524;
    float _2710 = _1214 * _2524;
    float _2712 = fma(_2704, _2610, -0.5);
    float _2714 = fma(_2668, _2682, _2258);
    float _2716 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2718 = int(_2596) + int(_2680);
    float _2720 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2684);
    float _2722 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2584);
    float _2724 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2716);
    float _2726 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2706);
    int _2728 = _2630 * _2718;
    int _2730 = _2728 + _2548;
    float _2732 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2720);
    float _2734 = fma(_2722, _2143, _2600);
    int _2736 = _2636 * int(_2702);
    int _2738 = _2736 + _2458;
    float _2740 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2656);
    bool _2742 = uint(_2730) >= uint(_1987);
    float _2744 = _2732 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2746 = fma(_2740, _2712, _2672);
    bool _2748 = !_2742;
    int _2750 = _2748 ? 0 : (-1);
    float _2752 = _2658 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2754 = float(uint(_2738));
    float _2756 = fma(_1228, _2494, _2696);
    int _2758 = ~_2718;
    int _2760 = _2758 + _2750;
    int _2762 = _2760 + 1;
    float _2764 = fma(_1256, _2494, _2708);
    float _2766 = 1.0 / _2744;
    float _2768 = as_type<float>(_2061) * _2754;
    float _2770 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2724);
    int _2772 = _1987 * _2762;
    int _2774 = _2772 + _2548;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2778 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2650);
    float _2780 = _2770 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2782 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2384);
    float _2784 = fma(_2752, -2.0, _2776);
    bool _2786 = !_2278;
    int _2788 = _2786 ? _2774 : (-1);
    float _2790 = trunc(_2768);
    float _2792 = precise::max(_2790, 0.0);
    uint _2794 = uint(_2792);
    float _2796 = -_2726;
    float _2798 = fma(_2778, _2284, _2796);
    float _2800 = _2780 + _2744;
    int _2802 = _2788 >> 31;
    float _2804 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2784);
    float _2806 = _2800 * _2766;
    float _2808 = _2806 * 0.5;
    int _2810 = _2802 & 3;
    float _2812 = -_2804;
    float _2814 = fma(_2782, _2386, _2812);
    float _2816 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2818 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2816);
    int _2820 = _2788 + _2810;
    float _2822 = fma(_1264, _2494, _2710);
    float _2824 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2826 = _2820 >> 2;
    float _2828 = 1.0 / _2818;
    int _2830 = int(_2702) + int(_2794);
    float _2832 = _2824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2834 = ~_1987;
    int _2836 = _2834 + 1;
    int _2838 = _2826 << 4;
    int _2840 = _2838 + 512;
    float _2842 = _2714 + 0.5;
    float _2844 = _2734 + 0.5;
    float _2846 = _2798 + 0.5;
    int _2848 = _2836 * _2830;
    int _2850 = _2848 + _2458;
    uint _2852 = uint(int(uint(_2840) >> uint(2)));
    uint _2854 = uint(int(uint(int(_2852)) >> uint(2)));
    int _2856 = int(_2852) & 3;
    float _2858 = (*spvDescriptorSet0.vp_c9)._m0[int(_2854)][_2856];
    int _2860 = int(_2852) + 1;
    uint _2862 = uint(int(uint(_2860) >> uint(2)));
    int _2864 = _2860 & 3;
    float _2866 = (*spvDescriptorSet0.vp_c9)._m0[int(_2862)][_2864];
    int _2868 = _2788 & 3;
    bool _2870 = _2868 != 0;
    out.m_73.x = _2842;
    out.m_73.y = _2692;
    out.m_73.z = _2844;
    out.m_73.w = _2846;
    bool _2872 = uint(_2850) >= uint(_1987);
    float _2874 = _2814 + 0.5;
    bool _2876 = !_2872;
    int _2878 = _2876 ? 0 : (-1);
    int _2880 = _2788 & 3;
    bool _2882 = _2880 != 0;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2886 = ~_2830;
    int _2888 = _2886 + _2878;
    int _2890 = _2888 + 1;
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2894 = _2828 * _2892;
    int _2896 = _2840 + 8;
    uint _2898 = uint(int(uint(_2896) >> uint(2)));
    uint _2900 = uint(int(uint(int(_2898)) >> uint(2)));
    int _2902 = int(_2898) & 3;
    float _2904 = (*spvDescriptorSet0.vp_c9)._m0[int(_2900)][_2902];
    int _2906 = int(_2898) + 1;
    uint _2908 = uint(int(uint(_2906) >> uint(2)));
    int _2910 = _2906 & 3;
    float _2912 = (*spvDescriptorSet0.vp_c9)._m0[int(_2908)][_2910];
    bool _2914 = uint(_2868) > 1u;
    float _2916 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2918 = abs(_2894);
    float _2920 = log2(_2918);
    float _2922 = _2884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2924 = _2690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2926 = _2916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2928 = _2882 ? 0 : 1;
    float _2930 = _2746 + 0.5;
    bool _2932 = uint(_2868) >= 2u;
    int _2934 = _1987 * _2890;
    int _2936 = _2934 + _2458;
    out.m_75.x = _2832;
    out.m_75.y = _2922;
    out.m_75.z = _2926;
    out.m_75.w = _2924;
    int _2938 = ~_2928;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    int _2944 = _2942;
    float _2946 = _2894;
    if (!_2914)
    {
        int _2948 = ~_2928;
        int _2950 = _2948 + 1;
        _2944 = _2950;
    }
    int _2952 = _2944;
    out.m_77.x = _2930;
    out.m_77.y = _2874;
    bool _2954 = _2868 != 3;
    bool _2956 = !_2870;
    int _2958 = _2956 ? 0 : 1;
    bool _2960 = _2868 != 3;
    int _2962 = _2932 ? 0 : 1;
    int _2964 = abs(_2952);
    float _2966 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2968 = abs(_2958);
    float _2970 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2972 = !_2960;
    int _2974 = _2972 ? 0 : (-1);
    float _2976 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2027);
    int _2978 = ~_2962;
    int _2980 = _2978 + 1;
    int _2982 = _2980 + 1;
    float _2984 = exp2(_2966);
    int _2986 = ~_2964;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    int _2992 = _2982;
    float _2994 = _2976;
    if (_2954)
    {
        int _2996 = ~_2962;
        int _2998 = _2996 + 1;
        _2992 = _2998;
    }
    int _3000 = _2992;
    int _3002 = _2990 * as_type<int>(_2866);
    bool _3004 = !_2037;
    int _3006 = _3004 ? 0 : 1;
    float _3008 = exp2(_2970);
    int _3010 = abs(_2974);
    float _3012 = fma(_1240, _2502, _2756);
    float _3014 = fma(_1272, _2502, _2764);
    int _3016 = ~_2968;
    int _3018 = _3016 + 1;
    int _3020 = _3018 + 1;
    float _3022 = fma(_1278, _2502, _2822);
    int _3024 = abs(_3006);
    float _3026 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3028 = precise::clamp(_3026, 0.0, 1.0);
    int _3030 = _3020 * as_type<int>(_2858);
    int _3032 = _3030 + _3002;
    int _3034 = abs(_3000);
    int _3036 = ~_3010;
    int _3038 = _3036 + 1;
    int _3040 = _3038 + 1;
    float _3042 = fma(_3028, -2.0, 3.0);
    float _3044 = _3028 * _3028;
    int _3046 = ~_3034;
    int _3048 = _3046 + 1;
    int _3050 = _3048 + 1;
    int _3052 = ~_3024;
    int _3054 = _3052 + 1;
    int _3056 = _3054 + 1;
    float _3058 = _3044 * _3042;
    bool _3060 = !_2278;
    int _3062 = _3060 ? _2936 : (-1);
    float _3064 = in.m_79.x;
    int _3066 = _3050 * as_type<int>(_2904);
    int _3068 = _3066 + _3032;
    float _3070 = -_3058;
    float _3072 = _3070 + 1.0;
    int _3074 = _3040 * as_type<int>(_2912);
    int _3076 = _3074 + _3068;
    float _3078 = fma(_3072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3058);
    float _3080 = _2976 + _1884;
    int _3082 = _3076 * _3056;
    bool _3084 = _2894 <= 8000.0;
    bool _3086 = isnan(_2894);
    bool _3088 = _3084 || _3086;
    bool _3090 = isnan(8000.0);
    bool _3092 = _3088 || _3090;
    float _3094 = float(_3092);
    float _3096 = _3080 * 0.5;
    int _3098 = _3062 * _3024;
    int _3100 = _3098 + _3082;
    float _3102 = _1884 * 0.5;
    float _3104 = _3094 * _3078;
    float _3106 = _1894 + _1884;
    float _3108 = float(_3100);
    float _3110 = fma(_1928, -0.5, _3102);
    float _3112 = _3106 * 0.5;
    if (!_2252)
    {
        float _3114 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3118 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3116;
        float _3120 = _3114 * 0.15915493667125701904296875;
        float _3122 = _3120 * 6.283185482025146484375;
        float _3124 = cos(_3122);
        float _3126 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3128 = _3126 * 0.15915493667125701904296875;
        float _3130 = _3120 * 6.283185482025146484375;
        float _3132 = sin(_3130);
        float _3134 = 1.0 / _3124;
        float _3136 = _3128 * 6.283185482025146484375;
        float _3138 = cos(_3136);
        float _3140 = _3132 * _3134;
        float _3142 = _3128 * 6.283185482025146484375;
        float _3144 = sin(_3142);
        float _3146 = _3138 * _3140;
        float _3148 = 1.0 / _3118;
        float _3150 = 1.0 / _3146;
        float _3152 = _3144 * _3150;
        float _3154 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3156 = fma(_2894, _3152, _3154);
        float _3158 = _3156 * _3148;
        float _3160 = precise::clamp(_3158, 0.0, 1.0);
        _2490 = _3160;
    }
    float _3162 = _2490;
    if (!_2252)
    {
        float _3164 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3166 = _3164 * 0.15915493667125701904296875;
        float _3168 = _3166 * 6.283185482025146484375;
        float _3170 = cos(_3168);
        float _3172 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3174 = _3172 * 0.15915493667125701904296875;
        float _3176 = _3166 * 6.283185482025146484375;
        float _3178 = sin(_3176);
        float _3180 = 1.0 / _3170;
        float _3182 = _3174 * 6.283185482025146484375;
        float _3184 = cos(_3182);
        float _3186 = _3178 * _3180;
        float _3188 = _3174 * 6.283185482025146484375;
        float _3190 = sin(_3188);
        float _3192 = _3184 * _3186;
        float _3194 = 1.0 / _3192;
        float _3196 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3198 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3196;
        float _3200 = 1.0 / _3198;
        float _3202 = _3190 * _3194;
        float _3204 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3206 = fma(_2894, _3202, _3204);
        float _3208 = _3206 * _3200;
        float _3210 = precise::clamp(_3208, 0.0, 1.0);
        float _3212 = -_3210;
        float _3214 = _3212 + 1.0;
        _2292 = _3214;
        _2946 = _3210;
    }
    float _3216 = _2292;
    float _3218 = _2946;
    float _3220 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3222 = -_3008;
    float _3224 = _3222 + 1.0;
    float _3226 = -_1938;
    float _3228 = _3226 + 1.0;
    out.m_81.y = _3108;
    float _3230 = _3224 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3232 = _3228 * _3220;
    float _3234 = precise::clamp(_3232, 0.0, 1.0);
    bool _3236 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3238 = isnan(_1660);
    bool _3240 = _3236 || _3238;
    bool _3242 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3244 = _3240 || _3242;
    out.m_83.x = _3012;
    out.m_83.y = _3014;
    out.m_83.z = _3022;
    float _3246 = _3230 * _1958;
    float _3248 = -_3234;
    float _3250 = fma(_3248, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3252 = -_3230;
    float _3254 = _3252 + 1.0;
    out.gl_Position.x = _1894;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _2976;
    out.gl_Position.w = _1884;
    float _3256 = _1969 * _3246;
    float _3258 = _3250 * _3064;
    float _3260 = _1979 * _3246;
    float _3262 = _1969 * _3254;
    float _3264 = fma(_1975, _3256, _1963);
    float _3266 = fma(_1977, _3256, _1965);
    float _3268 = _3258 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3270 = fma(_1969, _3260, _1967);
    out.m_85.x = _3112;
    out.m_85.y = _3110;
    out.m_85.z = _3096;
    out.m_85.w = _1884;
    float _3272 = _3218;
    float _3274 = _3256;
    if (!_3244)
    {
        _3272 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3276 = _3272;
    float _3278 = _3276;
    float _3280 = _3276;
    if (!_3244)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3282 = _3274;
    out.m_87.x = _3268;
    float _3284 = _3162 * _3216;
    float _3286 = _3284;
    float _3288 = _3282;
    float _3290 = _3282;
    if (!_3244)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3292 = _2019;
    out.m_89.x = _3264;
    out.m_89.y = _3266;
    out.m_89.z = _3270;
    out.m_89.w = _3262;
    float _3294 = _3292;
    float _3296 = _3292;
    if (!_3244)
    {
        _2994 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3298 = _2994;
    float _3300 = _3298;
    float _3302 = _3298;
    if (!_3244)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3304 = _2021;
    float _3306 = _3284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3308 = _3304;
    float _3310 = _3304;
    if (!_3244)
    {
        _3286 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3312 = _3286;
    bool _3314 = !_3244;
    float _3316 = _3312;
    float _3318 = _3312;
    if (!_3314)
    {
        bool _3320 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3322 = isnan(_1660);
        bool _3324 = _3320 || _3322;
        bool _3326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3328 = _3324 || _3326;
        if (!_3328)
        {
            float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3332 = _1660 + _3330;
            float _3334 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3336 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3334;
            float _3338 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3340 = _3338 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3342 = 1.0 / _3336;
            float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3356 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3358 = _3356 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3360 = _3332 * _3342;
            float _3362 = precise::clamp(_3360, 0.0, 1.0);
            float _3364 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3366 = _3364 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3368 = fma(_3362, _3340, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3370 = fma(_3362, _3366, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3372 = fma(_3362, _3346, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3374 = fma(_3362, _3350, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3376 = fma(_3362, _3354, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3378 = fma(_3362, _3358, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3290 = _3372;
            _3310 = _3376;
            _3280 = _3368;
            _3302 = _3374;
            _3296 = _3370;
            _3318 = _3378;
            _3380 = true;
        }
        else
        {
            bool _3382 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3384 = isnan(_1660);
            bool _3386 = _3382 || _3384;
            bool _3388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3390 = _3386 || _3388;
            if (!_3390)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3392 = _3278;
            _3280 = _3392;
            if (!_3390)
            {
                _3288 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3394 = _3288;
            _3290 = _3394;
            if (!_3390)
            {
                _3294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3396 = _3294;
            _3296 = _3396;
            if (!_3390)
            {
                _3300 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3398 = _3300;
            _3302 = _3398;
            if (!_3390)
            {
                _3308 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3400 = _3308;
            _3310 = _3400;
            if (!_3390)
            {
                _3316 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3402 = _3316;
            bool _3404 = !_3390;
            _3318 = _3402;
            if (!_3404)
            {
                bool _3406 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3408 = isnan(_1660);
                bool _3410 = _3406 || _3408;
                bool _3412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3414 = _3410 || _3412;
                if (!_3414)
                {
                    float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3418 = _1660 + _3416;
                    float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3422 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3420;
                    float _3424 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3428 = 1.0 / _3422;
                    float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3432 = _3430 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3434 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3436 = _3434 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3440 = _3438 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3442 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3444 = _3442 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3446 = _3418 * _3428;
                    float _3448 = precise::clamp(_3446, 0.0, 1.0);
                    float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3454 = fma(_3448, _3426, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3456 = fma(_3448, _3452, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3458 = fma(_3448, _3432, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3460 = fma(_3448, _3436, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3462 = fma(_3448, _3440, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3464 = fma(_3448, _3444, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3290 = _3458;
                    _3310 = _3462;
                    _3280 = _3454;
                    _3302 = _3460;
                    _3296 = _3456;
                    _3318 = _3464;
                    _3380 = true;
                }
                else
                {
                    _3290 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3310 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3302 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3318 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3380 = false;
    float _3466 = _3290;
    float _3468 = _3310;
    float _3470 = _3280;
    float _3472 = _3302;
    float _3474 = _3296;
    float _3476 = _3318;
    float _3478 = fma(_3014, -0.5, 0.5);
    float _3480 = precise::clamp(_3478, 0.0, 1.0);
    float _3482 = -_3466;
    float _3484 = _3482 + _3468;
    float _3486 = _3306 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3488 = -_3470;
    float _3490 = _3488 + _3472;
    float _3492 = fma(_3480, _3484, _3466);
    out.m_91.x = 0.0;
    float _3494 = -_3474;
    float _3496 = _3494 + _3476;
    float _3498 = fma(_3480, _3490, _3470);
    float _3500 = _3492 * 0.586610972881317138671875;
    out.m_53.x = _3486;
    bool _3502 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3504 = fma(_3480, _3496, _3474);
    float _3506 = fma(_3498, 0.298911988735198974609375, _3500);
    bool _3508 = _3162 > 0.0;
    bool _3510 = isnan(_3162);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan(0.0);
    bool _3516 = _3512 || _3514;
    float _3518 = fma(_3504, 0.114477999508380889892578125, _3506);
    bool _3520 = _3216 <= 0.0;
    bool _3522 = !_3516;
    bool _3524 = _3520 || _3522;
    float _3526 = -_3518;
    float _3528 = _3498 + _3526;
    float _3530 = -_3518;
    float _3532 = _3492 + _3530;
    float _3534 = -_3518;
    float _3536 = _3504 + _3534;
    float _3538 = fma(_3528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3518);
    float _3540 = fma(_3532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3518);
    float _3542 = fma(_3536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3518);
    bool _3544 = !_3502;
    if (!_3544)
    {
        float _3546 = -_1608;
        float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3550 = -_1610;
        float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3554 = -_1612;
        float _3556 = _3554 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3558 = _3548 * _3548;
        float _3560 = fma(_3552, _3552, _3558);
        float _3562 = fma(_3556, _3556, _3560);
        float _3564 = sqrt(_3562);
        float _3566 = rsqrt(_3562);
        float _3568 = -_3564;
        float _3570 = _3568 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3572 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3574 = precise::clamp(_3572, 0.0, 1.0);
        float _3576 = _3552 * _3566;
        float _3578 = _3548 * _3566;
        float _3580 = abs(_3574);
        float _3582 = log2(_3580);
        float _3584 = _3556 * _3566;
        float _3586 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3588 = _3014 * _3578;
        float _3590 = -_3578;
        float _3592 = -_3586;
        float _3594 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3592);
        float _3596 = fma(_3012, _3576, _3588);
        float _3598 = -_3584;
        float _3600 = fma(_3598, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3594);
        float _3602 = fma(_3022, _3584, _3596);
        float _3604 = precise::clamp(_3602, 0.0, 1.0);
        float _3606 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3608 = _3600 + _3606;
        float _3610 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3614 = precise::clamp(_3612, 0.0, 1.0);
        float _3616 = exp2(_3610);
        float _3618 = _3616 * _3614;
        float _3620 = _3604 * _3618;
        float _3622 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3624 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3626 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3622;
        out.m_91.y = _3624;
        out.m_91.z = _3626;
    }
    out.m_93.x = _3538;
    out.m_93.y = _3540;
    out.m_93.z = _3542;
    if (!_3524)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3628 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3628;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3380 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = in.m_48.w;
    float _111 = trunc(_107);
    int _114 = int(_111);
    float _116 = -_109;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _118;
    bool _122 = _114 >= 1;
    float _124 = 0.0;
    float _126 = as_type<float>(_114);
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _124;
    if (!_122)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3696 = as_type<float>(_134);
        out.gl_Position.z = _3696;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_109);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_114);
    bool _150 = _118 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _126;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3751 = as_type<float>(_160);
        out.gl_Position.z = _3751;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _118 * _162;
    bool _168 = !_164;
    float _170 = _166;
    float _188;
    if (!_168)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _118);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        _188 = _166;
    }
    _190 = false;
    float _192 = _188;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _214;
    float _218 = 1.0 / _200;
    float _220 = 1.0 / _212;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _222;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _208;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _232 = _192 + _230;
    float _234 = 1.0 / _204;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = _192 + _236;
    float _240 = _196 * _220;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = _192 + _242;
    bool _246 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _248 = isnan(_192);
    bool _250 = _246 || _248;
    bool _252 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _254 = _250 || _252;
    float _256 = float(_254);
    float _258 = 1.0 / _216;
    float _260 = _238 * _228;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _192 + _262;
    bool _266 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _268 = isnan(_192);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _274 = _270 || _272;
    float _276 = float(_274);
    float _278 = fma(_224, _260, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = _264 * _218;
    float _282 = _232 * _234;
    bool _284 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _286 = isnan(_192);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    bool _296 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_192);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = -_294;
    float _310 = _308 + 1.0;
    float _312 = _244 * _258;
    bool _314 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_192);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_276;
    float _328 = _326 + 1.0;
    float _330 = -_306;
    float _332 = _330 + 1.0;
    float _334 = _294 * _328;
    float _336 = _324 * _310;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    bool _346 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_192);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_324;
    float _360 = _358 + 1.0;
    float _362 = fma(_340, _260, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _364 = fma(_344, _260, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _370 = _356 * _332;
    float _372 = -_356;
    float _374 = _372 + 1.0;
    float _376 = _306 * _360;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _382 = _256 * _374;
    float _384 = -_256;
    float _386 = _384 + 1.0;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _390 = _388 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _392 = fma(_368, _240, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _394 = _362 * _382;
    float _396 = _364 * _382;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _398;
    float _402 = _278 * _382;
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _406 = fma(_380, _240, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _408 = fma(_390, _240, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _410 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _412 = fma(_400, _280, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_392, _370, _404);
    float _416 = fma(_386, (*spvDescriptorSet0.vp_c9)._m0[143].z, _402);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_406, _370, _410);
    float _428 = fma(_412, _376, _414);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _434 = fma(_408, _370, _416);
    float _436 = fma(_420, _280, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _442 = fma(_424, _280, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _448 = fma(_432, _282, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _450 = fma(_440, _282, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _452 = fma(_436, _376, _426);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _458;
    float _462 = fma(_446, _282, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _464 = fma(_442, _376, _434);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _466;
    float _470 = fma(_448, _336, _428);
    float _472 = fma(_456, _312, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _474 = fma(_460, _312, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _476 = fma(_450, _336, _452);
    float _478 = fma(_468, _312, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _480 = fma(_462, _336, _464);
    float _482 = fma(_472, _334, _470);
    float _484 = fma(_474, _334, _476);
    float _486 = fma(_478, _334, _480);
    float _488 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[148].x, _482);
    float _490 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[148].y, _484);
    float _492 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[148].z, _486);
    bool _494 = !_226;
    if (!_494)
    {
        float _496 = in.m_55.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].y, _118);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _170 = _510;
    }
    float _512 = _170;
    float _514 = in.m_55.x;
    float _516 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _518 = log2(_516);
    float _520 = in.m_55.z;
    float _522 = in.m_46.x;
    float _524 = in.m_46.y;
    float _526 = in.m_46.z;
    float _528 = in.m_55.y;
    float _530 = in.m_57.y;
    float _532 = _118 * _518;
    float _534 = exp2(_532);
    float _536 = _514 * 2.0;
    float _538 = _520 * 2.0;
    float _540 = floor(_536);
    float _542 = _524 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _544 = fma(_522, (*spvDescriptorSet0.vp_c10)._m0[6].x, _542);
    float _546 = _528 * 2.0;
    float _548 = floor(_538);
    float _550 = -_534;
    float _552 = _550 + 1.0;
    bool _554 = _540 > 0.0;
    float _556 = floor(_546);
    bool _558 = _540 >= 0.0;
    bool _560 = isnan(_540);
    bool _562 = _558 || _560;
    bool _564 = isnan(0.0);
    bool _566 = _562 || _564;
    float _568 = _524 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _570 = _566 ? 0 : 1;
    float _572 = fma(_522, (*spvDescriptorSet0.vp_c10)._m0[4].x, _568);
    int _574 = ~_570;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[4].z, _572);
    int _582 = _578;
    float _584 = _528;
    if (!_554)
    {
        int _586 = ~_570;
        int _588 = _586 + 1;
        _582 = _588;
    }
    int _590 = _582;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _602 = _600 != 0;
    int _604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _606 = _604 != 0;
    float _608 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _612 = _610 != 0;
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _620 = _618 != 0;
    float _622 = _524 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _624 = !_598;
    int _626 = _624 ? 0 : 1;
    bool _628 = !_594;
    int _630 = _628 ? 0 : 1;
    float _632 = fma(_522, (*spvDescriptorSet0.vp_c10)._m0[5].x, _622);
    bool _634 = !_612;
    int _636 = _634 ? 0 : 1;
    float _638 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _640 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[5].z, _632);
    bool _642 = _548 >= 0.0;
    bool _644 = isnan(_548);
    bool _646 = _642 || _644;
    bool _648 = isnan(0.0);
    bool _650 = _646 || _648;
    bool _652 = !_620;
    int _654 = _652 ? 0 : 1;
    float _656 = -_638;
    float _658 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _656);
    int _660 = _650 ? 0 : 1;
    float _662 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _664 = _548 > 0.0;
    float _666 = _528 + _520;
    float _668 = -_662;
    float _670 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _668);
    int _672 = ~_660;
    int _674 = _672 + 1;
    int _676 = _674 + 1;
    float _678 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    bool _680 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _682 = isnan(0.0);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _688 = _684 || _686;
    float _690 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _692 = _666 + (-1.0);
    float _694 = -_678;
    float _696 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _694);
    float _698 = _688 ? _552 : 0.0;
    float _700 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _690);
    float _702 = _514 + _528;
    int _704 = _676;
    bool _706 = _598;
    int _708 = _602 ? (-1) : 0;
    if (!_664)
    {
        int _710 = ~_660;
        int _712 = _710 + 1;
        _704 = _712;
    }
    int _714 = _704;
    float _716 = _514 + _520;
    bool _718 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _720 = isnan(1.0);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _726 = _722 || _724;
    float _728 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _730 = 1.0 + _728;
    bool _732 = _556 >= 0.0;
    bool _734 = isnan(_556);
    bool _736 = _732 || _734;
    bool _738 = isnan(0.0);
    bool _740 = _736 || _738;
    float _742 = _716 + (-1.0);
    float _744 = _702 + (-1.0);
    int _746 = abs(_654);
    float _748 = 1.0 / _730;
    float _750 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _752 = _740 ? 0 : 1;
    float _754 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _756 = _556 > 0.0;
    float _758 = fma(_526, (*spvDescriptorSet0.vp_c10)._m0[6].z, _544);
    int _760 = abs(_636);
    float _762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _764 = _608 + _762;
    float _766 = fma(_744, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _768 = _758 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _770 = float(_760);
    float _772 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _700);
    float _774 = _764 * 0.0625;
    float _776 = -_768;
    float _778 = _776 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _782 = _768 + _780;
    float _784 = rsqrt(_772);
    float _786 = _698 * _748;
    int _788 = ~_752;
    int _790 = _788 + 1;
    int _792 = _790 + 1;
    float _794 = _514 * 6.283185482025146484375;
    float _796 = float(_714);
    int _798 = _792;
    float _800 = _778;
    if (!_756)
    {
        int _802 = ~_752;
        int _804 = _802 + 1;
        _798 = _804;
    }
    int _806 = _798;
    float _808 = fma(_118, 0.02999999932944774627685546875, _794);
    float _810 = _770 * _796;
    float _812 = abs(_764);
    float _814 = abs(_778);
    float _816 = precise::max(_812, _814);
    float _818 = _808 * 0.15915493667125701904296875;
    float _820 = float(_746);
    float _822 = _640 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _824 = _816 >= 16.0;
    float _826 = _810 * (-2.0);
    float _828 = float(_806);
    float _830 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _832 = _822 + _830;
    float _834 = _824 ? _774 : _764;
    float _836 = fma(_766, _826, _766);
    bool _838 = !_616;
    int _840 = _838 ? 0 : 1;
    float _842 = _832 * _832;
    float _844 = _820 * _828;
    float _846 = _784 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _848 = !_726;
    int _850 = _848 ? as_type<int>(_118) : as_type<int>(_786);
    float _852 = fma(_764, _764, _842);
    float _854 = _844 * (-2.0);
    float _856 = _658 * _658;
    int _858 = abs(_840);
    float _860 = fma(_782, _782, _852);
    float _862 = _514 + (-0.5);
    float _864 = fma(_670, _670, _856);
    float _866 = fma(_750, _854, _750);
    float _868 = _520 + (-0.5);
    float _870 = _862 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _872 = rsqrt(_860);
    float _874 = fma(_696, _696, _864);
    float _876 = float(_858);
    float _878 = _868 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _880 = float(_590);
    int _882 = _850;
    float _884 = _822;
    if (_824)
    {
        float _886 = _778 * 0.0625;
        _800 = _886;
    }
    float _888 = _800;
    float _890 = abs(_834);
    bool _892 = _890 != 0.0;
    bool _894 = isnan(_890);
    bool _896 = _892 || _894;
    bool _898 = isnan(0.0);
    bool _900 = _896 || _898;
    float _902 = _846 * (-0.699999988079071044921875);
    float _904 = fma(as_type<float>(_850), _836, _870);
    float _906 = _876 * _880;
    float _908 = fma(as_type<float>(_850), _866, _878);
    float _910 = abs(_888);
    bool _912 = _910 == 0.0;
    bool _914 = !_900;
    bool _916 = _912 && _914;
    float _918 = in.m_59.x;
    float _920 = in.m_59.y;
    float _922 = in.m_59.z;
    float _924 = _904 * 0.15915493667125701904296875;
    float _926 = _902 * 0.15915493667125701904296875;
    float _928 = _908 * 0.15915493667125701904296875;
    float _930 = _832 * _872;
    float _932 = in.m_61.x;
    float _934 = in.m_61.y;
    float _936 = in.m_61.z;
    float _938 = _764 * _872;
    float _940 = abs(_888);
    bool _942 = _940 == 0.0;
    float _944 = -_930;
    float _946 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _948 = _906 * (-2.0);
    float _950 = -_938;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[18].w, _764);
    float _954 = _528 + (-0.5);
    float _956 = _946 * _946;
    float _958 = _818 * 6.283185482025146484375;
    float _960 = sin(_958);
    float _962 = fma(_754, _948, _754);
    if (_916)
    {
        bool _964 = as_type<int>(_888) >= 0;
        _706 = _964;
    }
    bool _966 = _706;
    float _968 = fma(_952, _952, _956);
    float _970 = _954 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _972 = _782 * _872;
    bool _974 = !_602;
    int _976 = _974 ? 0 : 1;
    float _978 = rsqrt(_874);
    float _980 = fma(as_type<float>(_850), _962, _970);
    float _982 = -_972;
    float _984 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _782);
    if (_916)
    {
        int _986 = _966 ? 0 : 1078530011;
        _882 = _986;
    }
    int _988 = _882;
    bool _990 = !_606;
    int _992 = _990 ? 0 : 1;
    float _994 = fma(_984, _984, _968);
    int _996 = _988;
    if (_916)
    {
        int _998 = int(0x80000000) & as_type<int>(_834);
        int _1000 = _988 | _998;
        _996 = _1000;
    }
    int _1002 = _996;
    float _1004 = _926 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _924 * 6.283185482025146484375;
    float _1010 = sin(_1008);
    float _1012 = _924 * 6.283185482025146484375;
    float _1014 = cos(_1012);
    float _1016 = _928 * 6.283185482025146484375;
    float _1018 = cos(_1016);
    bool _1020 = !_900;
    bool _1022 = _1020 && _942;
    int _1024 = _1002;
    float _1026 = as_type<float>(_1002);
    if (!_1022)
    {
        float _1028 = abs(_834);
        bool _1030 = _1028 != as_type<float>(0x7f800000u /* inf */);
        bool _1032 = isnan(_1028);
        bool _1034 = _1030 || _1032;
        bool _1036 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1038 = _1034 || _1036;
        float _1040 = abs(_888);
        bool _1042 = _1040 == as_type<float>(0x7f800000u /* inf */);
        float _1044 = abs(_888);
        bool _1046 = _1044 == as_type<float>(0x7f800000u /* inf */);
        bool _1048 = !_1038;
        bool _1050 = _1046 && _1048;
        if (_1050)
        {
            bool _1052 = as_type<int>(_888) >= 0;
            _708 = _1052 ? (-1) : 0;
        }
        int _1054 = _708;
        if (_1050)
        {
            _1024 = 1075235812;
        }
        int _1056 = _1024;
        int _1058 = _1056;
        if (_1050)
        {
            int _1060 = ~_1054;
            int _1062 = (_1060 != 0) ? _1056 : 1061752795;
            _1058 = _1062;
        }
        int _1064 = _1058;
        float _1066 = as_type<float>(_1064);
        if (_1050)
        {
            int _1068 = int(0x80000000) & as_type<int>(_834);
            int _1070 = _1064 | _1068;
            _1066 = as_type<float>(_1070);
        }
        float _1072 = _1066;
        bool _1074 = !_1038;
        bool _1076 = _1074 && _1042;
        _1026 = _1072;
        if (!_1076)
        {
            float _1078 = abs(_888);
            float _1080 = abs(_834);
            float _1082 = precise::max(_1078, _1080);
            float _1084 = abs(_888);
            float _1086 = abs(_834);
            float _1088 = precise::min(_1084, _1086);
            float _1090 = 1.0 / _1082;
            float _1092 = abs(_834);
            float _1094 = abs(_888);
            bool _1096 = _1092 > _1094;
            bool _1098 = as_type<int>(_888) >= 0;
            float _1100 = _1088 * _1090;
            float _1102 = abs(_888);
            float _1104 = abs(_834);
            float _1106 = _1102 + _1104;
            int _1108 = as_type<int>(_834) & int(0x80000000);
            float _1110 = _1100 * _1100;
            bool _1112 = _1106 > as_type<float>(0x7f800000u /* inf */);
            bool _1114 = isnan(_1106);
            bool _1116 = _1112 || _1114;
            bool _1118 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1120 = _1116 || _1118;
            float _1122 = _1110 + 11.33538818359375;
            float _1124 = fma(_1110, _1122, 28.84246826171875);
            float _1126 = fma(_1110, _1124, 19.6966705322265625);
            float _1128 = fma(_1110, -0.82336294651031494140625, -5.674867153167724609375);
            float _1130 = fma(_1110, _1128, -6.565555095672607421875);
            float _1132 = 1.0 / _1126;
            float _1134 = _1110 * _1130;
            float _1136 = _1100 * _1134;
            float _1138 = fma(_1136, _1132, _1100);
            float _1140 = _1138;
            _1026 = _1106;
            if (_1096)
            {
                float _1142 = -_1138;
                float _1144 = _1142 + 1.57079637050628662109375;
                _1140 = _1144;
            }
            float _1146 = _1140;
            int _1148 = as_type<int>(_1146);
            if (!_1098)
            {
                float _1150 = -_1146;
                float _1152 = _1150 + 3.1415927410125732421875;
                _1148 = as_type<int>(_1152);
            }
            int _1154 = _1148;
            if (!_1120)
            {
                int _1156 = _1108 | _1154;
                _1026 = as_type<float>(_1156);
            }
        }
    }
    float _1158 = _1026;
    float _1160 = sqrt(_994);
    float _1162 = -_1158;
    float _1164 = _980 + _1162;
    float _1166 = _492 * _922;
    float _1168 = -_530;
    float _1170 = _1168 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1172 = _488 * _918;
    float _1174 = _1164 * 0.15915493667125701904296875;
    float _1176 = _490 * _920;
    float _1178 = _960 * _1170;
    float _1180 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1182 = _1174 * 6.283185482025146484375;
    float _1184 = cos(_1182);
    float _1186 = _658 * _978;
    float _1188 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _932);
    float _1190 = _670 * _978;
    float _1192 = _872 * _1160;
    float _1194 = _696 * _978;
    float _1196 = _1174 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _1176 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1202 = _1192 * _1180;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _1206 = fma(_1204, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _1208 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _934);
    float _1210 = _1192 * _1200;
    float _1212 = _1166 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1214 = _1010 * _1018;
    float _1216 = _928 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = _1202 * _1188;
    float _1222 = _1186 * _1186;
    float _1224 = _1210 * _1208;
    float _1226 = _1014 * _1018;
    float _1228 = _1184 * _1018;
    float _1230 = fma(_1190, _1190, _1222);
    float _1232 = _1014 * _1184;
    float _1234 = _1010 * _1198;
    float _1236 = _1014 * _1198;
    float _1238 = fma(_1194, _1194, _1230);
    float _1240 = _1198 * _1018;
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _936);
    float _1244 = _1192 * _1212;
    float _1246 = rsqrt(_1238);
    float _1248 = _1010 * _1184;
    float _1250 = -_1224;
    float _1252 = _1218 * _1250;
    float _1254 = _1244 * _1242;
    float _1256 = fma(_1218, _1232, _1234);
    float _1258 = _1226 * _1224;
    float _1260 = fma(_1228, _1220, _1252);
    float _1262 = -_1236;
    float _1264 = fma(_1218, _1248, _1262);
    float _1266 = _926 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = -_1248;
    float _1272 = fma(_1218, _1236, _1270);
    float _1274 = fma(_1256, _1220, _1258);
    float _1276 = fma(_1240, _1254, _1260);
    float _1278 = fma(_1218, _1234, _1232);
    float _1280 = _1206 * _1178;
    float _1282 = _1214 * _1224;
    float _1284 = fma(_1272, _1254, _1274);
    float _1286 = _608 + _1276;
    float _1288 = _1190 * _1246;
    float _1290 = fma(_1264, _1220, _1282);
    float _1292 = _822 + _1284;
    float _1294 = fma(_1190, _1280, _1286);
    float _1296 = _1186 * _1246;
    float _1298 = _1194 * _1246;
    float _1300 = fma(_1278, _1254, _1290);
    float _1302 = -_1268;
    float _1304 = _1302 + 1.0;
    float _1306 = _1288 * _1006;
    float _1308 = _1298 * _1006;
    float _1310 = _1296 * _1006;
    float _1312 = fma(_1186, _1280, _1292);
    float _1314 = _1288 * _1304;
    float _1316 = _1296 * _1304;
    float _1318 = _768 + _1300;
    float _1320 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1322 = _1312 + _1320;
    float _1324 = fma(_1296, _1314, _1308);
    float _1326 = fma(_1296, _1316, _1268);
    float _1328 = -_1308;
    float _1330 = fma(_1296, _1314, _1328);
    float _1332 = fma(_1288, _1314, _1268);
    float _1334 = -_1310;
    float _1336 = fma(_1298, _1314, _1334);
    float _1338 = fma(_1298, _1314, _1310);
    float _1340 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1342 = _1294 + _1340;
    float _1344 = _1326 * _1322;
    float _1346 = fma(_1194, _1280, _1318);
    float _1348 = fma(_1298, _1316, _1306);
    float _1350 = -_1306;
    float _1352 = fma(_1298, _1316, _1350);
    float _1354 = fma(_1324, _1342, _1344);
    float _1356 = _1330 * _1322;
    float _1358 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1360 = _1346 + _1358;
    float _1362 = _1298 * _1298;
    float _1364 = _1348 * _1322;
    float _1366 = fma(_1332, _1342, _1356);
    float _1368 = fma(_1352, _1360, _1354);
    float _1370 = fma(_1304, _1362, _1268);
    float _1372 = fma(_1336, _1342, _1364);
    float _1374 = fma(_1338, _1360, _1366);
    float _1376 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1378 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1380 = fma(_1370, _1360, _1372);
    float _1382 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1376);
    float _1384 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1378);
    float _1386 = _1368 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1388 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1382);
    float _1390 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1384);
    float _1392 = fma(_1374, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1386);
    float _1394 = _1388 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1396 = _1390 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1398 = fma(_1380, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1392);
    float _1400 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1402 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1404 = _1398 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1400);
    float _1408 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1402);
    float _1410 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1406);
    float _1412 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1408);
    float _1414 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1416 = _1412 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1418 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1420 = _1414 + _1418;
    float _1422 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1424 = _1416 + _1422;
    bool _1426 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1428 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(0.5);
    bool _1434 = _1430 || _1432;
    float _1436 = _1420 * _1420;
    float _1438 = fma(_1424, _1424, _1436);
    float _1440 = _1394 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1442 = sqrt(_1438);
    float _1444 = fma(_1396, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1440);
    float _1446 = -_938;
    float _1448 = fma(_1446, (*spvDescriptorSet0.vp_c9)._m0[18].w, _608);
    float _1450 = fma(_1404, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1444);
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1454 = _1442 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1458 = _1450;
    float _1460 = _1416;
    float _1462 = _1404;
    float _1464 = _1442;
    float _1466 = _1452;
    if (!_1454)
    {
        _1456 = _1416;
    }
    float _1468 = _1456;
    float _1470 = _1468;
    if (!_1454)
    {
        _1458 = _1414;
    }
    float _1472 = _1458;
    float _1474 = _1472;
    if (!_1454)
    {
        _1460 = _1452;
    }
    float _1476 = _1460;
    bool _1478 = !_1454;
    float _1480 = _1476;
    if (!_1478)
    {
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1486 = _1442 + _1484;
        float _1488 = _1452 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = rsqrt(_1438);
        float _1492 = _1486 * _1482;
        float _1494 = _1492 * 0.15915493667125701904296875;
        float _1496 = _1494 * 6.283185482025146484375;
        float _1498 = cos(_1496);
        float _1500 = _1494 * 6.283185482025146484375;
        float _1502 = sin(_1500);
        float _1504 = _1498 + (-1.0);
        float _1506 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1508 = fma(_1502, _1488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1510 = fma(_1452, _1498, _1506);
        float _1512 = _1490 * _1508;
        float _1514 = fma(_1424, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1516 = fma(_1420, _1512, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1470 = _1514;
        _1480 = _1510;
        _1474 = _1516;
        _1462 = _1494;
        _1464 = _1506;
    }
    float _1518 = _1470;
    float _1520 = _1480;
    float _1522 = _1474;
    float _1524 = _1462;
    float _1526 = _1464;
    float _1528 = -_938;
    float _1530 = fma(_1528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1518);
    float _1532 = -_930;
    float _1534 = fma(_1532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    float _1536 = -_972;
    float _1538 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1522);
    float _1540 = -_930;
    float _1542 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[18].w, _822);
    float _1544 = -_972;
    float _1546 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[18].w, _768);
    float _1548 = _1534;
    float _1550 = _1530;
    float _1552 = _1538;
    float _1554 = _1524;
    float _1556 = _1520;
    float _1558 = _1526;
    if (!_1434)
    {
        float _1560 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1562 = _1542 + _1560;
        float _1564 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1566 = _1448 + _1564;
        float _1568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1570 = -_608;
        float _1572 = _1570 + _1518;
        float _1574 = _1562 * _1562;
        float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1578 = _1546 + _1576;
        float _1580 = -_822;
        float _1582 = _1580 + _1520;
        float _1584 = -_768;
        float _1586 = _1584 + _1522;
        float _1588 = fma(_1566, _1566, _1574);
        float _1590 = 1.0 / _1192;
        float _1592 = fma(_1578, _1578, _1588);
        float _1594 = sqrt(_1592);
        float _1596 = precise::min(_1594, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1598 = _1596 * _1568;
        float _1600 = _1598 * _1590;
        float _1602 = fma(_1572, _1600, _1448);
        float _1604 = fma(_1582, _1600, _1542);
        float _1606 = fma(_1586, _1600, _1546);
        _1548 = _1604;
        _1550 = _1602;
        _1552 = _1606;
        _1554 = _1568;
        _1556 = _1582;
        _1558 = _1594;
        _1466 = _1574;
    }
    float _1608 = _1548;
    float _1610 = _1550;
    float _1612 = _1552;
    float _1614 = _1554;
    float _1616 = _1556;
    float _1618 = _1558;
    float _1620 = _1466;
    float _1622 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1624 = _1608 + _1622;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1628 = _1610 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1632 = _1612 + _1630;
    float _1634 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1636 = _1624 * _1624;
    float _1638 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1640 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1634);
    float _1642 = fma(_1628, _1628, _1636);
    float _1644 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1638);
    float _1646 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1640);
    float _1648 = fma(_1632, _1632, _1642);
    float _1650 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1644);
    float _1652 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1654 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1656 = rsqrt(_1648);
    float _1658 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1660 = sqrt(_1648);
    float _1662 = _1656 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1664 = _1628 * _1662;
    float _1666 = _1632 * _1662;
    float _1668 = _1664 * _1664;
    float _1670 = _1666 * _1666;
    float _1672 = _1668 + _1670;
    float _1674 = sqrt(_1672);
    bool _1676 = _1674 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1678 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1680 = _1674 + _1678;
    float _1682 = _1642;
    float _1684 = _1618;
    float _1686 = _1680;
    float _1688 = _1614;
    float _1690 = _1620;
    float _1692 = _1662;
    float _1694 = _1672;
    float _1696 = _1668;
    bool _1698 = _1676;
    float _1700 = _1628;
    float _1702 = _1624;
    if (_1676)
    {
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1682 = _1704;
    }
    float _1706 = _1682;
    if (_1676)
    {
        float _1708 = rsqrt(_1672);
        _1684 = _1708;
    }
    float _1710 = _1684;
    float _1712 = _1710;
    if (_1676)
    {
        float _1714 = _1680 * _1706;
        _1686 = _1714;
    }
    float _1716 = _1686;
    if (_1676)
    {
        float _1718 = _1716 * 0.15915493667125701904296875;
        _1688 = _1718;
    }
    float _1720 = _1688;
    float _1722 = _1706;
    float _1724 = _1720;
    if (_1676)
    {
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = sin(_1726);
        _1722 = _1728;
    }
    float _1730 = _1722;
    float _1732 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1734 = precise::max(0.0, _1732);
    float _1736 = _1616;
    if (_1676)
    {
        float _1738 = _1720 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        _1736 = _1740;
    }
    float _1742 = _1736;
    float _1744 = -_1662;
    float _1746 = -_1734;
    float _1748 = fma(_1624, _1744, _1746);
    if (_1676)
    {
        float _1750 = _1748 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _884 = _1750;
    }
    float _1752 = _884;
    float _1754 = _1752;
    if (!_1676)
    {
        _1724 = _1666;
    }
    float _1756 = _1724;
    float _1758 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1760 = _1756;
    if (_1676)
    {
        float _1762 = fma(_1730, _1752, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1690 = _1762;
    }
    float _1764 = _1690;
    float _1766 = floor(_1758);
    float _1768 = _1764;
    float _1770 = _1742;
    if (_1676)
    {
        float _1772 = _1742 + (-1.0);
        _1754 = _1772;
    }
    float _1774 = _1754;
    if (_1676)
    {
        float _1776 = _1710 * _1764;
        _1692 = _1776;
    }
    float _1778 = _1692;
    if (!_1676)
    {
        _1712 = _1664;
    }
    float _1780 = _1712;
    float _1782 = _1780;
    if (_1676)
    {
        float _1784 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1694 = _1784;
    }
    float _1786 = _1694;
    if (_1676)
    {
        float _1788 = _1664 * _1778;
        _1782 = _1788;
    }
    float _1790 = _1782;
    if (!_1676)
    {
        _1768 = _1748;
    }
    float _1792 = _1768;
    float _1794 = _1792;
    if (_1676)
    {
        float _1796 = _1666 * _1778;
        _1760 = _1796;
    }
    float _1798 = _1760;
    if (_1676)
    {
        float _1800 = fma(_1748, _1742, _1786);
        _1794 = _1800;
    }
    float _1802 = _1794;
    if (_1676)
    {
        float _1804 = _1790 * _1790;
        _1696 = _1804;
    }
    float _1806 = _1696;
    float _1808 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (!_1676)
    {
        _1770 = _1670;
    }
    float _1810 = _1770;
    float _1812 = _1810;
    if (_1676)
    {
        float _1814 = _1798 * _1798;
        _1812 = _1814;
    }
    float _1816 = _1812;
    float _1818 = fma(_1802, _1802, _1806);
    float _1820 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1822 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1824 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1808);
    float _1826 = _1818 + _1816;
    float _1828 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1822);
    float _1830 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1824);
    float _1832 = floor(_1820);
    float _1834 = _1654 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1836 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1828);
    float _1838 = _1830 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1840 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1842 = fma(_1660, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1840);
    float _1844 = precise::clamp(_1842, 0.0, 1.0);
    float _1846 = -_1834;
    float _1848 = fma(_1846, _1652, 1.0);
    float _1850 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1852 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1854 = rsqrt(_1826);
    float _1856 = -_1844;
    float _1858 = _1856 + 1.0;
    float _1860 = -_1766;
    float _1862 = _1758 + _1860;
    float _1864 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1852);
    float _1866 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1868 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1864);
    float _1870 = abs(_1858);
    float _1872 = log2(_1870);
    float _1874 = -_1832;
    float _1876 = _1820 + _1874;
    float _1878 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1866);
    float _1880 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1878);
    float _1882 = _1854 * _1790;
    float _1884 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1868);
    float _1886 = _1854 * _1802;
    float _1888 = _1854 * _1798;
    float _1890 = _1882 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1892 = log2(_1848);
    float _1894 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1880);
    float _1896 = -_1890;
    float _1898 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1896);
    float _1900 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1902 = -_1888;
    float _1904 = fma(_1902, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1898);
    float _1906 = 1.0 / _1884;
    float _1908 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1910 = fma(_1904, -0.5, 0.5);
    float _1912 = fma(_1904, 0.5, 0.5);
    float _1914 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1908);
    float _1916 = _1886 + 1.0;
    float _1918 = exp2(_1900);
    float _1920 = fma(_1912, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1922 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1914);
    float _1924 = _1892 * 0.693147182464599609375;
    float _1926 = fma(_1912, _1920, -0.212114393711090087890625);
    float _1928 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1922);
    float _1930 = _1924 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1932 = sqrt(_1910);
    float _1934 = fma(_1912, _1926, 1.570728778839111328125);
    float _1936 = _1894 * _1906;
    float2 _6544 = float2(_1862, _1876);
    float _1938 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6544, float2(0.0), isnan(_6544)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6544, float2(0.0), isnan(_6544)), level(0.0)).x;
    float _1940 = fma(_1936, 0.5, 0.5);
    float _1942 = -_1886;
    float _1944 = fma(_1918, _1916, _1942);
    float _1946 = _1928 * _1906;
    float _1948 = fma(_1946, -0.5, 0.5);
    float _1950 = _1932 * 0.636619746685028076171875;
    float _1952 = -_1934;
    float _1954 = fma(_1950, _1952, 1.0);
    float _1956 = fma(_1944, 0.5, 0.5);
    float3 _6578 = float3(_1940, _1948, _1930);
    float _1958 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6578, float3(0.0), isnan(_6578)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6578, float3(0.0), isnan(_6578)), level(0.0)).x;
    float3 _6589 = float3(_1940, _1948, _1930);
    float4 _1961 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6589, float3(0.0), isnan(_6589)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6589, float3(0.0), isnan(_6589)), level(0.0)).xyzw;
    float _1963 = _1961.x;
    float _1965 = _1961.y;
    float _1967 = _1961.z;
    float _1969 = _1961.w;
    float2 _6605 = float2(_1954, _1956);
    float3 _1973 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6605, float2(0.0), isnan(_6605)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6605, float2(0.0), isnan(_6605)), level(0.0)).xyz;
    float _1975 = _1973.x;
    float _1977 = _1973.y;
    float _1979 = _1973.z;
    float _1981 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1983 = int(_1981);
    float _1985 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1987 = int(_1985);
    float _1989 = in.m_57.x;
    int _1991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1993 = _1991 != 0;
    float _1995 = -_530;
    float _1997 = _1995 + 1.0;
    int _1999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2001 = _1999 != 0;
    float _2003 = in.m_63.w;
    bool _2005 = _520 > 0.5;
    float _2007 = _1838 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2009 = float(_1983);
    out.m_65.x = _1628;
    out.m_65.y = _1624;
    out.m_65.z = _1632;
    bool _2011 = _528 > 0.5;
    float _2013 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2007);
    float _2015 = 1.0 / _2009;
    float _2017 = _1930;
    float _2019 = _1884;
    float _2021 = _1928;
    if (_1993)
    {
        bool _2023 = _514 > 0.5;
        _1698 = _2023;
    }
    bool _2025 = _1698;
    float _2027 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2013);
    float _2029 = float(uint(_1987));
    float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2033 = _2031 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2037 = _2035 != 0;
    float _2039 = 1.0 / _2029;
    int _2041 = ~_1987;
    int _2043 = _2041 + 1;
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2047 = _118 * _2015;
    out.m_67.w = _2003;
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2051 = _2049 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2053 = 1.0 / _2033;
    int _2055 = abs(_630);
    float _2057 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2059 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2057;
    int _2061 = as_type<int>(_2039) + (-2);
    float _2063 = trunc(_2047);
    int _2065 = int(_2063);
    float _2067 = _2039;
    if (!_1993)
    {
        _2067 = _1989;
    }
    float _2069 = _2067;
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2073 = _2071 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2075 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2075;
    float _2079 = _2069;
    if (!_1993)
    {
        _2017 = _2069;
    }
    float _2081 = _2017;
    float _2083 = _2081;
    if (_1993)
    {
        _2079 = _1989;
    }
    float _2085 = _2079;
    float _2087 = 1.0 / _2051;
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2091 = _2089 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _2093 = 0.0;
    if (!_2001)
    {
        _2093 = _2085;
    }
    float _2095 = _2093;
    int _2097 = 0;
    float _2099 = _2095;
    if (_2001)
    {
        float _2101 = -_2085;
        float _2103 = _2101 + 1.0;
        _2097 = as_type<int>(_2103);
    }
    int _2105 = _2097;
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2109 = _2107 != 0;
    float _2111 = _2059 * _2053;
    int _2113 = _2011 ? as_type<int>(_1997) : as_type<int>(_530);
    float _2115 = 1.0 / _2091;
    float _2117 = float(uint(_2065));
    if (_2001)
    {
        float _2119 = _2005 ? as_type<float>(_2105) : _2085;
        _2099 = _2119;
    }
    float _2121 = _2099;
    int _2123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2125 = _2123 != 0;
    float _2127 = as_type<float>(_2061) * _2117;
    bool _2129 = !_2109;
    float _2131 = _2129 ? 1.2345600128173828125 : 1.0;
    float _2133 = _2073 * _2087;
    float _2135 = _2125 ? as_type<float>(_2113) : _530;
    float _2137 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2141 = _2139 != 0;
    float _2143 = fma(_2121, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    bool _2145 = !_2109;
    float _2147 = _2145 ? _528 : _514;
    int _2149 = abs(_992);
    float _2151 = trunc(_2127);
    float _2153 = precise::max(_2151, 0.0);
    uint _2156 = uint(_2153);
    float _2158 = _2147 * _2131;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2162 = float(_1987);
    float _2164 = floor(_2158);
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2168 = _2043 * int(_2156);
    int _2170 = _2168 + _2065;
    float _2172 = float(uint(_2170));
    float _2174 = as_type<float>(_2061) * _2172;
    float _2176 = in.m_55.w;
    float _2178 = trunc(_2174);
    float _2180 = precise::max(_2178, 0.0);
    uint _2182 = uint(_2180);
    int _2184 = int(_2156) + int(_2182);
    int _2186 = int(_2156);
    float _2188 = as_type<float>(_2184);
    if (_1993)
    {
        float _2190 = -_2085;
        float _2192 = _2190 + 1.0;
        _2186 = as_type<int>(_2192);
    }
    int _2194 = _2186;
    int _2196 = ~_1987;
    int _2198 = _2196 + 1;
    if (_1993)
    {
        float _2200 = _2025 ? as_type<float>(_2194) : _2085;
        _2083 = _2200;
    }
    float _2202 = _2083;
    int _2204 = _2198 * _2184;
    int _2206 = _2204 + _2065;
    int _2208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2210 = _2208 != 0;
    float _2212 = _514 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2214 = uint(_2206) >= uint(_1987);
    int _2216 = _2005 ? as_type<int>(_1997) : as_type<int>(_530);
    bool _2218 = !_2214;
    int _2220 = _2218 ? 0 : (-1);
    int _2222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2224 = _2222 != 0;
    int _2226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2228 = _2226 != 0;
    float _2230 = _2224 ? as_type<float>(_2216) : _530;
    bool _2232 = _2176 > 0.5;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2236 = _528 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2238 = _2232 ? as_type<int>(_1997) : as_type<int>(_530);
    float _2240 = -_2234;
    float _2242 = fma(_2212, 2.0, _2240);
    bool _2244 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2246 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan(0.5);
    bool _2252 = _2248 || _2250;
    float _2254 = fma(_2236, -2.0, _2045);
    float _2256 = -_118;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2242);
    float _2260 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2262 = _2141 ? as_type<float>(_2238) : _530;
    float _2264 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2266 = ~_2184;
    int _2268 = _2266 + _2220;
    int _2270 = _2268 + 1;
    float _2272 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2274 = _2260 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2276 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2278 = _1987 == 0;
    float _2280 = _2272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_2109)
    {
        _2188 = _528;
    }
    float _2282 = _2188;
    float _2284 = fma(_2262, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _2286 = _2282;
    if (_2109)
    {
        _2286 = _514;
    }
    float _2288 = _2286;
    out.m_69.x = _2274;
    out.m_69.y = _2276;
    out.m_69.z = _2280;
    out.m_69.w = _2160;
    if (_2252)
    {
        _1700 = 1.0;
    }
    float _2290 = _1700;
    float _2292 = _2290;
    if (_2252)
    {
        _1702 = 1.0;
    }
    float _2294 = _1702;
    float _2296 = _118 * _2162;
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2300 = _512 + _2298;
    float _2302 = _2077 * _2115;
    float _2304 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2306 = _512 + _2304;
    float _2308 = _2296 * _162;
    float _2310 = fma(_2111, _2300, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2312 = float(_2065);
    float _2314 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2316 = _2137 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2318 = -_2164;
    float _2320 = _2158 + _2318;
    bool _2322 = _2312 >= _2162;
    bool _2324 = isnan(_2312);
    bool _2326 = _2322 || _2324;
    bool _2328 = isnan(_2162);
    bool _2330 = _2326 || _2328;
    float _2332 = float(_2330);
    float _2334 = fma(_2302, _2306, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2338 = _512 + _2336;
    float _2340 = trunc(_2332);
    int _2342 = int(_2340);
    float _2344 = fma(_2316, _2135, -0.5);
    float _2346 = fma(_2133, _2338, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2350 = _1987 * _2270;
    int _2352 = _2350 + _2065;
    float _2354 = _2320 * _2162;
    bool _2356 = !_2210;
    int _2358 = _2356 ? 0 : 1;
    float _2360 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2348);
    float _2362 = _2314 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2364 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2366 = !_2278;
    int _2368 = _2366 ? _2352 : (-1);
    float _2370 = trunc(_2354);
    int _2372 = int(_2370);
    bool _2374 = _934 != 0.0;
    bool _2376 = isnan(_934);
    bool _2378 = _2374 || _2376;
    bool _2380 = isnan(0.0);
    bool _2382 = _2378 || _2380;
    float _2384 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2364);
    float _2386 = fma(_2230, _2362, -0.5);
    float _2388 = in.m_71.x;
    float _2390 = in.m_71.y;
    float _2392 = in.m_71.z;
    int _2394 = ~_2342;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    bool _2400 = _932 == 0.0;
    bool _2402 = !_2382;
    bool _2404 = _2400 && _2402;
    float _2406 = trunc(_2308);
    int _2408 = int(_2406);
    int _2410 = abs(_626);
    int _2412 = _2368 * _2398;
    int _2414 = _1987 + (-1);
    int _2416 = abs(_2358);
    bool _2418 = _936 == 0.0;
    bool _2420 = _2418 && _2404;
    int _2422 = _2342 * _2414;
    int _2424 = _2422 + _2412;
    bool _2426 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2428 = isnan(_512);
    bool _2430 = _2426 || _2428;
    bool _2432 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2434 = _2430 || _2432;
    float _2436 = float(_2434);
    int _2438 = _2424 * _2410;
    bool _2440 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2442 = isnan(_512);
    bool _2444 = _2440 || _2442;
    bool _2446 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2448 = _2444 || _2446;
    float _2450 = float(_2448);
    float _2452 = -_2436;
    float _2454 = _2452 + 1.0;
    int _2456 = _2372 * _2416;
    int _2458 = _2456 + _2065;
    bool _2460 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2462 = isnan(_512);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2468 = _2464 || _2466;
    float _2470 = float(_2468);
    int _2472 = _2408 * _2055;
    int _2474 = _2472 + _2438;
    float _2476 = _2450 * _2454;
    float _2478 = -_2450;
    float _2480 = _2478 + 1.0;
    float _2482 = _2388;
    float _2484 = _2392;
    float _2486 = _2390;
    int _2488 = _2474;
    float _2490 = _2294;
    if (!_2420)
    {
        float _2492 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2388);
        _2482 = _2492;
    }
    float _2494 = _2482;
    int _2496 = abs(_976);
    float _2498 = as_type<float>(_2496);
    if (!_2420)
    {
        float _2500 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2392);
        _2484 = _2500;
    }
    float _2502 = _2484;
    bool _2504 = _512 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2506 = isnan(_512);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2512 = _2508 || _2510;
    float _2514 = float(_2512);
    float _2516 = _2470 * _2480;
    float _2518 = -_2470;
    float _2520 = _2518 + 1.0;
    if (!_2420)
    {
        float _2522 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2390);
        _2486 = _2522;
    }
    float _2524 = _2486;
    int _2526 = _2458 * _2496;
    int _2528 = _2526 + _2474;
    if (_2109)
    {
        _2498 = _514;
    }
    float _2530 = _2498;
    float _2532 = _2514 * _2520;
    float _2534 = _2530;
    float _2536 = _2532;
    if (!_2109)
    {
        _2534 = _520;
    }
    float _2538 = _2534;
    float _2540 = -_2514;
    float _2542 = _2540 + 1.0;
    float _2544 = _2310 * _2532;
    int _2546 = _2372 * _2149;
    int _2548 = _2546 + _2528;
    float _2550 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2254);
    float _2552 = _2538 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2554 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2360);
    float _2556 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2558 = float(uint(_2548));
    float _2560 = -_2550;
    float _2562 = fma(_2554, _2344, _2560);
    int _2564 = ~_1987;
    int _2566 = _2564 + 1;
    float _2568 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2570 = _2288 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2572 = as_type<float>(_2061) * _2558;
    float _2574 = _2542;
    float _2576 = as_type<float>(_2566);
    if (_2228)
    {
        float _2578 = -_2085;
        float _2580 = _2578 + 1.0;
        _2488 = as_type<int>(_2580);
    }
    int _2582 = _2488;
    float _2584 = fma(_2288, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2568);
    float _2586 = -_2556;
    float _2588 = fma(_2570, 2.0, _2586);
    float _2590 = fma(_2542, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2544);
    float _2592 = trunc(_2572);
    float _2594 = precise::max(_2592, 0.0);
    uint _2596 = uint(_2594);
    float _2598 = -_118;
    float _2600 = fma(_2598, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2588);
    if (!_2228)
    {
        _2536 = _2085;
    }
    float _2602 = _2536;
    float _2604 = fma(_2346, _2516, _2590);
    float _2606 = _2602;
    if (_2228)
    {
        float _2608 = _2011 ? as_type<float>(_2582) : _2085;
        _2606 = _2608;
    }
    float _2610 = _2606;
    float _2612 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_2109)
    {
        _2574 = _520;
    }
    float _2614 = _2574;
    float _2616 = fma(_2334, _2476, _2604);
    float _2618 = -_2612;
    float _2620 = fma(_2552, 2.0, _2618);
    float _2622 = _2614;
    if (_2109)
    {
        _2622 = _528;
    }
    float _2624 = _2622;
    float _2626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2628 = ~_1987;
    int _2630 = _2628 + 1;
    float _2632 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2634 = ~_1987;
    int _2636 = _2634 + 1;
    int _2638 = _2566 * int(_2596);
    int _2640 = _2638 + _2548;
    if (!_2109)
    {
        _2576 = _520;
    }
    float _2642 = _2576;
    float _2644 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2646 = _2642;
    if (_2109)
    {
        _2646 = _528;
    }
    float _2648 = _2646;
    float _2650 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2632);
    float _2652 = float(uint(_2640));
    float _2654 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2644);
    float _2656 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2166);
    if (!_2109)
    {
        _584 = _514;
    }
    float _2658 = _584;
    float _2660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2662 = as_type<float>(_2061) * _2652;
    float _2664 = float(uint(_2458));
    float _2666 = _2626 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2668 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2654);
    float _2670 = -_118;
    float _2672 = fma(_2670, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2620);
    float _2674 = as_type<float>(_2061) * _2664;
    float _2676 = trunc(_2662);
    float _2678 = precise::max(_2676, 0.0);
    uint _2680 = uint(_2678);
    float _2682 = fma(_2666, _2202, -0.5);
    float _2684 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2686 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2688 = _2648 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2690 = fma(_2436, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2616);
    float _2692 = _2562 + 0.5;
    float _2694 = -_2524;
    float _2696 = _1218 * _2694;
    float _2698 = trunc(_2674);
    float _2700 = precise::max(_2698, 0.0);
    uint _2702 = uint(_2700);
    float _2704 = _2660 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2706 = fma(_2688, -2.0, _2686);
    float _2708 = _1226 * _2524;
    float _2710 = _1214 * _2524;
    float _2712 = fma(_2704, _2610, -0.5);
    float _2714 = fma(_2668, _2682, _2258);
    float _2716 = _1542 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _2718 = int(_2596) + int(_2680);
    float _2720 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2684);
    float _2722 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2584);
    float _2724 = fma(_1448, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2716);
    float _2726 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2706);
    int _2728 = _2630 * _2718;
    int _2730 = _2728 + _2548;
    float _2732 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2720);
    float _2734 = fma(_2722, _2143, _2600);
    int _2736 = _2636 * int(_2702);
    int _2738 = _2736 + _2458;
    float _2740 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2656);
    bool _2742 = uint(_2730) >= uint(_1987);
    float _2744 = _2732 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2746 = fma(_2740, _2712, _2672);
    bool _2748 = !_2742;
    int _2750 = _2748 ? 0 : (-1);
    float _2752 = _2658 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2754 = float(uint(_2738));
    float _2756 = fma(_1228, _2494, _2696);
    int _2758 = ~_2718;
    int _2760 = _2758 + _2750;
    int _2762 = _2760 + 1;
    float _2764 = fma(_1256, _2494, _2708);
    float _2766 = 1.0 / _2744;
    float _2768 = as_type<float>(_2061) * _2754;
    float _2770 = fma(_1546, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2724);
    int _2772 = _1987 * _2762;
    int _2774 = _2772 + _2548;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2778 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2650);
    float _2780 = _2770 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2782 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2384);
    float _2784 = fma(_2752, -2.0, _2776);
    bool _2786 = !_2278;
    int _2788 = _2786 ? _2774 : (-1);
    float _2790 = trunc(_2768);
    float _2792 = precise::max(_2790, 0.0);
    uint _2794 = uint(_2792);
    float _2796 = -_2726;
    float _2798 = fma(_2778, _2284, _2796);
    float _2800 = _2780 + _2744;
    int _2802 = _2788 >> 31;
    float _2804 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2784);
    float _2806 = _2800 * _2766;
    float _2808 = _2806 * 0.5;
    int _2810 = _2802 & 3;
    float _2812 = -_2804;
    float _2814 = fma(_2782, _2386, _2812);
    float _2816 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2818 = fma(_2808, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2816);
    int _2820 = _2788 + _2810;
    float _2822 = fma(_1264, _2494, _2710);
    float _2824 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2826 = _2820 >> 2;
    float _2828 = 1.0 / _2818;
    int _2830 = int(_2702) + int(_2794);
    float _2832 = _2824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2834 = ~_1987;
    int _2836 = _2834 + 1;
    int _2838 = _2826 << 4;
    int _2840 = _2838 + 512;
    float _2842 = _2714 + 0.5;
    float _2844 = _2734 + 0.5;
    float _2846 = _2798 + 0.5;
    int _2848 = _2836 * _2830;
    int _2850 = _2848 + _2458;
    uint _2852 = uint(int(uint(_2840) >> uint(2)));
    uint _2854 = uint(int(uint(int(_2852)) >> uint(2)));
    int _2856 = int(_2852) & 3;
    float _2858 = (*spvDescriptorSet0.vp_c9)._m0[int(_2854)][_2856];
    int _2860 = int(_2852) + 1;
    uint _2862 = uint(int(uint(_2860) >> uint(2)));
    int _2864 = _2860 & 3;
    float _2866 = (*spvDescriptorSet0.vp_c9)._m0[int(_2862)][_2864];
    int _2868 = _2788 & 3;
    bool _2870 = _2868 != 0;
    out.m_73.x = _2842;
    out.m_73.y = _2692;
    out.m_73.z = _2844;
    out.m_73.w = _2846;
    bool _2872 = uint(_2850) >= uint(_1987);
    float _2874 = _2814 + 0.5;
    bool _2876 = !_2872;
    int _2878 = _2876 ? 0 : (-1);
    int _2880 = _2788 & 3;
    bool _2882 = _2880 != 0;
    float _2884 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _2886 = ~_2830;
    int _2888 = _2886 + _2878;
    int _2890 = _2888 + 1;
    float _2892 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2894 = _2828 * _2892;
    int _2896 = _2840 + 8;
    uint _2898 = uint(int(uint(_2896) >> uint(2)));
    uint _2900 = uint(int(uint(int(_2898)) >> uint(2)));
    int _2902 = int(_2898) & 3;
    float _2904 = (*spvDescriptorSet0.vp_c9)._m0[int(_2900)][_2902];
    int _2906 = int(_2898) + 1;
    uint _2908 = uint(int(uint(_2906) >> uint(2)));
    int _2910 = _2906 & 3;
    float _2912 = (*spvDescriptorSet0.vp_c9)._m0[int(_2908)][_2910];
    bool _2914 = uint(_2868) > 1u;
    float _2916 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2918 = abs(_2894);
    float _2920 = log2(_2918);
    float _2922 = _2884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2924 = _2690 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2926 = _2916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2928 = _2882 ? 0 : 1;
    float _2930 = _2746 + 0.5;
    bool _2932 = uint(_2868) >= 2u;
    int _2934 = _1987 * _2890;
    int _2936 = _2934 + _2458;
    out.m_75.x = _2832;
    out.m_75.y = _2922;
    out.m_75.z = _2926;
    out.m_75.w = _2924;
    int _2938 = ~_2928;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    int _2944 = _2942;
    float _2946 = _2894;
    if (!_2914)
    {
        int _2948 = ~_2928;
        int _2950 = _2948 + 1;
        _2944 = _2950;
    }
    int _2952 = _2944;
    out.m_77.x = _2930;
    out.m_77.y = _2874;
    bool _2954 = _2868 != 3;
    bool _2956 = !_2870;
    int _2958 = _2956 ? 0 : 1;
    bool _2960 = _2868 != 3;
    int _2962 = _2932 ? 0 : 1;
    int _2964 = abs(_2952);
    float _2966 = _2920 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2968 = abs(_2958);
    float _2970 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2972 = !_2960;
    int _2974 = _2972 ? 0 : (-1);
    float _2976 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2027);
    int _2978 = ~_2962;
    int _2980 = _2978 + 1;
    int _2982 = _2980 + 1;
    float _2984 = exp2(_2966);
    int _2986 = ~_2964;
    int _2988 = _2986 + 1;
    int _2990 = _2988 + 1;
    int _2992 = _2982;
    float _2994 = _2976;
    if (_2954)
    {
        int _2996 = ~_2962;
        int _2998 = _2996 + 1;
        _2992 = _2998;
    }
    int _3000 = _2992;
    int _3002 = _2990 * as_type<int>(_2866);
    bool _3004 = !_2037;
    int _3006 = _3004 ? 0 : 1;
    float _3008 = exp2(_2970);
    int _3010 = abs(_2974);
    float _3012 = fma(_1240, _2502, _2756);
    float _3014 = fma(_1272, _2502, _2764);
    int _3016 = ~_2968;
    int _3018 = _3016 + 1;
    int _3020 = _3018 + 1;
    float _3022 = fma(_1278, _2502, _2822);
    int _3024 = abs(_3006);
    float _3026 = fma(_2984, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3028 = precise::clamp(_3026, 0.0, 1.0);
    int _3030 = _3020 * as_type<int>(_2858);
    int _3032 = _3030 + _3002;
    int _3034 = abs(_3000);
    int _3036 = ~_3010;
    int _3038 = _3036 + 1;
    int _3040 = _3038 + 1;
    float _3042 = fma(_3028, -2.0, 3.0);
    float _3044 = _3028 * _3028;
    int _3046 = ~_3034;
    int _3048 = _3046 + 1;
    int _3050 = _3048 + 1;
    int _3052 = ~_3024;
    int _3054 = _3052 + 1;
    int _3056 = _3054 + 1;
    float _3058 = _3044 * _3042;
    bool _3060 = !_2278;
    int _3062 = _3060 ? _2936 : (-1);
    float _3064 = in.m_79.x;
    int _3066 = _3050 * as_type<int>(_2904);
    int _3068 = _3066 + _3032;
    float _3070 = -_3058;
    float _3072 = _3070 + 1.0;
    int _3074 = _3040 * as_type<int>(_2912);
    int _3076 = _3074 + _3068;
    float _3078 = fma(_3072, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3058);
    float _3080 = _2976 + _1884;
    int _3082 = _3076 * _3056;
    bool _3084 = _2894 <= 8000.0;
    bool _3086 = isnan(_2894);
    bool _3088 = _3084 || _3086;
    bool _3090 = isnan(8000.0);
    bool _3092 = _3088 || _3090;
    float _3094 = float(_3092);
    float _3096 = _3080 * 0.5;
    int _3098 = _3062 * _3024;
    int _3100 = _3098 + _3082;
    float _3102 = _1884 * 0.5;
    float _3104 = _3094 * _3078;
    float _3106 = _1894 + _1884;
    float _3108 = float(_3100);
    float _3110 = fma(_1928, -0.5, _3102);
    float _3112 = _3106 * 0.5;
    if (!_2252)
    {
        float _3114 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3116 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3118 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3116;
        float _3120 = _3114 * 0.15915493667125701904296875;
        float _3122 = _3120 * 6.283185482025146484375;
        float _3124 = cos(_3122);
        float _3126 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3128 = _3126 * 0.15915493667125701904296875;
        float _3130 = _3120 * 6.283185482025146484375;
        float _3132 = sin(_3130);
        float _3134 = 1.0 / _3124;
        float _3136 = _3128 * 6.283185482025146484375;
        float _3138 = cos(_3136);
        float _3140 = _3132 * _3134;
        float _3142 = _3128 * 6.283185482025146484375;
        float _3144 = sin(_3142);
        float _3146 = _3138 * _3140;
        float _3148 = 1.0 / _3118;
        float _3150 = 1.0 / _3146;
        float _3152 = _3144 * _3150;
        float _3154 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3156 = fma(_2894, _3152, _3154);
        float _3158 = _3156 * _3148;
        float _3160 = precise::clamp(_3158, 0.0, 1.0);
        _2490 = _3160;
    }
    float _3162 = _2490;
    if (!_2252)
    {
        float _3164 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3166 = _3164 * 0.15915493667125701904296875;
        float _3168 = _3166 * 6.283185482025146484375;
        float _3170 = cos(_3168);
        float _3172 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3174 = _3172 * 0.15915493667125701904296875;
        float _3176 = _3166 * 6.283185482025146484375;
        float _3178 = sin(_3176);
        float _3180 = 1.0 / _3170;
        float _3182 = _3174 * 6.283185482025146484375;
        float _3184 = cos(_3182);
        float _3186 = _3178 * _3180;
        float _3188 = _3174 * 6.283185482025146484375;
        float _3190 = sin(_3188);
        float _3192 = _3184 * _3186;
        float _3194 = 1.0 / _3192;
        float _3196 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3198 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3196;
        float _3200 = 1.0 / _3198;
        float _3202 = _3190 * _3194;
        float _3204 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3206 = fma(_2894, _3202, _3204);
        float _3208 = _3206 * _3200;
        float _3210 = precise::clamp(_3208, 0.0, 1.0);
        float _3212 = -_3210;
        float _3214 = _3212 + 1.0;
        _2292 = _3214;
        _2946 = _3210;
    }
    float _3216 = _2292;
    float _3218 = _2946;
    float _3220 = _3104 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3222 = -_3008;
    float _3224 = _3222 + 1.0;
    float _3226 = -_1938;
    float _3228 = _3226 + 1.0;
    out.m_81.y = _3108;
    float _3230 = _3224 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3232 = _3228 * _3220;
    float _3234 = precise::clamp(_3232, 0.0, 1.0);
    bool _3236 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3238 = isnan(_1660);
    bool _3240 = _3236 || _3238;
    bool _3242 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3244 = _3240 || _3242;
    out.m_83.x = _3012;
    out.m_83.y = _3014;
    out.m_83.z = _3022;
    float _3246 = _3230 * _1958;
    float _3248 = -_3234;
    float _3250 = fma(_3248, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3252 = -_3230;
    float _3254 = _3252 + 1.0;
    out.gl_Position.x = _1894;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _2976;
    out.gl_Position.w = _1884;
    float _3256 = _1969 * _3246;
    float _3258 = _3250 * _3064;
    float _3260 = _1979 * _3246;
    float _3262 = _1969 * _3254;
    float _3264 = fma(_1975, _3256, _1963);
    float _3266 = fma(_1977, _3256, _1965);
    float _3268 = _3258 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3270 = fma(_1969, _3260, _1967);
    out.m_85.x = _3112;
    out.m_85.y = _3110;
    out.m_85.z = _3096;
    out.m_85.w = _1884;
    float _3272 = _3218;
    float _3274 = _3256;
    if (!_3244)
    {
        _3272 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3276 = _3272;
    float _3278 = _3276;
    float _3280 = _3276;
    if (!_3244)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3282 = _3274;
    out.m_87.x = _3268;
    float _3284 = _3162 * _3216;
    float _3286 = _3284;
    float _3288 = _3282;
    float _3290 = _3282;
    if (!_3244)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3292 = _2019;
    out.m_89.x = _3264;
    out.m_89.y = _3266;
    out.m_89.z = _3270;
    out.m_89.w = _3262;
    float _3294 = _3292;
    float _3296 = _3292;
    if (!_3244)
    {
        _2994 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3298 = _2994;
    float _3300 = _3298;
    float _3302 = _3298;
    if (!_3244)
    {
        _2021 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3304 = _2021;
    float _3306 = _3284 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3308 = _3304;
    float _3310 = _3304;
    if (!_3244)
    {
        _3286 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3312 = _3286;
    bool _3314 = !_3244;
    float _3316 = _3312;
    float _3318 = _3312;
    if (!_3314)
    {
        bool _3320 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3322 = isnan(_1660);
        bool _3324 = _3320 || _3322;
        bool _3326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3328 = _3324 || _3326;
        if (!_3328)
        {
            float _3330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3332 = _1660 + _3330;
            float _3334 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3336 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3334;
            float _3338 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3340 = _3338 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3342 = 1.0 / _3336;
            float _3344 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3346 = _3344 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3348 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3350 = _3348 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3352 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3354 = _3352 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3356 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3358 = _3356 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3360 = _3332 * _3342;
            float _3362 = precise::clamp(_3360, 0.0, 1.0);
            float _3364 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3366 = _3364 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3368 = fma(_3362, _3340, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3370 = fma(_3362, _3366, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3372 = fma(_3362, _3346, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3374 = fma(_3362, _3350, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3376 = fma(_3362, _3354, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3378 = fma(_3362, _3358, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3290 = _3372;
            _3310 = _3376;
            _3280 = _3368;
            _3302 = _3374;
            _3296 = _3370;
            _3318 = _3378;
            _3380 = true;
        }
        else
        {
            bool _3382 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3384 = isnan(_1660);
            bool _3386 = _3382 || _3384;
            bool _3388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3390 = _3386 || _3388;
            if (!_3390)
            {
                _3278 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3392 = _3278;
            _3280 = _3392;
            if (!_3390)
            {
                _3288 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3394 = _3288;
            _3290 = _3394;
            if (!_3390)
            {
                _3294 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3396 = _3294;
            _3296 = _3396;
            if (!_3390)
            {
                _3300 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3398 = _3300;
            _3302 = _3398;
            if (!_3390)
            {
                _3308 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3400 = _3308;
            _3310 = _3400;
            if (!_3390)
            {
                _3316 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3402 = _3316;
            bool _3404 = !_3390;
            _3318 = _3402;
            if (!_3404)
            {
                bool _3406 = _1660 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3408 = isnan(_1660);
                bool _3410 = _3406 || _3408;
                bool _3412 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3414 = _3410 || _3412;
                if (!_3414)
                {
                    float _3416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3418 = _1660 + _3416;
                    float _3420 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3422 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3420;
                    float _3424 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3426 = _3424 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3428 = 1.0 / _3422;
                    float _3430 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3432 = _3430 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3434 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3436 = _3434 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3438 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3440 = _3438 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3442 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3444 = _3442 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3446 = _3418 * _3428;
                    float _3448 = precise::clamp(_3446, 0.0, 1.0);
                    float _3450 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3452 = _3450 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3454 = fma(_3448, _3426, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3456 = fma(_3448, _3452, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3458 = fma(_3448, _3432, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3460 = fma(_3448, _3436, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3462 = fma(_3448, _3440, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3464 = fma(_3448, _3444, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3290 = _3458;
                    _3310 = _3462;
                    _3280 = _3454;
                    _3302 = _3460;
                    _3296 = _3456;
                    _3318 = _3464;
                    _3380 = true;
                }
                else
                {
                    _3290 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3310 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3280 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3302 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3296 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3318 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3380 = false;
    float _3466 = _3290;
    float _3468 = _3310;
    float _3470 = _3280;
    float _3472 = _3302;
    float _3474 = _3296;
    float _3476 = _3318;
    float _3478 = fma(_3014, -0.5, 0.5);
    float _3480 = precise::clamp(_3478, 0.0, 1.0);
    float _3482 = -_3466;
    float _3484 = _3482 + _3468;
    float _3486 = _3306 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3488 = -_3470;
    float _3490 = _3488 + _3472;
    float _3492 = fma(_3480, _3484, _3466);
    out.m_91.x = 0.0;
    float _3494 = -_3474;
    float _3496 = _3494 + _3476;
    float _3498 = fma(_3480, _3490, _3470);
    float _3500 = _3492 * 0.586610972881317138671875;
    out.m_53.x = _3486;
    bool _3502 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3504 = fma(_3480, _3496, _3474);
    float _3506 = fma(_3498, 0.298911988735198974609375, _3500);
    bool _3508 = _3162 > 0.0;
    bool _3510 = isnan(_3162);
    bool _3512 = _3508 || _3510;
    bool _3514 = isnan(0.0);
    bool _3516 = _3512 || _3514;
    float _3518 = fma(_3504, 0.114477999508380889892578125, _3506);
    bool _3520 = _3216 <= 0.0;
    bool _3522 = !_3516;
    bool _3524 = _3520 || _3522;
    float _3526 = -_3518;
    float _3528 = _3498 + _3526;
    float _3530 = -_3518;
    float _3532 = _3492 + _3530;
    float _3534 = -_3518;
    float _3536 = _3504 + _3534;
    float _3538 = fma(_3528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3518);
    float _3540 = fma(_3532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3518);
    float _3542 = fma(_3536, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3518);
    bool _3544 = !_3502;
    if (!_3544)
    {
        float _3546 = -_1608;
        float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3550 = -_1610;
        float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3554 = -_1612;
        float _3556 = _3554 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3558 = _3548 * _3548;
        float _3560 = fma(_3552, _3552, _3558);
        float _3562 = fma(_3556, _3556, _3560);
        float _3564 = sqrt(_3562);
        float _3566 = rsqrt(_3562);
        float _3568 = -_3564;
        float _3570 = _3568 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3572 = _3570 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3574 = precise::clamp(_3572, 0.0, 1.0);
        float _3576 = _3552 * _3566;
        float _3578 = _3548 * _3566;
        float _3580 = abs(_3574);
        float _3582 = log2(_3580);
        float _3584 = _3556 * _3566;
        float _3586 = _3576 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3588 = _3014 * _3578;
        float _3590 = -_3578;
        float _3592 = -_3586;
        float _3594 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3592);
        float _3596 = fma(_3012, _3576, _3588);
        float _3598 = -_3584;
        float _3600 = fma(_3598, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3594);
        float _3602 = fma(_3022, _3584, _3596);
        float _3604 = precise::clamp(_3602, 0.0, 1.0);
        float _3606 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3608 = _3600 + _3606;
        float _3610 = _3582 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3612 = _3608 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3614 = precise::clamp(_3612, 0.0, 1.0);
        float _3616 = exp2(_3610);
        float _3618 = _3616 * _3614;
        float _3620 = _3604 * _3618;
        float _3622 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3624 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3626 = _3620 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3622;
        out.m_91.y = _3624;
        out.m_91.z = _3626;
    }
    out.m_93.x = _3538;
    out.m_93.y = _3540;
    out.m_93.z = _3542;
    if (!_3524)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3628 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3628;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

