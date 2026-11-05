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
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_100 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 m_94 [[user(locn14)]];
    float4 m_96 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_78 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3333 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_46.w;
    float _116 = in.m_48.w;
    float _118 = trunc(_114);
    int _121 = int(_118);
    float _123 = -_116;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _125;
    bool _129 = _121 >= 1;
    float _131 = 0.0;
    float _133 = _116;
    float _135 = _125;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _131;
    if (!_129)
    {
        out.m_53.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3643 = as_type<float>(_143);
        out.gl_Position.z = _3643;
    }
    if (!_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = in.m_55.x;
    float _159 = float(_121);
    bool _161 = _125 >= _159;
    bool _163 = !_155;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _133;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _125 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _145 = as_type<int>(_175);
    }
    int _177 = _145;
    out.m_57.x = _157;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_177);
        out.gl_Position.z = _3708;
    }
    out.m_51.x = _171;
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = in.m_68.x;
    float _201 = in.m_68.y;
    float _203 = in.m_68.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_207;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _183 * _189;
    float _225 = _183 * _195;
    float _227 = fma(_181, _187, _223);
    float _229 = _183 * _201;
    float _231 = fma(_181, _193, _225);
    float _233 = fma(_185, _191, _227);
    float _235 = fma(_181, _199, _229);
    float _237 = fma(_185, _197, _231);
    float _239 = fma(_185, _203, _235);
    bool _241 = !_213;
    float _257;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        _257 = _171;
    }
    _259 = false;
    float _261 = _257;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = _261 + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _275;
    float _279 = 1.0 / _269;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _283 = 1.0 / _273;
    bool _285 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _287 = isnan(_261);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = 1.0 / _277;
    float _299 = _265 * _279;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _261 + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = _261 + _305;
    float _309 = _303 * _283;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _323 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_261);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _307 * _297;
    bool _337 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_261);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_295;
    float _351 = _349 + 1.0;
    float _353 = -_347;
    float _355 = _353 + 1.0;
    float _357 = _347 * _351;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _363 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_261);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _333 * _355;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = -_333;
    float _383 = _381 + 1.0;
    float _385 = fma(_361, _309, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _387 = fma(_379, _309, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = _373 * _383;
    float _391 = in.m_70.x;
    float _393 = in.m_70.y;
    float _395 = -_373;
    float _397 = _395 + 1.0;
    float _399 = _319 * _389;
    float _401 = _321 * _389;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].x, _399);
    float _413 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _415 = fma(_405, _335, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _417 = fma(_409, _335, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_387, _375, _411);
    float _421 = fma(_385, _375, _413);
    float _423 = fma(_415, _357, _419);
    float _425 = fma(_417, _357, _421);
    float _427 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].x, _423);
    float _429 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].y, _425);
    float _431 = _427 * _391;
    float _433 = _429 * _393;
    bool _435 = !_281;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _173 = _449;
    }
    float _451 = _173;
    float _453 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _455 = int(_453);
    float _457 = in.m_55.z;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _461 = _451 + _459;
    float _463 = in.m_66.w;
    float _465 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _467 = int(_465);
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _471 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_451);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _487 = float(_455);
    float _489 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _491 = int(_489);
    float _493 = -_481;
    float _495 = _493 + 1.0;
    float _497 = float(uint(_467));
    float _499 = 1.0 / _487;
    bool _501 = _467 == 0;
    float _503 = float(_491);
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _507 = int(_505);
    float _509 = _499 * _125;
    float _511 = 1.0 / _503;
    float _513 = 1.0 / _497;
    float _515 = float(uint(_507));
    int _517 = ~_507;
    int _519 = _517 + 1;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _523 = _521 != 0;
    float _525 = trunc(_509);
    int _527 = int(_525);
    float _529 = _511 * _125;
    int _531 = ~_507;
    int _533 = _531 + 1;
    int _535 = ~_507;
    int _537 = _535 + 1;
    int _539 = as_type<int>(_513) + (-2);
    float _541 = 1.0 / _515;
    int _543 = ~_467;
    int _545 = _543 + 1;
    float _547 = _511;
    if (_523)
    {
        _547 = 1.0;
    }
    float _549 = _547;
    float _551 = float(uint(_527));
    float _553 = trunc(_529);
    int _555 = int(_553);
    float _557 = _549;
    if (!_523)
    {
        _557 = 7.345489978790283203125;
    }
    float _559 = _557;
    float _561 = as_type<float>(_539) * _551;
    float _563 = _559 * _157;
    float _565 = trunc(_561);
    float _567 = precise::max(_565, 0.0);
    uint _570 = uint(_567);
    int _572 = as_type<int>(_541) + (-2);
    float _574 = float(uint(_555));
    float _576 = 1.0 / _485;
    float _578 = _561;
    float _580 = _574;
    if (_523)
    {
        _578 = _157;
    }
    float _582 = _578;
    float _584 = _582;
    if (!_523)
    {
        _584 = _457;
    }
    float _586 = _584;
    float _588 = as_type<float>(_572) * _574;
    if (_523)
    {
        _580 = 1.0;
    }
    float _590 = _580;
    int _592 = _545 * int(_570);
    int _594 = _592 + _527;
    float _596 = trunc(_588);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    float _602 = _590;
    if (!_523)
    {
        _602 = 5.839270114898681640625;
    }
    float _604 = _602;
    float _606 = float(uint(_594));
    float _608 = as_type<float>(_539) * _606;
    float _610 = _604 * _586;
    int _612 = ~_467;
    int _614 = _612 + 1;
    float _616 = floor(_563);
    int _618 = _519 * int(_600);
    int _620 = _618 + _555;
    float _622 = trunc(_608);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    float _628 = float(uint(_620));
    float _630 = as_type<float>(_572) * _628;
    float _632 = float(_467);
    float _634 = floor(_610);
    float _636 = -_616;
    float _638 = _563 + _636;
    int _640 = int(_570) + int(_626);
    float _642 = trunc(_630);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    float _648 = float(_527);
    int _650 = _614 * _640;
    int _652 = _650 + _527;
    bool _654 = _648 >= _632;
    bool _656 = isnan(_648);
    bool _658 = _654 || _656;
    bool _660 = isnan(_632);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_634;
    float _668 = _610 + _666;
    float _670 = _638 * _632;
    bool _672 = uint(_652) >= uint(_467);
    float _674 = trunc(_664);
    int _676 = int(_674);
    bool _678 = !_672;
    int _680 = _678 ? 0 : (-1);
    int _682 = int(_600) + int(_646);
    int _684 = ~_640;
    int _686 = _684 + _680;
    int _688 = _686 + 1;
    float _690 = _167 * _125;
    float _692 = float(_507);
    int _694 = _533 * _682;
    int _696 = _694 + _555;
    float _698 = float(_555);
    int _700 = _467 * _688;
    int _702 = _700 + _527;
    float _704 = _632 * _690;
    bool _706 = _698 >= _692;
    bool _708 = isnan(_698);
    bool _710 = _706 || _708;
    bool _712 = isnan(_692);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    int _718 = ~_676;
    int _720 = _718 + 1;
    int _722 = _720 + 1;
    bool _724 = !_501;
    int _726 = _724 ? _702 : (-1);
    float _728 = _692 * _690;
    bool _730 = uint(_696) >= uint(_507);
    float _732 = _668 * _692;
    float _734 = trunc(_716);
    int _736 = int(_734);
    int _738 = _467 + (-1);
    int _740 = _726 * _722;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _748 = _746 != 0;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _752 = _750 != 0;
    bool _754 = !_730;
    int _756 = _754 ? 0 : (-1);
    int _758 = _676 * _738;
    int _760 = _758 + _740;
    float _762 = trunc(_670);
    int _764 = int(_762);
    int _766 = ~_682;
    int _768 = _766 + _756;
    int _770 = _768 + 1;
    bool _772 = !_744;
    int _774 = _772 ? 0 : 1;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _778 = _776 != 0;
    int _780 = abs(_774);
    float _782 = trunc(_704);
    int _784 = int(_782);
    bool _786 = !_778;
    int _788 = _786 ? 0 : 1;
    int _790 = _507 * _770;
    int _792 = _790 + _555;
    bool _794 = _507 == 0;
    bool _796 = !_748;
    int _798 = _796 ? 0 : 1;
    int _800 = abs(_788);
    float _802 = trunc(_728);
    int _804 = int(_802);
    int _806 = abs(_798);
    int _808 = ~_736;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    int _814 = _764 * _800;
    int _816 = _814 + _527;
    bool _818 = !_794;
    int _820 = _818 ? _792 : (-1);
    int _822 = _760 * _806;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _826 = _824 != 0;
    float _828 = trunc(_732);
    int _830 = int(_828);
    int _832 = _820 * _812;
    bool _834 = !_826;
    int _836 = _834 ? 0 : 1;
    bool _838 = !_752;
    int _840 = _838 ? 0 : 1;
    int _842 = _784 * _780;
    int _844 = _842 + _822;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _848 = _846 != 0;
    float _850 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _852 = log2(_850);
    int _854 = abs(_840);
    int _856 = _507 + (-1);
    bool _858 = !_848;
    int _860 = _858 ? 0 : 1;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _872 = _870 != 0;
    int _874 = _736 * _856;
    int _876 = _874 + _832;
    int _878 = abs(_860);
    int _880 = _816 * _854;
    int _882 = _880 + _844;
    int _884 = abs(_836);
    bool _886 = !_868;
    int _888 = _886 ? 0 : 1;
    int _890 = _830 * _884;
    int _892 = _890 + _555;
    bool _894 = !_864;
    int _896 = _894 ? 0 : 1;
    float _898 = _852 * _125;
    int _900 = abs(_888);
    int _902 = _764 * _878;
    int _904 = _902 + _882;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _908 = _906 != 0;
    bool _910 = !_872;
    int _912 = _910 ? 0 : 1;
    int _914 = _876 * _900;
    int _916 = abs(_896);
    float _918 = exp2(_898);
    bool _920 = !_908;
    int _922 = _920 ? 0 : 1;
    int _924 = abs(_912);
    int _926 = abs(_922);
    float _928 = float(uint(_904));
    int _930 = _804 * _916;
    int _932 = _930 + _914;
    float _934 = as_type<float>(_539) * _928;
    int _936 = ~_507;
    int _938 = _936 + 1;
    float _940 = float(uint(_892));
    int _942 = _892 * _924;
    int _944 = _942 + _932;
    float _946 = trunc(_934);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    int _952 = _830 * _926;
    int _954 = _952 + _944;
    int _956 = ~_467;
    int _958 = _956 + 1;
    int _960 = ~_507;
    int _962 = _960 + 1;
    float _964 = float(uint(_954));
    float _966 = as_type<float>(_572) * _964;
    int _968 = _958 * int(_950);
    int _970 = _968 + _904;
    float _972 = trunc(_966);
    float _974 = precise::max(_972, 0.0);
    uint _976 = uint(_974);
    float _978 = float(uint(_970));
    float _980 = as_type<float>(_539) * _978;
    float _982 = trunc(_980);
    float _984 = precise::max(_982, 0.0);
    uint _986 = uint(_984);
    int _988 = _962 * int(_976);
    int _990 = _988 + _954;
    float _992 = float(uint(_990));
    int _994 = ~_467;
    int _996 = _994 + 1;
    float _998 = as_type<float>(_572) * _992;
    int _1000 = int(_950) + int(_986);
    float _1002 = trunc(_998);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = _996 * _1000;
    int _1010 = _1008 + _904;
    bool _1012 = uint(_1010) >= uint(_467);
    bool _1014 = !_1012;
    int _1016 = _1014 ? 0 : (-1);
    int _1018 = int(_976) + int(_1006);
    int _1020 = ~_1000;
    int _1022 = _1020 + _1016;
    int _1024 = _1022 + 1;
    int _1026 = _938 * _1018;
    int _1028 = _1026 + _954;
    int _1030 = _467 * _1024;
    int _1032 = _1030 + _904;
    bool _1034 = uint(_1028) >= uint(_507);
    bool _1036 = !_501;
    int _1038 = _1036 ? _1032 : (-1);
    float _1040 = in.m_55.y;
    bool _1042 = !_1034;
    int _1044 = _1042 ? 0 : (-1);
    int _1046 = _1038 & 3;
    bool _1048 = _1046 != 0;
    int _1050 = _1038 & 3;
    bool _1052 = _1050 != 0;
    bool _1054 = uint(_1046) > 1u;
    int _1056 = ~_1018;
    int _1058 = _1056 + _1044;
    int _1060 = _1058 + 1;
    int _1062 = _1052 ? 0 : 1;
    bool _1064 = uint(_1046) >= 2u;
    int _1066 = _507 * _1060;
    int _1068 = _1066 + _954;
    int _1070 = ~_1062;
    int _1072 = _1070 + 1;
    int _1074 = _1072 + 1;
    int _1076 = _1064 ? 0 : 1;
    bool _1078 = !_794;
    int _1080 = _1078 ? _1068 : (-1);
    int _1082 = _1074;
    if (!_1054)
    {
        int _1084 = ~_1062;
        int _1086 = _1084 + 1;
        _1082 = _1086;
    }
    int _1088 = _1082;
    float _1090 = in.m_46.x;
    float _1092 = in.m_46.y;
    float _1094 = in.m_46.z;
    int _1096 = _1080 & 3;
    bool _1098 = _1096 != 0;
    bool _1100 = _1046 != 3;
    bool _1102 = uint(_1096) >= 2u;
    int _1104 = _1080 & 3;
    bool _1106 = _1104 != 0;
    int _1108 = _1102 ? 0 : 1;
    bool _1110 = _1096 != 3;
    int _1112 = ~_1076;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    int _1118 = ~_1108;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    int _1124 = _1116;
    int _1126 = _1122;
    if (_1100)
    {
        int _1128 = ~_1076;
        int _1130 = _1128 + 1;
        _1124 = _1130;
    }
    int _1132 = _1124;
    int _1134 = _1106 ? 0 : 1;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1138 = _1136 != 0;
    bool _1140 = uint(_1096) > 1u;
    float _1142 = _195 * _1092;
    float _1144 = _189 * _1092;
    float _1146 = _201 * _1092;
    if (_1110)
    {
        int _1148 = ~_1108;
        int _1150 = _1148 + 1;
        _1126 = _1150;
    }
    int _1152 = _1126;
    float _1154 = fma(_193, _1090, _1142);
    float _1156 = float(uint(_816));
    float _1158 = -_918;
    float _1160 = _1158 + 1.0;
    float _1162 = fma(_187, _1090, _1144);
    bool _1164 = _157 > 0.5;
    float _1166 = as_type<float>(_539) * _1156;
    bool _1168 = !_1138;
    int _1170 = _1168 ? 0 : 1;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1176 = _1174 != 0;
    float _1178 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1180 = -_217;
    int _1182 = _1164 ? as_type<int>(_1180) : as_type<int>(_217);
    float _1184 = trunc(_1166);
    float _1186 = precise::max(_1184, 0.0);
    uint _1188 = uint(_1186);
    float _1190 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1172);
    float _1192 = as_type<float>(_572) * _940;
    bool _1194 = !_1176;
    float _1196 = _1194 ? _217 : as_type<float>(_1182);
    float _1198 = -_469;
    float _1200 = fma(_1178, 2.0, _1198);
    bool _1202 = _1040 > 0.5;
    float _1204 = fma(_199, _1090, _1146);
    int _1206 = ~_1134;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = trunc(_1192);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    int _1218 = _1210;
    if (!_1140)
    {
        int _1220 = ~_1134;
        int _1222 = _1220 + 1;
        _1218 = _1222;
    }
    int _1224 = _1218;
    float _1226 = _157 * 2.0;
    float _1228 = -_221;
    int _1230 = _1202 ? as_type<int>(_1228) : as_type<int>(_221);
    float _1232 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1234 = ~_467;
    int _1236 = _1234 + 1;
    float _1238 = -_125;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1200);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1244 = _1242 != 0;
    float _1246 = floor(_1226);
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1250 = _1248 != 0;
    int _1252 = _1236 * int(_1188);
    int _1254 = _1252 + _816;
    bool _1256 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1258 = isnan(0.0);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_191, _1094, _1162);
    float _1268 = _1264 ? _1160 : 0.0;
    int _1270 = _537 * int(_1216);
    int _1272 = _1270 + _892;
    bool _1274 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1276 = isnan(1.0);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1282 = _1278 || _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1286 = 1.0 + _1284;
    float _1288 = float(uint(_1254));
    float _1290 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1190);
    float _1292 = _1040 * 2.0;
    float _1294 = 1.0 / _1286;
    float _1296 = as_type<float>(_539) * _1288;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1302 = ~_467;
    int _1304 = _1302 + 1;
    float _1306 = fma(_1232, -2.0, _1298);
    bool _1308 = !_1250;
    float _1310 = _1308 ? _221 : as_type<float>(_1230);
    float _1312 = trunc(_1296);
    float _1314 = precise::max(_1312, 0.0);
    uint _1316 = uint(_1314);
    float _1318 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1300);
    float _1320 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1306);
    bool _1322 = _1246 > 0.0;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1326 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1318);
    float _1328 = -_1290;
    float _1330 = _1328 + 1.0;
    if (_1282)
    {
        float _1332 = _1268 * _1294;
        _135 = _1332;
    }
    float _1334 = _135;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1338 = float(uint(_1272));
    float _1340 = floor(_1292);
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1344 = _1246 >= 0.0;
    bool _1346 = isnan(_1246);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan(0.0);
    bool _1352 = _1348 || _1350;
    float _1354 = as_type<float>(_572) * _1338;
    int _1356 = int(_1188) + int(_1316);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1360 = trunc(_1354);
    float _1362 = precise::max(_1360, 0.0);
    uint _1364 = uint(_1362);
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1370 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1376 = _1352 ? 0 : 1;
    int _1378 = _1304 * _1356;
    int _1380 = _1378 + _816;
    out.m_72.x = _1366;
    out.m_72.y = _1368;
    out.m_72.z = _1370;
    out.m_72.w = _1336;
    float _1382 = fma(_197, _1094, _1154);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1388 = ~_1376;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = fma(_203, _1094, _1204);
    float _1396 = _457 * 2.0;
    bool _1398 = uint(_1380) >= uint(_467);
    float _1400 = 1.0 / _1374;
    int _1402 = _1392;
    if (!_1322)
    {
        int _1404 = ~_1376;
        int _1406 = _1404 + 1;
        _1402 = _1406;
    }
    int _1408 = _1402;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1412 = _451 + _1410;
    int _1414 = ~_507;
    int _1416 = _1414 + 1;
    float _1418 = -_1326;
    float _1420 = _1418 + 1.0;
    int _1422 = int(_1216) + int(_1364);
    float _1424 = floor(_1396);
    bool _1426 = _1340 > 0.0;
    int _1428 = _1416 * _1422;
    int _1430 = _1428 + _892;
    bool _1432 = !_1398;
    int _1434 = _1432 ? 0 : (-1);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1440 = _1340 >= 0.0;
    bool _1442 = isnan(_1340);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.0);
    bool _1448 = _1444 || _1446;
    float _1450 = 1.0 / _1386;
    bool _1452 = !_1048;
    int _1454 = _1452 ? 0 : 1;
    int _1456 = _1448 ? 0 : 1;
    bool _1458 = uint(_1430) >= uint(_507);
    int _1460 = ~_1456;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    float _1466 = 1.0 / _1438;
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1476 = _1470 * _576;
    int _1478 = _1464;
    if (!_1426)
    {
        int _1480 = ~_1456;
        int _1482 = _1480 + 1;
        _1478 = _1482;
    }
    int _1484 = _1478;
    float _1486 = _157 + _1040;
    bool _1488 = !_1458;
    int _1490 = _1488 ? 0 : (-1);
    float _1492 = _1474 * _1400;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1496 = _1494 != 0;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1500 = _1498 != 0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1504 = _1502 != 0;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1506;
    float _1510 = in.m_64.w;
    float _1512 = _1486 + (-1.0);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1518 = !_1496;
    int _1520 = _1518 ? 0 : 1;
    float _1522 = _1508 * _1450;
    bool _1524 = _1424 >= 0.0;
    bool _1526 = isnan(_1424);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan(0.0);
    bool _1532 = _1528 || _1530;
    float _1534 = _1516 * _1466;
    bool _1536 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1538 = isnan(_451);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    int _1548 = _1532 ? 0 : 1;
    float _1550 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1552 = _1424 > 0.0;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1556 = _451 + _1554;
    bool _1558 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1560 = isnan(_451);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = in.m_68.w;
    float _1572 = -_1546;
    float _1574 = _1572 + 1.0;
    float _1576 = fma(_1476, _1556, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1578 = abs(_1224);
    float _1580 = _1568 * _1574;
    float _1582 = -_1568;
    float _1584 = _1582 + 1.0;
    float _1586 = fma(_1492, _1412, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1588 = fma(_1522, _461, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1590 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1592 = isnan(_451);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1598 = _1594 || _1596;
    float _1600 = float(_1598);
    float _1602 = _481 * _1584;
    bool _1604 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1606 = isnan(_451);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1618 = _451 + _1616;
    float _1620 = _1196 + 0.5;
    float _1622 = _1600 * _495;
    float _1624 = -_1600;
    float _1626 = _1624 + 1.0;
    float _1628 = _1266 + _1510;
    float _1630 = _1310 + (-0.5);
    float _1632 = _1382 + _463;
    float _1634 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1240);
    float _1636 = _1614 * _1626;
    float _1638 = -_1630;
    float _1640 = -_1320;
    float _1642 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1640);
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1646 = _1632 + _1644;
    float _1648 = -_1614;
    float _1650 = _1648 + 1.0;
    float _1652 = _1576 * _1636;
    float _1654 = -_1420;
    float _1656 = fma(_1196, _1654, _1634);
    float _1658 = fma(_1310, _1330, _1642);
    float _1660 = _1394 + _1570;
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1664 = _1628 + _1662;
    float _1666 = _1646 * _1646;
    float _1668 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1652);
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1672 = _1660 + _1670;
    float _1674 = fma(_1534, _1618, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1676 = fma(_1664, _1664, _1666);
    float _1678 = fma(_1586, _1622, _1668);
    int _1680 = _1038 >> 31;
    out.m_74.x = _1656;
    out.m_74.y = _1658;
    float _1682 = fma(_1672, _1672, _1676);
    float _1684 = fma(_1588, _1602, _1678);
    int _1686 = _1680 & 3;
    float _1688 = rsqrt(_1682);
    float _1690 = fma(_1674, _1580, _1684);
    int _1692 = _1080 >> 31;
    float _1694 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1696 = ~_1548;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    float _1702 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1690);
    int _1704 = _1038 + _1686;
    float _1706 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1708 = _1692 & 3;
    int _1710 = _1700;
    if (!_1552)
    {
        int _1712 = ~_1548;
        int _1714 = _1712 + 1;
        _1710 = _1714;
    }
    int _1716 = _1710;
    float _1718 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1706);
    int _1720 = _1704 >> 2;
    int _1722 = _1080 + _1708;
    float _1724 = _1694 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1726 = _1720 << 4;
    int _1728 = _1726 + 368;
    float _1730 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1718);
    bool _1732 = !_1098;
    int _1734 = _1732 ? 0 : 1;
    float _1736 = _1724 * _1688;
    int _1738 = _1722 >> 2;
    uint _1740 = uint(int(uint(_1728) >> uint(2)));
    uint _1742 = uint(int(uint(int(_1740)) >> uint(2)));
    int _1744 = int(_1740) & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    int _1748 = int(_1740) + 1;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    int _1752 = _1748 & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    bool _1756 = _1046 != 3;
    float _1758 = _1646 * _1736;
    int _1760 = _1738 << 4;
    int _1762 = _1760 + 656;
    bool _1764 = !_1756;
    int _1766 = _1764 ? 0 : (-1);
    float _1768 = -_1758;
    float _1770 = _1646 + _1768;
    bool _1772 = _1096 != 3;
    float _1774 = _1664 * _1736;
    uint _1776 = uint(int(uint(_1762) >> uint(2)));
    uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
    int _1780 = int(_1776) & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = int(_1776) + 1;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    int _1788 = _1784 & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    float _1792 = _1770 * _1770;
    float _1794 = -_1774;
    float _1796 = _1664 + _1794;
    int _1798 = abs(_1520);
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1802 = fma(_1796, _1796, _1792);
    int _1804 = _1728 + 8;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    uint _1808 = uint(int(uint(int(_1806)) >> uint(2)));
    int _1810 = int(_1806) & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    int _1814 = int(_1806) + 1;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    int _1818 = _1814 & 3;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[int(_1816)][_1818];
    bool _1822 = !_1772;
    int _1824 = _1822 ? 0 : (-1);
    float _1826 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1828 = _1730 >= 0.0;
    int _1830 = _1762 + 8;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
    int _1836 = int(_1832) & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    int _1840 = int(_1832) + 1;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    int _1844 = _1840 & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    float _1848 = float(_1716);
    float _1850 = _1672 * _1736;
    float _1852 = _1702 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1858 = ~_1356;
    int _1860 = _1858 + _1434;
    int _1862 = _1860 + 1;
    float _1864 = -_1850;
    float _1866 = _1672 + _1864;
    float _1868 = _1854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1872 = abs(_1734);
    int _1874 = _467 * _1862;
    int _1876 = _1874 + _816;
    int _1878 = abs(_1088);
    float _1880 = fma(_1866, _1866, _1802);
    out.m_76.x = _1868;
    out.m_76.y = _1870;
    out.m_76.z = _1826;
    out.m_76.w = _1852;
    int _1882 = abs(_1454);
    int _1884 = abs(_1132);
    if (_1828)
    {
        out.m_53.x = 0.0;
    }
    int _1886 = abs(_1152);
    int _1888 = abs(_1766);
    int _1890 = ~_1422;
    int _1892 = _1890 + _1490;
    int _1894 = _1892 + 1;
    float _1896 = float(_1798);
    bool _1898 = !_501;
    int _1900 = _1898 ? _1876 : (-1);
    int _1902 = _507 * _1894;
    int _1904 = _1902 + _892;
    int _1906 = ~_1878;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = _1896 * _1848;
    int _1914 = ~_1882;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    int _1920 = _1910 * as_type<int>(_1754);
    int _1922 = ~_1578;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    int _1928 = _1918 * as_type<int>(_1746);
    int _1930 = _1928 + _1920;
    int _1932 = ~_1872;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    int _1938 = _1926 * as_type<int>(_1790);
    int _1940 = ~_1884;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    int _1946 = _1936 * as_type<int>(_1782);
    int _1948 = _1946 + _1938;
    int _1950 = abs(_1824);
    int _1952 = _1944 * as_type<int>(_1812);
    int _1954 = _1952 + _1930;
    int _1956 = ~_1886;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    float _1962 = in.m_78.x;
    float _1964 = in.m_78.y;
    float _1966 = in.m_78.z;
    bool _1968 = !_1244;
    int _1970 = _1968 ? 0 : 1;
    int _1972 = _1960 * as_type<int>(_1838);
    int _1974 = _1972 + _1948;
    int _1976 = ~_1888;
    int _1978 = _1976 + 1;
    int _1980 = _1978 + 1;
    int _1982 = abs(_1170);
    float _1984 = sqrt(_1880);
    int _1986 = ~_1950;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = _1980 * as_type<int>(_1820);
    int _1994 = _1992 + _1954;
    int _1996 = abs(_1970);
    int _1998 = ~_1982;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _1990 * as_type<int>(_1846);
    int _2006 = _2004 + _1974;
    int _2008 = ~_1996;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    bool _2014 = !_794;
    int _2016 = _2014 ? _1904 : (-1);
    int _2018 = _1994 * _2002;
    float _2020 = as_type<float>(_1980);
    if (_1828)
    {
        _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2022 = _2020;
    int _2024 = _2006 * _2012;
    float _2026 = _1912 * (-2.0);
    int _2028 = _1900 * _1982;
    int _2030 = _2028 + _2018;
    float _2032 = _157 + (-0.5);
    int _2034 = _2016 * _1996;
    int _2036 = _2034 + _2024;
    float _2038 = fma(_1550, _2026, _1550);
    float _2040 = _1688 * _1984;
    float _2042 = fma(_2026, _1962, _1962);
    int _2044 = as_type<int>(_2022);
    float _2046 = _1966;
    float _2048 = _2040;
    if (_1828)
    {
        float _2050 = _2022 * 5.0;
        _2044 = as_type<int>(_2050);
    }
    int _2052 = _2044;
    float _2054 = float(_2030);
    float _2056 = _1694 * _2040;
    float _2058 = float(_2036);
    float _2060 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2042);
    float _2062 = _1040 + _457;
    bool _2064 = !_1500;
    int _2066 = _2064 ? 0 : 1;
    if (_1828)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6434 = as_type<float>(_2052);
        out.gl_Position.z = _6434;
    }
    float _2068 = _2062 + (-1.0);
    float _2070 = float(_1408);
    out.m_80.x = _2054;
    int _2072 = abs(_2066);
    out.m_80.z = _2058;
    out.m_82.x = _2056;
    bool _2074 = !_1504;
    int _2076 = _2074 ? 0 : 1;
    if (_1828)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2078 = -_1758;
    float _2080 = _1632 + _2078;
    int _2082 = abs(_2076);
    float _2084 = -_1774;
    float _2086 = _1628 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2090 = _2080 + _2088;
    float _2092 = -_1850;
    float _2094 = _1660 + _2092;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2098 = _2086 + _2096;
    float _2100 = float(_2072);
    float _2102 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2104 = float(_1484);
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2108 = _2094 + _2106;
    float _2110 = float(_2082);
    float _2112 = _2100 * _2070;
    float _2114 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2102);
    float _2116 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2118 = _1040 + (-0.5);
    float _2120 = _2110 * _2104;
    float _2122 = _2112 * (-2.0);
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2114);
    float _2126 = _157 + _457;
    float _2128 = fma(_2038, _1334, _2060);
    float _2130 = fma(_2122, _1964, _1964);
    float _2132 = fma(_2116, _2122, _2116);
    bool _2134 = _2124 >= 0.0;
    float _2136 = _2126 + (-1.0);
    float _2138 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2130);
    float _2140 = _2120 * (-2.0);
    float _2142 = _2128 * 0.15915493667125701904296875;
    float _2144 = fma(_2132, _1334, _2138);
    float _2146 = _457 + (-0.5);
    float _2148 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2150 = fma(_2140, _1966, _1966);
    float _2152 = _2144 * 0.15915493667125701904296875;
    float _2154 = _2142 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    float _2158 = fma(_2148, _2140, _2148);
    if (_2134)
    {
        _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2160 = _2046;
    float _2162 = fma(_2146, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2150);
    int _2164 = as_type<int>(_2160);
    if (_2134)
    {
        out.m_53.x = 0.0;
    }
    if (_2134)
    {
        float _2166 = _2160 * 5.0;
        _2164 = as_type<int>(_2166);
    }
    int _2168 = _2164;
    float _2170 = _2142 * 6.283185482025146484375;
    float _2172 = cos(_2170);
    float _2174 = fma(_2158, _1334, _2162);
    if (_2134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6621 = as_type<float>(_2168);
        out.gl_Position.z = _6621;
    }
    float _2176 = _2174 * 0.15915493667125701904296875;
    float _2178 = _2152 * 6.283185482025146484375;
    float _2180 = sin(_2178);
    float _2182 = _2152 * 6.283185482025146484375;
    float _2184 = cos(_2182);
    if (_2134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2186 = _2176 * 6.283185482025146484375;
    float _2188 = cos(_2186);
    float _2190 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _2194 = _2172 * _2180;
    float _2196 = _2156 * _2180;
    float _2198 = _2190 * _2040;
    float _2200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2202 = _2156 * _2184;
    float _2204 = _2176 * 6.283185482025146484375;
    float _2206 = sin(_2204);
    float _2208 = _2198 * _2192;
    float _2210 = _2172 * _2184;
    float _2212 = _2056 * _2200;
    float _2214 = _2172 * _2188;
    float _2216 = _2184 * _2188;
    float _2218 = _2156 * _2188;
    float _2220 = _2180 * _2188;
    float _2222 = _2214 * _2208;
    float _2224 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2226 = _2224 * 0.5;
    float _2228 = fma(_2206, _2210, _2196);
    float _2230 = -_2202;
    float _2232 = fma(_2206, _2194, _2230);
    float _2234 = -_2208;
    float _2236 = _2206 * _2234;
    float _2238 = -_2194;
    float _2240 = fma(_2206, _2202, _2238);
    float _2242 = fma(_2228, _2212, _2222);
    float _2244 = _2218 * _2208;
    float _2246 = fma(_2216, _2212, _2236);
    float _2248 = fma(_2206, _2196, _2210);
    float _2250 = fma(_2232, _2226, _2242);
    float _2252 = fma(_2240, _2212, _2244);
    float _2254 = fma(_2220, _2226, _2246);
    float _2256 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2258 = fma(_2248, _2226, _2252);
    float _2260 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2262 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2264 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2256);
    float _2266 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2260);
    float _2268 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2262);
    float _2270 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2264);
    float _2272 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2266);
    float _2274 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2268);
    float _2276 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2278 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2280 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2282 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2284 = _1660 + _2276;
    float _2286 = _1628 + _2280;
    float _2288 = _1632 + _2282;
    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2292 = _2284 + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2296 = _2286 + _2294;
    float _2298 = _2292 * _2292;
    float _2300 = fma(_2296, _2296, _2298);
    float _2302 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2278);
    float _2304 = sqrt(_2300);
    float _2306 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2302);
    bool _2308 = _2304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = _2282;
    float _2312 = _2286;
    float _2314 = _2302;
    if (!_2308)
    {
        _2310 = _2286;
    }
    float _2316 = _2310;
    float _2318 = _2316;
    if (!_2308)
    {
        _2312 = _2284;
    }
    float _2320 = _2312;
    float _2322 = _2320;
    if (!_2308)
    {
        _2314 = _2288;
    }
    float _2324 = _2314;
    bool _2326 = !_2308;
    float _2328 = _2324;
    if (!_2326)
    {
        float _2330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2334 = _2304 + _2332;
        float _2336 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2338 = rsqrt(_2300);
        float _2340 = _2334 * _2330;
        float _2342 = _2340 * 0.15915493667125701904296875;
        float _2344 = _2342 * 6.283185482025146484375;
        float _2346 = cos(_2344);
        float _2348 = _2342 * 6.283185482025146484375;
        float _2350 = sin(_2348);
        float _2352 = _2346 + (-1.0);
        float _2354 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2356 = fma(_2350, _2336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2358 = fma(_2288, _2346, _2354);
        float _2360 = _2338 * _2356;
        float _2362 = fma(_2296, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2364 = fma(_2292, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2328 = _2358;
        _2318 = _2362;
        _2322 = _2364;
    }
    float _2366 = _2328;
    float _2368 = _2318;
    float _2370 = _2322;
    float _2372 = -_1632;
    float _2374 = _2372 + _2366;
    float _2376 = -_1628;
    float _2378 = _2376 + _2368;
    float _2380 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2382 = -_1660;
    float _2384 = _2382 + _2370;
    float _2386 = _2374 * _2374;
    float _2388 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2390 = 1.0 / _2380;
    float _2392 = fma(_2378, _2378, _2386);
    float _2394 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2388);
    bool _2396 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2398 = isnan(0.5);
    bool _2400 = _2396 || _2398;
    bool _2402 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2404 = _2400 || _2402;
    float _2406 = fma(_2384, _2384, _2392);
    float _2408 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2394);
    float _2410 = sqrt(_2406);
    float _2412 = _2408 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2414 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2416 = isnan(0.5);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2422 = _2418 || _2420;
    float _2424 = _2412 + _2380;
    float _2426 = _2424 * _2390;
    float _2428 = _2426 * 0.5;
    bool _2430 = _2410 > 0.0;
    float _2432 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2434 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2432);
    float _2436 = 1.0 / _2434;
    float _2438 = _2428;
    float _2440 = _2368;
    float _2442 = _2366;
    float _2444 = _2390;
    float _2446 = _2370;
    if (!_2430)
    {
        _2438 = _2370;
    }
    float _2448 = _2438;
    bool _2450 = !_2430;
    float _2452 = _2448;
    if (!_2450)
    {
        float _2454 = _237 * _237;
        float _2456 = rsqrt(_2406);
        float _2458 = fma(_233, _233, _2454);
        float _2460 = fma(_239, _239, _2458);
        float _2462 = sqrt(_2460);
        float _2464 = _2378 * _2456;
        float _2466 = _2374 * _2456;
        float _2468 = _2384 * _2456;
        bool _2470 = _2462 > 0.0;
        float _2472 = _2462;
        if (!_2470)
        {
            _2472 = _2370;
        }
        float _2474 = _2472;
        bool _2476 = !_2470;
        _2452 = _2474;
        if (!_2476)
        {
            float _2478 = rsqrt(_2460);
            float _2480 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2482 = _237 * _2478;
            float _2484 = _233 * _2478;
            float _2486 = _2466 * _2482;
            float _2488 = _239 * _2478;
            float _2490 = fma(_2464, _2484, _2486);
            float _2492 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2494 = fma(_2468, _2488, _2490);
            float _2496 = _2494 * _2492;
            float _2498 = fma(_233, _2496, _2368);
            float _2500 = fma(_237, _2496, _2366);
            float _2502 = fma(_239, _2496, _2370);
            _2440 = _2498;
            _2442 = _2500;
            _2452 = _2502;
            _2444 = _2492;
        }
    }
    float _2504 = _2440;
    float _2506 = _2442;
    float _2508 = _2452;
    float _2510 = _2444;
    float _2512 = -_1774;
    float _2514 = _2512 + _2504;
    float _2516 = -_1758;
    float _2518 = _2516 + _2506;
    float _2520 = -_1850;
    float _2522 = _2520 + _2508;
    float _2524 = _2518;
    float _2526 = _2514;
    float _2528 = _2522;
    float _2530 = _2510;
    if (_2422)
    {
        _2446 = 1.0;
    }
    float _2532 = _2446;
    float _2534 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2536 = _2436 * _2534;
    float _2538 = _2532;
    if (!_2404)
    {
        float _2540 = _2090 * _2090;
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2544 = -_1660;
        float _2546 = _2544 + _2508;
        float _2548 = -_1632;
        float _2550 = _2548 + _2506;
        float _2552 = fma(_2098, _2098, _2540);
        float _2554 = -_1628;
        float _2556 = _2554 + _2504;
        float _2558 = fma(_2108, _2108, _2552);
        float _2560 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2562 = sqrt(_2558);
        float _2564 = 1.0 / _2040;
        float _2566 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2568 = precise::min(_2562, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2570 = _2568 * _2542;
        float _2572 = _2570 * _2564;
        float _2574 = _2566 * _2572;
        float _2576 = _2546 * _2572;
        float _2578 = fma(_2550, _2574, _2080);
        float _2580 = fma(_2556, _2574, _2086);
        float _2582 = fma(_2566, _2576, _2094);
        _2524 = _2578;
        _2526 = _2580;
        _2528 = _2582;
    }
    float _2584 = _2524;
    float _2586 = _2526;
    float _2588 = _2528;
    if (!_2422)
    {
        float _2590 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2592 = _2590 * 0.15915493667125701904296875;
        float _2594 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2596 = _2592 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        float _2600 = _2594 * 0.15915493667125701904296875;
        float _2602 = _2592 * 6.283185482025146484375;
        float _2604 = sin(_2602);
        float _2606 = 1.0 / _2598;
        float _2608 = _2600 * 6.283185482025146484375;
        float _2610 = cos(_2608);
        float _2612 = _2604 * _2606;
        float _2614 = _2600 * 6.283185482025146484375;
        float _2616 = sin(_2614);
        float _2618 = _2610 * _2612;
        float _2620 = 1.0 / _2618;
        float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2624 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2622;
        float _2626 = 1.0 / _2624;
        float _2628 = _2616 * _2620;
        float _2630 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2632 = fma(_2536, _2628, _2630);
        float _2634 = _2632 * _2626;
        float _2636 = precise::clamp(_2634, 0.0, 1.0);
        _2048 = _2600;
        _2538 = _2636;
    }
    float _2638 = _2048;
    float _2640 = _2538;
    float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2644 = _2584 + _2642;
    float _2646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2648 = _2586 + _2646;
    float _2650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2652 = _2588 + _2650;
    float _2654 = _2644 * _2644;
    float _2656 = fma(_2648, _2648, _2654);
    float _2658 = fma(_2652, _2652, _2656);
    float _2660 = rsqrt(_2658);
    float _2662 = sqrt(_2658);
    float _2664 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2666 = _2648 * _2664;
    float _2668 = _2652 * _2664;
    float _2670 = _2666 * _2666;
    float _2672 = _2668 * _2668;
    float _2674 = _2670 + _2672;
    float _2676 = sqrt(_2674);
    bool _2678 = _2676 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2682 = _2676 + _2680;
    float _2684 = _2652;
    float _2686 = _2674;
    float _2688 = _2682;
    float _2690 = _2654;
    if (_2678)
    {
        float _2692 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2684 = _2692;
    }
    float _2694 = _2684;
    if (_2678)
    {
        float _2696 = rsqrt(_2674);
        _2686 = _2696;
    }
    float _2698 = _2686;
    float _2700 = _2698;
    if (_2678)
    {
        float _2702 = _2682 * _2694;
        _2688 = _2702;
    }
    float _2704 = _2688;
    if (_2678)
    {
        float _2706 = _2704 * 0.15915493667125701904296875;
        _2690 = _2706;
    }
    float _2708 = _2690;
    float _2710 = _2694;
    float _2712 = _2708;
    if (_2678)
    {
        float _2714 = _2708 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        _2710 = _2716;
    }
    float _2718 = _2710;
    float _2720 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2722 = precise::max(0.0, _2720);
    float _2724 = _2638;
    float _2726 = _2722;
    if (_2678)
    {
        float _2728 = _2708 * 6.283185482025146484375;
        float _2730 = cos(_2728);
        _2724 = _2730;
    }
    float _2732 = _2724;
    float _2734 = -_2664;
    float _2736 = -_2722;
    float _2738 = fma(_2644, _2734, _2736);
    float _2740 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2678)
    {
        float _2742 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2726 = _2742;
    }
    float _2744 = _2726;
    float _2746 = _2744;
    if (!_2678)
    {
        _2712 = _2666;
    }
    float _2748 = _2712;
    float _2750 = fma(_2086, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2752 = _2718;
    float _2754 = _2748;
    if (_2678)
    {
        float _2756 = fma(_2718, _2744, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2752 = _2756;
    }
    float _2758 = _2752;
    float _2760 = _2758;
    if (!_2678)
    {
        _2746 = _2738;
    }
    float _2762 = _2746;
    float _2764 = _2762;
    float _2766 = _2732;
    if (_2678)
    {
        float _2768 = _2732 + (-1.0);
        _2740 = _2768;
    }
    float _2770 = _2740;
    float _2772 = _2770;
    if (_2678)
    {
        float _2774 = _2698 * _2758;
        _2530 = _2774;
    }
    float _2776 = _2530;
    if (!_2678)
    {
        _2700 = _2668;
    }
    float _2778 = _2700;
    float _2780 = _2778;
    if (_2678)
    {
        float _2782 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2772 = _2782;
    }
    float _2784 = _2772;
    if (_2678)
    {
        float _2786 = _2666 * _2776;
        _2754 = _2786;
    }
    float _2788 = _2754;
    if (!_2678)
    {
        _2760 = _2670;
    }
    float _2790 = _2760;
    float _2792 = _2790;
    if (_2678)
    {
        float _2794 = _2668 * _2776;
        _2780 = _2794;
    }
    float _2796 = _2780;
    if (_2678)
    {
        float _2798 = fma(_2738, _2732, _2784);
        _2764 = _2798;
    }
    float _2800 = _2764;
    if (_2678)
    {
        float _2802 = _2788 * _2788;
        _2792 = _2802;
    }
    float _2804 = _2792;
    if (!_2678)
    {
        _2766 = _2672;
    }
    float _2806 = _2766;
    float _2808 = _2806;
    if (_2678)
    {
        float _2810 = _2796 * _2796;
        _2808 = _2810;
    }
    float _2812 = _2808;
    float _2814 = fma(_2800, _2800, _2804);
    float _2816 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2818 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2820 = floor(_2750);
    float _2822 = _2814 + _2812;
    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2826 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2824);
    float _2828 = precise::clamp(_2826, 0.0, 1.0);
    float _2830 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2816);
    float _2832 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2818);
    float _2834 = -_2828;
    float _2836 = _2834 + 1.0;
    float _2838 = rsqrt(_2822);
    float _2840 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2830);
    float _2842 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2844 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2846 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2848 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2850 = abs(_2836);
    float _2852 = log2(_2850);
    float _2854 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2856 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2846);
    float _2858 = _2848 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2860 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2854);
    float _2862 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2856);
    float _2864 = -_2858;
    float _2866 = fma(_2864, _2842, 1.0);
    float _2868 = _2838 * _2788;
    float _2870 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2860);
    float _2872 = _2838 * _2800;
    float _2874 = _2838 * _2796;
    float _2876 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2878 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2880 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2882 = floor(_2844);
    float _2884 = -_2876;
    float _2886 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2884);
    float _2888 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2890 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2892 = -_2874;
    float _2894 = fma(_2892, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2886);
    float _2896 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2832);
    float _2898 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2888);
    float _2900 = log2(_2866);
    float _2902 = -_2820;
    float _2904 = _2750 + _2902;
    float _2906 = _2896 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2908 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2898);
    float _2910 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2912 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2908);
    float _2914 = exp2(_2890);
    float _2916 = fma(_2894, -0.5, 0.5);
    float _2918 = -_2882;
    float _2920 = _2844 + _2918;
    float _2922 = fma(_2894, 0.5, 0.5);
    float _2924 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2910);
    float _2926 = fma(_2922, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2928 = sqrt(_2916);
    float _2930 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2932 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2924);
    float _2934 = fma(_2922, _2926, -0.212114393711090087890625);
    float _2936 = _2900 * 0.693147182464599609375;
    float _2938 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2930);
    float _2940 = 1.0 / _2912;
    float _2942 = _2872 + 1.0;
    float _2944 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2938);
    float _2946 = fma(_2922, _2934, 1.570728778839111328125);
    float2 _7852 = float2(_2904, _2920);
    float _2948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7852, float2(0.0), isnan(_7852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7852, float2(0.0), isnan(_7852)), level(0.0)).x;
    float _2950 = -_2872;
    float _2952 = fma(_2914, _2942, _2950);
    float _2954 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2932);
    float _2956 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2944);
    float _2958 = _2928 * 0.636619746685028076171875;
    float _2960 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2962 = fma(_2952, 0.5, 0.5);
    float _2964 = -_2946;
    float _2966 = fma(_2958, _2964, 1.0);
    float _2968 = _2954 * _2940;
    float _2970 = _2956 * _2940;
    float _2972 = fma(_2968, 0.5, 0.5);
    float _2974 = fma(_2970, -0.5, 0.5);
    float3 _7903 = float3(_2972, _2974, _2960);
    float _2976 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7903, float3(0.0), isnan(_7903)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7903, float3(0.0), isnan(_7903)), level(0.0)).x;
    float3 _7914 = float3(_2972, _2974, _2960);
    float4 _2979 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7914, float3(0.0), isnan(_7914)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7914, float3(0.0), isnan(_7914)), level(0.0)).xyzw;
    float _2981 = _2979.x;
    float _2983 = _2979.y;
    float _2985 = _2979.z;
    float _2987 = _2979.w;
    float2 _7930 = float2(_2966, _2962);
    float3 _2991 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7930, float2(0.0), isnan(_7930)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7930, float2(0.0), isnan(_7930)), level(0.0)).xyz;
    float _2993 = _2991.x;
    float _2995 = _2991.y;
    float _2997 = _2991.z;
    float _2999 = abs(_2536);
    float _3001 = log2(_2999);
    float _3003 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3005 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3007 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3009 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3011 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3003);
    float _3013 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3005);
    float _3015 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3007);
    float _3017 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3019 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3021 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3023 = -_2206;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3017);
    float _3027 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3029 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3031 = isnan(_2662);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3037 = _3033 || _3035;
    float _3039 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3041 = -_2206;
    float _3043 = fma(_3041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3021);
    float _3045 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3047 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3049 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3027);
    float _3051 = -_2206;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3019);
    float _3055 = exp2(_3039);
    float _3057 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3047);
    float _3059 = fma(_3009, _3009, 1.0);
    float _3061 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3045);
    float _3063 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3025);
    float _3065 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3053);
    float _3067 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3043);
    float _3069 = rsqrt(_3059);
    float _3071 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3011);
    float _3073 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3075 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3061);
    float _3077 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3049);
    float _3079 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3057);
    float _3081 = _3009 * _3063;
    float _3083 = fma(_3055, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3085 = precise::clamp(_3083, 0.0, 1.0);
    float _3087 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3013);
    float _3089 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3091 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3015);
    float _3093 = fma(_3085, -2.0, 3.0);
    float _3095 = _3085 * _3085;
    float _3097 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3089);
    float _3099 = _3009 * _3069;
    float _3101 = _3095 * _3093;
    float _3103 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3097);
    float _3105 = fma(_3073, _3071, _3081);
    float _3107 = -_3075;
    float _3109 = _3099 * _3107;
    float _3111 = -_3101;
    float _3113 = _3111 + 1.0;
    float _3115 = _3009 * _3065;
    float _3117 = in.m_84.x;
    float _3119 = fma(_3069, _3063, _3109);
    float _3121 = fma(_3113, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3101);
    float _3123 = -_3077;
    float _3125 = _3099 * _3123;
    out.m_86.x = _3071;
    out.m_86.y = _3087;
    out.m_86.z = _3091;
    float _3127 = fma(_3073, _3087, _3115);
    float _3129 = _3009 * _3067;
    float _3131 = fma(_3069, _3065, _3125);
    float _3133 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3103);
    float _3135 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3137 = fma(_3073, _3091, _3129);
    float _3139 = _3133 + _2912;
    out.gl_Position.x = _2954;
    out.gl_Position.y = _2956;
    out.gl_Position.z = _3133;
    out.gl_Position.w = _2912;
    float _3141 = exp2(_3135);
    bool _3143 = _2536 <= 8000.0;
    bool _3145 = isnan(_2536);
    bool _3147 = _3143 || _3145;
    bool _3149 = isnan(8000.0);
    bool _3151 = _3147 || _3149;
    float _3153 = float(_3151);
    float _3155 = -_3079;
    float _3157 = _3099 * _3155;
    float _3159 = _2954 + _2912;
    float _3161 = _3079 + _3137;
    float _3163 = _3139 * 0.5;
    float _3165 = _3153 * _3121;
    float _3167 = fma(_3069, _3067, _3157);
    float _3169 = _2912 * 0.5;
    float _3171 = _3077 + _3127;
    float _3173 = _3165 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3175 = fma(_2956, -0.5, _3169);
    float _3177 = _3075 + _3105;
    float _3179 = _3159 * 0.5;
    out.m_88.x = _3119;
    out.m_88.y = _3131;
    out.m_88.z = _3167;
    float _3181 = -_3141;
    float _3183 = _3181 + 1.0;
    float _3185 = _2912;
    float _3187 = _3133;
    float _3189 = _3131;
    float _3191 = _3119;
    if (!_3037)
    {
        _3185 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3193 = _3185;
    out.m_90.x = _3177;
    out.m_90.y = _3171;
    out.m_90.z = _3161;
    float _3195 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3197 = _3193;
    float _3199 = _3193;
    if (!_3037)
    {
        _3187 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3201 = _3187;
    out.m_92.x = _3179;
    out.m_92.y = _3175;
    out.m_92.z = _3163;
    out.m_92.w = _2912;
    float _3203 = -_3195;
    float _3205 = _3203 + 1.0;
    float _3207 = _3205;
    float _3209 = _3201;
    float _3211 = _3201;
    if (!_3037)
    {
        _3189 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3213 = _3189;
    float _3215 = _3213;
    float _3217 = _3213;
    if (!_3037)
    {
        _3191 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3219 = _3191;
    float _3221 = _2640 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3223 = -_2948;
    float _3225 = _3223 + 1.0;
    float _3227 = _3225 * _3173;
    float _3229 = precise::clamp(_3227, 0.0, 1.0);
    float _3231 = -_3229;
    float _3233 = fma(_3231, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3235 = _3233 * _3117;
    float _3237 = _3235 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3239 = _3195 * _2976;
    float _3241 = _2987 * _3205;
    out.m_94.x = _3237;
    float _3243 = _3219;
    float _3245 = _3219;
    if (!_3037)
    {
        _3207 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3247 = _3207;
    float _3249 = _2987 * _3239;
    float _3251 = _2997 * _3239;
    float _3253 = fma(_2993, _3249, _2981);
    float _3255 = fma(_2995, _3249, _2983);
    float _3257 = fma(_2987, _3251, _2985);
    float _3259 = _3249;
    float _3261 = _3247;
    float _3263 = _3247;
    if (!_3037)
    {
        _3259 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3265 = _3259;
    out.m_96.x = _3253;
    out.m_96.y = _3255;
    out.m_96.z = _3257;
    out.m_96.w = _3241;
    bool _3267 = !_3037;
    float _3269 = _3265;
    float _3271 = _3265;
    if (!_3267)
    {
        bool _3273 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3275 = isnan(_2662);
        bool _3277 = _3273 || _3275;
        bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3281 = _3277 || _3279;
        if (!_3281)
        {
            float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3285 = _2662 + _3283;
            float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3289 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3287;
            float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3293 = _3291 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3295 = 1.0 / _3289;
            float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3313 = _3285 * _3295;
            float _3315 = precise::clamp(_3313, 0.0, 1.0);
            float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3321 = fma(_3315, _3293, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3323 = fma(_3315, _3319, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3325 = fma(_3315, _3299, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3327 = fma(_3315, _3303, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3329 = fma(_3315, _3307, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3331 = fma(_3315, _3311, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3245 = _3325;
            _3271 = _3329;
            _3217 = _3321;
            _3211 = _3327;
            _3199 = _3323;
            _3263 = _3331;
            _3333 = true;
        }
        else
        {
            bool _3335 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3337 = isnan(_2662);
            bool _3339 = _3335 || _3337;
            bool _3341 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3343 = _3339 || _3341;
            if (!_3343)
            {
                _3215 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3345 = _3215;
            _3217 = _3345;
            if (!_3343)
            {
                _3243 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3347 = _3243;
            _3245 = _3347;
            if (!_3343)
            {
                _3197 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3349 = _3197;
            _3199 = _3349;
            if (!_3343)
            {
                _3209 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3351 = _3209;
            _3211 = _3351;
            if (!_3343)
            {
                _3269 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3353 = _3269;
            _3271 = _3353;
            if (!_3343)
            {
                _3261 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3355 = _3261;
            bool _3357 = !_3343;
            _3263 = _3355;
            if (!_3357)
            {
                bool _3359 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3361 = isnan(_2662);
                bool _3363 = _3359 || _3361;
                bool _3365 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3367 = _3363 || _3365;
                if (!_3367)
                {
                    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3371 = _2662 + _3369;
                    float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3375 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3373;
                    float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3379 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3381 = 1.0 / _3375;
                    float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3399 = _3371 * _3381;
                    float _3401 = precise::clamp(_3399, 0.0, 1.0);
                    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3405 = _3403 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3407 = fma(_3401, _3379, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3409 = fma(_3401, _3405, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3411 = fma(_3401, _3385, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3413 = fma(_3401, _3389, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3415 = fma(_3401, _3393, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3417 = fma(_3401, _3397, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3245 = _3411;
                    _3271 = _3415;
                    _3217 = _3407;
                    _3211 = _3413;
                    _3199 = _3409;
                    _3263 = _3417;
                    _3333 = true;
                }
                else
                {
                    _3245 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3271 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3217 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3211 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3199 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3263 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3333 = false;
    float _3419 = _3245;
    float _3421 = _3271;
    float _3423 = _3217;
    float _3425 = _3211;
    float _3427 = _3199;
    float _3429 = _3263;
    float _3431 = fma(_3171, -0.5, 0.5);
    float _3433 = precise::clamp(_3431, 0.0, 1.0);
    float _3435 = -_3419;
    float _3437 = _3435 + _3421;
    float _3439 = -_3423;
    float _3441 = _3439 + _3425;
    out.m_98.x = 0.0;
    float _3443 = fma(_3433, _3437, _3419);
    float _3445 = -_3427;
    float _3447 = _3445 + _3429;
    float _3449 = fma(_3433, _3441, _3423);
    float _3451 = _3443 * 0.586610972881317138671875;
    bool _3453 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3455 = fma(_3433, _3447, _3427);
    float _3457 = _3221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3459 = fma(_3449, 0.298911988735198974609375, _3451);
    bool _3461 = _2640 > 0.0;
    bool _3463 = isnan(_2640);
    bool _3465 = _3461 || _3463;
    bool _3467 = isnan(0.0);
    bool _3469 = _3465 || _3467;
    float _3471 = fma(_3455, 0.114477999508380889892578125, _3459);
    out.m_53.x = _3457;
    float _3473 = -_3471;
    float _3475 = _3449 + _3473;
    float _3477 = -_3471;
    float _3479 = _3443 + _3477;
    float _3481 = -_3471;
    float _3483 = _3455 + _3481;
    float _3485 = fma(_3475, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3471);
    float _3487 = fma(_3479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3471);
    float _3489 = fma(_3483, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3471);
    bool _3491 = !_3453;
    if (!_3491)
    {
        float _3493 = -_2584;
        float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3497 = -_2586;
        float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3501 = -_2588;
        float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3505 = _3495 * _3495;
        float _3507 = fma(_3499, _3499, _3505);
        float _3509 = fma(_3503, _3503, _3507);
        float _3511 = sqrt(_3509);
        float _3513 = rsqrt(_3509);
        float _3515 = -_3511;
        float _3517 = _3515 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3519 = _3517 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3521 = precise::clamp(_3519, 0.0, 1.0);
        float _3523 = _3499 * _3513;
        float _3525 = _3495 * _3513;
        float _3527 = abs(_3521);
        float _3529 = log2(_3527);
        float _3531 = _3503 * _3513;
        float _3533 = _3523 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3535 = _3171 * _3525;
        float _3537 = -_3525;
        float _3539 = -_3533;
        float _3541 = fma(_3537, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3539);
        float _3543 = fma(_3177, _3523, _3535);
        float _3545 = -_3531;
        float _3547 = fma(_3545, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3541);
        float _3549 = fma(_3161, _3531, _3543);
        float _3551 = precise::clamp(_3549, 0.0, 1.0);
        float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3555 = _3547 + _3553;
        float _3557 = _3529 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3559 = _3555 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3561 = precise::clamp(_3559, 0.0, 1.0);
        float _3563 = exp2(_3557);
        float _3565 = _3563 * _3561;
        float _3567 = _3551 * _3565;
        float _3569 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3571 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3573 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3569;
        out.m_98.y = _3571;
        out.m_98.z = _3573;
    }
    out.m_100.x = _3485;
    out.m_100.y = _3487;
    out.m_100.z = _3489;
    if (_3469)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3575 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3575;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3333 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_46.w;
    float _116 = in.m_48.w;
    float _118 = trunc(_114);
    int _121 = int(_118);
    float _123 = -_116;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _125;
    bool _129 = _121 >= 1;
    float _131 = 0.0;
    float _133 = _116;
    float _135 = _125;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _131;
    if (!_129)
    {
        out.m_53.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3643 = as_type<float>(_143);
        out.gl_Position.z = _3643;
    }
    if (!_129)
    {
        return out;
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = in.m_55.x;
    float _159 = float(_121);
    bool _161 = _125 >= _159;
    bool _163 = !_155;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _133;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _125 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _145 = as_type<int>(_175);
    }
    int _177 = _145;
    out.m_57.x = _157;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_177);
        out.gl_Position.z = _3708;
    }
    out.m_51.x = _171;
    if (_165)
    {
        return out;
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = in.m_68.x;
    float _201 = in.m_68.y;
    float _203 = in.m_68.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_207;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _183 * _189;
    float _225 = _183 * _195;
    float _227 = fma(_181, _187, _223);
    float _229 = _183 * _201;
    float _231 = fma(_181, _193, _225);
    float _233 = fma(_185, _191, _227);
    float _235 = fma(_181, _199, _229);
    float _237 = fma(_185, _197, _231);
    float _239 = fma(_185, _203, _235);
    bool _241 = !_213;
    float _257;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        _257 = _171;
    }
    _259 = false;
    float _261 = _257;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = _261 + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _275;
    float _279 = 1.0 / _269;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _283 = 1.0 / _273;
    bool _285 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _287 = isnan(_261);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = 1.0 / _277;
    float _299 = _265 * _279;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _261 + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = _261 + _305;
    float _309 = _303 * _283;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _323 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_261);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _307 * _297;
    bool _337 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_261);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_295;
    float _351 = _349 + 1.0;
    float _353 = -_347;
    float _355 = _353 + 1.0;
    float _357 = _347 * _351;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _363 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_261);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _333 * _355;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = -_333;
    float _383 = _381 + 1.0;
    float _385 = fma(_361, _309, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _387 = fma(_379, _309, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = _373 * _383;
    float _391 = in.m_70.x;
    float _393 = in.m_70.y;
    float _395 = -_373;
    float _397 = _395 + 1.0;
    float _399 = _319 * _389;
    float _401 = _321 * _389;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].x, _399);
    float _413 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _415 = fma(_405, _335, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _417 = fma(_409, _335, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_387, _375, _411);
    float _421 = fma(_385, _375, _413);
    float _423 = fma(_415, _357, _419);
    float _425 = fma(_417, _357, _421);
    float _427 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].x, _423);
    float _429 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].y, _425);
    float _431 = _427 * _391;
    float _433 = _429 * _393;
    bool _435 = !_281;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _173 = _449;
    }
    float _451 = _173;
    float _453 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _455 = int(_453);
    float _457 = in.m_55.z;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _461 = _451 + _459;
    float _463 = in.m_66.w;
    float _465 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _467 = int(_465);
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _471 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_451);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _487 = float(_455);
    float _489 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _491 = int(_489);
    float _493 = -_481;
    float _495 = _493 + 1.0;
    float _497 = float(uint(_467));
    float _499 = 1.0 / _487;
    bool _501 = _467 == 0;
    float _503 = float(_491);
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _507 = int(_505);
    float _509 = _499 * _125;
    float _511 = 1.0 / _503;
    float _513 = 1.0 / _497;
    float _515 = float(uint(_507));
    int _517 = ~_507;
    int _519 = _517 + 1;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _523 = _521 != 0;
    float _525 = trunc(_509);
    int _527 = int(_525);
    float _529 = _511 * _125;
    int _531 = ~_507;
    int _533 = _531 + 1;
    int _535 = ~_507;
    int _537 = _535 + 1;
    int _539 = as_type<int>(_513) + (-2);
    float _541 = 1.0 / _515;
    int _543 = ~_467;
    int _545 = _543 + 1;
    float _547 = _511;
    if (_523)
    {
        _547 = 1.0;
    }
    float _549 = _547;
    float _551 = float(uint(_527));
    float _553 = trunc(_529);
    int _555 = int(_553);
    float _557 = _549;
    if (!_523)
    {
        _557 = 7.345489978790283203125;
    }
    float _559 = _557;
    float _561 = as_type<float>(_539) * _551;
    float _563 = _559 * _157;
    float _565 = trunc(_561);
    float _567 = precise::max(_565, 0.0);
    uint _570 = uint(_567);
    int _572 = as_type<int>(_541) + (-2);
    float _574 = float(uint(_555));
    float _576 = 1.0 / _485;
    float _578 = _561;
    float _580 = _574;
    if (_523)
    {
        _578 = _157;
    }
    float _582 = _578;
    float _584 = _582;
    if (!_523)
    {
        _584 = _457;
    }
    float _586 = _584;
    float _588 = as_type<float>(_572) * _574;
    if (_523)
    {
        _580 = 1.0;
    }
    float _590 = _580;
    int _592 = _545 * int(_570);
    int _594 = _592 + _527;
    float _596 = trunc(_588);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    float _602 = _590;
    if (!_523)
    {
        _602 = 5.839270114898681640625;
    }
    float _604 = _602;
    float _606 = float(uint(_594));
    float _608 = as_type<float>(_539) * _606;
    float _610 = _604 * _586;
    int _612 = ~_467;
    int _614 = _612 + 1;
    float _616 = floor(_563);
    int _618 = _519 * int(_600);
    int _620 = _618 + _555;
    float _622 = trunc(_608);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    float _628 = float(uint(_620));
    float _630 = as_type<float>(_572) * _628;
    float _632 = float(_467);
    float _634 = floor(_610);
    float _636 = -_616;
    float _638 = _563 + _636;
    int _640 = int(_570) + int(_626);
    float _642 = trunc(_630);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    float _648 = float(_527);
    int _650 = _614 * _640;
    int _652 = _650 + _527;
    bool _654 = _648 >= _632;
    bool _656 = isnan(_648);
    bool _658 = _654 || _656;
    bool _660 = isnan(_632);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_634;
    float _668 = _610 + _666;
    float _670 = _638 * _632;
    bool _672 = uint(_652) >= uint(_467);
    float _674 = trunc(_664);
    int _676 = int(_674);
    bool _678 = !_672;
    int _680 = _678 ? 0 : (-1);
    int _682 = int(_600) + int(_646);
    int _684 = ~_640;
    int _686 = _684 + _680;
    int _688 = _686 + 1;
    float _690 = _167 * _125;
    float _692 = float(_507);
    int _694 = _533 * _682;
    int _696 = _694 + _555;
    float _698 = float(_555);
    int _700 = _467 * _688;
    int _702 = _700 + _527;
    float _704 = _632 * _690;
    bool _706 = _698 >= _692;
    bool _708 = isnan(_698);
    bool _710 = _706 || _708;
    bool _712 = isnan(_692);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    int _718 = ~_676;
    int _720 = _718 + 1;
    int _722 = _720 + 1;
    bool _724 = !_501;
    int _726 = _724 ? _702 : (-1);
    float _728 = _692 * _690;
    bool _730 = uint(_696) >= uint(_507);
    float _732 = _668 * _692;
    float _734 = trunc(_716);
    int _736 = int(_734);
    int _738 = _467 + (-1);
    int _740 = _726 * _722;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _748 = _746 != 0;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _752 = _750 != 0;
    bool _754 = !_730;
    int _756 = _754 ? 0 : (-1);
    int _758 = _676 * _738;
    int _760 = _758 + _740;
    float _762 = trunc(_670);
    int _764 = int(_762);
    int _766 = ~_682;
    int _768 = _766 + _756;
    int _770 = _768 + 1;
    bool _772 = !_744;
    int _774 = _772 ? 0 : 1;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _778 = _776 != 0;
    int _780 = abs(_774);
    float _782 = trunc(_704);
    int _784 = int(_782);
    bool _786 = !_778;
    int _788 = _786 ? 0 : 1;
    int _790 = _507 * _770;
    int _792 = _790 + _555;
    bool _794 = _507 == 0;
    bool _796 = !_748;
    int _798 = _796 ? 0 : 1;
    int _800 = abs(_788);
    float _802 = trunc(_728);
    int _804 = int(_802);
    int _806 = abs(_798);
    int _808 = ~_736;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    int _814 = _764 * _800;
    int _816 = _814 + _527;
    bool _818 = !_794;
    int _820 = _818 ? _792 : (-1);
    int _822 = _760 * _806;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _826 = _824 != 0;
    float _828 = trunc(_732);
    int _830 = int(_828);
    int _832 = _820 * _812;
    bool _834 = !_826;
    int _836 = _834 ? 0 : 1;
    bool _838 = !_752;
    int _840 = _838 ? 0 : 1;
    int _842 = _784 * _780;
    int _844 = _842 + _822;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _848 = _846 != 0;
    float _850 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _852 = log2(_850);
    int _854 = abs(_840);
    int _856 = _507 + (-1);
    bool _858 = !_848;
    int _860 = _858 ? 0 : 1;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _872 = _870 != 0;
    int _874 = _736 * _856;
    int _876 = _874 + _832;
    int _878 = abs(_860);
    int _880 = _816 * _854;
    int _882 = _880 + _844;
    int _884 = abs(_836);
    bool _886 = !_868;
    int _888 = _886 ? 0 : 1;
    int _890 = _830 * _884;
    int _892 = _890 + _555;
    bool _894 = !_864;
    int _896 = _894 ? 0 : 1;
    float _898 = _852 * _125;
    int _900 = abs(_888);
    int _902 = _764 * _878;
    int _904 = _902 + _882;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _908 = _906 != 0;
    bool _910 = !_872;
    int _912 = _910 ? 0 : 1;
    int _914 = _876 * _900;
    int _916 = abs(_896);
    float _918 = exp2(_898);
    bool _920 = !_908;
    int _922 = _920 ? 0 : 1;
    int _924 = abs(_912);
    int _926 = abs(_922);
    float _928 = float(uint(_904));
    int _930 = _804 * _916;
    int _932 = _930 + _914;
    float _934 = as_type<float>(_539) * _928;
    int _936 = ~_507;
    int _938 = _936 + 1;
    float _940 = float(uint(_892));
    int _942 = _892 * _924;
    int _944 = _942 + _932;
    float _946 = trunc(_934);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    int _952 = _830 * _926;
    int _954 = _952 + _944;
    int _956 = ~_467;
    int _958 = _956 + 1;
    int _960 = ~_507;
    int _962 = _960 + 1;
    float _964 = float(uint(_954));
    float _966 = as_type<float>(_572) * _964;
    int _968 = _958 * int(_950);
    int _970 = _968 + _904;
    float _972 = trunc(_966);
    float _974 = precise::max(_972, 0.0);
    uint _976 = uint(_974);
    float _978 = float(uint(_970));
    float _980 = as_type<float>(_539) * _978;
    float _982 = trunc(_980);
    float _984 = precise::max(_982, 0.0);
    uint _986 = uint(_984);
    int _988 = _962 * int(_976);
    int _990 = _988 + _954;
    float _992 = float(uint(_990));
    int _994 = ~_467;
    int _996 = _994 + 1;
    float _998 = as_type<float>(_572) * _992;
    int _1000 = int(_950) + int(_986);
    float _1002 = trunc(_998);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = _996 * _1000;
    int _1010 = _1008 + _904;
    bool _1012 = uint(_1010) >= uint(_467);
    bool _1014 = !_1012;
    int _1016 = _1014 ? 0 : (-1);
    int _1018 = int(_976) + int(_1006);
    int _1020 = ~_1000;
    int _1022 = _1020 + _1016;
    int _1024 = _1022 + 1;
    int _1026 = _938 * _1018;
    int _1028 = _1026 + _954;
    int _1030 = _467 * _1024;
    int _1032 = _1030 + _904;
    bool _1034 = uint(_1028) >= uint(_507);
    bool _1036 = !_501;
    int _1038 = _1036 ? _1032 : (-1);
    float _1040 = in.m_55.y;
    bool _1042 = !_1034;
    int _1044 = _1042 ? 0 : (-1);
    int _1046 = _1038 & 3;
    bool _1048 = _1046 != 0;
    int _1050 = _1038 & 3;
    bool _1052 = _1050 != 0;
    bool _1054 = uint(_1046) > 1u;
    int _1056 = ~_1018;
    int _1058 = _1056 + _1044;
    int _1060 = _1058 + 1;
    int _1062 = _1052 ? 0 : 1;
    bool _1064 = uint(_1046) >= 2u;
    int _1066 = _507 * _1060;
    int _1068 = _1066 + _954;
    int _1070 = ~_1062;
    int _1072 = _1070 + 1;
    int _1074 = _1072 + 1;
    int _1076 = _1064 ? 0 : 1;
    bool _1078 = !_794;
    int _1080 = _1078 ? _1068 : (-1);
    int _1082 = _1074;
    if (!_1054)
    {
        int _1084 = ~_1062;
        int _1086 = _1084 + 1;
        _1082 = _1086;
    }
    int _1088 = _1082;
    float _1090 = in.m_46.x;
    float _1092 = in.m_46.y;
    float _1094 = in.m_46.z;
    int _1096 = _1080 & 3;
    bool _1098 = _1096 != 0;
    bool _1100 = _1046 != 3;
    bool _1102 = uint(_1096) >= 2u;
    int _1104 = _1080 & 3;
    bool _1106 = _1104 != 0;
    int _1108 = _1102 ? 0 : 1;
    bool _1110 = _1096 != 3;
    int _1112 = ~_1076;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    int _1118 = ~_1108;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    int _1124 = _1116;
    int _1126 = _1122;
    if (_1100)
    {
        int _1128 = ~_1076;
        int _1130 = _1128 + 1;
        _1124 = _1130;
    }
    int _1132 = _1124;
    int _1134 = _1106 ? 0 : 1;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1138 = _1136 != 0;
    bool _1140 = uint(_1096) > 1u;
    float _1142 = _195 * _1092;
    float _1144 = _189 * _1092;
    float _1146 = _201 * _1092;
    if (_1110)
    {
        int _1148 = ~_1108;
        int _1150 = _1148 + 1;
        _1126 = _1150;
    }
    int _1152 = _1126;
    float _1154 = fma(_193, _1090, _1142);
    float _1156 = float(uint(_816));
    float _1158 = -_918;
    float _1160 = _1158 + 1.0;
    float _1162 = fma(_187, _1090, _1144);
    bool _1164 = _157 > 0.5;
    float _1166 = as_type<float>(_539) * _1156;
    bool _1168 = !_1138;
    int _1170 = _1168 ? 0 : 1;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1176 = _1174 != 0;
    float _1178 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1180 = -_217;
    int _1182 = _1164 ? as_type<int>(_1180) : as_type<int>(_217);
    float _1184 = trunc(_1166);
    float _1186 = precise::max(_1184, 0.0);
    uint _1188 = uint(_1186);
    float _1190 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1172);
    float _1192 = as_type<float>(_572) * _940;
    bool _1194 = !_1176;
    float _1196 = _1194 ? _217 : as_type<float>(_1182);
    float _1198 = -_469;
    float _1200 = fma(_1178, 2.0, _1198);
    bool _1202 = _1040 > 0.5;
    float _1204 = fma(_199, _1090, _1146);
    int _1206 = ~_1134;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = trunc(_1192);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    int _1218 = _1210;
    if (!_1140)
    {
        int _1220 = ~_1134;
        int _1222 = _1220 + 1;
        _1218 = _1222;
    }
    int _1224 = _1218;
    float _1226 = _157 * 2.0;
    float _1228 = -_221;
    int _1230 = _1202 ? as_type<int>(_1228) : as_type<int>(_221);
    float _1232 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1234 = ~_467;
    int _1236 = _1234 + 1;
    float _1238 = -_125;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1200);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1244 = _1242 != 0;
    float _1246 = floor(_1226);
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1250 = _1248 != 0;
    int _1252 = _1236 * int(_1188);
    int _1254 = _1252 + _816;
    bool _1256 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1258 = isnan(0.0);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_191, _1094, _1162);
    float _1268 = _1264 ? _1160 : 0.0;
    int _1270 = _537 * int(_1216);
    int _1272 = _1270 + _892;
    bool _1274 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1276 = isnan(1.0);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1282 = _1278 || _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1286 = 1.0 + _1284;
    float _1288 = float(uint(_1254));
    float _1290 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1190);
    float _1292 = _1040 * 2.0;
    float _1294 = 1.0 / _1286;
    float _1296 = as_type<float>(_539) * _1288;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1302 = ~_467;
    int _1304 = _1302 + 1;
    float _1306 = fma(_1232, -2.0, _1298);
    bool _1308 = !_1250;
    float _1310 = _1308 ? _221 : as_type<float>(_1230);
    float _1312 = trunc(_1296);
    float _1314 = precise::max(_1312, 0.0);
    uint _1316 = uint(_1314);
    float _1318 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1300);
    float _1320 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1306);
    bool _1322 = _1246 > 0.0;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1326 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1318);
    float _1328 = -_1290;
    float _1330 = _1328 + 1.0;
    if (_1282)
    {
        float _1332 = _1268 * _1294;
        _135 = _1332;
    }
    float _1334 = _135;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1338 = float(uint(_1272));
    float _1340 = floor(_1292);
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1344 = _1246 >= 0.0;
    bool _1346 = isnan(_1246);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan(0.0);
    bool _1352 = _1348 || _1350;
    float _1354 = as_type<float>(_572) * _1338;
    int _1356 = int(_1188) + int(_1316);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1360 = trunc(_1354);
    float _1362 = precise::max(_1360, 0.0);
    uint _1364 = uint(_1362);
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1370 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1376 = _1352 ? 0 : 1;
    int _1378 = _1304 * _1356;
    int _1380 = _1378 + _816;
    out.m_72.x = _1366;
    out.m_72.y = _1368;
    out.m_72.z = _1370;
    out.m_72.w = _1336;
    float _1382 = fma(_197, _1094, _1154);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1388 = ~_1376;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = fma(_203, _1094, _1204);
    float _1396 = _457 * 2.0;
    bool _1398 = uint(_1380) >= uint(_467);
    float _1400 = 1.0 / _1374;
    int _1402 = _1392;
    if (!_1322)
    {
        int _1404 = ~_1376;
        int _1406 = _1404 + 1;
        _1402 = _1406;
    }
    int _1408 = _1402;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1412 = _451 + _1410;
    int _1414 = ~_507;
    int _1416 = _1414 + 1;
    float _1418 = -_1326;
    float _1420 = _1418 + 1.0;
    int _1422 = int(_1216) + int(_1364);
    float _1424 = floor(_1396);
    bool _1426 = _1340 > 0.0;
    int _1428 = _1416 * _1422;
    int _1430 = _1428 + _892;
    bool _1432 = !_1398;
    int _1434 = _1432 ? 0 : (-1);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1440 = _1340 >= 0.0;
    bool _1442 = isnan(_1340);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.0);
    bool _1448 = _1444 || _1446;
    float _1450 = 1.0 / _1386;
    bool _1452 = !_1048;
    int _1454 = _1452 ? 0 : 1;
    int _1456 = _1448 ? 0 : 1;
    bool _1458 = uint(_1430) >= uint(_507);
    int _1460 = ~_1456;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    float _1466 = 1.0 / _1438;
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1476 = _1470 * _576;
    int _1478 = _1464;
    if (!_1426)
    {
        int _1480 = ~_1456;
        int _1482 = _1480 + 1;
        _1478 = _1482;
    }
    int _1484 = _1478;
    float _1486 = _157 + _1040;
    bool _1488 = !_1458;
    int _1490 = _1488 ? 0 : (-1);
    float _1492 = _1474 * _1400;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1496 = _1494 != 0;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1500 = _1498 != 0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1504 = _1502 != 0;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1506;
    float _1510 = in.m_64.w;
    float _1512 = _1486 + (-1.0);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1518 = !_1496;
    int _1520 = _1518 ? 0 : 1;
    float _1522 = _1508 * _1450;
    bool _1524 = _1424 >= 0.0;
    bool _1526 = isnan(_1424);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan(0.0);
    bool _1532 = _1528 || _1530;
    float _1534 = _1516 * _1466;
    bool _1536 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1538 = isnan(_451);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    int _1548 = _1532 ? 0 : 1;
    float _1550 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1552 = _1424 > 0.0;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1556 = _451 + _1554;
    bool _1558 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1560 = isnan(_451);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = in.m_68.w;
    float _1572 = -_1546;
    float _1574 = _1572 + 1.0;
    float _1576 = fma(_1476, _1556, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1578 = abs(_1224);
    float _1580 = _1568 * _1574;
    float _1582 = -_1568;
    float _1584 = _1582 + 1.0;
    float _1586 = fma(_1492, _1412, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1588 = fma(_1522, _461, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1590 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1592 = isnan(_451);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1598 = _1594 || _1596;
    float _1600 = float(_1598);
    float _1602 = _481 * _1584;
    bool _1604 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1606 = isnan(_451);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1618 = _451 + _1616;
    float _1620 = _1196 + 0.5;
    float _1622 = _1600 * _495;
    float _1624 = -_1600;
    float _1626 = _1624 + 1.0;
    float _1628 = _1266 + _1510;
    float _1630 = _1310 + (-0.5);
    float _1632 = _1382 + _463;
    float _1634 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1240);
    float _1636 = _1614 * _1626;
    float _1638 = -_1630;
    float _1640 = -_1320;
    float _1642 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1640);
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1646 = _1632 + _1644;
    float _1648 = -_1614;
    float _1650 = _1648 + 1.0;
    float _1652 = _1576 * _1636;
    float _1654 = -_1420;
    float _1656 = fma(_1196, _1654, _1634);
    float _1658 = fma(_1310, _1330, _1642);
    float _1660 = _1394 + _1570;
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1664 = _1628 + _1662;
    float _1666 = _1646 * _1646;
    float _1668 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1652);
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1672 = _1660 + _1670;
    float _1674 = fma(_1534, _1618, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1676 = fma(_1664, _1664, _1666);
    float _1678 = fma(_1586, _1622, _1668);
    int _1680 = _1038 >> 31;
    out.m_74.x = _1656;
    out.m_74.y = _1658;
    float _1682 = fma(_1672, _1672, _1676);
    float _1684 = fma(_1588, _1602, _1678);
    int _1686 = _1680 & 3;
    float _1688 = rsqrt(_1682);
    float _1690 = fma(_1674, _1580, _1684);
    int _1692 = _1080 >> 31;
    float _1694 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1696 = ~_1548;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    float _1702 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1690);
    int _1704 = _1038 + _1686;
    float _1706 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1708 = _1692 & 3;
    int _1710 = _1700;
    if (!_1552)
    {
        int _1712 = ~_1548;
        int _1714 = _1712 + 1;
        _1710 = _1714;
    }
    int _1716 = _1710;
    float _1718 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1706);
    int _1720 = _1704 >> 2;
    int _1722 = _1080 + _1708;
    float _1724 = _1694 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1726 = _1720 << 4;
    int _1728 = _1726 + 368;
    float _1730 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1718);
    bool _1732 = !_1098;
    int _1734 = _1732 ? 0 : 1;
    float _1736 = _1724 * _1688;
    int _1738 = _1722 >> 2;
    uint _1740 = uint(int(uint(_1728) >> uint(2)));
    uint _1742 = uint(int(uint(int(_1740)) >> uint(2)));
    int _1744 = int(_1740) & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    int _1748 = int(_1740) + 1;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    int _1752 = _1748 & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    bool _1756 = _1046 != 3;
    float _1758 = _1646 * _1736;
    int _1760 = _1738 << 4;
    int _1762 = _1760 + 656;
    bool _1764 = !_1756;
    int _1766 = _1764 ? 0 : (-1);
    float _1768 = -_1758;
    float _1770 = _1646 + _1768;
    bool _1772 = _1096 != 3;
    float _1774 = _1664 * _1736;
    uint _1776 = uint(int(uint(_1762) >> uint(2)));
    uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
    int _1780 = int(_1776) & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = int(_1776) + 1;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    int _1788 = _1784 & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    float _1792 = _1770 * _1770;
    float _1794 = -_1774;
    float _1796 = _1664 + _1794;
    int _1798 = abs(_1520);
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1802 = fma(_1796, _1796, _1792);
    int _1804 = _1728 + 8;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    uint _1808 = uint(int(uint(int(_1806)) >> uint(2)));
    int _1810 = int(_1806) & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    int _1814 = int(_1806) + 1;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    int _1818 = _1814 & 3;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[int(_1816)][_1818];
    bool _1822 = !_1772;
    int _1824 = _1822 ? 0 : (-1);
    float _1826 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1828 = _1730 >= 0.0;
    int _1830 = _1762 + 8;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
    int _1836 = int(_1832) & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    int _1840 = int(_1832) + 1;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    int _1844 = _1840 & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    float _1848 = float(_1716);
    float _1850 = _1672 * _1736;
    float _1852 = _1702 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1858 = ~_1356;
    int _1860 = _1858 + _1434;
    int _1862 = _1860 + 1;
    float _1864 = -_1850;
    float _1866 = _1672 + _1864;
    float _1868 = _1854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1872 = abs(_1734);
    int _1874 = _467 * _1862;
    int _1876 = _1874 + _816;
    int _1878 = abs(_1088);
    float _1880 = fma(_1866, _1866, _1802);
    out.m_76.x = _1868;
    out.m_76.y = _1870;
    out.m_76.z = _1826;
    out.m_76.w = _1852;
    int _1882 = abs(_1454);
    int _1884 = abs(_1132);
    if (_1828)
    {
        out.m_53.x = 0.0;
    }
    int _1886 = abs(_1152);
    int _1888 = abs(_1766);
    int _1890 = ~_1422;
    int _1892 = _1890 + _1490;
    int _1894 = _1892 + 1;
    float _1896 = float(_1798);
    bool _1898 = !_501;
    int _1900 = _1898 ? _1876 : (-1);
    int _1902 = _507 * _1894;
    int _1904 = _1902 + _892;
    int _1906 = ~_1878;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = _1896 * _1848;
    int _1914 = ~_1882;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    int _1920 = _1910 * as_type<int>(_1754);
    int _1922 = ~_1578;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    int _1928 = _1918 * as_type<int>(_1746);
    int _1930 = _1928 + _1920;
    int _1932 = ~_1872;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    int _1938 = _1926 * as_type<int>(_1790);
    int _1940 = ~_1884;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    int _1946 = _1936 * as_type<int>(_1782);
    int _1948 = _1946 + _1938;
    int _1950 = abs(_1824);
    int _1952 = _1944 * as_type<int>(_1812);
    int _1954 = _1952 + _1930;
    int _1956 = ~_1886;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    float _1962 = in.m_78.x;
    float _1964 = in.m_78.y;
    float _1966 = in.m_78.z;
    bool _1968 = !_1244;
    int _1970 = _1968 ? 0 : 1;
    int _1972 = _1960 * as_type<int>(_1838);
    int _1974 = _1972 + _1948;
    int _1976 = ~_1888;
    int _1978 = _1976 + 1;
    int _1980 = _1978 + 1;
    int _1982 = abs(_1170);
    float _1984 = sqrt(_1880);
    int _1986 = ~_1950;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = _1980 * as_type<int>(_1820);
    int _1994 = _1992 + _1954;
    int _1996 = abs(_1970);
    int _1998 = ~_1982;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _1990 * as_type<int>(_1846);
    int _2006 = _2004 + _1974;
    int _2008 = ~_1996;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    bool _2014 = !_794;
    int _2016 = _2014 ? _1904 : (-1);
    int _2018 = _1994 * _2002;
    float _2020 = as_type<float>(_1980);
    if (_1828)
    {
        _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2022 = _2020;
    int _2024 = _2006 * _2012;
    float _2026 = _1912 * (-2.0);
    int _2028 = _1900 * _1982;
    int _2030 = _2028 + _2018;
    float _2032 = _157 + (-0.5);
    int _2034 = _2016 * _1996;
    int _2036 = _2034 + _2024;
    float _2038 = fma(_1550, _2026, _1550);
    float _2040 = _1688 * _1984;
    float _2042 = fma(_2026, _1962, _1962);
    int _2044 = as_type<int>(_2022);
    float _2046 = _1966;
    float _2048 = _2040;
    if (_1828)
    {
        float _2050 = _2022 * 5.0;
        _2044 = as_type<int>(_2050);
    }
    int _2052 = _2044;
    float _2054 = float(_2030);
    float _2056 = _1694 * _2040;
    float _2058 = float(_2036);
    float _2060 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2042);
    float _2062 = _1040 + _457;
    bool _2064 = !_1500;
    int _2066 = _2064 ? 0 : 1;
    if (_1828)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6434 = as_type<float>(_2052);
        out.gl_Position.z = _6434;
    }
    float _2068 = _2062 + (-1.0);
    float _2070 = float(_1408);
    out.m_80.x = _2054;
    int _2072 = abs(_2066);
    out.m_80.z = _2058;
    out.m_82.x = _2056;
    bool _2074 = !_1504;
    int _2076 = _2074 ? 0 : 1;
    if (_1828)
    {
        return out;
    }
    float _2078 = -_1758;
    float _2080 = _1632 + _2078;
    int _2082 = abs(_2076);
    float _2084 = -_1774;
    float _2086 = _1628 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2090 = _2080 + _2088;
    float _2092 = -_1850;
    float _2094 = _1660 + _2092;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2098 = _2086 + _2096;
    float _2100 = float(_2072);
    float _2102 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2104 = float(_1484);
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2108 = _2094 + _2106;
    float _2110 = float(_2082);
    float _2112 = _2100 * _2070;
    float _2114 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2102);
    float _2116 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2118 = _1040 + (-0.5);
    float _2120 = _2110 * _2104;
    float _2122 = _2112 * (-2.0);
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2114);
    float _2126 = _157 + _457;
    float _2128 = fma(_2038, _1334, _2060);
    float _2130 = fma(_2122, _1964, _1964);
    float _2132 = fma(_2116, _2122, _2116);
    bool _2134 = _2124 >= 0.0;
    float _2136 = _2126 + (-1.0);
    float _2138 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2130);
    float _2140 = _2120 * (-2.0);
    float _2142 = _2128 * 0.15915493667125701904296875;
    float _2144 = fma(_2132, _1334, _2138);
    float _2146 = _457 + (-0.5);
    float _2148 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2150 = fma(_2140, _1966, _1966);
    float _2152 = _2144 * 0.15915493667125701904296875;
    float _2154 = _2142 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    float _2158 = fma(_2148, _2140, _2148);
    if (_2134)
    {
        _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2160 = _2046;
    float _2162 = fma(_2146, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2150);
    int _2164 = as_type<int>(_2160);
    if (_2134)
    {
        out.m_53.x = 0.0;
    }
    if (_2134)
    {
        float _2166 = _2160 * 5.0;
        _2164 = as_type<int>(_2166);
    }
    int _2168 = _2164;
    float _2170 = _2142 * 6.283185482025146484375;
    float _2172 = cos(_2170);
    float _2174 = fma(_2158, _1334, _2162);
    if (_2134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6621 = as_type<float>(_2168);
        out.gl_Position.z = _6621;
    }
    float _2176 = _2174 * 0.15915493667125701904296875;
    float _2178 = _2152 * 6.283185482025146484375;
    float _2180 = sin(_2178);
    float _2182 = _2152 * 6.283185482025146484375;
    float _2184 = cos(_2182);
    if (_2134)
    {
        return out;
    }
    float _2186 = _2176 * 6.283185482025146484375;
    float _2188 = cos(_2186);
    float _2190 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _2194 = _2172 * _2180;
    float _2196 = _2156 * _2180;
    float _2198 = _2190 * _2040;
    float _2200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2202 = _2156 * _2184;
    float _2204 = _2176 * 6.283185482025146484375;
    float _2206 = sin(_2204);
    float _2208 = _2198 * _2192;
    float _2210 = _2172 * _2184;
    float _2212 = _2056 * _2200;
    float _2214 = _2172 * _2188;
    float _2216 = _2184 * _2188;
    float _2218 = _2156 * _2188;
    float _2220 = _2180 * _2188;
    float _2222 = _2214 * _2208;
    float _2224 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2226 = _2224 * 0.5;
    float _2228 = fma(_2206, _2210, _2196);
    float _2230 = -_2202;
    float _2232 = fma(_2206, _2194, _2230);
    float _2234 = -_2208;
    float _2236 = _2206 * _2234;
    float _2238 = -_2194;
    float _2240 = fma(_2206, _2202, _2238);
    float _2242 = fma(_2228, _2212, _2222);
    float _2244 = _2218 * _2208;
    float _2246 = fma(_2216, _2212, _2236);
    float _2248 = fma(_2206, _2196, _2210);
    float _2250 = fma(_2232, _2226, _2242);
    float _2252 = fma(_2240, _2212, _2244);
    float _2254 = fma(_2220, _2226, _2246);
    float _2256 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2258 = fma(_2248, _2226, _2252);
    float _2260 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2262 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2264 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2256);
    float _2266 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2260);
    float _2268 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2262);
    float _2270 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2264);
    float _2272 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2266);
    float _2274 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2268);
    float _2276 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2278 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2280 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2282 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2284 = _1660 + _2276;
    float _2286 = _1628 + _2280;
    float _2288 = _1632 + _2282;
    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2292 = _2284 + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2296 = _2286 + _2294;
    float _2298 = _2292 * _2292;
    float _2300 = fma(_2296, _2296, _2298);
    float _2302 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2278);
    float _2304 = sqrt(_2300);
    float _2306 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2302);
    bool _2308 = _2304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = _2282;
    float _2312 = _2286;
    float _2314 = _2302;
    if (!_2308)
    {
        _2310 = _2286;
    }
    float _2316 = _2310;
    float _2318 = _2316;
    if (!_2308)
    {
        _2312 = _2284;
    }
    float _2320 = _2312;
    float _2322 = _2320;
    if (!_2308)
    {
        _2314 = _2288;
    }
    float _2324 = _2314;
    bool _2326 = !_2308;
    float _2328 = _2324;
    if (!_2326)
    {
        float _2330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2334 = _2304 + _2332;
        float _2336 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2338 = rsqrt(_2300);
        float _2340 = _2334 * _2330;
        float _2342 = _2340 * 0.15915493667125701904296875;
        float _2344 = _2342 * 6.283185482025146484375;
        float _2346 = cos(_2344);
        float _2348 = _2342 * 6.283185482025146484375;
        float _2350 = sin(_2348);
        float _2352 = _2346 + (-1.0);
        float _2354 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2356 = fma(_2350, _2336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2358 = fma(_2288, _2346, _2354);
        float _2360 = _2338 * _2356;
        float _2362 = fma(_2296, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2364 = fma(_2292, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2328 = _2358;
        _2318 = _2362;
        _2322 = _2364;
    }
    float _2366 = _2328;
    float _2368 = _2318;
    float _2370 = _2322;
    float _2372 = -_1632;
    float _2374 = _2372 + _2366;
    float _2376 = -_1628;
    float _2378 = _2376 + _2368;
    float _2380 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2382 = -_1660;
    float _2384 = _2382 + _2370;
    float _2386 = _2374 * _2374;
    float _2388 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2390 = 1.0 / _2380;
    float _2392 = fma(_2378, _2378, _2386);
    float _2394 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2388);
    bool _2396 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2398 = isnan(0.5);
    bool _2400 = _2396 || _2398;
    bool _2402 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2404 = _2400 || _2402;
    float _2406 = fma(_2384, _2384, _2392);
    float _2408 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2394);
    float _2410 = sqrt(_2406);
    float _2412 = _2408 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2414 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2416 = isnan(0.5);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2422 = _2418 || _2420;
    float _2424 = _2412 + _2380;
    float _2426 = _2424 * _2390;
    float _2428 = _2426 * 0.5;
    bool _2430 = _2410 > 0.0;
    float _2432 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2434 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2432);
    float _2436 = 1.0 / _2434;
    float _2438 = _2428;
    float _2440 = _2368;
    float _2442 = _2366;
    float _2444 = _2390;
    float _2446 = _2370;
    if (!_2430)
    {
        _2438 = _2370;
    }
    float _2448 = _2438;
    bool _2450 = !_2430;
    float _2452 = _2448;
    if (!_2450)
    {
        float _2454 = _237 * _237;
        float _2456 = rsqrt(_2406);
        float _2458 = fma(_233, _233, _2454);
        float _2460 = fma(_239, _239, _2458);
        float _2462 = sqrt(_2460);
        float _2464 = _2378 * _2456;
        float _2466 = _2374 * _2456;
        float _2468 = _2384 * _2456;
        bool _2470 = _2462 > 0.0;
        float _2472 = _2462;
        if (!_2470)
        {
            _2472 = _2370;
        }
        float _2474 = _2472;
        bool _2476 = !_2470;
        _2452 = _2474;
        if (!_2476)
        {
            float _2478 = rsqrt(_2460);
            float _2480 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2482 = _237 * _2478;
            float _2484 = _233 * _2478;
            float _2486 = _2466 * _2482;
            float _2488 = _239 * _2478;
            float _2490 = fma(_2464, _2484, _2486);
            float _2492 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2494 = fma(_2468, _2488, _2490);
            float _2496 = _2494 * _2492;
            float _2498 = fma(_233, _2496, _2368);
            float _2500 = fma(_237, _2496, _2366);
            float _2502 = fma(_239, _2496, _2370);
            _2440 = _2498;
            _2442 = _2500;
            _2452 = _2502;
            _2444 = _2492;
        }
    }
    float _2504 = _2440;
    float _2506 = _2442;
    float _2508 = _2452;
    float _2510 = _2444;
    float _2512 = -_1774;
    float _2514 = _2512 + _2504;
    float _2516 = -_1758;
    float _2518 = _2516 + _2506;
    float _2520 = -_1850;
    float _2522 = _2520 + _2508;
    float _2524 = _2518;
    float _2526 = _2514;
    float _2528 = _2522;
    float _2530 = _2510;
    if (_2422)
    {
        _2446 = 1.0;
    }
    float _2532 = _2446;
    float _2534 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2536 = _2436 * _2534;
    float _2538 = _2532;
    if (!_2404)
    {
        float _2540 = _2090 * _2090;
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2544 = -_1660;
        float _2546 = _2544 + _2508;
        float _2548 = -_1632;
        float _2550 = _2548 + _2506;
        float _2552 = fma(_2098, _2098, _2540);
        float _2554 = -_1628;
        float _2556 = _2554 + _2504;
        float _2558 = fma(_2108, _2108, _2552);
        float _2560 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2562 = sqrt(_2558);
        float _2564 = 1.0 / _2040;
        float _2566 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2568 = precise::min(_2562, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2570 = _2568 * _2542;
        float _2572 = _2570 * _2564;
        float _2574 = _2566 * _2572;
        float _2576 = _2546 * _2572;
        float _2578 = fma(_2550, _2574, _2080);
        float _2580 = fma(_2556, _2574, _2086);
        float _2582 = fma(_2566, _2576, _2094);
        _2524 = _2578;
        _2526 = _2580;
        _2528 = _2582;
    }
    float _2584 = _2524;
    float _2586 = _2526;
    float _2588 = _2528;
    if (!_2422)
    {
        float _2590 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2592 = _2590 * 0.15915493667125701904296875;
        float _2594 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2596 = _2592 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        float _2600 = _2594 * 0.15915493667125701904296875;
        float _2602 = _2592 * 6.283185482025146484375;
        float _2604 = sin(_2602);
        float _2606 = 1.0 / _2598;
        float _2608 = _2600 * 6.283185482025146484375;
        float _2610 = cos(_2608);
        float _2612 = _2604 * _2606;
        float _2614 = _2600 * 6.283185482025146484375;
        float _2616 = sin(_2614);
        float _2618 = _2610 * _2612;
        float _2620 = 1.0 / _2618;
        float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2624 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2622;
        float _2626 = 1.0 / _2624;
        float _2628 = _2616 * _2620;
        float _2630 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2632 = fma(_2536, _2628, _2630);
        float _2634 = _2632 * _2626;
        float _2636 = precise::clamp(_2634, 0.0, 1.0);
        _2048 = _2600;
        _2538 = _2636;
    }
    float _2638 = _2048;
    float _2640 = _2538;
    float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2644 = _2584 + _2642;
    float _2646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2648 = _2586 + _2646;
    float _2650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2652 = _2588 + _2650;
    float _2654 = _2644 * _2644;
    float _2656 = fma(_2648, _2648, _2654);
    float _2658 = fma(_2652, _2652, _2656);
    float _2660 = rsqrt(_2658);
    float _2662 = sqrt(_2658);
    float _2664 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2666 = _2648 * _2664;
    float _2668 = _2652 * _2664;
    float _2670 = _2666 * _2666;
    float _2672 = _2668 * _2668;
    float _2674 = _2670 + _2672;
    float _2676 = sqrt(_2674);
    bool _2678 = _2676 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2682 = _2676 + _2680;
    float _2684 = _2652;
    float _2686 = _2674;
    float _2688 = _2682;
    float _2690 = _2654;
    if (_2678)
    {
        float _2692 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2684 = _2692;
    }
    float _2694 = _2684;
    if (_2678)
    {
        float _2696 = rsqrt(_2674);
        _2686 = _2696;
    }
    float _2698 = _2686;
    float _2700 = _2698;
    if (_2678)
    {
        float _2702 = _2682 * _2694;
        _2688 = _2702;
    }
    float _2704 = _2688;
    if (_2678)
    {
        float _2706 = _2704 * 0.15915493667125701904296875;
        _2690 = _2706;
    }
    float _2708 = _2690;
    float _2710 = _2694;
    float _2712 = _2708;
    if (_2678)
    {
        float _2714 = _2708 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        _2710 = _2716;
    }
    float _2718 = _2710;
    float _2720 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2722 = precise::max(0.0, _2720);
    float _2724 = _2638;
    float _2726 = _2722;
    if (_2678)
    {
        float _2728 = _2708 * 6.283185482025146484375;
        float _2730 = cos(_2728);
        _2724 = _2730;
    }
    float _2732 = _2724;
    float _2734 = -_2664;
    float _2736 = -_2722;
    float _2738 = fma(_2644, _2734, _2736);
    float _2740 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2678)
    {
        float _2742 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2726 = _2742;
    }
    float _2744 = _2726;
    float _2746 = _2744;
    if (!_2678)
    {
        _2712 = _2666;
    }
    float _2748 = _2712;
    float _2750 = fma(_2086, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2752 = _2718;
    float _2754 = _2748;
    if (_2678)
    {
        float _2756 = fma(_2718, _2744, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2752 = _2756;
    }
    float _2758 = _2752;
    float _2760 = _2758;
    if (!_2678)
    {
        _2746 = _2738;
    }
    float _2762 = _2746;
    float _2764 = _2762;
    float _2766 = _2732;
    if (_2678)
    {
        float _2768 = _2732 + (-1.0);
        _2740 = _2768;
    }
    float _2770 = _2740;
    float _2772 = _2770;
    if (_2678)
    {
        float _2774 = _2698 * _2758;
        _2530 = _2774;
    }
    float _2776 = _2530;
    if (!_2678)
    {
        _2700 = _2668;
    }
    float _2778 = _2700;
    float _2780 = _2778;
    if (_2678)
    {
        float _2782 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2772 = _2782;
    }
    float _2784 = _2772;
    if (_2678)
    {
        float _2786 = _2666 * _2776;
        _2754 = _2786;
    }
    float _2788 = _2754;
    if (!_2678)
    {
        _2760 = _2670;
    }
    float _2790 = _2760;
    float _2792 = _2790;
    if (_2678)
    {
        float _2794 = _2668 * _2776;
        _2780 = _2794;
    }
    float _2796 = _2780;
    if (_2678)
    {
        float _2798 = fma(_2738, _2732, _2784);
        _2764 = _2798;
    }
    float _2800 = _2764;
    if (_2678)
    {
        float _2802 = _2788 * _2788;
        _2792 = _2802;
    }
    float _2804 = _2792;
    if (!_2678)
    {
        _2766 = _2672;
    }
    float _2806 = _2766;
    float _2808 = _2806;
    if (_2678)
    {
        float _2810 = _2796 * _2796;
        _2808 = _2810;
    }
    float _2812 = _2808;
    float _2814 = fma(_2800, _2800, _2804);
    float _2816 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2818 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2820 = floor(_2750);
    float _2822 = _2814 + _2812;
    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2826 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2824);
    float _2828 = precise::clamp(_2826, 0.0, 1.0);
    float _2830 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2816);
    float _2832 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2818);
    float _2834 = -_2828;
    float _2836 = _2834 + 1.0;
    float _2838 = rsqrt(_2822);
    float _2840 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2830);
    float _2842 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2844 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2846 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2848 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2850 = abs(_2836);
    float _2852 = log2(_2850);
    float _2854 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2856 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2846);
    float _2858 = _2848 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2860 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2854);
    float _2862 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2856);
    float _2864 = -_2858;
    float _2866 = fma(_2864, _2842, 1.0);
    float _2868 = _2838 * _2788;
    float _2870 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2860);
    float _2872 = _2838 * _2800;
    float _2874 = _2838 * _2796;
    float _2876 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2878 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2880 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2882 = floor(_2844);
    float _2884 = -_2876;
    float _2886 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2884);
    float _2888 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2890 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2892 = -_2874;
    float _2894 = fma(_2892, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2886);
    float _2896 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2832);
    float _2898 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2888);
    float _2900 = log2(_2866);
    float _2902 = -_2820;
    float _2904 = _2750 + _2902;
    float _2906 = _2896 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2908 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2898);
    float _2910 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2912 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2908);
    float _2914 = exp2(_2890);
    float _2916 = fma(_2894, -0.5, 0.5);
    float _2918 = -_2882;
    float _2920 = _2844 + _2918;
    float _2922 = fma(_2894, 0.5, 0.5);
    float _2924 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2910);
    float _2926 = fma(_2922, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2928 = sqrt(_2916);
    float _2930 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2932 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2924);
    float _2934 = fma(_2922, _2926, -0.212114393711090087890625);
    float _2936 = _2900 * 0.693147182464599609375;
    float _2938 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2930);
    float _2940 = 1.0 / _2912;
    float _2942 = _2872 + 1.0;
    float _2944 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2938);
    float _2946 = fma(_2922, _2934, 1.570728778839111328125);
    float2 _7852 = float2(_2904, _2920);
    float _2948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7852, float2(0.0), isnan(_7852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7852, float2(0.0), isnan(_7852)), level(0.0)).x;
    float _2950 = -_2872;
    float _2952 = fma(_2914, _2942, _2950);
    float _2954 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2932);
    float _2956 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2944);
    float _2958 = _2928 * 0.636619746685028076171875;
    float _2960 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2962 = fma(_2952, 0.5, 0.5);
    float _2964 = -_2946;
    float _2966 = fma(_2958, _2964, 1.0);
    float _2968 = _2954 * _2940;
    float _2970 = _2956 * _2940;
    float _2972 = fma(_2968, 0.5, 0.5);
    float _2974 = fma(_2970, -0.5, 0.5);
    float3 _7903 = float3(_2972, _2974, _2960);
    float _2976 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7903, float3(0.0), isnan(_7903)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7903, float3(0.0), isnan(_7903)), level(0.0)).x;
    float3 _7914 = float3(_2972, _2974, _2960);
    float4 _2979 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7914, float3(0.0), isnan(_7914)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7914, float3(0.0), isnan(_7914)), level(0.0)).xyzw;
    float _2981 = _2979.x;
    float _2983 = _2979.y;
    float _2985 = _2979.z;
    float _2987 = _2979.w;
    float2 _7930 = float2(_2966, _2962);
    float3 _2991 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7930, float2(0.0), isnan(_7930)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7930, float2(0.0), isnan(_7930)), level(0.0)).xyz;
    float _2993 = _2991.x;
    float _2995 = _2991.y;
    float _2997 = _2991.z;
    float _2999 = abs(_2536);
    float _3001 = log2(_2999);
    float _3003 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3005 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3007 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3009 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3011 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3003);
    float _3013 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3005);
    float _3015 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3007);
    float _3017 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3019 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3021 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3023 = -_2206;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3017);
    float _3027 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3029 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3031 = isnan(_2662);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3037 = _3033 || _3035;
    float _3039 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3041 = -_2206;
    float _3043 = fma(_3041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3021);
    float _3045 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3047 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3049 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3027);
    float _3051 = -_2206;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3019);
    float _3055 = exp2(_3039);
    float _3057 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3047);
    float _3059 = fma(_3009, _3009, 1.0);
    float _3061 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3045);
    float _3063 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3025);
    float _3065 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3053);
    float _3067 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3043);
    float _3069 = rsqrt(_3059);
    float _3071 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3011);
    float _3073 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3075 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3061);
    float _3077 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3049);
    float _3079 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3057);
    float _3081 = _3009 * _3063;
    float _3083 = fma(_3055, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3085 = precise::clamp(_3083, 0.0, 1.0);
    float _3087 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3013);
    float _3089 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3091 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3015);
    float _3093 = fma(_3085, -2.0, 3.0);
    float _3095 = _3085 * _3085;
    float _3097 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3089);
    float _3099 = _3009 * _3069;
    float _3101 = _3095 * _3093;
    float _3103 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3097);
    float _3105 = fma(_3073, _3071, _3081);
    float _3107 = -_3075;
    float _3109 = _3099 * _3107;
    float _3111 = -_3101;
    float _3113 = _3111 + 1.0;
    float _3115 = _3009 * _3065;
    float _3117 = in.m_84.x;
    float _3119 = fma(_3069, _3063, _3109);
    float _3121 = fma(_3113, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3101);
    float _3123 = -_3077;
    float _3125 = _3099 * _3123;
    out.m_86.x = _3071;
    out.m_86.y = _3087;
    out.m_86.z = _3091;
    float _3127 = fma(_3073, _3087, _3115);
    float _3129 = _3009 * _3067;
    float _3131 = fma(_3069, _3065, _3125);
    float _3133 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3103);
    float _3135 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3137 = fma(_3073, _3091, _3129);
    float _3139 = _3133 + _2912;
    out.gl_Position.x = _2954;
    out.gl_Position.y = _2956;
    out.gl_Position.z = _3133;
    out.gl_Position.w = _2912;
    float _3141 = exp2(_3135);
    bool _3143 = _2536 <= 8000.0;
    bool _3145 = isnan(_2536);
    bool _3147 = _3143 || _3145;
    bool _3149 = isnan(8000.0);
    bool _3151 = _3147 || _3149;
    float _3153 = float(_3151);
    float _3155 = -_3079;
    float _3157 = _3099 * _3155;
    float _3159 = _2954 + _2912;
    float _3161 = _3079 + _3137;
    float _3163 = _3139 * 0.5;
    float _3165 = _3153 * _3121;
    float _3167 = fma(_3069, _3067, _3157);
    float _3169 = _2912 * 0.5;
    float _3171 = _3077 + _3127;
    float _3173 = _3165 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3175 = fma(_2956, -0.5, _3169);
    float _3177 = _3075 + _3105;
    float _3179 = _3159 * 0.5;
    out.m_88.x = _3119;
    out.m_88.y = _3131;
    out.m_88.z = _3167;
    float _3181 = -_3141;
    float _3183 = _3181 + 1.0;
    float _3185 = _2912;
    float _3187 = _3133;
    float _3189 = _3131;
    float _3191 = _3119;
    if (!_3037)
    {
        _3185 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3193 = _3185;
    out.m_90.x = _3177;
    out.m_90.y = _3171;
    out.m_90.z = _3161;
    float _3195 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3197 = _3193;
    float _3199 = _3193;
    if (!_3037)
    {
        _3187 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3201 = _3187;
    out.m_92.x = _3179;
    out.m_92.y = _3175;
    out.m_92.z = _3163;
    out.m_92.w = _2912;
    float _3203 = -_3195;
    float _3205 = _3203 + 1.0;
    float _3207 = _3205;
    float _3209 = _3201;
    float _3211 = _3201;
    if (!_3037)
    {
        _3189 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3213 = _3189;
    float _3215 = _3213;
    float _3217 = _3213;
    if (!_3037)
    {
        _3191 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3219 = _3191;
    float _3221 = _2640 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3223 = -_2948;
    float _3225 = _3223 + 1.0;
    float _3227 = _3225 * _3173;
    float _3229 = precise::clamp(_3227, 0.0, 1.0);
    float _3231 = -_3229;
    float _3233 = fma(_3231, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3235 = _3233 * _3117;
    float _3237 = _3235 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3239 = _3195 * _2976;
    float _3241 = _2987 * _3205;
    out.m_94.x = _3237;
    float _3243 = _3219;
    float _3245 = _3219;
    if (!_3037)
    {
        _3207 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3247 = _3207;
    float _3249 = _2987 * _3239;
    float _3251 = _2997 * _3239;
    float _3253 = fma(_2993, _3249, _2981);
    float _3255 = fma(_2995, _3249, _2983);
    float _3257 = fma(_2987, _3251, _2985);
    float _3259 = _3249;
    float _3261 = _3247;
    float _3263 = _3247;
    if (!_3037)
    {
        _3259 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3265 = _3259;
    out.m_96.x = _3253;
    out.m_96.y = _3255;
    out.m_96.z = _3257;
    out.m_96.w = _3241;
    bool _3267 = !_3037;
    float _3269 = _3265;
    float _3271 = _3265;
    if (!_3267)
    {
        bool _3273 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3275 = isnan(_2662);
        bool _3277 = _3273 || _3275;
        bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3281 = _3277 || _3279;
        if (!_3281)
        {
            float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3285 = _2662 + _3283;
            float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3289 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3287;
            float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3293 = _3291 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3295 = 1.0 / _3289;
            float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3313 = _3285 * _3295;
            float _3315 = precise::clamp(_3313, 0.0, 1.0);
            float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3321 = fma(_3315, _3293, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3323 = fma(_3315, _3319, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3325 = fma(_3315, _3299, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3327 = fma(_3315, _3303, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3329 = fma(_3315, _3307, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3331 = fma(_3315, _3311, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3245 = _3325;
            _3271 = _3329;
            _3217 = _3321;
            _3211 = _3327;
            _3199 = _3323;
            _3263 = _3331;
            _3333 = true;
        }
        else
        {
            bool _3335 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3337 = isnan(_2662);
            bool _3339 = _3335 || _3337;
            bool _3341 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3343 = _3339 || _3341;
            if (!_3343)
            {
                _3215 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3345 = _3215;
            _3217 = _3345;
            if (!_3343)
            {
                _3243 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3347 = _3243;
            _3245 = _3347;
            if (!_3343)
            {
                _3197 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3349 = _3197;
            _3199 = _3349;
            if (!_3343)
            {
                _3209 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3351 = _3209;
            _3211 = _3351;
            if (!_3343)
            {
                _3269 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3353 = _3269;
            _3271 = _3353;
            if (!_3343)
            {
                _3261 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3355 = _3261;
            bool _3357 = !_3343;
            _3263 = _3355;
            if (!_3357)
            {
                bool _3359 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3361 = isnan(_2662);
                bool _3363 = _3359 || _3361;
                bool _3365 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3367 = _3363 || _3365;
                if (!_3367)
                {
                    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3371 = _2662 + _3369;
                    float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3375 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3373;
                    float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3379 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3381 = 1.0 / _3375;
                    float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3399 = _3371 * _3381;
                    float _3401 = precise::clamp(_3399, 0.0, 1.0);
                    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3405 = _3403 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3407 = fma(_3401, _3379, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3409 = fma(_3401, _3405, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3411 = fma(_3401, _3385, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3413 = fma(_3401, _3389, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3415 = fma(_3401, _3393, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3417 = fma(_3401, _3397, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3245 = _3411;
                    _3271 = _3415;
                    _3217 = _3407;
                    _3211 = _3413;
                    _3199 = _3409;
                    _3263 = _3417;
                    _3333 = true;
                }
                else
                {
                    _3245 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3271 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3217 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3211 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3199 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3263 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3333 = false;
    float _3419 = _3245;
    float _3421 = _3271;
    float _3423 = _3217;
    float _3425 = _3211;
    float _3427 = _3199;
    float _3429 = _3263;
    float _3431 = fma(_3171, -0.5, 0.5);
    float _3433 = precise::clamp(_3431, 0.0, 1.0);
    float _3435 = -_3419;
    float _3437 = _3435 + _3421;
    float _3439 = -_3423;
    float _3441 = _3439 + _3425;
    out.m_98.x = 0.0;
    float _3443 = fma(_3433, _3437, _3419);
    float _3445 = -_3427;
    float _3447 = _3445 + _3429;
    float _3449 = fma(_3433, _3441, _3423);
    float _3451 = _3443 * 0.586610972881317138671875;
    bool _3453 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3455 = fma(_3433, _3447, _3427);
    float _3457 = _3221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3459 = fma(_3449, 0.298911988735198974609375, _3451);
    bool _3461 = _2640 > 0.0;
    bool _3463 = isnan(_2640);
    bool _3465 = _3461 || _3463;
    bool _3467 = isnan(0.0);
    bool _3469 = _3465 || _3467;
    float _3471 = fma(_3455, 0.114477999508380889892578125, _3459);
    out.m_53.x = _3457;
    float _3473 = -_3471;
    float _3475 = _3449 + _3473;
    float _3477 = -_3471;
    float _3479 = _3443 + _3477;
    float _3481 = -_3471;
    float _3483 = _3455 + _3481;
    float _3485 = fma(_3475, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3471);
    float _3487 = fma(_3479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3471);
    float _3489 = fma(_3483, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3471);
    bool _3491 = !_3453;
    if (!_3491)
    {
        float _3493 = -_2584;
        float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3497 = -_2586;
        float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3501 = -_2588;
        float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3505 = _3495 * _3495;
        float _3507 = fma(_3499, _3499, _3505);
        float _3509 = fma(_3503, _3503, _3507);
        float _3511 = sqrt(_3509);
        float _3513 = rsqrt(_3509);
        float _3515 = -_3511;
        float _3517 = _3515 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3519 = _3517 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3521 = precise::clamp(_3519, 0.0, 1.0);
        float _3523 = _3499 * _3513;
        float _3525 = _3495 * _3513;
        float _3527 = abs(_3521);
        float _3529 = log2(_3527);
        float _3531 = _3503 * _3513;
        float _3533 = _3523 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3535 = _3171 * _3525;
        float _3537 = -_3525;
        float _3539 = -_3533;
        float _3541 = fma(_3537, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3539);
        float _3543 = fma(_3177, _3523, _3535);
        float _3545 = -_3531;
        float _3547 = fma(_3545, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3541);
        float _3549 = fma(_3161, _3531, _3543);
        float _3551 = precise::clamp(_3549, 0.0, 1.0);
        float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3555 = _3547 + _3553;
        float _3557 = _3529 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3559 = _3555 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3561 = precise::clamp(_3559, 0.0, 1.0);
        float _3563 = exp2(_3557);
        float _3565 = _3563 * _3561;
        float _3567 = _3551 * _3565;
        float _3569 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3571 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3573 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3569;
        out.m_98.y = _3571;
        out.m_98.z = _3573;
    }
    out.m_100.x = _3485;
    out.m_100.y = _3487;
    out.m_100.z = _3489;
    if (_3469)
    {
        return out;
    }
    float _3575 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3575;
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
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3333 = false;
    bool _259 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_46.w;
    float _116 = in.m_48.w;
    float _118 = trunc(_114);
    int _121 = int(_118);
    float _123 = -_116;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _125;
    bool _129 = _121 >= 1;
    float _131 = 0.0;
    float _133 = _116;
    float _135 = _125;
    if (!_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _131;
    if (!_129)
    {
        out.m_53.x = 0.0;
    }
    int _139 = 0;
    if (!_129)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    int _145 = _143;
    if (!_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3643 = as_type<float>(_143);
        out.gl_Position.z = _3643;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _147 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _149 = isnan(_116);
    bool _151 = _147 || _149;
    bool _153 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _155 = _151 || _153;
    float _157 = in.m_55.x;
    float _159 = float(_121);
    bool _161 = _125 >= _159;
    bool _163 = !_155;
    bool _165 = _161 || _163;
    float _167 = 1.0 / _159;
    if (_165)
    {
        _133 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _133;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    float _171 = _125 * _167;
    float _173 = _171;
    if (_165)
    {
        float _175 = _169 * 5.0;
        _145 = as_type<int>(_175);
    }
    int _177 = _145;
    out.m_57.x = _157;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3708 = as_type<float>(_177);
        out.gl_Position.z = _3708;
    }
    out.m_51.x = _171;
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = as_type<float>(int(gl_VertexIndex));
    float _181 = in.m_62.x;
    float _183 = in.m_62.y;
    float _185 = in.m_62.z;
    float _187 = in.m_64.x;
    float _189 = in.m_64.y;
    float _191 = in.m_64.z;
    float _193 = in.m_66.x;
    float _195 = in.m_66.y;
    float _197 = in.m_66.z;
    float _199 = in.m_68.x;
    float _201 = in.m_68.y;
    float _203 = in.m_68.z;
    int _205 = as_type<int>(_179) & 1;
    bool _207 = _205 != 0;
    int _209 = as_type<int>(_179) & 2;
    bool _211 = _209 != 0;
    bool _213 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _215 = !_207;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_211;
    float _221 = _219 ? (-0.5) : 0.5;
    float _223 = _183 * _189;
    float _225 = _183 * _195;
    float _227 = fma(_181, _187, _223);
    float _229 = _183 * _201;
    float _231 = fma(_181, _193, _225);
    float _233 = fma(_185, _191, _227);
    float _235 = fma(_181, _199, _229);
    float _237 = fma(_185, _197, _231);
    float _239 = fma(_185, _203, _235);
    bool _241 = !_213;
    float _257;
    if (!_241)
    {
        float _243 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _245 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _247 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _249 = _247 * _243;
        float _251 = floor(_249);
        float _253 = -_251;
        float _255 = _249 + _253;
        _257 = _255;
        _259 = true;
    }
    else
    {
        _257 = _171;
    }
    _259 = false;
    float _261 = _257;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = _261 + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _275;
    float _279 = 1.0 / _269;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _283 = 1.0 / _273;
    bool _285 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _287 = isnan(_261);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = 1.0 / _277;
    float _299 = _265 * _279;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _261 + _301;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = _261 + _305;
    float _309 = _303 * _283;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = fma(_313, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _321 = fma(_317, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _323 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _325 = isnan(_261);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _307 * _297;
    bool _337 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _339 = isnan(_261);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _345 = _341 || _343;
    float _347 = float(_345);
    float _349 = -_295;
    float _351 = _349 + 1.0;
    float _353 = -_347;
    float _355 = _353 + 1.0;
    float _357 = _347 * _351;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _361 = _359 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _363 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _365 = isnan(_261);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = _333 * _355;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = -_333;
    float _383 = _381 + 1.0;
    float _385 = fma(_361, _309, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _387 = fma(_379, _309, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _389 = _373 * _383;
    float _391 = in.m_70.x;
    float _393 = in.m_70.y;
    float _395 = -_373;
    float _397 = _395 + 1.0;
    float _399 = _319 * _389;
    float _401 = _321 * _389;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _403;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _409 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _407;
    float _411 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].x, _399);
    float _413 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[143].y, _401);
    float _415 = fma(_405, _335, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _417 = fma(_409, _335, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _419 = fma(_387, _375, _411);
    float _421 = fma(_385, _375, _413);
    float _423 = fma(_415, _357, _419);
    float _425 = fma(_417, _357, _421);
    float _427 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].x, _423);
    float _429 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[146].y, _425);
    float _431 = _427 * _391;
    float _433 = _429 * _393;
    bool _435 = !_281;
    if (!_435)
    {
        float _437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _439 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _441 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _443 = _441 * _437;
        float _445 = floor(_443);
        float _447 = -_445;
        float _449 = _443 + _447;
        _173 = _449;
    }
    float _451 = _173;
    float _453 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _455 = int(_453);
    float _457 = in.m_55.z;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _461 = _451 + _459;
    float _463 = in.m_66.w;
    float _465 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _467 = int(_465);
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _471 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_451);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _487 = float(_455);
    float _489 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _491 = int(_489);
    float _493 = -_481;
    float _495 = _493 + 1.0;
    float _497 = float(uint(_467));
    float _499 = 1.0 / _487;
    bool _501 = _467 == 0;
    float _503 = float(_491);
    float _505 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _507 = int(_505);
    float _509 = _499 * _125;
    float _511 = 1.0 / _503;
    float _513 = 1.0 / _497;
    float _515 = float(uint(_507));
    int _517 = ~_507;
    int _519 = _517 + 1;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _523 = _521 != 0;
    float _525 = trunc(_509);
    int _527 = int(_525);
    float _529 = _511 * _125;
    int _531 = ~_507;
    int _533 = _531 + 1;
    int _535 = ~_507;
    int _537 = _535 + 1;
    int _539 = as_type<int>(_513) + (-2);
    float _541 = 1.0 / _515;
    int _543 = ~_467;
    int _545 = _543 + 1;
    float _547 = _511;
    if (_523)
    {
        _547 = 1.0;
    }
    float _549 = _547;
    float _551 = float(uint(_527));
    float _553 = trunc(_529);
    int _555 = int(_553);
    float _557 = _549;
    if (!_523)
    {
        _557 = 7.345489978790283203125;
    }
    float _559 = _557;
    float _561 = as_type<float>(_539) * _551;
    float _563 = _559 * _157;
    float _565 = trunc(_561);
    float _567 = precise::max(_565, 0.0);
    uint _570 = uint(_567);
    int _572 = as_type<int>(_541) + (-2);
    float _574 = float(uint(_555));
    float _576 = 1.0 / _485;
    float _578 = _561;
    float _580 = _574;
    if (_523)
    {
        _578 = _157;
    }
    float _582 = _578;
    float _584 = _582;
    if (!_523)
    {
        _584 = _457;
    }
    float _586 = _584;
    float _588 = as_type<float>(_572) * _574;
    if (_523)
    {
        _580 = 1.0;
    }
    float _590 = _580;
    int _592 = _545 * int(_570);
    int _594 = _592 + _527;
    float _596 = trunc(_588);
    float _598 = precise::max(_596, 0.0);
    uint _600 = uint(_598);
    float _602 = _590;
    if (!_523)
    {
        _602 = 5.839270114898681640625;
    }
    float _604 = _602;
    float _606 = float(uint(_594));
    float _608 = as_type<float>(_539) * _606;
    float _610 = _604 * _586;
    int _612 = ~_467;
    int _614 = _612 + 1;
    float _616 = floor(_563);
    int _618 = _519 * int(_600);
    int _620 = _618 + _555;
    float _622 = trunc(_608);
    float _624 = precise::max(_622, 0.0);
    uint _626 = uint(_624);
    float _628 = float(uint(_620));
    float _630 = as_type<float>(_572) * _628;
    float _632 = float(_467);
    float _634 = floor(_610);
    float _636 = -_616;
    float _638 = _563 + _636;
    int _640 = int(_570) + int(_626);
    float _642 = trunc(_630);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    float _648 = float(_527);
    int _650 = _614 * _640;
    int _652 = _650 + _527;
    bool _654 = _648 >= _632;
    bool _656 = isnan(_648);
    bool _658 = _654 || _656;
    bool _660 = isnan(_632);
    bool _662 = _658 || _660;
    float _664 = float(_662);
    float _666 = -_634;
    float _668 = _610 + _666;
    float _670 = _638 * _632;
    bool _672 = uint(_652) >= uint(_467);
    float _674 = trunc(_664);
    int _676 = int(_674);
    bool _678 = !_672;
    int _680 = _678 ? 0 : (-1);
    int _682 = int(_600) + int(_646);
    int _684 = ~_640;
    int _686 = _684 + _680;
    int _688 = _686 + 1;
    float _690 = _167 * _125;
    float _692 = float(_507);
    int _694 = _533 * _682;
    int _696 = _694 + _555;
    float _698 = float(_555);
    int _700 = _467 * _688;
    int _702 = _700 + _527;
    float _704 = _632 * _690;
    bool _706 = _698 >= _692;
    bool _708 = isnan(_698);
    bool _710 = _706 || _708;
    bool _712 = isnan(_692);
    bool _714 = _710 || _712;
    float _716 = float(_714);
    int _718 = ~_676;
    int _720 = _718 + 1;
    int _722 = _720 + 1;
    bool _724 = !_501;
    int _726 = _724 ? _702 : (-1);
    float _728 = _692 * _690;
    bool _730 = uint(_696) >= uint(_507);
    float _732 = _668 * _692;
    float _734 = trunc(_716);
    int _736 = int(_734);
    int _738 = _467 + (-1);
    int _740 = _726 * _722;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _748 = _746 != 0;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _752 = _750 != 0;
    bool _754 = !_730;
    int _756 = _754 ? 0 : (-1);
    int _758 = _676 * _738;
    int _760 = _758 + _740;
    float _762 = trunc(_670);
    int _764 = int(_762);
    int _766 = ~_682;
    int _768 = _766 + _756;
    int _770 = _768 + 1;
    bool _772 = !_744;
    int _774 = _772 ? 0 : 1;
    int _776 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _778 = _776 != 0;
    int _780 = abs(_774);
    float _782 = trunc(_704);
    int _784 = int(_782);
    bool _786 = !_778;
    int _788 = _786 ? 0 : 1;
    int _790 = _507 * _770;
    int _792 = _790 + _555;
    bool _794 = _507 == 0;
    bool _796 = !_748;
    int _798 = _796 ? 0 : 1;
    int _800 = abs(_788);
    float _802 = trunc(_728);
    int _804 = int(_802);
    int _806 = abs(_798);
    int _808 = ~_736;
    int _810 = _808 + 1;
    int _812 = _810 + 1;
    int _814 = _764 * _800;
    int _816 = _814 + _527;
    bool _818 = !_794;
    int _820 = _818 ? _792 : (-1);
    int _822 = _760 * _806;
    int _824 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _826 = _824 != 0;
    float _828 = trunc(_732);
    int _830 = int(_828);
    int _832 = _820 * _812;
    bool _834 = !_826;
    int _836 = _834 ? 0 : 1;
    bool _838 = !_752;
    int _840 = _838 ? 0 : 1;
    int _842 = _784 * _780;
    int _844 = _842 + _822;
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _848 = _846 != 0;
    float _850 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _852 = log2(_850);
    int _854 = abs(_840);
    int _856 = _507 + (-1);
    bool _858 = !_848;
    int _860 = _858 ? 0 : 1;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _864 = _862 != 0;
    int _866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _868 = _866 != 0;
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _872 = _870 != 0;
    int _874 = _736 * _856;
    int _876 = _874 + _832;
    int _878 = abs(_860);
    int _880 = _816 * _854;
    int _882 = _880 + _844;
    int _884 = abs(_836);
    bool _886 = !_868;
    int _888 = _886 ? 0 : 1;
    int _890 = _830 * _884;
    int _892 = _890 + _555;
    bool _894 = !_864;
    int _896 = _894 ? 0 : 1;
    float _898 = _852 * _125;
    int _900 = abs(_888);
    int _902 = _764 * _878;
    int _904 = _902 + _882;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _908 = _906 != 0;
    bool _910 = !_872;
    int _912 = _910 ? 0 : 1;
    int _914 = _876 * _900;
    int _916 = abs(_896);
    float _918 = exp2(_898);
    bool _920 = !_908;
    int _922 = _920 ? 0 : 1;
    int _924 = abs(_912);
    int _926 = abs(_922);
    float _928 = float(uint(_904));
    int _930 = _804 * _916;
    int _932 = _930 + _914;
    float _934 = as_type<float>(_539) * _928;
    int _936 = ~_507;
    int _938 = _936 + 1;
    float _940 = float(uint(_892));
    int _942 = _892 * _924;
    int _944 = _942 + _932;
    float _946 = trunc(_934);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    int _952 = _830 * _926;
    int _954 = _952 + _944;
    int _956 = ~_467;
    int _958 = _956 + 1;
    int _960 = ~_507;
    int _962 = _960 + 1;
    float _964 = float(uint(_954));
    float _966 = as_type<float>(_572) * _964;
    int _968 = _958 * int(_950);
    int _970 = _968 + _904;
    float _972 = trunc(_966);
    float _974 = precise::max(_972, 0.0);
    uint _976 = uint(_974);
    float _978 = float(uint(_970));
    float _980 = as_type<float>(_539) * _978;
    float _982 = trunc(_980);
    float _984 = precise::max(_982, 0.0);
    uint _986 = uint(_984);
    int _988 = _962 * int(_976);
    int _990 = _988 + _954;
    float _992 = float(uint(_990));
    int _994 = ~_467;
    int _996 = _994 + 1;
    float _998 = as_type<float>(_572) * _992;
    int _1000 = int(_950) + int(_986);
    float _1002 = trunc(_998);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    int _1008 = _996 * _1000;
    int _1010 = _1008 + _904;
    bool _1012 = uint(_1010) >= uint(_467);
    bool _1014 = !_1012;
    int _1016 = _1014 ? 0 : (-1);
    int _1018 = int(_976) + int(_1006);
    int _1020 = ~_1000;
    int _1022 = _1020 + _1016;
    int _1024 = _1022 + 1;
    int _1026 = _938 * _1018;
    int _1028 = _1026 + _954;
    int _1030 = _467 * _1024;
    int _1032 = _1030 + _904;
    bool _1034 = uint(_1028) >= uint(_507);
    bool _1036 = !_501;
    int _1038 = _1036 ? _1032 : (-1);
    float _1040 = in.m_55.y;
    bool _1042 = !_1034;
    int _1044 = _1042 ? 0 : (-1);
    int _1046 = _1038 & 3;
    bool _1048 = _1046 != 0;
    int _1050 = _1038 & 3;
    bool _1052 = _1050 != 0;
    bool _1054 = uint(_1046) > 1u;
    int _1056 = ~_1018;
    int _1058 = _1056 + _1044;
    int _1060 = _1058 + 1;
    int _1062 = _1052 ? 0 : 1;
    bool _1064 = uint(_1046) >= 2u;
    int _1066 = _507 * _1060;
    int _1068 = _1066 + _954;
    int _1070 = ~_1062;
    int _1072 = _1070 + 1;
    int _1074 = _1072 + 1;
    int _1076 = _1064 ? 0 : 1;
    bool _1078 = !_794;
    int _1080 = _1078 ? _1068 : (-1);
    int _1082 = _1074;
    if (!_1054)
    {
        int _1084 = ~_1062;
        int _1086 = _1084 + 1;
        _1082 = _1086;
    }
    int _1088 = _1082;
    float _1090 = in.m_46.x;
    float _1092 = in.m_46.y;
    float _1094 = in.m_46.z;
    int _1096 = _1080 & 3;
    bool _1098 = _1096 != 0;
    bool _1100 = _1046 != 3;
    bool _1102 = uint(_1096) >= 2u;
    int _1104 = _1080 & 3;
    bool _1106 = _1104 != 0;
    int _1108 = _1102 ? 0 : 1;
    bool _1110 = _1096 != 3;
    int _1112 = ~_1076;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    int _1118 = ~_1108;
    int _1120 = _1118 + 1;
    int _1122 = _1120 + 1;
    int _1124 = _1116;
    int _1126 = _1122;
    if (_1100)
    {
        int _1128 = ~_1076;
        int _1130 = _1128 + 1;
        _1124 = _1130;
    }
    int _1132 = _1124;
    int _1134 = _1106 ? 0 : 1;
    int _1136 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1138 = _1136 != 0;
    bool _1140 = uint(_1096) > 1u;
    float _1142 = _195 * _1092;
    float _1144 = _189 * _1092;
    float _1146 = _201 * _1092;
    if (_1110)
    {
        int _1148 = ~_1108;
        int _1150 = _1148 + 1;
        _1126 = _1150;
    }
    int _1152 = _1126;
    float _1154 = fma(_193, _1090, _1142);
    float _1156 = float(uint(_816));
    float _1158 = -_918;
    float _1160 = _1158 + 1.0;
    float _1162 = fma(_187, _1090, _1144);
    bool _1164 = _157 > 0.5;
    float _1166 = as_type<float>(_539) * _1156;
    bool _1168 = !_1138;
    int _1170 = _1168 ? 0 : 1;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1176 = _1174 != 0;
    float _1178 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1180 = -_217;
    int _1182 = _1164 ? as_type<int>(_1180) : as_type<int>(_217);
    float _1184 = trunc(_1166);
    float _1186 = precise::max(_1184, 0.0);
    uint _1188 = uint(_1186);
    float _1190 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1172);
    float _1192 = as_type<float>(_572) * _940;
    bool _1194 = !_1176;
    float _1196 = _1194 ? _217 : as_type<float>(_1182);
    float _1198 = -_469;
    float _1200 = fma(_1178, 2.0, _1198);
    bool _1202 = _1040 > 0.5;
    float _1204 = fma(_199, _1090, _1146);
    int _1206 = ~_1134;
    int _1208 = _1206 + 1;
    int _1210 = _1208 + 1;
    float _1212 = trunc(_1192);
    float _1214 = precise::max(_1212, 0.0);
    uint _1216 = uint(_1214);
    int _1218 = _1210;
    if (!_1140)
    {
        int _1220 = ~_1134;
        int _1222 = _1220 + 1;
        _1218 = _1222;
    }
    int _1224 = _1218;
    float _1226 = _157 * 2.0;
    float _1228 = -_221;
    int _1230 = _1202 ? as_type<int>(_1228) : as_type<int>(_221);
    float _1232 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1234 = ~_467;
    int _1236 = _1234 + 1;
    float _1238 = -_125;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1200);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1244 = _1242 != 0;
    float _1246 = floor(_1226);
    int _1248 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1250 = _1248 != 0;
    int _1252 = _1236 * int(_1188);
    int _1254 = _1252 + _816;
    bool _1256 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1258 = isnan(0.0);
    bool _1260 = _1256 || _1258;
    bool _1262 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1264 = _1260 || _1262;
    float _1266 = fma(_191, _1094, _1162);
    float _1268 = _1264 ? _1160 : 0.0;
    int _1270 = _537 * int(_1216);
    int _1272 = _1270 + _892;
    bool _1274 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1276 = isnan(1.0);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1282 = _1278 || _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1286 = 1.0 + _1284;
    float _1288 = float(uint(_1254));
    float _1290 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1190);
    float _1292 = _1040 * 2.0;
    float _1294 = 1.0 / _1286;
    float _1296 = as_type<float>(_539) * _1288;
    float _1298 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1300 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1302 = ~_467;
    int _1304 = _1302 + 1;
    float _1306 = fma(_1232, -2.0, _1298);
    bool _1308 = !_1250;
    float _1310 = _1308 ? _221 : as_type<float>(_1230);
    float _1312 = trunc(_1296);
    float _1314 = precise::max(_1312, 0.0);
    uint _1316 = uint(_1314);
    float _1318 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1300);
    float _1320 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1306);
    bool _1322 = _1246 > 0.0;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1326 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1318);
    float _1328 = -_1290;
    float _1330 = _1328 + 1.0;
    if (_1282)
    {
        float _1332 = _1268 * _1294;
        _135 = _1332;
    }
    float _1334 = _135;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1338 = float(uint(_1272));
    float _1340 = floor(_1292);
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1344 = _1246 >= 0.0;
    bool _1346 = isnan(_1246);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan(0.0);
    bool _1352 = _1348 || _1350;
    float _1354 = as_type<float>(_572) * _1338;
    int _1356 = int(_1188) + int(_1316);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1360 = trunc(_1354);
    float _1362 = precise::max(_1360, 0.0);
    uint _1364 = uint(_1362);
    float _1366 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1368 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1370 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1376 = _1352 ? 0 : 1;
    int _1378 = _1304 * _1356;
    int _1380 = _1378 + _816;
    out.m_72.x = _1366;
    out.m_72.y = _1368;
    out.m_72.z = _1370;
    out.m_72.w = _1336;
    float _1382 = fma(_197, _1094, _1154);
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1386 = _1384 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1388 = ~_1376;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = fma(_203, _1094, _1204);
    float _1396 = _457 * 2.0;
    bool _1398 = uint(_1380) >= uint(_467);
    float _1400 = 1.0 / _1374;
    int _1402 = _1392;
    if (!_1322)
    {
        int _1404 = ~_1376;
        int _1406 = _1404 + 1;
        _1402 = _1406;
    }
    int _1408 = _1402;
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1412 = _451 + _1410;
    int _1414 = ~_507;
    int _1416 = _1414 + 1;
    float _1418 = -_1326;
    float _1420 = _1418 + 1.0;
    int _1422 = int(_1216) + int(_1364);
    float _1424 = floor(_1396);
    bool _1426 = _1340 > 0.0;
    int _1428 = _1416 * _1422;
    int _1430 = _1428 + _892;
    bool _1432 = !_1398;
    int _1434 = _1432 ? 0 : (-1);
    float _1436 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1438 = _1436 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1440 = _1340 >= 0.0;
    bool _1442 = isnan(_1340);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.0);
    bool _1448 = _1444 || _1446;
    float _1450 = 1.0 / _1386;
    bool _1452 = !_1048;
    int _1454 = _1452 ? 0 : 1;
    int _1456 = _1448 ? 0 : 1;
    bool _1458 = uint(_1430) >= uint(_507);
    int _1460 = ~_1456;
    int _1462 = _1460 + 1;
    int _1464 = _1462 + 1;
    float _1466 = 1.0 / _1438;
    float _1468 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1470 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1468;
    float _1472 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1474 = _1472 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1476 = _1470 * _576;
    int _1478 = _1464;
    if (!_1426)
    {
        int _1480 = ~_1456;
        int _1482 = _1480 + 1;
        _1478 = _1482;
    }
    int _1484 = _1478;
    float _1486 = _157 + _1040;
    bool _1488 = !_1458;
    int _1490 = _1488 ? 0 : (-1);
    float _1492 = _1474 * _1400;
    int _1494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1496 = _1494 != 0;
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1500 = _1498 != 0;
    int _1502 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1504 = _1502 != 0;
    float _1506 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1508 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1506;
    float _1510 = in.m_64.w;
    float _1512 = _1486 + (-1.0);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    bool _1518 = !_1496;
    int _1520 = _1518 ? 0 : 1;
    float _1522 = _1508 * _1450;
    bool _1524 = _1424 >= 0.0;
    bool _1526 = isnan(_1424);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan(0.0);
    bool _1532 = _1528 || _1530;
    float _1534 = _1516 * _1466;
    bool _1536 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1538 = isnan(_451);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    int _1548 = _1532 ? 0 : 1;
    float _1550 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1552 = _1424 > 0.0;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1556 = _451 + _1554;
    bool _1558 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1560 = isnan(_451);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = in.m_68.w;
    float _1572 = -_1546;
    float _1574 = _1572 + 1.0;
    float _1576 = fma(_1476, _1556, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1578 = abs(_1224);
    float _1580 = _1568 * _1574;
    float _1582 = -_1568;
    float _1584 = _1582 + 1.0;
    float _1586 = fma(_1492, _1412, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1588 = fma(_1522, _461, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1590 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1592 = isnan(_451);
    bool _1594 = _1590 || _1592;
    bool _1596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1598 = _1594 || _1596;
    float _1600 = float(_1598);
    float _1602 = _481 * _1584;
    bool _1604 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1606 = isnan(_451);
    bool _1608 = _1604 || _1606;
    bool _1610 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1612 = _1608 || _1610;
    float _1614 = float(_1612);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1618 = _451 + _1616;
    float _1620 = _1196 + 0.5;
    float _1622 = _1600 * _495;
    float _1624 = -_1600;
    float _1626 = _1624 + 1.0;
    float _1628 = _1266 + _1510;
    float _1630 = _1310 + (-0.5);
    float _1632 = _1382 + _463;
    float _1634 = fma(_1620, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1240);
    float _1636 = _1614 * _1626;
    float _1638 = -_1630;
    float _1640 = -_1320;
    float _1642 = fma(_1638, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1640);
    float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1646 = _1632 + _1644;
    float _1648 = -_1614;
    float _1650 = _1648 + 1.0;
    float _1652 = _1576 * _1636;
    float _1654 = -_1420;
    float _1656 = fma(_1196, _1654, _1634);
    float _1658 = fma(_1310, _1330, _1642);
    float _1660 = _1394 + _1570;
    float _1662 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1664 = _1628 + _1662;
    float _1666 = _1646 * _1646;
    float _1668 = fma(_1650, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1652);
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1672 = _1660 + _1670;
    float _1674 = fma(_1534, _1618, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1676 = fma(_1664, _1664, _1666);
    float _1678 = fma(_1586, _1622, _1668);
    int _1680 = _1038 >> 31;
    out.m_74.x = _1656;
    out.m_74.y = _1658;
    float _1682 = fma(_1672, _1672, _1676);
    float _1684 = fma(_1588, _1602, _1678);
    int _1686 = _1680 & 3;
    float _1688 = rsqrt(_1682);
    float _1690 = fma(_1674, _1580, _1684);
    int _1692 = _1080 >> 31;
    float _1694 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1696 = ~_1548;
    int _1698 = _1696 + 1;
    int _1700 = _1698 + 1;
    float _1702 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1690);
    int _1704 = _1038 + _1686;
    float _1706 = _1646 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1708 = _1692 & 3;
    int _1710 = _1700;
    if (!_1552)
    {
        int _1712 = ~_1548;
        int _1714 = _1712 + 1;
        _1710 = _1714;
    }
    int _1716 = _1710;
    float _1718 = fma(_1664, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1706);
    int _1720 = _1704 >> 2;
    int _1722 = _1080 + _1708;
    float _1724 = _1694 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1726 = _1720 << 4;
    int _1728 = _1726 + 368;
    float _1730 = fma(_1672, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1718);
    bool _1732 = !_1098;
    int _1734 = _1732 ? 0 : 1;
    float _1736 = _1724 * _1688;
    int _1738 = _1722 >> 2;
    uint _1740 = uint(int(uint(_1728) >> uint(2)));
    uint _1742 = uint(int(uint(int(_1740)) >> uint(2)));
    int _1744 = int(_1740) & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    int _1748 = int(_1740) + 1;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    int _1752 = _1748 & 3;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[int(_1750)][_1752];
    bool _1756 = _1046 != 3;
    float _1758 = _1646 * _1736;
    int _1760 = _1738 << 4;
    int _1762 = _1760 + 656;
    bool _1764 = !_1756;
    int _1766 = _1764 ? 0 : (-1);
    float _1768 = -_1758;
    float _1770 = _1646 + _1768;
    bool _1772 = _1096 != 3;
    float _1774 = _1664 * _1736;
    uint _1776 = uint(int(uint(_1762) >> uint(2)));
    uint _1778 = uint(int(uint(int(_1776)) >> uint(2)));
    int _1780 = int(_1776) & 3;
    float _1782 = (*spvDescriptorSet0.vp_c9)._m0[int(_1778)][_1780];
    int _1784 = int(_1776) + 1;
    uint _1786 = uint(int(uint(_1784) >> uint(2)));
    int _1788 = _1784 & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    float _1792 = _1770 * _1770;
    float _1794 = -_1774;
    float _1796 = _1664 + _1794;
    int _1798 = abs(_1520);
    float _1800 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1802 = fma(_1796, _1796, _1792);
    int _1804 = _1728 + 8;
    uint _1806 = uint(int(uint(_1804) >> uint(2)));
    uint _1808 = uint(int(uint(int(_1806)) >> uint(2)));
    int _1810 = int(_1806) & 3;
    float _1812 = (*spvDescriptorSet0.vp_c9)._m0[int(_1808)][_1810];
    int _1814 = int(_1806) + 1;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    int _1818 = _1814 & 3;
    float _1820 = (*spvDescriptorSet0.vp_c9)._m0[int(_1816)][_1818];
    bool _1822 = !_1772;
    int _1824 = _1822 ? 0 : (-1);
    float _1826 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1828 = _1730 >= 0.0;
    int _1830 = _1762 + 8;
    uint _1832 = uint(int(uint(_1830) >> uint(2)));
    uint _1834 = uint(int(uint(int(_1832)) >> uint(2)));
    int _1836 = int(_1832) & 3;
    float _1838 = (*spvDescriptorSet0.vp_c9)._m0[int(_1834)][_1836];
    int _1840 = int(_1832) + 1;
    uint _1842 = uint(int(uint(_1840) >> uint(2)));
    int _1844 = _1840 & 3;
    float _1846 = (*spvDescriptorSet0.vp_c9)._m0[int(_1842)][_1844];
    float _1848 = float(_1716);
    float _1850 = _1672 * _1736;
    float _1852 = _1702 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1856 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1858 = ~_1356;
    int _1860 = _1858 + _1434;
    int _1862 = _1860 + 1;
    float _1864 = -_1850;
    float _1866 = _1672 + _1864;
    float _1868 = _1854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1870 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1872 = abs(_1734);
    int _1874 = _467 * _1862;
    int _1876 = _1874 + _816;
    int _1878 = abs(_1088);
    float _1880 = fma(_1866, _1866, _1802);
    out.m_76.x = _1868;
    out.m_76.y = _1870;
    out.m_76.z = _1826;
    out.m_76.w = _1852;
    int _1882 = abs(_1454);
    int _1884 = abs(_1132);
    if (_1828)
    {
        out.m_53.x = 0.0;
    }
    int _1886 = abs(_1152);
    int _1888 = abs(_1766);
    int _1890 = ~_1422;
    int _1892 = _1890 + _1490;
    int _1894 = _1892 + 1;
    float _1896 = float(_1798);
    bool _1898 = !_501;
    int _1900 = _1898 ? _1876 : (-1);
    int _1902 = _507 * _1894;
    int _1904 = _1902 + _892;
    int _1906 = ~_1878;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = _1896 * _1848;
    int _1914 = ~_1882;
    int _1916 = _1914 + 1;
    int _1918 = _1916 + 1;
    int _1920 = _1910 * as_type<int>(_1754);
    int _1922 = ~_1578;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    int _1928 = _1918 * as_type<int>(_1746);
    int _1930 = _1928 + _1920;
    int _1932 = ~_1872;
    int _1934 = _1932 + 1;
    int _1936 = _1934 + 1;
    int _1938 = _1926 * as_type<int>(_1790);
    int _1940 = ~_1884;
    int _1942 = _1940 + 1;
    int _1944 = _1942 + 1;
    int _1946 = _1936 * as_type<int>(_1782);
    int _1948 = _1946 + _1938;
    int _1950 = abs(_1824);
    int _1952 = _1944 * as_type<int>(_1812);
    int _1954 = _1952 + _1930;
    int _1956 = ~_1886;
    int _1958 = _1956 + 1;
    int _1960 = _1958 + 1;
    float _1962 = in.m_78.x;
    float _1964 = in.m_78.y;
    float _1966 = in.m_78.z;
    bool _1968 = !_1244;
    int _1970 = _1968 ? 0 : 1;
    int _1972 = _1960 * as_type<int>(_1838);
    int _1974 = _1972 + _1948;
    int _1976 = ~_1888;
    int _1978 = _1976 + 1;
    int _1980 = _1978 + 1;
    int _1982 = abs(_1170);
    float _1984 = sqrt(_1880);
    int _1986 = ~_1950;
    int _1988 = _1986 + 1;
    int _1990 = _1988 + 1;
    int _1992 = _1980 * as_type<int>(_1820);
    int _1994 = _1992 + _1954;
    int _1996 = abs(_1970);
    int _1998 = ~_1982;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _1990 * as_type<int>(_1846);
    int _2006 = _2004 + _1974;
    int _2008 = ~_1996;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    bool _2014 = !_794;
    int _2016 = _2014 ? _1904 : (-1);
    int _2018 = _1994 * _2002;
    float _2020 = as_type<float>(_1980);
    if (_1828)
    {
        _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2022 = _2020;
    int _2024 = _2006 * _2012;
    float _2026 = _1912 * (-2.0);
    int _2028 = _1900 * _1982;
    int _2030 = _2028 + _2018;
    float _2032 = _157 + (-0.5);
    int _2034 = _2016 * _1996;
    int _2036 = _2034 + _2024;
    float _2038 = fma(_1550, _2026, _1550);
    float _2040 = _1688 * _1984;
    float _2042 = fma(_2026, _1962, _1962);
    int _2044 = as_type<int>(_2022);
    float _2046 = _1966;
    float _2048 = _2040;
    if (_1828)
    {
        float _2050 = _2022 * 5.0;
        _2044 = as_type<int>(_2050);
    }
    int _2052 = _2044;
    float _2054 = float(_2030);
    float _2056 = _1694 * _2040;
    float _2058 = float(_2036);
    float _2060 = fma(_2032, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2042);
    float _2062 = _1040 + _457;
    bool _2064 = !_1500;
    int _2066 = _2064 ? 0 : 1;
    if (_1828)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6434 = as_type<float>(_2052);
        out.gl_Position.z = _6434;
    }
    float _2068 = _2062 + (-1.0);
    float _2070 = float(_1408);
    out.m_80.x = _2054;
    int _2072 = abs(_2066);
    out.m_80.z = _2058;
    out.m_82.x = _2056;
    bool _2074 = !_1504;
    int _2076 = _2074 ? 0 : 1;
    if (_1828)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2078 = -_1758;
    float _2080 = _1632 + _2078;
    int _2082 = abs(_2076);
    float _2084 = -_1774;
    float _2086 = _1628 + _2084;
    float _2088 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2090 = _2080 + _2088;
    float _2092 = -_1850;
    float _2094 = _1660 + _2092;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2098 = _2086 + _2096;
    float _2100 = float(_2072);
    float _2102 = _2090 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2104 = float(_1484);
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2108 = _2094 + _2106;
    float _2110 = float(_2082);
    float _2112 = _2100 * _2070;
    float _2114 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2102);
    float _2116 = fma(_2068, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2118 = _1040 + (-0.5);
    float _2120 = _2110 * _2104;
    float _2122 = _2112 * (-2.0);
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2114);
    float _2126 = _157 + _457;
    float _2128 = fma(_2038, _1334, _2060);
    float _2130 = fma(_2122, _1964, _1964);
    float _2132 = fma(_2116, _2122, _2116);
    bool _2134 = _2124 >= 0.0;
    float _2136 = _2126 + (-1.0);
    float _2138 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2130);
    float _2140 = _2120 * (-2.0);
    float _2142 = _2128 * 0.15915493667125701904296875;
    float _2144 = fma(_2132, _1334, _2138);
    float _2146 = _457 + (-0.5);
    float _2148 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2150 = fma(_2140, _1966, _1966);
    float _2152 = _2144 * 0.15915493667125701904296875;
    float _2154 = _2142 * 6.283185482025146484375;
    float _2156 = sin(_2154);
    float _2158 = fma(_2148, _2140, _2148);
    if (_2134)
    {
        _2046 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2160 = _2046;
    float _2162 = fma(_2146, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2150);
    int _2164 = as_type<int>(_2160);
    if (_2134)
    {
        out.m_53.x = 0.0;
    }
    if (_2134)
    {
        float _2166 = _2160 * 5.0;
        _2164 = as_type<int>(_2166);
    }
    int _2168 = _2164;
    float _2170 = _2142 * 6.283185482025146484375;
    float _2172 = cos(_2170);
    float _2174 = fma(_2158, _1334, _2162);
    if (_2134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6621 = as_type<float>(_2168);
        out.gl_Position.z = _6621;
    }
    float _2176 = _2174 * 0.15915493667125701904296875;
    float _2178 = _2152 * 6.283185482025146484375;
    float _2180 = sin(_2178);
    float _2182 = _2152 * 6.283185482025146484375;
    float _2184 = cos(_2182);
    if (_2134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2186 = _2176 * 6.283185482025146484375;
    float _2188 = cos(_2186);
    float _2190 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _2194 = _2172 * _2180;
    float _2196 = _2156 * _2180;
    float _2198 = _2190 * _2040;
    float _2200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2202 = _2156 * _2184;
    float _2204 = _2176 * 6.283185482025146484375;
    float _2206 = sin(_2204);
    float _2208 = _2198 * _2192;
    float _2210 = _2172 * _2184;
    float _2212 = _2056 * _2200;
    float _2214 = _2172 * _2188;
    float _2216 = _2184 * _2188;
    float _2218 = _2156 * _2188;
    float _2220 = _2180 * _2188;
    float _2222 = _2214 * _2208;
    float _2224 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2226 = _2224 * 0.5;
    float _2228 = fma(_2206, _2210, _2196);
    float _2230 = -_2202;
    float _2232 = fma(_2206, _2194, _2230);
    float _2234 = -_2208;
    float _2236 = _2206 * _2234;
    float _2238 = -_2194;
    float _2240 = fma(_2206, _2202, _2238);
    float _2242 = fma(_2228, _2212, _2222);
    float _2244 = _2218 * _2208;
    float _2246 = fma(_2216, _2212, _2236);
    float _2248 = fma(_2206, _2196, _2210);
    float _2250 = fma(_2232, _2226, _2242);
    float _2252 = fma(_2240, _2212, _2244);
    float _2254 = fma(_2220, _2226, _2246);
    float _2256 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2258 = fma(_2248, _2226, _2252);
    float _2260 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2262 = _2250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2264 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2256);
    float _2266 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2260);
    float _2268 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2262);
    float _2270 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2264);
    float _2272 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2266);
    float _2274 = fma(_2258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2268);
    float _2276 = _2270 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2278 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2280 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2282 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2284 = _1660 + _2276;
    float _2286 = _1628 + _2280;
    float _2288 = _1632 + _2282;
    float _2290 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2292 = _2284 + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2296 = _2286 + _2294;
    float _2298 = _2292 * _2292;
    float _2300 = fma(_2296, _2296, _2298);
    float _2302 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2278);
    float _2304 = sqrt(_2300);
    float _2306 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2302);
    bool _2308 = _2304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = _2282;
    float _2312 = _2286;
    float _2314 = _2302;
    if (!_2308)
    {
        _2310 = _2286;
    }
    float _2316 = _2310;
    float _2318 = _2316;
    if (!_2308)
    {
        _2312 = _2284;
    }
    float _2320 = _2312;
    float _2322 = _2320;
    if (!_2308)
    {
        _2314 = _2288;
    }
    float _2324 = _2314;
    bool _2326 = !_2308;
    float _2328 = _2324;
    if (!_2326)
    {
        float _2330 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2332 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2334 = _2304 + _2332;
        float _2336 = _2288 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2338 = rsqrt(_2300);
        float _2340 = _2334 * _2330;
        float _2342 = _2340 * 0.15915493667125701904296875;
        float _2344 = _2342 * 6.283185482025146484375;
        float _2346 = cos(_2344);
        float _2348 = _2342 * 6.283185482025146484375;
        float _2350 = sin(_2348);
        float _2352 = _2346 + (-1.0);
        float _2354 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2356 = fma(_2350, _2336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2358 = fma(_2288, _2346, _2354);
        float _2360 = _2338 * _2356;
        float _2362 = fma(_2296, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2364 = fma(_2292, _2360, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2328 = _2358;
        _2318 = _2362;
        _2322 = _2364;
    }
    float _2366 = _2328;
    float _2368 = _2318;
    float _2370 = _2322;
    float _2372 = -_1632;
    float _2374 = _2372 + _2366;
    float _2376 = -_1628;
    float _2378 = _2376 + _2368;
    float _2380 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2382 = -_1660;
    float _2384 = _2382 + _2370;
    float _2386 = _2374 * _2374;
    float _2388 = _2080 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2390 = 1.0 / _2380;
    float _2392 = fma(_2378, _2378, _2386);
    float _2394 = fma(_2086, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2388);
    bool _2396 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2398 = isnan(0.5);
    bool _2400 = _2396 || _2398;
    bool _2402 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2404 = _2400 || _2402;
    float _2406 = fma(_2384, _2384, _2392);
    float _2408 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2394);
    float _2410 = sqrt(_2406);
    float _2412 = _2408 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2414 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2416 = isnan(0.5);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2422 = _2418 || _2420;
    float _2424 = _2412 + _2380;
    float _2426 = _2424 * _2390;
    float _2428 = _2426 * 0.5;
    bool _2430 = _2410 > 0.0;
    float _2432 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2434 = fma(_2428, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2432);
    float _2436 = 1.0 / _2434;
    float _2438 = _2428;
    float _2440 = _2368;
    float _2442 = _2366;
    float _2444 = _2390;
    float _2446 = _2370;
    if (!_2430)
    {
        _2438 = _2370;
    }
    float _2448 = _2438;
    bool _2450 = !_2430;
    float _2452 = _2448;
    if (!_2450)
    {
        float _2454 = _237 * _237;
        float _2456 = rsqrt(_2406);
        float _2458 = fma(_233, _233, _2454);
        float _2460 = fma(_239, _239, _2458);
        float _2462 = sqrt(_2460);
        float _2464 = _2378 * _2456;
        float _2466 = _2374 * _2456;
        float _2468 = _2384 * _2456;
        bool _2470 = _2462 > 0.0;
        float _2472 = _2462;
        if (!_2470)
        {
            _2472 = _2370;
        }
        float _2474 = _2472;
        bool _2476 = !_2470;
        _2452 = _2474;
        if (!_2476)
        {
            float _2478 = rsqrt(_2460);
            float _2480 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2482 = _237 * _2478;
            float _2484 = _233 * _2478;
            float _2486 = _2466 * _2482;
            float _2488 = _239 * _2478;
            float _2490 = fma(_2464, _2484, _2486);
            float _2492 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2494 = fma(_2468, _2488, _2490);
            float _2496 = _2494 * _2492;
            float _2498 = fma(_233, _2496, _2368);
            float _2500 = fma(_237, _2496, _2366);
            float _2502 = fma(_239, _2496, _2370);
            _2440 = _2498;
            _2442 = _2500;
            _2452 = _2502;
            _2444 = _2492;
        }
    }
    float _2504 = _2440;
    float _2506 = _2442;
    float _2508 = _2452;
    float _2510 = _2444;
    float _2512 = -_1774;
    float _2514 = _2512 + _2504;
    float _2516 = -_1758;
    float _2518 = _2516 + _2506;
    float _2520 = -_1850;
    float _2522 = _2520 + _2508;
    float _2524 = _2518;
    float _2526 = _2514;
    float _2528 = _2522;
    float _2530 = _2510;
    if (_2422)
    {
        _2446 = 1.0;
    }
    float _2532 = _2446;
    float _2534 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2536 = _2436 * _2534;
    float _2538 = _2532;
    if (!_2404)
    {
        float _2540 = _2090 * _2090;
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2544 = -_1660;
        float _2546 = _2544 + _2508;
        float _2548 = -_1632;
        float _2550 = _2548 + _2506;
        float _2552 = fma(_2098, _2098, _2540);
        float _2554 = -_1628;
        float _2556 = _2554 + _2504;
        float _2558 = fma(_2108, _2108, _2552);
        float _2560 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2562 = sqrt(_2558);
        float _2564 = 1.0 / _2040;
        float _2566 = _2560 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2568 = precise::min(_2562, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2570 = _2568 * _2542;
        float _2572 = _2570 * _2564;
        float _2574 = _2566 * _2572;
        float _2576 = _2546 * _2572;
        float _2578 = fma(_2550, _2574, _2080);
        float _2580 = fma(_2556, _2574, _2086);
        float _2582 = fma(_2566, _2576, _2094);
        _2524 = _2578;
        _2526 = _2580;
        _2528 = _2582;
    }
    float _2584 = _2524;
    float _2586 = _2526;
    float _2588 = _2528;
    if (!_2422)
    {
        float _2590 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2592 = _2590 * 0.15915493667125701904296875;
        float _2594 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2596 = _2592 * 6.283185482025146484375;
        float _2598 = cos(_2596);
        float _2600 = _2594 * 0.15915493667125701904296875;
        float _2602 = _2592 * 6.283185482025146484375;
        float _2604 = sin(_2602);
        float _2606 = 1.0 / _2598;
        float _2608 = _2600 * 6.283185482025146484375;
        float _2610 = cos(_2608);
        float _2612 = _2604 * _2606;
        float _2614 = _2600 * 6.283185482025146484375;
        float _2616 = sin(_2614);
        float _2618 = _2610 * _2612;
        float _2620 = 1.0 / _2618;
        float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2624 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2622;
        float _2626 = 1.0 / _2624;
        float _2628 = _2616 * _2620;
        float _2630 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2632 = fma(_2536, _2628, _2630);
        float _2634 = _2632 * _2626;
        float _2636 = precise::clamp(_2634, 0.0, 1.0);
        _2048 = _2600;
        _2538 = _2636;
    }
    float _2638 = _2048;
    float _2640 = _2538;
    float _2642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2644 = _2584 + _2642;
    float _2646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2648 = _2586 + _2646;
    float _2650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2652 = _2588 + _2650;
    float _2654 = _2644 * _2644;
    float _2656 = fma(_2648, _2648, _2654);
    float _2658 = fma(_2652, _2652, _2656);
    float _2660 = rsqrt(_2658);
    float _2662 = sqrt(_2658);
    float _2664 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2666 = _2648 * _2664;
    float _2668 = _2652 * _2664;
    float _2670 = _2666 * _2666;
    float _2672 = _2668 * _2668;
    float _2674 = _2670 + _2672;
    float _2676 = sqrt(_2674);
    bool _2678 = _2676 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2682 = _2676 + _2680;
    float _2684 = _2652;
    float _2686 = _2674;
    float _2688 = _2682;
    float _2690 = _2654;
    if (_2678)
    {
        float _2692 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2684 = _2692;
    }
    float _2694 = _2684;
    if (_2678)
    {
        float _2696 = rsqrt(_2674);
        _2686 = _2696;
    }
    float _2698 = _2686;
    float _2700 = _2698;
    if (_2678)
    {
        float _2702 = _2682 * _2694;
        _2688 = _2702;
    }
    float _2704 = _2688;
    if (_2678)
    {
        float _2706 = _2704 * 0.15915493667125701904296875;
        _2690 = _2706;
    }
    float _2708 = _2690;
    float _2710 = _2694;
    float _2712 = _2708;
    if (_2678)
    {
        float _2714 = _2708 * 6.283185482025146484375;
        float _2716 = sin(_2714);
        _2710 = _2716;
    }
    float _2718 = _2710;
    float _2720 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2722 = precise::max(0.0, _2720);
    float _2724 = _2638;
    float _2726 = _2722;
    if (_2678)
    {
        float _2728 = _2708 * 6.283185482025146484375;
        float _2730 = cos(_2728);
        _2724 = _2730;
    }
    float _2732 = _2724;
    float _2734 = -_2664;
    float _2736 = -_2722;
    float _2738 = fma(_2644, _2734, _2736);
    float _2740 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2678)
    {
        float _2742 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2726 = _2742;
    }
    float _2744 = _2726;
    float _2746 = _2744;
    if (!_2678)
    {
        _2712 = _2666;
    }
    float _2748 = _2712;
    float _2750 = fma(_2086, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2752 = _2718;
    float _2754 = _2748;
    if (_2678)
    {
        float _2756 = fma(_2718, _2744, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2752 = _2756;
    }
    float _2758 = _2752;
    float _2760 = _2758;
    if (!_2678)
    {
        _2746 = _2738;
    }
    float _2762 = _2746;
    float _2764 = _2762;
    float _2766 = _2732;
    if (_2678)
    {
        float _2768 = _2732 + (-1.0);
        _2740 = _2768;
    }
    float _2770 = _2740;
    float _2772 = _2770;
    if (_2678)
    {
        float _2774 = _2698 * _2758;
        _2530 = _2774;
    }
    float _2776 = _2530;
    if (!_2678)
    {
        _2700 = _2668;
    }
    float _2778 = _2700;
    float _2780 = _2778;
    if (_2678)
    {
        float _2782 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2772 = _2782;
    }
    float _2784 = _2772;
    if (_2678)
    {
        float _2786 = _2666 * _2776;
        _2754 = _2786;
    }
    float _2788 = _2754;
    if (!_2678)
    {
        _2760 = _2670;
    }
    float _2790 = _2760;
    float _2792 = _2790;
    if (_2678)
    {
        float _2794 = _2668 * _2776;
        _2780 = _2794;
    }
    float _2796 = _2780;
    if (_2678)
    {
        float _2798 = fma(_2738, _2732, _2784);
        _2764 = _2798;
    }
    float _2800 = _2764;
    if (_2678)
    {
        float _2802 = _2788 * _2788;
        _2792 = _2802;
    }
    float _2804 = _2792;
    if (!_2678)
    {
        _2766 = _2672;
    }
    float _2806 = _2766;
    float _2808 = _2806;
    if (_2678)
    {
        float _2810 = _2796 * _2796;
        _2808 = _2810;
    }
    float _2812 = _2808;
    float _2814 = fma(_2800, _2800, _2804);
    float _2816 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2818 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2820 = floor(_2750);
    float _2822 = _2814 + _2812;
    float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2826 = fma(_2662, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2824);
    float _2828 = precise::clamp(_2826, 0.0, 1.0);
    float _2830 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2816);
    float _2832 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2818);
    float _2834 = -_2828;
    float _2836 = _2834 + 1.0;
    float _2838 = rsqrt(_2822);
    float _2840 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2830);
    float _2842 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2844 = fma(_2094, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2846 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2848 = _2840 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2850 = abs(_2836);
    float _2852 = log2(_2850);
    float _2854 = _2584 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2856 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2846);
    float _2858 = _2848 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2860 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2854);
    float _2862 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2856);
    float _2864 = -_2858;
    float _2866 = fma(_2864, _2842, 1.0);
    float _2868 = _2838 * _2788;
    float _2870 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2860);
    float _2872 = _2838 * _2800;
    float _2874 = _2838 * _2796;
    float _2876 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2878 = _2870 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2880 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2882 = floor(_2844);
    float _2884 = -_2876;
    float _2886 = fma(_2872, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2884);
    float _2888 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2890 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2892 = -_2874;
    float _2894 = fma(_2892, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2886);
    float _2896 = fma(_2588, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2832);
    float _2898 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2888);
    float _2900 = log2(_2866);
    float _2902 = -_2820;
    float _2904 = _2750 + _2902;
    float _2906 = _2896 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2908 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2898);
    float _2910 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2912 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2908);
    float _2914 = exp2(_2890);
    float _2916 = fma(_2894, -0.5, 0.5);
    float _2918 = -_2882;
    float _2920 = _2844 + _2918;
    float _2922 = fma(_2894, 0.5, 0.5);
    float _2924 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2910);
    float _2926 = fma(_2922, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2928 = sqrt(_2916);
    float _2930 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2932 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2924);
    float _2934 = fma(_2922, _2926, -0.212114393711090087890625);
    float _2936 = _2900 * 0.693147182464599609375;
    float _2938 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2930);
    float _2940 = 1.0 / _2912;
    float _2942 = _2872 + 1.0;
    float _2944 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2938);
    float _2946 = fma(_2922, _2934, 1.570728778839111328125);
    float2 _7852 = float2(_2904, _2920);
    float _2948 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7852, float2(0.0), isnan(_7852)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7852, float2(0.0), isnan(_7852)), level(0.0)).x;
    float _2950 = -_2872;
    float _2952 = fma(_2914, _2942, _2950);
    float _2954 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2932);
    float _2956 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2944);
    float _2958 = _2928 * 0.636619746685028076171875;
    float _2960 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2962 = fma(_2952, 0.5, 0.5);
    float _2964 = -_2946;
    float _2966 = fma(_2958, _2964, 1.0);
    float _2968 = _2954 * _2940;
    float _2970 = _2956 * _2940;
    float _2972 = fma(_2968, 0.5, 0.5);
    float _2974 = fma(_2970, -0.5, 0.5);
    float3 _7903 = float3(_2972, _2974, _2960);
    float _2976 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7903, float3(0.0), isnan(_7903)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7903, float3(0.0), isnan(_7903)), level(0.0)).x;
    float3 _7914 = float3(_2972, _2974, _2960);
    float4 _2979 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7914, float3(0.0), isnan(_7914)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7914, float3(0.0), isnan(_7914)), level(0.0)).xyzw;
    float _2981 = _2979.x;
    float _2983 = _2979.y;
    float _2985 = _2979.z;
    float _2987 = _2979.w;
    float2 _7930 = float2(_2966, _2962);
    float3 _2991 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7930, float2(0.0), isnan(_7930)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7930, float2(0.0), isnan(_7930)), level(0.0)).xyz;
    float _2993 = _2991.x;
    float _2995 = _2991.y;
    float _2997 = _2991.z;
    float _2999 = abs(_2536);
    float _3001 = log2(_2999);
    float _3003 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3005 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3007 = _2228 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3009 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3011 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3003);
    float _3013 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3005);
    float _3015 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3007);
    float _3017 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3019 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3021 = _2214 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3023 = -_2206;
    float _3025 = fma(_3023, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3017);
    float _3027 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _3029 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3031 = isnan(_2662);
    bool _3033 = _3029 || _3031;
    bool _3035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3037 = _3033 || _3035;
    float _3039 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3041 = -_2206;
    float _3043 = fma(_3041, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3021);
    float _3045 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3047 = _2232 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3049 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3027);
    float _3051 = -_2206;
    float _3053 = fma(_3051, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3019);
    float _3055 = exp2(_3039);
    float _3057 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3047);
    float _3059 = fma(_3009, _3009, 1.0);
    float _3061 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3045);
    float _3063 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3025);
    float _3065 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3053);
    float _3067 = fma(_2218, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3043);
    float _3069 = rsqrt(_3059);
    float _3071 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3011);
    float _3073 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3075 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3061);
    float _3077 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3049);
    float _3079 = fma(_2248, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3057);
    float _3081 = _3009 * _3063;
    float _3083 = fma(_3055, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3085 = precise::clamp(_3083, 0.0, 1.0);
    float _3087 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3013);
    float _3089 = _2878 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3091 = fma(_2240, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3015);
    float _3093 = fma(_3085, -2.0, 3.0);
    float _3095 = _3085 * _3085;
    float _3097 = fma(_2880, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3089);
    float _3099 = _3009 * _3069;
    float _3101 = _3095 * _3093;
    float _3103 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3097);
    float _3105 = fma(_3073, _3071, _3081);
    float _3107 = -_3075;
    float _3109 = _3099 * _3107;
    float _3111 = -_3101;
    float _3113 = _3111 + 1.0;
    float _3115 = _3009 * _3065;
    float _3117 = in.m_84.x;
    float _3119 = fma(_3069, _3063, _3109);
    float _3121 = fma(_3113, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3101);
    float _3123 = -_3077;
    float _3125 = _3099 * _3123;
    out.m_86.x = _3071;
    out.m_86.y = _3087;
    out.m_86.z = _3091;
    float _3127 = fma(_3073, _3087, _3115);
    float _3129 = _3009 * _3067;
    float _3131 = fma(_3069, _3065, _3125);
    float _3133 = fma(_2906, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3103);
    float _3135 = _2852 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3137 = fma(_3073, _3091, _3129);
    float _3139 = _3133 + _2912;
    out.gl_Position.x = _2954;
    out.gl_Position.y = _2956;
    out.gl_Position.z = _3133;
    out.gl_Position.w = _2912;
    float _3141 = exp2(_3135);
    bool _3143 = _2536 <= 8000.0;
    bool _3145 = isnan(_2536);
    bool _3147 = _3143 || _3145;
    bool _3149 = isnan(8000.0);
    bool _3151 = _3147 || _3149;
    float _3153 = float(_3151);
    float _3155 = -_3079;
    float _3157 = _3099 * _3155;
    float _3159 = _2954 + _2912;
    float _3161 = _3079 + _3137;
    float _3163 = _3139 * 0.5;
    float _3165 = _3153 * _3121;
    float _3167 = fma(_3069, _3067, _3157);
    float _3169 = _2912 * 0.5;
    float _3171 = _3077 + _3127;
    float _3173 = _3165 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3175 = fma(_2956, -0.5, _3169);
    float _3177 = _3075 + _3105;
    float _3179 = _3159 * 0.5;
    out.m_88.x = _3119;
    out.m_88.y = _3131;
    out.m_88.z = _3167;
    float _3181 = -_3141;
    float _3183 = _3181 + 1.0;
    float _3185 = _2912;
    float _3187 = _3133;
    float _3189 = _3131;
    float _3191 = _3119;
    if (!_3037)
    {
        _3185 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3193 = _3185;
    out.m_90.x = _3177;
    out.m_90.y = _3171;
    out.m_90.z = _3161;
    float _3195 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3197 = _3193;
    float _3199 = _3193;
    if (!_3037)
    {
        _3187 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3201 = _3187;
    out.m_92.x = _3179;
    out.m_92.y = _3175;
    out.m_92.z = _3163;
    out.m_92.w = _2912;
    float _3203 = -_3195;
    float _3205 = _3203 + 1.0;
    float _3207 = _3205;
    float _3209 = _3201;
    float _3211 = _3201;
    if (!_3037)
    {
        _3189 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3213 = _3189;
    float _3215 = _3213;
    float _3217 = _3213;
    if (!_3037)
    {
        _3191 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3219 = _3191;
    float _3221 = _2640 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3223 = -_2948;
    float _3225 = _3223 + 1.0;
    float _3227 = _3225 * _3173;
    float _3229 = precise::clamp(_3227, 0.0, 1.0);
    float _3231 = -_3229;
    float _3233 = fma(_3231, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3235 = _3233 * _3117;
    float _3237 = _3235 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3239 = _3195 * _2976;
    float _3241 = _2987 * _3205;
    out.m_94.x = _3237;
    float _3243 = _3219;
    float _3245 = _3219;
    if (!_3037)
    {
        _3207 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3247 = _3207;
    float _3249 = _2987 * _3239;
    float _3251 = _2997 * _3239;
    float _3253 = fma(_2993, _3249, _2981);
    float _3255 = fma(_2995, _3249, _2983);
    float _3257 = fma(_2987, _3251, _2985);
    float _3259 = _3249;
    float _3261 = _3247;
    float _3263 = _3247;
    if (!_3037)
    {
        _3259 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3265 = _3259;
    out.m_96.x = _3253;
    out.m_96.y = _3255;
    out.m_96.z = _3257;
    out.m_96.w = _3241;
    bool _3267 = !_3037;
    float _3269 = _3265;
    float _3271 = _3265;
    if (!_3267)
    {
        bool _3273 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3275 = isnan(_2662);
        bool _3277 = _3273 || _3275;
        bool _3279 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3281 = _3277 || _3279;
        if (!_3281)
        {
            float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3285 = _2662 + _3283;
            float _3287 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3289 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3287;
            float _3291 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3293 = _3291 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3295 = 1.0 / _3289;
            float _3297 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3299 = _3297 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3301 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3303 = _3301 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3307 = _3305 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3311 = _3309 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3313 = _3285 * _3295;
            float _3315 = precise::clamp(_3313, 0.0, 1.0);
            float _3317 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3321 = fma(_3315, _3293, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3323 = fma(_3315, _3319, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3325 = fma(_3315, _3299, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3327 = fma(_3315, _3303, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3329 = fma(_3315, _3307, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3331 = fma(_3315, _3311, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3245 = _3325;
            _3271 = _3329;
            _3217 = _3321;
            _3211 = _3327;
            _3199 = _3323;
            _3263 = _3331;
            _3333 = true;
        }
        else
        {
            bool _3335 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3337 = isnan(_2662);
            bool _3339 = _3335 || _3337;
            bool _3341 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3343 = _3339 || _3341;
            if (!_3343)
            {
                _3215 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3345 = _3215;
            _3217 = _3345;
            if (!_3343)
            {
                _3243 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3347 = _3243;
            _3245 = _3347;
            if (!_3343)
            {
                _3197 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3349 = _3197;
            _3199 = _3349;
            if (!_3343)
            {
                _3209 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3351 = _3209;
            _3211 = _3351;
            if (!_3343)
            {
                _3269 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3353 = _3269;
            _3271 = _3353;
            if (!_3343)
            {
                _3261 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3355 = _3261;
            bool _3357 = !_3343;
            _3263 = _3355;
            if (!_3357)
            {
                bool _3359 = _2662 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3361 = isnan(_2662);
                bool _3363 = _3359 || _3361;
                bool _3365 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3367 = _3363 || _3365;
                if (!_3367)
                {
                    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3371 = _2662 + _3369;
                    float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3375 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3373;
                    float _3377 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3379 = _3377 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3381 = 1.0 / _3375;
                    float _3383 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3385 = _3383 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3387 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3391 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3395 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3399 = _3371 * _3381;
                    float _3401 = precise::clamp(_3399, 0.0, 1.0);
                    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3405 = _3403 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3407 = fma(_3401, _3379, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3409 = fma(_3401, _3405, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3411 = fma(_3401, _3385, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3413 = fma(_3401, _3389, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3415 = fma(_3401, _3393, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3417 = fma(_3401, _3397, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3245 = _3411;
                    _3271 = _3415;
                    _3217 = _3407;
                    _3211 = _3413;
                    _3199 = _3409;
                    _3263 = _3417;
                    _3333 = true;
                }
                else
                {
                    _3245 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3271 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3217 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3211 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3199 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3263 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3333 = false;
    float _3419 = _3245;
    float _3421 = _3271;
    float _3423 = _3217;
    float _3425 = _3211;
    float _3427 = _3199;
    float _3429 = _3263;
    float _3431 = fma(_3171, -0.5, 0.5);
    float _3433 = precise::clamp(_3431, 0.0, 1.0);
    float _3435 = -_3419;
    float _3437 = _3435 + _3421;
    float _3439 = -_3423;
    float _3441 = _3439 + _3425;
    out.m_98.x = 0.0;
    float _3443 = fma(_3433, _3437, _3419);
    float _3445 = -_3427;
    float _3447 = _3445 + _3429;
    float _3449 = fma(_3433, _3441, _3423);
    float _3451 = _3443 * 0.586610972881317138671875;
    bool _3453 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3455 = fma(_3433, _3447, _3427);
    float _3457 = _3221 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3459 = fma(_3449, 0.298911988735198974609375, _3451);
    bool _3461 = _2640 > 0.0;
    bool _3463 = isnan(_2640);
    bool _3465 = _3461 || _3463;
    bool _3467 = isnan(0.0);
    bool _3469 = _3465 || _3467;
    float _3471 = fma(_3455, 0.114477999508380889892578125, _3459);
    out.m_53.x = _3457;
    float _3473 = -_3471;
    float _3475 = _3449 + _3473;
    float _3477 = -_3471;
    float _3479 = _3443 + _3477;
    float _3481 = -_3471;
    float _3483 = _3455 + _3481;
    float _3485 = fma(_3475, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3471);
    float _3487 = fma(_3479, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3471);
    float _3489 = fma(_3483, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3471);
    bool _3491 = !_3453;
    if (!_3491)
    {
        float _3493 = -_2584;
        float _3495 = _3493 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3497 = -_2586;
        float _3499 = _3497 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3501 = -_2588;
        float _3503 = _3501 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3505 = _3495 * _3495;
        float _3507 = fma(_3499, _3499, _3505);
        float _3509 = fma(_3503, _3503, _3507);
        float _3511 = sqrt(_3509);
        float _3513 = rsqrt(_3509);
        float _3515 = -_3511;
        float _3517 = _3515 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3519 = _3517 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3521 = precise::clamp(_3519, 0.0, 1.0);
        float _3523 = _3499 * _3513;
        float _3525 = _3495 * _3513;
        float _3527 = abs(_3521);
        float _3529 = log2(_3527);
        float _3531 = _3503 * _3513;
        float _3533 = _3523 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3535 = _3171 * _3525;
        float _3537 = -_3525;
        float _3539 = -_3533;
        float _3541 = fma(_3537, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3539);
        float _3543 = fma(_3177, _3523, _3535);
        float _3545 = -_3531;
        float _3547 = fma(_3545, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3541);
        float _3549 = fma(_3161, _3531, _3543);
        float _3551 = precise::clamp(_3549, 0.0, 1.0);
        float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3555 = _3547 + _3553;
        float _3557 = _3529 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3559 = _3555 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3561 = precise::clamp(_3559, 0.0, 1.0);
        float _3563 = exp2(_3557);
        float _3565 = _3563 * _3561;
        float _3567 = _3551 * _3565;
        float _3569 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3571 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3573 = _3567 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3569;
        out.m_98.y = _3571;
        out.m_98.z = _3573;
    }
    out.m_100.x = _3485;
    out.m_100.y = _3487;
    out.m_100.z = _3489;
    if (_3469)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3575 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3575;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

