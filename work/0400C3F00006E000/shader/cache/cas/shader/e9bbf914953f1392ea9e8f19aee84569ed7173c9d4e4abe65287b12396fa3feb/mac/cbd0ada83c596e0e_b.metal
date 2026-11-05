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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_80 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_82 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_54 [[attribute(7)]];
    float4 m_52 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_45.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3600 = as_type<float>(_119);
        out.gl_Position.z = _3600;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_47.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    float _141 = _137;
    if (_133)
    {
        float _143 = float(_103);
        _139 = _143;
    }
    float _145 = _139;
    bool _147 = _137 >= _145;
    bool _149 = !_133;
    bool _151 = _147 || _149;
    if (_151)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _113;
    if (_151)
    {
        out.m_45.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3669 = as_type<float>(_157);
        out.gl_Position.z = _3669;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_52.w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_47.x;
    float _175 = in.m_47.y;
    float _177 = in.m_47.z;
    float _179 = in.m_42.x;
    float _181 = in.m_42.y;
    float _183 = in.m_42.z;
    int _185 = as_type<int>(_159) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_159) & 2;
    bool _191 = _189 != 0;
    float _193 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _195 = 0.0;
    float _197 = _193;
    if (!_171)
    {
        float _199 = _193 * _193;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    bool _205 = !_187;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_191;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203;
    if (!_171)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    bool _219 = !_171;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _193 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _193);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_171;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _193 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _197 = _275;
    }
    float _277 = _197;
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _287 = fma(_277, _173, _281);
    float _289 = fma(_277, _175, _283);
    float _291 = fma(_277, _177, _285);
    float _293 = fma(_287, _161, _179);
    float _295 = fma(_289, _161, _181);
    float _297 = fma(_291, _161, _183);
    bool _299 = !_279;
    float _317;
    if (!_299)
    {
        float _301 = in.m_54.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_103);
        float _323 = 1.0 / _321;
        float _325 = _137 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = in.m_54.x;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = _327 + _331;
    float _335 = in.m_54.y;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    float _341 = in.m_54.z;
    float _343 = 1.0 / _339;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = _327 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _327 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _327 + _357;
    float _361 = 1.0 / _347;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _367 = _329 * 2.0;
    float _369 = _333 * _343;
    float _371 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _373 = _335 > 0.5;
    float _375 = floor(_367);
    float _377 = _335 * 2.0;
    float _379 = -_363;
    float _381 = fma(_371, 2.0, _379);
    bool _383 = _341 > 0.5;
    float _385 = _335 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _387 = _355 * _361;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _395 = _393 != 0;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _399 = _397 != 0;
    float _401 = floor(_377);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _403;
    float _407 = -_207;
    float _409 = _373 ? _407 : _207;
    float _411 = -_137;
    float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[76].x, _381);
    float _415 = -_211;
    int _417 = _383 ? as_type<int>(_415) : as_type<int>(_211);
    bool _419 = !_395;
    float _421 = _419 ? _207 : _409;
    float _423 = 1.0 / _405;
    bool _425 = !_399;
    float _427 = _425 ? _211 : as_type<float>(_417);
    float _429 = fma(_385, -2.0, _365);
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _441 = _439 != 0;
    float _443 = _341 * 2.0;
    bool _445 = _375 > 0.0;
    bool _447 = _375 >= 0.0;
    bool _449 = isnan(_375);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    float _457 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _459 = int(_457);
    bool _461 = !_437;
    int _463 = _461 ? 0 : 1;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _467 = _465 != 0;
    int _469 = _455 ? 0 : 1;
    bool _471 = _401 > 0.0;
    float _473 = _351 * _423;
    int _475 = ~_469;
    int _477 = _475 + 1;
    int _479 = _477 + 1;
    int _481 = _479;
    int _483 = as_type<int>(_423);
    int _485 = as_type<int>(_333);
    float _487 = _409;
    if (!_445)
    {
        int _489 = ~_469;
        int _491 = _489 + 1;
        _481 = _491;
    }
    int _493 = _481;
    float _495 = _341 + _335;
    bool _497 = _401 >= 0.0;
    bool _499 = isnan(_401);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    float _507 = _495;
    if (_467)
    {
        _483 = 0;
        _485 = 0;
    }
    int _509 = _483;
    int _511 = _485;
    int _513 = _505 ? 0 : 1;
    float _515 = _495 + (-1.0);
    int _517 = _509;
    int _519 = _511;
    if (!_467)
    {
        _517 = 2;
    }
    int _521 = _517;
    if (!_467)
    {
        _519 = 1;
    }
    int _523 = _519;
    bool _525 = _521 != 2;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _531 = ~_513;
    int _533 = _531 + 1;
    int _535 = _533 + 1;
    float _537 = floor(_443);
    int _539 = _535;
    if (!_471)
    {
        int _541 = ~_513;
        int _543 = _541 + 1;
        _539 = _543;
    }
    int _545 = _539;
    float _547 = _329 + _341;
    bool _549 = _523 != 1;
    float _551 = _329 + _335;
    bool _553 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _555 = isnan(_327);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = _547 + (-1.0);
    float _567 = 1.0 / _529;
    float _569 = _551 + (-1.0);
    float _571 = -_563;
    float _573 = _571 + 1.0;
    bool _575 = !_433;
    int _577 = _575 ? 0 : 1;
    float _579 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _581 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _583 = isnan(_327);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _595 = !_441;
    int _597 = _595 ? 0 : 1;
    float _599 = 0.0;
    float _601 = _547;
    if (_525)
    {
        _599 = _329;
    }
    float _603 = _599;
    float _605 = _591 * _573;
    float _607 = _603;
    if (_525)
    {
        _507 = _335;
    }
    float _609 = _507;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _609;
    if (!_525)
    {
        _607 = _341;
    }
    float _617 = _607;
    float _619 = _359 * _567;
    float _621 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _623;
    if (!_525)
    {
        _615 = _329;
    }
    float _627 = _615;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _639 = _637 != 0;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _643 = _641 != 0;
    float _645 = fma(_625, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _647 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _649 = isnan(_327);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = fma(_631, _387, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _661 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _663 = isnan(_327);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _675 = int(_673);
    bool _677 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _679 = isnan(_327);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_657;
    float _691 = _689 + 1.0;
    bool _693 = _537 >= 0.0;
    bool _695 = isnan(_537);
    bool _697 = _693 || _695;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    float _703 = _627 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _705 = _687 * _691;
    int _707 = _701 ? 0 : 1;
    float _709 = -_687;
    float _711 = _709 + 1.0;
    bool _713 = _537 > 0.0;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _715;
    float _719 = 0.0;
    if (!_549)
    {
        _719 = _335;
    }
    float _721 = _719;
    float _723 = _671 * _711;
    float _725 = fma(_717, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _727 = !_635;
    int _729 = _727 ? 0 : 1;
    float _731 = _645 * _723;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _737 = _725 * _723;
    float _739 = _721;
    if (!_549)
    {
        _487 = _721;
    }
    float _741 = _487;
    float _743 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _745 = log2(_743);
    float _747 = _741;
    if (_549)
    {
        _739 = _329;
    }
    float _749 = _739;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _753 = ~_707;
    int _755 = _753 + 1;
    int _757 = _755 + 1;
    float _759 = fma(_735, _387, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _761 = _757;
    if (!_713)
    {
        int _763 = ~_707;
        int _765 = _763 + 1;
        _761 = _765;
    }
    int _767 = _761;
    float _769 = _617 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _771 = abs(_729);
    float _773 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[83].z, _751);
    if (!_549)
    {
        _601 = _341;
    }
    float _775 = _601;
    float _777 = _657 * _613;
    float _779 = float(_103);
    float _781 = float(_459);
    float _783 = _745 * _137;
    float _785 = _775;
    if (_549)
    {
        _785 = _335;
    }
    float _787 = _785;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_549)
    {
        _747 = _329;
    }
    float _791 = _747;
    float _793 = 1.0 / _779;
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _797 = float(_767);
    float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _801 = float(_771);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _805 = 1.0 / _781;
    float _807 = _801 * _797;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _811 = 0.0;
    if (!_549)
    {
        _811 = _341;
    }
    float _813 = _811;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _817 = _813;
    if (_549)
    {
        _817 = _335;
    }
    float _819 = _817;
    float _821 = exp2(_783);
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _825 = fma(_703, -2.0, _789);
    float _827 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[83].w, _803);
    float _829 = -_809;
    float _831 = fma(_769, 2.0, _829);
    float _833 = -_815;
    float _835 = fma(_799, 2.0, _833);
    float _837 = fma(_795, -2.0, _823);
    float _839 = float(_675);
    float _841 = in.m_56.x;
    float _843 = in.m_56.y;
    float _845 = in.m_56.z;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _849 = 1.0 + _847;
    float _851 = 1.0 / _839;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _859;
    float _863 = 1.0 / _849;
    bool _865 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _867 = isnan(1.0);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _873 = _869 || _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _875;
    float _879 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[88].w, _857);
    float _881 = -_821;
    float _883 = _881 + 1.0;
    float _885 = fma(_861, _473, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _887 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _899 = fma(_877, _473, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _901 = !_639;
    int _903 = _901 ? 0 : 1;
    float _905 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].z, _853);
    float _907 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].w, _855);
    float _909 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[88].z, _897);
    float _911 = _895 ? _883 : 0.0;
    float _913 = _793 * _137;
    float _915 = _805 * _137;
    float _917 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _429);
    int _919 = abs(_903);
    float _921 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _905);
    float _923 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _773);
    float _925 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _827);
    float _927 = _851 * _137;
    float _929 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _907);
    float _931 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _909);
    float _933 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _879);
    float _935 = -_137;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[86].x, _831);
    float _939 = -_137;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[81].x, _835);
    float _943 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _837);
    float _945 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _825);
    float _947 = _927;
    if (_873)
    {
        float _949 = _911 * _863;
        _141 = _949;
    }
    float _951 = _141;
    float _953 = _807 * (-2.0);
    float _955 = _329 + (-0.5);
    float _957 = float(_493);
    float _959 = fma(_953, _841, _841);
    bool _961 = !_643;
    int _963 = _961 ? 0 : 1;
    float _965 = fma(_579, _953, _579);
    float _967 = float(_919);
    float _969 = -_671;
    float _971 = _969 + 1.0;
    int _973 = abs(_963);
    float _975 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[196].x, _959);
    float _977 = float(_545);
    float _979 = _967 * _957;
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[143].x, _731);
    float _983 = fma(_965, _951, _975);
    float _985 = _979 * (-2.0);
    float _987 = float(_973);
    float _989 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[143].y, _737);
    float _991 = _335 + (-0.5);
    float _993 = fma(_985, _843, _843);
    float _995 = fma(_593, _985, _593);
    float _997 = _987 * _977;
    float _999 = fma(_759, _705, _989);
    float _1001 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _993);
    float _1003 = fma(_659, _705, _981);
    float _1005 = _997 * (-2.0);
    float _1007 = _983 * 0.15915493667125701904296875;
    float _1009 = fma(_995, _951, _1001);
    float _1011 = in.m_58.x;
    float _1013 = in.m_58.y;
    float _1015 = in.m_58.z;
    float _1017 = fma(_621, _1005, _621);
    float _1019 = fma(_1005, _845, _845);
    float _1021 = _1009 * 0.15915493667125701904296875;
    float _1023 = in.m_52.x;
    float _1025 = in.m_52.y;
    float _1027 = _341 + (-0.5);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1037 = in.m_60.x;
    float _1039 = in.m_60.y;
    float _1041 = in.m_60.z;
    float _1043 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1019);
    float _1045 = fma(_1031, _619, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1047 = fma(_1035, _619, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1049 = fma(_885, _777, _1003);
    float _1051 = fma(_1017, _951, _1043);
    float _1053 = fma(_899, _777, _999);
    float _1055 = in.m_62.x;
    float _1057 = in.m_62.y;
    float _1059 = in.m_62.z;
    float _1061 = fma(_1045, _605, _1049);
    float _1063 = _1051 * 0.15915493667125701904296875;
    float _1065 = fma(_1047, _605, _1053);
    float _1067 = _1007 * 6.283185482025146484375;
    float _1069 = sin(_1067);
    float _1071 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1061);
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1075 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1065);
    float _1077 = _1007 * 6.283185482025146484375;
    float _1079 = cos(_1077);
    float _1081 = _1075 * _1025;
    float _1083 = _1071 * _1023;
    float _1085 = _295 * _1013;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1089 = _295 * _1039;
    float _1091 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1095 = _1021 * 6.283185482025146484375;
    float _1097 = sin(_1095);
    float _1099 = fma(_293, _1037, _1089);
    float _1101 = _1091 * _1087;
    float _1103 = _1093 * _1073;
    float _1105 = _295 * _1057;
    float _1107 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1109 = fma(_297, _1041, _1099);
    float _1111 = fma(_293, _1011, _1085);
    float _1113 = _1021 * 6.283185482025146484375;
    float _1115 = cos(_1113);
    float _1117 = fma(_293, _1055, _1105);
    float _1119 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1121 = fma(_297, _1015, _1111);
    float _1123 = fma(_297, _1059, _1117);
    float _1125 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1127 = _1063 * 6.283185482025146484375;
    float _1129 = cos(_1127);
    float _1131 = _1069 * _1097;
    float _1133 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1137 = _1063 * 6.283185482025146484375;
    float _1139 = sin(_1137);
    float _1141 = _1079 * _1115;
    float _1143 = _1069 * _1115;
    float _1145 = _1079 * _1129;
    float _1147 = _1079 * _1097;
    float _1149 = _1069 * _1129;
    float _1151 = _1115 * _1129;
    float _1153 = _1145 * _1101;
    float _1155 = _1097 * _1129;
    float _1157 = in.m_54.w;
    float _1159 = fma(_1139, _1141, _1131);
    float _1161 = -_1101;
    float _1163 = _1139 * _1161;
    float _1165 = -_1143;
    float _1167 = fma(_1139, _1147, _1165);
    float _1169 = -_1147;
    float _1171 = fma(_1139, _1143, _1169);
    float _1173 = fma(_1159, _1103, _1153);
    float _1175 = _1149 * _1101;
    float _1177 = fma(_1151, _1103, _1163);
    float _1179 = fma(_1139, _1131, _1141);
    float _1181 = fma(_1167, _1107, _1173);
    float _1183 = fma(_1171, _1103, _1175);
    float _1185 = fma(_1155, _1107, _1177);
    float _1187 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1189 = fma(_1179, _1107, _1183);
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1187);
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1191);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1193);
    float _1201 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1195);
    float _1203 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1197);
    bool _1205 = _1157 > 0.5;
    float _1207 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1209 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1199);
    float _1211 = _1203 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1213 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1135);
    float _1215 = _1133 + _1207;
    float _1217 = -_211;
    int _1219 = _1205 ? as_type<int>(_1217) : as_type<int>(_211);
    float _1221 = _1119 + _1211;
    float _1223 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1213);
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1227 = _1215 + _1225;
    bool _1229 = !_391;
    float _1231 = _1229 ? _211 : as_type<float>(_1219);
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1235 = _1221 + _1233;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1239 = _1237 != 0;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1247 = _1245 != 0;
    int _1249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1251 = _1249 != 0;
    float _1253 = _1227 * _1227;
    float _1255 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1257 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1259 = fma(_1235, _1235, _1253);
    float _1261 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1263 = 1.0 / _1255;
    bool _1265 = !_1243;
    int _1267 = _1265 ? 0 : 1;
    float _1269 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1261);
    float _1271 = _1125 + _1257;
    bool _1273 = !_1239;
    int _1275 = _1273 ? 0 : 1;
    float _1277 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1269);
    float _1279 = sqrt(_1259);
    bool _1281 = !_1247;
    int _1283 = _1281 ? 0 : 1;
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1287 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1289 = isnan(0.5);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1295 = _1291 || _1293;
    bool _1297 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1305 = _1301 || _1303;
    float _1307 = _1285 + _1255;
    bool _1309 = !_1251;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = _1307 * _1263;
    float _1315 = _1313 * 0.5;
    bool _1317 = _1279 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1319 = _1209;
    float _1321 = _1257;
    float _1323 = _1215;
    float _1325 = _1259;
    float _1327 = _1255;
    float _1329 = _1227;
    float _1331 = _1207;
    if (!_1317)
    {
        _1319 = _1221;
    }
    float _1333 = _1319;
    float _1335 = _1333;
    if (!_1317)
    {
        _1321 = _1271;
    }
    float _1337 = _1321;
    bool _1339 = !_1317;
    float _1341 = _1337;
    if (!_1339)
    {
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1347 = _1279 + _1345;
        float _1349 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = rsqrt(_1259);
        float _1353 = _1347 * _1343;
        float _1355 = _1353 * 0.15915493667125701904296875;
        float _1357 = _1355 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = _1355 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        float _1365 = fma(_1359, _1349, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1367 = _1351 * _1365;
        float _1369 = _1363 + (-1.0);
        float _1371 = fma(_1235, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1373 = fma(_1227, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1375 = _1369 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1377 = fma(_1271, _1363, _1375);
        _1323 = _1373;
        _1325 = _1351;
        _1335 = _1371;
        _1341 = _1377;
    }
    float _1379 = _1323;
    float _1381 = _1325;
    float _1383 = _1335;
    float _1385 = _1341;
    float _1387 = _1385;
    float _1389 = _1383;
    float _1391 = _1381;
    if (_1305)
    {
        _1327 = 1.0;
    }
    float _1393 = _1327;
    float _1395 = _1393;
    if (_1295)
    {
        _1329 = _1379;
    }
    float _1397 = _1329;
    float _1399 = _1397;
    if (!_1295)
    {
        float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1403 = _1125 + _1401;
        float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1407 = _1119 + _1405;
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1411 = -_1119;
        float _1413 = _1411 + _1383;
        float _1415 = _1403 * _1403;
        float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1419 = _1133 + _1417;
        float _1421 = -_1125;
        float _1423 = _1421 + _1385;
        float _1425 = fma(_1407, _1407, _1415);
        float _1427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1429 = fma(_1419, _1419, _1425);
        float _1431 = sqrt(_1429);
        float _1433 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1435 = precise::min(_1431, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1437 = _1435 * _1427;
        float _1439 = _1433 * _1437;
        float _1441 = -_1133;
        float _1443 = _1441 + _1379;
        float _1445 = fma(_1413, _1439, _1119);
        float _1447 = fma(_1423, _1439, _1125);
        float _1449 = fma(_1443, _1439, _1133);
        _1387 = _1447;
        _1389 = _1445;
        _1399 = _1449;
        _1391 = _1409;
    }
    float _1451 = _1387;
    float _1453 = _1389;
    float _1455 = _1399;
    float _1457 = _1391;
    float _1459 = _1457;
    if (!_1305)
    {
        float _1461 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1463 = _1461 * 0.15915493667125701904296875;
        float _1465 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1469 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1467);
        float _1471 = _1463 * 6.283185482025146484375;
        float _1473 = cos(_1471);
        float _1475 = _1465 * 0.15915493667125701904296875;
        float _1477 = _1463 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = 1.0 / _1473;
        float _1483 = _1475 * 6.283185482025146484375;
        float _1485 = cos(_1483);
        float _1487 = _1479 * _1481;
        float _1489 = _1475 * 6.283185482025146484375;
        float _1491 = sin(_1489);
        float _1493 = _1485 * _1487;
        float _1495 = 1.0 / _1469;
        float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1499 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1497;
        float _1501 = 1.0 / _1493;
        float _1503 = 1.0 / _1499;
        float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1507 = _1495 * _1505;
        float _1509 = _1491 * _1501;
        float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1513 = fma(_1509, _1507, _1511);
        float _1515 = _1513 * _1503;
        float _1517 = precise::clamp(_1515, 0.0, 1.0);
        float _1519 = -_1517;
        float _1521 = _1519 + 1.0;
        _1459 = _1475;
        _1395 = _1521;
    }
    float _1523 = _1459;
    float _1525 = _1395;
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1529 = _1451 + _1527;
    float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1533 = _1453 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1537 = _1455 + _1535;
    float _1539 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1541 = _1529 * _1529;
    float _1543 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1545 = fma(_1533, _1533, _1541);
    float _1547 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1543);
    float _1549 = fma(_1537, _1537, _1545);
    float _1551 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1547);
    float _1553 = rsqrt(_1549);
    float _1555 = _1551 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1557 = sqrt(_1549);
    float _1559 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1561 = _1533 * _1559;
    float _1563 = _1537 * _1559;
    float _1565 = _1561 * _1561;
    float _1567 = _1563 * _1563;
    float _1569 = _1565 + _1567;
    float _1571 = sqrt(_1569);
    bool _1573 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1577 = _1571 + _1575;
    float _1579 = _1553;
    float _1581 = _1569;
    float _1583 = _1577;
    float _1585 = _1523;
    float _1587 = _1529;
    if (_1573)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1579 = _1589;
    }
    float _1591 = _1579;
    if (_1573)
    {
        float _1593 = rsqrt(_1569);
        _1581 = _1593;
    }
    float _1595 = _1581;
    float _1597 = _1595;
    if (_1573)
    {
        float _1599 = _1577 * _1591;
        _1583 = _1599;
    }
    float _1601 = _1583;
    if (_1573)
    {
        float _1603 = _1601 * 0.15915493667125701904296875;
        _1585 = _1603;
    }
    float _1605 = _1585;
    float _1607 = _1537;
    float _1609 = _1605;
    if (_1573)
    {
        float _1611 = _1605 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        _1607 = _1613;
    }
    float _1615 = _1607;
    float _1617 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1619 = precise::max(0.0, _1617);
    float _1621 = _1591;
    float _1623 = _1619;
    if (_1573)
    {
        float _1625 = _1605 * 6.283185482025146484375;
        float _1627 = cos(_1625);
        _1621 = _1627;
    }
    float _1629 = _1621;
    float _1631 = -_1559;
    float _1633 = -_1619;
    float _1635 = fma(_1529, _1631, _1633);
    if (_1573)
    {
        float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1587 = _1637;
    }
    float _1639 = _1587;
    float _1641 = _1639;
    float _1643 = _1615;
    if (_1573)
    {
        float _1645 = fma(_1615, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1641 = _1645;
    }
    float _1647 = _1641;
    float _1649 = _1647;
    if (!_1573)
    {
        _1643 = _1561;
    }
    float _1651 = _1643;
    float _1653 = _1651;
    float _1655 = _1629;
    if (_1573)
    {
        float _1657 = _1629 + (-1.0);
        _1623 = _1657;
    }
    float _1659 = _1623;
    float _1661 = _1659;
    if (_1573)
    {
        float _1663 = _1595 * _1647;
        _1331 = _1663;
    }
    float _1665 = _1331;
    if (!_1573)
    {
        _1649 = _1635;
    }
    float _1667 = _1649;
    float _1669 = _1667;
    if (_1573)
    {
        float _1671 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1609 = _1671;
    }
    float _1673 = _1609;
    if (_1573)
    {
        float _1675 = _1561 * _1665;
        _1653 = _1675;
    }
    float _1677 = _1653;
    if (!_1573)
    {
        _1661 = _1563;
    }
    float _1679 = _1661;
    float _1681 = _1679;
    if (_1573)
    {
        float _1683 = _1563 * _1665;
        _1681 = _1683;
    }
    float _1685 = _1681;
    if (!_1573)
    {
        _1597 = _1565;
    }
    float _1687 = _1597;
    float _1689 = _1687;
    if (_1573)
    {
        float _1691 = fma(_1635, _1629, _1673);
        _1669 = _1691;
    }
    float _1693 = _1669;
    if (_1573)
    {
        float _1695 = _1677 * _1677;
        _1689 = _1695;
    }
    float _1697 = _1689;
    if (!_1573)
    {
        _1655 = _1567;
    }
    float _1699 = _1655;
    float _1701 = _1699;
    if (_1573)
    {
        float _1703 = _1685 * _1685;
        _1701 = _1703;
    }
    float _1705 = _1701;
    float _1707 = fma(_1693, _1693, _1697);
    float _1709 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1711 = _1707 + _1705;
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1715 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1713);
    float _1717 = precise::clamp(_1715, 0.0, 1.0);
    float _1719 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1721 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1723 = -_1717;
    float _1725 = _1723 + 1.0;
    float _1727 = rsqrt(_1711);
    float _1729 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1721);
    float _1731 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1719);
    float _1733 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1729);
    float _1735 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1737 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1739 = abs(_1725);
    float _1741 = log2(_1739);
    float _1743 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1745 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1747 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1737);
    float _1749 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1751 = -_1745;
    float _1753 = fma(_1751, _1539, 1.0);
    float _1755 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1747);
    float _1757 = _1727 * _1677;
    float _1759 = _1727 * _1693;
    float _1761 = _1727 * _1685;
    float _1763 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1749);
    float _1765 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1767 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1769 = log2(_1753);
    float _1771 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1763);
    float _1773 = -_1765;
    float _1775 = fma(_1759, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1773);
    float _1777 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1779 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1771);
    float _1783 = -_1761;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1775);
    float _1787 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1789 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1779);
    float _1791 = exp2(_1777);
    float _1793 = fma(_1785, -0.5, 0.5);
    float _1795 = fma(_1785, 0.5, 0.5);
    float _1797 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1787);
    float _1799 = _1759 + 1.0;
    float _1801 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1789);
    float _1803 = fma(_1795, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1805 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1797);
    float _1807 = 1.0 / _1781;
    float _1809 = fma(_1795, _1803, -0.212114393711090087890625);
    float _1811 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1805);
    float _1813 = fma(_1795, _1809, 1.570728778839111328125);
    float _1815 = sqrt(_1793);
    float _1817 = -_1759;
    float _1819 = fma(_1791, _1799, _1817);
    float _1821 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1801);
    float _1823 = _1769 * 0.693147182464599609375;
    float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1827 = _1811 * _1807;
    float _1829 = _1821 * _1807;
    float _1831 = fma(_1827, 0.5, 0.5);
    float _1833 = fma(_1829, -0.5, 0.5);
    float _1835 = _1815 * 0.636619746685028076171875;
    float _1837 = fma(_1819, 0.5, 0.5);
    float _1839 = -_1813;
    float _1841 = fma(_1835, _1839, 1.0);
    float3 _6287 = float3(_1831, _1833, _1825);
    float _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6287, float3(0.0), isnan(_6287)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6287, float3(0.0), isnan(_6287)), level(0.0)).x;
    float3 _6298 = float3(_1831, _1833, _1825);
    float4 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6298, float3(0.0), isnan(_6298)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6298, float3(0.0), isnan(_6298)), level(0.0)).xyzw;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = _1846.w;
    float2 _6315 = float2(_1841, _1837);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6315, float2(0.0), isnan(_6315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6315, float2(0.0), isnan(_6315)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1868 = int(_1866);
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1872 = _1870 != 0;
    float _1874 = -_933;
    float _1876 = _1874 + 1.0;
    int _1878 = abs(_1267);
    float _1880 = -_931;
    float _1882 = _1880 + 1.0;
    int _1884 = abs(_1283);
    out.m_64.x = _1453;
    out.m_64.y = _1451;
    out.m_64.z = _1455;
    int _1886 = abs(_1311);
    float _1888 = trunc(_915);
    int _1890 = int(_1888);
    bool _1892 = _335 > 0.5;
    float _1894 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1896 = _341 > 0.5;
    float _1898 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1900 = -_925;
    float _1902 = _1900 + 1.0;
    float _1904 = -_921;
    float _1906 = _1904 + 1.0;
    float _1908 = -_929;
    float _1910 = _1908 + 1.0;
    float _1912 = float(uint(_1868));
    float _1914 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1916 = int(_1914);
    int _1918 = ~_1868;
    int _1920 = _1918 + 1;
    bool _1922 = _1868 == 0;
    float _1924 = float(uint(_1890));
    float _1926 = 1.0 / _1912;
    float _1928 = float(uint(_1916));
    float _1930 = trunc(_927);
    int _1932 = int(_1930);
    int _1934 = ~_1868;
    int _1936 = _1934 + 1;
    int _1938 = ~_1916;
    int _1940 = _1938 + 1;
    int _1942 = as_type<int>(_1926) + (-2);
    float _1944 = 1.0 / _1928;
    if (_1872)
    {
        _947 = _329;
    }
    float _1946 = _947;
    float _1948 = _1946;
    if (!_1872)
    {
        _1948 = _335;
    }
    float _1950 = _1948;
    float _1952 = as_type<float>(_1942) * _1924;
    float _1954 = -_211;
    int _1956 = _1892 ? as_type<int>(_1954) : as_type<int>(_211);
    float _1958 = trunc(_1952);
    float _1960 = precise::max(_1958, 0.0);
    uint _1963 = uint(_1960);
    float _1965 = float(uint(_1932));
    int _1967 = as_type<int>(_1944) + (-2);
    float _1969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1971 = _1952;
    if (_1872)
    {
        _1971 = 1.0;
    }
    float _1973 = _1971;
    float _1975 = _1973;
    if (!_1872)
    {
        _1975 = 1.2345600128173828125;
    }
    float _1977 = _1975;
    float _1979 = as_type<float>(_1967) * _1965;
    int _1981 = ~_1916;
    int _1983 = _1981 + 1;
    int _1985 = _1936 * int(_1963);
    int _1987 = _1985 + _1890;
    float _1989 = _1977 * _1950;
    float _1991 = float(_1890);
    float _1993 = trunc(_1979);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = float(uint(_1987));
    float _2001 = as_type<float>(_1987);
    if (_1872)
    {
        _2001 = 1.0;
    }
    float _2003 = _2001;
    float _2005 = _2003;
    if (!_1872)
    {
        _2005 = 7.345489978790283203125;
    }
    float _2007 = _2005;
    float _2009 = as_type<float>(_1942) * _1999;
    float _2011 = floor(_1989);
    int _2013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2015 = _2013 != 0;
    float _2017 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2019 = _2007 * _329;
    float _2021 = trunc(_2009);
    float _2023 = precise::max(_2021, 0.0);
    uint _2025 = uint(_2023);
    int _2027 = _1983 * int(_1997);
    int _2029 = _2027 + _1932;
    float _2031 = float(uint(_2029));
    float _2033 = floor(_2019);
    float _2035 = as_type<float>(_1967) * _2031;
    int _2037 = int(_1963) + int(_2025);
    float _2039 = trunc(_2035);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = float(_1868);
    int _2047 = _1920 * _2037;
    int _2049 = _2047 + _1890;
    bool _2051 = _1991 >= _2045;
    bool _2053 = isnan(_1991);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(_2045);
    bool _2059 = _2055 || _2057;
    float _2061 = float(_2059);
    float _2063 = -_2033;
    float _2065 = _2019 + _2063;
    float _2067 = -_2011;
    float _2069 = _1989 + _2067;
    bool _2071 = uint(_2049) >= uint(_1868);
    float _2073 = exp2(_1894);
    float _2075 = float(_1916);
    bool _2077 = !_2071;
    int _2079 = _2077 ? 0 : (-1);
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2083 = _2081 != 0;
    int _2085 = ~_2037;
    int _2087 = _2085 + _2079;
    int _2089 = _2087 + 1;
    float _2091 = trunc(_2061);
    int _2093 = int(_2091);
    int _2095 = int(_1997) + int(_2043);
    float _2097 = _2065 * _2045;
    float _2099 = float(_1932);
    int _2101 = _1868 * _2089;
    int _2103 = _2101 + _1890;
    int _2105 = _1868 + (-1);
    int _2107 = _1940 * _2095;
    int _2109 = _2107 + _1932;
    bool _2111 = _2099 >= _2075;
    bool _2113 = isnan(_2099);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan(_2075);
    bool _2119 = _2115 || _2117;
    float _2121 = float(_2119);
    float _2123 = _2045 * _913;
    bool _2125 = !_1922;
    int _2127 = _2125 ? _2103 : (-1);
    float _2129 = trunc(_2097);
    int _2131 = int(_2129);
    bool _2133 = !_2083;
    int _2135 = _2133 ? 0 : 1;
    float _2137 = _2075 * _913;
    bool _2139 = uint(_2109) >= uint(_1916);
    float _2141 = -_2073;
    float _2143 = _2141 + 1.0;
    int _2145 = abs(_2135);
    int _2147 = ~_2093;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    float _2153 = trunc(_2121);
    int _2155 = int(_2153);
    int _2157 = _2127 * _2151;
    bool _2159 = !_2139;
    int _2161 = _2159 ? 0 : (-1);
    bool _2163 = _1916 == 0;
    int _2165 = _2093 * _2105;
    int _2167 = _2165 + _2157;
    int _2169 = abs(_463);
    float _2171 = trunc(_2137);
    int _2173 = int(_2171);
    int _2175 = ~_2095;
    int _2177 = _2175 + _2161;
    int _2179 = _2177 + 1;
    int _2181 = _1916 * _2179;
    int _2183 = _2181 + _1932;
    float _2185 = _2069 * _2075;
    float _2187 = trunc(_2123);
    int _2189 = int(_2187);
    int _2191 = _2131 * _2145;
    int _2193 = _2191 + _1890;
    int _2195 = abs(_597);
    int _2197 = _2167 * _2169;
    int _2199 = ~_2155;
    int _2201 = _2199 + 1;
    int _2203 = _2201 + 1;
    bool _2205 = !_2163;
    int _2207 = _2205 ? _2183 : (-1);
    float _2209 = trunc(_2185);
    int _2211 = int(_2209);
    int _2213 = abs(_577);
    bool _2215 = !_2015;
    int _2217 = _2215 ? 0 : 1;
    int _2219 = _2207 * _2203;
    int _2221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2223 = _2221 != 0;
    int _2225 = _2189 * _2213;
    int _2227 = _2225 + _2197;
    int _2229 = abs(_2217);
    float _2231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2233 = !_2223;
    int _2235 = _2233 ? 0 : 1;
    int _2237 = _2193 * _2195;
    int _2239 = _2237 + _2227;
    int _2241 = _1916 + (-1);
    int _2243 = abs(_2235);
    int _2245 = _2131 * _2229;
    int _2247 = _2245 + _2239;
    int _2249 = abs(_1275);
    int _2251 = _2155 * _2241;
    int _2253 = _2251 + _2219;
    float _2255 = float(uint(_2247));
    int _2257 = _2253 * _1878;
    int _2259 = _2211 * _2243;
    int _2261 = _2259 + _1932;
    float _2263 = float(uint(_2193));
    float _2265 = as_type<float>(_1942) * _2255;
    int _2267 = ~_1868;
    int _2269 = _2267 + 1;
    int _2271 = _2173 * _2249;
    int _2273 = _2271 + _2257;
    int _2275 = ~_1916;
    int _2277 = _2275 + 1;
    float _2279 = trunc(_2265);
    float _2281 = precise::max(_2279, 0.0);
    uint _2283 = uint(_2281);
    int _2285 = ~_1916;
    int _2287 = _2285 + 1;
    int _2289 = _2261 * _1884;
    int _2291 = _2289 + _2273;
    int _2293 = ~_1868;
    int _2295 = _2293 + 1;
    int _2297 = _2211 * _1886;
    int _2299 = _2297 + _2291;
    float _2301 = as_type<float>(_1942) * _2263;
    float _2303 = float(uint(_2299));
    int _2305 = _2269 * int(_2283);
    int _2307 = _2305 + _2247;
    float _2309 = trunc(_2301);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    float _2315 = as_type<float>(_1967) * _2303;
    float _2317 = float(uint(_2261));
    float _2319 = float(uint(_2307));
    float _2321 = as_type<float>(_1967) * _2317;
    float _2323 = trunc(_2315);
    float _2325 = precise::max(_2323, 0.0);
    uint _2327 = uint(_2325);
    float _2329 = as_type<float>(_1942) * _2319;
    float _2331 = trunc(_2329);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    int _2337 = _2295 * int(_2313);
    int _2339 = _2337 + _2193;
    float _2341 = float(uint(_2339));
    float _2343 = trunc(_2321);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    int _2349 = _2277 * int(_2327);
    int _2351 = _2349 + _2299;
    float _2353 = as_type<float>(_1942) * _2341;
    int _2355 = ~_1868;
    int _2357 = _2355 + 1;
    float _2359 = float(uint(_2351));
    float _2361 = trunc(_2353);
    float _2363 = precise::max(_2361, 0.0);
    uint _2365 = uint(_2363);
    int _2367 = int(_2283) + int(_2335);
    float _2369 = as_type<float>(_1967) * _2359;
    int _2371 = _2287 * int(_2347);
    int _2373 = _2371 + _2261;
    float _2375 = trunc(_2369);
    float _2377 = precise::max(_2375, 0.0);
    uint _2379 = uint(_2377);
    int _2381 = _2357 * _2367;
    int _2383 = _2381 + _2247;
    float _2385 = float(uint(_2373));
    bool _2387 = uint(_2383) >= uint(_1868);
    float _2389 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2391 = as_type<float>(_1967) * _2385;
    bool _2393 = !_2387;
    int _2395 = _2393 ? 0 : (-1);
    int _2397 = ~_1868;
    int _2399 = _2397 + 1;
    float _2401 = _2389 * _329;
    int _2403 = int(_2313) + int(_2365);
    float _2405 = -_211;
    float _2407 = _2405 + 0.5;
    int _2409 = ~_2367;
    int _2411 = _2409 + _2395;
    int _2413 = _2411 + 1;
    float _2415 = trunc(_2391);
    float _2417 = precise::max(_2415, 0.0);
    uint _2419 = uint(_2417);
    float _2421 = _207 + 0.5;
    int _2423 = ~_1916;
    int _2425 = _2423 + 1;
    int _2427 = _1868 * _2413;
    int _2429 = _2427 + _2247;
    int _2431 = int(_2327) + int(_2379);
    int _2433 = _2399 * _2403;
    int _2435 = _2433 + _2193;
    out.m_66.x = _2421;
    out.m_66.y = _2407;
    float _2437 = trunc(_2401);
    int _2439 = int(_2437);
    bool _2441 = !_1922;
    int _2443 = _2441 ? _2429 : (-1);
    int _2445 = _2425 * _2431;
    int _2447 = _2445 + _2299;
    bool _2449 = uint(_2435) >= uint(_1868);
    bool _2451 = uint(_2447) >= uint(_1916);
    int _2453 = _2443 & 3;
    bool _2455 = _2453 != 0;
    bool _2457 = !_2449;
    int _2459 = _2457 ? 0 : (-1);
    bool _2461 = !_2451;
    int _2463 = _2461 ? 0 : (-1);
    bool _2465 = uint(_2453) >= 2u;
    int _2467 = ~_2403;
    int _2469 = _2467 + _2459;
    int _2471 = _2469 + 1;
    int _2473 = _2439 << 4;
    int _2475 = _2473 + 1712;
    int _2477 = ~_2431;
    int _2479 = _2477 + _2463;
    int _2481 = _2479 + 1;
    int _2483 = _1868 * _2471;
    int _2485 = _2483 + _2193;
    int _2487 = _2443 & 3;
    bool _2489 = _2487 != 0;
    uint _2491 = uint(int(uint(_2475) >> uint(2)));
    uint _2493 = uint(int(uint(int(_2491)) >> uint(2)));
    int _2495 = int(_2491) & 3;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[int(_2493)][_2495];
    int _2499 = int(_2491) + 1;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    int _2503 = _2499 & 3;
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[int(_2501)][_2503];
    int _2507 = _2465 ? 0 : 1;
    int _2509 = _1916 * _2481;
    int _2511 = _2509 + _2299;
    bool _2513 = _2453 != 3;
    int _2515 = _2489 ? 0 : 1;
    bool _2517 = uint(_2453) > 1u;
    int _2519 = _2475 + 8;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    uint _2523 = uint(int(uint(int(_2521)) >> uint(2)));
    int _2525 = int(_2521) & 3;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[int(_2523)][_2525];
    int _2529 = _2443 >> 31;
    int _2531 = ~_2507;
    int _2533 = _2531 + 1;
    int _2535 = _2533 + 1;
    int _2537 = _2529 & 3;
    bool _2539 = !_2163;
    int _2541 = _2539 ? _2511 : (-1);
    int _2543 = _2535;
    if (_2513)
    {
        int _2545 = ~_2507;
        int _2547 = _2545 + 1;
        _2543 = _2547;
    }
    int _2549 = _2543;
    int _2551 = _2443 + _2537;
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2555 = _2553 != 0;
    int _2557 = ~_2515;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    int _2563 = _2561;
    if (!_2517)
    {
        int _2565 = ~_2515;
        int _2567 = _2565 + 1;
        _2563 = _2567;
    }
    int _2569 = _2563;
    bool _2571 = _2453 != 3;
    bool _2573 = !_2555;
    int _2575 = _2573 ? 0 : 1;
    int _2577 = _2551 >> 2;
    int _2579 = _2541 & 3;
    bool _2581 = _2579 != 0;
    int _2583 = ~_1916;
    int _2585 = _2583 + 1;
    bool _2587 = !_1922;
    int _2589 = _2587 ? _2485 : (-1);
    int _2591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2593 = _2591 != 0;
    bool _2595 = !_2455;
    int _2597 = _2595 ? 0 : 1;
    int _2599 = _2577 << 4;
    int _2601 = _2599 + 368;
    bool _2603 = uint(_2579) > 1u;
    float _2605 = _2497 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2607 = !_2593;
    int _2609 = _2607 ? 0 : 1;
    uint _2611 = uint(int(uint(_2601) >> uint(2)));
    uint _2613 = uint(int(uint(int(_2611)) >> uint(2)));
    int _2615 = int(_2611) & 3;
    float _2617 = (*spvDescriptorSet0.vp_c9)._m0[int(_2613)][_2615];
    int _2619 = int(_2611) + 1;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    int _2623 = _2619 & 3;
    float _2625 = (*spvDescriptorSet0.vp_c9)._m0[int(_2621)][_2623];
    int _2627 = _2541 & 3;
    bool _2629 = _2627 != 0;
    float _2631 = _2505 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2633 = !_2571;
    int _2635 = _2633 ? 0 : (-1);
    float _2637 = _2605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2639 = _2579 != 3;
    float _2641 = _2527 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2643 = _2629 ? 0 : 1;
    float _2645 = _2631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2647 = uint(_2579) >= 2u;
    float _2649 = _2641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2651 = int(_2347) + int(_2419);
    int _2653 = ~_2643;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    int _2659 = _2657;
    if (!_2603)
    {
        int _2661 = ~_2643;
        int _2663 = _2661 + 1;
        _2659 = _2663;
    }
    int _2665 = _2659;
    int _2667 = _2647 ? 0 : 1;
    bool _2669 = _2579 != 3;
    int _2671 = _2585 * _2651;
    int _2673 = _2671 + _2261;
    bool _2675 = !_2581;
    int _2677 = _2675 ? 0 : 1;
    int _2679 = ~_2667;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    int _2685 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2687 = _2685 != 0;
    int _2689 = _2683;
    if (_2639)
    {
        int _2691 = ~_2667;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    bool _2697 = !_2669;
    int _2699 = _2697 ? 0 : (-1);
    float _2701 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2703 = uint(_2673) >= uint(_1916);
    int _2705 = _2601 + 8;
    uint _2707 = uint(int(uint(_2705) >> uint(2)));
    uint _2709 = uint(int(uint(int(_2707)) >> uint(2)));
    int _2711 = int(_2707) & 3;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[int(_2709)][_2711];
    int _2715 = int(_2707) + 1;
    uint _2717 = uint(int(uint(_2715) >> uint(2)));
    int _2719 = _2715 & 3;
    float _2721 = (*spvDescriptorSet0.vp_c9)._m0[int(_2717)][_2719];
    int _2723 = _2541 >> 31;
    float _2725 = _2701 * _329;
    int _2727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2729 = _2727 != 0;
    bool _2731 = _329 > 0.5;
    float _2733 = trunc(_2725);
    int _2735 = int(_2733);
    int _2737 = _2723 & 3;
    int _2739 = abs(_2569);
    float _2741 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2743 = _2541 + _2737;
    float _2745 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2747 = !_2703;
    int _2749 = _2747 ? 0 : (-1);
    float _2751 = _421 + 0.5;
    int _2753 = _2743 >> 2;
    out.m_68.x = _2637;
    out.m_68.y = _2645;
    out.m_68.z = _2649;
    out.m_68.w = _2741;
    int _2755 = ~_2739;
    int _2757 = _2755 + 1;
    int _2759 = _2757 + 1;
    float _2761 = fma(_2745, _2751, _937);
    int _2763 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2765 = _2763 != 0;
    float _2767 = _427 + (-0.5);
    float _2769 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2771 = _2759 * as_type<int>(_2625);
    float _2773 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2775 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2777 = int(_2775);
    float _2779 = -_2017;
    float _2781 = -_945;
    float _2783 = fma(_2779, _2767, _2781);
    float _2785 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2787 = abs(_2635);
    float _2789 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2773);
    int _2791 = ~_2651;
    int _2793 = _2791 + _2749;
    int _2795 = _2793 + 1;
    float _2797 = -_1139;
    float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2785);
    int _2801 = abs(_2597);
    float _2803 = -_1139;
    float _2805 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2769);
    int _2807 = _2753 << 4;
    int _2809 = _2807 + 512;
    float _2811 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2813 = ~_2801;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    float _2819 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    uint _2821 = uint(int(uint(_2809) >> uint(2)));
    uint _2823 = uint(int(uint(int(_2821)) >> uint(2)));
    int _2825 = int(_2821) & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    int _2829 = int(_2821) + 1;
    uint _2831 = uint(int(uint(_2829) >> uint(2)));
    int _2833 = _2829 & 3;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[int(_2831)][_2833];
    int _2837 = abs(_2665);
    int _2839 = _1916 * _2795;
    int _2841 = _2839 + _2261;
    float _2843 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2819);
    int _2845 = _2817 * as_type<int>(_2617);
    int _2847 = _2845 + _2771;
    int _2849 = abs(_2549);
    float _2851 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2853 = float(uint(_2777));
    int _2855 = _2809 + 8;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    uint _2859 = uint(int(uint(int(_2857)) >> uint(2)));
    int _2861 = int(_2857) & 3;
    float _2863 = (*spvDescriptorSet0.vp_c9)._m0[int(_2859)][_2861];
    int _2865 = int(_2857) + 1;
    uint _2867 = uint(int(uint(_2865) >> uint(2)));
    int _2869 = _2865 & 3;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[int(_2867)][_2869];
    int _2873 = ~_2849;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    float _2879 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2851);
    float _2881 = -_1139;
    float _2883 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2811);
    int _2885 = abs(_2575);
    int _2887 = _2877 * as_type<int>(_2713);
    int _2889 = _2887 + _2847;
    int _2891 = ~_2787;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2899 = ~_2885;
    int _2901 = _2899 + 1;
    int _2903 = _2901 + 1;
    float _2905 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2799);
    int _2907 = abs(_2695);
    int _2909 = _2895 * as_type<int>(_2721);
    int _2911 = _2909 + _2889;
    float _2913 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2915 = 1.0 / _2853;
    float _2917 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2919 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2913);
    float _2921 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2897);
    float _2923 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2917);
    int _2925 = _2911 * _2903;
    int _2927 = abs(_2677);
    float _2929 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2931 = int(_2929);
    int _2933 = ~_2837;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = _2589 * _2885;
    int _2941 = _2939 + _2925;
    int _2943 = ~_2927;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    float _2949 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2919);
    int _2951 = abs(_2609);
    float _2953 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2805);
    float _2955 = float(uint(_2941));
    float _2957 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2883);
    int _2959 = _2735 << 4;
    int _2961 = _2959 + 1968;
    float _2963 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2965 = !_2687;
    float _2967 = _2965 ? _211 : as_type<float>(_1956);
    float _2969 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2971 = _2961 + 8;
    uint _2973 = uint(int(uint(_2971) >> uint(2)));
    uint _2975 = uint(int(uint(int(_2973)) >> uint(2)));
    int _2977 = int(_2973) & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    float _2981 = -_207;
    int _2983 = _2731 ? as_type<int>(_2981) : as_type<int>(_207);
    float _2985 = float(uint(_2931));
    float _2987 = fma(_2969, _2969, 1.0);
    int _2989 = _2937 * as_type<int>(_2835);
    int _2991 = as_type<int>(_2915) + (-2);
    int _2993 = _2947 * as_type<int>(_2827);
    int _2995 = _2993 + _2989;
    float _2997 = as_type<float>(_2991) * _2955;
    int _2999 = abs(_2699);
    float _3001 = 1.0 / _2985;
    int _3003 = ~_2907;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    int _3009 = abs(_2777);
    int _3011 = ~_2999;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    int _3017 = _3007 * as_type<int>(_2863);
    int _3019 = _3017 + _2995;
    float _3021 = trunc(_2997);
    float _3023 = precise::max(_3021, 0.0);
    uint _3025 = uint(_3023);
    int _3027 = ~_2951;
    int _3029 = _3027 + 1;
    int _3031 = _3029 + 1;
    int _3033 = _3015 * as_type<int>(_2871);
    int _3035 = _3033 + _3019;
    int _3037 = abs(_2931);
    float _3039 = float(uint(_3009));
    int _3041 = _3035 * _3031;
    bool _3043 = !_2163;
    int _3045 = _3043 ? _2841 : (-1);
    float _3047 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2921);
    float _3049 = 1.0 / _3039;
    float _3051 = float(uint(_3037));
    int _3053 = ~_2777;
    int _3055 = _3053 + 1;
    int _3057 = _3045 * _2951;
    int _3059 = _3057 + _3041;
    int _3061 = as_type<int>(_3001) + (-2);
    float _3063 = -_207;
    int _3065 = _1896 ? as_type<int>(_3063) : as_type<int>(_207);
    int _3067 = _3055 * int(_3025);
    int _3069 = _3067 + _2941;
    float _3071 = 1.0 / _3051;
    float _3073 = float(uint(_3059));
    float _3075 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2923);
    int _3077 = abs(_2941);
    uint _3079 = uint(int(uint(_2961) >> uint(2)));
    uint _3081 = uint(int(uint(int(_3079)) >> uint(2)));
    int _3083 = int(_3079) & 3;
    float _3085 = (*spvDescriptorSet0.vp_c9)._m0[int(_3081)][_3083];
    int _3087 = int(_3079) + 1;
    uint _3089 = uint(int(uint(_3087) >> uint(2)));
    int _3091 = _3087 & 3;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[int(_3089)][_3091];
    float _3095 = float(uint(_3069));
    float _3097 = as_type<float>(_3061) * _3073;
    int _3099 = abs(_3059);
    float _3101 = rsqrt(_2987);
    int _3103 = as_type<int>(_3049) + (-2);
    float _3105 = as_type<float>(_2991) * _3095;
    float _3107 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2879);
    float _3109 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2843);
    float _3111 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2789);
    float _3113 = float(uint(_3077));
    float _3115 = _2969 * _2957;
    float _3117 = trunc(_3097);
    float _3119 = precise::max(_3117, 0.0);
    uint _3121 = uint(_3119);
    int _3123 = as_type<int>(_3071) + (-2);
    float _3125 = as_type<float>(_3103) * _3113;
    float _3127 = float(uint(_3099));
    float _3129 = fma(_2963, _3111, _3115);
    bool _3131 = !_2729;
    float _3133 = _3131 ? _207 : as_type<float>(_3065);
    out.m_70.x = _3107;
    out.m_70.y = _3109;
    out.m_70.z = _3111;
    int _3135 = ~_2931;
    int _3137 = _3135 + 1;
    float _3139 = as_type<float>(_3123) * _3127;
    float _3141 = trunc(_3125);
    float _3143 = precise::max(_3141, 0.0);
    uint _3145 = uint(_3143);
    int _3147 = ~_3009;
    int _3149 = _3147 + 1;
    float _3151 = _2969 * _2905;
    bool _3153 = !_2765;
    float _3155 = _3153 ? _207 : as_type<float>(_2983);
    float _3157 = _2969 * _2953;
    int _3159 = ~_3037;
    int _3161 = _3159 + 1;
    float _3163 = fma(_2963, _3107, _3151);
    int _3165 = _3137 * int(_3121);
    int _3167 = _3165 + _3059;
    float _3169 = trunc(_3139);
    float _3171 = precise::max(_3169, 0.0);
    uint _3173 = uint(_3171);
    float _3175 = fma(_2963, _3109, _3157);
    int _3177 = ~_3009;
    int _3179 = _3177 + 1;
    float _3181 = float(uint(_3167));
    int _3183 = ~_3037;
    int _3185 = _3183 + 1;
    int _3187 = _3149 * int(_3145);
    int _3189 = _3187 + _3077;
    float _3191 = as_type<float>(_3061) * _3181;
    float _3193 = trunc(_3105);
    float _3195 = precise::max(_3193, 0.0);
    uint _3197 = uint(_3195);
    float _3199 = _2969 * _3101;
    float _3201 = float(uint(_3189));
    float _3203 = -_3047;
    float _3205 = _3199 * _3203;
    int _3207 = _3161 * int(_3173);
    int _3209 = _3207 + _3099;
    float _3211 = _3085 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3213 = as_type<float>(_3103) * _3201;
    float _3215 = fma(_427, _1876, _2783);
    float _3217 = float(uint(_3209));
    float _3219 = _2949 + _3163;
    float _3221 = -_1882;
    float _3223 = fma(_421, _3221, _2761);
    float _3225 = trunc(_3213);
    float _3227 = precise::max(_3225, 0.0);
    uint _3229 = uint(_3227);
    float _3231 = -_2949;
    float _3233 = _3199 * _3231;
    float _3235 = as_type<float>(_3123) * _3217;
    float _3237 = -_3075;
    float _3239 = _3199 * _3237;
    int _3241 = int(_3025) + int(_3197);
    float _3243 = fma(_3101, _2905, _3233);
    float _3245 = _3047 + _3175;
    int _3247 = ~_2777;
    int _3249 = _3247 + 1;
    float _3251 = trunc(_3235);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    float _3257 = fma(_3101, _2953, _3205);
    float _3259 = fma(_3101, _2957, _3239);
    float _3261 = _3093 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3263 = ~_2931;
    int _3265 = _3263 + 1;
    float _3267 = _2979 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3269 = trunc(_3191);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    int _3275 = int(_3145) + int(_3229);
    int _3277 = _3249 * _3241;
    int _3279 = _3277 + _2941;
    float _3281 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3283 = _3179 * _3275;
    int _3285 = _3283 + _3077;
    bool _3287 = uint(_3279) >= uint(_2777);
    float _3289 = _3211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3291 = int(_3173) + int(_3255);
    float _3293 = _3261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3295 = _3267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3297 = uint(_3285) >= uint(_3009);
    float _3299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3301 = _3185 * _3291;
    int _3303 = _3301 + _3099;
    bool _3305 = !_3287;
    int _3307 = _3305 ? 0 : (-1);
    out.m_72.x = _3289;
    out.m_72.y = _3293;
    out.m_72.z = _3295;
    out.m_72.w = _3281;
    int _3309 = int(_3121) + int(_3273);
    float _3311 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1898);
    bool _3313 = uint(_3303) >= uint(_3037);
    float _3315 = -_923;
    float _3317 = _3315 + 1.0;
    bool _3319 = !_3297;
    int _3321 = _3319 ? 0 : (-1);
    int _3323 = _3265 * _3309;
    int _3325 = _3323 + _3059;
    int _3327 = ~_3241;
    int _3329 = _3327 + _3307;
    int _3331 = _3329 + 1;
    float _3333 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3311);
    int _3335 = _2941 ^ _2777;
    float _3337 = _3075 + _3129;
    bool _3339 = uint(_3325) >= uint(_2931);
    int _3341 = _2777 * _3331;
    int _3343 = _3341 + _2941;
    int _3345 = ~_3321;
    int _3347 = _3275 + _3345;
    int _3349 = _3347 + 1;
    float _3351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _3353 = uint(int(uint(_3335) >> uint(31)));
    out.m_74.x = _3223;
    out.m_74.y = _3215;
    bool _3355 = !_3339;
    int _3357 = _3355 ? 0 : (-1);
    bool _3359 = _2777 == 0;
    out.m_76.x = _3219;
    out.m_76.y = _3245;
    out.m_76.z = _3337;
    int _3361 = ~int(_3353);
    int _3363 = _3361 + 1;
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3367 = ~_3309;
    int _3369 = _3367 + _3357;
    int _3371 = _3369 + 1;
    out.m_78.x = _3243;
    out.m_78.y = _3257;
    out.m_78.z = _3259;
    int _3373 = _3059 ^ _2931;
    bool _3375 = !_3359;
    int _3377 = _3375 ? _3343 : (-1);
    int _3379 = _2931 * _3371;
    int _3381 = _3379 + _3059;
    bool _3383 = !_3313;
    int _3385 = _3383 ? 0 : (-1);
    float _3387 = _3351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3389 = _3349 ^ _3363;
    float _3391 = _3299 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3393 = uint(int(uint(_3373) >> uint(31)));
    float _3395 = float(_3377);
    bool _3397 = _2931 == 0;
    float _3399 = _3365 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3401 = _2777 == 0;
    float _3403 = fma(_3387, _3395, _413);
    int _3405 = ~_3363;
    int _3407 = _3405 + _3389;
    int _3409 = _3407 + 1;
    int _3411 = ~_3385;
    int _3413 = _3291 + _3411;
    int _3415 = _3413 + 1;
    int _3417 = ~int(_3393);
    int _3419 = _3417 + 1;
    float _3421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3423 = !_3397;
    int _3425 = _3423 ? _3381 : (-1);
    bool _3427 = !_3401;
    int _3429 = _3427 ? _3409 : (-1);
    int _3431 = _3415 ^ _3419;
    float _3433 = float(_3425);
    float _3435 = _3155 + 0.5;
    float _3437 = float(_3429);
    bool _3439 = _2931 == 0;
    float _3441 = fma(_3387, _3435, _3403);
    int _3443 = ~_3419;
    int _3445 = _3443 + _3431;
    int _3447 = _3445 + 1;
    float _3449 = -_917;
    float _3451 = fma(_3399, _3437, _3449);
    float _3453 = fma(_3391, _3433, _941);
    float _3455 = _3133 + 0.5;
    bool _3457 = !_3439;
    int _3459 = _3457 ? _3447 : (-1);
    float _3461 = _3421 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3463 = _2967 + (-0.5);
    float _3465 = fma(_3391, _3455, _3453);
    float _3467 = float(_3459);
    float _3469 = _1231 + (-0.5);
    float _3471 = -_3399;
    float _3473 = fma(_3471, _3463, _3451);
    float _3475 = -_3317;
    float _3477 = fma(_3133, _3475, _3465);
    float _3479 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3481 = -_943;
    float _3483 = fma(_3461, _3467, _3481);
    float _3485 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3333);
    float _3487 = _1811 + _1781;
    float _3489 = _1781 * 0.5;
    float _3491 = -_3461;
    float _3493 = fma(_3491, _3469, _3483);
    float _3495 = _3479 * _1843;
    bool _3497 = _1525 > 0.0;
    bool _3499 = isnan(_1525);
    bool _3501 = _3497 || _3499;
    bool _3503 = isnan(0.0);
    bool _3505 = _3501 || _3503;
    float _3507 = _3487 * 0.5;
    float _3509 = fma(_1821, -0.5, _3489);
    float _3511 = fma(_1231, _1902, _3493);
    float _3513 = _3485 + _1781;
    float _3515 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3517 = _1854 * _3495;
    float _3519 = _1864 * _3495;
    float _3521 = -_3479;
    float _3523 = _3521 + 1.0;
    float _3525 = -_1906;
    float _3527 = fma(_3155, _3525, _3441);
    out.gl_Position.x = _1811;
    out.gl_Position.y = _1821;
    out.gl_Position.z = _3485;
    out.gl_Position.w = _1781;
    float _3529 = fma(_2967, _1910, _3473);
    float _3531 = _3513 * 0.5;
    float _3533 = _3515 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3535 = fma(_1860, _3517, _1848);
    float _3537 = fma(_1862, _3517, _1850);
    float _3539 = _1854 * _3523;
    float _3541 = fma(_1854, _3519, _1852);
    out.m_80.x = _3507;
    out.m_80.y = _3509;
    out.m_80.z = _3531;
    out.m_80.w = _1781;
    out.m_82.x = _3527;
    out.m_82.y = _3529;
    out.m_82.z = _3477;
    out.m_82.w = _3511;
    out.m_45.x = _3533;
    out.m_84.x = _3535;
    out.m_84.y = _3537;
    out.m_84.z = _3541;
    out.m_84.w = _3539;
    if (_3505)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3543 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3543;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_45.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3600 = as_type<float>(_119);
        out.gl_Position.z = _3600;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_47.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    float _141 = _137;
    if (_133)
    {
        float _143 = float(_103);
        _139 = _143;
    }
    float _145 = _139;
    bool _147 = _137 >= _145;
    bool _149 = !_133;
    bool _151 = _147 || _149;
    if (_151)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _113;
    if (_151)
    {
        out.m_45.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3669 = as_type<float>(_157);
        out.gl_Position.z = _3669;
    }
    if (_151)
    {
        return out;
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_52.w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_47.x;
    float _175 = in.m_47.y;
    float _177 = in.m_47.z;
    float _179 = in.m_42.x;
    float _181 = in.m_42.y;
    float _183 = in.m_42.z;
    int _185 = as_type<int>(_159) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_159) & 2;
    bool _191 = _189 != 0;
    float _193 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _195 = 0.0;
    float _197 = _193;
    if (!_171)
    {
        float _199 = _193 * _193;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    bool _205 = !_187;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_191;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203;
    if (!_171)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    bool _219 = !_171;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _193 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _193);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_171;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _193 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _197 = _275;
    }
    float _277 = _197;
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _287 = fma(_277, _173, _281);
    float _289 = fma(_277, _175, _283);
    float _291 = fma(_277, _177, _285);
    float _293 = fma(_287, _161, _179);
    float _295 = fma(_289, _161, _181);
    float _297 = fma(_291, _161, _183);
    bool _299 = !_279;
    float _317;
    if (!_299)
    {
        float _301 = in.m_54.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_103);
        float _323 = 1.0 / _321;
        float _325 = _137 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = in.m_54.x;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = _327 + _331;
    float _335 = in.m_54.y;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    float _341 = in.m_54.z;
    float _343 = 1.0 / _339;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = _327 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _327 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _327 + _357;
    float _361 = 1.0 / _347;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _367 = _329 * 2.0;
    float _369 = _333 * _343;
    float _371 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _373 = _335 > 0.5;
    float _375 = floor(_367);
    float _377 = _335 * 2.0;
    float _379 = -_363;
    float _381 = fma(_371, 2.0, _379);
    bool _383 = _341 > 0.5;
    float _385 = _335 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _387 = _355 * _361;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _395 = _393 != 0;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _399 = _397 != 0;
    float _401 = floor(_377);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _403;
    float _407 = -_207;
    float _409 = _373 ? _407 : _207;
    float _411 = -_137;
    float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[76].x, _381);
    float _415 = -_211;
    int _417 = _383 ? as_type<int>(_415) : as_type<int>(_211);
    bool _419 = !_395;
    float _421 = _419 ? _207 : _409;
    float _423 = 1.0 / _405;
    bool _425 = !_399;
    float _427 = _425 ? _211 : as_type<float>(_417);
    float _429 = fma(_385, -2.0, _365);
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _441 = _439 != 0;
    float _443 = _341 * 2.0;
    bool _445 = _375 > 0.0;
    bool _447 = _375 >= 0.0;
    bool _449 = isnan(_375);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    float _457 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _459 = int(_457);
    bool _461 = !_437;
    int _463 = _461 ? 0 : 1;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _467 = _465 != 0;
    int _469 = _455 ? 0 : 1;
    bool _471 = _401 > 0.0;
    float _473 = _351 * _423;
    int _475 = ~_469;
    int _477 = _475 + 1;
    int _479 = _477 + 1;
    int _481 = _479;
    int _483 = as_type<int>(_423);
    int _485 = as_type<int>(_333);
    float _487 = _409;
    if (!_445)
    {
        int _489 = ~_469;
        int _491 = _489 + 1;
        _481 = _491;
    }
    int _493 = _481;
    float _495 = _341 + _335;
    bool _497 = _401 >= 0.0;
    bool _499 = isnan(_401);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    float _507 = _495;
    if (_467)
    {
        _483 = 0;
        _485 = 0;
    }
    int _509 = _483;
    int _511 = _485;
    int _513 = _505 ? 0 : 1;
    float _515 = _495 + (-1.0);
    int _517 = _509;
    int _519 = _511;
    if (!_467)
    {
        _517 = 2;
    }
    int _521 = _517;
    if (!_467)
    {
        _519 = 1;
    }
    int _523 = _519;
    bool _525 = _521 != 2;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _531 = ~_513;
    int _533 = _531 + 1;
    int _535 = _533 + 1;
    float _537 = floor(_443);
    int _539 = _535;
    if (!_471)
    {
        int _541 = ~_513;
        int _543 = _541 + 1;
        _539 = _543;
    }
    int _545 = _539;
    float _547 = _329 + _341;
    bool _549 = _523 != 1;
    float _551 = _329 + _335;
    bool _553 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _555 = isnan(_327);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = _547 + (-1.0);
    float _567 = 1.0 / _529;
    float _569 = _551 + (-1.0);
    float _571 = -_563;
    float _573 = _571 + 1.0;
    bool _575 = !_433;
    int _577 = _575 ? 0 : 1;
    float _579 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _581 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _583 = isnan(_327);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _595 = !_441;
    int _597 = _595 ? 0 : 1;
    float _599 = 0.0;
    float _601 = _547;
    if (_525)
    {
        _599 = _329;
    }
    float _603 = _599;
    float _605 = _591 * _573;
    float _607 = _603;
    if (_525)
    {
        _507 = _335;
    }
    float _609 = _507;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _609;
    if (!_525)
    {
        _607 = _341;
    }
    float _617 = _607;
    float _619 = _359 * _567;
    float _621 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _623;
    if (!_525)
    {
        _615 = _329;
    }
    float _627 = _615;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _639 = _637 != 0;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _643 = _641 != 0;
    float _645 = fma(_625, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _647 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _649 = isnan(_327);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = fma(_631, _387, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _661 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _663 = isnan(_327);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _675 = int(_673);
    bool _677 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _679 = isnan(_327);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_657;
    float _691 = _689 + 1.0;
    bool _693 = _537 >= 0.0;
    bool _695 = isnan(_537);
    bool _697 = _693 || _695;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    float _703 = _627 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _705 = _687 * _691;
    int _707 = _701 ? 0 : 1;
    float _709 = -_687;
    float _711 = _709 + 1.0;
    bool _713 = _537 > 0.0;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _715;
    float _719 = 0.0;
    if (!_549)
    {
        _719 = _335;
    }
    float _721 = _719;
    float _723 = _671 * _711;
    float _725 = fma(_717, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _727 = !_635;
    int _729 = _727 ? 0 : 1;
    float _731 = _645 * _723;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _737 = _725 * _723;
    float _739 = _721;
    if (!_549)
    {
        _487 = _721;
    }
    float _741 = _487;
    float _743 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _745 = log2(_743);
    float _747 = _741;
    if (_549)
    {
        _739 = _329;
    }
    float _749 = _739;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _753 = ~_707;
    int _755 = _753 + 1;
    int _757 = _755 + 1;
    float _759 = fma(_735, _387, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _761 = _757;
    if (!_713)
    {
        int _763 = ~_707;
        int _765 = _763 + 1;
        _761 = _765;
    }
    int _767 = _761;
    float _769 = _617 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _771 = abs(_729);
    float _773 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[83].z, _751);
    if (!_549)
    {
        _601 = _341;
    }
    float _775 = _601;
    float _777 = _657 * _613;
    float _779 = float(_103);
    float _781 = float(_459);
    float _783 = _745 * _137;
    float _785 = _775;
    if (_549)
    {
        _785 = _335;
    }
    float _787 = _785;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_549)
    {
        _747 = _329;
    }
    float _791 = _747;
    float _793 = 1.0 / _779;
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _797 = float(_767);
    float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _801 = float(_771);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _805 = 1.0 / _781;
    float _807 = _801 * _797;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _811 = 0.0;
    if (!_549)
    {
        _811 = _341;
    }
    float _813 = _811;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _817 = _813;
    if (_549)
    {
        _817 = _335;
    }
    float _819 = _817;
    float _821 = exp2(_783);
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _825 = fma(_703, -2.0, _789);
    float _827 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[83].w, _803);
    float _829 = -_809;
    float _831 = fma(_769, 2.0, _829);
    float _833 = -_815;
    float _835 = fma(_799, 2.0, _833);
    float _837 = fma(_795, -2.0, _823);
    float _839 = float(_675);
    float _841 = in.m_56.x;
    float _843 = in.m_56.y;
    float _845 = in.m_56.z;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _849 = 1.0 + _847;
    float _851 = 1.0 / _839;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _859;
    float _863 = 1.0 / _849;
    bool _865 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _867 = isnan(1.0);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _873 = _869 || _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _875;
    float _879 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[88].w, _857);
    float _881 = -_821;
    float _883 = _881 + 1.0;
    float _885 = fma(_861, _473, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _887 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _899 = fma(_877, _473, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _901 = !_639;
    int _903 = _901 ? 0 : 1;
    float _905 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].z, _853);
    float _907 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].w, _855);
    float _909 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[88].z, _897);
    float _911 = _895 ? _883 : 0.0;
    float _913 = _793 * _137;
    float _915 = _805 * _137;
    float _917 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _429);
    int _919 = abs(_903);
    float _921 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _905);
    float _923 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _773);
    float _925 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _827);
    float _927 = _851 * _137;
    float _929 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _907);
    float _931 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _909);
    float _933 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _879);
    float _935 = -_137;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[86].x, _831);
    float _939 = -_137;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[81].x, _835);
    float _943 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _837);
    float _945 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _825);
    float _947 = _927;
    if (_873)
    {
        float _949 = _911 * _863;
        _141 = _949;
    }
    float _951 = _141;
    float _953 = _807 * (-2.0);
    float _955 = _329 + (-0.5);
    float _957 = float(_493);
    float _959 = fma(_953, _841, _841);
    bool _961 = !_643;
    int _963 = _961 ? 0 : 1;
    float _965 = fma(_579, _953, _579);
    float _967 = float(_919);
    float _969 = -_671;
    float _971 = _969 + 1.0;
    int _973 = abs(_963);
    float _975 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[196].x, _959);
    float _977 = float(_545);
    float _979 = _967 * _957;
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[143].x, _731);
    float _983 = fma(_965, _951, _975);
    float _985 = _979 * (-2.0);
    float _987 = float(_973);
    float _989 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[143].y, _737);
    float _991 = _335 + (-0.5);
    float _993 = fma(_985, _843, _843);
    float _995 = fma(_593, _985, _593);
    float _997 = _987 * _977;
    float _999 = fma(_759, _705, _989);
    float _1001 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _993);
    float _1003 = fma(_659, _705, _981);
    float _1005 = _997 * (-2.0);
    float _1007 = _983 * 0.15915493667125701904296875;
    float _1009 = fma(_995, _951, _1001);
    float _1011 = in.m_58.x;
    float _1013 = in.m_58.y;
    float _1015 = in.m_58.z;
    float _1017 = fma(_621, _1005, _621);
    float _1019 = fma(_1005, _845, _845);
    float _1021 = _1009 * 0.15915493667125701904296875;
    float _1023 = in.m_52.x;
    float _1025 = in.m_52.y;
    float _1027 = _341 + (-0.5);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1037 = in.m_60.x;
    float _1039 = in.m_60.y;
    float _1041 = in.m_60.z;
    float _1043 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1019);
    float _1045 = fma(_1031, _619, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1047 = fma(_1035, _619, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1049 = fma(_885, _777, _1003);
    float _1051 = fma(_1017, _951, _1043);
    float _1053 = fma(_899, _777, _999);
    float _1055 = in.m_62.x;
    float _1057 = in.m_62.y;
    float _1059 = in.m_62.z;
    float _1061 = fma(_1045, _605, _1049);
    float _1063 = _1051 * 0.15915493667125701904296875;
    float _1065 = fma(_1047, _605, _1053);
    float _1067 = _1007 * 6.283185482025146484375;
    float _1069 = sin(_1067);
    float _1071 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1061);
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1075 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1065);
    float _1077 = _1007 * 6.283185482025146484375;
    float _1079 = cos(_1077);
    float _1081 = _1075 * _1025;
    float _1083 = _1071 * _1023;
    float _1085 = _295 * _1013;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1089 = _295 * _1039;
    float _1091 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1095 = _1021 * 6.283185482025146484375;
    float _1097 = sin(_1095);
    float _1099 = fma(_293, _1037, _1089);
    float _1101 = _1091 * _1087;
    float _1103 = _1093 * _1073;
    float _1105 = _295 * _1057;
    float _1107 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1109 = fma(_297, _1041, _1099);
    float _1111 = fma(_293, _1011, _1085);
    float _1113 = _1021 * 6.283185482025146484375;
    float _1115 = cos(_1113);
    float _1117 = fma(_293, _1055, _1105);
    float _1119 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1121 = fma(_297, _1015, _1111);
    float _1123 = fma(_297, _1059, _1117);
    float _1125 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1127 = _1063 * 6.283185482025146484375;
    float _1129 = cos(_1127);
    float _1131 = _1069 * _1097;
    float _1133 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1137 = _1063 * 6.283185482025146484375;
    float _1139 = sin(_1137);
    float _1141 = _1079 * _1115;
    float _1143 = _1069 * _1115;
    float _1145 = _1079 * _1129;
    float _1147 = _1079 * _1097;
    float _1149 = _1069 * _1129;
    float _1151 = _1115 * _1129;
    float _1153 = _1145 * _1101;
    float _1155 = _1097 * _1129;
    float _1157 = in.m_54.w;
    float _1159 = fma(_1139, _1141, _1131);
    float _1161 = -_1101;
    float _1163 = _1139 * _1161;
    float _1165 = -_1143;
    float _1167 = fma(_1139, _1147, _1165);
    float _1169 = -_1147;
    float _1171 = fma(_1139, _1143, _1169);
    float _1173 = fma(_1159, _1103, _1153);
    float _1175 = _1149 * _1101;
    float _1177 = fma(_1151, _1103, _1163);
    float _1179 = fma(_1139, _1131, _1141);
    float _1181 = fma(_1167, _1107, _1173);
    float _1183 = fma(_1171, _1103, _1175);
    float _1185 = fma(_1155, _1107, _1177);
    float _1187 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1189 = fma(_1179, _1107, _1183);
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1187);
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1191);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1193);
    float _1201 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1195);
    float _1203 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1197);
    bool _1205 = _1157 > 0.5;
    float _1207 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1209 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1199);
    float _1211 = _1203 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1213 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1135);
    float _1215 = _1133 + _1207;
    float _1217 = -_211;
    int _1219 = _1205 ? as_type<int>(_1217) : as_type<int>(_211);
    float _1221 = _1119 + _1211;
    float _1223 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1213);
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1227 = _1215 + _1225;
    bool _1229 = !_391;
    float _1231 = _1229 ? _211 : as_type<float>(_1219);
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1235 = _1221 + _1233;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1239 = _1237 != 0;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1247 = _1245 != 0;
    int _1249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1251 = _1249 != 0;
    float _1253 = _1227 * _1227;
    float _1255 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1257 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1259 = fma(_1235, _1235, _1253);
    float _1261 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1263 = 1.0 / _1255;
    bool _1265 = !_1243;
    int _1267 = _1265 ? 0 : 1;
    float _1269 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1261);
    float _1271 = _1125 + _1257;
    bool _1273 = !_1239;
    int _1275 = _1273 ? 0 : 1;
    float _1277 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1269);
    float _1279 = sqrt(_1259);
    bool _1281 = !_1247;
    int _1283 = _1281 ? 0 : 1;
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1287 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1289 = isnan(0.5);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1295 = _1291 || _1293;
    bool _1297 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1305 = _1301 || _1303;
    float _1307 = _1285 + _1255;
    bool _1309 = !_1251;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = _1307 * _1263;
    float _1315 = _1313 * 0.5;
    bool _1317 = _1279 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1319 = _1209;
    float _1321 = _1257;
    float _1323 = _1215;
    float _1325 = _1259;
    float _1327 = _1255;
    float _1329 = _1227;
    float _1331 = _1207;
    if (!_1317)
    {
        _1319 = _1221;
    }
    float _1333 = _1319;
    float _1335 = _1333;
    if (!_1317)
    {
        _1321 = _1271;
    }
    float _1337 = _1321;
    bool _1339 = !_1317;
    float _1341 = _1337;
    if (!_1339)
    {
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1347 = _1279 + _1345;
        float _1349 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = rsqrt(_1259);
        float _1353 = _1347 * _1343;
        float _1355 = _1353 * 0.15915493667125701904296875;
        float _1357 = _1355 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = _1355 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        float _1365 = fma(_1359, _1349, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1367 = _1351 * _1365;
        float _1369 = _1363 + (-1.0);
        float _1371 = fma(_1235, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1373 = fma(_1227, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1375 = _1369 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1377 = fma(_1271, _1363, _1375);
        _1323 = _1373;
        _1325 = _1351;
        _1335 = _1371;
        _1341 = _1377;
    }
    float _1379 = _1323;
    float _1381 = _1325;
    float _1383 = _1335;
    float _1385 = _1341;
    float _1387 = _1385;
    float _1389 = _1383;
    float _1391 = _1381;
    if (_1305)
    {
        _1327 = 1.0;
    }
    float _1393 = _1327;
    float _1395 = _1393;
    if (_1295)
    {
        _1329 = _1379;
    }
    float _1397 = _1329;
    float _1399 = _1397;
    if (!_1295)
    {
        float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1403 = _1125 + _1401;
        float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1407 = _1119 + _1405;
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1411 = -_1119;
        float _1413 = _1411 + _1383;
        float _1415 = _1403 * _1403;
        float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1419 = _1133 + _1417;
        float _1421 = -_1125;
        float _1423 = _1421 + _1385;
        float _1425 = fma(_1407, _1407, _1415);
        float _1427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1429 = fma(_1419, _1419, _1425);
        float _1431 = sqrt(_1429);
        float _1433 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1435 = precise::min(_1431, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1437 = _1435 * _1427;
        float _1439 = _1433 * _1437;
        float _1441 = -_1133;
        float _1443 = _1441 + _1379;
        float _1445 = fma(_1413, _1439, _1119);
        float _1447 = fma(_1423, _1439, _1125);
        float _1449 = fma(_1443, _1439, _1133);
        _1387 = _1447;
        _1389 = _1445;
        _1399 = _1449;
        _1391 = _1409;
    }
    float _1451 = _1387;
    float _1453 = _1389;
    float _1455 = _1399;
    float _1457 = _1391;
    float _1459 = _1457;
    if (!_1305)
    {
        float _1461 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1463 = _1461 * 0.15915493667125701904296875;
        float _1465 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1469 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1467);
        float _1471 = _1463 * 6.283185482025146484375;
        float _1473 = cos(_1471);
        float _1475 = _1465 * 0.15915493667125701904296875;
        float _1477 = _1463 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = 1.0 / _1473;
        float _1483 = _1475 * 6.283185482025146484375;
        float _1485 = cos(_1483);
        float _1487 = _1479 * _1481;
        float _1489 = _1475 * 6.283185482025146484375;
        float _1491 = sin(_1489);
        float _1493 = _1485 * _1487;
        float _1495 = 1.0 / _1469;
        float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1499 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1497;
        float _1501 = 1.0 / _1493;
        float _1503 = 1.0 / _1499;
        float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1507 = _1495 * _1505;
        float _1509 = _1491 * _1501;
        float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1513 = fma(_1509, _1507, _1511);
        float _1515 = _1513 * _1503;
        float _1517 = precise::clamp(_1515, 0.0, 1.0);
        float _1519 = -_1517;
        float _1521 = _1519 + 1.0;
        _1459 = _1475;
        _1395 = _1521;
    }
    float _1523 = _1459;
    float _1525 = _1395;
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1529 = _1451 + _1527;
    float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1533 = _1453 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1537 = _1455 + _1535;
    float _1539 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1541 = _1529 * _1529;
    float _1543 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1545 = fma(_1533, _1533, _1541);
    float _1547 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1543);
    float _1549 = fma(_1537, _1537, _1545);
    float _1551 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1547);
    float _1553 = rsqrt(_1549);
    float _1555 = _1551 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1557 = sqrt(_1549);
    float _1559 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1561 = _1533 * _1559;
    float _1563 = _1537 * _1559;
    float _1565 = _1561 * _1561;
    float _1567 = _1563 * _1563;
    float _1569 = _1565 + _1567;
    float _1571 = sqrt(_1569);
    bool _1573 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1577 = _1571 + _1575;
    float _1579 = _1553;
    float _1581 = _1569;
    float _1583 = _1577;
    float _1585 = _1523;
    float _1587 = _1529;
    if (_1573)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1579 = _1589;
    }
    float _1591 = _1579;
    if (_1573)
    {
        float _1593 = rsqrt(_1569);
        _1581 = _1593;
    }
    float _1595 = _1581;
    float _1597 = _1595;
    if (_1573)
    {
        float _1599 = _1577 * _1591;
        _1583 = _1599;
    }
    float _1601 = _1583;
    if (_1573)
    {
        float _1603 = _1601 * 0.15915493667125701904296875;
        _1585 = _1603;
    }
    float _1605 = _1585;
    float _1607 = _1537;
    float _1609 = _1605;
    if (_1573)
    {
        float _1611 = _1605 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        _1607 = _1613;
    }
    float _1615 = _1607;
    float _1617 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1619 = precise::max(0.0, _1617);
    float _1621 = _1591;
    float _1623 = _1619;
    if (_1573)
    {
        float _1625 = _1605 * 6.283185482025146484375;
        float _1627 = cos(_1625);
        _1621 = _1627;
    }
    float _1629 = _1621;
    float _1631 = -_1559;
    float _1633 = -_1619;
    float _1635 = fma(_1529, _1631, _1633);
    if (_1573)
    {
        float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1587 = _1637;
    }
    float _1639 = _1587;
    float _1641 = _1639;
    float _1643 = _1615;
    if (_1573)
    {
        float _1645 = fma(_1615, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1641 = _1645;
    }
    float _1647 = _1641;
    float _1649 = _1647;
    if (!_1573)
    {
        _1643 = _1561;
    }
    float _1651 = _1643;
    float _1653 = _1651;
    float _1655 = _1629;
    if (_1573)
    {
        float _1657 = _1629 + (-1.0);
        _1623 = _1657;
    }
    float _1659 = _1623;
    float _1661 = _1659;
    if (_1573)
    {
        float _1663 = _1595 * _1647;
        _1331 = _1663;
    }
    float _1665 = _1331;
    if (!_1573)
    {
        _1649 = _1635;
    }
    float _1667 = _1649;
    float _1669 = _1667;
    if (_1573)
    {
        float _1671 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1609 = _1671;
    }
    float _1673 = _1609;
    if (_1573)
    {
        float _1675 = _1561 * _1665;
        _1653 = _1675;
    }
    float _1677 = _1653;
    if (!_1573)
    {
        _1661 = _1563;
    }
    float _1679 = _1661;
    float _1681 = _1679;
    if (_1573)
    {
        float _1683 = _1563 * _1665;
        _1681 = _1683;
    }
    float _1685 = _1681;
    if (!_1573)
    {
        _1597 = _1565;
    }
    float _1687 = _1597;
    float _1689 = _1687;
    if (_1573)
    {
        float _1691 = fma(_1635, _1629, _1673);
        _1669 = _1691;
    }
    float _1693 = _1669;
    if (_1573)
    {
        float _1695 = _1677 * _1677;
        _1689 = _1695;
    }
    float _1697 = _1689;
    if (!_1573)
    {
        _1655 = _1567;
    }
    float _1699 = _1655;
    float _1701 = _1699;
    if (_1573)
    {
        float _1703 = _1685 * _1685;
        _1701 = _1703;
    }
    float _1705 = _1701;
    float _1707 = fma(_1693, _1693, _1697);
    float _1709 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1711 = _1707 + _1705;
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1715 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1713);
    float _1717 = precise::clamp(_1715, 0.0, 1.0);
    float _1719 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1721 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1723 = -_1717;
    float _1725 = _1723 + 1.0;
    float _1727 = rsqrt(_1711);
    float _1729 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1721);
    float _1731 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1719);
    float _1733 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1729);
    float _1735 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1737 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1739 = abs(_1725);
    float _1741 = log2(_1739);
    float _1743 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1745 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1747 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1737);
    float _1749 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1751 = -_1745;
    float _1753 = fma(_1751, _1539, 1.0);
    float _1755 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1747);
    float _1757 = _1727 * _1677;
    float _1759 = _1727 * _1693;
    float _1761 = _1727 * _1685;
    float _1763 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1749);
    float _1765 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1767 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1769 = log2(_1753);
    float _1771 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1763);
    float _1773 = -_1765;
    float _1775 = fma(_1759, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1773);
    float _1777 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1779 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1771);
    float _1783 = -_1761;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1775);
    float _1787 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1789 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1779);
    float _1791 = exp2(_1777);
    float _1793 = fma(_1785, -0.5, 0.5);
    float _1795 = fma(_1785, 0.5, 0.5);
    float _1797 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1787);
    float _1799 = _1759 + 1.0;
    float _1801 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1789);
    float _1803 = fma(_1795, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1805 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1797);
    float _1807 = 1.0 / _1781;
    float _1809 = fma(_1795, _1803, -0.212114393711090087890625);
    float _1811 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1805);
    float _1813 = fma(_1795, _1809, 1.570728778839111328125);
    float _1815 = sqrt(_1793);
    float _1817 = -_1759;
    float _1819 = fma(_1791, _1799, _1817);
    float _1821 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1801);
    float _1823 = _1769 * 0.693147182464599609375;
    float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1827 = _1811 * _1807;
    float _1829 = _1821 * _1807;
    float _1831 = fma(_1827, 0.5, 0.5);
    float _1833 = fma(_1829, -0.5, 0.5);
    float _1835 = _1815 * 0.636619746685028076171875;
    float _1837 = fma(_1819, 0.5, 0.5);
    float _1839 = -_1813;
    float _1841 = fma(_1835, _1839, 1.0);
    float3 _6287 = float3(_1831, _1833, _1825);
    float _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6287, float3(0.0), isnan(_6287)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6287, float3(0.0), isnan(_6287)), level(0.0)).x;
    float3 _6298 = float3(_1831, _1833, _1825);
    float4 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6298, float3(0.0), isnan(_6298)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6298, float3(0.0), isnan(_6298)), level(0.0)).xyzw;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = _1846.w;
    float2 _6315 = float2(_1841, _1837);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6315, float2(0.0), isnan(_6315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6315, float2(0.0), isnan(_6315)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1868 = int(_1866);
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1872 = _1870 != 0;
    float _1874 = -_933;
    float _1876 = _1874 + 1.0;
    int _1878 = abs(_1267);
    float _1880 = -_931;
    float _1882 = _1880 + 1.0;
    int _1884 = abs(_1283);
    out.m_64.x = _1453;
    out.m_64.y = _1451;
    out.m_64.z = _1455;
    int _1886 = abs(_1311);
    float _1888 = trunc(_915);
    int _1890 = int(_1888);
    bool _1892 = _335 > 0.5;
    float _1894 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1896 = _341 > 0.5;
    float _1898 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1900 = -_925;
    float _1902 = _1900 + 1.0;
    float _1904 = -_921;
    float _1906 = _1904 + 1.0;
    float _1908 = -_929;
    float _1910 = _1908 + 1.0;
    float _1912 = float(uint(_1868));
    float _1914 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1916 = int(_1914);
    int _1918 = ~_1868;
    int _1920 = _1918 + 1;
    bool _1922 = _1868 == 0;
    float _1924 = float(uint(_1890));
    float _1926 = 1.0 / _1912;
    float _1928 = float(uint(_1916));
    float _1930 = trunc(_927);
    int _1932 = int(_1930);
    int _1934 = ~_1868;
    int _1936 = _1934 + 1;
    int _1938 = ~_1916;
    int _1940 = _1938 + 1;
    int _1942 = as_type<int>(_1926) + (-2);
    float _1944 = 1.0 / _1928;
    if (_1872)
    {
        _947 = _329;
    }
    float _1946 = _947;
    float _1948 = _1946;
    if (!_1872)
    {
        _1948 = _335;
    }
    float _1950 = _1948;
    float _1952 = as_type<float>(_1942) * _1924;
    float _1954 = -_211;
    int _1956 = _1892 ? as_type<int>(_1954) : as_type<int>(_211);
    float _1958 = trunc(_1952);
    float _1960 = precise::max(_1958, 0.0);
    uint _1963 = uint(_1960);
    float _1965 = float(uint(_1932));
    int _1967 = as_type<int>(_1944) + (-2);
    float _1969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1971 = _1952;
    if (_1872)
    {
        _1971 = 1.0;
    }
    float _1973 = _1971;
    float _1975 = _1973;
    if (!_1872)
    {
        _1975 = 1.2345600128173828125;
    }
    float _1977 = _1975;
    float _1979 = as_type<float>(_1967) * _1965;
    int _1981 = ~_1916;
    int _1983 = _1981 + 1;
    int _1985 = _1936 * int(_1963);
    int _1987 = _1985 + _1890;
    float _1989 = _1977 * _1950;
    float _1991 = float(_1890);
    float _1993 = trunc(_1979);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = float(uint(_1987));
    float _2001 = as_type<float>(_1987);
    if (_1872)
    {
        _2001 = 1.0;
    }
    float _2003 = _2001;
    float _2005 = _2003;
    if (!_1872)
    {
        _2005 = 7.345489978790283203125;
    }
    float _2007 = _2005;
    float _2009 = as_type<float>(_1942) * _1999;
    float _2011 = floor(_1989);
    int _2013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2015 = _2013 != 0;
    float _2017 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2019 = _2007 * _329;
    float _2021 = trunc(_2009);
    float _2023 = precise::max(_2021, 0.0);
    uint _2025 = uint(_2023);
    int _2027 = _1983 * int(_1997);
    int _2029 = _2027 + _1932;
    float _2031 = float(uint(_2029));
    float _2033 = floor(_2019);
    float _2035 = as_type<float>(_1967) * _2031;
    int _2037 = int(_1963) + int(_2025);
    float _2039 = trunc(_2035);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = float(_1868);
    int _2047 = _1920 * _2037;
    int _2049 = _2047 + _1890;
    bool _2051 = _1991 >= _2045;
    bool _2053 = isnan(_1991);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(_2045);
    bool _2059 = _2055 || _2057;
    float _2061 = float(_2059);
    float _2063 = -_2033;
    float _2065 = _2019 + _2063;
    float _2067 = -_2011;
    float _2069 = _1989 + _2067;
    bool _2071 = uint(_2049) >= uint(_1868);
    float _2073 = exp2(_1894);
    float _2075 = float(_1916);
    bool _2077 = !_2071;
    int _2079 = _2077 ? 0 : (-1);
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2083 = _2081 != 0;
    int _2085 = ~_2037;
    int _2087 = _2085 + _2079;
    int _2089 = _2087 + 1;
    float _2091 = trunc(_2061);
    int _2093 = int(_2091);
    int _2095 = int(_1997) + int(_2043);
    float _2097 = _2065 * _2045;
    float _2099 = float(_1932);
    int _2101 = _1868 * _2089;
    int _2103 = _2101 + _1890;
    int _2105 = _1868 + (-1);
    int _2107 = _1940 * _2095;
    int _2109 = _2107 + _1932;
    bool _2111 = _2099 >= _2075;
    bool _2113 = isnan(_2099);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan(_2075);
    bool _2119 = _2115 || _2117;
    float _2121 = float(_2119);
    float _2123 = _2045 * _913;
    bool _2125 = !_1922;
    int _2127 = _2125 ? _2103 : (-1);
    float _2129 = trunc(_2097);
    int _2131 = int(_2129);
    bool _2133 = !_2083;
    int _2135 = _2133 ? 0 : 1;
    float _2137 = _2075 * _913;
    bool _2139 = uint(_2109) >= uint(_1916);
    float _2141 = -_2073;
    float _2143 = _2141 + 1.0;
    int _2145 = abs(_2135);
    int _2147 = ~_2093;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    float _2153 = trunc(_2121);
    int _2155 = int(_2153);
    int _2157 = _2127 * _2151;
    bool _2159 = !_2139;
    int _2161 = _2159 ? 0 : (-1);
    bool _2163 = _1916 == 0;
    int _2165 = _2093 * _2105;
    int _2167 = _2165 + _2157;
    int _2169 = abs(_463);
    float _2171 = trunc(_2137);
    int _2173 = int(_2171);
    int _2175 = ~_2095;
    int _2177 = _2175 + _2161;
    int _2179 = _2177 + 1;
    int _2181 = _1916 * _2179;
    int _2183 = _2181 + _1932;
    float _2185 = _2069 * _2075;
    float _2187 = trunc(_2123);
    int _2189 = int(_2187);
    int _2191 = _2131 * _2145;
    int _2193 = _2191 + _1890;
    int _2195 = abs(_597);
    int _2197 = _2167 * _2169;
    int _2199 = ~_2155;
    int _2201 = _2199 + 1;
    int _2203 = _2201 + 1;
    bool _2205 = !_2163;
    int _2207 = _2205 ? _2183 : (-1);
    float _2209 = trunc(_2185);
    int _2211 = int(_2209);
    int _2213 = abs(_577);
    bool _2215 = !_2015;
    int _2217 = _2215 ? 0 : 1;
    int _2219 = _2207 * _2203;
    int _2221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2223 = _2221 != 0;
    int _2225 = _2189 * _2213;
    int _2227 = _2225 + _2197;
    int _2229 = abs(_2217);
    float _2231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2233 = !_2223;
    int _2235 = _2233 ? 0 : 1;
    int _2237 = _2193 * _2195;
    int _2239 = _2237 + _2227;
    int _2241 = _1916 + (-1);
    int _2243 = abs(_2235);
    int _2245 = _2131 * _2229;
    int _2247 = _2245 + _2239;
    int _2249 = abs(_1275);
    int _2251 = _2155 * _2241;
    int _2253 = _2251 + _2219;
    float _2255 = float(uint(_2247));
    int _2257 = _2253 * _1878;
    int _2259 = _2211 * _2243;
    int _2261 = _2259 + _1932;
    float _2263 = float(uint(_2193));
    float _2265 = as_type<float>(_1942) * _2255;
    int _2267 = ~_1868;
    int _2269 = _2267 + 1;
    int _2271 = _2173 * _2249;
    int _2273 = _2271 + _2257;
    int _2275 = ~_1916;
    int _2277 = _2275 + 1;
    float _2279 = trunc(_2265);
    float _2281 = precise::max(_2279, 0.0);
    uint _2283 = uint(_2281);
    int _2285 = ~_1916;
    int _2287 = _2285 + 1;
    int _2289 = _2261 * _1884;
    int _2291 = _2289 + _2273;
    int _2293 = ~_1868;
    int _2295 = _2293 + 1;
    int _2297 = _2211 * _1886;
    int _2299 = _2297 + _2291;
    float _2301 = as_type<float>(_1942) * _2263;
    float _2303 = float(uint(_2299));
    int _2305 = _2269 * int(_2283);
    int _2307 = _2305 + _2247;
    float _2309 = trunc(_2301);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    float _2315 = as_type<float>(_1967) * _2303;
    float _2317 = float(uint(_2261));
    float _2319 = float(uint(_2307));
    float _2321 = as_type<float>(_1967) * _2317;
    float _2323 = trunc(_2315);
    float _2325 = precise::max(_2323, 0.0);
    uint _2327 = uint(_2325);
    float _2329 = as_type<float>(_1942) * _2319;
    float _2331 = trunc(_2329);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    int _2337 = _2295 * int(_2313);
    int _2339 = _2337 + _2193;
    float _2341 = float(uint(_2339));
    float _2343 = trunc(_2321);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    int _2349 = _2277 * int(_2327);
    int _2351 = _2349 + _2299;
    float _2353 = as_type<float>(_1942) * _2341;
    int _2355 = ~_1868;
    int _2357 = _2355 + 1;
    float _2359 = float(uint(_2351));
    float _2361 = trunc(_2353);
    float _2363 = precise::max(_2361, 0.0);
    uint _2365 = uint(_2363);
    int _2367 = int(_2283) + int(_2335);
    float _2369 = as_type<float>(_1967) * _2359;
    int _2371 = _2287 * int(_2347);
    int _2373 = _2371 + _2261;
    float _2375 = trunc(_2369);
    float _2377 = precise::max(_2375, 0.0);
    uint _2379 = uint(_2377);
    int _2381 = _2357 * _2367;
    int _2383 = _2381 + _2247;
    float _2385 = float(uint(_2373));
    bool _2387 = uint(_2383) >= uint(_1868);
    float _2389 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2391 = as_type<float>(_1967) * _2385;
    bool _2393 = !_2387;
    int _2395 = _2393 ? 0 : (-1);
    int _2397 = ~_1868;
    int _2399 = _2397 + 1;
    float _2401 = _2389 * _329;
    int _2403 = int(_2313) + int(_2365);
    float _2405 = -_211;
    float _2407 = _2405 + 0.5;
    int _2409 = ~_2367;
    int _2411 = _2409 + _2395;
    int _2413 = _2411 + 1;
    float _2415 = trunc(_2391);
    float _2417 = precise::max(_2415, 0.0);
    uint _2419 = uint(_2417);
    float _2421 = _207 + 0.5;
    int _2423 = ~_1916;
    int _2425 = _2423 + 1;
    int _2427 = _1868 * _2413;
    int _2429 = _2427 + _2247;
    int _2431 = int(_2327) + int(_2379);
    int _2433 = _2399 * _2403;
    int _2435 = _2433 + _2193;
    out.m_66.x = _2421;
    out.m_66.y = _2407;
    float _2437 = trunc(_2401);
    int _2439 = int(_2437);
    bool _2441 = !_1922;
    int _2443 = _2441 ? _2429 : (-1);
    int _2445 = _2425 * _2431;
    int _2447 = _2445 + _2299;
    bool _2449 = uint(_2435) >= uint(_1868);
    bool _2451 = uint(_2447) >= uint(_1916);
    int _2453 = _2443 & 3;
    bool _2455 = _2453 != 0;
    bool _2457 = !_2449;
    int _2459 = _2457 ? 0 : (-1);
    bool _2461 = !_2451;
    int _2463 = _2461 ? 0 : (-1);
    bool _2465 = uint(_2453) >= 2u;
    int _2467 = ~_2403;
    int _2469 = _2467 + _2459;
    int _2471 = _2469 + 1;
    int _2473 = _2439 << 4;
    int _2475 = _2473 + 1712;
    int _2477 = ~_2431;
    int _2479 = _2477 + _2463;
    int _2481 = _2479 + 1;
    int _2483 = _1868 * _2471;
    int _2485 = _2483 + _2193;
    int _2487 = _2443 & 3;
    bool _2489 = _2487 != 0;
    uint _2491 = uint(int(uint(_2475) >> uint(2)));
    uint _2493 = uint(int(uint(int(_2491)) >> uint(2)));
    int _2495 = int(_2491) & 3;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[int(_2493)][_2495];
    int _2499 = int(_2491) + 1;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    int _2503 = _2499 & 3;
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[int(_2501)][_2503];
    int _2507 = _2465 ? 0 : 1;
    int _2509 = _1916 * _2481;
    int _2511 = _2509 + _2299;
    bool _2513 = _2453 != 3;
    int _2515 = _2489 ? 0 : 1;
    bool _2517 = uint(_2453) > 1u;
    int _2519 = _2475 + 8;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    uint _2523 = uint(int(uint(int(_2521)) >> uint(2)));
    int _2525 = int(_2521) & 3;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[int(_2523)][_2525];
    int _2529 = _2443 >> 31;
    int _2531 = ~_2507;
    int _2533 = _2531 + 1;
    int _2535 = _2533 + 1;
    int _2537 = _2529 & 3;
    bool _2539 = !_2163;
    int _2541 = _2539 ? _2511 : (-1);
    int _2543 = _2535;
    if (_2513)
    {
        int _2545 = ~_2507;
        int _2547 = _2545 + 1;
        _2543 = _2547;
    }
    int _2549 = _2543;
    int _2551 = _2443 + _2537;
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2555 = _2553 != 0;
    int _2557 = ~_2515;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    int _2563 = _2561;
    if (!_2517)
    {
        int _2565 = ~_2515;
        int _2567 = _2565 + 1;
        _2563 = _2567;
    }
    int _2569 = _2563;
    bool _2571 = _2453 != 3;
    bool _2573 = !_2555;
    int _2575 = _2573 ? 0 : 1;
    int _2577 = _2551 >> 2;
    int _2579 = _2541 & 3;
    bool _2581 = _2579 != 0;
    int _2583 = ~_1916;
    int _2585 = _2583 + 1;
    bool _2587 = !_1922;
    int _2589 = _2587 ? _2485 : (-1);
    int _2591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2593 = _2591 != 0;
    bool _2595 = !_2455;
    int _2597 = _2595 ? 0 : 1;
    int _2599 = _2577 << 4;
    int _2601 = _2599 + 368;
    bool _2603 = uint(_2579) > 1u;
    float _2605 = _2497 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2607 = !_2593;
    int _2609 = _2607 ? 0 : 1;
    uint _2611 = uint(int(uint(_2601) >> uint(2)));
    uint _2613 = uint(int(uint(int(_2611)) >> uint(2)));
    int _2615 = int(_2611) & 3;
    float _2617 = (*spvDescriptorSet0.vp_c9)._m0[int(_2613)][_2615];
    int _2619 = int(_2611) + 1;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    int _2623 = _2619 & 3;
    float _2625 = (*spvDescriptorSet0.vp_c9)._m0[int(_2621)][_2623];
    int _2627 = _2541 & 3;
    bool _2629 = _2627 != 0;
    float _2631 = _2505 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2633 = !_2571;
    int _2635 = _2633 ? 0 : (-1);
    float _2637 = _2605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2639 = _2579 != 3;
    float _2641 = _2527 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2643 = _2629 ? 0 : 1;
    float _2645 = _2631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2647 = uint(_2579) >= 2u;
    float _2649 = _2641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2651 = int(_2347) + int(_2419);
    int _2653 = ~_2643;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    int _2659 = _2657;
    if (!_2603)
    {
        int _2661 = ~_2643;
        int _2663 = _2661 + 1;
        _2659 = _2663;
    }
    int _2665 = _2659;
    int _2667 = _2647 ? 0 : 1;
    bool _2669 = _2579 != 3;
    int _2671 = _2585 * _2651;
    int _2673 = _2671 + _2261;
    bool _2675 = !_2581;
    int _2677 = _2675 ? 0 : 1;
    int _2679 = ~_2667;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    int _2685 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2687 = _2685 != 0;
    int _2689 = _2683;
    if (_2639)
    {
        int _2691 = ~_2667;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    bool _2697 = !_2669;
    int _2699 = _2697 ? 0 : (-1);
    float _2701 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2703 = uint(_2673) >= uint(_1916);
    int _2705 = _2601 + 8;
    uint _2707 = uint(int(uint(_2705) >> uint(2)));
    uint _2709 = uint(int(uint(int(_2707)) >> uint(2)));
    int _2711 = int(_2707) & 3;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[int(_2709)][_2711];
    int _2715 = int(_2707) + 1;
    uint _2717 = uint(int(uint(_2715) >> uint(2)));
    int _2719 = _2715 & 3;
    float _2721 = (*spvDescriptorSet0.vp_c9)._m0[int(_2717)][_2719];
    int _2723 = _2541 >> 31;
    float _2725 = _2701 * _329;
    int _2727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2729 = _2727 != 0;
    bool _2731 = _329 > 0.5;
    float _2733 = trunc(_2725);
    int _2735 = int(_2733);
    int _2737 = _2723 & 3;
    int _2739 = abs(_2569);
    float _2741 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2743 = _2541 + _2737;
    float _2745 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2747 = !_2703;
    int _2749 = _2747 ? 0 : (-1);
    float _2751 = _421 + 0.5;
    int _2753 = _2743 >> 2;
    out.m_68.x = _2637;
    out.m_68.y = _2645;
    out.m_68.z = _2649;
    out.m_68.w = _2741;
    int _2755 = ~_2739;
    int _2757 = _2755 + 1;
    int _2759 = _2757 + 1;
    float _2761 = fma(_2745, _2751, _937);
    int _2763 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2765 = _2763 != 0;
    float _2767 = _427 + (-0.5);
    float _2769 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2771 = _2759 * as_type<int>(_2625);
    float _2773 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2775 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2777 = int(_2775);
    float _2779 = -_2017;
    float _2781 = -_945;
    float _2783 = fma(_2779, _2767, _2781);
    float _2785 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2787 = abs(_2635);
    float _2789 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2773);
    int _2791 = ~_2651;
    int _2793 = _2791 + _2749;
    int _2795 = _2793 + 1;
    float _2797 = -_1139;
    float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2785);
    int _2801 = abs(_2597);
    float _2803 = -_1139;
    float _2805 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2769);
    int _2807 = _2753 << 4;
    int _2809 = _2807 + 512;
    float _2811 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2813 = ~_2801;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    float _2819 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    uint _2821 = uint(int(uint(_2809) >> uint(2)));
    uint _2823 = uint(int(uint(int(_2821)) >> uint(2)));
    int _2825 = int(_2821) & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    int _2829 = int(_2821) + 1;
    uint _2831 = uint(int(uint(_2829) >> uint(2)));
    int _2833 = _2829 & 3;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[int(_2831)][_2833];
    int _2837 = abs(_2665);
    int _2839 = _1916 * _2795;
    int _2841 = _2839 + _2261;
    float _2843 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2819);
    int _2845 = _2817 * as_type<int>(_2617);
    int _2847 = _2845 + _2771;
    int _2849 = abs(_2549);
    float _2851 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2853 = float(uint(_2777));
    int _2855 = _2809 + 8;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    uint _2859 = uint(int(uint(int(_2857)) >> uint(2)));
    int _2861 = int(_2857) & 3;
    float _2863 = (*spvDescriptorSet0.vp_c9)._m0[int(_2859)][_2861];
    int _2865 = int(_2857) + 1;
    uint _2867 = uint(int(uint(_2865) >> uint(2)));
    int _2869 = _2865 & 3;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[int(_2867)][_2869];
    int _2873 = ~_2849;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    float _2879 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2851);
    float _2881 = -_1139;
    float _2883 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2811);
    int _2885 = abs(_2575);
    int _2887 = _2877 * as_type<int>(_2713);
    int _2889 = _2887 + _2847;
    int _2891 = ~_2787;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2899 = ~_2885;
    int _2901 = _2899 + 1;
    int _2903 = _2901 + 1;
    float _2905 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2799);
    int _2907 = abs(_2695);
    int _2909 = _2895 * as_type<int>(_2721);
    int _2911 = _2909 + _2889;
    float _2913 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2915 = 1.0 / _2853;
    float _2917 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2919 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2913);
    float _2921 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2897);
    float _2923 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2917);
    int _2925 = _2911 * _2903;
    int _2927 = abs(_2677);
    float _2929 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2931 = int(_2929);
    int _2933 = ~_2837;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = _2589 * _2885;
    int _2941 = _2939 + _2925;
    int _2943 = ~_2927;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    float _2949 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2919);
    int _2951 = abs(_2609);
    float _2953 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2805);
    float _2955 = float(uint(_2941));
    float _2957 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2883);
    int _2959 = _2735 << 4;
    int _2961 = _2959 + 1968;
    float _2963 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2965 = !_2687;
    float _2967 = _2965 ? _211 : as_type<float>(_1956);
    float _2969 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2971 = _2961 + 8;
    uint _2973 = uint(int(uint(_2971) >> uint(2)));
    uint _2975 = uint(int(uint(int(_2973)) >> uint(2)));
    int _2977 = int(_2973) & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    float _2981 = -_207;
    int _2983 = _2731 ? as_type<int>(_2981) : as_type<int>(_207);
    float _2985 = float(uint(_2931));
    float _2987 = fma(_2969, _2969, 1.0);
    int _2989 = _2937 * as_type<int>(_2835);
    int _2991 = as_type<int>(_2915) + (-2);
    int _2993 = _2947 * as_type<int>(_2827);
    int _2995 = _2993 + _2989;
    float _2997 = as_type<float>(_2991) * _2955;
    int _2999 = abs(_2699);
    float _3001 = 1.0 / _2985;
    int _3003 = ~_2907;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    int _3009 = abs(_2777);
    int _3011 = ~_2999;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    int _3017 = _3007 * as_type<int>(_2863);
    int _3019 = _3017 + _2995;
    float _3021 = trunc(_2997);
    float _3023 = precise::max(_3021, 0.0);
    uint _3025 = uint(_3023);
    int _3027 = ~_2951;
    int _3029 = _3027 + 1;
    int _3031 = _3029 + 1;
    int _3033 = _3015 * as_type<int>(_2871);
    int _3035 = _3033 + _3019;
    int _3037 = abs(_2931);
    float _3039 = float(uint(_3009));
    int _3041 = _3035 * _3031;
    bool _3043 = !_2163;
    int _3045 = _3043 ? _2841 : (-1);
    float _3047 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2921);
    float _3049 = 1.0 / _3039;
    float _3051 = float(uint(_3037));
    int _3053 = ~_2777;
    int _3055 = _3053 + 1;
    int _3057 = _3045 * _2951;
    int _3059 = _3057 + _3041;
    int _3061 = as_type<int>(_3001) + (-2);
    float _3063 = -_207;
    int _3065 = _1896 ? as_type<int>(_3063) : as_type<int>(_207);
    int _3067 = _3055 * int(_3025);
    int _3069 = _3067 + _2941;
    float _3071 = 1.0 / _3051;
    float _3073 = float(uint(_3059));
    float _3075 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2923);
    int _3077 = abs(_2941);
    uint _3079 = uint(int(uint(_2961) >> uint(2)));
    uint _3081 = uint(int(uint(int(_3079)) >> uint(2)));
    int _3083 = int(_3079) & 3;
    float _3085 = (*spvDescriptorSet0.vp_c9)._m0[int(_3081)][_3083];
    int _3087 = int(_3079) + 1;
    uint _3089 = uint(int(uint(_3087) >> uint(2)));
    int _3091 = _3087 & 3;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[int(_3089)][_3091];
    float _3095 = float(uint(_3069));
    float _3097 = as_type<float>(_3061) * _3073;
    int _3099 = abs(_3059);
    float _3101 = rsqrt(_2987);
    int _3103 = as_type<int>(_3049) + (-2);
    float _3105 = as_type<float>(_2991) * _3095;
    float _3107 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2879);
    float _3109 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2843);
    float _3111 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2789);
    float _3113 = float(uint(_3077));
    float _3115 = _2969 * _2957;
    float _3117 = trunc(_3097);
    float _3119 = precise::max(_3117, 0.0);
    uint _3121 = uint(_3119);
    int _3123 = as_type<int>(_3071) + (-2);
    float _3125 = as_type<float>(_3103) * _3113;
    float _3127 = float(uint(_3099));
    float _3129 = fma(_2963, _3111, _3115);
    bool _3131 = !_2729;
    float _3133 = _3131 ? _207 : as_type<float>(_3065);
    out.m_70.x = _3107;
    out.m_70.y = _3109;
    out.m_70.z = _3111;
    int _3135 = ~_2931;
    int _3137 = _3135 + 1;
    float _3139 = as_type<float>(_3123) * _3127;
    float _3141 = trunc(_3125);
    float _3143 = precise::max(_3141, 0.0);
    uint _3145 = uint(_3143);
    int _3147 = ~_3009;
    int _3149 = _3147 + 1;
    float _3151 = _2969 * _2905;
    bool _3153 = !_2765;
    float _3155 = _3153 ? _207 : as_type<float>(_2983);
    float _3157 = _2969 * _2953;
    int _3159 = ~_3037;
    int _3161 = _3159 + 1;
    float _3163 = fma(_2963, _3107, _3151);
    int _3165 = _3137 * int(_3121);
    int _3167 = _3165 + _3059;
    float _3169 = trunc(_3139);
    float _3171 = precise::max(_3169, 0.0);
    uint _3173 = uint(_3171);
    float _3175 = fma(_2963, _3109, _3157);
    int _3177 = ~_3009;
    int _3179 = _3177 + 1;
    float _3181 = float(uint(_3167));
    int _3183 = ~_3037;
    int _3185 = _3183 + 1;
    int _3187 = _3149 * int(_3145);
    int _3189 = _3187 + _3077;
    float _3191 = as_type<float>(_3061) * _3181;
    float _3193 = trunc(_3105);
    float _3195 = precise::max(_3193, 0.0);
    uint _3197 = uint(_3195);
    float _3199 = _2969 * _3101;
    float _3201 = float(uint(_3189));
    float _3203 = -_3047;
    float _3205 = _3199 * _3203;
    int _3207 = _3161 * int(_3173);
    int _3209 = _3207 + _3099;
    float _3211 = _3085 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3213 = as_type<float>(_3103) * _3201;
    float _3215 = fma(_427, _1876, _2783);
    float _3217 = float(uint(_3209));
    float _3219 = _2949 + _3163;
    float _3221 = -_1882;
    float _3223 = fma(_421, _3221, _2761);
    float _3225 = trunc(_3213);
    float _3227 = precise::max(_3225, 0.0);
    uint _3229 = uint(_3227);
    float _3231 = -_2949;
    float _3233 = _3199 * _3231;
    float _3235 = as_type<float>(_3123) * _3217;
    float _3237 = -_3075;
    float _3239 = _3199 * _3237;
    int _3241 = int(_3025) + int(_3197);
    float _3243 = fma(_3101, _2905, _3233);
    float _3245 = _3047 + _3175;
    int _3247 = ~_2777;
    int _3249 = _3247 + 1;
    float _3251 = trunc(_3235);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    float _3257 = fma(_3101, _2953, _3205);
    float _3259 = fma(_3101, _2957, _3239);
    float _3261 = _3093 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3263 = ~_2931;
    int _3265 = _3263 + 1;
    float _3267 = _2979 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3269 = trunc(_3191);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    int _3275 = int(_3145) + int(_3229);
    int _3277 = _3249 * _3241;
    int _3279 = _3277 + _2941;
    float _3281 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3283 = _3179 * _3275;
    int _3285 = _3283 + _3077;
    bool _3287 = uint(_3279) >= uint(_2777);
    float _3289 = _3211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3291 = int(_3173) + int(_3255);
    float _3293 = _3261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3295 = _3267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3297 = uint(_3285) >= uint(_3009);
    float _3299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3301 = _3185 * _3291;
    int _3303 = _3301 + _3099;
    bool _3305 = !_3287;
    int _3307 = _3305 ? 0 : (-1);
    out.m_72.x = _3289;
    out.m_72.y = _3293;
    out.m_72.z = _3295;
    out.m_72.w = _3281;
    int _3309 = int(_3121) + int(_3273);
    float _3311 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1898);
    bool _3313 = uint(_3303) >= uint(_3037);
    float _3315 = -_923;
    float _3317 = _3315 + 1.0;
    bool _3319 = !_3297;
    int _3321 = _3319 ? 0 : (-1);
    int _3323 = _3265 * _3309;
    int _3325 = _3323 + _3059;
    int _3327 = ~_3241;
    int _3329 = _3327 + _3307;
    int _3331 = _3329 + 1;
    float _3333 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3311);
    int _3335 = _2941 ^ _2777;
    float _3337 = _3075 + _3129;
    bool _3339 = uint(_3325) >= uint(_2931);
    int _3341 = _2777 * _3331;
    int _3343 = _3341 + _2941;
    int _3345 = ~_3321;
    int _3347 = _3275 + _3345;
    int _3349 = _3347 + 1;
    float _3351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _3353 = uint(int(uint(_3335) >> uint(31)));
    out.m_74.x = _3223;
    out.m_74.y = _3215;
    bool _3355 = !_3339;
    int _3357 = _3355 ? 0 : (-1);
    bool _3359 = _2777 == 0;
    out.m_76.x = _3219;
    out.m_76.y = _3245;
    out.m_76.z = _3337;
    int _3361 = ~int(_3353);
    int _3363 = _3361 + 1;
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3367 = ~_3309;
    int _3369 = _3367 + _3357;
    int _3371 = _3369 + 1;
    out.m_78.x = _3243;
    out.m_78.y = _3257;
    out.m_78.z = _3259;
    int _3373 = _3059 ^ _2931;
    bool _3375 = !_3359;
    int _3377 = _3375 ? _3343 : (-1);
    int _3379 = _2931 * _3371;
    int _3381 = _3379 + _3059;
    bool _3383 = !_3313;
    int _3385 = _3383 ? 0 : (-1);
    float _3387 = _3351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3389 = _3349 ^ _3363;
    float _3391 = _3299 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3393 = uint(int(uint(_3373) >> uint(31)));
    float _3395 = float(_3377);
    bool _3397 = _2931 == 0;
    float _3399 = _3365 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3401 = _2777 == 0;
    float _3403 = fma(_3387, _3395, _413);
    int _3405 = ~_3363;
    int _3407 = _3405 + _3389;
    int _3409 = _3407 + 1;
    int _3411 = ~_3385;
    int _3413 = _3291 + _3411;
    int _3415 = _3413 + 1;
    int _3417 = ~int(_3393);
    int _3419 = _3417 + 1;
    float _3421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3423 = !_3397;
    int _3425 = _3423 ? _3381 : (-1);
    bool _3427 = !_3401;
    int _3429 = _3427 ? _3409 : (-1);
    int _3431 = _3415 ^ _3419;
    float _3433 = float(_3425);
    float _3435 = _3155 + 0.5;
    float _3437 = float(_3429);
    bool _3439 = _2931 == 0;
    float _3441 = fma(_3387, _3435, _3403);
    int _3443 = ~_3419;
    int _3445 = _3443 + _3431;
    int _3447 = _3445 + 1;
    float _3449 = -_917;
    float _3451 = fma(_3399, _3437, _3449);
    float _3453 = fma(_3391, _3433, _941);
    float _3455 = _3133 + 0.5;
    bool _3457 = !_3439;
    int _3459 = _3457 ? _3447 : (-1);
    float _3461 = _3421 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3463 = _2967 + (-0.5);
    float _3465 = fma(_3391, _3455, _3453);
    float _3467 = float(_3459);
    float _3469 = _1231 + (-0.5);
    float _3471 = -_3399;
    float _3473 = fma(_3471, _3463, _3451);
    float _3475 = -_3317;
    float _3477 = fma(_3133, _3475, _3465);
    float _3479 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3481 = -_943;
    float _3483 = fma(_3461, _3467, _3481);
    float _3485 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3333);
    float _3487 = _1811 + _1781;
    float _3489 = _1781 * 0.5;
    float _3491 = -_3461;
    float _3493 = fma(_3491, _3469, _3483);
    float _3495 = _3479 * _1843;
    bool _3497 = _1525 > 0.0;
    bool _3499 = isnan(_1525);
    bool _3501 = _3497 || _3499;
    bool _3503 = isnan(0.0);
    bool _3505 = _3501 || _3503;
    float _3507 = _3487 * 0.5;
    float _3509 = fma(_1821, -0.5, _3489);
    float _3511 = fma(_1231, _1902, _3493);
    float _3513 = _3485 + _1781;
    float _3515 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3517 = _1854 * _3495;
    float _3519 = _1864 * _3495;
    float _3521 = -_3479;
    float _3523 = _3521 + 1.0;
    float _3525 = -_1906;
    float _3527 = fma(_3155, _3525, _3441);
    out.gl_Position.x = _1811;
    out.gl_Position.y = _1821;
    out.gl_Position.z = _3485;
    out.gl_Position.w = _1781;
    float _3529 = fma(_2967, _1910, _3473);
    float _3531 = _3513 * 0.5;
    float _3533 = _3515 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3535 = fma(_1860, _3517, _1848);
    float _3537 = fma(_1862, _3517, _1850);
    float _3539 = _1854 * _3523;
    float _3541 = fma(_1854, _3519, _1852);
    out.m_80.x = _3507;
    out.m_80.y = _3509;
    out.m_80.z = _3531;
    out.m_80.w = _1781;
    out.m_82.x = _3527;
    out.m_82.y = _3529;
    out.m_82.z = _3477;
    out.m_82.w = _3511;
    out.m_45.x = _3533;
    out.m_84.x = _3535;
    out.m_84.y = _3537;
    out.m_84.z = _3541;
    out.m_84.w = _3539;
    if (_3505)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3543 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3543;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _319 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_42.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_45.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3600 = as_type<float>(_119);
        out.gl_Position.z = _3600;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_47.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    float _141 = _137;
    if (_133)
    {
        float _143 = float(_103);
        _139 = _143;
    }
    float _145 = _139;
    bool _147 = _137 >= _145;
    bool _149 = !_133;
    bool _151 = _147 || _149;
    if (_151)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _113;
    if (_151)
    {
        out.m_45.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _121 = as_type<int>(_155);
    }
    int _157 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3669 = as_type<float>(_157);
        out.gl_Position.z = _3669;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _159 = as_type<float>(int(gl_VertexIndex));
    float _161 = in.m_52.w;
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = in.m_47.x;
    float _175 = in.m_47.y;
    float _177 = in.m_47.z;
    float _179 = in.m_42.x;
    float _181 = in.m_42.y;
    float _183 = in.m_42.z;
    int _185 = as_type<int>(_159) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_159) & 2;
    bool _191 = _189 != 0;
    float _193 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _195 = 0.0;
    float _197 = _193;
    if (!_171)
    {
        float _199 = _193 * _193;
        float _201 = _199 * 0.5;
        _195 = _201;
    }
    float _203 = _195;
    bool _205 = !_187;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_191;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = _203;
    if (!_171)
    {
        float _215 = _203 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _215;
    }
    float _217 = _213;
    bool _219 = !_171;
    float _221 = _217;
    if (!_219)
    {
        float _223 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _225 = log2(_223);
        float _227 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _229 = _227 + 1.0;
        float _231 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = _193 * _225;
        float _235 = 1.0 / _229;
        float _237 = _231 * 0.693147182464599609375;
        float _239 = exp2(_233);
        float _241 = 1.0 / _237;
        float _243 = _239 + (-1.0);
        float _245 = -_243;
        float _247 = fma(_245, _241, _193);
        float _249 = _247 * _235;
        float _251 = _249 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _251;
    }
    float _253 = _221;
    bool _255 = !_171;
    if (!_255)
    {
        float _257 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _259 = log2(_257);
        float _261 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _263 = _261 + 1.0;
        float _265 = 1.0 / _263;
        float _267 = _193 * _259;
        float _269 = exp2(_267);
        float _271 = -_269;
        float _273 = _271 + 1.0;
        float _275 = _273 * _265;
        _197 = _275;
    }
    float _277 = _197;
    bool _279 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _281 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _283 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _285 = _253 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _287 = fma(_277, _173, _281);
    float _289 = fma(_277, _175, _283);
    float _291 = fma(_277, _177, _285);
    float _293 = fma(_287, _161, _179);
    float _295 = fma(_289, _161, _181);
    float _297 = fma(_291, _161, _183);
    bool _299 = !_279;
    float _317;
    if (!_299)
    {
        float _301 = in.m_54.x;
        float _303 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _305 = _301 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _307 = fma(_305, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _309 = _307 * _303;
        float _311 = floor(_309);
        float _313 = -_311;
        float _315 = _309 + _313;
        _317 = _315;
        _319 = true;
    }
    else
    {
        float _321 = float(_103);
        float _323 = 1.0 / _321;
        float _325 = _137 * _323;
        _317 = _325;
    }
    _319 = false;
    float _327 = _317;
    float _329 = in.m_54.x;
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _333 = _327 + _331;
    float _335 = in.m_54.y;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _337;
    float _341 = in.m_54.z;
    float _343 = 1.0 / _339;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = _327 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _355 = _327 + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _327 + _357;
    float _361 = 1.0 / _347;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _367 = _329 * 2.0;
    float _369 = _333 * _343;
    float _371 = _329 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _373 = _335 > 0.5;
    float _375 = floor(_367);
    float _377 = _335 * 2.0;
    float _379 = -_363;
    float _381 = fma(_371, 2.0, _379);
    bool _383 = _341 > 0.5;
    float _385 = _335 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _387 = _355 * _361;
    int _389 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _391 = _389 != 0;
    int _393 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _395 = _393 != 0;
    int _397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _399 = _397 != 0;
    float _401 = floor(_377);
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _403;
    float _407 = -_207;
    float _409 = _373 ? _407 : _207;
    float _411 = -_137;
    float _413 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[76].x, _381);
    float _415 = -_211;
    int _417 = _383 ? as_type<int>(_415) : as_type<int>(_211);
    bool _419 = !_395;
    float _421 = _419 ? _207 : _409;
    float _423 = 1.0 / _405;
    bool _425 = !_399;
    float _427 = _425 ? _211 : as_type<float>(_417);
    float _429 = fma(_385, -2.0, _365);
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _437 = _435 != 0;
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _441 = _439 != 0;
    float _443 = _341 * 2.0;
    bool _445 = _375 > 0.0;
    bool _447 = _375 >= 0.0;
    bool _449 = isnan(_375);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    float _457 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _459 = int(_457);
    bool _461 = !_437;
    int _463 = _461 ? 0 : 1;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _467 = _465 != 0;
    int _469 = _455 ? 0 : 1;
    bool _471 = _401 > 0.0;
    float _473 = _351 * _423;
    int _475 = ~_469;
    int _477 = _475 + 1;
    int _479 = _477 + 1;
    int _481 = _479;
    int _483 = as_type<int>(_423);
    int _485 = as_type<int>(_333);
    float _487 = _409;
    if (!_445)
    {
        int _489 = ~_469;
        int _491 = _489 + 1;
        _481 = _491;
    }
    int _493 = _481;
    float _495 = _341 + _335;
    bool _497 = _401 >= 0.0;
    bool _499 = isnan(_401);
    bool _501 = _497 || _499;
    bool _503 = isnan(0.0);
    bool _505 = _501 || _503;
    float _507 = _495;
    if (_467)
    {
        _483 = 0;
        _485 = 0;
    }
    int _509 = _483;
    int _511 = _485;
    int _513 = _505 ? 0 : 1;
    float _515 = _495 + (-1.0);
    int _517 = _509;
    int _519 = _511;
    if (!_467)
    {
        _517 = 2;
    }
    int _521 = _517;
    if (!_467)
    {
        _519 = 1;
    }
    int _523 = _519;
    bool _525 = _521 != 2;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    int _531 = ~_513;
    int _533 = _531 + 1;
    int _535 = _533 + 1;
    float _537 = floor(_443);
    int _539 = _535;
    if (!_471)
    {
        int _541 = ~_513;
        int _543 = _541 + 1;
        _539 = _543;
    }
    int _545 = _539;
    float _547 = _329 + _341;
    bool _549 = _523 != 1;
    float _551 = _329 + _335;
    bool _553 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _555 = isnan(_327);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = _547 + (-1.0);
    float _567 = 1.0 / _529;
    float _569 = _551 + (-1.0);
    float _571 = -_563;
    float _573 = _571 + 1.0;
    bool _575 = !_433;
    int _577 = _575 ? 0 : 1;
    float _579 = fma(_569, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _581 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _583 = isnan(_327);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _595 = !_441;
    int _597 = _595 ? 0 : 1;
    float _599 = 0.0;
    float _601 = _547;
    if (_525)
    {
        _599 = _329;
    }
    float _603 = _599;
    float _605 = _591 * _573;
    float _607 = _603;
    if (_525)
    {
        _507 = _335;
    }
    float _609 = _507;
    float _611 = -_591;
    float _613 = _611 + 1.0;
    float _615 = _609;
    if (!_525)
    {
        _607 = _341;
    }
    float _617 = _607;
    float _619 = _359 * _567;
    float _621 = fma(_565, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _623;
    if (!_525)
    {
        _615 = _329;
    }
    float _627 = _615;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _635 = _633 != 0;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _639 = _637 != 0;
    int _641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _643 = _641 != 0;
    float _645 = fma(_625, _369, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _647 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _649 = isnan(_327);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = fma(_631, _387, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _661 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _663 = isnan(_327);
    bool _665 = _661 || _663;
    bool _667 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _669 = _665 || _667;
    float _671 = float(_669);
    float _673 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _675 = int(_673);
    bool _677 = _327 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _679 = isnan(_327);
    bool _681 = _677 || _679;
    bool _683 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _685 = _681 || _683;
    float _687 = float(_685);
    float _689 = -_657;
    float _691 = _689 + 1.0;
    bool _693 = _537 >= 0.0;
    bool _695 = isnan(_537);
    bool _697 = _693 || _695;
    bool _699 = isnan(0.0);
    bool _701 = _697 || _699;
    float _703 = _627 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _705 = _687 * _691;
    int _707 = _701 ? 0 : 1;
    float _709 = -_687;
    float _711 = _709 + 1.0;
    bool _713 = _537 > 0.0;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _715;
    float _719 = 0.0;
    if (!_549)
    {
        _719 = _335;
    }
    float _721 = _719;
    float _723 = _671 * _711;
    float _725 = fma(_717, _369, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _727 = !_635;
    int _729 = _727 ? 0 : 1;
    float _731 = _645 * _723;
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _737 = _725 * _723;
    float _739 = _721;
    if (!_549)
    {
        _487 = _721;
    }
    float _741 = _487;
    float _743 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _745 = log2(_743);
    float _747 = _741;
    if (_549)
    {
        _739 = _329;
    }
    float _749 = _739;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _753 = ~_707;
    int _755 = _753 + 1;
    int _757 = _755 + 1;
    float _759 = fma(_735, _387, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _761 = _757;
    if (!_713)
    {
        int _763 = ~_707;
        int _765 = _763 + 1;
        _761 = _765;
    }
    int _767 = _761;
    float _769 = _617 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _771 = abs(_729);
    float _773 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[83].z, _751);
    if (!_549)
    {
        _601 = _341;
    }
    float _775 = _601;
    float _777 = _657 * _613;
    float _779 = float(_103);
    float _781 = float(_459);
    float _783 = _745 * _137;
    float _785 = _775;
    if (_549)
    {
        _785 = _335;
    }
    float _787 = _785;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_549)
    {
        _747 = _329;
    }
    float _791 = _747;
    float _793 = 1.0 / _779;
    float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _797 = float(_767);
    float _799 = _791 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _801 = float(_771);
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _805 = 1.0 / _781;
    float _807 = _801 * _797;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _811 = 0.0;
    if (!_549)
    {
        _811 = _341;
    }
    float _813 = _811;
    float _815 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _817 = _813;
    if (_549)
    {
        _817 = _335;
    }
    float _819 = _817;
    float _821 = exp2(_783);
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _825 = fma(_703, -2.0, _789);
    float _827 = fma(_819, (*spvDescriptorSet0.vp_c9)._m0[83].w, _803);
    float _829 = -_809;
    float _831 = fma(_769, 2.0, _829);
    float _833 = -_815;
    float _835 = fma(_799, 2.0, _833);
    float _837 = fma(_795, -2.0, _823);
    float _839 = float(_675);
    float _841 = in.m_56.x;
    float _843 = in.m_56.y;
    float _845 = in.m_56.z;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _849 = 1.0 + _847;
    float _851 = 1.0 / _839;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _859;
    float _863 = 1.0 / _849;
    bool _865 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _867 = isnan(1.0);
    bool _869 = _865 || _867;
    bool _871 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _873 = _869 || _871;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _875;
    float _879 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[88].w, _857);
    float _881 = -_821;
    float _883 = _881 + 1.0;
    float _885 = fma(_861, _473, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _887 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _889 = isnan(0.0);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _895 = _891 || _893;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _899 = fma(_877, _473, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    bool _901 = !_639;
    int _903 = _901 ? 0 : 1;
    float _905 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[78].z, _853);
    float _907 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[78].w, _855);
    float _909 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[88].z, _897);
    float _911 = _895 ? _883 : 0.0;
    float _913 = _793 * _137;
    float _915 = _805 * _137;
    float _917 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _429);
    int _919 = abs(_903);
    float _921 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _905);
    float _923 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _773);
    float _925 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _827);
    float _927 = _851 * _137;
    float _929 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _907);
    float _931 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _909);
    float _933 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _879);
    float _935 = -_137;
    float _937 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[86].x, _831);
    float _939 = -_137;
    float _941 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[81].x, _835);
    float _943 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _837);
    float _945 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _825);
    float _947 = _927;
    if (_873)
    {
        float _949 = _911 * _863;
        _141 = _949;
    }
    float _951 = _141;
    float _953 = _807 * (-2.0);
    float _955 = _329 + (-0.5);
    float _957 = float(_493);
    float _959 = fma(_953, _841, _841);
    bool _961 = !_643;
    int _963 = _961 ? 0 : 1;
    float _965 = fma(_579, _953, _579);
    float _967 = float(_919);
    float _969 = -_671;
    float _971 = _969 + 1.0;
    int _973 = abs(_963);
    float _975 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[196].x, _959);
    float _977 = float(_545);
    float _979 = _967 * _957;
    float _981 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[143].x, _731);
    float _983 = fma(_965, _951, _975);
    float _985 = _979 * (-2.0);
    float _987 = float(_973);
    float _989 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[143].y, _737);
    float _991 = _335 + (-0.5);
    float _993 = fma(_985, _843, _843);
    float _995 = fma(_593, _985, _593);
    float _997 = _987 * _977;
    float _999 = fma(_759, _705, _989);
    float _1001 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[196].y, _993);
    float _1003 = fma(_659, _705, _981);
    float _1005 = _997 * (-2.0);
    float _1007 = _983 * 0.15915493667125701904296875;
    float _1009 = fma(_995, _951, _1001);
    float _1011 = in.m_58.x;
    float _1013 = in.m_58.y;
    float _1015 = in.m_58.z;
    float _1017 = fma(_621, _1005, _621);
    float _1019 = fma(_1005, _845, _845);
    float _1021 = _1009 * 0.15915493667125701904296875;
    float _1023 = in.m_52.x;
    float _1025 = in.m_52.y;
    float _1027 = _341 + (-0.5);
    float _1029 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _1031 = _1029 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _1035 = _1033 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1037 = in.m_60.x;
    float _1039 = in.m_60.y;
    float _1041 = in.m_60.z;
    float _1043 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1019);
    float _1045 = fma(_1031, _619, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _1047 = fma(_1035, _619, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _1049 = fma(_885, _777, _1003);
    float _1051 = fma(_1017, _951, _1043);
    float _1053 = fma(_899, _777, _999);
    float _1055 = in.m_62.x;
    float _1057 = in.m_62.y;
    float _1059 = in.m_62.z;
    float _1061 = fma(_1045, _605, _1049);
    float _1063 = _1051 * 0.15915493667125701904296875;
    float _1065 = fma(_1047, _605, _1053);
    float _1067 = _1007 * 6.283185482025146484375;
    float _1069 = sin(_1067);
    float _1071 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1061);
    float _1073 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _1075 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1065);
    float _1077 = _1007 * 6.283185482025146484375;
    float _1079 = cos(_1077);
    float _1081 = _1075 * _1025;
    float _1083 = _1071 * _1023;
    float _1085 = _295 * _1013;
    float _1087 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _1089 = _295 * _1039;
    float _1091 = _1081 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1093 = _1083 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1095 = _1021 * 6.283185482025146484375;
    float _1097 = sin(_1095);
    float _1099 = fma(_293, _1037, _1089);
    float _1101 = _1091 * _1087;
    float _1103 = _1093 * _1073;
    float _1105 = _295 * _1057;
    float _1107 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1109 = fma(_297, _1041, _1099);
    float _1111 = fma(_293, _1011, _1085);
    float _1113 = _1021 * 6.283185482025146484375;
    float _1115 = cos(_1113);
    float _1117 = fma(_293, _1055, _1105);
    float _1119 = _1109 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1121 = fma(_297, _1015, _1111);
    float _1123 = fma(_297, _1059, _1117);
    float _1125 = _1121 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1127 = _1063 * 6.283185482025146484375;
    float _1129 = cos(_1127);
    float _1131 = _1069 * _1097;
    float _1133 = _1123 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1135 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1137 = _1063 * 6.283185482025146484375;
    float _1139 = sin(_1137);
    float _1141 = _1079 * _1115;
    float _1143 = _1069 * _1115;
    float _1145 = _1079 * _1129;
    float _1147 = _1079 * _1097;
    float _1149 = _1069 * _1129;
    float _1151 = _1115 * _1129;
    float _1153 = _1145 * _1101;
    float _1155 = _1097 * _1129;
    float _1157 = in.m_54.w;
    float _1159 = fma(_1139, _1141, _1131);
    float _1161 = -_1101;
    float _1163 = _1139 * _1161;
    float _1165 = -_1143;
    float _1167 = fma(_1139, _1147, _1165);
    float _1169 = -_1147;
    float _1171 = fma(_1139, _1143, _1169);
    float _1173 = fma(_1159, _1103, _1153);
    float _1175 = _1149 * _1101;
    float _1177 = fma(_1151, _1103, _1163);
    float _1179 = fma(_1139, _1131, _1141);
    float _1181 = fma(_1167, _1107, _1173);
    float _1183 = fma(_1171, _1103, _1175);
    float _1185 = fma(_1155, _1107, _1177);
    float _1187 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1189 = fma(_1179, _1107, _1183);
    float _1191 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1193 = _1181 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1195 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1187);
    float _1197 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1191);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1193);
    float _1201 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1195);
    float _1203 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1197);
    bool _1205 = _1157 > 0.5;
    float _1207 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1209 = fma(_1189, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1199);
    float _1211 = _1203 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1213 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1135);
    float _1215 = _1133 + _1207;
    float _1217 = -_211;
    int _1219 = _1205 ? as_type<int>(_1217) : as_type<int>(_211);
    float _1221 = _1119 + _1211;
    float _1223 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1213);
    float _1225 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1227 = _1215 + _1225;
    bool _1229 = !_391;
    float _1231 = _1229 ? _211 : as_type<float>(_1219);
    float _1233 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1235 = _1221 + _1233;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1239 = _1237 != 0;
    int _1241 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1243 = _1241 != 0;
    int _1245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1247 = _1245 != 0;
    int _1249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1251 = _1249 != 0;
    float _1253 = _1227 * _1227;
    float _1255 = _1223 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1257 = _1209 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1259 = fma(_1235, _1235, _1253);
    float _1261 = _1125 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1263 = 1.0 / _1255;
    bool _1265 = !_1243;
    int _1267 = _1265 ? 0 : 1;
    float _1269 = fma(_1119, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1261);
    float _1271 = _1125 + _1257;
    bool _1273 = !_1239;
    int _1275 = _1273 ? 0 : 1;
    float _1277 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1269);
    float _1279 = sqrt(_1259);
    bool _1281 = !_1247;
    int _1283 = _1281 ? 0 : 1;
    float _1285 = _1277 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1287 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1289 = isnan(0.5);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1295 = _1291 || _1293;
    bool _1297 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1299 = isnan(0.5);
    bool _1301 = _1297 || _1299;
    bool _1303 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1305 = _1301 || _1303;
    float _1307 = _1285 + _1255;
    bool _1309 = !_1251;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = _1307 * _1263;
    float _1315 = _1313 * 0.5;
    bool _1317 = _1279 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1319 = _1209;
    float _1321 = _1257;
    float _1323 = _1215;
    float _1325 = _1259;
    float _1327 = _1255;
    float _1329 = _1227;
    float _1331 = _1207;
    if (!_1317)
    {
        _1319 = _1221;
    }
    float _1333 = _1319;
    float _1335 = _1333;
    if (!_1317)
    {
        _1321 = _1271;
    }
    float _1337 = _1321;
    bool _1339 = !_1317;
    float _1341 = _1337;
    if (!_1339)
    {
        float _1343 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1345 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1347 = _1279 + _1345;
        float _1349 = _1271 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1351 = rsqrt(_1259);
        float _1353 = _1347 * _1343;
        float _1355 = _1353 * 0.15915493667125701904296875;
        float _1357 = _1355 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = _1355 * 6.283185482025146484375;
        float _1363 = cos(_1361);
        float _1365 = fma(_1359, _1349, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1367 = _1351 * _1365;
        float _1369 = _1363 + (-1.0);
        float _1371 = fma(_1235, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1373 = fma(_1227, _1367, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1375 = _1369 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1377 = fma(_1271, _1363, _1375);
        _1323 = _1373;
        _1325 = _1351;
        _1335 = _1371;
        _1341 = _1377;
    }
    float _1379 = _1323;
    float _1381 = _1325;
    float _1383 = _1335;
    float _1385 = _1341;
    float _1387 = _1385;
    float _1389 = _1383;
    float _1391 = _1381;
    if (_1305)
    {
        _1327 = 1.0;
    }
    float _1393 = _1327;
    float _1395 = _1393;
    if (_1295)
    {
        _1329 = _1379;
    }
    float _1397 = _1329;
    float _1399 = _1397;
    if (!_1295)
    {
        float _1401 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1403 = _1125 + _1401;
        float _1405 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1407 = _1119 + _1405;
        float _1409 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1411 = -_1119;
        float _1413 = _1411 + _1383;
        float _1415 = _1403 * _1403;
        float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1419 = _1133 + _1417;
        float _1421 = -_1125;
        float _1423 = _1421 + _1385;
        float _1425 = fma(_1407, _1407, _1415);
        float _1427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1429 = fma(_1419, _1419, _1425);
        float _1431 = sqrt(_1429);
        float _1433 = _1409 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1435 = precise::min(_1431, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1437 = _1435 * _1427;
        float _1439 = _1433 * _1437;
        float _1441 = -_1133;
        float _1443 = _1441 + _1379;
        float _1445 = fma(_1413, _1439, _1119);
        float _1447 = fma(_1423, _1439, _1125);
        float _1449 = fma(_1443, _1439, _1133);
        _1387 = _1447;
        _1389 = _1445;
        _1399 = _1449;
        _1391 = _1409;
    }
    float _1451 = _1387;
    float _1453 = _1389;
    float _1455 = _1399;
    float _1457 = _1391;
    float _1459 = _1457;
    if (!_1305)
    {
        float _1461 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1463 = _1461 * 0.15915493667125701904296875;
        float _1465 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1469 = fma(_1315, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1467);
        float _1471 = _1463 * 6.283185482025146484375;
        float _1473 = cos(_1471);
        float _1475 = _1465 * 0.15915493667125701904296875;
        float _1477 = _1463 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = 1.0 / _1473;
        float _1483 = _1475 * 6.283185482025146484375;
        float _1485 = cos(_1483);
        float _1487 = _1479 * _1481;
        float _1489 = _1475 * 6.283185482025146484375;
        float _1491 = sin(_1489);
        float _1493 = _1485 * _1487;
        float _1495 = 1.0 / _1469;
        float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1499 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1497;
        float _1501 = 1.0 / _1493;
        float _1503 = 1.0 / _1499;
        float _1505 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1507 = _1495 * _1505;
        float _1509 = _1491 * _1501;
        float _1511 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1513 = fma(_1509, _1507, _1511);
        float _1515 = _1513 * _1503;
        float _1517 = precise::clamp(_1515, 0.0, 1.0);
        float _1519 = -_1517;
        float _1521 = _1519 + 1.0;
        _1459 = _1475;
        _1395 = _1521;
    }
    float _1523 = _1459;
    float _1525 = _1395;
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1529 = _1451 + _1527;
    float _1531 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1533 = _1453 + _1531;
    float _1535 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1537 = _1455 + _1535;
    float _1539 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1541 = _1529 * _1529;
    float _1543 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1545 = fma(_1533, _1533, _1541);
    float _1547 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1543);
    float _1549 = fma(_1537, _1537, _1545);
    float _1551 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1547);
    float _1553 = rsqrt(_1549);
    float _1555 = _1551 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1557 = sqrt(_1549);
    float _1559 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1561 = _1533 * _1559;
    float _1563 = _1537 * _1559;
    float _1565 = _1561 * _1561;
    float _1567 = _1563 * _1563;
    float _1569 = _1565 + _1567;
    float _1571 = sqrt(_1569);
    bool _1573 = _1571 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1575 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1577 = _1571 + _1575;
    float _1579 = _1553;
    float _1581 = _1569;
    float _1583 = _1577;
    float _1585 = _1523;
    float _1587 = _1529;
    if (_1573)
    {
        float _1589 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1579 = _1589;
    }
    float _1591 = _1579;
    if (_1573)
    {
        float _1593 = rsqrt(_1569);
        _1581 = _1593;
    }
    float _1595 = _1581;
    float _1597 = _1595;
    if (_1573)
    {
        float _1599 = _1577 * _1591;
        _1583 = _1599;
    }
    float _1601 = _1583;
    if (_1573)
    {
        float _1603 = _1601 * 0.15915493667125701904296875;
        _1585 = _1603;
    }
    float _1605 = _1585;
    float _1607 = _1537;
    float _1609 = _1605;
    if (_1573)
    {
        float _1611 = _1605 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        _1607 = _1613;
    }
    float _1615 = _1607;
    float _1617 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1619 = precise::max(0.0, _1617);
    float _1621 = _1591;
    float _1623 = _1619;
    if (_1573)
    {
        float _1625 = _1605 * 6.283185482025146484375;
        float _1627 = cos(_1625);
        _1621 = _1627;
    }
    float _1629 = _1621;
    float _1631 = -_1559;
    float _1633 = -_1619;
    float _1635 = fma(_1529, _1631, _1633);
    if (_1573)
    {
        float _1637 = _1635 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1587 = _1637;
    }
    float _1639 = _1587;
    float _1641 = _1639;
    float _1643 = _1615;
    if (_1573)
    {
        float _1645 = fma(_1615, _1639, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1641 = _1645;
    }
    float _1647 = _1641;
    float _1649 = _1647;
    if (!_1573)
    {
        _1643 = _1561;
    }
    float _1651 = _1643;
    float _1653 = _1651;
    float _1655 = _1629;
    if (_1573)
    {
        float _1657 = _1629 + (-1.0);
        _1623 = _1657;
    }
    float _1659 = _1623;
    float _1661 = _1659;
    if (_1573)
    {
        float _1663 = _1595 * _1647;
        _1331 = _1663;
    }
    float _1665 = _1331;
    if (!_1573)
    {
        _1649 = _1635;
    }
    float _1667 = _1649;
    float _1669 = _1667;
    if (_1573)
    {
        float _1671 = _1659 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1609 = _1671;
    }
    float _1673 = _1609;
    if (_1573)
    {
        float _1675 = _1561 * _1665;
        _1653 = _1675;
    }
    float _1677 = _1653;
    if (!_1573)
    {
        _1661 = _1563;
    }
    float _1679 = _1661;
    float _1681 = _1679;
    if (_1573)
    {
        float _1683 = _1563 * _1665;
        _1681 = _1683;
    }
    float _1685 = _1681;
    if (!_1573)
    {
        _1597 = _1565;
    }
    float _1687 = _1597;
    float _1689 = _1687;
    if (_1573)
    {
        float _1691 = fma(_1635, _1629, _1673);
        _1669 = _1691;
    }
    float _1693 = _1669;
    if (_1573)
    {
        float _1695 = _1677 * _1677;
        _1689 = _1695;
    }
    float _1697 = _1689;
    if (!_1573)
    {
        _1655 = _1567;
    }
    float _1699 = _1655;
    float _1701 = _1699;
    if (_1573)
    {
        float _1703 = _1685 * _1685;
        _1701 = _1703;
    }
    float _1705 = _1701;
    float _1707 = fma(_1693, _1693, _1697);
    float _1709 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1711 = _1707 + _1705;
    float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1715 = fma(_1557, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1713);
    float _1717 = precise::clamp(_1715, 0.0, 1.0);
    float _1719 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1709);
    float _1721 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1723 = -_1717;
    float _1725 = _1723 + 1.0;
    float _1727 = rsqrt(_1711);
    float _1729 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1721);
    float _1731 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1719);
    float _1733 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1729);
    float _1735 = _1731 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1737 = _1451 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1739 = abs(_1725);
    float _1741 = log2(_1739);
    float _1743 = _1733 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1745 = _1735 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1747 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1737);
    float _1749 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1751 = -_1745;
    float _1753 = fma(_1751, _1539, 1.0);
    float _1755 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1747);
    float _1757 = _1727 * _1677;
    float _1759 = _1727 * _1693;
    float _1761 = _1727 * _1685;
    float _1763 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1749);
    float _1765 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1767 = _1755 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1769 = log2(_1753);
    float _1771 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1763);
    float _1773 = -_1765;
    float _1775 = fma(_1759, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1773);
    float _1777 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1779 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1781 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1771);
    float _1783 = -_1761;
    float _1785 = fma(_1783, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1775);
    float _1787 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1789 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1779);
    float _1791 = exp2(_1777);
    float _1793 = fma(_1785, -0.5, 0.5);
    float _1795 = fma(_1785, 0.5, 0.5);
    float _1797 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1787);
    float _1799 = _1759 + 1.0;
    float _1801 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1789);
    float _1803 = fma(_1795, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1805 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1797);
    float _1807 = 1.0 / _1781;
    float _1809 = fma(_1795, _1803, -0.212114393711090087890625);
    float _1811 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1805);
    float _1813 = fma(_1795, _1809, 1.570728778839111328125);
    float _1815 = sqrt(_1793);
    float _1817 = -_1759;
    float _1819 = fma(_1791, _1799, _1817);
    float _1821 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1801);
    float _1823 = _1769 * 0.693147182464599609375;
    float _1825 = _1823 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1827 = _1811 * _1807;
    float _1829 = _1821 * _1807;
    float _1831 = fma(_1827, 0.5, 0.5);
    float _1833 = fma(_1829, -0.5, 0.5);
    float _1835 = _1815 * 0.636619746685028076171875;
    float _1837 = fma(_1819, 0.5, 0.5);
    float _1839 = -_1813;
    float _1841 = fma(_1835, _1839, 1.0);
    float3 _6287 = float3(_1831, _1833, _1825);
    float _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6287, float3(0.0), isnan(_6287)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6287, float3(0.0), isnan(_6287)), level(0.0)).x;
    float3 _6298 = float3(_1831, _1833, _1825);
    float4 _1846 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6298, float3(0.0), isnan(_6298)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6298, float3(0.0), isnan(_6298)), level(0.0)).xyzw;
    float _1848 = _1846.x;
    float _1850 = _1846.y;
    float _1852 = _1846.z;
    float _1854 = _1846.w;
    float2 _6315 = float2(_1841, _1837);
    float3 _1858 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6315, float2(0.0), isnan(_6315)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6315, float2(0.0), isnan(_6315)), level(0.0)).xyz;
    float _1860 = _1858.x;
    float _1862 = _1858.y;
    float _1864 = _1858.z;
    float _1866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1868 = int(_1866);
    int _1870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1872 = _1870 != 0;
    float _1874 = -_933;
    float _1876 = _1874 + 1.0;
    int _1878 = abs(_1267);
    float _1880 = -_931;
    float _1882 = _1880 + 1.0;
    int _1884 = abs(_1283);
    out.m_64.x = _1453;
    out.m_64.y = _1451;
    out.m_64.z = _1455;
    int _1886 = abs(_1311);
    float _1888 = trunc(_915);
    int _1890 = int(_1888);
    bool _1892 = _335 > 0.5;
    float _1894 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1896 = _341 > 0.5;
    float _1898 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1900 = -_925;
    float _1902 = _1900 + 1.0;
    float _1904 = -_921;
    float _1906 = _1904 + 1.0;
    float _1908 = -_929;
    float _1910 = _1908 + 1.0;
    float _1912 = float(uint(_1868));
    float _1914 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1916 = int(_1914);
    int _1918 = ~_1868;
    int _1920 = _1918 + 1;
    bool _1922 = _1868 == 0;
    float _1924 = float(uint(_1890));
    float _1926 = 1.0 / _1912;
    float _1928 = float(uint(_1916));
    float _1930 = trunc(_927);
    int _1932 = int(_1930);
    int _1934 = ~_1868;
    int _1936 = _1934 + 1;
    int _1938 = ~_1916;
    int _1940 = _1938 + 1;
    int _1942 = as_type<int>(_1926) + (-2);
    float _1944 = 1.0 / _1928;
    if (_1872)
    {
        _947 = _329;
    }
    float _1946 = _947;
    float _1948 = _1946;
    if (!_1872)
    {
        _1948 = _335;
    }
    float _1950 = _1948;
    float _1952 = as_type<float>(_1942) * _1924;
    float _1954 = -_211;
    int _1956 = _1892 ? as_type<int>(_1954) : as_type<int>(_211);
    float _1958 = trunc(_1952);
    float _1960 = precise::max(_1958, 0.0);
    uint _1963 = uint(_1960);
    float _1965 = float(uint(_1932));
    int _1967 = as_type<int>(_1944) + (-2);
    float _1969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1971 = _1952;
    if (_1872)
    {
        _1971 = 1.0;
    }
    float _1973 = _1971;
    float _1975 = _1973;
    if (!_1872)
    {
        _1975 = 1.2345600128173828125;
    }
    float _1977 = _1975;
    float _1979 = as_type<float>(_1967) * _1965;
    int _1981 = ~_1916;
    int _1983 = _1981 + 1;
    int _1985 = _1936 * int(_1963);
    int _1987 = _1985 + _1890;
    float _1989 = _1977 * _1950;
    float _1991 = float(_1890);
    float _1993 = trunc(_1979);
    float _1995 = precise::max(_1993, 0.0);
    uint _1997 = uint(_1995);
    float _1999 = float(uint(_1987));
    float _2001 = as_type<float>(_1987);
    if (_1872)
    {
        _2001 = 1.0;
    }
    float _2003 = _2001;
    float _2005 = _2003;
    if (!_1872)
    {
        _2005 = 7.345489978790283203125;
    }
    float _2007 = _2005;
    float _2009 = as_type<float>(_1942) * _1999;
    float _2011 = floor(_1989);
    int _2013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2015 = _2013 != 0;
    float _2017 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2019 = _2007 * _329;
    float _2021 = trunc(_2009);
    float _2023 = precise::max(_2021, 0.0);
    uint _2025 = uint(_2023);
    int _2027 = _1983 * int(_1997);
    int _2029 = _2027 + _1932;
    float _2031 = float(uint(_2029));
    float _2033 = floor(_2019);
    float _2035 = as_type<float>(_1967) * _2031;
    int _2037 = int(_1963) + int(_2025);
    float _2039 = trunc(_2035);
    float _2041 = precise::max(_2039, 0.0);
    uint _2043 = uint(_2041);
    float _2045 = float(_1868);
    int _2047 = _1920 * _2037;
    int _2049 = _2047 + _1890;
    bool _2051 = _1991 >= _2045;
    bool _2053 = isnan(_1991);
    bool _2055 = _2051 || _2053;
    bool _2057 = isnan(_2045);
    bool _2059 = _2055 || _2057;
    float _2061 = float(_2059);
    float _2063 = -_2033;
    float _2065 = _2019 + _2063;
    float _2067 = -_2011;
    float _2069 = _1989 + _2067;
    bool _2071 = uint(_2049) >= uint(_1868);
    float _2073 = exp2(_1894);
    float _2075 = float(_1916);
    bool _2077 = !_2071;
    int _2079 = _2077 ? 0 : (-1);
    int _2081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2083 = _2081 != 0;
    int _2085 = ~_2037;
    int _2087 = _2085 + _2079;
    int _2089 = _2087 + 1;
    float _2091 = trunc(_2061);
    int _2093 = int(_2091);
    int _2095 = int(_1997) + int(_2043);
    float _2097 = _2065 * _2045;
    float _2099 = float(_1932);
    int _2101 = _1868 * _2089;
    int _2103 = _2101 + _1890;
    int _2105 = _1868 + (-1);
    int _2107 = _1940 * _2095;
    int _2109 = _2107 + _1932;
    bool _2111 = _2099 >= _2075;
    bool _2113 = isnan(_2099);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan(_2075);
    bool _2119 = _2115 || _2117;
    float _2121 = float(_2119);
    float _2123 = _2045 * _913;
    bool _2125 = !_1922;
    int _2127 = _2125 ? _2103 : (-1);
    float _2129 = trunc(_2097);
    int _2131 = int(_2129);
    bool _2133 = !_2083;
    int _2135 = _2133 ? 0 : 1;
    float _2137 = _2075 * _913;
    bool _2139 = uint(_2109) >= uint(_1916);
    float _2141 = -_2073;
    float _2143 = _2141 + 1.0;
    int _2145 = abs(_2135);
    int _2147 = ~_2093;
    int _2149 = _2147 + 1;
    int _2151 = _2149 + 1;
    float _2153 = trunc(_2121);
    int _2155 = int(_2153);
    int _2157 = _2127 * _2151;
    bool _2159 = !_2139;
    int _2161 = _2159 ? 0 : (-1);
    bool _2163 = _1916 == 0;
    int _2165 = _2093 * _2105;
    int _2167 = _2165 + _2157;
    int _2169 = abs(_463);
    float _2171 = trunc(_2137);
    int _2173 = int(_2171);
    int _2175 = ~_2095;
    int _2177 = _2175 + _2161;
    int _2179 = _2177 + 1;
    int _2181 = _1916 * _2179;
    int _2183 = _2181 + _1932;
    float _2185 = _2069 * _2075;
    float _2187 = trunc(_2123);
    int _2189 = int(_2187);
    int _2191 = _2131 * _2145;
    int _2193 = _2191 + _1890;
    int _2195 = abs(_597);
    int _2197 = _2167 * _2169;
    int _2199 = ~_2155;
    int _2201 = _2199 + 1;
    int _2203 = _2201 + 1;
    bool _2205 = !_2163;
    int _2207 = _2205 ? _2183 : (-1);
    float _2209 = trunc(_2185);
    int _2211 = int(_2209);
    int _2213 = abs(_577);
    bool _2215 = !_2015;
    int _2217 = _2215 ? 0 : 1;
    int _2219 = _2207 * _2203;
    int _2221 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2223 = _2221 != 0;
    int _2225 = _2189 * _2213;
    int _2227 = _2225 + _2197;
    int _2229 = abs(_2217);
    float _2231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2233 = !_2223;
    int _2235 = _2233 ? 0 : 1;
    int _2237 = _2193 * _2195;
    int _2239 = _2237 + _2227;
    int _2241 = _1916 + (-1);
    int _2243 = abs(_2235);
    int _2245 = _2131 * _2229;
    int _2247 = _2245 + _2239;
    int _2249 = abs(_1275);
    int _2251 = _2155 * _2241;
    int _2253 = _2251 + _2219;
    float _2255 = float(uint(_2247));
    int _2257 = _2253 * _1878;
    int _2259 = _2211 * _2243;
    int _2261 = _2259 + _1932;
    float _2263 = float(uint(_2193));
    float _2265 = as_type<float>(_1942) * _2255;
    int _2267 = ~_1868;
    int _2269 = _2267 + 1;
    int _2271 = _2173 * _2249;
    int _2273 = _2271 + _2257;
    int _2275 = ~_1916;
    int _2277 = _2275 + 1;
    float _2279 = trunc(_2265);
    float _2281 = precise::max(_2279, 0.0);
    uint _2283 = uint(_2281);
    int _2285 = ~_1916;
    int _2287 = _2285 + 1;
    int _2289 = _2261 * _1884;
    int _2291 = _2289 + _2273;
    int _2293 = ~_1868;
    int _2295 = _2293 + 1;
    int _2297 = _2211 * _1886;
    int _2299 = _2297 + _2291;
    float _2301 = as_type<float>(_1942) * _2263;
    float _2303 = float(uint(_2299));
    int _2305 = _2269 * int(_2283);
    int _2307 = _2305 + _2247;
    float _2309 = trunc(_2301);
    float _2311 = precise::max(_2309, 0.0);
    uint _2313 = uint(_2311);
    float _2315 = as_type<float>(_1967) * _2303;
    float _2317 = float(uint(_2261));
    float _2319 = float(uint(_2307));
    float _2321 = as_type<float>(_1967) * _2317;
    float _2323 = trunc(_2315);
    float _2325 = precise::max(_2323, 0.0);
    uint _2327 = uint(_2325);
    float _2329 = as_type<float>(_1942) * _2319;
    float _2331 = trunc(_2329);
    float _2333 = precise::max(_2331, 0.0);
    uint _2335 = uint(_2333);
    int _2337 = _2295 * int(_2313);
    int _2339 = _2337 + _2193;
    float _2341 = float(uint(_2339));
    float _2343 = trunc(_2321);
    float _2345 = precise::max(_2343, 0.0);
    uint _2347 = uint(_2345);
    int _2349 = _2277 * int(_2327);
    int _2351 = _2349 + _2299;
    float _2353 = as_type<float>(_1942) * _2341;
    int _2355 = ~_1868;
    int _2357 = _2355 + 1;
    float _2359 = float(uint(_2351));
    float _2361 = trunc(_2353);
    float _2363 = precise::max(_2361, 0.0);
    uint _2365 = uint(_2363);
    int _2367 = int(_2283) + int(_2335);
    float _2369 = as_type<float>(_1967) * _2359;
    int _2371 = _2287 * int(_2347);
    int _2373 = _2371 + _2261;
    float _2375 = trunc(_2369);
    float _2377 = precise::max(_2375, 0.0);
    uint _2379 = uint(_2377);
    int _2381 = _2357 * _2367;
    int _2383 = _2381 + _2247;
    float _2385 = float(uint(_2373));
    bool _2387 = uint(_2383) >= uint(_1868);
    float _2389 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2391 = as_type<float>(_1967) * _2385;
    bool _2393 = !_2387;
    int _2395 = _2393 ? 0 : (-1);
    int _2397 = ~_1868;
    int _2399 = _2397 + 1;
    float _2401 = _2389 * _329;
    int _2403 = int(_2313) + int(_2365);
    float _2405 = -_211;
    float _2407 = _2405 + 0.5;
    int _2409 = ~_2367;
    int _2411 = _2409 + _2395;
    int _2413 = _2411 + 1;
    float _2415 = trunc(_2391);
    float _2417 = precise::max(_2415, 0.0);
    uint _2419 = uint(_2417);
    float _2421 = _207 + 0.5;
    int _2423 = ~_1916;
    int _2425 = _2423 + 1;
    int _2427 = _1868 * _2413;
    int _2429 = _2427 + _2247;
    int _2431 = int(_2327) + int(_2379);
    int _2433 = _2399 * _2403;
    int _2435 = _2433 + _2193;
    out.m_66.x = _2421;
    out.m_66.y = _2407;
    float _2437 = trunc(_2401);
    int _2439 = int(_2437);
    bool _2441 = !_1922;
    int _2443 = _2441 ? _2429 : (-1);
    int _2445 = _2425 * _2431;
    int _2447 = _2445 + _2299;
    bool _2449 = uint(_2435) >= uint(_1868);
    bool _2451 = uint(_2447) >= uint(_1916);
    int _2453 = _2443 & 3;
    bool _2455 = _2453 != 0;
    bool _2457 = !_2449;
    int _2459 = _2457 ? 0 : (-1);
    bool _2461 = !_2451;
    int _2463 = _2461 ? 0 : (-1);
    bool _2465 = uint(_2453) >= 2u;
    int _2467 = ~_2403;
    int _2469 = _2467 + _2459;
    int _2471 = _2469 + 1;
    int _2473 = _2439 << 4;
    int _2475 = _2473 + 1712;
    int _2477 = ~_2431;
    int _2479 = _2477 + _2463;
    int _2481 = _2479 + 1;
    int _2483 = _1868 * _2471;
    int _2485 = _2483 + _2193;
    int _2487 = _2443 & 3;
    bool _2489 = _2487 != 0;
    uint _2491 = uint(int(uint(_2475) >> uint(2)));
    uint _2493 = uint(int(uint(int(_2491)) >> uint(2)));
    int _2495 = int(_2491) & 3;
    float _2497 = (*spvDescriptorSet0.vp_c9)._m0[int(_2493)][_2495];
    int _2499 = int(_2491) + 1;
    uint _2501 = uint(int(uint(_2499) >> uint(2)));
    int _2503 = _2499 & 3;
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[int(_2501)][_2503];
    int _2507 = _2465 ? 0 : 1;
    int _2509 = _1916 * _2481;
    int _2511 = _2509 + _2299;
    bool _2513 = _2453 != 3;
    int _2515 = _2489 ? 0 : 1;
    bool _2517 = uint(_2453) > 1u;
    int _2519 = _2475 + 8;
    uint _2521 = uint(int(uint(_2519) >> uint(2)));
    uint _2523 = uint(int(uint(int(_2521)) >> uint(2)));
    int _2525 = int(_2521) & 3;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[int(_2523)][_2525];
    int _2529 = _2443 >> 31;
    int _2531 = ~_2507;
    int _2533 = _2531 + 1;
    int _2535 = _2533 + 1;
    int _2537 = _2529 & 3;
    bool _2539 = !_2163;
    int _2541 = _2539 ? _2511 : (-1);
    int _2543 = _2535;
    if (_2513)
    {
        int _2545 = ~_2507;
        int _2547 = _2545 + 1;
        _2543 = _2547;
    }
    int _2549 = _2543;
    int _2551 = _2443 + _2537;
    int _2553 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2555 = _2553 != 0;
    int _2557 = ~_2515;
    int _2559 = _2557 + 1;
    int _2561 = _2559 + 1;
    int _2563 = _2561;
    if (!_2517)
    {
        int _2565 = ~_2515;
        int _2567 = _2565 + 1;
        _2563 = _2567;
    }
    int _2569 = _2563;
    bool _2571 = _2453 != 3;
    bool _2573 = !_2555;
    int _2575 = _2573 ? 0 : 1;
    int _2577 = _2551 >> 2;
    int _2579 = _2541 & 3;
    bool _2581 = _2579 != 0;
    int _2583 = ~_1916;
    int _2585 = _2583 + 1;
    bool _2587 = !_1922;
    int _2589 = _2587 ? _2485 : (-1);
    int _2591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2593 = _2591 != 0;
    bool _2595 = !_2455;
    int _2597 = _2595 ? 0 : 1;
    int _2599 = _2577 << 4;
    int _2601 = _2599 + 368;
    bool _2603 = uint(_2579) > 1u;
    float _2605 = _2497 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _2607 = !_2593;
    int _2609 = _2607 ? 0 : 1;
    uint _2611 = uint(int(uint(_2601) >> uint(2)));
    uint _2613 = uint(int(uint(int(_2611)) >> uint(2)));
    int _2615 = int(_2611) & 3;
    float _2617 = (*spvDescriptorSet0.vp_c9)._m0[int(_2613)][_2615];
    int _2619 = int(_2611) + 1;
    uint _2621 = uint(int(uint(_2619) >> uint(2)));
    int _2623 = _2619 & 3;
    float _2625 = (*spvDescriptorSet0.vp_c9)._m0[int(_2621)][_2623];
    int _2627 = _2541 & 3;
    bool _2629 = _2627 != 0;
    float _2631 = _2505 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2633 = !_2571;
    int _2635 = _2633 ? 0 : (-1);
    float _2637 = _2605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2639 = _2579 != 3;
    float _2641 = _2527 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2643 = _2629 ? 0 : 1;
    float _2645 = _2631 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2647 = uint(_2579) >= 2u;
    float _2649 = _2641 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2651 = int(_2347) + int(_2419);
    int _2653 = ~_2643;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    int _2659 = _2657;
    if (!_2603)
    {
        int _2661 = ~_2643;
        int _2663 = _2661 + 1;
        _2659 = _2663;
    }
    int _2665 = _2659;
    int _2667 = _2647 ? 0 : 1;
    bool _2669 = _2579 != 3;
    int _2671 = _2585 * _2651;
    int _2673 = _2671 + _2261;
    bool _2675 = !_2581;
    int _2677 = _2675 ? 0 : 1;
    int _2679 = ~_2667;
    int _2681 = _2679 + 1;
    int _2683 = _2681 + 1;
    int _2685 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2687 = _2685 != 0;
    int _2689 = _2683;
    if (_2639)
    {
        int _2691 = ~_2667;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    bool _2697 = !_2669;
    int _2699 = _2697 ? 0 : (-1);
    float _2701 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    bool _2703 = uint(_2673) >= uint(_1916);
    int _2705 = _2601 + 8;
    uint _2707 = uint(int(uint(_2705) >> uint(2)));
    uint _2709 = uint(int(uint(int(_2707)) >> uint(2)));
    int _2711 = int(_2707) & 3;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[int(_2709)][_2711];
    int _2715 = int(_2707) + 1;
    uint _2717 = uint(int(uint(_2715) >> uint(2)));
    int _2719 = _2715 & 3;
    float _2721 = (*spvDescriptorSet0.vp_c9)._m0[int(_2717)][_2719];
    int _2723 = _2541 >> 31;
    float _2725 = _2701 * _329;
    int _2727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2729 = _2727 != 0;
    bool _2731 = _329 > 0.5;
    float _2733 = trunc(_2725);
    int _2735 = int(_2733);
    int _2737 = _2723 & 3;
    int _2739 = abs(_2569);
    float _2741 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2743 = _2541 + _2737;
    float _2745 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2747 = !_2703;
    int _2749 = _2747 ? 0 : (-1);
    float _2751 = _421 + 0.5;
    int _2753 = _2743 >> 2;
    out.m_68.x = _2637;
    out.m_68.y = _2645;
    out.m_68.z = _2649;
    out.m_68.w = _2741;
    int _2755 = ~_2739;
    int _2757 = _2755 + 1;
    int _2759 = _2757 + 1;
    float _2761 = fma(_2745, _2751, _937);
    int _2763 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2765 = _2763 != 0;
    float _2767 = _427 + (-0.5);
    float _2769 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2771 = _2759 * as_type<int>(_2625);
    float _2773 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2775 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2777 = int(_2775);
    float _2779 = -_2017;
    float _2781 = -_945;
    float _2783 = fma(_2779, _2767, _2781);
    float _2785 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2787 = abs(_2635);
    float _2789 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2773);
    int _2791 = ~_2651;
    int _2793 = _2791 + _2749;
    int _2795 = _2793 + 1;
    float _2797 = -_1139;
    float _2799 = fma(_2797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2785);
    int _2801 = abs(_2597);
    float _2803 = -_1139;
    float _2805 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2769);
    int _2807 = _2753 << 4;
    int _2809 = _2807 + 512;
    float _2811 = _1145 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2813 = ~_2801;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    float _2819 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    uint _2821 = uint(int(uint(_2809) >> uint(2)));
    uint _2823 = uint(int(uint(int(_2821)) >> uint(2)));
    int _2825 = int(_2821) & 3;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[int(_2823)][_2825];
    int _2829 = int(_2821) + 1;
    uint _2831 = uint(int(uint(_2829) >> uint(2)));
    int _2833 = _2829 & 3;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[int(_2831)][_2833];
    int _2837 = abs(_2665);
    int _2839 = _1916 * _2795;
    int _2841 = _2839 + _2261;
    float _2843 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2819);
    int _2845 = _2817 * as_type<int>(_2617);
    int _2847 = _2845 + _2771;
    int _2849 = abs(_2549);
    float _2851 = _1159 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2853 = float(uint(_2777));
    int _2855 = _2809 + 8;
    uint _2857 = uint(int(uint(_2855) >> uint(2)));
    uint _2859 = uint(int(uint(int(_2857)) >> uint(2)));
    int _2861 = int(_2857) & 3;
    float _2863 = (*spvDescriptorSet0.vp_c9)._m0[int(_2859)][_2861];
    int _2865 = int(_2857) + 1;
    uint _2867 = uint(int(uint(_2865) >> uint(2)));
    int _2869 = _2865 & 3;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[int(_2867)][_2869];
    int _2873 = ~_2849;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    float _2879 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2851);
    float _2881 = -_1139;
    float _2883 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2811);
    int _2885 = abs(_2575);
    int _2887 = _2877 * as_type<int>(_2713);
    int _2889 = _2887 + _2847;
    int _2891 = ~_2787;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    float _2897 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2899 = ~_2885;
    int _2901 = _2899 + 1;
    int _2903 = _2901 + 1;
    float _2905 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2799);
    int _2907 = abs(_2695);
    int _2909 = _2895 * as_type<int>(_2721);
    int _2911 = _2909 + _2889;
    float _2913 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2915 = 1.0 / _2853;
    float _2917 = _1167 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2919 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2913);
    float _2921 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2897);
    float _2923 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2917);
    int _2925 = _2911 * _2903;
    int _2927 = abs(_2677);
    float _2929 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2931 = int(_2929);
    int _2933 = ~_2837;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = _2589 * _2885;
    int _2941 = _2939 + _2925;
    int _2943 = ~_2927;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    float _2949 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2919);
    int _2951 = abs(_2609);
    float _2953 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2805);
    float _2955 = float(uint(_2941));
    float _2957 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2883);
    int _2959 = _2735 << 4;
    int _2961 = _2959 + 1968;
    float _2963 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2965 = !_2687;
    float _2967 = _2965 ? _211 : as_type<float>(_1956);
    float _2969 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2971 = _2961 + 8;
    uint _2973 = uint(int(uint(_2971) >> uint(2)));
    uint _2975 = uint(int(uint(int(_2973)) >> uint(2)));
    int _2977 = int(_2973) & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    float _2981 = -_207;
    int _2983 = _2731 ? as_type<int>(_2981) : as_type<int>(_207);
    float _2985 = float(uint(_2931));
    float _2987 = fma(_2969, _2969, 1.0);
    int _2989 = _2937 * as_type<int>(_2835);
    int _2991 = as_type<int>(_2915) + (-2);
    int _2993 = _2947 * as_type<int>(_2827);
    int _2995 = _2993 + _2989;
    float _2997 = as_type<float>(_2991) * _2955;
    int _2999 = abs(_2699);
    float _3001 = 1.0 / _2985;
    int _3003 = ~_2907;
    int _3005 = _3003 + 1;
    int _3007 = _3005 + 1;
    int _3009 = abs(_2777);
    int _3011 = ~_2999;
    int _3013 = _3011 + 1;
    int _3015 = _3013 + 1;
    int _3017 = _3007 * as_type<int>(_2863);
    int _3019 = _3017 + _2995;
    float _3021 = trunc(_2997);
    float _3023 = precise::max(_3021, 0.0);
    uint _3025 = uint(_3023);
    int _3027 = ~_2951;
    int _3029 = _3027 + 1;
    int _3031 = _3029 + 1;
    int _3033 = _3015 * as_type<int>(_2871);
    int _3035 = _3033 + _3019;
    int _3037 = abs(_2931);
    float _3039 = float(uint(_3009));
    int _3041 = _3035 * _3031;
    bool _3043 = !_2163;
    int _3045 = _3043 ? _2841 : (-1);
    float _3047 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2921);
    float _3049 = 1.0 / _3039;
    float _3051 = float(uint(_3037));
    int _3053 = ~_2777;
    int _3055 = _3053 + 1;
    int _3057 = _3045 * _2951;
    int _3059 = _3057 + _3041;
    int _3061 = as_type<int>(_3001) + (-2);
    float _3063 = -_207;
    int _3065 = _1896 ? as_type<int>(_3063) : as_type<int>(_207);
    int _3067 = _3055 * int(_3025);
    int _3069 = _3067 + _2941;
    float _3071 = 1.0 / _3051;
    float _3073 = float(uint(_3059));
    float _3075 = fma(_1179, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2923);
    int _3077 = abs(_2941);
    uint _3079 = uint(int(uint(_2961) >> uint(2)));
    uint _3081 = uint(int(uint(int(_3079)) >> uint(2)));
    int _3083 = int(_3079) & 3;
    float _3085 = (*spvDescriptorSet0.vp_c9)._m0[int(_3081)][_3083];
    int _3087 = int(_3079) + 1;
    uint _3089 = uint(int(uint(_3087) >> uint(2)));
    int _3091 = _3087 & 3;
    float _3093 = (*spvDescriptorSet0.vp_c9)._m0[int(_3089)][_3091];
    float _3095 = float(uint(_3069));
    float _3097 = as_type<float>(_3061) * _3073;
    int _3099 = abs(_3059);
    float _3101 = rsqrt(_2987);
    int _3103 = as_type<int>(_3049) + (-2);
    float _3105 = as_type<float>(_2991) * _3095;
    float _3107 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2879);
    float _3109 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2843);
    float _3111 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2789);
    float _3113 = float(uint(_3077));
    float _3115 = _2969 * _2957;
    float _3117 = trunc(_3097);
    float _3119 = precise::max(_3117, 0.0);
    uint _3121 = uint(_3119);
    int _3123 = as_type<int>(_3071) + (-2);
    float _3125 = as_type<float>(_3103) * _3113;
    float _3127 = float(uint(_3099));
    float _3129 = fma(_2963, _3111, _3115);
    bool _3131 = !_2729;
    float _3133 = _3131 ? _207 : as_type<float>(_3065);
    out.m_70.x = _3107;
    out.m_70.y = _3109;
    out.m_70.z = _3111;
    int _3135 = ~_2931;
    int _3137 = _3135 + 1;
    float _3139 = as_type<float>(_3123) * _3127;
    float _3141 = trunc(_3125);
    float _3143 = precise::max(_3141, 0.0);
    uint _3145 = uint(_3143);
    int _3147 = ~_3009;
    int _3149 = _3147 + 1;
    float _3151 = _2969 * _2905;
    bool _3153 = !_2765;
    float _3155 = _3153 ? _207 : as_type<float>(_2983);
    float _3157 = _2969 * _2953;
    int _3159 = ~_3037;
    int _3161 = _3159 + 1;
    float _3163 = fma(_2963, _3107, _3151);
    int _3165 = _3137 * int(_3121);
    int _3167 = _3165 + _3059;
    float _3169 = trunc(_3139);
    float _3171 = precise::max(_3169, 0.0);
    uint _3173 = uint(_3171);
    float _3175 = fma(_2963, _3109, _3157);
    int _3177 = ~_3009;
    int _3179 = _3177 + 1;
    float _3181 = float(uint(_3167));
    int _3183 = ~_3037;
    int _3185 = _3183 + 1;
    int _3187 = _3149 * int(_3145);
    int _3189 = _3187 + _3077;
    float _3191 = as_type<float>(_3061) * _3181;
    float _3193 = trunc(_3105);
    float _3195 = precise::max(_3193, 0.0);
    uint _3197 = uint(_3195);
    float _3199 = _2969 * _3101;
    float _3201 = float(uint(_3189));
    float _3203 = -_3047;
    float _3205 = _3199 * _3203;
    int _3207 = _3161 * int(_3173);
    int _3209 = _3207 + _3099;
    float _3211 = _3085 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3213 = as_type<float>(_3103) * _3201;
    float _3215 = fma(_427, _1876, _2783);
    float _3217 = float(uint(_3209));
    float _3219 = _2949 + _3163;
    float _3221 = -_1882;
    float _3223 = fma(_421, _3221, _2761);
    float _3225 = trunc(_3213);
    float _3227 = precise::max(_3225, 0.0);
    uint _3229 = uint(_3227);
    float _3231 = -_2949;
    float _3233 = _3199 * _3231;
    float _3235 = as_type<float>(_3123) * _3217;
    float _3237 = -_3075;
    float _3239 = _3199 * _3237;
    int _3241 = int(_3025) + int(_3197);
    float _3243 = fma(_3101, _2905, _3233);
    float _3245 = _3047 + _3175;
    int _3247 = ~_2777;
    int _3249 = _3247 + 1;
    float _3251 = trunc(_3235);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    float _3257 = fma(_3101, _2953, _3205);
    float _3259 = fma(_3101, _2957, _3239);
    float _3261 = _3093 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _3263 = ~_2931;
    int _3265 = _3263 + 1;
    float _3267 = _2979 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3269 = trunc(_3191);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    int _3275 = int(_3145) + int(_3229);
    int _3277 = _3249 * _3241;
    int _3279 = _3277 + _2941;
    float _3281 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3283 = _3179 * _3275;
    int _3285 = _3283 + _3077;
    bool _3287 = uint(_3279) >= uint(_2777);
    float _3289 = _3211 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _3291 = int(_3173) + int(_3255);
    float _3293 = _3261 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3295 = _3267 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3297 = uint(_3285) >= uint(_3009);
    float _3299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3301 = _3185 * _3291;
    int _3303 = _3301 + _3099;
    bool _3305 = !_3287;
    int _3307 = _3305 ? 0 : (-1);
    out.m_72.x = _3289;
    out.m_72.y = _3293;
    out.m_72.z = _3295;
    out.m_72.w = _3281;
    int _3309 = int(_3121) + int(_3273);
    float _3311 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1898);
    bool _3313 = uint(_3303) >= uint(_3037);
    float _3315 = -_923;
    float _3317 = _3315 + 1.0;
    bool _3319 = !_3297;
    int _3321 = _3319 ? 0 : (-1);
    int _3323 = _3265 * _3309;
    int _3325 = _3323 + _3059;
    int _3327 = ~_3241;
    int _3329 = _3327 + _3307;
    int _3331 = _3329 + 1;
    float _3333 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3311);
    int _3335 = _2941 ^ _2777;
    float _3337 = _3075 + _3129;
    bool _3339 = uint(_3325) >= uint(_2931);
    int _3341 = _2777 * _3331;
    int _3343 = _3341 + _2941;
    int _3345 = ~_3321;
    int _3347 = _3275 + _3345;
    int _3349 = _3347 + 1;
    float _3351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    uint _3353 = uint(int(uint(_3335) >> uint(31)));
    out.m_74.x = _3223;
    out.m_74.y = _3215;
    bool _3355 = !_3339;
    int _3357 = _3355 ? 0 : (-1);
    bool _3359 = _2777 == 0;
    out.m_76.x = _3219;
    out.m_76.y = _3245;
    out.m_76.z = _3337;
    int _3361 = ~int(_3353);
    int _3363 = _3361 + 1;
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3367 = ~_3309;
    int _3369 = _3367 + _3357;
    int _3371 = _3369 + 1;
    out.m_78.x = _3243;
    out.m_78.y = _3257;
    out.m_78.z = _3259;
    int _3373 = _3059 ^ _2931;
    bool _3375 = !_3359;
    int _3377 = _3375 ? _3343 : (-1);
    int _3379 = _2931 * _3371;
    int _3381 = _3379 + _3059;
    bool _3383 = !_3313;
    int _3385 = _3383 ? 0 : (-1);
    float _3387 = _3351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3389 = _3349 ^ _3363;
    float _3391 = _3299 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3393 = uint(int(uint(_3373) >> uint(31)));
    float _3395 = float(_3377);
    bool _3397 = _2931 == 0;
    float _3399 = _3365 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3401 = _2777 == 0;
    float _3403 = fma(_3387, _3395, _413);
    int _3405 = ~_3363;
    int _3407 = _3405 + _3389;
    int _3409 = _3407 + 1;
    int _3411 = ~_3385;
    int _3413 = _3291 + _3411;
    int _3415 = _3413 + 1;
    int _3417 = ~int(_3393);
    int _3419 = _3417 + 1;
    float _3421 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3423 = !_3397;
    int _3425 = _3423 ? _3381 : (-1);
    bool _3427 = !_3401;
    int _3429 = _3427 ? _3409 : (-1);
    int _3431 = _3415 ^ _3419;
    float _3433 = float(_3425);
    float _3435 = _3155 + 0.5;
    float _3437 = float(_3429);
    bool _3439 = _2931 == 0;
    float _3441 = fma(_3387, _3435, _3403);
    int _3443 = ~_3419;
    int _3445 = _3443 + _3431;
    int _3447 = _3445 + 1;
    float _3449 = -_917;
    float _3451 = fma(_3399, _3437, _3449);
    float _3453 = fma(_3391, _3433, _941);
    float _3455 = _3133 + 0.5;
    bool _3457 = !_3439;
    int _3459 = _3457 ? _3447 : (-1);
    float _3461 = _3421 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3463 = _2967 + (-0.5);
    float _3465 = fma(_3391, _3455, _3453);
    float _3467 = float(_3459);
    float _3469 = _1231 + (-0.5);
    float _3471 = -_3399;
    float _3473 = fma(_3471, _3463, _3451);
    float _3475 = -_3317;
    float _3477 = fma(_3133, _3475, _3465);
    float _3479 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3481 = -_943;
    float _3483 = fma(_3461, _3467, _3481);
    float _3485 = fma(_1767, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3333);
    float _3487 = _1811 + _1781;
    float _3489 = _1781 * 0.5;
    float _3491 = -_3461;
    float _3493 = fma(_3491, _3469, _3483);
    float _3495 = _3479 * _1843;
    bool _3497 = _1525 > 0.0;
    bool _3499 = isnan(_1525);
    bool _3501 = _3497 || _3499;
    bool _3503 = isnan(0.0);
    bool _3505 = _3501 || _3503;
    float _3507 = _3487 * 0.5;
    float _3509 = fma(_1821, -0.5, _3489);
    float _3511 = fma(_1231, _1902, _3493);
    float _3513 = _3485 + _1781;
    float _3515 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3517 = _1854 * _3495;
    float _3519 = _1864 * _3495;
    float _3521 = -_3479;
    float _3523 = _3521 + 1.0;
    float _3525 = -_1906;
    float _3527 = fma(_3155, _3525, _3441);
    out.gl_Position.x = _1811;
    out.gl_Position.y = _1821;
    out.gl_Position.z = _3485;
    out.gl_Position.w = _1781;
    float _3529 = fma(_2967, _1910, _3473);
    float _3531 = _3513 * 0.5;
    float _3533 = _3515 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3535 = fma(_1860, _3517, _1848);
    float _3537 = fma(_1862, _3517, _1850);
    float _3539 = _1854 * _3523;
    float _3541 = fma(_1854, _3519, _1852);
    out.m_80.x = _3507;
    out.m_80.y = _3509;
    out.m_80.z = _3531;
    out.m_80.w = _1781;
    out.m_82.x = _3527;
    out.m_82.y = _3529;
    out.m_82.z = _3477;
    out.m_82.w = _3511;
    out.m_45.x = _3533;
    out.m_84.x = _3535;
    out.m_84.y = _3537;
    out.m_84.z = _3541;
    out.m_84.w = _3539;
    if (_3505)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3543 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3543;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

