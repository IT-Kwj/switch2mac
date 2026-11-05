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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_85 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
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
    float4 m_51 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2935 = false;
    bool _742 = false;
    bool _514 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3239 = as_type<float>(_126);
        out.gl_Position.z = _3239;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_51.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    float _156 = _136;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3304 = as_type<float>(_162);
        out.gl_Position.z = _3304;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _164 = 1.0 / _132;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _136 * _164;
    bool _170 = !_166;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        _188 = _168;
    }
    _190 = false;
    float _192 = _188;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = 1.0 / _200;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _216;
    float _220 = 1.0 / _204;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _192 + _222;
    float _226 = 1.0 / _208;
    float _228 = _224 * _214;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = _192 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _192 + _234;
    bool _238 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _240 = isnan(_192);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _252 = 1.0 / _218;
    float _254 = _196 * _220;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _258 = _192 + _256;
    float _260 = 1.0 / _212;
    float _262 = _232 * _226;
    bool _264 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _266 = isnan(_192);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    bool _276 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _278 = isnan(_192);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_274;
    float _290 = _288 + 1.0;
    float _292 = _258 * _252;
    bool _294 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _296 = isnan(_192);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    bool _310 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_192);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -_304;
    float _324 = _322 + 1.0;
    float _326 = fma(_308, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _328 = _236 * _260;
    float _330 = _304 * _290;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = -_320;
    float _342 = _340 + 1.0;
    float _344 = _248 * _324;
    float _346 = fma(_334, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _348 = fma(_338, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _350 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _352 = isnan(_192);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = _286 * _342;
    float _364 = -_286;
    float _366 = _364 + 1.0;
    float _368 = -_248;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = _360 * _366;
    float _378 = _320 * _370;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = _346 * _376;
    float _390 = -_360;
    float _392 = _390 + 1.0;
    float _394 = fma(_374, _254, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _254, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_386, _254, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = _326 * _376;
    float _402 = _348 * _376;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _388);
    float _410 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _412 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _414 = fma(_406, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _416 = fma(_394, _362, _408);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_398, _362, _410);
    float _428 = fma(_396, _362, _412);
    float _430 = fma(_414, _378, _416);
    float _432 = fma(_420, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_424, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _448 = fma(_432, _378, _428);
    float _450 = fma(_438, _328, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _452 = fma(_442, _328, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_446, _328, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _456 = fma(_434, _378, _426);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _466;
    float _470 = fma(_450, _344, _430);
    float _472 = fma(_460, _292, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _474 = fma(_464, _292, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _476 = fma(_468, _292, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _478 = fma(_452, _344, _448);
    float _480 = fma(_454, _344, _456);
    float _482 = fma(_472, _330, _470);
    float _484 = fma(_474, _330, _478);
    float _486 = fma(_476, _330, _480);
    float _488 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[148].x, _482);
    float _490 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[148].y, _484);
    float _492 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[148].z, _486);
    bool _494 = !_250;
    float _512;
    if (!_494)
    {
        float _496 = in.m_53.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _512 = _510;
        _514 = true;
    }
    else
    {
        _512 = _168;
    }
    _514 = false;
    float _516 = _512;
    float _518 = in.m_55.x;
    float _520 = in.m_55.y;
    float _522 = in.m_55.z;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _528;
    bool _532 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _534 = isnan(_516);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _548 = 1.0 / _526;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _552 = 1.0 / _546;
    float _554 = _492 * _522;
    float _556 = _490 * _520;
    float _558 = _530 * _548;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _516 + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = isnan(_516);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = fma(_558, _562, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _582 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _584 = isnan(_516);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _566;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _600 = -_578;
    float _602 = _600 + 1.0;
    bool _604 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _606 = isnan(_516);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_592;
    float _618 = _616 + 1.0;
    float _620 = _592 * _602;
    float _622 = -_542;
    float _624 = _622 + 1.0;
    float _626 = 1.0 / _598;
    float _628 = _614 * _618;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _634 = _578 * _624;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _636;
    float _640 = _580 * _628;
    float _642 = _632 * _552;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _516 + _644;
    float _648 = -_614;
    float _650 = _648 + 1.0;
    bool _652 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _654 = isnan(_516);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _638 * _594;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _516 + _670;
    float _674 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _676 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _640);
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = _668 * _626;
    float _684 = fma(_664, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _688 = _516 + _686;
    float _690 = fma(_674, _620, _676);
    float _692 = _542 * _680;
    float _694 = fma(_682, _688, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _696 = fma(_684, _634, _690);
    float _698 = _488 * _518;
    float _700 = fma(_694, _692, _696);
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _708 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[119].x, _700);
    float _710 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _718 = !_550;
    float _720 = _682;
    float _722 = _684;
    float _740;
    if (!_718)
    {
        float _724 = in.m_53.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _136);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        _740 = _168;
    }
    _742 = false;
    float _744 = _740;
    float _746 = in.m_53.y;
    float _748 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _750 = log2(_748);
    float _752 = in.m_53.z;
    float _754 = in.m_53.w;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _758 = _756 != 0;
    float _760 = in.m_53.x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _772 = _746 * 2.0;
    if (!_758)
    {
        _720 = _746;
    }
    float _774 = _720;
    float _776 = _752 * 2.0;
    float _778 = _774;
    if (!_758)
    {
        _722 = _752;
    }
    float _780 = _722;
    float _782 = floor(_772);
    float _784 = _780;
    if (_758)
    {
        _784 = _746;
    }
    float _786 = _784;
    float _788 = _760 * 2.0;
    float _790 = _786;
    if (_758)
    {
        _778 = _760;
    }
    float _792 = _778;
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[83].w, _764);
    if (!_758)
    {
        _790 = _752;
    }
    float _796 = _790;
    float _798 = floor(_776);
    float _800 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[83].z, _762);
    float _802 = _792 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _804 = _796;
    if (_758)
    {
        _804 = _746;
    }
    float _806 = _804;
    float _808 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _794);
    float _810 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _800);
    float _812 = -_766;
    float _814 = fma(_802, 2.0, _812);
    bool _816 = _782 >= 0.0;
    bool _818 = isnan(_782);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    float _826 = floor(_788);
    float _828 = -_136;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[81].x, _814);
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _838 = _836 != 0;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _842 = _840 != 0;
    bool _844 = _782 > 0.0;
    float _846 = in.m_46.x;
    float _848 = in.m_46.y;
    float _850 = in.m_46.z;
    bool _852 = _798 > 0.0;
    int _854 = _824 ? 0 : 1;
    bool _856 = _798 >= 0.0;
    bool _858 = isnan(_798);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = _798;
    float _868 = _810;
    if (_758)
    {
        _866 = _760;
    }
    float _870 = _866;
    float _872 = _870;
    if (!_758)
    {
        _872 = _752;
    }
    float _874 = _872;
    int _876 = _864 ? 0 : 1;
    bool _878 = !_834;
    int _880 = _878 ? 0 : 1;
    float _882 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _884 = ~_854;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    int _890 = ~_876;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = -_768;
    float _898 = fma(_882, 2.0, _896);
    int _900 = _888;
    int _902 = _894;
    if (!_844)
    {
        int _904 = ~_854;
        int _906 = _904 + 1;
        _900 = _906;
    }
    int _908 = _900;
    float _910 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_852)
    {
        int _912 = ~_876;
        int _914 = _912 + 1;
        _902 = _914;
    }
    int _916 = _902;
    float _918 = _752 + _760;
    bool _920 = _826 > 0.0;
    float _922 = _848 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _924 = _848 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _926 = _918 + (-1.0);
    float _928 = fma(_910, -2.0, _770);
    float _930 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[6].x, _922);
    float _932 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[4].x, _924);
    bool _934 = _826 >= 0.0;
    bool _936 = isnan(_826);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _746 + _760;
    float _946 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _948 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _950 = _926;
    bool _952 = _942;
    float _954 = _850;
    if (_758)
    {
        _950 = _746;
    }
    float _956 = _950;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _960 = _956;
    if (!_758)
    {
        _960 = _760;
    }
    float _962 = _960;
    float _964 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[4].z, _932);
    float _966 = _750 * _136;
    float _968 = _944 + (-1.0);
    float _970 = _946 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _972 = _962 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _974 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _976 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _978 = exp2(_966);
    float _980 = fma(_972, -2.0, _958);
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _984 = _974 + _982;
    float _986 = -_970;
    float _988 = _986 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = -_136;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[86].x, _898);
    bool _994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _996 = isnan(1.0);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1002 = _998 || _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1006 = 1.0 + _1004;
    float _1008 = abs(_984);
    float _1010 = abs(_988);
    float _1012 = precise::max(_1008, _1010);
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1016 = abs(_880);
    float _1018 = 1.0 / _1006;
    bool _1020 = _1012 >= 16.0;
    float _1022 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1014);
    float _1024 = float(_1016);
    float _1026 = -_978;
    float _1028 = _1026 + 1.0;
    float _1030 = float(_916);
    float _1032 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1022);
    float _1034 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _928);
    bool _1036 = !_842;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = _1024 * _1030;
    bool _1042 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1050 = _1046 || _1048;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1054 = abs(_1038);
    float _1056 = _1040 * (-2.0);
    float _1058 = _1050 ? _1028 : 0.0;
    float _1060 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1052);
    float _1062 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _980);
    float _1064 = fma(_976, _1056, _976);
    float _1066 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1060);
    float _1068 = _988;
    if (_1002)
    {
        float _1070 = _1058 * _1018;
        _156 = _1070;
    }
    float _1072 = _156;
    float _1074 = _760 + (-0.5);
    float _1076 = _984 * 0.0625;
    float _1078 = float(_1054);
    int _1080 = as_type<int>(_1072);
    if (_1020)
    {
        float _1082 = _988 * 0.0625;
        _1068 = _1082;
    }
    float _1084 = _1068;
    float _1086 = float(_908);
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1090 = _942 ? 0 : 1;
    bool _1092 = !_838;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = _1078 * _1086;
    float _1098 = _1020 ? _1076 : _984;
    float _1100 = fma(_1064, _1072, _1088);
    int _1102 = ~_1090;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    float _1108 = _1096 * (-2.0);
    int _1110 = abs(_1094);
    float _1112 = _1100 * 0.15915493667125701904296875;
    int _1114 = _1106;
    if (!_920)
    {
        int _1116 = ~_1090;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    float _1122 = _746 + _752;
    float _1124 = abs(_1098);
    bool _1126 = _1124 != 0.0;
    bool _1128 = isnan(_1124);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    float _1136 = _1112 * 6.283185482025146484375;
    float _1138 = sin(_1136);
    float _1140 = _1122 + (-1.0);
    float _1142 = abs(_1084);
    bool _1144 = _1142 == 0.0;
    bool _1146 = !_1134;
    bool _1148 = _1144 && _1146;
    float _1150 = float(_1120);
    float _1152 = in.m_57.x;
    float _1154 = in.m_57.y;
    float _1156 = in.m_57.z;
    float _1158 = float(_1110);
    float _1160 = _1112 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = abs(_1084);
    bool _1166 = _1164 == 0.0;
    float _1168 = _1158 * _1150;
    float _1170 = fma(_948, _1108, _948);
    float _1172 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1174 = _752 + (-0.5);
    float _1176 = _1168 * (-2.0);
    float _1178 = _746 + (-0.5);
    int _1180 = as_type<int>(_1178);
    if (_1148)
    {
        bool _1182 = as_type<int>(_1084) >= 0;
        _952 = _1182;
    }
    bool _1184 = _952;
    float _1186 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1188 = fma(_1172, _1176, _1172);
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1192 = _1184 ? (-1) : 0;
    if (_1148)
    {
        int _1194 = _1184 ? 0 : 1078530011;
        _1180 = _1194;
    }
    int _1196 = _1180;
    float _1198 = fma(_1170, _1072, _1186);
    float _1200 = fma(_1188, _1072, _1190);
    if (_1148)
    {
        int _1202 = int(0x80000000) & as_type<int>(_1098);
        int _1204 = _1196 | _1202;
        _1080 = _1204;
    }
    int _1206 = _1080;
    bool _1208 = !_1134;
    bool _1210 = _1208 && _1166;
    int _1212 = _1206;
    float _1214 = as_type<float>(_1206);
    if (!_1210)
    {
        float _1216 = abs(_1098);
        bool _1218 = _1216 != as_type<float>(0x7f800000u /* inf */);
        bool _1220 = isnan(_1216);
        bool _1222 = _1218 || _1220;
        bool _1224 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1226 = _1222 || _1224;
        float _1228 = abs(_1084);
        bool _1230 = _1228 == as_type<float>(0x7f800000u /* inf */);
        float _1232 = abs(_1084);
        bool _1234 = _1232 == as_type<float>(0x7f800000u /* inf */);
        bool _1236 = !_1226;
        bool _1238 = _1234 && _1236;
        if (_1238)
        {
            bool _1240 = as_type<int>(_1084) >= 0;
            _1192 = _1240 ? (-1) : 0;
        }
        int _1242 = _1192;
        if (_1238)
        {
            _1212 = 1075235812;
        }
        int _1244 = _1212;
        int _1246 = _1244;
        if (_1238)
        {
            int _1248 = ~_1242;
            int _1250 = (_1248 != 0) ? _1244 : 1061752795;
            _1246 = _1250;
        }
        int _1252 = _1246;
        float _1254 = as_type<float>(_1252);
        if (_1238)
        {
            int _1256 = int(0x80000000) & as_type<int>(_1098);
            int _1258 = _1252 | _1256;
            _1254 = as_type<float>(_1258);
        }
        float _1260 = _1254;
        bool _1262 = !_1226;
        bool _1264 = _1262 && _1230;
        _1214 = _1260;
        if (!_1264)
        {
            float _1266 = abs(_1084);
            float _1268 = abs(_1098);
            float _1270 = precise::max(_1266, _1268);
            float _1272 = abs(_1084);
            float _1274 = abs(_1098);
            float _1276 = precise::min(_1272, _1274);
            float _1278 = 1.0 / _1270;
            float _1280 = abs(_1098);
            float _1282 = abs(_1084);
            bool _1284 = _1280 > _1282;
            bool _1286 = as_type<int>(_1084) >= 0;
            float _1288 = _1276 * _1278;
            float _1290 = abs(_1084);
            float _1292 = abs(_1098);
            float _1294 = _1290 + _1292;
            int _1296 = as_type<int>(_1098) & int(0x80000000);
            float _1298 = _1288 * _1288;
            bool _1300 = _1294 > as_type<float>(0x7f800000u /* inf */);
            bool _1302 = isnan(_1294);
            bool _1304 = _1300 || _1302;
            bool _1306 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1308 = _1304 || _1306;
            float _1310 = _1298 + 11.33538818359375;
            float _1312 = fma(_1298, _1310, 28.84246826171875);
            float _1314 = fma(_1298, _1312, 19.6966705322265625);
            float _1316 = fma(_1298, -0.82336294651031494140625, -5.674867153167724609375);
            float _1318 = fma(_1298, _1316, -6.565555095672607421875);
            float _1320 = 1.0 / _1314;
            float _1322 = _1298 * _1318;
            float _1324 = _1288 * _1322;
            float _1326 = fma(_1324, _1320, _1288);
            float _1328 = _1326;
            _1214 = _1294;
            if (_1284)
            {
                float _1330 = -_1326;
                float _1332 = _1330 + 1.57079637050628662109375;
                _1328 = _1332;
            }
            float _1334 = _1328;
            int _1336 = as_type<int>(_1334);
            if (!_1286)
            {
                float _1338 = -_1334;
                float _1340 = _1338 + 3.1415927410125732421875;
                _1336 = as_type<int>(_1340);
            }
            int _1342 = _1336;
            if (!_1308)
            {
                int _1344 = _1296 | _1342;
                _1214 = as_type<float>(_1344);
            }
        }
    }
    float _1346 = _1214;
    float _1348 = -_1346;
    float _1350 = _1200 + _1348;
    float _1352 = _1198 * 0.15915493667125701904296875;
    float _1354 = in.m_59.y;
    float _1356 = _1350 * 0.15915493667125701904296875;
    float _1358 = _1352 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1154);
    float _1366 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1152);
    float _1370 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1156);
    float _1374 = _1364 * _1362;
    float _1376 = _1356 * 6.283185482025146484375;
    float _1378 = sin(_1376);
    float _1380 = _1368 * _1366;
    float _1382 = _1372 * _1370;
    float _1384 = _848 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1386 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1388 = isnan(0.5);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1394 = _1390 || _1392;
    float _1396 = _1356 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = fma((*spvDescriptorSet0.vp_c9)._m0[193].x, 0.25, _168);
    float _1402 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1384);
    float _1404 = -_1354;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1402);
    float _1410 = _1352 * 6.283185482025146484375;
    float _1412 = sin(_1410);
    float _1414 = _1138 * _1360;
    float _1416 = _1162 * _1378;
    float _1418 = _1138 * _1378;
    float _1420 = _1378 * _1360;
    float _1422 = _1414 * _1374;
    float _1424 = _1408 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1426 = _1138 * _1398;
    float _1428 = _1162 * _1398;
    float _1430 = _1398 * _1360;
    float _1432 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1434 = _1162 * _1360;
    float _1436 = -_1416;
    float _1438 = fma(_1412, _1426, _1436);
    float _1440 = -_1374;
    float _1442 = _1412 * _1440;
    float _1444 = fma(_1412, _1418, _1428);
    float _1446 = _1434 * _1374;
    float _1448 = fma(_1438, _1380, _1422);
    float _1450 = fma(_1430, _1380, _1442);
    float _1452 = -_1426;
    float _1454 = fma(_1412, _1416, _1452);
    float _1456 = fma(_1444, _1382, _1448);
    float _1458 = fma(_1420, _1382, _1450);
    float _1460 = _970 + _1456;
    float _1462 = _974 + _1458;
    float _1464 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1466 = _1460 + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1470 = _1462 + _1468;
    float _1472 = _1466 * _1432;
    float _1474 = _1470 * _1432;
    float _1476 = fma(_1472, _1400, _1460);
    float _1478 = fma(_1474, _1400, _1462);
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1482 = _1476 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1486 = _1478 + _1484;
    float _1488 = _1482 * _1482;
    float _1490 = fma(_1486, _1486, _1488);
    float _1492 = fma(_1412, _1428, _1418);
    float _1494 = sqrt(_1490);
    float _1496 = fma(_1492, _1380, _1446);
    float _1498 = fma(_1454, _1382, _1496);
    float _1500 = _1424 + _1498;
    bool _1502 = _1494 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = _1446;
    float _1506 = _1408;
    float _1508 = _1478;
    float _1510 = _1382;
    float _1512 = _1426;
    float _1514 = _1354;
    float _1516 = _1444;
    if (!_1502)
    {
        _1504 = _1478;
    }
    float _1518 = _1504;
    float _1520 = _1518;
    if (!_1502)
    {
        _954 = _1476;
    }
    float _1522 = _954;
    float _1524 = _1522;
    if (!_1502)
    {
        _1506 = _1500;
    }
    float _1526 = _1506;
    bool _1528 = !_1502;
    float _1530 = _1526;
    if (!_1528)
    {
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1536 = _1494 + _1534;
        float _1538 = _1500 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1540 = rsqrt(_1490);
        float _1542 = _1536 * _1532;
        float _1544 = _1542 * 0.15915493667125701904296875;
        float _1546 = _1544 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        float _1550 = _1544 * 6.283185482025146484375;
        float _1552 = sin(_1550);
        float _1554 = _1548 + (-1.0);
        float _1556 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1558 = fma(_1552, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1560 = fma(_1500, _1548, _1556);
        float _1562 = _1540 * _1558;
        float _1564 = fma(_1486, _1562, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1566 = fma(_1482, _1562, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1520 = _1564;
        _1530 = _1560;
        _1524 = _1566;
    }
    float _1568 = _1520;
    float _1570 = _1530;
    float _1572 = _1524;
    float _1574 = _1570;
    float _1576 = _1568;
    float _1578 = _1572;
    if (!_1394)
    {
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1582 = _1424 + _1580;
        float _1584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1586 = -_974;
        float _1588 = _1586 + _1568;
        float _1590 = -_1424;
        float _1592 = _1590 + _1570;
        float _1594 = _1582 * _1582;
        float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1598 = _970 + _1596;
        float _1600 = -_970;
        float _1602 = _1600 + _1572;
        float _1604 = fma(_984, _984, _1594);
        float _1606 = fma(_1598, _1598, _1604);
        float _1608 = sqrt(_1606);
        float _1610 = precise::min(_1608, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1612 = _1610 * _1584;
        float _1614 = fma(_1588, _1612, _974);
        float _1616 = fma(_1592, _1612, _1424);
        float _1618 = fma(_1602, _1612, _970);
        _1574 = _1616;
        _1576 = _1614;
        _1578 = _1618;
    }
    float _1620 = _1574;
    float _1622 = _1576;
    float _1624 = _1578;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1628 = _1620 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1632 = _1622 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1636 = _1624 + _1634;
    float _1638 = _1628 * _1628;
    float _1640 = fma(_1632, _1632, _1638);
    float _1642 = fma(_1636, _1636, _1640);
    float _1644 = rsqrt(_1642);
    float _1646 = sqrt(_1642);
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1650 = _1632 * _1648;
    float _1652 = _1636 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 * _1652;
    float _1658 = _1654 + _1656;
    float _1660 = sqrt(_1658);
    bool _1662 = _1660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1666 = _1660 + _1664;
    float _1668 = _1636;
    float _1670 = _1666;
    float _1672 = _1628;
    if (_1662)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1668 = _1674;
    }
    float _1676 = _1668;
    if (_1662)
    {
        float _1678 = rsqrt(_1658);
        _1508 = _1678;
    }
    float _1680 = _1508;
    float _1682 = _1680;
    if (_1662)
    {
        float _1684 = _1666 * _1676;
        _1670 = _1684;
    }
    float _1686 = _1670;
    if (_1662)
    {
        float _1688 = _1686 * 0.15915493667125701904296875;
        _1510 = _1688;
    }
    float _1690 = _1510;
    float _1692 = _1644;
    float _1694 = _1690;
    if (_1662)
    {
        float _1696 = _1690 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        _1692 = _1698;
    }
    float _1700 = _1692;
    float _1702 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1704 = precise::max(0.0, _1702);
    float _1706 = _1676;
    float _1708 = _1704;
    if (_1662)
    {
        float _1710 = _1690 * 6.283185482025146484375;
        float _1712 = cos(_1710);
        _1706 = _1712;
    }
    float _1714 = _1706;
    float _1716 = -_1648;
    float _1718 = -_1704;
    float _1720 = fma(_1628, _1716, _1718);
    float _1722 = _1720;
    if (_1662)
    {
        float _1724 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1724;
    }
    float _1726 = _1672;
    float _1728 = _1726;
    if (!_1662)
    {
        _1694 = _1656;
    }
    float _1730 = _1694;
    float _1732 = _1700;
    float _1734 = _1730;
    if (_1662)
    {
        float _1736 = fma(_1700, _1726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1728 = _1736;
    }
    float _1738 = _1728;
    if (!_1662)
    {
        _1732 = _1654;
    }
    float _1740 = _1732;
    float _1742 = _1714;
    float _1744 = _1740;
    if (_1662)
    {
        float _1746 = _1714 + (-1.0);
        _1708 = _1746;
    }
    float _1748 = _1708;
    float _1750 = _1748;
    if (_1662)
    {
        float _1752 = _1680 * _1738;
        _1512 = _1752;
    }
    float _1754 = _1512;
    if (!_1662)
    {
        _1682 = _1650;
    }
    float _1756 = _1682;
    float _1758 = _1756;
    if (_1662)
    {
        float _1760 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1760;
    }
    float _1762 = _1750;
    if (_1662)
    {
        float _1764 = _1650 * _1754;
        _1758 = _1764;
    }
    float _1766 = _1758;
    if (_1662)
    {
        float _1768 = fma(_1720, _1714, _1762);
        _1722 = _1768;
    }
    float _1770 = _1722;
    if (!_1662)
    {
        _1742 = _1652;
    }
    float _1772 = _1742;
    float _1774 = _1772;
    if (_1662)
    {
        float _1776 = _1652 * _1754;
        _1774 = _1776;
    }
    float _1778 = _1774;
    if (_1662)
    {
        float _1780 = _1766 * _1766;
        _1744 = _1780;
    }
    float _1782 = _1744;
    float _1784 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1662)
    {
        float _1786 = _1778 * _1778;
        _1734 = _1786;
    }
    float _1788 = _1734;
    float _1790 = fma(_1770, _1770, _1782);
    float _1792 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1784);
    float _1794 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1796 = fma(_974, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1798 = _1790 + _1788;
    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1802 = fma(_1646, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1800);
    float _1804 = precise::clamp(_1802, 0.0, 1.0);
    float _1806 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1792);
    float _1808 = rsqrt(_1798);
    float _1810 = -_1804;
    float _1812 = _1810 + 1.0;
    float _1814 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1816 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1818 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1820 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1822 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1816);
    float _1824 = abs(_1812);
    float _1826 = log2(_1824);
    float _1828 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1830 = -_1820;
    float _1832 = fma(_1830, _1818, 1.0);
    float _1834 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1822);
    float _1836 = fma(_970, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1838 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1828);
    float _1840 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1794);
    float _1842 = _1808 * _1766;
    float _1844 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1838);
    float _1846 = _1808 * _1770;
    float _1848 = _1808 * _1778;
    float _1850 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1854 = floor(_1796);
    float _1856 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1840);
    float _1858 = -_1850;
    float _1860 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1864 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1866 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1868 = -_1848;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1872 = _1856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1874 = floor(_1836);
    float _1876 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1864);
    float _1878 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1880 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1876);
    float _1882 = log2(_1832);
    float _1884 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1880);
    float _1886 = -_1854;
    float _1888 = _1796 + _1886;
    float _1890 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1892 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1890);
    float _1894 = exp2(_1866);
    float _1896 = fma(_1870, -0.5, 0.5);
    float _1898 = fma(_1870, 0.5, 0.5);
    float _1900 = -_1874;
    float _1902 = _1836 + _1900;
    float _1904 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1878);
    float _1906 = _1846 + 1.0;
    float _1908 = fma(_1898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1910 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1892);
    float _1912 = 1.0 / _1884;
    float _1914 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1904);
    float _1916 = fma(_1898, _1908, -0.212114393711090087890625);
    float _1918 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1910);
    float _1920 = _1882 * 0.693147182464599609375;
    float _1922 = sqrt(_1896);
    float _1924 = -_1846;
    float _1926 = fma(_1894, _1906, _1924);
    float _1928 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1914);
    float _1930 = fma(_1898, _1916, 1.570728778839111328125);
    float2 _6103 = float2(_1888, _1902);
    float _1932 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6103, float2(0.0), isnan(_6103)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6103, float2(0.0), isnan(_6103)), level(0.0)).x;
    float _1934 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1936 = _1918 * _1912;
    float _1938 = _1928 * _1912;
    float _1940 = fma(_1926, 0.5, 0.5);
    float _1942 = fma(_1936, 0.5, 0.5);
    float _1944 = fma(_1938, -0.5, 0.5);
    float _1946 = _1922 * 0.636619746685028076171875;
    float _1948 = -_1930;
    float _1950 = fma(_1946, _1948, 1.0);
    float3 _6138 = float3(_1942, _1944, _1934);
    float _1952 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6138, float3(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6138, float3(0.0), isnan(_6138)), level(0.0)).x;
    float3 _6149 = float3(_1942, _1944, _1934);
    float4 _1955 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6149, float3(0.0), isnan(_6149)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6149, float3(0.0), isnan(_6149)), level(0.0)).xyzw;
    float _1957 = _1955.x;
    float _1959 = _1955.y;
    float _1961 = _1955.z;
    float _1963 = _1955.w;
    float2 _6165 = float2(_1950, _1940);
    float3 _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6165, float2(0.0), isnan(_6165)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6165, float2(0.0), isnan(_6165)), level(0.0)).xyz;
    float _1969 = _1967.x;
    float _1971 = _1967.y;
    float _1973 = _1967.z;
    out.m_61.x = _710;
    out.m_61.y = _712;
    out.m_61.z = _714;
    out.m_61.w = _716;
    bool _1975 = _746 > 0.5;
    float _1977 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1983 = in.m_59.x;
    float _1985 = exp2(_1977);
    int _1987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1989 = _1987 != 0;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1993 = _1991 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1997 = _1995 != 0;
    out.m_63.x = _1430;
    out.m_63.y = _1492;
    out.m_63.z = _1438;
    int _1999 = _1975 ? as_type<int>(_1406) : as_type<int>(_1354);
    float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2003 = _2001 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2005 = 1.0 / _1981;
    bool _2007 = _752 > 0.5;
    float _2009 = in.m_65.w;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2015 = _1997 ? as_type<float>(_1999) : _1354;
    float _2017 = _710;
    float _2019 = _1884;
    if (_1989)
    {
        float _2021 = in.m_53.z;
        _2017 = _2021;
    }
    float _2023 = _2017;
    int _2025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2027 = _2025 != 0;
    float _2029 = 1.0 / _1993;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2033 = _2031 != 0;
    float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2037 = _2035 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2041 = _2039 != 0;
    float _2043 = -_1985;
    float _2045 = _2043 + 1.0;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2049 = _2047 != 0;
    out.m_67.x = _1622;
    out.m_67.y = _1620;
    out.m_67.z = _1624;
    int _2051 = _2007 ? as_type<int>(_1406) : as_type<int>(_1354);
    float _2053 = 1.0 / _2003;
    float _2055 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2057 = _754 > 0.5;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2061 = _2059 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2063 = 1.0 / _2013;
    float _2065 = _2041 ? as_type<float>(_2051) : _1354;
    float _2067 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2071 = _2041;
    bool _2073 = _2057;
    if (_2027)
    {
        bool _2075 = _760 > 0.5;
        _2071 = _2075;
    }
    bool _2077 = _2071;
    float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2085 = _2083 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    if (_2049)
    {
        float _2087 = _2057 ? _1406 : _1354;
        _1514 = _2087;
    }
    float _2089 = _1514;
    out.m_69.w = _2009;
    float _2091 = 1.0 / _2037;
    float _2093 = _2085 * _2005;
    float _2095 = _2089;
    if (_1989)
    {
        bool _2097 = _2023 > 0.5;
        _2073 = _2097;
    }
    bool _2099 = _2073;
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2103 = _744 + _2101;
    bool _2105 = _1154 != 0.0;
    bool _2107 = isnan(_1154);
    bool _2109 = _2105 || _2107;
    bool _2111 = isnan(0.0);
    bool _2113 = _2109 || _2111;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2115;
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2123 = 1.0 / _2061;
    float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2127 = _744 + _2125;
    float _2129 = _2117 * _2029;
    float _2131 = _2121 * _2063;
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2135 = _744 + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2139 = _744 + _2137;
    float _2141 = 1.0 / _2069;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2143;
    float _2147 = _2081 * _2091;
    float _2149 = fma(_2131, _2127, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2153 = _744 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2157 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2155;
    float _2159 = fma(_2129, _2135, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2161 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2163 = isnan(_744);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2169 = _2165 || _2167;
    float _2171 = float(_2169);
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2177 = _2157 * _2123;
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2181 = _744 + _2179;
    float _2183 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2185 = _2175 * _2053;
    bool _2187 = _1152 == 0.0;
    bool _2189 = !_2113;
    bool _2191 = _2187 && _2189;
    float _2193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2195 = _2145 * _2141;
    float _2197 = fma(_2093, _2181, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2201 = _744 + _2199;
    float _2203 = fma(_2185, _2103, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2205 = fma(_2195, _2153, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2207 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2209 = fma(_2177, _2201, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2211 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2213 = isnan(_744);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2225 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2207);
    float _2227 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2183);
    bool _2229 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2231 = isnan(_744);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2237 = _2233 || _2235;
    int _2239 = _2237 ? 1065353216 : 0;
    float _2241 = -_2221;
    float _2243 = _2241 + 1.0;
    float _2245 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2225);
    float _2247 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2227);
    float _2249 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2251 = -_2171;
    float _2253 = _2251 + 1.0;
    bool _2255 = _1156 == 0.0;
    bool _2257 = _2255 && _2191;
    float _2259 = _2247 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2261 = fma(_2065, _2249, -0.5);
    bool _2263 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2265 = isnan(_744);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2271 = _2267 || _2269;
    float _2273 = float(_2271);
    float _2275 = _2221 * _2253;
    bool _2277 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2279 = isnan(_744);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = 1.0 / _2259;
    bool _2291 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2293 = isnan(_744);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2299 = _2295 || _2297;
    float _2301 = float(_2299);
    float _2303 = -_2273;
    float _2305 = _2303 + 1.0;
    float _2307 = _2273 * _2243;
    bool _2309 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2311 = isnan(_744);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2317 = _2313 || _2315;
    float _2319 = float(_2317);
    float _2321 = fma(_2147, _2139, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2323 = _2287 * _2305;
    float _2325 = -_2287;
    float _2327 = _2325 + 1.0;
    float _2329 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2331 = -_2319;
    float _2333 = _2331 + 1.0;
    float _2335 = _2147;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[30].w);
    int _2339 = _2239;
    float _2341 = _2171;
    if (!_2027)
    {
        _2335 = _1983;
    }
    float _2343 = _2335;
    float _2345 = _2319 * _2327;
    float _2347 = _2329 + _2259;
    float _2349 = _2301 * _2333;
    float _2351 = in.m_71.x;
    float _2353 = in.m_71.y;
    float _2355 = in.m_71.z;
    bool _2357 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2359 = isnan(_744);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2365 = _2361 || _2363;
    float _2367 = float(_2365);
    float _2369 = _2347 * _2289;
    float _2371 = _2369 * 0.5;
    float _2373 = -as_type<float>(_2239);
    float _2375 = _2373 + 1.0;
    float _2377 = _2223 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2381 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2383 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2381);
    float _2385 = _2367 * _2375;
    float _2387 = -_2367;
    float _2389 = _2387 + 1.0;
    float _2391 = -_2301;
    float _2393 = _2391 + 1.0;
    float _2395 = _2375;
    float _2397 = _2343;
    float _2399 = _2377;
    int _2401 = as_type<int>(_2389);
    if (_1989)
    {
        float _2403 = -_1983;
        float _2405 = _2403 + 1.0;
        _2337 = as_type<int>(_2405);
    }
    int _2407 = _2337;
    float _2409 = _2321 * _2385;
    float _2411 = fma(_2377, _2089, -0.5);
    float _2413 = 1.0 / _2383;
    float _2415 = as_type<float>(_2239) * _2393;
    float _2417 = fma(_2389, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2409);
    int _2419 = as_type<int>(_2409);
    if (_2027)
    {
        float _2421 = -_1983;
        float _2423 = _2421 + 1.0;
        _2339 = as_type<int>(_2423);
    }
    int _2425 = _2339;
    int _2427 = 0;
    float _2429 = as_type<float>(_2425);
    if (_2033)
    {
        float _2431 = -_1983;
        float _2433 = _2431 + 1.0;
        _2427 = as_type<int>(_2433);
    }
    int _2435 = _2427;
    if (!_2033)
    {
        _2395 = _1983;
    }
    float _2437 = _2395;
    float _2439 = -_1034;
    float _2441 = fma(_808, _2411, _2439);
    float _2443 = fma(_2197, _2415, _2417);
    float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2447 = _2437;
    if (_2027)
    {
        float _2449 = _2077 ? as_type<float>(_2425) : _1983;
        _2397 = _2449;
    }
    float _2451 = _2397;
    float _2453 = _2379 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2455 = _2351;
    float _2457 = _2353;
    if (_2257)
    {
        _2399 = _2353;
    }
    float _2459 = _2399;
    float _2461 = _2459;
    if (!_2257)
    {
        float _2463 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2351);
        _2455 = _2463;
    }
    float _2465 = _2455;
    float _2467 = 0.0;
    if (_2257)
    {
        _2467 = _2355;
    }
    float _2469 = _2467;
    float _2471 = fma(_2159, _2349, _2443);
    float _2473 = _2469;
    if (_2257)
    {
        _2095 = _2459;
    }
    float _2475 = _2095;
    float _2477 = _2475;
    if (_2257)
    {
        float _2479 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2459);
        _2401 = as_type<int>(_2479);
    }
    int _2481 = _2401;
    int _2483 = _2481;
    if (!_2257)
    {
        _2461 = _2353;
    }
    float _2485 = _2461;
    if (_2257)
    {
        float _2487 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2469);
        _2419 = as_type<int>(_2487);
    }
    int _2489 = _2419;
    int _2491 = _2489;
    if (_2257)
    {
        _2457 = _2469;
    }
    float _2493 = _2457;
    float _2495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2497 = _2493;
    if (!_2257)
    {
        _2473 = _2355;
    }
    float _2499 = _2473;
    float _2501 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2503 = _2413 * _2501;
    float _2505 = _2503;
    if (!_2257)
    {
        float _2507 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2485);
        _2483 = as_type<int>(_2507);
    }
    int _2509 = _2483;
    bool _2511 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2513 = isnan(0.5);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2519 = _2515 || _2517;
    float _2521 = _2445 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1989)
    {
        _2429 = _1983;
    }
    float _2523 = _2429;
    float _2525 = _2523;
    if (!_2257)
    {
        float _2527 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2499);
        _2491 = as_type<int>(_2527);
    }
    int _2529 = _2491;
    float _2531 = abs(_2503);
    float _2533 = log2(_2531);
    if (_1989)
    {
        float _2535 = _2099 ? as_type<float>(_2407) : _1983;
        _2525 = _2535;
    }
    float _2537 = _2525;
    float _2539 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2033)
    {
        float _2541 = _1975 ? as_type<float>(_2435) : _1983;
        _2447 = _2541;
    }
    float _2543 = _2447;
    float _2545 = fma(_2149, _2345, _2471);
    bool _2547 = !_2257;
    float _2549 = _2547 ? as_type<float>(_2529) : _2499;
    float _2551 = fma(_2453, _2537, -0.5);
    bool _2553 = !_2257;
    float _2555 = _2553 ? as_type<float>(_2509) : _2485;
    float _2557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2559 = fma(_2521, _2543, -0.5);
    float _2561 = fma(_810, _2551, _830);
    if (!_2519)
    {
        _868 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2563 = _868;
    float _2565 = _2555 * _2555;
    float _2567 = fma(_1066, _2559, _992);
    float _2569 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2571 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2573 = fma(_2549, _2549, _2565);
    float _2575 = _2563;
    if (!_2519)
    {
        float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2579 = _2563 + _2577;
        _2575 = _2579;
    }
    float _2581 = _2575;
    float _2583 = _2569 * _2495;
    float _2585 = -_1062;
    float _2587 = fma(_1032, _2261, _2585);
    float _2589 = fma(_2209, _2323, _2545);
    float _2591 = exp2(_2571);
    float _2593 = _2561 + 0.5;
    float _2595 = _2539 * _2557;
    float _2597 = _2441 + 0.5;
    float _2599 = _2567 + 0.5;
    float _2601 = fma(_2203, _2307, _2589);
    float _2603 = _2581;
    if (!_2257)
    {
        _2477 = as_type<float>(_2509);
    }
    float _2605 = _2477;
    float _2607 = _2539;
    if (!_2519)
    {
        float _2609 = 1.0 / _2581;
        _2607 = _2609;
    }
    float _2611 = _2607;
    out.m_73.x = _2595;
    out.m_73.y = _2583;
    out.m_73.z = _2593;
    out.m_73.w = _2597;
    float _2613 = fma(_2205, _2275, _2601);
    if (!_2257)
    {
        _2497 = as_type<float>(_2529);
    }
    float _2615 = _2497;
    float _2617 = _2587 + 0.5;
    bool _2619 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2621 = isnan(_1646);
    bool _2623 = _2619 || _2621;
    bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2627 = _2623 || _2625;
    float _2629 = fma(_2171, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2613);
    if (_2519)
    {
        _2341 = 1.0;
    }
    float _2631 = _2341;
    float _2633 = rsqrt(_2573);
    float _2635 = fma(_2591, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2637 = precise::clamp(_2635, 0.0, 1.0);
    float _2639 = _2631;
    if (!_2519)
    {
        float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2643 = _2503 + _2641;
        _2603 = _2643;
    }
    float _2645 = _2603;
    out.m_75.x = _2629;
    float _2647 = fma(_2637, -2.0, 3.0);
    float _2649 = _2637 * _2637;
    float _2651 = -_2605;
    float _2653 = _1412 * _2651;
    if (!_2519)
    {
        float _2655 = _2645 * _2611;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        _2639 = _2657;
    }
    float _2659 = _2639;
    out.m_77.x = _2599;
    out.m_77.y = _2617;
    float _2661 = _2649 * _2647;
    float _2663 = fma(_1430, _2465, _2653);
    float _2665 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2667 = _1434 * _2605;
    float _2669 = -_2661;
    float _2671 = _2669 + 1.0;
    float _2673 = _2555 * _2633;
    float _2675 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2665);
    float _2677 = _2549 * _2633;
    float _2679 = fma(_2671, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2661);
    float _2681 = -_2673;
    float _2683 = _1420 * _2681;
    float _2685 = -_2673;
    float _2687 = _1454 * _2685;
    float _2689 = -_2673;
    float _2691 = _1444 * _2689;
    float _2693 = fma(_1492, _2465, _2667);
    float _2695 = -_1412;
    float _2697 = fma(_2695, _2677, _2683);
    float _2699 = fma(_1434, _2677, _2687);
    float _2701 = fma(_1414, _2677, _2691);
    bool _2703 = _2503 <= 8000.0;
    bool _2705 = isnan(_2503);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(8000.0);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = in.m_79.x;
    float _2717 = _1414 * _2605;
    float _2719 = _1884 * 0.5;
    float _2721 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2675);
    float _2723 = _2713 * _2679;
    float _2725 = fma(_1438, _2465, _2717);
    float _2727 = fma(_1928, -0.5, _2719);
    float _2729 = fma(_1420, _2615, _2663);
    float _2731 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2733 = fma(_1444, _2615, _2725);
    float _2735 = _2701;
    float _2737 = _2697;
    if (!_2519)
    {
        _1516 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2739 = _1516;
    float _2741 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2721);
    float _2743 = _1918 + _1884;
    float _2745 = fma(_1454, _2615, _2693);
    float _2747 = _2739;
    float _2749 = _2741;
    if (!_2519)
    {
        float _2751 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2753 = _2739 + _2751;
        _2747 = _2753;
    }
    float _2755 = _2747;
    out.gl_Position.x = _1918;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _2741;
    out.gl_Position.w = _1884;
    float _2757 = _2741 + _1884;
    float _2759 = _2743 * 0.5;
    out.m_81.x = _2729;
    out.m_81.y = _2745;
    out.m_81.z = _2733;
    float _2761 = _2755;
    if (!_2519)
    {
        float _2763 = 1.0 / _2755;
        _2761 = _2763;
    }
    float _2765 = _2761;
    float _2767 = _2757 * 0.5;
    if (!_2519)
    {
        float _2769 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2771 = _2503 + _2769;
        _2505 = _2771;
    }
    float _2773 = _2505;
    out.m_83.x = _2697;
    out.m_83.y = _2699;
    out.m_83.z = _2701;
    out.m_85.x = _2759;
    out.m_85.y = _2727;
    out.m_85.z = _2767;
    out.m_85.w = _1884;
    float _2775 = -_2055;
    float _2777 = _2775 + 1.0;
    float _2779 = _2773;
    float _2781 = _2777;
    if (!_2627)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2783 = _2019;
    float _2785 = _2783;
    float _2787 = _2783;
    if (!_2627)
    {
        _2749 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2789 = _2749;
    float _2791 = _2789;
    float _2793 = _2789;
    if (_2519)
    {
        _2735 = 1.0;
    }
    float _2795 = _2735;
    float _2797 = _2795;
    if (!_2519)
    {
        float _2799 = _2773 * _2765;
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        _2779 = _2801;
    }
    float _2803 = _2779;
    if (!_2627)
    {
        _2737 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2805 = _2737;
    float _2807 = _2805;
    float _2809 = _2805;
    if (!_2519)
    {
        float _2811 = -_2803;
        float _2813 = _2811 + 1.0;
        _2797 = _2813;
    }
    float _2815 = _2797;
    float _2817 = _2659 * _2815;
    float _2819 = _2817 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2821 = _2817;
    if (!_2627)
    {
        _2821 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2823 = _2821;
    float _2825 = -_1932;
    float _2827 = _2825 + 1.0;
    float _2829 = _2827 * _2731;
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = -_2831;
    float _2835 = fma(_2833, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2837 = _2835 * _2715;
    float _2839 = _2837 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2841 = _2055 * _1952;
    float _2843 = _1963 * _2777;
    float _2845 = _2823;
    float _2847 = _2823;
    if (!_2627)
    {
        _2781 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2849 = _2781;
    out.m_87.x = _2839;
    float _2851 = _1963 * _2841;
    float _2853 = _1973 * _2841;
    float _2855 = fma(_1969, _2851, _1957);
    float _2857 = fma(_1971, _2851, _1959);
    float _2859 = fma(_1963, _2853, _1961);
    float _2861 = _2851;
    float _2863 = _2849;
    float _2865 = _2849;
    if (!_2627)
    {
        _2861 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2867 = _2861;
    out.m_89.x = _2855;
    out.m_89.y = _2857;
    out.m_89.z = _2859;
    out.m_89.w = _2843;
    bool _2869 = !_2627;
    float _2871 = _2867;
    float _2873 = _2867;
    if (!_2869)
    {
        bool _2875 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2877 = isnan(_1646);
        bool _2879 = _2875 || _2877;
        bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2883 = _2879 || _2881;
        if (!_2883)
        {
            float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2887 = _1646 + _2885;
            float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2891 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2889;
            float _2893 = 1.0 / _2891;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2901 = _2899 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2915 = _2887 * _2893;
            float _2917 = precise::clamp(_2915, 0.0, 1.0);
            float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2923 = fma(_2917, _2897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2925 = fma(_2917, _2921, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2927 = fma(_2917, _2901, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2929 = fma(_2917, _2905, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2931 = fma(_2917, _2909, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2933 = fma(_2917, _2913, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2787 = _2925;
            _2865 = _2931;
            _2809 = _2923;
            _2873 = _2929;
            _2793 = _2927;
            _2847 = _2933;
            _2935 = true;
        }
        else
        {
            bool _2937 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2939 = isnan(_1646);
            bool _2941 = _2937 || _2939;
            bool _2943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2945 = _2941 || _2943;
            if (!_2945)
            {
                _2807 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2947 = _2807;
            _2809 = _2947;
            if (!_2945)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2949 = _2785;
            _2787 = _2949;
            if (!_2945)
            {
                _2791 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2951 = _2791;
            _2793 = _2951;
            if (!_2945)
            {
                _2871 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2953 = _2871;
            _2873 = _2953;
            if (!_2945)
            {
                _2863 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2955 = _2863;
            _2865 = _2955;
            if (!_2945)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2957 = _2845;
            bool _2959 = !_2945;
            _2847 = _2957;
            if (!_2959)
            {
                bool _2961 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2963 = isnan(_1646);
                bool _2965 = _2961 || _2963;
                bool _2967 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2969 = _2965 || _2967;
                if (!_2969)
                {
                    float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2973 = _1646 + _2971;
                    float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2977 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2975;
                    float _2979 = 1.0 / _2977;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3001 = _2973 * _2979;
                    float _3003 = precise::clamp(_3001, 0.0, 1.0);
                    float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3007 = _3005 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3009 = fma(_3003, _2983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3011 = fma(_3003, _3007, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3013 = fma(_3003, _2987, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3015 = fma(_3003, _2991, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3017 = fma(_3003, _2995, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3019 = fma(_3003, _2999, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2787 = _3011;
                    _2865 = _3017;
                    _2809 = _3009;
                    _2873 = _3015;
                    _2793 = _3013;
                    _2847 = _3019;
                    _2935 = true;
                }
                else
                {
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2865 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2809 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2873 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2793 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2935 = false;
    float _3021 = _2787;
    float _3023 = _2865;
    float _3025 = _2809;
    float _3027 = _2873;
    float _3029 = _2793;
    float _3031 = _2847;
    float _3033 = fma(_2745, -0.5, 0.5);
    float _3035 = precise::clamp(_3033, 0.0, 1.0);
    float _3037 = -_3021;
    float _3039 = _3037 + _3023;
    float _3041 = _2819 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3043 = -_3025;
    float _3045 = _3043 + _3027;
    out.m_91.x = 0.0;
    float _3047 = fma(_3035, _3039, _3021);
    float _3049 = fma(_3035, _3045, _3025);
    out.m_49.x = _3041;
    float _3051 = -_3029;
    float _3053 = _3051 + _3031;
    float _3055 = _3047 * 0.586610972881317138671875;
    bool _3057 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3059 = fma(_3035, _3053, _3029);
    float _3061 = fma(_3049, 0.298911988735198974609375, _3055);
    bool _3063 = _2659 > 0.0;
    bool _3065 = isnan(_2659);
    bool _3067 = _3063 || _3065;
    bool _3069 = isnan(0.0);
    bool _3071 = _3067 || _3069;
    float _3073 = fma(_3059, 0.114477999508380889892578125, _3061);
    bool _3075 = _2815 <= 0.0;
    bool _3077 = !_3071;
    bool _3079 = _3075 || _3077;
    float _3081 = -_3073;
    float _3083 = _3049 + _3081;
    float _3085 = -_3073;
    float _3087 = _3047 + _3085;
    float _3089 = -_3073;
    float _3091 = _3059 + _3089;
    float _3093 = fma(_3083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3073);
    float _3095 = fma(_3087, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3073);
    float _3097 = fma(_3091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3073);
    bool _3099 = !_3057;
    if (!_3099)
    {
        float _3101 = -_1620;
        float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3105 = -_1622;
        float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3109 = -_1624;
        float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3113 = _3103 * _3103;
        float _3115 = fma(_3107, _3107, _3113);
        float _3117 = fma(_3111, _3111, _3115);
        float _3119 = sqrt(_3117);
        float _3121 = rsqrt(_3117);
        float _3123 = -_3119;
        float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3127 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3129 = precise::clamp(_3127, 0.0, 1.0);
        float _3131 = _3107 * _3121;
        float _3133 = _3103 * _3121;
        float _3135 = abs(_3129);
        float _3137 = log2(_3135);
        float _3139 = _3111 * _3121;
        float _3141 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3143 = _2745 * _3133;
        float _3145 = -_3133;
        float _3147 = -_3141;
        float _3149 = fma(_3145, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3147);
        float _3151 = fma(_2729, _3131, _3143);
        float _3153 = -_3139;
        float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3149);
        float _3157 = fma(_2733, _3139, _3151);
        float _3159 = precise::clamp(_3157, 0.0, 1.0);
        float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3163 = _3155 + _3161;
        float _3165 = _3137 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3167 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3169 = precise::clamp(_3167, 0.0, 1.0);
        float _3171 = exp2(_3165);
        float _3173 = _3171 * _3169;
        float _3175 = _3159 * _3173;
        float _3177 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3179 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3181 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3177;
        out.m_91.y = _3179;
        out.m_91.z = _3181;
    }
    out.m_93.x = _3093;
    out.m_93.y = _3095;
    out.m_93.z = _3097;
    if (!_3079)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3183 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3183;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2935 = false;
    bool _742 = false;
    bool _514 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3239 = as_type<float>(_126);
        out.gl_Position.z = _3239;
    }
    if (!_116)
    {
        return out;
    }
    float _130 = in.m_51.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    float _156 = _136;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3304 = as_type<float>(_162);
        out.gl_Position.z = _3304;
    }
    if (_152)
    {
        return out;
    }
    float _164 = 1.0 / _132;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _136 * _164;
    bool _170 = !_166;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        _188 = _168;
    }
    _190 = false;
    float _192 = _188;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = 1.0 / _200;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _216;
    float _220 = 1.0 / _204;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _192 + _222;
    float _226 = 1.0 / _208;
    float _228 = _224 * _214;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = _192 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _192 + _234;
    bool _238 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _240 = isnan(_192);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _252 = 1.0 / _218;
    float _254 = _196 * _220;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _258 = _192 + _256;
    float _260 = 1.0 / _212;
    float _262 = _232 * _226;
    bool _264 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _266 = isnan(_192);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    bool _276 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _278 = isnan(_192);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_274;
    float _290 = _288 + 1.0;
    float _292 = _258 * _252;
    bool _294 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _296 = isnan(_192);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    bool _310 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_192);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -_304;
    float _324 = _322 + 1.0;
    float _326 = fma(_308, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _328 = _236 * _260;
    float _330 = _304 * _290;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = -_320;
    float _342 = _340 + 1.0;
    float _344 = _248 * _324;
    float _346 = fma(_334, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _348 = fma(_338, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _350 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _352 = isnan(_192);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = _286 * _342;
    float _364 = -_286;
    float _366 = _364 + 1.0;
    float _368 = -_248;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = _360 * _366;
    float _378 = _320 * _370;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = _346 * _376;
    float _390 = -_360;
    float _392 = _390 + 1.0;
    float _394 = fma(_374, _254, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _254, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_386, _254, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = _326 * _376;
    float _402 = _348 * _376;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _388);
    float _410 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _412 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _414 = fma(_406, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _416 = fma(_394, _362, _408);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_398, _362, _410);
    float _428 = fma(_396, _362, _412);
    float _430 = fma(_414, _378, _416);
    float _432 = fma(_420, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_424, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _448 = fma(_432, _378, _428);
    float _450 = fma(_438, _328, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _452 = fma(_442, _328, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_446, _328, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _456 = fma(_434, _378, _426);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _466;
    float _470 = fma(_450, _344, _430);
    float _472 = fma(_460, _292, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _474 = fma(_464, _292, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _476 = fma(_468, _292, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _478 = fma(_452, _344, _448);
    float _480 = fma(_454, _344, _456);
    float _482 = fma(_472, _330, _470);
    float _484 = fma(_474, _330, _478);
    float _486 = fma(_476, _330, _480);
    float _488 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[148].x, _482);
    float _490 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[148].y, _484);
    float _492 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[148].z, _486);
    bool _494 = !_250;
    float _512;
    if (!_494)
    {
        float _496 = in.m_53.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _512 = _510;
        _514 = true;
    }
    else
    {
        _512 = _168;
    }
    _514 = false;
    float _516 = _512;
    float _518 = in.m_55.x;
    float _520 = in.m_55.y;
    float _522 = in.m_55.z;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _528;
    bool _532 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _534 = isnan(_516);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _548 = 1.0 / _526;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _552 = 1.0 / _546;
    float _554 = _492 * _522;
    float _556 = _490 * _520;
    float _558 = _530 * _548;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _516 + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = isnan(_516);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = fma(_558, _562, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _582 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _584 = isnan(_516);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _566;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _600 = -_578;
    float _602 = _600 + 1.0;
    bool _604 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _606 = isnan(_516);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_592;
    float _618 = _616 + 1.0;
    float _620 = _592 * _602;
    float _622 = -_542;
    float _624 = _622 + 1.0;
    float _626 = 1.0 / _598;
    float _628 = _614 * _618;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _634 = _578 * _624;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _636;
    float _640 = _580 * _628;
    float _642 = _632 * _552;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _516 + _644;
    float _648 = -_614;
    float _650 = _648 + 1.0;
    bool _652 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _654 = isnan(_516);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _638 * _594;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _516 + _670;
    float _674 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _676 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _640);
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = _668 * _626;
    float _684 = fma(_664, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _688 = _516 + _686;
    float _690 = fma(_674, _620, _676);
    float _692 = _542 * _680;
    float _694 = fma(_682, _688, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _696 = fma(_684, _634, _690);
    float _698 = _488 * _518;
    float _700 = fma(_694, _692, _696);
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _708 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[119].x, _700);
    float _710 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _718 = !_550;
    float _720 = _682;
    float _722 = _684;
    float _740;
    if (!_718)
    {
        float _724 = in.m_53.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _136);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        _740 = _168;
    }
    _742 = false;
    float _744 = _740;
    float _746 = in.m_53.y;
    float _748 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _750 = log2(_748);
    float _752 = in.m_53.z;
    float _754 = in.m_53.w;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _758 = _756 != 0;
    float _760 = in.m_53.x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _772 = _746 * 2.0;
    if (!_758)
    {
        _720 = _746;
    }
    float _774 = _720;
    float _776 = _752 * 2.0;
    float _778 = _774;
    if (!_758)
    {
        _722 = _752;
    }
    float _780 = _722;
    float _782 = floor(_772);
    float _784 = _780;
    if (_758)
    {
        _784 = _746;
    }
    float _786 = _784;
    float _788 = _760 * 2.0;
    float _790 = _786;
    if (_758)
    {
        _778 = _760;
    }
    float _792 = _778;
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[83].w, _764);
    if (!_758)
    {
        _790 = _752;
    }
    float _796 = _790;
    float _798 = floor(_776);
    float _800 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[83].z, _762);
    float _802 = _792 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _804 = _796;
    if (_758)
    {
        _804 = _746;
    }
    float _806 = _804;
    float _808 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _794);
    float _810 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _800);
    float _812 = -_766;
    float _814 = fma(_802, 2.0, _812);
    bool _816 = _782 >= 0.0;
    bool _818 = isnan(_782);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    float _826 = floor(_788);
    float _828 = -_136;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[81].x, _814);
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _838 = _836 != 0;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _842 = _840 != 0;
    bool _844 = _782 > 0.0;
    float _846 = in.m_46.x;
    float _848 = in.m_46.y;
    float _850 = in.m_46.z;
    bool _852 = _798 > 0.0;
    int _854 = _824 ? 0 : 1;
    bool _856 = _798 >= 0.0;
    bool _858 = isnan(_798);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = _798;
    float _868 = _810;
    if (_758)
    {
        _866 = _760;
    }
    float _870 = _866;
    float _872 = _870;
    if (!_758)
    {
        _872 = _752;
    }
    float _874 = _872;
    int _876 = _864 ? 0 : 1;
    bool _878 = !_834;
    int _880 = _878 ? 0 : 1;
    float _882 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _884 = ~_854;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    int _890 = ~_876;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = -_768;
    float _898 = fma(_882, 2.0, _896);
    int _900 = _888;
    int _902 = _894;
    if (!_844)
    {
        int _904 = ~_854;
        int _906 = _904 + 1;
        _900 = _906;
    }
    int _908 = _900;
    float _910 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_852)
    {
        int _912 = ~_876;
        int _914 = _912 + 1;
        _902 = _914;
    }
    int _916 = _902;
    float _918 = _752 + _760;
    bool _920 = _826 > 0.0;
    float _922 = _848 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _924 = _848 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _926 = _918 + (-1.0);
    float _928 = fma(_910, -2.0, _770);
    float _930 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[6].x, _922);
    float _932 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[4].x, _924);
    bool _934 = _826 >= 0.0;
    bool _936 = isnan(_826);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _746 + _760;
    float _946 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _948 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _950 = _926;
    bool _952 = _942;
    float _954 = _850;
    if (_758)
    {
        _950 = _746;
    }
    float _956 = _950;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _960 = _956;
    if (!_758)
    {
        _960 = _760;
    }
    float _962 = _960;
    float _964 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[4].z, _932);
    float _966 = _750 * _136;
    float _968 = _944 + (-1.0);
    float _970 = _946 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _972 = _962 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _974 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _976 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _978 = exp2(_966);
    float _980 = fma(_972, -2.0, _958);
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _984 = _974 + _982;
    float _986 = -_970;
    float _988 = _986 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = -_136;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[86].x, _898);
    bool _994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _996 = isnan(1.0);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1002 = _998 || _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1006 = 1.0 + _1004;
    float _1008 = abs(_984);
    float _1010 = abs(_988);
    float _1012 = precise::max(_1008, _1010);
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1016 = abs(_880);
    float _1018 = 1.0 / _1006;
    bool _1020 = _1012 >= 16.0;
    float _1022 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1014);
    float _1024 = float(_1016);
    float _1026 = -_978;
    float _1028 = _1026 + 1.0;
    float _1030 = float(_916);
    float _1032 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1022);
    float _1034 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _928);
    bool _1036 = !_842;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = _1024 * _1030;
    bool _1042 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1050 = _1046 || _1048;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1054 = abs(_1038);
    float _1056 = _1040 * (-2.0);
    float _1058 = _1050 ? _1028 : 0.0;
    float _1060 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1052);
    float _1062 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _980);
    float _1064 = fma(_976, _1056, _976);
    float _1066 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1060);
    float _1068 = _988;
    if (_1002)
    {
        float _1070 = _1058 * _1018;
        _156 = _1070;
    }
    float _1072 = _156;
    float _1074 = _760 + (-0.5);
    float _1076 = _984 * 0.0625;
    float _1078 = float(_1054);
    int _1080 = as_type<int>(_1072);
    if (_1020)
    {
        float _1082 = _988 * 0.0625;
        _1068 = _1082;
    }
    float _1084 = _1068;
    float _1086 = float(_908);
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1090 = _942 ? 0 : 1;
    bool _1092 = !_838;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = _1078 * _1086;
    float _1098 = _1020 ? _1076 : _984;
    float _1100 = fma(_1064, _1072, _1088);
    int _1102 = ~_1090;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    float _1108 = _1096 * (-2.0);
    int _1110 = abs(_1094);
    float _1112 = _1100 * 0.15915493667125701904296875;
    int _1114 = _1106;
    if (!_920)
    {
        int _1116 = ~_1090;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    float _1122 = _746 + _752;
    float _1124 = abs(_1098);
    bool _1126 = _1124 != 0.0;
    bool _1128 = isnan(_1124);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    float _1136 = _1112 * 6.283185482025146484375;
    float _1138 = sin(_1136);
    float _1140 = _1122 + (-1.0);
    float _1142 = abs(_1084);
    bool _1144 = _1142 == 0.0;
    bool _1146 = !_1134;
    bool _1148 = _1144 && _1146;
    float _1150 = float(_1120);
    float _1152 = in.m_57.x;
    float _1154 = in.m_57.y;
    float _1156 = in.m_57.z;
    float _1158 = float(_1110);
    float _1160 = _1112 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = abs(_1084);
    bool _1166 = _1164 == 0.0;
    float _1168 = _1158 * _1150;
    float _1170 = fma(_948, _1108, _948);
    float _1172 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1174 = _752 + (-0.5);
    float _1176 = _1168 * (-2.0);
    float _1178 = _746 + (-0.5);
    int _1180 = as_type<int>(_1178);
    if (_1148)
    {
        bool _1182 = as_type<int>(_1084) >= 0;
        _952 = _1182;
    }
    bool _1184 = _952;
    float _1186 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1188 = fma(_1172, _1176, _1172);
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1192 = _1184 ? (-1) : 0;
    if (_1148)
    {
        int _1194 = _1184 ? 0 : 1078530011;
        _1180 = _1194;
    }
    int _1196 = _1180;
    float _1198 = fma(_1170, _1072, _1186);
    float _1200 = fma(_1188, _1072, _1190);
    if (_1148)
    {
        int _1202 = int(0x80000000) & as_type<int>(_1098);
        int _1204 = _1196 | _1202;
        _1080 = _1204;
    }
    int _1206 = _1080;
    bool _1208 = !_1134;
    bool _1210 = _1208 && _1166;
    int _1212 = _1206;
    float _1214 = as_type<float>(_1206);
    if (!_1210)
    {
        float _1216 = abs(_1098);
        bool _1218 = _1216 != as_type<float>(0x7f800000u /* inf */);
        bool _1220 = isnan(_1216);
        bool _1222 = _1218 || _1220;
        bool _1224 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1226 = _1222 || _1224;
        float _1228 = abs(_1084);
        bool _1230 = _1228 == as_type<float>(0x7f800000u /* inf */);
        float _1232 = abs(_1084);
        bool _1234 = _1232 == as_type<float>(0x7f800000u /* inf */);
        bool _1236 = !_1226;
        bool _1238 = _1234 && _1236;
        if (_1238)
        {
            bool _1240 = as_type<int>(_1084) >= 0;
            _1192 = _1240 ? (-1) : 0;
        }
        int _1242 = _1192;
        if (_1238)
        {
            _1212 = 1075235812;
        }
        int _1244 = _1212;
        int _1246 = _1244;
        if (_1238)
        {
            int _1248 = ~_1242;
            int _1250 = (_1248 != 0) ? _1244 : 1061752795;
            _1246 = _1250;
        }
        int _1252 = _1246;
        float _1254 = as_type<float>(_1252);
        if (_1238)
        {
            int _1256 = int(0x80000000) & as_type<int>(_1098);
            int _1258 = _1252 | _1256;
            _1254 = as_type<float>(_1258);
        }
        float _1260 = _1254;
        bool _1262 = !_1226;
        bool _1264 = _1262 && _1230;
        _1214 = _1260;
        if (!_1264)
        {
            float _1266 = abs(_1084);
            float _1268 = abs(_1098);
            float _1270 = precise::max(_1266, _1268);
            float _1272 = abs(_1084);
            float _1274 = abs(_1098);
            float _1276 = precise::min(_1272, _1274);
            float _1278 = 1.0 / _1270;
            float _1280 = abs(_1098);
            float _1282 = abs(_1084);
            bool _1284 = _1280 > _1282;
            bool _1286 = as_type<int>(_1084) >= 0;
            float _1288 = _1276 * _1278;
            float _1290 = abs(_1084);
            float _1292 = abs(_1098);
            float _1294 = _1290 + _1292;
            int _1296 = as_type<int>(_1098) & int(0x80000000);
            float _1298 = _1288 * _1288;
            bool _1300 = _1294 > as_type<float>(0x7f800000u /* inf */);
            bool _1302 = isnan(_1294);
            bool _1304 = _1300 || _1302;
            bool _1306 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1308 = _1304 || _1306;
            float _1310 = _1298 + 11.33538818359375;
            float _1312 = fma(_1298, _1310, 28.84246826171875);
            float _1314 = fma(_1298, _1312, 19.6966705322265625);
            float _1316 = fma(_1298, -0.82336294651031494140625, -5.674867153167724609375);
            float _1318 = fma(_1298, _1316, -6.565555095672607421875);
            float _1320 = 1.0 / _1314;
            float _1322 = _1298 * _1318;
            float _1324 = _1288 * _1322;
            float _1326 = fma(_1324, _1320, _1288);
            float _1328 = _1326;
            _1214 = _1294;
            if (_1284)
            {
                float _1330 = -_1326;
                float _1332 = _1330 + 1.57079637050628662109375;
                _1328 = _1332;
            }
            float _1334 = _1328;
            int _1336 = as_type<int>(_1334);
            if (!_1286)
            {
                float _1338 = -_1334;
                float _1340 = _1338 + 3.1415927410125732421875;
                _1336 = as_type<int>(_1340);
            }
            int _1342 = _1336;
            if (!_1308)
            {
                int _1344 = _1296 | _1342;
                _1214 = as_type<float>(_1344);
            }
        }
    }
    float _1346 = _1214;
    float _1348 = -_1346;
    float _1350 = _1200 + _1348;
    float _1352 = _1198 * 0.15915493667125701904296875;
    float _1354 = in.m_59.y;
    float _1356 = _1350 * 0.15915493667125701904296875;
    float _1358 = _1352 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1154);
    float _1366 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1152);
    float _1370 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1156);
    float _1374 = _1364 * _1362;
    float _1376 = _1356 * 6.283185482025146484375;
    float _1378 = sin(_1376);
    float _1380 = _1368 * _1366;
    float _1382 = _1372 * _1370;
    float _1384 = _848 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1386 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1388 = isnan(0.5);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1394 = _1390 || _1392;
    float _1396 = _1356 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = fma((*spvDescriptorSet0.vp_c9)._m0[193].x, 0.25, _168);
    float _1402 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1384);
    float _1404 = -_1354;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1402);
    float _1410 = _1352 * 6.283185482025146484375;
    float _1412 = sin(_1410);
    float _1414 = _1138 * _1360;
    float _1416 = _1162 * _1378;
    float _1418 = _1138 * _1378;
    float _1420 = _1378 * _1360;
    float _1422 = _1414 * _1374;
    float _1424 = _1408 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1426 = _1138 * _1398;
    float _1428 = _1162 * _1398;
    float _1430 = _1398 * _1360;
    float _1432 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1434 = _1162 * _1360;
    float _1436 = -_1416;
    float _1438 = fma(_1412, _1426, _1436);
    float _1440 = -_1374;
    float _1442 = _1412 * _1440;
    float _1444 = fma(_1412, _1418, _1428);
    float _1446 = _1434 * _1374;
    float _1448 = fma(_1438, _1380, _1422);
    float _1450 = fma(_1430, _1380, _1442);
    float _1452 = -_1426;
    float _1454 = fma(_1412, _1416, _1452);
    float _1456 = fma(_1444, _1382, _1448);
    float _1458 = fma(_1420, _1382, _1450);
    float _1460 = _970 + _1456;
    float _1462 = _974 + _1458;
    float _1464 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1466 = _1460 + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1470 = _1462 + _1468;
    float _1472 = _1466 * _1432;
    float _1474 = _1470 * _1432;
    float _1476 = fma(_1472, _1400, _1460);
    float _1478 = fma(_1474, _1400, _1462);
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1482 = _1476 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1486 = _1478 + _1484;
    float _1488 = _1482 * _1482;
    float _1490 = fma(_1486, _1486, _1488);
    float _1492 = fma(_1412, _1428, _1418);
    float _1494 = sqrt(_1490);
    float _1496 = fma(_1492, _1380, _1446);
    float _1498 = fma(_1454, _1382, _1496);
    float _1500 = _1424 + _1498;
    bool _1502 = _1494 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = _1446;
    float _1506 = _1408;
    float _1508 = _1478;
    float _1510 = _1382;
    float _1512 = _1426;
    float _1514 = _1354;
    float _1516 = _1444;
    if (!_1502)
    {
        _1504 = _1478;
    }
    float _1518 = _1504;
    float _1520 = _1518;
    if (!_1502)
    {
        _954 = _1476;
    }
    float _1522 = _954;
    float _1524 = _1522;
    if (!_1502)
    {
        _1506 = _1500;
    }
    float _1526 = _1506;
    bool _1528 = !_1502;
    float _1530 = _1526;
    if (!_1528)
    {
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1536 = _1494 + _1534;
        float _1538 = _1500 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1540 = rsqrt(_1490);
        float _1542 = _1536 * _1532;
        float _1544 = _1542 * 0.15915493667125701904296875;
        float _1546 = _1544 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        float _1550 = _1544 * 6.283185482025146484375;
        float _1552 = sin(_1550);
        float _1554 = _1548 + (-1.0);
        float _1556 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1558 = fma(_1552, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1560 = fma(_1500, _1548, _1556);
        float _1562 = _1540 * _1558;
        float _1564 = fma(_1486, _1562, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1566 = fma(_1482, _1562, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1520 = _1564;
        _1530 = _1560;
        _1524 = _1566;
    }
    float _1568 = _1520;
    float _1570 = _1530;
    float _1572 = _1524;
    float _1574 = _1570;
    float _1576 = _1568;
    float _1578 = _1572;
    if (!_1394)
    {
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1582 = _1424 + _1580;
        float _1584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1586 = -_974;
        float _1588 = _1586 + _1568;
        float _1590 = -_1424;
        float _1592 = _1590 + _1570;
        float _1594 = _1582 * _1582;
        float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1598 = _970 + _1596;
        float _1600 = -_970;
        float _1602 = _1600 + _1572;
        float _1604 = fma(_984, _984, _1594);
        float _1606 = fma(_1598, _1598, _1604);
        float _1608 = sqrt(_1606);
        float _1610 = precise::min(_1608, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1612 = _1610 * _1584;
        float _1614 = fma(_1588, _1612, _974);
        float _1616 = fma(_1592, _1612, _1424);
        float _1618 = fma(_1602, _1612, _970);
        _1574 = _1616;
        _1576 = _1614;
        _1578 = _1618;
    }
    float _1620 = _1574;
    float _1622 = _1576;
    float _1624 = _1578;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1628 = _1620 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1632 = _1622 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1636 = _1624 + _1634;
    float _1638 = _1628 * _1628;
    float _1640 = fma(_1632, _1632, _1638);
    float _1642 = fma(_1636, _1636, _1640);
    float _1644 = rsqrt(_1642);
    float _1646 = sqrt(_1642);
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1650 = _1632 * _1648;
    float _1652 = _1636 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 * _1652;
    float _1658 = _1654 + _1656;
    float _1660 = sqrt(_1658);
    bool _1662 = _1660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1666 = _1660 + _1664;
    float _1668 = _1636;
    float _1670 = _1666;
    float _1672 = _1628;
    if (_1662)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1668 = _1674;
    }
    float _1676 = _1668;
    if (_1662)
    {
        float _1678 = rsqrt(_1658);
        _1508 = _1678;
    }
    float _1680 = _1508;
    float _1682 = _1680;
    if (_1662)
    {
        float _1684 = _1666 * _1676;
        _1670 = _1684;
    }
    float _1686 = _1670;
    if (_1662)
    {
        float _1688 = _1686 * 0.15915493667125701904296875;
        _1510 = _1688;
    }
    float _1690 = _1510;
    float _1692 = _1644;
    float _1694 = _1690;
    if (_1662)
    {
        float _1696 = _1690 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        _1692 = _1698;
    }
    float _1700 = _1692;
    float _1702 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1704 = precise::max(0.0, _1702);
    float _1706 = _1676;
    float _1708 = _1704;
    if (_1662)
    {
        float _1710 = _1690 * 6.283185482025146484375;
        float _1712 = cos(_1710);
        _1706 = _1712;
    }
    float _1714 = _1706;
    float _1716 = -_1648;
    float _1718 = -_1704;
    float _1720 = fma(_1628, _1716, _1718);
    float _1722 = _1720;
    if (_1662)
    {
        float _1724 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1724;
    }
    float _1726 = _1672;
    float _1728 = _1726;
    if (!_1662)
    {
        _1694 = _1656;
    }
    float _1730 = _1694;
    float _1732 = _1700;
    float _1734 = _1730;
    if (_1662)
    {
        float _1736 = fma(_1700, _1726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1728 = _1736;
    }
    float _1738 = _1728;
    if (!_1662)
    {
        _1732 = _1654;
    }
    float _1740 = _1732;
    float _1742 = _1714;
    float _1744 = _1740;
    if (_1662)
    {
        float _1746 = _1714 + (-1.0);
        _1708 = _1746;
    }
    float _1748 = _1708;
    float _1750 = _1748;
    if (_1662)
    {
        float _1752 = _1680 * _1738;
        _1512 = _1752;
    }
    float _1754 = _1512;
    if (!_1662)
    {
        _1682 = _1650;
    }
    float _1756 = _1682;
    float _1758 = _1756;
    if (_1662)
    {
        float _1760 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1760;
    }
    float _1762 = _1750;
    if (_1662)
    {
        float _1764 = _1650 * _1754;
        _1758 = _1764;
    }
    float _1766 = _1758;
    if (_1662)
    {
        float _1768 = fma(_1720, _1714, _1762);
        _1722 = _1768;
    }
    float _1770 = _1722;
    if (!_1662)
    {
        _1742 = _1652;
    }
    float _1772 = _1742;
    float _1774 = _1772;
    if (_1662)
    {
        float _1776 = _1652 * _1754;
        _1774 = _1776;
    }
    float _1778 = _1774;
    if (_1662)
    {
        float _1780 = _1766 * _1766;
        _1744 = _1780;
    }
    float _1782 = _1744;
    float _1784 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1662)
    {
        float _1786 = _1778 * _1778;
        _1734 = _1786;
    }
    float _1788 = _1734;
    float _1790 = fma(_1770, _1770, _1782);
    float _1792 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1784);
    float _1794 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1796 = fma(_974, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1798 = _1790 + _1788;
    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1802 = fma(_1646, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1800);
    float _1804 = precise::clamp(_1802, 0.0, 1.0);
    float _1806 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1792);
    float _1808 = rsqrt(_1798);
    float _1810 = -_1804;
    float _1812 = _1810 + 1.0;
    float _1814 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1816 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1818 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1820 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1822 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1816);
    float _1824 = abs(_1812);
    float _1826 = log2(_1824);
    float _1828 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1830 = -_1820;
    float _1832 = fma(_1830, _1818, 1.0);
    float _1834 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1822);
    float _1836 = fma(_970, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1838 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1828);
    float _1840 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1794);
    float _1842 = _1808 * _1766;
    float _1844 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1838);
    float _1846 = _1808 * _1770;
    float _1848 = _1808 * _1778;
    float _1850 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1854 = floor(_1796);
    float _1856 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1840);
    float _1858 = -_1850;
    float _1860 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1864 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1866 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1868 = -_1848;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1872 = _1856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1874 = floor(_1836);
    float _1876 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1864);
    float _1878 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1880 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1876);
    float _1882 = log2(_1832);
    float _1884 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1880);
    float _1886 = -_1854;
    float _1888 = _1796 + _1886;
    float _1890 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1892 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1890);
    float _1894 = exp2(_1866);
    float _1896 = fma(_1870, -0.5, 0.5);
    float _1898 = fma(_1870, 0.5, 0.5);
    float _1900 = -_1874;
    float _1902 = _1836 + _1900;
    float _1904 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1878);
    float _1906 = _1846 + 1.0;
    float _1908 = fma(_1898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1910 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1892);
    float _1912 = 1.0 / _1884;
    float _1914 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1904);
    float _1916 = fma(_1898, _1908, -0.212114393711090087890625);
    float _1918 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1910);
    float _1920 = _1882 * 0.693147182464599609375;
    float _1922 = sqrt(_1896);
    float _1924 = -_1846;
    float _1926 = fma(_1894, _1906, _1924);
    float _1928 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1914);
    float _1930 = fma(_1898, _1916, 1.570728778839111328125);
    float2 _6103 = float2(_1888, _1902);
    float _1932 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6103, float2(0.0), isnan(_6103)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6103, float2(0.0), isnan(_6103)), level(0.0)).x;
    float _1934 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1936 = _1918 * _1912;
    float _1938 = _1928 * _1912;
    float _1940 = fma(_1926, 0.5, 0.5);
    float _1942 = fma(_1936, 0.5, 0.5);
    float _1944 = fma(_1938, -0.5, 0.5);
    float _1946 = _1922 * 0.636619746685028076171875;
    float _1948 = -_1930;
    float _1950 = fma(_1946, _1948, 1.0);
    float3 _6138 = float3(_1942, _1944, _1934);
    float _1952 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6138, float3(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6138, float3(0.0), isnan(_6138)), level(0.0)).x;
    float3 _6149 = float3(_1942, _1944, _1934);
    float4 _1955 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6149, float3(0.0), isnan(_6149)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6149, float3(0.0), isnan(_6149)), level(0.0)).xyzw;
    float _1957 = _1955.x;
    float _1959 = _1955.y;
    float _1961 = _1955.z;
    float _1963 = _1955.w;
    float2 _6165 = float2(_1950, _1940);
    float3 _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6165, float2(0.0), isnan(_6165)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6165, float2(0.0), isnan(_6165)), level(0.0)).xyz;
    float _1969 = _1967.x;
    float _1971 = _1967.y;
    float _1973 = _1967.z;
    out.m_61.x = _710;
    out.m_61.y = _712;
    out.m_61.z = _714;
    out.m_61.w = _716;
    bool _1975 = _746 > 0.5;
    float _1977 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1983 = in.m_59.x;
    float _1985 = exp2(_1977);
    int _1987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1989 = _1987 != 0;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1993 = _1991 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1997 = _1995 != 0;
    out.m_63.x = _1430;
    out.m_63.y = _1492;
    out.m_63.z = _1438;
    int _1999 = _1975 ? as_type<int>(_1406) : as_type<int>(_1354);
    float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2003 = _2001 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2005 = 1.0 / _1981;
    bool _2007 = _752 > 0.5;
    float _2009 = in.m_65.w;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2015 = _1997 ? as_type<float>(_1999) : _1354;
    float _2017 = _710;
    float _2019 = _1884;
    if (_1989)
    {
        float _2021 = in.m_53.z;
        _2017 = _2021;
    }
    float _2023 = _2017;
    int _2025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2027 = _2025 != 0;
    float _2029 = 1.0 / _1993;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2033 = _2031 != 0;
    float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2037 = _2035 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2041 = _2039 != 0;
    float _2043 = -_1985;
    float _2045 = _2043 + 1.0;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2049 = _2047 != 0;
    out.m_67.x = _1622;
    out.m_67.y = _1620;
    out.m_67.z = _1624;
    int _2051 = _2007 ? as_type<int>(_1406) : as_type<int>(_1354);
    float _2053 = 1.0 / _2003;
    float _2055 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2057 = _754 > 0.5;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2061 = _2059 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2063 = 1.0 / _2013;
    float _2065 = _2041 ? as_type<float>(_2051) : _1354;
    float _2067 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2071 = _2041;
    bool _2073 = _2057;
    if (_2027)
    {
        bool _2075 = _760 > 0.5;
        _2071 = _2075;
    }
    bool _2077 = _2071;
    float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2085 = _2083 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    if (_2049)
    {
        float _2087 = _2057 ? _1406 : _1354;
        _1514 = _2087;
    }
    float _2089 = _1514;
    out.m_69.w = _2009;
    float _2091 = 1.0 / _2037;
    float _2093 = _2085 * _2005;
    float _2095 = _2089;
    if (_1989)
    {
        bool _2097 = _2023 > 0.5;
        _2073 = _2097;
    }
    bool _2099 = _2073;
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2103 = _744 + _2101;
    bool _2105 = _1154 != 0.0;
    bool _2107 = isnan(_1154);
    bool _2109 = _2105 || _2107;
    bool _2111 = isnan(0.0);
    bool _2113 = _2109 || _2111;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2115;
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2123 = 1.0 / _2061;
    float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2127 = _744 + _2125;
    float _2129 = _2117 * _2029;
    float _2131 = _2121 * _2063;
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2135 = _744 + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2139 = _744 + _2137;
    float _2141 = 1.0 / _2069;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2143;
    float _2147 = _2081 * _2091;
    float _2149 = fma(_2131, _2127, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2153 = _744 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2157 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2155;
    float _2159 = fma(_2129, _2135, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2161 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2163 = isnan(_744);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2169 = _2165 || _2167;
    float _2171 = float(_2169);
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2177 = _2157 * _2123;
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2181 = _744 + _2179;
    float _2183 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2185 = _2175 * _2053;
    bool _2187 = _1152 == 0.0;
    bool _2189 = !_2113;
    bool _2191 = _2187 && _2189;
    float _2193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2195 = _2145 * _2141;
    float _2197 = fma(_2093, _2181, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2201 = _744 + _2199;
    float _2203 = fma(_2185, _2103, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2205 = fma(_2195, _2153, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2207 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2209 = fma(_2177, _2201, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2211 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2213 = isnan(_744);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2225 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2207);
    float _2227 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2183);
    bool _2229 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2231 = isnan(_744);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2237 = _2233 || _2235;
    int _2239 = _2237 ? 1065353216 : 0;
    float _2241 = -_2221;
    float _2243 = _2241 + 1.0;
    float _2245 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2225);
    float _2247 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2227);
    float _2249 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2251 = -_2171;
    float _2253 = _2251 + 1.0;
    bool _2255 = _1156 == 0.0;
    bool _2257 = _2255 && _2191;
    float _2259 = _2247 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2261 = fma(_2065, _2249, -0.5);
    bool _2263 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2265 = isnan(_744);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2271 = _2267 || _2269;
    float _2273 = float(_2271);
    float _2275 = _2221 * _2253;
    bool _2277 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2279 = isnan(_744);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = 1.0 / _2259;
    bool _2291 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2293 = isnan(_744);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2299 = _2295 || _2297;
    float _2301 = float(_2299);
    float _2303 = -_2273;
    float _2305 = _2303 + 1.0;
    float _2307 = _2273 * _2243;
    bool _2309 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2311 = isnan(_744);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2317 = _2313 || _2315;
    float _2319 = float(_2317);
    float _2321 = fma(_2147, _2139, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2323 = _2287 * _2305;
    float _2325 = -_2287;
    float _2327 = _2325 + 1.0;
    float _2329 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2331 = -_2319;
    float _2333 = _2331 + 1.0;
    float _2335 = _2147;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[30].w);
    int _2339 = _2239;
    float _2341 = _2171;
    if (!_2027)
    {
        _2335 = _1983;
    }
    float _2343 = _2335;
    float _2345 = _2319 * _2327;
    float _2347 = _2329 + _2259;
    float _2349 = _2301 * _2333;
    float _2351 = in.m_71.x;
    float _2353 = in.m_71.y;
    float _2355 = in.m_71.z;
    bool _2357 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2359 = isnan(_744);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2365 = _2361 || _2363;
    float _2367 = float(_2365);
    float _2369 = _2347 * _2289;
    float _2371 = _2369 * 0.5;
    float _2373 = -as_type<float>(_2239);
    float _2375 = _2373 + 1.0;
    float _2377 = _2223 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2381 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2383 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2381);
    float _2385 = _2367 * _2375;
    float _2387 = -_2367;
    float _2389 = _2387 + 1.0;
    float _2391 = -_2301;
    float _2393 = _2391 + 1.0;
    float _2395 = _2375;
    float _2397 = _2343;
    float _2399 = _2377;
    int _2401 = as_type<int>(_2389);
    if (_1989)
    {
        float _2403 = -_1983;
        float _2405 = _2403 + 1.0;
        _2337 = as_type<int>(_2405);
    }
    int _2407 = _2337;
    float _2409 = _2321 * _2385;
    float _2411 = fma(_2377, _2089, -0.5);
    float _2413 = 1.0 / _2383;
    float _2415 = as_type<float>(_2239) * _2393;
    float _2417 = fma(_2389, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2409);
    int _2419 = as_type<int>(_2409);
    if (_2027)
    {
        float _2421 = -_1983;
        float _2423 = _2421 + 1.0;
        _2339 = as_type<int>(_2423);
    }
    int _2425 = _2339;
    int _2427 = 0;
    float _2429 = as_type<float>(_2425);
    if (_2033)
    {
        float _2431 = -_1983;
        float _2433 = _2431 + 1.0;
        _2427 = as_type<int>(_2433);
    }
    int _2435 = _2427;
    if (!_2033)
    {
        _2395 = _1983;
    }
    float _2437 = _2395;
    float _2439 = -_1034;
    float _2441 = fma(_808, _2411, _2439);
    float _2443 = fma(_2197, _2415, _2417);
    float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2447 = _2437;
    if (_2027)
    {
        float _2449 = _2077 ? as_type<float>(_2425) : _1983;
        _2397 = _2449;
    }
    float _2451 = _2397;
    float _2453 = _2379 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2455 = _2351;
    float _2457 = _2353;
    if (_2257)
    {
        _2399 = _2353;
    }
    float _2459 = _2399;
    float _2461 = _2459;
    if (!_2257)
    {
        float _2463 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2351);
        _2455 = _2463;
    }
    float _2465 = _2455;
    float _2467 = 0.0;
    if (_2257)
    {
        _2467 = _2355;
    }
    float _2469 = _2467;
    float _2471 = fma(_2159, _2349, _2443);
    float _2473 = _2469;
    if (_2257)
    {
        _2095 = _2459;
    }
    float _2475 = _2095;
    float _2477 = _2475;
    if (_2257)
    {
        float _2479 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2459);
        _2401 = as_type<int>(_2479);
    }
    int _2481 = _2401;
    int _2483 = _2481;
    if (!_2257)
    {
        _2461 = _2353;
    }
    float _2485 = _2461;
    if (_2257)
    {
        float _2487 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2469);
        _2419 = as_type<int>(_2487);
    }
    int _2489 = _2419;
    int _2491 = _2489;
    if (_2257)
    {
        _2457 = _2469;
    }
    float _2493 = _2457;
    float _2495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2497 = _2493;
    if (!_2257)
    {
        _2473 = _2355;
    }
    float _2499 = _2473;
    float _2501 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2503 = _2413 * _2501;
    float _2505 = _2503;
    if (!_2257)
    {
        float _2507 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2485);
        _2483 = as_type<int>(_2507);
    }
    int _2509 = _2483;
    bool _2511 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2513 = isnan(0.5);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2519 = _2515 || _2517;
    float _2521 = _2445 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1989)
    {
        _2429 = _1983;
    }
    float _2523 = _2429;
    float _2525 = _2523;
    if (!_2257)
    {
        float _2527 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2499);
        _2491 = as_type<int>(_2527);
    }
    int _2529 = _2491;
    float _2531 = abs(_2503);
    float _2533 = log2(_2531);
    if (_1989)
    {
        float _2535 = _2099 ? as_type<float>(_2407) : _1983;
        _2525 = _2535;
    }
    float _2537 = _2525;
    float _2539 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2033)
    {
        float _2541 = _1975 ? as_type<float>(_2435) : _1983;
        _2447 = _2541;
    }
    float _2543 = _2447;
    float _2545 = fma(_2149, _2345, _2471);
    bool _2547 = !_2257;
    float _2549 = _2547 ? as_type<float>(_2529) : _2499;
    float _2551 = fma(_2453, _2537, -0.5);
    bool _2553 = !_2257;
    float _2555 = _2553 ? as_type<float>(_2509) : _2485;
    float _2557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2559 = fma(_2521, _2543, -0.5);
    float _2561 = fma(_810, _2551, _830);
    if (!_2519)
    {
        _868 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2563 = _868;
    float _2565 = _2555 * _2555;
    float _2567 = fma(_1066, _2559, _992);
    float _2569 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2571 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2573 = fma(_2549, _2549, _2565);
    float _2575 = _2563;
    if (!_2519)
    {
        float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2579 = _2563 + _2577;
        _2575 = _2579;
    }
    float _2581 = _2575;
    float _2583 = _2569 * _2495;
    float _2585 = -_1062;
    float _2587 = fma(_1032, _2261, _2585);
    float _2589 = fma(_2209, _2323, _2545);
    float _2591 = exp2(_2571);
    float _2593 = _2561 + 0.5;
    float _2595 = _2539 * _2557;
    float _2597 = _2441 + 0.5;
    float _2599 = _2567 + 0.5;
    float _2601 = fma(_2203, _2307, _2589);
    float _2603 = _2581;
    if (!_2257)
    {
        _2477 = as_type<float>(_2509);
    }
    float _2605 = _2477;
    float _2607 = _2539;
    if (!_2519)
    {
        float _2609 = 1.0 / _2581;
        _2607 = _2609;
    }
    float _2611 = _2607;
    out.m_73.x = _2595;
    out.m_73.y = _2583;
    out.m_73.z = _2593;
    out.m_73.w = _2597;
    float _2613 = fma(_2205, _2275, _2601);
    if (!_2257)
    {
        _2497 = as_type<float>(_2529);
    }
    float _2615 = _2497;
    float _2617 = _2587 + 0.5;
    bool _2619 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2621 = isnan(_1646);
    bool _2623 = _2619 || _2621;
    bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2627 = _2623 || _2625;
    float _2629 = fma(_2171, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2613);
    if (_2519)
    {
        _2341 = 1.0;
    }
    float _2631 = _2341;
    float _2633 = rsqrt(_2573);
    float _2635 = fma(_2591, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2637 = precise::clamp(_2635, 0.0, 1.0);
    float _2639 = _2631;
    if (!_2519)
    {
        float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2643 = _2503 + _2641;
        _2603 = _2643;
    }
    float _2645 = _2603;
    out.m_75.x = _2629;
    float _2647 = fma(_2637, -2.0, 3.0);
    float _2649 = _2637 * _2637;
    float _2651 = -_2605;
    float _2653 = _1412 * _2651;
    if (!_2519)
    {
        float _2655 = _2645 * _2611;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        _2639 = _2657;
    }
    float _2659 = _2639;
    out.m_77.x = _2599;
    out.m_77.y = _2617;
    float _2661 = _2649 * _2647;
    float _2663 = fma(_1430, _2465, _2653);
    float _2665 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2667 = _1434 * _2605;
    float _2669 = -_2661;
    float _2671 = _2669 + 1.0;
    float _2673 = _2555 * _2633;
    float _2675 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2665);
    float _2677 = _2549 * _2633;
    float _2679 = fma(_2671, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2661);
    float _2681 = -_2673;
    float _2683 = _1420 * _2681;
    float _2685 = -_2673;
    float _2687 = _1454 * _2685;
    float _2689 = -_2673;
    float _2691 = _1444 * _2689;
    float _2693 = fma(_1492, _2465, _2667);
    float _2695 = -_1412;
    float _2697 = fma(_2695, _2677, _2683);
    float _2699 = fma(_1434, _2677, _2687);
    float _2701 = fma(_1414, _2677, _2691);
    bool _2703 = _2503 <= 8000.0;
    bool _2705 = isnan(_2503);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(8000.0);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = in.m_79.x;
    float _2717 = _1414 * _2605;
    float _2719 = _1884 * 0.5;
    float _2721 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2675);
    float _2723 = _2713 * _2679;
    float _2725 = fma(_1438, _2465, _2717);
    float _2727 = fma(_1928, -0.5, _2719);
    float _2729 = fma(_1420, _2615, _2663);
    float _2731 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2733 = fma(_1444, _2615, _2725);
    float _2735 = _2701;
    float _2737 = _2697;
    if (!_2519)
    {
        _1516 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2739 = _1516;
    float _2741 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2721);
    float _2743 = _1918 + _1884;
    float _2745 = fma(_1454, _2615, _2693);
    float _2747 = _2739;
    float _2749 = _2741;
    if (!_2519)
    {
        float _2751 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2753 = _2739 + _2751;
        _2747 = _2753;
    }
    float _2755 = _2747;
    out.gl_Position.x = _1918;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _2741;
    out.gl_Position.w = _1884;
    float _2757 = _2741 + _1884;
    float _2759 = _2743 * 0.5;
    out.m_81.x = _2729;
    out.m_81.y = _2745;
    out.m_81.z = _2733;
    float _2761 = _2755;
    if (!_2519)
    {
        float _2763 = 1.0 / _2755;
        _2761 = _2763;
    }
    float _2765 = _2761;
    float _2767 = _2757 * 0.5;
    if (!_2519)
    {
        float _2769 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2771 = _2503 + _2769;
        _2505 = _2771;
    }
    float _2773 = _2505;
    out.m_83.x = _2697;
    out.m_83.y = _2699;
    out.m_83.z = _2701;
    out.m_85.x = _2759;
    out.m_85.y = _2727;
    out.m_85.z = _2767;
    out.m_85.w = _1884;
    float _2775 = -_2055;
    float _2777 = _2775 + 1.0;
    float _2779 = _2773;
    float _2781 = _2777;
    if (!_2627)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2783 = _2019;
    float _2785 = _2783;
    float _2787 = _2783;
    if (!_2627)
    {
        _2749 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2789 = _2749;
    float _2791 = _2789;
    float _2793 = _2789;
    if (_2519)
    {
        _2735 = 1.0;
    }
    float _2795 = _2735;
    float _2797 = _2795;
    if (!_2519)
    {
        float _2799 = _2773 * _2765;
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        _2779 = _2801;
    }
    float _2803 = _2779;
    if (!_2627)
    {
        _2737 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2805 = _2737;
    float _2807 = _2805;
    float _2809 = _2805;
    if (!_2519)
    {
        float _2811 = -_2803;
        float _2813 = _2811 + 1.0;
        _2797 = _2813;
    }
    float _2815 = _2797;
    float _2817 = _2659 * _2815;
    float _2819 = _2817 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2821 = _2817;
    if (!_2627)
    {
        _2821 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2823 = _2821;
    float _2825 = -_1932;
    float _2827 = _2825 + 1.0;
    float _2829 = _2827 * _2731;
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = -_2831;
    float _2835 = fma(_2833, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2837 = _2835 * _2715;
    float _2839 = _2837 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2841 = _2055 * _1952;
    float _2843 = _1963 * _2777;
    float _2845 = _2823;
    float _2847 = _2823;
    if (!_2627)
    {
        _2781 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2849 = _2781;
    out.m_87.x = _2839;
    float _2851 = _1963 * _2841;
    float _2853 = _1973 * _2841;
    float _2855 = fma(_1969, _2851, _1957);
    float _2857 = fma(_1971, _2851, _1959);
    float _2859 = fma(_1963, _2853, _1961);
    float _2861 = _2851;
    float _2863 = _2849;
    float _2865 = _2849;
    if (!_2627)
    {
        _2861 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2867 = _2861;
    out.m_89.x = _2855;
    out.m_89.y = _2857;
    out.m_89.z = _2859;
    out.m_89.w = _2843;
    bool _2869 = !_2627;
    float _2871 = _2867;
    float _2873 = _2867;
    if (!_2869)
    {
        bool _2875 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2877 = isnan(_1646);
        bool _2879 = _2875 || _2877;
        bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2883 = _2879 || _2881;
        if (!_2883)
        {
            float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2887 = _1646 + _2885;
            float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2891 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2889;
            float _2893 = 1.0 / _2891;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2901 = _2899 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2915 = _2887 * _2893;
            float _2917 = precise::clamp(_2915, 0.0, 1.0);
            float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2923 = fma(_2917, _2897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2925 = fma(_2917, _2921, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2927 = fma(_2917, _2901, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2929 = fma(_2917, _2905, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2931 = fma(_2917, _2909, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2933 = fma(_2917, _2913, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2787 = _2925;
            _2865 = _2931;
            _2809 = _2923;
            _2873 = _2929;
            _2793 = _2927;
            _2847 = _2933;
            _2935 = true;
        }
        else
        {
            bool _2937 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2939 = isnan(_1646);
            bool _2941 = _2937 || _2939;
            bool _2943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2945 = _2941 || _2943;
            if (!_2945)
            {
                _2807 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2947 = _2807;
            _2809 = _2947;
            if (!_2945)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2949 = _2785;
            _2787 = _2949;
            if (!_2945)
            {
                _2791 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2951 = _2791;
            _2793 = _2951;
            if (!_2945)
            {
                _2871 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2953 = _2871;
            _2873 = _2953;
            if (!_2945)
            {
                _2863 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2955 = _2863;
            _2865 = _2955;
            if (!_2945)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2957 = _2845;
            bool _2959 = !_2945;
            _2847 = _2957;
            if (!_2959)
            {
                bool _2961 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2963 = isnan(_1646);
                bool _2965 = _2961 || _2963;
                bool _2967 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2969 = _2965 || _2967;
                if (!_2969)
                {
                    float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2973 = _1646 + _2971;
                    float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2977 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2975;
                    float _2979 = 1.0 / _2977;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3001 = _2973 * _2979;
                    float _3003 = precise::clamp(_3001, 0.0, 1.0);
                    float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3007 = _3005 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3009 = fma(_3003, _2983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3011 = fma(_3003, _3007, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3013 = fma(_3003, _2987, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3015 = fma(_3003, _2991, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3017 = fma(_3003, _2995, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3019 = fma(_3003, _2999, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2787 = _3011;
                    _2865 = _3017;
                    _2809 = _3009;
                    _2873 = _3015;
                    _2793 = _3013;
                    _2847 = _3019;
                    _2935 = true;
                }
                else
                {
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2865 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2809 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2873 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2793 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2935 = false;
    float _3021 = _2787;
    float _3023 = _2865;
    float _3025 = _2809;
    float _3027 = _2873;
    float _3029 = _2793;
    float _3031 = _2847;
    float _3033 = fma(_2745, -0.5, 0.5);
    float _3035 = precise::clamp(_3033, 0.0, 1.0);
    float _3037 = -_3021;
    float _3039 = _3037 + _3023;
    float _3041 = _2819 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3043 = -_3025;
    float _3045 = _3043 + _3027;
    out.m_91.x = 0.0;
    float _3047 = fma(_3035, _3039, _3021);
    float _3049 = fma(_3035, _3045, _3025);
    out.m_49.x = _3041;
    float _3051 = -_3029;
    float _3053 = _3051 + _3031;
    float _3055 = _3047 * 0.586610972881317138671875;
    bool _3057 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3059 = fma(_3035, _3053, _3029);
    float _3061 = fma(_3049, 0.298911988735198974609375, _3055);
    bool _3063 = _2659 > 0.0;
    bool _3065 = isnan(_2659);
    bool _3067 = _3063 || _3065;
    bool _3069 = isnan(0.0);
    bool _3071 = _3067 || _3069;
    float _3073 = fma(_3059, 0.114477999508380889892578125, _3061);
    bool _3075 = _2815 <= 0.0;
    bool _3077 = !_3071;
    bool _3079 = _3075 || _3077;
    float _3081 = -_3073;
    float _3083 = _3049 + _3081;
    float _3085 = -_3073;
    float _3087 = _3047 + _3085;
    float _3089 = -_3073;
    float _3091 = _3059 + _3089;
    float _3093 = fma(_3083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3073);
    float _3095 = fma(_3087, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3073);
    float _3097 = fma(_3091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3073);
    bool _3099 = !_3057;
    if (!_3099)
    {
        float _3101 = -_1620;
        float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3105 = -_1622;
        float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3109 = -_1624;
        float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3113 = _3103 * _3103;
        float _3115 = fma(_3107, _3107, _3113);
        float _3117 = fma(_3111, _3111, _3115);
        float _3119 = sqrt(_3117);
        float _3121 = rsqrt(_3117);
        float _3123 = -_3119;
        float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3127 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3129 = precise::clamp(_3127, 0.0, 1.0);
        float _3131 = _3107 * _3121;
        float _3133 = _3103 * _3121;
        float _3135 = abs(_3129);
        float _3137 = log2(_3135);
        float _3139 = _3111 * _3121;
        float _3141 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3143 = _2745 * _3133;
        float _3145 = -_3133;
        float _3147 = -_3141;
        float _3149 = fma(_3145, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3147);
        float _3151 = fma(_2729, _3131, _3143);
        float _3153 = -_3139;
        float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3149);
        float _3157 = fma(_2733, _3139, _3151);
        float _3159 = precise::clamp(_3157, 0.0, 1.0);
        float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3163 = _3155 + _3161;
        float _3165 = _3137 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3167 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3169 = precise::clamp(_3167, 0.0, 1.0);
        float _3171 = exp2(_3165);
        float _3173 = _3171 * _3169;
        float _3175 = _3159 * _3173;
        float _3177 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3179 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3181 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3177;
        out.m_91.y = _3179;
        out.m_91.z = _3181;
    }
    out.m_93.x = _3093;
    out.m_93.y = _3095;
    out.m_93.z = _3097;
    if (!_3079)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3183 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3183;
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
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2935 = false;
    bool _742 = false;
    bool _514 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3239 = as_type<float>(_126);
        out.gl_Position.z = _3239;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_51.w;
    float _132 = float(_112);
    float _134 = -_130;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_130);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    bool _148 = _136 >= _132;
    bool _150 = !_146;
    bool _152 = _148 || _150;
    float _154 = _130;
    float _156 = _136;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _154;
    if (_152)
    {
        out.m_49.x = 0.0;
    }
    if (_152)
    {
        float _160 = _158 * 5.0;
        _128 = as_type<int>(_160);
    }
    int _162 = _128;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3304 = as_type<float>(_162);
        out.gl_Position.z = _3304;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _164 = 1.0 / _132;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = _136 * _164;
    bool _170 = !_166;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        _188 = _168;
    }
    _190 = false;
    float _192 = _188;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _196 = _192 + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _204 = _202 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = 1.0 / _200;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _216;
    float _220 = 1.0 / _204;
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = _192 + _222;
    float _226 = 1.0 / _208;
    float _228 = _224 * _214;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _232 = _192 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _236 = _192 + _234;
    bool _238 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _240 = isnan(_192);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _252 = 1.0 / _218;
    float _254 = _196 * _220;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _258 = _192 + _256;
    float _260 = 1.0 / _212;
    float _262 = _232 * _226;
    bool _264 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _266 = isnan(_192);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    bool _276 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _278 = isnan(_192);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = -_274;
    float _290 = _288 + 1.0;
    float _292 = _258 * _252;
    bool _294 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _296 = isnan(_192);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _308 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _306;
    bool _310 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_192);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -_304;
    float _324 = _322 + 1.0;
    float _326 = fma(_308, _228, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _328 = _236 * _260;
    float _330 = _304 * _290;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _336;
    float _340 = -_320;
    float _342 = _340 + 1.0;
    float _344 = _248 * _324;
    float _346 = fma(_334, _228, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _348 = fma(_338, _228, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _350 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _352 = isnan(_192);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = _286 * _342;
    float _364 = -_286;
    float _366 = _364 + 1.0;
    float _368 = -_248;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _376 = _360 * _366;
    float _378 = _320 * _370;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = _346 * _376;
    float _390 = -_360;
    float _392 = _390 + 1.0;
    float _394 = fma(_374, _254, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _254, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_386, _254, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = _326 * _376;
    float _402 = _348 * _376;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _388);
    float _410 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _412 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _414 = fma(_406, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _416 = fma(_394, _362, _408);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _418;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_398, _362, _410);
    float _428 = fma(_396, _362, _412);
    float _430 = fma(_414, _378, _416);
    float _432 = fma(_420, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _434 = fma(_424, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _448 = fma(_432, _378, _428);
    float _450 = fma(_438, _328, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _452 = fma(_442, _328, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_446, _328, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _456 = fma(_434, _378, _426);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _466;
    float _470 = fma(_450, _344, _430);
    float _472 = fma(_460, _292, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _474 = fma(_464, _292, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _476 = fma(_468, _292, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _478 = fma(_452, _344, _448);
    float _480 = fma(_454, _344, _456);
    float _482 = fma(_472, _330, _470);
    float _484 = fma(_474, _330, _478);
    float _486 = fma(_476, _330, _480);
    float _488 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[148].x, _482);
    float _490 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[148].y, _484);
    float _492 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[148].z, _486);
    bool _494 = !_250;
    float _512;
    if (!_494)
    {
        float _496 = in.m_53.x;
        float _498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _502 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _504 = _502 * _498;
        float _506 = floor(_504);
        float _508 = -_506;
        float _510 = _504 + _508;
        _512 = _510;
        _514 = true;
    }
    else
    {
        _512 = _168;
    }
    _514 = false;
    float _516 = _512;
    float _518 = in.m_55.x;
    float _520 = in.m_55.y;
    float _522 = in.m_55.z;
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _528;
    bool _532 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _534 = isnan(_516);
    bool _536 = _532 || _534;
    bool _538 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _540 = _536 || _538;
    float _542 = float(_540);
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = _544 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _548 = 1.0 / _526;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _552 = 1.0 / _546;
    float _554 = _492 * _522;
    float _556 = _490 * _520;
    float _558 = _530 * _548;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _562 = _516 + _560;
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _568 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _570 = isnan(_516);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = fma(_558, _562, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _582 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _584 = isnan(_516);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _566;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _600 = -_578;
    float _602 = _600 + 1.0;
    bool _604 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _606 = isnan(_516);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -_592;
    float _618 = _616 + 1.0;
    float _620 = _592 * _602;
    float _622 = -_542;
    float _624 = _622 + 1.0;
    float _626 = 1.0 / _598;
    float _628 = _614 * _618;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _632 = _630 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _634 = _578 * _624;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _636;
    float _640 = _580 * _628;
    float _642 = _632 * _552;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _646 = _516 + _644;
    float _648 = -_614;
    float _650 = _648 + 1.0;
    bool _652 = _516 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _654 = isnan(_516);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = _638 * _594;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _672 = _516 + _670;
    float _674 = fma(_642, _646, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _676 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _640);
    float _678 = -_662;
    float _680 = _678 + 1.0;
    float _682 = _668 * _626;
    float _684 = fma(_664, _672, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _688 = _516 + _686;
    float _690 = fma(_674, _620, _676);
    float _692 = _542 * _680;
    float _694 = fma(_682, _688, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _696 = fma(_684, _634, _690);
    float _698 = _488 * _518;
    float _700 = fma(_694, _692, _696);
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _708 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[119].x, _700);
    float _710 = _704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _716 = _708 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _718 = !_550;
    float _720 = _682;
    float _722 = _684;
    float _740;
    if (!_718)
    {
        float _724 = in.m_53.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _136);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        _740 = _168;
    }
    _742 = false;
    float _744 = _740;
    float _746 = in.m_53.y;
    float _748 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _750 = log2(_748);
    float _752 = in.m_53.z;
    float _754 = in.m_53.w;
    int _756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _758 = _756 != 0;
    float _760 = in.m_53.x;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _770 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _772 = _746 * 2.0;
    if (!_758)
    {
        _720 = _746;
    }
    float _774 = _720;
    float _776 = _752 * 2.0;
    float _778 = _774;
    if (!_758)
    {
        _722 = _752;
    }
    float _780 = _722;
    float _782 = floor(_772);
    float _784 = _780;
    if (_758)
    {
        _784 = _746;
    }
    float _786 = _784;
    float _788 = _760 * 2.0;
    float _790 = _786;
    if (_758)
    {
        _778 = _760;
    }
    float _792 = _778;
    float _794 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[83].w, _764);
    if (!_758)
    {
        _790 = _752;
    }
    float _796 = _790;
    float _798 = floor(_776);
    float _800 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[83].z, _762);
    float _802 = _792 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _804 = _796;
    if (_758)
    {
        _804 = _746;
    }
    float _806 = _804;
    float _808 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _794);
    float _810 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _800);
    float _812 = -_766;
    float _814 = fma(_802, 2.0, _812);
    bool _816 = _782 >= 0.0;
    bool _818 = isnan(_782);
    bool _820 = _816 || _818;
    bool _822 = isnan(0.0);
    bool _824 = _820 || _822;
    float _826 = floor(_788);
    float _828 = -_136;
    float _830 = fma(_828, (*spvDescriptorSet0.vp_c9)._m0[81].x, _814);
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _834 = _832 != 0;
    int _836 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _838 = _836 != 0;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _842 = _840 != 0;
    bool _844 = _782 > 0.0;
    float _846 = in.m_46.x;
    float _848 = in.m_46.y;
    float _850 = in.m_46.z;
    bool _852 = _798 > 0.0;
    int _854 = _824 ? 0 : 1;
    bool _856 = _798 >= 0.0;
    bool _858 = isnan(_798);
    bool _860 = _856 || _858;
    bool _862 = isnan(0.0);
    bool _864 = _860 || _862;
    float _866 = _798;
    float _868 = _810;
    if (_758)
    {
        _866 = _760;
    }
    float _870 = _866;
    float _872 = _870;
    if (!_758)
    {
        _872 = _752;
    }
    float _874 = _872;
    int _876 = _864 ? 0 : 1;
    bool _878 = !_834;
    int _880 = _878 ? 0 : 1;
    float _882 = _874 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _884 = ~_854;
    int _886 = _884 + 1;
    int _888 = _886 + 1;
    int _890 = ~_876;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = -_768;
    float _898 = fma(_882, 2.0, _896);
    int _900 = _888;
    int _902 = _894;
    if (!_844)
    {
        int _904 = ~_854;
        int _906 = _904 + 1;
        _900 = _906;
    }
    int _908 = _900;
    float _910 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (!_852)
    {
        int _912 = ~_876;
        int _914 = _912 + 1;
        _902 = _914;
    }
    int _916 = _902;
    float _918 = _752 + _760;
    bool _920 = _826 > 0.0;
    float _922 = _848 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _924 = _848 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _926 = _918 + (-1.0);
    float _928 = fma(_910, -2.0, _770);
    float _930 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[6].x, _922);
    float _932 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[4].x, _924);
    bool _934 = _826 >= 0.0;
    bool _936 = isnan(_826);
    bool _938 = _934 || _936;
    bool _940 = isnan(0.0);
    bool _942 = _938 || _940;
    float _944 = _746 + _760;
    float _946 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    float _948 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _950 = _926;
    bool _952 = _942;
    float _954 = _850;
    if (_758)
    {
        _950 = _746;
    }
    float _956 = _950;
    float _958 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _960 = _956;
    if (!_758)
    {
        _960 = _760;
    }
    float _962 = _960;
    float _964 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[4].z, _932);
    float _966 = _750 * _136;
    float _968 = _944 + (-1.0);
    float _970 = _946 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _972 = _962 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _974 = _964 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _976 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _978 = exp2(_966);
    float _980 = fma(_972, -2.0, _958);
    float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _984 = _974 + _982;
    float _986 = -_970;
    float _988 = _986 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _990 = -_136;
    float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[86].x, _898);
    bool _994 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _996 = isnan(1.0);
    bool _998 = _994 || _996;
    bool _1000 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1002 = _998 || _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1006 = 1.0 + _1004;
    float _1008 = abs(_984);
    float _1010 = abs(_988);
    float _1012 = precise::max(_1008, _1010);
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1016 = abs(_880);
    float _1018 = 1.0 / _1006;
    bool _1020 = _1012 >= 16.0;
    float _1022 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1014);
    float _1024 = float(_1016);
    float _1026 = -_978;
    float _1028 = _1026 + 1.0;
    float _1030 = float(_916);
    float _1032 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1022);
    float _1034 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _928);
    bool _1036 = !_842;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = _1024 * _1030;
    bool _1042 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1044 = isnan(0.0);
    bool _1046 = _1042 || _1044;
    bool _1048 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1050 = _1046 || _1048;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1054 = abs(_1038);
    float _1056 = _1040 * (-2.0);
    float _1058 = _1050 ? _1028 : 0.0;
    float _1060 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1052);
    float _1062 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[86].y, _980);
    float _1064 = fma(_976, _1056, _976);
    float _1066 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1060);
    float _1068 = _988;
    if (_1002)
    {
        float _1070 = _1058 * _1018;
        _156 = _1070;
    }
    float _1072 = _156;
    float _1074 = _760 + (-0.5);
    float _1076 = _984 * 0.0625;
    float _1078 = float(_1054);
    int _1080 = as_type<int>(_1072);
    if (_1020)
    {
        float _1082 = _988 * 0.0625;
        _1068 = _1082;
    }
    float _1084 = _1068;
    float _1086 = float(_908);
    float _1088 = _1074 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    int _1090 = _942 ? 0 : 1;
    bool _1092 = !_838;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = _1078 * _1086;
    float _1098 = _1020 ? _1076 : _984;
    float _1100 = fma(_1064, _1072, _1088);
    int _1102 = ~_1090;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    float _1108 = _1096 * (-2.0);
    int _1110 = abs(_1094);
    float _1112 = _1100 * 0.15915493667125701904296875;
    int _1114 = _1106;
    if (!_920)
    {
        int _1116 = ~_1090;
        int _1118 = _1116 + 1;
        _1114 = _1118;
    }
    int _1120 = _1114;
    float _1122 = _746 + _752;
    float _1124 = abs(_1098);
    bool _1126 = _1124 != 0.0;
    bool _1128 = isnan(_1124);
    bool _1130 = _1126 || _1128;
    bool _1132 = isnan(0.0);
    bool _1134 = _1130 || _1132;
    float _1136 = _1112 * 6.283185482025146484375;
    float _1138 = sin(_1136);
    float _1140 = _1122 + (-1.0);
    float _1142 = abs(_1084);
    bool _1144 = _1142 == 0.0;
    bool _1146 = !_1134;
    bool _1148 = _1144 && _1146;
    float _1150 = float(_1120);
    float _1152 = in.m_57.x;
    float _1154 = in.m_57.y;
    float _1156 = in.m_57.z;
    float _1158 = float(_1110);
    float _1160 = _1112 * 6.283185482025146484375;
    float _1162 = cos(_1160);
    float _1164 = abs(_1084);
    bool _1166 = _1164 == 0.0;
    float _1168 = _1158 * _1150;
    float _1170 = fma(_948, _1108, _948);
    float _1172 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1174 = _752 + (-0.5);
    float _1176 = _1168 * (-2.0);
    float _1178 = _746 + (-0.5);
    int _1180 = as_type<int>(_1178);
    if (_1148)
    {
        bool _1182 = as_type<int>(_1084) >= 0;
        _952 = _1182;
    }
    bool _1184 = _952;
    float _1186 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1188 = fma(_1172, _1176, _1172);
    float _1190 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    int _1192 = _1184 ? (-1) : 0;
    if (_1148)
    {
        int _1194 = _1184 ? 0 : 1078530011;
        _1180 = _1194;
    }
    int _1196 = _1180;
    float _1198 = fma(_1170, _1072, _1186);
    float _1200 = fma(_1188, _1072, _1190);
    if (_1148)
    {
        int _1202 = int(0x80000000) & as_type<int>(_1098);
        int _1204 = _1196 | _1202;
        _1080 = _1204;
    }
    int _1206 = _1080;
    bool _1208 = !_1134;
    bool _1210 = _1208 && _1166;
    int _1212 = _1206;
    float _1214 = as_type<float>(_1206);
    if (!_1210)
    {
        float _1216 = abs(_1098);
        bool _1218 = _1216 != as_type<float>(0x7f800000u /* inf */);
        bool _1220 = isnan(_1216);
        bool _1222 = _1218 || _1220;
        bool _1224 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1226 = _1222 || _1224;
        float _1228 = abs(_1084);
        bool _1230 = _1228 == as_type<float>(0x7f800000u /* inf */);
        float _1232 = abs(_1084);
        bool _1234 = _1232 == as_type<float>(0x7f800000u /* inf */);
        bool _1236 = !_1226;
        bool _1238 = _1234 && _1236;
        if (_1238)
        {
            bool _1240 = as_type<int>(_1084) >= 0;
            _1192 = _1240 ? (-1) : 0;
        }
        int _1242 = _1192;
        if (_1238)
        {
            _1212 = 1075235812;
        }
        int _1244 = _1212;
        int _1246 = _1244;
        if (_1238)
        {
            int _1248 = ~_1242;
            int _1250 = (_1248 != 0) ? _1244 : 1061752795;
            _1246 = _1250;
        }
        int _1252 = _1246;
        float _1254 = as_type<float>(_1252);
        if (_1238)
        {
            int _1256 = int(0x80000000) & as_type<int>(_1098);
            int _1258 = _1252 | _1256;
            _1254 = as_type<float>(_1258);
        }
        float _1260 = _1254;
        bool _1262 = !_1226;
        bool _1264 = _1262 && _1230;
        _1214 = _1260;
        if (!_1264)
        {
            float _1266 = abs(_1084);
            float _1268 = abs(_1098);
            float _1270 = precise::max(_1266, _1268);
            float _1272 = abs(_1084);
            float _1274 = abs(_1098);
            float _1276 = precise::min(_1272, _1274);
            float _1278 = 1.0 / _1270;
            float _1280 = abs(_1098);
            float _1282 = abs(_1084);
            bool _1284 = _1280 > _1282;
            bool _1286 = as_type<int>(_1084) >= 0;
            float _1288 = _1276 * _1278;
            float _1290 = abs(_1084);
            float _1292 = abs(_1098);
            float _1294 = _1290 + _1292;
            int _1296 = as_type<int>(_1098) & int(0x80000000);
            float _1298 = _1288 * _1288;
            bool _1300 = _1294 > as_type<float>(0x7f800000u /* inf */);
            bool _1302 = isnan(_1294);
            bool _1304 = _1300 || _1302;
            bool _1306 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1308 = _1304 || _1306;
            float _1310 = _1298 + 11.33538818359375;
            float _1312 = fma(_1298, _1310, 28.84246826171875);
            float _1314 = fma(_1298, _1312, 19.6966705322265625);
            float _1316 = fma(_1298, -0.82336294651031494140625, -5.674867153167724609375);
            float _1318 = fma(_1298, _1316, -6.565555095672607421875);
            float _1320 = 1.0 / _1314;
            float _1322 = _1298 * _1318;
            float _1324 = _1288 * _1322;
            float _1326 = fma(_1324, _1320, _1288);
            float _1328 = _1326;
            _1214 = _1294;
            if (_1284)
            {
                float _1330 = -_1326;
                float _1332 = _1330 + 1.57079637050628662109375;
                _1328 = _1332;
            }
            float _1334 = _1328;
            int _1336 = as_type<int>(_1334);
            if (!_1286)
            {
                float _1338 = -_1334;
                float _1340 = _1338 + 3.1415927410125732421875;
                _1336 = as_type<int>(_1340);
            }
            int _1342 = _1336;
            if (!_1308)
            {
                int _1344 = _1296 | _1342;
                _1214 = as_type<float>(_1344);
            }
        }
    }
    float _1346 = _1214;
    float _1348 = -_1346;
    float _1350 = _1200 + _1348;
    float _1352 = _1198 * 0.15915493667125701904296875;
    float _1354 = in.m_59.y;
    float _1356 = _1350 * 0.15915493667125701904296875;
    float _1358 = _1352 * 6.283185482025146484375;
    float _1360 = cos(_1358);
    float _1362 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1364 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1154);
    float _1366 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1368 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1152);
    float _1370 = _554 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1372 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1156);
    float _1374 = _1364 * _1362;
    float _1376 = _1356 * 6.283185482025146484375;
    float _1378 = sin(_1376);
    float _1380 = _1368 * _1366;
    float _1382 = _1372 * _1370;
    float _1384 = _848 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1386 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1388 = isnan(0.5);
    bool _1390 = _1386 || _1388;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1394 = _1390 || _1392;
    float _1396 = _1356 * 6.283185482025146484375;
    float _1398 = cos(_1396);
    float _1400 = fma((*spvDescriptorSet0.vp_c9)._m0[193].x, 0.25, _168);
    float _1402 = fma(_846, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1384);
    float _1404 = -_1354;
    float _1406 = _1404 + 1.0;
    float _1408 = fma(_850, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1402);
    float _1410 = _1352 * 6.283185482025146484375;
    float _1412 = sin(_1410);
    float _1414 = _1138 * _1360;
    float _1416 = _1162 * _1378;
    float _1418 = _1138 * _1378;
    float _1420 = _1378 * _1360;
    float _1422 = _1414 * _1374;
    float _1424 = _1408 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1426 = _1138 * _1398;
    float _1428 = _1162 * _1398;
    float _1430 = _1398 * _1360;
    float _1432 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1434 = _1162 * _1360;
    float _1436 = -_1416;
    float _1438 = fma(_1412, _1426, _1436);
    float _1440 = -_1374;
    float _1442 = _1412 * _1440;
    float _1444 = fma(_1412, _1418, _1428);
    float _1446 = _1434 * _1374;
    float _1448 = fma(_1438, _1380, _1422);
    float _1450 = fma(_1430, _1380, _1442);
    float _1452 = -_1426;
    float _1454 = fma(_1412, _1416, _1452);
    float _1456 = fma(_1444, _1382, _1448);
    float _1458 = fma(_1420, _1382, _1450);
    float _1460 = _970 + _1456;
    float _1462 = _974 + _1458;
    float _1464 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1466 = _1460 + _1464;
    float _1468 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1470 = _1462 + _1468;
    float _1472 = _1466 * _1432;
    float _1474 = _1470 * _1432;
    float _1476 = fma(_1472, _1400, _1460);
    float _1478 = fma(_1474, _1400, _1462);
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1482 = _1476 + _1480;
    float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1486 = _1478 + _1484;
    float _1488 = _1482 * _1482;
    float _1490 = fma(_1486, _1486, _1488);
    float _1492 = fma(_1412, _1428, _1418);
    float _1494 = sqrt(_1490);
    float _1496 = fma(_1492, _1380, _1446);
    float _1498 = fma(_1454, _1382, _1496);
    float _1500 = _1424 + _1498;
    bool _1502 = _1494 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = _1446;
    float _1506 = _1408;
    float _1508 = _1478;
    float _1510 = _1382;
    float _1512 = _1426;
    float _1514 = _1354;
    float _1516 = _1444;
    if (!_1502)
    {
        _1504 = _1478;
    }
    float _1518 = _1504;
    float _1520 = _1518;
    if (!_1502)
    {
        _954 = _1476;
    }
    float _1522 = _954;
    float _1524 = _1522;
    if (!_1502)
    {
        _1506 = _1500;
    }
    float _1526 = _1506;
    bool _1528 = !_1502;
    float _1530 = _1526;
    if (!_1528)
    {
        float _1532 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1534 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1536 = _1494 + _1534;
        float _1538 = _1500 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1540 = rsqrt(_1490);
        float _1542 = _1536 * _1532;
        float _1544 = _1542 * 0.15915493667125701904296875;
        float _1546 = _1544 * 6.283185482025146484375;
        float _1548 = cos(_1546);
        float _1550 = _1544 * 6.283185482025146484375;
        float _1552 = sin(_1550);
        float _1554 = _1548 + (-1.0);
        float _1556 = _1554 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1558 = fma(_1552, _1538, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1560 = fma(_1500, _1548, _1556);
        float _1562 = _1540 * _1558;
        float _1564 = fma(_1486, _1562, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1566 = fma(_1482, _1562, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1520 = _1564;
        _1530 = _1560;
        _1524 = _1566;
    }
    float _1568 = _1520;
    float _1570 = _1530;
    float _1572 = _1524;
    float _1574 = _1570;
    float _1576 = _1568;
    float _1578 = _1572;
    if (!_1394)
    {
        float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1582 = _1424 + _1580;
        float _1584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1586 = -_974;
        float _1588 = _1586 + _1568;
        float _1590 = -_1424;
        float _1592 = _1590 + _1570;
        float _1594 = _1582 * _1582;
        float _1596 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1598 = _970 + _1596;
        float _1600 = -_970;
        float _1602 = _1600 + _1572;
        float _1604 = fma(_984, _984, _1594);
        float _1606 = fma(_1598, _1598, _1604);
        float _1608 = sqrt(_1606);
        float _1610 = precise::min(_1608, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1612 = _1610 * _1584;
        float _1614 = fma(_1588, _1612, _974);
        float _1616 = fma(_1592, _1612, _1424);
        float _1618 = fma(_1602, _1612, _970);
        _1574 = _1616;
        _1576 = _1614;
        _1578 = _1618;
    }
    float _1620 = _1574;
    float _1622 = _1576;
    float _1624 = _1578;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1628 = _1620 + _1626;
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1632 = _1622 + _1630;
    float _1634 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1636 = _1624 + _1634;
    float _1638 = _1628 * _1628;
    float _1640 = fma(_1632, _1632, _1638);
    float _1642 = fma(_1636, _1636, _1640);
    float _1644 = rsqrt(_1642);
    float _1646 = sqrt(_1642);
    float _1648 = _1644 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1650 = _1632 * _1648;
    float _1652 = _1636 * _1648;
    float _1654 = _1650 * _1650;
    float _1656 = _1652 * _1652;
    float _1658 = _1654 + _1656;
    float _1660 = sqrt(_1658);
    bool _1662 = _1660 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1664 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1666 = _1660 + _1664;
    float _1668 = _1636;
    float _1670 = _1666;
    float _1672 = _1628;
    if (_1662)
    {
        float _1674 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1668 = _1674;
    }
    float _1676 = _1668;
    if (_1662)
    {
        float _1678 = rsqrt(_1658);
        _1508 = _1678;
    }
    float _1680 = _1508;
    float _1682 = _1680;
    if (_1662)
    {
        float _1684 = _1666 * _1676;
        _1670 = _1684;
    }
    float _1686 = _1670;
    if (_1662)
    {
        float _1688 = _1686 * 0.15915493667125701904296875;
        _1510 = _1688;
    }
    float _1690 = _1510;
    float _1692 = _1644;
    float _1694 = _1690;
    if (_1662)
    {
        float _1696 = _1690 * 6.283185482025146484375;
        float _1698 = sin(_1696);
        _1692 = _1698;
    }
    float _1700 = _1692;
    float _1702 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1704 = precise::max(0.0, _1702);
    float _1706 = _1676;
    float _1708 = _1704;
    if (_1662)
    {
        float _1710 = _1690 * 6.283185482025146484375;
        float _1712 = cos(_1710);
        _1706 = _1712;
    }
    float _1714 = _1706;
    float _1716 = -_1648;
    float _1718 = -_1704;
    float _1720 = fma(_1628, _1716, _1718);
    float _1722 = _1720;
    if (_1662)
    {
        float _1724 = _1720 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1672 = _1724;
    }
    float _1726 = _1672;
    float _1728 = _1726;
    if (!_1662)
    {
        _1694 = _1656;
    }
    float _1730 = _1694;
    float _1732 = _1700;
    float _1734 = _1730;
    if (_1662)
    {
        float _1736 = fma(_1700, _1726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1728 = _1736;
    }
    float _1738 = _1728;
    if (!_1662)
    {
        _1732 = _1654;
    }
    float _1740 = _1732;
    float _1742 = _1714;
    float _1744 = _1740;
    if (_1662)
    {
        float _1746 = _1714 + (-1.0);
        _1708 = _1746;
    }
    float _1748 = _1708;
    float _1750 = _1748;
    if (_1662)
    {
        float _1752 = _1680 * _1738;
        _1512 = _1752;
    }
    float _1754 = _1512;
    if (!_1662)
    {
        _1682 = _1650;
    }
    float _1756 = _1682;
    float _1758 = _1756;
    if (_1662)
    {
        float _1760 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1750 = _1760;
    }
    float _1762 = _1750;
    if (_1662)
    {
        float _1764 = _1650 * _1754;
        _1758 = _1764;
    }
    float _1766 = _1758;
    if (_1662)
    {
        float _1768 = fma(_1720, _1714, _1762);
        _1722 = _1768;
    }
    float _1770 = _1722;
    if (!_1662)
    {
        _1742 = _1652;
    }
    float _1772 = _1742;
    float _1774 = _1772;
    if (_1662)
    {
        float _1776 = _1652 * _1754;
        _1774 = _1776;
    }
    float _1778 = _1774;
    if (_1662)
    {
        float _1780 = _1766 * _1766;
        _1744 = _1780;
    }
    float _1782 = _1744;
    float _1784 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1662)
    {
        float _1786 = _1778 * _1778;
        _1734 = _1786;
    }
    float _1788 = _1734;
    float _1790 = fma(_1770, _1770, _1782);
    float _1792 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1784);
    float _1794 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1796 = fma(_974, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1798 = _1790 + _1788;
    float _1800 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1802 = fma(_1646, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1800);
    float _1804 = precise::clamp(_1802, 0.0, 1.0);
    float _1806 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1792);
    float _1808 = rsqrt(_1798);
    float _1810 = -_1804;
    float _1812 = _1810 + 1.0;
    float _1814 = _1806 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1816 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1818 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1820 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1822 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1816);
    float _1824 = abs(_1812);
    float _1826 = log2(_1824);
    float _1828 = _1620 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1830 = -_1820;
    float _1832 = fma(_1830, _1818, 1.0);
    float _1834 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1822);
    float _1836 = fma(_970, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1838 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1828);
    float _1840 = fma(_1622, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1794);
    float _1842 = _1808 * _1766;
    float _1844 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1838);
    float _1846 = _1808 * _1770;
    float _1848 = _1808 * _1778;
    float _1850 = _1842 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1852 = _1844 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1854 = floor(_1796);
    float _1856 = fma(_1624, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1840);
    float _1858 = -_1850;
    float _1860 = fma(_1846, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1858);
    float _1862 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1864 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1866 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1868 = -_1848;
    float _1870 = fma(_1868, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1860);
    float _1872 = _1856 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1874 = floor(_1836);
    float _1876 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1864);
    float _1878 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1880 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1876);
    float _1882 = log2(_1832);
    float _1884 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1880);
    float _1886 = -_1854;
    float _1888 = _1796 + _1886;
    float _1890 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1892 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1890);
    float _1894 = exp2(_1866);
    float _1896 = fma(_1870, -0.5, 0.5);
    float _1898 = fma(_1870, 0.5, 0.5);
    float _1900 = -_1874;
    float _1902 = _1836 + _1900;
    float _1904 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1878);
    float _1906 = _1846 + 1.0;
    float _1908 = fma(_1898, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1910 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1892);
    float _1912 = 1.0 / _1884;
    float _1914 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1904);
    float _1916 = fma(_1898, _1908, -0.212114393711090087890625);
    float _1918 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1910);
    float _1920 = _1882 * 0.693147182464599609375;
    float _1922 = sqrt(_1896);
    float _1924 = -_1846;
    float _1926 = fma(_1894, _1906, _1924);
    float _1928 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1914);
    float _1930 = fma(_1898, _1916, 1.570728778839111328125);
    float2 _6103 = float2(_1888, _1902);
    float _1932 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6103, float2(0.0), isnan(_6103)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6103, float2(0.0), isnan(_6103)), level(0.0)).x;
    float _1934 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1936 = _1918 * _1912;
    float _1938 = _1928 * _1912;
    float _1940 = fma(_1926, 0.5, 0.5);
    float _1942 = fma(_1936, 0.5, 0.5);
    float _1944 = fma(_1938, -0.5, 0.5);
    float _1946 = _1922 * 0.636619746685028076171875;
    float _1948 = -_1930;
    float _1950 = fma(_1946, _1948, 1.0);
    float3 _6138 = float3(_1942, _1944, _1934);
    float _1952 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6138, float3(0.0), isnan(_6138)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6138, float3(0.0), isnan(_6138)), level(0.0)).x;
    float3 _6149 = float3(_1942, _1944, _1934);
    float4 _1955 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6149, float3(0.0), isnan(_6149)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6149, float3(0.0), isnan(_6149)), level(0.0)).xyzw;
    float _1957 = _1955.x;
    float _1959 = _1955.y;
    float _1961 = _1955.z;
    float _1963 = _1955.w;
    float2 _6165 = float2(_1950, _1940);
    float3 _1967 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6165, float2(0.0), isnan(_6165)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6165, float2(0.0), isnan(_6165)), level(0.0)).xyz;
    float _1969 = _1967.x;
    float _1971 = _1967.y;
    float _1973 = _1967.z;
    out.m_61.x = _710;
    out.m_61.y = _712;
    out.m_61.z = _714;
    out.m_61.w = _716;
    bool _1975 = _746 > 0.5;
    float _1977 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1979 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1981 = _1979 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1983 = in.m_59.x;
    float _1985 = exp2(_1977);
    int _1987 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1989 = _1987 != 0;
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1993 = _1991 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1997 = _1995 != 0;
    out.m_63.x = _1430;
    out.m_63.y = _1492;
    out.m_63.z = _1438;
    int _1999 = _1975 ? as_type<int>(_1406) : as_type<int>(_1354);
    float _2001 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2003 = _2001 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2005 = 1.0 / _1981;
    bool _2007 = _752 > 0.5;
    float _2009 = in.m_65.w;
    float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2013 = _2011 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2015 = _1997 ? as_type<float>(_1999) : _1354;
    float _2017 = _710;
    float _2019 = _1884;
    if (_1989)
    {
        float _2021 = in.m_53.z;
        _2017 = _2021;
    }
    float _2023 = _2017;
    int _2025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2027 = _2025 != 0;
    float _2029 = 1.0 / _1993;
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2033 = _2031 != 0;
    float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2037 = _2035 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2041 = _2039 != 0;
    float _2043 = -_1985;
    float _2045 = _2043 + 1.0;
    int _2047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2049 = _2047 != 0;
    out.m_67.x = _1622;
    out.m_67.y = _1620;
    out.m_67.z = _1624;
    int _2051 = _2007 ? as_type<int>(_1406) : as_type<int>(_1354);
    float _2053 = 1.0 / _2003;
    float _2055 = _2045 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2057 = _754 > 0.5;
    float _2059 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2061 = _2059 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2063 = 1.0 / _2013;
    float _2065 = _2041 ? as_type<float>(_2051) : _1354;
    float _2067 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2069 = _2067 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2071 = _2041;
    bool _2073 = _2057;
    if (_2027)
    {
        bool _2075 = _760 > 0.5;
        _2071 = _2075;
    }
    bool _2077 = _2071;
    float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2085 = _2083 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    if (_2049)
    {
        float _2087 = _2057 ? _1406 : _1354;
        _1514 = _2087;
    }
    float _2089 = _1514;
    out.m_69.w = _2009;
    float _2091 = 1.0 / _2037;
    float _2093 = _2085 * _2005;
    float _2095 = _2089;
    if (_1989)
    {
        bool _2097 = _2023 > 0.5;
        _2073 = _2097;
    }
    bool _2099 = _2073;
    float _2101 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2103 = _744 + _2101;
    bool _2105 = _1154 != 0.0;
    bool _2107 = isnan(_1154);
    bool _2109 = _2105 || _2107;
    bool _2111 = isnan(0.0);
    bool _2113 = _2109 || _2111;
    float _2115 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2115;
    float _2119 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2121 = _2119 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2123 = 1.0 / _2061;
    float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2127 = _744 + _2125;
    float _2129 = _2117 * _2029;
    float _2131 = _2121 * _2063;
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2135 = _744 + _2133;
    float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2139 = _744 + _2137;
    float _2141 = 1.0 / _2069;
    float _2143 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2145 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2143;
    float _2147 = _2081 * _2091;
    float _2149 = fma(_2131, _2127, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2151 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2153 = _744 + _2151;
    float _2155 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2157 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2155;
    float _2159 = fma(_2129, _2135, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2161 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2163 = isnan(_744);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2169 = _2165 || _2167;
    float _2171 = float(_2169);
    float _2173 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2177 = _2157 * _2123;
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2181 = _744 + _2179;
    float _2183 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2185 = _2175 * _2053;
    bool _2187 = _1152 == 0.0;
    bool _2189 = !_2113;
    bool _2191 = _2187 && _2189;
    float _2193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2195 = _2145 * _2141;
    float _2197 = fma(_2093, _2181, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2201 = _744 + _2199;
    float _2203 = fma(_2185, _2103, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2205 = fma(_2195, _2153, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2207 = _1424 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2209 = fma(_2177, _2201, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2211 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2213 = isnan(_744);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2225 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2207);
    float _2227 = fma(_974, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2183);
    bool _2229 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2231 = isnan(_744);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2237 = _2233 || _2235;
    int _2239 = _2237 ? 1065353216 : 0;
    float _2241 = -_2221;
    float _2243 = _2241 + 1.0;
    float _2245 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2225);
    float _2247 = fma(_970, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2227);
    float _2249 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2251 = -_2171;
    float _2253 = _2251 + 1.0;
    bool _2255 = _1156 == 0.0;
    bool _2257 = _2255 && _2191;
    float _2259 = _2247 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2261 = fma(_2065, _2249, -0.5);
    bool _2263 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2265 = isnan(_744);
    bool _2267 = _2263 || _2265;
    bool _2269 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2271 = _2267 || _2269;
    float _2273 = float(_2271);
    float _2275 = _2221 * _2253;
    bool _2277 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2279 = isnan(_744);
    bool _2281 = _2277 || _2279;
    bool _2283 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2285 = _2281 || _2283;
    float _2287 = float(_2285);
    float _2289 = 1.0 / _2259;
    bool _2291 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2293 = isnan(_744);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2299 = _2295 || _2297;
    float _2301 = float(_2299);
    float _2303 = -_2273;
    float _2305 = _2303 + 1.0;
    float _2307 = _2273 * _2243;
    bool _2309 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2311 = isnan(_744);
    bool _2313 = _2309 || _2311;
    bool _2315 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2317 = _2313 || _2315;
    float _2319 = float(_2317);
    float _2321 = fma(_2147, _2139, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2323 = _2287 * _2305;
    float _2325 = -_2287;
    float _2327 = _2325 + 1.0;
    float _2329 = _2245 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2331 = -_2319;
    float _2333 = _2331 + 1.0;
    float _2335 = _2147;
    int _2337 = as_type<int>((*spvDescriptorSet0.vp_c8)._m0[30].w);
    int _2339 = _2239;
    float _2341 = _2171;
    if (!_2027)
    {
        _2335 = _1983;
    }
    float _2343 = _2335;
    float _2345 = _2319 * _2327;
    float _2347 = _2329 + _2259;
    float _2349 = _2301 * _2333;
    float _2351 = in.m_71.x;
    float _2353 = in.m_71.y;
    float _2355 = in.m_71.z;
    bool _2357 = _744 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2359 = isnan(_744);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2365 = _2361 || _2363;
    float _2367 = float(_2365);
    float _2369 = _2347 * _2289;
    float _2371 = _2369 * 0.5;
    float _2373 = -as_type<float>(_2239);
    float _2375 = _2373 + 1.0;
    float _2377 = _2223 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2381 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2383 = fma(_2371, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2381);
    float _2385 = _2367 * _2375;
    float _2387 = -_2367;
    float _2389 = _2387 + 1.0;
    float _2391 = -_2301;
    float _2393 = _2391 + 1.0;
    float _2395 = _2375;
    float _2397 = _2343;
    float _2399 = _2377;
    int _2401 = as_type<int>(_2389);
    if (_1989)
    {
        float _2403 = -_1983;
        float _2405 = _2403 + 1.0;
        _2337 = as_type<int>(_2405);
    }
    int _2407 = _2337;
    float _2409 = _2321 * _2385;
    float _2411 = fma(_2377, _2089, -0.5);
    float _2413 = 1.0 / _2383;
    float _2415 = as_type<float>(_2239) * _2393;
    float _2417 = fma(_2389, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2409);
    int _2419 = as_type<int>(_2409);
    if (_2027)
    {
        float _2421 = -_1983;
        float _2423 = _2421 + 1.0;
        _2339 = as_type<int>(_2423);
    }
    int _2425 = _2339;
    int _2427 = 0;
    float _2429 = as_type<float>(_2425);
    if (_2033)
    {
        float _2431 = -_1983;
        float _2433 = _2431 + 1.0;
        _2427 = as_type<int>(_2433);
    }
    int _2435 = _2427;
    if (!_2033)
    {
        _2395 = _1983;
    }
    float _2437 = _2395;
    float _2439 = -_1034;
    float _2441 = fma(_808, _2411, _2439);
    float _2443 = fma(_2197, _2415, _2417);
    float _2445 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2447 = _2437;
    if (_2027)
    {
        float _2449 = _2077 ? as_type<float>(_2425) : _1983;
        _2397 = _2449;
    }
    float _2451 = _2397;
    float _2453 = _2379 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2455 = _2351;
    float _2457 = _2353;
    if (_2257)
    {
        _2399 = _2353;
    }
    float _2459 = _2399;
    float _2461 = _2459;
    if (!_2257)
    {
        float _2463 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2351);
        _2455 = _2463;
    }
    float _2465 = _2455;
    float _2467 = 0.0;
    if (_2257)
    {
        _2467 = _2355;
    }
    float _2469 = _2467;
    float _2471 = fma(_2159, _2349, _2443);
    float _2473 = _2469;
    if (_2257)
    {
        _2095 = _2459;
    }
    float _2475 = _2095;
    float _2477 = _2475;
    if (_2257)
    {
        float _2479 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2459);
        _2401 = as_type<int>(_2479);
    }
    int _2481 = _2401;
    int _2483 = _2481;
    if (!_2257)
    {
        _2461 = _2353;
    }
    float _2485 = _2461;
    if (_2257)
    {
        float _2487 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2469);
        _2419 = as_type<int>(_2487);
    }
    int _2489 = _2419;
    int _2491 = _2489;
    if (_2257)
    {
        _2457 = _2469;
    }
    float _2493 = _2457;
    float _2495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2497 = _2493;
    if (!_2257)
    {
        _2473 = _2355;
    }
    float _2499 = _2473;
    float _2501 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2503 = _2413 * _2501;
    float _2505 = _2503;
    if (!_2257)
    {
        float _2507 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2485);
        _2483 = as_type<int>(_2507);
    }
    int _2509 = _2483;
    bool _2511 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2513 = isnan(0.5);
    bool _2515 = _2511 || _2513;
    bool _2517 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2519 = _2515 || _2517;
    float _2521 = _2445 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (!_1989)
    {
        _2429 = _1983;
    }
    float _2523 = _2429;
    float _2525 = _2523;
    if (!_2257)
    {
        float _2527 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2499);
        _2491 = as_type<int>(_2527);
    }
    int _2529 = _2491;
    float _2531 = abs(_2503);
    float _2533 = log2(_2531);
    if (_1989)
    {
        float _2535 = _2099 ? as_type<float>(_2407) : _1983;
        _2525 = _2535;
    }
    float _2537 = _2525;
    float _2539 = _2451 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_2033)
    {
        float _2541 = _1975 ? as_type<float>(_2435) : _1983;
        _2447 = _2541;
    }
    float _2543 = _2447;
    float _2545 = fma(_2149, _2345, _2471);
    bool _2547 = !_2257;
    float _2549 = _2547 ? as_type<float>(_2529) : _2499;
    float _2551 = fma(_2453, _2537, -0.5);
    bool _2553 = !_2257;
    float _2555 = _2553 ? as_type<float>(_2509) : _2485;
    float _2557 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2559 = fma(_2521, _2543, -0.5);
    float _2561 = fma(_810, _2551, _830);
    if (!_2519)
    {
        _868 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2563 = _868;
    float _2565 = _2555 * _2555;
    float _2567 = fma(_1066, _2559, _992);
    float _2569 = _2015 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2571 = _2533 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2573 = fma(_2549, _2549, _2565);
    float _2575 = _2563;
    if (!_2519)
    {
        float _2577 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2579 = _2563 + _2577;
        _2575 = _2579;
    }
    float _2581 = _2575;
    float _2583 = _2569 * _2495;
    float _2585 = -_1062;
    float _2587 = fma(_1032, _2261, _2585);
    float _2589 = fma(_2209, _2323, _2545);
    float _2591 = exp2(_2571);
    float _2593 = _2561 + 0.5;
    float _2595 = _2539 * _2557;
    float _2597 = _2441 + 0.5;
    float _2599 = _2567 + 0.5;
    float _2601 = fma(_2203, _2307, _2589);
    float _2603 = _2581;
    if (!_2257)
    {
        _2477 = as_type<float>(_2509);
    }
    float _2605 = _2477;
    float _2607 = _2539;
    if (!_2519)
    {
        float _2609 = 1.0 / _2581;
        _2607 = _2609;
    }
    float _2611 = _2607;
    out.m_73.x = _2595;
    out.m_73.y = _2583;
    out.m_73.z = _2593;
    out.m_73.w = _2597;
    float _2613 = fma(_2205, _2275, _2601);
    if (!_2257)
    {
        _2497 = as_type<float>(_2529);
    }
    float _2615 = _2497;
    float _2617 = _2587 + 0.5;
    bool _2619 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2621 = isnan(_1646);
    bool _2623 = _2619 || _2621;
    bool _2625 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2627 = _2623 || _2625;
    float _2629 = fma(_2171, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2613);
    if (_2519)
    {
        _2341 = 1.0;
    }
    float _2631 = _2341;
    float _2633 = rsqrt(_2573);
    float _2635 = fma(_2591, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2637 = precise::clamp(_2635, 0.0, 1.0);
    float _2639 = _2631;
    if (!_2519)
    {
        float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2643 = _2503 + _2641;
        _2603 = _2643;
    }
    float _2645 = _2603;
    out.m_75.x = _2629;
    float _2647 = fma(_2637, -2.0, 3.0);
    float _2649 = _2637 * _2637;
    float _2651 = -_2605;
    float _2653 = _1412 * _2651;
    if (!_2519)
    {
        float _2655 = _2645 * _2611;
        float _2657 = precise::clamp(_2655, 0.0, 1.0);
        _2639 = _2657;
    }
    float _2659 = _2639;
    out.m_77.x = _2599;
    out.m_77.y = _2617;
    float _2661 = _2649 * _2647;
    float _2663 = fma(_1430, _2465, _2653);
    float _2665 = _1852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2667 = _1434 * _2605;
    float _2669 = -_2661;
    float _2671 = _2669 + 1.0;
    float _2673 = _2555 * _2633;
    float _2675 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2665);
    float _2677 = _2549 * _2633;
    float _2679 = fma(_2671, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2661);
    float _2681 = -_2673;
    float _2683 = _1420 * _2681;
    float _2685 = -_2673;
    float _2687 = _1454 * _2685;
    float _2689 = -_2673;
    float _2691 = _1444 * _2689;
    float _2693 = fma(_1492, _2465, _2667);
    float _2695 = -_1412;
    float _2697 = fma(_2695, _2677, _2683);
    float _2699 = fma(_1434, _2677, _2687);
    float _2701 = fma(_1414, _2677, _2691);
    bool _2703 = _2503 <= 8000.0;
    bool _2705 = isnan(_2503);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan(8000.0);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = in.m_79.x;
    float _2717 = _1414 * _2605;
    float _2719 = _1884 * 0.5;
    float _2721 = fma(_1814, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2675);
    float _2723 = _2713 * _2679;
    float _2725 = fma(_1438, _2465, _2717);
    float _2727 = fma(_1928, -0.5, _2719);
    float _2729 = fma(_1420, _2615, _2663);
    float _2731 = _2723 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2733 = fma(_1444, _2615, _2725);
    float _2735 = _2701;
    float _2737 = _2697;
    if (!_2519)
    {
        _1516 = (*spvDescriptorSet0.vp_c9)._m0[140].w;
    }
    float _2739 = _1516;
    float _2741 = fma(_1872, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2721);
    float _2743 = _1918 + _1884;
    float _2745 = fma(_1454, _2615, _2693);
    float _2747 = _2739;
    float _2749 = _2741;
    if (!_2519)
    {
        float _2751 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2753 = _2739 + _2751;
        _2747 = _2753;
    }
    float _2755 = _2747;
    out.gl_Position.x = _1918;
    out.gl_Position.y = _1928;
    out.gl_Position.z = _2741;
    out.gl_Position.w = _1884;
    float _2757 = _2741 + _1884;
    float _2759 = _2743 * 0.5;
    out.m_81.x = _2729;
    out.m_81.y = _2745;
    out.m_81.z = _2733;
    float _2761 = _2755;
    if (!_2519)
    {
        float _2763 = 1.0 / _2755;
        _2761 = _2763;
    }
    float _2765 = _2761;
    float _2767 = _2757 * 0.5;
    if (!_2519)
    {
        float _2769 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2771 = _2503 + _2769;
        _2505 = _2771;
    }
    float _2773 = _2505;
    out.m_83.x = _2697;
    out.m_83.y = _2699;
    out.m_83.z = _2701;
    out.m_85.x = _2759;
    out.m_85.y = _2727;
    out.m_85.z = _2767;
    out.m_85.w = _1884;
    float _2775 = -_2055;
    float _2777 = _2775 + 1.0;
    float _2779 = _2773;
    float _2781 = _2777;
    if (!_2627)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2783 = _2019;
    float _2785 = _2783;
    float _2787 = _2783;
    if (!_2627)
    {
        _2749 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2789 = _2749;
    float _2791 = _2789;
    float _2793 = _2789;
    if (_2519)
    {
        _2735 = 1.0;
    }
    float _2795 = _2735;
    float _2797 = _2795;
    if (!_2519)
    {
        float _2799 = _2773 * _2765;
        float _2801 = precise::clamp(_2799, 0.0, 1.0);
        _2779 = _2801;
    }
    float _2803 = _2779;
    if (!_2627)
    {
        _2737 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2805 = _2737;
    float _2807 = _2805;
    float _2809 = _2805;
    if (!_2519)
    {
        float _2811 = -_2803;
        float _2813 = _2811 + 1.0;
        _2797 = _2813;
    }
    float _2815 = _2797;
    float _2817 = _2659 * _2815;
    float _2819 = _2817 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2821 = _2817;
    if (!_2627)
    {
        _2821 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2823 = _2821;
    float _2825 = -_1932;
    float _2827 = _2825 + 1.0;
    float _2829 = _2827 * _2731;
    float _2831 = precise::clamp(_2829, 0.0, 1.0);
    float _2833 = -_2831;
    float _2835 = fma(_2833, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2837 = _2835 * _2715;
    float _2839 = _2837 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2841 = _2055 * _1952;
    float _2843 = _1963 * _2777;
    float _2845 = _2823;
    float _2847 = _2823;
    if (!_2627)
    {
        _2781 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2849 = _2781;
    out.m_87.x = _2839;
    float _2851 = _1963 * _2841;
    float _2853 = _1973 * _2841;
    float _2855 = fma(_1969, _2851, _1957);
    float _2857 = fma(_1971, _2851, _1959);
    float _2859 = fma(_1963, _2853, _1961);
    float _2861 = _2851;
    float _2863 = _2849;
    float _2865 = _2849;
    if (!_2627)
    {
        _2861 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2867 = _2861;
    out.m_89.x = _2855;
    out.m_89.y = _2857;
    out.m_89.z = _2859;
    out.m_89.w = _2843;
    bool _2869 = !_2627;
    float _2871 = _2867;
    float _2873 = _2867;
    if (!_2869)
    {
        bool _2875 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2877 = isnan(_1646);
        bool _2879 = _2875 || _2877;
        bool _2881 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2883 = _2879 || _2881;
        if (!_2883)
        {
            float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2887 = _1646 + _2885;
            float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2891 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2889;
            float _2893 = 1.0 / _2891;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2901 = _2899 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2911 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2915 = _2887 * _2893;
            float _2917 = precise::clamp(_2915, 0.0, 1.0);
            float _2919 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2921 = _2919 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2923 = fma(_2917, _2897, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2925 = fma(_2917, _2921, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2927 = fma(_2917, _2901, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2929 = fma(_2917, _2905, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2931 = fma(_2917, _2909, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2933 = fma(_2917, _2913, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2787 = _2925;
            _2865 = _2931;
            _2809 = _2923;
            _2873 = _2929;
            _2793 = _2927;
            _2847 = _2933;
            _2935 = true;
        }
        else
        {
            bool _2937 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2939 = isnan(_1646);
            bool _2941 = _2937 || _2939;
            bool _2943 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2945 = _2941 || _2943;
            if (!_2945)
            {
                _2807 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2947 = _2807;
            _2809 = _2947;
            if (!_2945)
            {
                _2785 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2949 = _2785;
            _2787 = _2949;
            if (!_2945)
            {
                _2791 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2951 = _2791;
            _2793 = _2951;
            if (!_2945)
            {
                _2871 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2953 = _2871;
            _2873 = _2953;
            if (!_2945)
            {
                _2863 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2955 = _2863;
            _2865 = _2955;
            if (!_2945)
            {
                _2845 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2957 = _2845;
            bool _2959 = !_2945;
            _2847 = _2957;
            if (!_2959)
            {
                bool _2961 = _1646 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2963 = isnan(_1646);
                bool _2965 = _2961 || _2963;
                bool _2967 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2969 = _2965 || _2967;
                if (!_2969)
                {
                    float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2973 = _1646 + _2971;
                    float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2977 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2975;
                    float _2979 = 1.0 / _2977;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2997 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2999 = _2997 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3001 = _2973 * _2979;
                    float _3003 = precise::clamp(_3001, 0.0, 1.0);
                    float _3005 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3007 = _3005 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3009 = fma(_3003, _2983, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3011 = fma(_3003, _3007, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3013 = fma(_3003, _2987, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3015 = fma(_3003, _2991, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3017 = fma(_3003, _2995, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3019 = fma(_3003, _2999, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2787 = _3011;
                    _2865 = _3017;
                    _2809 = _3009;
                    _2873 = _3015;
                    _2793 = _3013;
                    _2847 = _3019;
                    _2935 = true;
                }
                else
                {
                    _2787 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2865 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2809 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2873 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2793 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2847 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2935 = false;
    float _3021 = _2787;
    float _3023 = _2865;
    float _3025 = _2809;
    float _3027 = _2873;
    float _3029 = _2793;
    float _3031 = _2847;
    float _3033 = fma(_2745, -0.5, 0.5);
    float _3035 = precise::clamp(_3033, 0.0, 1.0);
    float _3037 = -_3021;
    float _3039 = _3037 + _3023;
    float _3041 = _2819 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3043 = -_3025;
    float _3045 = _3043 + _3027;
    out.m_91.x = 0.0;
    float _3047 = fma(_3035, _3039, _3021);
    float _3049 = fma(_3035, _3045, _3025);
    out.m_49.x = _3041;
    float _3051 = -_3029;
    float _3053 = _3051 + _3031;
    float _3055 = _3047 * 0.586610972881317138671875;
    bool _3057 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3059 = fma(_3035, _3053, _3029);
    float _3061 = fma(_3049, 0.298911988735198974609375, _3055);
    bool _3063 = _2659 > 0.0;
    bool _3065 = isnan(_2659);
    bool _3067 = _3063 || _3065;
    bool _3069 = isnan(0.0);
    bool _3071 = _3067 || _3069;
    float _3073 = fma(_3059, 0.114477999508380889892578125, _3061);
    bool _3075 = _2815 <= 0.0;
    bool _3077 = !_3071;
    bool _3079 = _3075 || _3077;
    float _3081 = -_3073;
    float _3083 = _3049 + _3081;
    float _3085 = -_3073;
    float _3087 = _3047 + _3085;
    float _3089 = -_3073;
    float _3091 = _3059 + _3089;
    float _3093 = fma(_3083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3073);
    float _3095 = fma(_3087, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3073);
    float _3097 = fma(_3091, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3073);
    bool _3099 = !_3057;
    if (!_3099)
    {
        float _3101 = -_1620;
        float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3105 = -_1622;
        float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3109 = -_1624;
        float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3113 = _3103 * _3103;
        float _3115 = fma(_3107, _3107, _3113);
        float _3117 = fma(_3111, _3111, _3115);
        float _3119 = sqrt(_3117);
        float _3121 = rsqrt(_3117);
        float _3123 = -_3119;
        float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3127 = _3125 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3129 = precise::clamp(_3127, 0.0, 1.0);
        float _3131 = _3107 * _3121;
        float _3133 = _3103 * _3121;
        float _3135 = abs(_3129);
        float _3137 = log2(_3135);
        float _3139 = _3111 * _3121;
        float _3141 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3143 = _2745 * _3133;
        float _3145 = -_3133;
        float _3147 = -_3141;
        float _3149 = fma(_3145, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3147);
        float _3151 = fma(_2729, _3131, _3143);
        float _3153 = -_3139;
        float _3155 = fma(_3153, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3149);
        float _3157 = fma(_2733, _3139, _3151);
        float _3159 = precise::clamp(_3157, 0.0, 1.0);
        float _3161 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3163 = _3155 + _3161;
        float _3165 = _3137 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3167 = _3163 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3169 = precise::clamp(_3167, 0.0, 1.0);
        float _3171 = exp2(_3165);
        float _3173 = _3171 * _3169;
        float _3175 = _3159 * _3173;
        float _3177 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3179 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3181 = _3175 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3177;
        out.m_91.y = _3179;
        out.m_91.z = _3181;
    }
    out.m_93.x = _3093;
    out.m_93.y = _3095;
    out.m_93.z = _3097;
    if (!_3079)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3183 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3183;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

