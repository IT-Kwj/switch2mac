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
    float4 m_80 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_96 [[user(locn6)]];
    float4 m_94 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_51 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 m_72 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2417 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2728 = as_type<float>(_139);
        out.gl_Position.z = _2728;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2783 = as_type<float>(_165);
        out.gl_Position.z = _2783;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _193 = _173;
    float _211;
    if (!_191)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _173;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    float _221 = in.m_60.x;
    float _223 = in.m_60.y;
    bool _225 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_215);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -_235;
    float _255 = _253 + 1.0;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    float _261 = 1.0 / _239;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _265 = _251 * _255;
    float _267 = -_251;
    float _269 = _267 + 1.0;
    float _271 = _219 * _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    float _293 = _289 * _221;
    float _295 = _291 * _223;
    bool _297 = !_263;
    if (!_297)
    {
        float _299 = in.m_58.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _193 = _313;
    }
    float _315 = _193;
    float _317 = in.m_46.x;
    float _319 = in.m_46.y;
    float _321 = in.m_46.z;
    float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _325 = log2(_323);
    float _327 = _295 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _329 = in.m_62.x;
    float _331 = in.m_62.y;
    float _333 = in.m_62.z;
    float _335 = in.m_62.w;
    bool _337 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _339 = isnan(0.0);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _345 = _341 || _343;
    float _347 = in.m_64.x;
    float _349 = in.m_64.y;
    float _351 = in.m_64.z;
    float _353 = in.m_64.w;
    float _355 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _357 = int(_355);
    float _359 = in.m_66.x;
    float _361 = in.m_66.y;
    float _363 = in.m_66.z;
    float _365 = in.m_66.w;
    float _367 = in.m_58.x;
    float _369 = in.m_58.y;
    float _371 = _325 * _121;
    float _373 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _375 = int(_373);
    float _377 = float(_357);
    float _379 = _319 * _331;
    float _381 = 1.0 / _377;
    float _383 = in.m_58.z;
    float _385 = _319 * _349;
    float _387 = fma(_317, _329, _379);
    float _389 = float(_375);
    float _391 = _319 * _361;
    float _393 = fma(_317, _347, _385);
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _399 = fma(_317, _359, _391);
    float _401 = _369 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _403 = fma(_321, _351, _393);
    float _405 = _367 * 2.0;
    bool _407 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _409 = isnan(1.0);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _415 = _411 || _413;
    float _417 = exp2(_371);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _421 = 1.0 + _419;
    float _423 = fma(_401, -2.0, _395);
    float _425 = _369 * 2.0;
    float _427 = fma(_321, _333, _387);
    float _429 = -_397;
    float _431 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[77].x, _429);
    float _433 = fma(_321, _363, _399);
    float _435 = _369 + _383;
    float _437 = 1.0 / _421;
    float _439 = _369 + _367;
    float _441 = _435 + (-1.0);
    float _443 = _439 + (-1.0);
    float _445 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _447 = floor(_405);
    float _449 = _383 * 2.0;
    float _451 = -_417;
    float _453 = _451 + 1.0;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _459 = _381 * _121;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _463 = floor(_425);
    float _465 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[78].w, _455);
    float _467 = _345 ? _453 : 0.0;
    float _469 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[78].z, _461);
    float _471 = -_121;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[76].x, _431);
    float _475 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _423);
    float _477 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _465);
    float _479 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _469);
    float _481 = floor(_449);
    bool _483 = _447 > 0.0;
    float _485 = _403 + _353;
    bool _487 = _447 >= 0.0;
    bool _489 = isnan(_447);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = _389 * _121;
    if (_415)
    {
        float _499 = _467 * _437;
        _131 = _499;
    }
    float _501 = _131;
    float _503 = _433 + _365;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _515 = _513 != 0;
    int _517 = _495 ? 0 : 1;
    bool _519 = _463 > 0.0;
    bool _521 = _463 >= 0.0;
    bool _523 = isnan(_463);
    bool _525 = _521 || _523;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    float _531 = _427 + _335;
    bool _533 = !_511;
    int _535 = _533 ? 0 : 1;
    bool _537 = _481 >= 0.0;
    bool _539 = isnan(_481);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    bool _547 = !_507;
    int _549 = _547 ? 0 : 1;
    bool _551 = !_515;
    int _553 = _551 ? 0 : 1;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _561 = _559 != 0;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _565 = _563 != 0;
    int _567 = ~_517;
    int _569 = _567 + 1;
    int _571 = _569 + 1;
    int _573 = _571;
    if (!_483)
    {
        int _575 = ~_517;
        int _577 = _575 + 1;
        _573 = _577;
    }
    int _579 = _573;
    float _581 = in.m_68.x;
    float _583 = in.m_68.y;
    float _585 = in.m_68.z;
    int _587 = _529 ? 0 : 1;
    bool _589 = !_557;
    int _591 = _589 ? 0 : 1;
    bool _593 = !_561;
    int _595 = _593 ? 0 : 1;
    bool _597 = _481 > 0.0;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _503 + _599;
    int _603 = ~_587;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    int _609 = abs(_591);
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _613 = _531 + _611;
    int _615 = _607;
    if (!_519)
    {
        int _617 = ~_587;
        int _619 = _617 + 1;
        _615 = _619;
    }
    int _621 = _615;
    int _623 = abs(_595);
    float _625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _627 = _485 + _625;
    float _629 = _613 * _613;
    float _631 = float(_579);
    float _633 = float(_623);
    float _635 = fma(_627, _627, _629);
    int _637 = _545 ? 0 : 1;
    bool _639 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _641 = isnan(0.5);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _647 = _643 || _645;
    float _649 = _633 * _631;
    int _651 = ~_637;
    int _653 = _651 + 1;
    int _655 = _653 + 1;
    int _657 = _655;
    if (!_597)
    {
        int _659 = ~_637;
        int _661 = _659 + 1;
        _657 = _661;
    }
    int _663 = _657;
    float _665 = _649 * (-2.0);
    float _667 = float(_609);
    float _669 = fma(_601, _601, _635);
    float _671 = float(_663);
    float _673 = _369 + (-0.5);
    bool _675 = !_565;
    int _677 = _675 ? 0 : 1;
    float _679 = sqrt(_669);
    float _681 = fma(_665, _583, _583);
    float _683 = fma(_445, _665, _445);
    int _685 = abs(_677);
    float _687 = _383 + _367;
    float _689 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[196].y, _681);
    float _691 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _693 = _667 * _671;
    float _695 = float(_621);
    float _697 = _687 + (-1.0);
    float _699 = rsqrt(_669);
    float _701 = float(_685);
    float _703 = _691 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _705 = _693 * (-2.0);
    float _707 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = _679 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _711 = _701 * _695;
    float _713 = _367 + (-0.5);
    float _715 = fma(_705, _581, _581);
    float _717 = fma(_683, _501, _689);
    float _719 = precise::min(_703, _709);
    float _721 = fma(_457, _705, _457);
    float _723 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[196].x, _715);
    float _725 = _717 * 0.15915493667125701904296875;
    float _727 = _711 * (-2.0);
    float _729 = _383 + (-0.5);
    float _731 = _699 * _719;
    float _733 = fma(_721, _501, _723);
    float _735 = fma(_727, _585, _585);
    float _737 = fma(_707, _727, _707);
    float _739 = _613 * _731;
    float _741 = _627 * _731;
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _735);
    float _745 = _601 * _731;
    float _747 = -_739;
    float _749 = _613 + _747;
    float _751 = -_741;
    float _753 = _627 + _751;
    float _755 = fma(_737, _501, _743);
    float _757 = -_745;
    float _759 = _601 + _757;
    float _761 = _749 * _749;
    float _763 = _733 * 0.15915493667125701904296875;
    float _765 = _755 * 0.15915493667125701904296875;
    float _767 = _725 * 6.283185482025146484375;
    float _769 = sin(_767);
    float _771 = fma(_753, _753, _761);
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _783 = _779 || _781;
    float _785 = fma(_759, _759, _771);
    float _787 = _725 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = sqrt(_785);
    float _793 = _763 * 6.283185482025146484375;
    float _795 = sin(_793);
    float _797 = _765 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = _699 * _791;
    float _803 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _805 = _327 * _801;
    float _807 = _763 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _795 * _769;
    float _813 = _795 * _789;
    float _815 = _805 * _773;
    float _817 = _765 * 6.283185482025146484375;
    float _819 = sin(_817);
    float _821 = _795 * _799;
    float _823 = _789 * _799;
    float _825 = _821 * _815;
    float _827 = _809 * _789;
    float _829 = _809 * _769;
    float _831 = _809 * _799;
    float _833 = _769 * _799;
    float _835 = _691 * _801;
    float _837 = _801 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _839 = _837 * 0.5;
    float _841 = _831 * _815;
    float _843 = fma(_819, _827, _811);
    float _845 = _835 * _803;
    float _847 = -_829;
    float _849 = fma(_819, _813, _847);
    float _851 = -_813;
    float _853 = fma(_819, _829, _851);
    float _855 = -_815;
    float _857 = _819 * _855;
    float _859 = fma(_843, _845, _841);
    float _861 = fma(_819, _811, _827);
    float _863 = fma(_849, _845, _825);
    float _865 = fma(_823, _845, _857);
    float _867 = fma(_853, _839, _859);
    float _869 = -_739;
    float _871 = _531 + _869;
    float _873 = fma(_861, _839, _863);
    float _875 = fma(_833, _839, _865);
    float _877 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _879 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _885 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _877);
    float _887 = -_741;
    float _889 = _485 + _887;
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _879);
    float _893 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].z, _885);
    float _897 = -_745;
    float _899 = _503 + _897;
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].x, _881);
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].z, _891);
    float _905 = _895 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].x, _883);
    float _909 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[11].z, _901);
    float _911 = _903 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _913 = _503 + _905;
    float _915 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _919 = _485 + _911;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _923 = _913 + _921;
    float _925 = _915 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _927 = 1.0 / _917;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _931 = _919 + _929;
    float _933 = _923 * _923;
    float _935 = _925 + _917;
    float _937 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _939 = fma(_931, _931, _933);
    float _941 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].z, _937);
    float _943 = sqrt(_939);
    float _945 = _941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _947 = _935 * _927;
    float _949 = _947 * 0.5;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _953 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _951);
    float _955 = _531 + _945;
    float _957 = 1.0 / _953;
    bool _959 = _943 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _961 = _945;
    float _963 = _913;
    float _965 = _919;
    float _967 = _933;
    float _969 = _931;
    float _971 = _953;
    float _973 = _927;
    if (!_959)
    {
        _961 = _913;
    }
    float _975 = _961;
    float _977 = _975;
    if (!_959)
    {
        _963 = _955;
    }
    float _979 = _963;
    bool _981 = !_959;
    float _983 = _979;
    float _985 = _957;
    if (!_981)
    {
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _989 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _991 = _943 + _989;
        float _993 = rsqrt(_939);
        float _995 = _991 * _987;
        float _997 = _955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _999 = _995 * 0.15915493667125701904296875;
        float _1001 = _999 * 6.283185482025146484375;
        float _1003 = cos(_1001);
        float _1005 = _999 * 6.283185482025146484375;
        float _1007 = sin(_1005);
        float _1009 = _1003 + (-1.0);
        float _1011 = _1009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = fma(_1007, _997, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1015 = fma(_955, _1003, _1011);
        float _1017 = _993 * _1013;
        float _1019 = fma(_931, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1021 = fma(_923, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _965 = _1019;
        _983 = _1015;
        _977 = _1021;
        _967 = _999;
    }
    float _1023 = _965;
    float _1025 = _983;
    float _1027 = _977;
    float _1029 = _967;
    float _1031 = -_741;
    float _1033 = _1031 + _1023;
    float _1035 = -_739;
    float _1037 = _1035 + _1025;
    float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1041 = _957 * _1039;
    float _1043 = -_745;
    float _1045 = _1043 + _1027;
    float _1047 = _1037;
    float _1049 = _1045;
    float _1051 = _1029;
    if (_647)
    {
        _969 = 1.0;
    }
    float _1053 = _969;
    float _1055 = _1053;
    if (_783)
    {
        _985 = _1033;
    }
    float _1057 = _985;
    float _1059 = _1057;
    if (!_783)
    {
        float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1063 = _871 + _1061;
        float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1067 = _889 + _1065;
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1071 = -_485;
        float _1073 = _1071 + _1023;
        float _1075 = _1063 * _1063;
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1079 = _899 + _1077;
        float _1081 = -_531;
        float _1083 = _1081 + _1025;
        float _1085 = -_503;
        float _1087 = _1085 + _1027;
        float _1089 = fma(_1067, _1067, _1075);
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1093 = fma(_1079, _1079, _1089);
        float _1095 = sqrt(_1093);
        float _1097 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1099 = precise::min(_1095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1101 = _1099 * _1091;
        float _1103 = _1097 * _1101;
        float _1105 = fma(_1073, _1103, _889);
        float _1107 = fma(_1083, _1103, _871);
        float _1109 = fma(_1087, _1103, _899);
        _1047 = _1107;
        _1059 = _1105;
        _1049 = _1109;
    }
    float _1111 = _1047;
    float _1113 = _1059;
    float _1115 = _1049;
    if (!_647)
    {
        float _1117 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1123 = _1119 * 6.283185482025146484375;
        float _1125 = cos(_1123);
        float _1127 = _1121 * 0.15915493667125701904296875;
        float _1129 = _1119 * 6.283185482025146484375;
        float _1131 = sin(_1129);
        float _1133 = 1.0 / _1125;
        float _1135 = _1127 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1131 * _1133;
        float _1141 = _1127 * 6.283185482025146484375;
        float _1143 = sin(_1141);
        float _1145 = _1137 * _1139;
        float _1147 = 1.0 / _1145;
        float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1151 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1149;
        float _1153 = 1.0 / _1151;
        float _1155 = _1143 * _1147;
        float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1159 = fma(_1041, _1155, _1157);
        float _1161 = _1159 * _1153;
        float _1163 = precise::clamp(_1161, 0.0, 1.0);
        _1055 = _1163;
    }
    float _1165 = _1055;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1169 = _1111 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1173 = _1113 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1177 = _1115 + _1175;
    float _1179 = _1169 * _1169;
    float _1181 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1183 = fma(_1173, _1173, _1179);
    float _1185 = fma(_1177, _1177, _1183);
    float _1187 = rsqrt(_1185);
    float _1189 = sqrt(_1185);
    float _1191 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1193 = _1173 * _1191;
    float _1195 = _1177 * _1191;
    float _1197 = _1193 * _1193;
    float _1199 = _1195 * _1195;
    float _1201 = _1197 + _1199;
    float _1203 = sqrt(_1201);
    bool _1205 = _1203 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1209 = _1203 + _1207;
    float _1211 = _1023;
    float _1213 = _1201;
    float _1215 = _1209;
    float _1217 = _1191;
    float _1219 = _1193;
    float _1221 = _1195;
    float _1223 = _1197;
    float _1225 = _1199;
    if (_1205)
    {
        float _1227 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1227;
    }
    float _1229 = _1211;
    if (_1205)
    {
        float _1231 = rsqrt(_1201);
        _1213 = _1231;
    }
    float _1233 = _1213;
    if (_1205)
    {
        float _1235 = _1209 * _1229;
        _1215 = _1235;
    }
    float _1237 = _1215;
    if (_1205)
    {
        float _1239 = _1237 * 0.15915493667125701904296875;
        _971 = _1239;
    }
    float _1241 = _971;
    float _1243 = _1025;
    if (_1205)
    {
        float _1245 = _1241 * 6.283185482025146484375;
        float _1247 = sin(_1245);
        _1243 = _1247;
    }
    float _1249 = _1243;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = precise::max(0.0, _1251);
    float _1255 = _1229;
    if (_1205)
    {
        float _1257 = _1241 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = -_1191;
    float _1265 = -_1253;
    float _1267 = fma(_1169, _1263, _1265);
    if (_1205)
    {
        float _1269 = _1267 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1051 = _1269;
    }
    float _1271 = _1051;
    float _1273 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1275 = _1271;
    float _1277 = _1249;
    if (_1205)
    {
        float _1279 = fma(_1249, _1271, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1275 = _1279;
    }
    float _1281 = _1275;
    if (!_1205)
    {
        _1277 = _1267;
    }
    float _1283 = _1277;
    float _1285 = floor(_1273);
    float _1287 = _1283;
    if (_1205)
    {
        float _1289 = _1261 + (-1.0);
        _1217 = _1289;
    }
    float _1291 = _1217;
    float _1293 = _1291;
    if (_1205)
    {
        float _1295 = _1233 * _1281;
        _973 = _1295;
    }
    float _1297 = _973;
    float _1299 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1205)
    {
        float _1301 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1301;
    }
    float _1303 = _1293;
    if (_1205)
    {
        float _1305 = _1193 * _1297;
        _1219 = _1305;
    }
    float _1307 = _1219;
    if (_1205)
    {
        float _1309 = _1195 * _1297;
        _1221 = _1309;
    }
    float _1311 = _1221;
    float _1313 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1299);
    if (_1205)
    {
        float _1315 = fma(_1267, _1261, _1303);
        _1287 = _1315;
    }
    float _1317 = _1287;
    if (_1205)
    {
        float _1319 = _1307 * _1307;
        _1223 = _1319;
    }
    float _1321 = _1223;
    if (_1205)
    {
        float _1323 = _1311 * _1311;
        _1225 = _1323;
    }
    float _1325 = _1225;
    float _1327 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1329 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1313);
    float _1331 = fma(_1317, _1317, _1321);
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1335 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1333);
    float _1337 = precise::clamp(_1335, 0.0, 1.0);
    float _1339 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1327);
    float _1341 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1343 = _1331 + _1325;
    float _1345 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1347 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1181);
    float _1349 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1339);
    float _1351 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1353 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1345);
    float _1355 = rsqrt(_1343);
    float _1357 = -_1337;
    float _1359 = _1357 + 1.0;
    float _1361 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1363 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1365 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1347);
    float _1367 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1369 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1371 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = abs(_1359);
    float _1375 = log2(_1373);
    float _1377 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1351);
    float _1379 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1381 = -_1285;
    float _1383 = _1273 + _1381;
    float _1385 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1377);
    float _1387 = _1355 * _1307;
    float _1389 = _1355 * _1317;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1393 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1385);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1397 = _1355 * _1311;
    float _1399 = floor(_1379);
    float _1401 = -_1367;
    float _1403 = fma(_1401, _1391, 1.0);
    float _1405 = -_1395;
    float _1407 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1405);
    float _1409 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1411 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1413 = -_1397;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1407);
    float _1417 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1419 = exp2(_1409);
    float _1421 = fma(_1415, -0.5, 0.5);
    float _1423 = fma(_1415, 0.5, 0.5);
    float _1425 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1417);
    float _1427 = _1389 + 1.0;
    float _1429 = log2(_1403);
    float _1431 = -_1399;
    float _1433 = _1379 + _1431;
    float _1435 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1411);
    float _1437 = fma(_1423, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1439 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1425);
    float _1441 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1435);
    float _1443 = fma(_1423, _1437, -0.212114393711090087890625);
    float _1445 = 1.0 / _1393;
    float _1447 = -_1389;
    float _1449 = fma(_1419, _1427, _1447);
    float _1451 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1439);
    float _1453 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1441);
    float _1455 = fma(_1423, _1443, 1.570728778839111328125);
    float _1457 = fma(_1449, 0.5, 0.5);
    float _1459 = sqrt(_1421);
    float _1461 = _1429 * 0.693147182464599609375;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1465 = _1451 * _1445;
    float _1467 = _1453 * _1445;
    float _1469 = fma(_1465, 0.5, 0.5);
    float _1471 = fma(_1467, -0.5, 0.5);
    float _1473 = _1459 * 0.636619746685028076171875;
    float2 _4784 = float2(_1383, _1433);
    float _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4784, float2(0.0), isnan(_4784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4784, float2(0.0), isnan(_4784)), level(0.0)).x;
    float _1477 = -_1455;
    float _1479 = fma(_1473, _1477, 1.0);
    float3 _4800 = float3(_1469, _1471, _1463);
    float _1481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4800, float3(0.0), isnan(_4800)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4800, float3(0.0), isnan(_4800)), level(0.0)).x;
    float3 _4811 = float3(_1469, _1471, _1463);
    float4 _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4811, float3(0.0), isnan(_4811)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4811, float3(0.0), isnan(_4811)), level(0.0)).xyzw;
    float _1486 = _1484.x;
    float _1488 = _1484.y;
    float _1490 = _1484.z;
    float _1492 = _1484.w;
    float2 _4827 = float2(_1479, _1457);
    float3 _1496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4827, float2(0.0), isnan(_4827)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4827, float2(0.0), isnan(_4827)), level(0.0)).xyz;
    float _1498 = _1496.x;
    float _1500 = _1496.y;
    float _1502 = _1496.z;
    float _1504 = float(uint(_375));
    float _1506 = trunc(_459);
    int _1508 = int(_1506);
    int _1510 = ~_375;
    int _1512 = _1510 + 1;
    float _1514 = _497 * _169;
    float _1516 = -_479;
    float _1518 = _1516 + 1.0;
    int _1520 = abs(_535);
    float _1522 = -_477;
    float _1524 = _1522 + 1.0;
    int _1526 = abs(_553);
    float _1528 = 1.0 / _1504;
    bool _1530 = _369 > 0.5;
    out.m_70.w = _719;
    out.m_72.x = _889;
    out.m_72.y = _871;
    out.m_72.z = _899;
    float _1532 = float(uint(_1508));
    float _1534 = trunc(_1514);
    int _1536 = int(_1534);
    out.m_74.x = _1113;
    out.m_74.y = _1111;
    out.m_74.z = _1115;
    out.m_76.x = _835;
    int _1538 = as_type<int>(_1528) + (-2);
    float _1540 = _843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1542 = as_type<float>(_1538) * _1532;
    float _1544 = trunc(_1542);
    float _1546 = precise::max(_1544, 0.0);
    uint _1549 = uint(_1546);
    int _1551 = _1512 * int(_1549);
    int _1553 = _1551 + _1508;
    float _1555 = float(uint(_1553));
    float _1557 = as_type<float>(_1538) * _1555;
    int _1559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1561 = _1559 != 0;
    float _1563 = trunc(_1557);
    float _1565 = precise::max(_1563, 0.0);
    uint _1567 = uint(_1565);
    int _1569 = ~_375;
    int _1571 = _1569 + 1;
    bool _1573 = !_1561;
    float _1575 = _1573 ? 7.345489978790283203125 : 1.0;
    float _1577 = _1575 * _367;
    float _1579 = float(_1508);
    bool _1581 = _1579 >= _389;
    bool _1583 = isnan(_1579);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(_389);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    int _1593 = int(_1549) + int(_1567);
    float _1595 = floor(_1577);
    int _1597 = _1571 * _1593;
    int _1599 = _1597 + _1508;
    bool _1601 = uint(_1599) >= uint(_375);
    float _1603 = trunc(_1591);
    int _1605 = int(_1603);
    float _1607 = -_1595;
    float _1609 = _1577 + _1607;
    bool _1611 = !_1601;
    int _1613 = _1611 ? 0 : (-1);
    bool _1615 = _375 == 0;
    int _1617 = ~_1593;
    int _1619 = _1617 + _1613;
    int _1621 = _1619 + 1;
    float _1623 = _1609 * _389;
    int _1625 = ~_1605;
    int _1627 = _1625 + 1;
    int _1629 = _1627 + 1;
    int _1631 = _375 * _1621;
    int _1633 = _1631 + _1508;
    int _1635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1637 = _1635 != 0;
    float _1639 = trunc(_1623);
    int _1641 = int(_1639);
    int _1643 = _375 + (-1);
    bool _1645 = !_1615;
    int _1647 = _1645 ? _1633 : (-1);
    bool _1649 = !_1637;
    int _1651 = _1649 ? 0 : 1;
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1655 = _1653 != 0;
    int _1657 = _1647 * _1629;
    int _1659 = abs(_1651);
    int _1661 = abs(_549);
    int _1663 = _1605 * _1643;
    int _1665 = _1663 + _1657;
    bool _1667 = !_1655;
    int _1669 = _1667 ? 0 : 1;
    bool _1671 = _367 > 0.5;
    int _1673 = _1665 * _1520;
    int _1675 = abs(_1669);
    int _1677 = _1641 * _1659;
    int _1679 = _1677 + _1508;
    int _1681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1683 = _1681 != 0;
    int _1685 = _1536 * _1661;
    int _1687 = _1685 + _1673;
    float _1689 = float(uint(_1679));
    int _1691 = _1679 * _1526;
    int _1693 = _1691 + _1687;
    bool _1695 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1697 = isnan(_315);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    int _1707 = _1641 * _1675;
    int _1709 = _1707 + _1693;
    float _1711 = as_type<float>(_1538) * _1689;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1717 = -_185;
    int _1719 = _1671 ? as_type<int>(_1717) : as_type<int>(_185);
    float _1721 = float(uint(_1709));
    float _1723 = trunc(_1711);
    float _1725 = precise::max(_1723, 0.0);
    uint _1727 = uint(_1725);
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1731 = _1729 != 0;
    float _1733 = as_type<float>(_1538) * _1721;
    int _1735 = ~_375;
    int _1737 = _1735 + 1;
    bool _1739 = !_1683;
    float _1741 = _1739 ? _185 : as_type<float>(_1719);
    float _1743 = 1.0 / _1715;
    int _1745 = ~_375;
    int _1747 = _1745 + 1;
    float _1749 = _1741 + 0.5;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[80].x, _473);
    float _1753 = trunc(_1733);
    float _1755 = precise::max(_1753, 0.0);
    uint _1757 = uint(_1755);
    float _1759 = -_1518;
    float _1761 = fma(_1741, _1759, _1751);
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1765 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1767 = _1737 * int(_1757);
    int _1769 = _1767 + _1709;
    float _1771 = float(uint(_1769));
    float _1773 = as_type<float>(_1538) * _1771;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1775;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1781 = _315 + _1779;
    bool _1783 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1785 = isnan(_315);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    float _1795 = _1777 * _1743;
    float _1797 = -_1705;
    float _1799 = _1797 + 1.0;
    float _1801 = trunc(_1773);
    float _1803 = precise::max(_1801, 0.0);
    uint _1805 = uint(_1803);
    float _1807 = fma(_1795, _1781, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1809 = _1793 * _1799;
    int _1811 = ~_375;
    int _1813 = _1811 + 1;
    float _1815 = _1807 * _1809;
    float _1817 = -_189;
    int _1819 = _1530 ? as_type<int>(_1817) : as_type<int>(_189);
    bool _1821 = !_1731;
    float _1823 = _1821 ? _189 : as_type<float>(_1819);
    float _1825 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1827 = -_1793;
    float _1829 = _1827 + 1.0;
    int _1831 = int(_1757) + int(_1805);
    float _1833 = _1823 + (-0.5);
    int _1835 = _1813 * int(_1727);
    int _1837 = _1835 + _1679;
    float _1839 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1815);
    float _1841 = -_1833;
    float _1843 = -_475;
    float _1845 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1843);
    int _1847 = _1747 * _1831;
    int _1849 = _1847 + _1709;
    float _1851 = float(uint(_1837));
    float _1853 = fma(_1823, _1524, _1845);
    float _1855 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1839);
    bool _1857 = uint(_1849) >= uint(_375);
    float _1859 = as_type<float>(_1538) * _1851;
    float _1861 = _1855 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1863 = !_1857;
    int _1865 = _1863 ? 0 : (-1);
    float _1867 = trunc(_1859);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1875 = _1873 != 0;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1879 = ~_1831;
    int _1881 = _1879 + _1865;
    int _1883 = _1881 + 1;
    out.m_78.x = _1761;
    out.m_78.y = _1853;
    float _1885 = _1877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1887 = _375 * _1883;
    int _1889 = _1887 + _1709;
    int _1891 = ~_375;
    int _1893 = _1891 + 1;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1899 = !_1615;
    int _1901 = _1899 ? _1889 : (-1);
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1907 = int(_1727) + int(_1871);
    float _1909 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1913 = _1901 >> 31;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1917 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1919 = _1913 & 3;
    out.m_80.x = _1885;
    out.m_80.y = _1903;
    out.m_80.z = _1909;
    out.m_80.w = _1861;
    int _1921 = _1901 & 3;
    bool _1923 = _1921 != 0;
    float _1925 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1927 = _1901 + _1919;
    int _1929 = _1927 >> 2;
    out.m_82.x = _1915;
    out.m_82.y = _1765;
    out.m_82.z = _1917;
    out.m_82.w = _1925;
    int _1931 = _1929 << 4;
    int _1933 = _1931 + 368;
    float _1935 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1540);
    uint _1937 = uint(int(uint(_1933) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[int(_1947)][_1949];
    float _1953 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1935);
    float _1955 = _831 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1957 = _831 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1959 = _831 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1961 = _1893 * _1907;
    int _1963 = _1961 + _1679;
    float _1965 = -_819;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1955);
    float _1969 = -_819;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1957);
    float _1973 = -_819;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1959);
    float _1977 = _843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1979 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _1981 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1971);
    float _1983 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1975);
    float _1985 = _843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1987 = uint(_1963) >= uint(_375);
    float _1989 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1977);
    float _1991 = _1825 * _1979;
    int _1993 = _1901 & 3;
    bool _1995 = _1993 != 0;
    int _1997 = _1933 + 8;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    float _2015 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1985);
    float _2017 = _853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2019 = abs(_1041);
    float _2021 = log2(_2019);
    bool _2023 = uint(_1993) > 1u;
    float _2025 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2015);
    float _2027 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2029 = _1923 ? 0 : 1;
    float _2031 = _853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2033 = _853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2035 = _1825 * _1981;
    int _2037 = ~_2029;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    float _2043 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2017);
    float _2045 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2031);
    float _2047 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2033);
    float _2049 = _1825 * _1983;
    float _2051 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1989);
    int _2053 = _2041;
    if (!_2023)
    {
        int _2055 = ~_2029;
        int _2057 = _2055 + 1;
        _2053 = _2057;
    }
    int _2059 = _2053;
    float _2061 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2043);
    bool _2063 = _1993 != 3;
    float _2065 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2067 = uint(_1993) >= 2u;
    float _2069 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2045);
    float _2071 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2047);
    int _2073 = abs(_2059);
    float _2075 = fma(_2027, _2051, _2035);
    float _2077 = exp2(_2065);
    int _2079 = _2067 ? 0 : 1;
    float _2081 = fma(_2027, _1953, _1991);
    bool _2083 = !_1995;
    int _2085 = _2083 ? 0 : 1;
    float _2087 = -_1475;
    float _2089 = _2087 + 1.0;
    int _2091 = ~_2073;
    int _2093 = _2091 + 1;
    int _2095 = _2093 + 1;
    int _2097 = ~_2079;
    int _2099 = _2097 + 1;
    int _2101 = _2099 + 1;
    bool _2103 = _1993 != 3;
    int _2105 = _2095 * as_type<int>(_1951);
    int _2107 = abs(_2085);
    int _2109 = _2101;
    float _2111 = _2089;
    if (_2063)
    {
        int _2113 = ~_2079;
        int _2115 = _2113 + 1;
        _2109 = _2115;
    }
    int _2117 = _2109;
    bool _2119 = !_2103;
    int _2121 = _2119 ? 0 : (-1);
    int _2123 = abs(_2117);
    bool _2125 = !_1875;
    int _2127 = _2125 ? 0 : 1;
    int _2129 = abs(_2121);
    float _2131 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    int _2135 = ~_2107;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    float _2141 = in.m_84.x;
    int _2143 = _2139 * as_type<int>(_1943);
    int _2145 = _2143 + _2105;
    int _2147 = abs(_2127);
    int _2149 = ~_2123;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2133, -2.0, 3.0);
    float _2157 = _2133 * _2133;
    int _2159 = _2153 * as_type<int>(_2005);
    int _2161 = _2159 + _2145;
    float _2163 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2165 = _2157 * _2155;
    bool _2167 = !_1987;
    int _2169 = _2167 ? 0 : (-1);
    float _2171 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2163);
    float _2173 = -_2165;
    float _2175 = _2173 + 1.0;
    int _2177 = ~_2129;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    int _2183 = ~_1907;
    int _2185 = _2183 + _2169;
    int _2187 = _2185 + 1;
    float _2189 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2165);
    float _2191 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2193 = _2181 * as_type<int>(_2013);
    int _2195 = _2193 + _2161;
    int _2197 = _375 * _2187;
    int _2199 = _2197 + _1679;
    float _2201 = exp2(_2191);
    bool _2203 = _1041 <= 8000.0;
    bool _2205 = isnan(_1041);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan(8000.0);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2171);
    int _2217 = ~_2147;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    float _2223 = _1393 * 0.5;
    bool _2225 = !_1615;
    int _2227 = _2225 ? _2199 : (-1);
    float _2229 = _2213 * _2189;
    bool _2231 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2233 = isnan(_1189);
    bool _2235 = _2231 || _2233;
    bool _2237 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2239 = _2235 || _2237;
    int _2241 = _2195 * _2221;
    float _2243 = fma(_2027, _2025, _2049);
    float _2245 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2215);
    float _2247 = _2069 + _2075;
    int _2249 = _2227 * _2147;
    int _2251 = _2249 + _2241;
    float _2253 = _2071 + _2243;
    float _2255 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1451;
    out.gl_Position.y = _1453;
    out.gl_Position.z = _2245;
    out.gl_Position.w = _1393;
    float _2257 = -_2201;
    float _2259 = _2257 + 1.0;
    float _2261 = float(_2251);
    float _2263 = _2061 + _2081;
    float _2265 = _2259 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2267 = _2089 * _2255;
    float _2269 = precise::clamp(_2267, 0.0, 1.0);
    float _2271 = _2245 + _1393;
    out.m_86.x = _2263;
    out.m_86.y = _2247;
    out.m_86.z = _2253;
    float _2273 = _2265 * _1481;
    float _2275 = -_2265;
    float _2277 = _2275 + 1.0;
    float _2279 = -_2269;
    float _2281 = fma(_2279, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2283 = _1451 + _1393;
    float _2285 = _1492 * _2273;
    float _2287 = _1502 * _2273;
    float _2289 = _1492 * _2277;
    float _2291 = _2281 * _2141;
    float _2293 = fma(_1498, _2285, _1486);
    float _2295 = fma(_1500, _2285, _1488);
    float _2297 = fma(_1492, _2287, _1490);
    float _2299 = _2271 * 0.5;
    float _2301 = _2283 * 0.5;
    float _2303 = fma(_1453, -0.5, _2223);
    out.m_88.x = _2293;
    out.m_88.y = _2295;
    out.m_88.z = _2297;
    out.m_88.w = _2289;
    float _2305 = _2291 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2307 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2309 = _2291;
    float _2311 = _2261;
    float _2313 = _2299;
    float _2315 = _2301;
    float _2317 = _2305;
    if (!_2239)
    {
        _2111 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2319 = _2111;
    out.m_90.x = _2301;
    out.m_90.y = _2303;
    out.m_90.z = _2299;
    out.m_90.w = _1393;
    float _2321 = _2319;
    float _2323 = _2319;
    if (!_2239)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2325 = _2309;
    out.m_92.x = _2261;
    out.m_94.x = _2305;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2239)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2331 = _2311;
    float _2333 = _2331;
    float _2335 = _2331;
    if (!_2239)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2337 = _2313;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2239)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2343 = _2315;
    float _2345 = _2343;
    float _2347 = _2343;
    if (!_2239)
    {
        _2317 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2349 = _2317;
    bool _2351 = !_2239;
    float _2353 = _2349;
    float _2355 = _2349;
    if (!_2351)
    {
        bool _2357 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2359 = isnan(_1189);
        bool _2361 = _2357 || _2359;
        bool _2363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2365 = _2361 || _2363;
        if (!_2365)
        {
            float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2369 = _1189 + _2367;
            float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2373 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2371;
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2377 = _2375 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2381 = _2379 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2383 = 1.0 / _2373;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2397 = _2369 * _2383;
            float _2399 = precise::clamp(_2397, 0.0, 1.0);
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2405 = fma(_2399, _2377, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2407 = fma(_2399, _2381, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2409 = fma(_2399, _2403, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2411 = fma(_2399, _2387, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2413 = fma(_2399, _2391, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2415 = fma(_2399, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2347 = _2407;
            _2335 = _2413;
            _2341 = _2405;
            _2329 = _2411;
            _2323 = _2409;
            _2355 = _2415;
            _2417 = true;
        }
        else
        {
            bool _2419 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2421 = isnan(_1189);
            bool _2423 = _2419 || _2421;
            bool _2425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2427 = _2423 || _2425;
            if (!_2427)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2429 = _2339;
            _2341 = _2429;
            if (!_2427)
            {
                _2345 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2431 = _2345;
            _2347 = _2431;
            if (!_2427)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2433 = _2321;
            _2323 = _2433;
            if (!_2427)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2435 = _2327;
            _2329 = _2435;
            if (!_2427)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2437 = _2333;
            _2335 = _2437;
            if (!_2427)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2439 = _2353;
            bool _2441 = !_2427;
            _2355 = _2439;
            if (!_2441)
            {
                bool _2443 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2445 = isnan(_1189);
                bool _2447 = _2443 || _2445;
                bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2451 = _2447 || _2449;
                if (!_2451)
                {
                    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2455 = _1189 + _2453;
                    float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2459 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2457;
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2469 = 1.0 / _2459;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2483 = _2455 * _2469;
                    float _2485 = precise::clamp(_2483, 0.0, 1.0);
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2491 = fma(_2485, _2463, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2493 = fma(_2485, _2467, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2495 = fma(_2485, _2489, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2497 = fma(_2485, _2473, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2499 = fma(_2485, _2477, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2501 = fma(_2485, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2347 = _2493;
                    _2335 = _2499;
                    _2341 = _2491;
                    _2329 = _2497;
                    _2323 = _2495;
                    _2355 = _2501;
                    _2417 = true;
                }
                else
                {
                    _2347 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2417 = false;
    float _2503 = _2347;
    float _2505 = _2335;
    float _2507 = _2341;
    float _2509 = _2329;
    float _2511 = _2323;
    float _2513 = _2355;
    float _2515 = fma(_2247, -0.5, 0.5);
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = -_2503;
    float _2521 = _2519 + _2505;
    float _2523 = _2307 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2525 = -_2507;
    float _2527 = _2525 + _2509;
    out.m_96.x = 0.0;
    float _2529 = fma(_2517, _2521, _2503);
    float _2531 = fma(_2517, _2527, _2507);
    out.m_53.x = _2523;
    float _2533 = -_2511;
    float _2535 = _2533 + _2513;
    float _2537 = _2529 * 0.586610972881317138671875;
    bool _2539 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2541 = fma(_2517, _2535, _2511);
    float _2543 = fma(_2531, 0.298911988735198974609375, _2537);
    bool _2545 = _1165 > 0.0;
    bool _2547 = isnan(_1165);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan(0.0);
    bool _2553 = _2549 || _2551;
    float _2555 = fma(_2541, 0.114477999508380889892578125, _2543);
    float _2557 = -_2555;
    float _2559 = _2531 + _2557;
    float _2561 = -_2555;
    float _2563 = _2529 + _2561;
    float _2565 = -_2555;
    float _2567 = _2541 + _2565;
    float _2569 = fma(_2559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2555);
    float _2571 = fma(_2563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2555);
    float _2573 = fma(_2567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2555);
    bool _2575 = !_2539;
    if (!_2575)
    {
        float _2577 = -_1111;
        float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2581 = -_1113;
        float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2585 = -_1115;
        float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2589 = _2579 * _2579;
        float _2591 = fma(_2583, _2583, _2589);
        float _2593 = fma(_2587, _2587, _2591);
        float _2595 = sqrt(_2593);
        float _2597 = rsqrt(_2593);
        float _2599 = -_2595;
        float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2603 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2605 = precise::clamp(_2603, 0.0, 1.0);
        float _2607 = _2583 * _2597;
        float _2609 = _2579 * _2597;
        float _2611 = abs(_2605);
        float _2613 = log2(_2611);
        float _2615 = _2587 * _2597;
        float _2617 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2619 = _2247 * _2609;
        float _2621 = -_2609;
        float _2623 = -_2617;
        float _2625 = fma(_2621, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2623);
        float _2627 = fma(_2263, _2607, _2619);
        float _2629 = -_2615;
        float _2631 = fma(_2629, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2625);
        float _2633 = fma(_2253, _2615, _2627);
        float _2635 = precise::clamp(_2633, 0.0, 1.0);
        float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2639 = _2631 + _2637;
        float _2641 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2643 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2645 = precise::clamp(_2643, 0.0, 1.0);
        float _2647 = exp2(_2641);
        float _2649 = _2647 * _2645;
        float _2651 = _2635 * _2649;
        float _2653 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2657 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2653;
        out.m_96.y = _2655;
        out.m_96.z = _2657;
    }
    out.m_70.x = _2569;
    out.m_70.y = _2571;
    out.m_70.z = _2573;
    if (_2553)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2659 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2659;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2417 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2728 = as_type<float>(_139);
        out.gl_Position.z = _2728;
    }
    if (!_125)
    {
        return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2783 = as_type<float>(_165);
        out.gl_Position.z = _2783;
    }
    if (_159)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _193 = _173;
    float _211;
    if (!_191)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _173;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    float _221 = in.m_60.x;
    float _223 = in.m_60.y;
    bool _225 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_215);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -_235;
    float _255 = _253 + 1.0;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    float _261 = 1.0 / _239;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _265 = _251 * _255;
    float _267 = -_251;
    float _269 = _267 + 1.0;
    float _271 = _219 * _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    float _293 = _289 * _221;
    float _295 = _291 * _223;
    bool _297 = !_263;
    if (!_297)
    {
        float _299 = in.m_58.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _193 = _313;
    }
    float _315 = _193;
    float _317 = in.m_46.x;
    float _319 = in.m_46.y;
    float _321 = in.m_46.z;
    float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _325 = log2(_323);
    float _327 = _295 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _329 = in.m_62.x;
    float _331 = in.m_62.y;
    float _333 = in.m_62.z;
    float _335 = in.m_62.w;
    bool _337 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _339 = isnan(0.0);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _345 = _341 || _343;
    float _347 = in.m_64.x;
    float _349 = in.m_64.y;
    float _351 = in.m_64.z;
    float _353 = in.m_64.w;
    float _355 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _357 = int(_355);
    float _359 = in.m_66.x;
    float _361 = in.m_66.y;
    float _363 = in.m_66.z;
    float _365 = in.m_66.w;
    float _367 = in.m_58.x;
    float _369 = in.m_58.y;
    float _371 = _325 * _121;
    float _373 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _375 = int(_373);
    float _377 = float(_357);
    float _379 = _319 * _331;
    float _381 = 1.0 / _377;
    float _383 = in.m_58.z;
    float _385 = _319 * _349;
    float _387 = fma(_317, _329, _379);
    float _389 = float(_375);
    float _391 = _319 * _361;
    float _393 = fma(_317, _347, _385);
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _399 = fma(_317, _359, _391);
    float _401 = _369 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _403 = fma(_321, _351, _393);
    float _405 = _367 * 2.0;
    bool _407 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _409 = isnan(1.0);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _415 = _411 || _413;
    float _417 = exp2(_371);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _421 = 1.0 + _419;
    float _423 = fma(_401, -2.0, _395);
    float _425 = _369 * 2.0;
    float _427 = fma(_321, _333, _387);
    float _429 = -_397;
    float _431 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[77].x, _429);
    float _433 = fma(_321, _363, _399);
    float _435 = _369 + _383;
    float _437 = 1.0 / _421;
    float _439 = _369 + _367;
    float _441 = _435 + (-1.0);
    float _443 = _439 + (-1.0);
    float _445 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _447 = floor(_405);
    float _449 = _383 * 2.0;
    float _451 = -_417;
    float _453 = _451 + 1.0;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _459 = _381 * _121;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _463 = floor(_425);
    float _465 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[78].w, _455);
    float _467 = _345 ? _453 : 0.0;
    float _469 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[78].z, _461);
    float _471 = -_121;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[76].x, _431);
    float _475 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _423);
    float _477 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _465);
    float _479 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _469);
    float _481 = floor(_449);
    bool _483 = _447 > 0.0;
    float _485 = _403 + _353;
    bool _487 = _447 >= 0.0;
    bool _489 = isnan(_447);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = _389 * _121;
    if (_415)
    {
        float _499 = _467 * _437;
        _131 = _499;
    }
    float _501 = _131;
    float _503 = _433 + _365;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _515 = _513 != 0;
    int _517 = _495 ? 0 : 1;
    bool _519 = _463 > 0.0;
    bool _521 = _463 >= 0.0;
    bool _523 = isnan(_463);
    bool _525 = _521 || _523;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    float _531 = _427 + _335;
    bool _533 = !_511;
    int _535 = _533 ? 0 : 1;
    bool _537 = _481 >= 0.0;
    bool _539 = isnan(_481);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    bool _547 = !_507;
    int _549 = _547 ? 0 : 1;
    bool _551 = !_515;
    int _553 = _551 ? 0 : 1;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _561 = _559 != 0;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _565 = _563 != 0;
    int _567 = ~_517;
    int _569 = _567 + 1;
    int _571 = _569 + 1;
    int _573 = _571;
    if (!_483)
    {
        int _575 = ~_517;
        int _577 = _575 + 1;
        _573 = _577;
    }
    int _579 = _573;
    float _581 = in.m_68.x;
    float _583 = in.m_68.y;
    float _585 = in.m_68.z;
    int _587 = _529 ? 0 : 1;
    bool _589 = !_557;
    int _591 = _589 ? 0 : 1;
    bool _593 = !_561;
    int _595 = _593 ? 0 : 1;
    bool _597 = _481 > 0.0;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _503 + _599;
    int _603 = ~_587;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    int _609 = abs(_591);
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _613 = _531 + _611;
    int _615 = _607;
    if (!_519)
    {
        int _617 = ~_587;
        int _619 = _617 + 1;
        _615 = _619;
    }
    int _621 = _615;
    int _623 = abs(_595);
    float _625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _627 = _485 + _625;
    float _629 = _613 * _613;
    float _631 = float(_579);
    float _633 = float(_623);
    float _635 = fma(_627, _627, _629);
    int _637 = _545 ? 0 : 1;
    bool _639 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _641 = isnan(0.5);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _647 = _643 || _645;
    float _649 = _633 * _631;
    int _651 = ~_637;
    int _653 = _651 + 1;
    int _655 = _653 + 1;
    int _657 = _655;
    if (!_597)
    {
        int _659 = ~_637;
        int _661 = _659 + 1;
        _657 = _661;
    }
    int _663 = _657;
    float _665 = _649 * (-2.0);
    float _667 = float(_609);
    float _669 = fma(_601, _601, _635);
    float _671 = float(_663);
    float _673 = _369 + (-0.5);
    bool _675 = !_565;
    int _677 = _675 ? 0 : 1;
    float _679 = sqrt(_669);
    float _681 = fma(_665, _583, _583);
    float _683 = fma(_445, _665, _445);
    int _685 = abs(_677);
    float _687 = _383 + _367;
    float _689 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[196].y, _681);
    float _691 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _693 = _667 * _671;
    float _695 = float(_621);
    float _697 = _687 + (-1.0);
    float _699 = rsqrt(_669);
    float _701 = float(_685);
    float _703 = _691 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _705 = _693 * (-2.0);
    float _707 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = _679 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _711 = _701 * _695;
    float _713 = _367 + (-0.5);
    float _715 = fma(_705, _581, _581);
    float _717 = fma(_683, _501, _689);
    float _719 = precise::min(_703, _709);
    float _721 = fma(_457, _705, _457);
    float _723 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[196].x, _715);
    float _725 = _717 * 0.15915493667125701904296875;
    float _727 = _711 * (-2.0);
    float _729 = _383 + (-0.5);
    float _731 = _699 * _719;
    float _733 = fma(_721, _501, _723);
    float _735 = fma(_727, _585, _585);
    float _737 = fma(_707, _727, _707);
    float _739 = _613 * _731;
    float _741 = _627 * _731;
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _735);
    float _745 = _601 * _731;
    float _747 = -_739;
    float _749 = _613 + _747;
    float _751 = -_741;
    float _753 = _627 + _751;
    float _755 = fma(_737, _501, _743);
    float _757 = -_745;
    float _759 = _601 + _757;
    float _761 = _749 * _749;
    float _763 = _733 * 0.15915493667125701904296875;
    float _765 = _755 * 0.15915493667125701904296875;
    float _767 = _725 * 6.283185482025146484375;
    float _769 = sin(_767);
    float _771 = fma(_753, _753, _761);
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _783 = _779 || _781;
    float _785 = fma(_759, _759, _771);
    float _787 = _725 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = sqrt(_785);
    float _793 = _763 * 6.283185482025146484375;
    float _795 = sin(_793);
    float _797 = _765 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = _699 * _791;
    float _803 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _805 = _327 * _801;
    float _807 = _763 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _795 * _769;
    float _813 = _795 * _789;
    float _815 = _805 * _773;
    float _817 = _765 * 6.283185482025146484375;
    float _819 = sin(_817);
    float _821 = _795 * _799;
    float _823 = _789 * _799;
    float _825 = _821 * _815;
    float _827 = _809 * _789;
    float _829 = _809 * _769;
    float _831 = _809 * _799;
    float _833 = _769 * _799;
    float _835 = _691 * _801;
    float _837 = _801 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _839 = _837 * 0.5;
    float _841 = _831 * _815;
    float _843 = fma(_819, _827, _811);
    float _845 = _835 * _803;
    float _847 = -_829;
    float _849 = fma(_819, _813, _847);
    float _851 = -_813;
    float _853 = fma(_819, _829, _851);
    float _855 = -_815;
    float _857 = _819 * _855;
    float _859 = fma(_843, _845, _841);
    float _861 = fma(_819, _811, _827);
    float _863 = fma(_849, _845, _825);
    float _865 = fma(_823, _845, _857);
    float _867 = fma(_853, _839, _859);
    float _869 = -_739;
    float _871 = _531 + _869;
    float _873 = fma(_861, _839, _863);
    float _875 = fma(_833, _839, _865);
    float _877 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _879 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _885 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _877);
    float _887 = -_741;
    float _889 = _485 + _887;
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _879);
    float _893 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].z, _885);
    float _897 = -_745;
    float _899 = _503 + _897;
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].x, _881);
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].z, _891);
    float _905 = _895 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].x, _883);
    float _909 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[11].z, _901);
    float _911 = _903 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _913 = _503 + _905;
    float _915 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _919 = _485 + _911;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _923 = _913 + _921;
    float _925 = _915 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _927 = 1.0 / _917;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _931 = _919 + _929;
    float _933 = _923 * _923;
    float _935 = _925 + _917;
    float _937 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _939 = fma(_931, _931, _933);
    float _941 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].z, _937);
    float _943 = sqrt(_939);
    float _945 = _941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _947 = _935 * _927;
    float _949 = _947 * 0.5;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _953 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _951);
    float _955 = _531 + _945;
    float _957 = 1.0 / _953;
    bool _959 = _943 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _961 = _945;
    float _963 = _913;
    float _965 = _919;
    float _967 = _933;
    float _969 = _931;
    float _971 = _953;
    float _973 = _927;
    if (!_959)
    {
        _961 = _913;
    }
    float _975 = _961;
    float _977 = _975;
    if (!_959)
    {
        _963 = _955;
    }
    float _979 = _963;
    bool _981 = !_959;
    float _983 = _979;
    float _985 = _957;
    if (!_981)
    {
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _989 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _991 = _943 + _989;
        float _993 = rsqrt(_939);
        float _995 = _991 * _987;
        float _997 = _955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _999 = _995 * 0.15915493667125701904296875;
        float _1001 = _999 * 6.283185482025146484375;
        float _1003 = cos(_1001);
        float _1005 = _999 * 6.283185482025146484375;
        float _1007 = sin(_1005);
        float _1009 = _1003 + (-1.0);
        float _1011 = _1009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = fma(_1007, _997, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1015 = fma(_955, _1003, _1011);
        float _1017 = _993 * _1013;
        float _1019 = fma(_931, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1021 = fma(_923, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _965 = _1019;
        _983 = _1015;
        _977 = _1021;
        _967 = _999;
    }
    float _1023 = _965;
    float _1025 = _983;
    float _1027 = _977;
    float _1029 = _967;
    float _1031 = -_741;
    float _1033 = _1031 + _1023;
    float _1035 = -_739;
    float _1037 = _1035 + _1025;
    float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1041 = _957 * _1039;
    float _1043 = -_745;
    float _1045 = _1043 + _1027;
    float _1047 = _1037;
    float _1049 = _1045;
    float _1051 = _1029;
    if (_647)
    {
        _969 = 1.0;
    }
    float _1053 = _969;
    float _1055 = _1053;
    if (_783)
    {
        _985 = _1033;
    }
    float _1057 = _985;
    float _1059 = _1057;
    if (!_783)
    {
        float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1063 = _871 + _1061;
        float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1067 = _889 + _1065;
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1071 = -_485;
        float _1073 = _1071 + _1023;
        float _1075 = _1063 * _1063;
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1079 = _899 + _1077;
        float _1081 = -_531;
        float _1083 = _1081 + _1025;
        float _1085 = -_503;
        float _1087 = _1085 + _1027;
        float _1089 = fma(_1067, _1067, _1075);
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1093 = fma(_1079, _1079, _1089);
        float _1095 = sqrt(_1093);
        float _1097 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1099 = precise::min(_1095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1101 = _1099 * _1091;
        float _1103 = _1097 * _1101;
        float _1105 = fma(_1073, _1103, _889);
        float _1107 = fma(_1083, _1103, _871);
        float _1109 = fma(_1087, _1103, _899);
        _1047 = _1107;
        _1059 = _1105;
        _1049 = _1109;
    }
    float _1111 = _1047;
    float _1113 = _1059;
    float _1115 = _1049;
    if (!_647)
    {
        float _1117 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1123 = _1119 * 6.283185482025146484375;
        float _1125 = cos(_1123);
        float _1127 = _1121 * 0.15915493667125701904296875;
        float _1129 = _1119 * 6.283185482025146484375;
        float _1131 = sin(_1129);
        float _1133 = 1.0 / _1125;
        float _1135 = _1127 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1131 * _1133;
        float _1141 = _1127 * 6.283185482025146484375;
        float _1143 = sin(_1141);
        float _1145 = _1137 * _1139;
        float _1147 = 1.0 / _1145;
        float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1151 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1149;
        float _1153 = 1.0 / _1151;
        float _1155 = _1143 * _1147;
        float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1159 = fma(_1041, _1155, _1157);
        float _1161 = _1159 * _1153;
        float _1163 = precise::clamp(_1161, 0.0, 1.0);
        _1055 = _1163;
    }
    float _1165 = _1055;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1169 = _1111 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1173 = _1113 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1177 = _1115 + _1175;
    float _1179 = _1169 * _1169;
    float _1181 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1183 = fma(_1173, _1173, _1179);
    float _1185 = fma(_1177, _1177, _1183);
    float _1187 = rsqrt(_1185);
    float _1189 = sqrt(_1185);
    float _1191 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1193 = _1173 * _1191;
    float _1195 = _1177 * _1191;
    float _1197 = _1193 * _1193;
    float _1199 = _1195 * _1195;
    float _1201 = _1197 + _1199;
    float _1203 = sqrt(_1201);
    bool _1205 = _1203 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1209 = _1203 + _1207;
    float _1211 = _1023;
    float _1213 = _1201;
    float _1215 = _1209;
    float _1217 = _1191;
    float _1219 = _1193;
    float _1221 = _1195;
    float _1223 = _1197;
    float _1225 = _1199;
    if (_1205)
    {
        float _1227 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1227;
    }
    float _1229 = _1211;
    if (_1205)
    {
        float _1231 = rsqrt(_1201);
        _1213 = _1231;
    }
    float _1233 = _1213;
    if (_1205)
    {
        float _1235 = _1209 * _1229;
        _1215 = _1235;
    }
    float _1237 = _1215;
    if (_1205)
    {
        float _1239 = _1237 * 0.15915493667125701904296875;
        _971 = _1239;
    }
    float _1241 = _971;
    float _1243 = _1025;
    if (_1205)
    {
        float _1245 = _1241 * 6.283185482025146484375;
        float _1247 = sin(_1245);
        _1243 = _1247;
    }
    float _1249 = _1243;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = precise::max(0.0, _1251);
    float _1255 = _1229;
    if (_1205)
    {
        float _1257 = _1241 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = -_1191;
    float _1265 = -_1253;
    float _1267 = fma(_1169, _1263, _1265);
    if (_1205)
    {
        float _1269 = _1267 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1051 = _1269;
    }
    float _1271 = _1051;
    float _1273 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1275 = _1271;
    float _1277 = _1249;
    if (_1205)
    {
        float _1279 = fma(_1249, _1271, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1275 = _1279;
    }
    float _1281 = _1275;
    if (!_1205)
    {
        _1277 = _1267;
    }
    float _1283 = _1277;
    float _1285 = floor(_1273);
    float _1287 = _1283;
    if (_1205)
    {
        float _1289 = _1261 + (-1.0);
        _1217 = _1289;
    }
    float _1291 = _1217;
    float _1293 = _1291;
    if (_1205)
    {
        float _1295 = _1233 * _1281;
        _973 = _1295;
    }
    float _1297 = _973;
    float _1299 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1205)
    {
        float _1301 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1301;
    }
    float _1303 = _1293;
    if (_1205)
    {
        float _1305 = _1193 * _1297;
        _1219 = _1305;
    }
    float _1307 = _1219;
    if (_1205)
    {
        float _1309 = _1195 * _1297;
        _1221 = _1309;
    }
    float _1311 = _1221;
    float _1313 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1299);
    if (_1205)
    {
        float _1315 = fma(_1267, _1261, _1303);
        _1287 = _1315;
    }
    float _1317 = _1287;
    if (_1205)
    {
        float _1319 = _1307 * _1307;
        _1223 = _1319;
    }
    float _1321 = _1223;
    if (_1205)
    {
        float _1323 = _1311 * _1311;
        _1225 = _1323;
    }
    float _1325 = _1225;
    float _1327 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1329 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1313);
    float _1331 = fma(_1317, _1317, _1321);
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1335 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1333);
    float _1337 = precise::clamp(_1335, 0.0, 1.0);
    float _1339 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1327);
    float _1341 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1343 = _1331 + _1325;
    float _1345 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1347 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1181);
    float _1349 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1339);
    float _1351 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1353 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1345);
    float _1355 = rsqrt(_1343);
    float _1357 = -_1337;
    float _1359 = _1357 + 1.0;
    float _1361 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1363 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1365 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1347);
    float _1367 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1369 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1371 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = abs(_1359);
    float _1375 = log2(_1373);
    float _1377 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1351);
    float _1379 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1381 = -_1285;
    float _1383 = _1273 + _1381;
    float _1385 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1377);
    float _1387 = _1355 * _1307;
    float _1389 = _1355 * _1317;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1393 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1385);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1397 = _1355 * _1311;
    float _1399 = floor(_1379);
    float _1401 = -_1367;
    float _1403 = fma(_1401, _1391, 1.0);
    float _1405 = -_1395;
    float _1407 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1405);
    float _1409 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1411 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1413 = -_1397;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1407);
    float _1417 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1419 = exp2(_1409);
    float _1421 = fma(_1415, -0.5, 0.5);
    float _1423 = fma(_1415, 0.5, 0.5);
    float _1425 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1417);
    float _1427 = _1389 + 1.0;
    float _1429 = log2(_1403);
    float _1431 = -_1399;
    float _1433 = _1379 + _1431;
    float _1435 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1411);
    float _1437 = fma(_1423, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1439 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1425);
    float _1441 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1435);
    float _1443 = fma(_1423, _1437, -0.212114393711090087890625);
    float _1445 = 1.0 / _1393;
    float _1447 = -_1389;
    float _1449 = fma(_1419, _1427, _1447);
    float _1451 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1439);
    float _1453 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1441);
    float _1455 = fma(_1423, _1443, 1.570728778839111328125);
    float _1457 = fma(_1449, 0.5, 0.5);
    float _1459 = sqrt(_1421);
    float _1461 = _1429 * 0.693147182464599609375;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1465 = _1451 * _1445;
    float _1467 = _1453 * _1445;
    float _1469 = fma(_1465, 0.5, 0.5);
    float _1471 = fma(_1467, -0.5, 0.5);
    float _1473 = _1459 * 0.636619746685028076171875;
    float2 _4784 = float2(_1383, _1433);
    float _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4784, float2(0.0), isnan(_4784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4784, float2(0.0), isnan(_4784)), level(0.0)).x;
    float _1477 = -_1455;
    float _1479 = fma(_1473, _1477, 1.0);
    float3 _4800 = float3(_1469, _1471, _1463);
    float _1481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4800, float3(0.0), isnan(_4800)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4800, float3(0.0), isnan(_4800)), level(0.0)).x;
    float3 _4811 = float3(_1469, _1471, _1463);
    float4 _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4811, float3(0.0), isnan(_4811)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4811, float3(0.0), isnan(_4811)), level(0.0)).xyzw;
    float _1486 = _1484.x;
    float _1488 = _1484.y;
    float _1490 = _1484.z;
    float _1492 = _1484.w;
    float2 _4827 = float2(_1479, _1457);
    float3 _1496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4827, float2(0.0), isnan(_4827)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4827, float2(0.0), isnan(_4827)), level(0.0)).xyz;
    float _1498 = _1496.x;
    float _1500 = _1496.y;
    float _1502 = _1496.z;
    float _1504 = float(uint(_375));
    float _1506 = trunc(_459);
    int _1508 = int(_1506);
    int _1510 = ~_375;
    int _1512 = _1510 + 1;
    float _1514 = _497 * _169;
    float _1516 = -_479;
    float _1518 = _1516 + 1.0;
    int _1520 = abs(_535);
    float _1522 = -_477;
    float _1524 = _1522 + 1.0;
    int _1526 = abs(_553);
    float _1528 = 1.0 / _1504;
    bool _1530 = _369 > 0.5;
    out.m_70.w = _719;
    out.m_72.x = _889;
    out.m_72.y = _871;
    out.m_72.z = _899;
    float _1532 = float(uint(_1508));
    float _1534 = trunc(_1514);
    int _1536 = int(_1534);
    out.m_74.x = _1113;
    out.m_74.y = _1111;
    out.m_74.z = _1115;
    out.m_76.x = _835;
    int _1538 = as_type<int>(_1528) + (-2);
    float _1540 = _843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1542 = as_type<float>(_1538) * _1532;
    float _1544 = trunc(_1542);
    float _1546 = precise::max(_1544, 0.0);
    uint _1549 = uint(_1546);
    int _1551 = _1512 * int(_1549);
    int _1553 = _1551 + _1508;
    float _1555 = float(uint(_1553));
    float _1557 = as_type<float>(_1538) * _1555;
    int _1559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1561 = _1559 != 0;
    float _1563 = trunc(_1557);
    float _1565 = precise::max(_1563, 0.0);
    uint _1567 = uint(_1565);
    int _1569 = ~_375;
    int _1571 = _1569 + 1;
    bool _1573 = !_1561;
    float _1575 = _1573 ? 7.345489978790283203125 : 1.0;
    float _1577 = _1575 * _367;
    float _1579 = float(_1508);
    bool _1581 = _1579 >= _389;
    bool _1583 = isnan(_1579);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(_389);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    int _1593 = int(_1549) + int(_1567);
    float _1595 = floor(_1577);
    int _1597 = _1571 * _1593;
    int _1599 = _1597 + _1508;
    bool _1601 = uint(_1599) >= uint(_375);
    float _1603 = trunc(_1591);
    int _1605 = int(_1603);
    float _1607 = -_1595;
    float _1609 = _1577 + _1607;
    bool _1611 = !_1601;
    int _1613 = _1611 ? 0 : (-1);
    bool _1615 = _375 == 0;
    int _1617 = ~_1593;
    int _1619 = _1617 + _1613;
    int _1621 = _1619 + 1;
    float _1623 = _1609 * _389;
    int _1625 = ~_1605;
    int _1627 = _1625 + 1;
    int _1629 = _1627 + 1;
    int _1631 = _375 * _1621;
    int _1633 = _1631 + _1508;
    int _1635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1637 = _1635 != 0;
    float _1639 = trunc(_1623);
    int _1641 = int(_1639);
    int _1643 = _375 + (-1);
    bool _1645 = !_1615;
    int _1647 = _1645 ? _1633 : (-1);
    bool _1649 = !_1637;
    int _1651 = _1649 ? 0 : 1;
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1655 = _1653 != 0;
    int _1657 = _1647 * _1629;
    int _1659 = abs(_1651);
    int _1661 = abs(_549);
    int _1663 = _1605 * _1643;
    int _1665 = _1663 + _1657;
    bool _1667 = !_1655;
    int _1669 = _1667 ? 0 : 1;
    bool _1671 = _367 > 0.5;
    int _1673 = _1665 * _1520;
    int _1675 = abs(_1669);
    int _1677 = _1641 * _1659;
    int _1679 = _1677 + _1508;
    int _1681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1683 = _1681 != 0;
    int _1685 = _1536 * _1661;
    int _1687 = _1685 + _1673;
    float _1689 = float(uint(_1679));
    int _1691 = _1679 * _1526;
    int _1693 = _1691 + _1687;
    bool _1695 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1697 = isnan(_315);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    int _1707 = _1641 * _1675;
    int _1709 = _1707 + _1693;
    float _1711 = as_type<float>(_1538) * _1689;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1717 = -_185;
    int _1719 = _1671 ? as_type<int>(_1717) : as_type<int>(_185);
    float _1721 = float(uint(_1709));
    float _1723 = trunc(_1711);
    float _1725 = precise::max(_1723, 0.0);
    uint _1727 = uint(_1725);
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1731 = _1729 != 0;
    float _1733 = as_type<float>(_1538) * _1721;
    int _1735 = ~_375;
    int _1737 = _1735 + 1;
    bool _1739 = !_1683;
    float _1741 = _1739 ? _185 : as_type<float>(_1719);
    float _1743 = 1.0 / _1715;
    int _1745 = ~_375;
    int _1747 = _1745 + 1;
    float _1749 = _1741 + 0.5;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[80].x, _473);
    float _1753 = trunc(_1733);
    float _1755 = precise::max(_1753, 0.0);
    uint _1757 = uint(_1755);
    float _1759 = -_1518;
    float _1761 = fma(_1741, _1759, _1751);
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1765 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1767 = _1737 * int(_1757);
    int _1769 = _1767 + _1709;
    float _1771 = float(uint(_1769));
    float _1773 = as_type<float>(_1538) * _1771;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1775;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1781 = _315 + _1779;
    bool _1783 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1785 = isnan(_315);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    float _1795 = _1777 * _1743;
    float _1797 = -_1705;
    float _1799 = _1797 + 1.0;
    float _1801 = trunc(_1773);
    float _1803 = precise::max(_1801, 0.0);
    uint _1805 = uint(_1803);
    float _1807 = fma(_1795, _1781, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1809 = _1793 * _1799;
    int _1811 = ~_375;
    int _1813 = _1811 + 1;
    float _1815 = _1807 * _1809;
    float _1817 = -_189;
    int _1819 = _1530 ? as_type<int>(_1817) : as_type<int>(_189);
    bool _1821 = !_1731;
    float _1823 = _1821 ? _189 : as_type<float>(_1819);
    float _1825 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1827 = -_1793;
    float _1829 = _1827 + 1.0;
    int _1831 = int(_1757) + int(_1805);
    float _1833 = _1823 + (-0.5);
    int _1835 = _1813 * int(_1727);
    int _1837 = _1835 + _1679;
    float _1839 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1815);
    float _1841 = -_1833;
    float _1843 = -_475;
    float _1845 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1843);
    int _1847 = _1747 * _1831;
    int _1849 = _1847 + _1709;
    float _1851 = float(uint(_1837));
    float _1853 = fma(_1823, _1524, _1845);
    float _1855 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1839);
    bool _1857 = uint(_1849) >= uint(_375);
    float _1859 = as_type<float>(_1538) * _1851;
    float _1861 = _1855 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1863 = !_1857;
    int _1865 = _1863 ? 0 : (-1);
    float _1867 = trunc(_1859);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1875 = _1873 != 0;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1879 = ~_1831;
    int _1881 = _1879 + _1865;
    int _1883 = _1881 + 1;
    out.m_78.x = _1761;
    out.m_78.y = _1853;
    float _1885 = _1877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1887 = _375 * _1883;
    int _1889 = _1887 + _1709;
    int _1891 = ~_375;
    int _1893 = _1891 + 1;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1899 = !_1615;
    int _1901 = _1899 ? _1889 : (-1);
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1907 = int(_1727) + int(_1871);
    float _1909 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1913 = _1901 >> 31;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1917 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1919 = _1913 & 3;
    out.m_80.x = _1885;
    out.m_80.y = _1903;
    out.m_80.z = _1909;
    out.m_80.w = _1861;
    int _1921 = _1901 & 3;
    bool _1923 = _1921 != 0;
    float _1925 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1927 = _1901 + _1919;
    int _1929 = _1927 >> 2;
    out.m_82.x = _1915;
    out.m_82.y = _1765;
    out.m_82.z = _1917;
    out.m_82.w = _1925;
    int _1931 = _1929 << 4;
    int _1933 = _1931 + 368;
    float _1935 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1540);
    uint _1937 = uint(int(uint(_1933) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[int(_1947)][_1949];
    float _1953 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1935);
    float _1955 = _831 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1957 = _831 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1959 = _831 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1961 = _1893 * _1907;
    int _1963 = _1961 + _1679;
    float _1965 = -_819;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1955);
    float _1969 = -_819;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1957);
    float _1973 = -_819;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1959);
    float _1977 = _843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1979 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _1981 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1971);
    float _1983 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1975);
    float _1985 = _843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1987 = uint(_1963) >= uint(_375);
    float _1989 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1977);
    float _1991 = _1825 * _1979;
    int _1993 = _1901 & 3;
    bool _1995 = _1993 != 0;
    int _1997 = _1933 + 8;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    float _2015 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1985);
    float _2017 = _853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2019 = abs(_1041);
    float _2021 = log2(_2019);
    bool _2023 = uint(_1993) > 1u;
    float _2025 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2015);
    float _2027 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2029 = _1923 ? 0 : 1;
    float _2031 = _853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2033 = _853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2035 = _1825 * _1981;
    int _2037 = ~_2029;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    float _2043 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2017);
    float _2045 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2031);
    float _2047 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2033);
    float _2049 = _1825 * _1983;
    float _2051 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1989);
    int _2053 = _2041;
    if (!_2023)
    {
        int _2055 = ~_2029;
        int _2057 = _2055 + 1;
        _2053 = _2057;
    }
    int _2059 = _2053;
    float _2061 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2043);
    bool _2063 = _1993 != 3;
    float _2065 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2067 = uint(_1993) >= 2u;
    float _2069 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2045);
    float _2071 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2047);
    int _2073 = abs(_2059);
    float _2075 = fma(_2027, _2051, _2035);
    float _2077 = exp2(_2065);
    int _2079 = _2067 ? 0 : 1;
    float _2081 = fma(_2027, _1953, _1991);
    bool _2083 = !_1995;
    int _2085 = _2083 ? 0 : 1;
    float _2087 = -_1475;
    float _2089 = _2087 + 1.0;
    int _2091 = ~_2073;
    int _2093 = _2091 + 1;
    int _2095 = _2093 + 1;
    int _2097 = ~_2079;
    int _2099 = _2097 + 1;
    int _2101 = _2099 + 1;
    bool _2103 = _1993 != 3;
    int _2105 = _2095 * as_type<int>(_1951);
    int _2107 = abs(_2085);
    int _2109 = _2101;
    float _2111 = _2089;
    if (_2063)
    {
        int _2113 = ~_2079;
        int _2115 = _2113 + 1;
        _2109 = _2115;
    }
    int _2117 = _2109;
    bool _2119 = !_2103;
    int _2121 = _2119 ? 0 : (-1);
    int _2123 = abs(_2117);
    bool _2125 = !_1875;
    int _2127 = _2125 ? 0 : 1;
    int _2129 = abs(_2121);
    float _2131 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    int _2135 = ~_2107;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    float _2141 = in.m_84.x;
    int _2143 = _2139 * as_type<int>(_1943);
    int _2145 = _2143 + _2105;
    int _2147 = abs(_2127);
    int _2149 = ~_2123;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2133, -2.0, 3.0);
    float _2157 = _2133 * _2133;
    int _2159 = _2153 * as_type<int>(_2005);
    int _2161 = _2159 + _2145;
    float _2163 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2165 = _2157 * _2155;
    bool _2167 = !_1987;
    int _2169 = _2167 ? 0 : (-1);
    float _2171 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2163);
    float _2173 = -_2165;
    float _2175 = _2173 + 1.0;
    int _2177 = ~_2129;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    int _2183 = ~_1907;
    int _2185 = _2183 + _2169;
    int _2187 = _2185 + 1;
    float _2189 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2165);
    float _2191 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2193 = _2181 * as_type<int>(_2013);
    int _2195 = _2193 + _2161;
    int _2197 = _375 * _2187;
    int _2199 = _2197 + _1679;
    float _2201 = exp2(_2191);
    bool _2203 = _1041 <= 8000.0;
    bool _2205 = isnan(_1041);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan(8000.0);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2171);
    int _2217 = ~_2147;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    float _2223 = _1393 * 0.5;
    bool _2225 = !_1615;
    int _2227 = _2225 ? _2199 : (-1);
    float _2229 = _2213 * _2189;
    bool _2231 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2233 = isnan(_1189);
    bool _2235 = _2231 || _2233;
    bool _2237 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2239 = _2235 || _2237;
    int _2241 = _2195 * _2221;
    float _2243 = fma(_2027, _2025, _2049);
    float _2245 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2215);
    float _2247 = _2069 + _2075;
    int _2249 = _2227 * _2147;
    int _2251 = _2249 + _2241;
    float _2253 = _2071 + _2243;
    float _2255 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1451;
    out.gl_Position.y = _1453;
    out.gl_Position.z = _2245;
    out.gl_Position.w = _1393;
    float _2257 = -_2201;
    float _2259 = _2257 + 1.0;
    float _2261 = float(_2251);
    float _2263 = _2061 + _2081;
    float _2265 = _2259 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2267 = _2089 * _2255;
    float _2269 = precise::clamp(_2267, 0.0, 1.0);
    float _2271 = _2245 + _1393;
    out.m_86.x = _2263;
    out.m_86.y = _2247;
    out.m_86.z = _2253;
    float _2273 = _2265 * _1481;
    float _2275 = -_2265;
    float _2277 = _2275 + 1.0;
    float _2279 = -_2269;
    float _2281 = fma(_2279, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2283 = _1451 + _1393;
    float _2285 = _1492 * _2273;
    float _2287 = _1502 * _2273;
    float _2289 = _1492 * _2277;
    float _2291 = _2281 * _2141;
    float _2293 = fma(_1498, _2285, _1486);
    float _2295 = fma(_1500, _2285, _1488);
    float _2297 = fma(_1492, _2287, _1490);
    float _2299 = _2271 * 0.5;
    float _2301 = _2283 * 0.5;
    float _2303 = fma(_1453, -0.5, _2223);
    out.m_88.x = _2293;
    out.m_88.y = _2295;
    out.m_88.z = _2297;
    out.m_88.w = _2289;
    float _2305 = _2291 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2307 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2309 = _2291;
    float _2311 = _2261;
    float _2313 = _2299;
    float _2315 = _2301;
    float _2317 = _2305;
    if (!_2239)
    {
        _2111 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2319 = _2111;
    out.m_90.x = _2301;
    out.m_90.y = _2303;
    out.m_90.z = _2299;
    out.m_90.w = _1393;
    float _2321 = _2319;
    float _2323 = _2319;
    if (!_2239)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2325 = _2309;
    out.m_92.x = _2261;
    out.m_94.x = _2305;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2239)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2331 = _2311;
    float _2333 = _2331;
    float _2335 = _2331;
    if (!_2239)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2337 = _2313;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2239)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2343 = _2315;
    float _2345 = _2343;
    float _2347 = _2343;
    if (!_2239)
    {
        _2317 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2349 = _2317;
    bool _2351 = !_2239;
    float _2353 = _2349;
    float _2355 = _2349;
    if (!_2351)
    {
        bool _2357 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2359 = isnan(_1189);
        bool _2361 = _2357 || _2359;
        bool _2363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2365 = _2361 || _2363;
        if (!_2365)
        {
            float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2369 = _1189 + _2367;
            float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2373 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2371;
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2377 = _2375 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2381 = _2379 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2383 = 1.0 / _2373;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2397 = _2369 * _2383;
            float _2399 = precise::clamp(_2397, 0.0, 1.0);
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2405 = fma(_2399, _2377, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2407 = fma(_2399, _2381, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2409 = fma(_2399, _2403, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2411 = fma(_2399, _2387, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2413 = fma(_2399, _2391, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2415 = fma(_2399, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2347 = _2407;
            _2335 = _2413;
            _2341 = _2405;
            _2329 = _2411;
            _2323 = _2409;
            _2355 = _2415;
            _2417 = true;
        }
        else
        {
            bool _2419 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2421 = isnan(_1189);
            bool _2423 = _2419 || _2421;
            bool _2425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2427 = _2423 || _2425;
            if (!_2427)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2429 = _2339;
            _2341 = _2429;
            if (!_2427)
            {
                _2345 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2431 = _2345;
            _2347 = _2431;
            if (!_2427)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2433 = _2321;
            _2323 = _2433;
            if (!_2427)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2435 = _2327;
            _2329 = _2435;
            if (!_2427)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2437 = _2333;
            _2335 = _2437;
            if (!_2427)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2439 = _2353;
            bool _2441 = !_2427;
            _2355 = _2439;
            if (!_2441)
            {
                bool _2443 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2445 = isnan(_1189);
                bool _2447 = _2443 || _2445;
                bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2451 = _2447 || _2449;
                if (!_2451)
                {
                    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2455 = _1189 + _2453;
                    float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2459 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2457;
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2469 = 1.0 / _2459;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2483 = _2455 * _2469;
                    float _2485 = precise::clamp(_2483, 0.0, 1.0);
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2491 = fma(_2485, _2463, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2493 = fma(_2485, _2467, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2495 = fma(_2485, _2489, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2497 = fma(_2485, _2473, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2499 = fma(_2485, _2477, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2501 = fma(_2485, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2347 = _2493;
                    _2335 = _2499;
                    _2341 = _2491;
                    _2329 = _2497;
                    _2323 = _2495;
                    _2355 = _2501;
                    _2417 = true;
                }
                else
                {
                    _2347 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2417 = false;
    float _2503 = _2347;
    float _2505 = _2335;
    float _2507 = _2341;
    float _2509 = _2329;
    float _2511 = _2323;
    float _2513 = _2355;
    float _2515 = fma(_2247, -0.5, 0.5);
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = -_2503;
    float _2521 = _2519 + _2505;
    float _2523 = _2307 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2525 = -_2507;
    float _2527 = _2525 + _2509;
    out.m_96.x = 0.0;
    float _2529 = fma(_2517, _2521, _2503);
    float _2531 = fma(_2517, _2527, _2507);
    out.m_53.x = _2523;
    float _2533 = -_2511;
    float _2535 = _2533 + _2513;
    float _2537 = _2529 * 0.586610972881317138671875;
    bool _2539 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2541 = fma(_2517, _2535, _2511);
    float _2543 = fma(_2531, 0.298911988735198974609375, _2537);
    bool _2545 = _1165 > 0.0;
    bool _2547 = isnan(_1165);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan(0.0);
    bool _2553 = _2549 || _2551;
    float _2555 = fma(_2541, 0.114477999508380889892578125, _2543);
    float _2557 = -_2555;
    float _2559 = _2531 + _2557;
    float _2561 = -_2555;
    float _2563 = _2529 + _2561;
    float _2565 = -_2555;
    float _2567 = _2541 + _2565;
    float _2569 = fma(_2559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2555);
    float _2571 = fma(_2563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2555);
    float _2573 = fma(_2567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2555);
    bool _2575 = !_2539;
    if (!_2575)
    {
        float _2577 = -_1111;
        float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2581 = -_1113;
        float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2585 = -_1115;
        float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2589 = _2579 * _2579;
        float _2591 = fma(_2583, _2583, _2589);
        float _2593 = fma(_2587, _2587, _2591);
        float _2595 = sqrt(_2593);
        float _2597 = rsqrt(_2593);
        float _2599 = -_2595;
        float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2603 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2605 = precise::clamp(_2603, 0.0, 1.0);
        float _2607 = _2583 * _2597;
        float _2609 = _2579 * _2597;
        float _2611 = abs(_2605);
        float _2613 = log2(_2611);
        float _2615 = _2587 * _2597;
        float _2617 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2619 = _2247 * _2609;
        float _2621 = -_2609;
        float _2623 = -_2617;
        float _2625 = fma(_2621, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2623);
        float _2627 = fma(_2263, _2607, _2619);
        float _2629 = -_2615;
        float _2631 = fma(_2629, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2625);
        float _2633 = fma(_2253, _2615, _2627);
        float _2635 = precise::clamp(_2633, 0.0, 1.0);
        float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2639 = _2631 + _2637;
        float _2641 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2643 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2645 = precise::clamp(_2643, 0.0, 1.0);
        float _2647 = exp2(_2641);
        float _2649 = _2647 * _2645;
        float _2651 = _2635 * _2649;
        float _2653 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2657 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2653;
        out.m_96.y = _2655;
        out.m_96.z = _2657;
    }
    out.m_70.x = _2569;
    out.m_70.y = _2571;
    out.m_70.z = _2573;
    if (_2553)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2659 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2659;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2417 = false;
    bool _213 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = as_type<float>(_117);
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2728 = as_type<float>(_139);
        out.gl_Position.z = _2728;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = float(_117);
    bool _155 = _121 >= _153;
    bool _157 = !_151;
    bool _159 = _155 || _157;
    if (_159)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _129;
    if (_159)
    {
        out.m_53.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _141 = as_type<int>(_163);
    }
    int _165 = _141;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2783 = as_type<float>(_165);
        out.gl_Position.z = _2783;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = 1.0 / _153;
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _173 = _121 * _169;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_181;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_171;
    float _193 = _173;
    float _211;
    if (!_191)
    {
        float _195 = in.m_58.x;
        float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _199 = _195 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _201 = fma(_199, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _203 = _201 * _197;
        float _205 = floor(_203);
        float _207 = -_205;
        float _209 = _203 + _207;
        _211 = _209;
        _213 = true;
    }
    else
    {
        _211 = _173;
    }
    _213 = false;
    float _215 = _211;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    float _221 = in.m_60.x;
    float _223 = in.m_60.y;
    bool _225 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _227 = isnan(_215);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -_235;
    float _255 = _253 + 1.0;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    float _261 = 1.0 / _239;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _265 = _251 * _255;
    float _267 = -_251;
    float _269 = _267 + 1.0;
    float _271 = _219 * _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _275 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _273;
    float _277 = fma(_259, _271, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _279 = fma(_275, _271, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _281 = _277 * _265;
    float _283 = _279 * _265;
    float _285 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].x, _281);
    float _287 = fma(_269, (*spvDescriptorSet0.vp_c9)._m0[143].y, _283);
    float _289 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].x, _285);
    float _291 = fma(_235, (*spvDescriptorSet0.vp_c9)._m0[144].y, _287);
    float _293 = _289 * _221;
    float _295 = _291 * _223;
    bool _297 = !_263;
    if (!_297)
    {
        float _299 = in.m_58.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _193 = _313;
    }
    float _315 = _193;
    float _317 = in.m_46.x;
    float _319 = in.m_46.y;
    float _321 = in.m_46.z;
    float _323 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _325 = log2(_323);
    float _327 = _295 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _329 = in.m_62.x;
    float _331 = in.m_62.y;
    float _333 = in.m_62.z;
    float _335 = in.m_62.w;
    bool _337 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _339 = isnan(0.0);
    bool _341 = _337 || _339;
    bool _343 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _345 = _341 || _343;
    float _347 = in.m_64.x;
    float _349 = in.m_64.y;
    float _351 = in.m_64.z;
    float _353 = in.m_64.w;
    float _355 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _357 = int(_355);
    float _359 = in.m_66.x;
    float _361 = in.m_66.y;
    float _363 = in.m_66.z;
    float _365 = in.m_66.w;
    float _367 = in.m_58.x;
    float _369 = in.m_58.y;
    float _371 = _325 * _121;
    float _373 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _375 = int(_373);
    float _377 = float(_357);
    float _379 = _319 * _331;
    float _381 = 1.0 / _377;
    float _383 = in.m_58.z;
    float _385 = _319 * _349;
    float _387 = fma(_317, _329, _379);
    float _389 = float(_375);
    float _391 = _319 * _361;
    float _393 = fma(_317, _347, _385);
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _399 = fma(_317, _359, _391);
    float _401 = _369 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _403 = fma(_321, _351, _393);
    float _405 = _367 * 2.0;
    bool _407 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _409 = isnan(1.0);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _415 = _411 || _413;
    float _417 = exp2(_371);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _421 = 1.0 + _419;
    float _423 = fma(_401, -2.0, _395);
    float _425 = _369 * 2.0;
    float _427 = fma(_321, _333, _387);
    float _429 = -_397;
    float _431 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[77].x, _429);
    float _433 = fma(_321, _363, _399);
    float _435 = _369 + _383;
    float _437 = 1.0 / _421;
    float _439 = _369 + _367;
    float _441 = _435 + (-1.0);
    float _443 = _439 + (-1.0);
    float _445 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _447 = floor(_405);
    float _449 = _383 * 2.0;
    float _451 = -_417;
    float _453 = _451 + 1.0;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _457 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _459 = _381 * _121;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _463 = floor(_425);
    float _465 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[78].w, _455);
    float _467 = _345 ? _453 : 0.0;
    float _469 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[78].z, _461);
    float _471 = -_121;
    float _473 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[76].x, _431);
    float _475 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _423);
    float _477 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _465);
    float _479 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _469);
    float _481 = floor(_449);
    bool _483 = _447 > 0.0;
    float _485 = _403 + _353;
    bool _487 = _447 >= 0.0;
    bool _489 = isnan(_447);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = _389 * _121;
    if (_415)
    {
        float _499 = _467 * _437;
        _131 = _499;
    }
    float _501 = _131;
    float _503 = _433 + _365;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _507 = _505 != 0;
    int _509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _511 = _509 != 0;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _515 = _513 != 0;
    int _517 = _495 ? 0 : 1;
    bool _519 = _463 > 0.0;
    bool _521 = _463 >= 0.0;
    bool _523 = isnan(_463);
    bool _525 = _521 || _523;
    bool _527 = isnan(0.0);
    bool _529 = _525 || _527;
    float _531 = _427 + _335;
    bool _533 = !_511;
    int _535 = _533 ? 0 : 1;
    bool _537 = _481 >= 0.0;
    bool _539 = isnan(_481);
    bool _541 = _537 || _539;
    bool _543 = isnan(0.0);
    bool _545 = _541 || _543;
    bool _547 = !_507;
    int _549 = _547 ? 0 : 1;
    bool _551 = !_515;
    int _553 = _551 ? 0 : 1;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _557 = _555 != 0;
    int _559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _561 = _559 != 0;
    int _563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _565 = _563 != 0;
    int _567 = ~_517;
    int _569 = _567 + 1;
    int _571 = _569 + 1;
    int _573 = _571;
    if (!_483)
    {
        int _575 = ~_517;
        int _577 = _575 + 1;
        _573 = _577;
    }
    int _579 = _573;
    float _581 = in.m_68.x;
    float _583 = in.m_68.y;
    float _585 = in.m_68.z;
    int _587 = _529 ? 0 : 1;
    bool _589 = !_557;
    int _591 = _589 ? 0 : 1;
    bool _593 = !_561;
    int _595 = _593 ? 0 : 1;
    bool _597 = _481 > 0.0;
    float _599 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _601 = _503 + _599;
    int _603 = ~_587;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    int _609 = abs(_591);
    float _611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _613 = _531 + _611;
    int _615 = _607;
    if (!_519)
    {
        int _617 = ~_587;
        int _619 = _617 + 1;
        _615 = _619;
    }
    int _621 = _615;
    int _623 = abs(_595);
    float _625 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _627 = _485 + _625;
    float _629 = _613 * _613;
    float _631 = float(_579);
    float _633 = float(_623);
    float _635 = fma(_627, _627, _629);
    int _637 = _545 ? 0 : 1;
    bool _639 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _641 = isnan(0.5);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _647 = _643 || _645;
    float _649 = _633 * _631;
    int _651 = ~_637;
    int _653 = _651 + 1;
    int _655 = _653 + 1;
    int _657 = _655;
    if (!_597)
    {
        int _659 = ~_637;
        int _661 = _659 + 1;
        _657 = _661;
    }
    int _663 = _657;
    float _665 = _649 * (-2.0);
    float _667 = float(_609);
    float _669 = fma(_601, _601, _635);
    float _671 = float(_663);
    float _673 = _369 + (-0.5);
    bool _675 = !_565;
    int _677 = _675 ? 0 : 1;
    float _679 = sqrt(_669);
    float _681 = fma(_665, _583, _583);
    float _683 = fma(_445, _665, _445);
    int _685 = abs(_677);
    float _687 = _383 + _367;
    float _689 = fma(_673, (*spvDescriptorSet0.vp_c9)._m0[196].y, _681);
    float _691 = _293 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _693 = _667 * _671;
    float _695 = float(_621);
    float _697 = _687 + (-1.0);
    float _699 = rsqrt(_669);
    float _701 = float(_685);
    float _703 = _691 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _705 = _693 * (-2.0);
    float _707 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _709 = _679 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _711 = _701 * _695;
    float _713 = _367 + (-0.5);
    float _715 = fma(_705, _581, _581);
    float _717 = fma(_683, _501, _689);
    float _719 = precise::min(_703, _709);
    float _721 = fma(_457, _705, _457);
    float _723 = fma(_713, (*spvDescriptorSet0.vp_c9)._m0[196].x, _715);
    float _725 = _717 * 0.15915493667125701904296875;
    float _727 = _711 * (-2.0);
    float _729 = _383 + (-0.5);
    float _731 = _699 * _719;
    float _733 = fma(_721, _501, _723);
    float _735 = fma(_727, _585, _585);
    float _737 = fma(_707, _727, _707);
    float _739 = _613 * _731;
    float _741 = _627 * _731;
    float _743 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[196].z, _735);
    float _745 = _601 * _731;
    float _747 = -_739;
    float _749 = _613 + _747;
    float _751 = -_741;
    float _753 = _627 + _751;
    float _755 = fma(_737, _501, _743);
    float _757 = -_745;
    float _759 = _601 + _757;
    float _761 = _749 * _749;
    float _763 = _733 * 0.15915493667125701904296875;
    float _765 = _755 * 0.15915493667125701904296875;
    float _767 = _725 * 6.283185482025146484375;
    float _769 = sin(_767);
    float _771 = fma(_753, _753, _761);
    float _773 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _189);
    bool _775 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _777 = isnan(0.5);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _783 = _779 || _781;
    float _785 = fma(_759, _759, _771);
    float _787 = _725 * 6.283185482025146484375;
    float _789 = cos(_787);
    float _791 = sqrt(_785);
    float _793 = _763 * 6.283185482025146484375;
    float _795 = sin(_793);
    float _797 = _765 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = _699 * _791;
    float _803 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _185);
    float _805 = _327 * _801;
    float _807 = _763 * 6.283185482025146484375;
    float _809 = cos(_807);
    float _811 = _795 * _769;
    float _813 = _795 * _789;
    float _815 = _805 * _773;
    float _817 = _765 * 6.283185482025146484375;
    float _819 = sin(_817);
    float _821 = _795 * _799;
    float _823 = _789 * _799;
    float _825 = _821 * _815;
    float _827 = _809 * _789;
    float _829 = _809 * _769;
    float _831 = _809 * _799;
    float _833 = _769 * _799;
    float _835 = _691 * _801;
    float _837 = _801 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _839 = _837 * 0.5;
    float _841 = _831 * _815;
    float _843 = fma(_819, _827, _811);
    float _845 = _835 * _803;
    float _847 = -_829;
    float _849 = fma(_819, _813, _847);
    float _851 = -_813;
    float _853 = fma(_819, _829, _851);
    float _855 = -_815;
    float _857 = _819 * _855;
    float _859 = fma(_843, _845, _841);
    float _861 = fma(_819, _811, _827);
    float _863 = fma(_849, _845, _825);
    float _865 = fma(_823, _845, _857);
    float _867 = fma(_853, _839, _859);
    float _869 = -_739;
    float _871 = _531 + _869;
    float _873 = fma(_861, _839, _863);
    float _875 = fma(_833, _839, _865);
    float _877 = _867 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _879 = _867 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _881 = _871 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _883 = _871 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _885 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[26].x, _877);
    float _887 = -_741;
    float _889 = _485 + _887;
    float _891 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[24].x, _879);
    float _893 = _867 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[26].z, _885);
    float _897 = -_745;
    float _899 = _503 + _897;
    float _901 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[11].x, _881);
    float _903 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[24].z, _891);
    float _905 = _895 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _907 = fma(_889, (*spvDescriptorSet0.vp_c8)._m0[10].x, _883);
    float _909 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[11].z, _901);
    float _911 = _903 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _913 = _503 + _905;
    float _915 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[10].z, _907);
    float _917 = _909 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _919 = _485 + _911;
    float _921 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _923 = _913 + _921;
    float _925 = _915 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _927 = 1.0 / _917;
    float _929 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _931 = _919 + _929;
    float _933 = _923 * _923;
    float _935 = _925 + _917;
    float _937 = fma(_875, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _939 = fma(_931, _931, _933);
    float _941 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[25].z, _937);
    float _943 = sqrt(_939);
    float _945 = _941 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _947 = _935 * _927;
    float _949 = _947 * 0.5;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _953 = fma(_949, (*spvDescriptorSet0.vp_c8)._m0[30].w, _951);
    float _955 = _531 + _945;
    float _957 = 1.0 / _953;
    bool _959 = _943 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _961 = _945;
    float _963 = _913;
    float _965 = _919;
    float _967 = _933;
    float _969 = _931;
    float _971 = _953;
    float _973 = _927;
    if (!_959)
    {
        _961 = _913;
    }
    float _975 = _961;
    float _977 = _975;
    if (!_959)
    {
        _963 = _955;
    }
    float _979 = _963;
    bool _981 = !_959;
    float _983 = _979;
    float _985 = _957;
    if (!_981)
    {
        float _987 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _989 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _991 = _943 + _989;
        float _993 = rsqrt(_939);
        float _995 = _991 * _987;
        float _997 = _955 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _999 = _995 * 0.15915493667125701904296875;
        float _1001 = _999 * 6.283185482025146484375;
        float _1003 = cos(_1001);
        float _1005 = _999 * 6.283185482025146484375;
        float _1007 = sin(_1005);
        float _1009 = _1003 + (-1.0);
        float _1011 = _1009 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1013 = fma(_1007, _997, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1015 = fma(_955, _1003, _1011);
        float _1017 = _993 * _1013;
        float _1019 = fma(_931, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1021 = fma(_923, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _965 = _1019;
        _983 = _1015;
        _977 = _1021;
        _967 = _999;
    }
    float _1023 = _965;
    float _1025 = _983;
    float _1027 = _977;
    float _1029 = _967;
    float _1031 = -_741;
    float _1033 = _1031 + _1023;
    float _1035 = -_739;
    float _1037 = _1035 + _1025;
    float _1039 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1041 = _957 * _1039;
    float _1043 = -_745;
    float _1045 = _1043 + _1027;
    float _1047 = _1037;
    float _1049 = _1045;
    float _1051 = _1029;
    if (_647)
    {
        _969 = 1.0;
    }
    float _1053 = _969;
    float _1055 = _1053;
    if (_783)
    {
        _985 = _1033;
    }
    float _1057 = _985;
    float _1059 = _1057;
    if (!_783)
    {
        float _1061 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1063 = _871 + _1061;
        float _1065 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1067 = _889 + _1065;
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1071 = -_485;
        float _1073 = _1071 + _1023;
        float _1075 = _1063 * _1063;
        float _1077 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1079 = _899 + _1077;
        float _1081 = -_531;
        float _1083 = _1081 + _1025;
        float _1085 = -_503;
        float _1087 = _1085 + _1027;
        float _1089 = fma(_1067, _1067, _1075);
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1093 = fma(_1079, _1079, _1089);
        float _1095 = sqrt(_1093);
        float _1097 = _1069 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1099 = precise::min(_1095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1101 = _1099 * _1091;
        float _1103 = _1097 * _1101;
        float _1105 = fma(_1073, _1103, _889);
        float _1107 = fma(_1083, _1103, _871);
        float _1109 = fma(_1087, _1103, _899);
        _1047 = _1107;
        _1059 = _1105;
        _1049 = _1109;
    }
    float _1111 = _1047;
    float _1113 = _1059;
    float _1115 = _1049;
    if (!_647)
    {
        float _1117 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1119 = _1117 * 0.15915493667125701904296875;
        float _1121 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1123 = _1119 * 6.283185482025146484375;
        float _1125 = cos(_1123);
        float _1127 = _1121 * 0.15915493667125701904296875;
        float _1129 = _1119 * 6.283185482025146484375;
        float _1131 = sin(_1129);
        float _1133 = 1.0 / _1125;
        float _1135 = _1127 * 6.283185482025146484375;
        float _1137 = cos(_1135);
        float _1139 = _1131 * _1133;
        float _1141 = _1127 * 6.283185482025146484375;
        float _1143 = sin(_1141);
        float _1145 = _1137 * _1139;
        float _1147 = 1.0 / _1145;
        float _1149 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1151 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1149;
        float _1153 = 1.0 / _1151;
        float _1155 = _1143 * _1147;
        float _1157 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1159 = fma(_1041, _1155, _1157);
        float _1161 = _1159 * _1153;
        float _1163 = precise::clamp(_1161, 0.0, 1.0);
        _1055 = _1163;
    }
    float _1165 = _1055;
    float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1169 = _1111 + _1167;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1173 = _1113 + _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1177 = _1115 + _1175;
    float _1179 = _1169 * _1169;
    float _1181 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1183 = fma(_1173, _1173, _1179);
    float _1185 = fma(_1177, _1177, _1183);
    float _1187 = rsqrt(_1185);
    float _1189 = sqrt(_1185);
    float _1191 = _1187 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1193 = _1173 * _1191;
    float _1195 = _1177 * _1191;
    float _1197 = _1193 * _1193;
    float _1199 = _1195 * _1195;
    float _1201 = _1197 + _1199;
    float _1203 = sqrt(_1201);
    bool _1205 = _1203 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1207 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1209 = _1203 + _1207;
    float _1211 = _1023;
    float _1213 = _1201;
    float _1215 = _1209;
    float _1217 = _1191;
    float _1219 = _1193;
    float _1221 = _1195;
    float _1223 = _1197;
    float _1225 = _1199;
    if (_1205)
    {
        float _1227 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1211 = _1227;
    }
    float _1229 = _1211;
    if (_1205)
    {
        float _1231 = rsqrt(_1201);
        _1213 = _1231;
    }
    float _1233 = _1213;
    if (_1205)
    {
        float _1235 = _1209 * _1229;
        _1215 = _1235;
    }
    float _1237 = _1215;
    if (_1205)
    {
        float _1239 = _1237 * 0.15915493667125701904296875;
        _971 = _1239;
    }
    float _1241 = _971;
    float _1243 = _1025;
    if (_1205)
    {
        float _1245 = _1241 * 6.283185482025146484375;
        float _1247 = sin(_1245);
        _1243 = _1247;
    }
    float _1249 = _1243;
    float _1251 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1253 = precise::max(0.0, _1251);
    float _1255 = _1229;
    if (_1205)
    {
        float _1257 = _1241 * 6.283185482025146484375;
        float _1259 = cos(_1257);
        _1255 = _1259;
    }
    float _1261 = _1255;
    float _1263 = -_1191;
    float _1265 = -_1253;
    float _1267 = fma(_1169, _1263, _1265);
    if (_1205)
    {
        float _1269 = _1267 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1051 = _1269;
    }
    float _1271 = _1051;
    float _1273 = fma(_889, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1275 = _1271;
    float _1277 = _1249;
    if (_1205)
    {
        float _1279 = fma(_1249, _1271, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1275 = _1279;
    }
    float _1281 = _1275;
    if (!_1205)
    {
        _1277 = _1267;
    }
    float _1283 = _1277;
    float _1285 = floor(_1273);
    float _1287 = _1283;
    if (_1205)
    {
        float _1289 = _1261 + (-1.0);
        _1217 = _1289;
    }
    float _1291 = _1217;
    float _1293 = _1291;
    if (_1205)
    {
        float _1295 = _1233 * _1281;
        _973 = _1295;
    }
    float _1297 = _973;
    float _1299 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1205)
    {
        float _1301 = _1291 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1301;
    }
    float _1303 = _1293;
    if (_1205)
    {
        float _1305 = _1193 * _1297;
        _1219 = _1305;
    }
    float _1307 = _1219;
    if (_1205)
    {
        float _1309 = _1195 * _1297;
        _1221 = _1309;
    }
    float _1311 = _1221;
    float _1313 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1299);
    if (_1205)
    {
        float _1315 = fma(_1267, _1261, _1303);
        _1287 = _1315;
    }
    float _1317 = _1287;
    if (_1205)
    {
        float _1319 = _1307 * _1307;
        _1223 = _1319;
    }
    float _1321 = _1223;
    if (_1205)
    {
        float _1323 = _1311 * _1311;
        _1225 = _1323;
    }
    float _1325 = _1225;
    float _1327 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1329 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1313);
    float _1331 = fma(_1317, _1317, _1321);
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1335 = fma(_1189, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1333);
    float _1337 = precise::clamp(_1335, 0.0, 1.0);
    float _1339 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1327);
    float _1341 = _1329 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1343 = _1331 + _1325;
    float _1345 = _1111 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1347 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1181);
    float _1349 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1339);
    float _1351 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1353 = fma(_1113, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1345);
    float _1355 = rsqrt(_1343);
    float _1357 = -_1337;
    float _1359 = _1357 + 1.0;
    float _1361 = _1349 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1363 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1353);
    float _1365 = fma(_1115, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1347);
    float _1367 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1369 = _1363 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1371 = _1365 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1373 = abs(_1359);
    float _1375 = log2(_1373);
    float _1377 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1351);
    float _1379 = fma(_899, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1381 = -_1285;
    float _1383 = _1273 + _1381;
    float _1385 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1377);
    float _1387 = _1355 * _1307;
    float _1389 = _1355 * _1317;
    float _1391 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1393 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1385);
    float _1395 = _1387 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1397 = _1355 * _1311;
    float _1399 = floor(_1379);
    float _1401 = -_1367;
    float _1403 = fma(_1401, _1391, 1.0);
    float _1405 = -_1395;
    float _1407 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1405);
    float _1409 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1411 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1413 = -_1397;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1407);
    float _1417 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1419 = exp2(_1409);
    float _1421 = fma(_1415, -0.5, 0.5);
    float _1423 = fma(_1415, 0.5, 0.5);
    float _1425 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1417);
    float _1427 = _1389 + 1.0;
    float _1429 = log2(_1403);
    float _1431 = -_1399;
    float _1433 = _1379 + _1431;
    float _1435 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1411);
    float _1437 = fma(_1423, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1439 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1425);
    float _1441 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1435);
    float _1443 = fma(_1423, _1437, -0.212114393711090087890625);
    float _1445 = 1.0 / _1393;
    float _1447 = -_1389;
    float _1449 = fma(_1419, _1427, _1447);
    float _1451 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1439);
    float _1453 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1441);
    float _1455 = fma(_1423, _1443, 1.570728778839111328125);
    float _1457 = fma(_1449, 0.5, 0.5);
    float _1459 = sqrt(_1421);
    float _1461 = _1429 * 0.693147182464599609375;
    float _1463 = _1461 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1465 = _1451 * _1445;
    float _1467 = _1453 * _1445;
    float _1469 = fma(_1465, 0.5, 0.5);
    float _1471 = fma(_1467, -0.5, 0.5);
    float _1473 = _1459 * 0.636619746685028076171875;
    float2 _4784 = float2(_1383, _1433);
    float _1475 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4784, float2(0.0), isnan(_4784)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4784, float2(0.0), isnan(_4784)), level(0.0)).x;
    float _1477 = -_1455;
    float _1479 = fma(_1473, _1477, 1.0);
    float3 _4800 = float3(_1469, _1471, _1463);
    float _1481 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4800, float3(0.0), isnan(_4800)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4800, float3(0.0), isnan(_4800)), level(0.0)).x;
    float3 _4811 = float3(_1469, _1471, _1463);
    float4 _1484 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4811, float3(0.0), isnan(_4811)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4811, float3(0.0), isnan(_4811)), level(0.0)).xyzw;
    float _1486 = _1484.x;
    float _1488 = _1484.y;
    float _1490 = _1484.z;
    float _1492 = _1484.w;
    float2 _4827 = float2(_1479, _1457);
    float3 _1496 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4827, float2(0.0), isnan(_4827)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4827, float2(0.0), isnan(_4827)), level(0.0)).xyz;
    float _1498 = _1496.x;
    float _1500 = _1496.y;
    float _1502 = _1496.z;
    float _1504 = float(uint(_375));
    float _1506 = trunc(_459);
    int _1508 = int(_1506);
    int _1510 = ~_375;
    int _1512 = _1510 + 1;
    float _1514 = _497 * _169;
    float _1516 = -_479;
    float _1518 = _1516 + 1.0;
    int _1520 = abs(_535);
    float _1522 = -_477;
    float _1524 = _1522 + 1.0;
    int _1526 = abs(_553);
    float _1528 = 1.0 / _1504;
    bool _1530 = _369 > 0.5;
    out.m_70.w = _719;
    out.m_72.x = _889;
    out.m_72.y = _871;
    out.m_72.z = _899;
    float _1532 = float(uint(_1508));
    float _1534 = trunc(_1514);
    int _1536 = int(_1534);
    out.m_74.x = _1113;
    out.m_74.y = _1111;
    out.m_74.z = _1115;
    out.m_76.x = _835;
    int _1538 = as_type<int>(_1528) + (-2);
    float _1540 = _843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1542 = as_type<float>(_1538) * _1532;
    float _1544 = trunc(_1542);
    float _1546 = precise::max(_1544, 0.0);
    uint _1549 = uint(_1546);
    int _1551 = _1512 * int(_1549);
    int _1553 = _1551 + _1508;
    float _1555 = float(uint(_1553));
    float _1557 = as_type<float>(_1538) * _1555;
    int _1559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1561 = _1559 != 0;
    float _1563 = trunc(_1557);
    float _1565 = precise::max(_1563, 0.0);
    uint _1567 = uint(_1565);
    int _1569 = ~_375;
    int _1571 = _1569 + 1;
    bool _1573 = !_1561;
    float _1575 = _1573 ? 7.345489978790283203125 : 1.0;
    float _1577 = _1575 * _367;
    float _1579 = float(_1508);
    bool _1581 = _1579 >= _389;
    bool _1583 = isnan(_1579);
    bool _1585 = _1581 || _1583;
    bool _1587 = isnan(_389);
    bool _1589 = _1585 || _1587;
    float _1591 = float(_1589);
    int _1593 = int(_1549) + int(_1567);
    float _1595 = floor(_1577);
    int _1597 = _1571 * _1593;
    int _1599 = _1597 + _1508;
    bool _1601 = uint(_1599) >= uint(_375);
    float _1603 = trunc(_1591);
    int _1605 = int(_1603);
    float _1607 = -_1595;
    float _1609 = _1577 + _1607;
    bool _1611 = !_1601;
    int _1613 = _1611 ? 0 : (-1);
    bool _1615 = _375 == 0;
    int _1617 = ~_1593;
    int _1619 = _1617 + _1613;
    int _1621 = _1619 + 1;
    float _1623 = _1609 * _389;
    int _1625 = ~_1605;
    int _1627 = _1625 + 1;
    int _1629 = _1627 + 1;
    int _1631 = _375 * _1621;
    int _1633 = _1631 + _1508;
    int _1635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1637 = _1635 != 0;
    float _1639 = trunc(_1623);
    int _1641 = int(_1639);
    int _1643 = _375 + (-1);
    bool _1645 = !_1615;
    int _1647 = _1645 ? _1633 : (-1);
    bool _1649 = !_1637;
    int _1651 = _1649 ? 0 : 1;
    int _1653 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1655 = _1653 != 0;
    int _1657 = _1647 * _1629;
    int _1659 = abs(_1651);
    int _1661 = abs(_549);
    int _1663 = _1605 * _1643;
    int _1665 = _1663 + _1657;
    bool _1667 = !_1655;
    int _1669 = _1667 ? 0 : 1;
    bool _1671 = _367 > 0.5;
    int _1673 = _1665 * _1520;
    int _1675 = abs(_1669);
    int _1677 = _1641 * _1659;
    int _1679 = _1677 + _1508;
    int _1681 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1683 = _1681 != 0;
    int _1685 = _1536 * _1661;
    int _1687 = _1685 + _1673;
    float _1689 = float(uint(_1679));
    int _1691 = _1679 * _1526;
    int _1693 = _1691 + _1687;
    bool _1695 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1697 = isnan(_315);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    int _1707 = _1641 * _1675;
    int _1709 = _1707 + _1693;
    float _1711 = as_type<float>(_1538) * _1689;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1717 = -_185;
    int _1719 = _1671 ? as_type<int>(_1717) : as_type<int>(_185);
    float _1721 = float(uint(_1709));
    float _1723 = trunc(_1711);
    float _1725 = precise::max(_1723, 0.0);
    uint _1727 = uint(_1725);
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1731 = _1729 != 0;
    float _1733 = as_type<float>(_1538) * _1721;
    int _1735 = ~_375;
    int _1737 = _1735 + 1;
    bool _1739 = !_1683;
    float _1741 = _1739 ? _185 : as_type<float>(_1719);
    float _1743 = 1.0 / _1715;
    int _1745 = ~_375;
    int _1747 = _1745 + 1;
    float _1749 = _1741 + 0.5;
    float _1751 = fma(_1749, (*spvDescriptorSet0.vp_c9)._m0[80].x, _473);
    float _1753 = trunc(_1733);
    float _1755 = precise::max(_1753, 0.0);
    uint _1757 = uint(_1755);
    float _1759 = -_1518;
    float _1761 = fma(_1741, _1759, _1751);
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1765 = _1763 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1767 = _1737 * int(_1757);
    int _1769 = _1767 + _1709;
    float _1771 = float(uint(_1769));
    float _1773 = as_type<float>(_1538) * _1771;
    float _1775 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1777 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1775;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1781 = _315 + _1779;
    bool _1783 = _315 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1785 = isnan(_315);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    float _1795 = _1777 * _1743;
    float _1797 = -_1705;
    float _1799 = _1797 + 1.0;
    float _1801 = trunc(_1773);
    float _1803 = precise::max(_1801, 0.0);
    uint _1805 = uint(_1803);
    float _1807 = fma(_1795, _1781, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1809 = _1793 * _1799;
    int _1811 = ~_375;
    int _1813 = _1811 + 1;
    float _1815 = _1807 * _1809;
    float _1817 = -_189;
    int _1819 = _1530 ? as_type<int>(_1817) : as_type<int>(_189);
    bool _1821 = !_1731;
    float _1823 = _1821 ? _189 : as_type<float>(_1819);
    float _1825 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1827 = -_1793;
    float _1829 = _1827 + 1.0;
    int _1831 = int(_1757) + int(_1805);
    float _1833 = _1823 + (-0.5);
    int _1835 = _1813 * int(_1727);
    int _1837 = _1835 + _1679;
    float _1839 = fma(_1829, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1815);
    float _1841 = -_1833;
    float _1843 = -_475;
    float _1845 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1843);
    int _1847 = _1747 * _1831;
    int _1849 = _1847 + _1709;
    float _1851 = float(uint(_1837));
    float _1853 = fma(_1823, _1524, _1845);
    float _1855 = fma(_1705, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1839);
    bool _1857 = uint(_1849) >= uint(_375);
    float _1859 = as_type<float>(_1538) * _1851;
    float _1861 = _1855 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1863 = !_1857;
    int _1865 = _1863 ? 0 : (-1);
    float _1867 = trunc(_1859);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1875 = _1873 != 0;
    float _1877 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _1879 = ~_1831;
    int _1881 = _1879 + _1865;
    int _1883 = _1881 + 1;
    out.m_78.x = _1761;
    out.m_78.y = _1853;
    float _1885 = _1877 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1887 = _375 * _1883;
    int _1889 = _1887 + _1709;
    int _1891 = ~_375;
    int _1893 = _1891 + 1;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1897 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1899 = !_1615;
    int _1901 = _1899 ? _1889 : (-1);
    float _1903 = _1895 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1905 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1907 = int(_1727) + int(_1871);
    float _1909 = _1897 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1911 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1913 = _1901 >> 31;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1917 = _1911 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1919 = _1913 & 3;
    out.m_80.x = _1885;
    out.m_80.y = _1903;
    out.m_80.z = _1909;
    out.m_80.w = _1861;
    int _1921 = _1901 & 3;
    bool _1923 = _1921 != 0;
    float _1925 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1927 = _1901 + _1919;
    int _1929 = _1927 >> 2;
    out.m_82.x = _1915;
    out.m_82.y = _1765;
    out.m_82.z = _1917;
    out.m_82.w = _1925;
    int _1931 = _1929 << 4;
    int _1933 = _1931 + 368;
    float _1935 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1540);
    uint _1937 = uint(int(uint(_1933) >> uint(2)));
    uint _1939 = uint(int(uint(int(_1937)) >> uint(2)));
    int _1941 = int(_1937) & 3;
    float _1943 = (*spvDescriptorSet0.vp_c9)._m0[int(_1939)][_1941];
    int _1945 = int(_1937) + 1;
    uint _1947 = uint(int(uint(_1945) >> uint(2)));
    int _1949 = _1945 & 3;
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[int(_1947)][_1949];
    float _1953 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1935);
    float _1955 = _831 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1957 = _831 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1959 = _831 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1961 = _1893 * _1907;
    int _1963 = _1961 + _1679;
    float _1965 = -_819;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1955);
    float _1969 = -_819;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1957);
    float _1973 = -_819;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1959);
    float _1977 = _843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1979 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _1981 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1971);
    float _1983 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1975);
    float _1985 = _843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1987 = uint(_1963) >= uint(_375);
    float _1989 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1977);
    float _1991 = _1825 * _1979;
    int _1993 = _1901 & 3;
    bool _1995 = _1993 != 0;
    int _1997 = _1933 + 8;
    uint _1999 = uint(int(uint(_1997) >> uint(2)));
    uint _2001 = uint(int(uint(int(_1999)) >> uint(2)));
    int _2003 = int(_1999) & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    int _2007 = int(_1999) + 1;
    uint _2009 = uint(int(uint(_2007) >> uint(2)));
    int _2011 = _2007 & 3;
    float _2013 = (*spvDescriptorSet0.vp_c9)._m0[int(_2009)][_2011];
    float _2015 = fma(_823, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1985);
    float _2017 = _853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2019 = abs(_1041);
    float _2021 = log2(_2019);
    bool _2023 = uint(_1993) > 1u;
    float _2025 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2015);
    float _2027 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2029 = _1923 ? 0 : 1;
    float _2031 = _853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2033 = _853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2035 = _1825 * _1981;
    int _2037 = ~_2029;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    float _2043 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2017);
    float _2045 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2031);
    float _2047 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2033);
    float _2049 = _1825 * _1983;
    float _2051 = fma(_849, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1989);
    int _2053 = _2041;
    if (!_2023)
    {
        int _2055 = ~_2029;
        int _2057 = _2055 + 1;
        _2053 = _2057;
    }
    int _2059 = _2053;
    float _2061 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2043);
    bool _2063 = _1993 != 3;
    float _2065 = _2021 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2067 = uint(_1993) >= 2u;
    float _2069 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2045);
    float _2071 = fma(_861, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2047);
    int _2073 = abs(_2059);
    float _2075 = fma(_2027, _2051, _2035);
    float _2077 = exp2(_2065);
    int _2079 = _2067 ? 0 : 1;
    float _2081 = fma(_2027, _1953, _1991);
    bool _2083 = !_1995;
    int _2085 = _2083 ? 0 : 1;
    float _2087 = -_1475;
    float _2089 = _2087 + 1.0;
    int _2091 = ~_2073;
    int _2093 = _2091 + 1;
    int _2095 = _2093 + 1;
    int _2097 = ~_2079;
    int _2099 = _2097 + 1;
    int _2101 = _2099 + 1;
    bool _2103 = _1993 != 3;
    int _2105 = _2095 * as_type<int>(_1951);
    int _2107 = abs(_2085);
    int _2109 = _2101;
    float _2111 = _2089;
    if (_2063)
    {
        int _2113 = ~_2079;
        int _2115 = _2113 + 1;
        _2109 = _2115;
    }
    int _2117 = _2109;
    bool _2119 = !_2103;
    int _2121 = _2119 ? 0 : (-1);
    int _2123 = abs(_2117);
    bool _2125 = !_1875;
    int _2127 = _2125 ? 0 : 1;
    int _2129 = abs(_2121);
    float _2131 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    int _2135 = ~_2107;
    int _2137 = _2135 + 1;
    int _2139 = _2137 + 1;
    float _2141 = in.m_84.x;
    int _2143 = _2139 * as_type<int>(_1943);
    int _2145 = _2143 + _2105;
    int _2147 = abs(_2127);
    int _2149 = ~_2123;
    int _2151 = _2149 + 1;
    int _2153 = _2151 + 1;
    float _2155 = fma(_2133, -2.0, 3.0);
    float _2157 = _2133 * _2133;
    int _2159 = _2153 * as_type<int>(_2005);
    int _2161 = _2159 + _2145;
    float _2163 = _1341 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2165 = _2157 * _2155;
    bool _2167 = !_1987;
    int _2169 = _2167 ? 0 : (-1);
    float _2171 = fma(_1369, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2163);
    float _2173 = -_2165;
    float _2175 = _2173 + 1.0;
    int _2177 = ~_2129;
    int _2179 = _2177 + 1;
    int _2181 = _2179 + 1;
    int _2183 = ~_1907;
    int _2185 = _2183 + _2169;
    int _2187 = _2185 + 1;
    float _2189 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2165);
    float _2191 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2193 = _2181 * as_type<int>(_2013);
    int _2195 = _2193 + _2161;
    int _2197 = _375 * _2187;
    int _2199 = _2197 + _1679;
    float _2201 = exp2(_2191);
    bool _2203 = _1041 <= 8000.0;
    bool _2205 = isnan(_1041);
    bool _2207 = _2203 || _2205;
    bool _2209 = isnan(8000.0);
    bool _2211 = _2207 || _2209;
    float _2213 = float(_2211);
    float _2215 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2171);
    int _2217 = ~_2147;
    int _2219 = _2217 + 1;
    int _2221 = _2219 + 1;
    float _2223 = _1393 * 0.5;
    bool _2225 = !_1615;
    int _2227 = _2225 ? _2199 : (-1);
    float _2229 = _2213 * _2189;
    bool _2231 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2233 = isnan(_1189);
    bool _2235 = _2231 || _2233;
    bool _2237 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2239 = _2235 || _2237;
    int _2241 = _2195 * _2221;
    float _2243 = fma(_2027, _2025, _2049);
    float _2245 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2215);
    float _2247 = _2069 + _2075;
    int _2249 = _2227 * _2147;
    int _2251 = _2249 + _2241;
    float _2253 = _2071 + _2243;
    float _2255 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1451;
    out.gl_Position.y = _1453;
    out.gl_Position.z = _2245;
    out.gl_Position.w = _1393;
    float _2257 = -_2201;
    float _2259 = _2257 + 1.0;
    float _2261 = float(_2251);
    float _2263 = _2061 + _2081;
    float _2265 = _2259 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2267 = _2089 * _2255;
    float _2269 = precise::clamp(_2267, 0.0, 1.0);
    float _2271 = _2245 + _1393;
    out.m_86.x = _2263;
    out.m_86.y = _2247;
    out.m_86.z = _2253;
    float _2273 = _2265 * _1481;
    float _2275 = -_2265;
    float _2277 = _2275 + 1.0;
    float _2279 = -_2269;
    float _2281 = fma(_2279, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2283 = _1451 + _1393;
    float _2285 = _1492 * _2273;
    float _2287 = _1502 * _2273;
    float _2289 = _1492 * _2277;
    float _2291 = _2281 * _2141;
    float _2293 = fma(_1498, _2285, _1486);
    float _2295 = fma(_1500, _2285, _1488);
    float _2297 = fma(_1492, _2287, _1490);
    float _2299 = _2271 * 0.5;
    float _2301 = _2283 * 0.5;
    float _2303 = fma(_1453, -0.5, _2223);
    out.m_88.x = _2293;
    out.m_88.y = _2295;
    out.m_88.z = _2297;
    out.m_88.w = _2289;
    float _2305 = _2291 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2307 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2309 = _2291;
    float _2311 = _2261;
    float _2313 = _2299;
    float _2315 = _2301;
    float _2317 = _2305;
    if (!_2239)
    {
        _2111 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2319 = _2111;
    out.m_90.x = _2301;
    out.m_90.y = _2303;
    out.m_90.z = _2299;
    out.m_90.w = _1393;
    float _2321 = _2319;
    float _2323 = _2319;
    if (!_2239)
    {
        _2309 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2325 = _2309;
    out.m_92.x = _2261;
    out.m_94.x = _2305;
    float _2327 = _2325;
    float _2329 = _2325;
    if (!_2239)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2331 = _2311;
    float _2333 = _2331;
    float _2335 = _2331;
    if (!_2239)
    {
        _2313 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2337 = _2313;
    float _2339 = _2337;
    float _2341 = _2337;
    if (!_2239)
    {
        _2315 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2343 = _2315;
    float _2345 = _2343;
    float _2347 = _2343;
    if (!_2239)
    {
        _2317 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2349 = _2317;
    bool _2351 = !_2239;
    float _2353 = _2349;
    float _2355 = _2349;
    if (!_2351)
    {
        bool _2357 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2359 = isnan(_1189);
        bool _2361 = _2357 || _2359;
        bool _2363 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2365 = _2361 || _2363;
        if (!_2365)
        {
            float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2369 = _1189 + _2367;
            float _2371 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2373 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2371;
            float _2375 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2377 = _2375 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2381 = _2379 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2383 = 1.0 / _2373;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2397 = _2369 * _2383;
            float _2399 = precise::clamp(_2397, 0.0, 1.0);
            float _2401 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2403 = _2401 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2405 = fma(_2399, _2377, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2407 = fma(_2399, _2381, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2409 = fma(_2399, _2403, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2411 = fma(_2399, _2387, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2413 = fma(_2399, _2391, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2415 = fma(_2399, _2395, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2347 = _2407;
            _2335 = _2413;
            _2341 = _2405;
            _2329 = _2411;
            _2323 = _2409;
            _2355 = _2415;
            _2417 = true;
        }
        else
        {
            bool _2419 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2421 = isnan(_1189);
            bool _2423 = _2419 || _2421;
            bool _2425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2427 = _2423 || _2425;
            if (!_2427)
            {
                _2339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2429 = _2339;
            _2341 = _2429;
            if (!_2427)
            {
                _2345 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2431 = _2345;
            _2347 = _2431;
            if (!_2427)
            {
                _2321 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2433 = _2321;
            _2323 = _2433;
            if (!_2427)
            {
                _2327 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2435 = _2327;
            _2329 = _2435;
            if (!_2427)
            {
                _2333 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2437 = _2333;
            _2335 = _2437;
            if (!_2427)
            {
                _2353 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2439 = _2353;
            bool _2441 = !_2427;
            _2355 = _2439;
            if (!_2441)
            {
                bool _2443 = _1189 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2445 = isnan(_1189);
                bool _2447 = _2443 || _2445;
                bool _2449 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2451 = _2447 || _2449;
                if (!_2451)
                {
                    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2455 = _1189 + _2453;
                    float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2459 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2457;
                    float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2469 = 1.0 / _2459;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2483 = _2455 * _2469;
                    float _2485 = precise::clamp(_2483, 0.0, 1.0);
                    float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2491 = fma(_2485, _2463, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2493 = fma(_2485, _2467, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2495 = fma(_2485, _2489, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2497 = fma(_2485, _2473, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2499 = fma(_2485, _2477, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2501 = fma(_2485, _2481, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2347 = _2493;
                    _2335 = _2499;
                    _2341 = _2491;
                    _2329 = _2497;
                    _2323 = _2495;
                    _2355 = _2501;
                    _2417 = true;
                }
                else
                {
                    _2347 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2335 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2329 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2323 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2355 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2417 = false;
    float _2503 = _2347;
    float _2505 = _2335;
    float _2507 = _2341;
    float _2509 = _2329;
    float _2511 = _2323;
    float _2513 = _2355;
    float _2515 = fma(_2247, -0.5, 0.5);
    float _2517 = precise::clamp(_2515, 0.0, 1.0);
    float _2519 = -_2503;
    float _2521 = _2519 + _2505;
    float _2523 = _2307 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2525 = -_2507;
    float _2527 = _2525 + _2509;
    out.m_96.x = 0.0;
    float _2529 = fma(_2517, _2521, _2503);
    float _2531 = fma(_2517, _2527, _2507);
    out.m_53.x = _2523;
    float _2533 = -_2511;
    float _2535 = _2533 + _2513;
    float _2537 = _2529 * 0.586610972881317138671875;
    bool _2539 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2541 = fma(_2517, _2535, _2511);
    float _2543 = fma(_2531, 0.298911988735198974609375, _2537);
    bool _2545 = _1165 > 0.0;
    bool _2547 = isnan(_1165);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan(0.0);
    bool _2553 = _2549 || _2551;
    float _2555 = fma(_2541, 0.114477999508380889892578125, _2543);
    float _2557 = -_2555;
    float _2559 = _2531 + _2557;
    float _2561 = -_2555;
    float _2563 = _2529 + _2561;
    float _2565 = -_2555;
    float _2567 = _2541 + _2565;
    float _2569 = fma(_2559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2555);
    float _2571 = fma(_2563, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2555);
    float _2573 = fma(_2567, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2555);
    bool _2575 = !_2539;
    if (!_2575)
    {
        float _2577 = -_1111;
        float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2581 = -_1113;
        float _2583 = _2581 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2585 = -_1115;
        float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2589 = _2579 * _2579;
        float _2591 = fma(_2583, _2583, _2589);
        float _2593 = fma(_2587, _2587, _2591);
        float _2595 = sqrt(_2593);
        float _2597 = rsqrt(_2593);
        float _2599 = -_2595;
        float _2601 = _2599 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2603 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2605 = precise::clamp(_2603, 0.0, 1.0);
        float _2607 = _2583 * _2597;
        float _2609 = _2579 * _2597;
        float _2611 = abs(_2605);
        float _2613 = log2(_2611);
        float _2615 = _2587 * _2597;
        float _2617 = _2607 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2619 = _2247 * _2609;
        float _2621 = -_2609;
        float _2623 = -_2617;
        float _2625 = fma(_2621, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2623);
        float _2627 = fma(_2263, _2607, _2619);
        float _2629 = -_2615;
        float _2631 = fma(_2629, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2625);
        float _2633 = fma(_2253, _2615, _2627);
        float _2635 = precise::clamp(_2633, 0.0, 1.0);
        float _2637 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2639 = _2631 + _2637;
        float _2641 = _2613 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2643 = _2639 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2645 = precise::clamp(_2643, 0.0, 1.0);
        float _2647 = exp2(_2641);
        float _2649 = _2647 * _2645;
        float _2651 = _2635 * _2649;
        float _2653 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2655 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2657 = _2651 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _2653;
        out.m_96.y = _2655;
        out.m_96.z = _2657;
    }
    out.m_70.x = _2569;
    out.m_70.y = _2571;
    out.m_70.z = _2573;
    if (_2553)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2659 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2659;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

