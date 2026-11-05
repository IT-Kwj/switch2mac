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
    float4 m_66 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_76 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_54 [[attribute(5)]];
    float4 m_42 [[attribute(6)]];
    float4 m_47 [[attribute(7)]];
    float4 m_49 [[attribute(8)]];
    float4 m_62 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _617 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_111);
        out.gl_Position.z = _2245;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2313 = as_type<float>(_147);
        out.gl_Position.z = _2313;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = in.m_49.x;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = in.m_54.x;
    float _159 = in.m_54.y;
    float _161 = in.m_54.z;
    float _163 = in.m_56.x;
    float _165 = in.m_56.y;
    float _167 = in.m_56.z;
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    float _175 = _153 * _151;
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    int _185 = as_type<int>(_155) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_155) & 2;
    bool _191 = _189 != 0;
    float _193 = _183 * 6.283185482025146484375;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = floor(_183);
    float _201 = _193 * 0.15915493667125701904296875;
    bool _203 = !_191;
    float _205 = _203 ? (-0.5) : 0.5;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _213 = _211 != 0;
    float _215 = _201 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = _159 * _165;
    float _221 = _159 * _171;
    bool _223 = !_197;
    int _225 = _223 ? 0 : 1;
    bool _227 = !_209;
    int _229 = _227 ? 0 : 1;
    float _231 = _159 * _179;
    float _233 = fma(_157, _163, _219);
    float _235 = fma(_157, _169, _221);
    int _237 = abs(_229);
    float _239 = fma(_157, _177, _231);
    float _241 = -_199;
    float _243 = _183 + _241;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = fma(_161, _167, _233);
    float _249 = -_243;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _253 = abs(_225);
    float _255 = fma(_217, 0.5, 0.5);
    float _257 = float(_237);
    float _259 = fma(_161, _181, _239);
    bool _261 = !_213;
    int _263 = _261 ? 0 : 1;
    bool _265 = _243 < 0.5;
    float _267 = float(_265);
    float _269 = abs(_251);
    float _271 = _257 * _269;
    int _273 = abs(_263);
    float _275 = -_255;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = float(_253);
    float _281 = -_267;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = float(_273);
    bool _287 = !_187;
    float _289 = _287 ? (-0.5) : 0.5;
    float _291 = fma(_279, _277, _271);
    float _293 = fma(_161, _173, _235);
    float _295 = abs(_283);
    float _297 = fma(_285, _295, _291);
    bool _299 = !_245;
    float _301 = _247;
    float _303 = _259;
    float _305 = _149;
    float _321;
    if (!_299)
    {
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_95);
        float _327 = 1.0 / _325;
        float _329 = _129 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _331 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = _331 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = 1.0 / _343;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _359;
    bool _363 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _365 = isnan(_331);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = 1.0 / _347;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = _331 + _377;
    bool _381 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _383 = isnan(_331);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = 1.0 / _351;
    float _395 = _379 * _357;
    bool _397 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _399 = isnan(_331);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    bool _409 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _411 = isnan(_331);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _423 = -_407;
    float _425 = _423 + 1.0;
    float _427 = 1.0 / _355;
    float _429 = _335 * _375;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _433 = _331 + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _437 = _331 + _435;
    float _439 = -_419;
    float _441 = _439 + 1.0;
    float _443 = 1.0 / _361;
    float _445 = _339 * _393;
    bool _447 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _449 = isnan(_331);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _391 * _441;
    float _461 = -_391;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _465;
    float _469 = _433 * _427;
    float _471 = _457 * _425;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _477;
    float _481 = _373 * _475;
    float _483 = -_373;
    float _485 = _483 + 1.0;
    float _487 = _437 * _443;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _489;
    float _493 = fma(_479, _395, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _495 = fma(_491, _395, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _497 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _499 = isnan(_331);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _419 * _485;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = _507 * _463;
    float _521 = -_507;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _525;
    float _529 = fma(_513, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = _495 * _519;
    float _533 = _493 * _519;
    float _535 = fma(_527, _445, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _541 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[143].x, _531);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _547 = fma(_517, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _549 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[143].y, _533);
    float _551 = fma(_467, _445, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _553 = fma(_545, _469, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _555 = fma(_539, _469, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _557 = fma(_529, _459, _541);
    float _559 = fma(_547, _459, _549);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _565;
    float _569 = fma(_535, _509, _557);
    float _571 = fma(_551, _509, _559);
    float _573 = fma(_563, _487, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _575 = fma(_567, _487, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _577 = fma(_553, _481, _569);
    float _579 = fma(_555, _481, _571);
    float _581 = fma(_573, _471, _577);
    float _583 = fma(_575, _471, _579);
    float _585 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].x, _581);
    float _587 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].y, _583);
    bool _589 = !_421;
    float _591 = _585;
    float _613;
    float _615;
    if (!_589)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _595 = float(_95);
        float _597 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _601 = 1.0 / _595;
        float _603 = _599 * _593;
        float _605 = floor(_603);
        float _607 = _129 * _601;
        float _609 = -_605;
        float _611 = _603 + _609;
        _613 = _611;
        _615 = _607;
        _617 = true;
    }
    else
    {
        float _619 = float(_95);
        float _621 = 1.0 / _619;
        float _623 = _129 * _621;
        _613 = _623;
        _615 = _623;
    }
    _617 = false;
    float _625 = _613;
    float _627 = _615;
    float _629 = in.m_62.x;
    float _631 = in.m_62.y;
    float _633 = in.m_42.x;
    float _635 = in.m_42.y;
    float _637 = in.m_42.z;
    float _639 = in.m_56.w;
    float _641 = in.m_49.y;
    float _643 = in.m_58.w;
    float _645 = _585 * _629;
    float _647 = _587 * _631;
    float _649 = in.m_60.w;
    float _651 = _297 * _645;
    float _653 = _297 * _647;
    float _655 = _165 * _635;
    float _657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _659 = _179 * _635;
    float _661 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _663 = fma(_163, _633, _655);
    float _665 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _289);
    float _667 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _669 = _661 * _657;
    float _671 = fma(_177, _633, _659);
    float _673 = fma(_167, _637, _663);
    float _675 = _667 * _665;
    float _677 = _669 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _679 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _681 = _669 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _683 = in.m_49.z;
    float _685 = in.m_49.w;
    float _687 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[26].x, _677);
    float _689 = fma(_181, _637, _671);
    float _691 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[24].x, _681);
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].z, _687);
    float _695 = _673 + _639;
    float _697 = _689 + _649;
    float _699 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].z, _691);
    float _701 = _693 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _705 = _703 != 0;
    float _707 = _171 * _635;
    float _709 = _699 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _711 = _697 + _701;
    float _713 = fma(_169, _633, _707);
    float _715 = _695 + _709;
    float _717 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _719 = _711 + _717;
    float _721 = fma(_173, _637, _713);
    float _723 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _725 = _715 + _723;
    float _727 = _719 * _719;
    float _729 = _669 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _731 = _639;
    float _733 = _727;
    if (!_705)
    {
        _731 = _641;
    }
    float _735 = _731;
    float _737 = _721 + _643;
    float _739 = fma(_725, _725, _727);
    bool _741 = _683 > 0.5;
    bool _743 = _685 > 0.5;
    float _745 = sqrt(_739);
    float _747 = _735;
    if (!_705)
    {
        _591 = _735;
    }
    float _749 = _591;
    float _751 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[25].x, _729);
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _755 = _753 != 0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _763 = _761 != 0;
    float _765 = _737 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _767 = -_205;
    int _769 = _743 ? as_type<int>(_767) : as_type<int>(_205);
    float _771 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].z, _751);
    float _773 = -_205;
    int _775 = _741 ? as_type<int>(_773) : as_type<int>(_205);
    float _777 = _765;
    float _779 = _749;
    if (_705)
    {
        _747 = _641;
    }
    float _781 = _747;
    float _783 = _771 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _785 = !_755;
    float _787 = _785 ? _205 : as_type<float>(_769);
    bool _789 = !_763;
    float _791 = _789 ? _205 : as_type<float>(_775);
    float _793 = _737 + _783;
    bool _795 = _149 > 0.5;
    bool _797 = _781 > 0.5;
    float _799 = -_289;
    int _801 = _795 ? as_type<int>(_799) : as_type<int>(_289);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _809 = _807 != 0;
    bool _811 = _745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = -_205;
    int _815 = _797 ? as_type<int>(_813) : as_type<int>(_205);
    bool _817 = !_805;
    float _819 = _817 ? _289 : as_type<float>(_801);
    bool _821 = !_809;
    float _823 = _821 ? _205 : as_type<float>(_815);
    float _825 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[11].x, _765);
    float _827 = -_289;
    float _829 = _797 ? _827 : _289;
    float _831 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _825);
    bool _833 = !_759;
    float _835 = _833 ? _289 : _829;
    float _837 = _825;
    float _839 = _829;
    float _841 = _831;
    if (!_811)
    {
        _837 = _715;
    }
    float _843 = _837;
    float _845 = _843;
    if (!_811)
    {
        _733 = _711;
    }
    float _847 = _733;
    float _849 = _847;
    if (!_811)
    {
        _839 = _793;
    }
    float _851 = _839;
    bool _853 = !_811;
    float _855 = _851;
    if (!_853)
    {
        float _857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _861 = _745 + _859;
        float _863 = _793 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _865 = rsqrt(_739);
        float _867 = _861 * _857;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = _869 * 6.283185482025146484375;
        float _873 = sin(_871);
        float _875 = _869 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = fma(_873, _863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _881 = _865 * _879;
        float _883 = _877 + (-1.0);
        float _885 = fma(_725, _881, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _887 = fma(_719, _881, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _889 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _891 = fma(_793, _877, _889);
        _855 = _891;
        _845 = _885;
        _849 = _887;
    }
    float _893 = _855;
    float _895 = _845;
    float _897 = _849;
    float _899 = -_737;
    float _901 = _899 + _893;
    float _903 = -_695;
    float _905 = _903 + _895;
    float _907 = _831 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _909 = _737 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _911 = _901 * _901;
    float _913 = -_697;
    float _915 = _913 + _897;
    float _917 = 1.0 / _907;
    float _919 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[10].x, _909);
    float _921 = fma(_905, _905, _911);
    float _923 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _919);
    float _925 = fma(_915, _915, _921);
    bool _927 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _929 = isnan(0.5);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _935 = _931 || _933;
    float _937 = _923 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _939 = sqrt(_925);
    bool _941 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _943 = isnan(0.5);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _949 = _945 || _947;
    float _951 = _937 + _907;
    float _953 = _951 * _917;
    float _955 = _953 * 0.5;
    float _957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _959 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[30].w, _957);
    bool _961 = _939 > 0.0;
    float _963 = 1.0 / _959;
    float _965 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _967 = _893;
    float _969 = _897;
    float _971 = _939;
    float _973 = _895;
    if (!_961)
    {
        _965 = _895;
    }
    float _975 = _965;
    bool _977 = !_961;
    float _979 = _975;
    if (!_977)
    {
        float _981 = _293 * _293;
        float _983 = rsqrt(_925);
        float _985 = fma(_247, _247, _981);
        float _987 = fma(_259, _259, _985);
        float _989 = sqrt(_987);
        float _991 = _905 * _983;
        float _993 = _901 * _983;
        float _995 = _915 * _983;
        bool _997 = _989 > 0.0;
        float _999 = _989;
        _971 = _983;
        _777 = _995;
        _841 = _987;
        if (!_997)
        {
            _999 = _895;
        }
        float _1001 = _999;
        bool _1003 = !_997;
        _979 = _1001;
        if (!_1003)
        {
            float _1005 = rsqrt(_987);
            float _1007 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1009 = _293 * _1005;
            float _1011 = _247 * _1005;
            float _1013 = _993 * _1009;
            float _1015 = _259 * _1005;
            float _1017 = fma(_991, _1011, _1013);
            float _1019 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1021 = fma(_995, _1015, _1017);
            float _1023 = _1021 * _1019;
            float _1025 = fma(_247, _1023, _895);
            float _1027 = fma(_293, _1023, _893);
            float _1029 = fma(_259, _1023, _897);
            _979 = _1025;
            _967 = _1027;
            _969 = _1029;
            _971 = _1011;
            _841 = _1005;
        }
    }
    float _1031 = _979;
    float _1033 = _967;
    float _1035 = _969;
    float _1037 = _971;
    float _1039 = _777;
    float _1041 = _841;
    float _1043 = _1041;
    float _1045 = _1037;
    float _1047 = _1035;
    float _1049 = _1033;
    float _1051 = _1039;
    if (_949)
    {
        _1043 = 1.0;
    }
    float _1053 = _1043;
    float _1055 = _1053;
    if (_935)
    {
        _301 = _1031;
    }
    float _1057 = _301;
    float _1059 = _1057;
    if (_935)
    {
        _1045 = _1033;
    }
    float _1061 = _1045;
    float _1063 = _1061;
    if (_935)
    {
        _973 = _1035;
    }
    float _1065 = _973;
    float _1067 = _1065;
    if (!_935)
    {
        float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1071 = _737 + _1069;
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1075 = _695 + _1073;
        float _1077 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1079 = -_697;
        float _1081 = _1079 + _1035;
        float _1083 = _1071 * _1071;
        float _1085 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1087 = _697 + _1085;
        float _1089 = fma(_1075, _1075, _1083);
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1093 = fma(_1087, _1087, _1089);
        float _1095 = sqrt(_1093);
        float _1097 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1099 = precise::min(_1095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1101 = _1099 * _1091;
        float _1103 = -_695;
        float _1105 = _1103 + _1031;
        float _1107 = _1097 * _1101;
        float _1109 = -_737;
        float _1111 = _1109 + _1033;
        float _1113 = fma(_1105, _1107, _695);
        float _1115 = fma(_1111, _1107, _737);
        float _1117 = fma(_1081, _1107, _697);
        _1063 = _1115;
        _1059 = _1113;
        _1067 = _1117;
        _1047 = _1081;
    }
    float _1119 = _1063;
    float _1121 = _1059;
    float _1123 = _1067;
    float _1125 = _1047;
    float _1127 = _1125;
    if (_949)
    {
        _1049 = 1.0;
    }
    float _1129 = _1049;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1133 = _963 * _1131;
    float _1135 = _1129;
    if (!_949)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = _1139 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 0.15915493667125701904296875;
        float _1149 = _1139 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = 1.0 / _1145;
        float _1155 = _1147 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = _1151 * _1153;
        float _1161 = _1147 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1167 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1165;
        float _1169 = _1157 * _1159;
        float _1171 = 1.0 / _1167;
        float _1173 = 1.0 / _1169;
        float _1175 = _1163 * _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1179 = fma(_1133, _1175, _1177);
        float _1181 = _1179 * _1171;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        _303 = _1159;
        _1127 = _1147;
        _1055 = _1183;
    }
    float _1185 = _303;
    float _1187 = _1127;
    float _1189 = _1055;
    float _1191 = _1187;
    float _1193 = _1185;
    if (!_949)
    {
        float _1195 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1197 = _1195 * 0.15915493667125701904296875;
        float _1199 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1201 = _1197 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = _1199 * 0.15915493667125701904296875;
        float _1207 = _1197 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = 1.0 / _1203;
        float _1213 = _1205 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = _1209 * _1211;
        float _1219 = _1205 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1215 * _1217;
        float _1225 = 1.0 / _1223;
        float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1229 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1227;
        float _1231 = 1.0 / _1229;
        float _1233 = _1221 * _1225;
        float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1237 = fma(_1133, _1233, _1235);
        float _1239 = _1237 * _1231;
        float _1241 = precise::clamp(_1239, 0.0, 1.0);
        float _1243 = -_1241;
        float _1245 = _1243 + 1.0;
        _1191 = _1223;
        _1193 = _1233;
        _1135 = _1245;
    }
    float _1247 = _1191;
    float _1249 = _1193;
    float _1251 = _1135;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1255 = _1119 + _1253;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1259 = _1121 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1263 = _1123 + _1261;
    float _1265 = _1255 * _1255;
    float _1267 = fma(_1259, _1259, _1265);
    float _1269 = fma(_1263, _1263, _1267);
    float _1271 = rsqrt(_1269);
    float _1273 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1275 = _1259 * _1273;
    float _1277 = _1263 * _1273;
    float _1279 = _1275 * _1275;
    float _1281 = _1277 * _1277;
    float _1283 = _1279 + _1281;
    float _1285 = sqrt(_1283);
    bool _1287 = _1285 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = _1285 + _1289;
    float _1293 = _1263;
    float _1295 = _1283;
    float _1297 = _1291;
    float _1299 = _1247;
    float _1301 = _1255;
    float _1303 = _1249;
    if (_1287)
    {
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1305;
    }
    float _1307 = _1293;
    if (_1287)
    {
        float _1309 = rsqrt(_1283);
        _1295 = _1309;
    }
    float _1311 = _1295;
    float _1313 = _1311;
    if (_1287)
    {
        float _1315 = _1291 * _1307;
        _1297 = _1315;
    }
    float _1317 = _1297;
    if (_1287)
    {
        float _1319 = _1317 * 0.15915493667125701904296875;
        _1299 = _1319;
    }
    float _1321 = _1299;
    float _1323 = _1307;
    if (_1287)
    {
        float _1325 = _1321 * 6.283185482025146484375;
        float _1327 = sin(_1325);
        _1323 = _1327;
    }
    float _1329 = _1323;
    float _1331 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1333 = precise::max(0.0, _1331);
    float _1335 = _1271;
    float _1337 = _1333;
    if (_1287)
    {
        float _1339 = _1321 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        _1335 = _1341;
    }
    float _1343 = _1335;
    float _1345 = -_1273;
    float _1347 = -_1333;
    float _1349 = fma(_1255, _1345, _1347);
    if (_1287)
    {
        float _1351 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1351;
    }
    float _1353 = _1337;
    float _1355 = sqrt(_1269);
    float _1357 = _1329;
    float _1359 = _1353;
    if (_1287)
    {
        float _1361 = fma(_1329, _1353, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1301 = _1361;
    }
    float _1363 = _1301;
    float _1365 = _1363;
    if (!_1287)
    {
        _1357 = _1275;
    }
    float _1367 = _1357;
    float _1369 = _1367;
    float _1371 = _1343;
    if (_1287)
    {
        float _1373 = _1343 + (-1.0);
        _1359 = _1373;
    }
    float _1375 = _1359;
    float _1377 = _1375;
    if (_1287)
    {
        float _1379 = _1311 * _1363;
        _1051 = _1379;
    }
    float _1381 = _1051;
    if (!_1287)
    {
        _1365 = _1349;
    }
    float _1383 = _1365;
    float _1385 = _1383;
    if (_1287)
    {
        float _1387 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1303 = _1387;
    }
    float _1389 = _1303;
    if (_1287)
    {
        float _1391 = _1275 * _1381;
        _1369 = _1391;
    }
    float _1393 = _1369;
    if (!_1287)
    {
        _1377 = _1277;
    }
    float _1395 = _1377;
    float _1397 = _1395;
    if (_1287)
    {
        float _1399 = _1277 * _1381;
        _1397 = _1399;
    }
    float _1401 = _1397;
    if (!_1287)
    {
        _1313 = _1279;
    }
    float _1403 = _1313;
    float _1405 = _1403;
    if (_1287)
    {
        float _1407 = fma(_1349, _1343, _1389);
        _1385 = _1407;
    }
    float _1409 = _1385;
    if (_1287)
    {
        float _1411 = _1393 * _1393;
        _1405 = _1411;
    }
    float _1413 = _1405;
    if (!_1287)
    {
        _1371 = _1281;
    }
    float _1415 = _1371;
    float _1417 = _1415;
    if (_1287)
    {
        float _1419 = _1401 * _1401;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1423 + _1421;
    float _1427 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1431 = fma(_1355, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1429);
    float _1433 = precise::clamp(_1431, 0.0, 1.0);
    float _1435 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1437 = rsqrt(_1425);
    float _1439 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1427);
    float _1441 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1443 = -_1433;
    float _1445 = _1443 + 1.0;
    float _1447 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1449 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1451 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1435);
    float _1453 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1455 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1441);
    float _1457 = abs(_1445);
    float _1459 = log2(_1457);
    float _1461 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1451);
    float _1463 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1453);
    float _1465 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1455);
    float _1467 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1469 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1471 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1463);
    float _1473 = _1437 * _1393;
    float _1475 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1479 = _1437 * _1409;
    float _1481 = _1473 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1483 = _1437 * _1401;
    float _1485 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1477);
    float _1487 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = -_1481;
    float _1491 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1489);
    float _1493 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1495 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1497 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1499 = -_1483;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1491);
    float _1503 = -_1487;
    float _1505 = fma(_1503, _1447, 1.0);
    float _1507 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1495);
    float _1509 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1511 = fma(_1501, -0.5, 0.5);
    float _1513 = exp2(_1497);
    float _1515 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1517 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1509);
    float _1519 = fma(_1501, 0.5, 0.5);
    float _1521 = _1479 + 1.0;
    float _1523 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1515);
    float _1525 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1517);
    float _1527 = fma(_1519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1529 = log2(_1505);
    float _1531 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1523);
    float _1533 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1525);
    float _1535 = fma(_1519, _1527, -0.212114393711090087890625);
    float _1537 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1531);
    float _1539 = fma(_1519, _1535, 1.570728778839111328125);
    float _1541 = 1.0 / _1507;
    float _1543 = -_1479;
    float _1545 = fma(_1513, _1521, _1543);
    float _1547 = fma(_1545, 0.5, 0.5);
    float _1549 = sqrt(_1511);
    float _1551 = _1529 * 0.693147182464599609375;
    float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1555 = _1533 * _1541;
    float _1557 = _1537 * _1541;
    float _1559 = fma(_1555, 0.5, 0.5);
    float _1561 = fma(_1557, -0.5, 0.5);
    float _1563 = _1549 * 0.636619746685028076171875;
    float _1565 = -_1539;
    float _1567 = fma(_1563, _1565, 1.0);
    float3 _4498 = float3(_1559, _1561, _1553);
    float _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4498, float3(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4498, float3(0.0), isnan(_4498)), level(0.0)).x;
    float3 _4509 = float3(_1559, _1561, _1553);
    float4 _1572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4509, float3(0.0), isnan(_4509)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4509, float3(0.0), isnan(_4509)), level(0.0)).xyzw;
    float _1574 = _1572.x;
    float _1576 = _1572.y;
    float _1578 = _1572.z;
    float _1580 = _1572.w;
    float2 _4526 = float2(_1567, _1547);
    float3 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4526, float2(0.0), isnan(_4526)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4526, float2(0.0), isnan(_4526)), level(0.0)).xyz;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1594 = _625 + _1592;
    float _1596 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1598;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1604 = _1602 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1610 = 1.0 / _1600;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1618 = 1.0 / _1604;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1636 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = 1.0 / _1608;
    float _1642 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1646 = _1644 != 0;
    float _1648 = _1594 * _1610;
    float _1650 = _819 + 0.5;
    out.m_64.x = _1636;
    out.m_64.y = _1638;
    out.m_64.z = _1642;
    float _1652 = 1.0 / _1634;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1666 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1668 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1670 = isnan(_627);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = _1664 * _1618;
    float _1682 = 1.0 / _1622;
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1692;
    bool _1696 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1698 = isnan(_627);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1704 = _1700 || _1702;
    float _1706 = float(_1704);
    float _1708 = -_1678;
    float _1710 = _1708 + 1.0;
    float _1712 = 1.0 / _1626;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1722 = -_289;
    int _1724 = _741 ? as_type<int>(_1722) : as_type<int>(_289);
    float _1726 = -_791;
    float _1728 = _1726 + 0.5;
    float _1730 = _1716 * _1640;
    float _1732 = _1720 * _1652;
    bool _1734 = !_1646;
    float _1736 = _1734 ? _289 : as_type<float>(_1724);
    float _1738 = 1.0 / _1630;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1740;
    float _1744 = _1686 * _1682;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1748 = _627 + _1746;
    float _1750 = fma(_1742, _1648, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1752 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1754 = isnan(_627);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1766 = _627 + _1764;
    float _1768 = 1.0 / _1656;
    float _1770 = _1690 * _1712;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1772;
    float _1776 = -_1762;
    float _1778 = _1776 + 1.0;
    float _1780 = fma(_1744, _1766, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1784 = _627 + _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1786;
    float _1790 = _1660 * _1738;
    float _1792 = fma(_1774, _1648, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1794 = _1660;
    if (!_705)
    {
        float _1796 = in.m_49.z;
        _1794 = _1796;
    }
    float _1798 = _1794;
    float _1800 = fma(_1788, _1648, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1802 = fma(_1790, _1748, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1804 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1806 = isnan(_627);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = fma(_1770, _1784, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1820 = _627 + _1818;
    float _1822 = _1694 * _1768;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1826 = _627 + _1824;
    float _1828 = _1814 * _1778;
    float _1830 = -_1814;
    float _1832 = _1830 + 1.0;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1836 = _627 + _1834;
    float _1838 = fma(_1680, _1826, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1840 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1842 = isnan(_627);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = fma(_1732, _1820, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1854 = _1706 * _1710;
    float _1856 = fma(_1730, _1836, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1858 = -_1706;
    float _1860 = _1858 + 1.0;
    float _1862 = -_1850;
    float _1864 = _1862 + 1.0;
    float _1866 = _1850 * _1832;
    bool _1868 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1870 = isnan(_625);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1882 = _627 + _1880;
    float _1884 = _1678 * _1864;
    bool _1886 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1888 = isnan(_627);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = exp2(_1596);
    bool _1900 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1902 = isnan(_625);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1908 = _1904 || _1906;
    float _1910 = float(_1908);
    float _1912 = _835 + 0.5;
    bool _1914 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1916 = isnan(_627);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1922 = _1918 || _1920;
    float _1924 = float(_1922);
    float _1926 = _1896 * _1860;
    float _1928 = -_1896;
    float _1930 = _1928 + 1.0;
    bool _1932 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1934 = isnan(_627);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = -_1878;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1924;
    float _1950 = _1948 + 1.0;
    float _1952 = _1924 * _1930;
    if (_705)
    {
        _779 = _149;
    }
    float _1954 = _779;
    float _1956 = _1910 * _1946;
    float _1958 = fma(_1822, _1882, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1960 = _1942 * _1950;
    float _1962 = _1798;
    if (!_705)
    {
        _305 = _1798;
    }
    float _1964 = _305;
    float _1966 = _1750 * _1956;
    float _1968 = _1792 * _1956;
    float _1970 = _1800 * _1956;
    float _1972 = -_1910;
    float _1974 = _1972 + 1.0;
    float _1976 = _1964;
    if (_705)
    {
        _1976 = _781;
    }
    float _1978 = _1976;
    float _1980 = _1802 * _1960;
    if (_705)
    {
        _1962 = _781;
    }
    float _1982 = _1962;
    float _1984 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1966);
    float _1986 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1968);
    float _1988 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1970);
    float _1990 = -_1942;
    float _1992 = _1990 + 1.0;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2000 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1994);
    float _2002 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2004 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1980);
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2008 = -_1998;
    float _2010 = fma(_2002, 2.0, _2008);
    float _2012 = fma(_1838, _1952, _2004);
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2016 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2020 = fma(_1780, _1926, _2012);
    float _2022 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2006);
    float _2024 = -_129;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2010);
    float _2028 = fma(_2016, -2.0, _2018);
    float _2030 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2032 = _1736 + 0.5;
    float _2034 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1984);
    float _2036 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1986);
    float _2038 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1988);
    float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2042 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2000);
    float _2044 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2022);
    float _2046 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2028);
    float _2048 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2050 = fma(_2030, _2032, _2026);
    float _2052 = _787 + (-0.5);
    float _2054 = fma(_1816, _1854, _2020);
    float _2056 = _2034 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2058 = -_2048;
    float _2060 = -_2046;
    float _2062 = fma(_2058, _2052, _2060);
    float _2064 = fma(_1856, _1884, _2054);
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2070 = _2036 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2072 = fma(_1852, _1866, _2064);
    float _2074 = _2038 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2076 = _1666 * _2040;
    float _2078 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2080 = -_823;
    float _2082 = _2080 + 0.5;
    float _2084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2086 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2088 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2090 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2094 = -_1898;
    float _2096 = _2094 + 1.0;
    float _2098 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2078);
    float _2100 = -_2042;
    float _2102 = _2100 + 1.0;
    float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_66.x = _2086;
    out.m_66.y = _2088;
    out.m_66.z = _2090;
    out.m_66.w = _2068;
    float _2106 = -_2044;
    float _2108 = _2106 + 1.0;
    float _2110 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2112 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2098);
    float _2114 = -_2102;
    float _2116 = fma(_1736, _2114, _2050);
    float _2118 = fma(_787, _2108, _2062);
    float _2120 = fma(_1958, _1828, _2072);
    bool _2122 = _1189 > 0.0;
    bool _2124 = isnan(_1189);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan(0.0);
    bool _2130 = _2126 || _2128;
    float _2132 = _2110 * _2084;
    float _2134 = _1507 * 0.5;
    float _2136 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2120);
    bool _2138 = _1251 <= 0.0;
    bool _2140 = !_2130;
    bool _2142 = _2138 || _2140;
    float _2144 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2146 = _2092 * _2066;
    float _2148 = _1189 * _1251;
    float _2150 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2152 = fma(_1537, -0.5, _2134);
    float _2154 = _2144 * _2104;
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2158 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2112);
    out.m_68.x = _2076;
    out.m_68.y = _2146;
    out.m_68.z = _2116;
    out.m_68.w = _2118;
    float _2160 = -_2150;
    float _2162 = _2160 + 1.0;
    float _2164 = _1533 + _1507;
    float _2166 = _2158 + _1507;
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2170 = _2164 * 0.5;
    float _2172 = _2166 * 0.5;
    out.m_70.x = _2132;
    out.m_70.y = _2154;
    out.m_72.x = _2136;
    out.m_45.x = _2168;
    out.gl_Position.x = _1533;
    out.gl_Position.y = _1537;
    out.gl_Position.z = _2158;
    out.gl_Position.w = _1507;
    out.m_74.x = _2170;
    out.m_74.y = _2152;
    out.m_74.z = _2172;
    out.m_74.w = _1507;
    float _2174 = _2150 * _1569;
    float _2176 = _1580 * _2162;
    float _2178 = _1580 * _2174;
    float _2180 = _1590 * _2174;
    float _2182 = fma(_1586, _2178, _1574);
    float _2184 = fma(_1588, _2178, _1576);
    float _2186 = fma(_1580, _2180, _1578);
    out.m_76.x = _2182;
    out.m_76.y = _2184;
    out.m_76.z = _2186;
    out.m_76.w = _2176;
    if (!_2142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2188 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2188;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _617 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_111);
        out.gl_Position.z = _2245;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2313 = as_type<float>(_147);
        out.gl_Position.z = _2313;
    }
    if (_141)
    {
        return out;
    }
    float _149 = in.m_49.x;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = in.m_54.x;
    float _159 = in.m_54.y;
    float _161 = in.m_54.z;
    float _163 = in.m_56.x;
    float _165 = in.m_56.y;
    float _167 = in.m_56.z;
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    float _175 = _153 * _151;
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    int _185 = as_type<int>(_155) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_155) & 2;
    bool _191 = _189 != 0;
    float _193 = _183 * 6.283185482025146484375;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = floor(_183);
    float _201 = _193 * 0.15915493667125701904296875;
    bool _203 = !_191;
    float _205 = _203 ? (-0.5) : 0.5;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _213 = _211 != 0;
    float _215 = _201 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = _159 * _165;
    float _221 = _159 * _171;
    bool _223 = !_197;
    int _225 = _223 ? 0 : 1;
    bool _227 = !_209;
    int _229 = _227 ? 0 : 1;
    float _231 = _159 * _179;
    float _233 = fma(_157, _163, _219);
    float _235 = fma(_157, _169, _221);
    int _237 = abs(_229);
    float _239 = fma(_157, _177, _231);
    float _241 = -_199;
    float _243 = _183 + _241;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = fma(_161, _167, _233);
    float _249 = -_243;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _253 = abs(_225);
    float _255 = fma(_217, 0.5, 0.5);
    float _257 = float(_237);
    float _259 = fma(_161, _181, _239);
    bool _261 = !_213;
    int _263 = _261 ? 0 : 1;
    bool _265 = _243 < 0.5;
    float _267 = float(_265);
    float _269 = abs(_251);
    float _271 = _257 * _269;
    int _273 = abs(_263);
    float _275 = -_255;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = float(_253);
    float _281 = -_267;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = float(_273);
    bool _287 = !_187;
    float _289 = _287 ? (-0.5) : 0.5;
    float _291 = fma(_279, _277, _271);
    float _293 = fma(_161, _173, _235);
    float _295 = abs(_283);
    float _297 = fma(_285, _295, _291);
    bool _299 = !_245;
    float _301 = _247;
    float _303 = _259;
    float _305 = _149;
    float _321;
    if (!_299)
    {
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_95);
        float _327 = 1.0 / _325;
        float _329 = _129 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _331 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = _331 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = 1.0 / _343;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _359;
    bool _363 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _365 = isnan(_331);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = 1.0 / _347;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = _331 + _377;
    bool _381 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _383 = isnan(_331);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = 1.0 / _351;
    float _395 = _379 * _357;
    bool _397 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _399 = isnan(_331);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    bool _409 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _411 = isnan(_331);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _423 = -_407;
    float _425 = _423 + 1.0;
    float _427 = 1.0 / _355;
    float _429 = _335 * _375;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _433 = _331 + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _437 = _331 + _435;
    float _439 = -_419;
    float _441 = _439 + 1.0;
    float _443 = 1.0 / _361;
    float _445 = _339 * _393;
    bool _447 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _449 = isnan(_331);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _391 * _441;
    float _461 = -_391;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _465;
    float _469 = _433 * _427;
    float _471 = _457 * _425;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _477;
    float _481 = _373 * _475;
    float _483 = -_373;
    float _485 = _483 + 1.0;
    float _487 = _437 * _443;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _489;
    float _493 = fma(_479, _395, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _495 = fma(_491, _395, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _497 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _499 = isnan(_331);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _419 * _485;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = _507 * _463;
    float _521 = -_507;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _525;
    float _529 = fma(_513, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = _495 * _519;
    float _533 = _493 * _519;
    float _535 = fma(_527, _445, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _541 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[143].x, _531);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _547 = fma(_517, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _549 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[143].y, _533);
    float _551 = fma(_467, _445, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _553 = fma(_545, _469, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _555 = fma(_539, _469, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _557 = fma(_529, _459, _541);
    float _559 = fma(_547, _459, _549);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _565;
    float _569 = fma(_535, _509, _557);
    float _571 = fma(_551, _509, _559);
    float _573 = fma(_563, _487, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _575 = fma(_567, _487, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _577 = fma(_553, _481, _569);
    float _579 = fma(_555, _481, _571);
    float _581 = fma(_573, _471, _577);
    float _583 = fma(_575, _471, _579);
    float _585 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].x, _581);
    float _587 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].y, _583);
    bool _589 = !_421;
    float _591 = _585;
    float _613;
    float _615;
    if (!_589)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _595 = float(_95);
        float _597 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _601 = 1.0 / _595;
        float _603 = _599 * _593;
        float _605 = floor(_603);
        float _607 = _129 * _601;
        float _609 = -_605;
        float _611 = _603 + _609;
        _613 = _611;
        _615 = _607;
        _617 = true;
    }
    else
    {
        float _619 = float(_95);
        float _621 = 1.0 / _619;
        float _623 = _129 * _621;
        _613 = _623;
        _615 = _623;
    }
    _617 = false;
    float _625 = _613;
    float _627 = _615;
    float _629 = in.m_62.x;
    float _631 = in.m_62.y;
    float _633 = in.m_42.x;
    float _635 = in.m_42.y;
    float _637 = in.m_42.z;
    float _639 = in.m_56.w;
    float _641 = in.m_49.y;
    float _643 = in.m_58.w;
    float _645 = _585 * _629;
    float _647 = _587 * _631;
    float _649 = in.m_60.w;
    float _651 = _297 * _645;
    float _653 = _297 * _647;
    float _655 = _165 * _635;
    float _657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _659 = _179 * _635;
    float _661 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _663 = fma(_163, _633, _655);
    float _665 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _289);
    float _667 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _669 = _661 * _657;
    float _671 = fma(_177, _633, _659);
    float _673 = fma(_167, _637, _663);
    float _675 = _667 * _665;
    float _677 = _669 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _679 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _681 = _669 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _683 = in.m_49.z;
    float _685 = in.m_49.w;
    float _687 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[26].x, _677);
    float _689 = fma(_181, _637, _671);
    float _691 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[24].x, _681);
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].z, _687);
    float _695 = _673 + _639;
    float _697 = _689 + _649;
    float _699 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].z, _691);
    float _701 = _693 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _705 = _703 != 0;
    float _707 = _171 * _635;
    float _709 = _699 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _711 = _697 + _701;
    float _713 = fma(_169, _633, _707);
    float _715 = _695 + _709;
    float _717 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _719 = _711 + _717;
    float _721 = fma(_173, _637, _713);
    float _723 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _725 = _715 + _723;
    float _727 = _719 * _719;
    float _729 = _669 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _731 = _639;
    float _733 = _727;
    if (!_705)
    {
        _731 = _641;
    }
    float _735 = _731;
    float _737 = _721 + _643;
    float _739 = fma(_725, _725, _727);
    bool _741 = _683 > 0.5;
    bool _743 = _685 > 0.5;
    float _745 = sqrt(_739);
    float _747 = _735;
    if (!_705)
    {
        _591 = _735;
    }
    float _749 = _591;
    float _751 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[25].x, _729);
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _755 = _753 != 0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _763 = _761 != 0;
    float _765 = _737 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _767 = -_205;
    int _769 = _743 ? as_type<int>(_767) : as_type<int>(_205);
    float _771 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].z, _751);
    float _773 = -_205;
    int _775 = _741 ? as_type<int>(_773) : as_type<int>(_205);
    float _777 = _765;
    float _779 = _749;
    if (_705)
    {
        _747 = _641;
    }
    float _781 = _747;
    float _783 = _771 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _785 = !_755;
    float _787 = _785 ? _205 : as_type<float>(_769);
    bool _789 = !_763;
    float _791 = _789 ? _205 : as_type<float>(_775);
    float _793 = _737 + _783;
    bool _795 = _149 > 0.5;
    bool _797 = _781 > 0.5;
    float _799 = -_289;
    int _801 = _795 ? as_type<int>(_799) : as_type<int>(_289);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _809 = _807 != 0;
    bool _811 = _745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = -_205;
    int _815 = _797 ? as_type<int>(_813) : as_type<int>(_205);
    bool _817 = !_805;
    float _819 = _817 ? _289 : as_type<float>(_801);
    bool _821 = !_809;
    float _823 = _821 ? _205 : as_type<float>(_815);
    float _825 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[11].x, _765);
    float _827 = -_289;
    float _829 = _797 ? _827 : _289;
    float _831 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _825);
    bool _833 = !_759;
    float _835 = _833 ? _289 : _829;
    float _837 = _825;
    float _839 = _829;
    float _841 = _831;
    if (!_811)
    {
        _837 = _715;
    }
    float _843 = _837;
    float _845 = _843;
    if (!_811)
    {
        _733 = _711;
    }
    float _847 = _733;
    float _849 = _847;
    if (!_811)
    {
        _839 = _793;
    }
    float _851 = _839;
    bool _853 = !_811;
    float _855 = _851;
    if (!_853)
    {
        float _857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _861 = _745 + _859;
        float _863 = _793 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _865 = rsqrt(_739);
        float _867 = _861 * _857;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = _869 * 6.283185482025146484375;
        float _873 = sin(_871);
        float _875 = _869 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = fma(_873, _863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _881 = _865 * _879;
        float _883 = _877 + (-1.0);
        float _885 = fma(_725, _881, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _887 = fma(_719, _881, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _889 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _891 = fma(_793, _877, _889);
        _855 = _891;
        _845 = _885;
        _849 = _887;
    }
    float _893 = _855;
    float _895 = _845;
    float _897 = _849;
    float _899 = -_737;
    float _901 = _899 + _893;
    float _903 = -_695;
    float _905 = _903 + _895;
    float _907 = _831 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _909 = _737 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _911 = _901 * _901;
    float _913 = -_697;
    float _915 = _913 + _897;
    float _917 = 1.0 / _907;
    float _919 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[10].x, _909);
    float _921 = fma(_905, _905, _911);
    float _923 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _919);
    float _925 = fma(_915, _915, _921);
    bool _927 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _929 = isnan(0.5);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _935 = _931 || _933;
    float _937 = _923 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _939 = sqrt(_925);
    bool _941 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _943 = isnan(0.5);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _949 = _945 || _947;
    float _951 = _937 + _907;
    float _953 = _951 * _917;
    float _955 = _953 * 0.5;
    float _957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _959 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[30].w, _957);
    bool _961 = _939 > 0.0;
    float _963 = 1.0 / _959;
    float _965 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _967 = _893;
    float _969 = _897;
    float _971 = _939;
    float _973 = _895;
    if (!_961)
    {
        _965 = _895;
    }
    float _975 = _965;
    bool _977 = !_961;
    float _979 = _975;
    if (!_977)
    {
        float _981 = _293 * _293;
        float _983 = rsqrt(_925);
        float _985 = fma(_247, _247, _981);
        float _987 = fma(_259, _259, _985);
        float _989 = sqrt(_987);
        float _991 = _905 * _983;
        float _993 = _901 * _983;
        float _995 = _915 * _983;
        bool _997 = _989 > 0.0;
        float _999 = _989;
        _971 = _983;
        _777 = _995;
        _841 = _987;
        if (!_997)
        {
            _999 = _895;
        }
        float _1001 = _999;
        bool _1003 = !_997;
        _979 = _1001;
        if (!_1003)
        {
            float _1005 = rsqrt(_987);
            float _1007 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1009 = _293 * _1005;
            float _1011 = _247 * _1005;
            float _1013 = _993 * _1009;
            float _1015 = _259 * _1005;
            float _1017 = fma(_991, _1011, _1013);
            float _1019 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1021 = fma(_995, _1015, _1017);
            float _1023 = _1021 * _1019;
            float _1025 = fma(_247, _1023, _895);
            float _1027 = fma(_293, _1023, _893);
            float _1029 = fma(_259, _1023, _897);
            _979 = _1025;
            _967 = _1027;
            _969 = _1029;
            _971 = _1011;
            _841 = _1005;
        }
    }
    float _1031 = _979;
    float _1033 = _967;
    float _1035 = _969;
    float _1037 = _971;
    float _1039 = _777;
    float _1041 = _841;
    float _1043 = _1041;
    float _1045 = _1037;
    float _1047 = _1035;
    float _1049 = _1033;
    float _1051 = _1039;
    if (_949)
    {
        _1043 = 1.0;
    }
    float _1053 = _1043;
    float _1055 = _1053;
    if (_935)
    {
        _301 = _1031;
    }
    float _1057 = _301;
    float _1059 = _1057;
    if (_935)
    {
        _1045 = _1033;
    }
    float _1061 = _1045;
    float _1063 = _1061;
    if (_935)
    {
        _973 = _1035;
    }
    float _1065 = _973;
    float _1067 = _1065;
    if (!_935)
    {
        float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1071 = _737 + _1069;
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1075 = _695 + _1073;
        float _1077 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1079 = -_697;
        float _1081 = _1079 + _1035;
        float _1083 = _1071 * _1071;
        float _1085 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1087 = _697 + _1085;
        float _1089 = fma(_1075, _1075, _1083);
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1093 = fma(_1087, _1087, _1089);
        float _1095 = sqrt(_1093);
        float _1097 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1099 = precise::min(_1095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1101 = _1099 * _1091;
        float _1103 = -_695;
        float _1105 = _1103 + _1031;
        float _1107 = _1097 * _1101;
        float _1109 = -_737;
        float _1111 = _1109 + _1033;
        float _1113 = fma(_1105, _1107, _695);
        float _1115 = fma(_1111, _1107, _737);
        float _1117 = fma(_1081, _1107, _697);
        _1063 = _1115;
        _1059 = _1113;
        _1067 = _1117;
        _1047 = _1081;
    }
    float _1119 = _1063;
    float _1121 = _1059;
    float _1123 = _1067;
    float _1125 = _1047;
    float _1127 = _1125;
    if (_949)
    {
        _1049 = 1.0;
    }
    float _1129 = _1049;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1133 = _963 * _1131;
    float _1135 = _1129;
    if (!_949)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = _1139 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 0.15915493667125701904296875;
        float _1149 = _1139 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = 1.0 / _1145;
        float _1155 = _1147 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = _1151 * _1153;
        float _1161 = _1147 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1167 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1165;
        float _1169 = _1157 * _1159;
        float _1171 = 1.0 / _1167;
        float _1173 = 1.0 / _1169;
        float _1175 = _1163 * _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1179 = fma(_1133, _1175, _1177);
        float _1181 = _1179 * _1171;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        _303 = _1159;
        _1127 = _1147;
        _1055 = _1183;
    }
    float _1185 = _303;
    float _1187 = _1127;
    float _1189 = _1055;
    float _1191 = _1187;
    float _1193 = _1185;
    if (!_949)
    {
        float _1195 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1197 = _1195 * 0.15915493667125701904296875;
        float _1199 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1201 = _1197 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = _1199 * 0.15915493667125701904296875;
        float _1207 = _1197 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = 1.0 / _1203;
        float _1213 = _1205 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = _1209 * _1211;
        float _1219 = _1205 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1215 * _1217;
        float _1225 = 1.0 / _1223;
        float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1229 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1227;
        float _1231 = 1.0 / _1229;
        float _1233 = _1221 * _1225;
        float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1237 = fma(_1133, _1233, _1235);
        float _1239 = _1237 * _1231;
        float _1241 = precise::clamp(_1239, 0.0, 1.0);
        float _1243 = -_1241;
        float _1245 = _1243 + 1.0;
        _1191 = _1223;
        _1193 = _1233;
        _1135 = _1245;
    }
    float _1247 = _1191;
    float _1249 = _1193;
    float _1251 = _1135;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1255 = _1119 + _1253;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1259 = _1121 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1263 = _1123 + _1261;
    float _1265 = _1255 * _1255;
    float _1267 = fma(_1259, _1259, _1265);
    float _1269 = fma(_1263, _1263, _1267);
    float _1271 = rsqrt(_1269);
    float _1273 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1275 = _1259 * _1273;
    float _1277 = _1263 * _1273;
    float _1279 = _1275 * _1275;
    float _1281 = _1277 * _1277;
    float _1283 = _1279 + _1281;
    float _1285 = sqrt(_1283);
    bool _1287 = _1285 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = _1285 + _1289;
    float _1293 = _1263;
    float _1295 = _1283;
    float _1297 = _1291;
    float _1299 = _1247;
    float _1301 = _1255;
    float _1303 = _1249;
    if (_1287)
    {
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1305;
    }
    float _1307 = _1293;
    if (_1287)
    {
        float _1309 = rsqrt(_1283);
        _1295 = _1309;
    }
    float _1311 = _1295;
    float _1313 = _1311;
    if (_1287)
    {
        float _1315 = _1291 * _1307;
        _1297 = _1315;
    }
    float _1317 = _1297;
    if (_1287)
    {
        float _1319 = _1317 * 0.15915493667125701904296875;
        _1299 = _1319;
    }
    float _1321 = _1299;
    float _1323 = _1307;
    if (_1287)
    {
        float _1325 = _1321 * 6.283185482025146484375;
        float _1327 = sin(_1325);
        _1323 = _1327;
    }
    float _1329 = _1323;
    float _1331 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1333 = precise::max(0.0, _1331);
    float _1335 = _1271;
    float _1337 = _1333;
    if (_1287)
    {
        float _1339 = _1321 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        _1335 = _1341;
    }
    float _1343 = _1335;
    float _1345 = -_1273;
    float _1347 = -_1333;
    float _1349 = fma(_1255, _1345, _1347);
    if (_1287)
    {
        float _1351 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1351;
    }
    float _1353 = _1337;
    float _1355 = sqrt(_1269);
    float _1357 = _1329;
    float _1359 = _1353;
    if (_1287)
    {
        float _1361 = fma(_1329, _1353, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1301 = _1361;
    }
    float _1363 = _1301;
    float _1365 = _1363;
    if (!_1287)
    {
        _1357 = _1275;
    }
    float _1367 = _1357;
    float _1369 = _1367;
    float _1371 = _1343;
    if (_1287)
    {
        float _1373 = _1343 + (-1.0);
        _1359 = _1373;
    }
    float _1375 = _1359;
    float _1377 = _1375;
    if (_1287)
    {
        float _1379 = _1311 * _1363;
        _1051 = _1379;
    }
    float _1381 = _1051;
    if (!_1287)
    {
        _1365 = _1349;
    }
    float _1383 = _1365;
    float _1385 = _1383;
    if (_1287)
    {
        float _1387 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1303 = _1387;
    }
    float _1389 = _1303;
    if (_1287)
    {
        float _1391 = _1275 * _1381;
        _1369 = _1391;
    }
    float _1393 = _1369;
    if (!_1287)
    {
        _1377 = _1277;
    }
    float _1395 = _1377;
    float _1397 = _1395;
    if (_1287)
    {
        float _1399 = _1277 * _1381;
        _1397 = _1399;
    }
    float _1401 = _1397;
    if (!_1287)
    {
        _1313 = _1279;
    }
    float _1403 = _1313;
    float _1405 = _1403;
    if (_1287)
    {
        float _1407 = fma(_1349, _1343, _1389);
        _1385 = _1407;
    }
    float _1409 = _1385;
    if (_1287)
    {
        float _1411 = _1393 * _1393;
        _1405 = _1411;
    }
    float _1413 = _1405;
    if (!_1287)
    {
        _1371 = _1281;
    }
    float _1415 = _1371;
    float _1417 = _1415;
    if (_1287)
    {
        float _1419 = _1401 * _1401;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1423 + _1421;
    float _1427 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1431 = fma(_1355, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1429);
    float _1433 = precise::clamp(_1431, 0.0, 1.0);
    float _1435 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1437 = rsqrt(_1425);
    float _1439 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1427);
    float _1441 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1443 = -_1433;
    float _1445 = _1443 + 1.0;
    float _1447 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1449 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1451 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1435);
    float _1453 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1455 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1441);
    float _1457 = abs(_1445);
    float _1459 = log2(_1457);
    float _1461 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1451);
    float _1463 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1453);
    float _1465 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1455);
    float _1467 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1469 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1471 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1463);
    float _1473 = _1437 * _1393;
    float _1475 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1479 = _1437 * _1409;
    float _1481 = _1473 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1483 = _1437 * _1401;
    float _1485 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1477);
    float _1487 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = -_1481;
    float _1491 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1489);
    float _1493 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1495 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1497 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1499 = -_1483;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1491);
    float _1503 = -_1487;
    float _1505 = fma(_1503, _1447, 1.0);
    float _1507 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1495);
    float _1509 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1511 = fma(_1501, -0.5, 0.5);
    float _1513 = exp2(_1497);
    float _1515 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1517 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1509);
    float _1519 = fma(_1501, 0.5, 0.5);
    float _1521 = _1479 + 1.0;
    float _1523 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1515);
    float _1525 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1517);
    float _1527 = fma(_1519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1529 = log2(_1505);
    float _1531 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1523);
    float _1533 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1525);
    float _1535 = fma(_1519, _1527, -0.212114393711090087890625);
    float _1537 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1531);
    float _1539 = fma(_1519, _1535, 1.570728778839111328125);
    float _1541 = 1.0 / _1507;
    float _1543 = -_1479;
    float _1545 = fma(_1513, _1521, _1543);
    float _1547 = fma(_1545, 0.5, 0.5);
    float _1549 = sqrt(_1511);
    float _1551 = _1529 * 0.693147182464599609375;
    float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1555 = _1533 * _1541;
    float _1557 = _1537 * _1541;
    float _1559 = fma(_1555, 0.5, 0.5);
    float _1561 = fma(_1557, -0.5, 0.5);
    float _1563 = _1549 * 0.636619746685028076171875;
    float _1565 = -_1539;
    float _1567 = fma(_1563, _1565, 1.0);
    float3 _4498 = float3(_1559, _1561, _1553);
    float _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4498, float3(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4498, float3(0.0), isnan(_4498)), level(0.0)).x;
    float3 _4509 = float3(_1559, _1561, _1553);
    float4 _1572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4509, float3(0.0), isnan(_4509)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4509, float3(0.0), isnan(_4509)), level(0.0)).xyzw;
    float _1574 = _1572.x;
    float _1576 = _1572.y;
    float _1578 = _1572.z;
    float _1580 = _1572.w;
    float2 _4526 = float2(_1567, _1547);
    float3 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4526, float2(0.0), isnan(_4526)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4526, float2(0.0), isnan(_4526)), level(0.0)).xyz;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1594 = _625 + _1592;
    float _1596 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1598;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1604 = _1602 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1610 = 1.0 / _1600;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1618 = 1.0 / _1604;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1636 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = 1.0 / _1608;
    float _1642 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1646 = _1644 != 0;
    float _1648 = _1594 * _1610;
    float _1650 = _819 + 0.5;
    out.m_64.x = _1636;
    out.m_64.y = _1638;
    out.m_64.z = _1642;
    float _1652 = 1.0 / _1634;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1666 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1668 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1670 = isnan(_627);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = _1664 * _1618;
    float _1682 = 1.0 / _1622;
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1692;
    bool _1696 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1698 = isnan(_627);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1704 = _1700 || _1702;
    float _1706 = float(_1704);
    float _1708 = -_1678;
    float _1710 = _1708 + 1.0;
    float _1712 = 1.0 / _1626;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1722 = -_289;
    int _1724 = _741 ? as_type<int>(_1722) : as_type<int>(_289);
    float _1726 = -_791;
    float _1728 = _1726 + 0.5;
    float _1730 = _1716 * _1640;
    float _1732 = _1720 * _1652;
    bool _1734 = !_1646;
    float _1736 = _1734 ? _289 : as_type<float>(_1724);
    float _1738 = 1.0 / _1630;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1740;
    float _1744 = _1686 * _1682;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1748 = _627 + _1746;
    float _1750 = fma(_1742, _1648, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1752 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1754 = isnan(_627);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1766 = _627 + _1764;
    float _1768 = 1.0 / _1656;
    float _1770 = _1690 * _1712;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1772;
    float _1776 = -_1762;
    float _1778 = _1776 + 1.0;
    float _1780 = fma(_1744, _1766, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1784 = _627 + _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1786;
    float _1790 = _1660 * _1738;
    float _1792 = fma(_1774, _1648, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1794 = _1660;
    if (!_705)
    {
        float _1796 = in.m_49.z;
        _1794 = _1796;
    }
    float _1798 = _1794;
    float _1800 = fma(_1788, _1648, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1802 = fma(_1790, _1748, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1804 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1806 = isnan(_627);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = fma(_1770, _1784, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1820 = _627 + _1818;
    float _1822 = _1694 * _1768;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1826 = _627 + _1824;
    float _1828 = _1814 * _1778;
    float _1830 = -_1814;
    float _1832 = _1830 + 1.0;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1836 = _627 + _1834;
    float _1838 = fma(_1680, _1826, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1840 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1842 = isnan(_627);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = fma(_1732, _1820, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1854 = _1706 * _1710;
    float _1856 = fma(_1730, _1836, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1858 = -_1706;
    float _1860 = _1858 + 1.0;
    float _1862 = -_1850;
    float _1864 = _1862 + 1.0;
    float _1866 = _1850 * _1832;
    bool _1868 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1870 = isnan(_625);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1882 = _627 + _1880;
    float _1884 = _1678 * _1864;
    bool _1886 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1888 = isnan(_627);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = exp2(_1596);
    bool _1900 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1902 = isnan(_625);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1908 = _1904 || _1906;
    float _1910 = float(_1908);
    float _1912 = _835 + 0.5;
    bool _1914 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1916 = isnan(_627);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1922 = _1918 || _1920;
    float _1924 = float(_1922);
    float _1926 = _1896 * _1860;
    float _1928 = -_1896;
    float _1930 = _1928 + 1.0;
    bool _1932 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1934 = isnan(_627);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = -_1878;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1924;
    float _1950 = _1948 + 1.0;
    float _1952 = _1924 * _1930;
    if (_705)
    {
        _779 = _149;
    }
    float _1954 = _779;
    float _1956 = _1910 * _1946;
    float _1958 = fma(_1822, _1882, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1960 = _1942 * _1950;
    float _1962 = _1798;
    if (!_705)
    {
        _305 = _1798;
    }
    float _1964 = _305;
    float _1966 = _1750 * _1956;
    float _1968 = _1792 * _1956;
    float _1970 = _1800 * _1956;
    float _1972 = -_1910;
    float _1974 = _1972 + 1.0;
    float _1976 = _1964;
    if (_705)
    {
        _1976 = _781;
    }
    float _1978 = _1976;
    float _1980 = _1802 * _1960;
    if (_705)
    {
        _1962 = _781;
    }
    float _1982 = _1962;
    float _1984 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1966);
    float _1986 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1968);
    float _1988 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1970);
    float _1990 = -_1942;
    float _1992 = _1990 + 1.0;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2000 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1994);
    float _2002 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2004 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1980);
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2008 = -_1998;
    float _2010 = fma(_2002, 2.0, _2008);
    float _2012 = fma(_1838, _1952, _2004);
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2016 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2020 = fma(_1780, _1926, _2012);
    float _2022 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2006);
    float _2024 = -_129;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2010);
    float _2028 = fma(_2016, -2.0, _2018);
    float _2030 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2032 = _1736 + 0.5;
    float _2034 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1984);
    float _2036 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1986);
    float _2038 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1988);
    float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2042 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2000);
    float _2044 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2022);
    float _2046 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2028);
    float _2048 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2050 = fma(_2030, _2032, _2026);
    float _2052 = _787 + (-0.5);
    float _2054 = fma(_1816, _1854, _2020);
    float _2056 = _2034 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2058 = -_2048;
    float _2060 = -_2046;
    float _2062 = fma(_2058, _2052, _2060);
    float _2064 = fma(_1856, _1884, _2054);
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2070 = _2036 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2072 = fma(_1852, _1866, _2064);
    float _2074 = _2038 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2076 = _1666 * _2040;
    float _2078 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2080 = -_823;
    float _2082 = _2080 + 0.5;
    float _2084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2086 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2088 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2090 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2094 = -_1898;
    float _2096 = _2094 + 1.0;
    float _2098 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2078);
    float _2100 = -_2042;
    float _2102 = _2100 + 1.0;
    float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_66.x = _2086;
    out.m_66.y = _2088;
    out.m_66.z = _2090;
    out.m_66.w = _2068;
    float _2106 = -_2044;
    float _2108 = _2106 + 1.0;
    float _2110 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2112 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2098);
    float _2114 = -_2102;
    float _2116 = fma(_1736, _2114, _2050);
    float _2118 = fma(_787, _2108, _2062);
    float _2120 = fma(_1958, _1828, _2072);
    bool _2122 = _1189 > 0.0;
    bool _2124 = isnan(_1189);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan(0.0);
    bool _2130 = _2126 || _2128;
    float _2132 = _2110 * _2084;
    float _2134 = _1507 * 0.5;
    float _2136 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2120);
    bool _2138 = _1251 <= 0.0;
    bool _2140 = !_2130;
    bool _2142 = _2138 || _2140;
    float _2144 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2146 = _2092 * _2066;
    float _2148 = _1189 * _1251;
    float _2150 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2152 = fma(_1537, -0.5, _2134);
    float _2154 = _2144 * _2104;
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2158 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2112);
    out.m_68.x = _2076;
    out.m_68.y = _2146;
    out.m_68.z = _2116;
    out.m_68.w = _2118;
    float _2160 = -_2150;
    float _2162 = _2160 + 1.0;
    float _2164 = _1533 + _1507;
    float _2166 = _2158 + _1507;
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2170 = _2164 * 0.5;
    float _2172 = _2166 * 0.5;
    out.m_70.x = _2132;
    out.m_70.y = _2154;
    out.m_72.x = _2136;
    out.m_45.x = _2168;
    out.gl_Position.x = _1533;
    out.gl_Position.y = _1537;
    out.gl_Position.z = _2158;
    out.gl_Position.w = _1507;
    out.m_74.x = _2170;
    out.m_74.y = _2152;
    out.m_74.z = _2172;
    out.m_74.w = _1507;
    float _2174 = _2150 * _1569;
    float _2176 = _1580 * _2162;
    float _2178 = _1580 * _2174;
    float _2180 = _1590 * _2174;
    float _2182 = fma(_1586, _2178, _1574);
    float _2184 = fma(_1588, _2178, _1576);
    float _2186 = fma(_1580, _2180, _1578);
    out.m_76.x = _2182;
    out.m_76.y = _2184;
    out.m_76.z = _2186;
    out.m_76.w = _2176;
    if (!_2142)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2188 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2188;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _617 = false;
    bool _323 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2245 = as_type<float>(_111);
        out.gl_Position.z = _2245;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    if (_125)
    {
        float _133 = float(_95);
        _131 = _133;
    }
    float _135 = _131;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    if (_141)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _105;
    if (_141)
    {
        out.m_45.x = 0.0;
    }
    if (_141)
    {
        float _145 = _143 * 5.0;
        _113 = as_type<int>(_145);
    }
    int _147 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2313 = as_type<float>(_147);
        out.gl_Position.z = _2313;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = in.m_49.x;
    float _151 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _153 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = in.m_54.x;
    float _159 = in.m_54.y;
    float _161 = in.m_54.z;
    float _163 = in.m_56.x;
    float _165 = in.m_56.y;
    float _167 = in.m_56.z;
    float _169 = in.m_58.x;
    float _171 = in.m_58.y;
    float _173 = in.m_58.z;
    float _175 = _153 * _151;
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[20].x, _175);
    int _185 = as_type<int>(_155) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_155) & 2;
    bool _191 = _189 != 0;
    float _193 = _183 * 6.283185482025146484375;
    int _195 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _197 = _195 != 0;
    float _199 = floor(_183);
    float _201 = _193 * 0.15915493667125701904296875;
    bool _203 = !_191;
    float _205 = _203 ? (-0.5) : 0.5;
    int _207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _209 = _207 != 0;
    int _211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _213 = _211 != 0;
    float _215 = _201 * 6.283185482025146484375;
    float _217 = cos(_215);
    float _219 = _159 * _165;
    float _221 = _159 * _171;
    bool _223 = !_197;
    int _225 = _223 ? 0 : 1;
    bool _227 = !_209;
    int _229 = _227 ? 0 : 1;
    float _231 = _159 * _179;
    float _233 = fma(_157, _163, _219);
    float _235 = fma(_157, _169, _221);
    int _237 = abs(_229);
    float _239 = fma(_157, _177, _231);
    float _241 = -_199;
    float _243 = _183 + _241;
    bool _245 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _247 = fma(_161, _167, _233);
    float _249 = -_243;
    float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _253 = abs(_225);
    float _255 = fma(_217, 0.5, 0.5);
    float _257 = float(_237);
    float _259 = fma(_161, _181, _239);
    bool _261 = !_213;
    int _263 = _261 ? 0 : 1;
    bool _265 = _243 < 0.5;
    float _267 = float(_265);
    float _269 = abs(_251);
    float _271 = _257 * _269;
    int _273 = abs(_263);
    float _275 = -_255;
    float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _279 = float(_253);
    float _281 = -_267;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = float(_273);
    bool _287 = !_187;
    float _289 = _287 ? (-0.5) : 0.5;
    float _291 = fma(_279, _277, _271);
    float _293 = fma(_161, _173, _235);
    float _295 = abs(_283);
    float _297 = fma(_285, _295, _291);
    bool _299 = !_245;
    float _301 = _247;
    float _303 = _259;
    float _305 = _149;
    float _321;
    if (!_299)
    {
        float _307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _309 = _149 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _313 = _311 * _307;
        float _315 = floor(_313);
        float _317 = -_315;
        float _319 = _313 + _317;
        _321 = _319;
        _323 = true;
    }
    else
    {
        float _325 = float(_95);
        float _327 = 1.0 / _325;
        float _329 = _129 * _327;
        _321 = _329;
    }
    _323 = false;
    float _331 = _321;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _335 = _331 + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _339 = _331 + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = 1.0 / _343;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _361 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _359;
    bool _363 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _365 = isnan(_331);
    bool _367 = _363 || _365;
    bool _369 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _371 = _367 || _369;
    float _373 = float(_371);
    float _375 = 1.0 / _347;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = _331 + _377;
    bool _381 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _383 = isnan(_331);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    float _393 = 1.0 / _351;
    float _395 = _379 * _357;
    bool _397 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _399 = isnan(_331);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    bool _409 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _411 = isnan(_331);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    bool _421 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _423 = -_407;
    float _425 = _423 + 1.0;
    float _427 = 1.0 / _355;
    float _429 = _335 * _375;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _433 = _331 + _431;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _437 = _331 + _435;
    float _439 = -_419;
    float _441 = _439 + 1.0;
    float _443 = 1.0 / _361;
    float _445 = _339 * _393;
    bool _447 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _449 = isnan(_331);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = _391 * _441;
    float _461 = -_391;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _465;
    float _469 = _433 * _427;
    float _471 = _457 * _425;
    float _473 = -_457;
    float _475 = _473 + 1.0;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _477;
    float _481 = _373 * _475;
    float _483 = -_373;
    float _485 = _483 + 1.0;
    float _487 = _437 * _443;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _489;
    float _493 = fma(_479, _395, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _495 = fma(_491, _395, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _497 = _331 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _499 = isnan(_331);
    bool _501 = _497 || _499;
    bool _503 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _505 = _501 || _503;
    float _507 = float(_505);
    float _509 = _419 * _485;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = _507 * _463;
    float _521 = -_507;
    float _523 = _521 + 1.0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _525;
    float _529 = fma(_513, _429, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _531 = _495 * _519;
    float _533 = _493 * _519;
    float _535 = fma(_527, _445, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _539 = _537 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _541 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[143].x, _531);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _547 = fma(_517, _429, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _549 = fma(_523, (*spvDescriptorSet0.vp_c9)._m0[143].y, _533);
    float _551 = fma(_467, _445, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _553 = fma(_545, _469, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _555 = fma(_539, _469, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _557 = fma(_529, _459, _541);
    float _559 = fma(_547, _459, _549);
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _561;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _565;
    float _569 = fma(_535, _509, _557);
    float _571 = fma(_551, _509, _559);
    float _573 = fma(_563, _487, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _575 = fma(_567, _487, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _577 = fma(_553, _481, _569);
    float _579 = fma(_555, _481, _571);
    float _581 = fma(_573, _471, _577);
    float _583 = fma(_575, _471, _579);
    float _585 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].x, _581);
    float _587 = fma(_407, (*spvDescriptorSet0.vp_c9)._m0[148].y, _583);
    bool _589 = !_421;
    float _591 = _585;
    float _613;
    float _615;
    if (!_589)
    {
        float _593 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _595 = float(_95);
        float _597 = _149 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _599 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[11].x, _129);
        float _601 = 1.0 / _595;
        float _603 = _599 * _593;
        float _605 = floor(_603);
        float _607 = _129 * _601;
        float _609 = -_605;
        float _611 = _603 + _609;
        _613 = _611;
        _615 = _607;
        _617 = true;
    }
    else
    {
        float _619 = float(_95);
        float _621 = 1.0 / _619;
        float _623 = _129 * _621;
        _613 = _623;
        _615 = _623;
    }
    _617 = false;
    float _625 = _613;
    float _627 = _615;
    float _629 = in.m_62.x;
    float _631 = in.m_62.y;
    float _633 = in.m_42.x;
    float _635 = in.m_42.y;
    float _637 = in.m_42.z;
    float _639 = in.m_56.w;
    float _641 = in.m_49.y;
    float _643 = in.m_58.w;
    float _645 = _585 * _629;
    float _647 = _587 * _631;
    float _649 = in.m_60.w;
    float _651 = _297 * _645;
    float _653 = _297 * _647;
    float _655 = _165 * _635;
    float _657 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _659 = _179 * _635;
    float _661 = _653 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _663 = fma(_163, _633, _655);
    float _665 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _289);
    float _667 = _651 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _669 = _661 * _657;
    float _671 = fma(_177, _633, _659);
    float _673 = fma(_167, _637, _663);
    float _675 = _667 * _665;
    float _677 = _669 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _679 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _681 = _669 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _683 = in.m_49.z;
    float _685 = in.m_49.w;
    float _687 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[26].x, _677);
    float _689 = fma(_181, _637, _671);
    float _691 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[24].x, _681);
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].z, _687);
    float _695 = _673 + _639;
    float _697 = _689 + _649;
    float _699 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].z, _691);
    float _701 = _693 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _705 = _703 != 0;
    float _707 = _171 * _635;
    float _709 = _699 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _711 = _697 + _701;
    float _713 = fma(_169, _633, _707);
    float _715 = _695 + _709;
    float _717 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _719 = _711 + _717;
    float _721 = fma(_173, _637, _713);
    float _723 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _725 = _715 + _723;
    float _727 = _719 * _719;
    float _729 = _669 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _731 = _639;
    float _733 = _727;
    if (!_705)
    {
        _731 = _641;
    }
    float _735 = _731;
    float _737 = _721 + _643;
    float _739 = fma(_725, _725, _727);
    bool _741 = _683 > 0.5;
    bool _743 = _685 > 0.5;
    float _745 = sqrt(_739);
    float _747 = _735;
    if (!_705)
    {
        _591 = _735;
    }
    float _749 = _591;
    float _751 = fma(_675, (*spvDescriptorSet0.vp_c8)._m0[25].x, _729);
    int _753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _755 = _753 != 0;
    int _757 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _759 = _757 != 0;
    int _761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _763 = _761 != 0;
    float _765 = _737 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _767 = -_205;
    int _769 = _743 ? as_type<int>(_767) : as_type<int>(_205);
    float _771 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].z, _751);
    float _773 = -_205;
    int _775 = _741 ? as_type<int>(_773) : as_type<int>(_205);
    float _777 = _765;
    float _779 = _749;
    if (_705)
    {
        _747 = _641;
    }
    float _781 = _747;
    float _783 = _771 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _785 = !_755;
    float _787 = _785 ? _205 : as_type<float>(_769);
    bool _789 = !_763;
    float _791 = _789 ? _205 : as_type<float>(_775);
    float _793 = _737 + _783;
    bool _795 = _149 > 0.5;
    bool _797 = _781 > 0.5;
    float _799 = -_289;
    int _801 = _795 ? as_type<int>(_799) : as_type<int>(_289);
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _805 = _803 != 0;
    int _807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _809 = _807 != 0;
    bool _811 = _745 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _813 = -_205;
    int _815 = _797 ? as_type<int>(_813) : as_type<int>(_205);
    bool _817 = !_805;
    float _819 = _817 ? _289 : as_type<float>(_801);
    bool _821 = !_809;
    float _823 = _821 ? _205 : as_type<float>(_815);
    float _825 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[11].x, _765);
    float _827 = -_289;
    float _829 = _797 ? _827 : _289;
    float _831 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].z, _825);
    bool _833 = !_759;
    float _835 = _833 ? _289 : _829;
    float _837 = _825;
    float _839 = _829;
    float _841 = _831;
    if (!_811)
    {
        _837 = _715;
    }
    float _843 = _837;
    float _845 = _843;
    if (!_811)
    {
        _733 = _711;
    }
    float _847 = _733;
    float _849 = _847;
    if (!_811)
    {
        _839 = _793;
    }
    float _851 = _839;
    bool _853 = !_811;
    float _855 = _851;
    if (!_853)
    {
        float _857 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _859 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _861 = _745 + _859;
        float _863 = _793 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _865 = rsqrt(_739);
        float _867 = _861 * _857;
        float _869 = _867 * 0.15915493667125701904296875;
        float _871 = _869 * 6.283185482025146484375;
        float _873 = sin(_871);
        float _875 = _869 * 6.283185482025146484375;
        float _877 = cos(_875);
        float _879 = fma(_873, _863, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _881 = _865 * _879;
        float _883 = _877 + (-1.0);
        float _885 = fma(_725, _881, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _887 = fma(_719, _881, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _889 = _883 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _891 = fma(_793, _877, _889);
        _855 = _891;
        _845 = _885;
        _849 = _887;
    }
    float _893 = _855;
    float _895 = _845;
    float _897 = _849;
    float _899 = -_737;
    float _901 = _899 + _893;
    float _903 = -_695;
    float _905 = _903 + _895;
    float _907 = _831 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _909 = _737 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _911 = _901 * _901;
    float _913 = -_697;
    float _915 = _913 + _897;
    float _917 = 1.0 / _907;
    float _919 = fma(_695, (*spvDescriptorSet0.vp_c8)._m0[10].x, _909);
    float _921 = fma(_905, _905, _911);
    float _923 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].z, _919);
    float _925 = fma(_915, _915, _921);
    bool _927 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _929 = isnan(0.5);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _935 = _931 || _933;
    float _937 = _923 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _939 = sqrt(_925);
    bool _941 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _943 = isnan(0.5);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _949 = _945 || _947;
    float _951 = _937 + _907;
    float _953 = _951 * _917;
    float _955 = _953 * 0.5;
    float _957 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _959 = fma(_955, (*spvDescriptorSet0.vp_c8)._m0[30].w, _957);
    bool _961 = _939 > 0.0;
    float _963 = 1.0 / _959;
    float _965 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _967 = _893;
    float _969 = _897;
    float _971 = _939;
    float _973 = _895;
    if (!_961)
    {
        _965 = _895;
    }
    float _975 = _965;
    bool _977 = !_961;
    float _979 = _975;
    if (!_977)
    {
        float _981 = _293 * _293;
        float _983 = rsqrt(_925);
        float _985 = fma(_247, _247, _981);
        float _987 = fma(_259, _259, _985);
        float _989 = sqrt(_987);
        float _991 = _905 * _983;
        float _993 = _901 * _983;
        float _995 = _915 * _983;
        bool _997 = _989 > 0.0;
        float _999 = _989;
        _971 = _983;
        _777 = _995;
        _841 = _987;
        if (!_997)
        {
            _999 = _895;
        }
        float _1001 = _999;
        bool _1003 = !_997;
        _979 = _1001;
        if (!_1003)
        {
            float _1005 = rsqrt(_987);
            float _1007 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1009 = _293 * _1005;
            float _1011 = _247 * _1005;
            float _1013 = _993 * _1009;
            float _1015 = _259 * _1005;
            float _1017 = fma(_991, _1011, _1013);
            float _1019 = _1007 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1021 = fma(_995, _1015, _1017);
            float _1023 = _1021 * _1019;
            float _1025 = fma(_247, _1023, _895);
            float _1027 = fma(_293, _1023, _893);
            float _1029 = fma(_259, _1023, _897);
            _979 = _1025;
            _967 = _1027;
            _969 = _1029;
            _971 = _1011;
            _841 = _1005;
        }
    }
    float _1031 = _979;
    float _1033 = _967;
    float _1035 = _969;
    float _1037 = _971;
    float _1039 = _777;
    float _1041 = _841;
    float _1043 = _1041;
    float _1045 = _1037;
    float _1047 = _1035;
    float _1049 = _1033;
    float _1051 = _1039;
    if (_949)
    {
        _1043 = 1.0;
    }
    float _1053 = _1043;
    float _1055 = _1053;
    if (_935)
    {
        _301 = _1031;
    }
    float _1057 = _301;
    float _1059 = _1057;
    if (_935)
    {
        _1045 = _1033;
    }
    float _1061 = _1045;
    float _1063 = _1061;
    if (_935)
    {
        _973 = _1035;
    }
    float _1065 = _973;
    float _1067 = _1065;
    if (!_935)
    {
        float _1069 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1071 = _737 + _1069;
        float _1073 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1075 = _695 + _1073;
        float _1077 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1079 = -_697;
        float _1081 = _1079 + _1035;
        float _1083 = _1071 * _1071;
        float _1085 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1087 = _697 + _1085;
        float _1089 = fma(_1075, _1075, _1083);
        float _1091 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1093 = fma(_1087, _1087, _1089);
        float _1095 = sqrt(_1093);
        float _1097 = _1077 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1099 = precise::min(_1095, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1101 = _1099 * _1091;
        float _1103 = -_695;
        float _1105 = _1103 + _1031;
        float _1107 = _1097 * _1101;
        float _1109 = -_737;
        float _1111 = _1109 + _1033;
        float _1113 = fma(_1105, _1107, _695);
        float _1115 = fma(_1111, _1107, _737);
        float _1117 = fma(_1081, _1107, _697);
        _1063 = _1115;
        _1059 = _1113;
        _1067 = _1117;
        _1047 = _1081;
    }
    float _1119 = _1063;
    float _1121 = _1059;
    float _1123 = _1067;
    float _1125 = _1047;
    float _1127 = _1125;
    if (_949)
    {
        _1049 = 1.0;
    }
    float _1129 = _1049;
    float _1131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1133 = _963 * _1131;
    float _1135 = _1129;
    if (!_949)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = _1139 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 0.15915493667125701904296875;
        float _1149 = _1139 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = 1.0 / _1145;
        float _1155 = _1147 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = _1151 * _1153;
        float _1161 = _1147 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1167 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1165;
        float _1169 = _1157 * _1159;
        float _1171 = 1.0 / _1167;
        float _1173 = 1.0 / _1169;
        float _1175 = _1163 * _1173;
        float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1179 = fma(_1133, _1175, _1177);
        float _1181 = _1179 * _1171;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        _303 = _1159;
        _1127 = _1147;
        _1055 = _1183;
    }
    float _1185 = _303;
    float _1187 = _1127;
    float _1189 = _1055;
    float _1191 = _1187;
    float _1193 = _1185;
    if (!_949)
    {
        float _1195 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1197 = _1195 * 0.15915493667125701904296875;
        float _1199 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1201 = _1197 * 6.283185482025146484375;
        float _1203 = cos(_1201);
        float _1205 = _1199 * 0.15915493667125701904296875;
        float _1207 = _1197 * 6.283185482025146484375;
        float _1209 = sin(_1207);
        float _1211 = 1.0 / _1203;
        float _1213 = _1205 * 6.283185482025146484375;
        float _1215 = cos(_1213);
        float _1217 = _1209 * _1211;
        float _1219 = _1205 * 6.283185482025146484375;
        float _1221 = sin(_1219);
        float _1223 = _1215 * _1217;
        float _1225 = 1.0 / _1223;
        float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1229 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1227;
        float _1231 = 1.0 / _1229;
        float _1233 = _1221 * _1225;
        float _1235 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1237 = fma(_1133, _1233, _1235);
        float _1239 = _1237 * _1231;
        float _1241 = precise::clamp(_1239, 0.0, 1.0);
        float _1243 = -_1241;
        float _1245 = _1243 + 1.0;
        _1191 = _1223;
        _1193 = _1233;
        _1135 = _1245;
    }
    float _1247 = _1191;
    float _1249 = _1193;
    float _1251 = _1135;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1255 = _1119 + _1253;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1259 = _1121 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1263 = _1123 + _1261;
    float _1265 = _1255 * _1255;
    float _1267 = fma(_1259, _1259, _1265);
    float _1269 = fma(_1263, _1263, _1267);
    float _1271 = rsqrt(_1269);
    float _1273 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1275 = _1259 * _1273;
    float _1277 = _1263 * _1273;
    float _1279 = _1275 * _1275;
    float _1281 = _1277 * _1277;
    float _1283 = _1279 + _1281;
    float _1285 = sqrt(_1283);
    bool _1287 = _1285 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = _1285 + _1289;
    float _1293 = _1263;
    float _1295 = _1283;
    float _1297 = _1291;
    float _1299 = _1247;
    float _1301 = _1255;
    float _1303 = _1249;
    if (_1287)
    {
        float _1305 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1293 = _1305;
    }
    float _1307 = _1293;
    if (_1287)
    {
        float _1309 = rsqrt(_1283);
        _1295 = _1309;
    }
    float _1311 = _1295;
    float _1313 = _1311;
    if (_1287)
    {
        float _1315 = _1291 * _1307;
        _1297 = _1315;
    }
    float _1317 = _1297;
    if (_1287)
    {
        float _1319 = _1317 * 0.15915493667125701904296875;
        _1299 = _1319;
    }
    float _1321 = _1299;
    float _1323 = _1307;
    if (_1287)
    {
        float _1325 = _1321 * 6.283185482025146484375;
        float _1327 = sin(_1325);
        _1323 = _1327;
    }
    float _1329 = _1323;
    float _1331 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1333 = precise::max(0.0, _1331);
    float _1335 = _1271;
    float _1337 = _1333;
    if (_1287)
    {
        float _1339 = _1321 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        _1335 = _1341;
    }
    float _1343 = _1335;
    float _1345 = -_1273;
    float _1347 = -_1333;
    float _1349 = fma(_1255, _1345, _1347);
    if (_1287)
    {
        float _1351 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1351;
    }
    float _1353 = _1337;
    float _1355 = sqrt(_1269);
    float _1357 = _1329;
    float _1359 = _1353;
    if (_1287)
    {
        float _1361 = fma(_1329, _1353, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1301 = _1361;
    }
    float _1363 = _1301;
    float _1365 = _1363;
    if (!_1287)
    {
        _1357 = _1275;
    }
    float _1367 = _1357;
    float _1369 = _1367;
    float _1371 = _1343;
    if (_1287)
    {
        float _1373 = _1343 + (-1.0);
        _1359 = _1373;
    }
    float _1375 = _1359;
    float _1377 = _1375;
    if (_1287)
    {
        float _1379 = _1311 * _1363;
        _1051 = _1379;
    }
    float _1381 = _1051;
    if (!_1287)
    {
        _1365 = _1349;
    }
    float _1383 = _1365;
    float _1385 = _1383;
    if (_1287)
    {
        float _1387 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1303 = _1387;
    }
    float _1389 = _1303;
    if (_1287)
    {
        float _1391 = _1275 * _1381;
        _1369 = _1391;
    }
    float _1393 = _1369;
    if (!_1287)
    {
        _1377 = _1277;
    }
    float _1395 = _1377;
    float _1397 = _1395;
    if (_1287)
    {
        float _1399 = _1277 * _1381;
        _1397 = _1399;
    }
    float _1401 = _1397;
    if (!_1287)
    {
        _1313 = _1279;
    }
    float _1403 = _1313;
    float _1405 = _1403;
    if (_1287)
    {
        float _1407 = fma(_1349, _1343, _1389);
        _1385 = _1407;
    }
    float _1409 = _1385;
    if (_1287)
    {
        float _1411 = _1393 * _1393;
        _1405 = _1411;
    }
    float _1413 = _1405;
    if (!_1287)
    {
        _1371 = _1281;
    }
    float _1415 = _1371;
    float _1417 = _1415;
    if (_1287)
    {
        float _1419 = _1401 * _1401;
        _1417 = _1419;
    }
    float _1421 = _1417;
    float _1423 = fma(_1409, _1409, _1413);
    float _1425 = _1423 + _1421;
    float _1427 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1429 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1431 = fma(_1355, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1429);
    float _1433 = precise::clamp(_1431, 0.0, 1.0);
    float _1435 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1437 = rsqrt(_1425);
    float _1439 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1427);
    float _1441 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1443 = -_1433;
    float _1445 = _1443 + 1.0;
    float _1447 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1449 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1439);
    float _1451 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1435);
    float _1453 = _1119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1455 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1441);
    float _1457 = abs(_1445);
    float _1459 = log2(_1457);
    float _1461 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1451);
    float _1463 = fma(_1121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1453);
    float _1465 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1455);
    float _1467 = _1449 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1469 = _1461 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1471 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1463);
    float _1473 = _1437 * _1393;
    float _1475 = _1465 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1477 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1479 = _1437 * _1409;
    float _1481 = _1473 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1483 = _1437 * _1401;
    float _1485 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1477);
    float _1487 = _1467 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1489 = -_1481;
    float _1491 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1489);
    float _1493 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1495 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1485);
    float _1497 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1499 = -_1483;
    float _1501 = fma(_1499, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1491);
    float _1503 = -_1487;
    float _1505 = fma(_1503, _1447, 1.0);
    float _1507 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1495);
    float _1509 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1511 = fma(_1501, -0.5, 0.5);
    float _1513 = exp2(_1497);
    float _1515 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1517 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1509);
    float _1519 = fma(_1501, 0.5, 0.5);
    float _1521 = _1479 + 1.0;
    float _1523 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1515);
    float _1525 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1517);
    float _1527 = fma(_1519, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1529 = log2(_1505);
    float _1531 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1523);
    float _1533 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1525);
    float _1535 = fma(_1519, _1527, -0.212114393711090087890625);
    float _1537 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1531);
    float _1539 = fma(_1519, _1535, 1.570728778839111328125);
    float _1541 = 1.0 / _1507;
    float _1543 = -_1479;
    float _1545 = fma(_1513, _1521, _1543);
    float _1547 = fma(_1545, 0.5, 0.5);
    float _1549 = sqrt(_1511);
    float _1551 = _1529 * 0.693147182464599609375;
    float _1553 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1555 = _1533 * _1541;
    float _1557 = _1537 * _1541;
    float _1559 = fma(_1555, 0.5, 0.5);
    float _1561 = fma(_1557, -0.5, 0.5);
    float _1563 = _1549 * 0.636619746685028076171875;
    float _1565 = -_1539;
    float _1567 = fma(_1563, _1565, 1.0);
    float3 _4498 = float3(_1559, _1561, _1553);
    float _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4498, float3(0.0), isnan(_4498)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4498, float3(0.0), isnan(_4498)), level(0.0)).x;
    float3 _4509 = float3(_1559, _1561, _1553);
    float4 _1572 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4509, float3(0.0), isnan(_4509)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4509, float3(0.0), isnan(_4509)), level(0.0)).xyzw;
    float _1574 = _1572.x;
    float _1576 = _1572.y;
    float _1578 = _1572.z;
    float _1580 = _1572.w;
    float2 _4526 = float2(_1567, _1547);
    float3 _1584 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4526, float2(0.0), isnan(_4526)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4526, float2(0.0), isnan(_4526)), level(0.0)).xyz;
    float _1586 = _1584.x;
    float _1588 = _1584.y;
    float _1590 = _1584.z;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1594 = _625 + _1592;
    float _1596 = _1459 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1600 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1598;
    float _1602 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1604 = _1602 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1610 = 1.0 / _1600;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1618 = 1.0 / _1604;
    float _1620 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1622 = _1620 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1628 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1630 = _1628 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1632 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1634 = _1632 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1636 = _1614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1638 = _1616 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1640 = 1.0 / _1608;
    float _1642 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1646 = _1644 != 0;
    float _1648 = _1594 * _1610;
    float _1650 = _819 + 0.5;
    out.m_64.x = _1636;
    out.m_64.y = _1638;
    out.m_64.z = _1642;
    float _1652 = 1.0 / _1634;
    float _1654 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1656 = _1654 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1658 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1658;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1664 = _1662 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1666 = _1650 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1668 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1670 = isnan(_627);
    bool _1672 = _1668 || _1670;
    bool _1674 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1676 = _1672 || _1674;
    float _1678 = float(_1676);
    float _1680 = _1664 * _1618;
    float _1682 = 1.0 / _1622;
    float _1684 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1686 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1684;
    float _1688 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1692;
    bool _1696 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1698 = isnan(_627);
    bool _1700 = _1696 || _1698;
    bool _1702 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1704 = _1700 || _1702;
    float _1706 = float(_1704);
    float _1708 = -_1678;
    float _1710 = _1708 + 1.0;
    float _1712 = 1.0 / _1626;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1722 = -_289;
    int _1724 = _741 ? as_type<int>(_1722) : as_type<int>(_289);
    float _1726 = -_791;
    float _1728 = _1726 + 0.5;
    float _1730 = _1716 * _1640;
    float _1732 = _1720 * _1652;
    bool _1734 = !_1646;
    float _1736 = _1734 ? _289 : as_type<float>(_1724);
    float _1738 = 1.0 / _1630;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1740;
    float _1744 = _1686 * _1682;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1748 = _627 + _1746;
    float _1750 = fma(_1742, _1648, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1752 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1754 = isnan(_627);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1766 = _627 + _1764;
    float _1768 = 1.0 / _1656;
    float _1770 = _1690 * _1712;
    float _1772 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1774 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1772;
    float _1776 = -_1762;
    float _1778 = _1776 + 1.0;
    float _1780 = fma(_1744, _1766, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1784 = _627 + _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1786;
    float _1790 = _1660 * _1738;
    float _1792 = fma(_1774, _1648, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1794 = _1660;
    if (!_705)
    {
        float _1796 = in.m_49.z;
        _1794 = _1796;
    }
    float _1798 = _1794;
    float _1800 = fma(_1788, _1648, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1802 = fma(_1790, _1748, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1804 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1806 = isnan(_627);
    bool _1808 = _1804 || _1806;
    bool _1810 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1812 = _1808 || _1810;
    float _1814 = float(_1812);
    float _1816 = fma(_1770, _1784, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1820 = _627 + _1818;
    float _1822 = _1694 * _1768;
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1826 = _627 + _1824;
    float _1828 = _1814 * _1778;
    float _1830 = -_1814;
    float _1832 = _1830 + 1.0;
    float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1836 = _627 + _1834;
    float _1838 = fma(_1680, _1826, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1840 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1842 = isnan(_627);
    bool _1844 = _1840 || _1842;
    bool _1846 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1848 = _1844 || _1846;
    float _1850 = float(_1848);
    float _1852 = fma(_1732, _1820, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1854 = _1706 * _1710;
    float _1856 = fma(_1730, _1836, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1858 = -_1706;
    float _1860 = _1858 + 1.0;
    float _1862 = -_1850;
    float _1864 = _1862 + 1.0;
    float _1866 = _1850 * _1832;
    bool _1868 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1870 = isnan(_625);
    bool _1872 = _1868 || _1870;
    bool _1874 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1876 = _1872 || _1874;
    float _1878 = float(_1876);
    float _1880 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1882 = _627 + _1880;
    float _1884 = _1678 * _1864;
    bool _1886 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1888 = isnan(_627);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1894 = _1890 || _1892;
    float _1896 = float(_1894);
    float _1898 = exp2(_1596);
    bool _1900 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1902 = isnan(_625);
    bool _1904 = _1900 || _1902;
    bool _1906 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1908 = _1904 || _1906;
    float _1910 = float(_1908);
    float _1912 = _835 + 0.5;
    bool _1914 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1916 = isnan(_627);
    bool _1918 = _1914 || _1916;
    bool _1920 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1922 = _1918 || _1920;
    float _1924 = float(_1922);
    float _1926 = _1896 * _1860;
    float _1928 = -_1896;
    float _1930 = _1928 + 1.0;
    bool _1932 = _627 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1934 = isnan(_627);
    bool _1936 = _1932 || _1934;
    bool _1938 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1940 = _1936 || _1938;
    float _1942 = float(_1940);
    float _1944 = -_1878;
    float _1946 = _1944 + 1.0;
    float _1948 = -_1924;
    float _1950 = _1948 + 1.0;
    float _1952 = _1924 * _1930;
    if (_705)
    {
        _779 = _149;
    }
    float _1954 = _779;
    float _1956 = _1910 * _1946;
    float _1958 = fma(_1822, _1882, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1960 = _1942 * _1950;
    float _1962 = _1798;
    if (!_705)
    {
        _305 = _1798;
    }
    float _1964 = _305;
    float _1966 = _1750 * _1956;
    float _1968 = _1792 * _1956;
    float _1970 = _1800 * _1956;
    float _1972 = -_1910;
    float _1974 = _1972 + 1.0;
    float _1976 = _1964;
    if (_705)
    {
        _1976 = _781;
    }
    float _1978 = _1976;
    float _1980 = _1802 * _1960;
    if (_705)
    {
        _1962 = _781;
    }
    float _1982 = _1962;
    float _1984 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1966);
    float _1986 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1968);
    float _1988 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1970);
    float _1990 = -_1942;
    float _1992 = _1990 + 1.0;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1998 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2000 = fma(_1954, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1994);
    float _2002 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2004 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1980);
    float _2006 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2008 = -_1998;
    float _2010 = fma(_2002, 2.0, _2008);
    float _2012 = fma(_1838, _1952, _2004);
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2016 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2020 = fma(_1780, _1926, _2012);
    float _2022 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2006);
    float _2024 = -_129;
    float _2026 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2010);
    float _2028 = fma(_2016, -2.0, _2018);
    float _2030 = _1996 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2032 = _1736 + 0.5;
    float _2034 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1984);
    float _2036 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1986);
    float _2038 = fma(_1878, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1988);
    float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2042 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2000);
    float _2044 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2022);
    float _2046 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2028);
    float _2048 = _2014 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2050 = fma(_2030, _2032, _2026);
    float _2052 = _787 + (-0.5);
    float _2054 = fma(_1816, _1854, _2020);
    float _2056 = _2034 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2058 = -_2048;
    float _2060 = -_2046;
    float _2062 = fma(_2058, _2052, _2060);
    float _2064 = fma(_1856, _1884, _2054);
    float _2066 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2070 = _2036 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2072 = fma(_1852, _1866, _2064);
    float _2074 = _2038 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2076 = _1666 * _2040;
    float _2078 = _1469 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2080 = -_823;
    float _2082 = _2080 + 0.5;
    float _2084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2086 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2088 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2090 = _2074 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2092 = _2082 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2094 = -_1898;
    float _2096 = _2094 + 1.0;
    float _2098 = fma(_1475, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2078);
    float _2100 = -_2042;
    float _2102 = _2100 + 1.0;
    float _2104 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_66.x = _2086;
    out.m_66.y = _2088;
    out.m_66.z = _2090;
    out.m_66.w = _2068;
    float _2106 = -_2044;
    float _2108 = _2106 + 1.0;
    float _2110 = _1912 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2112 = fma(_1467, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2098);
    float _2114 = -_2102;
    float _2116 = fma(_1736, _2114, _2050);
    float _2118 = fma(_787, _2108, _2062);
    float _2120 = fma(_1958, _1828, _2072);
    bool _2122 = _1189 > 0.0;
    bool _2124 = isnan(_1189);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan(0.0);
    bool _2130 = _2126 || _2128;
    float _2132 = _2110 * _2084;
    float _2134 = _1507 * 0.5;
    float _2136 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2120);
    bool _2138 = _1251 <= 0.0;
    bool _2140 = !_2130;
    bool _2142 = _2138 || _2140;
    float _2144 = _1728 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2146 = _2092 * _2066;
    float _2148 = _1189 * _1251;
    float _2150 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2152 = fma(_1537, -0.5, _2134);
    float _2154 = _2144 * _2104;
    float _2156 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2158 = fma(_1493, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2112);
    out.m_68.x = _2076;
    out.m_68.y = _2146;
    out.m_68.z = _2116;
    out.m_68.w = _2118;
    float _2160 = -_2150;
    float _2162 = _2160 + 1.0;
    float _2164 = _1533 + _1507;
    float _2166 = _2158 + _1507;
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2170 = _2164 * 0.5;
    float _2172 = _2166 * 0.5;
    out.m_70.x = _2132;
    out.m_70.y = _2154;
    out.m_72.x = _2136;
    out.m_45.x = _2168;
    out.gl_Position.x = _1533;
    out.gl_Position.y = _1537;
    out.gl_Position.z = _2158;
    out.gl_Position.w = _1507;
    out.m_74.x = _2170;
    out.m_74.y = _2152;
    out.m_74.z = _2172;
    out.m_74.w = _1507;
    float _2174 = _2150 * _1569;
    float _2176 = _1580 * _2162;
    float _2178 = _1580 * _2174;
    float _2180 = _1590 * _2174;
    float _2182 = fma(_1586, _2178, _1574);
    float _2184 = fma(_1588, _2178, _1576);
    float _2186 = fma(_1580, _2180, _1578);
    out.m_76.x = _2182;
    out.m_76.y = _2184;
    out.m_76.z = _2186;
    out.m_76.w = _2176;
    if (!_2142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2188 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2188;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

