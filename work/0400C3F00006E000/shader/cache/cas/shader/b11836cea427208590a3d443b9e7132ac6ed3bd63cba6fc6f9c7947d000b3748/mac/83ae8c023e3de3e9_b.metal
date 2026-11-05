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
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 m_87 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2789 = false;
    bool _1002 = false;
    bool _822 = false;
    bool _642 = false;
    bool _516 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3093 = as_type<float>(_126);
        out.gl_Position.z = _3093;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_110);
        _120 = _144;
    }
    float _146 = _120;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
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
    int _158 = 0;
    if (_152)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3162 = as_type<float>(_162);
        out.gl_Position.z = _3162;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_53.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_110);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _194 + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = 1.0 / _202;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _218;
    float _222 = 1.0 / _210;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _194 + _224;
    bool _228 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _230 = isnan(_194);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    bool _240 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _242 = isnan(_194);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = 1.0 / _206;
    float _254 = _226 * _216;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = _194 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_262, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = 1.0 / _214;
    float _268 = _258 * _222;
    bool _270 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _272 = isnan(_194);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _284 = _194 + _282;
    bool _286 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _288 = isnan(_194);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _300 = -_280;
    float _302 = _300 + 1.0;
    float _304 = 1.0 / _220;
    float _306 = _198 * _252;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = _194 + _308;
    bool _312 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _314 = isnan(_194);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_296;
    float _326 = _324 + 1.0;
    float _328 = _284 * _266;
    float _330 = _296 * _302;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = _322 * _326;
    float _338 = -_322;
    float _340 = _338 + 1.0;
    bool _342 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_194);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = fma(_334, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _360 = _310 * _304;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _362;
    float _366 = _238 * _340;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = fma(_358, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _374 = fma(_364, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -_238;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = fma(_370, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _386 = _250 * _378;
    float _388 = -_250;
    float _390 = _388 + 1.0;
    float _392 = fma(_382, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _394 = _352 * _390;
    float _396 = -_352;
    float _398 = _396 + 1.0;
    float _400 = _374 * _394;
    float _402 = _354 * _394;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = _264 * _394;
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _416 = fma(_406, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _418 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _420 = fma(_372, _386, _410);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _428;
    float _432 = fma(_414, _328, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _438 = fma(_392, _386, _418);
    float _440 = fma(_416, _366, _420);
    float _442 = fma(_424, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_384, _386, _426);
    float _446 = fma(_430, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _452 = fma(_436, _328, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_442, _366, _444);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _460;
    float _464 = fma(_450, _328, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _466 = fma(_446, _366, _438);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _468;
    float _472 = fma(_432, _336, _440);
    float _474 = fma(_458, _360, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _476 = fma(_462, _360, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _478 = fma(_470, _360, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _480 = fma(_452, _336, _466);
    float _482 = fma(_464, _336, _454);
    float _484 = fma(_474, _330, _472);
    float _486 = fma(_476, _330, _480);
    float _488 = fma(_478, _330, _482);
    float _490 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[148].x, _484);
    float _492 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[148].y, _486);
    float _494 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[148].z, _488);
    bool _496 = !_298;
    float _514;
    if (!_496)
    {
        float _498 = in.m_53.x;
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _506 = _504 * _500;
        float _508 = floor(_506);
        float _510 = -_508;
        float _512 = _506 + _510;
        _514 = _512;
        _516 = true;
    }
    else
    {
        float _518 = float(_110);
        float _520 = 1.0 / _518;
        float _522 = _142 * _520;
        _514 = _522;
    }
    _516 = false;
    float _524 = _514;
    float _526 = in.m_55.x;
    float _528 = in.m_55.y;
    float _530 = in.m_55.z;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _534 = _524 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _536;
    bool _540 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _542 = isnan(_524);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    bool _552 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _554 = 1.0 / _538;
    float _556 = _492 * _528;
    bool _558 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _560 = isnan(_524);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _534 * _554;
    float _572 = _494 * _530;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _574;
    float _578 = -_568;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = _550 * _580;
    float _592 = fma(_576, _570, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _594 = fma(_584, _570, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _596 = fma(_588, _570, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = -_550;
    float _600 = _598 + 1.0;
    float _602 = _592 * _590;
    float _604 = _594 * _590;
    float _606 = _596 * _590;
    float _608 = _490 * _526;
    float _610 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].y, _602);
    float _612 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].x, _604);
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].z, _606);
    float _616 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[108].y, _610);
    float _618 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[108].x, _612);
    float _620 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[108].z, _614);
    bool _622 = !_552;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_110);
        float _646 = 1.0 / _644;
        float _648 = _142 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _654 = _650 + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _664 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _666 = isnan(_650);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _680 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _682 = isnan(_650);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _658;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _694;
    float _698 = -_674;
    float _700 = _698 + 1.0;
    bool _702 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _704 = isnan(_650);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    bool _714 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _716 = 1.0 / _662;
    float _718 = 1.0 / _678;
    float _720 = _696 * _692;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _726 = _690 * _700;
    float _728 = -_690;
    float _730 = _728 + 1.0;
    float _732 = fma(_720, _654, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _734;
    float _738 = _712 * _730;
    float _740 = _724 * _716;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _744 = _650 + _742;
    bool _746 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _748 = isnan(_650);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = _732 * _738;
    float _760 = -_712;
    float _762 = _760 + 1.0;
    float _764 = fma(_740, _744, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _768 = _650 + _766;
    float _770 = _736 * _718;
    float _772 = -_756;
    float _774 = _772 + 1.0;
    float _776 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[115].x, _758);
    float _778 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _780 = fma(_770, _768, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _782 = _674 * _774;
    float _784 = fma(_764, _726, _776);
    float _786 = _778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _788 = fma(_780, _782, _784);
    float _790 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _792 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _794 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[118].x, _788);
    float _796 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _794 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _786;
    out.m_57.y = _796;
    out.m_57.z = _798;
    out.m_57.w = _800;
    bool _802 = !_714;
    float _820;
    if (!_802)
    {
        float _804 = in.m_53.x;
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _808 = _804 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        float _824 = float(_110);
        float _826 = 1.0 / _824;
        float _828 = _142 * _826;
        _820 = _828;
    }
    _822 = false;
    float _830 = _820;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _834 = _830 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _844 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _846 = isnan(_830);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _860 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _862 = isnan(_830);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / _838;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _874;
    float _878 = -_854;
    float _880 = _878 + 1.0;
    bool _882 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _884 = isnan(_830);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    bool _894 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _896 = 1.0 / _842;
    float _898 = 1.0 / _858;
    float _900 = _876 * _872;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _906 = _870 * _880;
    float _908 = -_870;
    float _910 = _908 + 1.0;
    float _912 = fma(_900, _834, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _914;
    float _918 = _892 * _910;
    float _920 = _904 * _896;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _924 = _830 + _922;
    bool _926 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _928 = isnan(_830);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _912 * _918;
    float _940 = -_892;
    float _942 = _940 + 1.0;
    float _944 = fma(_920, _924, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _948 = _830 + _946;
    float _950 = _916 * _898;
    float _952 = -_936;
    float _954 = _952 + 1.0;
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[131].x, _938);
    float _958 = fma(_950, _948, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _960 = _854 * _954;
    float _962 = fma(_944, _906, _956);
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _966 = fma(_958, _960, _962);
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _970 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _974 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[134].x, _966);
    float _976 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _970;
    out.m_59.y = _976;
    out.m_59.z = _978;
    out.m_59.w = _980;
    bool _982 = !_894;
    float _1000;
    if (!_982)
    {
        float _984 = in.m_53.x;
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _988 = _984 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[14].x, _142);
        float _992 = _990 * _986;
        float _994 = floor(_992);
        float _996 = -_994;
        float _998 = _992 + _996;
        _1000 = _998;
        _1002 = true;
    }
    else
    {
        float _1004 = float(_110);
        float _1006 = 1.0 / _1004;
        float _1008 = _142 * _1006;
        _1000 = _1008;
    }
    _1002 = false;
    float _1010 = _1000;
    float _1012 = in.m_53.w;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1016 = _1010 + _1014;
    float _1018 = in.m_61.y;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1022 = _1020 != 0;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1026 = _1010 + _1024;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1030 = _1028 != 0;
    float _1032 = in.m_53.y;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1036 = _1034 != 0;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1038;
    float _1042 = in.m_53.z;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1046 = _1044 != 0;
    float _1048 = 1.0 / _1040;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1054 = in.m_53.x;
    float _1056 = in.m_61.x;
    float _1058 = 1.0 / _1052;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1060;
    bool _1064 = _1012 > 0.5;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1068 = in.m_46.x;
    float _1070 = in.m_46.y;
    float _1072 = in.m_46.z;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1074;
    float _1078 = -_1018;
    float _1080 = _1078 + 1.0;
    bool _1082 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1084 = isnan(_1010);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = 1.0 / _1062;
    bool _1096 = _1032 > 0.5;
    bool _1098 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1100 = isnan(_1010);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1112 = _1042 > 0.5;
    float _1114 = _1016 * _1058;
    int _1116 = _1096 ? as_type<int>(_1080) : as_type<int>(_1018);
    float _1118 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1120 = _1112 ? as_type<int>(_1080) : as_type<int>(_1018);
    float _1122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1124 = _1030 ? as_type<float>(_1116) : _1018;
    float _1126 = -_1110;
    float _1128 = fma(_1118, 2.0, _1126);
    float _1130 = _1036 ? as_type<float>(_1120) : _1018;
    float _1132 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1136 = _1134 != 0;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1140 = _1010 + _1138;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1144 = _1142 != 0;
    float _1146 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1148 = _1018;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    bool _1152 = _1022;
    float _1154 = _1032;
    float _1156 = _1056;
    if (_1022)
    {
        float _1158 = _1064 ? _1080 : _1018;
        _1148 = _1158;
    }
    float _1160 = _1148;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1166 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1168 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1146);
    float _1170 = 1.0 / _1164;
    float _1172 = fma(_1132, -2.0, _1066);
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1174;
    float _1178 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1166);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1182 = _1010 + _1180;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = _1140 * _1048;
    float _1190 = 1.0 / _1176;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1196 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1198 = _1182 * _1094;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1202 = _1010 + _1200;
    float _1204 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1196);
    float _1206 = 1.0 / _1194;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1210 = _1010 + _1208;
    if (_1186)
    {
        _1150 = _1054;
    }
    float _1212 = _1150;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1216;
    float _1220 = _1210 * _1170;
    float _1222 = _1212;
    if (!_1186)
    {
        _1222 = _1042;
    }
    float _1224 = _1222;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1228 = 1.0 / _1218;
    float _1230 = _1026 * _1190;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1234 = _1010 + _1232;
    float _1236 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1214);
    float _1238 = _1224;
    if (_1046)
    {
        bool _1240 = _1054 > 0.5;
        _1152 = _1240;
    }
    bool _1242 = _1152;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1246 = _1202 * _1206;
    float _1248 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1226);
    float _1250 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1244);
    if (!_1186)
    {
        _1154 = _1054;
    }
    float _1252 = _1154;
    float _1254 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1178);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1258 = _1234 * _1228;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1260;
    float _1264 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1256);
    float _1266 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1204);
    float _1268 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1168);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1278 = fma(_1262, _1188, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1280 = fma(_1076, _1188, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1286;
    float _1290 = fma(_1272, _1114, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1294 = _1292 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1296 = fma(_1276, _1114, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1304 = fma(_1284, _1198, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1310;
    float _1314 = fma(_1294, _1220, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1320 = fma(_1300, _1220, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1326 = fma(_1308, _1230, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1328 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1330 = isnan(_1010);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = fma(_1312, _1230, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1342 = fma(_1318, _1246, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1344 = fma(_1324, _1246, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _1346 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1348 = isnan(_1010);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = -_1338;
    float _1360 = _1358 + 1.0;
    float _1362 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1364 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1366 = _1356 * _1360;
    float _1368 = -_1356;
    float _1370 = _1368 + 1.0;
    float _1372 = -_1092;
    float _1374 = _1372 + 1.0;
    float _1376 = fma(_1362, _1124, -0.5);
    bool _1378 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1380 = isnan(_1010);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1092 * _1370;
    float _1392 = -_1108;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_1130, _1364, -0.5);
    float _1398 = _1108 * _1374;
    bool _1400 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1402 = isnan(_1010);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1172);
    bool _1414 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1416 = isnan(_1010);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = fma(_1288, _1198, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _1428 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1430 = isnan(_1010);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = _1388 * _1394;
    float _1442 = -_1388;
    float _1444 = _1442 + 1.0;
    float _1446 = -_1424;
    float _1448 = _1446 + 1.0;
    float _1450 = -_1438;
    float _1452 = _1450 + 1.0;
    float _1454 = _1438 * _1444;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1460;
    float _1464 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1236);
    float _1466 = fma(_1458, _1258, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1468 = fma(_1462, _1258, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    int _1470 = as_type<int>(_1462);
    float _1472 = _1288;
    float _1474 = _1268;
    if (_1046)
    {
        float _1476 = -_1056;
        float _1478 = _1476 + 1.0;
        _1470 = as_type<int>(_1478);
    }
    int _1480 = _1470;
    float _1482 = -_1412;
    float _1484 = fma(_1464, _1376, _1482);
    int _1486 = _1480;
    if (!_1046)
    {
        _1472 = _1056;
    }
    float _1488 = _1472;
    float _1490 = _1424 * _1452;
    float _1492 = _1410 * _1448;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1498 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1502 = _1488;
    if (_1046)
    {
        float _1504 = _1242 ? as_type<float>(_1480) : _1056;
        _1502 = _1504;
    }
    float _1506 = _1502;
    float _1508 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_1136)
    {
        float _1510 = -_1056;
        float _1512 = _1510 + 1.0;
        _1486 = as_type<int>(_1512);
    }
    int _1514 = _1486;
    float _1516 = _1278 * _1492;
    float _1518 = -_1410;
    float _1520 = _1518 + 1.0;
    float _1522 = -_1496;
    float _1524 = fma(_1498, 2.0, _1522);
    float _1526 = fma(_1508, -2.0, _1494);
    if (!_1136)
    {
        _1238 = _1056;
    }
    float _1528 = _1238;
    float _1530 = _1280 * _1492;
    float _1532 = _1528;
    if (_1136)
    {
        float _1534 = _1112 ? as_type<float>(_1514) : _1056;
        _1532 = _1534;
    }
    float _1536 = _1532;
    float _1538 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1516);
    float _1540 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1248);
    float _1542 = -_142;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1128);
    float _1546 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1264);
    float _1548 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1250);
    float _1550 = -_142;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1524);
    float _1554 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1526);
    float _1556 = fma(_1290, _1490, _1538);
    float _1558 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1560 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1562 = -_1554;
    float _1564 = fma(_1548, _1396, _1562);
    float _1566 = _1268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1568 = fma(_1558, _1506, -0.5);
    float _1570 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1530);
    float _1572 = _1254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1566 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1580 = _1560 + _1578;
    float _1582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1584 = fma(_1296, _1490, _1570);
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1588 = fma(_1304, _1454, _1556);
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1592 = _1572 + _1590;
    int _1594 = 0;
    float _1596 = _1566;
    if (_1144)
    {
        float _1598 = -_1056;
        float _1600 = _1598 + 1.0;
        _1594 = as_type<int>(_1600);
    }
    int _1602 = _1594;
    float _1604 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1586);
    float _1606 = fma(_1314, _1440, _1588);
    float _1608 = fma(_1426, _1454, _1584);
    float _1610 = _1576 * _1576;
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1604);
    float _1614 = fma(_1326, _1398, _1606);
    if (_1144)
    {
        float _1616 = _1096 ? as_type<float>(_1602) : _1056;
        _1156 = _1616;
    }
    float _1618 = _1156;
    float _1620 = in.m_63.w;
    float _1622 = fma(_1320, _1440, _1608);
    bool _1624 = _1612 >= 0.0;
    float _1626 = fma(_1580, _1580, _1610);
    float _1628 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1630 = fma(_1340, _1398, _1622);
    float _1632 = fma(_1342, _1390, _1614);
    float _1634 = fma(_1592, _1592, _1626);
    float _1636 = fma(_1628, _1618, -0.5);
    float _1638 = fma(_1344, _1390, _1630);
    float _1640 = fma(_1540, _1568, _1544);
    float _1642 = rsqrt(_1634);
    float _1644 = fma(_1546, _1636, _1552);
    float _1646 = fma(_1466, _1366, _1632);
    float _1648 = fma(_1468, _1366, _1638);
    if (_1624)
    {
        _1474 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1650 = _1474;
    float _1652 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1654 = _1484 + 0.5;
    float _1656 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1658 = _1564 + 0.5;
    float _1660 = _1644 + 0.5;
    float _1662 = _1640 + 0.5;
    int _1664 = as_type<int>(_1650);
    if (_1624)
    {
        float _1666 = _1650 * 5.0;
        _1664 = as_type<int>(_1666);
    }
    int _1668 = _1664;
    float _1670 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1646);
    float _1672 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1648);
    out.m_65.w = _1620;
    float _1674 = _1576 * _1642;
    float _1676 = _1580 * _1642;
    out.m_67.x = _1662;
    out.m_67.y = _1654;
    out.m_67.z = _1656;
    out.m_67.w = _1652;
    out.m_69.x = _1660;
    out.m_69.y = _1658;
    if (_1624)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5702 = as_type<float>(_1668);
        out.gl_Position.z = _5702;
    }
    out.m_71.x = _1670;
    out.m_71.y = _1672;
    if (_1624)
    {
        out.m_49.x = 0.0;
    }
    if (_1624)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1678 = -_1674;
    float _1680 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1682 = _1592 * _1642;
    float _1684 = -_1676;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1560);
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1690 = _1680 + _1688;
    float _1692 = -_1682;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1572);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1698 = _1686 + _1696;
    float _1700 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1704 = _1694 + _1702;
    float _1706 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1700);
    float _1708 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1706);
    bool _1710 = _1708 >= 0.0;
    float _1712 = _1704;
    float _1714 = _1682;
    if (_1710)
    {
        _1712 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1716 = _1712;
    int _1718 = as_type<int>(_1716);
    if (_1710)
    {
        out.m_49.x = 0.0;
    }
    if (_1710)
    {
        float _1720 = _1716 * 5.0;
        _1718 = as_type<int>(_1720);
    }
    int _1722 = _1718;
    if (_1710)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5802 = as_type<float>(_1722);
        out.gl_Position.z = _5802;
    }
    if (_1710)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1724 = -_1566;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = -_1560;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1732 = -_1572;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1736 = -_1674;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _1740 = _1726 * _1726;
    float _1742 = -_1676;
    float _1744 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1580);
    float _1746 = -_1682;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1592);
    float _1750 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1752 = fma(_1730, _1730, _1740);
    float _1754 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1756 = fma(_1734, _1734, _1752);
    float _1758 = _1738 * _1738;
    float _1760 = rsqrt(_1756);
    float _1762 = fma(_1744, _1744, _1758);
    float _1764 = fma(_1748, _1748, _1762);
    float _1766 = sqrt(_1764);
    float _1768 = _1730 * _1760;
    float _1770 = _1734 * _1760;
    float _1772 = _1726 * _1760;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1776 = _1768 * _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1780 = _1770 * _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1784 = -_1776;
    float _1786 = fma(_1770, _1782, _1784);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1790 = _1772 * _1788;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1794 = -_1780;
    float _1796 = fma(_1772, _1792, _1794);
    float _1798 = _1642 * _1766;
    float _1800 = _1786 * _1786;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1804 = -_1790;
    float _1806 = fma(_1768, _1802, _1804);
    float _1808 = in.m_73.x;
    float _1810 = in.m_73.y;
    float _1812 = in.m_73.z;
    float _1814 = _1798 * _1750;
    float _1816 = fma(_1796, _1796, _1800);
    float _1818 = fma(_1806, _1806, _1816);
    float _1820 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1822 = rsqrt(_1818);
    float _1824 = _1798 * _1820;
    float _1826 = _1798 * _1754;
    float _1828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1810);
    float _1830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1808);
    float _1832 = _1796 * _1822;
    float _1834 = _1786 * _1822;
    float _1836 = _1806 * _1822;
    float _1838 = _1824 * _1828;
    float _1840 = _1772 * _1832;
    float _1842 = _1770 * _1834;
    float _1844 = _1826 * _1830;
    float _1846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1812);
    float _1848 = -_1840;
    float _1850 = fma(_1768, _1834, _1848);
    float _1852 = -_1842;
    float _1854 = fma(_1772, _1836, _1852);
    float _1856 = _1768 * _1836;
    float _1858 = _1814 * _1846;
    float _1860 = _1838 * _1850;
    float _1862 = _1838 * _1854;
    float _1864 = -_1856;
    float _1866 = fma(_1770, _1832, _1864);
    float _1868 = fma(_1844, _1836, _1860);
    float _1870 = fma(_1844, _1832, _1862);
    float _1872 = fma(_1858, _1770, _1868);
    float _1874 = fma(_1858, _1768, _1870);
    float _1876 = _1572 + _1872;
    float _1878 = _1560 + _1874;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1882 = _1876 + _1880;
    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1886 = _1878 + _1884;
    float _1888 = _1882 * _1882;
    float _1890 = fma(_1886, _1886, _1888);
    float _1892 = _1838 * _1866;
    float _1894 = sqrt(_1890);
    float _1896 = fma(_1844, _1834, _1892);
    float _1898 = fma(_1858, _1772, _1896);
    float _1900 = _1566 + _1898;
    bool _1902 = _1894 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = _1898;
    float _1906 = _1878;
    float _1908 = _1876;
    float _1910 = _1896;
    float _1912 = _1894;
    float _1914 = _1882;
    if (!_1902)
    {
        _1904 = _1900;
    }
    float _1916 = _1904;
    bool _1918 = !_1902;
    float _1920 = _1916;
    if (!_1918)
    {
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1926 = _1894 + _1924;
        float _1928 = _1900 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = rsqrt(_1890);
        float _1932 = _1926 * _1922;
        float _1934 = _1932 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = _1934 * 6.283185482025146484375;
        float _1942 = sin(_1940);
        float _1944 = _1938 + (-1.0);
        float _1946 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1948 = fma(_1942, _1928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1950 = fma(_1900, _1938, _1946);
        float _1952 = _1930 * _1948;
        float _1954 = fma(_1886, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1956 = fma(_1882, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1920 = _1950;
        _1906 = _1954;
        _1908 = _1956;
        _1910 = _1948;
        _1596 = _1946;
        _1912 = _1952;
    }
    float _1958 = _1920;
    float _1960 = _1906;
    float _1962 = _1908;
    float _1964 = _1910;
    float _1966 = _1596;
    float _1968 = _1912;
    float _1970 = -_1674;
    float _1972 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1958);
    float _1974 = -_1676;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1960);
    float _1978 = -_1682;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1984 = _1972 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1988 = _1976 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1992 = _1980 + _1990;
    float _1994 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1996 = _1984 * _1984;
    float _1998 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1994);
    float _2000 = fma(_1988, _1988, _1996);
    float _2002 = fma(_1992, _1992, _2000);
    float _2004 = rsqrt(_2002);
    float _2006 = sqrt(_2002);
    float _2008 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2010 = _1988 * _2008;
    float _2012 = _1992 * _2008;
    float _2014 = _2010 * _2010;
    float _2016 = _2012 * _2012;
    float _2018 = _2014 + _2016;
    float _2020 = sqrt(_2018);
    bool _2022 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2026 = _2020 + _2024;
    float _2028 = _1964;
    float _2030 = _1968;
    float _2032 = _2026;
    float _2034 = _2008;
    float _2036 = _2018;
    float _2038 = _1988;
    float _2040 = _1984;
    if (_2022)
    {
        float _2042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2028 = _2042;
    }
    float _2044 = _2028;
    if (_2022)
    {
        float _2046 = rsqrt(_2018);
        _2030 = _2046;
    }
    float _2048 = _2030;
    float _2050 = _2048;
    if (_2022)
    {
        float _2052 = _2026 * _2044;
        _2032 = _2052;
    }
    float _2054 = _2032;
    if (_2022)
    {
        float _2056 = _2054 * 0.15915493667125701904296875;
        _1714 = _2056;
    }
    float _2058 = _1714;
    float _2060 = _1960;
    float _2062 = _2058;
    if (_2022)
    {
        float _2064 = _2058 * 6.283185482025146484375;
        float _2066 = sin(_2064);
        _2060 = _2066;
    }
    float _2068 = _2060;
    float _2070 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2072 = precise::max(0.0, _2070);
    float _2074 = _1966;
    if (_2022)
    {
        float _2076 = _2058 * 6.283185482025146484375;
        float _2078 = cos(_2076);
        _2074 = _2078;
    }
    float _2080 = _2074;
    float _2082 = -_2008;
    float _2084 = -_2072;
    float _2086 = fma(_1984, _2082, _2084);
    float _2088 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2022)
    {
        float _2092 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _2092;
    }
    float _2094 = _1914;
    float _2096 = _2094;
    if (!_2022)
    {
        _2062 = _2012;
    }
    float _2098 = _2062;
    float _2100 = _2098;
    if (_2022)
    {
        float _2102 = fma(_2068, _2094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2096 = _2102;
    }
    float _2104 = _2096;
    float _2106 = floor(_2088);
    float _2108 = _2104;
    float _2110 = _2080;
    if (_2022)
    {
        float _2112 = _2080 + (-1.0);
        _2090 = _2112;
    }
    float _2114 = _2090;
    float _2116 = _2114;
    if (_2022)
    {
        float _2118 = _2048 * _2104;
        _2034 = _2118;
    }
    float _2120 = _2034;
    if (!_2022)
    {
        _2050 = _2010;
    }
    float _2122 = _2050;
    float _2124 = _2122;
    if (_2022)
    {
        float _2126 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2036 = _2126;
    }
    float _2128 = _2036;
    if (_2022)
    {
        float _2130 = _2010 * _2120;
        _2124 = _2130;
    }
    float _2132 = _2124;
    if (!_2022)
    {
        _2108 = _2086;
    }
    float _2134 = _2108;
    float _2136 = _2134;
    if (_2022)
    {
        float _2138 = _2012 * _2120;
        _2100 = _2138;
    }
    float _2140 = _2100;
    if (!_2022)
    {
        _2116 = _2014;
    }
    float _2142 = _2116;
    float _2144 = _2142;
    if (_2022)
    {
        float _2146 = fma(_2086, _2080, _2128);
        _2136 = _2146;
    }
    float _2148 = _2136;
    if (_2022)
    {
        float _2150 = _2132 * _2132;
        _2144 = _2150;
    }
    float _2152 = _2144;
    if (!_2022)
    {
        _2110 = _2016;
    }
    float _2154 = _2110;
    float _2156 = _2154;
    if (_2022)
    {
        float _2158 = _2140 * _2140;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2164 = fma(_2148, _2148, _2152);
    float _2166 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2168 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2162);
    float _2170 = _2164 + _2160;
    float _2172 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2174 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2166);
    float _2176 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2168);
    float _2178 = rsqrt(_2170);
    float _2180 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2172);
    float _2182 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2174);
    float _2184 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2186 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2180);
    float _2188 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2192 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2190);
    float _2194 = precise::clamp(_2192, 0.0, 1.0);
    float _2196 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2198 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2200 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2202 = -_2194;
    float _2204 = _2202 + 1.0;
    float _2206 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2208 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1998);
    float _2210 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2200);
    float _2212 = abs(_2204);
    float _2214 = log2(_2212);
    float _2216 = -_2206;
    float _2218 = fma(_2216, _2188, 1.0);
    float _2220 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2222 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2210);
    float _2224 = _2178 * _2132;
    float _2226 = _2178 * _2140;
    float _2228 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2222);
    float _2230 = _2178 * _2148;
    float _2232 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2234 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2236 = -_2106;
    float _2238 = _2088 + _2236;
    float _2240 = log2(_2218);
    float _2242 = -_2232;
    float _2244 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2242);
    float _2246 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2248 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2250 = -_2226;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2244);
    float _2254 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2246);
    float _2256 = floor(_2234);
    float _2258 = fma(_2252, -0.5, 0.5);
    float _2260 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2262 = fma(_2252, 0.5, 0.5);
    float _2264 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2254);
    float _2266 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2260);
    float _2268 = fma(_2262, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2270 = 1.0 / _2228;
    float _2272 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2264);
    float _2274 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2266);
    float _2276 = fma(_2262, _2268, -0.212114393711090087890625);
    float _2278 = _2240 * 0.693147182464599609375;
    float _2280 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2274);
    float _2282 = fma(_2262, _2276, 1.570728778839111328125);
    float _2284 = exp2(_2248);
    float _2286 = -_2256;
    float _2288 = _2234 + _2286;
    float _2290 = _2230 + 1.0;
    float _2292 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2294 = sqrt(_2258);
    float _2296 = _2272 * _2270;
    float _2298 = _2280 * _2270;
    float _2300 = fma(_2296, 0.5, 0.5);
    float _2302 = fma(_2298, -0.5, 0.5);
    float _2304 = -_2230;
    float _2306 = fma(_2284, _2290, _2304);
    float2 _6750 = float2(_2238, _2288);
    float _2308 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6750, float2(0.0), isnan(_6750)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6750, float2(0.0), isnan(_6750)), level(0.0)).x;
    float3 _6761 = float3(_2300, _2302, _2292);
    float _2310 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6761, float3(0.0), isnan(_6761)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6761, float3(0.0), isnan(_6761)), level(0.0)).x;
    float _2312 = fma(_2306, 0.5, 0.5);
    float _2314 = _2294 * 0.636619746685028076171875;
    float _2316 = -_2282;
    float _2318 = fma(_2314, _2316, 1.0);
    float3 _6782 = float3(_2300, _2302, _2292);
    float4 _2321 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6782, float3(0.0), isnan(_6782)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6782, float3(0.0), isnan(_6782)), level(0.0)).xyzw;
    float _2323 = _2321.x;
    float _2325 = _2321.y;
    float _2327 = _2321.z;
    float _2329 = _2321.w;
    float2 _6798 = float2(_2318, _2312);
    float3 _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6798, float2(0.0), isnan(_6798)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6798, float2(0.0), isnan(_6798)), level(0.0)).xyz;
    float _2335 = _2333.x;
    float _2337 = _2333.y;
    float _2339 = _2333.z;
    float _2341 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2343 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2345 = _1810 != 0.0;
    bool _2347 = isnan(_1810);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(0.0);
    bool _2353 = _2349 || _2351;
    float _2355 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2357 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2341);
    float _2359 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2343);
    bool _2361 = _1808 == 0.0;
    bool _2363 = !_2353;
    bool _2365 = _2361 && _2363;
    float _2367 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2355);
    float _2369 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2357);
    float _2371 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2359);
    bool _2373 = _1812 == 0.0;
    bool _2375 = _2373 && _2365;
    float _2377 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2367);
    float _2379 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2381 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2383 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2377);
    float _2385 = 1.0 / _2379;
    float _2387 = _2381 + _2379;
    out.m_75.x = _1988;
    out.m_75.y = _1984;
    out.m_75.z = _1992;
    float _2389 = _2228 * 0.5;
    float _2391 = _2387 * _2385;
    float _2393 = _2391 * 0.5;
    float _2395 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2397 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2395);
    float _2399 = in.m_77.x;
    float _2401 = in.m_77.y;
    float _2403 = in.m_77.z;
    float _2405 = 1.0 / _2397;
    float _2407 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2409 = _2405 * _2407;
    float _2411 = abs(_2409);
    float _2413 = log2(_2411);
    float _2415 = _2401;
    float _2417 = _2399;
    float _2419 = _2403;
    float _2421 = _2228;
    float _2423 = _2383;
    float _2425 = _2280;
    if (!_2375)
    {
        float _2427 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2401);
        _2415 = _2427;
    }
    float _2429 = _2415;
    if (!_2375)
    {
        float _2431 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2399);
        _2417 = _2431;
    }
    float _2433 = _2417;
    if (!_2375)
    {
        float _2435 = fma(_1812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2403);
        _2419 = _2435;
    }
    float _2437 = _2419;
    bool _2439 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2441 = isnan(0.5);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2447 = _2443 || _2445;
    float _2449 = _1854 * _2429;
    float _2451 = _2383 + _2228;
    float _2453 = fma(_1832, _2433, _2449);
    float _2455 = _2451 * 0.5;
    float _2457 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_2447)
    {
        _2038 = 1.0;
    }
    float _2459 = _2038;
    float _2461 = _2459;
    if (_2447)
    {
        _2040 = 1.0;
    }
    float _2463 = _2040;
    float _2465 = exp2(_2457);
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2469 = precise::clamp(_2467, 0.0, 1.0);
    float _2471 = fma(_2469, -2.0, 3.0);
    float _2473 = _2469 * _2469;
    float _2475 = _2473 * _2471;
    float _2477 = _1866 * _2429;
    float _2479 = _1850 * _2429;
    float _2481 = -_2475;
    float _2483 = _2481 + 1.0;
    float _2485 = fma(_1834, _2433, _2477);
    float _2487 = fma(_1836, _2433, _2479);
    float _2489 = in.m_79.x;
    float _2491 = fma(_1768, _2437, _2453);
    float _2493 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2495 = fma(_1772, _2437, _2485);
    float _2497 = fma(_1770, _2437, _2487);
    float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2475);
    float _2501 = exp2(_2493);
    bool _2503 = _2409 <= 8000.0;
    bool _2505 = isnan(_2409);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan(8000.0);
    bool _2511 = _2507 || _2509;
    float _2513 = float(_2511);
    float _2515 = _2272 + _2228;
    float _2517 = _2513 * _2499;
    float _2519 = _2515 * 0.5;
    float _2521 = fma(_2280, -0.5, _2389);
    float _2523 = _2463;
    if (!_2447)
    {
        float _2525 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2527 = _2525 * 0.15915493667125701904296875;
        float _2529 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2531 = _2527 * 6.283185482025146484375;
        float _2533 = cos(_2531);
        float _2535 = _2529 * 0.15915493667125701904296875;
        float _2537 = _2527 * 6.283185482025146484375;
        float _2539 = sin(_2537);
        float _2541 = 1.0 / _2533;
        float _2543 = _2535 * 6.283185482025146484375;
        float _2545 = cos(_2543);
        float _2547 = _2539 * _2541;
        float _2549 = _2535 * 6.283185482025146484375;
        float _2551 = sin(_2549);
        float _2553 = _2545 * _2547;
        float _2555 = 1.0 / _2553;
        float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2559 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2557;
        float _2561 = 1.0 / _2559;
        float _2563 = _2551 * _2555;
        float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2567 = fma(_2409, _2563, _2565);
        float _2569 = _2567 * _2561;
        float _2571 = precise::clamp(_2569, 0.0, 1.0);
        _2523 = _2571;
    }
    float _2573 = _2523;
    if (!_2447)
    {
        float _2575 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2577 = _2575 * 0.15915493667125701904296875;
        float _2579 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2581 = _2577 * 6.283185482025146484375;
        float _2583 = cos(_2581);
        float _2585 = _2579 * 0.15915493667125701904296875;
        float _2587 = _2577 * 6.283185482025146484375;
        float _2589 = sin(_2587);
        float _2591 = 1.0 / _2583;
        float _2593 = _2585 * 6.283185482025146484375;
        float _2595 = cos(_2593);
        float _2597 = _2589 * _2591;
        float _2599 = _2585 * 6.283185482025146484375;
        float _2601 = sin(_2599);
        float _2603 = _2595 * _2597;
        float _2605 = 1.0 / _2603;
        float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2609 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2607;
        float _2611 = 1.0 / _2609;
        float _2613 = _2601 * _2605;
        float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2617 = fma(_2409, _2613, _2615);
        float _2619 = _2617 * _2611;
        float _2621 = precise::clamp(_2619, 0.0, 1.0);
        float _2623 = -_2621;
        float _2625 = _2623 + 1.0;
        _2461 = _2625;
    }
    float _2627 = _2461;
    float _2629 = -_2501;
    float _2631 = _2629 + 1.0;
    float _2633 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2635 = -_2308;
    float _2637 = _2635 + 1.0;
    float _2639 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2519;
    out.m_81.y = _2521;
    out.m_81.z = _2455;
    out.m_81.w = _2228;
    float _2641 = _2637 * _2633;
    float _2643 = precise::clamp(_2641, 0.0, 1.0);
    bool _2645 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2647 = isnan(_2006);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2653 = _2649 || _2651;
    float _2655 = _2639 * _2310;
    float _2657 = -_2639;
    float _2659 = _2657 + 1.0;
    float _2661 = -_2643;
    float _2663 = fma(_2661, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2491;
    out.m_83.y = _2495;
    out.m_83.z = _2497;
    float _2665 = _2329 * _2655;
    float _2667 = _2663 * _2489;
    out.gl_Position.x = _2272;
    out.gl_Position.y = _2280;
    out.gl_Position.z = _2383;
    out.gl_Position.w = _2228;
    float _2669 = _2339 * _2655;
    float _2671 = fma(_2335, _2665, _2323);
    float _2673 = fma(_2337, _2665, _2325);
    float _2675 = _2667 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2677 = _2329 * _2659;
    float _2679 = fma(_2329, _2669, _2327);
    float _2681 = _2667;
    float _2683 = _2665;
    if (!_2653)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2685 = _2681;
    out.m_85.x = _2675;
    float _2687 = _2685;
    float _2689 = _2685;
    if (!_2653)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2691 = _2683;
    float _2693 = _2573 * _2627;
    float _2695 = _2693;
    float _2697 = _2691;
    float _2699 = _2691;
    if (!_2653)
    {
        _2421 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2701 = _2421;
    out.m_87.x = _2671;
    out.m_87.y = _2673;
    out.m_87.z = _2679;
    out.m_87.w = _2677;
    float _2703 = _2701;
    float _2705 = _2701;
    if (!_2653)
    {
        _2423 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2707 = _2423;
    float _2709 = _2693 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2711 = _2707;
    float _2713 = _2707;
    if (!_2653)
    {
        _2425 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2715 = _2425;
    float _2717 = _2715;
    float _2719 = _2715;
    if (!_2653)
    {
        _2695 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2721 = _2695;
    bool _2723 = !_2653;
    float _2725 = _2721;
    float _2727 = _2721;
    if (!_2723)
    {
        bool _2729 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2731 = isnan(_2006);
        bool _2733 = _2729 || _2731;
        bool _2735 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2737 = _2733 || _2735;
        if (!_2737)
        {
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2741 = _2006 + _2739;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2745 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2743;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2755 = 1.0 / _2745;
            float _2757 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2759 = _2757 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2769 = _2741 * _2755;
            float _2771 = precise::clamp(_2769, 0.0, 1.0);
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2777 = fma(_2771, _2749, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2779 = fma(_2771, _2753, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2781 = fma(_2771, _2759, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2783 = fma(_2771, _2775, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2785 = fma(_2771, _2763, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2787 = fma(_2771, _2767, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2699 = _2781;
            _2719 = _2777;
            _2689 = _2779;
            _2713 = _2785;
            _2705 = _2783;
            _2727 = _2787;
            _2789 = true;
        }
        else
        {
            bool _2791 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2793 = isnan(_2006);
            bool _2795 = _2791 || _2793;
            bool _2797 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2799 = _2795 || _2797;
            if (!_2799)
            {
                _2687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2801 = _2687;
            _2689 = _2801;
            if (!_2799)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2803 = _2697;
            _2699 = _2803;
            if (!_2799)
            {
                _2703 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2805 = _2703;
            _2705 = _2805;
            if (!_2799)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2807 = _2711;
            _2713 = _2807;
            if (!_2799)
            {
                _2717 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2809 = _2717;
            _2719 = _2809;
            if (!_2799)
            {
                _2725 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2811 = _2725;
            bool _2813 = !_2799;
            _2727 = _2811;
            if (!_2813)
            {
                bool _2815 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2817 = isnan(_2006);
                bool _2819 = _2815 || _2817;
                bool _2821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2823 = _2819 || _2821;
                if (!_2823)
                {
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2827 = _2006 + _2825;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2831 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2829;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2841 = 1.0 / _2831;
                    float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2855 = _2827 * _2841;
                    float _2857 = precise::clamp(_2855, 0.0, 1.0);
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2863 = fma(_2857, _2835, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2865 = fma(_2857, _2839, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2867 = fma(_2857, _2845, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2869 = fma(_2857, _2861, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2871 = fma(_2857, _2849, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2873 = fma(_2857, _2853, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2699 = _2867;
                    _2719 = _2863;
                    _2689 = _2865;
                    _2713 = _2871;
                    _2705 = _2869;
                    _2727 = _2873;
                    _2789 = true;
                }
                else
                {
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2719 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2705 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2727 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2789 = false;
    float _2875 = _2699;
    float _2877 = _2719;
    float _2879 = _2689;
    float _2881 = _2713;
    float _2883 = _2705;
    float _2885 = _2727;
    float _2887 = fma(_2495, -0.5, 0.5);
    float _2889 = precise::clamp(_2887, 0.0, 1.0);
    float _2891 = -_2875;
    float _2893 = _2891 + _2877;
    float _2895 = -_2879;
    float _2897 = _2895 + _2881;
    out.m_89.x = 0.0;
    float _2899 = -_2883;
    float _2901 = _2899 + _2885;
    float _2903 = fma(_2889, _2893, _2875);
    float _2905 = fma(_2889, _2897, _2879);
    bool _2907 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2909 = _2903 * 0.586610972881317138671875;
    float _2911 = fma(_2889, _2901, _2883);
    float _2913 = _2709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2915 = fma(_2905, 0.298911988735198974609375, _2909);
    bool _2917 = _2573 > 0.0;
    bool _2919 = isnan(_2573);
    bool _2921 = _2917 || _2919;
    bool _2923 = isnan(0.0);
    bool _2925 = _2921 || _2923;
    float _2927 = fma(_2911, 0.114477999508380889892578125, _2915);
    out.m_49.x = _2913;
    bool _2929 = _2627 <= 0.0;
    bool _2931 = !_2925;
    bool _2933 = _2929 || _2931;
    float _2935 = -_2927;
    float _2937 = _2905 + _2935;
    float _2939 = -_2927;
    float _2941 = _2911 + _2939;
    float _2943 = fma(_2937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2927);
    float _2945 = -_2927;
    float _2947 = _2903 + _2945;
    float _2949 = fma(_2947, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2927);
    float _2951 = fma(_2941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2927);
    bool _2953 = !_2907;
    if (!_2953)
    {
        float _2955 = -_1972;
        float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2959 = -_1976;
        float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2963 = -_1980;
        float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2967 = _2957 * _2957;
        float _2969 = fma(_2961, _2961, _2967);
        float _2971 = fma(_2965, _2965, _2969);
        float _2973 = sqrt(_2971);
        float _2975 = rsqrt(_2971);
        float _2977 = -_2973;
        float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2981 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2983 = precise::clamp(_2981, 0.0, 1.0);
        float _2985 = _2961 * _2975;
        float _2987 = _2957 * _2975;
        float _2989 = abs(_2983);
        float _2991 = log2(_2989);
        float _2993 = _2965 * _2975;
        float _2995 = _2985 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2997 = _2495 * _2987;
        float _2999 = -_2987;
        float _3001 = -_2995;
        float _3003 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3001);
        float _3005 = fma(_2491, _2985, _2997);
        float _3007 = -_2993;
        float _3009 = fma(_3007, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3003);
        float _3011 = fma(_2497, _2993, _3005);
        float _3013 = precise::clamp(_3011, 0.0, 1.0);
        float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3017 = _3009 + _3015;
        float _3019 = _2991 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3021 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3023 = precise::clamp(_3021, 0.0, 1.0);
        float _3025 = exp2(_3019);
        float _3027 = _3025 * _3023;
        float _3029 = _3013 * _3027;
        float _3031 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3033 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3035 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3031;
        out.m_89.y = _3033;
        out.m_89.z = _3035;
    }
    out.m_91.x = _2943;
    out.m_91.y = _2949;
    out.m_91.z = _2951;
    if (!_2933)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3037 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3037;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2789 = false;
    bool _1002 = false;
    bool _822 = false;
    bool _642 = false;
    bool _516 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3093 = as_type<float>(_126);
        out.gl_Position.z = _3093;
    }
    if (!_114)
    {
        return out;
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_110);
        _120 = _144;
    }
    float _146 = _120;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
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
    int _158 = 0;
    if (_152)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3162 = as_type<float>(_162);
        out.gl_Position.z = _3162;
    }
    if (_152)
    {
        return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_53.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_110);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _194 + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = 1.0 / _202;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _218;
    float _222 = 1.0 / _210;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _194 + _224;
    bool _228 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _230 = isnan(_194);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    bool _240 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _242 = isnan(_194);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = 1.0 / _206;
    float _254 = _226 * _216;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = _194 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_262, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = 1.0 / _214;
    float _268 = _258 * _222;
    bool _270 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _272 = isnan(_194);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _284 = _194 + _282;
    bool _286 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _288 = isnan(_194);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _300 = -_280;
    float _302 = _300 + 1.0;
    float _304 = 1.0 / _220;
    float _306 = _198 * _252;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = _194 + _308;
    bool _312 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _314 = isnan(_194);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_296;
    float _326 = _324 + 1.0;
    float _328 = _284 * _266;
    float _330 = _296 * _302;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = _322 * _326;
    float _338 = -_322;
    float _340 = _338 + 1.0;
    bool _342 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_194);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = fma(_334, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _360 = _310 * _304;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _362;
    float _366 = _238 * _340;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = fma(_358, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _374 = fma(_364, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -_238;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = fma(_370, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _386 = _250 * _378;
    float _388 = -_250;
    float _390 = _388 + 1.0;
    float _392 = fma(_382, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _394 = _352 * _390;
    float _396 = -_352;
    float _398 = _396 + 1.0;
    float _400 = _374 * _394;
    float _402 = _354 * _394;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = _264 * _394;
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _416 = fma(_406, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _418 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _420 = fma(_372, _386, _410);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _428;
    float _432 = fma(_414, _328, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _438 = fma(_392, _386, _418);
    float _440 = fma(_416, _366, _420);
    float _442 = fma(_424, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_384, _386, _426);
    float _446 = fma(_430, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _452 = fma(_436, _328, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_442, _366, _444);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _460;
    float _464 = fma(_450, _328, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _466 = fma(_446, _366, _438);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _468;
    float _472 = fma(_432, _336, _440);
    float _474 = fma(_458, _360, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _476 = fma(_462, _360, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _478 = fma(_470, _360, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _480 = fma(_452, _336, _466);
    float _482 = fma(_464, _336, _454);
    float _484 = fma(_474, _330, _472);
    float _486 = fma(_476, _330, _480);
    float _488 = fma(_478, _330, _482);
    float _490 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[148].x, _484);
    float _492 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[148].y, _486);
    float _494 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[148].z, _488);
    bool _496 = !_298;
    float _514;
    if (!_496)
    {
        float _498 = in.m_53.x;
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _506 = _504 * _500;
        float _508 = floor(_506);
        float _510 = -_508;
        float _512 = _506 + _510;
        _514 = _512;
        _516 = true;
    }
    else
    {
        float _518 = float(_110);
        float _520 = 1.0 / _518;
        float _522 = _142 * _520;
        _514 = _522;
    }
    _516 = false;
    float _524 = _514;
    float _526 = in.m_55.x;
    float _528 = in.m_55.y;
    float _530 = in.m_55.z;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _534 = _524 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _536;
    bool _540 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _542 = isnan(_524);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    bool _552 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _554 = 1.0 / _538;
    float _556 = _492 * _528;
    bool _558 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _560 = isnan(_524);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _534 * _554;
    float _572 = _494 * _530;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _574;
    float _578 = -_568;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = _550 * _580;
    float _592 = fma(_576, _570, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _594 = fma(_584, _570, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _596 = fma(_588, _570, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = -_550;
    float _600 = _598 + 1.0;
    float _602 = _592 * _590;
    float _604 = _594 * _590;
    float _606 = _596 * _590;
    float _608 = _490 * _526;
    float _610 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].y, _602);
    float _612 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].x, _604);
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].z, _606);
    float _616 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[108].y, _610);
    float _618 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[108].x, _612);
    float _620 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[108].z, _614);
    bool _622 = !_552;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_110);
        float _646 = 1.0 / _644;
        float _648 = _142 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _654 = _650 + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _664 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _666 = isnan(_650);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _680 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _682 = isnan(_650);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _658;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _694;
    float _698 = -_674;
    float _700 = _698 + 1.0;
    bool _702 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _704 = isnan(_650);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    bool _714 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _716 = 1.0 / _662;
    float _718 = 1.0 / _678;
    float _720 = _696 * _692;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _726 = _690 * _700;
    float _728 = -_690;
    float _730 = _728 + 1.0;
    float _732 = fma(_720, _654, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _734;
    float _738 = _712 * _730;
    float _740 = _724 * _716;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _744 = _650 + _742;
    bool _746 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _748 = isnan(_650);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = _732 * _738;
    float _760 = -_712;
    float _762 = _760 + 1.0;
    float _764 = fma(_740, _744, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _768 = _650 + _766;
    float _770 = _736 * _718;
    float _772 = -_756;
    float _774 = _772 + 1.0;
    float _776 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[115].x, _758);
    float _778 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _780 = fma(_770, _768, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _782 = _674 * _774;
    float _784 = fma(_764, _726, _776);
    float _786 = _778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _788 = fma(_780, _782, _784);
    float _790 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _792 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _794 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[118].x, _788);
    float _796 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _794 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _786;
    out.m_57.y = _796;
    out.m_57.z = _798;
    out.m_57.w = _800;
    bool _802 = !_714;
    float _820;
    if (!_802)
    {
        float _804 = in.m_53.x;
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _808 = _804 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        float _824 = float(_110);
        float _826 = 1.0 / _824;
        float _828 = _142 * _826;
        _820 = _828;
    }
    _822 = false;
    float _830 = _820;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _834 = _830 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _844 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _846 = isnan(_830);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _860 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _862 = isnan(_830);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / _838;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _874;
    float _878 = -_854;
    float _880 = _878 + 1.0;
    bool _882 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _884 = isnan(_830);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    bool _894 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _896 = 1.0 / _842;
    float _898 = 1.0 / _858;
    float _900 = _876 * _872;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _906 = _870 * _880;
    float _908 = -_870;
    float _910 = _908 + 1.0;
    float _912 = fma(_900, _834, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _914;
    float _918 = _892 * _910;
    float _920 = _904 * _896;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _924 = _830 + _922;
    bool _926 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _928 = isnan(_830);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _912 * _918;
    float _940 = -_892;
    float _942 = _940 + 1.0;
    float _944 = fma(_920, _924, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _948 = _830 + _946;
    float _950 = _916 * _898;
    float _952 = -_936;
    float _954 = _952 + 1.0;
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[131].x, _938);
    float _958 = fma(_950, _948, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _960 = _854 * _954;
    float _962 = fma(_944, _906, _956);
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _966 = fma(_958, _960, _962);
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _970 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _974 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[134].x, _966);
    float _976 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _970;
    out.m_59.y = _976;
    out.m_59.z = _978;
    out.m_59.w = _980;
    bool _982 = !_894;
    float _1000;
    if (!_982)
    {
        float _984 = in.m_53.x;
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _988 = _984 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[14].x, _142);
        float _992 = _990 * _986;
        float _994 = floor(_992);
        float _996 = -_994;
        float _998 = _992 + _996;
        _1000 = _998;
        _1002 = true;
    }
    else
    {
        float _1004 = float(_110);
        float _1006 = 1.0 / _1004;
        float _1008 = _142 * _1006;
        _1000 = _1008;
    }
    _1002 = false;
    float _1010 = _1000;
    float _1012 = in.m_53.w;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1016 = _1010 + _1014;
    float _1018 = in.m_61.y;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1022 = _1020 != 0;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1026 = _1010 + _1024;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1030 = _1028 != 0;
    float _1032 = in.m_53.y;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1036 = _1034 != 0;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1038;
    float _1042 = in.m_53.z;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1046 = _1044 != 0;
    float _1048 = 1.0 / _1040;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1054 = in.m_53.x;
    float _1056 = in.m_61.x;
    float _1058 = 1.0 / _1052;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1060;
    bool _1064 = _1012 > 0.5;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1068 = in.m_46.x;
    float _1070 = in.m_46.y;
    float _1072 = in.m_46.z;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1074;
    float _1078 = -_1018;
    float _1080 = _1078 + 1.0;
    bool _1082 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1084 = isnan(_1010);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = 1.0 / _1062;
    bool _1096 = _1032 > 0.5;
    bool _1098 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1100 = isnan(_1010);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1112 = _1042 > 0.5;
    float _1114 = _1016 * _1058;
    int _1116 = _1096 ? as_type<int>(_1080) : as_type<int>(_1018);
    float _1118 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1120 = _1112 ? as_type<int>(_1080) : as_type<int>(_1018);
    float _1122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1124 = _1030 ? as_type<float>(_1116) : _1018;
    float _1126 = -_1110;
    float _1128 = fma(_1118, 2.0, _1126);
    float _1130 = _1036 ? as_type<float>(_1120) : _1018;
    float _1132 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1136 = _1134 != 0;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1140 = _1010 + _1138;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1144 = _1142 != 0;
    float _1146 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1148 = _1018;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    bool _1152 = _1022;
    float _1154 = _1032;
    float _1156 = _1056;
    if (_1022)
    {
        float _1158 = _1064 ? _1080 : _1018;
        _1148 = _1158;
    }
    float _1160 = _1148;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1166 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1168 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1146);
    float _1170 = 1.0 / _1164;
    float _1172 = fma(_1132, -2.0, _1066);
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1174;
    float _1178 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1166);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1182 = _1010 + _1180;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = _1140 * _1048;
    float _1190 = 1.0 / _1176;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1196 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1198 = _1182 * _1094;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1202 = _1010 + _1200;
    float _1204 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1196);
    float _1206 = 1.0 / _1194;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1210 = _1010 + _1208;
    if (_1186)
    {
        _1150 = _1054;
    }
    float _1212 = _1150;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1216;
    float _1220 = _1210 * _1170;
    float _1222 = _1212;
    if (!_1186)
    {
        _1222 = _1042;
    }
    float _1224 = _1222;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1228 = 1.0 / _1218;
    float _1230 = _1026 * _1190;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1234 = _1010 + _1232;
    float _1236 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1214);
    float _1238 = _1224;
    if (_1046)
    {
        bool _1240 = _1054 > 0.5;
        _1152 = _1240;
    }
    bool _1242 = _1152;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1246 = _1202 * _1206;
    float _1248 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1226);
    float _1250 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1244);
    if (!_1186)
    {
        _1154 = _1054;
    }
    float _1252 = _1154;
    float _1254 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1178);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1258 = _1234 * _1228;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1260;
    float _1264 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1256);
    float _1266 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1204);
    float _1268 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1168);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1278 = fma(_1262, _1188, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1280 = fma(_1076, _1188, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1286;
    float _1290 = fma(_1272, _1114, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1294 = _1292 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1296 = fma(_1276, _1114, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1304 = fma(_1284, _1198, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1310;
    float _1314 = fma(_1294, _1220, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1320 = fma(_1300, _1220, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1326 = fma(_1308, _1230, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1328 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1330 = isnan(_1010);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = fma(_1312, _1230, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1342 = fma(_1318, _1246, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1344 = fma(_1324, _1246, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _1346 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1348 = isnan(_1010);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = -_1338;
    float _1360 = _1358 + 1.0;
    float _1362 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1364 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1366 = _1356 * _1360;
    float _1368 = -_1356;
    float _1370 = _1368 + 1.0;
    float _1372 = -_1092;
    float _1374 = _1372 + 1.0;
    float _1376 = fma(_1362, _1124, -0.5);
    bool _1378 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1380 = isnan(_1010);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1092 * _1370;
    float _1392 = -_1108;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_1130, _1364, -0.5);
    float _1398 = _1108 * _1374;
    bool _1400 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1402 = isnan(_1010);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1172);
    bool _1414 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1416 = isnan(_1010);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = fma(_1288, _1198, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _1428 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1430 = isnan(_1010);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = _1388 * _1394;
    float _1442 = -_1388;
    float _1444 = _1442 + 1.0;
    float _1446 = -_1424;
    float _1448 = _1446 + 1.0;
    float _1450 = -_1438;
    float _1452 = _1450 + 1.0;
    float _1454 = _1438 * _1444;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1460;
    float _1464 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1236);
    float _1466 = fma(_1458, _1258, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1468 = fma(_1462, _1258, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    int _1470 = as_type<int>(_1462);
    float _1472 = _1288;
    float _1474 = _1268;
    if (_1046)
    {
        float _1476 = -_1056;
        float _1478 = _1476 + 1.0;
        _1470 = as_type<int>(_1478);
    }
    int _1480 = _1470;
    float _1482 = -_1412;
    float _1484 = fma(_1464, _1376, _1482);
    int _1486 = _1480;
    if (!_1046)
    {
        _1472 = _1056;
    }
    float _1488 = _1472;
    float _1490 = _1424 * _1452;
    float _1492 = _1410 * _1448;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1498 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1502 = _1488;
    if (_1046)
    {
        float _1504 = _1242 ? as_type<float>(_1480) : _1056;
        _1502 = _1504;
    }
    float _1506 = _1502;
    float _1508 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_1136)
    {
        float _1510 = -_1056;
        float _1512 = _1510 + 1.0;
        _1486 = as_type<int>(_1512);
    }
    int _1514 = _1486;
    float _1516 = _1278 * _1492;
    float _1518 = -_1410;
    float _1520 = _1518 + 1.0;
    float _1522 = -_1496;
    float _1524 = fma(_1498, 2.0, _1522);
    float _1526 = fma(_1508, -2.0, _1494);
    if (!_1136)
    {
        _1238 = _1056;
    }
    float _1528 = _1238;
    float _1530 = _1280 * _1492;
    float _1532 = _1528;
    if (_1136)
    {
        float _1534 = _1112 ? as_type<float>(_1514) : _1056;
        _1532 = _1534;
    }
    float _1536 = _1532;
    float _1538 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1516);
    float _1540 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1248);
    float _1542 = -_142;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1128);
    float _1546 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1264);
    float _1548 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1250);
    float _1550 = -_142;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1524);
    float _1554 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1526);
    float _1556 = fma(_1290, _1490, _1538);
    float _1558 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1560 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1562 = -_1554;
    float _1564 = fma(_1548, _1396, _1562);
    float _1566 = _1268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1568 = fma(_1558, _1506, -0.5);
    float _1570 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1530);
    float _1572 = _1254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1566 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1580 = _1560 + _1578;
    float _1582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1584 = fma(_1296, _1490, _1570);
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1588 = fma(_1304, _1454, _1556);
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1592 = _1572 + _1590;
    int _1594 = 0;
    float _1596 = _1566;
    if (_1144)
    {
        float _1598 = -_1056;
        float _1600 = _1598 + 1.0;
        _1594 = as_type<int>(_1600);
    }
    int _1602 = _1594;
    float _1604 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1586);
    float _1606 = fma(_1314, _1440, _1588);
    float _1608 = fma(_1426, _1454, _1584);
    float _1610 = _1576 * _1576;
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1604);
    float _1614 = fma(_1326, _1398, _1606);
    if (_1144)
    {
        float _1616 = _1096 ? as_type<float>(_1602) : _1056;
        _1156 = _1616;
    }
    float _1618 = _1156;
    float _1620 = in.m_63.w;
    float _1622 = fma(_1320, _1440, _1608);
    bool _1624 = _1612 >= 0.0;
    float _1626 = fma(_1580, _1580, _1610);
    float _1628 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1630 = fma(_1340, _1398, _1622);
    float _1632 = fma(_1342, _1390, _1614);
    float _1634 = fma(_1592, _1592, _1626);
    float _1636 = fma(_1628, _1618, -0.5);
    float _1638 = fma(_1344, _1390, _1630);
    float _1640 = fma(_1540, _1568, _1544);
    float _1642 = rsqrt(_1634);
    float _1644 = fma(_1546, _1636, _1552);
    float _1646 = fma(_1466, _1366, _1632);
    float _1648 = fma(_1468, _1366, _1638);
    if (_1624)
    {
        _1474 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1650 = _1474;
    float _1652 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1654 = _1484 + 0.5;
    float _1656 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1658 = _1564 + 0.5;
    float _1660 = _1644 + 0.5;
    float _1662 = _1640 + 0.5;
    int _1664 = as_type<int>(_1650);
    if (_1624)
    {
        float _1666 = _1650 * 5.0;
        _1664 = as_type<int>(_1666);
    }
    int _1668 = _1664;
    float _1670 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1646);
    float _1672 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1648);
    out.m_65.w = _1620;
    float _1674 = _1576 * _1642;
    float _1676 = _1580 * _1642;
    out.m_67.x = _1662;
    out.m_67.y = _1654;
    out.m_67.z = _1656;
    out.m_67.w = _1652;
    out.m_69.x = _1660;
    out.m_69.y = _1658;
    if (_1624)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5702 = as_type<float>(_1668);
        out.gl_Position.z = _5702;
    }
    out.m_71.x = _1670;
    out.m_71.y = _1672;
    if (_1624)
    {
        out.m_49.x = 0.0;
    }
    if (_1624)
    {
        return out;
    }
    float _1678 = -_1674;
    float _1680 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1682 = _1592 * _1642;
    float _1684 = -_1676;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1560);
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1690 = _1680 + _1688;
    float _1692 = -_1682;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1572);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1698 = _1686 + _1696;
    float _1700 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1704 = _1694 + _1702;
    float _1706 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1700);
    float _1708 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1706);
    bool _1710 = _1708 >= 0.0;
    float _1712 = _1704;
    float _1714 = _1682;
    if (_1710)
    {
        _1712 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1716 = _1712;
    int _1718 = as_type<int>(_1716);
    if (_1710)
    {
        out.m_49.x = 0.0;
    }
    if (_1710)
    {
        float _1720 = _1716 * 5.0;
        _1718 = as_type<int>(_1720);
    }
    int _1722 = _1718;
    if (_1710)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5802 = as_type<float>(_1722);
        out.gl_Position.z = _5802;
    }
    if (_1710)
    {
        return out;
    }
    float _1724 = -_1566;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = -_1560;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1732 = -_1572;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1736 = -_1674;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _1740 = _1726 * _1726;
    float _1742 = -_1676;
    float _1744 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1580);
    float _1746 = -_1682;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1592);
    float _1750 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1752 = fma(_1730, _1730, _1740);
    float _1754 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1756 = fma(_1734, _1734, _1752);
    float _1758 = _1738 * _1738;
    float _1760 = rsqrt(_1756);
    float _1762 = fma(_1744, _1744, _1758);
    float _1764 = fma(_1748, _1748, _1762);
    float _1766 = sqrt(_1764);
    float _1768 = _1730 * _1760;
    float _1770 = _1734 * _1760;
    float _1772 = _1726 * _1760;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1776 = _1768 * _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1780 = _1770 * _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1784 = -_1776;
    float _1786 = fma(_1770, _1782, _1784);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1790 = _1772 * _1788;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1794 = -_1780;
    float _1796 = fma(_1772, _1792, _1794);
    float _1798 = _1642 * _1766;
    float _1800 = _1786 * _1786;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1804 = -_1790;
    float _1806 = fma(_1768, _1802, _1804);
    float _1808 = in.m_73.x;
    float _1810 = in.m_73.y;
    float _1812 = in.m_73.z;
    float _1814 = _1798 * _1750;
    float _1816 = fma(_1796, _1796, _1800);
    float _1818 = fma(_1806, _1806, _1816);
    float _1820 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1822 = rsqrt(_1818);
    float _1824 = _1798 * _1820;
    float _1826 = _1798 * _1754;
    float _1828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1810);
    float _1830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1808);
    float _1832 = _1796 * _1822;
    float _1834 = _1786 * _1822;
    float _1836 = _1806 * _1822;
    float _1838 = _1824 * _1828;
    float _1840 = _1772 * _1832;
    float _1842 = _1770 * _1834;
    float _1844 = _1826 * _1830;
    float _1846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1812);
    float _1848 = -_1840;
    float _1850 = fma(_1768, _1834, _1848);
    float _1852 = -_1842;
    float _1854 = fma(_1772, _1836, _1852);
    float _1856 = _1768 * _1836;
    float _1858 = _1814 * _1846;
    float _1860 = _1838 * _1850;
    float _1862 = _1838 * _1854;
    float _1864 = -_1856;
    float _1866 = fma(_1770, _1832, _1864);
    float _1868 = fma(_1844, _1836, _1860);
    float _1870 = fma(_1844, _1832, _1862);
    float _1872 = fma(_1858, _1770, _1868);
    float _1874 = fma(_1858, _1768, _1870);
    float _1876 = _1572 + _1872;
    float _1878 = _1560 + _1874;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1882 = _1876 + _1880;
    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1886 = _1878 + _1884;
    float _1888 = _1882 * _1882;
    float _1890 = fma(_1886, _1886, _1888);
    float _1892 = _1838 * _1866;
    float _1894 = sqrt(_1890);
    float _1896 = fma(_1844, _1834, _1892);
    float _1898 = fma(_1858, _1772, _1896);
    float _1900 = _1566 + _1898;
    bool _1902 = _1894 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = _1898;
    float _1906 = _1878;
    float _1908 = _1876;
    float _1910 = _1896;
    float _1912 = _1894;
    float _1914 = _1882;
    if (!_1902)
    {
        _1904 = _1900;
    }
    float _1916 = _1904;
    bool _1918 = !_1902;
    float _1920 = _1916;
    if (!_1918)
    {
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1926 = _1894 + _1924;
        float _1928 = _1900 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = rsqrt(_1890);
        float _1932 = _1926 * _1922;
        float _1934 = _1932 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = _1934 * 6.283185482025146484375;
        float _1942 = sin(_1940);
        float _1944 = _1938 + (-1.0);
        float _1946 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1948 = fma(_1942, _1928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1950 = fma(_1900, _1938, _1946);
        float _1952 = _1930 * _1948;
        float _1954 = fma(_1886, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1956 = fma(_1882, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1920 = _1950;
        _1906 = _1954;
        _1908 = _1956;
        _1910 = _1948;
        _1596 = _1946;
        _1912 = _1952;
    }
    float _1958 = _1920;
    float _1960 = _1906;
    float _1962 = _1908;
    float _1964 = _1910;
    float _1966 = _1596;
    float _1968 = _1912;
    float _1970 = -_1674;
    float _1972 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1958);
    float _1974 = -_1676;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1960);
    float _1978 = -_1682;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1984 = _1972 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1988 = _1976 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1992 = _1980 + _1990;
    float _1994 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1996 = _1984 * _1984;
    float _1998 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1994);
    float _2000 = fma(_1988, _1988, _1996);
    float _2002 = fma(_1992, _1992, _2000);
    float _2004 = rsqrt(_2002);
    float _2006 = sqrt(_2002);
    float _2008 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2010 = _1988 * _2008;
    float _2012 = _1992 * _2008;
    float _2014 = _2010 * _2010;
    float _2016 = _2012 * _2012;
    float _2018 = _2014 + _2016;
    float _2020 = sqrt(_2018);
    bool _2022 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2026 = _2020 + _2024;
    float _2028 = _1964;
    float _2030 = _1968;
    float _2032 = _2026;
    float _2034 = _2008;
    float _2036 = _2018;
    float _2038 = _1988;
    float _2040 = _1984;
    if (_2022)
    {
        float _2042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2028 = _2042;
    }
    float _2044 = _2028;
    if (_2022)
    {
        float _2046 = rsqrt(_2018);
        _2030 = _2046;
    }
    float _2048 = _2030;
    float _2050 = _2048;
    if (_2022)
    {
        float _2052 = _2026 * _2044;
        _2032 = _2052;
    }
    float _2054 = _2032;
    if (_2022)
    {
        float _2056 = _2054 * 0.15915493667125701904296875;
        _1714 = _2056;
    }
    float _2058 = _1714;
    float _2060 = _1960;
    float _2062 = _2058;
    if (_2022)
    {
        float _2064 = _2058 * 6.283185482025146484375;
        float _2066 = sin(_2064);
        _2060 = _2066;
    }
    float _2068 = _2060;
    float _2070 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2072 = precise::max(0.0, _2070);
    float _2074 = _1966;
    if (_2022)
    {
        float _2076 = _2058 * 6.283185482025146484375;
        float _2078 = cos(_2076);
        _2074 = _2078;
    }
    float _2080 = _2074;
    float _2082 = -_2008;
    float _2084 = -_2072;
    float _2086 = fma(_1984, _2082, _2084);
    float _2088 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2022)
    {
        float _2092 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _2092;
    }
    float _2094 = _1914;
    float _2096 = _2094;
    if (!_2022)
    {
        _2062 = _2012;
    }
    float _2098 = _2062;
    float _2100 = _2098;
    if (_2022)
    {
        float _2102 = fma(_2068, _2094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2096 = _2102;
    }
    float _2104 = _2096;
    float _2106 = floor(_2088);
    float _2108 = _2104;
    float _2110 = _2080;
    if (_2022)
    {
        float _2112 = _2080 + (-1.0);
        _2090 = _2112;
    }
    float _2114 = _2090;
    float _2116 = _2114;
    if (_2022)
    {
        float _2118 = _2048 * _2104;
        _2034 = _2118;
    }
    float _2120 = _2034;
    if (!_2022)
    {
        _2050 = _2010;
    }
    float _2122 = _2050;
    float _2124 = _2122;
    if (_2022)
    {
        float _2126 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2036 = _2126;
    }
    float _2128 = _2036;
    if (_2022)
    {
        float _2130 = _2010 * _2120;
        _2124 = _2130;
    }
    float _2132 = _2124;
    if (!_2022)
    {
        _2108 = _2086;
    }
    float _2134 = _2108;
    float _2136 = _2134;
    if (_2022)
    {
        float _2138 = _2012 * _2120;
        _2100 = _2138;
    }
    float _2140 = _2100;
    if (!_2022)
    {
        _2116 = _2014;
    }
    float _2142 = _2116;
    float _2144 = _2142;
    if (_2022)
    {
        float _2146 = fma(_2086, _2080, _2128);
        _2136 = _2146;
    }
    float _2148 = _2136;
    if (_2022)
    {
        float _2150 = _2132 * _2132;
        _2144 = _2150;
    }
    float _2152 = _2144;
    if (!_2022)
    {
        _2110 = _2016;
    }
    float _2154 = _2110;
    float _2156 = _2154;
    if (_2022)
    {
        float _2158 = _2140 * _2140;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2164 = fma(_2148, _2148, _2152);
    float _2166 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2168 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2162);
    float _2170 = _2164 + _2160;
    float _2172 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2174 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2166);
    float _2176 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2168);
    float _2178 = rsqrt(_2170);
    float _2180 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2172);
    float _2182 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2174);
    float _2184 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2186 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2180);
    float _2188 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2192 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2190);
    float _2194 = precise::clamp(_2192, 0.0, 1.0);
    float _2196 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2198 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2200 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2202 = -_2194;
    float _2204 = _2202 + 1.0;
    float _2206 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2208 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1998);
    float _2210 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2200);
    float _2212 = abs(_2204);
    float _2214 = log2(_2212);
    float _2216 = -_2206;
    float _2218 = fma(_2216, _2188, 1.0);
    float _2220 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2222 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2210);
    float _2224 = _2178 * _2132;
    float _2226 = _2178 * _2140;
    float _2228 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2222);
    float _2230 = _2178 * _2148;
    float _2232 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2234 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2236 = -_2106;
    float _2238 = _2088 + _2236;
    float _2240 = log2(_2218);
    float _2242 = -_2232;
    float _2244 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2242);
    float _2246 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2248 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2250 = -_2226;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2244);
    float _2254 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2246);
    float _2256 = floor(_2234);
    float _2258 = fma(_2252, -0.5, 0.5);
    float _2260 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2262 = fma(_2252, 0.5, 0.5);
    float _2264 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2254);
    float _2266 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2260);
    float _2268 = fma(_2262, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2270 = 1.0 / _2228;
    float _2272 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2264);
    float _2274 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2266);
    float _2276 = fma(_2262, _2268, -0.212114393711090087890625);
    float _2278 = _2240 * 0.693147182464599609375;
    float _2280 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2274);
    float _2282 = fma(_2262, _2276, 1.570728778839111328125);
    float _2284 = exp2(_2248);
    float _2286 = -_2256;
    float _2288 = _2234 + _2286;
    float _2290 = _2230 + 1.0;
    float _2292 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2294 = sqrt(_2258);
    float _2296 = _2272 * _2270;
    float _2298 = _2280 * _2270;
    float _2300 = fma(_2296, 0.5, 0.5);
    float _2302 = fma(_2298, -0.5, 0.5);
    float _2304 = -_2230;
    float _2306 = fma(_2284, _2290, _2304);
    float2 _6750 = float2(_2238, _2288);
    float _2308 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6750, float2(0.0), isnan(_6750)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6750, float2(0.0), isnan(_6750)), level(0.0)).x;
    float3 _6761 = float3(_2300, _2302, _2292);
    float _2310 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6761, float3(0.0), isnan(_6761)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6761, float3(0.0), isnan(_6761)), level(0.0)).x;
    float _2312 = fma(_2306, 0.5, 0.5);
    float _2314 = _2294 * 0.636619746685028076171875;
    float _2316 = -_2282;
    float _2318 = fma(_2314, _2316, 1.0);
    float3 _6782 = float3(_2300, _2302, _2292);
    float4 _2321 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6782, float3(0.0), isnan(_6782)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6782, float3(0.0), isnan(_6782)), level(0.0)).xyzw;
    float _2323 = _2321.x;
    float _2325 = _2321.y;
    float _2327 = _2321.z;
    float _2329 = _2321.w;
    float2 _6798 = float2(_2318, _2312);
    float3 _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6798, float2(0.0), isnan(_6798)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6798, float2(0.0), isnan(_6798)), level(0.0)).xyz;
    float _2335 = _2333.x;
    float _2337 = _2333.y;
    float _2339 = _2333.z;
    float _2341 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2343 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2345 = _1810 != 0.0;
    bool _2347 = isnan(_1810);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(0.0);
    bool _2353 = _2349 || _2351;
    float _2355 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2357 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2341);
    float _2359 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2343);
    bool _2361 = _1808 == 0.0;
    bool _2363 = !_2353;
    bool _2365 = _2361 && _2363;
    float _2367 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2355);
    float _2369 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2357);
    float _2371 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2359);
    bool _2373 = _1812 == 0.0;
    bool _2375 = _2373 && _2365;
    float _2377 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2367);
    float _2379 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2381 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2383 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2377);
    float _2385 = 1.0 / _2379;
    float _2387 = _2381 + _2379;
    out.m_75.x = _1988;
    out.m_75.y = _1984;
    out.m_75.z = _1992;
    float _2389 = _2228 * 0.5;
    float _2391 = _2387 * _2385;
    float _2393 = _2391 * 0.5;
    float _2395 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2397 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2395);
    float _2399 = in.m_77.x;
    float _2401 = in.m_77.y;
    float _2403 = in.m_77.z;
    float _2405 = 1.0 / _2397;
    float _2407 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2409 = _2405 * _2407;
    float _2411 = abs(_2409);
    float _2413 = log2(_2411);
    float _2415 = _2401;
    float _2417 = _2399;
    float _2419 = _2403;
    float _2421 = _2228;
    float _2423 = _2383;
    float _2425 = _2280;
    if (!_2375)
    {
        float _2427 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2401);
        _2415 = _2427;
    }
    float _2429 = _2415;
    if (!_2375)
    {
        float _2431 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2399);
        _2417 = _2431;
    }
    float _2433 = _2417;
    if (!_2375)
    {
        float _2435 = fma(_1812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2403);
        _2419 = _2435;
    }
    float _2437 = _2419;
    bool _2439 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2441 = isnan(0.5);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2447 = _2443 || _2445;
    float _2449 = _1854 * _2429;
    float _2451 = _2383 + _2228;
    float _2453 = fma(_1832, _2433, _2449);
    float _2455 = _2451 * 0.5;
    float _2457 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_2447)
    {
        _2038 = 1.0;
    }
    float _2459 = _2038;
    float _2461 = _2459;
    if (_2447)
    {
        _2040 = 1.0;
    }
    float _2463 = _2040;
    float _2465 = exp2(_2457);
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2469 = precise::clamp(_2467, 0.0, 1.0);
    float _2471 = fma(_2469, -2.0, 3.0);
    float _2473 = _2469 * _2469;
    float _2475 = _2473 * _2471;
    float _2477 = _1866 * _2429;
    float _2479 = _1850 * _2429;
    float _2481 = -_2475;
    float _2483 = _2481 + 1.0;
    float _2485 = fma(_1834, _2433, _2477);
    float _2487 = fma(_1836, _2433, _2479);
    float _2489 = in.m_79.x;
    float _2491 = fma(_1768, _2437, _2453);
    float _2493 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2495 = fma(_1772, _2437, _2485);
    float _2497 = fma(_1770, _2437, _2487);
    float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2475);
    float _2501 = exp2(_2493);
    bool _2503 = _2409 <= 8000.0;
    bool _2505 = isnan(_2409);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan(8000.0);
    bool _2511 = _2507 || _2509;
    float _2513 = float(_2511);
    float _2515 = _2272 + _2228;
    float _2517 = _2513 * _2499;
    float _2519 = _2515 * 0.5;
    float _2521 = fma(_2280, -0.5, _2389);
    float _2523 = _2463;
    if (!_2447)
    {
        float _2525 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2527 = _2525 * 0.15915493667125701904296875;
        float _2529 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2531 = _2527 * 6.283185482025146484375;
        float _2533 = cos(_2531);
        float _2535 = _2529 * 0.15915493667125701904296875;
        float _2537 = _2527 * 6.283185482025146484375;
        float _2539 = sin(_2537);
        float _2541 = 1.0 / _2533;
        float _2543 = _2535 * 6.283185482025146484375;
        float _2545 = cos(_2543);
        float _2547 = _2539 * _2541;
        float _2549 = _2535 * 6.283185482025146484375;
        float _2551 = sin(_2549);
        float _2553 = _2545 * _2547;
        float _2555 = 1.0 / _2553;
        float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2559 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2557;
        float _2561 = 1.0 / _2559;
        float _2563 = _2551 * _2555;
        float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2567 = fma(_2409, _2563, _2565);
        float _2569 = _2567 * _2561;
        float _2571 = precise::clamp(_2569, 0.0, 1.0);
        _2523 = _2571;
    }
    float _2573 = _2523;
    if (!_2447)
    {
        float _2575 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2577 = _2575 * 0.15915493667125701904296875;
        float _2579 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2581 = _2577 * 6.283185482025146484375;
        float _2583 = cos(_2581);
        float _2585 = _2579 * 0.15915493667125701904296875;
        float _2587 = _2577 * 6.283185482025146484375;
        float _2589 = sin(_2587);
        float _2591 = 1.0 / _2583;
        float _2593 = _2585 * 6.283185482025146484375;
        float _2595 = cos(_2593);
        float _2597 = _2589 * _2591;
        float _2599 = _2585 * 6.283185482025146484375;
        float _2601 = sin(_2599);
        float _2603 = _2595 * _2597;
        float _2605 = 1.0 / _2603;
        float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2609 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2607;
        float _2611 = 1.0 / _2609;
        float _2613 = _2601 * _2605;
        float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2617 = fma(_2409, _2613, _2615);
        float _2619 = _2617 * _2611;
        float _2621 = precise::clamp(_2619, 0.0, 1.0);
        float _2623 = -_2621;
        float _2625 = _2623 + 1.0;
        _2461 = _2625;
    }
    float _2627 = _2461;
    float _2629 = -_2501;
    float _2631 = _2629 + 1.0;
    float _2633 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2635 = -_2308;
    float _2637 = _2635 + 1.0;
    float _2639 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2519;
    out.m_81.y = _2521;
    out.m_81.z = _2455;
    out.m_81.w = _2228;
    float _2641 = _2637 * _2633;
    float _2643 = precise::clamp(_2641, 0.0, 1.0);
    bool _2645 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2647 = isnan(_2006);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2653 = _2649 || _2651;
    float _2655 = _2639 * _2310;
    float _2657 = -_2639;
    float _2659 = _2657 + 1.0;
    float _2661 = -_2643;
    float _2663 = fma(_2661, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2491;
    out.m_83.y = _2495;
    out.m_83.z = _2497;
    float _2665 = _2329 * _2655;
    float _2667 = _2663 * _2489;
    out.gl_Position.x = _2272;
    out.gl_Position.y = _2280;
    out.gl_Position.z = _2383;
    out.gl_Position.w = _2228;
    float _2669 = _2339 * _2655;
    float _2671 = fma(_2335, _2665, _2323);
    float _2673 = fma(_2337, _2665, _2325);
    float _2675 = _2667 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2677 = _2329 * _2659;
    float _2679 = fma(_2329, _2669, _2327);
    float _2681 = _2667;
    float _2683 = _2665;
    if (!_2653)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2685 = _2681;
    out.m_85.x = _2675;
    float _2687 = _2685;
    float _2689 = _2685;
    if (!_2653)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2691 = _2683;
    float _2693 = _2573 * _2627;
    float _2695 = _2693;
    float _2697 = _2691;
    float _2699 = _2691;
    if (!_2653)
    {
        _2421 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2701 = _2421;
    out.m_87.x = _2671;
    out.m_87.y = _2673;
    out.m_87.z = _2679;
    out.m_87.w = _2677;
    float _2703 = _2701;
    float _2705 = _2701;
    if (!_2653)
    {
        _2423 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2707 = _2423;
    float _2709 = _2693 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2711 = _2707;
    float _2713 = _2707;
    if (!_2653)
    {
        _2425 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2715 = _2425;
    float _2717 = _2715;
    float _2719 = _2715;
    if (!_2653)
    {
        _2695 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2721 = _2695;
    bool _2723 = !_2653;
    float _2725 = _2721;
    float _2727 = _2721;
    if (!_2723)
    {
        bool _2729 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2731 = isnan(_2006);
        bool _2733 = _2729 || _2731;
        bool _2735 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2737 = _2733 || _2735;
        if (!_2737)
        {
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2741 = _2006 + _2739;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2745 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2743;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2755 = 1.0 / _2745;
            float _2757 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2759 = _2757 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2769 = _2741 * _2755;
            float _2771 = precise::clamp(_2769, 0.0, 1.0);
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2777 = fma(_2771, _2749, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2779 = fma(_2771, _2753, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2781 = fma(_2771, _2759, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2783 = fma(_2771, _2775, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2785 = fma(_2771, _2763, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2787 = fma(_2771, _2767, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2699 = _2781;
            _2719 = _2777;
            _2689 = _2779;
            _2713 = _2785;
            _2705 = _2783;
            _2727 = _2787;
            _2789 = true;
        }
        else
        {
            bool _2791 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2793 = isnan(_2006);
            bool _2795 = _2791 || _2793;
            bool _2797 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2799 = _2795 || _2797;
            if (!_2799)
            {
                _2687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2801 = _2687;
            _2689 = _2801;
            if (!_2799)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2803 = _2697;
            _2699 = _2803;
            if (!_2799)
            {
                _2703 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2805 = _2703;
            _2705 = _2805;
            if (!_2799)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2807 = _2711;
            _2713 = _2807;
            if (!_2799)
            {
                _2717 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2809 = _2717;
            _2719 = _2809;
            if (!_2799)
            {
                _2725 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2811 = _2725;
            bool _2813 = !_2799;
            _2727 = _2811;
            if (!_2813)
            {
                bool _2815 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2817 = isnan(_2006);
                bool _2819 = _2815 || _2817;
                bool _2821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2823 = _2819 || _2821;
                if (!_2823)
                {
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2827 = _2006 + _2825;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2831 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2829;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2841 = 1.0 / _2831;
                    float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2855 = _2827 * _2841;
                    float _2857 = precise::clamp(_2855, 0.0, 1.0);
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2863 = fma(_2857, _2835, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2865 = fma(_2857, _2839, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2867 = fma(_2857, _2845, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2869 = fma(_2857, _2861, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2871 = fma(_2857, _2849, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2873 = fma(_2857, _2853, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2699 = _2867;
                    _2719 = _2863;
                    _2689 = _2865;
                    _2713 = _2871;
                    _2705 = _2869;
                    _2727 = _2873;
                    _2789 = true;
                }
                else
                {
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2719 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2705 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2727 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2789 = false;
    float _2875 = _2699;
    float _2877 = _2719;
    float _2879 = _2689;
    float _2881 = _2713;
    float _2883 = _2705;
    float _2885 = _2727;
    float _2887 = fma(_2495, -0.5, 0.5);
    float _2889 = precise::clamp(_2887, 0.0, 1.0);
    float _2891 = -_2875;
    float _2893 = _2891 + _2877;
    float _2895 = -_2879;
    float _2897 = _2895 + _2881;
    out.m_89.x = 0.0;
    float _2899 = -_2883;
    float _2901 = _2899 + _2885;
    float _2903 = fma(_2889, _2893, _2875);
    float _2905 = fma(_2889, _2897, _2879);
    bool _2907 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2909 = _2903 * 0.586610972881317138671875;
    float _2911 = fma(_2889, _2901, _2883);
    float _2913 = _2709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2915 = fma(_2905, 0.298911988735198974609375, _2909);
    bool _2917 = _2573 > 0.0;
    bool _2919 = isnan(_2573);
    bool _2921 = _2917 || _2919;
    bool _2923 = isnan(0.0);
    bool _2925 = _2921 || _2923;
    float _2927 = fma(_2911, 0.114477999508380889892578125, _2915);
    out.m_49.x = _2913;
    bool _2929 = _2627 <= 0.0;
    bool _2931 = !_2925;
    bool _2933 = _2929 || _2931;
    float _2935 = -_2927;
    float _2937 = _2905 + _2935;
    float _2939 = -_2927;
    float _2941 = _2911 + _2939;
    float _2943 = fma(_2937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2927);
    float _2945 = -_2927;
    float _2947 = _2903 + _2945;
    float _2949 = fma(_2947, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2927);
    float _2951 = fma(_2941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2927);
    bool _2953 = !_2907;
    if (!_2953)
    {
        float _2955 = -_1972;
        float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2959 = -_1976;
        float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2963 = -_1980;
        float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2967 = _2957 * _2957;
        float _2969 = fma(_2961, _2961, _2967);
        float _2971 = fma(_2965, _2965, _2969);
        float _2973 = sqrt(_2971);
        float _2975 = rsqrt(_2971);
        float _2977 = -_2973;
        float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2981 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2983 = precise::clamp(_2981, 0.0, 1.0);
        float _2985 = _2961 * _2975;
        float _2987 = _2957 * _2975;
        float _2989 = abs(_2983);
        float _2991 = log2(_2989);
        float _2993 = _2965 * _2975;
        float _2995 = _2985 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2997 = _2495 * _2987;
        float _2999 = -_2987;
        float _3001 = -_2995;
        float _3003 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3001);
        float _3005 = fma(_2491, _2985, _2997);
        float _3007 = -_2993;
        float _3009 = fma(_3007, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3003);
        float _3011 = fma(_2497, _2993, _3005);
        float _3013 = precise::clamp(_3011, 0.0, 1.0);
        float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3017 = _3009 + _3015;
        float _3019 = _2991 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3021 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3023 = precise::clamp(_3021, 0.0, 1.0);
        float _3025 = exp2(_3019);
        float _3027 = _3025 * _3023;
        float _3029 = _3013 * _3027;
        float _3031 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3033 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3035 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3031;
        out.m_89.y = _3033;
        out.m_89.z = _3035;
    }
    out.m_91.x = _2943;
    out.m_91.y = _2949;
    out.m_91.z = _2951;
    if (!_2933)
    {
        return out;
    }
    float _3037 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3037;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2789 = false;
    bool _1002 = false;
    bool _822 = false;
    bool _642 = false;
    bool _516 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3093 = as_type<float>(_126);
        out.gl_Position.z = _3093;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_51.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_138)
    {
        float _144 = float(_110);
        _120 = _144;
    }
    float _146 = _120;
    bool _148 = _142 >= _146;
    bool _150 = !_138;
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
    int _158 = 0;
    if (_152)
    {
        float _160 = _156 * 5.0;
        _158 = as_type<int>(_160);
    }
    int _162 = _158;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3162 = as_type<float>(_162);
        out.gl_Position.z = _3162;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_53.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_110);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _194 + _196;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _204 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _214 = _212 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _216 = 1.0 / _202;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _218;
    float _222 = 1.0 / _210;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _194 + _224;
    bool _228 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _230 = isnan(_194);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _236 = _232 || _234;
    float _238 = float(_236);
    bool _240 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _242 = isnan(_194);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _248 = _244 || _246;
    float _250 = float(_248);
    float _252 = 1.0 / _206;
    float _254 = _226 * _216;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _258 = _194 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_262, _254, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = 1.0 / _214;
    float _268 = _258 * _222;
    bool _270 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _272 = isnan(_194);
    bool _274 = _270 || _272;
    bool _276 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _278 = _274 || _276;
    float _280 = float(_278);
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _284 = _194 + _282;
    bool _286 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _288 = isnan(_194);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _300 = -_280;
    float _302 = _300 + 1.0;
    float _304 = 1.0 / _220;
    float _306 = _198 * _252;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _310 = _194 + _308;
    bool _312 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _314 = isnan(_194);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_296;
    float _326 = _324 + 1.0;
    float _328 = _284 * _266;
    float _330 = _296 * _302;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = _322 * _326;
    float _338 = -_322;
    float _340 = _338 + 1.0;
    bool _342 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _344 = isnan(_194);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = fma(_334, _254, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _360 = _310 * _304;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _362;
    float _366 = _238 * _340;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = fma(_358, _306, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _374 = fma(_364, _254, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _376 = -_238;
    float _378 = _376 + 1.0;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = fma(_370, _306, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _386 = _250 * _378;
    float _388 = -_250;
    float _390 = _388 + 1.0;
    float _392 = fma(_382, _306, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _394 = _352 * _390;
    float _396 = -_352;
    float _398 = _396 + 1.0;
    float _400 = _374 * _394;
    float _402 = _354 * _394;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _404;
    float _408 = _264 * _394;
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].x, _400);
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _416 = fma(_406, _268, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _418 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].y, _402);
    float _420 = fma(_372, _386, _410);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[143].z, _408);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _428;
    float _432 = fma(_414, _328, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _438 = fma(_392, _386, _418);
    float _440 = fma(_416, _366, _420);
    float _442 = fma(_424, _268, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _444 = fma(_384, _386, _426);
    float _446 = fma(_430, _268, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _452 = fma(_436, _328, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _454 = fma(_442, _366, _444);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _460;
    float _464 = fma(_450, _328, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _466 = fma(_446, _366, _438);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _470 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _468;
    float _472 = fma(_432, _336, _440);
    float _474 = fma(_458, _360, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _476 = fma(_462, _360, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _478 = fma(_470, _360, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _480 = fma(_452, _336, _466);
    float _482 = fma(_464, _336, _454);
    float _484 = fma(_474, _330, _472);
    float _486 = fma(_476, _330, _480);
    float _488 = fma(_478, _330, _482);
    float _490 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[148].x, _484);
    float _492 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[148].y, _486);
    float _494 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[148].z, _488);
    bool _496 = !_298;
    float _514;
    if (!_496)
    {
        float _498 = in.m_53.x;
        float _500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _502 = _498 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _504 = fma(_502, (*spvDescriptorSet0.vp_c9)._m0[11].x, _142);
        float _506 = _504 * _500;
        float _508 = floor(_506);
        float _510 = -_508;
        float _512 = _506 + _510;
        _514 = _512;
        _516 = true;
    }
    else
    {
        float _518 = float(_110);
        float _520 = 1.0 / _518;
        float _522 = _142 * _520;
        _514 = _522;
    }
    _516 = false;
    float _524 = _514;
    float _526 = in.m_55.x;
    float _528 = in.m_55.y;
    float _530 = in.m_55.z;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _534 = _524 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _536;
    bool _540 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _542 = isnan(_524);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    bool _552 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _554 = 1.0 / _538;
    float _556 = _492 * _528;
    bool _558 = _524 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _560 = isnan(_524);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = _534 * _554;
    float _572 = _494 * _530;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _574;
    float _578 = -_568;
    float _580 = _578 + 1.0;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _582;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _586;
    float _590 = _550 * _580;
    float _592 = fma(_576, _570, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _594 = fma(_584, _570, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _596 = fma(_588, _570, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _598 = -_550;
    float _600 = _598 + 1.0;
    float _602 = _592 * _590;
    float _604 = _594 * _590;
    float _606 = _596 * _590;
    float _608 = _490 * _526;
    float _610 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].y, _602);
    float _612 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].x, _604);
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[107].z, _606);
    float _616 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[108].y, _610);
    float _618 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[108].x, _612);
    float _620 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[108].z, _614);
    bool _622 = !_552;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].y, _142);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_110);
        float _646 = 1.0 / _644;
        float _648 = _142 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _654 = _650 + _652;
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _658 = _656 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _664 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _666 = isnan(_650);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _680 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _682 = isnan(_650);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _658;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _694;
    float _698 = -_674;
    float _700 = _698 + 1.0;
    bool _702 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _704 = isnan(_650);
    bool _706 = _702 || _704;
    bool _708 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _710 = _706 || _708;
    float _712 = float(_710);
    bool _714 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _716 = 1.0 / _662;
    float _718 = 1.0 / _678;
    float _720 = _696 * _692;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _726 = _690 * _700;
    float _728 = -_690;
    float _730 = _728 + 1.0;
    float _732 = fma(_720, _654, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _734;
    float _738 = _712 * _730;
    float _740 = _724 * _716;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _744 = _650 + _742;
    bool _746 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _748 = isnan(_650);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = _732 * _738;
    float _760 = -_712;
    float _762 = _760 + 1.0;
    float _764 = fma(_740, _744, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _768 = _650 + _766;
    float _770 = _736 * _718;
    float _772 = -_756;
    float _774 = _772 + 1.0;
    float _776 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[115].x, _758);
    float _778 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _780 = fma(_770, _768, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _782 = _674 * _774;
    float _784 = fma(_764, _726, _776);
    float _786 = _778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _788 = fma(_780, _782, _784);
    float _790 = _616 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _792 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _794 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[118].x, _788);
    float _796 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _794 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _786;
    out.m_57.y = _796;
    out.m_57.z = _798;
    out.m_57.w = _800;
    bool _802 = !_714;
    float _820;
    if (!_802)
    {
        float _804 = in.m_53.x;
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _808 = _804 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[11].w, _142);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        float _824 = float(_110);
        float _826 = 1.0 / _824;
        float _828 = _142 * _826;
        _820 = _828;
    }
    _822 = false;
    float _830 = _820;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _834 = _830 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _838 = _836 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _844 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _846 = isnan(_830);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _858 = _856 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _860 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _862 = isnan(_830);
    bool _864 = _860 || _862;
    bool _866 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _868 = _864 || _866;
    float _870 = float(_868);
    float _872 = 1.0 / _838;
    float _874 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _874;
    float _878 = -_854;
    float _880 = _878 + 1.0;
    bool _882 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _884 = isnan(_830);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    bool _894 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _896 = 1.0 / _842;
    float _898 = 1.0 / _858;
    float _900 = _876 * _872;
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _906 = _870 * _880;
    float _908 = -_870;
    float _910 = _908 + 1.0;
    float _912 = fma(_900, _834, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _916 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _914;
    float _918 = _892 * _910;
    float _920 = _904 * _896;
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _924 = _830 + _922;
    bool _926 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _928 = isnan(_830);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = _912 * _918;
    float _940 = -_892;
    float _942 = _940 + 1.0;
    float _944 = fma(_920, _924, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _948 = _830 + _946;
    float _950 = _916 * _898;
    float _952 = -_936;
    float _954 = _952 + 1.0;
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[131].x, _938);
    float _958 = fma(_950, _948, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _960 = _854 * _954;
    float _962 = fma(_944, _906, _956);
    float _964 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _966 = fma(_958, _960, _962);
    float _968 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _970 = _964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _974 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[134].x, _966);
    float _976 = _968 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _970;
    out.m_59.y = _976;
    out.m_59.z = _978;
    out.m_59.w = _980;
    bool _982 = !_894;
    float _1000;
    if (!_982)
    {
        float _984 = in.m_53.x;
        float _986 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _988 = _984 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _990 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[14].x, _142);
        float _992 = _990 * _986;
        float _994 = floor(_992);
        float _996 = -_994;
        float _998 = _992 + _996;
        _1000 = _998;
        _1002 = true;
    }
    else
    {
        float _1004 = float(_110);
        float _1006 = 1.0 / _1004;
        float _1008 = _142 * _1006;
        _1000 = _1008;
    }
    _1002 = false;
    float _1010 = _1000;
    float _1012 = in.m_53.w;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1016 = _1010 + _1014;
    float _1018 = in.m_61.y;
    int _1020 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1022 = _1020 != 0;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1026 = _1010 + _1024;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1030 = _1028 != 0;
    float _1032 = in.m_53.y;
    int _1034 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1036 = _1034 != 0;
    float _1038 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1038;
    float _1042 = in.m_53.z;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1046 = _1044 != 0;
    float _1048 = 1.0 / _1040;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1054 = in.m_53.x;
    float _1056 = in.m_61.x;
    float _1058 = 1.0 / _1052;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1060;
    bool _1064 = _1012 > 0.5;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1068 = in.m_46.x;
    float _1070 = in.m_46.y;
    float _1072 = in.m_46.z;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1074;
    float _1078 = -_1018;
    float _1080 = _1078 + 1.0;
    bool _1082 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1084 = isnan(_1010);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1090 = _1086 || _1088;
    float _1092 = float(_1090);
    float _1094 = 1.0 / _1062;
    bool _1096 = _1032 > 0.5;
    bool _1098 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1100 = isnan(_1010);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1112 = _1042 > 0.5;
    float _1114 = _1016 * _1058;
    int _1116 = _1096 ? as_type<int>(_1080) : as_type<int>(_1018);
    float _1118 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1120 = _1112 ? as_type<int>(_1080) : as_type<int>(_1018);
    float _1122 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1124 = _1030 ? as_type<float>(_1116) : _1018;
    float _1126 = -_1110;
    float _1128 = fma(_1118, 2.0, _1126);
    float _1130 = _1036 ? as_type<float>(_1120) : _1018;
    float _1132 = _1032 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1136 = _1134 != 0;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1140 = _1010 + _1138;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1144 = _1142 != 0;
    float _1146 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1148 = _1018;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    bool _1152 = _1022;
    float _1154 = _1032;
    float _1156 = _1056;
    if (_1022)
    {
        float _1158 = _1064 ? _1080 : _1018;
        _1148 = _1158;
    }
    float _1160 = _1148;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1166 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1168 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1146);
    float _1170 = 1.0 / _1164;
    float _1172 = fma(_1132, -2.0, _1066);
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1174;
    float _1178 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1166);
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1182 = _1010 + _1180;
    int _1184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1186 = _1184 != 0;
    float _1188 = _1140 * _1048;
    float _1190 = 1.0 / _1176;
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1196 = _1070 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1198 = _1182 * _1094;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1202 = _1010 + _1200;
    float _1204 = fma(_1068, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1196);
    float _1206 = 1.0 / _1194;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1210 = _1010 + _1208;
    if (_1186)
    {
        _1150 = _1054;
    }
    float _1212 = _1150;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1216;
    float _1220 = _1210 * _1170;
    float _1222 = _1212;
    if (!_1186)
    {
        _1222 = _1042;
    }
    float _1224 = _1222;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1228 = 1.0 / _1218;
    float _1230 = _1026 * _1190;
    float _1232 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1234 = _1010 + _1232;
    float _1236 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1214);
    float _1238 = _1224;
    if (_1046)
    {
        bool _1240 = _1054 > 0.5;
        _1152 = _1240;
    }
    bool _1242 = _1152;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1246 = _1202 * _1206;
    float _1248 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1226);
    float _1250 = fma(_1032, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1244);
    if (!_1186)
    {
        _1154 = _1054;
    }
    float _1252 = _1154;
    float _1254 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1178);
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1258 = _1234 * _1228;
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1260;
    float _1264 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1256);
    float _1266 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1204);
    float _1268 = fma(_1072, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1168);
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1276 = _1274 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1278 = fma(_1262, _1188, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1280 = fma(_1076, _1188, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1286;
    float _1290 = fma(_1272, _1114, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1292 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1294 = _1292 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1296 = fma(_1276, _1114, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1302 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1304 = fma(_1284, _1198, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1308 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1310;
    float _1314 = fma(_1294, _1220, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1318 = _1316 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1320 = fma(_1300, _1220, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1326 = fma(_1308, _1230, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1328 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1330 = isnan(_1010);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1336 = _1332 || _1334;
    float _1338 = float(_1336);
    float _1340 = fma(_1312, _1230, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1342 = fma(_1318, _1246, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1344 = fma(_1324, _1246, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    bool _1346 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1348 = isnan(_1010);
    bool _1350 = _1346 || _1348;
    bool _1352 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1354 = _1350 || _1352;
    float _1356 = float(_1354);
    float _1358 = -_1338;
    float _1360 = _1358 + 1.0;
    float _1362 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1364 = _1302 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1366 = _1356 * _1360;
    float _1368 = -_1356;
    float _1370 = _1368 + 1.0;
    float _1372 = -_1092;
    float _1374 = _1372 + 1.0;
    float _1376 = fma(_1362, _1124, -0.5);
    bool _1378 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1380 = isnan(_1010);
    bool _1382 = _1378 || _1380;
    bool _1384 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1386 = _1382 || _1384;
    float _1388 = float(_1386);
    float _1390 = _1092 * _1370;
    float _1392 = -_1108;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_1130, _1364, -0.5);
    float _1398 = _1108 * _1374;
    bool _1400 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1402 = isnan(_1010);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1172);
    bool _1414 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1416 = isnan(_1010);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = fma(_1288, _1198, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _1428 = _1010 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1430 = isnan(_1010);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = _1388 * _1394;
    float _1442 = -_1388;
    float _1444 = _1442 + 1.0;
    float _1446 = -_1424;
    float _1448 = _1446 + 1.0;
    float _1450 = -_1438;
    float _1452 = _1450 + 1.0;
    float _1454 = _1438 * _1444;
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1460;
    float _1464 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1236);
    float _1466 = fma(_1458, _1258, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1468 = fma(_1462, _1258, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    int _1470 = as_type<int>(_1462);
    float _1472 = _1288;
    float _1474 = _1268;
    if (_1046)
    {
        float _1476 = -_1056;
        float _1478 = _1476 + 1.0;
        _1470 = as_type<int>(_1478);
    }
    int _1480 = _1470;
    float _1482 = -_1412;
    float _1484 = fma(_1464, _1376, _1482);
    int _1486 = _1480;
    if (!_1046)
    {
        _1472 = _1056;
    }
    float _1488 = _1472;
    float _1490 = _1424 * _1452;
    float _1492 = _1410 * _1448;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1496 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1498 = _1224 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1500 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1502 = _1488;
    if (_1046)
    {
        float _1504 = _1242 ? as_type<float>(_1480) : _1056;
        _1502 = _1504;
    }
    float _1506 = _1502;
    float _1508 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (_1136)
    {
        float _1510 = -_1056;
        float _1512 = _1510 + 1.0;
        _1486 = as_type<int>(_1512);
    }
    int _1514 = _1486;
    float _1516 = _1278 * _1492;
    float _1518 = -_1410;
    float _1520 = _1518 + 1.0;
    float _1522 = -_1496;
    float _1524 = fma(_1498, 2.0, _1522);
    float _1526 = fma(_1508, -2.0, _1494);
    if (!_1136)
    {
        _1238 = _1056;
    }
    float _1528 = _1238;
    float _1530 = _1280 * _1492;
    float _1532 = _1528;
    if (_1136)
    {
        float _1534 = _1112 ? as_type<float>(_1514) : _1056;
        _1532 = _1534;
    }
    float _1536 = _1532;
    float _1538 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1516);
    float _1540 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1248);
    float _1542 = -_142;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1128);
    float _1546 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1264);
    float _1548 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1250);
    float _1550 = -_142;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1524);
    float _1554 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1526);
    float _1556 = fma(_1290, _1490, _1538);
    float _1558 = _1500 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1560 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1562 = -_1554;
    float _1564 = fma(_1548, _1396, _1562);
    float _1566 = _1268 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1568 = fma(_1558, _1506, -0.5);
    float _1570 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1530);
    float _1572 = _1254 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1576 = _1566 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1580 = _1560 + _1578;
    float _1582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1584 = fma(_1296, _1490, _1570);
    float _1586 = _1576 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1588 = fma(_1304, _1454, _1556);
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1592 = _1572 + _1590;
    int _1594 = 0;
    float _1596 = _1566;
    if (_1144)
    {
        float _1598 = -_1056;
        float _1600 = _1598 + 1.0;
        _1594 = as_type<int>(_1600);
    }
    int _1602 = _1594;
    float _1604 = fma(_1580, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1586);
    float _1606 = fma(_1314, _1440, _1588);
    float _1608 = fma(_1426, _1454, _1584);
    float _1610 = _1576 * _1576;
    float _1612 = fma(_1592, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1604);
    float _1614 = fma(_1326, _1398, _1606);
    if (_1144)
    {
        float _1616 = _1096 ? as_type<float>(_1602) : _1056;
        _1156 = _1616;
    }
    float _1618 = _1156;
    float _1620 = in.m_63.w;
    float _1622 = fma(_1320, _1440, _1608);
    bool _1624 = _1612 >= 0.0;
    float _1626 = fma(_1580, _1580, _1610);
    float _1628 = _1582 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1630 = fma(_1340, _1398, _1622);
    float _1632 = fma(_1342, _1390, _1614);
    float _1634 = fma(_1592, _1592, _1626);
    float _1636 = fma(_1628, _1618, -0.5);
    float _1638 = fma(_1344, _1390, _1630);
    float _1640 = fma(_1540, _1568, _1544);
    float _1642 = rsqrt(_1634);
    float _1644 = fma(_1546, _1636, _1552);
    float _1646 = fma(_1466, _1366, _1632);
    float _1648 = fma(_1468, _1366, _1638);
    if (_1624)
    {
        _1474 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1650 = _1474;
    float _1652 = _1160 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1654 = _1484 + 0.5;
    float _1656 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1658 = _1564 + 0.5;
    float _1660 = _1644 + 0.5;
    float _1662 = _1640 + 0.5;
    int _1664 = as_type<int>(_1650);
    if (_1624)
    {
        float _1666 = _1650 * 5.0;
        _1664 = as_type<int>(_1666);
    }
    int _1668 = _1664;
    float _1670 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1646);
    float _1672 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1648);
    out.m_65.w = _1620;
    float _1674 = _1576 * _1642;
    float _1676 = _1580 * _1642;
    out.m_67.x = _1662;
    out.m_67.y = _1654;
    out.m_67.z = _1656;
    out.m_67.w = _1652;
    out.m_69.x = _1660;
    out.m_69.y = _1658;
    if (_1624)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5702 = as_type<float>(_1668);
        out.gl_Position.z = _5702;
    }
    out.m_71.x = _1670;
    out.m_71.y = _1672;
    if (_1624)
    {
        out.m_49.x = 0.0;
    }
    if (_1624)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1678 = -_1674;
    float _1680 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1566);
    float _1682 = _1592 * _1642;
    float _1684 = -_1676;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1560);
    float _1688 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1690 = _1680 + _1688;
    float _1692 = -_1682;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1572);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1698 = _1686 + _1696;
    float _1700 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1704 = _1694 + _1702;
    float _1706 = fma(_1698, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1700);
    float _1708 = fma(_1704, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1706);
    bool _1710 = _1708 >= 0.0;
    float _1712 = _1704;
    float _1714 = _1682;
    if (_1710)
    {
        _1712 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1716 = _1712;
    int _1718 = as_type<int>(_1716);
    if (_1710)
    {
        out.m_49.x = 0.0;
    }
    if (_1710)
    {
        float _1720 = _1716 * 5.0;
        _1718 = as_type<int>(_1720);
    }
    int _1722 = _1718;
    if (_1710)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5802 = as_type<float>(_1722);
        out.gl_Position.z = _5802;
    }
    if (_1710)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1724 = -_1566;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = -_1560;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1732 = -_1572;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1736 = -_1674;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1576);
    float _1740 = _1726 * _1726;
    float _1742 = -_1676;
    float _1744 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1580);
    float _1746 = -_1682;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1592);
    float _1750 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1752 = fma(_1730, _1730, _1740);
    float _1754 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1756 = fma(_1734, _1734, _1752);
    float _1758 = _1738 * _1738;
    float _1760 = rsqrt(_1756);
    float _1762 = fma(_1744, _1744, _1758);
    float _1764 = fma(_1748, _1748, _1762);
    float _1766 = sqrt(_1764);
    float _1768 = _1730 * _1760;
    float _1770 = _1734 * _1760;
    float _1772 = _1726 * _1760;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1776 = _1768 * _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1780 = _1770 * _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1784 = -_1776;
    float _1786 = fma(_1770, _1782, _1784);
    float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1790 = _1772 * _1788;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1794 = -_1780;
    float _1796 = fma(_1772, _1792, _1794);
    float _1798 = _1642 * _1766;
    float _1800 = _1786 * _1786;
    float _1802 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1804 = -_1790;
    float _1806 = fma(_1768, _1802, _1804);
    float _1808 = in.m_73.x;
    float _1810 = in.m_73.y;
    float _1812 = in.m_73.z;
    float _1814 = _1798 * _1750;
    float _1816 = fma(_1796, _1796, _1800);
    float _1818 = fma(_1806, _1806, _1816);
    float _1820 = _556 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1822 = rsqrt(_1818);
    float _1824 = _1798 * _1820;
    float _1826 = _1798 * _1754;
    float _1828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1810);
    float _1830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1808);
    float _1832 = _1796 * _1822;
    float _1834 = _1786 * _1822;
    float _1836 = _1806 * _1822;
    float _1838 = _1824 * _1828;
    float _1840 = _1772 * _1832;
    float _1842 = _1770 * _1834;
    float _1844 = _1826 * _1830;
    float _1846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1812);
    float _1848 = -_1840;
    float _1850 = fma(_1768, _1834, _1848);
    float _1852 = -_1842;
    float _1854 = fma(_1772, _1836, _1852);
    float _1856 = _1768 * _1836;
    float _1858 = _1814 * _1846;
    float _1860 = _1838 * _1850;
    float _1862 = _1838 * _1854;
    float _1864 = -_1856;
    float _1866 = fma(_1770, _1832, _1864);
    float _1868 = fma(_1844, _1836, _1860);
    float _1870 = fma(_1844, _1832, _1862);
    float _1872 = fma(_1858, _1770, _1868);
    float _1874 = fma(_1858, _1768, _1870);
    float _1876 = _1572 + _1872;
    float _1878 = _1560 + _1874;
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1882 = _1876 + _1880;
    float _1884 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1886 = _1878 + _1884;
    float _1888 = _1882 * _1882;
    float _1890 = fma(_1886, _1886, _1888);
    float _1892 = _1838 * _1866;
    float _1894 = sqrt(_1890);
    float _1896 = fma(_1844, _1834, _1892);
    float _1898 = fma(_1858, _1772, _1896);
    float _1900 = _1566 + _1898;
    bool _1902 = _1894 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1904 = _1898;
    float _1906 = _1878;
    float _1908 = _1876;
    float _1910 = _1896;
    float _1912 = _1894;
    float _1914 = _1882;
    if (!_1902)
    {
        _1904 = _1900;
    }
    float _1916 = _1904;
    bool _1918 = !_1902;
    float _1920 = _1916;
    if (!_1918)
    {
        float _1922 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1924 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1926 = _1894 + _1924;
        float _1928 = _1900 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1930 = rsqrt(_1890);
        float _1932 = _1926 * _1922;
        float _1934 = _1932 * 0.15915493667125701904296875;
        float _1936 = _1934 * 6.283185482025146484375;
        float _1938 = cos(_1936);
        float _1940 = _1934 * 6.283185482025146484375;
        float _1942 = sin(_1940);
        float _1944 = _1938 + (-1.0);
        float _1946 = _1944 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1948 = fma(_1942, _1928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1950 = fma(_1900, _1938, _1946);
        float _1952 = _1930 * _1948;
        float _1954 = fma(_1886, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1956 = fma(_1882, _1952, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1920 = _1950;
        _1906 = _1954;
        _1908 = _1956;
        _1910 = _1948;
        _1596 = _1946;
        _1912 = _1952;
    }
    float _1958 = _1920;
    float _1960 = _1906;
    float _1962 = _1908;
    float _1964 = _1910;
    float _1966 = _1596;
    float _1968 = _1912;
    float _1970 = -_1674;
    float _1972 = fma(_1970, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1958);
    float _1974 = -_1676;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1960);
    float _1978 = -_1682;
    float _1980 = fma(_1978, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1962);
    float _1982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1984 = _1972 + _1982;
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1988 = _1976 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1992 = _1980 + _1990;
    float _1994 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1996 = _1984 * _1984;
    float _1998 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1994);
    float _2000 = fma(_1988, _1988, _1996);
    float _2002 = fma(_1992, _1992, _2000);
    float _2004 = rsqrt(_2002);
    float _2006 = sqrt(_2002);
    float _2008 = _2004 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2010 = _1988 * _2008;
    float _2012 = _1992 * _2008;
    float _2014 = _2010 * _2010;
    float _2016 = _2012 * _2012;
    float _2018 = _2014 + _2016;
    float _2020 = sqrt(_2018);
    bool _2022 = _2020 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2024 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2026 = _2020 + _2024;
    float _2028 = _1964;
    float _2030 = _1968;
    float _2032 = _2026;
    float _2034 = _2008;
    float _2036 = _2018;
    float _2038 = _1988;
    float _2040 = _1984;
    if (_2022)
    {
        float _2042 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2028 = _2042;
    }
    float _2044 = _2028;
    if (_2022)
    {
        float _2046 = rsqrt(_2018);
        _2030 = _2046;
    }
    float _2048 = _2030;
    float _2050 = _2048;
    if (_2022)
    {
        float _2052 = _2026 * _2044;
        _2032 = _2052;
    }
    float _2054 = _2032;
    if (_2022)
    {
        float _2056 = _2054 * 0.15915493667125701904296875;
        _1714 = _2056;
    }
    float _2058 = _1714;
    float _2060 = _1960;
    float _2062 = _2058;
    if (_2022)
    {
        float _2064 = _2058 * 6.283185482025146484375;
        float _2066 = sin(_2064);
        _2060 = _2066;
    }
    float _2068 = _2060;
    float _2070 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2072 = precise::max(0.0, _2070);
    float _2074 = _1966;
    if (_2022)
    {
        float _2076 = _2058 * 6.283185482025146484375;
        float _2078 = cos(_2076);
        _2074 = _2078;
    }
    float _2080 = _2074;
    float _2082 = -_2008;
    float _2084 = -_2072;
    float _2086 = fma(_1984, _2082, _2084);
    float _2088 = fma(_1686, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2090 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2022)
    {
        float _2092 = _2086 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1914 = _2092;
    }
    float _2094 = _1914;
    float _2096 = _2094;
    if (!_2022)
    {
        _2062 = _2012;
    }
    float _2098 = _2062;
    float _2100 = _2098;
    if (_2022)
    {
        float _2102 = fma(_2068, _2094, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2096 = _2102;
    }
    float _2104 = _2096;
    float _2106 = floor(_2088);
    float _2108 = _2104;
    float _2110 = _2080;
    if (_2022)
    {
        float _2112 = _2080 + (-1.0);
        _2090 = _2112;
    }
    float _2114 = _2090;
    float _2116 = _2114;
    if (_2022)
    {
        float _2118 = _2048 * _2104;
        _2034 = _2118;
    }
    float _2120 = _2034;
    if (!_2022)
    {
        _2050 = _2010;
    }
    float _2122 = _2050;
    float _2124 = _2122;
    if (_2022)
    {
        float _2126 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2036 = _2126;
    }
    float _2128 = _2036;
    if (_2022)
    {
        float _2130 = _2010 * _2120;
        _2124 = _2130;
    }
    float _2132 = _2124;
    if (!_2022)
    {
        _2108 = _2086;
    }
    float _2134 = _2108;
    float _2136 = _2134;
    if (_2022)
    {
        float _2138 = _2012 * _2120;
        _2100 = _2138;
    }
    float _2140 = _2100;
    if (!_2022)
    {
        _2116 = _2014;
    }
    float _2142 = _2116;
    float _2144 = _2142;
    if (_2022)
    {
        float _2146 = fma(_2086, _2080, _2128);
        _2136 = _2146;
    }
    float _2148 = _2136;
    if (_2022)
    {
        float _2150 = _2132 * _2132;
        _2144 = _2150;
    }
    float _2152 = _2144;
    if (!_2022)
    {
        _2110 = _2016;
    }
    float _2154 = _2110;
    float _2156 = _2154;
    if (_2022)
    {
        float _2158 = _2140 * _2140;
        _2156 = _2158;
    }
    float _2160 = _2156;
    float _2162 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2164 = fma(_2148, _2148, _2152);
    float _2166 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2168 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2162);
    float _2170 = _2164 + _2160;
    float _2172 = _1972 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2174 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2166);
    float _2176 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2168);
    float _2178 = rsqrt(_2170);
    float _2180 = fma(_1976, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2172);
    float _2182 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2174);
    float _2184 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2186 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2180);
    float _2188 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2192 = fma(_2006, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2190);
    float _2194 = precise::clamp(_2192, 0.0, 1.0);
    float _2196 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2198 = _2186 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2200 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2202 = -_2194;
    float _2204 = _2202 + 1.0;
    float _2206 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2208 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1998);
    float _2210 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2200);
    float _2212 = abs(_2204);
    float _2214 = log2(_2212);
    float _2216 = -_2206;
    float _2218 = fma(_2216, _2188, 1.0);
    float _2220 = _2208 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2222 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2210);
    float _2224 = _2178 * _2132;
    float _2226 = _2178 * _2140;
    float _2228 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2222);
    float _2230 = _2178 * _2148;
    float _2232 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2234 = fma(_1694, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2236 = -_2106;
    float _2238 = _2088 + _2236;
    float _2240 = log2(_2218);
    float _2242 = -_2232;
    float _2244 = fma(_2230, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2242);
    float _2246 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2248 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2250 = -_2226;
    float _2252 = fma(_2250, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2244);
    float _2254 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2246);
    float _2256 = floor(_2234);
    float _2258 = fma(_2252, -0.5, 0.5);
    float _2260 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2262 = fma(_2252, 0.5, 0.5);
    float _2264 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2254);
    float _2266 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2260);
    float _2268 = fma(_2262, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2270 = 1.0 / _2228;
    float _2272 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2264);
    float _2274 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2266);
    float _2276 = fma(_2262, _2268, -0.212114393711090087890625);
    float _2278 = _2240 * 0.693147182464599609375;
    float _2280 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2274);
    float _2282 = fma(_2262, _2276, 1.570728778839111328125);
    float _2284 = exp2(_2248);
    float _2286 = -_2256;
    float _2288 = _2234 + _2286;
    float _2290 = _2230 + 1.0;
    float _2292 = _2278 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2294 = sqrt(_2258);
    float _2296 = _2272 * _2270;
    float _2298 = _2280 * _2270;
    float _2300 = fma(_2296, 0.5, 0.5);
    float _2302 = fma(_2298, -0.5, 0.5);
    float _2304 = -_2230;
    float _2306 = fma(_2284, _2290, _2304);
    float2 _6750 = float2(_2238, _2288);
    float _2308 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6750, float2(0.0), isnan(_6750)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6750, float2(0.0), isnan(_6750)), level(0.0)).x;
    float3 _6761 = float3(_2300, _2302, _2292);
    float _2310 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6761, float3(0.0), isnan(_6761)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6761, float3(0.0), isnan(_6761)), level(0.0)).x;
    float _2312 = fma(_2306, 0.5, 0.5);
    float _2314 = _2294 * 0.636619746685028076171875;
    float _2316 = -_2282;
    float _2318 = fma(_2314, _2316, 1.0);
    float3 _6782 = float3(_2300, _2302, _2292);
    float4 _2321 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6782, float3(0.0), isnan(_6782)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6782, float3(0.0), isnan(_6782)), level(0.0)).xyzw;
    float _2323 = _2321.x;
    float _2325 = _2321.y;
    float _2327 = _2321.z;
    float _2329 = _2321.w;
    float2 _6798 = float2(_2318, _2312);
    float3 _2333 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6798, float2(0.0), isnan(_6798)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6798, float2(0.0), isnan(_6798)), level(0.0)).xyz;
    float _2335 = _2333.x;
    float _2337 = _2333.y;
    float _2339 = _2333.z;
    float _2341 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2343 = _1680 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2345 = _1810 != 0.0;
    bool _2347 = isnan(_1810);
    bool _2349 = _2345 || _2347;
    bool _2351 = isnan(0.0);
    bool _2353 = _2349 || _2351;
    float _2355 = _2184 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2357 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2341);
    float _2359 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2343);
    bool _2361 = _1808 == 0.0;
    bool _2363 = !_2353;
    bool _2365 = _2361 && _2363;
    float _2367 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2355);
    float _2369 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2357);
    float _2371 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2359);
    bool _2373 = _1812 == 0.0;
    bool _2375 = _2373 && _2365;
    float _2377 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2367);
    float _2379 = _2369 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2381 = _2371 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2383 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2377);
    float _2385 = 1.0 / _2379;
    float _2387 = _2381 + _2379;
    out.m_75.x = _1988;
    out.m_75.y = _1984;
    out.m_75.z = _1992;
    float _2389 = _2228 * 0.5;
    float _2391 = _2387 * _2385;
    float _2393 = _2391 * 0.5;
    float _2395 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2397 = fma(_2393, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2395);
    float _2399 = in.m_77.x;
    float _2401 = in.m_77.y;
    float _2403 = in.m_77.z;
    float _2405 = 1.0 / _2397;
    float _2407 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2409 = _2405 * _2407;
    float _2411 = abs(_2409);
    float _2413 = log2(_2411);
    float _2415 = _2401;
    float _2417 = _2399;
    float _2419 = _2403;
    float _2421 = _2228;
    float _2423 = _2383;
    float _2425 = _2280;
    if (!_2375)
    {
        float _2427 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2401);
        _2415 = _2427;
    }
    float _2429 = _2415;
    if (!_2375)
    {
        float _2431 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2399);
        _2417 = _2431;
    }
    float _2433 = _2417;
    if (!_2375)
    {
        float _2435 = fma(_1812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2403);
        _2419 = _2435;
    }
    float _2437 = _2419;
    bool _2439 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2441 = isnan(0.5);
    bool _2443 = _2439 || _2441;
    bool _2445 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2447 = _2443 || _2445;
    float _2449 = _1854 * _2429;
    float _2451 = _2383 + _2228;
    float _2453 = fma(_1832, _2433, _2449);
    float _2455 = _2451 * 0.5;
    float _2457 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (_2447)
    {
        _2038 = 1.0;
    }
    float _2459 = _2038;
    float _2461 = _2459;
    if (_2447)
    {
        _2040 = 1.0;
    }
    float _2463 = _2040;
    float _2465 = exp2(_2457);
    float _2467 = fma(_2465, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2469 = precise::clamp(_2467, 0.0, 1.0);
    float _2471 = fma(_2469, -2.0, 3.0);
    float _2473 = _2469 * _2469;
    float _2475 = _2473 * _2471;
    float _2477 = _1866 * _2429;
    float _2479 = _1850 * _2429;
    float _2481 = -_2475;
    float _2483 = _2481 + 1.0;
    float _2485 = fma(_1834, _2433, _2477);
    float _2487 = fma(_1836, _2433, _2479);
    float _2489 = in.m_79.x;
    float _2491 = fma(_1768, _2437, _2453);
    float _2493 = _2214 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2495 = fma(_1772, _2437, _2485);
    float _2497 = fma(_1770, _2437, _2487);
    float _2499 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2475);
    float _2501 = exp2(_2493);
    bool _2503 = _2409 <= 8000.0;
    bool _2505 = isnan(_2409);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan(8000.0);
    bool _2511 = _2507 || _2509;
    float _2513 = float(_2511);
    float _2515 = _2272 + _2228;
    float _2517 = _2513 * _2499;
    float _2519 = _2515 * 0.5;
    float _2521 = fma(_2280, -0.5, _2389);
    float _2523 = _2463;
    if (!_2447)
    {
        float _2525 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2527 = _2525 * 0.15915493667125701904296875;
        float _2529 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2531 = _2527 * 6.283185482025146484375;
        float _2533 = cos(_2531);
        float _2535 = _2529 * 0.15915493667125701904296875;
        float _2537 = _2527 * 6.283185482025146484375;
        float _2539 = sin(_2537);
        float _2541 = 1.0 / _2533;
        float _2543 = _2535 * 6.283185482025146484375;
        float _2545 = cos(_2543);
        float _2547 = _2539 * _2541;
        float _2549 = _2535 * 6.283185482025146484375;
        float _2551 = sin(_2549);
        float _2553 = _2545 * _2547;
        float _2555 = 1.0 / _2553;
        float _2557 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2559 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2557;
        float _2561 = 1.0 / _2559;
        float _2563 = _2551 * _2555;
        float _2565 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2567 = fma(_2409, _2563, _2565);
        float _2569 = _2567 * _2561;
        float _2571 = precise::clamp(_2569, 0.0, 1.0);
        _2523 = _2571;
    }
    float _2573 = _2523;
    if (!_2447)
    {
        float _2575 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2577 = _2575 * 0.15915493667125701904296875;
        float _2579 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2581 = _2577 * 6.283185482025146484375;
        float _2583 = cos(_2581);
        float _2585 = _2579 * 0.15915493667125701904296875;
        float _2587 = _2577 * 6.283185482025146484375;
        float _2589 = sin(_2587);
        float _2591 = 1.0 / _2583;
        float _2593 = _2585 * 6.283185482025146484375;
        float _2595 = cos(_2593);
        float _2597 = _2589 * _2591;
        float _2599 = _2585 * 6.283185482025146484375;
        float _2601 = sin(_2599);
        float _2603 = _2595 * _2597;
        float _2605 = 1.0 / _2603;
        float _2607 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2609 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2607;
        float _2611 = 1.0 / _2609;
        float _2613 = _2601 * _2605;
        float _2615 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2617 = fma(_2409, _2613, _2615);
        float _2619 = _2617 * _2611;
        float _2621 = precise::clamp(_2619, 0.0, 1.0);
        float _2623 = -_2621;
        float _2625 = _2623 + 1.0;
        _2461 = _2625;
    }
    float _2627 = _2461;
    float _2629 = -_2501;
    float _2631 = _2629 + 1.0;
    float _2633 = _2517 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2635 = -_2308;
    float _2637 = _2635 + 1.0;
    float _2639 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2519;
    out.m_81.y = _2521;
    out.m_81.z = _2455;
    out.m_81.w = _2228;
    float _2641 = _2637 * _2633;
    float _2643 = precise::clamp(_2641, 0.0, 1.0);
    bool _2645 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2647 = isnan(_2006);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2653 = _2649 || _2651;
    float _2655 = _2639 * _2310;
    float _2657 = -_2639;
    float _2659 = _2657 + 1.0;
    float _2661 = -_2643;
    float _2663 = fma(_2661, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_83.x = _2491;
    out.m_83.y = _2495;
    out.m_83.z = _2497;
    float _2665 = _2329 * _2655;
    float _2667 = _2663 * _2489;
    out.gl_Position.x = _2272;
    out.gl_Position.y = _2280;
    out.gl_Position.z = _2383;
    out.gl_Position.w = _2228;
    float _2669 = _2339 * _2655;
    float _2671 = fma(_2335, _2665, _2323);
    float _2673 = fma(_2337, _2665, _2325);
    float _2675 = _2667 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2677 = _2329 * _2659;
    float _2679 = fma(_2329, _2669, _2327);
    float _2681 = _2667;
    float _2683 = _2665;
    if (!_2653)
    {
        _2681 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2685 = _2681;
    out.m_85.x = _2675;
    float _2687 = _2685;
    float _2689 = _2685;
    if (!_2653)
    {
        _2683 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2691 = _2683;
    float _2693 = _2573 * _2627;
    float _2695 = _2693;
    float _2697 = _2691;
    float _2699 = _2691;
    if (!_2653)
    {
        _2421 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2701 = _2421;
    out.m_87.x = _2671;
    out.m_87.y = _2673;
    out.m_87.z = _2679;
    out.m_87.w = _2677;
    float _2703 = _2701;
    float _2705 = _2701;
    if (!_2653)
    {
        _2423 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2707 = _2423;
    float _2709 = _2693 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2711 = _2707;
    float _2713 = _2707;
    if (!_2653)
    {
        _2425 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2715 = _2425;
    float _2717 = _2715;
    float _2719 = _2715;
    if (!_2653)
    {
        _2695 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2721 = _2695;
    bool _2723 = !_2653;
    float _2725 = _2721;
    float _2727 = _2721;
    if (!_2723)
    {
        bool _2729 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2731 = isnan(_2006);
        bool _2733 = _2729 || _2731;
        bool _2735 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2737 = _2733 || _2735;
        if (!_2737)
        {
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2741 = _2006 + _2739;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2745 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2743;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2755 = 1.0 / _2745;
            float _2757 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2759 = _2757 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2761 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2763 = _2761 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2765 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2767 = _2765 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2769 = _2741 * _2755;
            float _2771 = precise::clamp(_2769, 0.0, 1.0);
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2775 = _2773 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2777 = fma(_2771, _2749, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2779 = fma(_2771, _2753, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2781 = fma(_2771, _2759, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2783 = fma(_2771, _2775, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2785 = fma(_2771, _2763, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2787 = fma(_2771, _2767, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2699 = _2781;
            _2719 = _2777;
            _2689 = _2779;
            _2713 = _2785;
            _2705 = _2783;
            _2727 = _2787;
            _2789 = true;
        }
        else
        {
            bool _2791 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2793 = isnan(_2006);
            bool _2795 = _2791 || _2793;
            bool _2797 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2799 = _2795 || _2797;
            if (!_2799)
            {
                _2687 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2801 = _2687;
            _2689 = _2801;
            if (!_2799)
            {
                _2697 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2803 = _2697;
            _2699 = _2803;
            if (!_2799)
            {
                _2703 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2805 = _2703;
            _2705 = _2805;
            if (!_2799)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2807 = _2711;
            _2713 = _2807;
            if (!_2799)
            {
                _2717 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2809 = _2717;
            _2719 = _2809;
            if (!_2799)
            {
                _2725 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2811 = _2725;
            bool _2813 = !_2799;
            _2727 = _2811;
            if (!_2813)
            {
                bool _2815 = _2006 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2817 = isnan(_2006);
                bool _2819 = _2815 || _2817;
                bool _2821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2823 = _2819 || _2821;
                if (!_2823)
                {
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2827 = _2006 + _2825;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2831 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2829;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2841 = 1.0 / _2831;
                    float _2843 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2845 = _2843 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2847 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2849 = _2847 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2851 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2853 = _2851 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2855 = _2827 * _2841;
                    float _2857 = precise::clamp(_2855, 0.0, 1.0);
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2861 = _2859 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2863 = fma(_2857, _2835, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2865 = fma(_2857, _2839, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2867 = fma(_2857, _2845, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2869 = fma(_2857, _2861, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2871 = fma(_2857, _2849, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2873 = fma(_2857, _2853, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2699 = _2867;
                    _2719 = _2863;
                    _2689 = _2865;
                    _2713 = _2871;
                    _2705 = _2869;
                    _2727 = _2873;
                    _2789 = true;
                }
                else
                {
                    _2699 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2719 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2689 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2705 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2727 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2789 = false;
    float _2875 = _2699;
    float _2877 = _2719;
    float _2879 = _2689;
    float _2881 = _2713;
    float _2883 = _2705;
    float _2885 = _2727;
    float _2887 = fma(_2495, -0.5, 0.5);
    float _2889 = precise::clamp(_2887, 0.0, 1.0);
    float _2891 = -_2875;
    float _2893 = _2891 + _2877;
    float _2895 = -_2879;
    float _2897 = _2895 + _2881;
    out.m_89.x = 0.0;
    float _2899 = -_2883;
    float _2901 = _2899 + _2885;
    float _2903 = fma(_2889, _2893, _2875);
    float _2905 = fma(_2889, _2897, _2879);
    bool _2907 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2909 = _2903 * 0.586610972881317138671875;
    float _2911 = fma(_2889, _2901, _2883);
    float _2913 = _2709 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2915 = fma(_2905, 0.298911988735198974609375, _2909);
    bool _2917 = _2573 > 0.0;
    bool _2919 = isnan(_2573);
    bool _2921 = _2917 || _2919;
    bool _2923 = isnan(0.0);
    bool _2925 = _2921 || _2923;
    float _2927 = fma(_2911, 0.114477999508380889892578125, _2915);
    out.m_49.x = _2913;
    bool _2929 = _2627 <= 0.0;
    bool _2931 = !_2925;
    bool _2933 = _2929 || _2931;
    float _2935 = -_2927;
    float _2937 = _2905 + _2935;
    float _2939 = -_2927;
    float _2941 = _2911 + _2939;
    float _2943 = fma(_2937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2927);
    float _2945 = -_2927;
    float _2947 = _2903 + _2945;
    float _2949 = fma(_2947, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2927);
    float _2951 = fma(_2941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2927);
    bool _2953 = !_2907;
    if (!_2953)
    {
        float _2955 = -_1972;
        float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2959 = -_1976;
        float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2963 = -_1980;
        float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2967 = _2957 * _2957;
        float _2969 = fma(_2961, _2961, _2967);
        float _2971 = fma(_2965, _2965, _2969);
        float _2973 = sqrt(_2971);
        float _2975 = rsqrt(_2971);
        float _2977 = -_2973;
        float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2981 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2983 = precise::clamp(_2981, 0.0, 1.0);
        float _2985 = _2961 * _2975;
        float _2987 = _2957 * _2975;
        float _2989 = abs(_2983);
        float _2991 = log2(_2989);
        float _2993 = _2965 * _2975;
        float _2995 = _2985 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2997 = _2495 * _2987;
        float _2999 = -_2987;
        float _3001 = -_2995;
        float _3003 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3001);
        float _3005 = fma(_2491, _2985, _2997);
        float _3007 = -_2993;
        float _3009 = fma(_3007, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3003);
        float _3011 = fma(_2497, _2993, _3005);
        float _3013 = precise::clamp(_3011, 0.0, 1.0);
        float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3017 = _3009 + _3015;
        float _3019 = _2991 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3021 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3023 = precise::clamp(_3021, 0.0, 1.0);
        float _3025 = exp2(_3019);
        float _3027 = _3025 * _3023;
        float _3029 = _3013 * _3027;
        float _3031 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3033 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3035 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3031;
        out.m_89.y = _3033;
        out.m_89.z = _3035;
    }
    out.m_91.x = _2943;
    out.m_91.y = _2949;
    out.m_91.z = _2951;
    if (!_2933)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3037 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3037;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

