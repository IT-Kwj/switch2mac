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
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_74 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_80 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_76 [[user(locn12)]];
    float4 m_90 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_64 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4156 = false;
    bool _1067 = false;
    bool _853 = false;
    bool _717 = false;
    bool _521 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = in.m_46.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5147 = as_type<float>(_131);
        out.gl_Position.z = _5147;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _135 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_106);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = float(_111);
    bool _147 = _115 >= _145;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    if (_151)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _123;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _133 = as_type<int>(_155);
    }
    int _157 = _133;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5202 = as_type<float>(_157);
        out.gl_Position.z = _5202;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_56.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_46.x;
    float _177 = in.m_46.y;
    float _179 = in.m_46.z;
    int _181 = int(_151);
    int _183 = false ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _173 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = in.m_44.x;
    float _211 = in.m_44.y;
    float _213 = in.m_44.z;
    float _215 = in.m_58.x;
    float _217 = in.m_58.y;
    float _219 = in.m_58.z;
    float _221 = as_type<float>(_207);
    float _223 = _161;
    if (!_173)
    {
        float _225 = _161 * _161;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    float _231 = in.m_60.x;
    float _233 = in.m_60.y;
    float _235 = in.m_60.z;
    float _237 = _229;
    if (!_173)
    {
        float _239 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _239;
    }
    float _241 = _237;
    float _243 = in.m_62.x;
    float _245 = in.m_62.y;
    float _247 = in.m_62.z;
    int _249 = as_type<int>(_159) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_159) & 2;
    bool _255 = _253 != 0;
    bool _257 = !_251;
    float _259 = _257 ? (-0.5) : 0.5;
    bool _261 = !_255;
    float _263 = _261 ? (-0.5) : 0.5;
    bool _265 = !_173;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = 0.0;
    float _273 = _179;
    float _275 = _233;
    float _277 = _177;
    float _279 = _179;
    float _281 = _233;
    float _283 = _231;
    if (!_265)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _161 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _161);
        float _311 = _309 * _297;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _313;
        _269 = _297;
        _271 = _303;
    }
    float _315 = _267;
    float _317 = _269;
    float _319 = _271;
    bool _321 = !_173;
    float _323 = _319;
    float _325 = _317;
    float _327 = _315;
    if (!_321)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _161 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _223 = _347;
        _323 = _335;
    }
    float _349 = _223;
    float _351 = _323;
    float _353 = _351;
    if (!_173)
    {
        float _355 = _115 * _115;
        float _357 = _355 * 0.5;
        _325 = _357;
    }
    float _359 = _325;
    float _361 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_173)
    {
        _353 = _115;
    }
    float _367 = _353;
    float _369 = fma(_349, _175, _361);
    float _371 = fma(_349, _177, _363);
    float _373 = _367;
    if (!_173)
    {
        float _375 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _375;
    }
    float _377 = _327;
    bool _379 = !_173;
    float _381 = _377;
    if (!_379)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = _115 * _385;
        float _395 = 1.0 / _389;
        float _397 = _391 * 0.693147182464599609375;
        float _399 = exp2(_393);
        float _401 = 1.0 / _397;
        float _403 = _399 + (-1.0);
        float _405 = -_403;
        float _407 = fma(_405, _401, _115);
        float _409 = _407 * _395;
        float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _381 = _411;
    }
    float _413 = _381;
    bool _415 = !_173;
    if (!_415)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _115 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _373 = _435;
    }
    float _437 = _373;
    float _439 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _443 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _445 = fma(_349, _179, _365);
    float _447 = fma(_437, _175, _439);
    float _449 = fma(_437, _177, _441);
    float _451 = 1.0 / _145;
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _455 = fma(_371, _163, _211);
    float _457 = -_449;
    float _459 = _371 + _457;
    float _461 = fma(_437, _179, _443);
    float _463 = fma(_369, _163, _209);
    float _465 = -_447;
    float _467 = _369 + _465;
    float _469 = _459 * _217;
    float _471 = _459 * _233;
    float _473 = _459 * _245;
    float _475 = -_461;
    float _477 = _445 + _475;
    float _479 = fma(_467, _215, _469);
    float _481 = fma(_467, _231, _471);
    float _483 = fma(_467, _243, _473);
    float _485 = fma(_445, _163, _213);
    float _487 = fma(_477, _219, _479);
    float _489 = fma(_477, _235, _481);
    float _491 = fma(_477, _247, _483);
    float _493 = _115 * _451;
    bool _495 = !_453;
    float _497 = _489;
    float _499 = _487;
    float _501 = _491;
    float _519;
    if (!_495)
    {
        float _503 = in.m_64.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        _519 = _493;
    }
    _521 = false;
    float _523 = _519;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = _523 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = in.m_56.x;
    float _547 = in.m_56.y;
    bool _549 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _551 = isnan(_523);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = 1.0 / _535;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _565 = 1.0 / _539;
    float _567 = 1.0 / _543;
    float _569 = _527 * _561;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _573 = _523 + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _575;
    float _579 = fma(_577, _569, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _581 = _573 * _565;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _583;
    bool _587 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _589 = isnan(_523);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    bool _599 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _601 = isnan(_523);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = fma(_585, _569, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _613 = _531 * _567;
    float _615 = -_559;
    float _617 = _615 + 1.0;
    bool _619 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _621 = isnan(_523);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _635 = _597 * _617;
    float _637 = -_597;
    float _639 = _637 + 1.0;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _645 = fma(_633, _581, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _647 = _629 * _639;
    float _649 = -_629;
    float _651 = _649 + 1.0;
    float _653 = fma(_643, _581, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _655 = _609 * _651;
    float _657 = -_609;
    float _659 = _657 + 1.0;
    float _661 = _579 * _655;
    float _663 = _611 * _655;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _669;
    float _673 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _661);
    float _675 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _663);
    float _677 = fma(_667, _613, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _679 = fma(_671, _613, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _681 = fma(_645, _647, _673);
    float _683 = fma(_653, _647, _675);
    float _685 = fma(_677, _635, _681);
    float _687 = fma(_679, _635, _683);
    float _689 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].x, _685);
    float _691 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].y, _687);
    float _693 = _689 * _545;
    float _695 = _691 * _547;
    bool _697 = !_563;
    float _715;
    if (!_697)
    {
        float _699 = in.m_64.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        _715 = _493;
    }
    _717 = false;
    float _719 = _715;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _723 = _719 + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _729 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _731 = isnan(_719);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _745 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _747 = isnan(_719);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _757;
    bool _761 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _763 = isnan(_719);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = 1.0 / _727;
    float _775 = -_739;
    float _777 = _775 + 1.0;
    bool _779 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _781 = _755 * _777;
    float _783 = -_755;
    float _785 = _783 + 1.0;
    float _787 = 1.0 / _743;
    float _789 = _759 * _773;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _795 = fma(_789, _723, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -_771;
    float _799 = _797 + 1.0;
    float _801 = _795 * _781;
    float _803 = _793 * _787;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _807 = _719 + _805;
    float _809 = _739 * _799;
    float _811 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[115].x, _801);
    float _813 = fma(_803, _807, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _815 = fma(_813, _809, _811);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _823 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[117].x, _815);
    float _825 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _827 = _819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _825;
    out.m_66.y = _827;
    out.m_66.z = _829;
    out.m_66.w = _831;
    bool _833 = !_779;
    float _851;
    if (!_833)
    {
        float _835 = in.m_64.x;
        float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _839 = _835 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].w, _115);
        float _843 = _841 * _837;
        float _845 = floor(_843);
        float _847 = -_845;
        float _849 = _843 + _847;
        _851 = _849;
        _853 = true;
    }
    else
    {
        _851 = _493;
    }
    _853 = false;
    float _855 = _851;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _859 = _855 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _869;
    bool _873 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _875 = isnan(_855);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = 1.0 / _863;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _895 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _897 = isnan(_855);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    bool _907 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _909 = isnan(_855);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = 1.0 / _867;
    float _921 = -_905;
    float _923 = _921 + 1.0;
    bool _925 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _927 = _871 * _885;
    bool _929 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _931 = isnan(_855);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = 1.0 / _889;
    float _943 = -_883;
    float _945 = _943 + 1.0;
    float _947 = fma(_927, _859, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _949 = _883 * _923;
    float _951 = -_939;
    float _953 = _951 + 1.0;
    float _955 = _939 * _945;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _961;
    float _965 = 1.0 / _893;
    float _967 = _917 * _953;
    float _969 = _959 * _919;
    float _971 = -_917;
    float _973 = _971 + 1.0;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _979 = _947 * _967;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _983 = _855 + _981;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _987 = _855 + _985;
    float _989 = _963 * _941;
    bool _991 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _993 = isnan(_855);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = fma(_969, _983, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1005 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[131].x, _979);
    float _1007 = fma(_989, _987, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1011 = _855 + _1009;
    float _1013 = -_1001;
    float _1015 = _1013 + 1.0;
    float _1017 = fma(_1003, _955, _1005);
    float _1019 = _977 * _965;
    float _1021 = _905 * _1015;
    float _1023 = fma(_1007, _949, _1017);
    float _1025 = fma(_1019, _1011, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1029 = fma(_1025, _1021, _1023);
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1033 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1037 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1029);
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _1033;
    out.m_68.y = _1039;
    out.m_68.z = _1041;
    out.m_68.w = _1043;
    bool _1045 = !_925;
    float _1047 = _1033;
    float _1065;
    if (!_1045)
    {
        float _1049 = in.m_64.x;
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1053 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[14].x, _115);
        float _1057 = _1055 * _1051;
        float _1059 = floor(_1057);
        float _1061 = -_1059;
        float _1063 = _1057 + _1061;
        _1065 = _1063;
        _1067 = true;
    }
    else
    {
        _1065 = _493;
    }
    _1067 = false;
    float _1069 = _1065;
    float _1071 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1073 = int(_1071);
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1077 = _1075 != 0;
    float _1079 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1081 = int(_1079);
    float _1083 = 0.0;
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1077)
    {
        _1083 = 1.0;
    }
    float _1087 = _1083;
    float _1089 = float(_1073);
    float _1091 = 0.0;
    float _1093 = _1087;
    if (_1077)
    {
        _1091 = 1.0;
    }
    float _1095 = _1091;
    float _1097 = 0.0;
    float _1099 = _1095;
    if (_1077)
    {
        _1097 = 1.0;
    }
    float _1101 = _1097;
    int _1103 = 0;
    float _1105 = _1101;
    if (_1077)
    {
        _1103 = 0;
    }
    int _1107 = _1103;
    float _1109 = 1.0 / _1089;
    float _1111 = _1039;
    int _1113 = _1107;
    if (_1077)
    {
        float _1115 = in.m_64.x;
        _1111 = _1115;
    }
    float _1117 = _1111;
    float _1119 = float(uint(_1081));
    if (_1077)
    {
        _1085 = 0;
    }
    int _1121 = _1085;
    int _1123 = ~_1081;
    int _1125 = _1123 + 1;
    float _1127 = 1.0 / _1119;
    float _1129 = _115 * _1109;
    int _1131 = ~_1081;
    int _1133 = _1131 + 1;
    float _1135 = trunc(_1129);
    int _1137 = int(_1135);
    int _1139 = as_type<int>(_1127) + (-2);
    float _1141 = _1117;
    int _1143 = _1121;
    if (_1077)
    {
        _1047 = _1117;
    }
    float _1145 = _1047;
    float _1147 = float(uint(_1137));
    float _1149 = as_type<float>(_1139) * _1147;
    float _1151 = trunc(_1149);
    float _1153 = precise::max(_1151, 0.0);
    uint _1156 = uint(_1153);
    int _1158 = _1133 * int(_1156);
    int _1160 = _1158 + _1137;
    float _1162 = float(uint(_1160));
    float _1164 = as_type<float>(_1139) * _1162;
    float _1166 = in.m_64.x;
    float _1168 = in.m_64.y;
    float _1170 = in.m_64.z;
    float _1172 = in.m_64.w;
    float _1174 = trunc(_1164);
    float _1176 = precise::max(_1174, 0.0);
    uint _1178 = uint(_1176);
    int _1180 = int(_1156) + int(_1178);
    float _1182 = _1145;
    if (!_1077)
    {
        float _1184 = in.m_64.y;
        float _1186 = in.m_64.z;
        _1093 = 7.345489978790283203125;
        _1182 = _1186;
        _1105 = 5.839270114898681640625;
        _1113 = 1;
        _1141 = _1184;
        _1099 = 1.2345600128173828125;
        _1143 = 2;
    }
    float _1188 = _1093;
    float _1190 = _1182;
    float _1192 = _1105;
    int _1194 = _1113;
    float _1196 = _1141;
    float _1198 = _1099;
    int _1200 = _1143;
    float _1202 = float(_1081);
    float _1204 = _1166 * _1188;
    float _1206 = float(_1137);
    int _1208 = _1125 * _1180;
    int _1210 = _1208 + _1137;
    float _1212 = floor(_1204);
    bool _1214 = _1206 >= _1202;
    bool _1216 = isnan(_1206);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(_1202);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = _1190 * _1192;
    bool _1228 = uint(_1210) >= uint(_1081);
    bool _1230 = _1194 != 1;
    bool _1232 = _1168 > 0.5;
    float _1234 = _1170 * 2.0;
    bool _1236 = _1170 > 0.5;
    float _1238 = trunc(_1224);
    int _1240 = int(_1238);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1244 = _1242 != 0;
    float _1246 = _455 * _233;
    bool _1248 = !_1228;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = _455 * _245;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1264 = _1262 != 0;
    float _1266 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1268 = -_259;
    int _1270 = _1232 ? as_type<int>(_1268) : as_type<int>(_259);
    float _1272 = -_1212;
    float _1274 = _1204 + _1272;
    float _1276 = -_263;
    int _1278 = _1236 ? as_type<int>(_1276) : as_type<int>(_263);
    float _1280 = floor(_1234);
    int _1282 = ~_1180;
    int _1284 = _1282 + _1250;
    int _1286 = _1284 + 1;
    float _1288 = _1274 * _1202;
    float _1290 = _493 * _1202;
    bool _1292 = !_1260;
    float _1294 = _1292 ? _259 : as_type<float>(_1270);
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _263);
    int _1298 = int(_1244);
    int _1300 = _1228 ? 2 : 0;
    int _1302 = _1298 | _1300;
    int _1304 = _1236 ? 4 : 0;
    int _1306 = _1302 | _1304;
    int _1308 = _1256 ? 8 : 0;
    int _1310 = _1306 | _1308;
    int _1312 = _1260 ? 16 : 0;
    int _1314 = _1310 | _1312;
    int _1316 = _1264 ? 32 : 0;
    int _1318 = _1314 | _1316;
    int _1320 = _1232 ? 64 : 0;
    int _1322 = _1318 | _1320;
    int _1324 = _1322 & 64;
    float _1326 = trunc(_1288);
    int _1328 = int(_1326);
    bool _1330 = !_1264;
    float _1332 = _1330 ? _263 : as_type<float>(_1278);
    int _1334 = _1081 * _1286;
    int _1336 = _1334 + _1137;
    int _1338 = int(_1244);
    int _1340 = _1228 ? 2 : 0;
    int _1342 = _1338 | _1340;
    int _1344 = _1236 ? 4 : 0;
    int _1346 = _1342 | _1344;
    int _1348 = _1256 ? 8 : 0;
    int _1350 = _1346 | _1348;
    int _1352 = _1260 ? 16 : 0;
    int _1354 = _1350 | _1352;
    int _1356 = _1264 ? 32 : 0;
    int _1358 = _1354 | _1356;
    int _1360 = _1232 ? 64 : 0;
    int _1362 = _1358 | _1360;
    int _1364 = _1362 & 4;
    float _1366 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1378 = _1376 != 0;
    float _1380 = fma(_463, _231, _1246);
    bool _1382 = _1081 == 0;
    float _1384 = trunc(_1290);
    int _1386 = int(_1384);
    int _1388 = ~_1240;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = fma(_463, _243, _1252);
    bool _1396 = !_1382;
    int _1398 = _1396 ? _1336 : (-1);
    float _1400 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1402 = _1166 + _1168;
    int _1404 = _1081 + (-1);
    int _1406 = _1398 * _1392;
    bool _1408 = !_1374;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = _1168 + _1170;
    bool _1414 = !_1244;
    int _1416 = _1414 ? 0 : 1;
    int _1418 = _1240 * _1404;
    int _1420 = _1418 + _1406;
    bool _1422 = !_1370;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1428 = abs(_1410);
    float _1430 = _1402 + (-1.0);
    int _1432 = abs(_1416);
    float _1434 = in.m_58.w;
    bool _1436 = !_1378;
    int _1438 = _1436 ? 0 : 1;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1442 = _1069 + _1440;
    int _1444 = abs(_1424);
    float _1446 = in.m_60.w;
    int _1448 = abs(_1438);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1452 = _1450 != 0;
    int _1454 = _1420 * _1428;
    int _1456 = _1328 * _1432;
    int _1458 = _1456 + _1137;
    bool _1460 = !_1452;
    int _1462 = _1460 ? 0 : 1;
    int _1464 = _1386 * _1444;
    int _1466 = _1464 + _1454;
    int _1468 = abs(_1462);
    int _1470 = ~_1081;
    int _1472 = _1470 + 1;
    int _1474 = _1458 * _1448;
    int _1476 = _1474 + _1466;
    int _1478 = ~_1081;
    int _1480 = _1478 + 1;
    bool _1482 = _1172 > 0.5;
    int _1484 = _1328 * _1468;
    int _1486 = _1484 + _1476;
    float _1488 = -_263;
    int _1490 = _1482 ? as_type<int>(_1488) : as_type<int>(_263);
    float _1492 = float(uint(_1486));
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1498 = !_1256;
    float _1500 = _1498 ? _263 : as_type<float>(_1490);
    float _1502 = as_type<float>(_1139) * _1492;
    float _1504 = 1.0 / _1496;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1508 = trunc(_1502);
    float _1510 = precise::max(_1508, 0.0);
    uint _1512 = uint(_1510);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1522 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1506);
    float _1524 = 1.0 / _1516;
    bool _1526 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1528 = isnan(_1069);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1522);
    float _1540 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1542 = _1472 * int(_1512);
    int _1544 = _1542 + _1486;
    float _1546 = fma(_485, _235, _1380);
    float _1548 = 1.0 / _1520;
    float _1550 = float(uint(_1544));
    float _1552 = as_type<float>(_1139) * _1550;
    float _1554 = trunc(_1552);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    int _1560 = int(_1512) + int(_1558);
    int _1562 = _1480 * _1560;
    int _1564 = _1562 + _1486;
    float _1566 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1568 = int(_1566);
    bool _1570 = uint(_1564) >= uint(_1081);
    bool _1572 = !_1570;
    int _1574 = _1572 ? 0 : (-1);
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1578 = _1576 != 0;
    int _1580 = ~_1560;
    int _1582 = _1580 + _1574;
    int _1584 = _1582 + 1;
    bool _1586 = !_1578;
    int _1588 = _1586 ? 0 : 1;
    int _1590 = _1081 * _1584;
    int _1592 = _1590 + _1486;
    float _1594 = float(_1568);
    int _1596 = abs(_1588);
    bool _1598 = !_1382;
    int _1600 = _1598 ? _1592 : (-1);
    float _1602 = 1.0 / _1594;
    int _1604 = _1600 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = _1606 ? 0 : 1;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1624 = _1622 != 0;
    int _1626 = _1600 & 3;
    bool _1628 = _1626 != 0;
    int _1630 = ~_1608;
    int _1632 = _1630 + 1;
    int _1634 = _1632 + 1;
    bool _1636 = !_1616;
    int _1638 = _1636 ? 0 : 1;
    float _1640 = _115 * _1602;
    bool _1642 = uint(_1626) > 1u;
    int _1644 = int(_1612);
    int _1646 = _1642 ? 2 : 0;
    int _1648 = _1644 | _1646;
    int _1650 = _1620 ? 4 : 0;
    int _1652 = _1648 | _1650;
    int _1654 = _1624 ? 8 : 0;
    int _1656 = _1652 | _1654;
    int _1658 = _1628 ? 16 : 0;
    int _1660 = _1656 | _1658;
    int _1662 = _1374 ? 32 : 0;
    int _1664 = _1660 | _1662;
    int _1666 = _1378 ? 64 : 0;
    int _1668 = _1664 | _1666;
    int _1670 = _1668 & 16;
    float _1672 = trunc(_1640);
    int _1674 = int(_1672);
    int _1676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1678 = _1676 != 0;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1682 = _1680 != 0;
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1686 = _1684 != 0;
    bool _1688 = !_1612;
    int _1690 = _1688 ? 0 : 1;
    bool _1692 = !_1620;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = !_1682;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1702 = int(_1700);
    bool _1704 = _1364 != 0;
    int _1706 = _1634;
    float _1708 = _1332;
    if (!_1642)
    {
        int _1710 = ~_1608;
        int _1712 = _1710 + 1;
        _1706 = _1712;
    }
    int _1714 = _1706;
    int _1716 = abs(_1638);
    bool _1718 = !_1624;
    int _1720 = _1718 ? 0 : 1;
    float _1722 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1724 = int(_1722);
    float _1726 = float(uint(_1674));
    int _1728 = abs(_1720);
    int _1730 = abs(_1698);
    float _1732 = float(_1702);
    float _1734 = float(uint(_1724));
    int _1736 = ~_1724;
    int _1738 = _1736 + 1;
    bool _1740 = _1724 == 0;
    float _1742 = 1.0 / _1734;
    int _1744 = as_type<int>(_1742) + (-2);
    int _1746 = ~_1724;
    int _1748 = _1746 + 1;
    float _1750 = as_type<float>(_1744) * _1726;
    float _1752 = trunc(_1750);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    int _1758 = _1738 * int(_1756);
    int _1760 = _1758 + _1674;
    float _1762 = float(uint(_1760));
    float _1764 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1766 = int(_1764);
    float _1768 = as_type<float>(_1744) * _1762;
    float _1770 = trunc(_1768);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    float _1776 = float(uint(_1766));
    int _1778 = ~_1766;
    int _1780 = _1778 + 1;
    float _1782 = 1.0 / _1776;
    int _1784 = int(_1756) + int(_1774);
    int _1786 = _1748 * _1784;
    int _1788 = _1786 + _1674;
    bool _1790 = uint(_1788) >= uint(_1724);
    float _1792 = 1.0 / _1732;
    int _1794 = as_type<int>(_1782) + (-2);
    bool _1796 = !_1790;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = ~_1784;
    int _1802 = _1800 + _1798;
    int _1804 = _1802 + 1;
    float _1806 = _115 * _1792;
    float _1808 = trunc(_1806);
    int _1810 = int(_1808);
    float _1812 = float(uint(_1810));
    float _1814 = as_type<float>(_1794) * _1812;
    float _1816 = trunc(_1814);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    int _1822 = _1780 * int(_1820);
    int _1824 = _1822 + _1810;
    float _1826 = float(uint(_1824));
    float _1828 = as_type<float>(_1794) * _1826;
    int _1830 = ~_1766;
    int _1832 = _1830 + 1;
    float _1834 = trunc(_1828);
    float _1836 = precise::max(_1834, 0.0);
    uint _1838 = uint(_1836);
    int _1840 = int(_1820) + int(_1838);
    float _1842 = float(_1724);
    float _1844 = float(_1674);
    int _1846 = _1832 * _1840;
    int _1848 = _1846 + _1810;
    bool _1850 = _1844 >= _1842;
    bool _1852 = isnan(_1844);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan(_1842);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    bool _1862 = uint(_1848) >= uint(_1766);
    float _1864 = _1196 * _1198;
    float _1866 = trunc(_1860);
    int _1868 = int(_1866);
    bool _1870 = !_1862;
    int _1872 = _1870 ? 0 : (-1);
    int _1874 = ~_1840;
    int _1876 = _1874 + _1872;
    int _1878 = _1876 + 1;
    int _1880 = _1766 + (-1);
    float _1882 = floor(_1864);
    int _1884 = _1766 * _1878;
    int _1886 = _1884 + _1810;
    float _1888 = -_1882;
    float _1890 = _1864 + _1888;
    float _1892 = _1890 * _1842;
    bool _1894 = !_1678;
    int _1896 = _1894 ? 0 : 1;
    float _1898 = _493 * _1842;
    bool _1900 = _1324 != 0;
    int _1902 = _1724 * _1804;
    int _1904 = _1902 + _1674;
    int _1906 = ~_1868;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = trunc(_1892);
    int _1914 = int(_1912);
    bool _1916 = !_1740;
    int _1918 = _1916 ? _1904 : (-1);
    int _1920 = _1724 + (-1);
    float _1922 = trunc(_1898);
    int _1924 = int(_1922);
    int _1926 = _1918 * _1910;
    int _1928 = abs(_1694);
    int _1930 = ~_1724;
    int _1932 = _1930 + 1;
    int _1934 = _1868 * _1920;
    int _1936 = _1934 + _1926;
    int _1938 = abs(_1690);
    int _1940 = _1936 * _1716;
    float _1942 = _1168 * 2.0;
    int _1944 = _1914 * _1596;
    int _1946 = _1944 + _1674;
    int _1948 = _1924 * _1938;
    int _1950 = _1948 + _1940;
    int _1952 = ~_1724;
    int _1954 = _1952 + 1;
    float _1956 = floor(_1942);
    int _1958 = _1946 * _1928;
    int _1960 = _1958 + _1950;
    int _1962 = _1914 * _1728;
    int _1964 = _1962 + _1960;
    float _1966 = float(uint(_1964));
    float _1968 = as_type<float>(_1744) * _1966;
    float _1970 = trunc(_1968);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    float _1976 = float(_1810);
    int _1978 = _1954 * int(_1974);
    int _1980 = _1978 + _1964;
    float _1982 = float(uint(_1980));
    bool _1984 = !_1686;
    int _1986 = _1984 ? 0 : 1;
    float _1988 = as_type<float>(_1744) * _1982;
    int _1990 = abs(_1986);
    float _1992 = trunc(_1988);
    float _1994 = precise::max(_1992, 0.0);
    uint _1996 = uint(_1994);
    int _1998 = int(_1974) + int(_1996);
    float _2000 = _1166 * 2.0;
    int _2002 = _1932 * _1998;
    int _2004 = _2002 + _1964;
    float _2006 = floor(_2000);
    bool _2008 = uint(_2004) >= uint(_1724);
    bool _2010 = !_2008;
    int _2012 = _2010 ? 0 : (-1);
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2016 = _2014 != 0;
    int _2018 = ~_1998;
    int _2020 = _2018 + _2012;
    int _2022 = _2020 + 1;
    bool _2024 = !_2016;
    int _2026 = _2024 ? 0 : 1;
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2030 = _2028 != 0;
    bool _2032 = !_2030;
    int _2034 = _2032 ? 0 : 1;
    bool _2036 = _2006 >= 0.0;
    bool _2038 = isnan(_2006);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan(0.0);
    bool _2044 = _2040 || _2042;
    int _2046 = _2044 ? 0 : 1;
    bool _2048 = _2006 > 0.0;
    int _2050 = ~_2046;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    float _2056 = floor(_1226);
    int _2058 = _2054;
    float _2060 = as_type<float>(_1998);
    if (!_2048)
    {
        int _2062 = ~_2046;
        int _2064 = _2062 + 1;
        _2058 = _2064;
    }
    int _2066 = _2058;
    float _2068 = float(_1766);
    bool _2070 = _1956 >= 0.0;
    bool _2072 = isnan(_1956);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    bool _2080 = _1976 >= _2068;
    bool _2082 = isnan(_1976);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan(_2068);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2056;
    float _2094 = _1226 + _2092;
    int _2096 = _2078 ? 0 : 1;
    bool _2098 = _1956 > 0.0;
    float _2100 = _2094 * _2068;
    float _2102 = trunc(_2090);
    int _2104 = int(_2102);
    int _2106 = ~_2096;
    int _2108 = _2106 + 1;
    int _2110 = _2108 + 1;
    float _2112 = _493 * _2068;
    float _2114 = trunc(_2112);
    int _2116 = int(_2114);
    int _2118 = _2110;
    if (!_2098)
    {
        int _2120 = ~_2096;
        int _2122 = _2120 + 1;
        _2118 = _2122;
    }
    int _2124 = _2118;
    bool _2126 = _1766 == 0;
    int _2128 = ~_2104;
    int _2130 = _2128 + 1;
    int _2132 = _2130 + 1;
    float _2134 = trunc(_2100);
    int _2136 = int(_2134);
    bool _2138 = !_2126;
    int _2140 = _2138 ? _1886 : (-1);
    int _2142 = _2140 * _2132;
    int _2144 = abs(_2026);
    int _2146 = _2104 * _1880;
    int _2148 = _2146 + _2142;
    int _2150 = abs(_1896);
    int _2152 = _2136 * _2144;
    int _2154 = _2152 + _1810;
    int _2156 = _2148 * _1730;
    int _2158 = abs(_2034);
    int _2160 = ~_1766;
    int _2162 = _2160 + 1;
    int _2164 = _2116 * _2150;
    int _2166 = _2164 + _2156;
    int _2168 = ~_1766;
    int _2170 = _2168 + 1;
    float _2172 = -_259;
    int _2174 = _1704 ? as_type<int>(_2172) : as_type<int>(_259);
    int _2176 = _2154 * _1990;
    int _2178 = _2176 + _2166;
    float _2180 = -_263;
    int _2182 = _1900 ? as_type<int>(_2180) : as_type<int>(_263);
    int _2184 = _2136 * _2158;
    int _2186 = _2184 + _2178;
    float _2188 = float(uint(_2186));
    float _2190 = as_type<float>(_1794) * _2188;
    float _2192 = trunc(_2190);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    int _2198 = _2170 * int(_2196);
    int _2200 = _2198 + _2186;
    float _2202 = float(uint(_2200));
    int _2204 = _1724 * _2022;
    int _2206 = _2204 + _1964;
    float _2208 = as_type<float>(_1794) * _2202;
    bool _2210 = !_1740;
    int _2212 = _2210 ? _2206 : (-1);
    float _2214 = trunc(_2208);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    int _2220 = int(_2196) + int(_2218);
    int _2222 = _2162 * _2220;
    int _2224 = _2222 + _2186;
    bool _2226 = uint(_2224) >= uint(_1766);
    bool _2228 = !_2226;
    int _2230 = _2228 ? 0 : (-1);
    int _2232 = _2212 & 3;
    bool _2234 = _2232 != 0;
    int _2236 = ~_2220;
    int _2238 = _2236 + _2230;
    int _2240 = _2238 + 1;
    int _2242 = _2234 ? 0 : 1;
    int _2244 = _1766 * _2240;
    int _2246 = _2244 + _2186;
    bool _2248 = !_2126;
    int _2250 = _2248 ? _2246 : (-1);
    int _2252 = ~_2242;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    int _2258 = _2250 & 3;
    bool _2260 = _2258 != 0;
    int _2262 = _2260 ? 0 : 1;
    int _2264 = _2212 & 3;
    bool _2266 = _2264 != 0;
    bool _2268 = uint(_2264) > 1u;
    int _2270 = _2256;
    if (!_2268)
    {
        int _2272 = ~_2242;
        int _2274 = _2272 + 1;
        _2270 = _2274;
    }
    int _2276 = _2270;
    int _2278 = _2250 & 3;
    bool _2280 = _2278 != 0;
    int _2282 = ~_2262;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    bool _2288 = uint(_2278) > 1u;
    int _2290 = _2286;
    if (!_2288)
    {
        int _2292 = ~_2262;
        int _2294 = _2292 + 1;
        _2290 = _2294;
    }
    int _2296 = _2290;
    bool _2298 = uint(_1626) >= 2u;
    int _2300 = abs(_2296);
    int _2302 = _2298 ? 0 : 1;
    bool _2304 = uint(_2278) >= 2u;
    int _2306 = ~_2302;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2304 ? 0 : 1;
    bool _2314 = _1626 != 3;
    int _2316 = ~_2312;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _2310;
    int _2324 = _2320;
    if (_2314)
    {
        int _2326 = ~_2302;
        int _2328 = _2326 + 1;
        _2322 = _2328;
    }
    int _2330 = _2322;
    bool _2332 = _2278 != 3;
    if (_2332)
    {
        int _2334 = ~_2312;
        int _2336 = _2334 + 1;
        _2324 = _2336;
    }
    int _2338 = _2324;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2342 = _2340 != 0;
    int _2344 = abs(_2338);
    bool _2346 = !_2342;
    int _2348 = _2346 ? 0 : 1;
    bool _2350 = _1166 > 0.5;
    float _2352 = -_259;
    int _2354 = _2350 ? as_type<int>(_2352) : as_type<int>(_259);
    int _2356 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2358 = _2356 != 0;
    bool _2360 = !_2358;
    float _2362 = _2360 ? _263 : as_type<float>(_2182);
    int _2364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2366 = _2364 != 0;
    bool _2368 = !_2366;
    float _2370 = _2368 ? _259 : as_type<float>(_2174);
    float _2372 = float(uint(_1458));
    int _2374 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2376 = _2374 != 0;
    int _2378 = ~_1081;
    int _2380 = _2378 + 1;
    float _2382 = as_type<float>(_1139) * _2372;
    bool _2384 = !_2376;
    float _2386 = _2384 ? _259 : as_type<float>(_2354);
    bool _2388 = _1200 != 2;
    float _2390 = trunc(_2382);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = 0.0;
    if (!_1230)
    {
        _2396 = _1168;
    }
    float _2398 = _2396;
    float _2400 = _2398;
    if (!_1230)
    {
        _2060 = _1170;
    }
    float _2402 = _2060;
    float _2404 = 0.0;
    float _2406 = _2402;
    if (!_1230)
    {
        _2404 = _2398;
    }
    float _2408 = _2404;
    int _2410 = _2380 * int(_2394);
    int _2412 = _2410 + _1458;
    float _2414 = 0.0;
    float _2416 = _2408;
    if (!_1230)
    {
        _2414 = _1170;
    }
    float _2418 = _2414;
    float _2420 = _2418;
    if (_1230)
    {
        _2416 = _1166;
    }
    float _2422 = _2416;
    float _2424 = float(uint(_2412));
    if (_1230)
    {
        _2400 = _1166;
    }
    float _2426 = _2400;
    if (_1230)
    {
        _2406 = _1168;
    }
    float _2428 = _2406;
    float _2430 = as_type<float>(_1139) * _2424;
    if (_1230)
    {
        _2420 = _1168;
    }
    float _2432 = _2420;
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2436 = ~_1081;
    int _2438 = _2436 + 1;
    float _2440 = trunc(_2430);
    float _2442 = precise::max(_2440, 0.0);
    uint _2444 = uint(_2442);
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2448 = _2446 != 0;
    int _2450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2452 = _2450 != 0;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2456 = _2454 != 0;
    int _2458 = ~_1724;
    int _2460 = _2458 + 1;
    bool _2462 = !_2452;
    int _2464 = _2462 ? 0 : 1;
    bool _2466 = _1670 != 0;
    float _2468 = 0.0;
    if (_2388)
    {
        _2468 = _1166;
    }
    float _2470 = _2468;
    float _2472 = 0.0;
    float _2474 = _2470;
    if (_2388)
    {
        _2472 = _1168;
    }
    float _2476 = _2472;
    float _2478 = _2476;
    if (!_2388)
    {
        _2474 = _1170;
    }
    float _2480 = _2474;
    int _2482 = int(_2394) + int(_2444);
    if (!_2388)
    {
        _2478 = _1166;
    }
    float _2484 = _2478;
    int _2486 = ~_1724;
    int _2488 = _2486 + 1;
    int _2490 = _2438 * _2482;
    int _2492 = _2490 + _1458;
    bool _2494 = !_2448;
    int _2496 = _2494 ? 0 : 1;
    int _2498 = abs(_2464);
    bool _2500 = uint(_2492) >= uint(_1081);
    float _2502 = float(uint(_1946));
    bool _2504 = !_2500;
    int _2506 = _2504 ? 0 : (-1);
    int _2508 = abs(_2496);
    float _2510 = as_type<float>(_1744) * _2502;
    bool _2512 = !_2456;
    int _2514 = _2512 ? 0 : 1;
    int _2516 = ~_2482;
    int _2518 = _2516 + _2506;
    int _2520 = _2518 + 1;
    float _2522 = trunc(_2510);
    float _2524 = precise::max(_2522, 0.0);
    uint _2526 = uint(_2524);
    float _2528 = float(uint(_2154));
    float _2530 = as_type<float>(_1794) * _2528;
    int _2532 = _2488 * int(_2526);
    int _2534 = _2532 + _1946;
    float _2536 = float(uint(_2534));
    float _2538 = as_type<float>(_1744) * _2536;
    float _2540 = trunc(_2530);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = trunc(_2538);
    float _2548 = precise::max(_2546, 0.0);
    uint _2550 = uint(_2548);
    float _2552 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2554 = log2(_2552);
    int _2556 = int(_2526) + int(_2550);
    int _2558 = ~_1766;
    int _2560 = _2558 + 1;
    int _2562 = _2460 * _2556;
    int _2564 = _2562 + _1946;
    int _2566 = _2560 * int(_2544);
    int _2568 = _2566 + _2154;
    bool _2570 = uint(_2564) >= uint(_1724);
    float _2572 = float(uint(_2568));
    bool _2574 = !_2280;
    int _2576 = _2574 ? 0 : 1;
    bool _2578 = _2278 != 3;
    float _2580 = as_type<float>(_1794) * _2572;
    int _2582 = ~_1766;
    int _2584 = _2582 + 1;
    bool _2586 = !_2570;
    int _2588 = _2586 ? 0 : (-1);
    float _2590 = trunc(_2580);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    float _2596 = _115 * _2554;
    float _2598 = exp2(_2596);
    int _2600 = int(_2544) + int(_2594);
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2604 = 1.0 + _2602;
    int _2606 = _2584 * _2600;
    int _2608 = _2606 + _2154;
    bool _2610 = !_2578;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = 1.0 / _2604;
    bool _2616 = _1280 >= 0.0;
    bool _2618 = isnan(_1280);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan(0.0);
    bool _2624 = _2620 || _2622;
    bool _2626 = uint(_2608) >= uint(_1766);
    int _2628 = _2624 ? 0 : 1;
    float _2630 = -_2598;
    float _2632 = _2630 + 1.0;
    bool _2634 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2636 = isnan(0.0);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2642 = _2638 || _2640;
    bool _2644 = !_2626;
    int _2646 = _2644 ? 0 : (-1);
    float _2648 = _2642 ? _2632 : 0.0;
    bool _2650 = _1280 > 0.0;
    bool _2652 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2654 = isnan(1.0);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2660 = _2656 || _2658;
    float _2662 = _2648 * _2614;
    int _2664 = ~_2628;
    int _2666 = _2664 + 1;
    int _2668 = _2666 + 1;
    int _2670 = ~_2600;
    int _2672 = _2670 + _2646;
    int _2674 = _2672 + 1;
    bool _2676 = !_2660;
    float _2678 = _2676 ? _115 : _2662;
    int _2680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2682 = _2680 != 0;
    int _2684 = _1766 * _2674;
    int _2686 = _2684 + _2154;
    bool _2688 = !_2466;
    int _2690 = _2688 ? 0 : 1;
    int _2692 = _2668;
    if (!_2650)
    {
        int _2694 = ~_2628;
        int _2696 = _2694 + 1;
        _2692 = _2696;
    }
    int _2698 = _2692;
    float _2700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _259);
    int _2702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2704 = _2702 != 0;
    float _2706 = _455 * _217;
    float _2708 = _1366 * _2700;
    float _2710 = fma(_463, _215, _2706);
    float _2712 = _1266 * _1296;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2720 = _1166 + _1170;
    bool _2722 = !_2126;
    int _2724 = _2722 ? _2686 : (-1);
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2728 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2718);
    float _2730 = 1.0 / _2716;
    float _2732 = _1168 + (-0.5);
    float _2734 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2726);
    float _2736 = _1166 + (-0.5);
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2740 = _1170 + (-0.5);
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2744 = _2720 + (-1.0);
    float _2746 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2738);
    float _2748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2750 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2752 = _2750 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2754 = fma(_1426, -2.0, _2742);
    float _2756 = -_2748;
    float _2758 = fma(_1400, 2.0, _2756);
    float _2760 = fma(_485, _219, _2710);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2764 = _2762 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2766 = fma(_485, _247, _1394);
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2768;
    float _2772 = 1.0 / _2752;
    float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2776 = _2774 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2778 = -_115;
    float _2780 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2758);
    float _2782 = _2770 * _1504;
    float _2784 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2786 = _2784 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2788 = _2776 * _2730;
    float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2790;
    float _2794 = fma(_2782, _1442, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2796 = 1.0 / _2764;
    float _2798 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2800 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2798;
    float _2802 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2804 = _2802 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2806 = _1546 + _1446;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2810 = _1069 + _2808;
    float _2812 = _2800 * _1548;
    bool _2814 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2816 = isnan(_1069);
    bool _2818 = _2814 || _2816;
    bool _2820 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2822 = _2818 || _2820;
    float _2824 = float(_2822);
    float _2826 = _2804 * _1524;
    float _2828 = 1.0 / _2786;
    float _2830 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2832 = _2830 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2834 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2836 = isnan(_1069);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2842 = _2838 || _2840;
    float _2844 = float(_2842);
    float _2846 = _2792 * _2772;
    float _2848 = fma(_2826, _2810, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2850 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2852 = isnan(_1069);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2858 = _2854 || _2856;
    float _2860 = float(_2858);
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2864 = _1069 + _2862;
    float _2866 = _2832 * _2796;
    float _2868 = -_2844;
    float _2870 = _2868 + 1.0;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2874 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2872;
    float _2876 = -_2860;
    float _2878 = _2876 + 1.0;
    float _2880 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2754);
    float _2882 = _2824 * _2870;
    bool _2884 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2886 = isnan(_1069);
    bool _2888 = _2884 || _2886;
    bool _2890 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2892 = _2888 || _2890;
    float _2894 = float(_2892);
    float _2896 = -_2824;
    float _2898 = _2896 + 1.0;
    float _2900 = _2874 * _2828;
    bool _2902 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2904 = isnan(_1069);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2910 = _2906 || _2908;
    float _2912 = float(_2910);
    float _2914 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2728);
    float _2916 = -_2894;
    float _2918 = _2916 + 1.0;
    float _2920 = _2860 * _2898;
    float _2922 = _2894 * _2878;
    float _2924 = -_2912;
    float _2926 = _2924 + 1.0;
    float _2928 = _2912 * _2918;
    bool _2930 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2932 = isnan(_1069);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2938 = _2934 || _2936;
    float _2940 = float(_2938);
    float _2942 = in.m_62.w;
    float _2944 = _1536 * _2926;
    bool _2946 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2948 = isnan(_1069);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2954 = _2950 || _2952;
    float _2956 = float(_2954);
    float _2958 = -_1536;
    float _2960 = _2958 + 1.0;
    float _2962 = -_2940;
    float _2964 = _2962 + 1.0;
    float _2966 = _1412 + (-1.0);
    float _2968 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2970 = _2940 * _2960;
    float _2972 = _2956 * _2964;
    float _2974 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2976 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2978 = _1069 + _2976;
    float _2980 = -_2956;
    float _2982 = _2980 + 1.0;
    float _2984 = _2794 * _2972;
    float _2986 = _2760 + _1434;
    float _2988 = fma(_2788, _2978, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2990 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2992 = _1069 + _2990;
    float _2994 = fma(_2982, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2984);
    bool _2996 = uint(_2264) >= 2u;
    float _2998 = fma(_2812, _2992, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3000 = fma(_2988, _2970, _2994);
    float _3002 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3004 = _1069 + _3002;
    float _3006 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3008 = _1069 + _3006;
    float _3010 = fma(_2866, _2864, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3012 = fma(_2998, _2944, _3000);
    float _3014 = fma(_2846, _3004, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3016 = _2386 + 0.5;
    float _3018 = _2362 + (-0.5);
    float _3020 = fma(_2848, _2928, _3012);
    float _3022 = fma(_2900, _3008, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3024 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2780);
    float _3026 = -_3018;
    float _3028 = -_2880;
    float _3030 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3028);
    float _3032 = fma(_3014, _2922, _3020);
    float _3034 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3036 = fma(_3010, _2920, _3032);
    float _3038 = in.m_70.x;
    float _3040 = in.m_70.y;
    float _3042 = in.m_70.z;
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3046 = fma(_3022, _2882, _3036);
    float _3048 = float(_2698);
    float _3050 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3052 = -_3044;
    float _3054 = fma(_3034, 2.0, _3052);
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3058 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3050);
    float _3060 = float(_2508);
    float _3062 = fma(_2426, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3056);
    float _3064 = _2766 + _2942;
    float _3066 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3068 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3058);
    float _3070 = _3060 * _3048;
    float _3072 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3074 = float(_2066);
    float _3076 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3062);
    float _3078 = _3070 * (-2.0);
    float _3080 = -_3066;
    float _3082 = fma(_3072, 2.0, _3080);
    float _3084 = -_3076;
    float _3086 = _3084 + 1.0;
    float _3088 = fma(_1540, _3078, _1540);
    float _3090 = fma(_3078, _3038, _3038);
    float _3092 = float(_2498);
    float _3094 = -_115;
    float _3096 = fma(_3094, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3082);
    int _3098 = abs(_2514);
    float _3100 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3090);
    float _3102 = _3092 * _3074;
    float _3104 = -_3068;
    float _3106 = _3104 + 1.0;
    float _3108 = fma(_2678, _3088, _3100);
    float _3110 = float(_2124);
    float _3112 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3114 = float(_3098);
    float _3116 = _3102 * (-2.0);
    float _3118 = _3108 * 0.15915493667125701904296875;
    float _3120 = fma(_2434, -2.0, _3112);
    float _3122 = _3114 * _3110;
    float _3124 = fma(_3116, _3040, _3040);
    float _3126 = fma(_2974, _3116, _2974);
    float _3128 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3120);
    float _3130 = _3122 * (-2.0);
    float _3132 = fma(_2732, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3124);
    float _3134 = _3118 * 6.283185482025146484375;
    float _3136 = sin(_3134);
    float _3138 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3140 = fma(_3130, _3042, _3042);
    float _3142 = fma(_2968, _3130, _2968);
    float _3144 = fma(_2678, _3126, _3132);
    float _3146 = _2370 + 0.5;
    float _3148 = fma(_2740, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3140);
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3152 = _3144 * 0.15915493667125701904296875;
    float _3154 = fma(_3146, (*spvDescriptorSet0.vp_c9)._m0[85].x, _3096);
    float _3156 = fma(_2678, _3142, _3148);
    float _3158 = _1500 + (-0.5);
    float _3160 = -_1538;
    float _3162 = _3160 + 1.0;
    float _3164 = _3118 * 6.283185482025146484375;
    float _3166 = cos(_3164);
    float _3168 = _3156 * 0.15915493667125701904296875;
    float _3170 = -_3086;
    float _3172 = fma(_2370, _3170, _3154);
    int _3174 = ~_2556;
    int _3176 = _3174 + _2588;
    int _3178 = _3176 + 1;
    float _3180 = -_3158;
    float _3182 = -_3128;
    float _3184 = fma(_3180, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3182);
    int _3186 = _2250 >> 31;
    float _3188 = fma(_2362, _3162, _3030);
    float _3190 = -_2914;
    float _3192 = _3190 + 1.0;
    float _3194 = _3152 * 6.283185482025146484375;
    float _3196 = sin(_3194);
    int _3198 = _3186 & 3;
    float _3200 = fma(_1500, _3106, _3184);
    float _3202 = -_3192;
    float _3204 = fma(_2386, _3202, _3024);
    int _3206 = _1081 * _2520;
    int _3208 = _3206 + _1458;
    int _3210 = _2250 + _3198;
    int _3212 = _1724 * _3178;
    int _3214 = _3212 + _1946;
    float _3216 = fma(_3138, -2.0, _3150);
    float _3218 = _3152 * 6.283185482025146484375;
    float _3220 = cos(_3218);
    out.m_72.x = _3204;
    out.m_72.y = _3188;
    out.m_72.z = _3172;
    out.m_72.w = _3200;
    float _3222 = fma(_2844, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3046);
    out.m_74.x = _3222;
    float _3224 = _3168 * 6.283185482025146484375;
    float _3226 = cos(_3224);
    float _3228 = _3136 * _3196;
    int _3230 = _3210 >> 2;
    float _3232 = _3168 * 6.283185482025146484375;
    float _3234 = sin(_3232);
    float _3236 = _3136 * _3220;
    float _3238 = _3166 * _3196;
    int _3240 = _3230 << 4;
    int _3242 = _3240 + 656;
    float _3244 = _3166 * _3220;
    float _3246 = _3136 * _3226;
    float _3248 = _3220 * _3226;
    float _3250 = _3166 * _3226;
    float _3252 = _3196 * _3226;
    float _3254 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3256 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3258 = -_3238;
    float _3260 = fma(_3234, _3236, _3258);
    float _3262 = -_3236;
    float _3264 = fma(_3234, _3238, _3262);
    float _3266 = -_2712;
    float _3268 = _3234 * _3266;
    uint _3270 = uint(int(uint(_3242) >> uint(2)));
    uint _3272 = uint(int(uint(int(_3270)) >> uint(2)));
    int _3274 = int(_3270) & 3;
    float _3276 = (*spvDescriptorSet0.vp_c9)._m0[int(_3272)][_3274];
    int _3278 = int(_3270) + 1;
    uint _3280 = uint(int(uint(_3278) >> uint(2)));
    int _3282 = _3278 & 3;
    float _3284 = (*spvDescriptorSet0.vp_c9)._m0[int(_3280)][_3282];
    float _3286 = fma(_3234, _3244, _3228);
    float _3288 = fma(_3234, _3228, _3244);
    float _3290 = fma(_3248, _2708, _3268);
    float _3292 = _3246 * _2712;
    float _3294 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3296 = _3250 * _2712;
    float _3298 = -_3234;
    float _3300 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3254);
    float _3302 = fma(_3260, _2708, _3292);
    float _3304 = -_3234;
    float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3294);
    int _3308 = _3242 + 8;
    uint _3310 = uint(int(uint(_3308) >> uint(2)));
    uint _3312 = uint(int(uint(int(_3310)) >> uint(2)));
    int _3314 = int(_3310) & 3;
    float _3316 = (*spvDescriptorSet0.vp_c9)._m0[int(_3312)][_3314];
    int _3318 = int(_3310) + 1;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    int _3322 = _3318 & 3;
    float _3324 = (*spvDescriptorSet0.vp_c9)._m0[int(_3320)][_3322];
    float _3326 = -_3234;
    float _3328 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3256);
    float _3330 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3332 = fma(_3286, _2708, _3296);
    float _3334 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3336 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3338 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3330);
    float _3340 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3328);
    float _3342 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3344 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3334);
    float _3346 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3336);
    float _3348 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3306);
    float _3350 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3352 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3354 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3356 = fma(_3264, _3342, _3332);
    float _3358 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3350);
    float _3360 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3352);
    float _3362 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3354);
    float _3364 = fma(_3252, _3342, _3290);
    float _3366 = _3356 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3368 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3358);
    float _3370 = fma(_3288, _3342, _3302);
    float _3372 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3360);
    float _3374 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3362);
    float _3376 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3366);
    float _3378 = _3356 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3380 = _1600 >> 31;
    float _3382 = fma(_3370, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3376);
    int _3384 = abs(_2576);
    float _3386 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3378);
    int _3388 = ~_2300;
    int _3390 = _3388 + 1;
    int _3392 = _3390 + 1;
    float _3394 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3300);
    int _3396 = _3380 & 3;
    float _3398 = fma(_3370, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3386);
    int _3400 = ~_3384;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    float _3406 = _3356 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3408 = _3392 * as_type<int>(_3284);
    int _3410 = _1600 + _3396;
    float _3412 = _263 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3414 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3416 = int(_3414);
    int _3418 = _3404 * as_type<int>(_3276);
    int _3420 = _3418 + _3408;
    float _3422 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3406);
    int _3424 = _2212 >> 31;
    float _3426 = _3412 * _3340;
    int _3428 = ~_2344;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    float _3434 = fma(_3370, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3422);
    int _3436 = _3424 & 3;
    float _3438 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3440 = abs(_2612);
    int _3442 = _3432 * as_type<int>(_3316);
    int _3444 = _3442 + _3420;
    float _3446 = _3382 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3448 = _3064 + _3438;
    int _3450 = abs(_2348);
    float _3452 = _3412 * _3394;
    float _3454 = _2986 + _3446;
    int _3456 = ~_3440;
    int _3458 = _3456 + 1;
    int _3460 = _3458 + 1;
    float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3464 = _3448 + _3462;
    int _3466 = abs(_3416);
    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3470 = _3454 + _3468;
    int _3472 = _2212 + _3436;
    float _3474 = _3464 * _3464;
    int _3476 = ~_3450;
    int _3478 = _3476 + 1;
    int _3480 = _3478 + 1;
    float _3482 = _3470 * _3470;
    float _3484 = float(uint(_3466));
    int _3486 = _3460 * as_type<int>(_3324);
    int _3488 = _3486 + _3444;
    int _3490 = _3472 >> 2;
    float _3492 = _3482 + _3474;
    float _3494 = 1.0 / _3484;
    int _3496 = _3488 * _3480;
    int _3498 = _3410 >> 2;
    float _3500 = _259 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3502 = _3412 * _3348;
    int _3504 = _2724 * _3450;
    int _3506 = _3504 + _3496;
    int _3508 = _3498 << 4;
    int _3510 = _3508 + 368;
    float _3512 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3344);
    float _3514 = sqrt(_3492);
    int _3516 = _3490 << 4;
    int _3518 = _3516 + 512;
    float _3520 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3338);
    float _3522 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3346);
    float _3524 = fma(_3500, _3512, _3502);
    int _3526 = abs(_3506);
    float _3528 = fma(_3500, _3520, _3452);
    float _3530 = float(uint(_3416));
    float _3532 = fma(_3500, _3522, _3426);
    uint _3534 = uint(int(uint(_3518) >> uint(2)));
    uint _3536 = uint(int(uint(int(_3534)) >> uint(2)));
    int _3538 = int(_3534) & 3;
    float _3540 = (*spvDescriptorSet0.vp_c9)._m0[int(_3536)][_3538];
    int _3542 = int(_3534) + 1;
    uint _3544 = uint(int(uint(_3542) >> uint(2)));
    int _3546 = _3542 & 3;
    float _3548 = (*spvDescriptorSet0.vp_c9)._m0[int(_3544)][_3546];
    float _3550 = _3434 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3552 = as_type<int>(_3494) + (-2);
    float _3554 = 1.0 / _3530;
    int _3556 = _2996 ? 0 : 1;
    float _3558 = _2806 + _3550;
    bool _3560 = !_2266;
    int _3562 = _3560 ? 0 : 1;
    int _3564 = _3518 + 8;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    uint _3568 = uint(int(uint(int(_3566)) >> uint(2)));
    int _3570 = int(_3566) & 3;
    float _3572 = (*spvDescriptorSet0.vp_c9)._m0[int(_3568)][_3570];
    int _3574 = int(_3566) + 1;
    uint _3576 = uint(int(uint(_3574) >> uint(2)));
    int _3578 = _3574 & 3;
    float _3580 = (*spvDescriptorSet0.vp_c9)._m0[int(_3576)][_3578];
    bool _3582 = _3514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _3584 = _1626 != 3;
    int _3586 = ~_3556;
    int _3588 = _3586 + 1;
    int _3590 = _3588 + 1;
    bool _3592 = _2264 != 3;
    uint _3594 = uint(int(uint(_3510) >> uint(2)));
    uint _3596 = uint(int(uint(int(_3594)) >> uint(2)));
    int _3598 = int(_3594) & 3;
    float _3600 = (*spvDescriptorSet0.vp_c9)._m0[int(_3596)][_3598];
    int _3602 = int(_3594) + 1;
    uint _3604 = uint(int(uint(_3602) >> uint(2)));
    int _3606 = _3602 & 3;
    float _3608 = (*spvDescriptorSet0.vp_c9)._m0[int(_3604)][_3606];
    float _3610 = float(uint(_3526));
    int _3612 = as_type<int>(_3554) + (-2);
    float _3614 = as_type<float>(_3552) * _3610;
    float _3616 = _3554;
    float _3618 = _3550;
    float _3620 = _3610;
    float _3622 = _3500;
    float _3624 = as_type<float>(_3510);
    int _3626 = _3590;
    float _3628 = _3374;
    float _3630 = _3520;
    if (!_3582)
    {
        _3616 = _3474;
    }
    float _3632 = _3616;
    int _3634 = _3510 + 8;
    uint _3636 = uint(int(uint(_3634) >> uint(2)));
    uint _3638 = uint(int(uint(int(_3636)) >> uint(2)));
    int _3640 = int(_3636) & 3;
    float _3642 = (*spvDescriptorSet0.vp_c9)._m0[int(_3638)][_3640];
    int _3644 = int(_3636) + 1;
    uint _3646 = uint(int(uint(_3644) >> uint(2)));
    int _3648 = _3644 & 3;
    float _3650 = (*spvDescriptorSet0.vp_c9)._m0[int(_3646)][_3648];
    float _3652 = _3632;
    if (!_3582)
    {
        _3618 = _3482;
    }
    float _3654 = _3618;
    float _3656 = _3654;
    if (!_3582)
    {
        _3620 = _3448;
    }
    float _3658 = _3620;
    float _3660 = trunc(_3614);
    float _3662 = precise::max(_3660, 0.0);
    uint _3664 = uint(_3662);
    float _3666 = _3658;
    if (!_3582)
    {
        _3622 = _3558;
    }
    float _3668 = _3622;
    float _3670 = _3668;
    if (!_3582)
    {
        _3624 = _3454;
    }
    float _3672 = _3624;
    float _3674 = float(uint(_3506));
    float _3676 = as_type<float>(_3612) * _3674;
    bool _3678 = !_3582;
    float _3680 = _3672;
    if (!_3678)
    {
        float _3682 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3684 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3686 = _3514 + _3684;
        float _3688 = rsqrt(_3492);
        float _3690 = _3686 * _3682;
        float _3692 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3694 = _3690 * 0.15915493667125701904296875;
        float _3696 = _3694 * 6.283185482025146484375;
        float _3698 = sin(_3696);
        float _3700 = _3694 * 6.283185482025146484375;
        float _3702 = cos(_3700);
        float _3704 = fma(_3698, _3692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3706 = _3688 * _3704;
        float _3708 = _3702 + (-1.0);
        float _3710 = fma(_3470, _3706, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3712 = fma(_3464, _3706, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3714 = _3708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3716 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3718 = _3710 + _3716;
        float _3720 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3722 = _3712 + _3720;
        float _3724 = fma(_3558, _3702, _3714);
        float _3726 = _3718 * _3718;
        float _3728 = _3722 * _3722;
        _3670 = _3724;
        _3656 = _3726;
        _3652 = _3728;
        _3680 = _3710;
        _3666 = _3712;
    }
    float _3730 = _3670;
    float _3732 = _3656;
    float _3734 = _3652;
    float _3736 = _3680;
    float _3738 = _3666;
    float _3740 = trunc(_3676);
    float _3742 = precise::max(_3740, 0.0);
    uint _3744 = uint(_3742);
    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3748 = _3730 + _3746;
    int _3750 = abs(_1714);
    float _3752 = -_115;
    float _3754 = fma(_3752, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3054);
    int _3756 = ~_3416;
    int _3758 = _3756 + 1;
    float _3760 = fma(_3748, _3748, _3732);
    int _3762 = abs(_2276);
    float _3764 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2734);
    out.m_76.x = _3512;
    out.m_76.y = _3520;
    out.m_76.z = _3522;
    int _3766 = abs(_2690);
    float _3768 = -_3764;
    float _3770 = _3768 + 1.0;
    if (_3592)
    {
        int _3772 = ~_3556;
        int _3774 = _3772 + 1;
        _3626 = _3774;
    }
    int _3776 = _3626;
    int _3778 = ~_3466;
    int _3780 = _3778 + 1;
    int _3782 = _3758 * int(_3744);
    int _3784 = _3782 + _3506;
    int _3786 = ~_3750;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    int _3792 = ~_3766;
    int _3794 = _3792 + 1;
    int _3796 = _3794 + 1;
    int _3798 = _3780 * int(_3664);
    int _3800 = _3798 + _3526;
    float _3802 = float(uint(_3784));
    int _3804 = _3790 * as_type<int>(_3608);
    int _3806 = abs(_3562);
    float _3808 = float(uint(_3800));
    float _3810 = as_type<float>(_3612) * _3802;
    int _3812 = ~_3762;
    int _3814 = _3812 + 1;
    int _3816 = _3814 + 1;
    int _3818 = _3796 * as_type<int>(_3600);
    int _3820 = _3818 + _3804;
    int _3822 = abs(_3776);
    float _3824 = as_type<float>(_3552) * _3808;
    int _3826 = abs(_2330);
    float _3828 = trunc(_3810);
    float _3830 = precise::max(_3828, 0.0);
    uint _3832 = uint(_3830);
    int _3834 = ~_3806;
    int _3836 = _3834 + 1;
    int _3838 = _3836 + 1;
    int _3840 = _3816 * as_type<int>(_3548);
    bool _3842 = !_3584;
    int _3844 = _3842 ? 0 : (-1);
    int _3846 = _3838 * as_type<int>(_3540);
    int _3848 = _3846 + _3840;
    int _3850 = ~_3822;
    int _3852 = _3850 + 1;
    int _3854 = _3852 + 1;
    float _3856 = trunc(_3824);
    float _3858 = precise::max(_3856, 0.0);
    uint _3860 = uint(_3858);
    bool _3862 = _2264 != 3;
    int _3864 = abs(_3844);
    int _3866 = _3854 * as_type<int>(_3572);
    int _3868 = _3866 + _3848;
    int _3870 = ~_3826;
    int _3872 = _3870 + 1;
    int _3874 = _3872 + 1;
    float _3876 = _3760 + _3734;
    bool _3878 = !_3862;
    int _3880 = _3878 ? 0 : (-1);
    int _3882 = ~_3416;
    int _3884 = _3882 + 1;
    int _3886 = _3874 * as_type<int>(_3642);
    int _3888 = _3886 + _3820;
    int _3890 = int(_3744) + int(_3832);
    float _3892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3894 = ~_3466;
    int _3896 = _3894 + 1;
    int _3898 = abs(_3880);
    int _3900 = _3884 * _3890;
    int _3902 = _3900 + _3506;
    int _3904 = int(_3664) + int(_3860);
    int _3906 = ~_3898;
    int _3908 = _3906 + 1;
    int _3910 = _3908 + 1;
    float _3912 = sqrt(_3876);
    int _3914 = _3896 * _3904;
    int _3916 = _3914 + _3526;
    bool _3918 = !_2682;
    int _3920 = _3918 ? 0 : 1;
    int _3922 = _3910 * as_type<int>(_3580);
    int _3924 = _3922 + _3868;
    bool _3926 = uint(_3902) >= uint(_3416);
    int _3928 = ~_3864;
    int _3930 = _3928 + 1;
    int _3932 = _3930 + 1;
    bool _3934 = uint(_3916) >= uint(_3466);
    int _3936 = _3506 ^ _3416;
    int _3938 = _3932 * as_type<int>(_3650);
    int _3940 = _3938 + _3888;
    bool _3942 = !_3926;
    int _3944 = _3942 ? 0 : (-1);
    int _3946 = abs(_3920);
    float _3948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3950 = !_3934;
    int _3952 = _3950 ? 0 : (-1);
    uint _3954 = uint(int(uint(_3936) >> uint(31)));
    bool _3956 = !_2704;
    int _3958 = _3956 ? 0 : 1;
    int _3960 = ~_3890;
    int _3962 = _3960 + _3944;
    int _3964 = _3962 + 1;
    int _3966 = ~_3952;
    int _3968 = _3904 + _3966;
    int _3970 = _3968 + 1;
    int _3972 = ~int(_3954);
    int _3974 = _3972 + 1;
    int _3976 = _3416 * _3964;
    int _3978 = _3976 + _3506;
    int _3980 = abs(_3958);
    bool _3982 = _3416 == 0;
    bool _3984 = _3416 == 0;
    float _3986 = fma(_3412, _3412, 1.0);
    int _3988 = _3970 ^ _3974;
    int _3990 = ~_3980;
    int _3992 = _3990 + 1;
    int _3994 = _3992 + 1;
    int _3996 = ~_3946;
    int _3998 = _3996 + 1;
    int _4000 = _3998 + 1;
    float _4002 = rsqrt(_3986);
    bool _4004 = _1081 == 0;
    int _4006 = _3940 * _3994;
    int _4008 = ~_3974;
    int _4010 = _4008 + _3988;
    int _4012 = _4010 + 1;
    float _4014 = _3948 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _4016 = !_3982;
    int _4018 = _4016 ? _3978 : (-1);
    int _4020 = _3924 * _4000;
    bool _4022 = !_3984;
    int _4024 = _4022 ? _4012 : (-1);
    float _4026 = _3892 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4028 = float(_4018);
    bool _4030 = _1724 == 0;
    float _4032 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3216);
    bool _4034 = !_4004;
    int _4036 = _4034 ? _3208 : (-1);
    float _4038 = fma(_4026, _4028, _3754);
    float _4040 = float(_4024);
    float _4042 = _1294 + 0.5;
    bool _4044 = !_4030;
    int _4046 = _4044 ? _3214 : (-1);
    int _4048 = _4036 * _3980;
    int _4050 = _4048 + _4006;
    float _4052 = _1332 + (-0.5);
    float _4054 = -_4032;
    float _4056 = fma(_4014, _4040, _4054);
    float _4058 = fma(_4026, _4042, _4038);
    int _4060 = _4046 * _3946;
    int _4062 = _4060 + _4020;
    float _4064 = _3412 * _4002;
    float _4066 = -_4014;
    float _4068 = fma(_4066, _4052, _4056);
    float _4070 = -_3770;
    float _4072 = fma(_1294, _4070, _4058);
    float _4074 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2746);
    float _4076 = -_3368;
    float _4078 = _4064 * _4076;
    float _4080 = -_3372;
    float _4082 = _4064 * _4080;
    float _4084 = -_3374;
    float _4086 = _4064 * _4084;
    float _4088 = -_4074;
    float _4090 = _4088 + 1.0;
    float _4092 = fma(_4002, _3348, _4078);
    float _4094 = fma(_4002, _3394, _4082);
    float _4096 = fma(_4002, _3340, _4086);
    float _4098 = _3368 + _3524;
    float _4100 = _3372 + _3528;
    float _4102 = _3374 + _3532;
    float _4104 = float(_4050);
    float _4106 = fma(_1332, _4090, _4068);
    float _4108 = float(_4062);
    out.m_78.x = _4092;
    out.m_78.y = _4094;
    out.m_78.z = _4096;
    bool _4110 = _3912 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4112 = isnan(_3912);
    bool _4114 = _4110 || _4112;
    bool _4116 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4118 = _4114 || _4116;
    out.m_80.x = _4098;
    out.m_80.y = _4100;
    out.m_80.z = _4102;
    out.m_82.x = _4104;
    out.m_82.y = _4108;
    out.m_84.x = _4072;
    out.m_84.y = _4106;
    float _4120 = _4090;
    if (!_4118)
    {
        _3628 = 1.0;
    }
    float _4122 = _3628;
    bool _4124 = !_4118;
    float _4126 = _4122;
    if (!_4124)
    {
        bool _4128 = _3912 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4130 = isnan(_3912);
        bool _4132 = _4128 || _4130;
        bool _4134 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4136 = _4132 || _4134;
        if (!_4136)
        {
            float _4138 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4140 = _3912 + _4138;
            float _4142 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4144 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4142;
            float _4146 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4148 = _4146 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4150 = 1.0 / _4144;
            float _4152 = _4140 * _4150;
            float _4154 = fma(_4152, _4148, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4126 = _4154;
            _3630 = _4150;
            _4156 = true;
        }
        else
        {
            bool _4158 = _3912 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4160 = isnan(_3912);
            bool _4162 = _4158 || _4160;
            bool _4164 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4166 = _4162 || _4164;
            if (!_4166)
            {
                float _4168 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4170 = _3912 + _4168;
                float _4172 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4174 = _4172 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4176 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4178 = _4176 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4180 = 1.0 / _4174;
                float _4182 = _4170 * _4180;
                float _4184 = fma(_4182, _4178, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4126 = _4184;
                _3630 = _4180;
                _4156 = true;
            }
            else
            {
                _4126 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4156 = false;
    float _4186 = _4126;
    float _4188 = _3630;
    float _4190 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4192 = _3730 + _4190;
    float _4194 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4196 = _3736 + _4194;
    float _4198 = fma(_4192, _4186, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4200 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4202 = _3738 + _4200;
    float _4204 = fma(_4196, _4186, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4206 = -_2806;
    float _4208 = _4206 + _4198;
    float _4210 = fma(_4202, _4186, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4212 = -_2986;
    float _4214 = _4212 + _4204;
    float _4216 = _4208 * _4208;
    float _4218 = -_3064;
    float _4220 = _4218 + _4210;
    float _4222 = fma(_4214, _4214, _4216);
    float _4224 = fma(_4220, _4220, _4222);
    float _4226 = sqrt(_4224);
    bool _4228 = _4226 > 0.0;
    float _4230 = _4186;
    float _4232 = _4226;
    float _4234 = _4188;
    float _4236 = _4202;
    if (!_4228)
    {
        _4230 = _4204;
    }
    float _4238 = _4230;
    float _4240 = _4238;
    float _4242 = _4238;
    float _4244 = _4238;
    if (!_4228)
    {
        _4232 = _4198;
    }
    float _4246 = _4232;
    float _4248 = _4246;
    float _4250 = _4246;
    float _4252 = _4246;
    if (!_4228)
    {
        _4234 = _4210;
    }
    float _4254 = _4234;
    bool _4256 = !_4228;
    float _4258 = _4254;
    if (!_4256)
    {
        bool _4260 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4262 = _4254;
        if (_4260)
        {
            float _4264 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4262 = _4264;
        }
        float _4266 = _4262;
        float _4268 = _4266;
        if (_4260)
        {
            float _4270 = _487 * _4266;
            _4120 = _4270;
        }
        float _4272 = _4120;
        float _4274 = _4272;
        if (_4260)
        {
            float _4276 = _489 * _4266;
            _1708 = _4276;
        }
        float _4278 = _1708;
        float _4280 = _4278;
        if (_4260)
        {
            float _4282 = _491 * _4266;
            _4236 = _4282;
        }
        float _4284 = _4236;
        float _4286 = _4284;
        if (!_4260)
        {
            bool _4288 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4290 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4292 = _4288 || _4290;
            bool _4294 = isnan(1.0);
            bool _4296 = _4292 || _4294;
            float _4298 = _115 + 1.0;
            float _4300 = _4298;
            if (!_4296)
            {
                float _4302 = _4298 * _4298;
                float _4304 = _4302 * 0.5;
                _4248 = _4304;
            }
            float _4306 = _4248;
            float _4308 = _4306;
            if (!_4296)
            {
                float _4310 = _4306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4308 = _4310;
            }
            float _4312 = _4308;
            bool _4314 = !_4296;
            float _4316 = _4312;
            if (!_4314)
            {
                float _4318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4320 = log2(_4318);
                float _4322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4324 = _4322 + 1.0;
                float _4326 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4328 = _4320 * _4298;
                float _4330 = 1.0 / _4324;
                float _4332 = _4326 * 0.693147182464599609375;
                float _4334 = exp2(_4328);
                float _4336 = 1.0 / _4332;
                float _4338 = _4334 + (-1.0);
                float _4340 = -_4338;
                float _4342 = fma(_4340, _4336, _4298);
                float _4344 = _4342 * _4330;
                float _4346 = _4344 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4316 = _4346;
                _4240 = _4330;
            }
            float _4348 = _4316;
            float _4350 = _4240;
            float _4352 = _4348 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4354 = _4348 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4356 = !_4296;
            _4242 = _4350;
            _4250 = _4348;
            _4268 = _4352;
            if (!_4356)
            {
                float _4358 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4360 = log2(_4358);
                float _4362 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4364 = _4362 + 1.0;
                float _4366 = 1.0 / _4364;
                float _4368 = _4360 * _4298;
                float _4370 = exp2(_4368);
                float _4372 = -_4370;
                float _4374 = _4372 + 1.0;
                float _4376 = _4374 * _4366;
                _4300 = _4376;
            }
            float _4378 = _4300;
            float _4380 = fma(_4378, _177, _4354);
            float _4382 = fma(_4378, _175, _4352);
            float _4384 = _4348 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4386 = -_449;
            float _4388 = _4386 + _4380;
            float _4390 = -_447;
            float _4392 = _4390 + _4382;
            float _4394 = fma(_4378, _179, _4384);
            float _4396 = _4388 * _217;
            float _4398 = _4388 * _233;
            float _4400 = _4388 * _245;
            float _4402 = -_461;
            float _4404 = _4402 + _4394;
            float _4406 = fma(_4392, _215, _4396);
            float _4408 = fma(_4392, _231, _4398);
            float _4410 = fma(_4392, _243, _4400);
            float _4412 = fma(_4404, _219, _4406);
            float _4414 = fma(_4404, _235, _4408);
            float _4416 = fma(_4404, _247, _4410);
            _497 = _4414;
            _499 = _4412;
            _501 = _4416;
            _4274 = _4412;
            _4280 = _4414;
            _4286 = _4416;
            _273 = _4394;
            _275 = _4408;
        }
        float _4418 = _497;
        float _4420 = _499;
        float _4422 = _501;
        float _4424 = _4274;
        float _4426 = _4280;
        float _4428 = _4286;
        float _4430 = _4242;
        float _4432 = _4250;
        float _4434 = _4268;
        float _4436 = _273;
        float _4438 = _275;
        float _4440 = _4418 * _4418;
        float _4442 = rsqrt(_4224);
        float _4444 = fma(_4420, _4420, _4440);
        float _4446 = fma(_4422, _4422, _4444);
        float _4448 = sqrt(_4446);
        float _4450 = _4214 * _4442;
        float _4452 = _4208 * _4442;
        float _4454 = _4220 * _4442;
        bool _4456 = _4448 > 0.0;
        float _4458 = _4430;
        float _4460 = _4432;
        float _4462 = _4434;
        _277 = _4448;
        _279 = _4436;
        _281 = _4438;
        if (!_4456)
        {
            _4458 = _4204;
        }
        float _4464 = _4458;
        _4244 = _4464;
        if (!_4456)
        {
            _4460 = _4198;
        }
        float _4466 = _4460;
        _4252 = _4466;
        if (!_4456)
        {
            _4462 = _4210;
        }
        float _4468 = _4462;
        bool _4470 = !_4456;
        _4258 = _4468;
        if (!_4470)
        {
            float _4472 = rsqrt(_4446);
            float _4474 = _4472 * _4418;
            float _4476 = _4472 * _4420;
            float _4478 = _4472 * _4422;
            float _4480 = _4452 * _4474;
            float _4482 = fma(_4450, _4476, _4480);
            float _4484 = fma(_4454, _4478, _4482);
            float _4486 = _4484 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4488 = fma(_4424, _4486, _4204);
            float _4490 = fma(_4426, _4486, _4198);
            float _4492 = fma(_4428, _4486, _4210);
            _4244 = _4488;
            _4252 = _4490;
            _4258 = _4492;
            _277 = _4478;
            _279 = _4474;
        }
    }
    float _4494 = _4244;
    float _4496 = _4252;
    float _4498 = _4258;
    float _4500 = _277;
    float _4502 = _279;
    float _4504 = _281;
    bool _4506 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4510 = _4506 || _4508;
    bool _4512 = isnan(0.5);
    bool _4514 = _4510 || _4512;
    float _4516 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4518 = _4500;
    float _4520 = _4502;
    float _4522 = _4498;
    float _4524 = _4504;
    if (_4514)
    {
        _4516 = _4494;
    }
    float _4526 = _4516;
    float _4528 = _4526;
    if (_4514)
    {
        _4518 = _4496;
    }
    float _4530 = _4518;
    float _4532 = _4530;
    if (_4514)
    {
        _4520 = _4498;
    }
    float _4534 = _4520;
    float _4536 = _4534;
    if (!_4514)
    {
        float _4538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4540 = _2806 + _4538;
        float _4542 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4544 = _2986 + _4542;
        float _4546 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4548 = -_2986;
        float _4550 = _4548 + _4494;
        float _4552 = _4540 * _4540;
        float _4554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4556 = _3064 + _4554;
        float _4558 = -_2806;
        float _4560 = _4558 + _4496;
        float _4562 = -_3064;
        float _4564 = _4562 + _4498;
        float _4566 = fma(_4544, _4544, _4552);
        float _4568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4570 = fma(_4556, _4556, _4566);
        float _4572 = sqrt(_4570);
        float _4574 = _4546 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4576 = precise::min(_4572, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4578 = _4576 * _4568;
        float _4580 = _4574 * _4578;
        float _4582 = fma(_4550, _4580, _2986);
        float _4584 = fma(_4560, _4580, _2806);
        float _4586 = fma(_4564, _4580, _3064);
        _4532 = _4584;
        _4528 = _4582;
        _4536 = _4586;
        _4522 = _4564;
    }
    float _4588 = _4532;
    float _4590 = _4528;
    float _4592 = _4536;
    float _4594 = _4522;
    float _4596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4598 = _4588 + _4596;
    float _4600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4602 = _4590 + _4600;
    float _4604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4606 = _4592 + _4604;
    float _4608 = _4598 * _4598;
    float _4610 = fma(_4602, _4602, _4608);
    float _4612 = fma(_4606, _4606, _4610);
    float _4614 = rsqrt(_4612);
    float _4616 = sqrt(_4612);
    float _4618 = _4614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4620 = _4602 * _4618;
    float _4622 = _4606 * _4618;
    float _4624 = _4620 * _4620;
    float _4626 = _4622 * _4622;
    float _4628 = _4624 + _4626;
    float _4630 = sqrt(_4628);
    bool _4632 = _4630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4636 = _4630 + _4634;
    float _4638 = _4614;
    float _4640 = _4628;
    float _4642 = _4636;
    float _4644 = _4598;
    float _4646 = _4594;
    if (_4632)
    {
        float _4648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4638 = _4648;
    }
    float _4650 = _4638;
    if (_4632)
    {
        float _4652 = rsqrt(_4628);
        _4640 = _4652;
    }
    float _4654 = _4640;
    float _4656 = _4654;
    if (_4632)
    {
        float _4658 = _4636 * _4650;
        _4642 = _4658;
    }
    float _4660 = _4642;
    if (_4632)
    {
        float _4662 = _4660 * 0.15915493667125701904296875;
        _283 = _4662;
    }
    float _4664 = _283;
    float _4666 = _4606;
    if (_4632)
    {
        float _4668 = _4664 * 6.283185482025146484375;
        float _4670 = sin(_4668);
        _4666 = _4670;
    }
    float _4672 = _4666;
    float _4674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4676 = precise::max(0.0, _4674);
    float _4678 = _4650;
    float _4680 = _4676;
    if (_4632)
    {
        float _4682 = _4664 * 6.283185482025146484375;
        float _4684 = cos(_4682);
        _4678 = _4684;
    }
    float _4686 = _4678;
    float _4688 = -_4618;
    float _4690 = -_4676;
    float _4692 = fma(_4598, _4688, _4690);
    if (_4632)
    {
        float _4694 = _4692 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4644 = _4694;
    }
    float _4696 = _4644;
    float _4698 = _4696;
    float _4700 = _4672;
    if (_4632)
    {
        float _4702 = fma(_4672, _4696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4698 = _4702;
    }
    float _4704 = _4698;
    float _4706 = _4704;
    if (!_4632)
    {
        _4700 = _4620;
    }
    float _4708 = _4700;
    float _4710 = _4708;
    float _4712 = _4686;
    if (_4632)
    {
        float _4714 = _4686 + (-1.0);
        _4680 = _4714;
    }
    float _4716 = _4680;
    float _4718 = _4716;
    if (_4632)
    {
        float _4720 = _4654 * _4704;
        _4646 = _4720;
    }
    float _4722 = _4646;
    if (!_4632)
    {
        _4706 = _4692;
    }
    float _4724 = _4706;
    float _4726 = _4724;
    if (_4632)
    {
        float _4728 = _4716 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4524 = _4728;
    }
    float _4730 = _4524;
    if (_4632)
    {
        float _4732 = _4620 * _4722;
        _4710 = _4732;
    }
    float _4734 = _4710;
    if (!_4632)
    {
        _4718 = _4622;
    }
    float _4736 = _4718;
    float _4738 = _4736;
    if (_4632)
    {
        float _4740 = _4622 * _4722;
        _4738 = _4740;
    }
    float _4742 = _4738;
    if (!_4632)
    {
        _4656 = _4624;
    }
    float _4744 = _4656;
    float _4746 = _4744;
    if (_4632)
    {
        float _4748 = fma(_4692, _4686, _4730);
        _4726 = _4748;
    }
    float _4750 = _4726;
    if (_4632)
    {
        float _4752 = _4734 * _4734;
        _4746 = _4752;
    }
    float _4754 = _4746;
    if (!_4632)
    {
        _4712 = _4626;
    }
    float _4756 = _4712;
    float _4758 = _4756;
    if (_4632)
    {
        float _4760 = _4742 * _4742;
        _4758 = _4760;
    }
    float _4762 = _4758;
    float _4764 = fma(_4750, _4750, _4754);
    float _4766 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4768 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4770 = _4764 + _4762;
    float _4772 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4766);
    float _4774 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4776 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4778 = fma(_4616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4776);
    float _4780 = precise::clamp(_4778, 0.0, 1.0);
    float _4782 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4784 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4772);
    float _4786 = rsqrt(_4770);
    float _4788 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4790 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4774);
    float _4792 = _4784 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4794 = -_4780;
    float _4796 = _4794 + 1.0;
    float _4798 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4788);
    float _4800 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4790);
    float _4802 = _4792 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4804 = abs(_4796);
    float _4806 = log2(_4804);
    float _4808 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4798);
    float _4810 = _4800 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4812 = -_4802;
    float _4814 = fma(_4812, _4768, 1.0);
    float _4816 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4782);
    float _4818 = _4808 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4820 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4822 = _4786 * _4734;
    float _4824 = _4786 * _4750;
    float _4826 = _4786 * _4742;
    float _4828 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4816);
    float _4830 = _4822 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4832 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4820);
    float _4834 = log2(_4814);
    float _4836 = _4828 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4838 = -_4830;
    float _4840 = fma(_4824, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4838);
    float _4842 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4832);
    float _4844 = _4806 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4846 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4848 = -_4826;
    float _4850 = fma(_4848, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4840);
    float _4852 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4842);
    float _4854 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4856 = exp2(_4844);
    float _4858 = fma(_4850, -0.5, 0.5);
    float _4860 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4846);
    float _4862 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4854);
    float _4864 = fma(_4850, 0.5, 0.5);
    float _4866 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4860);
    float _4868 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4862);
    float _4870 = 1.0 / _4852;
    float _4872 = fma(_4864, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4874 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4866);
    float _4876 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4868);
    float _4878 = _4824 + 1.0;
    float _4880 = fma(_4864, _4872, -0.212114393711090087890625);
    float _4882 = _4834 * 0.693147182464599609375;
    float _4884 = sqrt(_4858);
    float _4886 = -_4824;
    float _4888 = fma(_4856, _4878, _4886);
    float _4890 = fma(_4864, _4880, 1.570728778839111328125);
    float _4892 = _4882 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4894 = fma(_4888, 0.5, 0.5);
    float _4896 = _4876 * _4870;
    float _4898 = _4874 * _4870;
    float _4900 = fma(_4896, 0.5, 0.5);
    float _4902 = fma(_4898, -0.5, 0.5);
    float _4904 = _4884 * 0.636619746685028076171875;
    float3 _12172 = float3(_4900, _4902, _4892);
    float _4906 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12172, float3(0.0), isnan(_12172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12172, float3(0.0), isnan(_12172)), level(0.0)).x;
    float3 _12183 = float3(_4900, _4902, _4892);
    float4 _4909 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12183, float3(0.0), isnan(_12183)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12183, float3(0.0), isnan(_12183)), level(0.0)).xyzw;
    float _4911 = _4909.x;
    float _4913 = _4909.y;
    float _4915 = _4909.z;
    float _4917 = _4909.w;
    float _4919 = -_4890;
    float _4921 = fma(_4904, _4919, 1.0);
    float2 _12205 = float2(_4921, _4894);
    float3 _4925 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12205, float2(0.0), isnan(_12205)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12205, float2(0.0), isnan(_12205)), level(0.0)).xyz;
    float _4927 = _4925.x;
    float _4929 = _4925.y;
    float _4931 = _4925.z;
    float _4933 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4935 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4937 = _4806 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4939 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4941 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4933);
    float _4943 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4935);
    out.m_86.x = _4590;
    out.m_86.y = _4588;
    out.m_86.z = _4592;
    float _4945 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4939);
    float _4947 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4941);
    float _4949 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4943);
    float _4951 = exp2(_4937);
    float _4953 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4945);
    float _4955 = _4947 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4957 = _4949 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4959 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4953);
    float _4961 = 1.0 / _4955;
    bool _4963 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4967 = _4963 || _4965;
    bool _4969 = isnan(0.5);
    bool _4971 = _4967 || _4969;
    float _4973 = _4957 + _4955;
    float _4975 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4977 = _4902;
    float _4979 = _4892;
    float _4981 = _4955;
    if (!_4971)
    {
        _4975 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4983 = _4975;
    float _4985 = _4973 * _4961;
    float _4987 = _4985 * 0.5;
    float _4989 = _4987;
    float _4991 = _4983;
    if (!_4971)
    {
        _4977 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4993 = _4977;
    if (!_4971)
    {
        float _4995 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4997 = fma(_4987, _4983, _4995);
        _4989 = _4997;
    }
    float _4999 = _4989;
    if (_4971)
    {
        _4991 = 1.0;
    }
    float _5001 = _4991;
    float _5003 = _5001;
    if (!_4971)
    {
        float _5005 = -_4993;
        float _5007 = _5005 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4979 = _5007;
    }
    float _5009 = _4979;
    float _5011 = _4999;
    if (!_4971)
    {
        float _5013 = 1.0 / _4999;
        _5011 = _5013;
    }
    float _5015 = _5011;
    float _5017 = 0.0187292993068695068359375;
    if (!_4971)
    {
        float _5019 = 1.0 / _5009;
        _5017 = _5019;
    }
    float _5021 = _5017;
    if (!_4971)
    {
        float _5023 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _5025 = -_4993;
        float _5027 = fma(_5015, _5023, _5025);
        _4981 = _5027;
    }
    float _5029 = _4981;
    float _5031 = -_4951;
    float _5033 = _5031 + 1.0;
    float _5035 = _4959 + _4852;
    float _5037 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5039 = _5035 * 0.5;
    if (!_4971)
    {
        float _5041 = _5029 * _5021;
        float _5043 = precise::clamp(_5041, 0.0, 1.0);
        _5003 = _5043;
    }
    float _5045 = _5003;
    out.m_88.z = _5039;
    out.m_88.w = _4852;
    float _5047 = _5045 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _5049 = _5045 > 0.0;
    bool _5051 = isnan(_5045);
    bool _5053 = _5049 || _5051;
    bool _5055 = isnan(0.0);
    bool _5057 = _5053 || _5055;
    out.gl_Position.x = _4876;
    out.gl_Position.y = _4874;
    out.gl_Position.z = _4959;
    out.gl_Position.w = _4852;
    float _5059 = _5047 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_51.x = _5059;
    float _5061 = _5037 * _4906;
    float _5063 = -_5037;
    float _5065 = _5063 + 1.0;
    float _5067 = _4917 * _5061;
    float _5069 = _4917 * _5065;
    float _5071 = _4931 * _5061;
    float _5073 = fma(_4927, _5067, _4911);
    float _5075 = fma(_4929, _5067, _4913);
    float _5077 = fma(_4917, _5071, _4915);
    out.m_90.x = _5073;
    out.m_90.y = _5075;
    out.m_90.z = _5077;
    out.m_90.w = _5069;
    if (_5057)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _5079 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5079;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4156 = false;
    bool _1067 = false;
    bool _853 = false;
    bool _717 = false;
    bool _521 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = in.m_46.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5147 = as_type<float>(_131);
        out.gl_Position.z = _5147;
    }
    if (!_119)
    {
        return out;
    }
    bool _135 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_106);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = float(_111);
    bool _147 = _115 >= _145;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    if (_151)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _123;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _133 = as_type<int>(_155);
    }
    int _157 = _133;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5202 = as_type<float>(_157);
        out.gl_Position.z = _5202;
    }
    if (_151)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_56.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_46.x;
    float _177 = in.m_46.y;
    float _179 = in.m_46.z;
    int _181 = int(_151);
    int _183 = false ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _173 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = in.m_44.x;
    float _211 = in.m_44.y;
    float _213 = in.m_44.z;
    float _215 = in.m_58.x;
    float _217 = in.m_58.y;
    float _219 = in.m_58.z;
    float _221 = as_type<float>(_207);
    float _223 = _161;
    if (!_173)
    {
        float _225 = _161 * _161;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    float _231 = in.m_60.x;
    float _233 = in.m_60.y;
    float _235 = in.m_60.z;
    float _237 = _229;
    if (!_173)
    {
        float _239 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _239;
    }
    float _241 = _237;
    float _243 = in.m_62.x;
    float _245 = in.m_62.y;
    float _247 = in.m_62.z;
    int _249 = as_type<int>(_159) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_159) & 2;
    bool _255 = _253 != 0;
    bool _257 = !_251;
    float _259 = _257 ? (-0.5) : 0.5;
    bool _261 = !_255;
    float _263 = _261 ? (-0.5) : 0.5;
    bool _265 = !_173;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = 0.0;
    float _273 = _179;
    float _275 = _233;
    float _277 = _177;
    float _279 = _179;
    float _281 = _233;
    float _283 = _231;
    if (!_265)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _161 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _161);
        float _311 = _309 * _297;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _313;
        _269 = _297;
        _271 = _303;
    }
    float _315 = _267;
    float _317 = _269;
    float _319 = _271;
    bool _321 = !_173;
    float _323 = _319;
    float _325 = _317;
    float _327 = _315;
    if (!_321)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _161 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _223 = _347;
        _323 = _335;
    }
    float _349 = _223;
    float _351 = _323;
    float _353 = _351;
    if (!_173)
    {
        float _355 = _115 * _115;
        float _357 = _355 * 0.5;
        _325 = _357;
    }
    float _359 = _325;
    float _361 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_173)
    {
        _353 = _115;
    }
    float _367 = _353;
    float _369 = fma(_349, _175, _361);
    float _371 = fma(_349, _177, _363);
    float _373 = _367;
    if (!_173)
    {
        float _375 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _375;
    }
    float _377 = _327;
    bool _379 = !_173;
    float _381 = _377;
    if (!_379)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = _115 * _385;
        float _395 = 1.0 / _389;
        float _397 = _391 * 0.693147182464599609375;
        float _399 = exp2(_393);
        float _401 = 1.0 / _397;
        float _403 = _399 + (-1.0);
        float _405 = -_403;
        float _407 = fma(_405, _401, _115);
        float _409 = _407 * _395;
        float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _381 = _411;
    }
    float _413 = _381;
    bool _415 = !_173;
    if (!_415)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _115 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _373 = _435;
    }
    float _437 = _373;
    float _439 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _443 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _445 = fma(_349, _179, _365);
    float _447 = fma(_437, _175, _439);
    float _449 = fma(_437, _177, _441);
    float _451 = 1.0 / _145;
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _455 = fma(_371, _163, _211);
    float _457 = -_449;
    float _459 = _371 + _457;
    float _461 = fma(_437, _179, _443);
    float _463 = fma(_369, _163, _209);
    float _465 = -_447;
    float _467 = _369 + _465;
    float _469 = _459 * _217;
    float _471 = _459 * _233;
    float _473 = _459 * _245;
    float _475 = -_461;
    float _477 = _445 + _475;
    float _479 = fma(_467, _215, _469);
    float _481 = fma(_467, _231, _471);
    float _483 = fma(_467, _243, _473);
    float _485 = fma(_445, _163, _213);
    float _487 = fma(_477, _219, _479);
    float _489 = fma(_477, _235, _481);
    float _491 = fma(_477, _247, _483);
    float _493 = _115 * _451;
    bool _495 = !_453;
    float _497 = _489;
    float _499 = _487;
    float _501 = _491;
    float _519;
    if (!_495)
    {
        float _503 = in.m_64.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        _519 = _493;
    }
    _521 = false;
    float _523 = _519;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = _523 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = in.m_56.x;
    float _547 = in.m_56.y;
    bool _549 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _551 = isnan(_523);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = 1.0 / _535;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _565 = 1.0 / _539;
    float _567 = 1.0 / _543;
    float _569 = _527 * _561;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _573 = _523 + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _575;
    float _579 = fma(_577, _569, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _581 = _573 * _565;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _583;
    bool _587 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _589 = isnan(_523);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    bool _599 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _601 = isnan(_523);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = fma(_585, _569, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _613 = _531 * _567;
    float _615 = -_559;
    float _617 = _615 + 1.0;
    bool _619 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _621 = isnan(_523);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _635 = _597 * _617;
    float _637 = -_597;
    float _639 = _637 + 1.0;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _645 = fma(_633, _581, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _647 = _629 * _639;
    float _649 = -_629;
    float _651 = _649 + 1.0;
    float _653 = fma(_643, _581, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _655 = _609 * _651;
    float _657 = -_609;
    float _659 = _657 + 1.0;
    float _661 = _579 * _655;
    float _663 = _611 * _655;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _669;
    float _673 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _661);
    float _675 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _663);
    float _677 = fma(_667, _613, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _679 = fma(_671, _613, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _681 = fma(_645, _647, _673);
    float _683 = fma(_653, _647, _675);
    float _685 = fma(_677, _635, _681);
    float _687 = fma(_679, _635, _683);
    float _689 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].x, _685);
    float _691 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].y, _687);
    float _693 = _689 * _545;
    float _695 = _691 * _547;
    bool _697 = !_563;
    float _715;
    if (!_697)
    {
        float _699 = in.m_64.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        _715 = _493;
    }
    _717 = false;
    float _719 = _715;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _723 = _719 + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _729 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _731 = isnan(_719);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _745 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _747 = isnan(_719);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _757;
    bool _761 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _763 = isnan(_719);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = 1.0 / _727;
    float _775 = -_739;
    float _777 = _775 + 1.0;
    bool _779 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _781 = _755 * _777;
    float _783 = -_755;
    float _785 = _783 + 1.0;
    float _787 = 1.0 / _743;
    float _789 = _759 * _773;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _795 = fma(_789, _723, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -_771;
    float _799 = _797 + 1.0;
    float _801 = _795 * _781;
    float _803 = _793 * _787;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _807 = _719 + _805;
    float _809 = _739 * _799;
    float _811 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[115].x, _801);
    float _813 = fma(_803, _807, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _815 = fma(_813, _809, _811);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _823 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[117].x, _815);
    float _825 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _827 = _819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _825;
    out.m_66.y = _827;
    out.m_66.z = _829;
    out.m_66.w = _831;
    bool _833 = !_779;
    float _851;
    if (!_833)
    {
        float _835 = in.m_64.x;
        float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _839 = _835 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].w, _115);
        float _843 = _841 * _837;
        float _845 = floor(_843);
        float _847 = -_845;
        float _849 = _843 + _847;
        _851 = _849;
        _853 = true;
    }
    else
    {
        _851 = _493;
    }
    _853 = false;
    float _855 = _851;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _859 = _855 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _869;
    bool _873 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _875 = isnan(_855);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = 1.0 / _863;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _895 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _897 = isnan(_855);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    bool _907 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _909 = isnan(_855);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = 1.0 / _867;
    float _921 = -_905;
    float _923 = _921 + 1.0;
    bool _925 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _927 = _871 * _885;
    bool _929 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _931 = isnan(_855);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = 1.0 / _889;
    float _943 = -_883;
    float _945 = _943 + 1.0;
    float _947 = fma(_927, _859, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _949 = _883 * _923;
    float _951 = -_939;
    float _953 = _951 + 1.0;
    float _955 = _939 * _945;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _961;
    float _965 = 1.0 / _893;
    float _967 = _917 * _953;
    float _969 = _959 * _919;
    float _971 = -_917;
    float _973 = _971 + 1.0;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _979 = _947 * _967;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _983 = _855 + _981;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _987 = _855 + _985;
    float _989 = _963 * _941;
    bool _991 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _993 = isnan(_855);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = fma(_969, _983, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1005 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[131].x, _979);
    float _1007 = fma(_989, _987, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1011 = _855 + _1009;
    float _1013 = -_1001;
    float _1015 = _1013 + 1.0;
    float _1017 = fma(_1003, _955, _1005);
    float _1019 = _977 * _965;
    float _1021 = _905 * _1015;
    float _1023 = fma(_1007, _949, _1017);
    float _1025 = fma(_1019, _1011, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1029 = fma(_1025, _1021, _1023);
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1033 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1037 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1029);
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _1033;
    out.m_68.y = _1039;
    out.m_68.z = _1041;
    out.m_68.w = _1043;
    bool _1045 = !_925;
    float _1047 = _1033;
    float _1065;
    if (!_1045)
    {
        float _1049 = in.m_64.x;
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1053 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[14].x, _115);
        float _1057 = _1055 * _1051;
        float _1059 = floor(_1057);
        float _1061 = -_1059;
        float _1063 = _1057 + _1061;
        _1065 = _1063;
        _1067 = true;
    }
    else
    {
        _1065 = _493;
    }
    _1067 = false;
    float _1069 = _1065;
    float _1071 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1073 = int(_1071);
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1077 = _1075 != 0;
    float _1079 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1081 = int(_1079);
    float _1083 = 0.0;
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1077)
    {
        _1083 = 1.0;
    }
    float _1087 = _1083;
    float _1089 = float(_1073);
    float _1091 = 0.0;
    float _1093 = _1087;
    if (_1077)
    {
        _1091 = 1.0;
    }
    float _1095 = _1091;
    float _1097 = 0.0;
    float _1099 = _1095;
    if (_1077)
    {
        _1097 = 1.0;
    }
    float _1101 = _1097;
    int _1103 = 0;
    float _1105 = _1101;
    if (_1077)
    {
        _1103 = 0;
    }
    int _1107 = _1103;
    float _1109 = 1.0 / _1089;
    float _1111 = _1039;
    int _1113 = _1107;
    if (_1077)
    {
        float _1115 = in.m_64.x;
        _1111 = _1115;
    }
    float _1117 = _1111;
    float _1119 = float(uint(_1081));
    if (_1077)
    {
        _1085 = 0;
    }
    int _1121 = _1085;
    int _1123 = ~_1081;
    int _1125 = _1123 + 1;
    float _1127 = 1.0 / _1119;
    float _1129 = _115 * _1109;
    int _1131 = ~_1081;
    int _1133 = _1131 + 1;
    float _1135 = trunc(_1129);
    int _1137 = int(_1135);
    int _1139 = as_type<int>(_1127) + (-2);
    float _1141 = _1117;
    int _1143 = _1121;
    if (_1077)
    {
        _1047 = _1117;
    }
    float _1145 = _1047;
    float _1147 = float(uint(_1137));
    float _1149 = as_type<float>(_1139) * _1147;
    float _1151 = trunc(_1149);
    float _1153 = precise::max(_1151, 0.0);
    uint _1156 = uint(_1153);
    int _1158 = _1133 * int(_1156);
    int _1160 = _1158 + _1137;
    float _1162 = float(uint(_1160));
    float _1164 = as_type<float>(_1139) * _1162;
    float _1166 = in.m_64.x;
    float _1168 = in.m_64.y;
    float _1170 = in.m_64.z;
    float _1172 = in.m_64.w;
    float _1174 = trunc(_1164);
    float _1176 = precise::max(_1174, 0.0);
    uint _1178 = uint(_1176);
    int _1180 = int(_1156) + int(_1178);
    float _1182 = _1145;
    if (!_1077)
    {
        float _1184 = in.m_64.y;
        float _1186 = in.m_64.z;
        _1093 = 7.345489978790283203125;
        _1182 = _1186;
        _1105 = 5.839270114898681640625;
        _1113 = 1;
        _1141 = _1184;
        _1099 = 1.2345600128173828125;
        _1143 = 2;
    }
    float _1188 = _1093;
    float _1190 = _1182;
    float _1192 = _1105;
    int _1194 = _1113;
    float _1196 = _1141;
    float _1198 = _1099;
    int _1200 = _1143;
    float _1202 = float(_1081);
    float _1204 = _1166 * _1188;
    float _1206 = float(_1137);
    int _1208 = _1125 * _1180;
    int _1210 = _1208 + _1137;
    float _1212 = floor(_1204);
    bool _1214 = _1206 >= _1202;
    bool _1216 = isnan(_1206);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(_1202);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = _1190 * _1192;
    bool _1228 = uint(_1210) >= uint(_1081);
    bool _1230 = _1194 != 1;
    bool _1232 = _1168 > 0.5;
    float _1234 = _1170 * 2.0;
    bool _1236 = _1170 > 0.5;
    float _1238 = trunc(_1224);
    int _1240 = int(_1238);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1244 = _1242 != 0;
    float _1246 = _455 * _233;
    bool _1248 = !_1228;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = _455 * _245;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1264 = _1262 != 0;
    float _1266 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1268 = -_259;
    int _1270 = _1232 ? as_type<int>(_1268) : as_type<int>(_259);
    float _1272 = -_1212;
    float _1274 = _1204 + _1272;
    float _1276 = -_263;
    int _1278 = _1236 ? as_type<int>(_1276) : as_type<int>(_263);
    float _1280 = floor(_1234);
    int _1282 = ~_1180;
    int _1284 = _1282 + _1250;
    int _1286 = _1284 + 1;
    float _1288 = _1274 * _1202;
    float _1290 = _493 * _1202;
    bool _1292 = !_1260;
    float _1294 = _1292 ? _259 : as_type<float>(_1270);
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _263);
    int _1298 = int(_1244);
    int _1300 = _1228 ? 2 : 0;
    int _1302 = _1298 | _1300;
    int _1304 = _1236 ? 4 : 0;
    int _1306 = _1302 | _1304;
    int _1308 = _1256 ? 8 : 0;
    int _1310 = _1306 | _1308;
    int _1312 = _1260 ? 16 : 0;
    int _1314 = _1310 | _1312;
    int _1316 = _1264 ? 32 : 0;
    int _1318 = _1314 | _1316;
    int _1320 = _1232 ? 64 : 0;
    int _1322 = _1318 | _1320;
    int _1324 = _1322 & 64;
    float _1326 = trunc(_1288);
    int _1328 = int(_1326);
    bool _1330 = !_1264;
    float _1332 = _1330 ? _263 : as_type<float>(_1278);
    int _1334 = _1081 * _1286;
    int _1336 = _1334 + _1137;
    int _1338 = int(_1244);
    int _1340 = _1228 ? 2 : 0;
    int _1342 = _1338 | _1340;
    int _1344 = _1236 ? 4 : 0;
    int _1346 = _1342 | _1344;
    int _1348 = _1256 ? 8 : 0;
    int _1350 = _1346 | _1348;
    int _1352 = _1260 ? 16 : 0;
    int _1354 = _1350 | _1352;
    int _1356 = _1264 ? 32 : 0;
    int _1358 = _1354 | _1356;
    int _1360 = _1232 ? 64 : 0;
    int _1362 = _1358 | _1360;
    int _1364 = _1362 & 4;
    float _1366 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1378 = _1376 != 0;
    float _1380 = fma(_463, _231, _1246);
    bool _1382 = _1081 == 0;
    float _1384 = trunc(_1290);
    int _1386 = int(_1384);
    int _1388 = ~_1240;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = fma(_463, _243, _1252);
    bool _1396 = !_1382;
    int _1398 = _1396 ? _1336 : (-1);
    float _1400 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1402 = _1166 + _1168;
    int _1404 = _1081 + (-1);
    int _1406 = _1398 * _1392;
    bool _1408 = !_1374;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = _1168 + _1170;
    bool _1414 = !_1244;
    int _1416 = _1414 ? 0 : 1;
    int _1418 = _1240 * _1404;
    int _1420 = _1418 + _1406;
    bool _1422 = !_1370;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1428 = abs(_1410);
    float _1430 = _1402 + (-1.0);
    int _1432 = abs(_1416);
    float _1434 = in.m_58.w;
    bool _1436 = !_1378;
    int _1438 = _1436 ? 0 : 1;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1442 = _1069 + _1440;
    int _1444 = abs(_1424);
    float _1446 = in.m_60.w;
    int _1448 = abs(_1438);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1452 = _1450 != 0;
    int _1454 = _1420 * _1428;
    int _1456 = _1328 * _1432;
    int _1458 = _1456 + _1137;
    bool _1460 = !_1452;
    int _1462 = _1460 ? 0 : 1;
    int _1464 = _1386 * _1444;
    int _1466 = _1464 + _1454;
    int _1468 = abs(_1462);
    int _1470 = ~_1081;
    int _1472 = _1470 + 1;
    int _1474 = _1458 * _1448;
    int _1476 = _1474 + _1466;
    int _1478 = ~_1081;
    int _1480 = _1478 + 1;
    bool _1482 = _1172 > 0.5;
    int _1484 = _1328 * _1468;
    int _1486 = _1484 + _1476;
    float _1488 = -_263;
    int _1490 = _1482 ? as_type<int>(_1488) : as_type<int>(_263);
    float _1492 = float(uint(_1486));
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1498 = !_1256;
    float _1500 = _1498 ? _263 : as_type<float>(_1490);
    float _1502 = as_type<float>(_1139) * _1492;
    float _1504 = 1.0 / _1496;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1508 = trunc(_1502);
    float _1510 = precise::max(_1508, 0.0);
    uint _1512 = uint(_1510);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1522 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1506);
    float _1524 = 1.0 / _1516;
    bool _1526 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1528 = isnan(_1069);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1522);
    float _1540 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1542 = _1472 * int(_1512);
    int _1544 = _1542 + _1486;
    float _1546 = fma(_485, _235, _1380);
    float _1548 = 1.0 / _1520;
    float _1550 = float(uint(_1544));
    float _1552 = as_type<float>(_1139) * _1550;
    float _1554 = trunc(_1552);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    int _1560 = int(_1512) + int(_1558);
    int _1562 = _1480 * _1560;
    int _1564 = _1562 + _1486;
    float _1566 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1568 = int(_1566);
    bool _1570 = uint(_1564) >= uint(_1081);
    bool _1572 = !_1570;
    int _1574 = _1572 ? 0 : (-1);
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1578 = _1576 != 0;
    int _1580 = ~_1560;
    int _1582 = _1580 + _1574;
    int _1584 = _1582 + 1;
    bool _1586 = !_1578;
    int _1588 = _1586 ? 0 : 1;
    int _1590 = _1081 * _1584;
    int _1592 = _1590 + _1486;
    float _1594 = float(_1568);
    int _1596 = abs(_1588);
    bool _1598 = !_1382;
    int _1600 = _1598 ? _1592 : (-1);
    float _1602 = 1.0 / _1594;
    int _1604 = _1600 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = _1606 ? 0 : 1;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1624 = _1622 != 0;
    int _1626 = _1600 & 3;
    bool _1628 = _1626 != 0;
    int _1630 = ~_1608;
    int _1632 = _1630 + 1;
    int _1634 = _1632 + 1;
    bool _1636 = !_1616;
    int _1638 = _1636 ? 0 : 1;
    float _1640 = _115 * _1602;
    bool _1642 = uint(_1626) > 1u;
    int _1644 = int(_1612);
    int _1646 = _1642 ? 2 : 0;
    int _1648 = _1644 | _1646;
    int _1650 = _1620 ? 4 : 0;
    int _1652 = _1648 | _1650;
    int _1654 = _1624 ? 8 : 0;
    int _1656 = _1652 | _1654;
    int _1658 = _1628 ? 16 : 0;
    int _1660 = _1656 | _1658;
    int _1662 = _1374 ? 32 : 0;
    int _1664 = _1660 | _1662;
    int _1666 = _1378 ? 64 : 0;
    int _1668 = _1664 | _1666;
    int _1670 = _1668 & 16;
    float _1672 = trunc(_1640);
    int _1674 = int(_1672);
    int _1676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1678 = _1676 != 0;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1682 = _1680 != 0;
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1686 = _1684 != 0;
    bool _1688 = !_1612;
    int _1690 = _1688 ? 0 : 1;
    bool _1692 = !_1620;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = !_1682;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1702 = int(_1700);
    bool _1704 = _1364 != 0;
    int _1706 = _1634;
    float _1708 = _1332;
    if (!_1642)
    {
        int _1710 = ~_1608;
        int _1712 = _1710 + 1;
        _1706 = _1712;
    }
    int _1714 = _1706;
    int _1716 = abs(_1638);
    bool _1718 = !_1624;
    int _1720 = _1718 ? 0 : 1;
    float _1722 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1724 = int(_1722);
    float _1726 = float(uint(_1674));
    int _1728 = abs(_1720);
    int _1730 = abs(_1698);
    float _1732 = float(_1702);
    float _1734 = float(uint(_1724));
    int _1736 = ~_1724;
    int _1738 = _1736 + 1;
    bool _1740 = _1724 == 0;
    float _1742 = 1.0 / _1734;
    int _1744 = as_type<int>(_1742) + (-2);
    int _1746 = ~_1724;
    int _1748 = _1746 + 1;
    float _1750 = as_type<float>(_1744) * _1726;
    float _1752 = trunc(_1750);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    int _1758 = _1738 * int(_1756);
    int _1760 = _1758 + _1674;
    float _1762 = float(uint(_1760));
    float _1764 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1766 = int(_1764);
    float _1768 = as_type<float>(_1744) * _1762;
    float _1770 = trunc(_1768);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    float _1776 = float(uint(_1766));
    int _1778 = ~_1766;
    int _1780 = _1778 + 1;
    float _1782 = 1.0 / _1776;
    int _1784 = int(_1756) + int(_1774);
    int _1786 = _1748 * _1784;
    int _1788 = _1786 + _1674;
    bool _1790 = uint(_1788) >= uint(_1724);
    float _1792 = 1.0 / _1732;
    int _1794 = as_type<int>(_1782) + (-2);
    bool _1796 = !_1790;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = ~_1784;
    int _1802 = _1800 + _1798;
    int _1804 = _1802 + 1;
    float _1806 = _115 * _1792;
    float _1808 = trunc(_1806);
    int _1810 = int(_1808);
    float _1812 = float(uint(_1810));
    float _1814 = as_type<float>(_1794) * _1812;
    float _1816 = trunc(_1814);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    int _1822 = _1780 * int(_1820);
    int _1824 = _1822 + _1810;
    float _1826 = float(uint(_1824));
    float _1828 = as_type<float>(_1794) * _1826;
    int _1830 = ~_1766;
    int _1832 = _1830 + 1;
    float _1834 = trunc(_1828);
    float _1836 = precise::max(_1834, 0.0);
    uint _1838 = uint(_1836);
    int _1840 = int(_1820) + int(_1838);
    float _1842 = float(_1724);
    float _1844 = float(_1674);
    int _1846 = _1832 * _1840;
    int _1848 = _1846 + _1810;
    bool _1850 = _1844 >= _1842;
    bool _1852 = isnan(_1844);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan(_1842);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    bool _1862 = uint(_1848) >= uint(_1766);
    float _1864 = _1196 * _1198;
    float _1866 = trunc(_1860);
    int _1868 = int(_1866);
    bool _1870 = !_1862;
    int _1872 = _1870 ? 0 : (-1);
    int _1874 = ~_1840;
    int _1876 = _1874 + _1872;
    int _1878 = _1876 + 1;
    int _1880 = _1766 + (-1);
    float _1882 = floor(_1864);
    int _1884 = _1766 * _1878;
    int _1886 = _1884 + _1810;
    float _1888 = -_1882;
    float _1890 = _1864 + _1888;
    float _1892 = _1890 * _1842;
    bool _1894 = !_1678;
    int _1896 = _1894 ? 0 : 1;
    float _1898 = _493 * _1842;
    bool _1900 = _1324 != 0;
    int _1902 = _1724 * _1804;
    int _1904 = _1902 + _1674;
    int _1906 = ~_1868;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = trunc(_1892);
    int _1914 = int(_1912);
    bool _1916 = !_1740;
    int _1918 = _1916 ? _1904 : (-1);
    int _1920 = _1724 + (-1);
    float _1922 = trunc(_1898);
    int _1924 = int(_1922);
    int _1926 = _1918 * _1910;
    int _1928 = abs(_1694);
    int _1930 = ~_1724;
    int _1932 = _1930 + 1;
    int _1934 = _1868 * _1920;
    int _1936 = _1934 + _1926;
    int _1938 = abs(_1690);
    int _1940 = _1936 * _1716;
    float _1942 = _1168 * 2.0;
    int _1944 = _1914 * _1596;
    int _1946 = _1944 + _1674;
    int _1948 = _1924 * _1938;
    int _1950 = _1948 + _1940;
    int _1952 = ~_1724;
    int _1954 = _1952 + 1;
    float _1956 = floor(_1942);
    int _1958 = _1946 * _1928;
    int _1960 = _1958 + _1950;
    int _1962 = _1914 * _1728;
    int _1964 = _1962 + _1960;
    float _1966 = float(uint(_1964));
    float _1968 = as_type<float>(_1744) * _1966;
    float _1970 = trunc(_1968);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    float _1976 = float(_1810);
    int _1978 = _1954 * int(_1974);
    int _1980 = _1978 + _1964;
    float _1982 = float(uint(_1980));
    bool _1984 = !_1686;
    int _1986 = _1984 ? 0 : 1;
    float _1988 = as_type<float>(_1744) * _1982;
    int _1990 = abs(_1986);
    float _1992 = trunc(_1988);
    float _1994 = precise::max(_1992, 0.0);
    uint _1996 = uint(_1994);
    int _1998 = int(_1974) + int(_1996);
    float _2000 = _1166 * 2.0;
    int _2002 = _1932 * _1998;
    int _2004 = _2002 + _1964;
    float _2006 = floor(_2000);
    bool _2008 = uint(_2004) >= uint(_1724);
    bool _2010 = !_2008;
    int _2012 = _2010 ? 0 : (-1);
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2016 = _2014 != 0;
    int _2018 = ~_1998;
    int _2020 = _2018 + _2012;
    int _2022 = _2020 + 1;
    bool _2024 = !_2016;
    int _2026 = _2024 ? 0 : 1;
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2030 = _2028 != 0;
    bool _2032 = !_2030;
    int _2034 = _2032 ? 0 : 1;
    bool _2036 = _2006 >= 0.0;
    bool _2038 = isnan(_2006);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan(0.0);
    bool _2044 = _2040 || _2042;
    int _2046 = _2044 ? 0 : 1;
    bool _2048 = _2006 > 0.0;
    int _2050 = ~_2046;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    float _2056 = floor(_1226);
    int _2058 = _2054;
    float _2060 = as_type<float>(_1998);
    if (!_2048)
    {
        int _2062 = ~_2046;
        int _2064 = _2062 + 1;
        _2058 = _2064;
    }
    int _2066 = _2058;
    float _2068 = float(_1766);
    bool _2070 = _1956 >= 0.0;
    bool _2072 = isnan(_1956);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    bool _2080 = _1976 >= _2068;
    bool _2082 = isnan(_1976);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan(_2068);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2056;
    float _2094 = _1226 + _2092;
    int _2096 = _2078 ? 0 : 1;
    bool _2098 = _1956 > 0.0;
    float _2100 = _2094 * _2068;
    float _2102 = trunc(_2090);
    int _2104 = int(_2102);
    int _2106 = ~_2096;
    int _2108 = _2106 + 1;
    int _2110 = _2108 + 1;
    float _2112 = _493 * _2068;
    float _2114 = trunc(_2112);
    int _2116 = int(_2114);
    int _2118 = _2110;
    if (!_2098)
    {
        int _2120 = ~_2096;
        int _2122 = _2120 + 1;
        _2118 = _2122;
    }
    int _2124 = _2118;
    bool _2126 = _1766 == 0;
    int _2128 = ~_2104;
    int _2130 = _2128 + 1;
    int _2132 = _2130 + 1;
    float _2134 = trunc(_2100);
    int _2136 = int(_2134);
    bool _2138 = !_2126;
    int _2140 = _2138 ? _1886 : (-1);
    int _2142 = _2140 * _2132;
    int _2144 = abs(_2026);
    int _2146 = _2104 * _1880;
    int _2148 = _2146 + _2142;
    int _2150 = abs(_1896);
    int _2152 = _2136 * _2144;
    int _2154 = _2152 + _1810;
    int _2156 = _2148 * _1730;
    int _2158 = abs(_2034);
    int _2160 = ~_1766;
    int _2162 = _2160 + 1;
    int _2164 = _2116 * _2150;
    int _2166 = _2164 + _2156;
    int _2168 = ~_1766;
    int _2170 = _2168 + 1;
    float _2172 = -_259;
    int _2174 = _1704 ? as_type<int>(_2172) : as_type<int>(_259);
    int _2176 = _2154 * _1990;
    int _2178 = _2176 + _2166;
    float _2180 = -_263;
    int _2182 = _1900 ? as_type<int>(_2180) : as_type<int>(_263);
    int _2184 = _2136 * _2158;
    int _2186 = _2184 + _2178;
    float _2188 = float(uint(_2186));
    float _2190 = as_type<float>(_1794) * _2188;
    float _2192 = trunc(_2190);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    int _2198 = _2170 * int(_2196);
    int _2200 = _2198 + _2186;
    float _2202 = float(uint(_2200));
    int _2204 = _1724 * _2022;
    int _2206 = _2204 + _1964;
    float _2208 = as_type<float>(_1794) * _2202;
    bool _2210 = !_1740;
    int _2212 = _2210 ? _2206 : (-1);
    float _2214 = trunc(_2208);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    int _2220 = int(_2196) + int(_2218);
    int _2222 = _2162 * _2220;
    int _2224 = _2222 + _2186;
    bool _2226 = uint(_2224) >= uint(_1766);
    bool _2228 = !_2226;
    int _2230 = _2228 ? 0 : (-1);
    int _2232 = _2212 & 3;
    bool _2234 = _2232 != 0;
    int _2236 = ~_2220;
    int _2238 = _2236 + _2230;
    int _2240 = _2238 + 1;
    int _2242 = _2234 ? 0 : 1;
    int _2244 = _1766 * _2240;
    int _2246 = _2244 + _2186;
    bool _2248 = !_2126;
    int _2250 = _2248 ? _2246 : (-1);
    int _2252 = ~_2242;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    int _2258 = _2250 & 3;
    bool _2260 = _2258 != 0;
    int _2262 = _2260 ? 0 : 1;
    int _2264 = _2212 & 3;
    bool _2266 = _2264 != 0;
    bool _2268 = uint(_2264) > 1u;
    int _2270 = _2256;
    if (!_2268)
    {
        int _2272 = ~_2242;
        int _2274 = _2272 + 1;
        _2270 = _2274;
    }
    int _2276 = _2270;
    int _2278 = _2250 & 3;
    bool _2280 = _2278 != 0;
    int _2282 = ~_2262;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    bool _2288 = uint(_2278) > 1u;
    int _2290 = _2286;
    if (!_2288)
    {
        int _2292 = ~_2262;
        int _2294 = _2292 + 1;
        _2290 = _2294;
    }
    int _2296 = _2290;
    bool _2298 = uint(_1626) >= 2u;
    int _2300 = abs(_2296);
    int _2302 = _2298 ? 0 : 1;
    bool _2304 = uint(_2278) >= 2u;
    int _2306 = ~_2302;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2304 ? 0 : 1;
    bool _2314 = _1626 != 3;
    int _2316 = ~_2312;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _2310;
    int _2324 = _2320;
    if (_2314)
    {
        int _2326 = ~_2302;
        int _2328 = _2326 + 1;
        _2322 = _2328;
    }
    int _2330 = _2322;
    bool _2332 = _2278 != 3;
    if (_2332)
    {
        int _2334 = ~_2312;
        int _2336 = _2334 + 1;
        _2324 = _2336;
    }
    int _2338 = _2324;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2342 = _2340 != 0;
    int _2344 = abs(_2338);
    bool _2346 = !_2342;
    int _2348 = _2346 ? 0 : 1;
    bool _2350 = _1166 > 0.5;
    float _2352 = -_259;
    int _2354 = _2350 ? as_type<int>(_2352) : as_type<int>(_259);
    int _2356 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2358 = _2356 != 0;
    bool _2360 = !_2358;
    float _2362 = _2360 ? _263 : as_type<float>(_2182);
    int _2364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2366 = _2364 != 0;
    bool _2368 = !_2366;
    float _2370 = _2368 ? _259 : as_type<float>(_2174);
    float _2372 = float(uint(_1458));
    int _2374 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2376 = _2374 != 0;
    int _2378 = ~_1081;
    int _2380 = _2378 + 1;
    float _2382 = as_type<float>(_1139) * _2372;
    bool _2384 = !_2376;
    float _2386 = _2384 ? _259 : as_type<float>(_2354);
    bool _2388 = _1200 != 2;
    float _2390 = trunc(_2382);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = 0.0;
    if (!_1230)
    {
        _2396 = _1168;
    }
    float _2398 = _2396;
    float _2400 = _2398;
    if (!_1230)
    {
        _2060 = _1170;
    }
    float _2402 = _2060;
    float _2404 = 0.0;
    float _2406 = _2402;
    if (!_1230)
    {
        _2404 = _2398;
    }
    float _2408 = _2404;
    int _2410 = _2380 * int(_2394);
    int _2412 = _2410 + _1458;
    float _2414 = 0.0;
    float _2416 = _2408;
    if (!_1230)
    {
        _2414 = _1170;
    }
    float _2418 = _2414;
    float _2420 = _2418;
    if (_1230)
    {
        _2416 = _1166;
    }
    float _2422 = _2416;
    float _2424 = float(uint(_2412));
    if (_1230)
    {
        _2400 = _1166;
    }
    float _2426 = _2400;
    if (_1230)
    {
        _2406 = _1168;
    }
    float _2428 = _2406;
    float _2430 = as_type<float>(_1139) * _2424;
    if (_1230)
    {
        _2420 = _1168;
    }
    float _2432 = _2420;
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2436 = ~_1081;
    int _2438 = _2436 + 1;
    float _2440 = trunc(_2430);
    float _2442 = precise::max(_2440, 0.0);
    uint _2444 = uint(_2442);
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2448 = _2446 != 0;
    int _2450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2452 = _2450 != 0;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2456 = _2454 != 0;
    int _2458 = ~_1724;
    int _2460 = _2458 + 1;
    bool _2462 = !_2452;
    int _2464 = _2462 ? 0 : 1;
    bool _2466 = _1670 != 0;
    float _2468 = 0.0;
    if (_2388)
    {
        _2468 = _1166;
    }
    float _2470 = _2468;
    float _2472 = 0.0;
    float _2474 = _2470;
    if (_2388)
    {
        _2472 = _1168;
    }
    float _2476 = _2472;
    float _2478 = _2476;
    if (!_2388)
    {
        _2474 = _1170;
    }
    float _2480 = _2474;
    int _2482 = int(_2394) + int(_2444);
    if (!_2388)
    {
        _2478 = _1166;
    }
    float _2484 = _2478;
    int _2486 = ~_1724;
    int _2488 = _2486 + 1;
    int _2490 = _2438 * _2482;
    int _2492 = _2490 + _1458;
    bool _2494 = !_2448;
    int _2496 = _2494 ? 0 : 1;
    int _2498 = abs(_2464);
    bool _2500 = uint(_2492) >= uint(_1081);
    float _2502 = float(uint(_1946));
    bool _2504 = !_2500;
    int _2506 = _2504 ? 0 : (-1);
    int _2508 = abs(_2496);
    float _2510 = as_type<float>(_1744) * _2502;
    bool _2512 = !_2456;
    int _2514 = _2512 ? 0 : 1;
    int _2516 = ~_2482;
    int _2518 = _2516 + _2506;
    int _2520 = _2518 + 1;
    float _2522 = trunc(_2510);
    float _2524 = precise::max(_2522, 0.0);
    uint _2526 = uint(_2524);
    float _2528 = float(uint(_2154));
    float _2530 = as_type<float>(_1794) * _2528;
    int _2532 = _2488 * int(_2526);
    int _2534 = _2532 + _1946;
    float _2536 = float(uint(_2534));
    float _2538 = as_type<float>(_1744) * _2536;
    float _2540 = trunc(_2530);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = trunc(_2538);
    float _2548 = precise::max(_2546, 0.0);
    uint _2550 = uint(_2548);
    float _2552 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2554 = log2(_2552);
    int _2556 = int(_2526) + int(_2550);
    int _2558 = ~_1766;
    int _2560 = _2558 + 1;
    int _2562 = _2460 * _2556;
    int _2564 = _2562 + _1946;
    int _2566 = _2560 * int(_2544);
    int _2568 = _2566 + _2154;
    bool _2570 = uint(_2564) >= uint(_1724);
    float _2572 = float(uint(_2568));
    bool _2574 = !_2280;
    int _2576 = _2574 ? 0 : 1;
    bool _2578 = _2278 != 3;
    float _2580 = as_type<float>(_1794) * _2572;
    int _2582 = ~_1766;
    int _2584 = _2582 + 1;
    bool _2586 = !_2570;
    int _2588 = _2586 ? 0 : (-1);
    float _2590 = trunc(_2580);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    float _2596 = _115 * _2554;
    float _2598 = exp2(_2596);
    int _2600 = int(_2544) + int(_2594);
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2604 = 1.0 + _2602;
    int _2606 = _2584 * _2600;
    int _2608 = _2606 + _2154;
    bool _2610 = !_2578;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = 1.0 / _2604;
    bool _2616 = _1280 >= 0.0;
    bool _2618 = isnan(_1280);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan(0.0);
    bool _2624 = _2620 || _2622;
    bool _2626 = uint(_2608) >= uint(_1766);
    int _2628 = _2624 ? 0 : 1;
    float _2630 = -_2598;
    float _2632 = _2630 + 1.0;
    bool _2634 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2636 = isnan(0.0);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2642 = _2638 || _2640;
    bool _2644 = !_2626;
    int _2646 = _2644 ? 0 : (-1);
    float _2648 = _2642 ? _2632 : 0.0;
    bool _2650 = _1280 > 0.0;
    bool _2652 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2654 = isnan(1.0);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2660 = _2656 || _2658;
    float _2662 = _2648 * _2614;
    int _2664 = ~_2628;
    int _2666 = _2664 + 1;
    int _2668 = _2666 + 1;
    int _2670 = ~_2600;
    int _2672 = _2670 + _2646;
    int _2674 = _2672 + 1;
    bool _2676 = !_2660;
    float _2678 = _2676 ? _115 : _2662;
    int _2680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2682 = _2680 != 0;
    int _2684 = _1766 * _2674;
    int _2686 = _2684 + _2154;
    bool _2688 = !_2466;
    int _2690 = _2688 ? 0 : 1;
    int _2692 = _2668;
    if (!_2650)
    {
        int _2694 = ~_2628;
        int _2696 = _2694 + 1;
        _2692 = _2696;
    }
    int _2698 = _2692;
    float _2700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _259);
    int _2702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2704 = _2702 != 0;
    float _2706 = _455 * _217;
    float _2708 = _1366 * _2700;
    float _2710 = fma(_463, _215, _2706);
    float _2712 = _1266 * _1296;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2720 = _1166 + _1170;
    bool _2722 = !_2126;
    int _2724 = _2722 ? _2686 : (-1);
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2728 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2718);
    float _2730 = 1.0 / _2716;
    float _2732 = _1168 + (-0.5);
    float _2734 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2726);
    float _2736 = _1166 + (-0.5);
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2740 = _1170 + (-0.5);
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2744 = _2720 + (-1.0);
    float _2746 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2738);
    float _2748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2750 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2752 = _2750 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2754 = fma(_1426, -2.0, _2742);
    float _2756 = -_2748;
    float _2758 = fma(_1400, 2.0, _2756);
    float _2760 = fma(_485, _219, _2710);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2764 = _2762 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2766 = fma(_485, _247, _1394);
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2768;
    float _2772 = 1.0 / _2752;
    float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2776 = _2774 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2778 = -_115;
    float _2780 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2758);
    float _2782 = _2770 * _1504;
    float _2784 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2786 = _2784 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2788 = _2776 * _2730;
    float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2790;
    float _2794 = fma(_2782, _1442, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2796 = 1.0 / _2764;
    float _2798 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2800 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2798;
    float _2802 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2804 = _2802 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2806 = _1546 + _1446;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2810 = _1069 + _2808;
    float _2812 = _2800 * _1548;
    bool _2814 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2816 = isnan(_1069);
    bool _2818 = _2814 || _2816;
    bool _2820 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2822 = _2818 || _2820;
    float _2824 = float(_2822);
    float _2826 = _2804 * _1524;
    float _2828 = 1.0 / _2786;
    float _2830 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2832 = _2830 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2834 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2836 = isnan(_1069);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2842 = _2838 || _2840;
    float _2844 = float(_2842);
    float _2846 = _2792 * _2772;
    float _2848 = fma(_2826, _2810, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2850 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2852 = isnan(_1069);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2858 = _2854 || _2856;
    float _2860 = float(_2858);
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2864 = _1069 + _2862;
    float _2866 = _2832 * _2796;
    float _2868 = -_2844;
    float _2870 = _2868 + 1.0;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2874 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2872;
    float _2876 = -_2860;
    float _2878 = _2876 + 1.0;
    float _2880 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2754);
    float _2882 = _2824 * _2870;
    bool _2884 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2886 = isnan(_1069);
    bool _2888 = _2884 || _2886;
    bool _2890 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2892 = _2888 || _2890;
    float _2894 = float(_2892);
    float _2896 = -_2824;
    float _2898 = _2896 + 1.0;
    float _2900 = _2874 * _2828;
    bool _2902 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2904 = isnan(_1069);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2910 = _2906 || _2908;
    float _2912 = float(_2910);
    float _2914 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2728);
    float _2916 = -_2894;
    float _2918 = _2916 + 1.0;
    float _2920 = _2860 * _2898;
    float _2922 = _2894 * _2878;
    float _2924 = -_2912;
    float _2926 = _2924 + 1.0;
    float _2928 = _2912 * _2918;
    bool _2930 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2932 = isnan(_1069);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2938 = _2934 || _2936;
    float _2940 = float(_2938);
    float _2942 = in.m_62.w;
    float _2944 = _1536 * _2926;
    bool _2946 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2948 = isnan(_1069);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2954 = _2950 || _2952;
    float _2956 = float(_2954);
    float _2958 = -_1536;
    float _2960 = _2958 + 1.0;
    float _2962 = -_2940;
    float _2964 = _2962 + 1.0;
    float _2966 = _1412 + (-1.0);
    float _2968 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2970 = _2940 * _2960;
    float _2972 = _2956 * _2964;
    float _2974 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2976 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2978 = _1069 + _2976;
    float _2980 = -_2956;
    float _2982 = _2980 + 1.0;
    float _2984 = _2794 * _2972;
    float _2986 = _2760 + _1434;
    float _2988 = fma(_2788, _2978, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2990 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2992 = _1069 + _2990;
    float _2994 = fma(_2982, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2984);
    bool _2996 = uint(_2264) >= 2u;
    float _2998 = fma(_2812, _2992, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3000 = fma(_2988, _2970, _2994);
    float _3002 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3004 = _1069 + _3002;
    float _3006 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3008 = _1069 + _3006;
    float _3010 = fma(_2866, _2864, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3012 = fma(_2998, _2944, _3000);
    float _3014 = fma(_2846, _3004, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3016 = _2386 + 0.5;
    float _3018 = _2362 + (-0.5);
    float _3020 = fma(_2848, _2928, _3012);
    float _3022 = fma(_2900, _3008, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3024 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2780);
    float _3026 = -_3018;
    float _3028 = -_2880;
    float _3030 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3028);
    float _3032 = fma(_3014, _2922, _3020);
    float _3034 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3036 = fma(_3010, _2920, _3032);
    float _3038 = in.m_70.x;
    float _3040 = in.m_70.y;
    float _3042 = in.m_70.z;
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3046 = fma(_3022, _2882, _3036);
    float _3048 = float(_2698);
    float _3050 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3052 = -_3044;
    float _3054 = fma(_3034, 2.0, _3052);
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3058 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3050);
    float _3060 = float(_2508);
    float _3062 = fma(_2426, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3056);
    float _3064 = _2766 + _2942;
    float _3066 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3068 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3058);
    float _3070 = _3060 * _3048;
    float _3072 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3074 = float(_2066);
    float _3076 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3062);
    float _3078 = _3070 * (-2.0);
    float _3080 = -_3066;
    float _3082 = fma(_3072, 2.0, _3080);
    float _3084 = -_3076;
    float _3086 = _3084 + 1.0;
    float _3088 = fma(_1540, _3078, _1540);
    float _3090 = fma(_3078, _3038, _3038);
    float _3092 = float(_2498);
    float _3094 = -_115;
    float _3096 = fma(_3094, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3082);
    int _3098 = abs(_2514);
    float _3100 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3090);
    float _3102 = _3092 * _3074;
    float _3104 = -_3068;
    float _3106 = _3104 + 1.0;
    float _3108 = fma(_2678, _3088, _3100);
    float _3110 = float(_2124);
    float _3112 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3114 = float(_3098);
    float _3116 = _3102 * (-2.0);
    float _3118 = _3108 * 0.15915493667125701904296875;
    float _3120 = fma(_2434, -2.0, _3112);
    float _3122 = _3114 * _3110;
    float _3124 = fma(_3116, _3040, _3040);
    float _3126 = fma(_2974, _3116, _2974);
    float _3128 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3120);
    float _3130 = _3122 * (-2.0);
    float _3132 = fma(_2732, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3124);
    float _3134 = _3118 * 6.283185482025146484375;
    float _3136 = sin(_3134);
    float _3138 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3140 = fma(_3130, _3042, _3042);
    float _3142 = fma(_2968, _3130, _2968);
    float _3144 = fma(_2678, _3126, _3132);
    float _3146 = _2370 + 0.5;
    float _3148 = fma(_2740, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3140);
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3152 = _3144 * 0.15915493667125701904296875;
    float _3154 = fma(_3146, (*spvDescriptorSet0.vp_c9)._m0[85].x, _3096);
    float _3156 = fma(_2678, _3142, _3148);
    float _3158 = _1500 + (-0.5);
    float _3160 = -_1538;
    float _3162 = _3160 + 1.0;
    float _3164 = _3118 * 6.283185482025146484375;
    float _3166 = cos(_3164);
    float _3168 = _3156 * 0.15915493667125701904296875;
    float _3170 = -_3086;
    float _3172 = fma(_2370, _3170, _3154);
    int _3174 = ~_2556;
    int _3176 = _3174 + _2588;
    int _3178 = _3176 + 1;
    float _3180 = -_3158;
    float _3182 = -_3128;
    float _3184 = fma(_3180, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3182);
    int _3186 = _2250 >> 31;
    float _3188 = fma(_2362, _3162, _3030);
    float _3190 = -_2914;
    float _3192 = _3190 + 1.0;
    float _3194 = _3152 * 6.283185482025146484375;
    float _3196 = sin(_3194);
    int _3198 = _3186 & 3;
    float _3200 = fma(_1500, _3106, _3184);
    float _3202 = -_3192;
    float _3204 = fma(_2386, _3202, _3024);
    int _3206 = _1081 * _2520;
    int _3208 = _3206 + _1458;
    int _3210 = _2250 + _3198;
    int _3212 = _1724 * _3178;
    int _3214 = _3212 + _1946;
    float _3216 = fma(_3138, -2.0, _3150);
    float _3218 = _3152 * 6.283185482025146484375;
    float _3220 = cos(_3218);
    out.m_72.x = _3204;
    out.m_72.y = _3188;
    out.m_72.z = _3172;
    out.m_72.w = _3200;
    float _3222 = fma(_2844, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3046);
    out.m_74.x = _3222;
    float _3224 = _3168 * 6.283185482025146484375;
    float _3226 = cos(_3224);
    float _3228 = _3136 * _3196;
    int _3230 = _3210 >> 2;
    float _3232 = _3168 * 6.283185482025146484375;
    float _3234 = sin(_3232);
    float _3236 = _3136 * _3220;
    float _3238 = _3166 * _3196;
    int _3240 = _3230 << 4;
    int _3242 = _3240 + 656;
    float _3244 = _3166 * _3220;
    float _3246 = _3136 * _3226;
    float _3248 = _3220 * _3226;
    float _3250 = _3166 * _3226;
    float _3252 = _3196 * _3226;
    float _3254 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3256 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3258 = -_3238;
    float _3260 = fma(_3234, _3236, _3258);
    float _3262 = -_3236;
    float _3264 = fma(_3234, _3238, _3262);
    float _3266 = -_2712;
    float _3268 = _3234 * _3266;
    uint _3270 = uint(int(uint(_3242) >> uint(2)));
    uint _3272 = uint(int(uint(int(_3270)) >> uint(2)));
    int _3274 = int(_3270) & 3;
    float _3276 = (*spvDescriptorSet0.vp_c9)._m0[int(_3272)][_3274];
    int _3278 = int(_3270) + 1;
    uint _3280 = uint(int(uint(_3278) >> uint(2)));
    int _3282 = _3278 & 3;
    float _3284 = (*spvDescriptorSet0.vp_c9)._m0[int(_3280)][_3282];
    float _3286 = fma(_3234, _3244, _3228);
    float _3288 = fma(_3234, _3228, _3244);
    float _3290 = fma(_3248, _2708, _3268);
    float _3292 = _3246 * _2712;
    float _3294 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3296 = _3250 * _2712;
    float _3298 = -_3234;
    float _3300 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3254);
    float _3302 = fma(_3260, _2708, _3292);
    float _3304 = -_3234;
    float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3294);
    int _3308 = _3242 + 8;
    uint _3310 = uint(int(uint(_3308) >> uint(2)));
    uint _3312 = uint(int(uint(int(_3310)) >> uint(2)));
    int _3314 = int(_3310) & 3;
    float _3316 = (*spvDescriptorSet0.vp_c9)._m0[int(_3312)][_3314];
    int _3318 = int(_3310) + 1;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    int _3322 = _3318 & 3;
    float _3324 = (*spvDescriptorSet0.vp_c9)._m0[int(_3320)][_3322];
    float _3326 = -_3234;
    float _3328 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3256);
    float _3330 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3332 = fma(_3286, _2708, _3296);
    float _3334 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3336 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3338 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3330);
    float _3340 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3328);
    float _3342 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3344 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3334);
    float _3346 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3336);
    float _3348 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3306);
    float _3350 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3352 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3354 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3356 = fma(_3264, _3342, _3332);
    float _3358 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3350);
    float _3360 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3352);
    float _3362 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3354);
    float _3364 = fma(_3252, _3342, _3290);
    float _3366 = _3356 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3368 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3358);
    float _3370 = fma(_3288, _3342, _3302);
    float _3372 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3360);
    float _3374 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3362);
    float _3376 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3366);
    float _3378 = _3356 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3380 = _1600 >> 31;
    float _3382 = fma(_3370, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3376);
    int _3384 = abs(_2576);
    float _3386 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3378);
    int _3388 = ~_2300;
    int _3390 = _3388 + 1;
    int _3392 = _3390 + 1;
    float _3394 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3300);
    int _3396 = _3380 & 3;
    float _3398 = fma(_3370, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3386);
    int _3400 = ~_3384;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    float _3406 = _3356 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3408 = _3392 * as_type<int>(_3284);
    int _3410 = _1600 + _3396;
    float _3412 = _263 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3414 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3416 = int(_3414);
    int _3418 = _3404 * as_type<int>(_3276);
    int _3420 = _3418 + _3408;
    float _3422 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3406);
    int _3424 = _2212 >> 31;
    float _3426 = _3412 * _3340;
    int _3428 = ~_2344;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    float _3434 = fma(_3370, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3422);
    int _3436 = _3424 & 3;
    float _3438 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3440 = abs(_2612);
    int _3442 = _3432 * as_type<int>(_3316);
    int _3444 = _3442 + _3420;
    float _3446 = _3382 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3448 = _3064 + _3438;
    int _3450 = abs(_2348);
    float _3452 = _3412 * _3394;
    float _3454 = _2986 + _3446;
    int _3456 = ~_3440;
    int _3458 = _3456 + 1;
    int _3460 = _3458 + 1;
    float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3464 = _3448 + _3462;
    int _3466 = abs(_3416);
    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3470 = _3454 + _3468;
    int _3472 = _2212 + _3436;
    float _3474 = _3464 * _3464;
    int _3476 = ~_3450;
    int _3478 = _3476 + 1;
    int _3480 = _3478 + 1;
    float _3482 = _3470 * _3470;
    float _3484 = float(uint(_3466));
    int _3486 = _3460 * as_type<int>(_3324);
    int _3488 = _3486 + _3444;
    int _3490 = _3472 >> 2;
    float _3492 = _3482 + _3474;
    float _3494 = 1.0 / _3484;
    int _3496 = _3488 * _3480;
    int _3498 = _3410 >> 2;
    float _3500 = _259 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3502 = _3412 * _3348;
    int _3504 = _2724 * _3450;
    int _3506 = _3504 + _3496;
    int _3508 = _3498 << 4;
    int _3510 = _3508 + 368;
    float _3512 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3344);
    float _3514 = sqrt(_3492);
    int _3516 = _3490 << 4;
    int _3518 = _3516 + 512;
    float _3520 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3338);
    float _3522 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3346);
    float _3524 = fma(_3500, _3512, _3502);
    int _3526 = abs(_3506);
    float _3528 = fma(_3500, _3520, _3452);
    float _3530 = float(uint(_3416));
    float _3532 = fma(_3500, _3522, _3426);
    uint _3534 = uint(int(uint(_3518) >> uint(2)));
    uint _3536 = uint(int(uint(int(_3534)) >> uint(2)));
    int _3538 = int(_3534) & 3;
    float _3540 = (*spvDescriptorSet0.vp_c9)._m0[int(_3536)][_3538];
    int _3542 = int(_3534) + 1;
    uint _3544 = uint(int(uint(_3542) >> uint(2)));
    int _3546 = _3542 & 3;
    float _3548 = (*spvDescriptorSet0.vp_c9)._m0[int(_3544)][_3546];
    float _3550 = _3434 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3552 = as_type<int>(_3494) + (-2);
    float _3554 = 1.0 / _3530;
    int _3556 = _2996 ? 0 : 1;
    float _3558 = _2806 + _3550;
    bool _3560 = !_2266;
    int _3562 = _3560 ? 0 : 1;
    int _3564 = _3518 + 8;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    uint _3568 = uint(int(uint(int(_3566)) >> uint(2)));
    int _3570 = int(_3566) & 3;
    float _3572 = (*spvDescriptorSet0.vp_c9)._m0[int(_3568)][_3570];
    int _3574 = int(_3566) + 1;
    uint _3576 = uint(int(uint(_3574) >> uint(2)));
    int _3578 = _3574 & 3;
    float _3580 = (*spvDescriptorSet0.vp_c9)._m0[int(_3576)][_3578];
    bool _3582 = _3514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _3584 = _1626 != 3;
    int _3586 = ~_3556;
    int _3588 = _3586 + 1;
    int _3590 = _3588 + 1;
    bool _3592 = _2264 != 3;
    uint _3594 = uint(int(uint(_3510) >> uint(2)));
    uint _3596 = uint(int(uint(int(_3594)) >> uint(2)));
    int _3598 = int(_3594) & 3;
    float _3600 = (*spvDescriptorSet0.vp_c9)._m0[int(_3596)][_3598];
    int _3602 = int(_3594) + 1;
    uint _3604 = uint(int(uint(_3602) >> uint(2)));
    int _3606 = _3602 & 3;
    float _3608 = (*spvDescriptorSet0.vp_c9)._m0[int(_3604)][_3606];
    float _3610 = float(uint(_3526));
    int _3612 = as_type<int>(_3554) + (-2);
    float _3614 = as_type<float>(_3552) * _3610;
    float _3616 = _3554;
    float _3618 = _3550;
    float _3620 = _3610;
    float _3622 = _3500;
    float _3624 = as_type<float>(_3510);
    int _3626 = _3590;
    float _3628 = _3374;
    float _3630 = _3520;
    if (!_3582)
    {
        _3616 = _3474;
    }
    float _3632 = _3616;
    int _3634 = _3510 + 8;
    uint _3636 = uint(int(uint(_3634) >> uint(2)));
    uint _3638 = uint(int(uint(int(_3636)) >> uint(2)));
    int _3640 = int(_3636) & 3;
    float _3642 = (*spvDescriptorSet0.vp_c9)._m0[int(_3638)][_3640];
    int _3644 = int(_3636) + 1;
    uint _3646 = uint(int(uint(_3644) >> uint(2)));
    int _3648 = _3644 & 3;
    float _3650 = (*spvDescriptorSet0.vp_c9)._m0[int(_3646)][_3648];
    float _3652 = _3632;
    if (!_3582)
    {
        _3618 = _3482;
    }
    float _3654 = _3618;
    float _3656 = _3654;
    if (!_3582)
    {
        _3620 = _3448;
    }
    float _3658 = _3620;
    float _3660 = trunc(_3614);
    float _3662 = precise::max(_3660, 0.0);
    uint _3664 = uint(_3662);
    float _3666 = _3658;
    if (!_3582)
    {
        _3622 = _3558;
    }
    float _3668 = _3622;
    float _3670 = _3668;
    if (!_3582)
    {
        _3624 = _3454;
    }
    float _3672 = _3624;
    float _3674 = float(uint(_3506));
    float _3676 = as_type<float>(_3612) * _3674;
    bool _3678 = !_3582;
    float _3680 = _3672;
    if (!_3678)
    {
        float _3682 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3684 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3686 = _3514 + _3684;
        float _3688 = rsqrt(_3492);
        float _3690 = _3686 * _3682;
        float _3692 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3694 = _3690 * 0.15915493667125701904296875;
        float _3696 = _3694 * 6.283185482025146484375;
        float _3698 = sin(_3696);
        float _3700 = _3694 * 6.283185482025146484375;
        float _3702 = cos(_3700);
        float _3704 = fma(_3698, _3692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3706 = _3688 * _3704;
        float _3708 = _3702 + (-1.0);
        float _3710 = fma(_3470, _3706, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3712 = fma(_3464, _3706, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3714 = _3708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3716 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3718 = _3710 + _3716;
        float _3720 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3722 = _3712 + _3720;
        float _3724 = fma(_3558, _3702, _3714);
        float _3726 = _3718 * _3718;
        float _3728 = _3722 * _3722;
        _3670 = _3724;
        _3656 = _3726;
        _3652 = _3728;
        _3680 = _3710;
        _3666 = _3712;
    }
    float _3730 = _3670;
    float _3732 = _3656;
    float _3734 = _3652;
    float _3736 = _3680;
    float _3738 = _3666;
    float _3740 = trunc(_3676);
    float _3742 = precise::max(_3740, 0.0);
    uint _3744 = uint(_3742);
    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3748 = _3730 + _3746;
    int _3750 = abs(_1714);
    float _3752 = -_115;
    float _3754 = fma(_3752, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3054);
    int _3756 = ~_3416;
    int _3758 = _3756 + 1;
    float _3760 = fma(_3748, _3748, _3732);
    int _3762 = abs(_2276);
    float _3764 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2734);
    out.m_76.x = _3512;
    out.m_76.y = _3520;
    out.m_76.z = _3522;
    int _3766 = abs(_2690);
    float _3768 = -_3764;
    float _3770 = _3768 + 1.0;
    if (_3592)
    {
        int _3772 = ~_3556;
        int _3774 = _3772 + 1;
        _3626 = _3774;
    }
    int _3776 = _3626;
    int _3778 = ~_3466;
    int _3780 = _3778 + 1;
    int _3782 = _3758 * int(_3744);
    int _3784 = _3782 + _3506;
    int _3786 = ~_3750;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    int _3792 = ~_3766;
    int _3794 = _3792 + 1;
    int _3796 = _3794 + 1;
    int _3798 = _3780 * int(_3664);
    int _3800 = _3798 + _3526;
    float _3802 = float(uint(_3784));
    int _3804 = _3790 * as_type<int>(_3608);
    int _3806 = abs(_3562);
    float _3808 = float(uint(_3800));
    float _3810 = as_type<float>(_3612) * _3802;
    int _3812 = ~_3762;
    int _3814 = _3812 + 1;
    int _3816 = _3814 + 1;
    int _3818 = _3796 * as_type<int>(_3600);
    int _3820 = _3818 + _3804;
    int _3822 = abs(_3776);
    float _3824 = as_type<float>(_3552) * _3808;
    int _3826 = abs(_2330);
    float _3828 = trunc(_3810);
    float _3830 = precise::max(_3828, 0.0);
    uint _3832 = uint(_3830);
    int _3834 = ~_3806;
    int _3836 = _3834 + 1;
    int _3838 = _3836 + 1;
    int _3840 = _3816 * as_type<int>(_3548);
    bool _3842 = !_3584;
    int _3844 = _3842 ? 0 : (-1);
    int _3846 = _3838 * as_type<int>(_3540);
    int _3848 = _3846 + _3840;
    int _3850 = ~_3822;
    int _3852 = _3850 + 1;
    int _3854 = _3852 + 1;
    float _3856 = trunc(_3824);
    float _3858 = precise::max(_3856, 0.0);
    uint _3860 = uint(_3858);
    bool _3862 = _2264 != 3;
    int _3864 = abs(_3844);
    int _3866 = _3854 * as_type<int>(_3572);
    int _3868 = _3866 + _3848;
    int _3870 = ~_3826;
    int _3872 = _3870 + 1;
    int _3874 = _3872 + 1;
    float _3876 = _3760 + _3734;
    bool _3878 = !_3862;
    int _3880 = _3878 ? 0 : (-1);
    int _3882 = ~_3416;
    int _3884 = _3882 + 1;
    int _3886 = _3874 * as_type<int>(_3642);
    int _3888 = _3886 + _3820;
    int _3890 = int(_3744) + int(_3832);
    float _3892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3894 = ~_3466;
    int _3896 = _3894 + 1;
    int _3898 = abs(_3880);
    int _3900 = _3884 * _3890;
    int _3902 = _3900 + _3506;
    int _3904 = int(_3664) + int(_3860);
    int _3906 = ~_3898;
    int _3908 = _3906 + 1;
    int _3910 = _3908 + 1;
    float _3912 = sqrt(_3876);
    int _3914 = _3896 * _3904;
    int _3916 = _3914 + _3526;
    bool _3918 = !_2682;
    int _3920 = _3918 ? 0 : 1;
    int _3922 = _3910 * as_type<int>(_3580);
    int _3924 = _3922 + _3868;
    bool _3926 = uint(_3902) >= uint(_3416);
    int _3928 = ~_3864;
    int _3930 = _3928 + 1;
    int _3932 = _3930 + 1;
    bool _3934 = uint(_3916) >= uint(_3466);
    int _3936 = _3506 ^ _3416;
    int _3938 = _3932 * as_type<int>(_3650);
    int _3940 = _3938 + _3888;
    bool _3942 = !_3926;
    int _3944 = _3942 ? 0 : (-1);
    int _3946 = abs(_3920);
    float _3948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3950 = !_3934;
    int _3952 = _3950 ? 0 : (-1);
    uint _3954 = uint(int(uint(_3936) >> uint(31)));
    bool _3956 = !_2704;
    int _3958 = _3956 ? 0 : 1;
    int _3960 = ~_3890;
    int _3962 = _3960 + _3944;
    int _3964 = _3962 + 1;
    int _3966 = ~_3952;
    int _3968 = _3904 + _3966;
    int _3970 = _3968 + 1;
    int _3972 = ~int(_3954);
    int _3974 = _3972 + 1;
    int _3976 = _3416 * _3964;
    int _3978 = _3976 + _3506;
    int _3980 = abs(_3958);
    bool _3982 = _3416 == 0;
    bool _3984 = _3416 == 0;
    float _3986 = fma(_3412, _3412, 1.0);
    int _3988 = _3970 ^ _3974;
    int _3990 = ~_3980;
    int _3992 = _3990 + 1;
    int _3994 = _3992 + 1;
    int _3996 = ~_3946;
    int _3998 = _3996 + 1;
    int _4000 = _3998 + 1;
    float _4002 = rsqrt(_3986);
    bool _4004 = _1081 == 0;
    int _4006 = _3940 * _3994;
    int _4008 = ~_3974;
    int _4010 = _4008 + _3988;
    int _4012 = _4010 + 1;
    float _4014 = _3948 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _4016 = !_3982;
    int _4018 = _4016 ? _3978 : (-1);
    int _4020 = _3924 * _4000;
    bool _4022 = !_3984;
    int _4024 = _4022 ? _4012 : (-1);
    float _4026 = _3892 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4028 = float(_4018);
    bool _4030 = _1724 == 0;
    float _4032 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3216);
    bool _4034 = !_4004;
    int _4036 = _4034 ? _3208 : (-1);
    float _4038 = fma(_4026, _4028, _3754);
    float _4040 = float(_4024);
    float _4042 = _1294 + 0.5;
    bool _4044 = !_4030;
    int _4046 = _4044 ? _3214 : (-1);
    int _4048 = _4036 * _3980;
    int _4050 = _4048 + _4006;
    float _4052 = _1332 + (-0.5);
    float _4054 = -_4032;
    float _4056 = fma(_4014, _4040, _4054);
    float _4058 = fma(_4026, _4042, _4038);
    int _4060 = _4046 * _3946;
    int _4062 = _4060 + _4020;
    float _4064 = _3412 * _4002;
    float _4066 = -_4014;
    float _4068 = fma(_4066, _4052, _4056);
    float _4070 = -_3770;
    float _4072 = fma(_1294, _4070, _4058);
    float _4074 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2746);
    float _4076 = -_3368;
    float _4078 = _4064 * _4076;
    float _4080 = -_3372;
    float _4082 = _4064 * _4080;
    float _4084 = -_3374;
    float _4086 = _4064 * _4084;
    float _4088 = -_4074;
    float _4090 = _4088 + 1.0;
    float _4092 = fma(_4002, _3348, _4078);
    float _4094 = fma(_4002, _3394, _4082);
    float _4096 = fma(_4002, _3340, _4086);
    float _4098 = _3368 + _3524;
    float _4100 = _3372 + _3528;
    float _4102 = _3374 + _3532;
    float _4104 = float(_4050);
    float _4106 = fma(_1332, _4090, _4068);
    float _4108 = float(_4062);
    out.m_78.x = _4092;
    out.m_78.y = _4094;
    out.m_78.z = _4096;
    bool _4110 = _3912 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4112 = isnan(_3912);
    bool _4114 = _4110 || _4112;
    bool _4116 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4118 = _4114 || _4116;
    out.m_80.x = _4098;
    out.m_80.y = _4100;
    out.m_80.z = _4102;
    out.m_82.x = _4104;
    out.m_82.y = _4108;
    out.m_84.x = _4072;
    out.m_84.y = _4106;
    float _4120 = _4090;
    if (!_4118)
    {
        _3628 = 1.0;
    }
    float _4122 = _3628;
    bool _4124 = !_4118;
    float _4126 = _4122;
    if (!_4124)
    {
        bool _4128 = _3912 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4130 = isnan(_3912);
        bool _4132 = _4128 || _4130;
        bool _4134 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4136 = _4132 || _4134;
        if (!_4136)
        {
            float _4138 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4140 = _3912 + _4138;
            float _4142 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4144 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4142;
            float _4146 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4148 = _4146 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4150 = 1.0 / _4144;
            float _4152 = _4140 * _4150;
            float _4154 = fma(_4152, _4148, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4126 = _4154;
            _3630 = _4150;
            _4156 = true;
        }
        else
        {
            bool _4158 = _3912 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4160 = isnan(_3912);
            bool _4162 = _4158 || _4160;
            bool _4164 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4166 = _4162 || _4164;
            if (!_4166)
            {
                float _4168 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4170 = _3912 + _4168;
                float _4172 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4174 = _4172 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4176 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4178 = _4176 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4180 = 1.0 / _4174;
                float _4182 = _4170 * _4180;
                float _4184 = fma(_4182, _4178, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4126 = _4184;
                _3630 = _4180;
                _4156 = true;
            }
            else
            {
                _4126 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4156 = false;
    float _4186 = _4126;
    float _4188 = _3630;
    float _4190 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4192 = _3730 + _4190;
    float _4194 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4196 = _3736 + _4194;
    float _4198 = fma(_4192, _4186, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4200 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4202 = _3738 + _4200;
    float _4204 = fma(_4196, _4186, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4206 = -_2806;
    float _4208 = _4206 + _4198;
    float _4210 = fma(_4202, _4186, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4212 = -_2986;
    float _4214 = _4212 + _4204;
    float _4216 = _4208 * _4208;
    float _4218 = -_3064;
    float _4220 = _4218 + _4210;
    float _4222 = fma(_4214, _4214, _4216);
    float _4224 = fma(_4220, _4220, _4222);
    float _4226 = sqrt(_4224);
    bool _4228 = _4226 > 0.0;
    float _4230 = _4186;
    float _4232 = _4226;
    float _4234 = _4188;
    float _4236 = _4202;
    if (!_4228)
    {
        _4230 = _4204;
    }
    float _4238 = _4230;
    float _4240 = _4238;
    float _4242 = _4238;
    float _4244 = _4238;
    if (!_4228)
    {
        _4232 = _4198;
    }
    float _4246 = _4232;
    float _4248 = _4246;
    float _4250 = _4246;
    float _4252 = _4246;
    if (!_4228)
    {
        _4234 = _4210;
    }
    float _4254 = _4234;
    bool _4256 = !_4228;
    float _4258 = _4254;
    if (!_4256)
    {
        bool _4260 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4262 = _4254;
        if (_4260)
        {
            float _4264 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4262 = _4264;
        }
        float _4266 = _4262;
        float _4268 = _4266;
        if (_4260)
        {
            float _4270 = _487 * _4266;
            _4120 = _4270;
        }
        float _4272 = _4120;
        float _4274 = _4272;
        if (_4260)
        {
            float _4276 = _489 * _4266;
            _1708 = _4276;
        }
        float _4278 = _1708;
        float _4280 = _4278;
        if (_4260)
        {
            float _4282 = _491 * _4266;
            _4236 = _4282;
        }
        float _4284 = _4236;
        float _4286 = _4284;
        if (!_4260)
        {
            bool _4288 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4290 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4292 = _4288 || _4290;
            bool _4294 = isnan(1.0);
            bool _4296 = _4292 || _4294;
            float _4298 = _115 + 1.0;
            float _4300 = _4298;
            if (!_4296)
            {
                float _4302 = _4298 * _4298;
                float _4304 = _4302 * 0.5;
                _4248 = _4304;
            }
            float _4306 = _4248;
            float _4308 = _4306;
            if (!_4296)
            {
                float _4310 = _4306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4308 = _4310;
            }
            float _4312 = _4308;
            bool _4314 = !_4296;
            float _4316 = _4312;
            if (!_4314)
            {
                float _4318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4320 = log2(_4318);
                float _4322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4324 = _4322 + 1.0;
                float _4326 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4328 = _4320 * _4298;
                float _4330 = 1.0 / _4324;
                float _4332 = _4326 * 0.693147182464599609375;
                float _4334 = exp2(_4328);
                float _4336 = 1.0 / _4332;
                float _4338 = _4334 + (-1.0);
                float _4340 = -_4338;
                float _4342 = fma(_4340, _4336, _4298);
                float _4344 = _4342 * _4330;
                float _4346 = _4344 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4316 = _4346;
                _4240 = _4330;
            }
            float _4348 = _4316;
            float _4350 = _4240;
            float _4352 = _4348 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4354 = _4348 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4356 = !_4296;
            _4242 = _4350;
            _4250 = _4348;
            _4268 = _4352;
            if (!_4356)
            {
                float _4358 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4360 = log2(_4358);
                float _4362 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4364 = _4362 + 1.0;
                float _4366 = 1.0 / _4364;
                float _4368 = _4360 * _4298;
                float _4370 = exp2(_4368);
                float _4372 = -_4370;
                float _4374 = _4372 + 1.0;
                float _4376 = _4374 * _4366;
                _4300 = _4376;
            }
            float _4378 = _4300;
            float _4380 = fma(_4378, _177, _4354);
            float _4382 = fma(_4378, _175, _4352);
            float _4384 = _4348 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4386 = -_449;
            float _4388 = _4386 + _4380;
            float _4390 = -_447;
            float _4392 = _4390 + _4382;
            float _4394 = fma(_4378, _179, _4384);
            float _4396 = _4388 * _217;
            float _4398 = _4388 * _233;
            float _4400 = _4388 * _245;
            float _4402 = -_461;
            float _4404 = _4402 + _4394;
            float _4406 = fma(_4392, _215, _4396);
            float _4408 = fma(_4392, _231, _4398);
            float _4410 = fma(_4392, _243, _4400);
            float _4412 = fma(_4404, _219, _4406);
            float _4414 = fma(_4404, _235, _4408);
            float _4416 = fma(_4404, _247, _4410);
            _497 = _4414;
            _499 = _4412;
            _501 = _4416;
            _4274 = _4412;
            _4280 = _4414;
            _4286 = _4416;
            _273 = _4394;
            _275 = _4408;
        }
        float _4418 = _497;
        float _4420 = _499;
        float _4422 = _501;
        float _4424 = _4274;
        float _4426 = _4280;
        float _4428 = _4286;
        float _4430 = _4242;
        float _4432 = _4250;
        float _4434 = _4268;
        float _4436 = _273;
        float _4438 = _275;
        float _4440 = _4418 * _4418;
        float _4442 = rsqrt(_4224);
        float _4444 = fma(_4420, _4420, _4440);
        float _4446 = fma(_4422, _4422, _4444);
        float _4448 = sqrt(_4446);
        float _4450 = _4214 * _4442;
        float _4452 = _4208 * _4442;
        float _4454 = _4220 * _4442;
        bool _4456 = _4448 > 0.0;
        float _4458 = _4430;
        float _4460 = _4432;
        float _4462 = _4434;
        _277 = _4448;
        _279 = _4436;
        _281 = _4438;
        if (!_4456)
        {
            _4458 = _4204;
        }
        float _4464 = _4458;
        _4244 = _4464;
        if (!_4456)
        {
            _4460 = _4198;
        }
        float _4466 = _4460;
        _4252 = _4466;
        if (!_4456)
        {
            _4462 = _4210;
        }
        float _4468 = _4462;
        bool _4470 = !_4456;
        _4258 = _4468;
        if (!_4470)
        {
            float _4472 = rsqrt(_4446);
            float _4474 = _4472 * _4418;
            float _4476 = _4472 * _4420;
            float _4478 = _4472 * _4422;
            float _4480 = _4452 * _4474;
            float _4482 = fma(_4450, _4476, _4480);
            float _4484 = fma(_4454, _4478, _4482);
            float _4486 = _4484 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4488 = fma(_4424, _4486, _4204);
            float _4490 = fma(_4426, _4486, _4198);
            float _4492 = fma(_4428, _4486, _4210);
            _4244 = _4488;
            _4252 = _4490;
            _4258 = _4492;
            _277 = _4478;
            _279 = _4474;
        }
    }
    float _4494 = _4244;
    float _4496 = _4252;
    float _4498 = _4258;
    float _4500 = _277;
    float _4502 = _279;
    float _4504 = _281;
    bool _4506 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4510 = _4506 || _4508;
    bool _4512 = isnan(0.5);
    bool _4514 = _4510 || _4512;
    float _4516 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4518 = _4500;
    float _4520 = _4502;
    float _4522 = _4498;
    float _4524 = _4504;
    if (_4514)
    {
        _4516 = _4494;
    }
    float _4526 = _4516;
    float _4528 = _4526;
    if (_4514)
    {
        _4518 = _4496;
    }
    float _4530 = _4518;
    float _4532 = _4530;
    if (_4514)
    {
        _4520 = _4498;
    }
    float _4534 = _4520;
    float _4536 = _4534;
    if (!_4514)
    {
        float _4538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4540 = _2806 + _4538;
        float _4542 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4544 = _2986 + _4542;
        float _4546 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4548 = -_2986;
        float _4550 = _4548 + _4494;
        float _4552 = _4540 * _4540;
        float _4554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4556 = _3064 + _4554;
        float _4558 = -_2806;
        float _4560 = _4558 + _4496;
        float _4562 = -_3064;
        float _4564 = _4562 + _4498;
        float _4566 = fma(_4544, _4544, _4552);
        float _4568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4570 = fma(_4556, _4556, _4566);
        float _4572 = sqrt(_4570);
        float _4574 = _4546 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4576 = precise::min(_4572, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4578 = _4576 * _4568;
        float _4580 = _4574 * _4578;
        float _4582 = fma(_4550, _4580, _2986);
        float _4584 = fma(_4560, _4580, _2806);
        float _4586 = fma(_4564, _4580, _3064);
        _4532 = _4584;
        _4528 = _4582;
        _4536 = _4586;
        _4522 = _4564;
    }
    float _4588 = _4532;
    float _4590 = _4528;
    float _4592 = _4536;
    float _4594 = _4522;
    float _4596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4598 = _4588 + _4596;
    float _4600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4602 = _4590 + _4600;
    float _4604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4606 = _4592 + _4604;
    float _4608 = _4598 * _4598;
    float _4610 = fma(_4602, _4602, _4608);
    float _4612 = fma(_4606, _4606, _4610);
    float _4614 = rsqrt(_4612);
    float _4616 = sqrt(_4612);
    float _4618 = _4614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4620 = _4602 * _4618;
    float _4622 = _4606 * _4618;
    float _4624 = _4620 * _4620;
    float _4626 = _4622 * _4622;
    float _4628 = _4624 + _4626;
    float _4630 = sqrt(_4628);
    bool _4632 = _4630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4636 = _4630 + _4634;
    float _4638 = _4614;
    float _4640 = _4628;
    float _4642 = _4636;
    float _4644 = _4598;
    float _4646 = _4594;
    if (_4632)
    {
        float _4648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4638 = _4648;
    }
    float _4650 = _4638;
    if (_4632)
    {
        float _4652 = rsqrt(_4628);
        _4640 = _4652;
    }
    float _4654 = _4640;
    float _4656 = _4654;
    if (_4632)
    {
        float _4658 = _4636 * _4650;
        _4642 = _4658;
    }
    float _4660 = _4642;
    if (_4632)
    {
        float _4662 = _4660 * 0.15915493667125701904296875;
        _283 = _4662;
    }
    float _4664 = _283;
    float _4666 = _4606;
    if (_4632)
    {
        float _4668 = _4664 * 6.283185482025146484375;
        float _4670 = sin(_4668);
        _4666 = _4670;
    }
    float _4672 = _4666;
    float _4674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4676 = precise::max(0.0, _4674);
    float _4678 = _4650;
    float _4680 = _4676;
    if (_4632)
    {
        float _4682 = _4664 * 6.283185482025146484375;
        float _4684 = cos(_4682);
        _4678 = _4684;
    }
    float _4686 = _4678;
    float _4688 = -_4618;
    float _4690 = -_4676;
    float _4692 = fma(_4598, _4688, _4690);
    if (_4632)
    {
        float _4694 = _4692 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4644 = _4694;
    }
    float _4696 = _4644;
    float _4698 = _4696;
    float _4700 = _4672;
    if (_4632)
    {
        float _4702 = fma(_4672, _4696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4698 = _4702;
    }
    float _4704 = _4698;
    float _4706 = _4704;
    if (!_4632)
    {
        _4700 = _4620;
    }
    float _4708 = _4700;
    float _4710 = _4708;
    float _4712 = _4686;
    if (_4632)
    {
        float _4714 = _4686 + (-1.0);
        _4680 = _4714;
    }
    float _4716 = _4680;
    float _4718 = _4716;
    if (_4632)
    {
        float _4720 = _4654 * _4704;
        _4646 = _4720;
    }
    float _4722 = _4646;
    if (!_4632)
    {
        _4706 = _4692;
    }
    float _4724 = _4706;
    float _4726 = _4724;
    if (_4632)
    {
        float _4728 = _4716 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4524 = _4728;
    }
    float _4730 = _4524;
    if (_4632)
    {
        float _4732 = _4620 * _4722;
        _4710 = _4732;
    }
    float _4734 = _4710;
    if (!_4632)
    {
        _4718 = _4622;
    }
    float _4736 = _4718;
    float _4738 = _4736;
    if (_4632)
    {
        float _4740 = _4622 * _4722;
        _4738 = _4740;
    }
    float _4742 = _4738;
    if (!_4632)
    {
        _4656 = _4624;
    }
    float _4744 = _4656;
    float _4746 = _4744;
    if (_4632)
    {
        float _4748 = fma(_4692, _4686, _4730);
        _4726 = _4748;
    }
    float _4750 = _4726;
    if (_4632)
    {
        float _4752 = _4734 * _4734;
        _4746 = _4752;
    }
    float _4754 = _4746;
    if (!_4632)
    {
        _4712 = _4626;
    }
    float _4756 = _4712;
    float _4758 = _4756;
    if (_4632)
    {
        float _4760 = _4742 * _4742;
        _4758 = _4760;
    }
    float _4762 = _4758;
    float _4764 = fma(_4750, _4750, _4754);
    float _4766 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4768 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4770 = _4764 + _4762;
    float _4772 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4766);
    float _4774 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4776 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4778 = fma(_4616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4776);
    float _4780 = precise::clamp(_4778, 0.0, 1.0);
    float _4782 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4784 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4772);
    float _4786 = rsqrt(_4770);
    float _4788 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4790 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4774);
    float _4792 = _4784 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4794 = -_4780;
    float _4796 = _4794 + 1.0;
    float _4798 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4788);
    float _4800 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4790);
    float _4802 = _4792 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4804 = abs(_4796);
    float _4806 = log2(_4804);
    float _4808 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4798);
    float _4810 = _4800 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4812 = -_4802;
    float _4814 = fma(_4812, _4768, 1.0);
    float _4816 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4782);
    float _4818 = _4808 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4820 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4822 = _4786 * _4734;
    float _4824 = _4786 * _4750;
    float _4826 = _4786 * _4742;
    float _4828 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4816);
    float _4830 = _4822 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4832 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4820);
    float _4834 = log2(_4814);
    float _4836 = _4828 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4838 = -_4830;
    float _4840 = fma(_4824, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4838);
    float _4842 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4832);
    float _4844 = _4806 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4846 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4848 = -_4826;
    float _4850 = fma(_4848, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4840);
    float _4852 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4842);
    float _4854 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4856 = exp2(_4844);
    float _4858 = fma(_4850, -0.5, 0.5);
    float _4860 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4846);
    float _4862 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4854);
    float _4864 = fma(_4850, 0.5, 0.5);
    float _4866 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4860);
    float _4868 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4862);
    float _4870 = 1.0 / _4852;
    float _4872 = fma(_4864, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4874 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4866);
    float _4876 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4868);
    float _4878 = _4824 + 1.0;
    float _4880 = fma(_4864, _4872, -0.212114393711090087890625);
    float _4882 = _4834 * 0.693147182464599609375;
    float _4884 = sqrt(_4858);
    float _4886 = -_4824;
    float _4888 = fma(_4856, _4878, _4886);
    float _4890 = fma(_4864, _4880, 1.570728778839111328125);
    float _4892 = _4882 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4894 = fma(_4888, 0.5, 0.5);
    float _4896 = _4876 * _4870;
    float _4898 = _4874 * _4870;
    float _4900 = fma(_4896, 0.5, 0.5);
    float _4902 = fma(_4898, -0.5, 0.5);
    float _4904 = _4884 * 0.636619746685028076171875;
    float3 _12172 = float3(_4900, _4902, _4892);
    float _4906 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12172, float3(0.0), isnan(_12172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12172, float3(0.0), isnan(_12172)), level(0.0)).x;
    float3 _12183 = float3(_4900, _4902, _4892);
    float4 _4909 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12183, float3(0.0), isnan(_12183)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12183, float3(0.0), isnan(_12183)), level(0.0)).xyzw;
    float _4911 = _4909.x;
    float _4913 = _4909.y;
    float _4915 = _4909.z;
    float _4917 = _4909.w;
    float _4919 = -_4890;
    float _4921 = fma(_4904, _4919, 1.0);
    float2 _12205 = float2(_4921, _4894);
    float3 _4925 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12205, float2(0.0), isnan(_12205)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12205, float2(0.0), isnan(_12205)), level(0.0)).xyz;
    float _4927 = _4925.x;
    float _4929 = _4925.y;
    float _4931 = _4925.z;
    float _4933 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4935 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4937 = _4806 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4939 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4941 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4933);
    float _4943 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4935);
    out.m_86.x = _4590;
    out.m_86.y = _4588;
    out.m_86.z = _4592;
    float _4945 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4939);
    float _4947 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4941);
    float _4949 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4943);
    float _4951 = exp2(_4937);
    float _4953 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4945);
    float _4955 = _4947 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4957 = _4949 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4959 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4953);
    float _4961 = 1.0 / _4955;
    bool _4963 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4967 = _4963 || _4965;
    bool _4969 = isnan(0.5);
    bool _4971 = _4967 || _4969;
    float _4973 = _4957 + _4955;
    float _4975 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4977 = _4902;
    float _4979 = _4892;
    float _4981 = _4955;
    if (!_4971)
    {
        _4975 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4983 = _4975;
    float _4985 = _4973 * _4961;
    float _4987 = _4985 * 0.5;
    float _4989 = _4987;
    float _4991 = _4983;
    if (!_4971)
    {
        _4977 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4993 = _4977;
    if (!_4971)
    {
        float _4995 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4997 = fma(_4987, _4983, _4995);
        _4989 = _4997;
    }
    float _4999 = _4989;
    if (_4971)
    {
        _4991 = 1.0;
    }
    float _5001 = _4991;
    float _5003 = _5001;
    if (!_4971)
    {
        float _5005 = -_4993;
        float _5007 = _5005 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4979 = _5007;
    }
    float _5009 = _4979;
    float _5011 = _4999;
    if (!_4971)
    {
        float _5013 = 1.0 / _4999;
        _5011 = _5013;
    }
    float _5015 = _5011;
    float _5017 = 0.0187292993068695068359375;
    if (!_4971)
    {
        float _5019 = 1.0 / _5009;
        _5017 = _5019;
    }
    float _5021 = _5017;
    if (!_4971)
    {
        float _5023 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _5025 = -_4993;
        float _5027 = fma(_5015, _5023, _5025);
        _4981 = _5027;
    }
    float _5029 = _4981;
    float _5031 = -_4951;
    float _5033 = _5031 + 1.0;
    float _5035 = _4959 + _4852;
    float _5037 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5039 = _5035 * 0.5;
    if (!_4971)
    {
        float _5041 = _5029 * _5021;
        float _5043 = precise::clamp(_5041, 0.0, 1.0);
        _5003 = _5043;
    }
    float _5045 = _5003;
    out.m_88.z = _5039;
    out.m_88.w = _4852;
    float _5047 = _5045 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _5049 = _5045 > 0.0;
    bool _5051 = isnan(_5045);
    bool _5053 = _5049 || _5051;
    bool _5055 = isnan(0.0);
    bool _5057 = _5053 || _5055;
    out.gl_Position.x = _4876;
    out.gl_Position.y = _4874;
    out.gl_Position.z = _4959;
    out.gl_Position.w = _4852;
    float _5059 = _5047 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_51.x = _5059;
    float _5061 = _5037 * _4906;
    float _5063 = -_5037;
    float _5065 = _5063 + 1.0;
    float _5067 = _4917 * _5061;
    float _5069 = _4917 * _5065;
    float _5071 = _4931 * _5061;
    float _5073 = fma(_4927, _5067, _4911);
    float _5075 = fma(_4929, _5067, _4913);
    float _5077 = fma(_4917, _5071, _4915);
    out.m_90.x = _5073;
    out.m_90.y = _5075;
    out.m_90.z = _5077;
    out.m_90.w = _5069;
    if (_5057)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _5079 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5079;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4156 = false;
    bool _1067 = false;
    bool _853 = false;
    bool _717 = false;
    bool _521 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = in.m_46.w;
    float _108 = trunc(_104);
    int _111 = int(_108);
    float _113 = -_106;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _115;
    bool _119 = _111 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_111);
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _121;
    if (!_119)
    {
        out.m_51.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5147 = as_type<float>(_131);
        out.gl_Position.z = _5147;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _135 = _106 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_106);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = float(_111);
    bool _147 = _115 >= _145;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    if (_151)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _123;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _133 = as_type<int>(_155);
    }
    int _157 = _133;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5202 = as_type<float>(_157);
        out.gl_Position.z = _5202;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _163 = in.m_56.w;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = in.m_46.x;
    float _177 = in.m_46.y;
    float _179 = in.m_46.z;
    int _181 = int(_151);
    int _183 = false ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _173 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = in.m_44.x;
    float _211 = in.m_44.y;
    float _213 = in.m_44.z;
    float _215 = in.m_58.x;
    float _217 = in.m_58.y;
    float _219 = in.m_58.z;
    float _221 = as_type<float>(_207);
    float _223 = _161;
    if (!_173)
    {
        float _225 = _161 * _161;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    float _231 = in.m_60.x;
    float _233 = in.m_60.y;
    float _235 = in.m_60.z;
    float _237 = _229;
    if (!_173)
    {
        float _239 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _239;
    }
    float _241 = _237;
    float _243 = in.m_62.x;
    float _245 = in.m_62.y;
    float _247 = in.m_62.z;
    int _249 = as_type<int>(_159) & 1;
    bool _251 = _249 != 0;
    int _253 = as_type<int>(_159) & 2;
    bool _255 = _253 != 0;
    bool _257 = !_251;
    float _259 = _257 ? (-0.5) : 0.5;
    bool _261 = !_255;
    float _263 = _261 ? (-0.5) : 0.5;
    bool _265 = !_173;
    float _267 = _241;
    float _269 = 0.0;
    float _271 = 0.0;
    float _273 = _179;
    float _275 = _233;
    float _277 = _177;
    float _279 = _179;
    float _281 = _233;
    float _283 = _231;
    if (!_265)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _161 * _287;
        float _297 = 1.0 / _291;
        float _299 = _293 * 0.693147182464599609375;
        float _301 = exp2(_295);
        float _303 = 1.0 / _299;
        float _305 = _301 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _303, _161);
        float _311 = _309 * _297;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _267 = _313;
        _269 = _297;
        _271 = _303;
    }
    float _315 = _267;
    float _317 = _269;
    float _319 = _271;
    bool _321 = !_173;
    float _323 = _319;
    float _325 = _317;
    float _327 = _315;
    if (!_321)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = 1.0 / _335;
        float _339 = _161 * _331;
        float _341 = exp2(_339);
        float _343 = -_341;
        float _345 = _343 + 1.0;
        float _347 = _345 * _337;
        _223 = _347;
        _323 = _335;
    }
    float _349 = _223;
    float _351 = _323;
    float _353 = _351;
    if (!_173)
    {
        float _355 = _115 * _115;
        float _357 = _355 * 0.5;
        _325 = _357;
    }
    float _359 = _325;
    float _361 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _365 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_173)
    {
        _353 = _115;
    }
    float _367 = _353;
    float _369 = fma(_349, _175, _361);
    float _371 = fma(_349, _177, _363);
    float _373 = _367;
    if (!_173)
    {
        float _375 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _375;
    }
    float _377 = _327;
    bool _379 = !_173;
    float _381 = _377;
    if (!_379)
    {
        float _383 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _385 = log2(_383);
        float _387 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _389 = _387 + 1.0;
        float _391 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _393 = _115 * _385;
        float _395 = 1.0 / _389;
        float _397 = _391 * 0.693147182464599609375;
        float _399 = exp2(_393);
        float _401 = 1.0 / _397;
        float _403 = _399 + (-1.0);
        float _405 = -_403;
        float _407 = fma(_405, _401, _115);
        float _409 = _407 * _395;
        float _411 = _409 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _381 = _411;
    }
    float _413 = _381;
    bool _415 = !_173;
    if (!_415)
    {
        float _417 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _419 = log2(_417);
        float _421 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _423 = _421 + 1.0;
        float _425 = 1.0 / _423;
        float _427 = _115 * _419;
        float _429 = exp2(_427);
        float _431 = -_429;
        float _433 = _431 + 1.0;
        float _435 = _433 * _425;
        _373 = _435;
    }
    float _437 = _373;
    float _439 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _441 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _443 = _413 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _445 = fma(_349, _179, _365);
    float _447 = fma(_437, _175, _439);
    float _449 = fma(_437, _177, _441);
    float _451 = 1.0 / _145;
    bool _453 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _455 = fma(_371, _163, _211);
    float _457 = -_449;
    float _459 = _371 + _457;
    float _461 = fma(_437, _179, _443);
    float _463 = fma(_369, _163, _209);
    float _465 = -_447;
    float _467 = _369 + _465;
    float _469 = _459 * _217;
    float _471 = _459 * _233;
    float _473 = _459 * _245;
    float _475 = -_461;
    float _477 = _445 + _475;
    float _479 = fma(_467, _215, _469);
    float _481 = fma(_467, _231, _471);
    float _483 = fma(_467, _243, _473);
    float _485 = fma(_445, _163, _213);
    float _487 = fma(_477, _219, _479);
    float _489 = fma(_477, _235, _481);
    float _491 = fma(_477, _247, _483);
    float _493 = _115 * _451;
    bool _495 = !_453;
    float _497 = _489;
    float _499 = _487;
    float _501 = _491;
    float _519;
    if (!_495)
    {
        float _503 = in.m_64.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        _519 = _493;
    }
    _521 = false;
    float _523 = _519;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _527 = _523 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _531 = _523 + _529;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _533;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _541;
    float _545 = in.m_56.x;
    float _547 = in.m_56.y;
    bool _549 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _551 = isnan(_523);
    bool _553 = _549 || _551;
    bool _555 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _557 = _553 || _555;
    float _559 = float(_557);
    float _561 = 1.0 / _535;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _565 = 1.0 / _539;
    float _567 = 1.0 / _543;
    float _569 = _527 * _561;
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _573 = _523 + _571;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _575;
    float _579 = fma(_577, _569, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _581 = _573 * _565;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _583;
    bool _587 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _589 = isnan(_523);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    bool _599 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _601 = isnan(_523);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = fma(_585, _569, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _613 = _531 * _567;
    float _615 = -_559;
    float _617 = _615 + 1.0;
    bool _619 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _621 = isnan(_523);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _635 = _597 * _617;
    float _637 = -_597;
    float _639 = _637 + 1.0;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _645 = fma(_633, _581, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _647 = _629 * _639;
    float _649 = -_629;
    float _651 = _649 + 1.0;
    float _653 = fma(_643, _581, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _655 = _609 * _651;
    float _657 = -_609;
    float _659 = _657 + 1.0;
    float _661 = _579 * _655;
    float _663 = _611 * _655;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _665;
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _669;
    float _673 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].x, _661);
    float _675 = fma(_659, (*spvDescriptorSet0.vp_c9)._m0[143].y, _663);
    float _677 = fma(_667, _613, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _679 = fma(_671, _613, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _681 = fma(_645, _647, _673);
    float _683 = fma(_653, _647, _675);
    float _685 = fma(_677, _635, _681);
    float _687 = fma(_679, _635, _683);
    float _689 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].x, _685);
    float _691 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[146].y, _687);
    float _693 = _689 * _545;
    float _695 = _691 * _547;
    bool _697 = !_563;
    float _715;
    if (!_697)
    {
        float _699 = in.m_64.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].y, _115);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        _715 = _493;
    }
    _717 = false;
    float _719 = _715;
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _723 = _719 + _721;
    float _725 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _727 = _725 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _729 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _731 = isnan(_719);
    bool _733 = _729 || _731;
    bool _735 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _737 = _733 || _735;
    float _739 = float(_737);
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _743 = _741 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _745 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _747 = isnan(_719);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _757;
    bool _761 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _763 = isnan(_719);
    bool _765 = _761 || _763;
    bool _767 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _769 = _765 || _767;
    float _771 = float(_769);
    float _773 = 1.0 / _727;
    float _775 = -_739;
    float _777 = _775 + 1.0;
    bool _779 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _781 = _755 * _777;
    float _783 = -_755;
    float _785 = _783 + 1.0;
    float _787 = 1.0 / _743;
    float _789 = _759 * _773;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _793 = _791 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _795 = fma(_789, _723, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _797 = -_771;
    float _799 = _797 + 1.0;
    float _801 = _795 * _781;
    float _803 = _793 * _787;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _807 = _719 + _805;
    float _809 = _739 * _799;
    float _811 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[115].x, _801);
    float _813 = fma(_803, _807, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _815 = fma(_813, _809, _811);
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _823 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[117].x, _815);
    float _825 = _817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _827 = _819 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _831 = _823 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _825;
    out.m_66.y = _827;
    out.m_66.z = _829;
    out.m_66.w = _831;
    bool _833 = !_779;
    float _851;
    if (!_833)
    {
        float _835 = in.m_64.x;
        float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _839 = _835 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].w, _115);
        float _843 = _841 * _837;
        float _845 = floor(_843);
        float _847 = -_845;
        float _849 = _843 + _847;
        _851 = _849;
        _853 = true;
    }
    else
    {
        _851 = _493;
    }
    _853 = false;
    float _855 = _851;
    float _857 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _859 = _855 + _857;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _867 = _865 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _869;
    bool _873 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _875 = isnan(_855);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = 1.0 / _863;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _891 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _893 = _891 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _895 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _897 = isnan(_855);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    bool _907 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _909 = isnan(_855);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = 1.0 / _867;
    float _921 = -_905;
    float _923 = _921 + 1.0;
    bool _925 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _927 = _871 * _885;
    bool _929 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _931 = isnan(_855);
    bool _933 = _929 || _931;
    bool _935 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _937 = _933 || _935;
    float _939 = float(_937);
    float _941 = 1.0 / _889;
    float _943 = -_883;
    float _945 = _943 + 1.0;
    float _947 = fma(_927, _859, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _949 = _883 * _923;
    float _951 = -_939;
    float _953 = _951 + 1.0;
    float _955 = _939 * _945;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _961 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _963 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _961;
    float _965 = 1.0 / _893;
    float _967 = _917 * _953;
    float _969 = _959 * _919;
    float _971 = -_917;
    float _973 = _971 + 1.0;
    float _975 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _977 = _975 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _979 = _947 * _967;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _983 = _855 + _981;
    float _985 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _987 = _855 + _985;
    float _989 = _963 * _941;
    bool _991 = _855 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _993 = isnan(_855);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = fma(_969, _983, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1005 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[131].x, _979);
    float _1007 = fma(_989, _987, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1011 = _855 + _1009;
    float _1013 = -_1001;
    float _1015 = _1013 + 1.0;
    float _1017 = fma(_1003, _955, _1005);
    float _1019 = _977 * _965;
    float _1021 = _905 * _1015;
    float _1023 = fma(_1007, _949, _1017);
    float _1025 = fma(_1019, _1011, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1027 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1029 = fma(_1025, _1021, _1023);
    float _1031 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1033 = _1027 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1037 = fma(_1001, (*spvDescriptorSet0.vp_c9)._m0[135].x, _1029);
    float _1039 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1041 = _1035 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1043 = _1037 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _1033;
    out.m_68.y = _1039;
    out.m_68.z = _1041;
    out.m_68.w = _1043;
    bool _1045 = !_925;
    float _1047 = _1033;
    float _1065;
    if (!_1045)
    {
        float _1049 = in.m_64.x;
        float _1051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1053 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[14].x, _115);
        float _1057 = _1055 * _1051;
        float _1059 = floor(_1057);
        float _1061 = -_1059;
        float _1063 = _1057 + _1061;
        _1065 = _1063;
        _1067 = true;
    }
    else
    {
        _1065 = _493;
    }
    _1067 = false;
    float _1069 = _1065;
    float _1071 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1073 = int(_1071);
    int _1075 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1077 = _1075 != 0;
    float _1079 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1081 = int(_1079);
    float _1083 = 0.0;
    int _1085 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1077)
    {
        _1083 = 1.0;
    }
    float _1087 = _1083;
    float _1089 = float(_1073);
    float _1091 = 0.0;
    float _1093 = _1087;
    if (_1077)
    {
        _1091 = 1.0;
    }
    float _1095 = _1091;
    float _1097 = 0.0;
    float _1099 = _1095;
    if (_1077)
    {
        _1097 = 1.0;
    }
    float _1101 = _1097;
    int _1103 = 0;
    float _1105 = _1101;
    if (_1077)
    {
        _1103 = 0;
    }
    int _1107 = _1103;
    float _1109 = 1.0 / _1089;
    float _1111 = _1039;
    int _1113 = _1107;
    if (_1077)
    {
        float _1115 = in.m_64.x;
        _1111 = _1115;
    }
    float _1117 = _1111;
    float _1119 = float(uint(_1081));
    if (_1077)
    {
        _1085 = 0;
    }
    int _1121 = _1085;
    int _1123 = ~_1081;
    int _1125 = _1123 + 1;
    float _1127 = 1.0 / _1119;
    float _1129 = _115 * _1109;
    int _1131 = ~_1081;
    int _1133 = _1131 + 1;
    float _1135 = trunc(_1129);
    int _1137 = int(_1135);
    int _1139 = as_type<int>(_1127) + (-2);
    float _1141 = _1117;
    int _1143 = _1121;
    if (_1077)
    {
        _1047 = _1117;
    }
    float _1145 = _1047;
    float _1147 = float(uint(_1137));
    float _1149 = as_type<float>(_1139) * _1147;
    float _1151 = trunc(_1149);
    float _1153 = precise::max(_1151, 0.0);
    uint _1156 = uint(_1153);
    int _1158 = _1133 * int(_1156);
    int _1160 = _1158 + _1137;
    float _1162 = float(uint(_1160));
    float _1164 = as_type<float>(_1139) * _1162;
    float _1166 = in.m_64.x;
    float _1168 = in.m_64.y;
    float _1170 = in.m_64.z;
    float _1172 = in.m_64.w;
    float _1174 = trunc(_1164);
    float _1176 = precise::max(_1174, 0.0);
    uint _1178 = uint(_1176);
    int _1180 = int(_1156) + int(_1178);
    float _1182 = _1145;
    if (!_1077)
    {
        float _1184 = in.m_64.y;
        float _1186 = in.m_64.z;
        _1093 = 7.345489978790283203125;
        _1182 = _1186;
        _1105 = 5.839270114898681640625;
        _1113 = 1;
        _1141 = _1184;
        _1099 = 1.2345600128173828125;
        _1143 = 2;
    }
    float _1188 = _1093;
    float _1190 = _1182;
    float _1192 = _1105;
    int _1194 = _1113;
    float _1196 = _1141;
    float _1198 = _1099;
    int _1200 = _1143;
    float _1202 = float(_1081);
    float _1204 = _1166 * _1188;
    float _1206 = float(_1137);
    int _1208 = _1125 * _1180;
    int _1210 = _1208 + _1137;
    float _1212 = floor(_1204);
    bool _1214 = _1206 >= _1202;
    bool _1216 = isnan(_1206);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(_1202);
    bool _1222 = _1218 || _1220;
    float _1224 = float(_1222);
    float _1226 = _1190 * _1192;
    bool _1228 = uint(_1210) >= uint(_1081);
    bool _1230 = _1194 != 1;
    bool _1232 = _1168 > 0.5;
    float _1234 = _1170 * 2.0;
    bool _1236 = _1170 > 0.5;
    float _1238 = trunc(_1224);
    int _1240 = int(_1238);
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1244 = _1242 != 0;
    float _1246 = _455 * _233;
    bool _1248 = !_1228;
    int _1250 = _1248 ? 0 : (-1);
    float _1252 = _455 * _245;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1264 = _1262 != 0;
    float _1266 = _695 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1268 = -_259;
    int _1270 = _1232 ? as_type<int>(_1268) : as_type<int>(_259);
    float _1272 = -_1212;
    float _1274 = _1204 + _1272;
    float _1276 = -_263;
    int _1278 = _1236 ? as_type<int>(_1276) : as_type<int>(_263);
    float _1280 = floor(_1234);
    int _1282 = ~_1180;
    int _1284 = _1282 + _1250;
    int _1286 = _1284 + 1;
    float _1288 = _1274 * _1202;
    float _1290 = _493 * _1202;
    bool _1292 = !_1260;
    float _1294 = _1292 ? _259 : as_type<float>(_1270);
    float _1296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _263);
    int _1298 = int(_1244);
    int _1300 = _1228 ? 2 : 0;
    int _1302 = _1298 | _1300;
    int _1304 = _1236 ? 4 : 0;
    int _1306 = _1302 | _1304;
    int _1308 = _1256 ? 8 : 0;
    int _1310 = _1306 | _1308;
    int _1312 = _1260 ? 16 : 0;
    int _1314 = _1310 | _1312;
    int _1316 = _1264 ? 32 : 0;
    int _1318 = _1314 | _1316;
    int _1320 = _1232 ? 64 : 0;
    int _1322 = _1318 | _1320;
    int _1324 = _1322 & 64;
    float _1326 = trunc(_1288);
    int _1328 = int(_1326);
    bool _1330 = !_1264;
    float _1332 = _1330 ? _263 : as_type<float>(_1278);
    int _1334 = _1081 * _1286;
    int _1336 = _1334 + _1137;
    int _1338 = int(_1244);
    int _1340 = _1228 ? 2 : 0;
    int _1342 = _1338 | _1340;
    int _1344 = _1236 ? 4 : 0;
    int _1346 = _1342 | _1344;
    int _1348 = _1256 ? 8 : 0;
    int _1350 = _1346 | _1348;
    int _1352 = _1260 ? 16 : 0;
    int _1354 = _1350 | _1352;
    int _1356 = _1264 ? 32 : 0;
    int _1358 = _1354 | _1356;
    int _1360 = _1232 ? 64 : 0;
    int _1362 = _1358 | _1360;
    int _1364 = _1362 & 4;
    float _1366 = _693 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1370 = _1368 != 0;
    int _1372 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1374 = _1372 != 0;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1378 = _1376 != 0;
    float _1380 = fma(_463, _231, _1246);
    bool _1382 = _1081 == 0;
    float _1384 = trunc(_1290);
    int _1386 = int(_1384);
    int _1388 = ~_1240;
    int _1390 = _1388 + 1;
    int _1392 = _1390 + 1;
    float _1394 = fma(_463, _243, _1252);
    bool _1396 = !_1382;
    int _1398 = _1396 ? _1336 : (-1);
    float _1400 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1402 = _1166 + _1168;
    int _1404 = _1081 + (-1);
    int _1406 = _1398 * _1392;
    bool _1408 = !_1374;
    int _1410 = _1408 ? 0 : 1;
    float _1412 = _1168 + _1170;
    bool _1414 = !_1244;
    int _1416 = _1414 ? 0 : 1;
    int _1418 = _1240 * _1404;
    int _1420 = _1418 + _1406;
    bool _1422 = !_1370;
    int _1424 = _1422 ? 0 : 1;
    float _1426 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1428 = abs(_1410);
    float _1430 = _1402 + (-1.0);
    int _1432 = abs(_1416);
    float _1434 = in.m_58.w;
    bool _1436 = !_1378;
    int _1438 = _1436 ? 0 : 1;
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1442 = _1069 + _1440;
    int _1444 = abs(_1424);
    float _1446 = in.m_60.w;
    int _1448 = abs(_1438);
    int _1450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1452 = _1450 != 0;
    int _1454 = _1420 * _1428;
    int _1456 = _1328 * _1432;
    int _1458 = _1456 + _1137;
    bool _1460 = !_1452;
    int _1462 = _1460 ? 0 : 1;
    int _1464 = _1386 * _1444;
    int _1466 = _1464 + _1454;
    int _1468 = abs(_1462);
    int _1470 = ~_1081;
    int _1472 = _1470 + 1;
    int _1474 = _1458 * _1448;
    int _1476 = _1474 + _1466;
    int _1478 = ~_1081;
    int _1480 = _1478 + 1;
    bool _1482 = _1172 > 0.5;
    int _1484 = _1328 * _1468;
    int _1486 = _1484 + _1476;
    float _1488 = -_263;
    int _1490 = _1482 ? as_type<int>(_1488) : as_type<int>(_263);
    float _1492 = float(uint(_1486));
    float _1494 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1496 = _1494 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1498 = !_1256;
    float _1500 = _1498 ? _263 : as_type<float>(_1490);
    float _1502 = as_type<float>(_1139) * _1492;
    float _1504 = 1.0 / _1496;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1508 = trunc(_1502);
    float _1510 = precise::max(_1508, 0.0);
    uint _1512 = uint(_1510);
    float _1514 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1516 = _1514 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1518 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1520 = _1518 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1522 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1506);
    float _1524 = 1.0 / _1516;
    bool _1526 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1528 = isnan(_1069);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1522);
    float _1540 = fma(_1430, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1542 = _1472 * int(_1512);
    int _1544 = _1542 + _1486;
    float _1546 = fma(_485, _235, _1380);
    float _1548 = 1.0 / _1520;
    float _1550 = float(uint(_1544));
    float _1552 = as_type<float>(_1139) * _1550;
    float _1554 = trunc(_1552);
    float _1556 = precise::max(_1554, 0.0);
    uint _1558 = uint(_1556);
    int _1560 = int(_1512) + int(_1558);
    int _1562 = _1480 * _1560;
    int _1564 = _1562 + _1486;
    float _1566 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1568 = int(_1566);
    bool _1570 = uint(_1564) >= uint(_1081);
    bool _1572 = !_1570;
    int _1574 = _1572 ? 0 : (-1);
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1578 = _1576 != 0;
    int _1580 = ~_1560;
    int _1582 = _1580 + _1574;
    int _1584 = _1582 + 1;
    bool _1586 = !_1578;
    int _1588 = _1586 ? 0 : 1;
    int _1590 = _1081 * _1584;
    int _1592 = _1590 + _1486;
    float _1594 = float(_1568);
    int _1596 = abs(_1588);
    bool _1598 = !_1382;
    int _1600 = _1598 ? _1592 : (-1);
    float _1602 = 1.0 / _1594;
    int _1604 = _1600 & 3;
    bool _1606 = _1604 != 0;
    int _1608 = _1606 ? 0 : 1;
    int _1610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1612 = _1610 != 0;
    int _1614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1616 = _1614 != 0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1624 = _1622 != 0;
    int _1626 = _1600 & 3;
    bool _1628 = _1626 != 0;
    int _1630 = ~_1608;
    int _1632 = _1630 + 1;
    int _1634 = _1632 + 1;
    bool _1636 = !_1616;
    int _1638 = _1636 ? 0 : 1;
    float _1640 = _115 * _1602;
    bool _1642 = uint(_1626) > 1u;
    int _1644 = int(_1612);
    int _1646 = _1642 ? 2 : 0;
    int _1648 = _1644 | _1646;
    int _1650 = _1620 ? 4 : 0;
    int _1652 = _1648 | _1650;
    int _1654 = _1624 ? 8 : 0;
    int _1656 = _1652 | _1654;
    int _1658 = _1628 ? 16 : 0;
    int _1660 = _1656 | _1658;
    int _1662 = _1374 ? 32 : 0;
    int _1664 = _1660 | _1662;
    int _1666 = _1378 ? 64 : 0;
    int _1668 = _1664 | _1666;
    int _1670 = _1668 & 16;
    float _1672 = trunc(_1640);
    int _1674 = int(_1672);
    int _1676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1678 = _1676 != 0;
    int _1680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1682 = _1680 != 0;
    int _1684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1686 = _1684 != 0;
    bool _1688 = !_1612;
    int _1690 = _1688 ? 0 : 1;
    bool _1692 = !_1620;
    int _1694 = _1692 ? 0 : 1;
    bool _1696 = !_1682;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1702 = int(_1700);
    bool _1704 = _1364 != 0;
    int _1706 = _1634;
    float _1708 = _1332;
    if (!_1642)
    {
        int _1710 = ~_1608;
        int _1712 = _1710 + 1;
        _1706 = _1712;
    }
    int _1714 = _1706;
    int _1716 = abs(_1638);
    bool _1718 = !_1624;
    int _1720 = _1718 ? 0 : 1;
    float _1722 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1724 = int(_1722);
    float _1726 = float(uint(_1674));
    int _1728 = abs(_1720);
    int _1730 = abs(_1698);
    float _1732 = float(_1702);
    float _1734 = float(uint(_1724));
    int _1736 = ~_1724;
    int _1738 = _1736 + 1;
    bool _1740 = _1724 == 0;
    float _1742 = 1.0 / _1734;
    int _1744 = as_type<int>(_1742) + (-2);
    int _1746 = ~_1724;
    int _1748 = _1746 + 1;
    float _1750 = as_type<float>(_1744) * _1726;
    float _1752 = trunc(_1750);
    float _1754 = precise::max(_1752, 0.0);
    uint _1756 = uint(_1754);
    int _1758 = _1738 * int(_1756);
    int _1760 = _1758 + _1674;
    float _1762 = float(uint(_1760));
    float _1764 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1766 = int(_1764);
    float _1768 = as_type<float>(_1744) * _1762;
    float _1770 = trunc(_1768);
    float _1772 = precise::max(_1770, 0.0);
    uint _1774 = uint(_1772);
    float _1776 = float(uint(_1766));
    int _1778 = ~_1766;
    int _1780 = _1778 + 1;
    float _1782 = 1.0 / _1776;
    int _1784 = int(_1756) + int(_1774);
    int _1786 = _1748 * _1784;
    int _1788 = _1786 + _1674;
    bool _1790 = uint(_1788) >= uint(_1724);
    float _1792 = 1.0 / _1732;
    int _1794 = as_type<int>(_1782) + (-2);
    bool _1796 = !_1790;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = ~_1784;
    int _1802 = _1800 + _1798;
    int _1804 = _1802 + 1;
    float _1806 = _115 * _1792;
    float _1808 = trunc(_1806);
    int _1810 = int(_1808);
    float _1812 = float(uint(_1810));
    float _1814 = as_type<float>(_1794) * _1812;
    float _1816 = trunc(_1814);
    float _1818 = precise::max(_1816, 0.0);
    uint _1820 = uint(_1818);
    int _1822 = _1780 * int(_1820);
    int _1824 = _1822 + _1810;
    float _1826 = float(uint(_1824));
    float _1828 = as_type<float>(_1794) * _1826;
    int _1830 = ~_1766;
    int _1832 = _1830 + 1;
    float _1834 = trunc(_1828);
    float _1836 = precise::max(_1834, 0.0);
    uint _1838 = uint(_1836);
    int _1840 = int(_1820) + int(_1838);
    float _1842 = float(_1724);
    float _1844 = float(_1674);
    int _1846 = _1832 * _1840;
    int _1848 = _1846 + _1810;
    bool _1850 = _1844 >= _1842;
    bool _1852 = isnan(_1844);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan(_1842);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    bool _1862 = uint(_1848) >= uint(_1766);
    float _1864 = _1196 * _1198;
    float _1866 = trunc(_1860);
    int _1868 = int(_1866);
    bool _1870 = !_1862;
    int _1872 = _1870 ? 0 : (-1);
    int _1874 = ~_1840;
    int _1876 = _1874 + _1872;
    int _1878 = _1876 + 1;
    int _1880 = _1766 + (-1);
    float _1882 = floor(_1864);
    int _1884 = _1766 * _1878;
    int _1886 = _1884 + _1810;
    float _1888 = -_1882;
    float _1890 = _1864 + _1888;
    float _1892 = _1890 * _1842;
    bool _1894 = !_1678;
    int _1896 = _1894 ? 0 : 1;
    float _1898 = _493 * _1842;
    bool _1900 = _1324 != 0;
    int _1902 = _1724 * _1804;
    int _1904 = _1902 + _1674;
    int _1906 = ~_1868;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    float _1912 = trunc(_1892);
    int _1914 = int(_1912);
    bool _1916 = !_1740;
    int _1918 = _1916 ? _1904 : (-1);
    int _1920 = _1724 + (-1);
    float _1922 = trunc(_1898);
    int _1924 = int(_1922);
    int _1926 = _1918 * _1910;
    int _1928 = abs(_1694);
    int _1930 = ~_1724;
    int _1932 = _1930 + 1;
    int _1934 = _1868 * _1920;
    int _1936 = _1934 + _1926;
    int _1938 = abs(_1690);
    int _1940 = _1936 * _1716;
    float _1942 = _1168 * 2.0;
    int _1944 = _1914 * _1596;
    int _1946 = _1944 + _1674;
    int _1948 = _1924 * _1938;
    int _1950 = _1948 + _1940;
    int _1952 = ~_1724;
    int _1954 = _1952 + 1;
    float _1956 = floor(_1942);
    int _1958 = _1946 * _1928;
    int _1960 = _1958 + _1950;
    int _1962 = _1914 * _1728;
    int _1964 = _1962 + _1960;
    float _1966 = float(uint(_1964));
    float _1968 = as_type<float>(_1744) * _1966;
    float _1970 = trunc(_1968);
    float _1972 = precise::max(_1970, 0.0);
    uint _1974 = uint(_1972);
    float _1976 = float(_1810);
    int _1978 = _1954 * int(_1974);
    int _1980 = _1978 + _1964;
    float _1982 = float(uint(_1980));
    bool _1984 = !_1686;
    int _1986 = _1984 ? 0 : 1;
    float _1988 = as_type<float>(_1744) * _1982;
    int _1990 = abs(_1986);
    float _1992 = trunc(_1988);
    float _1994 = precise::max(_1992, 0.0);
    uint _1996 = uint(_1994);
    int _1998 = int(_1974) + int(_1996);
    float _2000 = _1166 * 2.0;
    int _2002 = _1932 * _1998;
    int _2004 = _2002 + _1964;
    float _2006 = floor(_2000);
    bool _2008 = uint(_2004) >= uint(_1724);
    bool _2010 = !_2008;
    int _2012 = _2010 ? 0 : (-1);
    int _2014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2016 = _2014 != 0;
    int _2018 = ~_1998;
    int _2020 = _2018 + _2012;
    int _2022 = _2020 + 1;
    bool _2024 = !_2016;
    int _2026 = _2024 ? 0 : 1;
    int _2028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2030 = _2028 != 0;
    bool _2032 = !_2030;
    int _2034 = _2032 ? 0 : 1;
    bool _2036 = _2006 >= 0.0;
    bool _2038 = isnan(_2006);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan(0.0);
    bool _2044 = _2040 || _2042;
    int _2046 = _2044 ? 0 : 1;
    bool _2048 = _2006 > 0.0;
    int _2050 = ~_2046;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    float _2056 = floor(_1226);
    int _2058 = _2054;
    float _2060 = as_type<float>(_1998);
    if (!_2048)
    {
        int _2062 = ~_2046;
        int _2064 = _2062 + 1;
        _2058 = _2064;
    }
    int _2066 = _2058;
    float _2068 = float(_1766);
    bool _2070 = _1956 >= 0.0;
    bool _2072 = isnan(_1956);
    bool _2074 = _2070 || _2072;
    bool _2076 = isnan(0.0);
    bool _2078 = _2074 || _2076;
    bool _2080 = _1976 >= _2068;
    bool _2082 = isnan(_1976);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan(_2068);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2056;
    float _2094 = _1226 + _2092;
    int _2096 = _2078 ? 0 : 1;
    bool _2098 = _1956 > 0.0;
    float _2100 = _2094 * _2068;
    float _2102 = trunc(_2090);
    int _2104 = int(_2102);
    int _2106 = ~_2096;
    int _2108 = _2106 + 1;
    int _2110 = _2108 + 1;
    float _2112 = _493 * _2068;
    float _2114 = trunc(_2112);
    int _2116 = int(_2114);
    int _2118 = _2110;
    if (!_2098)
    {
        int _2120 = ~_2096;
        int _2122 = _2120 + 1;
        _2118 = _2122;
    }
    int _2124 = _2118;
    bool _2126 = _1766 == 0;
    int _2128 = ~_2104;
    int _2130 = _2128 + 1;
    int _2132 = _2130 + 1;
    float _2134 = trunc(_2100);
    int _2136 = int(_2134);
    bool _2138 = !_2126;
    int _2140 = _2138 ? _1886 : (-1);
    int _2142 = _2140 * _2132;
    int _2144 = abs(_2026);
    int _2146 = _2104 * _1880;
    int _2148 = _2146 + _2142;
    int _2150 = abs(_1896);
    int _2152 = _2136 * _2144;
    int _2154 = _2152 + _1810;
    int _2156 = _2148 * _1730;
    int _2158 = abs(_2034);
    int _2160 = ~_1766;
    int _2162 = _2160 + 1;
    int _2164 = _2116 * _2150;
    int _2166 = _2164 + _2156;
    int _2168 = ~_1766;
    int _2170 = _2168 + 1;
    float _2172 = -_259;
    int _2174 = _1704 ? as_type<int>(_2172) : as_type<int>(_259);
    int _2176 = _2154 * _1990;
    int _2178 = _2176 + _2166;
    float _2180 = -_263;
    int _2182 = _1900 ? as_type<int>(_2180) : as_type<int>(_263);
    int _2184 = _2136 * _2158;
    int _2186 = _2184 + _2178;
    float _2188 = float(uint(_2186));
    float _2190 = as_type<float>(_1794) * _2188;
    float _2192 = trunc(_2190);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    int _2198 = _2170 * int(_2196);
    int _2200 = _2198 + _2186;
    float _2202 = float(uint(_2200));
    int _2204 = _1724 * _2022;
    int _2206 = _2204 + _1964;
    float _2208 = as_type<float>(_1794) * _2202;
    bool _2210 = !_1740;
    int _2212 = _2210 ? _2206 : (-1);
    float _2214 = trunc(_2208);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    int _2220 = int(_2196) + int(_2218);
    int _2222 = _2162 * _2220;
    int _2224 = _2222 + _2186;
    bool _2226 = uint(_2224) >= uint(_1766);
    bool _2228 = !_2226;
    int _2230 = _2228 ? 0 : (-1);
    int _2232 = _2212 & 3;
    bool _2234 = _2232 != 0;
    int _2236 = ~_2220;
    int _2238 = _2236 + _2230;
    int _2240 = _2238 + 1;
    int _2242 = _2234 ? 0 : 1;
    int _2244 = _1766 * _2240;
    int _2246 = _2244 + _2186;
    bool _2248 = !_2126;
    int _2250 = _2248 ? _2246 : (-1);
    int _2252 = ~_2242;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    int _2258 = _2250 & 3;
    bool _2260 = _2258 != 0;
    int _2262 = _2260 ? 0 : 1;
    int _2264 = _2212 & 3;
    bool _2266 = _2264 != 0;
    bool _2268 = uint(_2264) > 1u;
    int _2270 = _2256;
    if (!_2268)
    {
        int _2272 = ~_2242;
        int _2274 = _2272 + 1;
        _2270 = _2274;
    }
    int _2276 = _2270;
    int _2278 = _2250 & 3;
    bool _2280 = _2278 != 0;
    int _2282 = ~_2262;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    bool _2288 = uint(_2278) > 1u;
    int _2290 = _2286;
    if (!_2288)
    {
        int _2292 = ~_2262;
        int _2294 = _2292 + 1;
        _2290 = _2294;
    }
    int _2296 = _2290;
    bool _2298 = uint(_1626) >= 2u;
    int _2300 = abs(_2296);
    int _2302 = _2298 ? 0 : 1;
    bool _2304 = uint(_2278) >= 2u;
    int _2306 = ~_2302;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2304 ? 0 : 1;
    bool _2314 = _1626 != 3;
    int _2316 = ~_2312;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _2310;
    int _2324 = _2320;
    if (_2314)
    {
        int _2326 = ~_2302;
        int _2328 = _2326 + 1;
        _2322 = _2328;
    }
    int _2330 = _2322;
    bool _2332 = _2278 != 3;
    if (_2332)
    {
        int _2334 = ~_2312;
        int _2336 = _2334 + 1;
        _2324 = _2336;
    }
    int _2338 = _2324;
    int _2340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2342 = _2340 != 0;
    int _2344 = abs(_2338);
    bool _2346 = !_2342;
    int _2348 = _2346 ? 0 : 1;
    bool _2350 = _1166 > 0.5;
    float _2352 = -_259;
    int _2354 = _2350 ? as_type<int>(_2352) : as_type<int>(_259);
    int _2356 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2358 = _2356 != 0;
    bool _2360 = !_2358;
    float _2362 = _2360 ? _263 : as_type<float>(_2182);
    int _2364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2366 = _2364 != 0;
    bool _2368 = !_2366;
    float _2370 = _2368 ? _259 : as_type<float>(_2174);
    float _2372 = float(uint(_1458));
    int _2374 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2376 = _2374 != 0;
    int _2378 = ~_1081;
    int _2380 = _2378 + 1;
    float _2382 = as_type<float>(_1139) * _2372;
    bool _2384 = !_2376;
    float _2386 = _2384 ? _259 : as_type<float>(_2354);
    bool _2388 = _1200 != 2;
    float _2390 = trunc(_2382);
    float _2392 = precise::max(_2390, 0.0);
    uint _2394 = uint(_2392);
    float _2396 = 0.0;
    if (!_1230)
    {
        _2396 = _1168;
    }
    float _2398 = _2396;
    float _2400 = _2398;
    if (!_1230)
    {
        _2060 = _1170;
    }
    float _2402 = _2060;
    float _2404 = 0.0;
    float _2406 = _2402;
    if (!_1230)
    {
        _2404 = _2398;
    }
    float _2408 = _2404;
    int _2410 = _2380 * int(_2394);
    int _2412 = _2410 + _1458;
    float _2414 = 0.0;
    float _2416 = _2408;
    if (!_1230)
    {
        _2414 = _1170;
    }
    float _2418 = _2414;
    float _2420 = _2418;
    if (_1230)
    {
        _2416 = _1166;
    }
    float _2422 = _2416;
    float _2424 = float(uint(_2412));
    if (_1230)
    {
        _2400 = _1166;
    }
    float _2426 = _2400;
    if (_1230)
    {
        _2406 = _1168;
    }
    float _2428 = _2406;
    float _2430 = as_type<float>(_1139) * _2424;
    if (_1230)
    {
        _2420 = _1168;
    }
    float _2432 = _2420;
    float _2434 = _2428 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2436 = ~_1081;
    int _2438 = _2436 + 1;
    float _2440 = trunc(_2430);
    float _2442 = precise::max(_2440, 0.0);
    uint _2444 = uint(_2442);
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2448 = _2446 != 0;
    int _2450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2452 = _2450 != 0;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2456 = _2454 != 0;
    int _2458 = ~_1724;
    int _2460 = _2458 + 1;
    bool _2462 = !_2452;
    int _2464 = _2462 ? 0 : 1;
    bool _2466 = _1670 != 0;
    float _2468 = 0.0;
    if (_2388)
    {
        _2468 = _1166;
    }
    float _2470 = _2468;
    float _2472 = 0.0;
    float _2474 = _2470;
    if (_2388)
    {
        _2472 = _1168;
    }
    float _2476 = _2472;
    float _2478 = _2476;
    if (!_2388)
    {
        _2474 = _1170;
    }
    float _2480 = _2474;
    int _2482 = int(_2394) + int(_2444);
    if (!_2388)
    {
        _2478 = _1166;
    }
    float _2484 = _2478;
    int _2486 = ~_1724;
    int _2488 = _2486 + 1;
    int _2490 = _2438 * _2482;
    int _2492 = _2490 + _1458;
    bool _2494 = !_2448;
    int _2496 = _2494 ? 0 : 1;
    int _2498 = abs(_2464);
    bool _2500 = uint(_2492) >= uint(_1081);
    float _2502 = float(uint(_1946));
    bool _2504 = !_2500;
    int _2506 = _2504 ? 0 : (-1);
    int _2508 = abs(_2496);
    float _2510 = as_type<float>(_1744) * _2502;
    bool _2512 = !_2456;
    int _2514 = _2512 ? 0 : 1;
    int _2516 = ~_2482;
    int _2518 = _2516 + _2506;
    int _2520 = _2518 + 1;
    float _2522 = trunc(_2510);
    float _2524 = precise::max(_2522, 0.0);
    uint _2526 = uint(_2524);
    float _2528 = float(uint(_2154));
    float _2530 = as_type<float>(_1794) * _2528;
    int _2532 = _2488 * int(_2526);
    int _2534 = _2532 + _1946;
    float _2536 = float(uint(_2534));
    float _2538 = as_type<float>(_1744) * _2536;
    float _2540 = trunc(_2530);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    float _2546 = trunc(_2538);
    float _2548 = precise::max(_2546, 0.0);
    uint _2550 = uint(_2548);
    float _2552 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2554 = log2(_2552);
    int _2556 = int(_2526) + int(_2550);
    int _2558 = ~_1766;
    int _2560 = _2558 + 1;
    int _2562 = _2460 * _2556;
    int _2564 = _2562 + _1946;
    int _2566 = _2560 * int(_2544);
    int _2568 = _2566 + _2154;
    bool _2570 = uint(_2564) >= uint(_1724);
    float _2572 = float(uint(_2568));
    bool _2574 = !_2280;
    int _2576 = _2574 ? 0 : 1;
    bool _2578 = _2278 != 3;
    float _2580 = as_type<float>(_1794) * _2572;
    int _2582 = ~_1766;
    int _2584 = _2582 + 1;
    bool _2586 = !_2570;
    int _2588 = _2586 ? 0 : (-1);
    float _2590 = trunc(_2580);
    float _2592 = precise::max(_2590, 0.0);
    uint _2594 = uint(_2592);
    float _2596 = _115 * _2554;
    float _2598 = exp2(_2596);
    int _2600 = int(_2544) + int(_2594);
    float _2602 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2604 = 1.0 + _2602;
    int _2606 = _2584 * _2600;
    int _2608 = _2606 + _2154;
    bool _2610 = !_2578;
    int _2612 = _2610 ? 0 : (-1);
    float _2614 = 1.0 / _2604;
    bool _2616 = _1280 >= 0.0;
    bool _2618 = isnan(_1280);
    bool _2620 = _2616 || _2618;
    bool _2622 = isnan(0.0);
    bool _2624 = _2620 || _2622;
    bool _2626 = uint(_2608) >= uint(_1766);
    int _2628 = _2624 ? 0 : 1;
    float _2630 = -_2598;
    float _2632 = _2630 + 1.0;
    bool _2634 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2636 = isnan(0.0);
    bool _2638 = _2634 || _2636;
    bool _2640 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2642 = _2638 || _2640;
    bool _2644 = !_2626;
    int _2646 = _2644 ? 0 : (-1);
    float _2648 = _2642 ? _2632 : 0.0;
    bool _2650 = _1280 > 0.0;
    bool _2652 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2654 = isnan(1.0);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2660 = _2656 || _2658;
    float _2662 = _2648 * _2614;
    int _2664 = ~_2628;
    int _2666 = _2664 + 1;
    int _2668 = _2666 + 1;
    int _2670 = ~_2600;
    int _2672 = _2670 + _2646;
    int _2674 = _2672 + 1;
    bool _2676 = !_2660;
    float _2678 = _2676 ? _115 : _2662;
    int _2680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2682 = _2680 != 0;
    int _2684 = _1766 * _2674;
    int _2686 = _2684 + _2154;
    bool _2688 = !_2466;
    int _2690 = _2688 ? 0 : 1;
    int _2692 = _2668;
    if (!_2650)
    {
        int _2694 = ~_2628;
        int _2696 = _2694 + 1;
        _2692 = _2696;
    }
    int _2698 = _2692;
    float _2700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _259);
    int _2702 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2704 = _2702 != 0;
    float _2706 = _455 * _217;
    float _2708 = _1366 * _2700;
    float _2710 = fma(_463, _215, _2706);
    float _2712 = _1266 * _1296;
    float _2714 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2716 = _2714 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2718 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2720 = _1166 + _1170;
    bool _2722 = !_2126;
    int _2724 = _2722 ? _2686 : (-1);
    float _2726 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2728 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2718);
    float _2730 = 1.0 / _2716;
    float _2732 = _1168 + (-0.5);
    float _2734 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2726);
    float _2736 = _1166 + (-0.5);
    float _2738 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2740 = _1170 + (-0.5);
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2744 = _2720 + (-1.0);
    float _2746 = fma(_1168, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2738);
    float _2748 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2750 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2752 = _2750 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2754 = fma(_1426, -2.0, _2742);
    float _2756 = -_2748;
    float _2758 = fma(_1400, 2.0, _2756);
    float _2760 = fma(_485, _219, _2710);
    float _2762 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2764 = _2762 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2766 = fma(_485, _247, _1394);
    float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2768;
    float _2772 = 1.0 / _2752;
    float _2774 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2776 = _2774 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2778 = -_115;
    float _2780 = fma(_2778, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2758);
    float _2782 = _2770 * _1504;
    float _2784 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2786 = _2784 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2788 = _2776 * _2730;
    float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2792 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2790;
    float _2794 = fma(_2782, _1442, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2796 = 1.0 / _2764;
    float _2798 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2800 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2798;
    float _2802 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2804 = _2802 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2806 = _1546 + _1446;
    float _2808 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2810 = _1069 + _2808;
    float _2812 = _2800 * _1548;
    bool _2814 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2816 = isnan(_1069);
    bool _2818 = _2814 || _2816;
    bool _2820 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2822 = _2818 || _2820;
    float _2824 = float(_2822);
    float _2826 = _2804 * _1524;
    float _2828 = 1.0 / _2786;
    float _2830 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2832 = _2830 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2834 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2836 = isnan(_1069);
    bool _2838 = _2834 || _2836;
    bool _2840 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2842 = _2838 || _2840;
    float _2844 = float(_2842);
    float _2846 = _2792 * _2772;
    float _2848 = fma(_2826, _2810, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2850 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2852 = isnan(_1069);
    bool _2854 = _2850 || _2852;
    bool _2856 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2858 = _2854 || _2856;
    float _2860 = float(_2858);
    float _2862 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2864 = _1069 + _2862;
    float _2866 = _2832 * _2796;
    float _2868 = -_2844;
    float _2870 = _2868 + 1.0;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2874 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2872;
    float _2876 = -_2860;
    float _2878 = _2876 + 1.0;
    float _2880 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2754);
    float _2882 = _2824 * _2870;
    bool _2884 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2886 = isnan(_1069);
    bool _2888 = _2884 || _2886;
    bool _2890 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2892 = _2888 || _2890;
    float _2894 = float(_2892);
    float _2896 = -_2824;
    float _2898 = _2896 + 1.0;
    float _2900 = _2874 * _2828;
    bool _2902 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2904 = isnan(_1069);
    bool _2906 = _2902 || _2904;
    bool _2908 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2910 = _2906 || _2908;
    float _2912 = float(_2910);
    float _2914 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2728);
    float _2916 = -_2894;
    float _2918 = _2916 + 1.0;
    float _2920 = _2860 * _2898;
    float _2922 = _2894 * _2878;
    float _2924 = -_2912;
    float _2926 = _2924 + 1.0;
    float _2928 = _2912 * _2918;
    bool _2930 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2932 = isnan(_1069);
    bool _2934 = _2930 || _2932;
    bool _2936 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2938 = _2934 || _2936;
    float _2940 = float(_2938);
    float _2942 = in.m_62.w;
    float _2944 = _1536 * _2926;
    bool _2946 = _1069 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2948 = isnan(_1069);
    bool _2950 = _2946 || _2948;
    bool _2952 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2954 = _2950 || _2952;
    float _2956 = float(_2954);
    float _2958 = -_1536;
    float _2960 = _2958 + 1.0;
    float _2962 = -_2940;
    float _2964 = _2962 + 1.0;
    float _2966 = _1412 + (-1.0);
    float _2968 = fma(_2744, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2970 = _2940 * _2960;
    float _2972 = _2956 * _2964;
    float _2974 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2976 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2978 = _1069 + _2976;
    float _2980 = -_2956;
    float _2982 = _2980 + 1.0;
    float _2984 = _2794 * _2972;
    float _2986 = _2760 + _1434;
    float _2988 = fma(_2788, _2978, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2990 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2992 = _1069 + _2990;
    float _2994 = fma(_2982, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2984);
    bool _2996 = uint(_2264) >= 2u;
    float _2998 = fma(_2812, _2992, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3000 = fma(_2988, _2970, _2994);
    float _3002 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3004 = _1069 + _3002;
    float _3006 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3008 = _1069 + _3006;
    float _3010 = fma(_2866, _2864, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3012 = fma(_2998, _2944, _3000);
    float _3014 = fma(_2846, _3004, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _3016 = _2386 + 0.5;
    float _3018 = _2362 + (-0.5);
    float _3020 = fma(_2848, _2928, _3012);
    float _3022 = fma(_2900, _3008, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3024 = fma(_3016, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2780);
    float _3026 = -_3018;
    float _3028 = -_2880;
    float _3030 = fma(_3026, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3028);
    float _3032 = fma(_3014, _2922, _3020);
    float _3034 = _2480 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3036 = fma(_3010, _2920, _3032);
    float _3038 = in.m_70.x;
    float _3040 = in.m_70.y;
    float _3042 = in.m_70.z;
    float _3044 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3046 = fma(_3022, _2882, _3036);
    float _3048 = float(_2698);
    float _3050 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3052 = -_3044;
    float _3054 = fma(_3034, 2.0, _3052);
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3058 = fma(_2432, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3050);
    float _3060 = float(_2508);
    float _3062 = fma(_2426, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3056);
    float _3064 = _2766 + _2942;
    float _3066 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3068 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3058);
    float _3070 = _3060 * _3048;
    float _3072 = _2422 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3074 = float(_2066);
    float _3076 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3062);
    float _3078 = _3070 * (-2.0);
    float _3080 = -_3066;
    float _3082 = fma(_3072, 2.0, _3080);
    float _3084 = -_3076;
    float _3086 = _3084 + 1.0;
    float _3088 = fma(_1540, _3078, _1540);
    float _3090 = fma(_3078, _3038, _3038);
    float _3092 = float(_2498);
    float _3094 = -_115;
    float _3096 = fma(_3094, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3082);
    int _3098 = abs(_2514);
    float _3100 = fma(_2736, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3090);
    float _3102 = _3092 * _3074;
    float _3104 = -_3068;
    float _3106 = _3104 + 1.0;
    float _3108 = fma(_2678, _3088, _3100);
    float _3110 = float(_2124);
    float _3112 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3114 = float(_3098);
    float _3116 = _3102 * (-2.0);
    float _3118 = _3108 * 0.15915493667125701904296875;
    float _3120 = fma(_2434, -2.0, _3112);
    float _3122 = _3114 * _3110;
    float _3124 = fma(_3116, _3040, _3040);
    float _3126 = fma(_2974, _3116, _2974);
    float _3128 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3120);
    float _3130 = _3122 * (-2.0);
    float _3132 = fma(_2732, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3124);
    float _3134 = _3118 * 6.283185482025146484375;
    float _3136 = sin(_3134);
    float _3138 = _2484 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3140 = fma(_3130, _3042, _3042);
    float _3142 = fma(_2968, _3130, _2968);
    float _3144 = fma(_2678, _3126, _3132);
    float _3146 = _2370 + 0.5;
    float _3148 = fma(_2740, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3140);
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3152 = _3144 * 0.15915493667125701904296875;
    float _3154 = fma(_3146, (*spvDescriptorSet0.vp_c9)._m0[85].x, _3096);
    float _3156 = fma(_2678, _3142, _3148);
    float _3158 = _1500 + (-0.5);
    float _3160 = -_1538;
    float _3162 = _3160 + 1.0;
    float _3164 = _3118 * 6.283185482025146484375;
    float _3166 = cos(_3164);
    float _3168 = _3156 * 0.15915493667125701904296875;
    float _3170 = -_3086;
    float _3172 = fma(_2370, _3170, _3154);
    int _3174 = ~_2556;
    int _3176 = _3174 + _2588;
    int _3178 = _3176 + 1;
    float _3180 = -_3158;
    float _3182 = -_3128;
    float _3184 = fma(_3180, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3182);
    int _3186 = _2250 >> 31;
    float _3188 = fma(_2362, _3162, _3030);
    float _3190 = -_2914;
    float _3192 = _3190 + 1.0;
    float _3194 = _3152 * 6.283185482025146484375;
    float _3196 = sin(_3194);
    int _3198 = _3186 & 3;
    float _3200 = fma(_1500, _3106, _3184);
    float _3202 = -_3192;
    float _3204 = fma(_2386, _3202, _3024);
    int _3206 = _1081 * _2520;
    int _3208 = _3206 + _1458;
    int _3210 = _2250 + _3198;
    int _3212 = _1724 * _3178;
    int _3214 = _3212 + _1946;
    float _3216 = fma(_3138, -2.0, _3150);
    float _3218 = _3152 * 6.283185482025146484375;
    float _3220 = cos(_3218);
    out.m_72.x = _3204;
    out.m_72.y = _3188;
    out.m_72.z = _3172;
    out.m_72.w = _3200;
    float _3222 = fma(_2844, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3046);
    out.m_74.x = _3222;
    float _3224 = _3168 * 6.283185482025146484375;
    float _3226 = cos(_3224);
    float _3228 = _3136 * _3196;
    int _3230 = _3210 >> 2;
    float _3232 = _3168 * 6.283185482025146484375;
    float _3234 = sin(_3232);
    float _3236 = _3136 * _3220;
    float _3238 = _3166 * _3196;
    int _3240 = _3230 << 4;
    int _3242 = _3240 + 656;
    float _3244 = _3166 * _3220;
    float _3246 = _3136 * _3226;
    float _3248 = _3220 * _3226;
    float _3250 = _3166 * _3226;
    float _3252 = _3196 * _3226;
    float _3254 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3256 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3258 = -_3238;
    float _3260 = fma(_3234, _3236, _3258);
    float _3262 = -_3236;
    float _3264 = fma(_3234, _3238, _3262);
    float _3266 = -_2712;
    float _3268 = _3234 * _3266;
    uint _3270 = uint(int(uint(_3242) >> uint(2)));
    uint _3272 = uint(int(uint(int(_3270)) >> uint(2)));
    int _3274 = int(_3270) & 3;
    float _3276 = (*spvDescriptorSet0.vp_c9)._m0[int(_3272)][_3274];
    int _3278 = int(_3270) + 1;
    uint _3280 = uint(int(uint(_3278) >> uint(2)));
    int _3282 = _3278 & 3;
    float _3284 = (*spvDescriptorSet0.vp_c9)._m0[int(_3280)][_3282];
    float _3286 = fma(_3234, _3244, _3228);
    float _3288 = fma(_3234, _3228, _3244);
    float _3290 = fma(_3248, _2708, _3268);
    float _3292 = _3246 * _2712;
    float _3294 = _3250 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3296 = _3250 * _2712;
    float _3298 = -_3234;
    float _3300 = fma(_3298, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3254);
    float _3302 = fma(_3260, _2708, _3292);
    float _3304 = -_3234;
    float _3306 = fma(_3304, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3294);
    int _3308 = _3242 + 8;
    uint _3310 = uint(int(uint(_3308) >> uint(2)));
    uint _3312 = uint(int(uint(int(_3310)) >> uint(2)));
    int _3314 = int(_3310) & 3;
    float _3316 = (*spvDescriptorSet0.vp_c9)._m0[int(_3312)][_3314];
    int _3318 = int(_3310) + 1;
    uint _3320 = uint(int(uint(_3318) >> uint(2)));
    int _3322 = _3318 & 3;
    float _3324 = (*spvDescriptorSet0.vp_c9)._m0[int(_3320)][_3322];
    float _3326 = -_3234;
    float _3328 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3256);
    float _3330 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3332 = fma(_3286, _2708, _3296);
    float _3334 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3336 = _3286 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3338 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3330);
    float _3340 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3328);
    float _3342 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3344 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3334);
    float _3346 = fma(_3248, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3336);
    float _3348 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3306);
    float _3350 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3352 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3354 = _3264 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3356 = fma(_3264, _3342, _3332);
    float _3358 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3350);
    float _3360 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3352);
    float _3362 = fma(_3252, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3354);
    float _3364 = fma(_3252, _3342, _3290);
    float _3366 = _3356 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3368 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3358);
    float _3370 = fma(_3288, _3342, _3302);
    float _3372 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3360);
    float _3374 = fma(_3288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3362);
    float _3376 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3366);
    float _3378 = _3356 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _3380 = _1600 >> 31;
    float _3382 = fma(_3370, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3376);
    int _3384 = abs(_2576);
    float _3386 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3378);
    int _3388 = ~_2300;
    int _3390 = _3388 + 1;
    int _3392 = _3390 + 1;
    float _3394 = fma(_3246, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3300);
    int _3396 = _3380 & 3;
    float _3398 = fma(_3370, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3386);
    int _3400 = ~_3384;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    float _3406 = _3356 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3408 = _3392 * as_type<int>(_3284);
    int _3410 = _1600 + _3396;
    float _3412 = _263 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3414 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3416 = int(_3414);
    int _3418 = _3404 * as_type<int>(_3276);
    int _3420 = _3418 + _3408;
    float _3422 = fma(_3364, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3406);
    int _3424 = _2212 >> 31;
    float _3426 = _3412 * _3340;
    int _3428 = ~_2344;
    int _3430 = _3428 + 1;
    int _3432 = _3430 + 1;
    float _3434 = fma(_3370, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3422);
    int _3436 = _3424 & 3;
    float _3438 = _3398 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _3440 = abs(_2612);
    int _3442 = _3432 * as_type<int>(_3316);
    int _3444 = _3442 + _3420;
    float _3446 = _3382 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3448 = _3064 + _3438;
    int _3450 = abs(_2348);
    float _3452 = _3412 * _3394;
    float _3454 = _2986 + _3446;
    int _3456 = ~_3440;
    int _3458 = _3456 + 1;
    int _3460 = _3458 + 1;
    float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3464 = _3448 + _3462;
    int _3466 = abs(_3416);
    float _3468 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3470 = _3454 + _3468;
    int _3472 = _2212 + _3436;
    float _3474 = _3464 * _3464;
    int _3476 = ~_3450;
    int _3478 = _3476 + 1;
    int _3480 = _3478 + 1;
    float _3482 = _3470 * _3470;
    float _3484 = float(uint(_3466));
    int _3486 = _3460 * as_type<int>(_3324);
    int _3488 = _3486 + _3444;
    int _3490 = _3472 >> 2;
    float _3492 = _3482 + _3474;
    float _3494 = 1.0 / _3484;
    int _3496 = _3488 * _3480;
    int _3498 = _3410 >> 2;
    float _3500 = _259 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3502 = _3412 * _3348;
    int _3504 = _2724 * _3450;
    int _3506 = _3504 + _3496;
    int _3508 = _3498 << 4;
    int _3510 = _3508 + 368;
    float _3512 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3344);
    float _3514 = sqrt(_3492);
    int _3516 = _3490 << 4;
    int _3518 = _3516 + 512;
    float _3520 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3338);
    float _3522 = fma(_3260, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3346);
    float _3524 = fma(_3500, _3512, _3502);
    int _3526 = abs(_3506);
    float _3528 = fma(_3500, _3520, _3452);
    float _3530 = float(uint(_3416));
    float _3532 = fma(_3500, _3522, _3426);
    uint _3534 = uint(int(uint(_3518) >> uint(2)));
    uint _3536 = uint(int(uint(int(_3534)) >> uint(2)));
    int _3538 = int(_3534) & 3;
    float _3540 = (*spvDescriptorSet0.vp_c9)._m0[int(_3536)][_3538];
    int _3542 = int(_3534) + 1;
    uint _3544 = uint(int(uint(_3542) >> uint(2)));
    int _3546 = _3542 & 3;
    float _3548 = (*spvDescriptorSet0.vp_c9)._m0[int(_3544)][_3546];
    float _3550 = _3434 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _3552 = as_type<int>(_3494) + (-2);
    float _3554 = 1.0 / _3530;
    int _3556 = _2996 ? 0 : 1;
    float _3558 = _2806 + _3550;
    bool _3560 = !_2266;
    int _3562 = _3560 ? 0 : 1;
    int _3564 = _3518 + 8;
    uint _3566 = uint(int(uint(_3564) >> uint(2)));
    uint _3568 = uint(int(uint(int(_3566)) >> uint(2)));
    int _3570 = int(_3566) & 3;
    float _3572 = (*spvDescriptorSet0.vp_c9)._m0[int(_3568)][_3570];
    int _3574 = int(_3566) + 1;
    uint _3576 = uint(int(uint(_3574) >> uint(2)));
    int _3578 = _3574 & 3;
    float _3580 = (*spvDescriptorSet0.vp_c9)._m0[int(_3576)][_3578];
    bool _3582 = _3514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    bool _3584 = _1626 != 3;
    int _3586 = ~_3556;
    int _3588 = _3586 + 1;
    int _3590 = _3588 + 1;
    bool _3592 = _2264 != 3;
    uint _3594 = uint(int(uint(_3510) >> uint(2)));
    uint _3596 = uint(int(uint(int(_3594)) >> uint(2)));
    int _3598 = int(_3594) & 3;
    float _3600 = (*spvDescriptorSet0.vp_c9)._m0[int(_3596)][_3598];
    int _3602 = int(_3594) + 1;
    uint _3604 = uint(int(uint(_3602) >> uint(2)));
    int _3606 = _3602 & 3;
    float _3608 = (*spvDescriptorSet0.vp_c9)._m0[int(_3604)][_3606];
    float _3610 = float(uint(_3526));
    int _3612 = as_type<int>(_3554) + (-2);
    float _3614 = as_type<float>(_3552) * _3610;
    float _3616 = _3554;
    float _3618 = _3550;
    float _3620 = _3610;
    float _3622 = _3500;
    float _3624 = as_type<float>(_3510);
    int _3626 = _3590;
    float _3628 = _3374;
    float _3630 = _3520;
    if (!_3582)
    {
        _3616 = _3474;
    }
    float _3632 = _3616;
    int _3634 = _3510 + 8;
    uint _3636 = uint(int(uint(_3634) >> uint(2)));
    uint _3638 = uint(int(uint(int(_3636)) >> uint(2)));
    int _3640 = int(_3636) & 3;
    float _3642 = (*spvDescriptorSet0.vp_c9)._m0[int(_3638)][_3640];
    int _3644 = int(_3636) + 1;
    uint _3646 = uint(int(uint(_3644) >> uint(2)));
    int _3648 = _3644 & 3;
    float _3650 = (*spvDescriptorSet0.vp_c9)._m0[int(_3646)][_3648];
    float _3652 = _3632;
    if (!_3582)
    {
        _3618 = _3482;
    }
    float _3654 = _3618;
    float _3656 = _3654;
    if (!_3582)
    {
        _3620 = _3448;
    }
    float _3658 = _3620;
    float _3660 = trunc(_3614);
    float _3662 = precise::max(_3660, 0.0);
    uint _3664 = uint(_3662);
    float _3666 = _3658;
    if (!_3582)
    {
        _3622 = _3558;
    }
    float _3668 = _3622;
    float _3670 = _3668;
    if (!_3582)
    {
        _3624 = _3454;
    }
    float _3672 = _3624;
    float _3674 = float(uint(_3506));
    float _3676 = as_type<float>(_3612) * _3674;
    bool _3678 = !_3582;
    float _3680 = _3672;
    if (!_3678)
    {
        float _3682 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3684 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3686 = _3514 + _3684;
        float _3688 = rsqrt(_3492);
        float _3690 = _3686 * _3682;
        float _3692 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3694 = _3690 * 0.15915493667125701904296875;
        float _3696 = _3694 * 6.283185482025146484375;
        float _3698 = sin(_3696);
        float _3700 = _3694 * 6.283185482025146484375;
        float _3702 = cos(_3700);
        float _3704 = fma(_3698, _3692, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3706 = _3688 * _3704;
        float _3708 = _3702 + (-1.0);
        float _3710 = fma(_3470, _3706, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3712 = fma(_3464, _3706, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3714 = _3708 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3716 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3718 = _3710 + _3716;
        float _3720 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3722 = _3712 + _3720;
        float _3724 = fma(_3558, _3702, _3714);
        float _3726 = _3718 * _3718;
        float _3728 = _3722 * _3722;
        _3670 = _3724;
        _3656 = _3726;
        _3652 = _3728;
        _3680 = _3710;
        _3666 = _3712;
    }
    float _3730 = _3670;
    float _3732 = _3656;
    float _3734 = _3652;
    float _3736 = _3680;
    float _3738 = _3666;
    float _3740 = trunc(_3676);
    float _3742 = precise::max(_3740, 0.0);
    uint _3744 = uint(_3742);
    float _3746 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3748 = _3730 + _3746;
    int _3750 = abs(_1714);
    float _3752 = -_115;
    float _3754 = fma(_3752, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3054);
    int _3756 = ~_3416;
    int _3758 = _3756 + 1;
    float _3760 = fma(_3748, _3748, _3732);
    int _3762 = abs(_2276);
    float _3764 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2734);
    out.m_76.x = _3512;
    out.m_76.y = _3520;
    out.m_76.z = _3522;
    int _3766 = abs(_2690);
    float _3768 = -_3764;
    float _3770 = _3768 + 1.0;
    if (_3592)
    {
        int _3772 = ~_3556;
        int _3774 = _3772 + 1;
        _3626 = _3774;
    }
    int _3776 = _3626;
    int _3778 = ~_3466;
    int _3780 = _3778 + 1;
    int _3782 = _3758 * int(_3744);
    int _3784 = _3782 + _3506;
    int _3786 = ~_3750;
    int _3788 = _3786 + 1;
    int _3790 = _3788 + 1;
    int _3792 = ~_3766;
    int _3794 = _3792 + 1;
    int _3796 = _3794 + 1;
    int _3798 = _3780 * int(_3664);
    int _3800 = _3798 + _3526;
    float _3802 = float(uint(_3784));
    int _3804 = _3790 * as_type<int>(_3608);
    int _3806 = abs(_3562);
    float _3808 = float(uint(_3800));
    float _3810 = as_type<float>(_3612) * _3802;
    int _3812 = ~_3762;
    int _3814 = _3812 + 1;
    int _3816 = _3814 + 1;
    int _3818 = _3796 * as_type<int>(_3600);
    int _3820 = _3818 + _3804;
    int _3822 = abs(_3776);
    float _3824 = as_type<float>(_3552) * _3808;
    int _3826 = abs(_2330);
    float _3828 = trunc(_3810);
    float _3830 = precise::max(_3828, 0.0);
    uint _3832 = uint(_3830);
    int _3834 = ~_3806;
    int _3836 = _3834 + 1;
    int _3838 = _3836 + 1;
    int _3840 = _3816 * as_type<int>(_3548);
    bool _3842 = !_3584;
    int _3844 = _3842 ? 0 : (-1);
    int _3846 = _3838 * as_type<int>(_3540);
    int _3848 = _3846 + _3840;
    int _3850 = ~_3822;
    int _3852 = _3850 + 1;
    int _3854 = _3852 + 1;
    float _3856 = trunc(_3824);
    float _3858 = precise::max(_3856, 0.0);
    uint _3860 = uint(_3858);
    bool _3862 = _2264 != 3;
    int _3864 = abs(_3844);
    int _3866 = _3854 * as_type<int>(_3572);
    int _3868 = _3866 + _3848;
    int _3870 = ~_3826;
    int _3872 = _3870 + 1;
    int _3874 = _3872 + 1;
    float _3876 = _3760 + _3734;
    bool _3878 = !_3862;
    int _3880 = _3878 ? 0 : (-1);
    int _3882 = ~_3416;
    int _3884 = _3882 + 1;
    int _3886 = _3874 * as_type<int>(_3642);
    int _3888 = _3886 + _3820;
    int _3890 = int(_3744) + int(_3832);
    float _3892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3894 = ~_3466;
    int _3896 = _3894 + 1;
    int _3898 = abs(_3880);
    int _3900 = _3884 * _3890;
    int _3902 = _3900 + _3506;
    int _3904 = int(_3664) + int(_3860);
    int _3906 = ~_3898;
    int _3908 = _3906 + 1;
    int _3910 = _3908 + 1;
    float _3912 = sqrt(_3876);
    int _3914 = _3896 * _3904;
    int _3916 = _3914 + _3526;
    bool _3918 = !_2682;
    int _3920 = _3918 ? 0 : 1;
    int _3922 = _3910 * as_type<int>(_3580);
    int _3924 = _3922 + _3868;
    bool _3926 = uint(_3902) >= uint(_3416);
    int _3928 = ~_3864;
    int _3930 = _3928 + 1;
    int _3932 = _3930 + 1;
    bool _3934 = uint(_3916) >= uint(_3466);
    int _3936 = _3506 ^ _3416;
    int _3938 = _3932 * as_type<int>(_3650);
    int _3940 = _3938 + _3888;
    bool _3942 = !_3926;
    int _3944 = _3942 ? 0 : (-1);
    int _3946 = abs(_3920);
    float _3948 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3950 = !_3934;
    int _3952 = _3950 ? 0 : (-1);
    uint _3954 = uint(int(uint(_3936) >> uint(31)));
    bool _3956 = !_2704;
    int _3958 = _3956 ? 0 : 1;
    int _3960 = ~_3890;
    int _3962 = _3960 + _3944;
    int _3964 = _3962 + 1;
    int _3966 = ~_3952;
    int _3968 = _3904 + _3966;
    int _3970 = _3968 + 1;
    int _3972 = ~int(_3954);
    int _3974 = _3972 + 1;
    int _3976 = _3416 * _3964;
    int _3978 = _3976 + _3506;
    int _3980 = abs(_3958);
    bool _3982 = _3416 == 0;
    bool _3984 = _3416 == 0;
    float _3986 = fma(_3412, _3412, 1.0);
    int _3988 = _3970 ^ _3974;
    int _3990 = ~_3980;
    int _3992 = _3990 + 1;
    int _3994 = _3992 + 1;
    int _3996 = ~_3946;
    int _3998 = _3996 + 1;
    int _4000 = _3998 + 1;
    float _4002 = rsqrt(_3986);
    bool _4004 = _1081 == 0;
    int _4006 = _3940 * _3994;
    int _4008 = ~_3974;
    int _4010 = _4008 + _3988;
    int _4012 = _4010 + 1;
    float _4014 = _3948 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _4016 = !_3982;
    int _4018 = _4016 ? _3978 : (-1);
    int _4020 = _3924 * _4000;
    bool _4022 = !_3984;
    int _4024 = _4022 ? _4012 : (-1);
    float _4026 = _3892 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4028 = float(_4018);
    bool _4030 = _1724 == 0;
    float _4032 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3216);
    bool _4034 = !_4004;
    int _4036 = _4034 ? _3208 : (-1);
    float _4038 = fma(_4026, _4028, _3754);
    float _4040 = float(_4024);
    float _4042 = _1294 + 0.5;
    bool _4044 = !_4030;
    int _4046 = _4044 ? _3214 : (-1);
    int _4048 = _4036 * _3980;
    int _4050 = _4048 + _4006;
    float _4052 = _1332 + (-0.5);
    float _4054 = -_4032;
    float _4056 = fma(_4014, _4040, _4054);
    float _4058 = fma(_4026, _4042, _4038);
    int _4060 = _4046 * _3946;
    int _4062 = _4060 + _4020;
    float _4064 = _3412 * _4002;
    float _4066 = -_4014;
    float _4068 = fma(_4066, _4052, _4056);
    float _4070 = -_3770;
    float _4072 = fma(_1294, _4070, _4058);
    float _4074 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2746);
    float _4076 = -_3368;
    float _4078 = _4064 * _4076;
    float _4080 = -_3372;
    float _4082 = _4064 * _4080;
    float _4084 = -_3374;
    float _4086 = _4064 * _4084;
    float _4088 = -_4074;
    float _4090 = _4088 + 1.0;
    float _4092 = fma(_4002, _3348, _4078);
    float _4094 = fma(_4002, _3394, _4082);
    float _4096 = fma(_4002, _3340, _4086);
    float _4098 = _3368 + _3524;
    float _4100 = _3372 + _3528;
    float _4102 = _3374 + _3532;
    float _4104 = float(_4050);
    float _4106 = fma(_1332, _4090, _4068);
    float _4108 = float(_4062);
    out.m_78.x = _4092;
    out.m_78.y = _4094;
    out.m_78.z = _4096;
    bool _4110 = _3912 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4112 = isnan(_3912);
    bool _4114 = _4110 || _4112;
    bool _4116 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4118 = _4114 || _4116;
    out.m_80.x = _4098;
    out.m_80.y = _4100;
    out.m_80.z = _4102;
    out.m_82.x = _4104;
    out.m_82.y = _4108;
    out.m_84.x = _4072;
    out.m_84.y = _4106;
    float _4120 = _4090;
    if (!_4118)
    {
        _3628 = 1.0;
    }
    float _4122 = _3628;
    bool _4124 = !_4118;
    float _4126 = _4122;
    if (!_4124)
    {
        bool _4128 = _3912 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4130 = isnan(_3912);
        bool _4132 = _4128 || _4130;
        bool _4134 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4136 = _4132 || _4134;
        if (!_4136)
        {
            float _4138 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4140 = _3912 + _4138;
            float _4142 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4144 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4142;
            float _4146 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4148 = _4146 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4150 = 1.0 / _4144;
            float _4152 = _4140 * _4150;
            float _4154 = fma(_4152, _4148, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4126 = _4154;
            _3630 = _4150;
            _4156 = true;
        }
        else
        {
            bool _4158 = _3912 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4160 = isnan(_3912);
            bool _4162 = _4158 || _4160;
            bool _4164 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4166 = _4162 || _4164;
            if (!_4166)
            {
                float _4168 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4170 = _3912 + _4168;
                float _4172 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4174 = _4172 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4176 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4178 = _4176 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4180 = 1.0 / _4174;
                float _4182 = _4170 * _4180;
                float _4184 = fma(_4182, _4178, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4126 = _4184;
                _3630 = _4180;
                _4156 = true;
            }
            else
            {
                _4126 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4156 = false;
    float _4186 = _4126;
    float _4188 = _3630;
    float _4190 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4192 = _3730 + _4190;
    float _4194 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4196 = _3736 + _4194;
    float _4198 = fma(_4192, _4186, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4200 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4202 = _3738 + _4200;
    float _4204 = fma(_4196, _4186, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4206 = -_2806;
    float _4208 = _4206 + _4198;
    float _4210 = fma(_4202, _4186, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4212 = -_2986;
    float _4214 = _4212 + _4204;
    float _4216 = _4208 * _4208;
    float _4218 = -_3064;
    float _4220 = _4218 + _4210;
    float _4222 = fma(_4214, _4214, _4216);
    float _4224 = fma(_4220, _4220, _4222);
    float _4226 = sqrt(_4224);
    bool _4228 = _4226 > 0.0;
    float _4230 = _4186;
    float _4232 = _4226;
    float _4234 = _4188;
    float _4236 = _4202;
    if (!_4228)
    {
        _4230 = _4204;
    }
    float _4238 = _4230;
    float _4240 = _4238;
    float _4242 = _4238;
    float _4244 = _4238;
    if (!_4228)
    {
        _4232 = _4198;
    }
    float _4246 = _4232;
    float _4248 = _4246;
    float _4250 = _4246;
    float _4252 = _4246;
    if (!_4228)
    {
        _4234 = _4210;
    }
    float _4254 = _4234;
    bool _4256 = !_4228;
    float _4258 = _4254;
    if (!_4256)
    {
        bool _4260 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4262 = _4254;
        if (_4260)
        {
            float _4264 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4262 = _4264;
        }
        float _4266 = _4262;
        float _4268 = _4266;
        if (_4260)
        {
            float _4270 = _487 * _4266;
            _4120 = _4270;
        }
        float _4272 = _4120;
        float _4274 = _4272;
        if (_4260)
        {
            float _4276 = _489 * _4266;
            _1708 = _4276;
        }
        float _4278 = _1708;
        float _4280 = _4278;
        if (_4260)
        {
            float _4282 = _491 * _4266;
            _4236 = _4282;
        }
        float _4284 = _4236;
        float _4286 = _4284;
        if (!_4260)
        {
            bool _4288 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4290 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4292 = _4288 || _4290;
            bool _4294 = isnan(1.0);
            bool _4296 = _4292 || _4294;
            float _4298 = _115 + 1.0;
            float _4300 = _4298;
            if (!_4296)
            {
                float _4302 = _4298 * _4298;
                float _4304 = _4302 * 0.5;
                _4248 = _4304;
            }
            float _4306 = _4248;
            float _4308 = _4306;
            if (!_4296)
            {
                float _4310 = _4306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4308 = _4310;
            }
            float _4312 = _4308;
            bool _4314 = !_4296;
            float _4316 = _4312;
            if (!_4314)
            {
                float _4318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4320 = log2(_4318);
                float _4322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4324 = _4322 + 1.0;
                float _4326 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4328 = _4320 * _4298;
                float _4330 = 1.0 / _4324;
                float _4332 = _4326 * 0.693147182464599609375;
                float _4334 = exp2(_4328);
                float _4336 = 1.0 / _4332;
                float _4338 = _4334 + (-1.0);
                float _4340 = -_4338;
                float _4342 = fma(_4340, _4336, _4298);
                float _4344 = _4342 * _4330;
                float _4346 = _4344 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4316 = _4346;
                _4240 = _4330;
            }
            float _4348 = _4316;
            float _4350 = _4240;
            float _4352 = _4348 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4354 = _4348 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4356 = !_4296;
            _4242 = _4350;
            _4250 = _4348;
            _4268 = _4352;
            if (!_4356)
            {
                float _4358 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4360 = log2(_4358);
                float _4362 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4364 = _4362 + 1.0;
                float _4366 = 1.0 / _4364;
                float _4368 = _4360 * _4298;
                float _4370 = exp2(_4368);
                float _4372 = -_4370;
                float _4374 = _4372 + 1.0;
                float _4376 = _4374 * _4366;
                _4300 = _4376;
            }
            float _4378 = _4300;
            float _4380 = fma(_4378, _177, _4354);
            float _4382 = fma(_4378, _175, _4352);
            float _4384 = _4348 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4386 = -_449;
            float _4388 = _4386 + _4380;
            float _4390 = -_447;
            float _4392 = _4390 + _4382;
            float _4394 = fma(_4378, _179, _4384);
            float _4396 = _4388 * _217;
            float _4398 = _4388 * _233;
            float _4400 = _4388 * _245;
            float _4402 = -_461;
            float _4404 = _4402 + _4394;
            float _4406 = fma(_4392, _215, _4396);
            float _4408 = fma(_4392, _231, _4398);
            float _4410 = fma(_4392, _243, _4400);
            float _4412 = fma(_4404, _219, _4406);
            float _4414 = fma(_4404, _235, _4408);
            float _4416 = fma(_4404, _247, _4410);
            _497 = _4414;
            _499 = _4412;
            _501 = _4416;
            _4274 = _4412;
            _4280 = _4414;
            _4286 = _4416;
            _273 = _4394;
            _275 = _4408;
        }
        float _4418 = _497;
        float _4420 = _499;
        float _4422 = _501;
        float _4424 = _4274;
        float _4426 = _4280;
        float _4428 = _4286;
        float _4430 = _4242;
        float _4432 = _4250;
        float _4434 = _4268;
        float _4436 = _273;
        float _4438 = _275;
        float _4440 = _4418 * _4418;
        float _4442 = rsqrt(_4224);
        float _4444 = fma(_4420, _4420, _4440);
        float _4446 = fma(_4422, _4422, _4444);
        float _4448 = sqrt(_4446);
        float _4450 = _4214 * _4442;
        float _4452 = _4208 * _4442;
        float _4454 = _4220 * _4442;
        bool _4456 = _4448 > 0.0;
        float _4458 = _4430;
        float _4460 = _4432;
        float _4462 = _4434;
        _277 = _4448;
        _279 = _4436;
        _281 = _4438;
        if (!_4456)
        {
            _4458 = _4204;
        }
        float _4464 = _4458;
        _4244 = _4464;
        if (!_4456)
        {
            _4460 = _4198;
        }
        float _4466 = _4460;
        _4252 = _4466;
        if (!_4456)
        {
            _4462 = _4210;
        }
        float _4468 = _4462;
        bool _4470 = !_4456;
        _4258 = _4468;
        if (!_4470)
        {
            float _4472 = rsqrt(_4446);
            float _4474 = _4472 * _4418;
            float _4476 = _4472 * _4420;
            float _4478 = _4472 * _4422;
            float _4480 = _4452 * _4474;
            float _4482 = fma(_4450, _4476, _4480);
            float _4484 = fma(_4454, _4478, _4482);
            float _4486 = _4484 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4488 = fma(_4424, _4486, _4204);
            float _4490 = fma(_4426, _4486, _4198);
            float _4492 = fma(_4428, _4486, _4210);
            _4244 = _4488;
            _4252 = _4490;
            _4258 = _4492;
            _277 = _4478;
            _279 = _4474;
        }
    }
    float _4494 = _4244;
    float _4496 = _4252;
    float _4498 = _4258;
    float _4500 = _277;
    float _4502 = _279;
    float _4504 = _281;
    bool _4506 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4508 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4510 = _4506 || _4508;
    bool _4512 = isnan(0.5);
    bool _4514 = _4510 || _4512;
    float _4516 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4518 = _4500;
    float _4520 = _4502;
    float _4522 = _4498;
    float _4524 = _4504;
    if (_4514)
    {
        _4516 = _4494;
    }
    float _4526 = _4516;
    float _4528 = _4526;
    if (_4514)
    {
        _4518 = _4496;
    }
    float _4530 = _4518;
    float _4532 = _4530;
    if (_4514)
    {
        _4520 = _4498;
    }
    float _4534 = _4520;
    float _4536 = _4534;
    if (!_4514)
    {
        float _4538 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4540 = _2806 + _4538;
        float _4542 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4544 = _2986 + _4542;
        float _4546 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4548 = -_2986;
        float _4550 = _4548 + _4494;
        float _4552 = _4540 * _4540;
        float _4554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4556 = _3064 + _4554;
        float _4558 = -_2806;
        float _4560 = _4558 + _4496;
        float _4562 = -_3064;
        float _4564 = _4562 + _4498;
        float _4566 = fma(_4544, _4544, _4552);
        float _4568 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4570 = fma(_4556, _4556, _4566);
        float _4572 = sqrt(_4570);
        float _4574 = _4546 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4576 = precise::min(_4572, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4578 = _4576 * _4568;
        float _4580 = _4574 * _4578;
        float _4582 = fma(_4550, _4580, _2986);
        float _4584 = fma(_4560, _4580, _2806);
        float _4586 = fma(_4564, _4580, _3064);
        _4532 = _4584;
        _4528 = _4582;
        _4536 = _4586;
        _4522 = _4564;
    }
    float _4588 = _4532;
    float _4590 = _4528;
    float _4592 = _4536;
    float _4594 = _4522;
    float _4596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4598 = _4588 + _4596;
    float _4600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4602 = _4590 + _4600;
    float _4604 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4606 = _4592 + _4604;
    float _4608 = _4598 * _4598;
    float _4610 = fma(_4602, _4602, _4608);
    float _4612 = fma(_4606, _4606, _4610);
    float _4614 = rsqrt(_4612);
    float _4616 = sqrt(_4612);
    float _4618 = _4614 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4620 = _4602 * _4618;
    float _4622 = _4606 * _4618;
    float _4624 = _4620 * _4620;
    float _4626 = _4622 * _4622;
    float _4628 = _4624 + _4626;
    float _4630 = sqrt(_4628);
    bool _4632 = _4630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4634 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4636 = _4630 + _4634;
    float _4638 = _4614;
    float _4640 = _4628;
    float _4642 = _4636;
    float _4644 = _4598;
    float _4646 = _4594;
    if (_4632)
    {
        float _4648 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4638 = _4648;
    }
    float _4650 = _4638;
    if (_4632)
    {
        float _4652 = rsqrt(_4628);
        _4640 = _4652;
    }
    float _4654 = _4640;
    float _4656 = _4654;
    if (_4632)
    {
        float _4658 = _4636 * _4650;
        _4642 = _4658;
    }
    float _4660 = _4642;
    if (_4632)
    {
        float _4662 = _4660 * 0.15915493667125701904296875;
        _283 = _4662;
    }
    float _4664 = _283;
    float _4666 = _4606;
    if (_4632)
    {
        float _4668 = _4664 * 6.283185482025146484375;
        float _4670 = sin(_4668);
        _4666 = _4670;
    }
    float _4672 = _4666;
    float _4674 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4676 = precise::max(0.0, _4674);
    float _4678 = _4650;
    float _4680 = _4676;
    if (_4632)
    {
        float _4682 = _4664 * 6.283185482025146484375;
        float _4684 = cos(_4682);
        _4678 = _4684;
    }
    float _4686 = _4678;
    float _4688 = -_4618;
    float _4690 = -_4676;
    float _4692 = fma(_4598, _4688, _4690);
    if (_4632)
    {
        float _4694 = _4692 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4644 = _4694;
    }
    float _4696 = _4644;
    float _4698 = _4696;
    float _4700 = _4672;
    if (_4632)
    {
        float _4702 = fma(_4672, _4696, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4698 = _4702;
    }
    float _4704 = _4698;
    float _4706 = _4704;
    if (!_4632)
    {
        _4700 = _4620;
    }
    float _4708 = _4700;
    float _4710 = _4708;
    float _4712 = _4686;
    if (_4632)
    {
        float _4714 = _4686 + (-1.0);
        _4680 = _4714;
    }
    float _4716 = _4680;
    float _4718 = _4716;
    if (_4632)
    {
        float _4720 = _4654 * _4704;
        _4646 = _4720;
    }
    float _4722 = _4646;
    if (!_4632)
    {
        _4706 = _4692;
    }
    float _4724 = _4706;
    float _4726 = _4724;
    if (_4632)
    {
        float _4728 = _4716 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4524 = _4728;
    }
    float _4730 = _4524;
    if (_4632)
    {
        float _4732 = _4620 * _4722;
        _4710 = _4732;
    }
    float _4734 = _4710;
    if (!_4632)
    {
        _4718 = _4622;
    }
    float _4736 = _4718;
    float _4738 = _4736;
    if (_4632)
    {
        float _4740 = _4622 * _4722;
        _4738 = _4740;
    }
    float _4742 = _4738;
    if (!_4632)
    {
        _4656 = _4624;
    }
    float _4744 = _4656;
    float _4746 = _4744;
    if (_4632)
    {
        float _4748 = fma(_4692, _4686, _4730);
        _4726 = _4748;
    }
    float _4750 = _4726;
    if (_4632)
    {
        float _4752 = _4734 * _4734;
        _4746 = _4752;
    }
    float _4754 = _4746;
    if (!_4632)
    {
        _4712 = _4626;
    }
    float _4756 = _4712;
    float _4758 = _4756;
    if (_4632)
    {
        float _4760 = _4742 * _4742;
        _4758 = _4760;
    }
    float _4762 = _4758;
    float _4764 = fma(_4750, _4750, _4754);
    float _4766 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4768 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4770 = _4764 + _4762;
    float _4772 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4766);
    float _4774 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4776 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4778 = fma(_4616, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4776);
    float _4780 = precise::clamp(_4778, 0.0, 1.0);
    float _4782 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4784 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4772);
    float _4786 = rsqrt(_4770);
    float _4788 = _4588 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4790 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4774);
    float _4792 = _4784 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4794 = -_4780;
    float _4796 = _4794 + 1.0;
    float _4798 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4788);
    float _4800 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4790);
    float _4802 = _4792 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4804 = abs(_4796);
    float _4806 = log2(_4804);
    float _4808 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4798);
    float _4810 = _4800 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4812 = -_4802;
    float _4814 = fma(_4812, _4768, 1.0);
    float _4816 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4782);
    float _4818 = _4808 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4820 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4822 = _4786 * _4734;
    float _4824 = _4786 * _4750;
    float _4826 = _4786 * _4742;
    float _4828 = fma(_4592, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4816);
    float _4830 = _4822 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4832 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4820);
    float _4834 = log2(_4814);
    float _4836 = _4828 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4838 = -_4830;
    float _4840 = fma(_4824, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4838);
    float _4842 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4832);
    float _4844 = _4806 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4846 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4848 = -_4826;
    float _4850 = fma(_4848, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4840);
    float _4852 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4842);
    float _4854 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4856 = exp2(_4844);
    float _4858 = fma(_4850, -0.5, 0.5);
    float _4860 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4846);
    float _4862 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4854);
    float _4864 = fma(_4850, 0.5, 0.5);
    float _4866 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4860);
    float _4868 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4862);
    float _4870 = 1.0 / _4852;
    float _4872 = fma(_4864, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4874 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4866);
    float _4876 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4868);
    float _4878 = _4824 + 1.0;
    float _4880 = fma(_4864, _4872, -0.212114393711090087890625);
    float _4882 = _4834 * 0.693147182464599609375;
    float _4884 = sqrt(_4858);
    float _4886 = -_4824;
    float _4888 = fma(_4856, _4878, _4886);
    float _4890 = fma(_4864, _4880, 1.570728778839111328125);
    float _4892 = _4882 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4894 = fma(_4888, 0.5, 0.5);
    float _4896 = _4876 * _4870;
    float _4898 = _4874 * _4870;
    float _4900 = fma(_4896, 0.5, 0.5);
    float _4902 = fma(_4898, -0.5, 0.5);
    float _4904 = _4884 * 0.636619746685028076171875;
    float3 _12172 = float3(_4900, _4902, _4892);
    float _4906 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12172, float3(0.0), isnan(_12172)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12172, float3(0.0), isnan(_12172)), level(0.0)).x;
    float3 _12183 = float3(_4900, _4902, _4892);
    float4 _4909 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12183, float3(0.0), isnan(_12183)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12183, float3(0.0), isnan(_12183)), level(0.0)).xyzw;
    float _4911 = _4909.x;
    float _4913 = _4909.y;
    float _4915 = _4909.z;
    float _4917 = _4909.w;
    float _4919 = -_4890;
    float _4921 = fma(_4904, _4919, 1.0);
    float2 _12205 = float2(_4921, _4894);
    float3 _4925 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12205, float2(0.0), isnan(_12205)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12205, float2(0.0), isnan(_12205)), level(0.0)).xyz;
    float _4927 = _4925.x;
    float _4929 = _4925.y;
    float _4931 = _4925.z;
    float _4933 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4935 = _2806 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4937 = _4806 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4939 = _4810 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4941 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4933);
    float _4943 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4935);
    out.m_86.x = _4590;
    out.m_86.y = _4588;
    out.m_86.z = _4592;
    float _4945 = fma(_4818, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4939);
    float _4947 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4941);
    float _4949 = fma(_3064, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4943);
    float _4951 = exp2(_4937);
    float _4953 = fma(_4792, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4945);
    float _4955 = _4947 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4957 = _4949 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4959 = fma(_4836, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4953);
    float _4961 = 1.0 / _4955;
    bool _4963 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4965 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4967 = _4963 || _4965;
    bool _4969 = isnan(0.5);
    bool _4971 = _4967 || _4969;
    float _4973 = _4957 + _4955;
    float _4975 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4977 = _4902;
    float _4979 = _4892;
    float _4981 = _4955;
    if (!_4971)
    {
        _4975 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4983 = _4975;
    float _4985 = _4973 * _4961;
    float _4987 = _4985 * 0.5;
    float _4989 = _4987;
    float _4991 = _4983;
    if (!_4971)
    {
        _4977 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4993 = _4977;
    if (!_4971)
    {
        float _4995 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4997 = fma(_4987, _4983, _4995);
        _4989 = _4997;
    }
    float _4999 = _4989;
    if (_4971)
    {
        _4991 = 1.0;
    }
    float _5001 = _4991;
    float _5003 = _5001;
    if (!_4971)
    {
        float _5005 = -_4993;
        float _5007 = _5005 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4979 = _5007;
    }
    float _5009 = _4979;
    float _5011 = _4999;
    if (!_4971)
    {
        float _5013 = 1.0 / _4999;
        _5011 = _5013;
    }
    float _5015 = _5011;
    float _5017 = 0.0187292993068695068359375;
    if (!_4971)
    {
        float _5019 = 1.0 / _5009;
        _5017 = _5019;
    }
    float _5021 = _5017;
    if (!_4971)
    {
        float _5023 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _5025 = -_4993;
        float _5027 = fma(_5015, _5023, _5025);
        _4981 = _5027;
    }
    float _5029 = _4981;
    float _5031 = -_4951;
    float _5033 = _5031 + 1.0;
    float _5035 = _4959 + _4852;
    float _5037 = _5033 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5039 = _5035 * 0.5;
    if (!_4971)
    {
        float _5041 = _5029 * _5021;
        float _5043 = precise::clamp(_5041, 0.0, 1.0);
        _5003 = _5043;
    }
    float _5045 = _5003;
    out.m_88.z = _5039;
    out.m_88.w = _4852;
    float _5047 = _5045 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _5049 = _5045 > 0.0;
    bool _5051 = isnan(_5045);
    bool _5053 = _5049 || _5051;
    bool _5055 = isnan(0.0);
    bool _5057 = _5053 || _5055;
    out.gl_Position.x = _4876;
    out.gl_Position.y = _4874;
    out.gl_Position.z = _4959;
    out.gl_Position.w = _4852;
    float _5059 = _5047 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_51.x = _5059;
    float _5061 = _5037 * _4906;
    float _5063 = -_5037;
    float _5065 = _5063 + 1.0;
    float _5067 = _4917 * _5061;
    float _5069 = _4917 * _5065;
    float _5071 = _4931 * _5061;
    float _5073 = fma(_4927, _5067, _4911);
    float _5075 = fma(_4929, _5067, _4913);
    float _5077 = fma(_4917, _5071, _4915);
    out.m_90.x = _5073;
    out.m_90.y = _5075;
    out.m_90.z = _5077;
    out.m_90.w = _5069;
    if (_5057)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _5079 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5079;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

