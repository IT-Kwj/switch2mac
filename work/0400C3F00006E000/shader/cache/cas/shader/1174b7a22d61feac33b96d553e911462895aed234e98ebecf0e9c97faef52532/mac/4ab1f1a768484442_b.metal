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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_60 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_68 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1007 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1609 = as_type<float>(_103);
        out.gl_Position.z = _1609;
    }
    if (!_91)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1678 = as_type<float>(_141);
        out.gl_Position.z = _1678;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _145 = !_143;
    float _163;
    if (!_145)
    {
        float _147 = in.m_51.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_87);
        float _169 = 1.0 / _167;
        float _171 = _121 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = in.m_51.z;
    float _177 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _179 = log2(_177);
    float _181 = in.m_51.x;
    float _183 = in.m_51.y;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _189 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _193;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _199 = _197 != 0;
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _203 = _201 != 0;
    int _205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _207 = _205 != 0;
    float _209 = 1.0 / _187;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _173 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _173 + _215;
    float _219 = 1.0 / _191;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _173 + _221;
    float _225 = _175 * 2.0;
    float _227 = 1.0 / _195;
    float _229 = _223 * _209;
    float _231 = _183 * 2.0;
    float _233 = _181 * 2.0;
    float _235 = _183 + _181;
    float _237 = floor(_225);
    float _239 = _213 * _219;
    float _241 = _183 + _175;
    float _243 = _235 + (-1.0);
    float _245 = _175 + _181;
    float _247 = _175 + (-0.5);
    float _249 = _241 + (-1.0);
    float _251 = floor(_231);
    float _253 = _217 * _227;
    float _255 = _245 + (-1.0);
    bool _257 = _237 > 0.0;
    float _259 = floor(_233);
    bool _261 = _237 >= 0.0;
    bool _263 = isnan(_237);
    bool _265 = _261 || _263;
    bool _267 = isnan(0.0);
    bool _269 = _265 || _267;
    int _271 = _269 ? 0 : 1;
    bool _273 = _251 >= 0.0;
    bool _275 = isnan(_251);
    bool _277 = _273 || _275;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    float _283 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _285 = ~_271;
    int _287 = _285 + 1;
    int _289 = _287 + 1;
    float _291 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _293 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _295 = _289;
    float _297 = _183;
    if (!_257)
    {
        int _299 = ~_271;
        int _301 = _299 + 1;
        _295 = _301;
    }
    int _303 = _295;
    float _305 = _179 * _121;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _311 = _251 > 0.0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    bool _317 = _259 > 0.0;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    bool _323 = _259 >= 0.0;
    bool _325 = isnan(_259);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = fma(_315, _229, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = exp2(_305);
    float _337 = fma(_321, _229, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _343 = !_199;
    int _345 = _343 ? 0 : 1;
    float _347 = fma(_309, _239, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _349 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _351 = isnan(1.0);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _357 = _353 || _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _361 = 1.0 + _359;
    int _363 = abs(_345);
    float _365 = fma(_341, _239, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = in.m_53.x;
    float _369 = in.m_53.y;
    float _371 = in.m_53.z;
    float _373 = 1.0 / _361;
    bool _375 = !_203;
    int _377 = _375 ? 0 : 1;
    int _379 = _331 ? 0 : 1;
    float _381 = -_335;
    float _383 = _381 + 1.0;
    int _385 = abs(_377);
    bool _387 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _389 = isnan(0.0);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _395 = _391 || _393;
    int _397 = ~_379;
    int _399 = _397 + 1;
    int _401 = _399 + 1;
    float _403 = float(_363);
    float _405 = float(_303);
    int _407 = _401;
    if (!_317)
    {
        int _409 = ~_379;
        int _411 = _409 + 1;
        _407 = _411;
    }
    int _413 = _407;
    float _415 = _403 * _405;
    float _417 = _395 ? _383 : 0.0;
    float _419 = float(_385);
    float _421 = _415 * (-2.0);
    int _423 = _281 ? 0 : 1;
    if (_357)
    {
        float _425 = _417 * _373;
        _125 = _425;
    }
    float _427 = _125;
    float _429 = float(_413);
    bool _431 = !_207;
    int _433 = _431 ? 0 : 1;
    int _435 = ~_423;
    int _437 = _435 + 1;
    int _439 = _437 + 1;
    float _441 = _419 * _429;
    int _443 = _439;
    if (!_311)
    {
        int _445 = ~_423;
        int _447 = _445 + 1;
        _443 = _447;
    }
    int _449 = _443;
    float _451 = fma(_293, _421, _293);
    int _453 = abs(_433);
    float _455 = fma(_421, _367, _367);
    bool _457 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _459 = isnan(_173);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = _181 + (-0.5);
    bool _471 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _473 = isnan(_173);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = float(_453);
    float _485 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[196].x, _455);
    float _487 = -_467;
    float _489 = _487 + 1.0;
    bool _491 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _493 = isnan(_173);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -_481;
    float _505 = _503 + 1.0;
    float _507 = float(_449);
    float _509 = fma(_451, _427, _485);
    float _511 = _481 * _489;
    float _513 = _441 * (-2.0);
    bool _515 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _517 = isnan(_173);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = _501 * _505;
    float _529 = _483 * _507;
    float _531 = -_501;
    float _533 = _531 + 1.0;
    float _535 = _183 + (-0.5);
    float _537 = fma(_513, _369, _369);
    float _539 = fma(_291, _513, _291);
    float _541 = _525 * _533;
    float _543 = _529 * (-2.0);
    float _545 = as_type<float>(int(gl_VertexIndex));
    float _547 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[196].y, _537);
    float _549 = _333 * _541;
    float _551 = fma(_543, _371, _371);
    float _553 = fma(_283, _543, _283);
    float _555 = -_525;
    float _557 = _555 + 1.0;
    float _559 = in.m_58.x;
    float _561 = in.m_58.y;
    float _563 = _337 * _541;
    float _565 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[196].z, _551);
    float _567 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _549);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _569;
    float _573 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _563);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _575;
    float _579 = fma(_539, _427, _547);
    float _581 = fma(_553, _427, _565);
    float _583 = fma(_365, _527, _573);
    float _585 = fma(_577, _253, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _587 = _509 * 0.15915493667125701904296875;
    float _589 = _579 * 0.15915493667125701904296875;
    float _591 = fma(_571, _253, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _593 = fma(_347, _527, _567);
    float _595 = _581 * 0.15915493667125701904296875;
    float _597 = fma(_585, _511, _583);
    float _599 = _587 * 6.283185482025146484375;
    float _601 = sin(_599);
    int _603 = as_type<int>(_545) & 1;
    bool _605 = _603 != 0;
    int _607 = as_type<int>(_545) & 2;
    bool _609 = _607 != 0;
    float _611 = fma(_591, _511, _593);
    float _613 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[146].y, _597);
    float _615 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[146].x, _611);
    bool _617 = !_609;
    float _619 = _617 ? (-0.5) : 0.5;
    float _621 = _587 * 6.283185482025146484375;
    float _623 = cos(_621);
    float _625 = _613 * _561;
    bool _627 = !_605;
    float _629 = _627 ? (-0.5) : 0.5;
    float _631 = _615 * _559;
    float _633 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _619);
    float _635 = in.m_44.x;
    float _637 = in.m_44.y;
    float _639 = in.m_44.z;
    float _641 = _625 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _629);
    float _645 = _589 * 6.283185482025146484375;
    float _647 = sin(_645);
    float _649 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _651 = _181 > 0.5;
    float _653 = _649 * _643;
    float _655 = _589 * 6.283185482025146484375;
    float _657 = cos(_655);
    float _659 = _595 * 6.283185482025146484375;
    float _661 = cos(_659);
    float _663 = _623 * _647;
    float _665 = _601 * _647;
    float _667 = _595 * 6.283185482025146484375;
    float _669 = sin(_667);
    float _671 = _601 * _657;
    float _673 = _647 * _661;
    float _675 = _641 * _633;
    float _677 = _623 * _657;
    float _679 = _657 * _661;
    float _681 = _661 * _675;
    float _683 = -_663;
    float _685 = fma(_669, _671, _683);
    float _687 = -_671;
    float _689 = fma(_669, _663, _687);
    float _691 = fma(_669, _677, _665);
    float _693 = _623 * _681;
    float _695 = fma(_669, _665, _677);
    float _697 = _601 * _681;
    float _699 = -_675;
    float _701 = _669 * _699;
    float _703 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _705 = fma(_691, _653, _693);
    float _707 = fma(_685, _653, _697);
    float _709 = fma(_679, _653, _701);
    float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _713 = fma(_689, _703, _705);
    float _715 = fma(_695, _703, _707);
    float _717 = fma(_673, _703, _709);
    float _719 = _637 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _721 = _637 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _723 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _727 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[4].x, _719);
    float _729 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[6].x, _721);
    float _731 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _723);
    float _733 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _725);
    float _735 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[4].z, _727);
    float _737 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[6].z, _729);
    float _739 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].z, _731);
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].z, _733);
    float _743 = _735 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _745 = _737 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _747 = _739 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _749 = _741 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _751 = _637 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _753 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _755 = _743 + _747;
    float _757 = _745 + _749;
    float _759 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[5].x, _751);
    float _761 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _753);
    float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _765 = _755 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _769 = _757 + _767;
    float _771 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[5].z, _759);
    float _773 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].z, _761);
    float _775 = _765 * _765;
    float _777 = _769 * _769;
    float _779 = _771 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _781 = _773 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _783 = _775 + _777;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    float _789 = -_629;
    float _791 = _651 ? _789 : _629;
    float _793 = sqrt(_783);
    float _795 = _779 + _781;
    bool _797 = _183 > 0.5;
    bool _799 = !_787;
    float _801 = _799 ? _629 : _791;
    bool _803 = _793 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _805 = _629;
    float _807 = _771;
    float _809 = _791;
    float _811 = _755;
    float _813 = _775;
    if (!_803)
    {
        _805 = _755;
    }
    float _815 = _805;
    float _817 = _815;
    if (!_803)
    {
        _807 = _777;
    }
    float _819 = _807;
    float _821 = _819;
    if (!_803)
    {
        _809 = _775;
    }
    float _823 = _809;
    float _825 = _823;
    if (!_803)
    {
        _297 = _757;
    }
    float _827 = _297;
    float _829 = _827;
    if (!_803)
    {
        _811 = _795;
    }
    float _831 = _811;
    bool _833 = !_803;
    float _835 = _831;
    if (!_833)
    {
        float _837 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _839 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _841 = _793 + _839;
        float _843 = _795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _845 = rsqrt(_783);
        float _847 = _841 * _837;
        float _849 = _847 * 0.15915493667125701904296875;
        float _851 = _849 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = _849 * 6.283185482025146484375;
        float _857 = cos(_855);
        float _859 = fma(_853, _843, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _861 = _845 * _859;
        float _863 = _857 + (-1.0);
        float _865 = fma(_765, _861, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _867 = fma(_769, _861, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _869 = _863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _873 = _865 + _871;
        float _875 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _877 = _867 + _875;
        float _879 = fma(_795, _857, _869);
        float _881 = _873 * _873;
        float _883 = _877 * _877;
        _835 = _879;
        _825 = _881;
        _821 = _883;
        _817 = _865;
        _829 = _867;
    }
    float _885 = _835;
    float _887 = _825;
    float _889 = _821;
    float _891 = _817;
    float _893 = _829;
    float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _897 = _885 + _895;
    float _899 = _801 + 0.5;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _903 = _901 != 0;
    float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _907 = -_619;
    int _909 = _797 ? as_type<int>(_907) : as_type<int>(_619);
    float _911 = fma(_897, _897, _887);
    float _913 = _899 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _915 = !_903;
    float _917 = _915 ? _619 : as_type<float>(_909);
    float _919 = _911 + _889;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _923 = -_917;
    float _925 = _923 + 0.5;
    float _927 = sqrt(_919);
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _939 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _941 = _913 * _711;
    float _943 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _947 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _949 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _953 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _955 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = _939 * _905;
    bool _959 = _927 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _961 = isnan(_927);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _967 = _963 || _965;
    out.m_60.x = _947;
    out.m_60.y = _949;
    out.m_60.z = _951;
    out.m_60.w = _945;
    out.m_62.x = _943;
    out.m_62.y = _953;
    out.m_62.z = _955;
    out.m_64.x = _941;
    out.m_64.y = _957;
    float _969 = _935;
    float _971 = _937;
    if (!_967)
    {
        _969 = 1.0;
    }
    float _973 = _969;
    bool _975 = !_967;
    float _977 = _973;
    if (!_975)
    {
        bool _979 = _927 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _981 = isnan(_927);
        bool _983 = _979 || _981;
        bool _985 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _987 = _983 || _985;
        if (!_987)
        {
            float _989 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _991 = _927 + _989;
            float _993 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _995 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _993;
            float _997 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _999 = _997 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1001 = 1.0 / _995;
            float _1003 = _991 * _1001;
            float _1005 = fma(_1003, _999, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _977 = _1005;
            _1007 = true;
        }
        else
        {
            bool _1009 = _927 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1011 = isnan(_927);
            bool _1013 = _1009 || _1011;
            bool _1015 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1017 = _1013 || _1015;
            if (!_1017)
            {
                float _1019 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1021 = _927 + _1019;
                float _1023 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1025 = _1023 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1027 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1029 = _1027 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1031 = 1.0 / _1025;
                float _1033 = _1021 * _1031;
                float _1035 = fma(_1033, _1029, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _977 = _1035;
                _1007 = true;
            }
            else
            {
                _977 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1007 = false;
    float _1037 = _977;
    float _1039 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1041 = _885 + _1039;
    float _1043 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1045 = _891 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1049 = _893 + _1047;
    float _1051 = fma(_1041, _1037, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1053 = fma(_1045, _1037, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1055 = fma(_1049, _1037, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1059 = _1051 + _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1063 = _1053 + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1067 = _1055 + _1065;
    float _1069 = _1059 * _1059;
    float _1071 = fma(_1063, _1063, _1069);
    float _1073 = fma(_1067, _1067, _1071);
    float _1075 = rsqrt(_1073);
    float _1077 = sqrt(_1073);
    float _1079 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1081 = _1063 * _1079;
    float _1083 = _1067 * _1079;
    float _1085 = _1081 * _1081;
    float _1087 = _1083 * _1083;
    float _1089 = _1085 + _1087;
    float _1091 = sqrt(_1089);
    bool _1093 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1097 = _1091 + _1095;
    float _1099 = _1067;
    float _1101 = _1069;
    float _1103 = _1097;
    float _1105 = _1037;
    float _1107 = _1059;
    float _1109 = _1081;
    if (_1093)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1099 = _1111;
    }
    float _1113 = _1099;
    if (_1093)
    {
        float _1115 = rsqrt(_1089);
        _1101 = _1115;
    }
    float _1117 = _1101;
    float _1119 = _1117;
    if (_1093)
    {
        float _1121 = _1097 * _1113;
        _1103 = _1121;
    }
    float _1123 = _1103;
    if (_1093)
    {
        float _1125 = _1123 * 0.15915493667125701904296875;
        _1105 = _1125;
    }
    float _1127 = _1105;
    float _1129 = _1075;
    if (_1093)
    {
        float _1131 = _1127 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        _1129 = _1133;
    }
    float _1135 = _1129;
    float _1137 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1139 = precise::max(0.0, _1137);
    float _1141 = _1113;
    float _1143 = _1139;
    if (_1093)
    {
        float _1145 = _1127 * 6.283185482025146484375;
        float _1147 = cos(_1145);
        _1141 = _1147;
    }
    float _1149 = _1141;
    float _1151 = -_1079;
    float _1153 = -_1139;
    float _1155 = fma(_1059, _1151, _1153);
    if (_1093)
    {
        float _1157 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1107 = _1157;
    }
    float _1159 = _1107;
    float _1161 = _1135;
    float _1163 = _1159;
    if (_1093)
    {
        float _1165 = fma(_1135, _1159, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = _1167;
    if (!_1093)
    {
        _1163 = _1087;
    }
    float _1171 = _1163;
    float _1173 = _1171;
    if (_1093)
    {
        float _1175 = _1149 + (-1.0);
        _1143 = _1175;
    }
    float _1177 = _1143;
    float _1179 = _1177;
    if (_1093)
    {
        float _1181 = _1117 * _1167;
        _813 = _1181;
    }
    float _1183 = _813;
    if (!_1093)
    {
        _1119 = _1155;
    }
    float _1185 = _1119;
    float _1187 = _1185;
    if (_1093)
    {
        float _1189 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _971 = _1189;
    }
    float _1191 = _971;
    if (_1093)
    {
        float _1193 = _1081 * _1183;
        _1109 = _1193;
    }
    float _1195 = _1109;
    if (!_1093)
    {
        _1169 = _1083;
    }
    float _1197 = _1169;
    float _1199 = _1197;
    if (_1093)
    {
        float _1201 = _1083 * _1183;
        _1199 = _1201;
    }
    float _1203 = _1199;
    if (!_1093)
    {
        _1179 = _1085;
    }
    float _1205 = _1179;
    float _1207 = _1205;
    if (_1093)
    {
        float _1209 = fma(_1155, _1149, _1191);
        _1187 = _1209;
    }
    float _1211 = _1187;
    if (_1093)
    {
        float _1213 = _1195 * _1195;
        _1207 = _1213;
    }
    float _1215 = _1207;
    if (_1093)
    {
        float _1217 = _1203 * _1203;
        _1173 = _1217;
    }
    float _1219 = _1173;
    float _1221 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = fma(_1211, _1211, _1215);
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1227 = fma(_1077, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1225);
    float _1229 = precise::clamp(_1227, 0.0, 1.0);
    float _1231 = _1223 + _1219;
    float _1233 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1235 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1237 = -_1229;
    float _1239 = _1237 + 1.0;
    float _1241 = rsqrt(_1231);
    float _1243 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1233);
    float _1245 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1247 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1235);
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1251 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1243);
    float _1253 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1245);
    float _1255 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1247);
    float _1257 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1259 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1261 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1253);
    float _1263 = abs(_1239);
    float _1265 = log2(_1263);
    float _1267 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1269 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1257);
    float _1271 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1273 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1275 = _1241 * _1195;
    float _1277 = _1241 * _1211;
    float _1279 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1281 = _1241 * _1203;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1285 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1287 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1279);
    float _1289 = -_1273;
    float _1291 = fma(_1289, _1249, 1.0);
    float _1293 = -_1283;
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1293);
    float _1297 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1299 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1287);
    float _1301 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1303 = -_1281;
    float _1305 = fma(_1303, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1295);
    float _1307 = log2(_1291);
    float _1309 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1299);
    float _1311 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1313 = fma(_1305, -0.5, 0.5);
    float _1315 = fma(_1305, 0.5, 0.5);
    float _1317 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1297);
    float _1319 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1311);
    float _1321 = exp2(_1301);
    float _1323 = _1277 + 1.0;
    float _1325 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1317);
    float _1327 = fma(_1315, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1329 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1331 = fma(_1315, _1327, -0.212114393711090087890625);
    float _1333 = 1.0 / _1309;
    float _1335 = _1307 * 0.693147182464599609375;
    float _1337 = fma(_1315, _1331, 1.570728778839111328125);
    float _1339 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1341 = sqrt(_1313);
    float _1343 = -_1277;
    float _1345 = fma(_1321, _1323, _1343);
    float _1347 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1325);
    float _1349 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1329);
    float _1351 = fma(_1345, 0.5, 0.5);
    float _1353 = _1347 * _1333;
    float _1355 = _1349 * _1333;
    float _1357 = fma(_1353, 0.5, 0.5);
    float _1359 = fma(_1355, -0.5, 0.5);
    float _1361 = _1341 * 0.636619746685028076171875;
    float _1363 = -_1337;
    float _1365 = fma(_1361, _1363, 1.0);
    float3 _3641 = float3(_1357, _1359, _1339);
    float _1367 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3641, float3(0.0), isnan(_3641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3641, float3(0.0), isnan(_3641)), level(0.0)).x;
    float3 _3652 = float3(_1357, _1359, _1339);
    float4 _1370 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3652, float3(0.0), isnan(_3652)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3652, float3(0.0), isnan(_3652)), level(0.0)).xyzw;
    float _1372 = _1370.x;
    float _1374 = _1370.y;
    float _1376 = _1370.z;
    float _1378 = _1370.w;
    float2 _3669 = float2(_1365, _1351);
    float3 _1382 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3669, float2(0.0), isnan(_3669)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3669, float2(0.0), isnan(_3669)), level(0.0)).xyz;
    float _1384 = _1382.x;
    float _1386 = _1382.y;
    float _1388 = _1382.z;
    float _1390 = _779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1392 = _779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1394 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1396 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1390);
    float _1398 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1392);
    float _1400 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1402 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1396);
    float _1404 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1398);
    float _1406 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1400);
    float _1408 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1410 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1412 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1406);
    float _1414 = 1.0 / _1408;
    bool _1416 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan(0.5);
    bool _1424 = _1420 || _1422;
    float _1426 = _1410 + _1408;
    float _1428 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1412);
    float _1430 = exp2(_1394);
    float _1432 = _1400;
    if (_1424)
    {
        _1432 = 1.0;
    }
    float _1434 = _1432;
    float _1436 = _1426 * _1414;
    float _1438 = _1436 * 0.5;
    float _1440 = _1434;
    if (!_1424)
    {
        float _1442 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1444 = _1442 * 0.15915493667125701904296875;
        float _1446 = _1444 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        float _1450 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1444 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1460 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1458);
        float _1462 = 1.0 / _1448;
        float _1464 = _1452 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = _1456 * _1462;
        float _1470 = 1.0 / _1460;
        float _1472 = _1466 * _1468;
        float _1474 = _1452 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1478;
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1484 = _1470 * _1482;
        float _1486 = 1.0 / _1472;
        float _1488 = 1.0 / _1480;
        float _1490 = _1476 * _1486;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = fma(_1490, _1484, _1492);
        float _1496 = _1494 * _1488;
        float _1498 = precise::clamp(_1496, 0.0, 1.0);
        _1440 = _1498;
    }
    float _1500 = _1440;
    float _1502 = -_1430;
    float _1504 = _1502 + 1.0;
    bool _1506 = _1500 > 0.0;
    bool _1508 = isnan(_1500);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(0.0);
    bool _1514 = _1510 || _1512;
    float _1516 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1518 = _1428 + _1309;
    float _1520 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1522 = _1347 + _1309;
    float _1524 = _1309 * 0.5;
    out.gl_Position.x = _1347;
    out.gl_Position.y = _1349;
    out.gl_Position.z = _1428;
    out.gl_Position.w = _1309;
    float _1526 = _1520 * _1367;
    float _1528 = -_1520;
    float _1530 = _1528 + 1.0;
    float _1532 = _1518 * 0.5;
    float _1534 = _1378 * _1526;
    float _1536 = _1388 * _1526;
    float _1538 = _1522 * 0.5;
    float _1540 = fma(_1349, -0.5, _1524);
    float _1542 = fma(_1384, _1534, _1372);
    float _1544 = _1516 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1546 = fma(_1386, _1534, _1374);
    float _1548 = _1378 * _1530;
    float _1550 = fma(_1378, _1536, _1376);
    out.m_66.x = _1538;
    out.m_66.y = _1540;
    out.m_66.z = _1532;
    out.m_66.w = _1309;
    out.m_47.x = _1544;
    out.m_68.x = _1542;
    out.m_68.y = _1546;
    out.m_68.z = _1550;
    out.m_68.w = _1548;
    if (_1514)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1552 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1552;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1007 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1609 = as_type<float>(_103);
        out.gl_Position.z = _1609;
    }
    if (!_91)
    {
        return out;
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1678 = as_type<float>(_141);
        out.gl_Position.z = _1678;
    }
    if (_135)
    {
        return out;
    }
    bool _143 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _145 = !_143;
    float _163;
    if (!_145)
    {
        float _147 = in.m_51.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_87);
        float _169 = 1.0 / _167;
        float _171 = _121 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = in.m_51.z;
    float _177 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _179 = log2(_177);
    float _181 = in.m_51.x;
    float _183 = in.m_51.y;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _189 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _193;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _199 = _197 != 0;
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _203 = _201 != 0;
    int _205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _207 = _205 != 0;
    float _209 = 1.0 / _187;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _173 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _173 + _215;
    float _219 = 1.0 / _191;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _173 + _221;
    float _225 = _175 * 2.0;
    float _227 = 1.0 / _195;
    float _229 = _223 * _209;
    float _231 = _183 * 2.0;
    float _233 = _181 * 2.0;
    float _235 = _183 + _181;
    float _237 = floor(_225);
    float _239 = _213 * _219;
    float _241 = _183 + _175;
    float _243 = _235 + (-1.0);
    float _245 = _175 + _181;
    float _247 = _175 + (-0.5);
    float _249 = _241 + (-1.0);
    float _251 = floor(_231);
    float _253 = _217 * _227;
    float _255 = _245 + (-1.0);
    bool _257 = _237 > 0.0;
    float _259 = floor(_233);
    bool _261 = _237 >= 0.0;
    bool _263 = isnan(_237);
    bool _265 = _261 || _263;
    bool _267 = isnan(0.0);
    bool _269 = _265 || _267;
    int _271 = _269 ? 0 : 1;
    bool _273 = _251 >= 0.0;
    bool _275 = isnan(_251);
    bool _277 = _273 || _275;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    float _283 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _285 = ~_271;
    int _287 = _285 + 1;
    int _289 = _287 + 1;
    float _291 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _293 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _295 = _289;
    float _297 = _183;
    if (!_257)
    {
        int _299 = ~_271;
        int _301 = _299 + 1;
        _295 = _301;
    }
    int _303 = _295;
    float _305 = _179 * _121;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _311 = _251 > 0.0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    bool _317 = _259 > 0.0;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    bool _323 = _259 >= 0.0;
    bool _325 = isnan(_259);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = fma(_315, _229, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = exp2(_305);
    float _337 = fma(_321, _229, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _343 = !_199;
    int _345 = _343 ? 0 : 1;
    float _347 = fma(_309, _239, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _349 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _351 = isnan(1.0);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _357 = _353 || _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _361 = 1.0 + _359;
    int _363 = abs(_345);
    float _365 = fma(_341, _239, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = in.m_53.x;
    float _369 = in.m_53.y;
    float _371 = in.m_53.z;
    float _373 = 1.0 / _361;
    bool _375 = !_203;
    int _377 = _375 ? 0 : 1;
    int _379 = _331 ? 0 : 1;
    float _381 = -_335;
    float _383 = _381 + 1.0;
    int _385 = abs(_377);
    bool _387 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _389 = isnan(0.0);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _395 = _391 || _393;
    int _397 = ~_379;
    int _399 = _397 + 1;
    int _401 = _399 + 1;
    float _403 = float(_363);
    float _405 = float(_303);
    int _407 = _401;
    if (!_317)
    {
        int _409 = ~_379;
        int _411 = _409 + 1;
        _407 = _411;
    }
    int _413 = _407;
    float _415 = _403 * _405;
    float _417 = _395 ? _383 : 0.0;
    float _419 = float(_385);
    float _421 = _415 * (-2.0);
    int _423 = _281 ? 0 : 1;
    if (_357)
    {
        float _425 = _417 * _373;
        _125 = _425;
    }
    float _427 = _125;
    float _429 = float(_413);
    bool _431 = !_207;
    int _433 = _431 ? 0 : 1;
    int _435 = ~_423;
    int _437 = _435 + 1;
    int _439 = _437 + 1;
    float _441 = _419 * _429;
    int _443 = _439;
    if (!_311)
    {
        int _445 = ~_423;
        int _447 = _445 + 1;
        _443 = _447;
    }
    int _449 = _443;
    float _451 = fma(_293, _421, _293);
    int _453 = abs(_433);
    float _455 = fma(_421, _367, _367);
    bool _457 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _459 = isnan(_173);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = _181 + (-0.5);
    bool _471 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _473 = isnan(_173);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = float(_453);
    float _485 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[196].x, _455);
    float _487 = -_467;
    float _489 = _487 + 1.0;
    bool _491 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _493 = isnan(_173);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -_481;
    float _505 = _503 + 1.0;
    float _507 = float(_449);
    float _509 = fma(_451, _427, _485);
    float _511 = _481 * _489;
    float _513 = _441 * (-2.0);
    bool _515 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _517 = isnan(_173);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = _501 * _505;
    float _529 = _483 * _507;
    float _531 = -_501;
    float _533 = _531 + 1.0;
    float _535 = _183 + (-0.5);
    float _537 = fma(_513, _369, _369);
    float _539 = fma(_291, _513, _291);
    float _541 = _525 * _533;
    float _543 = _529 * (-2.0);
    float _545 = as_type<float>(int(gl_VertexIndex));
    float _547 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[196].y, _537);
    float _549 = _333 * _541;
    float _551 = fma(_543, _371, _371);
    float _553 = fma(_283, _543, _283);
    float _555 = -_525;
    float _557 = _555 + 1.0;
    float _559 = in.m_58.x;
    float _561 = in.m_58.y;
    float _563 = _337 * _541;
    float _565 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[196].z, _551);
    float _567 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _549);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _569;
    float _573 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _563);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _575;
    float _579 = fma(_539, _427, _547);
    float _581 = fma(_553, _427, _565);
    float _583 = fma(_365, _527, _573);
    float _585 = fma(_577, _253, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _587 = _509 * 0.15915493667125701904296875;
    float _589 = _579 * 0.15915493667125701904296875;
    float _591 = fma(_571, _253, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _593 = fma(_347, _527, _567);
    float _595 = _581 * 0.15915493667125701904296875;
    float _597 = fma(_585, _511, _583);
    float _599 = _587 * 6.283185482025146484375;
    float _601 = sin(_599);
    int _603 = as_type<int>(_545) & 1;
    bool _605 = _603 != 0;
    int _607 = as_type<int>(_545) & 2;
    bool _609 = _607 != 0;
    float _611 = fma(_591, _511, _593);
    float _613 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[146].y, _597);
    float _615 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[146].x, _611);
    bool _617 = !_609;
    float _619 = _617 ? (-0.5) : 0.5;
    float _621 = _587 * 6.283185482025146484375;
    float _623 = cos(_621);
    float _625 = _613 * _561;
    bool _627 = !_605;
    float _629 = _627 ? (-0.5) : 0.5;
    float _631 = _615 * _559;
    float _633 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _619);
    float _635 = in.m_44.x;
    float _637 = in.m_44.y;
    float _639 = in.m_44.z;
    float _641 = _625 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _629);
    float _645 = _589 * 6.283185482025146484375;
    float _647 = sin(_645);
    float _649 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _651 = _181 > 0.5;
    float _653 = _649 * _643;
    float _655 = _589 * 6.283185482025146484375;
    float _657 = cos(_655);
    float _659 = _595 * 6.283185482025146484375;
    float _661 = cos(_659);
    float _663 = _623 * _647;
    float _665 = _601 * _647;
    float _667 = _595 * 6.283185482025146484375;
    float _669 = sin(_667);
    float _671 = _601 * _657;
    float _673 = _647 * _661;
    float _675 = _641 * _633;
    float _677 = _623 * _657;
    float _679 = _657 * _661;
    float _681 = _661 * _675;
    float _683 = -_663;
    float _685 = fma(_669, _671, _683);
    float _687 = -_671;
    float _689 = fma(_669, _663, _687);
    float _691 = fma(_669, _677, _665);
    float _693 = _623 * _681;
    float _695 = fma(_669, _665, _677);
    float _697 = _601 * _681;
    float _699 = -_675;
    float _701 = _669 * _699;
    float _703 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _705 = fma(_691, _653, _693);
    float _707 = fma(_685, _653, _697);
    float _709 = fma(_679, _653, _701);
    float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _713 = fma(_689, _703, _705);
    float _715 = fma(_695, _703, _707);
    float _717 = fma(_673, _703, _709);
    float _719 = _637 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _721 = _637 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _723 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _727 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[4].x, _719);
    float _729 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[6].x, _721);
    float _731 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _723);
    float _733 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _725);
    float _735 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[4].z, _727);
    float _737 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[6].z, _729);
    float _739 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].z, _731);
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].z, _733);
    float _743 = _735 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _745 = _737 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _747 = _739 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _749 = _741 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _751 = _637 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _753 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _755 = _743 + _747;
    float _757 = _745 + _749;
    float _759 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[5].x, _751);
    float _761 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _753);
    float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _765 = _755 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _769 = _757 + _767;
    float _771 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[5].z, _759);
    float _773 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].z, _761);
    float _775 = _765 * _765;
    float _777 = _769 * _769;
    float _779 = _771 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _781 = _773 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _783 = _775 + _777;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    float _789 = -_629;
    float _791 = _651 ? _789 : _629;
    float _793 = sqrt(_783);
    float _795 = _779 + _781;
    bool _797 = _183 > 0.5;
    bool _799 = !_787;
    float _801 = _799 ? _629 : _791;
    bool _803 = _793 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _805 = _629;
    float _807 = _771;
    float _809 = _791;
    float _811 = _755;
    float _813 = _775;
    if (!_803)
    {
        _805 = _755;
    }
    float _815 = _805;
    float _817 = _815;
    if (!_803)
    {
        _807 = _777;
    }
    float _819 = _807;
    float _821 = _819;
    if (!_803)
    {
        _809 = _775;
    }
    float _823 = _809;
    float _825 = _823;
    if (!_803)
    {
        _297 = _757;
    }
    float _827 = _297;
    float _829 = _827;
    if (!_803)
    {
        _811 = _795;
    }
    float _831 = _811;
    bool _833 = !_803;
    float _835 = _831;
    if (!_833)
    {
        float _837 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _839 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _841 = _793 + _839;
        float _843 = _795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _845 = rsqrt(_783);
        float _847 = _841 * _837;
        float _849 = _847 * 0.15915493667125701904296875;
        float _851 = _849 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = _849 * 6.283185482025146484375;
        float _857 = cos(_855);
        float _859 = fma(_853, _843, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _861 = _845 * _859;
        float _863 = _857 + (-1.0);
        float _865 = fma(_765, _861, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _867 = fma(_769, _861, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _869 = _863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _873 = _865 + _871;
        float _875 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _877 = _867 + _875;
        float _879 = fma(_795, _857, _869);
        float _881 = _873 * _873;
        float _883 = _877 * _877;
        _835 = _879;
        _825 = _881;
        _821 = _883;
        _817 = _865;
        _829 = _867;
    }
    float _885 = _835;
    float _887 = _825;
    float _889 = _821;
    float _891 = _817;
    float _893 = _829;
    float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _897 = _885 + _895;
    float _899 = _801 + 0.5;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _903 = _901 != 0;
    float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _907 = -_619;
    int _909 = _797 ? as_type<int>(_907) : as_type<int>(_619);
    float _911 = fma(_897, _897, _887);
    float _913 = _899 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _915 = !_903;
    float _917 = _915 ? _619 : as_type<float>(_909);
    float _919 = _911 + _889;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _923 = -_917;
    float _925 = _923 + 0.5;
    float _927 = sqrt(_919);
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _939 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _941 = _913 * _711;
    float _943 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _947 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _949 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _953 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _955 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = _939 * _905;
    bool _959 = _927 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _961 = isnan(_927);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _967 = _963 || _965;
    out.m_60.x = _947;
    out.m_60.y = _949;
    out.m_60.z = _951;
    out.m_60.w = _945;
    out.m_62.x = _943;
    out.m_62.y = _953;
    out.m_62.z = _955;
    out.m_64.x = _941;
    out.m_64.y = _957;
    float _969 = _935;
    float _971 = _937;
    if (!_967)
    {
        _969 = 1.0;
    }
    float _973 = _969;
    bool _975 = !_967;
    float _977 = _973;
    if (!_975)
    {
        bool _979 = _927 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _981 = isnan(_927);
        bool _983 = _979 || _981;
        bool _985 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _987 = _983 || _985;
        if (!_987)
        {
            float _989 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _991 = _927 + _989;
            float _993 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _995 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _993;
            float _997 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _999 = _997 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1001 = 1.0 / _995;
            float _1003 = _991 * _1001;
            float _1005 = fma(_1003, _999, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _977 = _1005;
            _1007 = true;
        }
        else
        {
            bool _1009 = _927 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1011 = isnan(_927);
            bool _1013 = _1009 || _1011;
            bool _1015 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1017 = _1013 || _1015;
            if (!_1017)
            {
                float _1019 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1021 = _927 + _1019;
                float _1023 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1025 = _1023 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1027 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1029 = _1027 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1031 = 1.0 / _1025;
                float _1033 = _1021 * _1031;
                float _1035 = fma(_1033, _1029, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _977 = _1035;
                _1007 = true;
            }
            else
            {
                _977 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1007 = false;
    float _1037 = _977;
    float _1039 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1041 = _885 + _1039;
    float _1043 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1045 = _891 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1049 = _893 + _1047;
    float _1051 = fma(_1041, _1037, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1053 = fma(_1045, _1037, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1055 = fma(_1049, _1037, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1059 = _1051 + _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1063 = _1053 + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1067 = _1055 + _1065;
    float _1069 = _1059 * _1059;
    float _1071 = fma(_1063, _1063, _1069);
    float _1073 = fma(_1067, _1067, _1071);
    float _1075 = rsqrt(_1073);
    float _1077 = sqrt(_1073);
    float _1079 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1081 = _1063 * _1079;
    float _1083 = _1067 * _1079;
    float _1085 = _1081 * _1081;
    float _1087 = _1083 * _1083;
    float _1089 = _1085 + _1087;
    float _1091 = sqrt(_1089);
    bool _1093 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1097 = _1091 + _1095;
    float _1099 = _1067;
    float _1101 = _1069;
    float _1103 = _1097;
    float _1105 = _1037;
    float _1107 = _1059;
    float _1109 = _1081;
    if (_1093)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1099 = _1111;
    }
    float _1113 = _1099;
    if (_1093)
    {
        float _1115 = rsqrt(_1089);
        _1101 = _1115;
    }
    float _1117 = _1101;
    float _1119 = _1117;
    if (_1093)
    {
        float _1121 = _1097 * _1113;
        _1103 = _1121;
    }
    float _1123 = _1103;
    if (_1093)
    {
        float _1125 = _1123 * 0.15915493667125701904296875;
        _1105 = _1125;
    }
    float _1127 = _1105;
    float _1129 = _1075;
    if (_1093)
    {
        float _1131 = _1127 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        _1129 = _1133;
    }
    float _1135 = _1129;
    float _1137 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1139 = precise::max(0.0, _1137);
    float _1141 = _1113;
    float _1143 = _1139;
    if (_1093)
    {
        float _1145 = _1127 * 6.283185482025146484375;
        float _1147 = cos(_1145);
        _1141 = _1147;
    }
    float _1149 = _1141;
    float _1151 = -_1079;
    float _1153 = -_1139;
    float _1155 = fma(_1059, _1151, _1153);
    if (_1093)
    {
        float _1157 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1107 = _1157;
    }
    float _1159 = _1107;
    float _1161 = _1135;
    float _1163 = _1159;
    if (_1093)
    {
        float _1165 = fma(_1135, _1159, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = _1167;
    if (!_1093)
    {
        _1163 = _1087;
    }
    float _1171 = _1163;
    float _1173 = _1171;
    if (_1093)
    {
        float _1175 = _1149 + (-1.0);
        _1143 = _1175;
    }
    float _1177 = _1143;
    float _1179 = _1177;
    if (_1093)
    {
        float _1181 = _1117 * _1167;
        _813 = _1181;
    }
    float _1183 = _813;
    if (!_1093)
    {
        _1119 = _1155;
    }
    float _1185 = _1119;
    float _1187 = _1185;
    if (_1093)
    {
        float _1189 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _971 = _1189;
    }
    float _1191 = _971;
    if (_1093)
    {
        float _1193 = _1081 * _1183;
        _1109 = _1193;
    }
    float _1195 = _1109;
    if (!_1093)
    {
        _1169 = _1083;
    }
    float _1197 = _1169;
    float _1199 = _1197;
    if (_1093)
    {
        float _1201 = _1083 * _1183;
        _1199 = _1201;
    }
    float _1203 = _1199;
    if (!_1093)
    {
        _1179 = _1085;
    }
    float _1205 = _1179;
    float _1207 = _1205;
    if (_1093)
    {
        float _1209 = fma(_1155, _1149, _1191);
        _1187 = _1209;
    }
    float _1211 = _1187;
    if (_1093)
    {
        float _1213 = _1195 * _1195;
        _1207 = _1213;
    }
    float _1215 = _1207;
    if (_1093)
    {
        float _1217 = _1203 * _1203;
        _1173 = _1217;
    }
    float _1219 = _1173;
    float _1221 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = fma(_1211, _1211, _1215);
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1227 = fma(_1077, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1225);
    float _1229 = precise::clamp(_1227, 0.0, 1.0);
    float _1231 = _1223 + _1219;
    float _1233 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1235 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1237 = -_1229;
    float _1239 = _1237 + 1.0;
    float _1241 = rsqrt(_1231);
    float _1243 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1233);
    float _1245 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1247 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1235);
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1251 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1243);
    float _1253 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1245);
    float _1255 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1247);
    float _1257 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1259 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1261 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1253);
    float _1263 = abs(_1239);
    float _1265 = log2(_1263);
    float _1267 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1269 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1257);
    float _1271 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1273 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1275 = _1241 * _1195;
    float _1277 = _1241 * _1211;
    float _1279 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1281 = _1241 * _1203;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1285 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1287 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1279);
    float _1289 = -_1273;
    float _1291 = fma(_1289, _1249, 1.0);
    float _1293 = -_1283;
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1293);
    float _1297 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1299 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1287);
    float _1301 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1303 = -_1281;
    float _1305 = fma(_1303, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1295);
    float _1307 = log2(_1291);
    float _1309 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1299);
    float _1311 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1313 = fma(_1305, -0.5, 0.5);
    float _1315 = fma(_1305, 0.5, 0.5);
    float _1317 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1297);
    float _1319 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1311);
    float _1321 = exp2(_1301);
    float _1323 = _1277 + 1.0;
    float _1325 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1317);
    float _1327 = fma(_1315, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1329 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1331 = fma(_1315, _1327, -0.212114393711090087890625);
    float _1333 = 1.0 / _1309;
    float _1335 = _1307 * 0.693147182464599609375;
    float _1337 = fma(_1315, _1331, 1.570728778839111328125);
    float _1339 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1341 = sqrt(_1313);
    float _1343 = -_1277;
    float _1345 = fma(_1321, _1323, _1343);
    float _1347 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1325);
    float _1349 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1329);
    float _1351 = fma(_1345, 0.5, 0.5);
    float _1353 = _1347 * _1333;
    float _1355 = _1349 * _1333;
    float _1357 = fma(_1353, 0.5, 0.5);
    float _1359 = fma(_1355, -0.5, 0.5);
    float _1361 = _1341 * 0.636619746685028076171875;
    float _1363 = -_1337;
    float _1365 = fma(_1361, _1363, 1.0);
    float3 _3641 = float3(_1357, _1359, _1339);
    float _1367 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3641, float3(0.0), isnan(_3641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3641, float3(0.0), isnan(_3641)), level(0.0)).x;
    float3 _3652 = float3(_1357, _1359, _1339);
    float4 _1370 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3652, float3(0.0), isnan(_3652)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3652, float3(0.0), isnan(_3652)), level(0.0)).xyzw;
    float _1372 = _1370.x;
    float _1374 = _1370.y;
    float _1376 = _1370.z;
    float _1378 = _1370.w;
    float2 _3669 = float2(_1365, _1351);
    float3 _1382 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3669, float2(0.0), isnan(_3669)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3669, float2(0.0), isnan(_3669)), level(0.0)).xyz;
    float _1384 = _1382.x;
    float _1386 = _1382.y;
    float _1388 = _1382.z;
    float _1390 = _779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1392 = _779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1394 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1396 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1390);
    float _1398 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1392);
    float _1400 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1402 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1396);
    float _1404 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1398);
    float _1406 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1400);
    float _1408 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1410 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1412 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1406);
    float _1414 = 1.0 / _1408;
    bool _1416 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan(0.5);
    bool _1424 = _1420 || _1422;
    float _1426 = _1410 + _1408;
    float _1428 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1412);
    float _1430 = exp2(_1394);
    float _1432 = _1400;
    if (_1424)
    {
        _1432 = 1.0;
    }
    float _1434 = _1432;
    float _1436 = _1426 * _1414;
    float _1438 = _1436 * 0.5;
    float _1440 = _1434;
    if (!_1424)
    {
        float _1442 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1444 = _1442 * 0.15915493667125701904296875;
        float _1446 = _1444 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        float _1450 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1444 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1460 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1458);
        float _1462 = 1.0 / _1448;
        float _1464 = _1452 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = _1456 * _1462;
        float _1470 = 1.0 / _1460;
        float _1472 = _1466 * _1468;
        float _1474 = _1452 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1478;
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1484 = _1470 * _1482;
        float _1486 = 1.0 / _1472;
        float _1488 = 1.0 / _1480;
        float _1490 = _1476 * _1486;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = fma(_1490, _1484, _1492);
        float _1496 = _1494 * _1488;
        float _1498 = precise::clamp(_1496, 0.0, 1.0);
        _1440 = _1498;
    }
    float _1500 = _1440;
    float _1502 = -_1430;
    float _1504 = _1502 + 1.0;
    bool _1506 = _1500 > 0.0;
    bool _1508 = isnan(_1500);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(0.0);
    bool _1514 = _1510 || _1512;
    float _1516 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1518 = _1428 + _1309;
    float _1520 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1522 = _1347 + _1309;
    float _1524 = _1309 * 0.5;
    out.gl_Position.x = _1347;
    out.gl_Position.y = _1349;
    out.gl_Position.z = _1428;
    out.gl_Position.w = _1309;
    float _1526 = _1520 * _1367;
    float _1528 = -_1520;
    float _1530 = _1528 + 1.0;
    float _1532 = _1518 * 0.5;
    float _1534 = _1378 * _1526;
    float _1536 = _1388 * _1526;
    float _1538 = _1522 * 0.5;
    float _1540 = fma(_1349, -0.5, _1524);
    float _1542 = fma(_1384, _1534, _1372);
    float _1544 = _1516 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1546 = fma(_1386, _1534, _1374);
    float _1548 = _1378 * _1530;
    float _1550 = fma(_1378, _1536, _1376);
    out.m_66.x = _1538;
    out.m_66.y = _1540;
    out.m_66.z = _1532;
    out.m_66.w = _1309;
    out.m_47.x = _1544;
    out.m_68.x = _1542;
    out.m_68.y = _1546;
    out.m_68.z = _1550;
    out.m_68.w = _1548;
    if (_1514)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1552 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1552;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1007 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _82 = in.m_44.w;
    float _84 = trunc(_82);
    int _87 = int(_84);
    bool _91 = _87 >= 1;
    float _93 = 0.0;
    if (!_91)
    {
        _93 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _95 = _93;
    float _97 = _95;
    if (!_91)
    {
        out.m_47.x = 0.0;
    }
    int _99 = 0;
    if (!_91)
    {
        float _101 = _95 * 5.0;
        _99 = as_type<int>(_101);
    }
    int _103 = _99;
    int _105 = _103;
    if (!_91)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1609 = as_type<float>(_103);
        out.gl_Position.z = _1609;
    }
    if (!_91)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _107 = in.m_49.w;
    bool _109 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _111 = isnan(_107);
    bool _113 = _109 || _111;
    bool _115 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _117 = _113 || _115;
    float _119 = -_107;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _123 = 0.0;
    float _125 = _121;
    if (_117)
    {
        float _127 = float(_87);
        _123 = _127;
    }
    float _129 = _123;
    bool _131 = _121 >= _129;
    bool _133 = !_117;
    bool _135 = _131 || _133;
    if (_135)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _97;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _105 = as_type<int>(_139);
    }
    int _141 = _105;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1678 = as_type<float>(_141);
        out.gl_Position.z = _1678;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _145 = !_143;
    float _163;
    if (!_145)
    {
        float _147 = in.m_51.x;
        float _149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _151 = _147 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _153 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _155 = _153 * _149;
        float _157 = floor(_155);
        float _159 = -_157;
        float _161 = _155 + _159;
        _163 = _161;
        _165 = true;
    }
    else
    {
        float _167 = float(_87);
        float _169 = 1.0 / _167;
        float _171 = _121 * _169;
        _163 = _171;
    }
    _165 = false;
    float _173 = _163;
    float _175 = in.m_51.z;
    float _177 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _179 = log2(_177);
    float _181 = in.m_51.x;
    float _183 = in.m_51.y;
    float _185 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _187 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _185;
    float _189 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _191 = _189 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _193;
    int _197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _199 = _197 != 0;
    int _201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _203 = _201 != 0;
    int _205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _207 = _205 != 0;
    float _209 = 1.0 / _187;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _213 = _173 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _173 + _215;
    float _219 = 1.0 / _191;
    float _221 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _223 = _173 + _221;
    float _225 = _175 * 2.0;
    float _227 = 1.0 / _195;
    float _229 = _223 * _209;
    float _231 = _183 * 2.0;
    float _233 = _181 * 2.0;
    float _235 = _183 + _181;
    float _237 = floor(_225);
    float _239 = _213 * _219;
    float _241 = _183 + _175;
    float _243 = _235 + (-1.0);
    float _245 = _175 + _181;
    float _247 = _175 + (-0.5);
    float _249 = _241 + (-1.0);
    float _251 = floor(_231);
    float _253 = _217 * _227;
    float _255 = _245 + (-1.0);
    bool _257 = _237 > 0.0;
    float _259 = floor(_233);
    bool _261 = _237 >= 0.0;
    bool _263 = isnan(_237);
    bool _265 = _261 || _263;
    bool _267 = isnan(0.0);
    bool _269 = _265 || _267;
    int _271 = _269 ? 0 : 1;
    bool _273 = _251 >= 0.0;
    bool _275 = isnan(_251);
    bool _277 = _273 || _275;
    bool _279 = isnan(0.0);
    bool _281 = _277 || _279;
    float _283 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _285 = ~_271;
    int _287 = _285 + 1;
    int _289 = _287 + 1;
    float _291 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _293 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _295 = _289;
    float _297 = _183;
    if (!_257)
    {
        int _299 = ~_271;
        int _301 = _299 + 1;
        _295 = _301;
    }
    int _303 = _295;
    float _305 = _179 * _121;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _309 = _307 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _311 = _251 > 0.0;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _313;
    bool _317 = _259 > 0.0;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _319;
    bool _323 = _259 >= 0.0;
    bool _325 = isnan(_259);
    bool _327 = _323 || _325;
    bool _329 = isnan(0.0);
    bool _331 = _327 || _329;
    float _333 = fma(_315, _229, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = exp2(_305);
    float _337 = fma(_321, _229, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _343 = !_199;
    int _345 = _343 ? 0 : 1;
    float _347 = fma(_309, _239, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _349 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _351 = isnan(1.0);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _357 = _353 || _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _361 = 1.0 + _359;
    int _363 = abs(_345);
    float _365 = fma(_341, _239, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = in.m_53.x;
    float _369 = in.m_53.y;
    float _371 = in.m_53.z;
    float _373 = 1.0 / _361;
    bool _375 = !_203;
    int _377 = _375 ? 0 : 1;
    int _379 = _331 ? 0 : 1;
    float _381 = -_335;
    float _383 = _381 + 1.0;
    int _385 = abs(_377);
    bool _387 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _389 = isnan(0.0);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _395 = _391 || _393;
    int _397 = ~_379;
    int _399 = _397 + 1;
    int _401 = _399 + 1;
    float _403 = float(_363);
    float _405 = float(_303);
    int _407 = _401;
    if (!_317)
    {
        int _409 = ~_379;
        int _411 = _409 + 1;
        _407 = _411;
    }
    int _413 = _407;
    float _415 = _403 * _405;
    float _417 = _395 ? _383 : 0.0;
    float _419 = float(_385);
    float _421 = _415 * (-2.0);
    int _423 = _281 ? 0 : 1;
    if (_357)
    {
        float _425 = _417 * _373;
        _125 = _425;
    }
    float _427 = _125;
    float _429 = float(_413);
    bool _431 = !_207;
    int _433 = _431 ? 0 : 1;
    int _435 = ~_423;
    int _437 = _435 + 1;
    int _439 = _437 + 1;
    float _441 = _419 * _429;
    int _443 = _439;
    if (!_311)
    {
        int _445 = ~_423;
        int _447 = _445 + 1;
        _443 = _447;
    }
    int _449 = _443;
    float _451 = fma(_293, _421, _293);
    int _453 = abs(_433);
    float _455 = fma(_421, _367, _367);
    bool _457 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _459 = isnan(_173);
    bool _461 = _457 || _459;
    bool _463 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _465 = _461 || _463;
    float _467 = float(_465);
    float _469 = _181 + (-0.5);
    bool _471 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _473 = isnan(_173);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = float(_453);
    float _485 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[196].x, _455);
    float _487 = -_467;
    float _489 = _487 + 1.0;
    bool _491 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _493 = isnan(_173);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    float _503 = -_481;
    float _505 = _503 + 1.0;
    float _507 = float(_449);
    float _509 = fma(_451, _427, _485);
    float _511 = _481 * _489;
    float _513 = _441 * (-2.0);
    bool _515 = _173 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _517 = isnan(_173);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = _501 * _505;
    float _529 = _483 * _507;
    float _531 = -_501;
    float _533 = _531 + 1.0;
    float _535 = _183 + (-0.5);
    float _537 = fma(_513, _369, _369);
    float _539 = fma(_291, _513, _291);
    float _541 = _525 * _533;
    float _543 = _529 * (-2.0);
    float _545 = as_type<float>(int(gl_VertexIndex));
    float _547 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[196].y, _537);
    float _549 = _333 * _541;
    float _551 = fma(_543, _371, _371);
    float _553 = fma(_283, _543, _283);
    float _555 = -_525;
    float _557 = _555 + 1.0;
    float _559 = in.m_58.x;
    float _561 = in.m_58.y;
    float _563 = _337 * _541;
    float _565 = fma(_247, (*spvDescriptorSet0.vp_c9)._m0[196].z, _551);
    float _567 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].x, _549);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _569;
    float _573 = fma(_557, (*spvDescriptorSet0.vp_c9)._m0[143].y, _563);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _575;
    float _579 = fma(_539, _427, _547);
    float _581 = fma(_553, _427, _565);
    float _583 = fma(_365, _527, _573);
    float _585 = fma(_577, _253, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _587 = _509 * 0.15915493667125701904296875;
    float _589 = _579 * 0.15915493667125701904296875;
    float _591 = fma(_571, _253, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _593 = fma(_347, _527, _567);
    float _595 = _581 * 0.15915493667125701904296875;
    float _597 = fma(_585, _511, _583);
    float _599 = _587 * 6.283185482025146484375;
    float _601 = sin(_599);
    int _603 = as_type<int>(_545) & 1;
    bool _605 = _603 != 0;
    int _607 = as_type<int>(_545) & 2;
    bool _609 = _607 != 0;
    float _611 = fma(_591, _511, _593);
    float _613 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[146].y, _597);
    float _615 = fma(_467, (*spvDescriptorSet0.vp_c9)._m0[146].x, _611);
    bool _617 = !_609;
    float _619 = _617 ? (-0.5) : 0.5;
    float _621 = _587 * 6.283185482025146484375;
    float _623 = cos(_621);
    float _625 = _613 * _561;
    bool _627 = !_605;
    float _629 = _627 ? (-0.5) : 0.5;
    float _631 = _615 * _559;
    float _633 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _619);
    float _635 = in.m_44.x;
    float _637 = in.m_44.y;
    float _639 = in.m_44.z;
    float _641 = _625 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _643 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _629);
    float _645 = _589 * 6.283185482025146484375;
    float _647 = sin(_645);
    float _649 = _631 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _651 = _181 > 0.5;
    float _653 = _649 * _643;
    float _655 = _589 * 6.283185482025146484375;
    float _657 = cos(_655);
    float _659 = _595 * 6.283185482025146484375;
    float _661 = cos(_659);
    float _663 = _623 * _647;
    float _665 = _601 * _647;
    float _667 = _595 * 6.283185482025146484375;
    float _669 = sin(_667);
    float _671 = _601 * _657;
    float _673 = _647 * _661;
    float _675 = _641 * _633;
    float _677 = _623 * _657;
    float _679 = _657 * _661;
    float _681 = _661 * _675;
    float _683 = -_663;
    float _685 = fma(_669, _671, _683);
    float _687 = -_671;
    float _689 = fma(_669, _663, _687);
    float _691 = fma(_669, _677, _665);
    float _693 = _623 * _681;
    float _695 = fma(_669, _665, _677);
    float _697 = _601 * _681;
    float _699 = -_675;
    float _701 = _669 * _699;
    float _703 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _705 = fma(_691, _653, _693);
    float _707 = fma(_685, _653, _697);
    float _709 = fma(_679, _653, _701);
    float _711 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _713 = fma(_689, _703, _705);
    float _715 = fma(_695, _703, _707);
    float _717 = fma(_673, _703, _709);
    float _719 = _637 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _721 = _637 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _723 = _713 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _725 = _713 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _727 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[4].x, _719);
    float _729 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[6].x, _721);
    float _731 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[24].x, _723);
    float _733 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[26].x, _725);
    float _735 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[4].z, _727);
    float _737 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[6].z, _729);
    float _739 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[24].z, _731);
    float _741 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[26].z, _733);
    float _743 = _735 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _745 = _737 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _747 = _739 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _749 = _741 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _751 = _637 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _753 = _713 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _755 = _743 + _747;
    float _757 = _745 + _749;
    float _759 = fma(_635, (*spvDescriptorSet0.vp_c10)._m0[5].x, _751);
    float _761 = fma(_717, (*spvDescriptorSet0.vp_c8)._m0[25].x, _753);
    float _763 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _765 = _755 + _763;
    float _767 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _769 = _757 + _767;
    float _771 = fma(_639, (*spvDescriptorSet0.vp_c10)._m0[5].z, _759);
    float _773 = fma(_715, (*spvDescriptorSet0.vp_c8)._m0[25].z, _761);
    float _775 = _765 * _765;
    float _777 = _769 * _769;
    float _779 = _771 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _781 = _773 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _783 = _775 + _777;
    int _785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _787 = _785 != 0;
    float _789 = -_629;
    float _791 = _651 ? _789 : _629;
    float _793 = sqrt(_783);
    float _795 = _779 + _781;
    bool _797 = _183 > 0.5;
    bool _799 = !_787;
    float _801 = _799 ? _629 : _791;
    bool _803 = _793 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _805 = _629;
    float _807 = _771;
    float _809 = _791;
    float _811 = _755;
    float _813 = _775;
    if (!_803)
    {
        _805 = _755;
    }
    float _815 = _805;
    float _817 = _815;
    if (!_803)
    {
        _807 = _777;
    }
    float _819 = _807;
    float _821 = _819;
    if (!_803)
    {
        _809 = _775;
    }
    float _823 = _809;
    float _825 = _823;
    if (!_803)
    {
        _297 = _757;
    }
    float _827 = _297;
    float _829 = _827;
    if (!_803)
    {
        _811 = _795;
    }
    float _831 = _811;
    bool _833 = !_803;
    float _835 = _831;
    if (!_833)
    {
        float _837 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _839 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _841 = _793 + _839;
        float _843 = _795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _845 = rsqrt(_783);
        float _847 = _841 * _837;
        float _849 = _847 * 0.15915493667125701904296875;
        float _851 = _849 * 6.283185482025146484375;
        float _853 = sin(_851);
        float _855 = _849 * 6.283185482025146484375;
        float _857 = cos(_855);
        float _859 = fma(_853, _843, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _861 = _845 * _859;
        float _863 = _857 + (-1.0);
        float _865 = fma(_765, _861, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _867 = fma(_769, _861, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _869 = _863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _871 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _873 = _865 + _871;
        float _875 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _877 = _867 + _875;
        float _879 = fma(_795, _857, _869);
        float _881 = _873 * _873;
        float _883 = _877 * _877;
        _835 = _879;
        _825 = _881;
        _821 = _883;
        _817 = _865;
        _829 = _867;
    }
    float _885 = _835;
    float _887 = _825;
    float _889 = _821;
    float _891 = _817;
    float _893 = _829;
    float _895 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _897 = _885 + _895;
    float _899 = _801 + 0.5;
    int _901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _903 = _901 != 0;
    float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _907 = -_619;
    int _909 = _797 ? as_type<int>(_907) : as_type<int>(_619);
    float _911 = fma(_897, _897, _887);
    float _913 = _899 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _915 = !_903;
    float _917 = _915 ? _619 : as_type<float>(_909);
    float _919 = _911 + _889;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _923 = -_917;
    float _925 = _923 + 0.5;
    float _927 = sqrt(_919);
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _935 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _939 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _941 = _913 * _711;
    float _943 = _921 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _947 = _929 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _949 = _931 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _951 = _933 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _953 = _935 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _955 = _937 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _957 = _939 * _905;
    bool _959 = _927 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _961 = isnan(_927);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _967 = _963 || _965;
    out.m_60.x = _947;
    out.m_60.y = _949;
    out.m_60.z = _951;
    out.m_60.w = _945;
    out.m_62.x = _943;
    out.m_62.y = _953;
    out.m_62.z = _955;
    out.m_64.x = _941;
    out.m_64.y = _957;
    float _969 = _935;
    float _971 = _937;
    if (!_967)
    {
        _969 = 1.0;
    }
    float _973 = _969;
    bool _975 = !_967;
    float _977 = _973;
    if (!_975)
    {
        bool _979 = _927 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _981 = isnan(_927);
        bool _983 = _979 || _981;
        bool _985 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _987 = _983 || _985;
        if (!_987)
        {
            float _989 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _991 = _927 + _989;
            float _993 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _995 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _993;
            float _997 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _999 = _997 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1001 = 1.0 / _995;
            float _1003 = _991 * _1001;
            float _1005 = fma(_1003, _999, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _977 = _1005;
            _1007 = true;
        }
        else
        {
            bool _1009 = _927 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1011 = isnan(_927);
            bool _1013 = _1009 || _1011;
            bool _1015 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1017 = _1013 || _1015;
            if (!_1017)
            {
                float _1019 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1021 = _927 + _1019;
                float _1023 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1025 = _1023 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1027 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1029 = _1027 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1031 = 1.0 / _1025;
                float _1033 = _1021 * _1031;
                float _1035 = fma(_1033, _1029, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _977 = _1035;
                _1007 = true;
            }
            else
            {
                _977 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1007 = false;
    float _1037 = _977;
    float _1039 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1041 = _885 + _1039;
    float _1043 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1045 = _891 + _1043;
    float _1047 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1049 = _893 + _1047;
    float _1051 = fma(_1041, _1037, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1053 = fma(_1045, _1037, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1055 = fma(_1049, _1037, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1057 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1059 = _1051 + _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1063 = _1053 + _1061;
    float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1067 = _1055 + _1065;
    float _1069 = _1059 * _1059;
    float _1071 = fma(_1063, _1063, _1069);
    float _1073 = fma(_1067, _1067, _1071);
    float _1075 = rsqrt(_1073);
    float _1077 = sqrt(_1073);
    float _1079 = _1075 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1081 = _1063 * _1079;
    float _1083 = _1067 * _1079;
    float _1085 = _1081 * _1081;
    float _1087 = _1083 * _1083;
    float _1089 = _1085 + _1087;
    float _1091 = sqrt(_1089);
    bool _1093 = _1091 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1095 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1097 = _1091 + _1095;
    float _1099 = _1067;
    float _1101 = _1069;
    float _1103 = _1097;
    float _1105 = _1037;
    float _1107 = _1059;
    float _1109 = _1081;
    if (_1093)
    {
        float _1111 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1099 = _1111;
    }
    float _1113 = _1099;
    if (_1093)
    {
        float _1115 = rsqrt(_1089);
        _1101 = _1115;
    }
    float _1117 = _1101;
    float _1119 = _1117;
    if (_1093)
    {
        float _1121 = _1097 * _1113;
        _1103 = _1121;
    }
    float _1123 = _1103;
    if (_1093)
    {
        float _1125 = _1123 * 0.15915493667125701904296875;
        _1105 = _1125;
    }
    float _1127 = _1105;
    float _1129 = _1075;
    if (_1093)
    {
        float _1131 = _1127 * 6.283185482025146484375;
        float _1133 = sin(_1131);
        _1129 = _1133;
    }
    float _1135 = _1129;
    float _1137 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1139 = precise::max(0.0, _1137);
    float _1141 = _1113;
    float _1143 = _1139;
    if (_1093)
    {
        float _1145 = _1127 * 6.283185482025146484375;
        float _1147 = cos(_1145);
        _1141 = _1147;
    }
    float _1149 = _1141;
    float _1151 = -_1079;
    float _1153 = -_1139;
    float _1155 = fma(_1059, _1151, _1153);
    if (_1093)
    {
        float _1157 = _1155 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1107 = _1157;
    }
    float _1159 = _1107;
    float _1161 = _1135;
    float _1163 = _1159;
    if (_1093)
    {
        float _1165 = fma(_1135, _1159, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = _1167;
    if (!_1093)
    {
        _1163 = _1087;
    }
    float _1171 = _1163;
    float _1173 = _1171;
    if (_1093)
    {
        float _1175 = _1149 + (-1.0);
        _1143 = _1175;
    }
    float _1177 = _1143;
    float _1179 = _1177;
    if (_1093)
    {
        float _1181 = _1117 * _1167;
        _813 = _1181;
    }
    float _1183 = _813;
    if (!_1093)
    {
        _1119 = _1155;
    }
    float _1185 = _1119;
    float _1187 = _1185;
    if (_1093)
    {
        float _1189 = _1177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _971 = _1189;
    }
    float _1191 = _971;
    if (_1093)
    {
        float _1193 = _1081 * _1183;
        _1109 = _1193;
    }
    float _1195 = _1109;
    if (!_1093)
    {
        _1169 = _1083;
    }
    float _1197 = _1169;
    float _1199 = _1197;
    if (_1093)
    {
        float _1201 = _1083 * _1183;
        _1199 = _1201;
    }
    float _1203 = _1199;
    if (!_1093)
    {
        _1179 = _1085;
    }
    float _1205 = _1179;
    float _1207 = _1205;
    if (_1093)
    {
        float _1209 = fma(_1155, _1149, _1191);
        _1187 = _1209;
    }
    float _1211 = _1187;
    if (_1093)
    {
        float _1213 = _1195 * _1195;
        _1207 = _1213;
    }
    float _1215 = _1207;
    if (_1093)
    {
        float _1217 = _1203 * _1203;
        _1173 = _1217;
    }
    float _1219 = _1173;
    float _1221 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = fma(_1211, _1211, _1215);
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1227 = fma(_1077, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1225);
    float _1229 = precise::clamp(_1227, 0.0, 1.0);
    float _1231 = _1223 + _1219;
    float _1233 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1235 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1237 = -_1229;
    float _1239 = _1237 + 1.0;
    float _1241 = rsqrt(_1231);
    float _1243 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1233);
    float _1245 = _1051 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1247 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1235);
    float _1249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1251 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1243);
    float _1253 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1245);
    float _1255 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1247);
    float _1257 = fma(_1053, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1259 = _1251 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1261 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1253);
    float _1263 = abs(_1239);
    float _1265 = log2(_1263);
    float _1267 = _1255 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1269 = fma(_1055, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1257);
    float _1271 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1273 = _1259 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1275 = _1241 * _1195;
    float _1277 = _1241 * _1211;
    float _1279 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1281 = _1241 * _1203;
    float _1283 = _1275 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1285 = _1269 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1287 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1279);
    float _1289 = -_1273;
    float _1291 = fma(_1289, _1249, 1.0);
    float _1293 = -_1283;
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1293);
    float _1297 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1299 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1287);
    float _1301 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1303 = -_1281;
    float _1305 = fma(_1303, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1295);
    float _1307 = log2(_1291);
    float _1309 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1299);
    float _1311 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1313 = fma(_1305, -0.5, 0.5);
    float _1315 = fma(_1305, 0.5, 0.5);
    float _1317 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1297);
    float _1319 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1311);
    float _1321 = exp2(_1301);
    float _1323 = _1277 + 1.0;
    float _1325 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1317);
    float _1327 = fma(_1315, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1329 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1319);
    float _1331 = fma(_1315, _1327, -0.212114393711090087890625);
    float _1333 = 1.0 / _1309;
    float _1335 = _1307 * 0.693147182464599609375;
    float _1337 = fma(_1315, _1331, 1.570728778839111328125);
    float _1339 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1341 = sqrt(_1313);
    float _1343 = -_1277;
    float _1345 = fma(_1321, _1323, _1343);
    float _1347 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1325);
    float _1349 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1329);
    float _1351 = fma(_1345, 0.5, 0.5);
    float _1353 = _1347 * _1333;
    float _1355 = _1349 * _1333;
    float _1357 = fma(_1353, 0.5, 0.5);
    float _1359 = fma(_1355, -0.5, 0.5);
    float _1361 = _1341 * 0.636619746685028076171875;
    float _1363 = -_1337;
    float _1365 = fma(_1361, _1363, 1.0);
    float3 _3641 = float3(_1357, _1359, _1339);
    float _1367 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3641, float3(0.0), isnan(_3641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3641, float3(0.0), isnan(_3641)), level(0.0)).x;
    float3 _3652 = float3(_1357, _1359, _1339);
    float4 _1370 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3652, float3(0.0), isnan(_3652)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3652, float3(0.0), isnan(_3652)), level(0.0)).xyzw;
    float _1372 = _1370.x;
    float _1374 = _1370.y;
    float _1376 = _1370.z;
    float _1378 = _1370.w;
    float2 _3669 = float2(_1365, _1351);
    float3 _1382 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3669, float2(0.0), isnan(_3669)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3669, float2(0.0), isnan(_3669)), level(0.0)).xyz;
    float _1384 = _1382.x;
    float _1386 = _1382.y;
    float _1388 = _1382.z;
    float _1390 = _779 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1392 = _779 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1394 = _1265 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1396 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1390);
    float _1398 = fma(_743, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1392);
    float _1400 = _1271 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1402 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1396);
    float _1404 = fma(_745, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1398);
    float _1406 = fma(_1267, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1400);
    float _1408 = _1402 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1410 = _1404 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1412 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1406);
    float _1414 = 1.0 / _1408;
    bool _1416 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1418 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan(0.5);
    bool _1424 = _1420 || _1422;
    float _1426 = _1410 + _1408;
    float _1428 = fma(_1285, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1412);
    float _1430 = exp2(_1394);
    float _1432 = _1400;
    if (_1424)
    {
        _1432 = 1.0;
    }
    float _1434 = _1432;
    float _1436 = _1426 * _1414;
    float _1438 = _1436 * 0.5;
    float _1440 = _1434;
    if (!_1424)
    {
        float _1442 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1444 = _1442 * 0.15915493667125701904296875;
        float _1446 = _1444 * 6.283185482025146484375;
        float _1448 = cos(_1446);
        float _1450 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1452 = _1450 * 0.15915493667125701904296875;
        float _1454 = _1444 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1460 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1458);
        float _1462 = 1.0 / _1448;
        float _1464 = _1452 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = _1456 * _1462;
        float _1470 = 1.0 / _1460;
        float _1472 = _1466 * _1468;
        float _1474 = _1452 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1478;
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1484 = _1470 * _1482;
        float _1486 = 1.0 / _1472;
        float _1488 = 1.0 / _1480;
        float _1490 = _1476 * _1486;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = fma(_1490, _1484, _1492);
        float _1496 = _1494 * _1488;
        float _1498 = precise::clamp(_1496, 0.0, 1.0);
        _1440 = _1498;
    }
    float _1500 = _1440;
    float _1502 = -_1430;
    float _1504 = _1502 + 1.0;
    bool _1506 = _1500 > 0.0;
    bool _1508 = isnan(_1500);
    bool _1510 = _1506 || _1508;
    bool _1512 = isnan(0.0);
    bool _1514 = _1510 || _1512;
    float _1516 = _1500 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1518 = _1428 + _1309;
    float _1520 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1522 = _1347 + _1309;
    float _1524 = _1309 * 0.5;
    out.gl_Position.x = _1347;
    out.gl_Position.y = _1349;
    out.gl_Position.z = _1428;
    out.gl_Position.w = _1309;
    float _1526 = _1520 * _1367;
    float _1528 = -_1520;
    float _1530 = _1528 + 1.0;
    float _1532 = _1518 * 0.5;
    float _1534 = _1378 * _1526;
    float _1536 = _1388 * _1526;
    float _1538 = _1522 * 0.5;
    float _1540 = fma(_1349, -0.5, _1524);
    float _1542 = fma(_1384, _1534, _1372);
    float _1544 = _1516 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1546 = fma(_1386, _1534, _1374);
    float _1548 = _1378 * _1530;
    float _1550 = fma(_1378, _1536, _1376);
    out.m_66.x = _1538;
    out.m_66.y = _1540;
    out.m_66.z = _1532;
    out.m_66.w = _1309;
    out.m_47.x = _1544;
    out.m_68.x = _1542;
    out.m_68.y = _1546;
    out.m_68.z = _1550;
    out.m_68.w = _1548;
    if (_1514)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1552 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1552;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

