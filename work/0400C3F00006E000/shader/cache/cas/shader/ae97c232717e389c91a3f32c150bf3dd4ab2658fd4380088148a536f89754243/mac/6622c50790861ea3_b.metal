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
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_55 [[user(locn5)]];
    float4 m_59 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_102 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 m_100 [[user(locn13)]];
    float4 m_98 [[user(locn14)]];
    float4 m_94 [[user(locn15)]];
    float4 m_96 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_86 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_68 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3241 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_48.w;
    float _118 = in.m_50.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = as_type<float>(_123);
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_55.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3552 = as_type<float>(_145);
        out.gl_Position.z = _3552;
    }
    if (!_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = in.m_57.x;
    float _161 = float(_123);
    bool _163 = _127 >= _161;
    bool _165 = !_157;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _135;
    if (_167)
    {
        out.m_55.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _147 = as_type<int>(_173);
    }
    int _175 = _147;
    float _177 = _127 * _169;
    out.m_59.x = _159;
    float _179 = _177;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3617 = as_type<float>(_175);
        out.gl_Position.z = _3617;
    }
    out.m_53.x = _177;
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _217;
    if (!_201)
    {
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        _217 = _177;
    }
    _219 = false;
    float _221 = _217;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = _221 + _227;
    bool _231 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _233 = isnan(_221);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    float _255 = -_241;
    float _257 = _255 + 1.0;
    float _259 = 1.0 / _245;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _249;
    float _265 = 1.0 / _253;
    float _267 = _225 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _221 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    float _277 = fma(_275, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = _271 * _263;
    bool _281 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_221);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = _291 * _257;
    bool _299 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_221);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _229 * _265;
    bool _313 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_221);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_291;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_295, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = -_323;
    float _341 = _339 + 1.0;
    float _343 = _323 * _327;
    float _345 = fma(_331, _279, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = _309 * _341;
    float _349 = in.m_64.x;
    float _351 = in.m_64.y;
    float _353 = -_309;
    float _355 = _353 + 1.0;
    float _357 = fma(_337, _279, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = _277 * _347;
    float _361 = _333 * _347;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _367;
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _373 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _361);
    float _375 = fma(_365, _311, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _377 = fma(_369, _311, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _379 = fma(_357, _343, _371);
    float _381 = fma(_345, _343, _373);
    float _383 = fma(_375, _297, _379);
    float _385 = fma(_377, _297, _381);
    float _387 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].x, _383);
    float _389 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].y, _385);
    float _391 = _387 * _349;
    float _393 = _389 * _351;
    bool _395 = !_261;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _399 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _179 = _409;
    }
    float _411 = _179;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _415 = int(_413);
    float _417 = in.m_57.z;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _425 = int(_423);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _429 = float(_415);
    float _431 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _433 = int(_431);
    float _435 = float(_425);
    float _437 = 1.0 / _429;
    float _439 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _441 = int(_439);
    float _443 = float(uint(_433));
    float _445 = 1.0 / _435;
    float _447 = _437 * _127;
    float _449 = float(uint(_441));
    float _451 = 1.0 / _443;
    int _453 = ~_441;
    int _455 = _453 + 1;
    int _457 = ~_441;
    int _459 = _457 + 1;
    float _461 = _445 * _127;
    float _463 = trunc(_447);
    int _465 = int(_463);
    float _467 = 1.0 / _449;
    int _469 = as_type<int>(_451) + (-2);
    float _471 = trunc(_461);
    int _473 = int(_471);
    float _475 = float(uint(_465));
    float _477 = as_type<float>(_469) * _475;
    float _479 = _475;
    if (_421)
    {
        _479 = 1.0;
    }
    float _481 = _479;
    float _483 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _485 = log2(_483);
    int _487 = as_type<int>(_467) + (-2);
    float _489 = _481;
    if (!_421)
    {
        _489 = 7.345489978790283203125;
    }
    float _491 = _489;
    float _493 = float(uint(_473));
    float _495 = trunc(_477);
    float _497 = precise::max(_495, 0.0);
    uint _500 = uint(_497);
    float _502 = _491 * _159;
    float _504 = as_type<float>(_487) * _493;
    int _506 = ~_433;
    int _508 = _506 + 1;
    float _510 = trunc(_504);
    float _512 = precise::max(_510, 0.0);
    uint _514 = uint(_512);
    int _516 = _508 * int(_500);
    int _518 = _516 + _465;
    float _520 = floor(_502);
    float _522 = float(uint(_518));
    float _524 = as_type<float>(_518);
    float _526 = _522;
    if (_421)
    {
        _524 = 1.0;
    }
    float _528 = _524;
    int _530 = _455 * int(_514);
    int _532 = _530 + _473;
    float _534 = _528;
    if (!_421)
    {
        _534 = 5.839270114898681640625;
    }
    float _536 = _534;
    float _538 = as_type<float>(_469) * _522;
    if (_421)
    {
        _526 = _159;
    }
    float _540 = _526;
    float _542 = float(uint(_532));
    float _544 = trunc(_538);
    float _546 = precise::max(_544, 0.0);
    uint _548 = uint(_546);
    float _550 = _540;
    if (!_421)
    {
        _550 = _417;
    }
    float _552 = _550;
    float _554 = -_520;
    float _556 = _502 + _554;
    float _558 = as_type<float>(_487) * _542;
    float _560 = _536 * _552;
    float _562 = float(_433);
    float _564 = float(_465);
    float _566 = trunc(_558);
    float _568 = precise::max(_566, 0.0);
    uint _570 = uint(_568);
    float _572 = _556 * _562;
    bool _574 = _564 >= _562;
    bool _576 = isnan(_564);
    bool _578 = _574 || _576;
    bool _580 = isnan(_562);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = float(_473);
    int _588 = int(_500) + int(_548);
    float _590 = floor(_560);
    int _592 = ~_433;
    int _594 = _592 + 1;
    int _596 = ~_441;
    int _598 = _596 + 1;
    int _600 = _594 * _588;
    int _602 = _600 + _465;
    int _604 = int(_514) + int(_570);
    bool _606 = uint(_602) >= uint(_433);
    float _608 = _169 * _127;
    int _610 = _598 * _604;
    int _612 = _610 + _473;
    float _614 = float(_441);
    float _616 = -_590;
    float _618 = _560 + _616;
    float _620 = trunc(_584);
    int _622 = int(_620);
    bool _624 = uint(_612) >= uint(_441);
    bool _626 = _586 >= _614;
    bool _628 = isnan(_586);
    bool _630 = _626 || _628;
    bool _632 = isnan(_614);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _562 * _608;
    bool _640 = !_606;
    int _642 = _640 ? 0 : (-1);
    float _644 = _614 * _608;
    bool _646 = !_624;
    int _648 = _646 ? 0 : (-1);
    float _650 = trunc(_636);
    int _652 = int(_650);
    int _654 = ~_588;
    int _656 = _654 + _642;
    int _658 = _656 + 1;
    float _660 = _618 * _614;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _664 = _662 != 0;
    int _666 = ~_604;
    int _668 = _666 + _648;
    int _670 = _668 + 1;
    int _672 = _433 * _658;
    int _674 = _672 + _465;
    bool _676 = _433 == 0;
    float _678 = trunc(_572);
    int _680 = int(_678);
    bool _682 = !_664;
    int _684 = _682 ? 0 : 1;
    int _686 = _441 * _670;
    int _688 = _686 + _473;
    int _690 = ~_622;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    int _696 = abs(_684);
    bool _698 = !_676;
    int _700 = _698 ? _674 : (-1);
    float _702 = trunc(_638);
    int _704 = int(_702);
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _712 = _710 != 0;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _716 = _714 != 0;
    bool _718 = _441 == 0;
    int _720 = _700 * _694;
    int _722 = _433 + (-1);
    int _724 = ~_652;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    int _730 = _680 * _696;
    int _732 = _730 + _465;
    bool _734 = !_718;
    int _736 = _734 ? _688 : (-1);
    int _738 = _622 * _722;
    int _740 = _738 + _720;
    bool _742 = !_712;
    int _744 = _742 ? 0 : 1;
    float _746 = trunc(_644);
    int _748 = int(_746);
    int _750 = _441 + (-1);
    int _752 = _736 * _728;
    int _754 = abs(_744);
    bool _756 = !_708;
    int _758 = _756 ? 0 : 1;
    int _760 = _652 * _750;
    int _762 = _760 + _752;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _766 = _764 != 0;
    int _768 = _740 * _754;
    bool _770 = !_716;
    int _772 = _770 ? 0 : 1;
    int _774 = abs(_758);
    bool _776 = !_766;
    int _778 = _776 ? 0 : 1;
    int _780 = abs(_772);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _792 = _790 != 0;
    float _794 = trunc(_660);
    int _796 = int(_794);
    int _798 = abs(_778);
    int _800 = _704 * _774;
    int _802 = _800 + _768;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _806 = _804 != 0;
    bool _808 = !_788;
    int _810 = _808 ? 0 : 1;
    int _812 = _732 * _780;
    int _814 = _812 + _802;
    bool _816 = !_806;
    int _818 = _816 ? 0 : 1;
    float _820 = in.m_66.x;
    float _822 = in.m_66.y;
    float _824 = in.m_66.z;
    float _826 = in.m_66.w;
    int _828 = abs(_810);
    int _830 = _680 * _798;
    int _832 = _830 + _814;
    int _834 = abs(_818);
    bool _836 = !_784;
    int _838 = _836 ? 0 : 1;
    int _840 = _796 * _834;
    int _842 = _840 + _473;
    bool _844 = !_792;
    int _846 = _844 ? 0 : 1;
    int _848 = _762 * _828;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _852 = _850 != 0;
    int _854 = abs(_838);
    int _856 = abs(_846);
    float _858 = float(uint(_832));
    int _860 = _748 * _854;
    int _862 = _860 + _848;
    bool _864 = !_852;
    int _866 = _864 ? 0 : 1;
    float _868 = as_type<float>(_469) * _858;
    int _870 = abs(_866);
    int _872 = ~_441;
    int _874 = _872 + 1;
    int _876 = _842 * _856;
    int _878 = _876 + _862;
    int _880 = ~_433;
    int _882 = _880 + 1;
    float _884 = trunc(_868);
    float _886 = precise::max(_884, 0.0);
    uint _888 = uint(_886);
    int _890 = ~_441;
    int _892 = _890 + 1;
    int _894 = _796 * _870;
    int _896 = _894 + _878;
    float _898 = float(uint(_896));
    float _900 = as_type<float>(_487) * _898;
    int _902 = _882 * int(_888);
    int _904 = _902 + _832;
    float _906 = trunc(_900);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    float _912 = float(uint(_904));
    float _914 = as_type<float>(_469) * _912;
    float _916 = trunc(_914);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    int _922 = _874 * int(_910);
    int _924 = _922 + _896;
    float _926 = float(uint(_924));
    int _928 = ~_433;
    int _930 = _928 + 1;
    float _932 = float(uint(_732));
    float _934 = as_type<float>(_487) * _926;
    int _936 = int(_888) + int(_920);
    float _938 = as_type<float>(_469) * _932;
    float _940 = trunc(_934);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    int _946 = _930 * _936;
    int _948 = _946 + _832;
    bool _950 = uint(_948) >= uint(_433);
    float _952 = trunc(_938);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    bool _958 = !_950;
    int _960 = _958 ? 0 : (-1);
    int _962 = ~_936;
    int _964 = _962 + _960;
    int _966 = _964 + 1;
    int _968 = int(_910) + int(_944);
    int _970 = _433 * _966;
    int _972 = _970 + _832;
    int _974 = _892 * _968;
    int _976 = _974 + _896;
    bool _978 = !_676;
    int _980 = _978 ? _972 : (-1);
    bool _982 = uint(_976) >= uint(_441);
    int _984 = _980 & 3;
    bool _986 = _984 != 0;
    float _988 = in.m_68.x;
    float _990 = in.m_68.y;
    float _992 = in.m_68.z;
    float _994 = in.m_68.w;
    bool _996 = !_982;
    int _998 = _996 ? 0 : (-1);
    bool _1000 = uint(_984) > 1u;
    int _1002 = ~_968;
    int _1004 = _1002 + _998;
    int _1006 = _1004 + 1;
    int _1008 = _980 & 3;
    bool _1010 = _1008 != 0;
    int _1012 = _441 * _1006;
    int _1014 = _1012 + _896;
    int _1016 = _1010 ? 0 : 1;
    float _1018 = in.m_70.x;
    float _1020 = in.m_70.y;
    float _1022 = in.m_70.z;
    float _1024 = in.m_70.w;
    bool _1026 = uint(_984) >= 2u;
    bool _1028 = !_718;
    int _1030 = _1028 ? _1014 : (-1);
    int _1032 = ~_1016;
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    int _1038 = _1036;
    if (!_1000)
    {
        int _1040 = ~_1016;
        int _1042 = _1040 + 1;
        _1038 = _1042;
    }
    int _1044 = _1038;
    int _1046 = _1030 & 3;
    bool _1048 = _1046 != 0;
    float _1050 = in.m_48.x;
    float _1052 = in.m_48.y;
    float _1054 = in.m_48.z;
    int _1056 = _1030 & 3;
    bool _1058 = _1056 != 0;
    int _1060 = _1026 ? 0 : 1;
    bool _1062 = uint(_1046) > 1u;
    int _1064 = _1058 ? 0 : 1;
    bool _1066 = uint(_1046) >= 2u;
    bool _1068 = _984 != 3;
    int _1070 = _1066 ? 0 : 1;
    bool _1072 = _1046 != 3;
    int _1074 = ~_1064;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    int _1080 = ~_1060;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1078;
    int _1088 = _1084;
    if (!_1062)
    {
        int _1090 = ~_1064;
        int _1092 = _1090 + 1;
        _1086 = _1092;
    }
    int _1094 = _1086;
    float _1096 = in.m_57.y;
    if (_1068)
    {
        int _1098 = ~_1060;
        int _1100 = _1098 + 1;
        _1088 = _1100;
    }
    int _1102 = _1088;
    float _1104 = _1052 * _990;
    int _1106 = ~_433;
    int _1108 = _1106 + 1;
    float _1110 = _1052 * _1020;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1114 = _1112 != 0;
    float _1116 = _1052 * _822;
    bool _1118 = _159 > 0.5;
    int _1120 = _1108 * int(_956);
    int _1122 = _1120 + _732;
    int _1124 = ~_1070;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    float _1130 = fma(_1050, _988, _1104);
    int _1132 = _1128;
    if (_1072)
    {
        int _1134 = ~_1070;
        int _1136 = _1134 + 1;
        _1132 = _1136;
    }
    int _1138 = _1132;
    float _1140 = fma(_1050, _820, _1116);
    bool _1142 = !_1114;
    int _1144 = _1142 ? 0 : 1;
    float _1146 = -_195;
    int _1148 = _1118 ? as_type<int>(_1146) : as_type<int>(_195);
    float _1150 = fma(_1054, _824, _1140);
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1158 = _1156 != 0;
    float _1160 = _1150 + _826;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1164 = _1162 != 0;
    float _1166 = _485 * _127;
    float _1168 = float(uint(_1122));
    float _1170 = fma(_1050, _1018, _1110);
    float _1172 = float(uint(_842));
    float _1174 = exp2(_1166);
    bool _1176 = !_1158;
    float _1178 = _1176 ? _195 : as_type<float>(_1148);
    float _1180 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1182 = as_type<float>(_469) * _1168;
    float _1184 = as_type<float>(_487) * _1172;
    bool _1186 = _1096 > 0.5;
    float _1188 = -_427;
    float _1190 = fma(_1180, 2.0, _1188);
    float _1192 = trunc(_1182);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    float _1198 = -_199;
    int _1200 = _1186 ? as_type<int>(_1198) : as_type<int>(_199);
    float _1202 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1204 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1206 = isnan(0.0);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1212 = _1208 || _1210;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1216 = -_127;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1190);
    float _1220 = trunc(_1184);
    float _1222 = precise::max(_1220, 0.0);
    uint _1224 = uint(_1222);
    float _1226 = -_1174;
    float _1228 = _1226 + 1.0;
    float _1230 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1214);
    int _1232 = ~_433;
    int _1234 = _1232 + 1;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1238 = !_1164;
    float _1240 = _1238 ? _199 : as_type<float>(_1200);
    float _1242 = fma(_1054, _992, _1130);
    float _1244 = _1212 ? _1228 : 0.0;
    float _1246 = fma(_1202, -2.0, _1236);
    bool _1248 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1250 = isnan(1.0);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1256 = _1252 || _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1260 = 1.0 + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1266 = int(_956) + int(_1196);
    float _1268 = _159 * 2.0;
    int _1270 = _459 * int(_1224);
    int _1272 = _1270 + _842;
    float _1274 = 1.0 / _1260;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1282 = float(uint(_1272));
    float _1284 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1276);
    float _1286 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1230);
    float _1288 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1246);
    float _1290 = floor(_1268);
    float _1292 = as_type<float>(_487) * _1282;
    float _1294 = _1096 * 2.0;
    int _1296 = _1234 * _1266;
    int _1298 = _1296 + _732;
    float _1300 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1284);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1306 = floor(_1294);
    if (_1256)
    {
        float _1308 = _1244 * _1274;
        _137 = _1308;
    }
    float _1310 = _137;
    bool _1312 = uint(_1298) >= uint(_433);
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1318 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = trunc(_1292);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1332 = _1290 >= 0.0;
    bool _1334 = isnan(_1290);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = _1178 + 0.5;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1346 = 1.0 / _1280;
    bool _1348 = !_986;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = -_1286;
    float _1354 = _1352 + 1.0;
    bool _1356 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1358 = isnan(_411);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    int _1368 = abs(_1094);
    int _1370 = abs(_1102);
    float _1372 = 1.0 / _1330;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1376 = !_1312;
    int _1378 = _1376 ? 0 : (-1);
    float _1380 = -_1366;
    float _1382 = _1380 + 1.0;
    bool _1384 = _1290 > 0.0;
    float _1386 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = fma(_1054, _1022, _1170);
    int _1390 = _1340 ? 0 : 1;
    float _1392 = 1.0 / _1264;
    bool _1394 = _1306 >= 0.0;
    bool _1396 = isnan(_1306);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    out.m_72.x = _1318;
    out.m_72.y = _1386;
    out.m_72.z = _1326;
    out.m_72.w = _1344;
    int _1404 = int(_1224) + int(_1324);
    float _1406 = _417 * 2.0;
    int _1408 = abs(_1138);
    float _1410 = 1.0 / _1304;
    int _1412 = ~_441;
    int _1414 = _1412 + 1;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1416;
    int _1420 = _1402 ? 0 : 1;
    float _1422 = floor(_1406);
    bool _1424 = _1306 > 0.0;
    int _1426 = _1414 * _1404;
    int _1428 = _1426 + _842;
    float _1430 = _1418 * _1346;
    int _1432 = ~_1390;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1442 = _1436;
    if (!_1384)
    {
        int _1444 = ~_1390;
        int _1446 = _1444 + 1;
        _1442 = _1446;
    }
    int _1448 = _1442;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1454 = uint(_1428) >= uint(_441);
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1456;
    float _1460 = _1440 * _1372;
    float _1462 = _159 + _1096;
    int _1464 = ~_1420;
    int _1466 = _1464 + 1;
    int _1468 = _1466 + 1;
    float _1470 = _1458 * _1392;
    int _1472 = _1468;
    if (!_1424)
    {
        int _1474 = ~_1420;
        int _1476 = _1474 + 1;
        _1472 = _1476;
    }
    int _1478 = _1472;
    float _1480 = _1462 + (-1.0);
    bool _1482 = !_1454;
    int _1484 = _1482 ? 0 : (-1);
    float _1486 = _1452 * _1410;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1498 = _1496 != 0;
    bool _1500 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1502 = isnan(_411);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1516 = _411 + _1514;
    bool _1518 = !_1490;
    int _1520 = _1518 ? 0 : 1;
    bool _1522 = _1422 >= 0.0;
    bool _1524 = isnan(_1422);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan(0.0);
    bool _1530 = _1526 || _1528;
    float _1532 = fma(_1430, _1516, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1534 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1536 = isnan(_411);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1548 = _411 + _1546;
    int _1550 = _1530 ? 0 : 1;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1554 = _411 + _1552;
    bool _1556 = _1422 > 0.0;
    float _1558 = -_1544;
    float _1560 = _1558 + 1.0;
    float _1562 = -_1510;
    float _1564 = _1562 + 1.0;
    float _1566 = fma(_1470, _1548, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1568 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1570 = isnan(_411);
    bool _1572 = _1568 || _1570;
    bool _1574 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1576 = _1572 || _1574;
    float _1578 = float(_1576);
    float _1580 = _1510 * _1560;
    float _1582 = fma(_1460, _1554, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1584 = _1366 * _1564;
    bool _1586 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1588 = isnan(_411);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1594 = _1590 || _1592;
    float _1596 = float(_1594);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1600 = _411 + _1598;
    float _1602 = _1578 * _1382;
    float _1604 = -_1578;
    float _1606 = _1604 + 1.0;
    float _1608 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1218);
    float _1610 = fma(_1486, _1600, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1612 = _1388 + _1024;
    float _1614 = _1596 * _1606;
    float _1616 = _1240 + (-0.5);
    float _1618 = -_1596;
    float _1620 = _1618 + 1.0;
    float _1622 = _1242 + _994;
    float _1624 = _1532 * _1614;
    float _1626 = -_1616;
    float _1628 = -_1288;
    float _1630 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1628);
    float _1632 = -_1300;
    float _1634 = _1632 + 1.0;
    float _1636 = -_1354;
    float _1638 = fma(_1178, _1636, _1608);
    float _1640 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1624);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _1622 + _1642;
    float _1646 = fma(_1240, _1634, _1630);
    float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1650 = _1612 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1654 = _1160 + _1652;
    float _1656 = _1644 * _1644;
    float _1658 = fma(_1582, _1602, _1640);
    int _1660 = _980 >> 31;
    out.m_74.x = _1638;
    out.m_74.y = _1646;
    float _1662 = fma(_1650, _1650, _1656);
    float _1664 = fma(_1566, _1584, _1658);
    bool _1666 = !_1048;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = fma(_1654, _1654, _1662);
    bool _1672 = _984 != 3;
    float _1674 = fma(_1610, _1580, _1664);
    int _1676 = _1030 >> 31;
    float _1678 = rsqrt(_1670);
    int _1680 = _1660 & 3;
    bool _1682 = !_1672;
    int _1684 = _1682 ? 0 : (-1);
    bool _1686 = _1046 != 3;
    float _1688 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1690 = _1676 & 3;
    float _1692 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1694 = _980 + _1680;
    int _1696 = _1030 + _1690;
    float _1698 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1700 = _1694 >> 2;
    float _1702 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1692);
    int _1704 = _1696 >> 2;
    float _1706 = _1698 * _1678;
    int _1708 = _1700 << 4;
    int _1710 = _1708 + 368;
    float _1712 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1702);
    int _1714 = _1704 << 4;
    int _1716 = _1714 + 656;
    float _1718 = _1644 * _1706;
    uint _1720 = uint(int(uint(_1710) >> uint(2)));
    uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
    int _1724 = int(_1720) & 3;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[int(_1722)][_1724];
    int _1728 = int(_1720) + 1;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    int _1732 = _1728 & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    float _1736 = _1650 * _1706;
    bool _1738 = !_1686;
    int _1740 = _1738 ? 0 : (-1);
    float _1742 = -_1718;
    float _1744 = _1644 + _1742;
    bool _1746 = _1712 >= 0.0;
    float _1748 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1674);
    float _1750 = -_1736;
    float _1752 = _1650 + _1750;
    float _1754 = _1744 * _1744;
    uint _1756 = uint(int(uint(_1716) >> uint(2)));
    uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
    int _1760 = int(_1756) & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    int _1764 = int(_1756) + 1;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    int _1768 = _1764 & 3;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[int(_1766)][_1768];
    float _1772 = _1748 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1774 = fma(_1752, _1752, _1754);
    int _1776 = abs(_1520);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1780 = ~_1550;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = _1710 + 8;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1806 = _1784;
    float _1808 = _1612;
    float _1810 = _1622;
    if (!_1556)
    {
        int _1812 = ~_1550;
        int _1814 = _1812 + 1;
        _1806 = _1814;
    }
    int _1816 = _1806;
    float _1818 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = float(_1816);
    float _1824 = _1654 * _1706;
    int _1826 = _1716 + 8;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    float _1844 = float(_1776);
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1848 = ~_1266;
    int _1850 = _1848 + _1378;
    int _1852 = _1850 + 1;
    float _1854 = -_1824;
    float _1856 = _1654 + _1854;
    int _1858 = abs(_1668);
    float _1860 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1862 = abs(_1684);
    int _1864 = _433 * _1852;
    int _1866 = _1864 + _732;
    int _1868 = abs(_1044);
    float _1870 = fma(_1856, _1856, _1774);
    out.m_76.x = _1860;
    out.m_76.y = _1818;
    out.m_76.z = _1820;
    out.m_76.w = _1772;
    int _1872 = abs(_1350);
    float _1874 = _1844 * _1822;
    int _1876 = ~_1404;
    int _1878 = _1876 + _1484;
    int _1880 = _1878 + 1;
    if (_1746)
    {
        out.m_55.x = 0.0;
    }
    float _1882 = sqrt(_1870);
    bool _1884 = !_676;
    int _1886 = _1884 ? _1866 : (-1);
    int _1888 = _441 * _1880;
    int _1890 = _1888 + _842;
    bool _1892 = !_718;
    float _1894 = _1892 ? as_type<float>(_1890) : as_type<float>(0xffffffffu /* nan */);
    int _1896 = ~_1868;
    int _1898 = _1896 + 1;
    int _1900 = _1898 + 1;
    int _1902 = ~_1872;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1900 * as_type<int>(_1734);
    int _1910 = ~_1368;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = _1678 * _1882;
    int _1918 = _1906 * as_type<int>(_1726);
    int _1920 = _1918 + _1908;
    int _1922 = ~_1858;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    int _1928 = _1914 * as_type<int>(_1770);
    int _1930 = ~_1370;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    float _1936 = _1688 * _1916;
    int _1938 = _1926 * as_type<int>(_1762);
    int _1940 = _1938 + _1928;
    int _1942 = abs(_1740);
    int _1944 = _1934 * as_type<int>(_1794);
    int _1946 = _1944 + _1920;
    float _1948 = in.m_78.x;
    float _1950 = in.m_78.y;
    float _1952 = in.m_78.z;
    int _1954 = ~_1408;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    bool _1960 = !_1154;
    int _1962 = _1960 ? 0 : 1;
    out.m_80.x = _1936;
    int _1964 = ~_1862;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = _1958 * as_type<int>(_1834);
    int _1972 = _1970 + _1940;
    int _1974 = ~_1942;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = abs(_1144);
    int _1982 = _1968 * as_type<int>(_1802);
    int _1984 = _1982 + _1946;
    int _1986 = abs(_1962);
    int _1988 = _1978 * as_type<int>(_1842);
    int _1990 = _1988 + _1972;
    int _1992 = ~_1980;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    int _1998 = ~_1986;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    float _2004 = as_type<float>(_1968);
    float _2006 = _1894;
    if (_1746)
    {
        _2004 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2008 = _2004;
    int _2010 = _1984 * _1996;
    float _2012 = _159 + (-0.5);
    int _2014 = _1990 * _2002;
    float _2016 = _1874 * (-2.0);
    int _2018 = _1886 * _1980;
    int _2020 = _2018 + _2010;
    int _2022 = as_type<int>(_2008);
    if (_1746)
    {
        float _2024 = _2008 * 5.0;
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    int _2028 = as_type<int>(_1894) * _1986;
    int _2030 = _2028 + _2014;
    float _2032 = fma(_2016, _1948, _1948);
    float _2034 = fma(_1512, _2016, _1512);
    float _2036 = float(_2020);
    float _2038 = _1952;
    if (_1746)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6297 = as_type<float>(_2026);
        out.gl_Position.z = _6297;
    }
    float _2040 = float(_2030);
    float _2042 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2032);
    float _2044 = _1096 + _417;
    bool _2046 = !_1494;
    int _2048 = _2046 ? 0 : 1;
    out.m_82.x = _2036;
    float _2050 = _2044 + (-1.0);
    float _2052 = float(_1448);
    out.m_82.z = _2040;
    int _2054 = abs(_2048);
    bool _2056 = !_1498;
    int _2058 = _2056 ? 0 : 1;
    if (_1746)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2060 = -_1718;
    float _2062 = _1622 + _2060;
    float _2064 = -_1736;
    float _2066 = _1612 + _2064;
    float _2068 = float(_2054);
    float _2070 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2074 = _2062 + _2072;
    int _2076 = abs(_2058);
    float _2078 = -_1824;
    float _2080 = _1160 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2084 = _2066 + _2082;
    float _2086 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2088 = float(_1478);
    float _2090 = _2068 * _2052;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2094 = _2080 + _2092;
    float _2096 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2086);
    float _2098 = _1096 + (-0.5);
    float _2100 = _2090 * (-2.0);
    float _2102 = float(_2076);
    float _2104 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2096);
    float _2106 = fma(_2034, _1310, _2042);
    float _2108 = fma(_2100, _1950, _1950);
    float _2110 = fma(_2070, _2100, _2070);
    float _2112 = _2102 * _2088;
    bool _2114 = _2104 >= 0.0;
    float _2116 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2108);
    float _2118 = _159 + _417;
    float _2120 = _2112 * (-2.0);
    float _2122 = fma(_2110, _1310, _2116);
    float _2124 = _2106 * 0.15915493667125701904296875;
    float _2126 = _2118 + (-1.0);
    float _2128 = fma(_2120, _1952, _1952);
    float _2130 = _2122 * 0.15915493667125701904296875;
    float _2132 = _417 + (-0.5);
    float _2134 = _2124 * 6.283185482025146484375;
    float _2136 = sin(_2134);
    float _2138 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2140 = _2074;
    if (_2114)
    {
        _2038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2142 = _2038;
    float _2144 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2128);
    int _2146 = as_type<int>(_2142);
    if (_2114)
    {
        out.m_55.x = 0.0;
    }
    float _2148 = fma(_2138, _2120, _2138);
    if (_2114)
    {
        float _2150 = _2142 * 5.0;
        _2146 = as_type<int>(_2150);
    }
    int _2152 = _2146;
    float _2154 = _2124 * 6.283185482025146484375;
    float _2156 = cos(_2154);
    float _2158 = fma(_2148, _1310, _2144);
    if (_2114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6498 = as_type<float>(_2152);
        out.gl_Position.z = _6498;
    }
    float _2160 = _2158 * 0.15915493667125701904296875;
    float _2162 = _2130 * 6.283185482025146484375;
    float _2164 = sin(_2162);
    float _2166 = _2130 * 6.283185482025146484375;
    float _2168 = cos(_2166);
    if (_2114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2170 = _2160 * 6.283185482025146484375;
    float _2172 = cos(_2170);
    float _2174 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _2178 = _2136 * _2164;
    float _2180 = _2156 * _2168;
    float _2182 = _2174 * _1916;
    float _2184 = _2156 * _2164;
    float _2186 = _2136 * _2168;
    float _2188 = _2160 * 6.283185482025146484375;
    float _2190 = sin(_2188);
    float _2192 = _2182 * _2176;
    float _2194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    bool _2196 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2198 = isnan(0.5);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2204 = _2200 || _2202;
    float _2206 = _1936 * _2194;
    float _2208 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2210 = _2208 * 0.5;
    float _2212 = _2156 * _2172;
    float _2214 = _2168 * _2172;
    float _2216 = _2136 * _2172;
    float _2218 = _2164 * _2172;
    float _2220 = _2212 * _2192;
    float _2222 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2224 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2226 = isnan(0.5);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2232 = _2228 || _2230;
    float _2234 = fma(_2190, _2180, _2178);
    float _2236 = -_2192;
    float _2238 = _2190 * _2236;
    float _2240 = -_2186;
    float _2242 = fma(_2190, _2184, _2240);
    float _2244 = -_2184;
    float _2246 = fma(_2190, _2186, _2244);
    float _2248 = fma(_2234, _2206, _2220);
    float _2250 = _2216 * _2192;
    float _2252 = fma(_2214, _2206, _2238);
    float _2254 = fma(_2242, _2210, _2248);
    float _2256 = fma(_2190, _2178, _2180);
    float _2258 = fma(_2246, _2206, _2250);
    float _2260 = fma(_2218, _2210, _2252);
    float _2262 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2222);
    float _2266 = fma(_2256, _2210, _2258);
    float _2268 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2270 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2272 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2264);
    float _2274 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2276 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    float _2278 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2280 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2282 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2274);
    float _2284 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2286 = 1.0 / _2278;
    float _2288 = _2282 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2290 = _1160 + _2284;
    float _2292 = _1612 + _2288;
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2296 = _2290 + _2294;
    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2300 = _2292 + _2298;
    float _2302 = _2296 * _2296;
    float _2304 = fma(_2300, _2300, _2302);
    float _2306 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2280);
    float _2308 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2310 = sqrt(_2304);
    float _2312 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2306);
    float _2314 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2308);
    float _2316 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2318 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2314);
    float _2320 = _2316 + _2278;
    float _2322 = _2318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2324 = _2320 * _2286;
    float _2326 = _2324 * 0.5;
    float _2328 = _1622 + _2322;
    bool _2330 = _2310 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2334 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2332);
    float _2336 = 1.0 / _2334;
    float _2338 = _2320;
    float _2340 = _2260;
    float _2342 = _2326;
    float _2344 = _2334;
    if (!_2330)
    {
        _2338 = _2292;
    }
    float _2346 = _2338;
    float _2348 = _2346;
    if (!_2330)
    {
        _2340 = _2290;
    }
    float _2350 = _2340;
    float _2352 = _2350;
    if (!_2330)
    {
        _2342 = _2328;
    }
    float _2354 = _2342;
    bool _2356 = !_2330;
    float _2358 = _2354;
    if (!_2356)
    {
        float _2360 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2364 = _2310 + _2362;
        float _2366 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2368 = rsqrt(_2304);
        float _2370 = _2364 * _2360;
        float _2372 = _2370 * 0.15915493667125701904296875;
        float _2374 = _2372 * 6.283185482025146484375;
        float _2376 = cos(_2374);
        float _2378 = _2372 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = _2376 + (-1.0);
        float _2384 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2386 = fma(_2380, _2366, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2388 = fma(_2328, _2376, _2384);
        float _2390 = _2368 * _2386;
        float _2392 = fma(_2300, _2390, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2394 = fma(_2296, _2390, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2348 = _2392;
        _2358 = _2388;
        _2352 = _2394;
        _2344 = _2384;
    }
    float _2396 = _2348;
    float _2398 = _2358;
    float _2400 = _2352;
    float _2402 = _2344;
    float _2404 = -_1736;
    float _2406 = _2404 + _2396;
    float _2408 = -_1718;
    float _2410 = _2408 + _2398;
    float _2412 = -_1824;
    float _2414 = _2412 + _2400;
    float _2416 = _2402;
    float _2418 = _2410;
    float _2420 = _2406;
    float _2422 = _2414;
    if (_2232)
    {
        _2416 = 1.0;
    }
    float _2424 = _2416;
    float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2428 = _2336 * _2426;
    float _2430 = _2424;
    if (!_2204)
    {
        float _2432 = _2074 * _2074;
        float _2434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2436 = -_1160;
        float _2438 = _2436 + _2400;
        float _2440 = -_1622;
        float _2442 = _2440 + _2398;
        float _2444 = fma(_2084, _2084, _2432);
        float _2446 = -_1612;
        float _2448 = _2446 + _2396;
        float _2450 = fma(_2094, _2094, _2444);
        float _2452 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2454 = sqrt(_2450);
        float _2456 = 1.0 / _1916;
        float _2458 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2460 = precise::min(_2454, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2462 = _2460 * _2434;
        float _2464 = _2462 * _2456;
        float _2466 = _2458 * _2464;
        float _2468 = _2438 * _2464;
        float _2470 = fma(_2442, _2466, _2062);
        float _2472 = fma(_2448, _2466, _2066);
        float _2474 = fma(_2458, _2468, _2080);
        _2418 = _2470;
        _2420 = _2472;
        _2422 = _2474;
        _2140 = _2454;
        _1808 = _2448;
    }
    float _2476 = _2418;
    float _2478 = _2420;
    float _2480 = _2422;
    float _2482 = _2140;
    float _2484 = _1808;
    float _2486 = _2482;
    if (!_2232)
    {
        float _2488 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2490 = _2488 * 0.15915493667125701904296875;
        float _2492 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2494 = _2490 * 6.283185482025146484375;
        float _2496 = cos(_2494);
        float _2498 = _2492 * 0.15915493667125701904296875;
        float _2500 = _2490 * 6.283185482025146484375;
        float _2502 = sin(_2500);
        float _2504 = 1.0 / _2496;
        float _2506 = _2498 * 6.283185482025146484375;
        float _2508 = cos(_2506);
        float _2510 = _2502 * _2504;
        float _2512 = _2498 * 6.283185482025146484375;
        float _2514 = sin(_2512);
        float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2518 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2516;
        float _2520 = _2508 * _2510;
        float _2522 = 1.0 / _2520;
        float _2524 = 1.0 / _2518;
        float _2526 = _2514 * _2522;
        float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2530 = fma(_2428, _2526, _2528);
        float _2532 = _2530 * _2524;
        float _2534 = precise::clamp(_2532, 0.0, 1.0);
        _2486 = _2490;
        _2430 = _2534;
    }
    float _2536 = _2486;
    float _2538 = _2430;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2542 = _2476 + _2540;
    float _2544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2546 = _2478 + _2544;
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2550 = _2480 + _2548;
    float _2552 = fma(_2400, 6.2500002968590706586837768554688e-05, 0.5);
    float _2554 = _2542 * _2542;
    float _2556 = fma(_2546, _2546, _2554);
    float _2558 = fma(_2550, _2550, _2556);
    float _2560 = rsqrt(_2558);
    float _2562 = sqrt(_2558);
    float _2564 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2566 = _2546 * _2564;
    float _2568 = _2550 * _2564;
    float _2570 = _2566 * _2566;
    float _2572 = _2568 * _2568;
    float _2574 = _2570 + _2572;
    float _2576 = sqrt(_2574);
    bool _2578 = _2576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2582 = _2576 + _2580;
    float _2584 = _2550;
    float _2586 = _2582;
    float _2588 = _2536;
    float _2590 = _2542;
    if (_2578)
    {
        float _2592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2584 = _2592;
    }
    float _2594 = _2584;
    if (_2578)
    {
        float _2596 = _2582 * _2594;
        _2586 = _2596;
    }
    float _2598 = _2586;
    if (_2578)
    {
        float _2600 = _2598 * 0.15915493667125701904296875;
        _2588 = _2600;
    }
    float _2602 = _2588;
    float _2604 = _2560;
    float _2606 = _2602;
    if (_2578)
    {
        float _2608 = _2602 * 6.283185482025146484375;
        float _2610 = sin(_2608);
        _2604 = _2610;
    }
    float _2612 = _2604;
    float _2614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2616 = precise::max(0.0, _2614);
    float _2618 = _2484;
    float _2620 = _2616;
    if (_2578)
    {
        float _2622 = _2602 * 6.283185482025146484375;
        float _2624 = cos(_2622);
        _2618 = _2624;
    }
    float _2626 = _2618;
    float _2628 = -_2564;
    float _2630 = -_2616;
    float _2632 = fma(_2542, _2628, _2630);
    float _2634 = _2614;
    if (_2578)
    {
        float _2636 = rsqrt(_2574);
        _2634 = _2636;
    }
    float _2638 = _2634;
    if (_2578)
    {
        float _2640 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2620 = _2640;
    }
    float _2642 = _2620;
    float _2644 = _2642;
    if (!_2578)
    {
        _2606 = _2570;
    }
    float _2646 = _2606;
    float _2648 = _2612;
    float _2650 = _2646;
    if (_2578)
    {
        float _2652 = fma(_2612, _2642, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2644 = _2652;
    }
    float _2654 = _2644;
    float _2656 = _2654;
    if (!_2578)
    {
        _2648 = _2566;
    }
    float _2658 = _2648;
    float _2660 = _2658;
    if (_2578)
    {
        float _2662 = _2626 + (-1.0);
        _2590 = _2662;
    }
    float _2664 = _2590;
    float _2666 = _2664;
    if (_2578)
    {
        float _2668 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1810 = _2668;
    }
    float _2670 = _1810;
    if (!_2578)
    {
        _2666 = _2572;
    }
    float _2672 = _2666;
    float _2674 = _2638;
    float _2676 = _2672;
    if (_2578)
    {
        float _2678 = _2638 * _2654;
        _2006 = _2678;
    }
    float _2680 = _2006;
    if (!_2578)
    {
        _2674 = _2632;
    }
    float _2682 = _2674;
    float _2684 = _2682;
    if (_2578)
    {
        float _2686 = fma(_2632, _2626, _2670);
        _2684 = _2686;
    }
    float _2688 = _2684;
    if (!_2578)
    {
        _2656 = _2568;
    }
    float _2690 = _2656;
    float _2692 = _2690;
    if (_2578)
    {
        float _2694 = _2566 * _2680;
        _2660 = _2694;
    }
    float _2696 = _2660;
    if (_2578)
    {
        float _2698 = _2568 * _2680;
        _2692 = _2698;
    }
    float _2700 = _2692;
    if (_2578)
    {
        float _2702 = _2696 * _2696;
        _2650 = _2702;
    }
    float _2704 = _2650;
    if (_2578)
    {
        float _2706 = _2700 * _2700;
        _2676 = _2706;
    }
    float _2708 = _2676;
    float _2710 = fma(_2066, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2712 = fma(_2688, _2688, _2704);
    float _2714 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2718 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2716);
    float _2720 = precise::clamp(_2718, 0.0, 1.0);
    float _2722 = _2712 + _2708;
    float _2724 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2714);
    float _2726 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2728 = floor(_2710);
    float _2730 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2724);
    float _2732 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2734 = rsqrt(_2722);
    float _2736 = floor(_2732);
    float _2738 = -_2728;
    float _2740 = _2710 + _2738;
    float _2742 = _2734 * _2696;
    float _2744 = _2734 * _2688;
    float _2746 = _2734 * _2700;
    float _2748 = -_2720;
    float _2750 = _2748 + 1.0;
    float _2752 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2754 = _2730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2756 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2758 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2760 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2752);
    float _2762 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2764 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2756);
    float _2766 = abs(_2750);
    float _2768 = log2(_2766);
    float _2770 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2760);
    float _2772 = -_2758;
    float _2774 = fma(_2744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2772);
    float _2776 = -_2762;
    float _2778 = fma(_2776, _2726, 1.0);
    float _2780 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2782 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2764);
    float _2784 = _2770 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2786 = -_2746;
    float _2788 = fma(_2786, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2774);
    float _2790 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2780);
    float _2792 = _2782 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2794 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2796 = fma(_2788, -0.5, 0.5);
    float _2798 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2790);
    float _2800 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2794);
    float _2802 = fma(_2788, 0.5, 0.5);
    float _2804 = _2798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2806 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2808 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2800);
    float _2810 = fma(_2802, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2812 = log2(_2778);
    float _2814 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2816 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2808);
    float _2818 = fma(_2802, _2810, -0.212114393711090087890625);
    float _2820 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2822 = -_2736;
    float _2824 = _2732 + _2822;
    float _2826 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2814);
    float _2828 = _2744 + 1.0;
    float _2830 = exp2(_2806);
    float _2832 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2820);
    float _2834 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2826);
    float _2836 = fma(_2802, _2818, 1.570728778839111328125);
    float _2838 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2832);
    float _2840 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2834);
    float _2842 = 1.0 / _2816;
    float _2844 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2838);
    float _2846 = _2812 * 0.693147182464599609375;
    float _2848 = sqrt(_2796);
    float _2850 = -_2744;
    float _2852 = fma(_2830, _2828, _2850);
    float _2854 = fma(_2396, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _7615 = float2(_2740, _2824);
    float _2856 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7615, float2(0.0), isnan(_7615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7615, float2(0.0), isnan(_7615)), level(0.0)).x;
    float _2858 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2860 = fma(_2852, 0.5, 0.5);
    float _2862 = _2840 * _2842;
    float _2864 = _2844 * _2842;
    float _2866 = fma(_2862, 0.5, 0.5);
    float _2868 = fma(_2864, -0.5, 0.5);
    float _2870 = _2848 * 0.636619746685028076171875;
    float _2872 = -_2836;
    float _2874 = fma(_2870, _2872, 1.0);
    float3 _7650 = float3(_2866, _2868, _2858);
    float _2876 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7650, float3(0.0), isnan(_7650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7650, float3(0.0), isnan(_7650)), level(0.0)).x;
    float3 _7661 = float3(_2866, _2868, _2858);
    float4 _2879 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7661, float3(0.0), isnan(_7661)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7661, float3(0.0), isnan(_7661)), level(0.0)).xyzw;
    float _2881 = _2879.x;
    float _2883 = _2879.y;
    float _2885 = _2879.z;
    float _2887 = _2879.w;
    float2 _7677 = float2(_2874, _2860);
    float3 _2891 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7677, float2(0.0), isnan(_7677)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7677, float2(0.0), isnan(_7677)), level(0.0)).xyz;
    float _2893 = _2891.x;
    float _2895 = _2891.y;
    float _2897 = _2891.z;
    float2 _7691 = float2(_2854, _2552);
    float3 _2899 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_7691, float2(0.0), isnan(_7691)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_7691, float2(0.0), isnan(_7691)), level(0.0)).xyz;
    float _2901 = _2899.x;
    float _2903 = _2899.y;
    float _2905 = _2899.z;
    float _2907 = abs(_2428);
    float _2909 = log2(_2907);
    float _2911 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2913 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2915 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2917 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2919 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2911);
    float _2921 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2923 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2925 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2927 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2913);
    float _2929 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2915);
    float _2931 = -_2190;
    float _2933 = fma(_2931, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2921);
    float _2935 = -_2190;
    float _2937 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2925);
    float _2939 = -_2190;
    float _2941 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2917);
    float _2943 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2945 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2947 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2949 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2951 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2943);
    float _2953 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2945);
    float _2955 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2949);
    float _2957 = exp2(_2947);
    float _2959 = fma(_2923, _2923, 1.0);
    float _2961 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2963 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2937);
    float _2965 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2933);
    float _2967 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2941);
    float _2969 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2919);
    float _2971 = rsqrt(_2959);
    float _2973 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2961);
    float _2975 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2977 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2951);
    float _2979 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2953);
    float _2981 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2955);
    float _2983 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2973);
    float _2985 = _2923 * _2963;
    float _2987 = fma(_2957, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2989 = precise::clamp(_2987, 0.0, 1.0);
    float _2991 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2927);
    float _2993 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2929);
    float _2995 = fma(_2975, _2969, _2985);
    float _2997 = fma(_2989, -2.0, 3.0);
    float _2999 = _2989 * _2989;
    bool _3001 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3003 = isnan(_2562);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3009 = _3005 || _3007;
    out.m_84.x = _2969;
    out.m_84.y = _2991;
    out.m_84.z = _2993;
    float _3011 = _2923 * _2971;
    float _3013 = _2999 * _2997;
    float _3015 = _2923 * _2965;
    float _3017 = _2923 * _2967;
    float _3019 = -_2977;
    float _3021 = _3011 * _3019;
    float _3023 = -_3013;
    float _3025 = _3023 + 1.0;
    float _3027 = -_2981;
    float _3029 = _3011 * _3027;
    float _3031 = fma(_2975, _2991, _3015);
    float _3033 = fma(_2971, _2963, _3021);
    float _3035 = fma(_3025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3013);
    float _3037 = -_2979;
    float _3039 = _3011 * _3037;
    float _3041 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2983);
    float _3043 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3045 = fma(_2971, _2967, _3029);
    float _3047 = fma(_2971, _2965, _3039);
    bool _3049 = _2428 <= 8000.0;
    bool _3051 = isnan(_2428);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan(8000.0);
    bool _3057 = _3053 || _3055;
    float _3059 = float(_3057);
    float _3061 = in.m_86.x;
    float _3063 = fma(_2975, _2993, _3017);
    float _3065 = exp2(_3043);
    float _3067 = _3059 * _3035;
    float _3069 = _2979 + _3031;
    float _3071 = _2816 * 0.5;
    out.gl_Position.x = _2840;
    out.gl_Position.y = _2844;
    out.gl_Position.z = _3041;
    out.gl_Position.w = _2816;
    float _3073 = _3067 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3075 = _3041 + _2816;
    float _3077 = fma(_2844, -0.5, _3071);
    out.m_88.x = _3033;
    out.m_88.y = _3047;
    out.m_88.z = _3045;
    float _3079 = _2840 + _2816;
    float _3081 = _2977 + _2995;
    float _3083 = _2981 + _3063;
    float _3085 = _3075 * 0.5;
    float _3087 = _3079 * 0.5;
    float _3089 = -_3065;
    float _3091 = _3089 + 1.0;
    out.m_90.x = _3081;
    out.m_90.y = _3069;
    out.m_90.z = _3083;
    float _3093 = _3091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3095 = _3045;
    float _3097 = _3047;
    float _3099 = _2816;
    float _3101 = _3077;
    if (!_3009)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3103 = _3095;
    out.m_92.x = _3087;
    out.m_92.y = _3077;
    out.m_92.z = _3085;
    out.m_92.w = _2816;
    float _3105 = _3103;
    float _3107 = _3103;
    if (!_3009)
    {
        _3097 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3109 = _3097;
    float _3111 = -_3093;
    float _3113 = _3111 + 1.0;
    float _3115 = _2538 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3117 = _3113;
    float _3119 = _3109;
    float _3121 = _3109;
    if (!_3009)
    {
        _3099 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3123 = _3099;
    float _3125 = _3123;
    float _3127 = _3123;
    if (!_3009)
    {
        _3101 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3129 = _3101;
    float _3131 = -_2856;
    float _3133 = _3131 + 1.0;
    float _3135 = _3133 * _3073;
    float _3137 = precise::clamp(_3135, 0.0, 1.0);
    float _3139 = -_3137;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3143 = _3141 * _3061;
    float _3145 = _3143 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3147 = _3093 * _2876;
    float _3149 = _2887 * _3113;
    out.m_94.x = _3145;
    float _3151 = _2901;
    float _3153 = _3129;
    float _3155 = _3129;
    if (!_3009)
    {
        _3117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3157 = _3117;
    float _3159 = _2887 * _3147;
    float _3161 = _2897 * _3147;
    float _3163 = fma(_2893, _3159, _2881);
    float _3165 = fma(_2895, _3159, _2883);
    float _3167 = fma(_2887, _3161, _2885);
    out.m_96.x = _3163;
    out.m_96.y = _3165;
    out.m_96.z = _3167;
    out.m_96.w = _3149;
    out.m_98.x = _2901;
    out.m_98.y = _2903;
    out.m_98.z = _2905;
    float _3169 = _3157;
    float _3171 = _3157;
    if (!_3009)
    {
        _3151 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3173 = _3151;
    bool _3175 = !_3009;
    float _3177 = _3173;
    float _3179 = _3173;
    if (!_3175)
    {
        bool _3181 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3183 = isnan(_2562);
        bool _3185 = _3181 || _3183;
        bool _3187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3189 = _3185 || _3187;
        if (!_3189)
        {
            float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3193 = _2562 + _3191;
            float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3197 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3195;
            float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3203 = 1.0 / _3197;
            float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3221 = _3193 * _3203;
            float _3223 = precise::clamp(_3221, 0.0, 1.0);
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3227 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3229 = fma(_3223, _3201, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3231 = fma(_3223, _3227, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3233 = fma(_3223, _3207, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3235 = fma(_3223, _3211, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3237 = fma(_3223, _3215, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3239 = fma(_3223, _3219, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3127 = _3233;
            _3171 = _3237;
            _3107 = _3229;
            _3121 = _3235;
            _3155 = _3231;
            _3179 = _3239;
            _3241 = true;
        }
        else
        {
            bool _3243 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3245 = isnan(_2562);
            bool _3247 = _3243 || _3245;
            bool _3249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3251 = _3247 || _3249;
            if (!_3251)
            {
                _3105 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3253 = _3105;
            _3107 = _3253;
            if (!_3251)
            {
                _3125 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3255 = _3125;
            _3127 = _3255;
            if (!_3251)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3257 = _3153;
            _3155 = _3257;
            if (!_3251)
            {
                _3119 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3259 = _3119;
            _3121 = _3259;
            if (!_3251)
            {
                _3169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3261 = _3169;
            _3171 = _3261;
            if (!_3251)
            {
                _3177 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3263 = _3177;
            bool _3265 = !_3251;
            _3179 = _3263;
            if (!_3265)
            {
                bool _3267 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3269 = isnan(_2562);
                bool _3271 = _3267 || _3269;
                bool _3273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3275 = _3271 || _3273;
                if (!_3275)
                {
                    float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3279 = _2562 + _3277;
                    float _3281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3283 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3281;
                    float _3285 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3287 = _3285 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3289 = 1.0 / _3283;
                    float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3293 = _3291 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3297 = _3295 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3299 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3301 = _3299 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3303 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3305 = _3303 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3307 = _3279 * _3289;
                    float _3309 = precise::clamp(_3307, 0.0, 1.0);
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3315 = fma(_3309, _3287, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3317 = fma(_3309, _3313, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3319 = fma(_3309, _3293, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3321 = fma(_3309, _3297, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3323 = fma(_3309, _3301, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3325 = fma(_3309, _3305, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3127 = _3319;
                    _3171 = _3323;
                    _3107 = _3315;
                    _3121 = _3321;
                    _3155 = _3317;
                    _3179 = _3325;
                    _3241 = true;
                }
                else
                {
                    _3127 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3107 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3121 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3179 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3241 = false;
    float _3327 = _3127;
    float _3329 = _3171;
    float _3331 = _3107;
    float _3333 = _3121;
    float _3335 = _3155;
    float _3337 = _3179;
    float _3339 = fma(_3069, -0.5, 0.5);
    float _3341 = precise::clamp(_3339, 0.0, 1.0);
    float _3343 = -_3327;
    float _3345 = _3343 + _3329;
    float _3347 = -_3331;
    float _3349 = _3347 + _3333;
    out.m_100.x = 0.0;
    float _3351 = fma(_3341, _3345, _3327);
    float _3353 = -_3335;
    float _3355 = _3353 + _3337;
    float _3357 = fma(_3341, _3349, _3331);
    float _3359 = _3351 * 0.586610972881317138671875;
    bool _3361 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3363 = fma(_3341, _3355, _3335);
    float _3365 = _3115 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3367 = fma(_3357, 0.298911988735198974609375, _3359);
    bool _3369 = _2538 > 0.0;
    bool _3371 = isnan(_2538);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan(0.0);
    bool _3377 = _3373 || _3375;
    float _3379 = fma(_3363, 0.114477999508380889892578125, _3367);
    out.m_55.x = _3365;
    float _3381 = -_3379;
    float _3383 = _3357 + _3381;
    float _3385 = -_3379;
    float _3387 = _3351 + _3385;
    float _3389 = -_3379;
    float _3391 = _3363 + _3389;
    float _3393 = fma(_3383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3379);
    float _3395 = fma(_3387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3379);
    float _3397 = fma(_3391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3379);
    bool _3399 = !_3361;
    if (!_3399)
    {
        float _3401 = -_2476;
        float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3405 = -_2478;
        float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3409 = -_2480;
        float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3413 = _3403 * _3403;
        float _3415 = fma(_3407, _3407, _3413);
        float _3417 = fma(_3411, _3411, _3415);
        float _3419 = sqrt(_3417);
        float _3421 = rsqrt(_3417);
        float _3423 = -_3419;
        float _3425 = _3423 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3427 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3429 = precise::clamp(_3427, 0.0, 1.0);
        float _3431 = _3407 * _3421;
        float _3433 = _3403 * _3421;
        float _3435 = abs(_3429);
        float _3437 = log2(_3435);
        float _3439 = _3411 * _3421;
        float _3441 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3443 = _3069 * _3433;
        float _3445 = -_3433;
        float _3447 = -_3441;
        float _3449 = fma(_3445, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3447);
        float _3451 = fma(_3081, _3431, _3443);
        float _3453 = -_3439;
        float _3455 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3449);
        float _3457 = fma(_3083, _3439, _3451);
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3463 = _3455 + _3461;
        float _3465 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3467 = _3463 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3469 = precise::clamp(_3467, 0.0, 1.0);
        float _3471 = exp2(_3465);
        float _3473 = _3471 * _3469;
        float _3475 = _3459 * _3473;
        float _3477 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3479 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3481 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3477;
        out.m_100.y = _3479;
        out.m_100.z = _3481;
    }
    out.m_102.x = _3393;
    out.m_102.y = _3395;
    out.m_102.z = _3397;
    if (_3377)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3483 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_55.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3483;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3241 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_48.w;
    float _118 = in.m_50.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = as_type<float>(_123);
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_55.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3552 = as_type<float>(_145);
        out.gl_Position.z = _3552;
    }
    if (!_131)
    {
        return out;
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = in.m_57.x;
    float _161 = float(_123);
    bool _163 = _127 >= _161;
    bool _165 = !_157;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _135;
    if (_167)
    {
        out.m_55.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _147 = as_type<int>(_173);
    }
    int _175 = _147;
    float _177 = _127 * _169;
    out.m_59.x = _159;
    float _179 = _177;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3617 = as_type<float>(_175);
        out.gl_Position.z = _3617;
    }
    out.m_53.x = _177;
    if (_167)
    {
        return out;
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _217;
    if (!_201)
    {
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        _217 = _177;
    }
    _219 = false;
    float _221 = _217;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = _221 + _227;
    bool _231 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _233 = isnan(_221);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    float _255 = -_241;
    float _257 = _255 + 1.0;
    float _259 = 1.0 / _245;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _249;
    float _265 = 1.0 / _253;
    float _267 = _225 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _221 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    float _277 = fma(_275, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = _271 * _263;
    bool _281 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_221);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = _291 * _257;
    bool _299 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_221);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _229 * _265;
    bool _313 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_221);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_291;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_295, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = -_323;
    float _341 = _339 + 1.0;
    float _343 = _323 * _327;
    float _345 = fma(_331, _279, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = _309 * _341;
    float _349 = in.m_64.x;
    float _351 = in.m_64.y;
    float _353 = -_309;
    float _355 = _353 + 1.0;
    float _357 = fma(_337, _279, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = _277 * _347;
    float _361 = _333 * _347;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _367;
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _373 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _361);
    float _375 = fma(_365, _311, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _377 = fma(_369, _311, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _379 = fma(_357, _343, _371);
    float _381 = fma(_345, _343, _373);
    float _383 = fma(_375, _297, _379);
    float _385 = fma(_377, _297, _381);
    float _387 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].x, _383);
    float _389 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].y, _385);
    float _391 = _387 * _349;
    float _393 = _389 * _351;
    bool _395 = !_261;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _399 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _179 = _409;
    }
    float _411 = _179;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _415 = int(_413);
    float _417 = in.m_57.z;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _425 = int(_423);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _429 = float(_415);
    float _431 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _433 = int(_431);
    float _435 = float(_425);
    float _437 = 1.0 / _429;
    float _439 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _441 = int(_439);
    float _443 = float(uint(_433));
    float _445 = 1.0 / _435;
    float _447 = _437 * _127;
    float _449 = float(uint(_441));
    float _451 = 1.0 / _443;
    int _453 = ~_441;
    int _455 = _453 + 1;
    int _457 = ~_441;
    int _459 = _457 + 1;
    float _461 = _445 * _127;
    float _463 = trunc(_447);
    int _465 = int(_463);
    float _467 = 1.0 / _449;
    int _469 = as_type<int>(_451) + (-2);
    float _471 = trunc(_461);
    int _473 = int(_471);
    float _475 = float(uint(_465));
    float _477 = as_type<float>(_469) * _475;
    float _479 = _475;
    if (_421)
    {
        _479 = 1.0;
    }
    float _481 = _479;
    float _483 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _485 = log2(_483);
    int _487 = as_type<int>(_467) + (-2);
    float _489 = _481;
    if (!_421)
    {
        _489 = 7.345489978790283203125;
    }
    float _491 = _489;
    float _493 = float(uint(_473));
    float _495 = trunc(_477);
    float _497 = precise::max(_495, 0.0);
    uint _500 = uint(_497);
    float _502 = _491 * _159;
    float _504 = as_type<float>(_487) * _493;
    int _506 = ~_433;
    int _508 = _506 + 1;
    float _510 = trunc(_504);
    float _512 = precise::max(_510, 0.0);
    uint _514 = uint(_512);
    int _516 = _508 * int(_500);
    int _518 = _516 + _465;
    float _520 = floor(_502);
    float _522 = float(uint(_518));
    float _524 = as_type<float>(_518);
    float _526 = _522;
    if (_421)
    {
        _524 = 1.0;
    }
    float _528 = _524;
    int _530 = _455 * int(_514);
    int _532 = _530 + _473;
    float _534 = _528;
    if (!_421)
    {
        _534 = 5.839270114898681640625;
    }
    float _536 = _534;
    float _538 = as_type<float>(_469) * _522;
    if (_421)
    {
        _526 = _159;
    }
    float _540 = _526;
    float _542 = float(uint(_532));
    float _544 = trunc(_538);
    float _546 = precise::max(_544, 0.0);
    uint _548 = uint(_546);
    float _550 = _540;
    if (!_421)
    {
        _550 = _417;
    }
    float _552 = _550;
    float _554 = -_520;
    float _556 = _502 + _554;
    float _558 = as_type<float>(_487) * _542;
    float _560 = _536 * _552;
    float _562 = float(_433);
    float _564 = float(_465);
    float _566 = trunc(_558);
    float _568 = precise::max(_566, 0.0);
    uint _570 = uint(_568);
    float _572 = _556 * _562;
    bool _574 = _564 >= _562;
    bool _576 = isnan(_564);
    bool _578 = _574 || _576;
    bool _580 = isnan(_562);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = float(_473);
    int _588 = int(_500) + int(_548);
    float _590 = floor(_560);
    int _592 = ~_433;
    int _594 = _592 + 1;
    int _596 = ~_441;
    int _598 = _596 + 1;
    int _600 = _594 * _588;
    int _602 = _600 + _465;
    int _604 = int(_514) + int(_570);
    bool _606 = uint(_602) >= uint(_433);
    float _608 = _169 * _127;
    int _610 = _598 * _604;
    int _612 = _610 + _473;
    float _614 = float(_441);
    float _616 = -_590;
    float _618 = _560 + _616;
    float _620 = trunc(_584);
    int _622 = int(_620);
    bool _624 = uint(_612) >= uint(_441);
    bool _626 = _586 >= _614;
    bool _628 = isnan(_586);
    bool _630 = _626 || _628;
    bool _632 = isnan(_614);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _562 * _608;
    bool _640 = !_606;
    int _642 = _640 ? 0 : (-1);
    float _644 = _614 * _608;
    bool _646 = !_624;
    int _648 = _646 ? 0 : (-1);
    float _650 = trunc(_636);
    int _652 = int(_650);
    int _654 = ~_588;
    int _656 = _654 + _642;
    int _658 = _656 + 1;
    float _660 = _618 * _614;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _664 = _662 != 0;
    int _666 = ~_604;
    int _668 = _666 + _648;
    int _670 = _668 + 1;
    int _672 = _433 * _658;
    int _674 = _672 + _465;
    bool _676 = _433 == 0;
    float _678 = trunc(_572);
    int _680 = int(_678);
    bool _682 = !_664;
    int _684 = _682 ? 0 : 1;
    int _686 = _441 * _670;
    int _688 = _686 + _473;
    int _690 = ~_622;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    int _696 = abs(_684);
    bool _698 = !_676;
    int _700 = _698 ? _674 : (-1);
    float _702 = trunc(_638);
    int _704 = int(_702);
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _712 = _710 != 0;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _716 = _714 != 0;
    bool _718 = _441 == 0;
    int _720 = _700 * _694;
    int _722 = _433 + (-1);
    int _724 = ~_652;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    int _730 = _680 * _696;
    int _732 = _730 + _465;
    bool _734 = !_718;
    int _736 = _734 ? _688 : (-1);
    int _738 = _622 * _722;
    int _740 = _738 + _720;
    bool _742 = !_712;
    int _744 = _742 ? 0 : 1;
    float _746 = trunc(_644);
    int _748 = int(_746);
    int _750 = _441 + (-1);
    int _752 = _736 * _728;
    int _754 = abs(_744);
    bool _756 = !_708;
    int _758 = _756 ? 0 : 1;
    int _760 = _652 * _750;
    int _762 = _760 + _752;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _766 = _764 != 0;
    int _768 = _740 * _754;
    bool _770 = !_716;
    int _772 = _770 ? 0 : 1;
    int _774 = abs(_758);
    bool _776 = !_766;
    int _778 = _776 ? 0 : 1;
    int _780 = abs(_772);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _792 = _790 != 0;
    float _794 = trunc(_660);
    int _796 = int(_794);
    int _798 = abs(_778);
    int _800 = _704 * _774;
    int _802 = _800 + _768;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _806 = _804 != 0;
    bool _808 = !_788;
    int _810 = _808 ? 0 : 1;
    int _812 = _732 * _780;
    int _814 = _812 + _802;
    bool _816 = !_806;
    int _818 = _816 ? 0 : 1;
    float _820 = in.m_66.x;
    float _822 = in.m_66.y;
    float _824 = in.m_66.z;
    float _826 = in.m_66.w;
    int _828 = abs(_810);
    int _830 = _680 * _798;
    int _832 = _830 + _814;
    int _834 = abs(_818);
    bool _836 = !_784;
    int _838 = _836 ? 0 : 1;
    int _840 = _796 * _834;
    int _842 = _840 + _473;
    bool _844 = !_792;
    int _846 = _844 ? 0 : 1;
    int _848 = _762 * _828;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _852 = _850 != 0;
    int _854 = abs(_838);
    int _856 = abs(_846);
    float _858 = float(uint(_832));
    int _860 = _748 * _854;
    int _862 = _860 + _848;
    bool _864 = !_852;
    int _866 = _864 ? 0 : 1;
    float _868 = as_type<float>(_469) * _858;
    int _870 = abs(_866);
    int _872 = ~_441;
    int _874 = _872 + 1;
    int _876 = _842 * _856;
    int _878 = _876 + _862;
    int _880 = ~_433;
    int _882 = _880 + 1;
    float _884 = trunc(_868);
    float _886 = precise::max(_884, 0.0);
    uint _888 = uint(_886);
    int _890 = ~_441;
    int _892 = _890 + 1;
    int _894 = _796 * _870;
    int _896 = _894 + _878;
    float _898 = float(uint(_896));
    float _900 = as_type<float>(_487) * _898;
    int _902 = _882 * int(_888);
    int _904 = _902 + _832;
    float _906 = trunc(_900);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    float _912 = float(uint(_904));
    float _914 = as_type<float>(_469) * _912;
    float _916 = trunc(_914);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    int _922 = _874 * int(_910);
    int _924 = _922 + _896;
    float _926 = float(uint(_924));
    int _928 = ~_433;
    int _930 = _928 + 1;
    float _932 = float(uint(_732));
    float _934 = as_type<float>(_487) * _926;
    int _936 = int(_888) + int(_920);
    float _938 = as_type<float>(_469) * _932;
    float _940 = trunc(_934);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    int _946 = _930 * _936;
    int _948 = _946 + _832;
    bool _950 = uint(_948) >= uint(_433);
    float _952 = trunc(_938);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    bool _958 = !_950;
    int _960 = _958 ? 0 : (-1);
    int _962 = ~_936;
    int _964 = _962 + _960;
    int _966 = _964 + 1;
    int _968 = int(_910) + int(_944);
    int _970 = _433 * _966;
    int _972 = _970 + _832;
    int _974 = _892 * _968;
    int _976 = _974 + _896;
    bool _978 = !_676;
    int _980 = _978 ? _972 : (-1);
    bool _982 = uint(_976) >= uint(_441);
    int _984 = _980 & 3;
    bool _986 = _984 != 0;
    float _988 = in.m_68.x;
    float _990 = in.m_68.y;
    float _992 = in.m_68.z;
    float _994 = in.m_68.w;
    bool _996 = !_982;
    int _998 = _996 ? 0 : (-1);
    bool _1000 = uint(_984) > 1u;
    int _1002 = ~_968;
    int _1004 = _1002 + _998;
    int _1006 = _1004 + 1;
    int _1008 = _980 & 3;
    bool _1010 = _1008 != 0;
    int _1012 = _441 * _1006;
    int _1014 = _1012 + _896;
    int _1016 = _1010 ? 0 : 1;
    float _1018 = in.m_70.x;
    float _1020 = in.m_70.y;
    float _1022 = in.m_70.z;
    float _1024 = in.m_70.w;
    bool _1026 = uint(_984) >= 2u;
    bool _1028 = !_718;
    int _1030 = _1028 ? _1014 : (-1);
    int _1032 = ~_1016;
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    int _1038 = _1036;
    if (!_1000)
    {
        int _1040 = ~_1016;
        int _1042 = _1040 + 1;
        _1038 = _1042;
    }
    int _1044 = _1038;
    int _1046 = _1030 & 3;
    bool _1048 = _1046 != 0;
    float _1050 = in.m_48.x;
    float _1052 = in.m_48.y;
    float _1054 = in.m_48.z;
    int _1056 = _1030 & 3;
    bool _1058 = _1056 != 0;
    int _1060 = _1026 ? 0 : 1;
    bool _1062 = uint(_1046) > 1u;
    int _1064 = _1058 ? 0 : 1;
    bool _1066 = uint(_1046) >= 2u;
    bool _1068 = _984 != 3;
    int _1070 = _1066 ? 0 : 1;
    bool _1072 = _1046 != 3;
    int _1074 = ~_1064;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    int _1080 = ~_1060;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1078;
    int _1088 = _1084;
    if (!_1062)
    {
        int _1090 = ~_1064;
        int _1092 = _1090 + 1;
        _1086 = _1092;
    }
    int _1094 = _1086;
    float _1096 = in.m_57.y;
    if (_1068)
    {
        int _1098 = ~_1060;
        int _1100 = _1098 + 1;
        _1088 = _1100;
    }
    int _1102 = _1088;
    float _1104 = _1052 * _990;
    int _1106 = ~_433;
    int _1108 = _1106 + 1;
    float _1110 = _1052 * _1020;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1114 = _1112 != 0;
    float _1116 = _1052 * _822;
    bool _1118 = _159 > 0.5;
    int _1120 = _1108 * int(_956);
    int _1122 = _1120 + _732;
    int _1124 = ~_1070;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    float _1130 = fma(_1050, _988, _1104);
    int _1132 = _1128;
    if (_1072)
    {
        int _1134 = ~_1070;
        int _1136 = _1134 + 1;
        _1132 = _1136;
    }
    int _1138 = _1132;
    float _1140 = fma(_1050, _820, _1116);
    bool _1142 = !_1114;
    int _1144 = _1142 ? 0 : 1;
    float _1146 = -_195;
    int _1148 = _1118 ? as_type<int>(_1146) : as_type<int>(_195);
    float _1150 = fma(_1054, _824, _1140);
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1158 = _1156 != 0;
    float _1160 = _1150 + _826;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1164 = _1162 != 0;
    float _1166 = _485 * _127;
    float _1168 = float(uint(_1122));
    float _1170 = fma(_1050, _1018, _1110);
    float _1172 = float(uint(_842));
    float _1174 = exp2(_1166);
    bool _1176 = !_1158;
    float _1178 = _1176 ? _195 : as_type<float>(_1148);
    float _1180 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1182 = as_type<float>(_469) * _1168;
    float _1184 = as_type<float>(_487) * _1172;
    bool _1186 = _1096 > 0.5;
    float _1188 = -_427;
    float _1190 = fma(_1180, 2.0, _1188);
    float _1192 = trunc(_1182);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    float _1198 = -_199;
    int _1200 = _1186 ? as_type<int>(_1198) : as_type<int>(_199);
    float _1202 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1204 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1206 = isnan(0.0);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1212 = _1208 || _1210;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1216 = -_127;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1190);
    float _1220 = trunc(_1184);
    float _1222 = precise::max(_1220, 0.0);
    uint _1224 = uint(_1222);
    float _1226 = -_1174;
    float _1228 = _1226 + 1.0;
    float _1230 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1214);
    int _1232 = ~_433;
    int _1234 = _1232 + 1;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1238 = !_1164;
    float _1240 = _1238 ? _199 : as_type<float>(_1200);
    float _1242 = fma(_1054, _992, _1130);
    float _1244 = _1212 ? _1228 : 0.0;
    float _1246 = fma(_1202, -2.0, _1236);
    bool _1248 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1250 = isnan(1.0);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1256 = _1252 || _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1260 = 1.0 + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1266 = int(_956) + int(_1196);
    float _1268 = _159 * 2.0;
    int _1270 = _459 * int(_1224);
    int _1272 = _1270 + _842;
    float _1274 = 1.0 / _1260;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1282 = float(uint(_1272));
    float _1284 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1276);
    float _1286 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1230);
    float _1288 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1246);
    float _1290 = floor(_1268);
    float _1292 = as_type<float>(_487) * _1282;
    float _1294 = _1096 * 2.0;
    int _1296 = _1234 * _1266;
    int _1298 = _1296 + _732;
    float _1300 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1284);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1306 = floor(_1294);
    if (_1256)
    {
        float _1308 = _1244 * _1274;
        _137 = _1308;
    }
    float _1310 = _137;
    bool _1312 = uint(_1298) >= uint(_433);
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1318 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = trunc(_1292);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1332 = _1290 >= 0.0;
    bool _1334 = isnan(_1290);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = _1178 + 0.5;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1346 = 1.0 / _1280;
    bool _1348 = !_986;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = -_1286;
    float _1354 = _1352 + 1.0;
    bool _1356 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1358 = isnan(_411);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    int _1368 = abs(_1094);
    int _1370 = abs(_1102);
    float _1372 = 1.0 / _1330;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1376 = !_1312;
    int _1378 = _1376 ? 0 : (-1);
    float _1380 = -_1366;
    float _1382 = _1380 + 1.0;
    bool _1384 = _1290 > 0.0;
    float _1386 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = fma(_1054, _1022, _1170);
    int _1390 = _1340 ? 0 : 1;
    float _1392 = 1.0 / _1264;
    bool _1394 = _1306 >= 0.0;
    bool _1396 = isnan(_1306);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    out.m_72.x = _1318;
    out.m_72.y = _1386;
    out.m_72.z = _1326;
    out.m_72.w = _1344;
    int _1404 = int(_1224) + int(_1324);
    float _1406 = _417 * 2.0;
    int _1408 = abs(_1138);
    float _1410 = 1.0 / _1304;
    int _1412 = ~_441;
    int _1414 = _1412 + 1;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1416;
    int _1420 = _1402 ? 0 : 1;
    float _1422 = floor(_1406);
    bool _1424 = _1306 > 0.0;
    int _1426 = _1414 * _1404;
    int _1428 = _1426 + _842;
    float _1430 = _1418 * _1346;
    int _1432 = ~_1390;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1442 = _1436;
    if (!_1384)
    {
        int _1444 = ~_1390;
        int _1446 = _1444 + 1;
        _1442 = _1446;
    }
    int _1448 = _1442;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1454 = uint(_1428) >= uint(_441);
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1456;
    float _1460 = _1440 * _1372;
    float _1462 = _159 + _1096;
    int _1464 = ~_1420;
    int _1466 = _1464 + 1;
    int _1468 = _1466 + 1;
    float _1470 = _1458 * _1392;
    int _1472 = _1468;
    if (!_1424)
    {
        int _1474 = ~_1420;
        int _1476 = _1474 + 1;
        _1472 = _1476;
    }
    int _1478 = _1472;
    float _1480 = _1462 + (-1.0);
    bool _1482 = !_1454;
    int _1484 = _1482 ? 0 : (-1);
    float _1486 = _1452 * _1410;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1498 = _1496 != 0;
    bool _1500 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1502 = isnan(_411);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1516 = _411 + _1514;
    bool _1518 = !_1490;
    int _1520 = _1518 ? 0 : 1;
    bool _1522 = _1422 >= 0.0;
    bool _1524 = isnan(_1422);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan(0.0);
    bool _1530 = _1526 || _1528;
    float _1532 = fma(_1430, _1516, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1534 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1536 = isnan(_411);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1548 = _411 + _1546;
    int _1550 = _1530 ? 0 : 1;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1554 = _411 + _1552;
    bool _1556 = _1422 > 0.0;
    float _1558 = -_1544;
    float _1560 = _1558 + 1.0;
    float _1562 = -_1510;
    float _1564 = _1562 + 1.0;
    float _1566 = fma(_1470, _1548, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1568 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1570 = isnan(_411);
    bool _1572 = _1568 || _1570;
    bool _1574 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1576 = _1572 || _1574;
    float _1578 = float(_1576);
    float _1580 = _1510 * _1560;
    float _1582 = fma(_1460, _1554, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1584 = _1366 * _1564;
    bool _1586 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1588 = isnan(_411);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1594 = _1590 || _1592;
    float _1596 = float(_1594);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1600 = _411 + _1598;
    float _1602 = _1578 * _1382;
    float _1604 = -_1578;
    float _1606 = _1604 + 1.0;
    float _1608 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1218);
    float _1610 = fma(_1486, _1600, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1612 = _1388 + _1024;
    float _1614 = _1596 * _1606;
    float _1616 = _1240 + (-0.5);
    float _1618 = -_1596;
    float _1620 = _1618 + 1.0;
    float _1622 = _1242 + _994;
    float _1624 = _1532 * _1614;
    float _1626 = -_1616;
    float _1628 = -_1288;
    float _1630 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1628);
    float _1632 = -_1300;
    float _1634 = _1632 + 1.0;
    float _1636 = -_1354;
    float _1638 = fma(_1178, _1636, _1608);
    float _1640 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1624);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _1622 + _1642;
    float _1646 = fma(_1240, _1634, _1630);
    float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1650 = _1612 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1654 = _1160 + _1652;
    float _1656 = _1644 * _1644;
    float _1658 = fma(_1582, _1602, _1640);
    int _1660 = _980 >> 31;
    out.m_74.x = _1638;
    out.m_74.y = _1646;
    float _1662 = fma(_1650, _1650, _1656);
    float _1664 = fma(_1566, _1584, _1658);
    bool _1666 = !_1048;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = fma(_1654, _1654, _1662);
    bool _1672 = _984 != 3;
    float _1674 = fma(_1610, _1580, _1664);
    int _1676 = _1030 >> 31;
    float _1678 = rsqrt(_1670);
    int _1680 = _1660 & 3;
    bool _1682 = !_1672;
    int _1684 = _1682 ? 0 : (-1);
    bool _1686 = _1046 != 3;
    float _1688 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1690 = _1676 & 3;
    float _1692 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1694 = _980 + _1680;
    int _1696 = _1030 + _1690;
    float _1698 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1700 = _1694 >> 2;
    float _1702 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1692);
    int _1704 = _1696 >> 2;
    float _1706 = _1698 * _1678;
    int _1708 = _1700 << 4;
    int _1710 = _1708 + 368;
    float _1712 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1702);
    int _1714 = _1704 << 4;
    int _1716 = _1714 + 656;
    float _1718 = _1644 * _1706;
    uint _1720 = uint(int(uint(_1710) >> uint(2)));
    uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
    int _1724 = int(_1720) & 3;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[int(_1722)][_1724];
    int _1728 = int(_1720) + 1;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    int _1732 = _1728 & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    float _1736 = _1650 * _1706;
    bool _1738 = !_1686;
    int _1740 = _1738 ? 0 : (-1);
    float _1742 = -_1718;
    float _1744 = _1644 + _1742;
    bool _1746 = _1712 >= 0.0;
    float _1748 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1674);
    float _1750 = -_1736;
    float _1752 = _1650 + _1750;
    float _1754 = _1744 * _1744;
    uint _1756 = uint(int(uint(_1716) >> uint(2)));
    uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
    int _1760 = int(_1756) & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    int _1764 = int(_1756) + 1;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    int _1768 = _1764 & 3;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[int(_1766)][_1768];
    float _1772 = _1748 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1774 = fma(_1752, _1752, _1754);
    int _1776 = abs(_1520);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1780 = ~_1550;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = _1710 + 8;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1806 = _1784;
    float _1808 = _1612;
    float _1810 = _1622;
    if (!_1556)
    {
        int _1812 = ~_1550;
        int _1814 = _1812 + 1;
        _1806 = _1814;
    }
    int _1816 = _1806;
    float _1818 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = float(_1816);
    float _1824 = _1654 * _1706;
    int _1826 = _1716 + 8;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    float _1844 = float(_1776);
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1848 = ~_1266;
    int _1850 = _1848 + _1378;
    int _1852 = _1850 + 1;
    float _1854 = -_1824;
    float _1856 = _1654 + _1854;
    int _1858 = abs(_1668);
    float _1860 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1862 = abs(_1684);
    int _1864 = _433 * _1852;
    int _1866 = _1864 + _732;
    int _1868 = abs(_1044);
    float _1870 = fma(_1856, _1856, _1774);
    out.m_76.x = _1860;
    out.m_76.y = _1818;
    out.m_76.z = _1820;
    out.m_76.w = _1772;
    int _1872 = abs(_1350);
    float _1874 = _1844 * _1822;
    int _1876 = ~_1404;
    int _1878 = _1876 + _1484;
    int _1880 = _1878 + 1;
    if (_1746)
    {
        out.m_55.x = 0.0;
    }
    float _1882 = sqrt(_1870);
    bool _1884 = !_676;
    int _1886 = _1884 ? _1866 : (-1);
    int _1888 = _441 * _1880;
    int _1890 = _1888 + _842;
    bool _1892 = !_718;
    float _1894 = _1892 ? as_type<float>(_1890) : as_type<float>(0xffffffffu /* nan */);
    int _1896 = ~_1868;
    int _1898 = _1896 + 1;
    int _1900 = _1898 + 1;
    int _1902 = ~_1872;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1900 * as_type<int>(_1734);
    int _1910 = ~_1368;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = _1678 * _1882;
    int _1918 = _1906 * as_type<int>(_1726);
    int _1920 = _1918 + _1908;
    int _1922 = ~_1858;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    int _1928 = _1914 * as_type<int>(_1770);
    int _1930 = ~_1370;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    float _1936 = _1688 * _1916;
    int _1938 = _1926 * as_type<int>(_1762);
    int _1940 = _1938 + _1928;
    int _1942 = abs(_1740);
    int _1944 = _1934 * as_type<int>(_1794);
    int _1946 = _1944 + _1920;
    float _1948 = in.m_78.x;
    float _1950 = in.m_78.y;
    float _1952 = in.m_78.z;
    int _1954 = ~_1408;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    bool _1960 = !_1154;
    int _1962 = _1960 ? 0 : 1;
    out.m_80.x = _1936;
    int _1964 = ~_1862;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = _1958 * as_type<int>(_1834);
    int _1972 = _1970 + _1940;
    int _1974 = ~_1942;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = abs(_1144);
    int _1982 = _1968 * as_type<int>(_1802);
    int _1984 = _1982 + _1946;
    int _1986 = abs(_1962);
    int _1988 = _1978 * as_type<int>(_1842);
    int _1990 = _1988 + _1972;
    int _1992 = ~_1980;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    int _1998 = ~_1986;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    float _2004 = as_type<float>(_1968);
    float _2006 = _1894;
    if (_1746)
    {
        _2004 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2008 = _2004;
    int _2010 = _1984 * _1996;
    float _2012 = _159 + (-0.5);
    int _2014 = _1990 * _2002;
    float _2016 = _1874 * (-2.0);
    int _2018 = _1886 * _1980;
    int _2020 = _2018 + _2010;
    int _2022 = as_type<int>(_2008);
    if (_1746)
    {
        float _2024 = _2008 * 5.0;
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    int _2028 = as_type<int>(_1894) * _1986;
    int _2030 = _2028 + _2014;
    float _2032 = fma(_2016, _1948, _1948);
    float _2034 = fma(_1512, _2016, _1512);
    float _2036 = float(_2020);
    float _2038 = _1952;
    if (_1746)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6297 = as_type<float>(_2026);
        out.gl_Position.z = _6297;
    }
    float _2040 = float(_2030);
    float _2042 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2032);
    float _2044 = _1096 + _417;
    bool _2046 = !_1494;
    int _2048 = _2046 ? 0 : 1;
    out.m_82.x = _2036;
    float _2050 = _2044 + (-1.0);
    float _2052 = float(_1448);
    out.m_82.z = _2040;
    int _2054 = abs(_2048);
    bool _2056 = !_1498;
    int _2058 = _2056 ? 0 : 1;
    if (_1746)
    {
        return out;
    }
    float _2060 = -_1718;
    float _2062 = _1622 + _2060;
    float _2064 = -_1736;
    float _2066 = _1612 + _2064;
    float _2068 = float(_2054);
    float _2070 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2074 = _2062 + _2072;
    int _2076 = abs(_2058);
    float _2078 = -_1824;
    float _2080 = _1160 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2084 = _2066 + _2082;
    float _2086 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2088 = float(_1478);
    float _2090 = _2068 * _2052;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2094 = _2080 + _2092;
    float _2096 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2086);
    float _2098 = _1096 + (-0.5);
    float _2100 = _2090 * (-2.0);
    float _2102 = float(_2076);
    float _2104 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2096);
    float _2106 = fma(_2034, _1310, _2042);
    float _2108 = fma(_2100, _1950, _1950);
    float _2110 = fma(_2070, _2100, _2070);
    float _2112 = _2102 * _2088;
    bool _2114 = _2104 >= 0.0;
    float _2116 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2108);
    float _2118 = _159 + _417;
    float _2120 = _2112 * (-2.0);
    float _2122 = fma(_2110, _1310, _2116);
    float _2124 = _2106 * 0.15915493667125701904296875;
    float _2126 = _2118 + (-1.0);
    float _2128 = fma(_2120, _1952, _1952);
    float _2130 = _2122 * 0.15915493667125701904296875;
    float _2132 = _417 + (-0.5);
    float _2134 = _2124 * 6.283185482025146484375;
    float _2136 = sin(_2134);
    float _2138 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2140 = _2074;
    if (_2114)
    {
        _2038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2142 = _2038;
    float _2144 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2128);
    int _2146 = as_type<int>(_2142);
    if (_2114)
    {
        out.m_55.x = 0.0;
    }
    float _2148 = fma(_2138, _2120, _2138);
    if (_2114)
    {
        float _2150 = _2142 * 5.0;
        _2146 = as_type<int>(_2150);
    }
    int _2152 = _2146;
    float _2154 = _2124 * 6.283185482025146484375;
    float _2156 = cos(_2154);
    float _2158 = fma(_2148, _1310, _2144);
    if (_2114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6498 = as_type<float>(_2152);
        out.gl_Position.z = _6498;
    }
    float _2160 = _2158 * 0.15915493667125701904296875;
    float _2162 = _2130 * 6.283185482025146484375;
    float _2164 = sin(_2162);
    float _2166 = _2130 * 6.283185482025146484375;
    float _2168 = cos(_2166);
    if (_2114)
    {
        return out;
    }
    float _2170 = _2160 * 6.283185482025146484375;
    float _2172 = cos(_2170);
    float _2174 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _2178 = _2136 * _2164;
    float _2180 = _2156 * _2168;
    float _2182 = _2174 * _1916;
    float _2184 = _2156 * _2164;
    float _2186 = _2136 * _2168;
    float _2188 = _2160 * 6.283185482025146484375;
    float _2190 = sin(_2188);
    float _2192 = _2182 * _2176;
    float _2194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    bool _2196 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2198 = isnan(0.5);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2204 = _2200 || _2202;
    float _2206 = _1936 * _2194;
    float _2208 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2210 = _2208 * 0.5;
    float _2212 = _2156 * _2172;
    float _2214 = _2168 * _2172;
    float _2216 = _2136 * _2172;
    float _2218 = _2164 * _2172;
    float _2220 = _2212 * _2192;
    float _2222 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2224 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2226 = isnan(0.5);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2232 = _2228 || _2230;
    float _2234 = fma(_2190, _2180, _2178);
    float _2236 = -_2192;
    float _2238 = _2190 * _2236;
    float _2240 = -_2186;
    float _2242 = fma(_2190, _2184, _2240);
    float _2244 = -_2184;
    float _2246 = fma(_2190, _2186, _2244);
    float _2248 = fma(_2234, _2206, _2220);
    float _2250 = _2216 * _2192;
    float _2252 = fma(_2214, _2206, _2238);
    float _2254 = fma(_2242, _2210, _2248);
    float _2256 = fma(_2190, _2178, _2180);
    float _2258 = fma(_2246, _2206, _2250);
    float _2260 = fma(_2218, _2210, _2252);
    float _2262 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2222);
    float _2266 = fma(_2256, _2210, _2258);
    float _2268 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2270 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2272 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2264);
    float _2274 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2276 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    float _2278 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2280 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2282 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2274);
    float _2284 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2286 = 1.0 / _2278;
    float _2288 = _2282 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2290 = _1160 + _2284;
    float _2292 = _1612 + _2288;
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2296 = _2290 + _2294;
    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2300 = _2292 + _2298;
    float _2302 = _2296 * _2296;
    float _2304 = fma(_2300, _2300, _2302);
    float _2306 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2280);
    float _2308 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2310 = sqrt(_2304);
    float _2312 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2306);
    float _2314 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2308);
    float _2316 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2318 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2314);
    float _2320 = _2316 + _2278;
    float _2322 = _2318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2324 = _2320 * _2286;
    float _2326 = _2324 * 0.5;
    float _2328 = _1622 + _2322;
    bool _2330 = _2310 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2334 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2332);
    float _2336 = 1.0 / _2334;
    float _2338 = _2320;
    float _2340 = _2260;
    float _2342 = _2326;
    float _2344 = _2334;
    if (!_2330)
    {
        _2338 = _2292;
    }
    float _2346 = _2338;
    float _2348 = _2346;
    if (!_2330)
    {
        _2340 = _2290;
    }
    float _2350 = _2340;
    float _2352 = _2350;
    if (!_2330)
    {
        _2342 = _2328;
    }
    float _2354 = _2342;
    bool _2356 = !_2330;
    float _2358 = _2354;
    if (!_2356)
    {
        float _2360 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2364 = _2310 + _2362;
        float _2366 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2368 = rsqrt(_2304);
        float _2370 = _2364 * _2360;
        float _2372 = _2370 * 0.15915493667125701904296875;
        float _2374 = _2372 * 6.283185482025146484375;
        float _2376 = cos(_2374);
        float _2378 = _2372 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = _2376 + (-1.0);
        float _2384 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2386 = fma(_2380, _2366, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2388 = fma(_2328, _2376, _2384);
        float _2390 = _2368 * _2386;
        float _2392 = fma(_2300, _2390, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2394 = fma(_2296, _2390, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2348 = _2392;
        _2358 = _2388;
        _2352 = _2394;
        _2344 = _2384;
    }
    float _2396 = _2348;
    float _2398 = _2358;
    float _2400 = _2352;
    float _2402 = _2344;
    float _2404 = -_1736;
    float _2406 = _2404 + _2396;
    float _2408 = -_1718;
    float _2410 = _2408 + _2398;
    float _2412 = -_1824;
    float _2414 = _2412 + _2400;
    float _2416 = _2402;
    float _2418 = _2410;
    float _2420 = _2406;
    float _2422 = _2414;
    if (_2232)
    {
        _2416 = 1.0;
    }
    float _2424 = _2416;
    float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2428 = _2336 * _2426;
    float _2430 = _2424;
    if (!_2204)
    {
        float _2432 = _2074 * _2074;
        float _2434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2436 = -_1160;
        float _2438 = _2436 + _2400;
        float _2440 = -_1622;
        float _2442 = _2440 + _2398;
        float _2444 = fma(_2084, _2084, _2432);
        float _2446 = -_1612;
        float _2448 = _2446 + _2396;
        float _2450 = fma(_2094, _2094, _2444);
        float _2452 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2454 = sqrt(_2450);
        float _2456 = 1.0 / _1916;
        float _2458 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2460 = precise::min(_2454, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2462 = _2460 * _2434;
        float _2464 = _2462 * _2456;
        float _2466 = _2458 * _2464;
        float _2468 = _2438 * _2464;
        float _2470 = fma(_2442, _2466, _2062);
        float _2472 = fma(_2448, _2466, _2066);
        float _2474 = fma(_2458, _2468, _2080);
        _2418 = _2470;
        _2420 = _2472;
        _2422 = _2474;
        _2140 = _2454;
        _1808 = _2448;
    }
    float _2476 = _2418;
    float _2478 = _2420;
    float _2480 = _2422;
    float _2482 = _2140;
    float _2484 = _1808;
    float _2486 = _2482;
    if (!_2232)
    {
        float _2488 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2490 = _2488 * 0.15915493667125701904296875;
        float _2492 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2494 = _2490 * 6.283185482025146484375;
        float _2496 = cos(_2494);
        float _2498 = _2492 * 0.15915493667125701904296875;
        float _2500 = _2490 * 6.283185482025146484375;
        float _2502 = sin(_2500);
        float _2504 = 1.0 / _2496;
        float _2506 = _2498 * 6.283185482025146484375;
        float _2508 = cos(_2506);
        float _2510 = _2502 * _2504;
        float _2512 = _2498 * 6.283185482025146484375;
        float _2514 = sin(_2512);
        float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2518 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2516;
        float _2520 = _2508 * _2510;
        float _2522 = 1.0 / _2520;
        float _2524 = 1.0 / _2518;
        float _2526 = _2514 * _2522;
        float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2530 = fma(_2428, _2526, _2528);
        float _2532 = _2530 * _2524;
        float _2534 = precise::clamp(_2532, 0.0, 1.0);
        _2486 = _2490;
        _2430 = _2534;
    }
    float _2536 = _2486;
    float _2538 = _2430;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2542 = _2476 + _2540;
    float _2544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2546 = _2478 + _2544;
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2550 = _2480 + _2548;
    float _2552 = fma(_2400, 6.2500002968590706586837768554688e-05, 0.5);
    float _2554 = _2542 * _2542;
    float _2556 = fma(_2546, _2546, _2554);
    float _2558 = fma(_2550, _2550, _2556);
    float _2560 = rsqrt(_2558);
    float _2562 = sqrt(_2558);
    float _2564 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2566 = _2546 * _2564;
    float _2568 = _2550 * _2564;
    float _2570 = _2566 * _2566;
    float _2572 = _2568 * _2568;
    float _2574 = _2570 + _2572;
    float _2576 = sqrt(_2574);
    bool _2578 = _2576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2582 = _2576 + _2580;
    float _2584 = _2550;
    float _2586 = _2582;
    float _2588 = _2536;
    float _2590 = _2542;
    if (_2578)
    {
        float _2592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2584 = _2592;
    }
    float _2594 = _2584;
    if (_2578)
    {
        float _2596 = _2582 * _2594;
        _2586 = _2596;
    }
    float _2598 = _2586;
    if (_2578)
    {
        float _2600 = _2598 * 0.15915493667125701904296875;
        _2588 = _2600;
    }
    float _2602 = _2588;
    float _2604 = _2560;
    float _2606 = _2602;
    if (_2578)
    {
        float _2608 = _2602 * 6.283185482025146484375;
        float _2610 = sin(_2608);
        _2604 = _2610;
    }
    float _2612 = _2604;
    float _2614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2616 = precise::max(0.0, _2614);
    float _2618 = _2484;
    float _2620 = _2616;
    if (_2578)
    {
        float _2622 = _2602 * 6.283185482025146484375;
        float _2624 = cos(_2622);
        _2618 = _2624;
    }
    float _2626 = _2618;
    float _2628 = -_2564;
    float _2630 = -_2616;
    float _2632 = fma(_2542, _2628, _2630);
    float _2634 = _2614;
    if (_2578)
    {
        float _2636 = rsqrt(_2574);
        _2634 = _2636;
    }
    float _2638 = _2634;
    if (_2578)
    {
        float _2640 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2620 = _2640;
    }
    float _2642 = _2620;
    float _2644 = _2642;
    if (!_2578)
    {
        _2606 = _2570;
    }
    float _2646 = _2606;
    float _2648 = _2612;
    float _2650 = _2646;
    if (_2578)
    {
        float _2652 = fma(_2612, _2642, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2644 = _2652;
    }
    float _2654 = _2644;
    float _2656 = _2654;
    if (!_2578)
    {
        _2648 = _2566;
    }
    float _2658 = _2648;
    float _2660 = _2658;
    if (_2578)
    {
        float _2662 = _2626 + (-1.0);
        _2590 = _2662;
    }
    float _2664 = _2590;
    float _2666 = _2664;
    if (_2578)
    {
        float _2668 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1810 = _2668;
    }
    float _2670 = _1810;
    if (!_2578)
    {
        _2666 = _2572;
    }
    float _2672 = _2666;
    float _2674 = _2638;
    float _2676 = _2672;
    if (_2578)
    {
        float _2678 = _2638 * _2654;
        _2006 = _2678;
    }
    float _2680 = _2006;
    if (!_2578)
    {
        _2674 = _2632;
    }
    float _2682 = _2674;
    float _2684 = _2682;
    if (_2578)
    {
        float _2686 = fma(_2632, _2626, _2670);
        _2684 = _2686;
    }
    float _2688 = _2684;
    if (!_2578)
    {
        _2656 = _2568;
    }
    float _2690 = _2656;
    float _2692 = _2690;
    if (_2578)
    {
        float _2694 = _2566 * _2680;
        _2660 = _2694;
    }
    float _2696 = _2660;
    if (_2578)
    {
        float _2698 = _2568 * _2680;
        _2692 = _2698;
    }
    float _2700 = _2692;
    if (_2578)
    {
        float _2702 = _2696 * _2696;
        _2650 = _2702;
    }
    float _2704 = _2650;
    if (_2578)
    {
        float _2706 = _2700 * _2700;
        _2676 = _2706;
    }
    float _2708 = _2676;
    float _2710 = fma(_2066, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2712 = fma(_2688, _2688, _2704);
    float _2714 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2718 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2716);
    float _2720 = precise::clamp(_2718, 0.0, 1.0);
    float _2722 = _2712 + _2708;
    float _2724 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2714);
    float _2726 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2728 = floor(_2710);
    float _2730 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2724);
    float _2732 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2734 = rsqrt(_2722);
    float _2736 = floor(_2732);
    float _2738 = -_2728;
    float _2740 = _2710 + _2738;
    float _2742 = _2734 * _2696;
    float _2744 = _2734 * _2688;
    float _2746 = _2734 * _2700;
    float _2748 = -_2720;
    float _2750 = _2748 + 1.0;
    float _2752 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2754 = _2730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2756 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2758 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2760 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2752);
    float _2762 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2764 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2756);
    float _2766 = abs(_2750);
    float _2768 = log2(_2766);
    float _2770 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2760);
    float _2772 = -_2758;
    float _2774 = fma(_2744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2772);
    float _2776 = -_2762;
    float _2778 = fma(_2776, _2726, 1.0);
    float _2780 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2782 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2764);
    float _2784 = _2770 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2786 = -_2746;
    float _2788 = fma(_2786, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2774);
    float _2790 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2780);
    float _2792 = _2782 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2794 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2796 = fma(_2788, -0.5, 0.5);
    float _2798 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2790);
    float _2800 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2794);
    float _2802 = fma(_2788, 0.5, 0.5);
    float _2804 = _2798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2806 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2808 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2800);
    float _2810 = fma(_2802, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2812 = log2(_2778);
    float _2814 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2816 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2808);
    float _2818 = fma(_2802, _2810, -0.212114393711090087890625);
    float _2820 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2822 = -_2736;
    float _2824 = _2732 + _2822;
    float _2826 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2814);
    float _2828 = _2744 + 1.0;
    float _2830 = exp2(_2806);
    float _2832 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2820);
    float _2834 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2826);
    float _2836 = fma(_2802, _2818, 1.570728778839111328125);
    float _2838 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2832);
    float _2840 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2834);
    float _2842 = 1.0 / _2816;
    float _2844 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2838);
    float _2846 = _2812 * 0.693147182464599609375;
    float _2848 = sqrt(_2796);
    float _2850 = -_2744;
    float _2852 = fma(_2830, _2828, _2850);
    float _2854 = fma(_2396, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _7615 = float2(_2740, _2824);
    float _2856 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7615, float2(0.0), isnan(_7615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7615, float2(0.0), isnan(_7615)), level(0.0)).x;
    float _2858 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2860 = fma(_2852, 0.5, 0.5);
    float _2862 = _2840 * _2842;
    float _2864 = _2844 * _2842;
    float _2866 = fma(_2862, 0.5, 0.5);
    float _2868 = fma(_2864, -0.5, 0.5);
    float _2870 = _2848 * 0.636619746685028076171875;
    float _2872 = -_2836;
    float _2874 = fma(_2870, _2872, 1.0);
    float3 _7650 = float3(_2866, _2868, _2858);
    float _2876 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7650, float3(0.0), isnan(_7650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7650, float3(0.0), isnan(_7650)), level(0.0)).x;
    float3 _7661 = float3(_2866, _2868, _2858);
    float4 _2879 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7661, float3(0.0), isnan(_7661)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7661, float3(0.0), isnan(_7661)), level(0.0)).xyzw;
    float _2881 = _2879.x;
    float _2883 = _2879.y;
    float _2885 = _2879.z;
    float _2887 = _2879.w;
    float2 _7677 = float2(_2874, _2860);
    float3 _2891 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7677, float2(0.0), isnan(_7677)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7677, float2(0.0), isnan(_7677)), level(0.0)).xyz;
    float _2893 = _2891.x;
    float _2895 = _2891.y;
    float _2897 = _2891.z;
    float2 _7691 = float2(_2854, _2552);
    float3 _2899 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_7691, float2(0.0), isnan(_7691)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_7691, float2(0.0), isnan(_7691)), level(0.0)).xyz;
    float _2901 = _2899.x;
    float _2903 = _2899.y;
    float _2905 = _2899.z;
    float _2907 = abs(_2428);
    float _2909 = log2(_2907);
    float _2911 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2913 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2915 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2917 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2919 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2911);
    float _2921 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2923 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2925 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2927 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2913);
    float _2929 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2915);
    float _2931 = -_2190;
    float _2933 = fma(_2931, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2921);
    float _2935 = -_2190;
    float _2937 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2925);
    float _2939 = -_2190;
    float _2941 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2917);
    float _2943 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2945 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2947 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2949 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2951 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2943);
    float _2953 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2945);
    float _2955 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2949);
    float _2957 = exp2(_2947);
    float _2959 = fma(_2923, _2923, 1.0);
    float _2961 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2963 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2937);
    float _2965 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2933);
    float _2967 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2941);
    float _2969 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2919);
    float _2971 = rsqrt(_2959);
    float _2973 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2961);
    float _2975 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2977 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2951);
    float _2979 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2953);
    float _2981 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2955);
    float _2983 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2973);
    float _2985 = _2923 * _2963;
    float _2987 = fma(_2957, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2989 = precise::clamp(_2987, 0.0, 1.0);
    float _2991 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2927);
    float _2993 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2929);
    float _2995 = fma(_2975, _2969, _2985);
    float _2997 = fma(_2989, -2.0, 3.0);
    float _2999 = _2989 * _2989;
    bool _3001 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3003 = isnan(_2562);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3009 = _3005 || _3007;
    out.m_84.x = _2969;
    out.m_84.y = _2991;
    out.m_84.z = _2993;
    float _3011 = _2923 * _2971;
    float _3013 = _2999 * _2997;
    float _3015 = _2923 * _2965;
    float _3017 = _2923 * _2967;
    float _3019 = -_2977;
    float _3021 = _3011 * _3019;
    float _3023 = -_3013;
    float _3025 = _3023 + 1.0;
    float _3027 = -_2981;
    float _3029 = _3011 * _3027;
    float _3031 = fma(_2975, _2991, _3015);
    float _3033 = fma(_2971, _2963, _3021);
    float _3035 = fma(_3025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3013);
    float _3037 = -_2979;
    float _3039 = _3011 * _3037;
    float _3041 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2983);
    float _3043 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3045 = fma(_2971, _2967, _3029);
    float _3047 = fma(_2971, _2965, _3039);
    bool _3049 = _2428 <= 8000.0;
    bool _3051 = isnan(_2428);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan(8000.0);
    bool _3057 = _3053 || _3055;
    float _3059 = float(_3057);
    float _3061 = in.m_86.x;
    float _3063 = fma(_2975, _2993, _3017);
    float _3065 = exp2(_3043);
    float _3067 = _3059 * _3035;
    float _3069 = _2979 + _3031;
    float _3071 = _2816 * 0.5;
    out.gl_Position.x = _2840;
    out.gl_Position.y = _2844;
    out.gl_Position.z = _3041;
    out.gl_Position.w = _2816;
    float _3073 = _3067 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3075 = _3041 + _2816;
    float _3077 = fma(_2844, -0.5, _3071);
    out.m_88.x = _3033;
    out.m_88.y = _3047;
    out.m_88.z = _3045;
    float _3079 = _2840 + _2816;
    float _3081 = _2977 + _2995;
    float _3083 = _2981 + _3063;
    float _3085 = _3075 * 0.5;
    float _3087 = _3079 * 0.5;
    float _3089 = -_3065;
    float _3091 = _3089 + 1.0;
    out.m_90.x = _3081;
    out.m_90.y = _3069;
    out.m_90.z = _3083;
    float _3093 = _3091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3095 = _3045;
    float _3097 = _3047;
    float _3099 = _2816;
    float _3101 = _3077;
    if (!_3009)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3103 = _3095;
    out.m_92.x = _3087;
    out.m_92.y = _3077;
    out.m_92.z = _3085;
    out.m_92.w = _2816;
    float _3105 = _3103;
    float _3107 = _3103;
    if (!_3009)
    {
        _3097 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3109 = _3097;
    float _3111 = -_3093;
    float _3113 = _3111 + 1.0;
    float _3115 = _2538 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3117 = _3113;
    float _3119 = _3109;
    float _3121 = _3109;
    if (!_3009)
    {
        _3099 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3123 = _3099;
    float _3125 = _3123;
    float _3127 = _3123;
    if (!_3009)
    {
        _3101 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3129 = _3101;
    float _3131 = -_2856;
    float _3133 = _3131 + 1.0;
    float _3135 = _3133 * _3073;
    float _3137 = precise::clamp(_3135, 0.0, 1.0);
    float _3139 = -_3137;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3143 = _3141 * _3061;
    float _3145 = _3143 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3147 = _3093 * _2876;
    float _3149 = _2887 * _3113;
    out.m_94.x = _3145;
    float _3151 = _2901;
    float _3153 = _3129;
    float _3155 = _3129;
    if (!_3009)
    {
        _3117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3157 = _3117;
    float _3159 = _2887 * _3147;
    float _3161 = _2897 * _3147;
    float _3163 = fma(_2893, _3159, _2881);
    float _3165 = fma(_2895, _3159, _2883);
    float _3167 = fma(_2887, _3161, _2885);
    out.m_96.x = _3163;
    out.m_96.y = _3165;
    out.m_96.z = _3167;
    out.m_96.w = _3149;
    out.m_98.x = _2901;
    out.m_98.y = _2903;
    out.m_98.z = _2905;
    float _3169 = _3157;
    float _3171 = _3157;
    if (!_3009)
    {
        _3151 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3173 = _3151;
    bool _3175 = !_3009;
    float _3177 = _3173;
    float _3179 = _3173;
    if (!_3175)
    {
        bool _3181 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3183 = isnan(_2562);
        bool _3185 = _3181 || _3183;
        bool _3187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3189 = _3185 || _3187;
        if (!_3189)
        {
            float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3193 = _2562 + _3191;
            float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3197 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3195;
            float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3203 = 1.0 / _3197;
            float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3221 = _3193 * _3203;
            float _3223 = precise::clamp(_3221, 0.0, 1.0);
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3227 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3229 = fma(_3223, _3201, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3231 = fma(_3223, _3227, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3233 = fma(_3223, _3207, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3235 = fma(_3223, _3211, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3237 = fma(_3223, _3215, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3239 = fma(_3223, _3219, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3127 = _3233;
            _3171 = _3237;
            _3107 = _3229;
            _3121 = _3235;
            _3155 = _3231;
            _3179 = _3239;
            _3241 = true;
        }
        else
        {
            bool _3243 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3245 = isnan(_2562);
            bool _3247 = _3243 || _3245;
            bool _3249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3251 = _3247 || _3249;
            if (!_3251)
            {
                _3105 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3253 = _3105;
            _3107 = _3253;
            if (!_3251)
            {
                _3125 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3255 = _3125;
            _3127 = _3255;
            if (!_3251)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3257 = _3153;
            _3155 = _3257;
            if (!_3251)
            {
                _3119 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3259 = _3119;
            _3121 = _3259;
            if (!_3251)
            {
                _3169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3261 = _3169;
            _3171 = _3261;
            if (!_3251)
            {
                _3177 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3263 = _3177;
            bool _3265 = !_3251;
            _3179 = _3263;
            if (!_3265)
            {
                bool _3267 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3269 = isnan(_2562);
                bool _3271 = _3267 || _3269;
                bool _3273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3275 = _3271 || _3273;
                if (!_3275)
                {
                    float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3279 = _2562 + _3277;
                    float _3281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3283 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3281;
                    float _3285 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3287 = _3285 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3289 = 1.0 / _3283;
                    float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3293 = _3291 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3297 = _3295 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3299 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3301 = _3299 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3303 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3305 = _3303 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3307 = _3279 * _3289;
                    float _3309 = precise::clamp(_3307, 0.0, 1.0);
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3315 = fma(_3309, _3287, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3317 = fma(_3309, _3313, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3319 = fma(_3309, _3293, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3321 = fma(_3309, _3297, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3323 = fma(_3309, _3301, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3325 = fma(_3309, _3305, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3127 = _3319;
                    _3171 = _3323;
                    _3107 = _3315;
                    _3121 = _3321;
                    _3155 = _3317;
                    _3179 = _3325;
                    _3241 = true;
                }
                else
                {
                    _3127 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3107 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3121 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3179 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3241 = false;
    float _3327 = _3127;
    float _3329 = _3171;
    float _3331 = _3107;
    float _3333 = _3121;
    float _3335 = _3155;
    float _3337 = _3179;
    float _3339 = fma(_3069, -0.5, 0.5);
    float _3341 = precise::clamp(_3339, 0.0, 1.0);
    float _3343 = -_3327;
    float _3345 = _3343 + _3329;
    float _3347 = -_3331;
    float _3349 = _3347 + _3333;
    out.m_100.x = 0.0;
    float _3351 = fma(_3341, _3345, _3327);
    float _3353 = -_3335;
    float _3355 = _3353 + _3337;
    float _3357 = fma(_3341, _3349, _3331);
    float _3359 = _3351 * 0.586610972881317138671875;
    bool _3361 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3363 = fma(_3341, _3355, _3335);
    float _3365 = _3115 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3367 = fma(_3357, 0.298911988735198974609375, _3359);
    bool _3369 = _2538 > 0.0;
    bool _3371 = isnan(_2538);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan(0.0);
    bool _3377 = _3373 || _3375;
    float _3379 = fma(_3363, 0.114477999508380889892578125, _3367);
    out.m_55.x = _3365;
    float _3381 = -_3379;
    float _3383 = _3357 + _3381;
    float _3385 = -_3379;
    float _3387 = _3351 + _3385;
    float _3389 = -_3379;
    float _3391 = _3363 + _3389;
    float _3393 = fma(_3383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3379);
    float _3395 = fma(_3387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3379);
    float _3397 = fma(_3391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3379);
    bool _3399 = !_3361;
    if (!_3399)
    {
        float _3401 = -_2476;
        float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3405 = -_2478;
        float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3409 = -_2480;
        float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3413 = _3403 * _3403;
        float _3415 = fma(_3407, _3407, _3413);
        float _3417 = fma(_3411, _3411, _3415);
        float _3419 = sqrt(_3417);
        float _3421 = rsqrt(_3417);
        float _3423 = -_3419;
        float _3425 = _3423 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3427 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3429 = precise::clamp(_3427, 0.0, 1.0);
        float _3431 = _3407 * _3421;
        float _3433 = _3403 * _3421;
        float _3435 = abs(_3429);
        float _3437 = log2(_3435);
        float _3439 = _3411 * _3421;
        float _3441 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3443 = _3069 * _3433;
        float _3445 = -_3433;
        float _3447 = -_3441;
        float _3449 = fma(_3445, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3447);
        float _3451 = fma(_3081, _3431, _3443);
        float _3453 = -_3439;
        float _3455 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3449);
        float _3457 = fma(_3083, _3439, _3451);
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3463 = _3455 + _3461;
        float _3465 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3467 = _3463 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3469 = precise::clamp(_3467, 0.0, 1.0);
        float _3471 = exp2(_3465);
        float _3473 = _3471 * _3469;
        float _3475 = _3459 * _3473;
        float _3477 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3479 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3481 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3477;
        out.m_100.y = _3479;
        out.m_100.z = _3481;
    }
    out.m_102.x = _3393;
    out.m_102.y = _3395;
    out.m_102.z = _3397;
    if (_3377)
    {
        return out;
    }
    float _3483 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_55.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3483;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3241 = false;
    bool _219 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _116 = in.m_48.w;
    float _118 = in.m_50.w;
    float _120 = trunc(_116);
    int _123 = int(_120);
    float _125 = -_118;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _127;
    bool _131 = _123 >= 1;
    float _133 = 0.0;
    float _135 = as_type<float>(_123);
    float _137 = _127;
    if (!_131)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _133;
    if (!_131)
    {
        out.m_55.x = 0.0;
    }
    int _141 = 0;
    if (!_131)
    {
        float _143 = _139 * 5.0;
        _141 = as_type<int>(_143);
    }
    int _145 = _141;
    int _147 = _145;
    if (!_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3552 = as_type<float>(_145);
        out.gl_Position.z = _3552;
    }
    if (!_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _149 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _151 = isnan(_118);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _157 = _153 || _155;
    float _159 = in.m_57.x;
    float _161 = float(_123);
    bool _163 = _127 >= _161;
    bool _165 = !_157;
    bool _167 = _163 || _165;
    float _169 = 1.0 / _161;
    if (_167)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _135;
    if (_167)
    {
        out.m_55.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _147 = as_type<int>(_173);
    }
    int _175 = _147;
    float _177 = _127 * _169;
    out.m_59.x = _159;
    float _179 = _177;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3617 = as_type<float>(_175);
        out.gl_Position.z = _3617;
    }
    out.m_53.x = _177;
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _181 = as_type<float>(int(gl_VertexIndex));
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _185 = as_type<int>(_181) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_181) & 2;
    bool _191 = _189 != 0;
    bool _193 = !_187;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_183;
    float _217;
    if (!_201)
    {
        float _203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _205 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _207 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _209 = _207 * _203;
        float _211 = floor(_209);
        float _213 = -_211;
        float _215 = _209 + _213;
        _217 = _215;
        _219 = true;
    }
    else
    {
        _217 = _177;
    }
    _219 = false;
    float _221 = _217;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = _221 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _229 = _221 + _227;
    bool _231 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _233 = isnan(_221);
    bool _235 = _231 || _233;
    bool _237 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _239 = _235 || _237;
    float _241 = float(_239);
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    float _255 = -_241;
    float _257 = _255 + 1.0;
    float _259 = 1.0 / _245;
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _263 = 1.0 / _249;
    float _265 = 1.0 / _253;
    float _267 = _225 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _271 = _221 + _269;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _273;
    float _277 = fma(_275, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = _271 * _263;
    bool _281 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _283 = isnan(_221);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = _291 * _257;
    bool _299 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _301 = isnan(_221);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = _229 * _265;
    bool _313 = _221 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _315 = isnan(_221);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -_291;
    float _327 = _325 + 1.0;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _333 = fma(_295, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _339 = -_323;
    float _341 = _339 + 1.0;
    float _343 = _323 * _327;
    float _345 = fma(_331, _279, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = _309 * _341;
    float _349 = in.m_64.x;
    float _351 = in.m_64.y;
    float _353 = -_309;
    float _355 = _353 + 1.0;
    float _357 = fma(_337, _279, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _359 = _277 * _347;
    float _361 = _333 * _347;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _363;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _367;
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _373 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _361);
    float _375 = fma(_365, _311, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _377 = fma(_369, _311, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _379 = fma(_357, _343, _371);
    float _381 = fma(_345, _343, _373);
    float _383 = fma(_375, _297, _379);
    float _385 = fma(_377, _297, _381);
    float _387 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].x, _383);
    float _389 = fma(_241, (*spvDescriptorSet0.vp_c9)._m0[146].y, _385);
    float _391 = _387 * _349;
    float _393 = _389 * _351;
    bool _395 = !_261;
    if (!_395)
    {
        float _397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _399 = _159 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _401 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _403 = _401 * _397;
        float _405 = floor(_403);
        float _407 = -_405;
        float _409 = _403 + _407;
        _179 = _409;
    }
    float _411 = _179;
    float _413 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _415 = int(_413);
    float _417 = in.m_57.z;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _425 = int(_423);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _429 = float(_415);
    float _431 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _433 = int(_431);
    float _435 = float(_425);
    float _437 = 1.0 / _429;
    float _439 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _441 = int(_439);
    float _443 = float(uint(_433));
    float _445 = 1.0 / _435;
    float _447 = _437 * _127;
    float _449 = float(uint(_441));
    float _451 = 1.0 / _443;
    int _453 = ~_441;
    int _455 = _453 + 1;
    int _457 = ~_441;
    int _459 = _457 + 1;
    float _461 = _445 * _127;
    float _463 = trunc(_447);
    int _465 = int(_463);
    float _467 = 1.0 / _449;
    int _469 = as_type<int>(_451) + (-2);
    float _471 = trunc(_461);
    int _473 = int(_471);
    float _475 = float(uint(_465));
    float _477 = as_type<float>(_469) * _475;
    float _479 = _475;
    if (_421)
    {
        _479 = 1.0;
    }
    float _481 = _479;
    float _483 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _485 = log2(_483);
    int _487 = as_type<int>(_467) + (-2);
    float _489 = _481;
    if (!_421)
    {
        _489 = 7.345489978790283203125;
    }
    float _491 = _489;
    float _493 = float(uint(_473));
    float _495 = trunc(_477);
    float _497 = precise::max(_495, 0.0);
    uint _500 = uint(_497);
    float _502 = _491 * _159;
    float _504 = as_type<float>(_487) * _493;
    int _506 = ~_433;
    int _508 = _506 + 1;
    float _510 = trunc(_504);
    float _512 = precise::max(_510, 0.0);
    uint _514 = uint(_512);
    int _516 = _508 * int(_500);
    int _518 = _516 + _465;
    float _520 = floor(_502);
    float _522 = float(uint(_518));
    float _524 = as_type<float>(_518);
    float _526 = _522;
    if (_421)
    {
        _524 = 1.0;
    }
    float _528 = _524;
    int _530 = _455 * int(_514);
    int _532 = _530 + _473;
    float _534 = _528;
    if (!_421)
    {
        _534 = 5.839270114898681640625;
    }
    float _536 = _534;
    float _538 = as_type<float>(_469) * _522;
    if (_421)
    {
        _526 = _159;
    }
    float _540 = _526;
    float _542 = float(uint(_532));
    float _544 = trunc(_538);
    float _546 = precise::max(_544, 0.0);
    uint _548 = uint(_546);
    float _550 = _540;
    if (!_421)
    {
        _550 = _417;
    }
    float _552 = _550;
    float _554 = -_520;
    float _556 = _502 + _554;
    float _558 = as_type<float>(_487) * _542;
    float _560 = _536 * _552;
    float _562 = float(_433);
    float _564 = float(_465);
    float _566 = trunc(_558);
    float _568 = precise::max(_566, 0.0);
    uint _570 = uint(_568);
    float _572 = _556 * _562;
    bool _574 = _564 >= _562;
    bool _576 = isnan(_564);
    bool _578 = _574 || _576;
    bool _580 = isnan(_562);
    bool _582 = _578 || _580;
    float _584 = float(_582);
    float _586 = float(_473);
    int _588 = int(_500) + int(_548);
    float _590 = floor(_560);
    int _592 = ~_433;
    int _594 = _592 + 1;
    int _596 = ~_441;
    int _598 = _596 + 1;
    int _600 = _594 * _588;
    int _602 = _600 + _465;
    int _604 = int(_514) + int(_570);
    bool _606 = uint(_602) >= uint(_433);
    float _608 = _169 * _127;
    int _610 = _598 * _604;
    int _612 = _610 + _473;
    float _614 = float(_441);
    float _616 = -_590;
    float _618 = _560 + _616;
    float _620 = trunc(_584);
    int _622 = int(_620);
    bool _624 = uint(_612) >= uint(_441);
    bool _626 = _586 >= _614;
    bool _628 = isnan(_586);
    bool _630 = _626 || _628;
    bool _632 = isnan(_614);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _562 * _608;
    bool _640 = !_606;
    int _642 = _640 ? 0 : (-1);
    float _644 = _614 * _608;
    bool _646 = !_624;
    int _648 = _646 ? 0 : (-1);
    float _650 = trunc(_636);
    int _652 = int(_650);
    int _654 = ~_588;
    int _656 = _654 + _642;
    int _658 = _656 + 1;
    float _660 = _618 * _614;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _664 = _662 != 0;
    int _666 = ~_604;
    int _668 = _666 + _648;
    int _670 = _668 + 1;
    int _672 = _433 * _658;
    int _674 = _672 + _465;
    bool _676 = _433 == 0;
    float _678 = trunc(_572);
    int _680 = int(_678);
    bool _682 = !_664;
    int _684 = _682 ? 0 : 1;
    int _686 = _441 * _670;
    int _688 = _686 + _473;
    int _690 = ~_622;
    int _692 = _690 + 1;
    int _694 = _692 + 1;
    int _696 = abs(_684);
    bool _698 = !_676;
    int _700 = _698 ? _674 : (-1);
    float _702 = trunc(_638);
    int _704 = int(_702);
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _712 = _710 != 0;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _716 = _714 != 0;
    bool _718 = _441 == 0;
    int _720 = _700 * _694;
    int _722 = _433 + (-1);
    int _724 = ~_652;
    int _726 = _724 + 1;
    int _728 = _726 + 1;
    int _730 = _680 * _696;
    int _732 = _730 + _465;
    bool _734 = !_718;
    int _736 = _734 ? _688 : (-1);
    int _738 = _622 * _722;
    int _740 = _738 + _720;
    bool _742 = !_712;
    int _744 = _742 ? 0 : 1;
    float _746 = trunc(_644);
    int _748 = int(_746);
    int _750 = _441 + (-1);
    int _752 = _736 * _728;
    int _754 = abs(_744);
    bool _756 = !_708;
    int _758 = _756 ? 0 : 1;
    int _760 = _652 * _750;
    int _762 = _760 + _752;
    int _764 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _766 = _764 != 0;
    int _768 = _740 * _754;
    bool _770 = !_716;
    int _772 = _770 ? 0 : 1;
    int _774 = abs(_758);
    bool _776 = !_766;
    int _778 = _776 ? 0 : 1;
    int _780 = abs(_772);
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _788 = _786 != 0;
    int _790 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _792 = _790 != 0;
    float _794 = trunc(_660);
    int _796 = int(_794);
    int _798 = abs(_778);
    int _800 = _704 * _774;
    int _802 = _800 + _768;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _806 = _804 != 0;
    bool _808 = !_788;
    int _810 = _808 ? 0 : 1;
    int _812 = _732 * _780;
    int _814 = _812 + _802;
    bool _816 = !_806;
    int _818 = _816 ? 0 : 1;
    float _820 = in.m_66.x;
    float _822 = in.m_66.y;
    float _824 = in.m_66.z;
    float _826 = in.m_66.w;
    int _828 = abs(_810);
    int _830 = _680 * _798;
    int _832 = _830 + _814;
    int _834 = abs(_818);
    bool _836 = !_784;
    int _838 = _836 ? 0 : 1;
    int _840 = _796 * _834;
    int _842 = _840 + _473;
    bool _844 = !_792;
    int _846 = _844 ? 0 : 1;
    int _848 = _762 * _828;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _852 = _850 != 0;
    int _854 = abs(_838);
    int _856 = abs(_846);
    float _858 = float(uint(_832));
    int _860 = _748 * _854;
    int _862 = _860 + _848;
    bool _864 = !_852;
    int _866 = _864 ? 0 : 1;
    float _868 = as_type<float>(_469) * _858;
    int _870 = abs(_866);
    int _872 = ~_441;
    int _874 = _872 + 1;
    int _876 = _842 * _856;
    int _878 = _876 + _862;
    int _880 = ~_433;
    int _882 = _880 + 1;
    float _884 = trunc(_868);
    float _886 = precise::max(_884, 0.0);
    uint _888 = uint(_886);
    int _890 = ~_441;
    int _892 = _890 + 1;
    int _894 = _796 * _870;
    int _896 = _894 + _878;
    float _898 = float(uint(_896));
    float _900 = as_type<float>(_487) * _898;
    int _902 = _882 * int(_888);
    int _904 = _902 + _832;
    float _906 = trunc(_900);
    float _908 = precise::max(_906, 0.0);
    uint _910 = uint(_908);
    float _912 = float(uint(_904));
    float _914 = as_type<float>(_469) * _912;
    float _916 = trunc(_914);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    int _922 = _874 * int(_910);
    int _924 = _922 + _896;
    float _926 = float(uint(_924));
    int _928 = ~_433;
    int _930 = _928 + 1;
    float _932 = float(uint(_732));
    float _934 = as_type<float>(_487) * _926;
    int _936 = int(_888) + int(_920);
    float _938 = as_type<float>(_469) * _932;
    float _940 = trunc(_934);
    float _942 = precise::max(_940, 0.0);
    uint _944 = uint(_942);
    int _946 = _930 * _936;
    int _948 = _946 + _832;
    bool _950 = uint(_948) >= uint(_433);
    float _952 = trunc(_938);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    bool _958 = !_950;
    int _960 = _958 ? 0 : (-1);
    int _962 = ~_936;
    int _964 = _962 + _960;
    int _966 = _964 + 1;
    int _968 = int(_910) + int(_944);
    int _970 = _433 * _966;
    int _972 = _970 + _832;
    int _974 = _892 * _968;
    int _976 = _974 + _896;
    bool _978 = !_676;
    int _980 = _978 ? _972 : (-1);
    bool _982 = uint(_976) >= uint(_441);
    int _984 = _980 & 3;
    bool _986 = _984 != 0;
    float _988 = in.m_68.x;
    float _990 = in.m_68.y;
    float _992 = in.m_68.z;
    float _994 = in.m_68.w;
    bool _996 = !_982;
    int _998 = _996 ? 0 : (-1);
    bool _1000 = uint(_984) > 1u;
    int _1002 = ~_968;
    int _1004 = _1002 + _998;
    int _1006 = _1004 + 1;
    int _1008 = _980 & 3;
    bool _1010 = _1008 != 0;
    int _1012 = _441 * _1006;
    int _1014 = _1012 + _896;
    int _1016 = _1010 ? 0 : 1;
    float _1018 = in.m_70.x;
    float _1020 = in.m_70.y;
    float _1022 = in.m_70.z;
    float _1024 = in.m_70.w;
    bool _1026 = uint(_984) >= 2u;
    bool _1028 = !_718;
    int _1030 = _1028 ? _1014 : (-1);
    int _1032 = ~_1016;
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    int _1038 = _1036;
    if (!_1000)
    {
        int _1040 = ~_1016;
        int _1042 = _1040 + 1;
        _1038 = _1042;
    }
    int _1044 = _1038;
    int _1046 = _1030 & 3;
    bool _1048 = _1046 != 0;
    float _1050 = in.m_48.x;
    float _1052 = in.m_48.y;
    float _1054 = in.m_48.z;
    int _1056 = _1030 & 3;
    bool _1058 = _1056 != 0;
    int _1060 = _1026 ? 0 : 1;
    bool _1062 = uint(_1046) > 1u;
    int _1064 = _1058 ? 0 : 1;
    bool _1066 = uint(_1046) >= 2u;
    bool _1068 = _984 != 3;
    int _1070 = _1066 ? 0 : 1;
    bool _1072 = _1046 != 3;
    int _1074 = ~_1064;
    int _1076 = _1074 + 1;
    int _1078 = _1076 + 1;
    int _1080 = ~_1060;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    int _1086 = _1078;
    int _1088 = _1084;
    if (!_1062)
    {
        int _1090 = ~_1064;
        int _1092 = _1090 + 1;
        _1086 = _1092;
    }
    int _1094 = _1086;
    float _1096 = in.m_57.y;
    if (_1068)
    {
        int _1098 = ~_1060;
        int _1100 = _1098 + 1;
        _1088 = _1100;
    }
    int _1102 = _1088;
    float _1104 = _1052 * _990;
    int _1106 = ~_433;
    int _1108 = _1106 + 1;
    float _1110 = _1052 * _1020;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1114 = _1112 != 0;
    float _1116 = _1052 * _822;
    bool _1118 = _159 > 0.5;
    int _1120 = _1108 * int(_956);
    int _1122 = _1120 + _732;
    int _1124 = ~_1070;
    int _1126 = _1124 + 1;
    int _1128 = _1126 + 1;
    float _1130 = fma(_1050, _988, _1104);
    int _1132 = _1128;
    if (_1072)
    {
        int _1134 = ~_1070;
        int _1136 = _1134 + 1;
        _1132 = _1136;
    }
    int _1138 = _1132;
    float _1140 = fma(_1050, _820, _1116);
    bool _1142 = !_1114;
    int _1144 = _1142 ? 0 : 1;
    float _1146 = -_195;
    int _1148 = _1118 ? as_type<int>(_1146) : as_type<int>(_195);
    float _1150 = fma(_1054, _824, _1140);
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1158 = _1156 != 0;
    float _1160 = _1150 + _826;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1164 = _1162 != 0;
    float _1166 = _485 * _127;
    float _1168 = float(uint(_1122));
    float _1170 = fma(_1050, _1018, _1110);
    float _1172 = float(uint(_842));
    float _1174 = exp2(_1166);
    bool _1176 = !_1158;
    float _1178 = _1176 ? _195 : as_type<float>(_1148);
    float _1180 = _159 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1182 = as_type<float>(_469) * _1168;
    float _1184 = as_type<float>(_487) * _1172;
    bool _1186 = _1096 > 0.5;
    float _1188 = -_427;
    float _1190 = fma(_1180, 2.0, _1188);
    float _1192 = trunc(_1182);
    float _1194 = precise::max(_1192, 0.0);
    uint _1196 = uint(_1194);
    float _1198 = -_199;
    int _1200 = _1186 ? as_type<int>(_1198) : as_type<int>(_199);
    float _1202 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1204 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1206 = isnan(0.0);
    bool _1208 = _1204 || _1206;
    bool _1210 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1212 = _1208 || _1210;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1216 = -_127;
    float _1218 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1190);
    float _1220 = trunc(_1184);
    float _1222 = precise::max(_1220, 0.0);
    uint _1224 = uint(_1222);
    float _1226 = -_1174;
    float _1228 = _1226 + 1.0;
    float _1230 = fma(_159, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1214);
    int _1232 = ~_433;
    int _1234 = _1232 + 1;
    float _1236 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1238 = !_1164;
    float _1240 = _1238 ? _199 : as_type<float>(_1200);
    float _1242 = fma(_1054, _992, _1130);
    float _1244 = _1212 ? _1228 : 0.0;
    float _1246 = fma(_1202, -2.0, _1236);
    bool _1248 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1250 = isnan(1.0);
    bool _1252 = _1248 || _1250;
    bool _1254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1256 = _1252 || _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1260 = 1.0 + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1264 = _1262 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1266 = int(_956) + int(_1196);
    float _1268 = _159 * 2.0;
    int _1270 = _459 * int(_1224);
    int _1272 = _1270 + _842;
    float _1274 = 1.0 / _1260;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1280 = _1278 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1282 = float(uint(_1272));
    float _1284 = fma(_1096, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1276);
    float _1286 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1230);
    float _1288 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1246);
    float _1290 = floor(_1268);
    float _1292 = as_type<float>(_487) * _1282;
    float _1294 = _1096 * 2.0;
    int _1296 = _1234 * _1266;
    int _1298 = _1296 + _732;
    float _1300 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1284);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1306 = floor(_1294);
    if (_1256)
    {
        float _1308 = _1244 * _1274;
        _137 = _1308;
    }
    float _1310 = _137;
    bool _1312 = uint(_1298) >= uint(_433);
    float _1314 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1318 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1320 = trunc(_1292);
    float _1322 = precise::max(_1320, 0.0);
    uint _1324 = uint(_1322);
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1332 = _1290 >= 0.0;
    bool _1334 = isnan(_1290);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = _1178 + 0.5;
    float _1344 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1346 = 1.0 / _1280;
    bool _1348 = !_986;
    int _1350 = _1348 ? 0 : 1;
    float _1352 = -_1286;
    float _1354 = _1352 + 1.0;
    bool _1356 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1358 = isnan(_411);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1364 = _1360 || _1362;
    float _1366 = float(_1364);
    int _1368 = abs(_1094);
    int _1370 = abs(_1102);
    float _1372 = 1.0 / _1330;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1376 = !_1312;
    int _1378 = _1376 ? 0 : (-1);
    float _1380 = -_1366;
    float _1382 = _1380 + 1.0;
    bool _1384 = _1290 > 0.0;
    float _1386 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = fma(_1054, _1022, _1170);
    int _1390 = _1340 ? 0 : 1;
    float _1392 = 1.0 / _1264;
    bool _1394 = _1306 >= 0.0;
    bool _1396 = isnan(_1306);
    bool _1398 = _1394 || _1396;
    bool _1400 = isnan(0.0);
    bool _1402 = _1398 || _1400;
    out.m_72.x = _1318;
    out.m_72.y = _1386;
    out.m_72.z = _1326;
    out.m_72.w = _1344;
    int _1404 = int(_1224) + int(_1324);
    float _1406 = _417 * 2.0;
    int _1408 = abs(_1138);
    float _1410 = 1.0 / _1304;
    int _1412 = ~_441;
    int _1414 = _1412 + 1;
    float _1416 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1418 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1416;
    int _1420 = _1402 ? 0 : 1;
    float _1422 = floor(_1406);
    bool _1424 = _1306 > 0.0;
    int _1426 = _1414 * _1404;
    int _1428 = _1426 + _842;
    float _1430 = _1418 * _1346;
    int _1432 = ~_1390;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1440 = _1438 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1442 = _1436;
    if (!_1384)
    {
        int _1444 = ~_1390;
        int _1446 = _1444 + 1;
        _1442 = _1446;
    }
    int _1448 = _1442;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1454 = uint(_1428) >= uint(_441);
    float _1456 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1458 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1456;
    float _1460 = _1440 * _1372;
    float _1462 = _159 + _1096;
    int _1464 = ~_1420;
    int _1466 = _1464 + 1;
    int _1468 = _1466 + 1;
    float _1470 = _1458 * _1392;
    int _1472 = _1468;
    if (!_1424)
    {
        int _1474 = ~_1420;
        int _1476 = _1474 + 1;
        _1472 = _1476;
    }
    int _1478 = _1472;
    float _1480 = _1462 + (-1.0);
    bool _1482 = !_1454;
    int _1484 = _1482 ? 0 : (-1);
    float _1486 = _1452 * _1410;
    int _1488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1490 = _1488 != 0;
    int _1492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1494 = _1492 != 0;
    int _1496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1498 = _1496 != 0;
    bool _1500 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1502 = isnan(_411);
    bool _1504 = _1500 || _1502;
    bool _1506 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1508 = _1504 || _1506;
    float _1510 = float(_1508);
    float _1512 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1516 = _411 + _1514;
    bool _1518 = !_1490;
    int _1520 = _1518 ? 0 : 1;
    bool _1522 = _1422 >= 0.0;
    bool _1524 = isnan(_1422);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan(0.0);
    bool _1530 = _1526 || _1528;
    float _1532 = fma(_1430, _1516, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1534 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1536 = isnan(_411);
    bool _1538 = _1534 || _1536;
    bool _1540 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1542 = _1538 || _1540;
    float _1544 = float(_1542);
    float _1546 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1548 = _411 + _1546;
    int _1550 = _1530 ? 0 : 1;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1554 = _411 + _1552;
    bool _1556 = _1422 > 0.0;
    float _1558 = -_1544;
    float _1560 = _1558 + 1.0;
    float _1562 = -_1510;
    float _1564 = _1562 + 1.0;
    float _1566 = fma(_1470, _1548, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1568 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1570 = isnan(_411);
    bool _1572 = _1568 || _1570;
    bool _1574 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1576 = _1572 || _1574;
    float _1578 = float(_1576);
    float _1580 = _1510 * _1560;
    float _1582 = fma(_1460, _1554, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1584 = _1366 * _1564;
    bool _1586 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1588 = isnan(_411);
    bool _1590 = _1586 || _1588;
    bool _1592 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1594 = _1590 || _1592;
    float _1596 = float(_1594);
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1600 = _411 + _1598;
    float _1602 = _1578 * _1382;
    float _1604 = -_1578;
    float _1606 = _1604 + 1.0;
    float _1608 = fma(_1342, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1218);
    float _1610 = fma(_1486, _1600, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1612 = _1388 + _1024;
    float _1614 = _1596 * _1606;
    float _1616 = _1240 + (-0.5);
    float _1618 = -_1596;
    float _1620 = _1618 + 1.0;
    float _1622 = _1242 + _994;
    float _1624 = _1532 * _1614;
    float _1626 = -_1616;
    float _1628 = -_1288;
    float _1630 = fma(_1626, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1628);
    float _1632 = -_1300;
    float _1634 = _1632 + 1.0;
    float _1636 = -_1354;
    float _1638 = fma(_1178, _1636, _1608);
    float _1640 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1624);
    float _1642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1644 = _1622 + _1642;
    float _1646 = fma(_1240, _1634, _1630);
    float _1648 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1650 = _1612 + _1648;
    float _1652 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1654 = _1160 + _1652;
    float _1656 = _1644 * _1644;
    float _1658 = fma(_1582, _1602, _1640);
    int _1660 = _980 >> 31;
    out.m_74.x = _1638;
    out.m_74.y = _1646;
    float _1662 = fma(_1650, _1650, _1656);
    float _1664 = fma(_1566, _1584, _1658);
    bool _1666 = !_1048;
    int _1668 = _1666 ? 0 : 1;
    float _1670 = fma(_1654, _1654, _1662);
    bool _1672 = _984 != 3;
    float _1674 = fma(_1610, _1580, _1664);
    int _1676 = _1030 >> 31;
    float _1678 = rsqrt(_1670);
    int _1680 = _1660 & 3;
    bool _1682 = !_1672;
    int _1684 = _1682 ? 0 : (-1);
    bool _1686 = _1046 != 3;
    float _1688 = _391 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1690 = _1676 & 3;
    float _1692 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1694 = _980 + _1680;
    int _1696 = _1030 + _1690;
    float _1698 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1700 = _1694 >> 2;
    float _1702 = fma(_1650, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1692);
    int _1704 = _1696 >> 2;
    float _1706 = _1698 * _1678;
    int _1708 = _1700 << 4;
    int _1710 = _1708 + 368;
    float _1712 = fma(_1654, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1702);
    int _1714 = _1704 << 4;
    int _1716 = _1714 + 656;
    float _1718 = _1644 * _1706;
    uint _1720 = uint(int(uint(_1710) >> uint(2)));
    uint _1722 = uint(int(uint(int(_1720)) >> uint(2)));
    int _1724 = int(_1720) & 3;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[int(_1722)][_1724];
    int _1728 = int(_1720) + 1;
    uint _1730 = uint(int(uint(_1728) >> uint(2)));
    int _1732 = _1728 & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    float _1736 = _1650 * _1706;
    bool _1738 = !_1686;
    int _1740 = _1738 ? 0 : (-1);
    float _1742 = -_1718;
    float _1744 = _1644 + _1742;
    bool _1746 = _1712 >= 0.0;
    float _1748 = fma(_1544, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1674);
    float _1750 = -_1736;
    float _1752 = _1650 + _1750;
    float _1754 = _1744 * _1744;
    uint _1756 = uint(int(uint(_1716) >> uint(2)));
    uint _1758 = uint(int(uint(int(_1756)) >> uint(2)));
    int _1760 = int(_1756) & 3;
    float _1762 = (*spvDescriptorSet0.vp_c9)._m0[int(_1758)][_1760];
    int _1764 = int(_1756) + 1;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    int _1768 = _1764 & 3;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[int(_1766)][_1768];
    float _1772 = _1748 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1774 = fma(_1752, _1752, _1754);
    int _1776 = abs(_1520);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1780 = ~_1550;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = _1710 + 8;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1806 = _1784;
    float _1808 = _1612;
    float _1810 = _1622;
    if (!_1556)
    {
        int _1812 = ~_1550;
        int _1814 = _1812 + 1;
        _1806 = _1814;
    }
    int _1816 = _1806;
    float _1818 = _1778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1820 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1822 = float(_1816);
    float _1824 = _1654 * _1706;
    int _1826 = _1716 + 8;
    uint _1828 = uint(int(uint(_1826) >> uint(2)));
    uint _1830 = uint(int(uint(int(_1828)) >> uint(2)));
    int _1832 = int(_1828) & 3;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[int(_1830)][_1832];
    int _1836 = int(_1828) + 1;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    int _1840 = _1836 & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    float _1844 = float(_1776);
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1848 = ~_1266;
    int _1850 = _1848 + _1378;
    int _1852 = _1850 + 1;
    float _1854 = -_1824;
    float _1856 = _1654 + _1854;
    int _1858 = abs(_1668);
    float _1860 = _1846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1862 = abs(_1684);
    int _1864 = _433 * _1852;
    int _1866 = _1864 + _732;
    int _1868 = abs(_1044);
    float _1870 = fma(_1856, _1856, _1774);
    out.m_76.x = _1860;
    out.m_76.y = _1818;
    out.m_76.z = _1820;
    out.m_76.w = _1772;
    int _1872 = abs(_1350);
    float _1874 = _1844 * _1822;
    int _1876 = ~_1404;
    int _1878 = _1876 + _1484;
    int _1880 = _1878 + 1;
    if (_1746)
    {
        out.m_55.x = 0.0;
    }
    float _1882 = sqrt(_1870);
    bool _1884 = !_676;
    int _1886 = _1884 ? _1866 : (-1);
    int _1888 = _441 * _1880;
    int _1890 = _1888 + _842;
    bool _1892 = !_718;
    float _1894 = _1892 ? as_type<float>(_1890) : as_type<float>(0xffffffffu /* nan */);
    int _1896 = ~_1868;
    int _1898 = _1896 + 1;
    int _1900 = _1898 + 1;
    int _1902 = ~_1872;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1900 * as_type<int>(_1734);
    int _1910 = ~_1368;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    float _1916 = _1678 * _1882;
    int _1918 = _1906 * as_type<int>(_1726);
    int _1920 = _1918 + _1908;
    int _1922 = ~_1858;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    int _1928 = _1914 * as_type<int>(_1770);
    int _1930 = ~_1370;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    float _1936 = _1688 * _1916;
    int _1938 = _1926 * as_type<int>(_1762);
    int _1940 = _1938 + _1928;
    int _1942 = abs(_1740);
    int _1944 = _1934 * as_type<int>(_1794);
    int _1946 = _1944 + _1920;
    float _1948 = in.m_78.x;
    float _1950 = in.m_78.y;
    float _1952 = in.m_78.z;
    int _1954 = ~_1408;
    int _1956 = _1954 + 1;
    int _1958 = _1956 + 1;
    bool _1960 = !_1154;
    int _1962 = _1960 ? 0 : 1;
    out.m_80.x = _1936;
    int _1964 = ~_1862;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    int _1970 = _1958 * as_type<int>(_1834);
    int _1972 = _1970 + _1940;
    int _1974 = ~_1942;
    int _1976 = _1974 + 1;
    int _1978 = _1976 + 1;
    int _1980 = abs(_1144);
    int _1982 = _1968 * as_type<int>(_1802);
    int _1984 = _1982 + _1946;
    int _1986 = abs(_1962);
    int _1988 = _1978 * as_type<int>(_1842);
    int _1990 = _1988 + _1972;
    int _1992 = ~_1980;
    int _1994 = _1992 + 1;
    int _1996 = _1994 + 1;
    int _1998 = ~_1986;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    float _2004 = as_type<float>(_1968);
    float _2006 = _1894;
    if (_1746)
    {
        _2004 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2008 = _2004;
    int _2010 = _1984 * _1996;
    float _2012 = _159 + (-0.5);
    int _2014 = _1990 * _2002;
    float _2016 = _1874 * (-2.0);
    int _2018 = _1886 * _1980;
    int _2020 = _2018 + _2010;
    int _2022 = as_type<int>(_2008);
    if (_1746)
    {
        float _2024 = _2008 * 5.0;
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    int _2028 = as_type<int>(_1894) * _1986;
    int _2030 = _2028 + _2014;
    float _2032 = fma(_2016, _1948, _1948);
    float _2034 = fma(_1512, _2016, _1512);
    float _2036 = float(_2020);
    float _2038 = _1952;
    if (_1746)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6297 = as_type<float>(_2026);
        out.gl_Position.z = _6297;
    }
    float _2040 = float(_2030);
    float _2042 = fma(_2012, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2032);
    float _2044 = _1096 + _417;
    bool _2046 = !_1494;
    int _2048 = _2046 ? 0 : 1;
    out.m_82.x = _2036;
    float _2050 = _2044 + (-1.0);
    float _2052 = float(_1448);
    out.m_82.z = _2040;
    int _2054 = abs(_2048);
    bool _2056 = !_1498;
    int _2058 = _2056 ? 0 : 1;
    if (_1746)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2060 = -_1718;
    float _2062 = _1622 + _2060;
    float _2064 = -_1736;
    float _2066 = _1612 + _2064;
    float _2068 = float(_2054);
    float _2070 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2074 = _2062 + _2072;
    int _2076 = abs(_2058);
    float _2078 = -_1824;
    float _2080 = _1160 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2084 = _2066 + _2082;
    float _2086 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2088 = float(_1478);
    float _2090 = _2068 * _2052;
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2094 = _2080 + _2092;
    float _2096 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2086);
    float _2098 = _1096 + (-0.5);
    float _2100 = _2090 * (-2.0);
    float _2102 = float(_2076);
    float _2104 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2096);
    float _2106 = fma(_2034, _1310, _2042);
    float _2108 = fma(_2100, _1950, _1950);
    float _2110 = fma(_2070, _2100, _2070);
    float _2112 = _2102 * _2088;
    bool _2114 = _2104 >= 0.0;
    float _2116 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2108);
    float _2118 = _159 + _417;
    float _2120 = _2112 * (-2.0);
    float _2122 = fma(_2110, _1310, _2116);
    float _2124 = _2106 * 0.15915493667125701904296875;
    float _2126 = _2118 + (-1.0);
    float _2128 = fma(_2120, _1952, _1952);
    float _2130 = _2122 * 0.15915493667125701904296875;
    float _2132 = _417 + (-0.5);
    float _2134 = _2124 * 6.283185482025146484375;
    float _2136 = sin(_2134);
    float _2138 = fma(_2126, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2140 = _2074;
    if (_2114)
    {
        _2038 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2142 = _2038;
    float _2144 = fma(_2132, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2128);
    int _2146 = as_type<int>(_2142);
    if (_2114)
    {
        out.m_55.x = 0.0;
    }
    float _2148 = fma(_2138, _2120, _2138);
    if (_2114)
    {
        float _2150 = _2142 * 5.0;
        _2146 = as_type<int>(_2150);
    }
    int _2152 = _2146;
    float _2154 = _2124 * 6.283185482025146484375;
    float _2156 = cos(_2154);
    float _2158 = fma(_2148, _1310, _2144);
    if (_2114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6498 = as_type<float>(_2152);
        out.gl_Position.z = _6498;
    }
    float _2160 = _2158 * 0.15915493667125701904296875;
    float _2162 = _2130 * 6.283185482025146484375;
    float _2164 = sin(_2162);
    float _2166 = _2130 * 6.283185482025146484375;
    float _2168 = cos(_2166);
    if (_2114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2170 = _2160 * 6.283185482025146484375;
    float _2172 = cos(_2170);
    float _2174 = _393 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _2178 = _2136 * _2164;
    float _2180 = _2156 * _2168;
    float _2182 = _2174 * _1916;
    float _2184 = _2156 * _2164;
    float _2186 = _2136 * _2168;
    float _2188 = _2160 * 6.283185482025146484375;
    float _2190 = sin(_2188);
    float _2192 = _2182 * _2176;
    float _2194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    bool _2196 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2198 = isnan(0.5);
    bool _2200 = _2196 || _2198;
    bool _2202 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2204 = _2200 || _2202;
    float _2206 = _1936 * _2194;
    float _2208 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2210 = _2208 * 0.5;
    float _2212 = _2156 * _2172;
    float _2214 = _2168 * _2172;
    float _2216 = _2136 * _2172;
    float _2218 = _2164 * _2172;
    float _2220 = _2212 * _2192;
    float _2222 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2224 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2226 = isnan(0.5);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2232 = _2228 || _2230;
    float _2234 = fma(_2190, _2180, _2178);
    float _2236 = -_2192;
    float _2238 = _2190 * _2236;
    float _2240 = -_2186;
    float _2242 = fma(_2190, _2184, _2240);
    float _2244 = -_2184;
    float _2246 = fma(_2190, _2186, _2244);
    float _2248 = fma(_2234, _2206, _2220);
    float _2250 = _2216 * _2192;
    float _2252 = fma(_2214, _2206, _2238);
    float _2254 = fma(_2242, _2210, _2248);
    float _2256 = fma(_2190, _2178, _2180);
    float _2258 = fma(_2246, _2206, _2250);
    float _2260 = fma(_2218, _2210, _2252);
    float _2262 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2264 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2222);
    float _2266 = fma(_2256, _2210, _2258);
    float _2268 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2270 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2262);
    float _2272 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2264);
    float _2274 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2276 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2270);
    float _2278 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2280 = _2062 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2282 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2274);
    float _2284 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2286 = 1.0 / _2278;
    float _2288 = _2282 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2290 = _1160 + _2284;
    float _2292 = _1612 + _2288;
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2296 = _2290 + _2294;
    float _2298 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2300 = _2292 + _2298;
    float _2302 = _2296 * _2296;
    float _2304 = fma(_2300, _2300, _2302);
    float _2306 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2280);
    float _2308 = _2254 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2310 = sqrt(_2304);
    float _2312 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2306);
    float _2314 = fma(_2260, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2308);
    float _2316 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2318 = fma(_2266, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2314);
    float _2320 = _2316 + _2278;
    float _2322 = _2318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2324 = _2320 * _2286;
    float _2326 = _2324 * 0.5;
    float _2328 = _1622 + _2322;
    bool _2330 = _2310 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2332 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2334 = fma(_2326, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2332);
    float _2336 = 1.0 / _2334;
    float _2338 = _2320;
    float _2340 = _2260;
    float _2342 = _2326;
    float _2344 = _2334;
    if (!_2330)
    {
        _2338 = _2292;
    }
    float _2346 = _2338;
    float _2348 = _2346;
    if (!_2330)
    {
        _2340 = _2290;
    }
    float _2350 = _2340;
    float _2352 = _2350;
    if (!_2330)
    {
        _2342 = _2328;
    }
    float _2354 = _2342;
    bool _2356 = !_2330;
    float _2358 = _2354;
    if (!_2356)
    {
        float _2360 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2364 = _2310 + _2362;
        float _2366 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2368 = rsqrt(_2304);
        float _2370 = _2364 * _2360;
        float _2372 = _2370 * 0.15915493667125701904296875;
        float _2374 = _2372 * 6.283185482025146484375;
        float _2376 = cos(_2374);
        float _2378 = _2372 * 6.283185482025146484375;
        float _2380 = sin(_2378);
        float _2382 = _2376 + (-1.0);
        float _2384 = _2382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2386 = fma(_2380, _2366, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2388 = fma(_2328, _2376, _2384);
        float _2390 = _2368 * _2386;
        float _2392 = fma(_2300, _2390, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2394 = fma(_2296, _2390, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2348 = _2392;
        _2358 = _2388;
        _2352 = _2394;
        _2344 = _2384;
    }
    float _2396 = _2348;
    float _2398 = _2358;
    float _2400 = _2352;
    float _2402 = _2344;
    float _2404 = -_1736;
    float _2406 = _2404 + _2396;
    float _2408 = -_1718;
    float _2410 = _2408 + _2398;
    float _2412 = -_1824;
    float _2414 = _2412 + _2400;
    float _2416 = _2402;
    float _2418 = _2410;
    float _2420 = _2406;
    float _2422 = _2414;
    if (_2232)
    {
        _2416 = 1.0;
    }
    float _2424 = _2416;
    float _2426 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2428 = _2336 * _2426;
    float _2430 = _2424;
    if (!_2204)
    {
        float _2432 = _2074 * _2074;
        float _2434 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2436 = -_1160;
        float _2438 = _2436 + _2400;
        float _2440 = -_1622;
        float _2442 = _2440 + _2398;
        float _2444 = fma(_2084, _2084, _2432);
        float _2446 = -_1612;
        float _2448 = _2446 + _2396;
        float _2450 = fma(_2094, _2094, _2444);
        float _2452 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2454 = sqrt(_2450);
        float _2456 = 1.0 / _1916;
        float _2458 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2460 = precise::min(_2454, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2462 = _2460 * _2434;
        float _2464 = _2462 * _2456;
        float _2466 = _2458 * _2464;
        float _2468 = _2438 * _2464;
        float _2470 = fma(_2442, _2466, _2062);
        float _2472 = fma(_2448, _2466, _2066);
        float _2474 = fma(_2458, _2468, _2080);
        _2418 = _2470;
        _2420 = _2472;
        _2422 = _2474;
        _2140 = _2454;
        _1808 = _2448;
    }
    float _2476 = _2418;
    float _2478 = _2420;
    float _2480 = _2422;
    float _2482 = _2140;
    float _2484 = _1808;
    float _2486 = _2482;
    if (!_2232)
    {
        float _2488 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2490 = _2488 * 0.15915493667125701904296875;
        float _2492 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2494 = _2490 * 6.283185482025146484375;
        float _2496 = cos(_2494);
        float _2498 = _2492 * 0.15915493667125701904296875;
        float _2500 = _2490 * 6.283185482025146484375;
        float _2502 = sin(_2500);
        float _2504 = 1.0 / _2496;
        float _2506 = _2498 * 6.283185482025146484375;
        float _2508 = cos(_2506);
        float _2510 = _2502 * _2504;
        float _2512 = _2498 * 6.283185482025146484375;
        float _2514 = sin(_2512);
        float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2518 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2516;
        float _2520 = _2508 * _2510;
        float _2522 = 1.0 / _2520;
        float _2524 = 1.0 / _2518;
        float _2526 = _2514 * _2522;
        float _2528 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2530 = fma(_2428, _2526, _2528);
        float _2532 = _2530 * _2524;
        float _2534 = precise::clamp(_2532, 0.0, 1.0);
        _2486 = _2490;
        _2430 = _2534;
    }
    float _2536 = _2486;
    float _2538 = _2430;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2542 = _2476 + _2540;
    float _2544 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2546 = _2478 + _2544;
    float _2548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2550 = _2480 + _2548;
    float _2552 = fma(_2400, 6.2500002968590706586837768554688e-05, 0.5);
    float _2554 = _2542 * _2542;
    float _2556 = fma(_2546, _2546, _2554);
    float _2558 = fma(_2550, _2550, _2556);
    float _2560 = rsqrt(_2558);
    float _2562 = sqrt(_2558);
    float _2564 = _2560 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2566 = _2546 * _2564;
    float _2568 = _2550 * _2564;
    float _2570 = _2566 * _2566;
    float _2572 = _2568 * _2568;
    float _2574 = _2570 + _2572;
    float _2576 = sqrt(_2574);
    bool _2578 = _2576 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2582 = _2576 + _2580;
    float _2584 = _2550;
    float _2586 = _2582;
    float _2588 = _2536;
    float _2590 = _2542;
    if (_2578)
    {
        float _2592 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2584 = _2592;
    }
    float _2594 = _2584;
    if (_2578)
    {
        float _2596 = _2582 * _2594;
        _2586 = _2596;
    }
    float _2598 = _2586;
    if (_2578)
    {
        float _2600 = _2598 * 0.15915493667125701904296875;
        _2588 = _2600;
    }
    float _2602 = _2588;
    float _2604 = _2560;
    float _2606 = _2602;
    if (_2578)
    {
        float _2608 = _2602 * 6.283185482025146484375;
        float _2610 = sin(_2608);
        _2604 = _2610;
    }
    float _2612 = _2604;
    float _2614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2616 = precise::max(0.0, _2614);
    float _2618 = _2484;
    float _2620 = _2616;
    if (_2578)
    {
        float _2622 = _2602 * 6.283185482025146484375;
        float _2624 = cos(_2622);
        _2618 = _2624;
    }
    float _2626 = _2618;
    float _2628 = -_2564;
    float _2630 = -_2616;
    float _2632 = fma(_2542, _2628, _2630);
    float _2634 = _2614;
    if (_2578)
    {
        float _2636 = rsqrt(_2574);
        _2634 = _2636;
    }
    float _2638 = _2634;
    if (_2578)
    {
        float _2640 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2620 = _2640;
    }
    float _2642 = _2620;
    float _2644 = _2642;
    if (!_2578)
    {
        _2606 = _2570;
    }
    float _2646 = _2606;
    float _2648 = _2612;
    float _2650 = _2646;
    if (_2578)
    {
        float _2652 = fma(_2612, _2642, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2644 = _2652;
    }
    float _2654 = _2644;
    float _2656 = _2654;
    if (!_2578)
    {
        _2648 = _2566;
    }
    float _2658 = _2648;
    float _2660 = _2658;
    if (_2578)
    {
        float _2662 = _2626 + (-1.0);
        _2590 = _2662;
    }
    float _2664 = _2590;
    float _2666 = _2664;
    if (_2578)
    {
        float _2668 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1810 = _2668;
    }
    float _2670 = _1810;
    if (!_2578)
    {
        _2666 = _2572;
    }
    float _2672 = _2666;
    float _2674 = _2638;
    float _2676 = _2672;
    if (_2578)
    {
        float _2678 = _2638 * _2654;
        _2006 = _2678;
    }
    float _2680 = _2006;
    if (!_2578)
    {
        _2674 = _2632;
    }
    float _2682 = _2674;
    float _2684 = _2682;
    if (_2578)
    {
        float _2686 = fma(_2632, _2626, _2670);
        _2684 = _2686;
    }
    float _2688 = _2684;
    if (!_2578)
    {
        _2656 = _2568;
    }
    float _2690 = _2656;
    float _2692 = _2690;
    if (_2578)
    {
        float _2694 = _2566 * _2680;
        _2660 = _2694;
    }
    float _2696 = _2660;
    if (_2578)
    {
        float _2698 = _2568 * _2680;
        _2692 = _2698;
    }
    float _2700 = _2692;
    if (_2578)
    {
        float _2702 = _2696 * _2696;
        _2650 = _2702;
    }
    float _2704 = _2650;
    if (_2578)
    {
        float _2706 = _2700 * _2700;
        _2676 = _2706;
    }
    float _2708 = _2676;
    float _2710 = fma(_2066, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2712 = fma(_2688, _2688, _2704);
    float _2714 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2718 = fma(_2562, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2716);
    float _2720 = precise::clamp(_2718, 0.0, 1.0);
    float _2722 = _2712 + _2708;
    float _2724 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2714);
    float _2726 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2728 = floor(_2710);
    float _2730 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2724);
    float _2732 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2734 = rsqrt(_2722);
    float _2736 = floor(_2732);
    float _2738 = -_2728;
    float _2740 = _2710 + _2738;
    float _2742 = _2734 * _2696;
    float _2744 = _2734 * _2688;
    float _2746 = _2734 * _2700;
    float _2748 = -_2720;
    float _2750 = _2748 + 1.0;
    float _2752 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2754 = _2730 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2756 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2758 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2760 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2752);
    float _2762 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2764 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2756);
    float _2766 = abs(_2750);
    float _2768 = log2(_2766);
    float _2770 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2760);
    float _2772 = -_2758;
    float _2774 = fma(_2744, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2772);
    float _2776 = -_2762;
    float _2778 = fma(_2776, _2726, 1.0);
    float _2780 = _2476 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2782 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2764);
    float _2784 = _2770 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2786 = -_2746;
    float _2788 = fma(_2786, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2774);
    float _2790 = fma(_2478, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2780);
    float _2792 = _2782 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2794 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2796 = fma(_2788, -0.5, 0.5);
    float _2798 = fma(_2480, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2790);
    float _2800 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2794);
    float _2802 = fma(_2788, 0.5, 0.5);
    float _2804 = _2798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2806 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2808 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2800);
    float _2810 = fma(_2802, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2812 = log2(_2778);
    float _2814 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2816 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2808);
    float _2818 = fma(_2802, _2810, -0.212114393711090087890625);
    float _2820 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2822 = -_2736;
    float _2824 = _2732 + _2822;
    float _2826 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2814);
    float _2828 = _2744 + 1.0;
    float _2830 = exp2(_2806);
    float _2832 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2820);
    float _2834 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2826);
    float _2836 = fma(_2802, _2818, 1.570728778839111328125);
    float _2838 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2832);
    float _2840 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2834);
    float _2842 = 1.0 / _2816;
    float _2844 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2838);
    float _2846 = _2812 * 0.693147182464599609375;
    float _2848 = sqrt(_2796);
    float _2850 = -_2744;
    float _2852 = fma(_2830, _2828, _2850);
    float _2854 = fma(_2396, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _7615 = float2(_2740, _2824);
    float _2856 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7615, float2(0.0), isnan(_7615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7615, float2(0.0), isnan(_7615)), level(0.0)).x;
    float _2858 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2860 = fma(_2852, 0.5, 0.5);
    float _2862 = _2840 * _2842;
    float _2864 = _2844 * _2842;
    float _2866 = fma(_2862, 0.5, 0.5);
    float _2868 = fma(_2864, -0.5, 0.5);
    float _2870 = _2848 * 0.636619746685028076171875;
    float _2872 = -_2836;
    float _2874 = fma(_2870, _2872, 1.0);
    float3 _7650 = float3(_2866, _2868, _2858);
    float _2876 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7650, float3(0.0), isnan(_7650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7650, float3(0.0), isnan(_7650)), level(0.0)).x;
    float3 _7661 = float3(_2866, _2868, _2858);
    float4 _2879 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7661, float3(0.0), isnan(_7661)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7661, float3(0.0), isnan(_7661)), level(0.0)).xyzw;
    float _2881 = _2879.x;
    float _2883 = _2879.y;
    float _2885 = _2879.z;
    float _2887 = _2879.w;
    float2 _7677 = float2(_2874, _2860);
    float3 _2891 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7677, float2(0.0), isnan(_7677)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7677, float2(0.0), isnan(_7677)), level(0.0)).xyz;
    float _2893 = _2891.x;
    float _2895 = _2891.y;
    float _2897 = _2891.z;
    float2 _7691 = float2(_2854, _2552);
    float3 _2899 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_7691, float2(0.0), isnan(_7691)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_7691, float2(0.0), isnan(_7691)), level(0.0)).xyz;
    float _2901 = _2899.x;
    float _2903 = _2899.y;
    float _2905 = _2899.z;
    float _2907 = abs(_2428);
    float _2909 = log2(_2907);
    float _2911 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2913 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2915 = _2234 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2917 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2919 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2911);
    float _2921 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2923 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2925 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2927 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2913);
    float _2929 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2915);
    float _2931 = -_2190;
    float _2933 = fma(_2931, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2921);
    float _2935 = -_2190;
    float _2937 = fma(_2935, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2925);
    float _2939 = -_2190;
    float _2941 = fma(_2939, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2917);
    float _2943 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2945 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2947 = _2909 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2949 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2951 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2943);
    float _2953 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2945);
    float _2955 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2949);
    float _2957 = exp2(_2947);
    float _2959 = fma(_2923, _2923, 1.0);
    float _2961 = _2784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2963 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2937);
    float _2965 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2933);
    float _2967 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2941);
    float _2969 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2919);
    float _2971 = rsqrt(_2959);
    float _2973 = fma(_2792, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2961);
    float _2975 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2977 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2951);
    float _2979 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2953);
    float _2981 = fma(_2256, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2955);
    float _2983 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2973);
    float _2985 = _2923 * _2963;
    float _2987 = fma(_2957, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2989 = precise::clamp(_2987, 0.0, 1.0);
    float _2991 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2927);
    float _2993 = fma(_2246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2929);
    float _2995 = fma(_2975, _2969, _2985);
    float _2997 = fma(_2989, -2.0, 3.0);
    float _2999 = _2989 * _2989;
    bool _3001 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3003 = isnan(_2562);
    bool _3005 = _3001 || _3003;
    bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3009 = _3005 || _3007;
    out.m_84.x = _2969;
    out.m_84.y = _2991;
    out.m_84.z = _2993;
    float _3011 = _2923 * _2971;
    float _3013 = _2999 * _2997;
    float _3015 = _2923 * _2965;
    float _3017 = _2923 * _2967;
    float _3019 = -_2977;
    float _3021 = _3011 * _3019;
    float _3023 = -_3013;
    float _3025 = _3023 + 1.0;
    float _3027 = -_2981;
    float _3029 = _3011 * _3027;
    float _3031 = fma(_2975, _2991, _3015);
    float _3033 = fma(_2971, _2963, _3021);
    float _3035 = fma(_3025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3013);
    float _3037 = -_2979;
    float _3039 = _3011 * _3037;
    float _3041 = fma(_2804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2983);
    float _3043 = _2768 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3045 = fma(_2971, _2967, _3029);
    float _3047 = fma(_2971, _2965, _3039);
    bool _3049 = _2428 <= 8000.0;
    bool _3051 = isnan(_2428);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan(8000.0);
    bool _3057 = _3053 || _3055;
    float _3059 = float(_3057);
    float _3061 = in.m_86.x;
    float _3063 = fma(_2975, _2993, _3017);
    float _3065 = exp2(_3043);
    float _3067 = _3059 * _3035;
    float _3069 = _2979 + _3031;
    float _3071 = _2816 * 0.5;
    out.gl_Position.x = _2840;
    out.gl_Position.y = _2844;
    out.gl_Position.z = _3041;
    out.gl_Position.w = _2816;
    float _3073 = _3067 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3075 = _3041 + _2816;
    float _3077 = fma(_2844, -0.5, _3071);
    out.m_88.x = _3033;
    out.m_88.y = _3047;
    out.m_88.z = _3045;
    float _3079 = _2840 + _2816;
    float _3081 = _2977 + _2995;
    float _3083 = _2981 + _3063;
    float _3085 = _3075 * 0.5;
    float _3087 = _3079 * 0.5;
    float _3089 = -_3065;
    float _3091 = _3089 + 1.0;
    out.m_90.x = _3081;
    out.m_90.y = _3069;
    out.m_90.z = _3083;
    float _3093 = _3091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3095 = _3045;
    float _3097 = _3047;
    float _3099 = _2816;
    float _3101 = _3077;
    if (!_3009)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3103 = _3095;
    out.m_92.x = _3087;
    out.m_92.y = _3077;
    out.m_92.z = _3085;
    out.m_92.w = _2816;
    float _3105 = _3103;
    float _3107 = _3103;
    if (!_3009)
    {
        _3097 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3109 = _3097;
    float _3111 = -_3093;
    float _3113 = _3111 + 1.0;
    float _3115 = _2538 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3117 = _3113;
    float _3119 = _3109;
    float _3121 = _3109;
    if (!_3009)
    {
        _3099 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3123 = _3099;
    float _3125 = _3123;
    float _3127 = _3123;
    if (!_3009)
    {
        _3101 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3129 = _3101;
    float _3131 = -_2856;
    float _3133 = _3131 + 1.0;
    float _3135 = _3133 * _3073;
    float _3137 = precise::clamp(_3135, 0.0, 1.0);
    float _3139 = -_3137;
    float _3141 = fma(_3139, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3143 = _3141 * _3061;
    float _3145 = _3143 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3147 = _3093 * _2876;
    float _3149 = _2887 * _3113;
    out.m_94.x = _3145;
    float _3151 = _2901;
    float _3153 = _3129;
    float _3155 = _3129;
    if (!_3009)
    {
        _3117 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3157 = _3117;
    float _3159 = _2887 * _3147;
    float _3161 = _2897 * _3147;
    float _3163 = fma(_2893, _3159, _2881);
    float _3165 = fma(_2895, _3159, _2883);
    float _3167 = fma(_2887, _3161, _2885);
    out.m_96.x = _3163;
    out.m_96.y = _3165;
    out.m_96.z = _3167;
    out.m_96.w = _3149;
    out.m_98.x = _2901;
    out.m_98.y = _2903;
    out.m_98.z = _2905;
    float _3169 = _3157;
    float _3171 = _3157;
    if (!_3009)
    {
        _3151 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3173 = _3151;
    bool _3175 = !_3009;
    float _3177 = _3173;
    float _3179 = _3173;
    if (!_3175)
    {
        bool _3181 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3183 = isnan(_2562);
        bool _3185 = _3181 || _3183;
        bool _3187 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3189 = _3185 || _3187;
        if (!_3189)
        {
            float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3193 = _2562 + _3191;
            float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3197 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3195;
            float _3199 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3201 = _3199 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3203 = 1.0 / _3197;
            float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3213 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3221 = _3193 * _3203;
            float _3223 = precise::clamp(_3221, 0.0, 1.0);
            float _3225 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3227 = _3225 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3229 = fma(_3223, _3201, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3231 = fma(_3223, _3227, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3233 = fma(_3223, _3207, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3235 = fma(_3223, _3211, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3237 = fma(_3223, _3215, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3239 = fma(_3223, _3219, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3127 = _3233;
            _3171 = _3237;
            _3107 = _3229;
            _3121 = _3235;
            _3155 = _3231;
            _3179 = _3239;
            _3241 = true;
        }
        else
        {
            bool _3243 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3245 = isnan(_2562);
            bool _3247 = _3243 || _3245;
            bool _3249 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3251 = _3247 || _3249;
            if (!_3251)
            {
                _3105 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3253 = _3105;
            _3107 = _3253;
            if (!_3251)
            {
                _3125 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3255 = _3125;
            _3127 = _3255;
            if (!_3251)
            {
                _3153 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3257 = _3153;
            _3155 = _3257;
            if (!_3251)
            {
                _3119 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3259 = _3119;
            _3121 = _3259;
            if (!_3251)
            {
                _3169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3261 = _3169;
            _3171 = _3261;
            if (!_3251)
            {
                _3177 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3263 = _3177;
            bool _3265 = !_3251;
            _3179 = _3263;
            if (!_3265)
            {
                bool _3267 = _2562 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3269 = isnan(_2562);
                bool _3271 = _3267 || _3269;
                bool _3273 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3275 = _3271 || _3273;
                if (!_3275)
                {
                    float _3277 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3279 = _2562 + _3277;
                    float _3281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3283 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3281;
                    float _3285 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3287 = _3285 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3289 = 1.0 / _3283;
                    float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3293 = _3291 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3295 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3297 = _3295 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3299 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3301 = _3299 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3303 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3305 = _3303 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3307 = _3279 * _3289;
                    float _3309 = precise::clamp(_3307, 0.0, 1.0);
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3313 = _3311 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3315 = fma(_3309, _3287, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3317 = fma(_3309, _3313, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3319 = fma(_3309, _3293, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3321 = fma(_3309, _3297, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3323 = fma(_3309, _3301, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3325 = fma(_3309, _3305, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3127 = _3319;
                    _3171 = _3323;
                    _3107 = _3315;
                    _3121 = _3321;
                    _3155 = _3317;
                    _3179 = _3325;
                    _3241 = true;
                }
                else
                {
                    _3127 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3107 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3121 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3155 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3179 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3241 = false;
    float _3327 = _3127;
    float _3329 = _3171;
    float _3331 = _3107;
    float _3333 = _3121;
    float _3335 = _3155;
    float _3337 = _3179;
    float _3339 = fma(_3069, -0.5, 0.5);
    float _3341 = precise::clamp(_3339, 0.0, 1.0);
    float _3343 = -_3327;
    float _3345 = _3343 + _3329;
    float _3347 = -_3331;
    float _3349 = _3347 + _3333;
    out.m_100.x = 0.0;
    float _3351 = fma(_3341, _3345, _3327);
    float _3353 = -_3335;
    float _3355 = _3353 + _3337;
    float _3357 = fma(_3341, _3349, _3331);
    float _3359 = _3351 * 0.586610972881317138671875;
    bool _3361 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3363 = fma(_3341, _3355, _3335);
    float _3365 = _3115 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3367 = fma(_3357, 0.298911988735198974609375, _3359);
    bool _3369 = _2538 > 0.0;
    bool _3371 = isnan(_2538);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan(0.0);
    bool _3377 = _3373 || _3375;
    float _3379 = fma(_3363, 0.114477999508380889892578125, _3367);
    out.m_55.x = _3365;
    float _3381 = -_3379;
    float _3383 = _3357 + _3381;
    float _3385 = -_3379;
    float _3387 = _3351 + _3385;
    float _3389 = -_3379;
    float _3391 = _3363 + _3389;
    float _3393 = fma(_3383, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3379);
    float _3395 = fma(_3387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3379);
    float _3397 = fma(_3391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3379);
    bool _3399 = !_3361;
    if (!_3399)
    {
        float _3401 = -_2476;
        float _3403 = _3401 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3405 = -_2478;
        float _3407 = _3405 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3409 = -_2480;
        float _3411 = _3409 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3413 = _3403 * _3403;
        float _3415 = fma(_3407, _3407, _3413);
        float _3417 = fma(_3411, _3411, _3415);
        float _3419 = sqrt(_3417);
        float _3421 = rsqrt(_3417);
        float _3423 = -_3419;
        float _3425 = _3423 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3427 = _3425 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3429 = precise::clamp(_3427, 0.0, 1.0);
        float _3431 = _3407 * _3421;
        float _3433 = _3403 * _3421;
        float _3435 = abs(_3429);
        float _3437 = log2(_3435);
        float _3439 = _3411 * _3421;
        float _3441 = _3431 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3443 = _3069 * _3433;
        float _3445 = -_3433;
        float _3447 = -_3441;
        float _3449 = fma(_3445, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3447);
        float _3451 = fma(_3081, _3431, _3443);
        float _3453 = -_3439;
        float _3455 = fma(_3453, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3449);
        float _3457 = fma(_3083, _3439, _3451);
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3463 = _3455 + _3461;
        float _3465 = _3437 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3467 = _3463 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3469 = precise::clamp(_3467, 0.0, 1.0);
        float _3471 = exp2(_3465);
        float _3473 = _3471 * _3469;
        float _3475 = _3459 * _3473;
        float _3477 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3479 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3481 = _3475 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_100.x = _3477;
        out.m_100.y = _3479;
        out.m_100.z = _3481;
    }
    out.m_102.x = _3393;
    out.m_102.y = _3395;
    out.m_102.z = _3397;
    if (_3377)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3483 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_55.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3483;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

