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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_76 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_74 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2478 = false;
    bool _1621 = false;
    bool _827 = false;
    bool _647 = false;
    bool _539 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_46.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2643 = as_type<float>(_113);
        out.gl_Position.z = _2643;
    }
    if (!_101)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2712 = as_type<float>(_151);
        out.gl_Position.z = _2712;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_53.x;
    float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_58.w;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = _157 * _155;
    float _179 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _181 = _179 * 6.283185482025146484375;
    float _183 = floor(_179);
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = _181 * 0.15915493667125701904296875;
    int _197 = as_type<int>(_159) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_159) & 2;
    bool _203 = _201 != 0;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _195 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_203;
    int _215 = _213 ? (-1090519040) : 1056964608;
    float _217 = -_183;
    float _219 = _179 + _217;
    float _221 = _179;
    float _223 = _161;
    if (!_193)
    {
        float _225 = _161 * _161;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    bool _231 = !_199;
    int _233 = _231 ? (-1090519040) : 1056964608;
    bool _235 = _219 < 0.5;
    float _237 = float(_235);
    float _239 = _229;
    if (!_193)
    {
        float _241 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _241;
    }
    float _243 = _239;
    float _245 = fma(_211, 0.5, 0.5);
    bool _247 = !_193;
    float _249 = _243;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _161 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _161);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _279;
    }
    float _281 = _249;
    bool _283 = !_193;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _161 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _223 = _303;
    }
    float _305 = _223;
    float _307 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _313 = 0.0;
    if (!_193)
    {
        float _315 = _131 * _131;
        float _317 = _315 * 0.5;
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_305, _165, _307);
    float _323 = fma(_305, _167, _309);
    float _325 = -_219;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _329 = -_237;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = -_245;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_305, _169, _311);
    float _339 = 0.0;
    float _341 = _319;
    if (!_193)
    {
        _339 = _131;
    }
    float _343 = _339;
    float _345 = _343;
    if (!_193)
    {
        float _347 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _341 = _347;
    }
    float _349 = _341;
    bool _351 = !_193;
    float _353 = _349;
    if (!_351)
    {
        float _355 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _357 = log2(_355);
        float _359 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _361 = _359 + 1.0;
        float _363 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _365 = _131 * _357;
        float _367 = 1.0 / _361;
        float _369 = _363 * 0.693147182464599609375;
        float _371 = exp2(_365);
        float _373 = 1.0 / _369;
        float _375 = _371 + (-1.0);
        float _377 = -_375;
        float _379 = fma(_377, _373, _131);
        float _381 = _379 * _367;
        float _383 = _381 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _353 = _383;
    }
    float _385 = _353;
    bool _387 = !_193;
    if (!_387)
    {
        float _389 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _391 = log2(_389);
        float _393 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _395 = _393 + 1.0;
        float _397 = 1.0 / _395;
        float _399 = _131 * _391;
        float _401 = exp2(_399);
        float _403 = -_401;
        float _405 = _403 + 1.0;
        float _407 = _405 * _397;
        _345 = _407;
    }
    float _409 = _345;
    float _411 = in.m_60.x;
    float _413 = in.m_60.y;
    float _415 = in.m_60.z;
    float _417 = fma(_321, _163, _171);
    float _419 = fma(_323, _163, _173);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _427 = _425 != 0;
    float _429 = in.m_62.x;
    float _431 = in.m_62.y;
    float _433 = in.m_62.z;
    float _435 = fma(_337, _163, _175);
    float _437 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _439 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _441 = in.m_64.x;
    float _443 = in.m_64.y;
    float _445 = in.m_64.z;
    bool _447 = !_423;
    int _449 = _447 ? 0 : 1;
    float _451 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _453 = fma(_409, _165, _437);
    float _455 = fma(_409, _167, _439);
    int _457 = abs(_449);
    float _459 = fma(_409, _169, _451);
    bool _461 = !_207;
    int _463 = _461 ? 0 : 1;
    out.m_66.x = as_type<float>(_233);
    out.m_66.y = as_type<float>(_215);
    float _465 = -_453;
    float _467 = _321 + _465;
    int _469 = abs(_463);
    float _471 = -_455;
    float _473 = _323 + _471;
    float _475 = float(_457);
    float _477 = -_459;
    float _479 = _337 + _477;
    bool _481 = !_427;
    int _483 = _481 ? 0 : 1;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _487 = abs(_327);
    float _489 = _475 * _487;
    float _491 = _473 * _413;
    int _493 = abs(_483);
    float _495 = _473 * _431;
    float _497 = float(_469);
    float _499 = _473 * _443;
    float _501 = fma(_467, _411, _491);
    float _503 = fma(_467, _429, _495);
    float _505 = fma(_467, _441, _499);
    float _507 = float(_493);
    float _509 = fma(_497, _335, _489);
    float _511 = fma(_479, _415, _501);
    float _513 = fma(_479, _433, _503);
    float _515 = fma(_479, _445, _505);
    float _517 = abs(_331);
    float _519 = fma(_507, _517, _509);
    bool _521 = !_485;
    float _537;
    if (!_521)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _525 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_97);
        float _543 = 1.0 / _541;
        float _545 = _131 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _551 = _547 + _549;
    float _553 = in.m_58.x;
    float _555 = in.m_58.y;
    bool _557 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _559 = isnan(_547);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _569;
    bool _573 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _575 = isnan(_547);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = 1.0 / _571;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _593 = _551 * _585;
    float _595 = -_567;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _599;
    float _603 = fma(_589, _593, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _605 = _583 * _597;
    float _607 = fma(_601, _593, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _609 = -_583;
    float _611 = _609 + 1.0;
    float _613 = _603 * _605;
    float _615 = _607 * _605;
    float _617 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].x, _613);
    float _619 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].y, _615);
    float _621 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].x, _617);
    float _623 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].y, _619);
    float _625 = _621 * _553;
    float _627 = _623 * _555;
    bool _629 = !_591;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_97);
        float _651 = 1.0 / _649;
        float _653 = _131 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _659 = _655 + _657;
    bool _661 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _663 = isnan(_655);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _675 = _655 + _673;
    bool _677 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _679 = isnan(_655);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _697 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _699 = isnan(_655);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_671;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _695;
    float _715 = _707 * _711;
    float _717 = -_707;
    float _719 = _717 + 1.0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _721;
    bool _725 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _727 = 1.0 / _691;
    float _729 = _687 * _719;
    float _731 = -_687;
    float _733 = _731 + 1.0;
    float _735 = _675 * _713;
    float _737 = _659 * _727;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _743;
    float _747 = fma(_723, _737, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _749 = fma(_741, _737, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _751 = fma(_745, _737, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _753 = _747 * _729;
    float _755 = _749 * _729;
    float _757 = _751 * _729;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _771 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[107].x, _753);
    float _773 = fma(_761, _735, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _775 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[107].y, _755);
    float _777 = fma(_765, _735, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _779 = fma(_769, _735, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _781 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[107].z, _757);
    float _783 = fma(_773, _715, _771);
    float _785 = fma(_777, _715, _775);
    float _787 = fma(_779, _715, _781);
    float _789 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].x, _783);
    float _791 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].y, _785);
    float _793 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].z, _787);
    float _795 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _797 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _803;
    out.m_68.y = _805;
    out.m_68.z = _807;
    out.m_68.w = _801;
    bool _809 = !_725;
    float _825;
    if (!_809)
    {
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _813 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_97);
        float _831 = 1.0 / _829;
        float _833 = _131 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = in.m_53.y;
    float _839 = _153 * 2.0;
    float _841 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _843 = log2(_841);
    float _845 = _419 * _443;
    float _847 = in.m_53.z;
    float _849 = _419 * _413;
    float _851 = fma(_417, _441, _845);
    float _853 = _419 * _431;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _865 = _863 != 0;
    float _867 = floor(_839);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _869;
    float _873 = fma(_435, _445, _851);
    float _875 = fma(_417, _429, _853);
    float _877 = in.m_62.w;
    float _879 = fma(_417, _411, _849);
    float _881 = fma(_435, _433, _875);
    float _883 = _843 * _131;
    float _885 = 1.0 / _871;
    float _887 = in.m_64.w;
    float _889 = fma(_435, _415, _879);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _893 = _835 + _891;
    float _895 = _837 * 2.0;
    bool _897 = _867 > 0.0;
    float _899 = exp2(_883);
    bool _901 = _867 >= 0.0;
    bool _903 = isnan(_867);
    bool _905 = _901 || _903;
    bool _907 = isnan(0.0);
    bool _909 = _905 || _907;
    float _911 = _847 * 2.0;
    float _913 = in.m_60.w;
    float _915 = _837 + _847;
    int _917 = _909 ? 0 : 1;
    float _919 = floor(_895);
    float _921 = _915 + (-1.0);
    float _923 = _893 * _885;
    float _925 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _929 = 1.0 + _927;
    float _931 = floor(_911);
    float _933 = _153 + _837;
    float _935 = -_899;
    float _937 = _935 + 1.0;
    float _939 = _873 + _887;
    float _941 = _933 + (-1.0);
    bool _943 = _919 >= 0.0;
    bool _945 = isnan(_919);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    float _953 = 1.0 / _929;
    bool _955 = _919 > 0.0;
    float _957 = _889 + _913;
    int _959 = _951 ? 0 : 1;
    float _961 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _963 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _971 = _967 || _969;
    float _973 = _881 + _877;
    int _975 = ~_917;
    int _977 = _975 + 1;
    int _979 = _977 + 1;
    int _981 = _979;
    float _983 = _939;
    if (!_897)
    {
        int _985 = ~_917;
        int _987 = _985 + 1;
        _981 = _987;
    }
    int _989 = _981;
    bool _991 = _931 > 0.0;
    bool _993 = _931 >= 0.0;
    bool _995 = isnan(_931);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    float _1003 = _971 ? _937 : 0.0;
    bool _1005 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1007 = isnan(1.0);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1013 = _1009 || _1011;
    bool _1015 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1017 = isnan(_835);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = -_1025;
    float _1029 = _1027 + 1.0;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1031;
    bool _1035 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1037 = isnan(_835);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1047;
    int _1051 = ~_959;
    int _1053 = _1051 + 1;
    int _1055 = _1053 + 1;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1057;
    float _1061 = fma(_1033, _923, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1063 = _1045 * _1029;
    float _1065 = fma(_1049, _923, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1067 = fma(_1059, _923, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1069 = _1055;
    if (_1013)
    {
        float _1071 = _1003 * _953;
        _135 = _1071;
    }
    float _1073 = _135;
    float _1075 = _1061 * _1063;
    float _1077 = _1065 * _1063;
    float _1079 = -_1045;
    float _1081 = _1079 + 1.0;
    float _1083 = _1067 * _1063;
    if (!_955)
    {
        int _1085 = ~_959;
        int _1087 = _1085 + 1;
        _1069 = _1087;
    }
    int _1089 = _1069;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1093 = _973 + _1091;
    int _1095 = _1001 ? 0 : 1;
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1075);
    bool _1099 = !_857;
    int _1101 = _1099 ? 0 : 1;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1105 = _957 + _1103;
    int _1107 = ~_1095;
    int _1109 = _1107 + 1;
    int _1111 = _1109 + 1;
    float _1113 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1115 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1077);
    int _1117 = _1111;
    if (!_991)
    {
        int _1119 = ~_1095;
        int _1121 = _1119 + 1;
        _1117 = _1121;
    }
    int _1123 = _1117;
    float _1125 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1083);
    int _1127 = abs(_1101);
    float _1129 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1113);
    bool _1131 = !_861;
    int _1133 = _1131 ? 0 : 1;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1137 = _939 + _1135;
    float _1139 = float(_1127);
    float _1141 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1097);
    float _1143 = float(_1123);
    float _1145 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1129);
    int _1147 = abs(_1133);
    float _1149 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1125);
    float _1151 = in.m_70.x;
    float _1153 = in.m_70.y;
    float _1155 = in.m_70.z;
    float _1157 = _1139 * _1143;
    float _1159 = _1093 * _1093;
    bool _1161 = _1145 >= 0.0;
    float _1163 = _1141 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1165 = float(_1147);
    float _1167 = fma(_1105, _1105, _1159);
    float _1169 = float(_989);
    float _1171 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1115);
    float _1173 = fma(_1137, _1137, _1167);
    bool _1175 = !_865;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = _1165 * _1169;
    float _1181 = _837 + (-0.5);
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1185 = abs(_1177);
    float _1187 = rsqrt(_1173);
    float _1189 = _1179 * (-2.0);
    float _1191 = _1149 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    int _1195 = as_type<int>(_1191);
    if (_1161)
    {
        _1193 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1197 = _1193;
    float _1199 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1201 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = fma(_1189, _1153, _1153);
    float _1207 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1209 = _1155;
    if (_1161)
    {
        float _1211 = _1197 * 5.0;
        _1195 = as_type<int>(_1211);
    }
    int _1213 = _1195;
    float _1215 = fma(_925, _1189, _925);
    float _1217 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1205);
    out.m_72.x = _1201;
    out.m_72.y = _1207;
    out.m_72.z = _1203;
    out.m_72.w = _1183;
    float _1219 = fma(_1215, _1073, _1217);
    float _1221 = float(_1185);
    if (_1161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4345 = as_type<float>(_1213);
        out.gl_Position.z = _4345;
    }
    float _1223 = _1093 * _1187;
    float _1225 = _1105 * _1187;
    if (_1161)
    {
        out.m_49.x = 0.0;
    }
    if (_1161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1227 = -_1223;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1231 = float(_1089);
    float _1233 = _1137 * _1187;
    float _1235 = -_1225;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[18].w, _957);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1241 = _1229 + _1239;
    float _1243 = -_1223;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1093);
    float _1247 = -_1233;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _939);
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1253 = _1237 + _1251;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1257 = _1157 * (-2.0);
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1261 = _1249 + _1259;
    float _1263 = _1219 * 0.15915493667125701904296875;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1255);
    float _1267 = _1245 * _1245;
    float _1269 = fma(_961, _1257, _961);
    float _1271 = -_1225;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1105);
    float _1275 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1265);
    float _1277 = fma(_1257, _1151, _1151);
    float _1279 = _1221 * _1231;
    float _1281 = _153 + (-0.5);
    float _1283 = _153 + _847;
    float _1285 = fma(_1273, _1273, _1267);
    bool _1287 = _1275 >= 0.0;
    float _1289 = _1279 * (-2.0);
    float _1291 = _1283 + (-1.0);
    float _1293 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1277);
    float _1295 = fma(_1289, _1155, _1155);
    float _1297 = _847 + (-0.5);
    float _1299 = fma(_1291, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1301 = -_1233;
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1137);
    float _1305 = fma(_1269, _1073, _1293);
    float _1307 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1295);
    float _1309 = fma(_1299, _1289, _1299);
    float _1311 = fma(_1303, _1303, _1285);
    float _1313 = _1305 * 0.15915493667125701904296875;
    float _1315 = _1241;
    float _1317 = _1261;
    if (_1287)
    {
        _1209 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1319 = _1209;
    float _1321 = fma(_1309, _1073, _1307);
    float _1323 = _1263 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    int _1327 = as_type<int>(_1319);
    if (_1287)
    {
        out.m_49.x = 0.0;
    }
    if (_1287)
    {
        float _1329 = _1319 * 5.0;
        _1327 = as_type<int>(_1329);
    }
    int _1331 = _1327;
    float _1333 = _1321 * 0.15915493667125701904296875;
    float _1335 = _1263 * 6.283185482025146484375;
    float _1337 = cos(_1335);
    if (_1287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4551 = as_type<float>(_1331);
        out.gl_Position.z = _4551;
    }
    float _1339 = sqrt(_1311);
    float _1341 = _1313 * 6.283185482025146484375;
    float _1343 = sin(_1341);
    float _1345 = _1313 * 6.283185482025146484375;
    float _1347 = cos(_1345);
    if (_1287)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1349 = _519 * _627;
    float _1351 = _1333 * 6.283185482025146484375;
    float _1353 = cos(_1351);
    float _1355 = _1187 * _1339;
    float _1357 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_215));
    float _1359 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1361 = _519 * _625;
    float _1363 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_233));
    float _1365 = _1343 * _1325;
    float _1367 = _1355 * _1359;
    float _1369 = _1333 * 6.283185482025146484375;
    float _1371 = sin(_1369);
    float _1373 = _1347 * _1337;
    float _1375 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1377 = _1375 * 0.5;
    float _1379 = _1357 * _1367;
    float _1381 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1383 = _1343 * _1337;
    float _1385 = _1381 * _1355;
    float _1387 = _1353 * _1379;
    float _1389 = _1347 * _1325;
    float _1391 = _1325 * _1353;
    float _1393 = _1385 * _1363;
    float _1395 = _1347 * _1387;
    float _1397 = _1337 * _1353;
    float _1399 = _1343 * _1387;
    float _1401 = fma(_1371, _1373, _1365);
    float _1403 = -_1379;
    float _1405 = _1371 * _1403;
    float _1407 = fma(_1371, _1365, _1373);
    float _1409 = fma(_1401, _1393, _1395);
    float _1411 = -_1383;
    float _1413 = fma(_1371, _1389, _1411);
    float _1415 = -_1389;
    float _1417 = fma(_1371, _1383, _1415);
    float _1419 = fma(_1397, _1393, _1405);
    float _1421 = fma(_1413, _1377, _1409);
    float _1423 = fma(_1417, _1393, _1399);
    float _1425 = fma(_1391, _1377, _1419);
    float _1427 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1429 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1431 = fma(_1407, _1377, _1423);
    float _1433 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1427);
    float _1435 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1429);
    float _1437 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1439 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1433);
    float _1441 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1435);
    float _1443 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1437);
    float _1445 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1447 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1449 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1443);
    float _1451 = _957 + _1445;
    float _1453 = _939 + _1447;
    float _1455 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1459 = _1451 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1463 = _1453 + _1461;
    float _1465 = _973 + _1455;
    float _1467 = _1459 * _1459;
    float _1469 = _1463 * _1463;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1455;
    float _1479 = _1451;
    float _1481 = _1421;
    float _1483 = _1453;
    float _1485 = _1469;
    float _1487 = _1471;
    if (!_1475)
    {
        _1477 = _1451;
    }
    float _1489 = _1477;
    float _1491 = _1489;
    if (!_1475)
    {
        _1479 = _1453;
    }
    float _1493 = _1479;
    float _1495 = _1493;
    if (!_1475)
    {
        _1481 = _1467;
    }
    float _1497 = _1481;
    float _1499 = _1497;
    if (!_1475)
    {
        _1483 = _1465;
    }
    float _1501 = _1483;
    bool _1503 = !_1475;
    float _1505 = _1501;
    if (!_1503)
    {
        float _1507 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1511 = _1473 + _1509;
        float _1513 = rsqrt(_1471);
        float _1515 = _1511 * _1507;
        float _1517 = _1465 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1519 = _1515 * 0.15915493667125701904296875;
        float _1521 = _1519 * 6.283185482025146484375;
        float _1523 = sin(_1521);
        float _1525 = _1519 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        float _1529 = fma(_1523, _1517, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1531 = _1513 * _1529;
        float _1533 = _1527 + (-1.0);
        float _1535 = fma(_1459, _1531, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1537 = fma(_1463, _1531, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1539 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1543 = _1535 + _1541;
        float _1545 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1547 = _1537 + _1545;
        float _1549 = fma(_1465, _1527, _1539);
        float _1551 = _1543 * _1543;
        float _1553 = _1547 * _1547;
        _1505 = _1549;
        _1499 = _1551;
        _1485 = _1553;
        _1491 = _1535;
        _1495 = _1537;
    }
    float _1555 = _1505;
    float _1557 = _1499;
    float _1559 = _1485;
    float _1561 = _1491;
    float _1563 = _1495;
    float _1565 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1567 = _1555 + _1565;
    float _1569 = fma(_1567, _1567, _1557);
    float _1571 = _1569 + _1559;
    float _1573 = sqrt(_1571);
    bool _1575 = _1573 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1577 = isnan(_1573);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1583 = _1579 || _1581;
    float _1585 = _1569;
    if (!_1583)
    {
        _1585 = 1.0;
    }
    float _1587 = _1585;
    bool _1589 = !_1583;
    float _1591 = _1587;
    if (!_1589)
    {
        bool _1593 = _1573 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1595 = isnan(_1573);
        bool _1597 = _1593 || _1595;
        bool _1599 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1601 = _1597 || _1599;
        if (!_1601)
        {
            float _1603 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1605 = _1573 + _1603;
            float _1607 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1609 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1607;
            float _1611 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1615 = 1.0 / _1609;
            float _1617 = _1605 * _1615;
            float _1619 = fma(_1617, _1613, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1591 = _1619;
            _1621 = true;
        }
        else
        {
            bool _1623 = _1573 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1625 = isnan(_1573);
            bool _1627 = _1623 || _1625;
            bool _1629 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1631 = _1627 || _1629;
            if (!_1631)
            {
                float _1633 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1635 = _1573 + _1633;
                float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1639 = _1637 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1643 = _1641 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1645 = 1.0 / _1639;
                float _1647 = _1635 * _1645;
                float _1649 = fma(_1647, _1643, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1591 = _1649;
                _1621 = true;
            }
            else
            {
                _1591 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1621 = false;
    float _1651 = _1591;
    float _1653 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1655 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1657 = _1561 + _1655;
    float _1659 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1653);
    bool _1661 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.5);
    bool _1669 = _1665 || _1667;
    float _1671 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1659);
    float _1673 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1675 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1677 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan(0.5);
    bool _1683 = _1679 || _1681;
    float _1685 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1687 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1673);
    float _1689 = fma(_1657, _1651, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1691 = 1.0 / _1685;
    float _1693 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1687);
    float _1695 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1697 = _1695 + _1685;
    float _1699 = _1685;
    if (_1683)
    {
        _1699 = 1.0;
    }
    float _1701 = _1699;
    float _1703 = _1697 * _1691;
    float _1705 = _1703 * 0.5;
    float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1709 = _1555 + _1707;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1713 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1711);
    float _1715 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1717 = _1563 + _1715;
    float _1719 = fma(_1709, _1651, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1721 = fma(_1717, _1651, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1723 = 1.0 / _1713;
    float _1725 = -_1225;
    float _1727 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1689);
    float _1729 = -_1223;
    float _1731 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1719);
    float _1733 = -_1233;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1721);
    float _1737 = _1731;
    float _1739 = _1727;
    float _1741 = _1735;
    float _1743 = _1701;
    if (!_1669)
    {
        float _1745 = _1241 * _1241;
        float _1747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1749 = -_939;
        float _1751 = _1749 + _1721;
        float _1753 = -_957;
        float _1755 = _1753 + _1689;
        float _1757 = fma(_1253, _1253, _1745);
        float _1759 = fma(_1261, _1261, _1757);
        float _1761 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1763 = sqrt(_1759);
        float _1765 = 1.0 / _1355;
        float _1767 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1769 = precise::min(_1763, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1771 = _1769 * _1747;
        float _1773 = -_973;
        float _1775 = _1773 + _1719;
        float _1777 = _1771 * _1765;
        float _1779 = _1767 * _1777;
        float _1781 = _1751 * _1777;
        float _1783 = fma(_1755, _1779, _1237);
        float _1785 = fma(_1775, _1779, _1229);
        float _1787 = fma(_1767, _1781, _1249);
        _1737 = _1785;
        _1739 = _1783;
        _1741 = _1787;
        _983 = _1781;
    }
    float _1789 = _1737;
    float _1791 = _1739;
    float _1793 = _1741;
    float _1795 = _983;
    float _1797 = _1795;
    if (_1683)
    {
        _1797 = 1.0;
    }
    float _1799 = _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1803 = _1723 * _1801;
    float _1805 = _1799;
    if (!_1683)
    {
        float _1807 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1809 = _1807 * 0.15915493667125701904296875;
        float _1811 = _1809 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1817 = _1815 * 0.15915493667125701904296875;
        float _1819 = _1809 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = 1.0 / _1813;
        float _1825 = _1817 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = _1821 * _1823;
        float _1831 = _1817 * 6.283185482025146484375;
        float _1833 = sin(_1831);
        float _1835 = _1827 * _1829;
        float _1837 = 1.0 / _1835;
        float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1841 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1839;
        float _1843 = 1.0 / _1841;
        float _1845 = _1833 * _1837;
        float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1849 = fma(_1803, _1845, _1847);
        float _1851 = _1849 * _1843;
        float _1853 = precise::clamp(_1851, 0.0, 1.0);
        _1315 = _1817;
        _1743 = _1853;
    }
    float _1855 = _1315;
    float _1857 = _1743;
    float _1859 = _1855;
    if (!_1683)
    {
        float _1861 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1863 = _1861 * 0.15915493667125701904296875;
        float _1865 = _1863 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1871 = _1869 * 0.15915493667125701904296875;
        float _1873 = _1863 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        float _1877 = 1.0 / _1867;
        float _1879 = _1871 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        float _1883 = _1875 * _1877;
        float _1885 = _1871 * 6.283185482025146484375;
        float _1887 = sin(_1885);
        float _1889 = _1881 * _1883;
        float _1891 = 1.0 / _1889;
        float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1895 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1893;
        float _1897 = 1.0 / _1895;
        float _1899 = _1887 * _1891;
        float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1903 = fma(_1803, _1899, _1901);
        float _1905 = _1903 * _1897;
        float _1907 = precise::clamp(_1905, 0.0, 1.0);
        float _1909 = -_1907;
        float _1911 = _1909 + 1.0;
        _1859 = _1867;
        _1317 = _1889;
        _1805 = _1911;
    }
    float _1913 = _1859;
    float _1915 = _1317;
    float _1917 = _1805;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1921 = _1789 + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1925 = _1791 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1929 = _1793 + _1927;
    float _1931 = _1921 * _1921;
    float _1933 = fma(_1925, _1925, _1931);
    float _1935 = fma(_1929, _1929, _1933);
    float _1937 = rsqrt(_1935);
    float _1939 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1941 = _1925 * _1939;
    float _1943 = _1929 * _1939;
    float _1945 = _1941 * _1941;
    float _1947 = _1943 * _1943;
    float _1949 = _1945 + _1947;
    float _1951 = sqrt(_1949);
    bool _1953 = _1951 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1957 = _1951 + _1955;
    float _1959 = _1933;
    float _1961 = _1949;
    float _1963 = _1957;
    float _1965 = _1913;
    float _1967 = _1921;
    float _1969 = _1915;
    if (_1953)
    {
        float _1971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _1971;
    }
    float _1973 = _1959;
    if (_1953)
    {
        float _1975 = rsqrt(_1949);
        _1961 = _1975;
    }
    float _1977 = _1961;
    float _1979 = _1977;
    if (_1953)
    {
        float _1981 = _1957 * _1973;
        _1963 = _1981;
    }
    float _1983 = _1963;
    if (_1953)
    {
        float _1985 = _1983 * 0.15915493667125701904296875;
        _1965 = _1985;
    }
    float _1987 = _1965;
    float _1989 = _1929;
    if (_1953)
    {
        float _1991 = _1987 * 6.283185482025146484375;
        float _1993 = sin(_1991);
        _1989 = _1993;
    }
    float _1995 = _1989;
    float _1997 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1999 = precise::max(0.0, _1997);
    float _2001 = _1973;
    float _2003 = _1999;
    if (_1953)
    {
        float _2005 = _1987 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        _2001 = _2007;
    }
    float _2009 = _2001;
    float _2011 = -_1939;
    float _2013 = -_1999;
    float _2015 = fma(_1921, _2011, _2013);
    if (_1953)
    {
        float _2017 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1967 = _2017;
    }
    float _2019 = _1967;
    float _2021 = sqrt(_1935);
    float _2023 = _2019;
    float _2025 = _1995;
    if (_1953)
    {
        float _2027 = fma(_1995, _2019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2023 = _2027;
    }
    float _2029 = _2023;
    float _2031 = _2029;
    if (!_1953)
    {
        _2025 = _1941;
    }
    float _2033 = _2025;
    float _2035 = _2033;
    float _2037 = _2009;
    if (_1953)
    {
        float _2039 = _2009 + (-1.0);
        _2003 = _2039;
    }
    float _2041 = _2003;
    float _2043 = _2041;
    if (_1953)
    {
        float _2045 = _1977 * _2029;
        _1487 = _2045;
    }
    float _2047 = _1487;
    if (!_1953)
    {
        _2031 = _2015;
    }
    float _2049 = _2031;
    float _2051 = _2049;
    if (_1953)
    {
        float _2053 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _2053;
    }
    float _2055 = _1969;
    if (_1953)
    {
        float _2057 = _1941 * _2047;
        _2035 = _2057;
    }
    float _2059 = _2035;
    if (!_1953)
    {
        _2043 = _1943;
    }
    float _2061 = _2043;
    float _2063 = _2061;
    if (_1953)
    {
        float _2065 = _1943 * _2047;
        _2063 = _2065;
    }
    float _2067 = _2063;
    if (!_1953)
    {
        _1979 = _1945;
    }
    float _2069 = _1979;
    float _2071 = _2069;
    if (_1953)
    {
        float _2073 = fma(_2015, _2009, _2055);
        _2051 = _2073;
    }
    float _2075 = _2051;
    if (_1953)
    {
        float _2077 = _2059 * _2059;
        _2071 = _2077;
    }
    float _2079 = _2071;
    if (!_1953)
    {
        _2037 = _1947;
    }
    float _2081 = _2037;
    float _2083 = _2081;
    if (_1953)
    {
        float _2085 = _2067 * _2067;
        _2083 = _2085;
    }
    float _2087 = _2083;
    float _2089 = fma(_2075, _2075, _2079);
    float _2091 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = _2089 + _2087;
    float _2095 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = rsqrt(_2093);
    float _2107 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2109 = -_2101;
    float _2111 = _2109 + 1.0;
    float _2113 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2117 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2107);
    float _2119 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2121 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2115);
    float _2123 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2125 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2113);
    float _2127 = abs(_2111);
    float _2129 = log2(_2127);
    float _2131 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2135 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2125);
    float _2137 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2139 = _2105 * _2059;
    float _2141 = -_2133;
    float _2143 = fma(_2141, _2119, 1.0);
    float _2145 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2147 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2137);
    float _2151 = _2105 * _2067;
    float _2153 = log2(_2143);
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2157 = _2105 * _2075;
    float _2159 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2161 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2163 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2155);
    float _2165 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2167 = -_2159;
    float _2169 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2167);
    float _2171 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2163);
    float _2173 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2175 = -_2151;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2169);
    float _2179 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2181 = 1.0 / _2171;
    float _2183 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2173);
    float _2185 = fma(_2177, -0.5, 0.5);
    float _2187 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2179);
    float _2189 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2183);
    float _2191 = _2157 + 1.0;
    float _2193 = _2153 * 0.693147182464599609375;
    float _2195 = exp2(_2165);
    float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2199 = sqrt(_2185);
    float _2201 = fma(_2177, 0.5, 0.5);
    float _2203 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2187);
    float _2205 = fma(_2201, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2207 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2203);
    float _2209 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2189);
    float _2211 = -_2157;
    float _2213 = fma(_2195, _2191, _2211);
    float _2215 = fma(_2201, _2205, -0.212114393711090087890625);
    float _2217 = _2207 * _2181;
    float _2219 = _2209 * _2181;
    float _2221 = fma(_2213, 0.5, 0.5);
    float _2223 = fma(_2201, _2215, 1.570728778839111328125);
    float _2225 = fma(_2217, 0.5, 0.5);
    float _2227 = _2199 * 0.636619746685028076171875;
    float _2229 = fma(_2219, -0.5, 0.5);
    float _2231 = -_2223;
    float _2233 = fma(_2227, _2231, 1.0);
    float3 _5970 = float3(_2225, _2229, _2197);
    float _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5970, float3(0.0), isnan(_5970)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5970, float3(0.0), isnan(_5970)), level(0.0)).x;
    float3 _5981 = float3(_2225, _2229, _2197);
    float4 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5981, float3(0.0), isnan(_5981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5981, float3(0.0), isnan(_5981)), level(0.0)).xyzw;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _2238.w;
    float2 _5998 = float2(_2233, _2221);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2260 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2262 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2264 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2266 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2258);
    float _2268 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2260);
    float _2270 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2262);
    float _2272 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2264);
    float _2274 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2266);
    float _2276 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2268);
    float _2278 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2270);
    float _2280 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2272);
    float _2282 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2284 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2286 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_74.y = 1.0;
    float _2288 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2290 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2292 = _2280 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2294 = -_513;
    float _2296 = _2294 + _1789;
    float _2298 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2288);
    float _2300 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2290);
    float _2302 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2304 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2306 = -_511;
    float _2308 = _2306 + _1791;
    float _2310 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2312 = -_515;
    float _2314 = _2312 + _1793;
    float _2316 = _2304 + _2298;
    float _2318 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2302);
    float _2320 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2322 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2324 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2316);
    float _2326 = _2310 + _2318;
    float _2328 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2320);
    float _2330 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2332 = 1.0 / _2324;
    float _2334 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2326);
    float _2336 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2328);
    float _2338 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2322);
    float _2340 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2300);
    float _2342 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2344 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2346 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2348 = exp2(_2330);
    float _2350 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2342);
    float _2352 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2340);
    float _2354 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2344);
    float _2356 = _2346 + _2338;
    float _2358 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2350);
    float _2360 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2354);
    float _2362 = _2334 * _2332;
    float _2364 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2366 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2368 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2358);
    float _2370 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2356);
    float _2372 = _2352 + _2171;
    float _2374 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2366);
    float _2376 = 1.0 / _2364;
    float _2378 = -_2348;
    float _2380 = _2378 + 1.0;
    float _2382 = _2368 * _2332;
    float _2384 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2374);
    float _2386 = _2370 * _2332;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2390 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _2392 = _2382 > 0.0;
    float _2394 = _2372 * 0.5;
    out.gl_Position.x = _2207;
    out.gl_Position.y = _2209;
    out.gl_Position.z = _2352;
    out.gl_Position.w = _2171;
    bool _2396 = _2382 < 1.0;
    bool _2398 = _2396 && _2392;
    float _2400 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    out.m_76.z = _2394;
    out.m_76.w = _2171;
    float _2402 = _2390 * _2376;
    bool _2404 = _2217 > (-1.0);
    bool _2406 = _2404 && _2398;
    float _2408 = _2400 * _2376;
    bool _2410 = _2219 > (-1.0);
    bool _2412 = _2410 && _2406;
    bool _2414 = _2217 < 1.0;
    bool _2416 = _2414 && _2412;
    bool _2418 = _2219 < 1.0;
    bool _2420 = _2418 && _2416;
    float _2422 = _2388 * _2235;
    float _2424 = -_2388;
    float _2426 = _2424 + 1.0;
    float _2428 = _2246 * _2422;
    float _2430 = _2256 * _2422;
    float _2432 = _2246 * _2426;
    float _2434 = fma(_2252, _2428, _2240);
    float _2436 = fma(_2254, _2428, _2242);
    float _2438 = fma(_2246, _2430, _2244);
    out.m_78.x = _2434;
    out.m_78.y = _2436;
    out.m_78.z = _2438;
    out.m_78.w = _2432;
    bool _2440 = !_2420;
    float _2476;
    if (!_2440)
    {
        float _2442 = -_2386;
        float _2444 = _2219 + _2442;
        float _2446 = -_2362;
        float _2448 = _2217 + _2446;
        float _2450 = -_2402;
        float _2452 = _2217 + _2450;
        float _2454 = -_2408;
        float _2456 = _2219 + _2454;
        float _2458 = _2444 * _2444;
        float _2460 = fma(_2448, _2448, _2458);
        float _2462 = sqrt(_2460);
        bool _2464 = _2462 > 0.0;
        float _2466 = _1857 * _1917;
        float _2468 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _2470 = _2466;
        if (!_2464)
        {
            _2470 = _2468;
        }
        float _2472 = _2470;
        bool _2474 = !_2464;
        _2476 = _2472;
        _2478 = _2474;
        if (!_2478)
        {
            float _2480 = _2456 * _2456;
            float _2482 = fma(_2452, _2452, _2480);
            float _2484 = rsqrt(_2460);
            float _2486 = sqrt(_2482);
            float _2488 = _2448 * _2484;
            float _2490 = _2444 * _2484;
            bool _2492 = _2486 > 0.0;
            float _2494 = _2484;
            if (!_2492)
            {
                _2494 = _2468;
            }
            float _2496 = _2494;
            bool _2498 = !_2492;
            _2476 = _2496;
            _2478 = _2498;
            if (!_2478)
            {
                float _2500 = _1385 * _2292;
                float _2502 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _2504 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2304);
                float _2506 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2346);
                float _2508 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2504);
                float _2510 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2310);
                float _2512 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2506);
                float _2514 = 1.0 / _2508;
                float _2516 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2510);
                float _2518 = _2502 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2520 = rsqrt(_2482);
                float _2522 = _2456 * _2518;
                float _2524 = _2452 * _2518;
                float _2526 = _2522 * _2522;
                float _2528 = _2512 * _2514;
                float _2530 = _2516 * _2514;
                float _2532 = fma(_2524, _2524, _2526);
                float _2534 = _2528 * _2528;
                float _2536 = fma(_2530, _2530, _2534);
                float _2538 = sqrt(_2532);
                float _2540 = _2456 * _2520;
                float _2542 = _2452 * _2520;
                float _2544 = _2490 * _2540;
                float _2546 = sqrt(_2536);
                float _2548 = fma(_2488, _2542, _2544);
                float _2550 = precise::min(0.0, _2548);
                float _2552 = _2171 * _2550;
                float _2554 = fma(_2524, _2552, _2207);
                float _2556 = fma(_2538, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2546);
                float _2558 = fma(_2522, _2552, _2209);
                float _2560 = 1.0 / _2556;
                out.gl_Position.x = _2554;
                out.gl_Position.y = _2558;
                float _2562 = _2546 * _2560;
                out.m_74.y = _2562;
                _2476 = _2468;
                _2478 = true;
            }
        }
    }
    else
    {
        float _2564 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2564;
        _2476 = 0.0;
    }
    _2478 = false;
    float _2566 = _2476;
    bool _2568 = _1857 > 0.0;
    bool _2570 = isnan(_1857);
    bool _2572 = _2568 || _2570;
    bool _2574 = isnan(0.0);
    bool _2576 = _2572 || _2574;
    float _2578 = _2566 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2580 = _1917 <= 0.0;
    bool _2582 = !_2576;
    bool _2584 = _2580 || _2582;
    out.m_49.x = _2578;
    if (!_2584)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2478 = false;
    bool _1621 = false;
    bool _827 = false;
    bool _647 = false;
    bool _539 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_46.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2643 = as_type<float>(_113);
        out.gl_Position.z = _2643;
    }
    if (!_101)
    {
        return out;
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2712 = as_type<float>(_151);
        out.gl_Position.z = _2712;
    }
    if (_145)
    {
        return out;
    }
    float _153 = in.m_53.x;
    float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_58.w;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = _157 * _155;
    float _179 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _181 = _179 * 6.283185482025146484375;
    float _183 = floor(_179);
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = _181 * 0.15915493667125701904296875;
    int _197 = as_type<int>(_159) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_159) & 2;
    bool _203 = _201 != 0;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _195 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_203;
    int _215 = _213 ? (-1090519040) : 1056964608;
    float _217 = -_183;
    float _219 = _179 + _217;
    float _221 = _179;
    float _223 = _161;
    if (!_193)
    {
        float _225 = _161 * _161;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    bool _231 = !_199;
    int _233 = _231 ? (-1090519040) : 1056964608;
    bool _235 = _219 < 0.5;
    float _237 = float(_235);
    float _239 = _229;
    if (!_193)
    {
        float _241 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _241;
    }
    float _243 = _239;
    float _245 = fma(_211, 0.5, 0.5);
    bool _247 = !_193;
    float _249 = _243;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _161 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _161);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _279;
    }
    float _281 = _249;
    bool _283 = !_193;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _161 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _223 = _303;
    }
    float _305 = _223;
    float _307 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _313 = 0.0;
    if (!_193)
    {
        float _315 = _131 * _131;
        float _317 = _315 * 0.5;
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_305, _165, _307);
    float _323 = fma(_305, _167, _309);
    float _325 = -_219;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _329 = -_237;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = -_245;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_305, _169, _311);
    float _339 = 0.0;
    float _341 = _319;
    if (!_193)
    {
        _339 = _131;
    }
    float _343 = _339;
    float _345 = _343;
    if (!_193)
    {
        float _347 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _341 = _347;
    }
    float _349 = _341;
    bool _351 = !_193;
    float _353 = _349;
    if (!_351)
    {
        float _355 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _357 = log2(_355);
        float _359 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _361 = _359 + 1.0;
        float _363 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _365 = _131 * _357;
        float _367 = 1.0 / _361;
        float _369 = _363 * 0.693147182464599609375;
        float _371 = exp2(_365);
        float _373 = 1.0 / _369;
        float _375 = _371 + (-1.0);
        float _377 = -_375;
        float _379 = fma(_377, _373, _131);
        float _381 = _379 * _367;
        float _383 = _381 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _353 = _383;
    }
    float _385 = _353;
    bool _387 = !_193;
    if (!_387)
    {
        float _389 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _391 = log2(_389);
        float _393 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _395 = _393 + 1.0;
        float _397 = 1.0 / _395;
        float _399 = _131 * _391;
        float _401 = exp2(_399);
        float _403 = -_401;
        float _405 = _403 + 1.0;
        float _407 = _405 * _397;
        _345 = _407;
    }
    float _409 = _345;
    float _411 = in.m_60.x;
    float _413 = in.m_60.y;
    float _415 = in.m_60.z;
    float _417 = fma(_321, _163, _171);
    float _419 = fma(_323, _163, _173);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _427 = _425 != 0;
    float _429 = in.m_62.x;
    float _431 = in.m_62.y;
    float _433 = in.m_62.z;
    float _435 = fma(_337, _163, _175);
    float _437 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _439 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _441 = in.m_64.x;
    float _443 = in.m_64.y;
    float _445 = in.m_64.z;
    bool _447 = !_423;
    int _449 = _447 ? 0 : 1;
    float _451 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _453 = fma(_409, _165, _437);
    float _455 = fma(_409, _167, _439);
    int _457 = abs(_449);
    float _459 = fma(_409, _169, _451);
    bool _461 = !_207;
    int _463 = _461 ? 0 : 1;
    out.m_66.x = as_type<float>(_233);
    out.m_66.y = as_type<float>(_215);
    float _465 = -_453;
    float _467 = _321 + _465;
    int _469 = abs(_463);
    float _471 = -_455;
    float _473 = _323 + _471;
    float _475 = float(_457);
    float _477 = -_459;
    float _479 = _337 + _477;
    bool _481 = !_427;
    int _483 = _481 ? 0 : 1;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _487 = abs(_327);
    float _489 = _475 * _487;
    float _491 = _473 * _413;
    int _493 = abs(_483);
    float _495 = _473 * _431;
    float _497 = float(_469);
    float _499 = _473 * _443;
    float _501 = fma(_467, _411, _491);
    float _503 = fma(_467, _429, _495);
    float _505 = fma(_467, _441, _499);
    float _507 = float(_493);
    float _509 = fma(_497, _335, _489);
    float _511 = fma(_479, _415, _501);
    float _513 = fma(_479, _433, _503);
    float _515 = fma(_479, _445, _505);
    float _517 = abs(_331);
    float _519 = fma(_507, _517, _509);
    bool _521 = !_485;
    float _537;
    if (!_521)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _525 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_97);
        float _543 = 1.0 / _541;
        float _545 = _131 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _551 = _547 + _549;
    float _553 = in.m_58.x;
    float _555 = in.m_58.y;
    bool _557 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _559 = isnan(_547);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _569;
    bool _573 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _575 = isnan(_547);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = 1.0 / _571;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _593 = _551 * _585;
    float _595 = -_567;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _599;
    float _603 = fma(_589, _593, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _605 = _583 * _597;
    float _607 = fma(_601, _593, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _609 = -_583;
    float _611 = _609 + 1.0;
    float _613 = _603 * _605;
    float _615 = _607 * _605;
    float _617 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].x, _613);
    float _619 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].y, _615);
    float _621 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].x, _617);
    float _623 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].y, _619);
    float _625 = _621 * _553;
    float _627 = _623 * _555;
    bool _629 = !_591;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_97);
        float _651 = 1.0 / _649;
        float _653 = _131 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _659 = _655 + _657;
    bool _661 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _663 = isnan(_655);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _675 = _655 + _673;
    bool _677 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _679 = isnan(_655);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _697 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _699 = isnan(_655);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_671;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _695;
    float _715 = _707 * _711;
    float _717 = -_707;
    float _719 = _717 + 1.0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _721;
    bool _725 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _727 = 1.0 / _691;
    float _729 = _687 * _719;
    float _731 = -_687;
    float _733 = _731 + 1.0;
    float _735 = _675 * _713;
    float _737 = _659 * _727;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _743;
    float _747 = fma(_723, _737, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _749 = fma(_741, _737, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _751 = fma(_745, _737, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _753 = _747 * _729;
    float _755 = _749 * _729;
    float _757 = _751 * _729;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _771 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[107].x, _753);
    float _773 = fma(_761, _735, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _775 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[107].y, _755);
    float _777 = fma(_765, _735, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _779 = fma(_769, _735, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _781 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[107].z, _757);
    float _783 = fma(_773, _715, _771);
    float _785 = fma(_777, _715, _775);
    float _787 = fma(_779, _715, _781);
    float _789 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].x, _783);
    float _791 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].y, _785);
    float _793 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].z, _787);
    float _795 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _797 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _803;
    out.m_68.y = _805;
    out.m_68.z = _807;
    out.m_68.w = _801;
    bool _809 = !_725;
    float _825;
    if (!_809)
    {
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _813 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_97);
        float _831 = 1.0 / _829;
        float _833 = _131 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = in.m_53.y;
    float _839 = _153 * 2.0;
    float _841 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _843 = log2(_841);
    float _845 = _419 * _443;
    float _847 = in.m_53.z;
    float _849 = _419 * _413;
    float _851 = fma(_417, _441, _845);
    float _853 = _419 * _431;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _865 = _863 != 0;
    float _867 = floor(_839);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _869;
    float _873 = fma(_435, _445, _851);
    float _875 = fma(_417, _429, _853);
    float _877 = in.m_62.w;
    float _879 = fma(_417, _411, _849);
    float _881 = fma(_435, _433, _875);
    float _883 = _843 * _131;
    float _885 = 1.0 / _871;
    float _887 = in.m_64.w;
    float _889 = fma(_435, _415, _879);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _893 = _835 + _891;
    float _895 = _837 * 2.0;
    bool _897 = _867 > 0.0;
    float _899 = exp2(_883);
    bool _901 = _867 >= 0.0;
    bool _903 = isnan(_867);
    bool _905 = _901 || _903;
    bool _907 = isnan(0.0);
    bool _909 = _905 || _907;
    float _911 = _847 * 2.0;
    float _913 = in.m_60.w;
    float _915 = _837 + _847;
    int _917 = _909 ? 0 : 1;
    float _919 = floor(_895);
    float _921 = _915 + (-1.0);
    float _923 = _893 * _885;
    float _925 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _929 = 1.0 + _927;
    float _931 = floor(_911);
    float _933 = _153 + _837;
    float _935 = -_899;
    float _937 = _935 + 1.0;
    float _939 = _873 + _887;
    float _941 = _933 + (-1.0);
    bool _943 = _919 >= 0.0;
    bool _945 = isnan(_919);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    float _953 = 1.0 / _929;
    bool _955 = _919 > 0.0;
    float _957 = _889 + _913;
    int _959 = _951 ? 0 : 1;
    float _961 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _963 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _971 = _967 || _969;
    float _973 = _881 + _877;
    int _975 = ~_917;
    int _977 = _975 + 1;
    int _979 = _977 + 1;
    int _981 = _979;
    float _983 = _939;
    if (!_897)
    {
        int _985 = ~_917;
        int _987 = _985 + 1;
        _981 = _987;
    }
    int _989 = _981;
    bool _991 = _931 > 0.0;
    bool _993 = _931 >= 0.0;
    bool _995 = isnan(_931);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    float _1003 = _971 ? _937 : 0.0;
    bool _1005 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1007 = isnan(1.0);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1013 = _1009 || _1011;
    bool _1015 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1017 = isnan(_835);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = -_1025;
    float _1029 = _1027 + 1.0;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1031;
    bool _1035 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1037 = isnan(_835);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1047;
    int _1051 = ~_959;
    int _1053 = _1051 + 1;
    int _1055 = _1053 + 1;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1057;
    float _1061 = fma(_1033, _923, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1063 = _1045 * _1029;
    float _1065 = fma(_1049, _923, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1067 = fma(_1059, _923, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1069 = _1055;
    if (_1013)
    {
        float _1071 = _1003 * _953;
        _135 = _1071;
    }
    float _1073 = _135;
    float _1075 = _1061 * _1063;
    float _1077 = _1065 * _1063;
    float _1079 = -_1045;
    float _1081 = _1079 + 1.0;
    float _1083 = _1067 * _1063;
    if (!_955)
    {
        int _1085 = ~_959;
        int _1087 = _1085 + 1;
        _1069 = _1087;
    }
    int _1089 = _1069;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1093 = _973 + _1091;
    int _1095 = _1001 ? 0 : 1;
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1075);
    bool _1099 = !_857;
    int _1101 = _1099 ? 0 : 1;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1105 = _957 + _1103;
    int _1107 = ~_1095;
    int _1109 = _1107 + 1;
    int _1111 = _1109 + 1;
    float _1113 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1115 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1077);
    int _1117 = _1111;
    if (!_991)
    {
        int _1119 = ~_1095;
        int _1121 = _1119 + 1;
        _1117 = _1121;
    }
    int _1123 = _1117;
    float _1125 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1083);
    int _1127 = abs(_1101);
    float _1129 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1113);
    bool _1131 = !_861;
    int _1133 = _1131 ? 0 : 1;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1137 = _939 + _1135;
    float _1139 = float(_1127);
    float _1141 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1097);
    float _1143 = float(_1123);
    float _1145 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1129);
    int _1147 = abs(_1133);
    float _1149 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1125);
    float _1151 = in.m_70.x;
    float _1153 = in.m_70.y;
    float _1155 = in.m_70.z;
    float _1157 = _1139 * _1143;
    float _1159 = _1093 * _1093;
    bool _1161 = _1145 >= 0.0;
    float _1163 = _1141 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1165 = float(_1147);
    float _1167 = fma(_1105, _1105, _1159);
    float _1169 = float(_989);
    float _1171 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1115);
    float _1173 = fma(_1137, _1137, _1167);
    bool _1175 = !_865;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = _1165 * _1169;
    float _1181 = _837 + (-0.5);
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1185 = abs(_1177);
    float _1187 = rsqrt(_1173);
    float _1189 = _1179 * (-2.0);
    float _1191 = _1149 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    int _1195 = as_type<int>(_1191);
    if (_1161)
    {
        _1193 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1197 = _1193;
    float _1199 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1201 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = fma(_1189, _1153, _1153);
    float _1207 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1209 = _1155;
    if (_1161)
    {
        float _1211 = _1197 * 5.0;
        _1195 = as_type<int>(_1211);
    }
    int _1213 = _1195;
    float _1215 = fma(_925, _1189, _925);
    float _1217 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1205);
    out.m_72.x = _1201;
    out.m_72.y = _1207;
    out.m_72.z = _1203;
    out.m_72.w = _1183;
    float _1219 = fma(_1215, _1073, _1217);
    float _1221 = float(_1185);
    if (_1161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4345 = as_type<float>(_1213);
        out.gl_Position.z = _4345;
    }
    float _1223 = _1093 * _1187;
    float _1225 = _1105 * _1187;
    if (_1161)
    {
        out.m_49.x = 0.0;
    }
    if (_1161)
    {
        return out;
    }
    float _1227 = -_1223;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1231 = float(_1089);
    float _1233 = _1137 * _1187;
    float _1235 = -_1225;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[18].w, _957);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1241 = _1229 + _1239;
    float _1243 = -_1223;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1093);
    float _1247 = -_1233;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _939);
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1253 = _1237 + _1251;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1257 = _1157 * (-2.0);
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1261 = _1249 + _1259;
    float _1263 = _1219 * 0.15915493667125701904296875;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1255);
    float _1267 = _1245 * _1245;
    float _1269 = fma(_961, _1257, _961);
    float _1271 = -_1225;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1105);
    float _1275 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1265);
    float _1277 = fma(_1257, _1151, _1151);
    float _1279 = _1221 * _1231;
    float _1281 = _153 + (-0.5);
    float _1283 = _153 + _847;
    float _1285 = fma(_1273, _1273, _1267);
    bool _1287 = _1275 >= 0.0;
    float _1289 = _1279 * (-2.0);
    float _1291 = _1283 + (-1.0);
    float _1293 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1277);
    float _1295 = fma(_1289, _1155, _1155);
    float _1297 = _847 + (-0.5);
    float _1299 = fma(_1291, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1301 = -_1233;
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1137);
    float _1305 = fma(_1269, _1073, _1293);
    float _1307 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1295);
    float _1309 = fma(_1299, _1289, _1299);
    float _1311 = fma(_1303, _1303, _1285);
    float _1313 = _1305 * 0.15915493667125701904296875;
    float _1315 = _1241;
    float _1317 = _1261;
    if (_1287)
    {
        _1209 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1319 = _1209;
    float _1321 = fma(_1309, _1073, _1307);
    float _1323 = _1263 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    int _1327 = as_type<int>(_1319);
    if (_1287)
    {
        out.m_49.x = 0.0;
    }
    if (_1287)
    {
        float _1329 = _1319 * 5.0;
        _1327 = as_type<int>(_1329);
    }
    int _1331 = _1327;
    float _1333 = _1321 * 0.15915493667125701904296875;
    float _1335 = _1263 * 6.283185482025146484375;
    float _1337 = cos(_1335);
    if (_1287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4551 = as_type<float>(_1331);
        out.gl_Position.z = _4551;
    }
    float _1339 = sqrt(_1311);
    float _1341 = _1313 * 6.283185482025146484375;
    float _1343 = sin(_1341);
    float _1345 = _1313 * 6.283185482025146484375;
    float _1347 = cos(_1345);
    if (_1287)
    {
        return out;
    }
    float _1349 = _519 * _627;
    float _1351 = _1333 * 6.283185482025146484375;
    float _1353 = cos(_1351);
    float _1355 = _1187 * _1339;
    float _1357 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_215));
    float _1359 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1361 = _519 * _625;
    float _1363 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_233));
    float _1365 = _1343 * _1325;
    float _1367 = _1355 * _1359;
    float _1369 = _1333 * 6.283185482025146484375;
    float _1371 = sin(_1369);
    float _1373 = _1347 * _1337;
    float _1375 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1377 = _1375 * 0.5;
    float _1379 = _1357 * _1367;
    float _1381 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1383 = _1343 * _1337;
    float _1385 = _1381 * _1355;
    float _1387 = _1353 * _1379;
    float _1389 = _1347 * _1325;
    float _1391 = _1325 * _1353;
    float _1393 = _1385 * _1363;
    float _1395 = _1347 * _1387;
    float _1397 = _1337 * _1353;
    float _1399 = _1343 * _1387;
    float _1401 = fma(_1371, _1373, _1365);
    float _1403 = -_1379;
    float _1405 = _1371 * _1403;
    float _1407 = fma(_1371, _1365, _1373);
    float _1409 = fma(_1401, _1393, _1395);
    float _1411 = -_1383;
    float _1413 = fma(_1371, _1389, _1411);
    float _1415 = -_1389;
    float _1417 = fma(_1371, _1383, _1415);
    float _1419 = fma(_1397, _1393, _1405);
    float _1421 = fma(_1413, _1377, _1409);
    float _1423 = fma(_1417, _1393, _1399);
    float _1425 = fma(_1391, _1377, _1419);
    float _1427 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1429 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1431 = fma(_1407, _1377, _1423);
    float _1433 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1427);
    float _1435 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1429);
    float _1437 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1439 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1433);
    float _1441 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1435);
    float _1443 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1437);
    float _1445 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1447 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1449 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1443);
    float _1451 = _957 + _1445;
    float _1453 = _939 + _1447;
    float _1455 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1459 = _1451 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1463 = _1453 + _1461;
    float _1465 = _973 + _1455;
    float _1467 = _1459 * _1459;
    float _1469 = _1463 * _1463;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1455;
    float _1479 = _1451;
    float _1481 = _1421;
    float _1483 = _1453;
    float _1485 = _1469;
    float _1487 = _1471;
    if (!_1475)
    {
        _1477 = _1451;
    }
    float _1489 = _1477;
    float _1491 = _1489;
    if (!_1475)
    {
        _1479 = _1453;
    }
    float _1493 = _1479;
    float _1495 = _1493;
    if (!_1475)
    {
        _1481 = _1467;
    }
    float _1497 = _1481;
    float _1499 = _1497;
    if (!_1475)
    {
        _1483 = _1465;
    }
    float _1501 = _1483;
    bool _1503 = !_1475;
    float _1505 = _1501;
    if (!_1503)
    {
        float _1507 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1511 = _1473 + _1509;
        float _1513 = rsqrt(_1471);
        float _1515 = _1511 * _1507;
        float _1517 = _1465 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1519 = _1515 * 0.15915493667125701904296875;
        float _1521 = _1519 * 6.283185482025146484375;
        float _1523 = sin(_1521);
        float _1525 = _1519 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        float _1529 = fma(_1523, _1517, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1531 = _1513 * _1529;
        float _1533 = _1527 + (-1.0);
        float _1535 = fma(_1459, _1531, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1537 = fma(_1463, _1531, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1539 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1543 = _1535 + _1541;
        float _1545 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1547 = _1537 + _1545;
        float _1549 = fma(_1465, _1527, _1539);
        float _1551 = _1543 * _1543;
        float _1553 = _1547 * _1547;
        _1505 = _1549;
        _1499 = _1551;
        _1485 = _1553;
        _1491 = _1535;
        _1495 = _1537;
    }
    float _1555 = _1505;
    float _1557 = _1499;
    float _1559 = _1485;
    float _1561 = _1491;
    float _1563 = _1495;
    float _1565 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1567 = _1555 + _1565;
    float _1569 = fma(_1567, _1567, _1557);
    float _1571 = _1569 + _1559;
    float _1573 = sqrt(_1571);
    bool _1575 = _1573 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1577 = isnan(_1573);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1583 = _1579 || _1581;
    float _1585 = _1569;
    if (!_1583)
    {
        _1585 = 1.0;
    }
    float _1587 = _1585;
    bool _1589 = !_1583;
    float _1591 = _1587;
    if (!_1589)
    {
        bool _1593 = _1573 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1595 = isnan(_1573);
        bool _1597 = _1593 || _1595;
        bool _1599 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1601 = _1597 || _1599;
        if (!_1601)
        {
            float _1603 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1605 = _1573 + _1603;
            float _1607 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1609 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1607;
            float _1611 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1615 = 1.0 / _1609;
            float _1617 = _1605 * _1615;
            float _1619 = fma(_1617, _1613, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1591 = _1619;
            _1621 = true;
        }
        else
        {
            bool _1623 = _1573 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1625 = isnan(_1573);
            bool _1627 = _1623 || _1625;
            bool _1629 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1631 = _1627 || _1629;
            if (!_1631)
            {
                float _1633 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1635 = _1573 + _1633;
                float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1639 = _1637 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1643 = _1641 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1645 = 1.0 / _1639;
                float _1647 = _1635 * _1645;
                float _1649 = fma(_1647, _1643, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1591 = _1649;
                _1621 = true;
            }
            else
            {
                _1591 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1621 = false;
    float _1651 = _1591;
    float _1653 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1655 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1657 = _1561 + _1655;
    float _1659 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1653);
    bool _1661 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.5);
    bool _1669 = _1665 || _1667;
    float _1671 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1659);
    float _1673 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1675 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1677 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan(0.5);
    bool _1683 = _1679 || _1681;
    float _1685 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1687 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1673);
    float _1689 = fma(_1657, _1651, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1691 = 1.0 / _1685;
    float _1693 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1687);
    float _1695 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1697 = _1695 + _1685;
    float _1699 = _1685;
    if (_1683)
    {
        _1699 = 1.0;
    }
    float _1701 = _1699;
    float _1703 = _1697 * _1691;
    float _1705 = _1703 * 0.5;
    float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1709 = _1555 + _1707;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1713 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1711);
    float _1715 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1717 = _1563 + _1715;
    float _1719 = fma(_1709, _1651, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1721 = fma(_1717, _1651, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1723 = 1.0 / _1713;
    float _1725 = -_1225;
    float _1727 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1689);
    float _1729 = -_1223;
    float _1731 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1719);
    float _1733 = -_1233;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1721);
    float _1737 = _1731;
    float _1739 = _1727;
    float _1741 = _1735;
    float _1743 = _1701;
    if (!_1669)
    {
        float _1745 = _1241 * _1241;
        float _1747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1749 = -_939;
        float _1751 = _1749 + _1721;
        float _1753 = -_957;
        float _1755 = _1753 + _1689;
        float _1757 = fma(_1253, _1253, _1745);
        float _1759 = fma(_1261, _1261, _1757);
        float _1761 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1763 = sqrt(_1759);
        float _1765 = 1.0 / _1355;
        float _1767 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1769 = precise::min(_1763, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1771 = _1769 * _1747;
        float _1773 = -_973;
        float _1775 = _1773 + _1719;
        float _1777 = _1771 * _1765;
        float _1779 = _1767 * _1777;
        float _1781 = _1751 * _1777;
        float _1783 = fma(_1755, _1779, _1237);
        float _1785 = fma(_1775, _1779, _1229);
        float _1787 = fma(_1767, _1781, _1249);
        _1737 = _1785;
        _1739 = _1783;
        _1741 = _1787;
        _983 = _1781;
    }
    float _1789 = _1737;
    float _1791 = _1739;
    float _1793 = _1741;
    float _1795 = _983;
    float _1797 = _1795;
    if (_1683)
    {
        _1797 = 1.0;
    }
    float _1799 = _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1803 = _1723 * _1801;
    float _1805 = _1799;
    if (!_1683)
    {
        float _1807 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1809 = _1807 * 0.15915493667125701904296875;
        float _1811 = _1809 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1817 = _1815 * 0.15915493667125701904296875;
        float _1819 = _1809 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = 1.0 / _1813;
        float _1825 = _1817 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = _1821 * _1823;
        float _1831 = _1817 * 6.283185482025146484375;
        float _1833 = sin(_1831);
        float _1835 = _1827 * _1829;
        float _1837 = 1.0 / _1835;
        float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1841 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1839;
        float _1843 = 1.0 / _1841;
        float _1845 = _1833 * _1837;
        float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1849 = fma(_1803, _1845, _1847);
        float _1851 = _1849 * _1843;
        float _1853 = precise::clamp(_1851, 0.0, 1.0);
        _1315 = _1817;
        _1743 = _1853;
    }
    float _1855 = _1315;
    float _1857 = _1743;
    float _1859 = _1855;
    if (!_1683)
    {
        float _1861 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1863 = _1861 * 0.15915493667125701904296875;
        float _1865 = _1863 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1871 = _1869 * 0.15915493667125701904296875;
        float _1873 = _1863 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        float _1877 = 1.0 / _1867;
        float _1879 = _1871 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        float _1883 = _1875 * _1877;
        float _1885 = _1871 * 6.283185482025146484375;
        float _1887 = sin(_1885);
        float _1889 = _1881 * _1883;
        float _1891 = 1.0 / _1889;
        float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1895 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1893;
        float _1897 = 1.0 / _1895;
        float _1899 = _1887 * _1891;
        float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1903 = fma(_1803, _1899, _1901);
        float _1905 = _1903 * _1897;
        float _1907 = precise::clamp(_1905, 0.0, 1.0);
        float _1909 = -_1907;
        float _1911 = _1909 + 1.0;
        _1859 = _1867;
        _1317 = _1889;
        _1805 = _1911;
    }
    float _1913 = _1859;
    float _1915 = _1317;
    float _1917 = _1805;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1921 = _1789 + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1925 = _1791 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1929 = _1793 + _1927;
    float _1931 = _1921 * _1921;
    float _1933 = fma(_1925, _1925, _1931);
    float _1935 = fma(_1929, _1929, _1933);
    float _1937 = rsqrt(_1935);
    float _1939 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1941 = _1925 * _1939;
    float _1943 = _1929 * _1939;
    float _1945 = _1941 * _1941;
    float _1947 = _1943 * _1943;
    float _1949 = _1945 + _1947;
    float _1951 = sqrt(_1949);
    bool _1953 = _1951 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1957 = _1951 + _1955;
    float _1959 = _1933;
    float _1961 = _1949;
    float _1963 = _1957;
    float _1965 = _1913;
    float _1967 = _1921;
    float _1969 = _1915;
    if (_1953)
    {
        float _1971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _1971;
    }
    float _1973 = _1959;
    if (_1953)
    {
        float _1975 = rsqrt(_1949);
        _1961 = _1975;
    }
    float _1977 = _1961;
    float _1979 = _1977;
    if (_1953)
    {
        float _1981 = _1957 * _1973;
        _1963 = _1981;
    }
    float _1983 = _1963;
    if (_1953)
    {
        float _1985 = _1983 * 0.15915493667125701904296875;
        _1965 = _1985;
    }
    float _1987 = _1965;
    float _1989 = _1929;
    if (_1953)
    {
        float _1991 = _1987 * 6.283185482025146484375;
        float _1993 = sin(_1991);
        _1989 = _1993;
    }
    float _1995 = _1989;
    float _1997 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1999 = precise::max(0.0, _1997);
    float _2001 = _1973;
    float _2003 = _1999;
    if (_1953)
    {
        float _2005 = _1987 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        _2001 = _2007;
    }
    float _2009 = _2001;
    float _2011 = -_1939;
    float _2013 = -_1999;
    float _2015 = fma(_1921, _2011, _2013);
    if (_1953)
    {
        float _2017 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1967 = _2017;
    }
    float _2019 = _1967;
    float _2021 = sqrt(_1935);
    float _2023 = _2019;
    float _2025 = _1995;
    if (_1953)
    {
        float _2027 = fma(_1995, _2019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2023 = _2027;
    }
    float _2029 = _2023;
    float _2031 = _2029;
    if (!_1953)
    {
        _2025 = _1941;
    }
    float _2033 = _2025;
    float _2035 = _2033;
    float _2037 = _2009;
    if (_1953)
    {
        float _2039 = _2009 + (-1.0);
        _2003 = _2039;
    }
    float _2041 = _2003;
    float _2043 = _2041;
    if (_1953)
    {
        float _2045 = _1977 * _2029;
        _1487 = _2045;
    }
    float _2047 = _1487;
    if (!_1953)
    {
        _2031 = _2015;
    }
    float _2049 = _2031;
    float _2051 = _2049;
    if (_1953)
    {
        float _2053 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _2053;
    }
    float _2055 = _1969;
    if (_1953)
    {
        float _2057 = _1941 * _2047;
        _2035 = _2057;
    }
    float _2059 = _2035;
    if (!_1953)
    {
        _2043 = _1943;
    }
    float _2061 = _2043;
    float _2063 = _2061;
    if (_1953)
    {
        float _2065 = _1943 * _2047;
        _2063 = _2065;
    }
    float _2067 = _2063;
    if (!_1953)
    {
        _1979 = _1945;
    }
    float _2069 = _1979;
    float _2071 = _2069;
    if (_1953)
    {
        float _2073 = fma(_2015, _2009, _2055);
        _2051 = _2073;
    }
    float _2075 = _2051;
    if (_1953)
    {
        float _2077 = _2059 * _2059;
        _2071 = _2077;
    }
    float _2079 = _2071;
    if (!_1953)
    {
        _2037 = _1947;
    }
    float _2081 = _2037;
    float _2083 = _2081;
    if (_1953)
    {
        float _2085 = _2067 * _2067;
        _2083 = _2085;
    }
    float _2087 = _2083;
    float _2089 = fma(_2075, _2075, _2079);
    float _2091 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = _2089 + _2087;
    float _2095 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = rsqrt(_2093);
    float _2107 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2109 = -_2101;
    float _2111 = _2109 + 1.0;
    float _2113 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2117 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2107);
    float _2119 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2121 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2115);
    float _2123 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2125 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2113);
    float _2127 = abs(_2111);
    float _2129 = log2(_2127);
    float _2131 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2135 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2125);
    float _2137 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2139 = _2105 * _2059;
    float _2141 = -_2133;
    float _2143 = fma(_2141, _2119, 1.0);
    float _2145 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2147 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2137);
    float _2151 = _2105 * _2067;
    float _2153 = log2(_2143);
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2157 = _2105 * _2075;
    float _2159 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2161 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2163 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2155);
    float _2165 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2167 = -_2159;
    float _2169 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2167);
    float _2171 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2163);
    float _2173 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2175 = -_2151;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2169);
    float _2179 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2181 = 1.0 / _2171;
    float _2183 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2173);
    float _2185 = fma(_2177, -0.5, 0.5);
    float _2187 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2179);
    float _2189 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2183);
    float _2191 = _2157 + 1.0;
    float _2193 = _2153 * 0.693147182464599609375;
    float _2195 = exp2(_2165);
    float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2199 = sqrt(_2185);
    float _2201 = fma(_2177, 0.5, 0.5);
    float _2203 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2187);
    float _2205 = fma(_2201, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2207 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2203);
    float _2209 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2189);
    float _2211 = -_2157;
    float _2213 = fma(_2195, _2191, _2211);
    float _2215 = fma(_2201, _2205, -0.212114393711090087890625);
    float _2217 = _2207 * _2181;
    float _2219 = _2209 * _2181;
    float _2221 = fma(_2213, 0.5, 0.5);
    float _2223 = fma(_2201, _2215, 1.570728778839111328125);
    float _2225 = fma(_2217, 0.5, 0.5);
    float _2227 = _2199 * 0.636619746685028076171875;
    float _2229 = fma(_2219, -0.5, 0.5);
    float _2231 = -_2223;
    float _2233 = fma(_2227, _2231, 1.0);
    float3 _5970 = float3(_2225, _2229, _2197);
    float _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5970, float3(0.0), isnan(_5970)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5970, float3(0.0), isnan(_5970)), level(0.0)).x;
    float3 _5981 = float3(_2225, _2229, _2197);
    float4 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5981, float3(0.0), isnan(_5981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5981, float3(0.0), isnan(_5981)), level(0.0)).xyzw;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _2238.w;
    float2 _5998 = float2(_2233, _2221);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2260 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2262 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2264 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2266 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2258);
    float _2268 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2260);
    float _2270 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2262);
    float _2272 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2264);
    float _2274 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2266);
    float _2276 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2268);
    float _2278 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2270);
    float _2280 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2272);
    float _2282 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2284 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2286 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_74.y = 1.0;
    float _2288 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2290 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2292 = _2280 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2294 = -_513;
    float _2296 = _2294 + _1789;
    float _2298 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2288);
    float _2300 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2290);
    float _2302 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2304 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2306 = -_511;
    float _2308 = _2306 + _1791;
    float _2310 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2312 = -_515;
    float _2314 = _2312 + _1793;
    float _2316 = _2304 + _2298;
    float _2318 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2302);
    float _2320 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2322 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2324 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2316);
    float _2326 = _2310 + _2318;
    float _2328 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2320);
    float _2330 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2332 = 1.0 / _2324;
    float _2334 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2326);
    float _2336 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2328);
    float _2338 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2322);
    float _2340 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2300);
    float _2342 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2344 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2346 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2348 = exp2(_2330);
    float _2350 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2342);
    float _2352 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2340);
    float _2354 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2344);
    float _2356 = _2346 + _2338;
    float _2358 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2350);
    float _2360 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2354);
    float _2362 = _2334 * _2332;
    float _2364 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2366 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2368 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2358);
    float _2370 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2356);
    float _2372 = _2352 + _2171;
    float _2374 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2366);
    float _2376 = 1.0 / _2364;
    float _2378 = -_2348;
    float _2380 = _2378 + 1.0;
    float _2382 = _2368 * _2332;
    float _2384 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2374);
    float _2386 = _2370 * _2332;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2390 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _2392 = _2382 > 0.0;
    float _2394 = _2372 * 0.5;
    out.gl_Position.x = _2207;
    out.gl_Position.y = _2209;
    out.gl_Position.z = _2352;
    out.gl_Position.w = _2171;
    bool _2396 = _2382 < 1.0;
    bool _2398 = _2396 && _2392;
    float _2400 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    out.m_76.z = _2394;
    out.m_76.w = _2171;
    float _2402 = _2390 * _2376;
    bool _2404 = _2217 > (-1.0);
    bool _2406 = _2404 && _2398;
    float _2408 = _2400 * _2376;
    bool _2410 = _2219 > (-1.0);
    bool _2412 = _2410 && _2406;
    bool _2414 = _2217 < 1.0;
    bool _2416 = _2414 && _2412;
    bool _2418 = _2219 < 1.0;
    bool _2420 = _2418 && _2416;
    float _2422 = _2388 * _2235;
    float _2424 = -_2388;
    float _2426 = _2424 + 1.0;
    float _2428 = _2246 * _2422;
    float _2430 = _2256 * _2422;
    float _2432 = _2246 * _2426;
    float _2434 = fma(_2252, _2428, _2240);
    float _2436 = fma(_2254, _2428, _2242);
    float _2438 = fma(_2246, _2430, _2244);
    out.m_78.x = _2434;
    out.m_78.y = _2436;
    out.m_78.z = _2438;
    out.m_78.w = _2432;
    bool _2440 = !_2420;
    float _2476;
    if (!_2440)
    {
        float _2442 = -_2386;
        float _2444 = _2219 + _2442;
        float _2446 = -_2362;
        float _2448 = _2217 + _2446;
        float _2450 = -_2402;
        float _2452 = _2217 + _2450;
        float _2454 = -_2408;
        float _2456 = _2219 + _2454;
        float _2458 = _2444 * _2444;
        float _2460 = fma(_2448, _2448, _2458);
        float _2462 = sqrt(_2460);
        bool _2464 = _2462 > 0.0;
        float _2466 = _1857 * _1917;
        float _2468 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _2470 = _2466;
        if (!_2464)
        {
            _2470 = _2468;
        }
        float _2472 = _2470;
        bool _2474 = !_2464;
        _2476 = _2472;
        _2478 = _2474;
        if (!_2478)
        {
            float _2480 = _2456 * _2456;
            float _2482 = fma(_2452, _2452, _2480);
            float _2484 = rsqrt(_2460);
            float _2486 = sqrt(_2482);
            float _2488 = _2448 * _2484;
            float _2490 = _2444 * _2484;
            bool _2492 = _2486 > 0.0;
            float _2494 = _2484;
            if (!_2492)
            {
                _2494 = _2468;
            }
            float _2496 = _2494;
            bool _2498 = !_2492;
            _2476 = _2496;
            _2478 = _2498;
            if (!_2478)
            {
                float _2500 = _1385 * _2292;
                float _2502 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _2504 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2304);
                float _2506 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2346);
                float _2508 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2504);
                float _2510 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2310);
                float _2512 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2506);
                float _2514 = 1.0 / _2508;
                float _2516 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2510);
                float _2518 = _2502 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2520 = rsqrt(_2482);
                float _2522 = _2456 * _2518;
                float _2524 = _2452 * _2518;
                float _2526 = _2522 * _2522;
                float _2528 = _2512 * _2514;
                float _2530 = _2516 * _2514;
                float _2532 = fma(_2524, _2524, _2526);
                float _2534 = _2528 * _2528;
                float _2536 = fma(_2530, _2530, _2534);
                float _2538 = sqrt(_2532);
                float _2540 = _2456 * _2520;
                float _2542 = _2452 * _2520;
                float _2544 = _2490 * _2540;
                float _2546 = sqrt(_2536);
                float _2548 = fma(_2488, _2542, _2544);
                float _2550 = precise::min(0.0, _2548);
                float _2552 = _2171 * _2550;
                float _2554 = fma(_2524, _2552, _2207);
                float _2556 = fma(_2538, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2546);
                float _2558 = fma(_2522, _2552, _2209);
                float _2560 = 1.0 / _2556;
                out.gl_Position.x = _2554;
                out.gl_Position.y = _2558;
                float _2562 = _2546 * _2560;
                out.m_74.y = _2562;
                _2476 = _2468;
                _2478 = true;
            }
        }
    }
    else
    {
        float _2564 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2564;
        _2476 = 0.0;
    }
    _2478 = false;
    float _2566 = _2476;
    bool _2568 = _1857 > 0.0;
    bool _2570 = isnan(_1857);
    bool _2572 = _2568 || _2570;
    bool _2574 = isnan(0.0);
    bool _2576 = _2572 || _2574;
    float _2578 = _2566 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2580 = _1917 <= 0.0;
    bool _2582 = !_2576;
    bool _2584 = _2580 || _2582;
    out.m_49.x = _2578;
    if (!_2584)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2478 = false;
    bool _1621 = false;
    bool _827 = false;
    bool _647 = false;
    bool _539 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _92 = in.m_46.w;
    float _94 = trunc(_92);
    int _97 = int(_94);
    bool _101 = _97 >= 1;
    float _103 = 0.0;
    if (!_101)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _105 = _103;
    float _107 = _105;
    if (!_101)
    {
        out.m_49.x = 0.0;
    }
    int _109 = 0;
    if (!_101)
    {
        float _111 = _105 * 5.0;
        _109 = as_type<int>(_111);
    }
    int _113 = _109;
    int _115 = _113;
    if (!_101)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2643 = as_type<float>(_113);
        out.gl_Position.z = _2643;
    }
    if (!_101)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _117 = in.m_51.w;
    bool _119 = _117 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _121 = isnan(_117);
    bool _123 = _119 || _121;
    bool _125 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _127 = _123 || _125;
    float _129 = -_117;
    float _131 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _133 = 0.0;
    float _135 = _131;
    if (_127)
    {
        float _137 = float(_97);
        _133 = _137;
    }
    float _139 = _133;
    bool _141 = _131 >= _139;
    bool _143 = !_127;
    bool _145 = _141 || _143;
    if (_145)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _107;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _149 = _147 * 5.0;
        _115 = as_type<int>(_149);
    }
    int _151 = _115;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2712 = as_type<float>(_151);
        out.gl_Position.z = _2712;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_53.x;
    float _155 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _157 = _131 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_58.w;
    float _165 = in.m_51.x;
    float _167 = in.m_51.y;
    float _169 = in.m_51.z;
    float _171 = in.m_46.x;
    float _173 = in.m_46.y;
    float _175 = in.m_46.z;
    float _177 = _157 * _155;
    float _179 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _181 = _179 * 6.283185482025146484375;
    float _183 = floor(_179);
    bool _185 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _187 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _189 = _185 || _187;
    bool _191 = isnan(1.0);
    bool _193 = _189 || _191;
    float _195 = _181 * 0.15915493667125701904296875;
    int _197 = as_type<int>(_159) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_159) & 2;
    bool _203 = _201 != 0;
    int _205 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _207 = _205 != 0;
    float _209 = _195 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_203;
    int _215 = _213 ? (-1090519040) : 1056964608;
    float _217 = -_183;
    float _219 = _179 + _217;
    float _221 = _179;
    float _223 = _161;
    if (!_193)
    {
        float _225 = _161 * _161;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    bool _231 = !_199;
    int _233 = _231 ? (-1090519040) : 1056964608;
    bool _235 = _219 < 0.5;
    float _237 = float(_235);
    float _239 = _229;
    if (!_193)
    {
        float _241 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _241;
    }
    float _243 = _239;
    float _245 = fma(_211, 0.5, 0.5);
    bool _247 = !_193;
    float _249 = _243;
    if (!_247)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = _161 * _253;
        float _263 = 1.0 / _257;
        float _265 = _259 * 0.693147182464599609375;
        float _267 = exp2(_261);
        float _269 = 1.0 / _265;
        float _271 = _267 + (-1.0);
        float _273 = -_271;
        float _275 = fma(_273, _269, _161);
        float _277 = _275 * _263;
        float _279 = _277 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _279;
    }
    float _281 = _249;
    bool _283 = !_193;
    if (!_283)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = 1.0 / _291;
        float _295 = _161 * _287;
        float _297 = exp2(_295);
        float _299 = -_297;
        float _301 = _299 + 1.0;
        float _303 = _301 * _293;
        _223 = _303;
    }
    float _305 = _223;
    float _307 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _309 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _311 = _281 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _313 = 0.0;
    if (!_193)
    {
        float _315 = _131 * _131;
        float _317 = _315 * 0.5;
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_305, _165, _307);
    float _323 = fma(_305, _167, _309);
    float _325 = -_219;
    float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _329 = -_237;
    float _331 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _333 = -_245;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_305, _169, _311);
    float _339 = 0.0;
    float _341 = _319;
    if (!_193)
    {
        _339 = _131;
    }
    float _343 = _339;
    float _345 = _343;
    if (!_193)
    {
        float _347 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _341 = _347;
    }
    float _349 = _341;
    bool _351 = !_193;
    float _353 = _349;
    if (!_351)
    {
        float _355 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _357 = log2(_355);
        float _359 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _361 = _359 + 1.0;
        float _363 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _365 = _131 * _357;
        float _367 = 1.0 / _361;
        float _369 = _363 * 0.693147182464599609375;
        float _371 = exp2(_365);
        float _373 = 1.0 / _369;
        float _375 = _371 + (-1.0);
        float _377 = -_375;
        float _379 = fma(_377, _373, _131);
        float _381 = _379 * _367;
        float _383 = _381 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _353 = _383;
    }
    float _385 = _353;
    bool _387 = !_193;
    if (!_387)
    {
        float _389 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _391 = log2(_389);
        float _393 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _395 = _393 + 1.0;
        float _397 = 1.0 / _395;
        float _399 = _131 * _391;
        float _401 = exp2(_399);
        float _403 = -_401;
        float _405 = _403 + 1.0;
        float _407 = _405 * _397;
        _345 = _407;
    }
    float _409 = _345;
    float _411 = in.m_60.x;
    float _413 = in.m_60.y;
    float _415 = in.m_60.z;
    float _417 = fma(_321, _163, _171);
    float _419 = fma(_323, _163, _173);
    int _421 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _423 = _421 != 0;
    int _425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _427 = _425 != 0;
    float _429 = in.m_62.x;
    float _431 = in.m_62.y;
    float _433 = in.m_62.z;
    float _435 = fma(_337, _163, _175);
    float _437 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _439 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _441 = in.m_64.x;
    float _443 = in.m_64.y;
    float _445 = in.m_64.z;
    bool _447 = !_423;
    int _449 = _447 ? 0 : 1;
    float _451 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _453 = fma(_409, _165, _437);
    float _455 = fma(_409, _167, _439);
    int _457 = abs(_449);
    float _459 = fma(_409, _169, _451);
    bool _461 = !_207;
    int _463 = _461 ? 0 : 1;
    out.m_66.x = as_type<float>(_233);
    out.m_66.y = as_type<float>(_215);
    float _465 = -_453;
    float _467 = _321 + _465;
    int _469 = abs(_463);
    float _471 = -_455;
    float _473 = _323 + _471;
    float _475 = float(_457);
    float _477 = -_459;
    float _479 = _337 + _477;
    bool _481 = !_427;
    int _483 = _481 ? 0 : 1;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _487 = abs(_327);
    float _489 = _475 * _487;
    float _491 = _473 * _413;
    int _493 = abs(_483);
    float _495 = _473 * _431;
    float _497 = float(_469);
    float _499 = _473 * _443;
    float _501 = fma(_467, _411, _491);
    float _503 = fma(_467, _429, _495);
    float _505 = fma(_467, _441, _499);
    float _507 = float(_493);
    float _509 = fma(_497, _335, _489);
    float _511 = fma(_479, _415, _501);
    float _513 = fma(_479, _433, _503);
    float _515 = fma(_479, _445, _505);
    float _517 = abs(_331);
    float _519 = fma(_507, _517, _509);
    bool _521 = !_485;
    float _537;
    if (!_521)
    {
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _525 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[12].x, _131);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        float _541 = float(_97);
        float _543 = 1.0 / _541;
        float _545 = _131 * _543;
        _537 = _545;
    }
    _539 = false;
    float _547 = _537;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _551 = _547 + _549;
    float _553 = in.m_58.x;
    float _555 = in.m_58.y;
    bool _557 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _559 = isnan(_547);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _569;
    bool _573 = _547 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _575 = isnan(_547);
    bool _577 = _573 || _575;
    bool _579 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _581 = _577 || _579;
    float _583 = float(_581);
    float _585 = 1.0 / _571;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _587;
    bool _591 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _593 = _551 * _585;
    float _595 = -_567;
    float _597 = _595 + 1.0;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _599;
    float _603 = fma(_589, _593, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _605 = _583 * _597;
    float _607 = fma(_601, _593, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _609 = -_583;
    float _611 = _609 + 1.0;
    float _613 = _603 * _605;
    float _615 = _607 * _605;
    float _617 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].x, _613);
    float _619 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].y, _615);
    float _621 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].x, _617);
    float _623 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[144].y, _619);
    float _625 = _621 * _553;
    float _627 = _623 * _555;
    bool _629 = !_591;
    float _645;
    if (!_629)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _633 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _635 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[11].x, _131);
        float _637 = _635 * _631;
        float _639 = floor(_637);
        float _641 = -_639;
        float _643 = _637 + _641;
        _645 = _643;
        _647 = true;
    }
    else
    {
        float _649 = float(_97);
        float _651 = 1.0 / _649;
        float _653 = _131 * _651;
        _645 = _653;
    }
    _647 = false;
    float _655 = _645;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _659 = _655 + _657;
    bool _661 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _663 = isnan(_655);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _675 = _655 + _673;
    bool _677 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _679 = isnan(_655);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _697 = _655 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _699 = isnan(_655);
    bool _701 = _697 || _699;
    bool _703 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _705 = _701 || _703;
    float _707 = float(_705);
    float _709 = -_671;
    float _711 = _709 + 1.0;
    float _713 = 1.0 / _695;
    float _715 = _707 * _711;
    float _717 = -_707;
    float _719 = _717 + 1.0;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _721;
    bool _725 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _727 = 1.0 / _691;
    float _729 = _687 * _719;
    float _731 = -_687;
    float _733 = _731 + 1.0;
    float _735 = _675 * _713;
    float _737 = _659 * _727;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _741 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _739;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _743;
    float _747 = fma(_723, _737, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _749 = fma(_741, _737, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _751 = fma(_745, _737, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _753 = _747 * _729;
    float _755 = _749 * _729;
    float _757 = _751 * _729;
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _771 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[107].x, _753);
    float _773 = fma(_761, _735, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _775 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[107].y, _755);
    float _777 = fma(_765, _735, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _779 = fma(_769, _735, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _781 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[107].z, _757);
    float _783 = fma(_773, _715, _771);
    float _785 = fma(_777, _715, _775);
    float _787 = fma(_779, _715, _781);
    float _789 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].x, _783);
    float _791 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].y, _785);
    float _793 = fma(_671, (*spvDescriptorSet0.vp_c9)._m0[109].z, _787);
    float _795 = _789 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _797 = _791 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _799 = _793 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _803 = _795 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _805 = _797 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _807 = _799 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _803;
    out.m_68.y = _805;
    out.m_68.z = _807;
    out.m_68.w = _801;
    bool _809 = !_725;
    float _825;
    if (!_809)
    {
        float _811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _813 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _815 = fma(_813, (*spvDescriptorSet0.vp_c9)._m0[11].z, _131);
        float _817 = _815 * _811;
        float _819 = floor(_817);
        float _821 = -_819;
        float _823 = _817 + _821;
        _825 = _823;
        _827 = true;
    }
    else
    {
        float _829 = float(_97);
        float _831 = 1.0 / _829;
        float _833 = _131 * _831;
        _825 = _833;
    }
    _827 = false;
    float _835 = _825;
    float _837 = in.m_53.y;
    float _839 = _153 * 2.0;
    float _841 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _843 = log2(_841);
    float _845 = _419 * _443;
    float _847 = in.m_53.z;
    float _849 = _419 * _413;
    float _851 = fma(_417, _441, _845);
    float _853 = _419 * _431;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _865 = _863 != 0;
    float _867 = floor(_839);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _869;
    float _873 = fma(_435, _445, _851);
    float _875 = fma(_417, _429, _853);
    float _877 = in.m_62.w;
    float _879 = fma(_417, _411, _849);
    float _881 = fma(_435, _433, _875);
    float _883 = _843 * _131;
    float _885 = 1.0 / _871;
    float _887 = in.m_64.w;
    float _889 = fma(_435, _415, _879);
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _893 = _835 + _891;
    float _895 = _837 * 2.0;
    bool _897 = _867 > 0.0;
    float _899 = exp2(_883);
    bool _901 = _867 >= 0.0;
    bool _903 = isnan(_867);
    bool _905 = _901 || _903;
    bool _907 = isnan(0.0);
    bool _909 = _905 || _907;
    float _911 = _847 * 2.0;
    float _913 = in.m_60.w;
    float _915 = _837 + _847;
    int _917 = _909 ? 0 : 1;
    float _919 = floor(_895);
    float _921 = _915 + (-1.0);
    float _923 = _893 * _885;
    float _925 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _929 = 1.0 + _927;
    float _931 = floor(_911);
    float _933 = _153 + _837;
    float _935 = -_899;
    float _937 = _935 + 1.0;
    float _939 = _873 + _887;
    float _941 = _933 + (-1.0);
    bool _943 = _919 >= 0.0;
    bool _945 = isnan(_919);
    bool _947 = _943 || _945;
    bool _949 = isnan(0.0);
    bool _951 = _947 || _949;
    float _953 = 1.0 / _929;
    bool _955 = _919 > 0.0;
    float _957 = _889 + _913;
    int _959 = _951 ? 0 : 1;
    float _961 = fma(_941, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _963 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _965 = isnan(0.0);
    bool _967 = _963 || _965;
    bool _969 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _971 = _967 || _969;
    float _973 = _881 + _877;
    int _975 = ~_917;
    int _977 = _975 + 1;
    int _979 = _977 + 1;
    int _981 = _979;
    float _983 = _939;
    if (!_897)
    {
        int _985 = ~_917;
        int _987 = _985 + 1;
        _981 = _987;
    }
    int _989 = _981;
    bool _991 = _931 > 0.0;
    bool _993 = _931 >= 0.0;
    bool _995 = isnan(_931);
    bool _997 = _993 || _995;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    float _1003 = _971 ? _937 : 0.0;
    bool _1005 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1007 = isnan(1.0);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1013 = _1009 || _1011;
    bool _1015 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1017 = isnan(_835);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = -_1025;
    float _1029 = _1027 + 1.0;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1031;
    bool _1035 = _835 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1037 = isnan(_835);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1043 = _1039 || _1041;
    float _1045 = float(_1043);
    float _1047 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1047;
    int _1051 = ~_959;
    int _1053 = _1051 + 1;
    int _1055 = _1053 + 1;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1059 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1057;
    float _1061 = fma(_1033, _923, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1063 = _1045 * _1029;
    float _1065 = fma(_1049, _923, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1067 = fma(_1059, _923, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    int _1069 = _1055;
    if (_1013)
    {
        float _1071 = _1003 * _953;
        _135 = _1071;
    }
    float _1073 = _135;
    float _1075 = _1061 * _1063;
    float _1077 = _1065 * _1063;
    float _1079 = -_1045;
    float _1081 = _1079 + 1.0;
    float _1083 = _1067 * _1063;
    if (!_955)
    {
        int _1085 = ~_959;
        int _1087 = _1085 + 1;
        _1069 = _1087;
    }
    int _1089 = _1069;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1093 = _973 + _1091;
    int _1095 = _1001 ? 0 : 1;
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1075);
    bool _1099 = !_857;
    int _1101 = _1099 ? 0 : 1;
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1105 = _957 + _1103;
    int _1107 = ~_1095;
    int _1109 = _1107 + 1;
    int _1111 = _1109 + 1;
    float _1113 = _1093 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1115 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1077);
    int _1117 = _1111;
    if (!_991)
    {
        int _1119 = ~_1095;
        int _1121 = _1119 + 1;
        _1117 = _1121;
    }
    int _1123 = _1117;
    float _1125 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1083);
    int _1127 = abs(_1101);
    float _1129 = fma(_1105, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1113);
    bool _1131 = !_861;
    int _1133 = _1131 ? 0 : 1;
    float _1135 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1137 = _939 + _1135;
    float _1139 = float(_1127);
    float _1141 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1097);
    float _1143 = float(_1123);
    float _1145 = fma(_1137, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1129);
    int _1147 = abs(_1133);
    float _1149 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1125);
    float _1151 = in.m_70.x;
    float _1153 = in.m_70.y;
    float _1155 = in.m_70.z;
    float _1157 = _1139 * _1143;
    float _1159 = _1093 * _1093;
    bool _1161 = _1145 >= 0.0;
    float _1163 = _1141 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1165 = float(_1147);
    float _1167 = fma(_1105, _1105, _1159);
    float _1169 = float(_989);
    float _1171 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1115);
    float _1173 = fma(_1137, _1137, _1167);
    bool _1175 = !_865;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = _1165 * _1169;
    float _1181 = _837 + (-0.5);
    float _1183 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1185 = abs(_1177);
    float _1187 = rsqrt(_1173);
    float _1189 = _1179 * (-2.0);
    float _1191 = _1149 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1193 = (*spvDescriptorSet0.vp_c9)._m0[131].x;
    int _1195 = as_type<int>(_1191);
    if (_1161)
    {
        _1193 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1197 = _1193;
    float _1199 = _1171 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1201 = _1163 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1203 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = fma(_1189, _1153, _1153);
    float _1207 = _1199 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1209 = _1155;
    if (_1161)
    {
        float _1211 = _1197 * 5.0;
        _1195 = as_type<int>(_1211);
    }
    int _1213 = _1195;
    float _1215 = fma(_925, _1189, _925);
    float _1217 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1205);
    out.m_72.x = _1201;
    out.m_72.y = _1207;
    out.m_72.z = _1203;
    out.m_72.w = _1183;
    float _1219 = fma(_1215, _1073, _1217);
    float _1221 = float(_1185);
    if (_1161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4345 = as_type<float>(_1213);
        out.gl_Position.z = _4345;
    }
    float _1223 = _1093 * _1187;
    float _1225 = _1105 * _1187;
    if (_1161)
    {
        out.m_49.x = 0.0;
    }
    if (_1161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1227 = -_1223;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[18].w, _973);
    float _1231 = float(_1089);
    float _1233 = _1137 * _1187;
    float _1235 = -_1225;
    float _1237 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[18].w, _957);
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1241 = _1229 + _1239;
    float _1243 = -_1223;
    float _1245 = fma(_1243, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1093);
    float _1247 = -_1233;
    float _1249 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[18].w, _939);
    float _1251 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1253 = _1237 + _1251;
    float _1255 = _1241 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1257 = _1157 * (-2.0);
    float _1259 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1261 = _1249 + _1259;
    float _1263 = _1219 * 0.15915493667125701904296875;
    float _1265 = fma(_1253, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1255);
    float _1267 = _1245 * _1245;
    float _1269 = fma(_961, _1257, _961);
    float _1271 = -_1225;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1105);
    float _1275 = fma(_1261, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1265);
    float _1277 = fma(_1257, _1151, _1151);
    float _1279 = _1221 * _1231;
    float _1281 = _153 + (-0.5);
    float _1283 = _153 + _847;
    float _1285 = fma(_1273, _1273, _1267);
    bool _1287 = _1275 >= 0.0;
    float _1289 = _1279 * (-2.0);
    float _1291 = _1283 + (-1.0);
    float _1293 = fma(_1281, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1277);
    float _1295 = fma(_1289, _1155, _1155);
    float _1297 = _847 + (-0.5);
    float _1299 = fma(_1291, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1301 = -_1233;
    float _1303 = fma(_1301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1137);
    float _1305 = fma(_1269, _1073, _1293);
    float _1307 = fma(_1297, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1295);
    float _1309 = fma(_1299, _1289, _1299);
    float _1311 = fma(_1303, _1303, _1285);
    float _1313 = _1305 * 0.15915493667125701904296875;
    float _1315 = _1241;
    float _1317 = _1261;
    if (_1287)
    {
        _1209 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1319 = _1209;
    float _1321 = fma(_1309, _1073, _1307);
    float _1323 = _1263 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    int _1327 = as_type<int>(_1319);
    if (_1287)
    {
        out.m_49.x = 0.0;
    }
    if (_1287)
    {
        float _1329 = _1319 * 5.0;
        _1327 = as_type<int>(_1329);
    }
    int _1331 = _1327;
    float _1333 = _1321 * 0.15915493667125701904296875;
    float _1335 = _1263 * 6.283185482025146484375;
    float _1337 = cos(_1335);
    if (_1287)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4551 = as_type<float>(_1331);
        out.gl_Position.z = _4551;
    }
    float _1339 = sqrt(_1311);
    float _1341 = _1313 * 6.283185482025146484375;
    float _1343 = sin(_1341);
    float _1345 = _1313 * 6.283185482025146484375;
    float _1347 = cos(_1345);
    if (_1287)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1349 = _519 * _627;
    float _1351 = _1333 * 6.283185482025146484375;
    float _1353 = cos(_1351);
    float _1355 = _1187 * _1339;
    float _1357 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_215));
    float _1359 = _1349 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1361 = _519 * _625;
    float _1363 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, as_type<float>(_233));
    float _1365 = _1343 * _1325;
    float _1367 = _1355 * _1359;
    float _1369 = _1333 * 6.283185482025146484375;
    float _1371 = sin(_1369);
    float _1373 = _1347 * _1337;
    float _1375 = _1355 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1377 = _1375 * 0.5;
    float _1379 = _1357 * _1367;
    float _1381 = _1361 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1383 = _1343 * _1337;
    float _1385 = _1381 * _1355;
    float _1387 = _1353 * _1379;
    float _1389 = _1347 * _1325;
    float _1391 = _1325 * _1353;
    float _1393 = _1385 * _1363;
    float _1395 = _1347 * _1387;
    float _1397 = _1337 * _1353;
    float _1399 = _1343 * _1387;
    float _1401 = fma(_1371, _1373, _1365);
    float _1403 = -_1379;
    float _1405 = _1371 * _1403;
    float _1407 = fma(_1371, _1365, _1373);
    float _1409 = fma(_1401, _1393, _1395);
    float _1411 = -_1383;
    float _1413 = fma(_1371, _1389, _1411);
    float _1415 = -_1389;
    float _1417 = fma(_1371, _1383, _1415);
    float _1419 = fma(_1397, _1393, _1405);
    float _1421 = fma(_1413, _1377, _1409);
    float _1423 = fma(_1417, _1393, _1399);
    float _1425 = fma(_1391, _1377, _1419);
    float _1427 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1429 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1431 = fma(_1407, _1377, _1423);
    float _1433 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1427);
    float _1435 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1429);
    float _1437 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1439 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1433);
    float _1441 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1435);
    float _1443 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1437);
    float _1445 = _1439 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1447 = _1441 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1449 = fma(_1431, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1443);
    float _1451 = _957 + _1445;
    float _1453 = _939 + _1447;
    float _1455 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1459 = _1451 + _1457;
    float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1463 = _1453 + _1461;
    float _1465 = _973 + _1455;
    float _1467 = _1459 * _1459;
    float _1469 = _1463 * _1463;
    float _1471 = _1467 + _1469;
    float _1473 = sqrt(_1471);
    bool _1475 = _1473 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1477 = _1455;
    float _1479 = _1451;
    float _1481 = _1421;
    float _1483 = _1453;
    float _1485 = _1469;
    float _1487 = _1471;
    if (!_1475)
    {
        _1477 = _1451;
    }
    float _1489 = _1477;
    float _1491 = _1489;
    if (!_1475)
    {
        _1479 = _1453;
    }
    float _1493 = _1479;
    float _1495 = _1493;
    if (!_1475)
    {
        _1481 = _1467;
    }
    float _1497 = _1481;
    float _1499 = _1497;
    if (!_1475)
    {
        _1483 = _1465;
    }
    float _1501 = _1483;
    bool _1503 = !_1475;
    float _1505 = _1501;
    if (!_1503)
    {
        float _1507 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1511 = _1473 + _1509;
        float _1513 = rsqrt(_1471);
        float _1515 = _1511 * _1507;
        float _1517 = _1465 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1519 = _1515 * 0.15915493667125701904296875;
        float _1521 = _1519 * 6.283185482025146484375;
        float _1523 = sin(_1521);
        float _1525 = _1519 * 6.283185482025146484375;
        float _1527 = cos(_1525);
        float _1529 = fma(_1523, _1517, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1531 = _1513 * _1529;
        float _1533 = _1527 + (-1.0);
        float _1535 = fma(_1459, _1531, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1537 = fma(_1463, _1531, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1539 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1541 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1543 = _1535 + _1541;
        float _1545 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1547 = _1537 + _1545;
        float _1549 = fma(_1465, _1527, _1539);
        float _1551 = _1543 * _1543;
        float _1553 = _1547 * _1547;
        _1505 = _1549;
        _1499 = _1551;
        _1485 = _1553;
        _1491 = _1535;
        _1495 = _1537;
    }
    float _1555 = _1505;
    float _1557 = _1499;
    float _1559 = _1485;
    float _1561 = _1491;
    float _1563 = _1495;
    float _1565 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1567 = _1555 + _1565;
    float _1569 = fma(_1567, _1567, _1557);
    float _1571 = _1569 + _1559;
    float _1573 = sqrt(_1571);
    bool _1575 = _1573 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1577 = isnan(_1573);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1583 = _1579 || _1581;
    float _1585 = _1569;
    if (!_1583)
    {
        _1585 = 1.0;
    }
    float _1587 = _1585;
    bool _1589 = !_1583;
    float _1591 = _1587;
    if (!_1589)
    {
        bool _1593 = _1573 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1595 = isnan(_1573);
        bool _1597 = _1593 || _1595;
        bool _1599 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1601 = _1597 || _1599;
        if (!_1601)
        {
            float _1603 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1605 = _1573 + _1603;
            float _1607 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1609 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1607;
            float _1611 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1613 = _1611 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1615 = 1.0 / _1609;
            float _1617 = _1605 * _1615;
            float _1619 = fma(_1617, _1613, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1591 = _1619;
            _1621 = true;
        }
        else
        {
            bool _1623 = _1573 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1625 = isnan(_1573);
            bool _1627 = _1623 || _1625;
            bool _1629 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1631 = _1627 || _1629;
            if (!_1631)
            {
                float _1633 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1635 = _1573 + _1633;
                float _1637 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1639 = _1637 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1643 = _1641 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1645 = 1.0 / _1639;
                float _1647 = _1635 * _1645;
                float _1649 = fma(_1647, _1643, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1591 = _1649;
                _1621 = true;
            }
            else
            {
                _1591 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1621 = false;
    float _1651 = _1591;
    float _1653 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1655 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1657 = _1561 + _1655;
    float _1659 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1653);
    bool _1661 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1663 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1665 = _1661 || _1663;
    bool _1667 = isnan(0.5);
    bool _1669 = _1665 || _1667;
    float _1671 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1659);
    float _1673 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1675 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1677 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan(0.5);
    bool _1683 = _1679 || _1681;
    float _1685 = _1671 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1687 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1673);
    float _1689 = fma(_1657, _1651, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1691 = 1.0 / _1685;
    float _1693 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1687);
    float _1695 = _1693 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1697 = _1695 + _1685;
    float _1699 = _1685;
    if (_1683)
    {
        _1699 = 1.0;
    }
    float _1701 = _1699;
    float _1703 = _1697 * _1691;
    float _1705 = _1703 * 0.5;
    float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1709 = _1555 + _1707;
    float _1711 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1713 = fma(_1705, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1711);
    float _1715 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1717 = _1563 + _1715;
    float _1719 = fma(_1709, _1651, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1721 = fma(_1717, _1651, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1723 = 1.0 / _1713;
    float _1725 = -_1225;
    float _1727 = fma(_1725, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1689);
    float _1729 = -_1223;
    float _1731 = fma(_1729, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1719);
    float _1733 = -_1233;
    float _1735 = fma(_1733, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1721);
    float _1737 = _1731;
    float _1739 = _1727;
    float _1741 = _1735;
    float _1743 = _1701;
    if (!_1669)
    {
        float _1745 = _1241 * _1241;
        float _1747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1749 = -_939;
        float _1751 = _1749 + _1721;
        float _1753 = -_957;
        float _1755 = _1753 + _1689;
        float _1757 = fma(_1253, _1253, _1745);
        float _1759 = fma(_1261, _1261, _1757);
        float _1761 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1763 = sqrt(_1759);
        float _1765 = 1.0 / _1355;
        float _1767 = _1761 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1769 = precise::min(_1763, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1771 = _1769 * _1747;
        float _1773 = -_973;
        float _1775 = _1773 + _1719;
        float _1777 = _1771 * _1765;
        float _1779 = _1767 * _1777;
        float _1781 = _1751 * _1777;
        float _1783 = fma(_1755, _1779, _1237);
        float _1785 = fma(_1775, _1779, _1229);
        float _1787 = fma(_1767, _1781, _1249);
        _1737 = _1785;
        _1739 = _1783;
        _1741 = _1787;
        _983 = _1781;
    }
    float _1789 = _1737;
    float _1791 = _1739;
    float _1793 = _1741;
    float _1795 = _983;
    float _1797 = _1795;
    if (_1683)
    {
        _1797 = 1.0;
    }
    float _1799 = _1797;
    float _1801 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1803 = _1723 * _1801;
    float _1805 = _1799;
    if (!_1683)
    {
        float _1807 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1809 = _1807 * 0.15915493667125701904296875;
        float _1811 = _1809 * 6.283185482025146484375;
        float _1813 = cos(_1811);
        float _1815 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1817 = _1815 * 0.15915493667125701904296875;
        float _1819 = _1809 * 6.283185482025146484375;
        float _1821 = sin(_1819);
        float _1823 = 1.0 / _1813;
        float _1825 = _1817 * 6.283185482025146484375;
        float _1827 = cos(_1825);
        float _1829 = _1821 * _1823;
        float _1831 = _1817 * 6.283185482025146484375;
        float _1833 = sin(_1831);
        float _1835 = _1827 * _1829;
        float _1837 = 1.0 / _1835;
        float _1839 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1841 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1839;
        float _1843 = 1.0 / _1841;
        float _1845 = _1833 * _1837;
        float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1849 = fma(_1803, _1845, _1847);
        float _1851 = _1849 * _1843;
        float _1853 = precise::clamp(_1851, 0.0, 1.0);
        _1315 = _1817;
        _1743 = _1853;
    }
    float _1855 = _1315;
    float _1857 = _1743;
    float _1859 = _1855;
    if (!_1683)
    {
        float _1861 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1863 = _1861 * 0.15915493667125701904296875;
        float _1865 = _1863 * 6.283185482025146484375;
        float _1867 = cos(_1865);
        float _1869 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1871 = _1869 * 0.15915493667125701904296875;
        float _1873 = _1863 * 6.283185482025146484375;
        float _1875 = sin(_1873);
        float _1877 = 1.0 / _1867;
        float _1879 = _1871 * 6.283185482025146484375;
        float _1881 = cos(_1879);
        float _1883 = _1875 * _1877;
        float _1885 = _1871 * 6.283185482025146484375;
        float _1887 = sin(_1885);
        float _1889 = _1881 * _1883;
        float _1891 = 1.0 / _1889;
        float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1895 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1893;
        float _1897 = 1.0 / _1895;
        float _1899 = _1887 * _1891;
        float _1901 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1903 = fma(_1803, _1899, _1901);
        float _1905 = _1903 * _1897;
        float _1907 = precise::clamp(_1905, 0.0, 1.0);
        float _1909 = -_1907;
        float _1911 = _1909 + 1.0;
        _1859 = _1867;
        _1317 = _1889;
        _1805 = _1911;
    }
    float _1913 = _1859;
    float _1915 = _1317;
    float _1917 = _1805;
    float _1919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1921 = _1789 + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1925 = _1791 + _1923;
    float _1927 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1929 = _1793 + _1927;
    float _1931 = _1921 * _1921;
    float _1933 = fma(_1925, _1925, _1931);
    float _1935 = fma(_1929, _1929, _1933);
    float _1937 = rsqrt(_1935);
    float _1939 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1941 = _1925 * _1939;
    float _1943 = _1929 * _1939;
    float _1945 = _1941 * _1941;
    float _1947 = _1943 * _1943;
    float _1949 = _1945 + _1947;
    float _1951 = sqrt(_1949);
    bool _1953 = _1951 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1955 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1957 = _1951 + _1955;
    float _1959 = _1933;
    float _1961 = _1949;
    float _1963 = _1957;
    float _1965 = _1913;
    float _1967 = _1921;
    float _1969 = _1915;
    if (_1953)
    {
        float _1971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _1971;
    }
    float _1973 = _1959;
    if (_1953)
    {
        float _1975 = rsqrt(_1949);
        _1961 = _1975;
    }
    float _1977 = _1961;
    float _1979 = _1977;
    if (_1953)
    {
        float _1981 = _1957 * _1973;
        _1963 = _1981;
    }
    float _1983 = _1963;
    if (_1953)
    {
        float _1985 = _1983 * 0.15915493667125701904296875;
        _1965 = _1985;
    }
    float _1987 = _1965;
    float _1989 = _1929;
    if (_1953)
    {
        float _1991 = _1987 * 6.283185482025146484375;
        float _1993 = sin(_1991);
        _1989 = _1993;
    }
    float _1995 = _1989;
    float _1997 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1999 = precise::max(0.0, _1997);
    float _2001 = _1973;
    float _2003 = _1999;
    if (_1953)
    {
        float _2005 = _1987 * 6.283185482025146484375;
        float _2007 = cos(_2005);
        _2001 = _2007;
    }
    float _2009 = _2001;
    float _2011 = -_1939;
    float _2013 = -_1999;
    float _2015 = fma(_1921, _2011, _2013);
    if (_1953)
    {
        float _2017 = _2015 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1967 = _2017;
    }
    float _2019 = _1967;
    float _2021 = sqrt(_1935);
    float _2023 = _2019;
    float _2025 = _1995;
    if (_1953)
    {
        float _2027 = fma(_1995, _2019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2023 = _2027;
    }
    float _2029 = _2023;
    float _2031 = _2029;
    if (!_1953)
    {
        _2025 = _1941;
    }
    float _2033 = _2025;
    float _2035 = _2033;
    float _2037 = _2009;
    if (_1953)
    {
        float _2039 = _2009 + (-1.0);
        _2003 = _2039;
    }
    float _2041 = _2003;
    float _2043 = _2041;
    if (_1953)
    {
        float _2045 = _1977 * _2029;
        _1487 = _2045;
    }
    float _2047 = _1487;
    if (!_1953)
    {
        _2031 = _2015;
    }
    float _2049 = _2031;
    float _2051 = _2049;
    if (_1953)
    {
        float _2053 = _2041 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1969 = _2053;
    }
    float _2055 = _1969;
    if (_1953)
    {
        float _2057 = _1941 * _2047;
        _2035 = _2057;
    }
    float _2059 = _2035;
    if (!_1953)
    {
        _2043 = _1943;
    }
    float _2061 = _2043;
    float _2063 = _2061;
    if (_1953)
    {
        float _2065 = _1943 * _2047;
        _2063 = _2065;
    }
    float _2067 = _2063;
    if (!_1953)
    {
        _1979 = _1945;
    }
    float _2069 = _1979;
    float _2071 = _2069;
    if (_1953)
    {
        float _2073 = fma(_2015, _2009, _2055);
        _2051 = _2073;
    }
    float _2075 = _2051;
    if (_1953)
    {
        float _2077 = _2059 * _2059;
        _2071 = _2077;
    }
    float _2079 = _2071;
    if (!_1953)
    {
        _2037 = _1947;
    }
    float _2081 = _2037;
    float _2083 = _2081;
    if (_1953)
    {
        float _2085 = _2067 * _2067;
        _2083 = _2085;
    }
    float _2087 = _2083;
    float _2089 = fma(_2075, _2075, _2079);
    float _2091 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2093 = _2089 + _2087;
    float _2095 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2099 = fma(_2021, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2097);
    float _2101 = precise::clamp(_2099, 0.0, 1.0);
    float _2103 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2105 = rsqrt(_2093);
    float _2107 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2095);
    float _2109 = -_2101;
    float _2111 = _2109 + 1.0;
    float _2113 = _1789 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2115 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2103);
    float _2117 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2107);
    float _2119 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2121 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2115);
    float _2123 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2125 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2113);
    float _2127 = abs(_2111);
    float _2129 = log2(_2127);
    float _2131 = _2121 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2135 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2125);
    float _2137 = fma(_1791, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2091);
    float _2139 = _2105 * _2059;
    float _2141 = -_2133;
    float _2143 = fma(_2141, _2119, 1.0);
    float _2145 = _2135 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2147 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2149 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2137);
    float _2151 = _2105 * _2067;
    float _2153 = log2(_2143);
    float _2155 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2147);
    float _2157 = _2105 * _2075;
    float _2159 = _2139 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2161 = _2149 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2163 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2155);
    float _2165 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2167 = -_2159;
    float _2169 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2167);
    float _2171 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2163);
    float _2173 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2175 = -_2151;
    float _2177 = fma(_2175, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2169);
    float _2179 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2181 = 1.0 / _2171;
    float _2183 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2173);
    float _2185 = fma(_2177, -0.5, 0.5);
    float _2187 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2179);
    float _2189 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2183);
    float _2191 = _2157 + 1.0;
    float _2193 = _2153 * 0.693147182464599609375;
    float _2195 = exp2(_2165);
    float _2197 = _2193 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2199 = sqrt(_2185);
    float _2201 = fma(_2177, 0.5, 0.5);
    float _2203 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2187);
    float _2205 = fma(_2201, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2207 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2203);
    float _2209 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2189);
    float _2211 = -_2157;
    float _2213 = fma(_2195, _2191, _2211);
    float _2215 = fma(_2201, _2205, -0.212114393711090087890625);
    float _2217 = _2207 * _2181;
    float _2219 = _2209 * _2181;
    float _2221 = fma(_2213, 0.5, 0.5);
    float _2223 = fma(_2201, _2215, 1.570728778839111328125);
    float _2225 = fma(_2217, 0.5, 0.5);
    float _2227 = _2199 * 0.636619746685028076171875;
    float _2229 = fma(_2219, -0.5, 0.5);
    float _2231 = -_2223;
    float _2233 = fma(_2227, _2231, 1.0);
    float3 _5970 = float3(_2225, _2229, _2197);
    float _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5970, float3(0.0), isnan(_5970)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5970, float3(0.0), isnan(_5970)), level(0.0)).x;
    float3 _5981 = float3(_2225, _2229, _2197);
    float4 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5981, float3(0.0), isnan(_5981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5981, float3(0.0), isnan(_5981)), level(0.0)).xyzw;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _2238.w;
    float2 _5998 = float2(_2233, _2221);
    float3 _2250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _2252 = _2250.x;
    float _2254 = _2250.y;
    float _2256 = _2250.z;
    float _2258 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2260 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2262 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2264 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2266 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2258);
    float _2268 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2260);
    float _2270 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2262);
    float _2272 = fma(_1237, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2264);
    float _2274 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2266);
    float _2276 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2268);
    float _2278 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2270);
    float _2280 = fma(_1249, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2272);
    float _2282 = _2274 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2284 = _2276 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2286 = _2278 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    out.m_74.y = 1.0;
    float _2288 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2290 = _2131 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2292 = _2280 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2294 = -_513;
    float _2296 = _2294 + _1789;
    float _2298 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2288);
    float _2300 = fma(_2145, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2290);
    float _2302 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2304 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[7].z;
    float _2306 = -_511;
    float _2308 = _2306 + _1791;
    float _2310 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[4].z;
    float _2312 = -_515;
    float _2314 = _2312 + _1793;
    float _2316 = _2304 + _2298;
    float _2318 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2302);
    float _2320 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[638].y;
    float _2322 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2324 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2316);
    float _2326 = _2310 + _2318;
    float _2328 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[638].x, _2320);
    float _2330 = _2129 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2332 = 1.0 / _2324;
    float _2334 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2326);
    float _2336 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[638].z, _2328);
    float _2338 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2322);
    float _2340 = fma(_2123, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2300);
    float _2342 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2344 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[636].y;
    float _2346 = _2286 * (*spvDescriptorSet0.vp_c8)._m0[5].z;
    float _2348 = exp2(_2330);
    float _2350 = fma(_2284, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2342);
    float _2352 = fma(_2161, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2340);
    float _2354 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[636].x, _2344);
    float _2356 = _2346 + _2338;
    float _2358 = fma(_2286, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2350);
    float _2360 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[636].z, _2354);
    float _2362 = _2334 * _2332;
    float _2364 = _2336 + (*spvDescriptorSet0.vp_c15)._m0[638].w;
    float _2366 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[635].y;
    float _2368 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2358);
    float _2370 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2356);
    float _2372 = _2352 + _2171;
    float _2374 = fma(_2308, (*spvDescriptorSet0.vp_c15)._m0[635].x, _2366);
    float _2376 = 1.0 / _2364;
    float _2378 = -_2348;
    float _2380 = _2378 + 1.0;
    float _2382 = _2368 * _2332;
    float _2384 = fma(_2314, (*spvDescriptorSet0.vp_c15)._m0[635].z, _2374);
    float _2386 = _2370 * _2332;
    float _2388 = _2380 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2390 = _2384 + (*spvDescriptorSet0.vp_c15)._m0[635].w;
    bool _2392 = _2382 > 0.0;
    float _2394 = _2372 * 0.5;
    out.gl_Position.x = _2207;
    out.gl_Position.y = _2209;
    out.gl_Position.z = _2352;
    out.gl_Position.w = _2171;
    bool _2396 = _2382 < 1.0;
    bool _2398 = _2396 && _2392;
    float _2400 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[636].w;
    out.m_76.z = _2394;
    out.m_76.w = _2171;
    float _2402 = _2390 * _2376;
    bool _2404 = _2217 > (-1.0);
    bool _2406 = _2404 && _2398;
    float _2408 = _2400 * _2376;
    bool _2410 = _2219 > (-1.0);
    bool _2412 = _2410 && _2406;
    bool _2414 = _2217 < 1.0;
    bool _2416 = _2414 && _2412;
    bool _2418 = _2219 < 1.0;
    bool _2420 = _2418 && _2416;
    float _2422 = _2388 * _2235;
    float _2424 = -_2388;
    float _2426 = _2424 + 1.0;
    float _2428 = _2246 * _2422;
    float _2430 = _2256 * _2422;
    float _2432 = _2246 * _2426;
    float _2434 = fma(_2252, _2428, _2240);
    float _2436 = fma(_2254, _2428, _2242);
    float _2438 = fma(_2246, _2430, _2244);
    out.m_78.x = _2434;
    out.m_78.y = _2436;
    out.m_78.z = _2438;
    out.m_78.w = _2432;
    bool _2440 = !_2420;
    float _2476;
    if (!_2440)
    {
        float _2442 = -_2386;
        float _2444 = _2219 + _2442;
        float _2446 = -_2362;
        float _2448 = _2217 + _2446;
        float _2450 = -_2402;
        float _2452 = _2217 + _2450;
        float _2454 = -_2408;
        float _2456 = _2219 + _2454;
        float _2458 = _2444 * _2444;
        float _2460 = fma(_2448, _2448, _2458);
        float _2462 = sqrt(_2460);
        bool _2464 = _2462 > 0.0;
        float _2466 = _1857 * _1917;
        float _2468 = _2466 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
        float _2470 = _2466;
        if (!_2464)
        {
            _2470 = _2468;
        }
        float _2472 = _2470;
        bool _2474 = !_2464;
        _2476 = _2472;
        _2478 = _2474;
        if (!_2478)
        {
            float _2480 = _2456 * _2456;
            float _2482 = fma(_2452, _2452, _2480);
            float _2484 = rsqrt(_2460);
            float _2486 = sqrt(_2482);
            float _2488 = _2448 * _2484;
            float _2490 = _2444 * _2484;
            bool _2492 = _2486 > 0.0;
            float _2494 = _2484;
            if (!_2492)
            {
                _2494 = _2468;
            }
            float _2496 = _2494;
            bool _2498 = !_2492;
            _2476 = _2496;
            _2478 = _2498;
            if (!_2478)
            {
                float _2500 = _1385 * _2292;
                float _2502 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
                float _2504 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2304);
                float _2506 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2346);
                float _2508 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2504);
                float _2510 = fma(_2500, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2310);
                float _2512 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2506);
                float _2514 = 1.0 / _2508;
                float _2516 = fma(_2292, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2510);
                float _2518 = _2502 * (*spvDescriptorSet0.vp_c13)._m0[0].w;
                float _2520 = rsqrt(_2482);
                float _2522 = _2456 * _2518;
                float _2524 = _2452 * _2518;
                float _2526 = _2522 * _2522;
                float _2528 = _2512 * _2514;
                float _2530 = _2516 * _2514;
                float _2532 = fma(_2524, _2524, _2526);
                float _2534 = _2528 * _2528;
                float _2536 = fma(_2530, _2530, _2534);
                float _2538 = sqrt(_2532);
                float _2540 = _2456 * _2520;
                float _2542 = _2452 * _2520;
                float _2544 = _2490 * _2540;
                float _2546 = sqrt(_2536);
                float _2548 = fma(_2488, _2542, _2544);
                float _2550 = precise::min(0.0, _2548);
                float _2552 = _2171 * _2550;
                float _2554 = fma(_2524, _2552, _2207);
                float _2556 = fma(_2538, (*spvDescriptorSet0.vp_c13)._m0[1].x, _2546);
                float _2558 = fma(_2522, _2552, _2209);
                float _2560 = 1.0 / _2556;
                out.gl_Position.x = _2554;
                out.gl_Position.y = _2558;
                float _2562 = _2546 * _2560;
                out.m_74.y = _2562;
                _2476 = _2468;
                _2478 = true;
            }
        }
    }
    else
    {
        float _2564 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        out.gl_Position.z = _2564;
        _2476 = 0.0;
    }
    _2478 = false;
    float _2566 = _2476;
    bool _2568 = _1857 > 0.0;
    bool _2570 = isnan(_1857);
    bool _2572 = _2568 || _2570;
    bool _2574 = isnan(0.0);
    bool _2576 = _2572 || _2574;
    float _2578 = _2566 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _2580 = _1917 <= 0.0;
    bool _2582 = !_2576;
    bool _2584 = _2580 || _2582;
    out.m_49.x = _2578;
    if (!_2584)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2586 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2586;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

