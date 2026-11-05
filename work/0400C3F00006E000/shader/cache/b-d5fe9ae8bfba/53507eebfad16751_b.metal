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
    float4 m_80 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_100 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3299 = false;
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
        float _3609 = as_type<float>(_143);
        out.gl_Position.z = _3609;
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
        float _3674 = as_type<float>(_177);
        out.gl_Position.z = _3674;
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
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = _451 + _459;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _465 = int(_463);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _471 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _473 = isnan(_451);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _467);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = float(_455);
    float _491 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _493 = int(_491);
    float _495 = -_481;
    float _497 = _495 + 1.0;
    float _499 = float(_465);
    float _501 = 1.0 / _489;
    float _503 = 1.0 / _499;
    float _505 = float(uint(_493));
    int _507 = ~_493;
    int _509 = _507 + 1;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _513 = _511 != 0;
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _517 = int(_515);
    float _519 = _501 * _125;
    int _521 = ~_493;
    int _523 = _521 + 1;
    int _525 = ~_493;
    int _527 = _525 + 1;
    float _529 = 1.0 / _505;
    float _531 = _503 * _125;
    float _533 = 0.0;
    if (_513)
    {
        _533 = 1.0;
    }
    float _535 = _533;
    float _537 = _535;
    if (!_513)
    {
        _537 = 7.345489978790283203125;
    }
    float _539 = _537;
    float _541 = trunc(_519);
    int _543 = int(_541);
    float _545 = float(uint(_517));
    int _547 = ~_517;
    int _549 = _547 + 1;
    float _551 = _539 * _157;
    float _553 = 1.0 / _545;
    int _555 = as_type<int>(_529) + (-2);
    float _557 = trunc(_531);
    int _559 = int(_557);
    float _561 = float(uint(_543));
    float _563 = as_type<float>(_555) * _561;
    float _565 = _561;
    if (_513)
    {
        _565 = 1.0;
    }
    float _567 = _565;
    float _569 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _571 = log2(_569);
    int _573 = as_type<int>(_553) + (-2);
    float _575 = _567;
    if (!_513)
    {
        _575 = 5.839270114898681640625;
    }
    float _577 = _575;
    float _579 = float(uint(_559));
    float _581 = trunc(_563);
    float _583 = precise::max(_581, 0.0);
    uint _586 = uint(_583);
    float _588 = as_type<float>(_573) * _579;
    float _590 = _579;
    if (_513)
    {
        _590 = _157;
    }
    float _592 = _590;
    float _594 = _592;
    if (!_513)
    {
        _594 = _457;
    }
    float _596 = _594;
    float _598 = trunc(_588);
    float _600 = precise::max(_598, 0.0);
    uint _602 = uint(_600);
    float _604 = _571 * _125;
    float _606 = _577 * _596;
    float _608 = floor(_551);
    int _610 = _509 * int(_586);
    int _612 = _610 + _543;
    float _614 = float(uint(_612));
    int _616 = _549 * int(_602);
    int _618 = _616 + _559;
    float _620 = floor(_606);
    float _622 = as_type<float>(_555) * _614;
    float _624 = float(_517);
    float _626 = float(uint(_618));
    float _628 = -_608;
    float _630 = _551 + _628;
    float _632 = trunc(_622);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _640 = _638 != 0;
    float _642 = as_type<float>(_573) * _626;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _646 = _644 != 0;
    float _648 = trunc(_642);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    float _654 = -_620;
    float _656 = _606 + _654;
    float _658 = float(_493);
    float _660 = _630 * _658;
    int _662 = int(_586) + int(_636);
    float _664 = _167 * _125;
    float _666 = float(_543);
    float _668 = 1.0 / _487;
    float _670 = _658 * _664;
    bool _672 = _666 >= _658;
    bool _674 = isnan(_666);
    bool _676 = _672 || _674;
    bool _678 = isnan(_658);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = _656 * _624;
    float _686 = float(_559);
    int _688 = _523 * _662;
    int _690 = _688 + _543;
    int _692 = int(_602) + int(_652);
    float _694 = trunc(_660);
    int _696 = int(_694);
    int _698 = ~_517;
    int _700 = _698 + 1;
    float _702 = _624 * _664;
    bool _704 = _686 >= _624;
    bool _706 = isnan(_686);
    bool _708 = _704 || _706;
    bool _710 = isnan(_624);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    bool _716 = !_640;
    int _718 = _716 ? 0 : 1;
    int _720 = _700 * _692;
    int _722 = _720 + _559;
    bool _724 = uint(_690) >= uint(_493);
    float _726 = trunc(_682);
    int _728 = int(_726);
    bool _730 = !_646;
    int _732 = _730 ? 0 : 1;
    int _734 = abs(_718);
    bool _736 = !_724;
    int _738 = _736 ? 0 : (-1);
    bool _740 = uint(_722) >= uint(_517);
    float _742 = trunc(_684);
    int _744 = int(_742);
    int _746 = abs(_732);
    int _748 = ~_662;
    int _750 = _748 + _738;
    int _752 = _750 + 1;
    bool _754 = !_740;
    int _756 = _754 ? 0 : (-1);
    float _758 = trunc(_714);
    int _760 = int(_758);
    int _762 = _696 * _734;
    int _764 = _762 + _543;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _776 = _774 != 0;
    int _778 = _493 * _752;
    int _780 = _778 + _543;
    int _782 = ~_692;
    int _784 = _782 + _756;
    int _786 = _784 + 1;
    bool _788 = _493 == 0;
    bool _790 = _517 == 0;
    int _792 = _517 * _786;
    int _794 = _792 + _559;
    int _796 = ~_728;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    int _802 = _744 * _746;
    int _804 = _802 + _559;
    bool _806 = !_788;
    int _808 = _806 ? _780 : (-1);
    float _810 = trunc(_670);
    int _812 = int(_810);
    bool _814 = !_772;
    int _816 = _814 ? 0 : 1;
    int _818 = ~_760;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    int _824 = _808 * _800;
    bool _826 = !_790;
    int _828 = _826 ? _794 : (-1);
    bool _830 = !_768;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_702);
    int _836 = int(_834);
    bool _838 = !_776;
    int _840 = _838 ? 0 : 1;
    int _842 = _828 * _822;
    int _844 = _493 + (-1);
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _856 = _854 != 0;
    int _858 = abs(_816);
    int _860 = _728 * _844;
    int _862 = _860 + _824;
    int _864 = _517 + (-1);
    bool _866 = !_852;
    int _868 = _866 ? 0 : 1;
    int _870 = abs(_832);
    int _872 = _760 * _864;
    int _874 = _872 + _842;
    int _876 = abs(_868);
    int _878 = _862 * _858;
    bool _880 = !_848;
    int _882 = _880 ? 0 : 1;
    int _884 = _812 * _870;
    int _886 = _884 + _878;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _890 = _888 != 0;
    int _892 = _874 * _876;
    bool _894 = !_856;
    int _896 = _894 ? 0 : 1;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _900 = _898 != 0;
    int _902 = abs(_882);
    bool _904 = !_890;
    int _906 = _904 ? 0 : 1;
    int _908 = abs(_896);
    int _910 = _836 * _902;
    int _912 = _910 + _892;
    int _914 = abs(_840);
    bool _916 = !_900;
    int _918 = _916 ? 0 : 1;
    int _920 = abs(_906);
    int _922 = abs(_918);
    int _924 = _804 * _908;
    int _926 = _924 + _912;
    int _928 = ~_517;
    int _930 = _928 + 1;
    int _932 = _764 * _914;
    int _934 = _932 + _886;
    int _936 = ~_493;
    int _938 = _936 + 1;
    int _940 = _696 * _920;
    int _942 = _940 + _934;
    int _944 = ~_517;
    int _946 = _944 + 1;
    int _948 = _744 * _922;
    int _950 = _948 + _926;
    float _952 = float(uint(_942));
    float _954 = float(uint(_950));
    float _956 = as_type<float>(_555) * _952;
    float _958 = as_type<float>(_573) * _954;
    int _960 = ~_493;
    int _962 = _960 + 1;
    float _964 = trunc(_956);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    float _970 = trunc(_958);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    int _976 = _962 * int(_968);
    int _978 = _976 + _942;
    float _980 = float(uint(_978));
    int _982 = _946 * int(_974);
    int _984 = _982 + _950;
    float _986 = as_type<float>(_555) * _980;
    float _988 = float(uint(_984));
    float _990 = trunc(_986);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    float _996 = as_type<float>(_573) * _988;
    float _998 = trunc(_996);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    int _1004 = int(_968) + int(_994);
    int _1006 = ~_493;
    int _1008 = _1006 + 1;
    int _1010 = _938 * _1004;
    int _1012 = _1010 + _942;
    int _1014 = int(_974) + int(_1002);
    bool _1016 = uint(_1012) >= uint(_493);
    int _1018 = _930 * _1014;
    int _1020 = _1018 + _950;
    bool _1022 = !_1016;
    int _1024 = _1022 ? 0 : (-1);
    bool _1026 = uint(_1020) >= uint(_517);
    int _1028 = ~_1004;
    int _1030 = _1028 + _1024;
    int _1032 = _1030 + 1;
    bool _1034 = !_1026;
    int _1036 = _1034 ? 0 : (-1);
    int _1038 = _493 * _1032;
    int _1040 = _1038 + _942;
    int _1042 = ~_1014;
    int _1044 = _1042 + _1036;
    int _1046 = _1044 + 1;
    bool _1048 = !_788;
    int _1050 = _1048 ? _1040 : (-1);
    int _1052 = _517 * _1046;
    int _1054 = _1052 + _950;
    float _1056 = float(uint(_764));
    int _1058 = _1050 & 3;
    bool _1060 = _1058 != 0;
    bool _1062 = !_790;
    int _1064 = _1062 ? _1054 : (-1);
    float _1066 = as_type<float>(_555) * _1056;
    int _1068 = _1050 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _1064 & 3;
    bool _1074 = _1072 != 0;
    bool _1076 = uint(_1058) > 1u;
    float _1078 = trunc(_1066);
    float _1080 = precise::max(_1078, 0.0);
    uint _1082 = uint(_1080);
    bool _1084 = uint(_1072) > 1u;
    int _1086 = _1070 ? 0 : 1;
    int _1088 = _1064 & 3;
    bool _1090 = _1088 != 0;
    int _1092 = ~_1086;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    int _1098 = _1090 ? 0 : 1;
    bool _1100 = uint(_1072) >= 2u;
    int _1102 = ~_1098;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    int _1108 = _1096;
    int _1110 = _1106;
    if (!_1076)
    {
        int _1112 = ~_1086;
        int _1114 = _1112 + 1;
        _1108 = _1114;
    }
    int _1116 = _1108;
    int _1118 = _1008 * int(_1082);
    int _1120 = _1118 + _764;
    if (!_1084)
    {
        int _1122 = ~_1098;
        int _1124 = _1122 + 1;
        _1110 = _1124;
    }
    int _1126 = _1110;
    float _1128 = in.m_46.x;
    float _1130 = in.m_46.y;
    float _1132 = in.m_46.z;
    bool _1134 = uint(_1058) >= 2u;
    bool _1136 = _1058 != 3;
    float _1138 = float(uint(_1120));
    int _1140 = _1134 ? 0 : 1;
    bool _1142 = _1072 != 3;
    float _1144 = as_type<float>(_555) * _1138;
    int _1146 = ~_1140;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    float _1152 = in.m_55.y;
    int _1154 = _1100 ? 0 : 1;
    bool _1156 = _157 > 0.5;
    int _1158 = _1150;
    if (_1136)
    {
        int _1160 = ~_1140;
        int _1162 = _1160 + 1;
        _1158 = _1162;
    }
    int _1164 = _1158;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1168 = _1166 != 0;
    int _1170 = ~_1154;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    int _1176 = _1174;
    if (_1142)
    {
        int _1178 = ~_1154;
        int _1180 = _1178 + 1;
        _1176 = _1180;
    }
    int _1182 = _1176;
    float _1184 = _189 * _1130;
    float _1186 = _195 * _1130;
    float _1188 = _201 * _1130;
    float _1190 = exp2(_604);
    bool _1192 = !_1168;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = fma(_199, _1128, _1188);
    float _1198 = -_217;
    int _1200 = _1156 ? as_type<int>(_1198) : as_type<int>(_217);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1206 = _1204 != 0;
    float _1208 = fma(_187, _1128, _1184);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1212 = _1210 != 0;
    float _1214 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1218 = _1216 != 0;
    float _1220 = fma(_193, _1128, _1186);
    float _1222 = trunc(_1144);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    float _1228 = float(uint(_804));
    float _1230 = _157 * 2.0;
    float _1232 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _469);
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1236 = -_1190;
    float _1238 = _1236 + 1.0;
    float _1240 = as_type<float>(_573) * _1228;
    int _1242 = abs(_1126);
    float _1244 = -_1234;
    float _1246 = fma(_1214, 2.0, _1244);
    float _1248 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1250 = !_1212;
    float _1252 = _1250 ? _217 : as_type<float>(_1200);
    float _1254 = floor(_1230);
    bool _1256 = _1152 > 0.5;
    float _1258 = fma(_1248, -2.0, _1202);
    float _1260 = -_221;
    int _1262 = _1256 ? as_type<int>(_1260) : as_type<int>(_221);
    float _1264 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1258);
    int _1266 = int(_1082) + int(_1226);
    float _1268 = trunc(_1240);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    bool _1274 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1276 = isnan(0.0);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1282 = _1278 || _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1288 = -_125;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1246);
    float _1292 = _1282 ? _1238 : 0.0;
    float _1294 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _483);
    bool _1296 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1298 = isnan(1.0);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1304 = _1300 || _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1308 = 1.0 + _1306;
    int _1310 = ~_517;
    int _1312 = _1310 + 1;
    float _1314 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1232);
    float _1316 = 1.0 / _1286;
    float _1318 = fma(_203, _1132, _1196);
    bool _1320 = !_1218;
    float _1322 = _1320 ? _221 : as_type<float>(_1262);
    float _1324 = -_1314;
    float _1326 = _1324 + 1.0;
    int _1328 = _1312 * int(_1272);
    int _1330 = _1328 + _804;
    bool _1332 = _1254 >= 0.0;
    bool _1334 = isnan(_1254);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1346 = 1.0 / _1308;
    float _1348 = fma(_191, _1132, _1208);
    float _1350 = float(uint(_1330));
    int _1352 = _527 * _1266;
    int _1354 = _1352 + _764;
    float _1356 = _1152 * 2.0;
    float _1358 = fma(_197, _1132, _1220);
    int _1360 = _1340 ? 0 : 1;
    float _1362 = as_type<float>(_573) * _1350;
    float _1364 = 1.0 / _1344;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1368 = abs(_1164);
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1304)
    {
        float _1372 = _1292 * _1346;
        _135 = _1372;
    }
    float _1374 = _135;
    float _1376 = floor(_1356);
    bool _1378 = uint(_1354) >= uint(_493);
    float _1380 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1382 = !_1378;
    int _1384 = _1382 ? 0 : (-1);
    float _1386 = trunc(_1362);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    bool _1392 = _1254 > 0.0;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1398 = abs(_1182);
    float _1400 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1404;
    bool _1408 = _1376 >= 0.0;
    bool _1410 = isnan(_1376);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(0.0);
    bool _1416 = _1412 || _1414;
    float _1418 = _1406 * _1316;
    out.m_72.x = _1380;
    out.m_72.y = _1400;
    out.m_72.z = _1402;
    out.m_72.w = _1370;
    int _1420 = _1416 ? 0 : 1;
    bool _1422 = _1376 > 0.0;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1424;
    int _1428 = int(_1272) + int(_1390);
    float _1430 = _457 * 2.0;
    int _1432 = ~_1420;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = in.m_66.w;
    float _1440 = _1426 * _1364;
    float _1442 = floor(_1430);
    float _1444 = in.m_64.w;
    bool _1446 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1448 = isnan(_451);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1454 = _1450 || _1452;
    float _1456 = float(_1454);
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1462 = ~_517;
    int _1464 = _1462 + 1;
    int _1466 = ~_1360;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    float _1472 = _1460 * _668;
    int _1474 = _1470;
    int _1476 = _1436;
    if (!_1392)
    {
        int _1478 = ~_1360;
        int _1480 = _1478 + 1;
        _1474 = _1480;
    }
    int _1482 = _1474;
    int _1484 = _1464 * _1428;
    int _1486 = _1484 + _804;
    if (!_1422)
    {
        int _1488 = ~_1420;
        int _1490 = _1488 + 1;
        _1476 = _1490;
    }
    int _1492 = _1476;
    float _1494 = _157 + _1152;
    bool _1496 = !_1060;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1502 = _451 + _1500;
    bool _1504 = uint(_1486) >= uint(_517);
    float _1506 = _1494 + (-1.0);
    bool _1508 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1510 = isnan(_451);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = -_1456;
    float _1522 = _1520 + 1.0;
    bool _1524 = !_1504;
    int _1526 = _1524 ? 0 : (-1);
    float _1528 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1532 = _1530 != 0;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1540 = _1538 != 0;
    float _1542 = -_1518;
    float _1544 = _1542 + 1.0;
    float _1546 = in.m_68.w;
    int _1548 = ~_1428;
    int _1550 = _1548 + _1526;
    int _1552 = _1550 + 1;
    bool _1554 = !_1532;
    int _1556 = _1554 ? 0 : 1;
    bool _1558 = _1442 >= 0.0;
    bool _1560 = isnan(_1442);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan(0.0);
    bool _1566 = _1562 || _1564;
    int _1568 = _517 * _1552;
    int _1570 = _1568 + _804;
    int _1572 = _1566 ? 0 : 1;
    bool _1574 = _1442 > 0.0;
    float _1576 = _1456 * _1544;
    bool _1578 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1580 = isnan(_451);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = fma(_1418, _1502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1592 = _481 * _1522;
    float _1594 = fma(_1472, _461, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1596 = _1358 + _1438;
    float _1598 = _1588 * _497;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1602 = _451 + _1600;
    float _1604 = _1252 + 0.5;
    float _1606 = _1348 + _1444;
    float _1608 = _1590 * _1598;
    float _1610 = -_1588;
    float _1612 = _1610 + 1.0;
    float _1614 = _1318 + _1546;
    float _1616 = -_1294;
    float _1618 = _1616 + 1.0;
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1622 = _1596 + _1620;
    float _1624 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1290);
    float _1626 = _1322 + (-0.5);
    float _1628 = fma(_1612, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1608);
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1632 = _1606 + _1630;
    float _1634 = _1622 * _1622;
    float _1636 = -_1626;
    float _1638 = -_1264;
    float _1640 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1638);
    float _1642 = -_1618;
    float _1644 = fma(_1252, _1642, _1624);
    float _1646 = fma(_1440, _1602, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1648 = fma(_1594, _1592, _1628);
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1614 + _1650;
    float _1654 = fma(_1632, _1632, _1634);
    float _1656 = fma(_1322, _1326, _1640);
    float _1658 = fma(_1646, _1576, _1648);
    int _1660 = _1050 >> 31;
    float _1662 = fma(_1652, _1652, _1654);
    int _1664 = ~_1572;
    int _1666 = _1664 + 1;
    int _1668 = _1666 + 1;
    out.m_74.x = _1644;
    out.m_74.y = _1656;
    int _1670 = _1668;
    float _1672 = _1614;
    if (!_1574)
    {
        int _1674 = ~_1572;
        int _1676 = _1674 + 1;
        _1670 = _1676;
    }
    int _1678 = _1670;
    float _1680 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1658);
    int _1682 = _1660 & 3;
    float _1684 = rsqrt(_1662);
    int _1686 = _1064 >> 31;
    int _1688 = _1050 + _1682;
    int _1690 = _1686 & 3;
    bool _1692 = !_1074;
    int _1694 = _1692 ? 0 : 1;
    int _1696 = _1688 >> 2;
    float _1698 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1700 = _1058 != 3;
    float _1702 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1704 = _1064 + _1690;
    float _1706 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1698);
    int _1708 = _1696 << 4;
    int _1710 = _1708 + 368;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1714 = _1704 >> 2;
    float _1716 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1706);
    uint _1718 = uint(int(uint(_1710) >> uint(2)));
    uint _1720 = uint(int(uint(int(_1718)) >> uint(2)));
    int _1722 = int(_1718) & 3;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[int(_1720)][_1722];
    int _1726 = int(_1718) + 1;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    int _1730 = _1726 & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    float _1734 = _1712 * _1684;
    int _1736 = _1714 << 4;
    int _1738 = _1736 + 656;
    bool _1740 = !_1700;
    int _1742 = _1740 ? 0 : (-1);
    float _1744 = _1622 * _1734;
    bool _1746 = _1072 != 3;
    float _1748 = _1632 * _1734;
    uint _1750 = uint(int(uint(_1738) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    float _1766 = -_1744;
    float _1768 = _1622 + _1766;
    bool _1770 = !_1746;
    int _1772 = _1770 ? 0 : (-1);
    float _1774 = -_1748;
    float _1776 = _1632 + _1774;
    bool _1778 = _1716 >= 0.0;
    float _1780 = _1768 * _1768;
    int _1782 = _1710 + 8;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[int(_1794)][_1796];
    int _1800 = abs(_1556);
    float _1802 = fma(_1776, _1776, _1780);
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1806 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1808 = _1738 + 8;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
    int _1814 = int(_1810) & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = int(_1810) + 1;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    int _1822 = _1818 & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1828 = abs(_1694);
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1832 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1834 = ~_1266;
    int _1836 = _1834 + _1384;
    int _1838 = _1836 + 1;
    float _1840 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = float(_1678);
    float _1846 = _1652 * _1734;
    int _1848 = _493 * _1838;
    int _1850 = _1848 + _764;
    int _1852 = abs(_1116);
    out.m_76.x = _1840;
    out.m_76.y = _1842;
    out.m_76.z = _1806;
    out.m_76.w = _1832;
    int _1854 = abs(_1498);
    float _1856 = -_1846;
    float _1858 = _1652 + _1856;
    int _1860 = abs(_1742);
    if (_1778)
    {
        out.m_53.x = 0.0;
    }
    float _1862 = float(_1800);
    float _1864 = fma(_1858, _1858, _1802);
    bool _1866 = !_788;
    int _1868 = _1866 ? _1850 : (-1);
    bool _1870 = !_790;
    int _1872 = _1870 ? _1570 : (-1);
    float _1874 = _1862 * _1844;
    float _1876 = sqrt(_1864);
    int _1878 = ~_1852;
    int _1880 = _1878 + 1;
    int _1882 = _1880 + 1;
    int _1884 = ~_1854;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    int _1890 = _1882 * as_type<int>(_1732);
    int _1892 = ~_1242;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    int _1898 = _1888 * as_type<int>(_1724);
    int _1900 = _1898 + _1890;
    int _1902 = ~_1828;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1896 * as_type<int>(_1764);
    int _1910 = ~_1368;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    int _1916 = _1906 * as_type<int>(_1756);
    int _1918 = _1916 + _1908;
    int _1920 = abs(_1772);
    int _1922 = _1914 * as_type<int>(_1790);
    int _1924 = _1922 + _1900;
    int _1926 = ~_1398;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    float _1932 = in.m_78.x;
    float _1934 = in.m_78.y;
    float _1936 = in.m_78.z;
    float _1938 = _1684 * _1876;
    bool _1940 = !_1206;
    int _1942 = _1940 ? 0 : 1;
    int _1944 = _1930 * as_type<int>(_1816);
    int _1946 = _1944 + _1918;
    int _1948 = ~_1860;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = _1874 * (-2.0);
    int _1956 = abs(_1194);
    float _1958 = _1702 * _1938;
    int _1960 = ~_1920;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = _1952 * as_type<int>(_1798);
    int _1968 = _1966 + _1924;
    int _1970 = abs(_1942);
    int _1972 = ~_1956;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    int _1978 = _1964 * as_type<int>(_1824);
    int _1980 = _1978 + _1946;
    int _1982 = ~_1970;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = as_type<float>(_1952);
    if (_1778)
    {
        _1988 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1990 = _1988;
    int _1992 = _1968 * _1976;
    float _1994 = fma(_1528, _1954, _1528);
    int _1996 = _1980 * _1986;
    float _1998 = _157 + (-0.5);
    int _2000 = _1868 * _1956;
    int _2002 = _2000 + _1992;
    int _2004 = as_type<int>(_1990);
    if (_1778)
    {
        float _2006 = _1990 * 5.0;
        _2004 = as_type<int>(_2006);
    }
    int _2008 = _2004;
    int _2010 = _1872 * _1970;
    int _2012 = _2010 + _1996;
    float _2014 = fma(_1954, _1932, _1932);
    out.m_80.x = _1958;
    float _2016 = float(_2002);
    float _2018 = float(_2012);
    float _2020 = _1936;
    if (_1778)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6329 = as_type<float>(_2008);
        out.gl_Position.z = _6329;
    }
    float _2022 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2014);
    float _2024 = _1152 + _457;
    out.m_82.x = _2016;
    float _2026 = float(_1482);
    float _2028 = _2024 + (-1.0);
    out.m_82.z = _2018;
    bool _2030 = !_1536;
    int _2032 = _2030 ? 0 : 1;
    bool _2034 = !_1540;
    int _2036 = _2034 ? 0 : 1;
    int _2038 = abs(_2032);
    if (_1778)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2040 = -_1744;
    float _2042 = _1596 + _2040;
    float _2044 = -_1748;
    float _2046 = _1606 + _2044;
    int _2048 = abs(_2036);
    float _2050 = -_1846;
    float _2052 = _1614 + _2050;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _2042 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2060 = _2046 + _2058;
    float _2062 = float(_2038);
    float _2064 = fma(_1994, _1374, _2022);
    float _2066 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2068 = float(_1492);
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2072 = _2052 + _2070;
    float _2074 = _2062 * _2026;
    float _2076 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2066);
    float _2078 = float(_2048);
    float _2080 = _2064 * 0.15915493667125701904296875;
    float _2082 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2084 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2076);
    float _2086 = _1152 + (-0.5);
    float _2088 = _2078 * _2068;
    float _2090 = _2074 * (-2.0);
    float _2092 = _157 + _457;
    bool _2094 = _2084 >= 0.0;
    float _2096 = _2088 * (-2.0);
    float _2098 = fma(_2090, _1934, _1934);
    float _2100 = fma(_2082, _2090, _2082);
    float _2102 = _2092 + (-1.0);
    float _2104 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2098);
    float _2106 = fma(_2096, _1936, _1936);
    float _2108 = _457 + (-0.5);
    float _2110 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2112 = fma(_2100, _1374, _2104);
    float _2114 = _2080 * 6.283185482025146484375;
    float _2116 = sin(_2114);
    if (_2094)
    {
        _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2118 = _2020;
    float _2120 = _2112 * 0.15915493667125701904296875;
    float _2122 = fma(_2110, _2096, _2110);
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2106);
    int _2126 = as_type<int>(_2118);
    if (_2094)
    {
        out.m_53.x = 0.0;
    }
    float _2128 = _2080 * 6.283185482025146484375;
    float _2130 = cos(_2128);
    if (_2094)
    {
        float _2132 = _2118 * 5.0;
        _2126 = as_type<int>(_2132);
    }
    int _2134 = _2126;
    float _2136 = fma(_2122, _1374, _2124);
    if (_2094)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6527 = as_type<float>(_2134);
        out.gl_Position.z = _6527;
    }
    float _2138 = _2136 * 0.15915493667125701904296875;
    float _2140 = _2120 * 6.283185482025146484375;
    float _2142 = sin(_2140);
    float _2144 = _2120 * 6.283185482025146484375;
    float _2146 = cos(_2144);
    if (_2094)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2148 = _2138 * 6.283185482025146484375;
    float _2150 = cos(_2148);
    float _2152 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2154 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _2156 = _2116 * _2142;
    float _2158 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2160 = _2152 * _1938;
    float _2162 = _2130 * _2142;
    float _2164 = _2116 * _2146;
    float _2166 = _2138 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _2160 * _2154;
    float _2172 = _2130 * _2146;
    float _2174 = _1958 * _2158;
    float _2176 = _2130 * _2150;
    float _2178 = _2146 * _2150;
    float _2180 = _2116 * _2150;
    float _2182 = _2142 * _2150;
    float _2184 = _2176 * _2170;
    float _2186 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2188 = _2186 * 0.5;
    float _2190 = fma(_2168, _2172, _2156);
    float _2192 = -_2164;
    float _2194 = fma(_2168, _2162, _2192);
    float _2196 = -_2170;
    float _2198 = _2168 * _2196;
    float _2200 = -_2162;
    float _2202 = fma(_2168, _2164, _2200);
    float _2204 = fma(_2190, _2174, _2184);
    float _2206 = _2180 * _2170;
    float _2208 = fma(_2178, _2174, _2198);
    float _2210 = fma(_2168, _2156, _2172);
    float _2212 = fma(_2194, _2188, _2204);
    float _2214 = fma(_2202, _2174, _2206);
    float _2216 = fma(_2182, _2188, _2208);
    float _2218 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2220 = fma(_2210, _2188, _2214);
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2224 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2226 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2218);
    float _2228 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2222);
    float _2230 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2224);
    float _2232 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2226);
    float _2234 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2236 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2238 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2240 = _2234 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2242 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2244 = _1614 + _2238;
    float _2246 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2248 = _1606 + _2240;
    float _2250 = _1596 + _2242;
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2254 = _2244 + _2252;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2258 = _2248 + _2256;
    float _2260 = _2254 * _2254;
    float _2262 = fma(_2258, _2258, _2260);
    float _2264 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2246);
    float _2266 = sqrt(_2262);
    float _2268 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2264);
    bool _2270 = _2266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = _2246;
    float _2274 = _2248;
    float _2276 = _2264;
    if (!_2270)
    {
        _2272 = _2248;
    }
    float _2278 = _2272;
    float _2280 = _2278;
    if (!_2270)
    {
        _2274 = _2244;
    }
    float _2282 = _2274;
    float _2284 = _2282;
    if (!_2270)
    {
        _2276 = _2250;
    }
    float _2286 = _2276;
    bool _2288 = !_2270;
    float _2290 = _2286;
    if (!_2288)
    {
        float _2292 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2296 = _2266 + _2294;
        float _2298 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = rsqrt(_2262);
        float _2302 = _2296 * _2292;
        float _2304 = _2302 * 0.15915493667125701904296875;
        float _2306 = _2304 * 6.283185482025146484375;
        float _2308 = cos(_2306);
        float _2310 = _2304 * 6.283185482025146484375;
        float _2312 = sin(_2310);
        float _2314 = _2308 + (-1.0);
        float _2316 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2318 = fma(_2312, _2298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2320 = fma(_2250, _2308, _2316);
        float _2322 = _2300 * _2318;
        float _2324 = fma(_2258, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2326 = fma(_2254, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2290 = _2320;
        _2280 = _2324;
        _2284 = _2326;
    }
    float _2328 = _2290;
    float _2330 = _2280;
    float _2332 = _2284;
    float _2334 = -_1596;
    float _2336 = _2334 + _2328;
    float _2338 = -_1606;
    float _2340 = _2338 + _2330;
    float _2342 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2344 = -_1614;
    float _2346 = _2344 + _2332;
    float _2348 = _2336 * _2336;
    float _2350 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2352 = 1.0 / _2342;
    float _2354 = fma(_2340, _2340, _2348);
    float _2356 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2350);
    bool _2358 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2360 = isnan(0.5);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2366 = _2362 || _2364;
    float _2368 = fma(_2346, _2346, _2354);
    float _2370 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2372 = sqrt(_2368);
    float _2374 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2376 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2378 = isnan(0.5);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2384 = _2380 || _2382;
    float _2386 = _2374 + _2342;
    float _2388 = _2386 * _2352;
    float _2390 = _2388 * 0.5;
    bool _2392 = _2372 > 0.0;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2396 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2394);
    float _2398 = 1.0 / _2396;
    float _2400 = _2390;
    float _2402 = _2330;
    float _2404 = _2328;
    float _2406 = _2340;
    float _2408 = _2332;
    if (!_2392)
    {
        _2400 = _2332;
    }
    float _2410 = _2400;
    bool _2412 = !_2392;
    float _2414 = _2410;
    if (!_2412)
    {
        float _2416 = _237 * _237;
        float _2418 = rsqrt(_2368);
        float _2420 = fma(_233, _233, _2416);
        float _2422 = fma(_239, _239, _2420);
        float _2424 = sqrt(_2422);
        float _2426 = _2340 * _2418;
        float _2428 = _2336 * _2418;
        float _2430 = _2346 * _2418;
        bool _2432 = _2424 > 0.0;
        float _2434 = _2424;
        _2406 = _2426;
        if (!_2432)
        {
            _2434 = _2332;
        }
        float _2436 = _2434;
        bool _2438 = !_2432;
        _2414 = _2436;
        if (!_2438)
        {
            float _2440 = rsqrt(_2422);
            float _2442 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2444 = _237 * _2440;
            float _2446 = _233 * _2440;
            float _2448 = _2428 * _2444;
            float _2450 = _239 * _2440;
            float _2452 = fma(_2426, _2446, _2448);
            float _2454 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2456 = fma(_2430, _2450, _2452);
            float _2458 = _2456 * _2454;
            float _2460 = fma(_233, _2458, _2330);
            float _2462 = fma(_237, _2458, _2328);
            float _2464 = fma(_239, _2458, _2332);
            _2402 = _2460;
            _2404 = _2462;
            _2414 = _2464;
        }
    }
    float _2466 = _2402;
    float _2468 = _2404;
    float _2470 = _2414;
    float _2472 = _2406;
    float _2474 = -_1748;
    float _2476 = _2474 + _2466;
    float _2478 = -_1744;
    float _2480 = _2478 + _2468;
    float _2482 = -_1846;
    float _2484 = _2482 + _2470;
    float _2486 = _2480;
    float _2488 = _2476;
    float _2490 = _2484;
    float _2492 = _2472;
    float _2494 = _2470;
    if (_2384)
    {
        _2408 = 1.0;
    }
    float _2496 = _2408;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2500 = _2398 * _2498;
    float _2502 = _2496;
    if (!_2366)
    {
        float _2504 = _2056 * _2056;
        float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2508 = -_1614;
        float _2510 = _2508 + _2470;
        float _2512 = -_1596;
        float _2514 = _2512 + _2468;
        float _2516 = fma(_2060, _2060, _2504);
        float _2518 = -_1606;
        float _2520 = _2518 + _2466;
        float _2522 = fma(_2072, _2072, _2516);
        float _2524 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2526 = sqrt(_2522);
        float _2528 = 1.0 / _1938;
        float _2530 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2532 = precise::min(_2526, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2534 = _2532 * _2506;
        float _2536 = _2534 * _2528;
        float _2538 = _2530 * _2536;
        float _2540 = _2510 * _2536;
        float _2542 = fma(_2514, _2538, _2042);
        float _2544 = fma(_2520, _2538, _2046);
        float _2546 = fma(_2530, _2540, _2052);
        _2486 = _2542;
        _2488 = _2544;
        _2490 = _2546;
        _1672 = _2540;
    }
    float _2548 = _2486;
    float _2550 = _2488;
    float _2552 = _2490;
    float _2554 = _1672;
    float _2556 = _2554;
    if (!_2384)
    {
        float _2558 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2560 = _2558 * 0.15915493667125701904296875;
        float _2562 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2564 = _2560 * 6.283185482025146484375;
        float _2566 = cos(_2564);
        float _2568 = _2562 * 0.15915493667125701904296875;
        float _2570 = _2560 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        float _2574 = 1.0 / _2566;
        float _2576 = _2568 * 6.283185482025146484375;
        float _2578 = cos(_2576);
        float _2580 = _2572 * _2574;
        float _2582 = _2568 * 6.283185482025146484375;
        float _2584 = sin(_2582);
        float _2586 = _2578 * _2580;
        float _2588 = 1.0 / _2586;
        float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2592 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2590;
        float _2594 = 1.0 / _2592;
        float _2596 = _2584 * _2588;
        float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2600 = fma(_2500, _2596, _2598);
        float _2602 = _2600 * _2594;
        float _2604 = precise::clamp(_2602, 0.0, 1.0);
        _2556 = _2560;
        _2502 = _2604;
    }
    float _2606 = _2556;
    float _2608 = _2502;
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2612 = _2548 + _2610;
    float _2614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2616 = _2550 + _2614;
    float _2618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2620 = _2552 + _2618;
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2616, _2616, _2622);
    float _2626 = fma(_2620, _2620, _2624);
    float _2628 = rsqrt(_2626);
    float _2630 = sqrt(_2626);
    float _2632 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2634 = _2616 * _2632;
    float _2636 = _2620 * _2632;
    float _2638 = _2634 * _2634;
    float _2640 = _2636 * _2636;
    float _2642 = _2638 + _2640;
    float _2644 = sqrt(_2642);
    bool _2646 = _2644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2650 = _2644 + _2648;
    float _2652 = _2620;
    float _2654 = _2642;
    float _2656 = _2650;
    float _2658 = _2606;
    if (_2646)
    {
        float _2660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2652 = _2660;
    }
    float _2662 = _2652;
    if (_2646)
    {
        float _2664 = rsqrt(_2642);
        _2654 = _2664;
    }
    float _2666 = _2654;
    float _2668 = _2666;
    if (_2646)
    {
        float _2670 = _2650 * _2662;
        _2656 = _2670;
    }
    float _2672 = _2656;
    if (_2646)
    {
        float _2674 = _2672 * 0.15915493667125701904296875;
        _2658 = _2674;
    }
    float _2676 = _2658;
    float _2678 = _2662;
    float _2680 = _2676;
    if (_2646)
    {
        float _2682 = _2676 * 6.283185482025146484375;
        float _2684 = sin(_2682);
        _2678 = _2684;
    }
    float _2686 = _2678;
    float _2688 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2690 = precise::max(0.0, _2688);
    float _2692 = _2622;
    float _2694 = _2690;
    if (_2646)
    {
        float _2696 = _2676 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        _2692 = _2698;
    }
    float _2700 = _2692;
    float _2702 = -_2632;
    float _2704 = -_2690;
    float _2706 = fma(_2612, _2702, _2704);
    float _2708 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2646)
    {
        float _2710 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2694 = _2710;
    }
    float _2712 = _2694;
    float _2714 = _2712;
    if (!_2646)
    {
        _2680 = _2634;
    }
    float _2716 = _2680;
    float _2718 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2720 = _2686;
    float _2722 = _2716;
    if (_2646)
    {
        float _2724 = fma(_2686, _2712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2720 = _2724;
    }
    float _2726 = _2720;
    float _2728 = _2726;
    if (!_2646)
    {
        _2714 = _2706;
    }
    float _2730 = _2714;
    float _2732 = _2730;
    float _2734 = _2700;
    if (_2646)
    {
        float _2736 = _2700 + (-1.0);
        _2708 = _2736;
    }
    float _2738 = _2708;
    if (_2646)
    {
        float _2740 = _2666 * _2726;
        _2492 = _2740;
    }
    float _2742 = _2492;
    if (!_2646)
    {
        _2728 = _2638;
    }
    float _2744 = _2728;
    float _2746 = _2744;
    if (_2646)
    {
        float _2748 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2494 = _2748;
    }
    float _2750 = _2494;
    if (_2646)
    {
        float _2752 = _2634 * _2742;
        _2722 = _2752;
    }
    float _2754 = _2722;
    if (!_2646)
    {
        _2668 = _2636;
    }
    float _2756 = _2668;
    float _2758 = _2756;
    if (_2646)
    {
        float _2760 = _2636 * _2742;
        _2758 = _2760;
    }
    float _2762 = _2758;
    if (_2646)
    {
        float _2764 = fma(_2706, _2700, _2750);
        _2732 = _2764;
    }
    float _2766 = _2732;
    if (_2646)
    {
        float _2768 = _2754 * _2754;
        _2746 = _2768;
    }
    float _2770 = _2746;
    if (!_2646)
    {
        _2734 = _2640;
    }
    float _2772 = _2734;
    float _2774 = _2772;
    if (_2646)
    {
        float _2776 = _2762 * _2762;
        _2774 = _2776;
    }
    float _2778 = _2774;
    float _2780 = fma(_2766, _2766, _2770);
    float _2782 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2784 = floor(_2718);
    float _2786 = _2780 + _2778;
    float _2788 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2782);
    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2792 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2790);
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2788);
    float _2798 = rsqrt(_2786);
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2802 = _2796 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2804 = -_2794;
    float _2806 = _2804 + 1.0;
    float _2808 = fma(_2052, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2810 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2812 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2814 = abs(_2806);
    float _2816 = log2(_2814);
    float _2818 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2810);
    float _2820 = -_2812;
    float _2822 = fma(_2820, _2800, 1.0);
    float _2824 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2826 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2828 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2818);
    float _2830 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2824);
    float _2832 = _2798 * _2754;
    float _2834 = _2798 * _2766;
    float _2836 = _2798 * _2762;
    float _2838 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2830);
    float _2840 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2842 = _2828 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2844 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2826);
    float _2846 = _2838 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2848 = -_2840;
    float _2850 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2848);
    float _2852 = floor(_2808);
    float _2854 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2856 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2858 = -_2836;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2850);
    float _2862 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2844);
    float _2864 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2856);
    float _2866 = fma(_2860, -0.5, 0.5);
    float _2868 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2870 = exp2(_2854);
    float _2872 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2864);
    float _2874 = fma(_2860, 0.5, 0.5);
    float _2876 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2872);
    float _2878 = -_2852;
    float _2880 = _2808 + _2878;
    float _2882 = log2(_2822);
    float _2884 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2886 = fma(_2874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2888 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2884);
    float _2890 = _2834 + 1.0;
    float _2892 = fma(_2874, _2886, -0.212114393711090087890625);
    float _2894 = 1.0 / _2876;
    float _2896 = -_2784;
    float _2898 = _2718 + _2896;
    float _2900 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2902 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2888);
    float _2904 = -_2834;
    float _2906 = fma(_2870, _2890, _2904);
    float _2908 = fma(_2874, _2892, 1.570728778839111328125);
    float _2910 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2900);
    float _2912 = sqrt(_2866);
    float _2914 = _2882 * 0.693147182464599609375;
    float _2916 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2910);
    float2 _7767 = float2(_2898, _2880);
    float _2918 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7767, float2(0.0), isnan(_7767)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7767, float2(0.0), isnan(_7767)), level(0.0)).x;
    float _2920 = fma(_2906, 0.5, 0.5);
    float _2922 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2924 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2916);
    float _2926 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2902);
    float _2928 = _2924 * _2894;
    float _2930 = _2926 * _2894;
    float _2932 = fma(_2928, 0.5, 0.5);
    float _2934 = fma(_2930, -0.5, 0.5);
    float _2936 = _2912 * 0.636619746685028076171875;
    float _2938 = -_2908;
    float _2940 = fma(_2936, _2938, 1.0);
    float3 _7812 = float3(_2932, _2934, _2922);
    float _2942 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7812, float3(0.0), isnan(_7812)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7812, float3(0.0), isnan(_7812)), level(0.0)).x;
    float3 _7823 = float3(_2932, _2934, _2922);
    float4 _2945 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7823, float3(0.0), isnan(_7823)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7823, float3(0.0), isnan(_7823)), level(0.0)).xyzw;
    float _2947 = _2945.x;
    float _2949 = _2945.y;
    float _2951 = _2945.z;
    float _2953 = _2945.w;
    float2 _7839 = float2(_2940, _2920);
    float3 _2957 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7839, float2(0.0), isnan(_7839)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7839, float2(0.0), isnan(_7839)), level(0.0)).xyz;
    float _2959 = _2957.x;
    float _2961 = _2957.y;
    float _2963 = _2957.z;
    float _2965 = abs(_2500);
    float _2967 = log2(_2965);
    float _2969 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2971 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2973 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2975 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2977 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2969);
    float _2979 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2971);
    float _2981 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2973);
    float _2983 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2985 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2987 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2989 = -_2168;
    float _2991 = fma(_2989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2983);
    float _2993 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2995 = -_2168;
    float _2997 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2987);
    float _2999 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3001 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3003 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3005 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2993);
    float _3007 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2999);
    float _3009 = -_2168;
    float _3011 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2985);
    float _3013 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3003);
    float _3015 = exp2(_3001);
    float _3017 = fma(_2975, _2975, 1.0);
    float _3019 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2991);
    float _3021 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3011);
    float _3023 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2997);
    float _3025 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2977);
    float _3027 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3029 = rsqrt(_3017);
    float _3031 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3007);
    float _3033 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3005);
    float _3035 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3013);
    float _3037 = _2975 * _3019;
    bool _3039 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3041 = isnan(_2630);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3047 = _3043 || _3045;
    float _3049 = fma(_3015, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3051 = precise::clamp(_3049, 0.0, 1.0);
    float _3053 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2979);
    float _3055 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3057 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2981);
    float _3059 = fma(_3051, -2.0, 3.0);
    float _3061 = _3051 * _3051;
    float _3063 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3055);
    float _3065 = _2975 * _3029;
    float _3067 = _3061 * _3059;
    float _3069 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3063);
    float _3071 = fma(_3027, _3025, _3037);
    float _3073 = -_3031;
    float _3075 = _3065 * _3073;
    float _3077 = -_3067;
    float _3079 = _3077 + 1.0;
    float _3081 = _2975 * _3021;
    float _3083 = in.m_84.x;
    float _3085 = fma(_3029, _3019, _3075);
    float _3087 = fma(_3079, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3067);
    float _3089 = -_3033;
    float _3091 = _3065 * _3089;
    out.m_86.x = _3025;
    out.m_86.y = _3053;
    out.m_86.z = _3057;
    float _3093 = fma(_3027, _3053, _3081);
    float _3095 = _2975 * _3023;
    float _3097 = fma(_3029, _3021, _3091);
    float _3099 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3069);
    float _3101 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3103 = fma(_3027, _3057, _3095);
    float _3105 = _3099 + _2876;
    out.gl_Position.x = _2924;
    out.gl_Position.y = _2926;
    out.gl_Position.z = _3099;
    out.gl_Position.w = _2876;
    float _3107 = exp2(_3101);
    bool _3109 = _2500 <= 8000.0;
    bool _3111 = isnan(_2500);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan(8000.0);
    bool _3117 = _3113 || _3115;
    float _3119 = float(_3117);
    float _3121 = -_3035;
    float _3123 = _3065 * _3121;
    float _3125 = _2924 + _2876;
    float _3127 = _3035 + _3103;
    float _3129 = _3105 * 0.5;
    float _3131 = _3119 * _3087;
    float _3133 = fma(_3029, _3023, _3123);
    float _3135 = _2876 * 0.5;
    float _3137 = _3033 + _3093;
    float _3139 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3141 = fma(_2926, -0.5, _3135);
    float _3143 = _3031 + _3071;
    float _3145 = _3125 * 0.5;
    out.m_88.x = _3085;
    out.m_88.y = _3097;
    out.m_88.z = _3133;
    float _3147 = -_3107;
    float _3149 = _3147 + 1.0;
    float _3151 = _2876;
    float _3153 = _3099;
    float _3155 = _3097;
    float _3157 = _3085;
    if (!_3047)
    {
        _3151 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3159 = _3151;
    out.m_90.x = _3143;
    out.m_90.y = _3137;
    out.m_90.z = _3127;
    float _3161 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3163 = _3159;
    float _3165 = _3159;
    if (!_3047)
    {
        _3153 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3167 = _3153;
    out.m_92.x = _3145;
    out.m_92.y = _3141;
    out.m_92.z = _3129;
    out.m_92.w = _2876;
    float _3169 = -_3161;
    float _3171 = _3169 + 1.0;
    float _3173 = _3171;
    float _3175 = _3167;
    float _3177 = _3167;
    if (!_3047)
    {
        _3155 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3179 = _3155;
    float _3181 = _3179;
    float _3183 = _3179;
    if (!_3047)
    {
        _3157 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3185 = _3157;
    float _3187 = _2608 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3189 = -_2918;
    float _3191 = _3189 + 1.0;
    float _3193 = _3191 * _3139;
    float _3195 = precise::clamp(_3193, 0.0, 1.0);
    float _3197 = -_3195;
    float _3199 = fma(_3197, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3201 = _3199 * _3083;
    float _3203 = _3201 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3205 = _3161 * _2942;
    float _3207 = _2953 * _3171;
    out.m_94.x = _3203;
    float _3209 = _3185;
    float _3211 = _3185;
    if (!_3047)
    {
        _3173 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3213 = _3173;
    float _3215 = _2953 * _3205;
    float _3217 = _2963 * _3205;
    float _3219 = fma(_2959, _3215, _2947);
    float _3221 = fma(_2961, _3215, _2949);
    float _3223 = fma(_2953, _3217, _2951);
    float _3225 = _3215;
    float _3227 = _3213;
    float _3229 = _3213;
    if (!_3047)
    {
        _3225 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3231 = _3225;
    out.m_96.x = _3219;
    out.m_96.y = _3221;
    out.m_96.z = _3223;
    out.m_96.w = _3207;
    bool _3233 = !_3047;
    float _3235 = _3231;
    float _3237 = _3231;
    if (!_3233)
    {
        bool _3239 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3241 = isnan(_2630);
        bool _3243 = _3239 || _3241;
        bool _3245 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3247 = _3243 || _3245;
        if (!_3247)
        {
            float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3251 = _2630 + _3249;
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3255 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3253;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3261 = 1.0 / _3255;
            float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3279 = _3251 * _3261;
            float _3281 = precise::clamp(_3279, 0.0, 1.0);
            float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3287 = fma(_3281, _3259, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3289 = fma(_3281, _3285, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3291 = fma(_3281, _3265, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3293 = fma(_3281, _3269, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3295 = fma(_3281, _3273, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3297 = fma(_3281, _3277, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3211 = _3291;
            _3237 = _3295;
            _3183 = _3287;
            _3177 = _3293;
            _3165 = _3289;
            _3229 = _3297;
            _3299 = true;
        }
        else
        {
            bool _3301 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3303 = isnan(_2630);
            bool _3305 = _3301 || _3303;
            bool _3307 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3309 = _3305 || _3307;
            if (!_3309)
            {
                _3181 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3311 = _3181;
            _3183 = _3311;
            if (!_3309)
            {
                _3209 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3313 = _3209;
            _3211 = _3313;
            if (!_3309)
            {
                _3163 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3315 = _3163;
            _3165 = _3315;
            if (!_3309)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3317 = _3175;
            _3177 = _3317;
            if (!_3309)
            {
                _3235 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3319 = _3235;
            _3237 = _3319;
            if (!_3309)
            {
                _3227 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3321 = _3227;
            bool _3323 = !_3309;
            _3229 = _3321;
            if (!_3323)
            {
                bool _3325 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3327 = isnan(_2630);
                bool _3329 = _3325 || _3327;
                bool _3331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3333 = _3329 || _3331;
                if (!_3333)
                {
                    float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3337 = _2630 + _3335;
                    float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3341 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3339;
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3347 = 1.0 / _3341;
                    float _3349 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3351 = _3349 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3365 = _3337 * _3347;
                    float _3367 = precise::clamp(_3365, 0.0, 1.0);
                    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3373 = fma(_3367, _3345, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3375 = fma(_3367, _3371, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3377 = fma(_3367, _3351, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3379 = fma(_3367, _3355, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3381 = fma(_3367, _3359, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3383 = fma(_3367, _3363, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3211 = _3377;
                    _3237 = _3381;
                    _3183 = _3373;
                    _3177 = _3379;
                    _3165 = _3375;
                    _3229 = _3383;
                    _3299 = true;
                }
                else
                {
                    _3211 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3237 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3183 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3165 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3229 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3299 = false;
    float _3385 = _3211;
    float _3387 = _3237;
    float _3389 = _3183;
    float _3391 = _3177;
    float _3393 = _3165;
    float _3395 = _3229;
    float _3397 = fma(_3137, -0.5, 0.5);
    float _3399 = precise::clamp(_3397, 0.0, 1.0);
    float _3401 = -_3385;
    float _3403 = _3401 + _3387;
    float _3405 = -_3389;
    float _3407 = _3405 + _3391;
    out.m_98.x = 0.0;
    float _3409 = fma(_3399, _3403, _3385);
    float _3411 = -_3393;
    float _3413 = _3411 + _3395;
    float _3415 = fma(_3399, _3407, _3389);
    float _3417 = _3409 * 0.586610972881317138671875;
    bool _3419 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3421 = fma(_3399, _3413, _3393);
    float _3423 = _3187 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3425 = fma(_3415, 0.298911988735198974609375, _3417);
    bool _3427 = _2608 > 0.0;
    bool _3429 = isnan(_2608);
    bool _3431 = _3427 || _3429;
    bool _3433 = isnan(0.0);
    bool _3435 = _3431 || _3433;
    float _3437 = fma(_3421, 0.114477999508380889892578125, _3425);
    out.m_53.x = _3423;
    float _3439 = -_3437;
    float _3441 = _3415 + _3439;
    float _3443 = -_3437;
    float _3445 = _3409 + _3443;
    float _3447 = -_3437;
    float _3449 = _3421 + _3447;
    float _3451 = fma(_3441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3455 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    bool _3457 = !_3419;
    if (!_3457)
    {
        float _3459 = -_2548;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3463 = -_2550;
        float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3467 = -_2552;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3471 = _3461 * _3461;
        float _3473 = fma(_3465, _3465, _3471);
        float _3475 = fma(_3469, _3469, _3473);
        float _3477 = sqrt(_3475);
        float _3479 = rsqrt(_3475);
        float _3481 = -_3477;
        float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3485 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        float _3489 = _3465 * _3479;
        float _3491 = _3461 * _3479;
        float _3493 = abs(_3487);
        float _3495 = log2(_3493);
        float _3497 = _3469 * _3479;
        float _3499 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3501 = _3137 * _3491;
        float _3503 = -_3491;
        float _3505 = -_3499;
        float _3507 = fma(_3503, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3505);
        float _3509 = fma(_3143, _3489, _3501);
        float _3511 = -_3497;
        float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3507);
        float _3515 = fma(_3127, _3497, _3509);
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3521 = _3513 + _3519;
        float _3523 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3525 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = exp2(_3523);
        float _3531 = _3529 * _3527;
        float _3533 = _3517 * _3531;
        float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3537 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3535;
        out.m_98.y = _3537;
        out.m_98.z = _3539;
    }
    out.m_100.x = _3451;
    out.m_100.y = _3453;
    out.m_100.z = _3455;
    if (_3435)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3541;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3299 = false;
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
        float _3609 = as_type<float>(_143);
        out.gl_Position.z = _3609;
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
        float _3674 = as_type<float>(_177);
        out.gl_Position.z = _3674;
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
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = _451 + _459;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _465 = int(_463);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _471 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _473 = isnan(_451);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _467);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = float(_455);
    float _491 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _493 = int(_491);
    float _495 = -_481;
    float _497 = _495 + 1.0;
    float _499 = float(_465);
    float _501 = 1.0 / _489;
    float _503 = 1.0 / _499;
    float _505 = float(uint(_493));
    int _507 = ~_493;
    int _509 = _507 + 1;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _513 = _511 != 0;
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _517 = int(_515);
    float _519 = _501 * _125;
    int _521 = ~_493;
    int _523 = _521 + 1;
    int _525 = ~_493;
    int _527 = _525 + 1;
    float _529 = 1.0 / _505;
    float _531 = _503 * _125;
    float _533 = 0.0;
    if (_513)
    {
        _533 = 1.0;
    }
    float _535 = _533;
    float _537 = _535;
    if (!_513)
    {
        _537 = 7.345489978790283203125;
    }
    float _539 = _537;
    float _541 = trunc(_519);
    int _543 = int(_541);
    float _545 = float(uint(_517));
    int _547 = ~_517;
    int _549 = _547 + 1;
    float _551 = _539 * _157;
    float _553 = 1.0 / _545;
    int _555 = as_type<int>(_529) + (-2);
    float _557 = trunc(_531);
    int _559 = int(_557);
    float _561 = float(uint(_543));
    float _563 = as_type<float>(_555) * _561;
    float _565 = _561;
    if (_513)
    {
        _565 = 1.0;
    }
    float _567 = _565;
    float _569 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _571 = log2(_569);
    int _573 = as_type<int>(_553) + (-2);
    float _575 = _567;
    if (!_513)
    {
        _575 = 5.839270114898681640625;
    }
    float _577 = _575;
    float _579 = float(uint(_559));
    float _581 = trunc(_563);
    float _583 = precise::max(_581, 0.0);
    uint _586 = uint(_583);
    float _588 = as_type<float>(_573) * _579;
    float _590 = _579;
    if (_513)
    {
        _590 = _157;
    }
    float _592 = _590;
    float _594 = _592;
    if (!_513)
    {
        _594 = _457;
    }
    float _596 = _594;
    float _598 = trunc(_588);
    float _600 = precise::max(_598, 0.0);
    uint _602 = uint(_600);
    float _604 = _571 * _125;
    float _606 = _577 * _596;
    float _608 = floor(_551);
    int _610 = _509 * int(_586);
    int _612 = _610 + _543;
    float _614 = float(uint(_612));
    int _616 = _549 * int(_602);
    int _618 = _616 + _559;
    float _620 = floor(_606);
    float _622 = as_type<float>(_555) * _614;
    float _624 = float(_517);
    float _626 = float(uint(_618));
    float _628 = -_608;
    float _630 = _551 + _628;
    float _632 = trunc(_622);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _640 = _638 != 0;
    float _642 = as_type<float>(_573) * _626;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _646 = _644 != 0;
    float _648 = trunc(_642);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    float _654 = -_620;
    float _656 = _606 + _654;
    float _658 = float(_493);
    float _660 = _630 * _658;
    int _662 = int(_586) + int(_636);
    float _664 = _167 * _125;
    float _666 = float(_543);
    float _668 = 1.0 / _487;
    float _670 = _658 * _664;
    bool _672 = _666 >= _658;
    bool _674 = isnan(_666);
    bool _676 = _672 || _674;
    bool _678 = isnan(_658);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = _656 * _624;
    float _686 = float(_559);
    int _688 = _523 * _662;
    int _690 = _688 + _543;
    int _692 = int(_602) + int(_652);
    float _694 = trunc(_660);
    int _696 = int(_694);
    int _698 = ~_517;
    int _700 = _698 + 1;
    float _702 = _624 * _664;
    bool _704 = _686 >= _624;
    bool _706 = isnan(_686);
    bool _708 = _704 || _706;
    bool _710 = isnan(_624);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    bool _716 = !_640;
    int _718 = _716 ? 0 : 1;
    int _720 = _700 * _692;
    int _722 = _720 + _559;
    bool _724 = uint(_690) >= uint(_493);
    float _726 = trunc(_682);
    int _728 = int(_726);
    bool _730 = !_646;
    int _732 = _730 ? 0 : 1;
    int _734 = abs(_718);
    bool _736 = !_724;
    int _738 = _736 ? 0 : (-1);
    bool _740 = uint(_722) >= uint(_517);
    float _742 = trunc(_684);
    int _744 = int(_742);
    int _746 = abs(_732);
    int _748 = ~_662;
    int _750 = _748 + _738;
    int _752 = _750 + 1;
    bool _754 = !_740;
    int _756 = _754 ? 0 : (-1);
    float _758 = trunc(_714);
    int _760 = int(_758);
    int _762 = _696 * _734;
    int _764 = _762 + _543;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _776 = _774 != 0;
    int _778 = _493 * _752;
    int _780 = _778 + _543;
    int _782 = ~_692;
    int _784 = _782 + _756;
    int _786 = _784 + 1;
    bool _788 = _493 == 0;
    bool _790 = _517 == 0;
    int _792 = _517 * _786;
    int _794 = _792 + _559;
    int _796 = ~_728;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    int _802 = _744 * _746;
    int _804 = _802 + _559;
    bool _806 = !_788;
    int _808 = _806 ? _780 : (-1);
    float _810 = trunc(_670);
    int _812 = int(_810);
    bool _814 = !_772;
    int _816 = _814 ? 0 : 1;
    int _818 = ~_760;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    int _824 = _808 * _800;
    bool _826 = !_790;
    int _828 = _826 ? _794 : (-1);
    bool _830 = !_768;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_702);
    int _836 = int(_834);
    bool _838 = !_776;
    int _840 = _838 ? 0 : 1;
    int _842 = _828 * _822;
    int _844 = _493 + (-1);
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _856 = _854 != 0;
    int _858 = abs(_816);
    int _860 = _728 * _844;
    int _862 = _860 + _824;
    int _864 = _517 + (-1);
    bool _866 = !_852;
    int _868 = _866 ? 0 : 1;
    int _870 = abs(_832);
    int _872 = _760 * _864;
    int _874 = _872 + _842;
    int _876 = abs(_868);
    int _878 = _862 * _858;
    bool _880 = !_848;
    int _882 = _880 ? 0 : 1;
    int _884 = _812 * _870;
    int _886 = _884 + _878;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _890 = _888 != 0;
    int _892 = _874 * _876;
    bool _894 = !_856;
    int _896 = _894 ? 0 : 1;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _900 = _898 != 0;
    int _902 = abs(_882);
    bool _904 = !_890;
    int _906 = _904 ? 0 : 1;
    int _908 = abs(_896);
    int _910 = _836 * _902;
    int _912 = _910 + _892;
    int _914 = abs(_840);
    bool _916 = !_900;
    int _918 = _916 ? 0 : 1;
    int _920 = abs(_906);
    int _922 = abs(_918);
    int _924 = _804 * _908;
    int _926 = _924 + _912;
    int _928 = ~_517;
    int _930 = _928 + 1;
    int _932 = _764 * _914;
    int _934 = _932 + _886;
    int _936 = ~_493;
    int _938 = _936 + 1;
    int _940 = _696 * _920;
    int _942 = _940 + _934;
    int _944 = ~_517;
    int _946 = _944 + 1;
    int _948 = _744 * _922;
    int _950 = _948 + _926;
    float _952 = float(uint(_942));
    float _954 = float(uint(_950));
    float _956 = as_type<float>(_555) * _952;
    float _958 = as_type<float>(_573) * _954;
    int _960 = ~_493;
    int _962 = _960 + 1;
    float _964 = trunc(_956);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    float _970 = trunc(_958);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    int _976 = _962 * int(_968);
    int _978 = _976 + _942;
    float _980 = float(uint(_978));
    int _982 = _946 * int(_974);
    int _984 = _982 + _950;
    float _986 = as_type<float>(_555) * _980;
    float _988 = float(uint(_984));
    float _990 = trunc(_986);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    float _996 = as_type<float>(_573) * _988;
    float _998 = trunc(_996);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    int _1004 = int(_968) + int(_994);
    int _1006 = ~_493;
    int _1008 = _1006 + 1;
    int _1010 = _938 * _1004;
    int _1012 = _1010 + _942;
    int _1014 = int(_974) + int(_1002);
    bool _1016 = uint(_1012) >= uint(_493);
    int _1018 = _930 * _1014;
    int _1020 = _1018 + _950;
    bool _1022 = !_1016;
    int _1024 = _1022 ? 0 : (-1);
    bool _1026 = uint(_1020) >= uint(_517);
    int _1028 = ~_1004;
    int _1030 = _1028 + _1024;
    int _1032 = _1030 + 1;
    bool _1034 = !_1026;
    int _1036 = _1034 ? 0 : (-1);
    int _1038 = _493 * _1032;
    int _1040 = _1038 + _942;
    int _1042 = ~_1014;
    int _1044 = _1042 + _1036;
    int _1046 = _1044 + 1;
    bool _1048 = !_788;
    int _1050 = _1048 ? _1040 : (-1);
    int _1052 = _517 * _1046;
    int _1054 = _1052 + _950;
    float _1056 = float(uint(_764));
    int _1058 = _1050 & 3;
    bool _1060 = _1058 != 0;
    bool _1062 = !_790;
    int _1064 = _1062 ? _1054 : (-1);
    float _1066 = as_type<float>(_555) * _1056;
    int _1068 = _1050 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _1064 & 3;
    bool _1074 = _1072 != 0;
    bool _1076 = uint(_1058) > 1u;
    float _1078 = trunc(_1066);
    float _1080 = precise::max(_1078, 0.0);
    uint _1082 = uint(_1080);
    bool _1084 = uint(_1072) > 1u;
    int _1086 = _1070 ? 0 : 1;
    int _1088 = _1064 & 3;
    bool _1090 = _1088 != 0;
    int _1092 = ~_1086;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    int _1098 = _1090 ? 0 : 1;
    bool _1100 = uint(_1072) >= 2u;
    int _1102 = ~_1098;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    int _1108 = _1096;
    int _1110 = _1106;
    if (!_1076)
    {
        int _1112 = ~_1086;
        int _1114 = _1112 + 1;
        _1108 = _1114;
    }
    int _1116 = _1108;
    int _1118 = _1008 * int(_1082);
    int _1120 = _1118 + _764;
    if (!_1084)
    {
        int _1122 = ~_1098;
        int _1124 = _1122 + 1;
        _1110 = _1124;
    }
    int _1126 = _1110;
    float _1128 = in.m_46.x;
    float _1130 = in.m_46.y;
    float _1132 = in.m_46.z;
    bool _1134 = uint(_1058) >= 2u;
    bool _1136 = _1058 != 3;
    float _1138 = float(uint(_1120));
    int _1140 = _1134 ? 0 : 1;
    bool _1142 = _1072 != 3;
    float _1144 = as_type<float>(_555) * _1138;
    int _1146 = ~_1140;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    float _1152 = in.m_55.y;
    int _1154 = _1100 ? 0 : 1;
    bool _1156 = _157 > 0.5;
    int _1158 = _1150;
    if (_1136)
    {
        int _1160 = ~_1140;
        int _1162 = _1160 + 1;
        _1158 = _1162;
    }
    int _1164 = _1158;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1168 = _1166 != 0;
    int _1170 = ~_1154;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    int _1176 = _1174;
    if (_1142)
    {
        int _1178 = ~_1154;
        int _1180 = _1178 + 1;
        _1176 = _1180;
    }
    int _1182 = _1176;
    float _1184 = _189 * _1130;
    float _1186 = _195 * _1130;
    float _1188 = _201 * _1130;
    float _1190 = exp2(_604);
    bool _1192 = !_1168;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = fma(_199, _1128, _1188);
    float _1198 = -_217;
    int _1200 = _1156 ? as_type<int>(_1198) : as_type<int>(_217);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1206 = _1204 != 0;
    float _1208 = fma(_187, _1128, _1184);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1212 = _1210 != 0;
    float _1214 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1218 = _1216 != 0;
    float _1220 = fma(_193, _1128, _1186);
    float _1222 = trunc(_1144);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    float _1228 = float(uint(_804));
    float _1230 = _157 * 2.0;
    float _1232 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _469);
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1236 = -_1190;
    float _1238 = _1236 + 1.0;
    float _1240 = as_type<float>(_573) * _1228;
    int _1242 = abs(_1126);
    float _1244 = -_1234;
    float _1246 = fma(_1214, 2.0, _1244);
    float _1248 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1250 = !_1212;
    float _1252 = _1250 ? _217 : as_type<float>(_1200);
    float _1254 = floor(_1230);
    bool _1256 = _1152 > 0.5;
    float _1258 = fma(_1248, -2.0, _1202);
    float _1260 = -_221;
    int _1262 = _1256 ? as_type<int>(_1260) : as_type<int>(_221);
    float _1264 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1258);
    int _1266 = int(_1082) + int(_1226);
    float _1268 = trunc(_1240);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    bool _1274 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1276 = isnan(0.0);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1282 = _1278 || _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1288 = -_125;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1246);
    float _1292 = _1282 ? _1238 : 0.0;
    float _1294 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _483);
    bool _1296 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1298 = isnan(1.0);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1304 = _1300 || _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1308 = 1.0 + _1306;
    int _1310 = ~_517;
    int _1312 = _1310 + 1;
    float _1314 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1232);
    float _1316 = 1.0 / _1286;
    float _1318 = fma(_203, _1132, _1196);
    bool _1320 = !_1218;
    float _1322 = _1320 ? _221 : as_type<float>(_1262);
    float _1324 = -_1314;
    float _1326 = _1324 + 1.0;
    int _1328 = _1312 * int(_1272);
    int _1330 = _1328 + _804;
    bool _1332 = _1254 >= 0.0;
    bool _1334 = isnan(_1254);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1346 = 1.0 / _1308;
    float _1348 = fma(_191, _1132, _1208);
    float _1350 = float(uint(_1330));
    int _1352 = _527 * _1266;
    int _1354 = _1352 + _764;
    float _1356 = _1152 * 2.0;
    float _1358 = fma(_197, _1132, _1220);
    int _1360 = _1340 ? 0 : 1;
    float _1362 = as_type<float>(_573) * _1350;
    float _1364 = 1.0 / _1344;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1368 = abs(_1164);
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1304)
    {
        float _1372 = _1292 * _1346;
        _135 = _1372;
    }
    float _1374 = _135;
    float _1376 = floor(_1356);
    bool _1378 = uint(_1354) >= uint(_493);
    float _1380 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1382 = !_1378;
    int _1384 = _1382 ? 0 : (-1);
    float _1386 = trunc(_1362);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    bool _1392 = _1254 > 0.0;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1398 = abs(_1182);
    float _1400 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1404;
    bool _1408 = _1376 >= 0.0;
    bool _1410 = isnan(_1376);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(0.0);
    bool _1416 = _1412 || _1414;
    float _1418 = _1406 * _1316;
    out.m_72.x = _1380;
    out.m_72.y = _1400;
    out.m_72.z = _1402;
    out.m_72.w = _1370;
    int _1420 = _1416 ? 0 : 1;
    bool _1422 = _1376 > 0.0;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1424;
    int _1428 = int(_1272) + int(_1390);
    float _1430 = _457 * 2.0;
    int _1432 = ~_1420;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = in.m_66.w;
    float _1440 = _1426 * _1364;
    float _1442 = floor(_1430);
    float _1444 = in.m_64.w;
    bool _1446 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1448 = isnan(_451);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1454 = _1450 || _1452;
    float _1456 = float(_1454);
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1462 = ~_517;
    int _1464 = _1462 + 1;
    int _1466 = ~_1360;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    float _1472 = _1460 * _668;
    int _1474 = _1470;
    int _1476 = _1436;
    if (!_1392)
    {
        int _1478 = ~_1360;
        int _1480 = _1478 + 1;
        _1474 = _1480;
    }
    int _1482 = _1474;
    int _1484 = _1464 * _1428;
    int _1486 = _1484 + _804;
    if (!_1422)
    {
        int _1488 = ~_1420;
        int _1490 = _1488 + 1;
        _1476 = _1490;
    }
    int _1492 = _1476;
    float _1494 = _157 + _1152;
    bool _1496 = !_1060;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1502 = _451 + _1500;
    bool _1504 = uint(_1486) >= uint(_517);
    float _1506 = _1494 + (-1.0);
    bool _1508 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1510 = isnan(_451);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = -_1456;
    float _1522 = _1520 + 1.0;
    bool _1524 = !_1504;
    int _1526 = _1524 ? 0 : (-1);
    float _1528 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1532 = _1530 != 0;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1540 = _1538 != 0;
    float _1542 = -_1518;
    float _1544 = _1542 + 1.0;
    float _1546 = in.m_68.w;
    int _1548 = ~_1428;
    int _1550 = _1548 + _1526;
    int _1552 = _1550 + 1;
    bool _1554 = !_1532;
    int _1556 = _1554 ? 0 : 1;
    bool _1558 = _1442 >= 0.0;
    bool _1560 = isnan(_1442);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan(0.0);
    bool _1566 = _1562 || _1564;
    int _1568 = _517 * _1552;
    int _1570 = _1568 + _804;
    int _1572 = _1566 ? 0 : 1;
    bool _1574 = _1442 > 0.0;
    float _1576 = _1456 * _1544;
    bool _1578 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1580 = isnan(_451);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = fma(_1418, _1502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1592 = _481 * _1522;
    float _1594 = fma(_1472, _461, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1596 = _1358 + _1438;
    float _1598 = _1588 * _497;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1602 = _451 + _1600;
    float _1604 = _1252 + 0.5;
    float _1606 = _1348 + _1444;
    float _1608 = _1590 * _1598;
    float _1610 = -_1588;
    float _1612 = _1610 + 1.0;
    float _1614 = _1318 + _1546;
    float _1616 = -_1294;
    float _1618 = _1616 + 1.0;
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1622 = _1596 + _1620;
    float _1624 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1290);
    float _1626 = _1322 + (-0.5);
    float _1628 = fma(_1612, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1608);
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1632 = _1606 + _1630;
    float _1634 = _1622 * _1622;
    float _1636 = -_1626;
    float _1638 = -_1264;
    float _1640 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1638);
    float _1642 = -_1618;
    float _1644 = fma(_1252, _1642, _1624);
    float _1646 = fma(_1440, _1602, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1648 = fma(_1594, _1592, _1628);
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1614 + _1650;
    float _1654 = fma(_1632, _1632, _1634);
    float _1656 = fma(_1322, _1326, _1640);
    float _1658 = fma(_1646, _1576, _1648);
    int _1660 = _1050 >> 31;
    float _1662 = fma(_1652, _1652, _1654);
    int _1664 = ~_1572;
    int _1666 = _1664 + 1;
    int _1668 = _1666 + 1;
    out.m_74.x = _1644;
    out.m_74.y = _1656;
    int _1670 = _1668;
    float _1672 = _1614;
    if (!_1574)
    {
        int _1674 = ~_1572;
        int _1676 = _1674 + 1;
        _1670 = _1676;
    }
    int _1678 = _1670;
    float _1680 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1658);
    int _1682 = _1660 & 3;
    float _1684 = rsqrt(_1662);
    int _1686 = _1064 >> 31;
    int _1688 = _1050 + _1682;
    int _1690 = _1686 & 3;
    bool _1692 = !_1074;
    int _1694 = _1692 ? 0 : 1;
    int _1696 = _1688 >> 2;
    float _1698 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1700 = _1058 != 3;
    float _1702 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1704 = _1064 + _1690;
    float _1706 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1698);
    int _1708 = _1696 << 4;
    int _1710 = _1708 + 368;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1714 = _1704 >> 2;
    float _1716 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1706);
    uint _1718 = uint(int(uint(_1710) >> uint(2)));
    uint _1720 = uint(int(uint(int(_1718)) >> uint(2)));
    int _1722 = int(_1718) & 3;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[int(_1720)][_1722];
    int _1726 = int(_1718) + 1;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    int _1730 = _1726 & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    float _1734 = _1712 * _1684;
    int _1736 = _1714 << 4;
    int _1738 = _1736 + 656;
    bool _1740 = !_1700;
    int _1742 = _1740 ? 0 : (-1);
    float _1744 = _1622 * _1734;
    bool _1746 = _1072 != 3;
    float _1748 = _1632 * _1734;
    uint _1750 = uint(int(uint(_1738) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    float _1766 = -_1744;
    float _1768 = _1622 + _1766;
    bool _1770 = !_1746;
    int _1772 = _1770 ? 0 : (-1);
    float _1774 = -_1748;
    float _1776 = _1632 + _1774;
    bool _1778 = _1716 >= 0.0;
    float _1780 = _1768 * _1768;
    int _1782 = _1710 + 8;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[int(_1794)][_1796];
    int _1800 = abs(_1556);
    float _1802 = fma(_1776, _1776, _1780);
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1806 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1808 = _1738 + 8;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
    int _1814 = int(_1810) & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = int(_1810) + 1;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    int _1822 = _1818 & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1828 = abs(_1694);
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1832 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1834 = ~_1266;
    int _1836 = _1834 + _1384;
    int _1838 = _1836 + 1;
    float _1840 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = float(_1678);
    float _1846 = _1652 * _1734;
    int _1848 = _493 * _1838;
    int _1850 = _1848 + _764;
    int _1852 = abs(_1116);
    out.m_76.x = _1840;
    out.m_76.y = _1842;
    out.m_76.z = _1806;
    out.m_76.w = _1832;
    int _1854 = abs(_1498);
    float _1856 = -_1846;
    float _1858 = _1652 + _1856;
    int _1860 = abs(_1742);
    if (_1778)
    {
        out.m_53.x = 0.0;
    }
    float _1862 = float(_1800);
    float _1864 = fma(_1858, _1858, _1802);
    bool _1866 = !_788;
    int _1868 = _1866 ? _1850 : (-1);
    bool _1870 = !_790;
    int _1872 = _1870 ? _1570 : (-1);
    float _1874 = _1862 * _1844;
    float _1876 = sqrt(_1864);
    int _1878 = ~_1852;
    int _1880 = _1878 + 1;
    int _1882 = _1880 + 1;
    int _1884 = ~_1854;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    int _1890 = _1882 * as_type<int>(_1732);
    int _1892 = ~_1242;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    int _1898 = _1888 * as_type<int>(_1724);
    int _1900 = _1898 + _1890;
    int _1902 = ~_1828;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1896 * as_type<int>(_1764);
    int _1910 = ~_1368;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    int _1916 = _1906 * as_type<int>(_1756);
    int _1918 = _1916 + _1908;
    int _1920 = abs(_1772);
    int _1922 = _1914 * as_type<int>(_1790);
    int _1924 = _1922 + _1900;
    int _1926 = ~_1398;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    float _1932 = in.m_78.x;
    float _1934 = in.m_78.y;
    float _1936 = in.m_78.z;
    float _1938 = _1684 * _1876;
    bool _1940 = !_1206;
    int _1942 = _1940 ? 0 : 1;
    int _1944 = _1930 * as_type<int>(_1816);
    int _1946 = _1944 + _1918;
    int _1948 = ~_1860;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = _1874 * (-2.0);
    int _1956 = abs(_1194);
    float _1958 = _1702 * _1938;
    int _1960 = ~_1920;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = _1952 * as_type<int>(_1798);
    int _1968 = _1966 + _1924;
    int _1970 = abs(_1942);
    int _1972 = ~_1956;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    int _1978 = _1964 * as_type<int>(_1824);
    int _1980 = _1978 + _1946;
    int _1982 = ~_1970;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = as_type<float>(_1952);
    if (_1778)
    {
        _1988 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1990 = _1988;
    int _1992 = _1968 * _1976;
    float _1994 = fma(_1528, _1954, _1528);
    int _1996 = _1980 * _1986;
    float _1998 = _157 + (-0.5);
    int _2000 = _1868 * _1956;
    int _2002 = _2000 + _1992;
    int _2004 = as_type<int>(_1990);
    if (_1778)
    {
        float _2006 = _1990 * 5.0;
        _2004 = as_type<int>(_2006);
    }
    int _2008 = _2004;
    int _2010 = _1872 * _1970;
    int _2012 = _2010 + _1996;
    float _2014 = fma(_1954, _1932, _1932);
    out.m_80.x = _1958;
    float _2016 = float(_2002);
    float _2018 = float(_2012);
    float _2020 = _1936;
    if (_1778)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6329 = as_type<float>(_2008);
        out.gl_Position.z = _6329;
    }
    float _2022 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2014);
    float _2024 = _1152 + _457;
    out.m_82.x = _2016;
    float _2026 = float(_1482);
    float _2028 = _2024 + (-1.0);
    out.m_82.z = _2018;
    bool _2030 = !_1536;
    int _2032 = _2030 ? 0 : 1;
    bool _2034 = !_1540;
    int _2036 = _2034 ? 0 : 1;
    int _2038 = abs(_2032);
    if (_1778)
    {
        return out;
    }
    float _2040 = -_1744;
    float _2042 = _1596 + _2040;
    float _2044 = -_1748;
    float _2046 = _1606 + _2044;
    int _2048 = abs(_2036);
    float _2050 = -_1846;
    float _2052 = _1614 + _2050;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _2042 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2060 = _2046 + _2058;
    float _2062 = float(_2038);
    float _2064 = fma(_1994, _1374, _2022);
    float _2066 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2068 = float(_1492);
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2072 = _2052 + _2070;
    float _2074 = _2062 * _2026;
    float _2076 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2066);
    float _2078 = float(_2048);
    float _2080 = _2064 * 0.15915493667125701904296875;
    float _2082 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2084 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2076);
    float _2086 = _1152 + (-0.5);
    float _2088 = _2078 * _2068;
    float _2090 = _2074 * (-2.0);
    float _2092 = _157 + _457;
    bool _2094 = _2084 >= 0.0;
    float _2096 = _2088 * (-2.0);
    float _2098 = fma(_2090, _1934, _1934);
    float _2100 = fma(_2082, _2090, _2082);
    float _2102 = _2092 + (-1.0);
    float _2104 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2098);
    float _2106 = fma(_2096, _1936, _1936);
    float _2108 = _457 + (-0.5);
    float _2110 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2112 = fma(_2100, _1374, _2104);
    float _2114 = _2080 * 6.283185482025146484375;
    float _2116 = sin(_2114);
    if (_2094)
    {
        _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2118 = _2020;
    float _2120 = _2112 * 0.15915493667125701904296875;
    float _2122 = fma(_2110, _2096, _2110);
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2106);
    int _2126 = as_type<int>(_2118);
    if (_2094)
    {
        out.m_53.x = 0.0;
    }
    float _2128 = _2080 * 6.283185482025146484375;
    float _2130 = cos(_2128);
    if (_2094)
    {
        float _2132 = _2118 * 5.0;
        _2126 = as_type<int>(_2132);
    }
    int _2134 = _2126;
    float _2136 = fma(_2122, _1374, _2124);
    if (_2094)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6527 = as_type<float>(_2134);
        out.gl_Position.z = _6527;
    }
    float _2138 = _2136 * 0.15915493667125701904296875;
    float _2140 = _2120 * 6.283185482025146484375;
    float _2142 = sin(_2140);
    float _2144 = _2120 * 6.283185482025146484375;
    float _2146 = cos(_2144);
    if (_2094)
    {
        return out;
    }
    float _2148 = _2138 * 6.283185482025146484375;
    float _2150 = cos(_2148);
    float _2152 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2154 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _2156 = _2116 * _2142;
    float _2158 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2160 = _2152 * _1938;
    float _2162 = _2130 * _2142;
    float _2164 = _2116 * _2146;
    float _2166 = _2138 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _2160 * _2154;
    float _2172 = _2130 * _2146;
    float _2174 = _1958 * _2158;
    float _2176 = _2130 * _2150;
    float _2178 = _2146 * _2150;
    float _2180 = _2116 * _2150;
    float _2182 = _2142 * _2150;
    float _2184 = _2176 * _2170;
    float _2186 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2188 = _2186 * 0.5;
    float _2190 = fma(_2168, _2172, _2156);
    float _2192 = -_2164;
    float _2194 = fma(_2168, _2162, _2192);
    float _2196 = -_2170;
    float _2198 = _2168 * _2196;
    float _2200 = -_2162;
    float _2202 = fma(_2168, _2164, _2200);
    float _2204 = fma(_2190, _2174, _2184);
    float _2206 = _2180 * _2170;
    float _2208 = fma(_2178, _2174, _2198);
    float _2210 = fma(_2168, _2156, _2172);
    float _2212 = fma(_2194, _2188, _2204);
    float _2214 = fma(_2202, _2174, _2206);
    float _2216 = fma(_2182, _2188, _2208);
    float _2218 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2220 = fma(_2210, _2188, _2214);
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2224 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2226 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2218);
    float _2228 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2222);
    float _2230 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2224);
    float _2232 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2226);
    float _2234 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2236 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2238 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2240 = _2234 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2242 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2244 = _1614 + _2238;
    float _2246 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2248 = _1606 + _2240;
    float _2250 = _1596 + _2242;
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2254 = _2244 + _2252;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2258 = _2248 + _2256;
    float _2260 = _2254 * _2254;
    float _2262 = fma(_2258, _2258, _2260);
    float _2264 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2246);
    float _2266 = sqrt(_2262);
    float _2268 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2264);
    bool _2270 = _2266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = _2246;
    float _2274 = _2248;
    float _2276 = _2264;
    if (!_2270)
    {
        _2272 = _2248;
    }
    float _2278 = _2272;
    float _2280 = _2278;
    if (!_2270)
    {
        _2274 = _2244;
    }
    float _2282 = _2274;
    float _2284 = _2282;
    if (!_2270)
    {
        _2276 = _2250;
    }
    float _2286 = _2276;
    bool _2288 = !_2270;
    float _2290 = _2286;
    if (!_2288)
    {
        float _2292 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2296 = _2266 + _2294;
        float _2298 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = rsqrt(_2262);
        float _2302 = _2296 * _2292;
        float _2304 = _2302 * 0.15915493667125701904296875;
        float _2306 = _2304 * 6.283185482025146484375;
        float _2308 = cos(_2306);
        float _2310 = _2304 * 6.283185482025146484375;
        float _2312 = sin(_2310);
        float _2314 = _2308 + (-1.0);
        float _2316 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2318 = fma(_2312, _2298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2320 = fma(_2250, _2308, _2316);
        float _2322 = _2300 * _2318;
        float _2324 = fma(_2258, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2326 = fma(_2254, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2290 = _2320;
        _2280 = _2324;
        _2284 = _2326;
    }
    float _2328 = _2290;
    float _2330 = _2280;
    float _2332 = _2284;
    float _2334 = -_1596;
    float _2336 = _2334 + _2328;
    float _2338 = -_1606;
    float _2340 = _2338 + _2330;
    float _2342 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2344 = -_1614;
    float _2346 = _2344 + _2332;
    float _2348 = _2336 * _2336;
    float _2350 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2352 = 1.0 / _2342;
    float _2354 = fma(_2340, _2340, _2348);
    float _2356 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2350);
    bool _2358 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2360 = isnan(0.5);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2366 = _2362 || _2364;
    float _2368 = fma(_2346, _2346, _2354);
    float _2370 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2372 = sqrt(_2368);
    float _2374 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2376 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2378 = isnan(0.5);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2384 = _2380 || _2382;
    float _2386 = _2374 + _2342;
    float _2388 = _2386 * _2352;
    float _2390 = _2388 * 0.5;
    bool _2392 = _2372 > 0.0;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2396 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2394);
    float _2398 = 1.0 / _2396;
    float _2400 = _2390;
    float _2402 = _2330;
    float _2404 = _2328;
    float _2406 = _2340;
    float _2408 = _2332;
    if (!_2392)
    {
        _2400 = _2332;
    }
    float _2410 = _2400;
    bool _2412 = !_2392;
    float _2414 = _2410;
    if (!_2412)
    {
        float _2416 = _237 * _237;
        float _2418 = rsqrt(_2368);
        float _2420 = fma(_233, _233, _2416);
        float _2422 = fma(_239, _239, _2420);
        float _2424 = sqrt(_2422);
        float _2426 = _2340 * _2418;
        float _2428 = _2336 * _2418;
        float _2430 = _2346 * _2418;
        bool _2432 = _2424 > 0.0;
        float _2434 = _2424;
        _2406 = _2426;
        if (!_2432)
        {
            _2434 = _2332;
        }
        float _2436 = _2434;
        bool _2438 = !_2432;
        _2414 = _2436;
        if (!_2438)
        {
            float _2440 = rsqrt(_2422);
            float _2442 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2444 = _237 * _2440;
            float _2446 = _233 * _2440;
            float _2448 = _2428 * _2444;
            float _2450 = _239 * _2440;
            float _2452 = fma(_2426, _2446, _2448);
            float _2454 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2456 = fma(_2430, _2450, _2452);
            float _2458 = _2456 * _2454;
            float _2460 = fma(_233, _2458, _2330);
            float _2462 = fma(_237, _2458, _2328);
            float _2464 = fma(_239, _2458, _2332);
            _2402 = _2460;
            _2404 = _2462;
            _2414 = _2464;
        }
    }
    float _2466 = _2402;
    float _2468 = _2404;
    float _2470 = _2414;
    float _2472 = _2406;
    float _2474 = -_1748;
    float _2476 = _2474 + _2466;
    float _2478 = -_1744;
    float _2480 = _2478 + _2468;
    float _2482 = -_1846;
    float _2484 = _2482 + _2470;
    float _2486 = _2480;
    float _2488 = _2476;
    float _2490 = _2484;
    float _2492 = _2472;
    float _2494 = _2470;
    if (_2384)
    {
        _2408 = 1.0;
    }
    float _2496 = _2408;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2500 = _2398 * _2498;
    float _2502 = _2496;
    if (!_2366)
    {
        float _2504 = _2056 * _2056;
        float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2508 = -_1614;
        float _2510 = _2508 + _2470;
        float _2512 = -_1596;
        float _2514 = _2512 + _2468;
        float _2516 = fma(_2060, _2060, _2504);
        float _2518 = -_1606;
        float _2520 = _2518 + _2466;
        float _2522 = fma(_2072, _2072, _2516);
        float _2524 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2526 = sqrt(_2522);
        float _2528 = 1.0 / _1938;
        float _2530 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2532 = precise::min(_2526, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2534 = _2532 * _2506;
        float _2536 = _2534 * _2528;
        float _2538 = _2530 * _2536;
        float _2540 = _2510 * _2536;
        float _2542 = fma(_2514, _2538, _2042);
        float _2544 = fma(_2520, _2538, _2046);
        float _2546 = fma(_2530, _2540, _2052);
        _2486 = _2542;
        _2488 = _2544;
        _2490 = _2546;
        _1672 = _2540;
    }
    float _2548 = _2486;
    float _2550 = _2488;
    float _2552 = _2490;
    float _2554 = _1672;
    float _2556 = _2554;
    if (!_2384)
    {
        float _2558 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2560 = _2558 * 0.15915493667125701904296875;
        float _2562 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2564 = _2560 * 6.283185482025146484375;
        float _2566 = cos(_2564);
        float _2568 = _2562 * 0.15915493667125701904296875;
        float _2570 = _2560 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        float _2574 = 1.0 / _2566;
        float _2576 = _2568 * 6.283185482025146484375;
        float _2578 = cos(_2576);
        float _2580 = _2572 * _2574;
        float _2582 = _2568 * 6.283185482025146484375;
        float _2584 = sin(_2582);
        float _2586 = _2578 * _2580;
        float _2588 = 1.0 / _2586;
        float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2592 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2590;
        float _2594 = 1.0 / _2592;
        float _2596 = _2584 * _2588;
        float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2600 = fma(_2500, _2596, _2598);
        float _2602 = _2600 * _2594;
        float _2604 = precise::clamp(_2602, 0.0, 1.0);
        _2556 = _2560;
        _2502 = _2604;
    }
    float _2606 = _2556;
    float _2608 = _2502;
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2612 = _2548 + _2610;
    float _2614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2616 = _2550 + _2614;
    float _2618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2620 = _2552 + _2618;
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2616, _2616, _2622);
    float _2626 = fma(_2620, _2620, _2624);
    float _2628 = rsqrt(_2626);
    float _2630 = sqrt(_2626);
    float _2632 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2634 = _2616 * _2632;
    float _2636 = _2620 * _2632;
    float _2638 = _2634 * _2634;
    float _2640 = _2636 * _2636;
    float _2642 = _2638 + _2640;
    float _2644 = sqrt(_2642);
    bool _2646 = _2644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2650 = _2644 + _2648;
    float _2652 = _2620;
    float _2654 = _2642;
    float _2656 = _2650;
    float _2658 = _2606;
    if (_2646)
    {
        float _2660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2652 = _2660;
    }
    float _2662 = _2652;
    if (_2646)
    {
        float _2664 = rsqrt(_2642);
        _2654 = _2664;
    }
    float _2666 = _2654;
    float _2668 = _2666;
    if (_2646)
    {
        float _2670 = _2650 * _2662;
        _2656 = _2670;
    }
    float _2672 = _2656;
    if (_2646)
    {
        float _2674 = _2672 * 0.15915493667125701904296875;
        _2658 = _2674;
    }
    float _2676 = _2658;
    float _2678 = _2662;
    float _2680 = _2676;
    if (_2646)
    {
        float _2682 = _2676 * 6.283185482025146484375;
        float _2684 = sin(_2682);
        _2678 = _2684;
    }
    float _2686 = _2678;
    float _2688 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2690 = precise::max(0.0, _2688);
    float _2692 = _2622;
    float _2694 = _2690;
    if (_2646)
    {
        float _2696 = _2676 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        _2692 = _2698;
    }
    float _2700 = _2692;
    float _2702 = -_2632;
    float _2704 = -_2690;
    float _2706 = fma(_2612, _2702, _2704);
    float _2708 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2646)
    {
        float _2710 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2694 = _2710;
    }
    float _2712 = _2694;
    float _2714 = _2712;
    if (!_2646)
    {
        _2680 = _2634;
    }
    float _2716 = _2680;
    float _2718 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2720 = _2686;
    float _2722 = _2716;
    if (_2646)
    {
        float _2724 = fma(_2686, _2712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2720 = _2724;
    }
    float _2726 = _2720;
    float _2728 = _2726;
    if (!_2646)
    {
        _2714 = _2706;
    }
    float _2730 = _2714;
    float _2732 = _2730;
    float _2734 = _2700;
    if (_2646)
    {
        float _2736 = _2700 + (-1.0);
        _2708 = _2736;
    }
    float _2738 = _2708;
    if (_2646)
    {
        float _2740 = _2666 * _2726;
        _2492 = _2740;
    }
    float _2742 = _2492;
    if (!_2646)
    {
        _2728 = _2638;
    }
    float _2744 = _2728;
    float _2746 = _2744;
    if (_2646)
    {
        float _2748 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2494 = _2748;
    }
    float _2750 = _2494;
    if (_2646)
    {
        float _2752 = _2634 * _2742;
        _2722 = _2752;
    }
    float _2754 = _2722;
    if (!_2646)
    {
        _2668 = _2636;
    }
    float _2756 = _2668;
    float _2758 = _2756;
    if (_2646)
    {
        float _2760 = _2636 * _2742;
        _2758 = _2760;
    }
    float _2762 = _2758;
    if (_2646)
    {
        float _2764 = fma(_2706, _2700, _2750);
        _2732 = _2764;
    }
    float _2766 = _2732;
    if (_2646)
    {
        float _2768 = _2754 * _2754;
        _2746 = _2768;
    }
    float _2770 = _2746;
    if (!_2646)
    {
        _2734 = _2640;
    }
    float _2772 = _2734;
    float _2774 = _2772;
    if (_2646)
    {
        float _2776 = _2762 * _2762;
        _2774 = _2776;
    }
    float _2778 = _2774;
    float _2780 = fma(_2766, _2766, _2770);
    float _2782 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2784 = floor(_2718);
    float _2786 = _2780 + _2778;
    float _2788 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2782);
    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2792 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2790);
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2788);
    float _2798 = rsqrt(_2786);
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2802 = _2796 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2804 = -_2794;
    float _2806 = _2804 + 1.0;
    float _2808 = fma(_2052, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2810 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2812 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2814 = abs(_2806);
    float _2816 = log2(_2814);
    float _2818 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2810);
    float _2820 = -_2812;
    float _2822 = fma(_2820, _2800, 1.0);
    float _2824 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2826 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2828 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2818);
    float _2830 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2824);
    float _2832 = _2798 * _2754;
    float _2834 = _2798 * _2766;
    float _2836 = _2798 * _2762;
    float _2838 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2830);
    float _2840 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2842 = _2828 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2844 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2826);
    float _2846 = _2838 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2848 = -_2840;
    float _2850 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2848);
    float _2852 = floor(_2808);
    float _2854 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2856 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2858 = -_2836;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2850);
    float _2862 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2844);
    float _2864 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2856);
    float _2866 = fma(_2860, -0.5, 0.5);
    float _2868 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2870 = exp2(_2854);
    float _2872 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2864);
    float _2874 = fma(_2860, 0.5, 0.5);
    float _2876 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2872);
    float _2878 = -_2852;
    float _2880 = _2808 + _2878;
    float _2882 = log2(_2822);
    float _2884 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2886 = fma(_2874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2888 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2884);
    float _2890 = _2834 + 1.0;
    float _2892 = fma(_2874, _2886, -0.212114393711090087890625);
    float _2894 = 1.0 / _2876;
    float _2896 = -_2784;
    float _2898 = _2718 + _2896;
    float _2900 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2902 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2888);
    float _2904 = -_2834;
    float _2906 = fma(_2870, _2890, _2904);
    float _2908 = fma(_2874, _2892, 1.570728778839111328125);
    float _2910 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2900);
    float _2912 = sqrt(_2866);
    float _2914 = _2882 * 0.693147182464599609375;
    float _2916 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2910);
    float2 _7767 = float2(_2898, _2880);
    float _2918 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7767, float2(0.0), isnan(_7767)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7767, float2(0.0), isnan(_7767)), level(0.0)).x;
    float _2920 = fma(_2906, 0.5, 0.5);
    float _2922 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2924 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2916);
    float _2926 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2902);
    float _2928 = _2924 * _2894;
    float _2930 = _2926 * _2894;
    float _2932 = fma(_2928, 0.5, 0.5);
    float _2934 = fma(_2930, -0.5, 0.5);
    float _2936 = _2912 * 0.636619746685028076171875;
    float _2938 = -_2908;
    float _2940 = fma(_2936, _2938, 1.0);
    float3 _7812 = float3(_2932, _2934, _2922);
    float _2942 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7812, float3(0.0), isnan(_7812)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7812, float3(0.0), isnan(_7812)), level(0.0)).x;
    float3 _7823 = float3(_2932, _2934, _2922);
    float4 _2945 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7823, float3(0.0), isnan(_7823)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7823, float3(0.0), isnan(_7823)), level(0.0)).xyzw;
    float _2947 = _2945.x;
    float _2949 = _2945.y;
    float _2951 = _2945.z;
    float _2953 = _2945.w;
    float2 _7839 = float2(_2940, _2920);
    float3 _2957 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7839, float2(0.0), isnan(_7839)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7839, float2(0.0), isnan(_7839)), level(0.0)).xyz;
    float _2959 = _2957.x;
    float _2961 = _2957.y;
    float _2963 = _2957.z;
    float _2965 = abs(_2500);
    float _2967 = log2(_2965);
    float _2969 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2971 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2973 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2975 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2977 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2969);
    float _2979 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2971);
    float _2981 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2973);
    float _2983 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2985 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2987 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2989 = -_2168;
    float _2991 = fma(_2989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2983);
    float _2993 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2995 = -_2168;
    float _2997 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2987);
    float _2999 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3001 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3003 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3005 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2993);
    float _3007 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2999);
    float _3009 = -_2168;
    float _3011 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2985);
    float _3013 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3003);
    float _3015 = exp2(_3001);
    float _3017 = fma(_2975, _2975, 1.0);
    float _3019 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2991);
    float _3021 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3011);
    float _3023 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2997);
    float _3025 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2977);
    float _3027 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3029 = rsqrt(_3017);
    float _3031 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3007);
    float _3033 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3005);
    float _3035 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3013);
    float _3037 = _2975 * _3019;
    bool _3039 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3041 = isnan(_2630);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3047 = _3043 || _3045;
    float _3049 = fma(_3015, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3051 = precise::clamp(_3049, 0.0, 1.0);
    float _3053 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2979);
    float _3055 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3057 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2981);
    float _3059 = fma(_3051, -2.0, 3.0);
    float _3061 = _3051 * _3051;
    float _3063 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3055);
    float _3065 = _2975 * _3029;
    float _3067 = _3061 * _3059;
    float _3069 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3063);
    float _3071 = fma(_3027, _3025, _3037);
    float _3073 = -_3031;
    float _3075 = _3065 * _3073;
    float _3077 = -_3067;
    float _3079 = _3077 + 1.0;
    float _3081 = _2975 * _3021;
    float _3083 = in.m_84.x;
    float _3085 = fma(_3029, _3019, _3075);
    float _3087 = fma(_3079, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3067);
    float _3089 = -_3033;
    float _3091 = _3065 * _3089;
    out.m_86.x = _3025;
    out.m_86.y = _3053;
    out.m_86.z = _3057;
    float _3093 = fma(_3027, _3053, _3081);
    float _3095 = _2975 * _3023;
    float _3097 = fma(_3029, _3021, _3091);
    float _3099 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3069);
    float _3101 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3103 = fma(_3027, _3057, _3095);
    float _3105 = _3099 + _2876;
    out.gl_Position.x = _2924;
    out.gl_Position.y = _2926;
    out.gl_Position.z = _3099;
    out.gl_Position.w = _2876;
    float _3107 = exp2(_3101);
    bool _3109 = _2500 <= 8000.0;
    bool _3111 = isnan(_2500);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan(8000.0);
    bool _3117 = _3113 || _3115;
    float _3119 = float(_3117);
    float _3121 = -_3035;
    float _3123 = _3065 * _3121;
    float _3125 = _2924 + _2876;
    float _3127 = _3035 + _3103;
    float _3129 = _3105 * 0.5;
    float _3131 = _3119 * _3087;
    float _3133 = fma(_3029, _3023, _3123);
    float _3135 = _2876 * 0.5;
    float _3137 = _3033 + _3093;
    float _3139 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3141 = fma(_2926, -0.5, _3135);
    float _3143 = _3031 + _3071;
    float _3145 = _3125 * 0.5;
    out.m_88.x = _3085;
    out.m_88.y = _3097;
    out.m_88.z = _3133;
    float _3147 = -_3107;
    float _3149 = _3147 + 1.0;
    float _3151 = _2876;
    float _3153 = _3099;
    float _3155 = _3097;
    float _3157 = _3085;
    if (!_3047)
    {
        _3151 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3159 = _3151;
    out.m_90.x = _3143;
    out.m_90.y = _3137;
    out.m_90.z = _3127;
    float _3161 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3163 = _3159;
    float _3165 = _3159;
    if (!_3047)
    {
        _3153 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3167 = _3153;
    out.m_92.x = _3145;
    out.m_92.y = _3141;
    out.m_92.z = _3129;
    out.m_92.w = _2876;
    float _3169 = -_3161;
    float _3171 = _3169 + 1.0;
    float _3173 = _3171;
    float _3175 = _3167;
    float _3177 = _3167;
    if (!_3047)
    {
        _3155 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3179 = _3155;
    float _3181 = _3179;
    float _3183 = _3179;
    if (!_3047)
    {
        _3157 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3185 = _3157;
    float _3187 = _2608 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3189 = -_2918;
    float _3191 = _3189 + 1.0;
    float _3193 = _3191 * _3139;
    float _3195 = precise::clamp(_3193, 0.0, 1.0);
    float _3197 = -_3195;
    float _3199 = fma(_3197, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3201 = _3199 * _3083;
    float _3203 = _3201 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3205 = _3161 * _2942;
    float _3207 = _2953 * _3171;
    out.m_94.x = _3203;
    float _3209 = _3185;
    float _3211 = _3185;
    if (!_3047)
    {
        _3173 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3213 = _3173;
    float _3215 = _2953 * _3205;
    float _3217 = _2963 * _3205;
    float _3219 = fma(_2959, _3215, _2947);
    float _3221 = fma(_2961, _3215, _2949);
    float _3223 = fma(_2953, _3217, _2951);
    float _3225 = _3215;
    float _3227 = _3213;
    float _3229 = _3213;
    if (!_3047)
    {
        _3225 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3231 = _3225;
    out.m_96.x = _3219;
    out.m_96.y = _3221;
    out.m_96.z = _3223;
    out.m_96.w = _3207;
    bool _3233 = !_3047;
    float _3235 = _3231;
    float _3237 = _3231;
    if (!_3233)
    {
        bool _3239 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3241 = isnan(_2630);
        bool _3243 = _3239 || _3241;
        bool _3245 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3247 = _3243 || _3245;
        if (!_3247)
        {
            float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3251 = _2630 + _3249;
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3255 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3253;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3261 = 1.0 / _3255;
            float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3279 = _3251 * _3261;
            float _3281 = precise::clamp(_3279, 0.0, 1.0);
            float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3287 = fma(_3281, _3259, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3289 = fma(_3281, _3285, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3291 = fma(_3281, _3265, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3293 = fma(_3281, _3269, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3295 = fma(_3281, _3273, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3297 = fma(_3281, _3277, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3211 = _3291;
            _3237 = _3295;
            _3183 = _3287;
            _3177 = _3293;
            _3165 = _3289;
            _3229 = _3297;
            _3299 = true;
        }
        else
        {
            bool _3301 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3303 = isnan(_2630);
            bool _3305 = _3301 || _3303;
            bool _3307 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3309 = _3305 || _3307;
            if (!_3309)
            {
                _3181 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3311 = _3181;
            _3183 = _3311;
            if (!_3309)
            {
                _3209 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3313 = _3209;
            _3211 = _3313;
            if (!_3309)
            {
                _3163 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3315 = _3163;
            _3165 = _3315;
            if (!_3309)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3317 = _3175;
            _3177 = _3317;
            if (!_3309)
            {
                _3235 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3319 = _3235;
            _3237 = _3319;
            if (!_3309)
            {
                _3227 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3321 = _3227;
            bool _3323 = !_3309;
            _3229 = _3321;
            if (!_3323)
            {
                bool _3325 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3327 = isnan(_2630);
                bool _3329 = _3325 || _3327;
                bool _3331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3333 = _3329 || _3331;
                if (!_3333)
                {
                    float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3337 = _2630 + _3335;
                    float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3341 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3339;
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3347 = 1.0 / _3341;
                    float _3349 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3351 = _3349 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3365 = _3337 * _3347;
                    float _3367 = precise::clamp(_3365, 0.0, 1.0);
                    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3373 = fma(_3367, _3345, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3375 = fma(_3367, _3371, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3377 = fma(_3367, _3351, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3379 = fma(_3367, _3355, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3381 = fma(_3367, _3359, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3383 = fma(_3367, _3363, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3211 = _3377;
                    _3237 = _3381;
                    _3183 = _3373;
                    _3177 = _3379;
                    _3165 = _3375;
                    _3229 = _3383;
                    _3299 = true;
                }
                else
                {
                    _3211 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3237 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3183 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3165 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3229 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3299 = false;
    float _3385 = _3211;
    float _3387 = _3237;
    float _3389 = _3183;
    float _3391 = _3177;
    float _3393 = _3165;
    float _3395 = _3229;
    float _3397 = fma(_3137, -0.5, 0.5);
    float _3399 = precise::clamp(_3397, 0.0, 1.0);
    float _3401 = -_3385;
    float _3403 = _3401 + _3387;
    float _3405 = -_3389;
    float _3407 = _3405 + _3391;
    out.m_98.x = 0.0;
    float _3409 = fma(_3399, _3403, _3385);
    float _3411 = -_3393;
    float _3413 = _3411 + _3395;
    float _3415 = fma(_3399, _3407, _3389);
    float _3417 = _3409 * 0.586610972881317138671875;
    bool _3419 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3421 = fma(_3399, _3413, _3393);
    float _3423 = _3187 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3425 = fma(_3415, 0.298911988735198974609375, _3417);
    bool _3427 = _2608 > 0.0;
    bool _3429 = isnan(_2608);
    bool _3431 = _3427 || _3429;
    bool _3433 = isnan(0.0);
    bool _3435 = _3431 || _3433;
    float _3437 = fma(_3421, 0.114477999508380889892578125, _3425);
    out.m_53.x = _3423;
    float _3439 = -_3437;
    float _3441 = _3415 + _3439;
    float _3443 = -_3437;
    float _3445 = _3409 + _3443;
    float _3447 = -_3437;
    float _3449 = _3421 + _3447;
    float _3451 = fma(_3441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3455 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    bool _3457 = !_3419;
    if (!_3457)
    {
        float _3459 = -_2548;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3463 = -_2550;
        float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3467 = -_2552;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3471 = _3461 * _3461;
        float _3473 = fma(_3465, _3465, _3471);
        float _3475 = fma(_3469, _3469, _3473);
        float _3477 = sqrt(_3475);
        float _3479 = rsqrt(_3475);
        float _3481 = -_3477;
        float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3485 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        float _3489 = _3465 * _3479;
        float _3491 = _3461 * _3479;
        float _3493 = abs(_3487);
        float _3495 = log2(_3493);
        float _3497 = _3469 * _3479;
        float _3499 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3501 = _3137 * _3491;
        float _3503 = -_3491;
        float _3505 = -_3499;
        float _3507 = fma(_3503, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3505);
        float _3509 = fma(_3143, _3489, _3501);
        float _3511 = -_3497;
        float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3507);
        float _3515 = fma(_3127, _3497, _3509);
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3521 = _3513 + _3519;
        float _3523 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3525 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = exp2(_3523);
        float _3531 = _3529 * _3527;
        float _3533 = _3517 * _3531;
        float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3537 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3535;
        out.m_98.y = _3537;
        out.m_98.z = _3539;
    }
    out.m_100.x = _3451;
    out.m_100.y = _3453;
    out.m_100.z = _3455;
    if (_3435)
    {
        return out;
    }
    float _3541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3541;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3299 = false;
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
        float _3609 = as_type<float>(_143);
        out.gl_Position.z = _3609;
    }
    if (!_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3674 = as_type<float>(_177);
        out.gl_Position.z = _3674;
    }
    out.m_51.x = _171;
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _461 = _451 + _459;
    float _463 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _465 = int(_463);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _471 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _473 = isnan(_451);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _467);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _489 = float(_455);
    float _491 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _493 = int(_491);
    float _495 = -_481;
    float _497 = _495 + 1.0;
    float _499 = float(_465);
    float _501 = 1.0 / _489;
    float _503 = 1.0 / _499;
    float _505 = float(uint(_493));
    int _507 = ~_493;
    int _509 = _507 + 1;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _513 = _511 != 0;
    float _515 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _517 = int(_515);
    float _519 = _501 * _125;
    int _521 = ~_493;
    int _523 = _521 + 1;
    int _525 = ~_493;
    int _527 = _525 + 1;
    float _529 = 1.0 / _505;
    float _531 = _503 * _125;
    float _533 = 0.0;
    if (_513)
    {
        _533 = 1.0;
    }
    float _535 = _533;
    float _537 = _535;
    if (!_513)
    {
        _537 = 7.345489978790283203125;
    }
    float _539 = _537;
    float _541 = trunc(_519);
    int _543 = int(_541);
    float _545 = float(uint(_517));
    int _547 = ~_517;
    int _549 = _547 + 1;
    float _551 = _539 * _157;
    float _553 = 1.0 / _545;
    int _555 = as_type<int>(_529) + (-2);
    float _557 = trunc(_531);
    int _559 = int(_557);
    float _561 = float(uint(_543));
    float _563 = as_type<float>(_555) * _561;
    float _565 = _561;
    if (_513)
    {
        _565 = 1.0;
    }
    float _567 = _565;
    float _569 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _571 = log2(_569);
    int _573 = as_type<int>(_553) + (-2);
    float _575 = _567;
    if (!_513)
    {
        _575 = 5.839270114898681640625;
    }
    float _577 = _575;
    float _579 = float(uint(_559));
    float _581 = trunc(_563);
    float _583 = precise::max(_581, 0.0);
    uint _586 = uint(_583);
    float _588 = as_type<float>(_573) * _579;
    float _590 = _579;
    if (_513)
    {
        _590 = _157;
    }
    float _592 = _590;
    float _594 = _592;
    if (!_513)
    {
        _594 = _457;
    }
    float _596 = _594;
    float _598 = trunc(_588);
    float _600 = precise::max(_598, 0.0);
    uint _602 = uint(_600);
    float _604 = _571 * _125;
    float _606 = _577 * _596;
    float _608 = floor(_551);
    int _610 = _509 * int(_586);
    int _612 = _610 + _543;
    float _614 = float(uint(_612));
    int _616 = _549 * int(_602);
    int _618 = _616 + _559;
    float _620 = floor(_606);
    float _622 = as_type<float>(_555) * _614;
    float _624 = float(_517);
    float _626 = float(uint(_618));
    float _628 = -_608;
    float _630 = _551 + _628;
    float _632 = trunc(_622);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _640 = _638 != 0;
    float _642 = as_type<float>(_573) * _626;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _646 = _644 != 0;
    float _648 = trunc(_642);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    float _654 = -_620;
    float _656 = _606 + _654;
    float _658 = float(_493);
    float _660 = _630 * _658;
    int _662 = int(_586) + int(_636);
    float _664 = _167 * _125;
    float _666 = float(_543);
    float _668 = 1.0 / _487;
    float _670 = _658 * _664;
    bool _672 = _666 >= _658;
    bool _674 = isnan(_666);
    bool _676 = _672 || _674;
    bool _678 = isnan(_658);
    bool _680 = _676 || _678;
    float _682 = float(_680);
    float _684 = _656 * _624;
    float _686 = float(_559);
    int _688 = _523 * _662;
    int _690 = _688 + _543;
    int _692 = int(_602) + int(_652);
    float _694 = trunc(_660);
    int _696 = int(_694);
    int _698 = ~_517;
    int _700 = _698 + 1;
    float _702 = _624 * _664;
    bool _704 = _686 >= _624;
    bool _706 = isnan(_686);
    bool _708 = _704 || _706;
    bool _710 = isnan(_624);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    bool _716 = !_640;
    int _718 = _716 ? 0 : 1;
    int _720 = _700 * _692;
    int _722 = _720 + _559;
    bool _724 = uint(_690) >= uint(_493);
    float _726 = trunc(_682);
    int _728 = int(_726);
    bool _730 = !_646;
    int _732 = _730 ? 0 : 1;
    int _734 = abs(_718);
    bool _736 = !_724;
    int _738 = _736 ? 0 : (-1);
    bool _740 = uint(_722) >= uint(_517);
    float _742 = trunc(_684);
    int _744 = int(_742);
    int _746 = abs(_732);
    int _748 = ~_662;
    int _750 = _748 + _738;
    int _752 = _750 + 1;
    bool _754 = !_740;
    int _756 = _754 ? 0 : (-1);
    float _758 = trunc(_714);
    int _760 = int(_758);
    int _762 = _696 * _734;
    int _764 = _762 + _543;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _768 = _766 != 0;
    int _770 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _772 = _770 != 0;
    int _774 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _776 = _774 != 0;
    int _778 = _493 * _752;
    int _780 = _778 + _543;
    int _782 = ~_692;
    int _784 = _782 + _756;
    int _786 = _784 + 1;
    bool _788 = _493 == 0;
    bool _790 = _517 == 0;
    int _792 = _517 * _786;
    int _794 = _792 + _559;
    int _796 = ~_728;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    int _802 = _744 * _746;
    int _804 = _802 + _559;
    bool _806 = !_788;
    int _808 = _806 ? _780 : (-1);
    float _810 = trunc(_670);
    int _812 = int(_810);
    bool _814 = !_772;
    int _816 = _814 ? 0 : 1;
    int _818 = ~_760;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    int _824 = _808 * _800;
    bool _826 = !_790;
    int _828 = _826 ? _794 : (-1);
    bool _830 = !_768;
    int _832 = _830 ? 0 : 1;
    float _834 = trunc(_702);
    int _836 = int(_834);
    bool _838 = !_776;
    int _840 = _838 ? 0 : 1;
    int _842 = _828 * _822;
    int _844 = _493 + (-1);
    int _846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _848 = _846 != 0;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _856 = _854 != 0;
    int _858 = abs(_816);
    int _860 = _728 * _844;
    int _862 = _860 + _824;
    int _864 = _517 + (-1);
    bool _866 = !_852;
    int _868 = _866 ? 0 : 1;
    int _870 = abs(_832);
    int _872 = _760 * _864;
    int _874 = _872 + _842;
    int _876 = abs(_868);
    int _878 = _862 * _858;
    bool _880 = !_848;
    int _882 = _880 ? 0 : 1;
    int _884 = _812 * _870;
    int _886 = _884 + _878;
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _890 = _888 != 0;
    int _892 = _874 * _876;
    bool _894 = !_856;
    int _896 = _894 ? 0 : 1;
    int _898 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _900 = _898 != 0;
    int _902 = abs(_882);
    bool _904 = !_890;
    int _906 = _904 ? 0 : 1;
    int _908 = abs(_896);
    int _910 = _836 * _902;
    int _912 = _910 + _892;
    int _914 = abs(_840);
    bool _916 = !_900;
    int _918 = _916 ? 0 : 1;
    int _920 = abs(_906);
    int _922 = abs(_918);
    int _924 = _804 * _908;
    int _926 = _924 + _912;
    int _928 = ~_517;
    int _930 = _928 + 1;
    int _932 = _764 * _914;
    int _934 = _932 + _886;
    int _936 = ~_493;
    int _938 = _936 + 1;
    int _940 = _696 * _920;
    int _942 = _940 + _934;
    int _944 = ~_517;
    int _946 = _944 + 1;
    int _948 = _744 * _922;
    int _950 = _948 + _926;
    float _952 = float(uint(_942));
    float _954 = float(uint(_950));
    float _956 = as_type<float>(_555) * _952;
    float _958 = as_type<float>(_573) * _954;
    int _960 = ~_493;
    int _962 = _960 + 1;
    float _964 = trunc(_956);
    float _966 = precise::max(_964, 0.0);
    uint _968 = uint(_966);
    float _970 = trunc(_958);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    int _976 = _962 * int(_968);
    int _978 = _976 + _942;
    float _980 = float(uint(_978));
    int _982 = _946 * int(_974);
    int _984 = _982 + _950;
    float _986 = as_type<float>(_555) * _980;
    float _988 = float(uint(_984));
    float _990 = trunc(_986);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    float _996 = as_type<float>(_573) * _988;
    float _998 = trunc(_996);
    float _1000 = precise::max(_998, 0.0);
    uint _1002 = uint(_1000);
    int _1004 = int(_968) + int(_994);
    int _1006 = ~_493;
    int _1008 = _1006 + 1;
    int _1010 = _938 * _1004;
    int _1012 = _1010 + _942;
    int _1014 = int(_974) + int(_1002);
    bool _1016 = uint(_1012) >= uint(_493);
    int _1018 = _930 * _1014;
    int _1020 = _1018 + _950;
    bool _1022 = !_1016;
    int _1024 = _1022 ? 0 : (-1);
    bool _1026 = uint(_1020) >= uint(_517);
    int _1028 = ~_1004;
    int _1030 = _1028 + _1024;
    int _1032 = _1030 + 1;
    bool _1034 = !_1026;
    int _1036 = _1034 ? 0 : (-1);
    int _1038 = _493 * _1032;
    int _1040 = _1038 + _942;
    int _1042 = ~_1014;
    int _1044 = _1042 + _1036;
    int _1046 = _1044 + 1;
    bool _1048 = !_788;
    int _1050 = _1048 ? _1040 : (-1);
    int _1052 = _517 * _1046;
    int _1054 = _1052 + _950;
    float _1056 = float(uint(_764));
    int _1058 = _1050 & 3;
    bool _1060 = _1058 != 0;
    bool _1062 = !_790;
    int _1064 = _1062 ? _1054 : (-1);
    float _1066 = as_type<float>(_555) * _1056;
    int _1068 = _1050 & 3;
    bool _1070 = _1068 != 0;
    int _1072 = _1064 & 3;
    bool _1074 = _1072 != 0;
    bool _1076 = uint(_1058) > 1u;
    float _1078 = trunc(_1066);
    float _1080 = precise::max(_1078, 0.0);
    uint _1082 = uint(_1080);
    bool _1084 = uint(_1072) > 1u;
    int _1086 = _1070 ? 0 : 1;
    int _1088 = _1064 & 3;
    bool _1090 = _1088 != 0;
    int _1092 = ~_1086;
    int _1094 = _1092 + 1;
    int _1096 = _1094 + 1;
    int _1098 = _1090 ? 0 : 1;
    bool _1100 = uint(_1072) >= 2u;
    int _1102 = ~_1098;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    int _1108 = _1096;
    int _1110 = _1106;
    if (!_1076)
    {
        int _1112 = ~_1086;
        int _1114 = _1112 + 1;
        _1108 = _1114;
    }
    int _1116 = _1108;
    int _1118 = _1008 * int(_1082);
    int _1120 = _1118 + _764;
    if (!_1084)
    {
        int _1122 = ~_1098;
        int _1124 = _1122 + 1;
        _1110 = _1124;
    }
    int _1126 = _1110;
    float _1128 = in.m_46.x;
    float _1130 = in.m_46.y;
    float _1132 = in.m_46.z;
    bool _1134 = uint(_1058) >= 2u;
    bool _1136 = _1058 != 3;
    float _1138 = float(uint(_1120));
    int _1140 = _1134 ? 0 : 1;
    bool _1142 = _1072 != 3;
    float _1144 = as_type<float>(_555) * _1138;
    int _1146 = ~_1140;
    int _1148 = _1146 + 1;
    int _1150 = _1148 + 1;
    float _1152 = in.m_55.y;
    int _1154 = _1100 ? 0 : 1;
    bool _1156 = _157 > 0.5;
    int _1158 = _1150;
    if (_1136)
    {
        int _1160 = ~_1140;
        int _1162 = _1160 + 1;
        _1158 = _1162;
    }
    int _1164 = _1158;
    int _1166 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1168 = _1166 != 0;
    int _1170 = ~_1154;
    int _1172 = _1170 + 1;
    int _1174 = _1172 + 1;
    int _1176 = _1174;
    if (_1142)
    {
        int _1178 = ~_1154;
        int _1180 = _1178 + 1;
        _1176 = _1180;
    }
    int _1182 = _1176;
    float _1184 = _189 * _1130;
    float _1186 = _195 * _1130;
    float _1188 = _201 * _1130;
    float _1190 = exp2(_604);
    bool _1192 = !_1168;
    int _1194 = _1192 ? 0 : 1;
    float _1196 = fma(_199, _1128, _1188);
    float _1198 = -_217;
    int _1200 = _1156 ? as_type<int>(_1198) : as_type<int>(_217);
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1206 = _1204 != 0;
    float _1208 = fma(_187, _1128, _1184);
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1212 = _1210 != 0;
    float _1214 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1218 = _1216 != 0;
    float _1220 = fma(_193, _1128, _1186);
    float _1222 = trunc(_1144);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    float _1228 = float(uint(_804));
    float _1230 = _157 * 2.0;
    float _1232 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[78].w, _469);
    float _1234 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1236 = -_1190;
    float _1238 = _1236 + 1.0;
    float _1240 = as_type<float>(_573) * _1228;
    int _1242 = abs(_1126);
    float _1244 = -_1234;
    float _1246 = fma(_1214, 2.0, _1244);
    float _1248 = _1152 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1250 = !_1212;
    float _1252 = _1250 ? _217 : as_type<float>(_1200);
    float _1254 = floor(_1230);
    bool _1256 = _1152 > 0.5;
    float _1258 = fma(_1248, -2.0, _1202);
    float _1260 = -_221;
    int _1262 = _1256 ? as_type<int>(_1260) : as_type<int>(_221);
    float _1264 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1258);
    int _1266 = int(_1082) + int(_1226);
    float _1268 = trunc(_1240);
    float _1270 = precise::max(_1268, 0.0);
    uint _1272 = uint(_1270);
    bool _1274 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1276 = isnan(0.0);
    bool _1278 = _1274 || _1276;
    bool _1280 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1282 = _1278 || _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1288 = -_125;
    float _1290 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1246);
    float _1292 = _1282 ? _1238 : 0.0;
    float _1294 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _483);
    bool _1296 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1298 = isnan(1.0);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1304 = _1300 || _1302;
    float _1306 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1308 = 1.0 + _1306;
    int _1310 = ~_517;
    int _1312 = _1310 + 1;
    float _1314 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1232);
    float _1316 = 1.0 / _1286;
    float _1318 = fma(_203, _1132, _1196);
    bool _1320 = !_1218;
    float _1322 = _1320 ? _221 : as_type<float>(_1262);
    float _1324 = -_1314;
    float _1326 = _1324 + 1.0;
    int _1328 = _1312 * int(_1272);
    int _1330 = _1328 + _804;
    bool _1332 = _1254 >= 0.0;
    bool _1334 = isnan(_1254);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan(0.0);
    bool _1340 = _1336 || _1338;
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1344 = _1342 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1346 = 1.0 / _1308;
    float _1348 = fma(_191, _1132, _1208);
    float _1350 = float(uint(_1330));
    int _1352 = _527 * _1266;
    int _1354 = _1352 + _764;
    float _1356 = _1152 * 2.0;
    float _1358 = fma(_197, _1132, _1220);
    int _1360 = _1340 ? 0 : 1;
    float _1362 = as_type<float>(_573) * _1350;
    float _1364 = 1.0 / _1344;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1368 = abs(_1164);
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    if (_1304)
    {
        float _1372 = _1292 * _1346;
        _135 = _1372;
    }
    float _1374 = _135;
    float _1376 = floor(_1356);
    bool _1378 = uint(_1354) >= uint(_493);
    float _1380 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1382 = !_1378;
    int _1384 = _1382 ? 0 : (-1);
    float _1386 = trunc(_1362);
    float _1388 = precise::max(_1386, 0.0);
    uint _1390 = uint(_1388);
    bool _1392 = _1254 > 0.0;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1398 = abs(_1182);
    float _1400 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1402 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1404 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1404;
    bool _1408 = _1376 >= 0.0;
    bool _1410 = isnan(_1376);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan(0.0);
    bool _1416 = _1412 || _1414;
    float _1418 = _1406 * _1316;
    out.m_72.x = _1380;
    out.m_72.y = _1400;
    out.m_72.z = _1402;
    out.m_72.w = _1370;
    int _1420 = _1416 ? 0 : 1;
    bool _1422 = _1376 > 0.0;
    float _1424 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1426 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1424;
    int _1428 = int(_1272) + int(_1390);
    float _1430 = _457 * 2.0;
    int _1432 = ~_1420;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = in.m_66.w;
    float _1440 = _1426 * _1364;
    float _1442 = floor(_1430);
    float _1444 = in.m_64.w;
    bool _1446 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1448 = isnan(_451);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1454 = _1450 || _1452;
    float _1456 = float(_1454);
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1460 = _1458 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    int _1462 = ~_517;
    int _1464 = _1462 + 1;
    int _1466 = ~_1360;
    int _1468 = _1466 + 1;
    int _1470 = _1468 + 1;
    float _1472 = _1460 * _668;
    int _1474 = _1470;
    int _1476 = _1436;
    if (!_1392)
    {
        int _1478 = ~_1360;
        int _1480 = _1478 + 1;
        _1474 = _1480;
    }
    int _1482 = _1474;
    int _1484 = _1464 * _1428;
    int _1486 = _1484 + _804;
    if (!_1422)
    {
        int _1488 = ~_1420;
        int _1490 = _1488 + 1;
        _1476 = _1490;
    }
    int _1492 = _1476;
    float _1494 = _157 + _1152;
    bool _1496 = !_1060;
    int _1498 = _1496 ? 0 : 1;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1502 = _451 + _1500;
    bool _1504 = uint(_1486) >= uint(_517);
    float _1506 = _1494 + (-1.0);
    bool _1508 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1510 = isnan(_451);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    float _1520 = -_1456;
    float _1522 = _1520 + 1.0;
    bool _1524 = !_1504;
    int _1526 = _1524 ? 0 : (-1);
    float _1528 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1532 = _1530 != 0;
    int _1534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1536 = _1534 != 0;
    int _1538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1540 = _1538 != 0;
    float _1542 = -_1518;
    float _1544 = _1542 + 1.0;
    float _1546 = in.m_68.w;
    int _1548 = ~_1428;
    int _1550 = _1548 + _1526;
    int _1552 = _1550 + 1;
    bool _1554 = !_1532;
    int _1556 = _1554 ? 0 : 1;
    bool _1558 = _1442 >= 0.0;
    bool _1560 = isnan(_1442);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan(0.0);
    bool _1566 = _1562 || _1564;
    int _1568 = _517 * _1552;
    int _1570 = _1568 + _804;
    int _1572 = _1566 ? 0 : 1;
    bool _1574 = _1442 > 0.0;
    float _1576 = _1456 * _1544;
    bool _1578 = _451 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1580 = isnan(_451);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = fma(_1418, _1502, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1592 = _481 * _1522;
    float _1594 = fma(_1472, _461, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1596 = _1358 + _1438;
    float _1598 = _1588 * _497;
    float _1600 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1602 = _451 + _1600;
    float _1604 = _1252 + 0.5;
    float _1606 = _1348 + _1444;
    float _1608 = _1590 * _1598;
    float _1610 = -_1588;
    float _1612 = _1610 + 1.0;
    float _1614 = _1318 + _1546;
    float _1616 = -_1294;
    float _1618 = _1616 + 1.0;
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1622 = _1596 + _1620;
    float _1624 = fma(_1604, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1290);
    float _1626 = _1322 + (-0.5);
    float _1628 = fma(_1612, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1608);
    float _1630 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1632 = _1606 + _1630;
    float _1634 = _1622 * _1622;
    float _1636 = -_1626;
    float _1638 = -_1264;
    float _1640 = fma(_1636, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1638);
    float _1642 = -_1618;
    float _1644 = fma(_1252, _1642, _1624);
    float _1646 = fma(_1440, _1602, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1648 = fma(_1594, _1592, _1628);
    float _1650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1652 = _1614 + _1650;
    float _1654 = fma(_1632, _1632, _1634);
    float _1656 = fma(_1322, _1326, _1640);
    float _1658 = fma(_1646, _1576, _1648);
    int _1660 = _1050 >> 31;
    float _1662 = fma(_1652, _1652, _1654);
    int _1664 = ~_1572;
    int _1666 = _1664 + 1;
    int _1668 = _1666 + 1;
    out.m_74.x = _1644;
    out.m_74.y = _1656;
    int _1670 = _1668;
    float _1672 = _1614;
    if (!_1574)
    {
        int _1674 = ~_1572;
        int _1676 = _1674 + 1;
        _1670 = _1676;
    }
    int _1678 = _1670;
    float _1680 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1658);
    int _1682 = _1660 & 3;
    float _1684 = rsqrt(_1662);
    int _1686 = _1064 >> 31;
    int _1688 = _1050 + _1682;
    int _1690 = _1686 & 3;
    bool _1692 = !_1074;
    int _1694 = _1692 ? 0 : 1;
    int _1696 = _1688 >> 2;
    float _1698 = _1622 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1700 = _1058 != 3;
    float _1702 = _431 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1704 = _1064 + _1690;
    float _1706 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1698);
    int _1708 = _1696 << 4;
    int _1710 = _1708 + 368;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _1714 = _1704 >> 2;
    float _1716 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1706);
    uint _1718 = uint(int(uint(_1710) >> uint(2)));
    uint _1720 = uint(int(uint(int(_1718)) >> uint(2)));
    int _1722 = int(_1718) & 3;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[int(_1720)][_1722];
    int _1726 = int(_1718) + 1;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    int _1730 = _1726 & 3;
    float _1732 = (*spvDescriptorSet0.vp_c9)._m0[int(_1728)][_1730];
    float _1734 = _1712 * _1684;
    int _1736 = _1714 << 4;
    int _1738 = _1736 + 656;
    bool _1740 = !_1700;
    int _1742 = _1740 ? 0 : (-1);
    float _1744 = _1622 * _1734;
    bool _1746 = _1072 != 3;
    float _1748 = _1632 * _1734;
    uint _1750 = uint(int(uint(_1738) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    float _1766 = -_1744;
    float _1768 = _1622 + _1766;
    bool _1770 = !_1746;
    int _1772 = _1770 ? 0 : (-1);
    float _1774 = -_1748;
    float _1776 = _1632 + _1774;
    bool _1778 = _1716 >= 0.0;
    float _1780 = _1768 * _1768;
    int _1782 = _1710 + 8;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c9)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[int(_1794)][_1796];
    int _1800 = abs(_1556);
    float _1802 = fma(_1776, _1776, _1780);
    float _1804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1806 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1808 = _1738 + 8;
    uint _1810 = uint(int(uint(_1808) >> uint(2)));
    uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
    int _1814 = int(_1810) & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = int(_1810) + 1;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    int _1822 = _1818 & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1828 = abs(_1694);
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1832 = _1680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1834 = ~_1266;
    int _1836 = _1834 + _1384;
    int _1838 = _1836 + 1;
    float _1840 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1842 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1844 = float(_1678);
    float _1846 = _1652 * _1734;
    int _1848 = _493 * _1838;
    int _1850 = _1848 + _764;
    int _1852 = abs(_1116);
    out.m_76.x = _1840;
    out.m_76.y = _1842;
    out.m_76.z = _1806;
    out.m_76.w = _1832;
    int _1854 = abs(_1498);
    float _1856 = -_1846;
    float _1858 = _1652 + _1856;
    int _1860 = abs(_1742);
    if (_1778)
    {
        out.m_53.x = 0.0;
    }
    float _1862 = float(_1800);
    float _1864 = fma(_1858, _1858, _1802);
    bool _1866 = !_788;
    int _1868 = _1866 ? _1850 : (-1);
    bool _1870 = !_790;
    int _1872 = _1870 ? _1570 : (-1);
    float _1874 = _1862 * _1844;
    float _1876 = sqrt(_1864);
    int _1878 = ~_1852;
    int _1880 = _1878 + 1;
    int _1882 = _1880 + 1;
    int _1884 = ~_1854;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    int _1890 = _1882 * as_type<int>(_1732);
    int _1892 = ~_1242;
    int _1894 = _1892 + 1;
    int _1896 = _1894 + 1;
    int _1898 = _1888 * as_type<int>(_1724);
    int _1900 = _1898 + _1890;
    int _1902 = ~_1828;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    int _1908 = _1896 * as_type<int>(_1764);
    int _1910 = ~_1368;
    int _1912 = _1910 + 1;
    int _1914 = _1912 + 1;
    int _1916 = _1906 * as_type<int>(_1756);
    int _1918 = _1916 + _1908;
    int _1920 = abs(_1772);
    int _1922 = _1914 * as_type<int>(_1790);
    int _1924 = _1922 + _1900;
    int _1926 = ~_1398;
    int _1928 = _1926 + 1;
    int _1930 = _1928 + 1;
    float _1932 = in.m_78.x;
    float _1934 = in.m_78.y;
    float _1936 = in.m_78.z;
    float _1938 = _1684 * _1876;
    bool _1940 = !_1206;
    int _1942 = _1940 ? 0 : 1;
    int _1944 = _1930 * as_type<int>(_1816);
    int _1946 = _1944 + _1918;
    int _1948 = ~_1860;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    float _1954 = _1874 * (-2.0);
    int _1956 = abs(_1194);
    float _1958 = _1702 * _1938;
    int _1960 = ~_1920;
    int _1962 = _1960 + 1;
    int _1964 = _1962 + 1;
    int _1966 = _1952 * as_type<int>(_1798);
    int _1968 = _1966 + _1924;
    int _1970 = abs(_1942);
    int _1972 = ~_1956;
    int _1974 = _1972 + 1;
    int _1976 = _1974 + 1;
    int _1978 = _1964 * as_type<int>(_1824);
    int _1980 = _1978 + _1946;
    int _1982 = ~_1970;
    int _1984 = _1982 + 1;
    int _1986 = _1984 + 1;
    float _1988 = as_type<float>(_1952);
    if (_1778)
    {
        _1988 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1990 = _1988;
    int _1992 = _1968 * _1976;
    float _1994 = fma(_1528, _1954, _1528);
    int _1996 = _1980 * _1986;
    float _1998 = _157 + (-0.5);
    int _2000 = _1868 * _1956;
    int _2002 = _2000 + _1992;
    int _2004 = as_type<int>(_1990);
    if (_1778)
    {
        float _2006 = _1990 * 5.0;
        _2004 = as_type<int>(_2006);
    }
    int _2008 = _2004;
    int _2010 = _1872 * _1970;
    int _2012 = _2010 + _1996;
    float _2014 = fma(_1954, _1932, _1932);
    out.m_80.x = _1958;
    float _2016 = float(_2002);
    float _2018 = float(_2012);
    float _2020 = _1936;
    if (_1778)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6329 = as_type<float>(_2008);
        out.gl_Position.z = _6329;
    }
    float _2022 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2014);
    float _2024 = _1152 + _457;
    out.m_82.x = _2016;
    float _2026 = float(_1482);
    float _2028 = _2024 + (-1.0);
    out.m_82.z = _2018;
    bool _2030 = !_1536;
    int _2032 = _2030 ? 0 : 1;
    bool _2034 = !_1540;
    int _2036 = _2034 ? 0 : 1;
    int _2038 = abs(_2032);
    if (_1778)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2040 = -_1744;
    float _2042 = _1596 + _2040;
    float _2044 = -_1748;
    float _2046 = _1606 + _2044;
    int _2048 = abs(_2036);
    float _2050 = -_1846;
    float _2052 = _1614 + _2050;
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _2042 + _2054;
    float _2058 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2060 = _2046 + _2058;
    float _2062 = float(_2038);
    float _2064 = fma(_1994, _1374, _2022);
    float _2066 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2068 = float(_1492);
    float _2070 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2072 = _2052 + _2070;
    float _2074 = _2062 * _2026;
    float _2076 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2066);
    float _2078 = float(_2048);
    float _2080 = _2064 * 0.15915493667125701904296875;
    float _2082 = fma(_2028, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2084 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2076);
    float _2086 = _1152 + (-0.5);
    float _2088 = _2078 * _2068;
    float _2090 = _2074 * (-2.0);
    float _2092 = _157 + _457;
    bool _2094 = _2084 >= 0.0;
    float _2096 = _2088 * (-2.0);
    float _2098 = fma(_2090, _1934, _1934);
    float _2100 = fma(_2082, _2090, _2082);
    float _2102 = _2092 + (-1.0);
    float _2104 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2098);
    float _2106 = fma(_2096, _1936, _1936);
    float _2108 = _457 + (-0.5);
    float _2110 = fma(_2102, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2112 = fma(_2100, _1374, _2104);
    float _2114 = _2080 * 6.283185482025146484375;
    float _2116 = sin(_2114);
    if (_2094)
    {
        _2020 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2118 = _2020;
    float _2120 = _2112 * 0.15915493667125701904296875;
    float _2122 = fma(_2110, _2096, _2110);
    float _2124 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2106);
    int _2126 = as_type<int>(_2118);
    if (_2094)
    {
        out.m_53.x = 0.0;
    }
    float _2128 = _2080 * 6.283185482025146484375;
    float _2130 = cos(_2128);
    if (_2094)
    {
        float _2132 = _2118 * 5.0;
        _2126 = as_type<int>(_2132);
    }
    int _2134 = _2126;
    float _2136 = fma(_2122, _1374, _2124);
    if (_2094)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6527 = as_type<float>(_2134);
        out.gl_Position.z = _6527;
    }
    float _2138 = _2136 * 0.15915493667125701904296875;
    float _2140 = _2120 * 6.283185482025146484375;
    float _2142 = sin(_2140);
    float _2144 = _2120 * 6.283185482025146484375;
    float _2146 = cos(_2144);
    if (_2094)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2148 = _2138 * 6.283185482025146484375;
    float _2150 = cos(_2148);
    float _2152 = _433 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2154 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _221);
    float _2156 = _2116 * _2142;
    float _2158 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2160 = _2152 * _1938;
    float _2162 = _2130 * _2142;
    float _2164 = _2116 * _2146;
    float _2166 = _2138 * 6.283185482025146484375;
    float _2168 = sin(_2166);
    float _2170 = _2160 * _2154;
    float _2172 = _2130 * _2146;
    float _2174 = _1958 * _2158;
    float _2176 = _2130 * _2150;
    float _2178 = _2146 * _2150;
    float _2180 = _2116 * _2150;
    float _2182 = _2142 * _2150;
    float _2184 = _2176 * _2170;
    float _2186 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2188 = _2186 * 0.5;
    float _2190 = fma(_2168, _2172, _2156);
    float _2192 = -_2164;
    float _2194 = fma(_2168, _2162, _2192);
    float _2196 = -_2170;
    float _2198 = _2168 * _2196;
    float _2200 = -_2162;
    float _2202 = fma(_2168, _2164, _2200);
    float _2204 = fma(_2190, _2174, _2184);
    float _2206 = _2180 * _2170;
    float _2208 = fma(_2178, _2174, _2198);
    float _2210 = fma(_2168, _2156, _2172);
    float _2212 = fma(_2194, _2188, _2204);
    float _2214 = fma(_2202, _2174, _2206);
    float _2216 = fma(_2182, _2188, _2208);
    float _2218 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2220 = fma(_2210, _2188, _2214);
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2224 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2226 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2218);
    float _2228 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2222);
    float _2230 = fma(_2216, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2224);
    float _2232 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2226);
    float _2234 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2228);
    float _2236 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2238 = _2232 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2240 = _2234 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2242 = _2236 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2244 = _1614 + _2238;
    float _2246 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2248 = _1606 + _2240;
    float _2250 = _1596 + _2242;
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2254 = _2244 + _2252;
    float _2256 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2258 = _2248 + _2256;
    float _2260 = _2254 * _2254;
    float _2262 = fma(_2258, _2258, _2260);
    float _2264 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2246);
    float _2266 = sqrt(_2262);
    float _2268 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2264);
    bool _2270 = _2266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = _2246;
    float _2274 = _2248;
    float _2276 = _2264;
    if (!_2270)
    {
        _2272 = _2248;
    }
    float _2278 = _2272;
    float _2280 = _2278;
    if (!_2270)
    {
        _2274 = _2244;
    }
    float _2282 = _2274;
    float _2284 = _2282;
    if (!_2270)
    {
        _2276 = _2250;
    }
    float _2286 = _2276;
    bool _2288 = !_2270;
    float _2290 = _2286;
    if (!_2288)
    {
        float _2292 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2296 = _2266 + _2294;
        float _2298 = _2250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2300 = rsqrt(_2262);
        float _2302 = _2296 * _2292;
        float _2304 = _2302 * 0.15915493667125701904296875;
        float _2306 = _2304 * 6.283185482025146484375;
        float _2308 = cos(_2306);
        float _2310 = _2304 * 6.283185482025146484375;
        float _2312 = sin(_2310);
        float _2314 = _2308 + (-1.0);
        float _2316 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2318 = fma(_2312, _2298, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2320 = fma(_2250, _2308, _2316);
        float _2322 = _2300 * _2318;
        float _2324 = fma(_2258, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2326 = fma(_2254, _2322, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2290 = _2320;
        _2280 = _2324;
        _2284 = _2326;
    }
    float _2328 = _2290;
    float _2330 = _2280;
    float _2332 = _2284;
    float _2334 = -_1596;
    float _2336 = _2334 + _2328;
    float _2338 = -_1606;
    float _2340 = _2338 + _2330;
    float _2342 = _2268 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2344 = -_1614;
    float _2346 = _2344 + _2332;
    float _2348 = _2336 * _2336;
    float _2350 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2352 = 1.0 / _2342;
    float _2354 = fma(_2340, _2340, _2348);
    float _2356 = fma(_2046, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2350);
    bool _2358 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2360 = isnan(0.5);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2366 = _2362 || _2364;
    float _2368 = fma(_2346, _2346, _2354);
    float _2370 = fma(_2052, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2372 = sqrt(_2368);
    float _2374 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _2376 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2378 = isnan(0.5);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2384 = _2380 || _2382;
    float _2386 = _2374 + _2342;
    float _2388 = _2386 * _2352;
    float _2390 = _2388 * 0.5;
    bool _2392 = _2372 > 0.0;
    float _2394 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2396 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2394);
    float _2398 = 1.0 / _2396;
    float _2400 = _2390;
    float _2402 = _2330;
    float _2404 = _2328;
    float _2406 = _2340;
    float _2408 = _2332;
    if (!_2392)
    {
        _2400 = _2332;
    }
    float _2410 = _2400;
    bool _2412 = !_2392;
    float _2414 = _2410;
    if (!_2412)
    {
        float _2416 = _237 * _237;
        float _2418 = rsqrt(_2368);
        float _2420 = fma(_233, _233, _2416);
        float _2422 = fma(_239, _239, _2420);
        float _2424 = sqrt(_2422);
        float _2426 = _2340 * _2418;
        float _2428 = _2336 * _2418;
        float _2430 = _2346 * _2418;
        bool _2432 = _2424 > 0.0;
        float _2434 = _2424;
        _2406 = _2426;
        if (!_2432)
        {
            _2434 = _2332;
        }
        float _2436 = _2434;
        bool _2438 = !_2432;
        _2414 = _2436;
        if (!_2438)
        {
            float _2440 = rsqrt(_2422);
            float _2442 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2444 = _237 * _2440;
            float _2446 = _233 * _2440;
            float _2448 = _2428 * _2444;
            float _2450 = _239 * _2440;
            float _2452 = fma(_2426, _2446, _2448);
            float _2454 = _2442 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2456 = fma(_2430, _2450, _2452);
            float _2458 = _2456 * _2454;
            float _2460 = fma(_233, _2458, _2330);
            float _2462 = fma(_237, _2458, _2328);
            float _2464 = fma(_239, _2458, _2332);
            _2402 = _2460;
            _2404 = _2462;
            _2414 = _2464;
        }
    }
    float _2466 = _2402;
    float _2468 = _2404;
    float _2470 = _2414;
    float _2472 = _2406;
    float _2474 = -_1748;
    float _2476 = _2474 + _2466;
    float _2478 = -_1744;
    float _2480 = _2478 + _2468;
    float _2482 = -_1846;
    float _2484 = _2482 + _2470;
    float _2486 = _2480;
    float _2488 = _2476;
    float _2490 = _2484;
    float _2492 = _2472;
    float _2494 = _2470;
    if (_2384)
    {
        _2408 = 1.0;
    }
    float _2496 = _2408;
    float _2498 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2500 = _2398 * _2498;
    float _2502 = _2496;
    if (!_2366)
    {
        float _2504 = _2056 * _2056;
        float _2506 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2508 = -_1614;
        float _2510 = _2508 + _2470;
        float _2512 = -_1596;
        float _2514 = _2512 + _2468;
        float _2516 = fma(_2060, _2060, _2504);
        float _2518 = -_1606;
        float _2520 = _2518 + _2466;
        float _2522 = fma(_2072, _2072, _2516);
        float _2524 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2526 = sqrt(_2522);
        float _2528 = 1.0 / _1938;
        float _2530 = _2524 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2532 = precise::min(_2526, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2534 = _2532 * _2506;
        float _2536 = _2534 * _2528;
        float _2538 = _2530 * _2536;
        float _2540 = _2510 * _2536;
        float _2542 = fma(_2514, _2538, _2042);
        float _2544 = fma(_2520, _2538, _2046);
        float _2546 = fma(_2530, _2540, _2052);
        _2486 = _2542;
        _2488 = _2544;
        _2490 = _2546;
        _1672 = _2540;
    }
    float _2548 = _2486;
    float _2550 = _2488;
    float _2552 = _2490;
    float _2554 = _1672;
    float _2556 = _2554;
    if (!_2384)
    {
        float _2558 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2560 = _2558 * 0.15915493667125701904296875;
        float _2562 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2564 = _2560 * 6.283185482025146484375;
        float _2566 = cos(_2564);
        float _2568 = _2562 * 0.15915493667125701904296875;
        float _2570 = _2560 * 6.283185482025146484375;
        float _2572 = sin(_2570);
        float _2574 = 1.0 / _2566;
        float _2576 = _2568 * 6.283185482025146484375;
        float _2578 = cos(_2576);
        float _2580 = _2572 * _2574;
        float _2582 = _2568 * 6.283185482025146484375;
        float _2584 = sin(_2582);
        float _2586 = _2578 * _2580;
        float _2588 = 1.0 / _2586;
        float _2590 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2592 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2590;
        float _2594 = 1.0 / _2592;
        float _2596 = _2584 * _2588;
        float _2598 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2600 = fma(_2500, _2596, _2598);
        float _2602 = _2600 * _2594;
        float _2604 = precise::clamp(_2602, 0.0, 1.0);
        _2556 = _2560;
        _2502 = _2604;
    }
    float _2606 = _2556;
    float _2608 = _2502;
    float _2610 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2612 = _2548 + _2610;
    float _2614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2616 = _2550 + _2614;
    float _2618 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2620 = _2552 + _2618;
    float _2622 = _2612 * _2612;
    float _2624 = fma(_2616, _2616, _2622);
    float _2626 = fma(_2620, _2620, _2624);
    float _2628 = rsqrt(_2626);
    float _2630 = sqrt(_2626);
    float _2632 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2634 = _2616 * _2632;
    float _2636 = _2620 * _2632;
    float _2638 = _2634 * _2634;
    float _2640 = _2636 * _2636;
    float _2642 = _2638 + _2640;
    float _2644 = sqrt(_2642);
    bool _2646 = _2644 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2648 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2650 = _2644 + _2648;
    float _2652 = _2620;
    float _2654 = _2642;
    float _2656 = _2650;
    float _2658 = _2606;
    if (_2646)
    {
        float _2660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2652 = _2660;
    }
    float _2662 = _2652;
    if (_2646)
    {
        float _2664 = rsqrt(_2642);
        _2654 = _2664;
    }
    float _2666 = _2654;
    float _2668 = _2666;
    if (_2646)
    {
        float _2670 = _2650 * _2662;
        _2656 = _2670;
    }
    float _2672 = _2656;
    if (_2646)
    {
        float _2674 = _2672 * 0.15915493667125701904296875;
        _2658 = _2674;
    }
    float _2676 = _2658;
    float _2678 = _2662;
    float _2680 = _2676;
    if (_2646)
    {
        float _2682 = _2676 * 6.283185482025146484375;
        float _2684 = sin(_2682);
        _2678 = _2684;
    }
    float _2686 = _2678;
    float _2688 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2690 = precise::max(0.0, _2688);
    float _2692 = _2622;
    float _2694 = _2690;
    if (_2646)
    {
        float _2696 = _2676 * 6.283185482025146484375;
        float _2698 = cos(_2696);
        _2692 = _2698;
    }
    float _2700 = _2692;
    float _2702 = -_2632;
    float _2704 = -_2690;
    float _2706 = fma(_2612, _2702, _2704);
    float _2708 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2646)
    {
        float _2710 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2694 = _2710;
    }
    float _2712 = _2694;
    float _2714 = _2712;
    if (!_2646)
    {
        _2680 = _2634;
    }
    float _2716 = _2680;
    float _2718 = fma(_2046, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2720 = _2686;
    float _2722 = _2716;
    if (_2646)
    {
        float _2724 = fma(_2686, _2712, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2720 = _2724;
    }
    float _2726 = _2720;
    float _2728 = _2726;
    if (!_2646)
    {
        _2714 = _2706;
    }
    float _2730 = _2714;
    float _2732 = _2730;
    float _2734 = _2700;
    if (_2646)
    {
        float _2736 = _2700 + (-1.0);
        _2708 = _2736;
    }
    float _2738 = _2708;
    if (_2646)
    {
        float _2740 = _2666 * _2726;
        _2492 = _2740;
    }
    float _2742 = _2492;
    if (!_2646)
    {
        _2728 = _2638;
    }
    float _2744 = _2728;
    float _2746 = _2744;
    if (_2646)
    {
        float _2748 = _2738 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2494 = _2748;
    }
    float _2750 = _2494;
    if (_2646)
    {
        float _2752 = _2634 * _2742;
        _2722 = _2752;
    }
    float _2754 = _2722;
    if (!_2646)
    {
        _2668 = _2636;
    }
    float _2756 = _2668;
    float _2758 = _2756;
    if (_2646)
    {
        float _2760 = _2636 * _2742;
        _2758 = _2760;
    }
    float _2762 = _2758;
    if (_2646)
    {
        float _2764 = fma(_2706, _2700, _2750);
        _2732 = _2764;
    }
    float _2766 = _2732;
    if (_2646)
    {
        float _2768 = _2754 * _2754;
        _2746 = _2768;
    }
    float _2770 = _2746;
    if (!_2646)
    {
        _2734 = _2640;
    }
    float _2772 = _2734;
    float _2774 = _2772;
    if (_2646)
    {
        float _2776 = _2762 * _2762;
        _2774 = _2776;
    }
    float _2778 = _2774;
    float _2780 = fma(_2766, _2766, _2770);
    float _2782 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2784 = floor(_2718);
    float _2786 = _2780 + _2778;
    float _2788 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2782);
    float _2790 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2792 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2790);
    float _2794 = precise::clamp(_2792, 0.0, 1.0);
    float _2796 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2788);
    float _2798 = rsqrt(_2786);
    float _2800 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2802 = _2796 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2804 = -_2794;
    float _2806 = _2804 + 1.0;
    float _2808 = fma(_2052, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2810 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2812 = _2802 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2814 = abs(_2806);
    float _2816 = log2(_2814);
    float _2818 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2810);
    float _2820 = -_2812;
    float _2822 = fma(_2820, _2800, 1.0);
    float _2824 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2826 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2828 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2818);
    float _2830 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2824);
    float _2832 = _2798 * _2754;
    float _2834 = _2798 * _2766;
    float _2836 = _2798 * _2762;
    float _2838 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2830);
    float _2840 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2842 = _2828 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2844 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2826);
    float _2846 = _2838 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2848 = -_2840;
    float _2850 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2848);
    float _2852 = floor(_2808);
    float _2854 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2856 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2858 = -_2836;
    float _2860 = fma(_2858, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2850);
    float _2862 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2844);
    float _2864 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2856);
    float _2866 = fma(_2860, -0.5, 0.5);
    float _2868 = _2862 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2870 = exp2(_2854);
    float _2872 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2864);
    float _2874 = fma(_2860, 0.5, 0.5);
    float _2876 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2872);
    float _2878 = -_2852;
    float _2880 = _2808 + _2878;
    float _2882 = log2(_2822);
    float _2884 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2886 = fma(_2874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2888 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2884);
    float _2890 = _2834 + 1.0;
    float _2892 = fma(_2874, _2886, -0.212114393711090087890625);
    float _2894 = 1.0 / _2876;
    float _2896 = -_2784;
    float _2898 = _2718 + _2896;
    float _2900 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2902 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2888);
    float _2904 = -_2834;
    float _2906 = fma(_2870, _2890, _2904);
    float _2908 = fma(_2874, _2892, 1.570728778839111328125);
    float _2910 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2900);
    float _2912 = sqrt(_2866);
    float _2914 = _2882 * 0.693147182464599609375;
    float _2916 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2910);
    float2 _7767 = float2(_2898, _2880);
    float _2918 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7767, float2(0.0), isnan(_7767)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7767, float2(0.0), isnan(_7767)), level(0.0)).x;
    float _2920 = fma(_2906, 0.5, 0.5);
    float _2922 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2924 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2916);
    float _2926 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2902);
    float _2928 = _2924 * _2894;
    float _2930 = _2926 * _2894;
    float _2932 = fma(_2928, 0.5, 0.5);
    float _2934 = fma(_2930, -0.5, 0.5);
    float _2936 = _2912 * 0.636619746685028076171875;
    float _2938 = -_2908;
    float _2940 = fma(_2936, _2938, 1.0);
    float3 _7812 = float3(_2932, _2934, _2922);
    float _2942 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7812, float3(0.0), isnan(_7812)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7812, float3(0.0), isnan(_7812)), level(0.0)).x;
    float3 _7823 = float3(_2932, _2934, _2922);
    float4 _2945 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7823, float3(0.0), isnan(_7823)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7823, float3(0.0), isnan(_7823)), level(0.0)).xyzw;
    float _2947 = _2945.x;
    float _2949 = _2945.y;
    float _2951 = _2945.z;
    float _2953 = _2945.w;
    float2 _7839 = float2(_2940, _2920);
    float3 _2957 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7839, float2(0.0), isnan(_7839)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7839, float2(0.0), isnan(_7839)), level(0.0)).xyz;
    float _2959 = _2957.x;
    float _2961 = _2957.y;
    float _2963 = _2957.z;
    float _2965 = abs(_2500);
    float _2967 = log2(_2965);
    float _2969 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2971 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2973 = _2190 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2975 = _221 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2977 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2969);
    float _2979 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2971);
    float _2981 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2973);
    float _2983 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2985 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2987 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2989 = -_2168;
    float _2991 = fma(_2989, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2983);
    float _2993 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2995 = -_2168;
    float _2997 = fma(_2995, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2987);
    float _2999 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3001 = _2967 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3003 = _2194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3005 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2993);
    float _3007 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2999);
    float _3009 = -_2168;
    float _3011 = fma(_3009, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2985);
    float _3013 = fma(_2182, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3003);
    float _3015 = exp2(_3001);
    float _3017 = fma(_2975, _2975, 1.0);
    float _3019 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2991);
    float _3021 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3011);
    float _3023 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2997);
    float _3025 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2977);
    float _3027 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3029 = rsqrt(_3017);
    float _3031 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3007);
    float _3033 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3005);
    float _3035 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3013);
    float _3037 = _2975 * _3019;
    bool _3039 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3041 = isnan(_2630);
    bool _3043 = _3039 || _3041;
    bool _3045 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3047 = _3043 || _3045;
    float _3049 = fma(_3015, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3051 = precise::clamp(_3049, 0.0, 1.0);
    float _3053 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2979);
    float _3055 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3057 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2981);
    float _3059 = fma(_3051, -2.0, 3.0);
    float _3061 = _3051 * _3051;
    float _3063 = fma(_2842, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3055);
    float _3065 = _2975 * _3029;
    float _3067 = _3061 * _3059;
    float _3069 = fma(_2802, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3063);
    float _3071 = fma(_3027, _3025, _3037);
    float _3073 = -_3031;
    float _3075 = _3065 * _3073;
    float _3077 = -_3067;
    float _3079 = _3077 + 1.0;
    float _3081 = _2975 * _3021;
    float _3083 = in.m_84.x;
    float _3085 = fma(_3029, _3019, _3075);
    float _3087 = fma(_3079, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3067);
    float _3089 = -_3033;
    float _3091 = _3065 * _3089;
    out.m_86.x = _3025;
    out.m_86.y = _3053;
    out.m_86.z = _3057;
    float _3093 = fma(_3027, _3053, _3081);
    float _3095 = _2975 * _3023;
    float _3097 = fma(_3029, _3021, _3091);
    float _3099 = fma(_2868, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3069);
    float _3101 = _2816 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3103 = fma(_3027, _3057, _3095);
    float _3105 = _3099 + _2876;
    out.gl_Position.x = _2924;
    out.gl_Position.y = _2926;
    out.gl_Position.z = _3099;
    out.gl_Position.w = _2876;
    float _3107 = exp2(_3101);
    bool _3109 = _2500 <= 8000.0;
    bool _3111 = isnan(_2500);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan(8000.0);
    bool _3117 = _3113 || _3115;
    float _3119 = float(_3117);
    float _3121 = -_3035;
    float _3123 = _3065 * _3121;
    float _3125 = _2924 + _2876;
    float _3127 = _3035 + _3103;
    float _3129 = _3105 * 0.5;
    float _3131 = _3119 * _3087;
    float _3133 = fma(_3029, _3023, _3123);
    float _3135 = _2876 * 0.5;
    float _3137 = _3033 + _3093;
    float _3139 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3141 = fma(_2926, -0.5, _3135);
    float _3143 = _3031 + _3071;
    float _3145 = _3125 * 0.5;
    out.m_88.x = _3085;
    out.m_88.y = _3097;
    out.m_88.z = _3133;
    float _3147 = -_3107;
    float _3149 = _3147 + 1.0;
    float _3151 = _2876;
    float _3153 = _3099;
    float _3155 = _3097;
    float _3157 = _3085;
    if (!_3047)
    {
        _3151 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3159 = _3151;
    out.m_90.x = _3143;
    out.m_90.y = _3137;
    out.m_90.z = _3127;
    float _3161 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3163 = _3159;
    float _3165 = _3159;
    if (!_3047)
    {
        _3153 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3167 = _3153;
    out.m_92.x = _3145;
    out.m_92.y = _3141;
    out.m_92.z = _3129;
    out.m_92.w = _2876;
    float _3169 = -_3161;
    float _3171 = _3169 + 1.0;
    float _3173 = _3171;
    float _3175 = _3167;
    float _3177 = _3167;
    if (!_3047)
    {
        _3155 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3179 = _3155;
    float _3181 = _3179;
    float _3183 = _3179;
    if (!_3047)
    {
        _3157 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3185 = _3157;
    float _3187 = _2608 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3189 = -_2918;
    float _3191 = _3189 + 1.0;
    float _3193 = _3191 * _3139;
    float _3195 = precise::clamp(_3193, 0.0, 1.0);
    float _3197 = -_3195;
    float _3199 = fma(_3197, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3201 = _3199 * _3083;
    float _3203 = _3201 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3205 = _3161 * _2942;
    float _3207 = _2953 * _3171;
    out.m_94.x = _3203;
    float _3209 = _3185;
    float _3211 = _3185;
    if (!_3047)
    {
        _3173 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3213 = _3173;
    float _3215 = _2953 * _3205;
    float _3217 = _2963 * _3205;
    float _3219 = fma(_2959, _3215, _2947);
    float _3221 = fma(_2961, _3215, _2949);
    float _3223 = fma(_2953, _3217, _2951);
    float _3225 = _3215;
    float _3227 = _3213;
    float _3229 = _3213;
    if (!_3047)
    {
        _3225 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3231 = _3225;
    out.m_96.x = _3219;
    out.m_96.y = _3221;
    out.m_96.z = _3223;
    out.m_96.w = _3207;
    bool _3233 = !_3047;
    float _3235 = _3231;
    float _3237 = _3231;
    if (!_3233)
    {
        bool _3239 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3241 = isnan(_2630);
        bool _3243 = _3239 || _3241;
        bool _3245 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3247 = _3243 || _3245;
        if (!_3247)
        {
            float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3251 = _2630 + _3249;
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3255 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3253;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3261 = 1.0 / _3255;
            float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3267 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3269 = _3267 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3271 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3273 = _3271 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3275 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3277 = _3275 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3279 = _3251 * _3261;
            float _3281 = precise::clamp(_3279, 0.0, 1.0);
            float _3283 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3285 = _3283 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3287 = fma(_3281, _3259, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3289 = fma(_3281, _3285, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3291 = fma(_3281, _3265, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3293 = fma(_3281, _3269, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3295 = fma(_3281, _3273, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3297 = fma(_3281, _3277, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3211 = _3291;
            _3237 = _3295;
            _3183 = _3287;
            _3177 = _3293;
            _3165 = _3289;
            _3229 = _3297;
            _3299 = true;
        }
        else
        {
            bool _3301 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3303 = isnan(_2630);
            bool _3305 = _3301 || _3303;
            bool _3307 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3309 = _3305 || _3307;
            if (!_3309)
            {
                _3181 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3311 = _3181;
            _3183 = _3311;
            if (!_3309)
            {
                _3209 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3313 = _3209;
            _3211 = _3313;
            if (!_3309)
            {
                _3163 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3315 = _3163;
            _3165 = _3315;
            if (!_3309)
            {
                _3175 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3317 = _3175;
            _3177 = _3317;
            if (!_3309)
            {
                _3235 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3319 = _3235;
            _3237 = _3319;
            if (!_3309)
            {
                _3227 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3321 = _3227;
            bool _3323 = !_3309;
            _3229 = _3321;
            if (!_3323)
            {
                bool _3325 = _2630 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3327 = isnan(_2630);
                bool _3329 = _3325 || _3327;
                bool _3331 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3333 = _3329 || _3331;
                if (!_3333)
                {
                    float _3335 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3337 = _2630 + _3335;
                    float _3339 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3341 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3339;
                    float _3343 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3345 = _3343 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3347 = 1.0 / _3341;
                    float _3349 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3351 = _3349 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3353 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3355 = _3353 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3357 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3359 = _3357 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3361 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3363 = _3361 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3365 = _3337 * _3347;
                    float _3367 = precise::clamp(_3365, 0.0, 1.0);
                    float _3369 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3373 = fma(_3367, _3345, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3375 = fma(_3367, _3371, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3377 = fma(_3367, _3351, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3379 = fma(_3367, _3355, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3381 = fma(_3367, _3359, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3383 = fma(_3367, _3363, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3211 = _3377;
                    _3237 = _3381;
                    _3183 = _3373;
                    _3177 = _3379;
                    _3165 = _3375;
                    _3229 = _3383;
                    _3299 = true;
                }
                else
                {
                    _3211 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3237 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3183 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3177 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3165 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3229 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3299 = false;
    float _3385 = _3211;
    float _3387 = _3237;
    float _3389 = _3183;
    float _3391 = _3177;
    float _3393 = _3165;
    float _3395 = _3229;
    float _3397 = fma(_3137, -0.5, 0.5);
    float _3399 = precise::clamp(_3397, 0.0, 1.0);
    float _3401 = -_3385;
    float _3403 = _3401 + _3387;
    float _3405 = -_3389;
    float _3407 = _3405 + _3391;
    out.m_98.x = 0.0;
    float _3409 = fma(_3399, _3403, _3385);
    float _3411 = -_3393;
    float _3413 = _3411 + _3395;
    float _3415 = fma(_3399, _3407, _3389);
    float _3417 = _3409 * 0.586610972881317138671875;
    bool _3419 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3421 = fma(_3399, _3413, _3393);
    float _3423 = _3187 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3425 = fma(_3415, 0.298911988735198974609375, _3417);
    bool _3427 = _2608 > 0.0;
    bool _3429 = isnan(_2608);
    bool _3431 = _3427 || _3429;
    bool _3433 = isnan(0.0);
    bool _3435 = _3431 || _3433;
    float _3437 = fma(_3421, 0.114477999508380889892578125, _3425);
    out.m_53.x = _3423;
    float _3439 = -_3437;
    float _3441 = _3415 + _3439;
    float _3443 = -_3437;
    float _3445 = _3409 + _3443;
    float _3447 = -_3437;
    float _3449 = _3421 + _3447;
    float _3451 = fma(_3441, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3453 = fma(_3445, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    float _3455 = fma(_3449, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3437);
    bool _3457 = !_3419;
    if (!_3457)
    {
        float _3459 = -_2548;
        float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3463 = -_2550;
        float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3467 = -_2552;
        float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3471 = _3461 * _3461;
        float _3473 = fma(_3465, _3465, _3471);
        float _3475 = fma(_3469, _3469, _3473);
        float _3477 = sqrt(_3475);
        float _3479 = rsqrt(_3475);
        float _3481 = -_3477;
        float _3483 = _3481 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3485 = _3483 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        float _3489 = _3465 * _3479;
        float _3491 = _3461 * _3479;
        float _3493 = abs(_3487);
        float _3495 = log2(_3493);
        float _3497 = _3469 * _3479;
        float _3499 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3501 = _3137 * _3491;
        float _3503 = -_3491;
        float _3505 = -_3499;
        float _3507 = fma(_3503, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3505);
        float _3509 = fma(_3143, _3489, _3501);
        float _3511 = -_3497;
        float _3513 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3507);
        float _3515 = fma(_3127, _3497, _3509);
        float _3517 = precise::clamp(_3515, 0.0, 1.0);
        float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3521 = _3513 + _3519;
        float _3523 = _3495 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3525 = _3521 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3527 = precise::clamp(_3525, 0.0, 1.0);
        float _3529 = exp2(_3523);
        float _3531 = _3529 * _3527;
        float _3533 = _3517 * _3531;
        float _3535 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3537 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3539 = _3533 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _3535;
        out.m_98.y = _3537;
        out.m_98.z = _3539;
    }
    out.m_100.x = _3451;
    out.m_100.y = _3453;
    out.m_100.z = _3455;
    if (_3435)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3541 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_53.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3541;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

