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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
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
    float4 m_62 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_60 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3277 = false;
    bool _2436 = false;
    bool _923 = false;
    bool _731 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3530 = as_type<float>(_115);
        out.gl_Position.z = _3530;
    }
    if (!_103)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3600 = as_type<float>(_153);
        out.gl_Position.z = _3600;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = in.m_53.x;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _159 = _133 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_58.x;
    float _165 = in.m_58.y;
    float _167 = in.m_58.z;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _171 = _159 * _157;
    float _173 = _133 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].x, _171);
    float _177 = _173 * _169;
    float _179 = floor(_175);
    float _181 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].y, _177);
    int _183 = as_type<int>(_161) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_161) & 2;
    bool _189 = _187 != 0;
    float _191 = _175 * 6.283185482025146484375;
    int _193 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _195 = _193 != 0;
    float _197 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _199 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _201 = _191 * 0.15915493667125701904296875;
    float _203 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _205 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _197);
    float _207 = _181 * 6.283185482025146484375;
    float _209 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _199);
    float _211 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _203);
    float _213 = _201 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = _207 * 0.15915493667125701904296875;
    bool _219 = !_195;
    int _221 = _219 ? 0 : 1;
    float _223 = -_179;
    float _225 = _175 + _223;
    bool _227 = !_189;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _235 = _233 != 0;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _239 = _237 != 0;
    float _241 = floor(_181);
    int _243 = abs(_221);
    bool _245 = !_235;
    int _247 = _245 ? 0 : 1;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _251 = abs(_247);
    float _253 = _217 * 6.283185482025146484375;
    float _255 = cos(_253);
    bool _257 = _225 < 0.5;
    float _259 = float(_257);
    float _261 = fma(_215, 0.5, 0.5);
    float _263 = -_259;
    float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _267 = float(_243);
    float _269 = -_241;
    float _271 = _181 + _269;
    float _273 = -_225;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_251);
    float _279 = -_261;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _283 = !_239;
    int _285 = _283 ? 0 : 1;
    float _287 = -_271;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _291 = _271 < 0.5;
    float _293 = float(_291);
    float _295 = abs(_275);
    float _297 = _277 * _295;
    float _299 = fma(_255, 0.5, 0.5);
    int _301 = abs(_285);
    float _303 = abs(_289);
    float _305 = _277 * _303;
    float _307 = fma(_267, _281, _297);
    float _309 = -_299;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _313 = float(_301);
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _319 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _321 = fma(_267, _311, _305);
    float _323 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _211);
    float _325 = abs(_265);
    float _327 = fma(_313, _325, _307);
    bool _329 = !_185;
    float _331 = _329 ? (-0.5) : 0.5;
    float _333 = abs(_317);
    float _335 = fma(_313, _333, _321);
    bool _337 = !_249;
    float _353;
    if (!_337)
    {
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_99);
        float _359 = 1.0 / _357;
        float _361 = _133 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _363 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _389 = 1.0 / _375;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _399 = 1.0 / _383;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _363 + _401;
    bool _405 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_363);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _419 = 1.0 / _379;
    float _421 = _403 * _389;
    bool _423 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _425 = isnan(_363);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_433;
    float _437 = _435 + 1.0;
    float _439 = 1.0 / _387;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _441;
    float _445 = _367 * _399;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _449 = _363 + _447;
    bool _451 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _453 = isnan(_363);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = 1.0 / _393;
    float _465 = _371 * _419;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _469 = _363 + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _473 = _363 + _471;
    float _475 = 1.0 / _397;
    float _477 = _449 * _439;
    bool _479 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _481 = isnan(_363);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -_461;
    float _493 = _491 + 1.0;
    float _495 = 1.0 / _443;
    float _497 = _469 * _463;
    bool _499 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _501 = isnan(_363);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _513 = _363 + _511;
    float _515 = -_509;
    float _517 = _515 + 1.0;
    float _519 = _513 * _475;
    float _521 = _461 * _437;
    bool _523 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _525 = isnan(_363);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = _489 * _493;
    float _537 = -_489;
    float _539 = _537 + 1.0;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _545;
    float _549 = -_533;
    float _551 = _549 + 1.0;
    float _553 = _533 * _539;
    float _555 = _473 * _495;
    bool _557 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _559 = isnan(_363);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _509 * _551;
    bool _571 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _573 = isnan(_363);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = _415 * _517;
    float _585 = -_415;
    float _587 = _585 + 1.0;
    float _589 = fma(_543, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _591 = fma(_547, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _593 = -_581;
    float _595 = _593 + 1.0;
    float _597 = _581 * _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _607;
    float _611 = _567 * _595;
    float _613 = fma(_601, _465, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _615 = fma(_605, _465, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _617 = fma(_609, _445, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _619 = _589 * _611;
    float _621 = -_567;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _625;
    float _629 = _591 * _611;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].x, _619);
    float _637 = fma(_627, _445, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _643 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].y, _629);
    float _645 = fma(_613, _597, _635);
    float _647 = fma(_633, _477, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _649 = fma(_615, _597, _643);
    float _651 = fma(_641, _477, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _657;
    float _661 = fma(_617, _583, _645);
    float _663 = fma(_637, _583, _649);
    float _665 = fma(_655, _497, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _667 = fma(_659, _497, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _673 = fma(_647, _569, _661);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _679 = fma(_651, _569, _663);
    float _681 = fma(_671, _519, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _683;
    float _687 = fma(_665, _553, _673);
    float _689 = fma(_677, _519, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _691;
    float _695 = fma(_667, _553, _679);
    float _697 = fma(_685, _555, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _699 = fma(_681, _535, _687);
    float _701 = fma(_693, _555, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _703 = fma(_689, _535, _695);
    float _705 = fma(_697, _521, _699);
    float _707 = fma(_701, _521, _703);
    float _709 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[150].x, _705);
    float _711 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[150].y, _707);
    bool _713 = !_417;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _717 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[11].x, _133);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_99);
        float _735 = 1.0 / _733;
        float _737 = _133 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = _739 + _741;
    bool _745 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _747 = isnan(_739);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _759 = _739 + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _761;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _769 = -_755;
    float _771 = _769 + 1.0;
    float _773 = 1.0 / _763;
    bool _775 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _777 = 1.0 / _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _779;
    float _783 = _743 * _773;
    bool _785 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _787 = isnan(_739);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _797;
    bool _801 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _803 = isnan(_739);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = fma(_781, _783, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _815 = fma(_799, _783, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _817 = _811 * _771;
    float _819 = -_811;
    float _821 = _819 + 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _823;
    float _827 = _759 * _777;
    float _829 = _795 * _821;
    float _831 = fma(_825, _783, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _833 = -_795;
    float _835 = _833 + 1.0;
    float _837 = _813 * _829;
    float _839 = _831 * _829;
    float _841 = _815 * _829;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _855 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[107].x, _839);
    float _857 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[107].y, _837);
    float _859 = fma(_845, _827, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _861 = fma(_849, _827, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _863 = fma(_853, _827, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _865 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[107].z, _841);
    float _867 = fma(_859, _817, _855);
    float _869 = fma(_861, _817, _857);
    float _871 = fma(_863, _817, _865);
    float _873 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].x, _867);
    float _875 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].y, _869);
    float _877 = in.m_60.x;
    float _879 = in.m_60.y;
    float _881 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].z, _871);
    float _883 = _873 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = _875 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _889 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _891;
    out.m_62.y = _893;
    out.m_62.z = _895;
    out.m_62.w = _887;
    float _897 = _711 * _879;
    float _899 = _709 * _877;
    bool _901 = !_775;
    float _919;
    float _921;
    if (!_901)
    {
        float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _905 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[11].z, _133);
        float _909 = _907 * _903;
        float _911 = float(_99);
        float _913 = floor(_909);
        float _915 = -_913;
        float _917 = _909 + _915;
        _919 = _911;
        _921 = _917;
        _923 = true;
    }
    else
    {
        float _925 = float(_99);
        float _927 = 1.0 / _925;
        float _929 = _133 * _927;
        _919 = _925;
        _921 = _929;
    }
    _923 = false;
    float _931 = _919;
    float _933 = _921;
    float _935 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _937 = int(_935);
    float _939 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _941 = int(_939);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _945 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _943);
    float _947 = float(_937);
    float _949 = 1.0 / _931;
    float _951 = float(uint(_941));
    float _953 = 1.0 / _947;
    int _955 = ~_941;
    int _957 = _955 + 1;
    int _959 = ~_941;
    int _961 = _959 + 1;
    float _963 = 1.0 / _951;
    float _965 = _953 * _133;
    float _967 = trunc(_965);
    int _969 = int(_967);
    int _971 = as_type<int>(_963) + (-2);
    float _973 = float(uint(_969));
    float _975 = float(_969);
    float _977 = as_type<float>(_971) * _973;
    float _979 = trunc(_977);
    float _981 = precise::max(_979, 0.0);
    uint _984 = uint(_981);
    int _986 = ~_941;
    int _988 = _986 + 1;
    int _990 = _957 * int(_984);
    int _992 = _990 + _969;
    float _994 = float(uint(_992));
    float _996 = as_type<float>(_971) * _994;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1000 = _998 != 0;
    float _1002 = trunc(_996);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = !_1000;
    float _1010 = _1008 ? 7.345489978790283203125 : 1.0;
    float _1012 = float(_941);
    float _1014 = _1010 * _155;
    bool _1016 = _975 >= _1012;
    bool _1018 = isnan(_975);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan(_1012);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = trunc(_1026);
    int _1030 = int(_1028);
    int _1032 = int(_984) + int(_1006);
    int _1034 = _941 + (-1);
    int _1036 = _988 * _1032;
    int _1038 = _1036 + _969;
    float _1040 = floor(_1014);
    bool _1042 = uint(_1038) >= uint(_941);
    bool _1044 = !_1042;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = _941 == 0;
    int _1050 = ~_1032;
    int _1052 = _1050 + _1046;
    int _1054 = _1052 + 1;
    int _1056 = ~_1030;
    int _1058 = _1056 + 1;
    int _1060 = _1058 + 1;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1072 = _1070 != 0;
    int _1074 = _941 * _1054;
    int _1076 = _1074 + _969;
    float _1078 = -_1040;
    float _1080 = _1014 + _1078;
    bool _1082 = !_1048;
    int _1084 = _1082 ? _1076 : (-1);
    float _1086 = _1080 * _1012;
    float _1088 = _1012 * _133;
    int _1090 = _1084 * _1060;
    float _1092 = _1088 * _949;
    bool _1094 = !_1068;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = trunc(_1086);
    int _1100 = int(_1098);
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1104 = _1102 != 0;
    int _1106 = _1030 * _1034;
    int _1108 = _1106 + _1090;
    bool _1110 = !_1064;
    int _1112 = _1110 ? 0 : 1;
    bool _1114 = !_1104;
    int _1116 = _1114 ? 0 : 1;
    int _1118 = abs(_1096);
    float _1120 = trunc(_1092);
    int _1122 = int(_1120);
    int _1124 = abs(_1116);
    bool _1126 = !_1072;
    int _1128 = _1126 ? 0 : 1;
    int _1130 = abs(_1112);
    int _1132 = _1100 * _1124;
    int _1134 = _1132 + _969;
    int _1136 = abs(_1128);
    float _1138 = _155 * 2.0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1142 = _1140 != 0;
    int _1144 = _1108 * _1118;
    float _1146 = in.m_53.y;
    bool _1148 = !_1142;
    int _1150 = _1148 ? 0 : 1;
    float _1152 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1154 = log2(_1152);
    bool _1156 = _155 > 0.5;
    int _1158 = _1122 * _1130;
    int _1160 = _1158 + _1144;
    int _1162 = abs(_1150);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1166 = _1164 != 0;
    int _1168 = _1134 * _1136;
    int _1170 = _1168 + _1160;
    float _1172 = floor(_1138);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1176 = _1174 != 0;
    int _1178 = _1100 * _1162;
    int _1180 = _1178 + _1170;
    int _1182 = ~_941;
    int _1184 = _1182 + 1;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1188 = _1186 != 0;
    float _1190 = float(uint(_1180));
    float _1192 = _1154 * _133;
    float _1194 = as_type<float>(_971) * _1190;
    float _1196 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1198 = _1146 * 2.0;
    float _1200 = trunc(_1194);
    float _1202 = precise::max(_1200, 0.0);
    uint _1204 = uint(_1202);
    bool _1206 = _1172 > 0.0;
    bool _1208 = _1172 >= 0.0;
    bool _1210 = isnan(_1172);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    float _1218 = exp2(_1192);
    float _1220 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1222 = _1184 * int(_1204);
    int _1224 = _1222 + _1180;
    float _1226 = in.m_53.z;
    float _1228 = floor(_1198);
    float _1230 = float(uint(_1224));
    float _1232 = -_1218;
    float _1234 = _1232 + 1.0;
    float _1236 = as_type<float>(_971) * _1230;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1242 = -_1238;
    float _1244 = fma(_1220, 2.0, _1242);
    float _1246 = -_331;
    int _1248 = _1156 ? as_type<int>(_1246) : as_type<int>(_331);
    float _1250 = trunc(_1236);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    float _1256 = fma(_1196, -2.0, _1240);
    bool _1258 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1260 = isnan(0.0);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1266 = _1262 || _1264;
    float _1268 = -_133;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1244);
    bool _1272 = !_1166;
    float _1274 = _1272 ? _331 : as_type<float>(_1248);
    bool _1276 = _1146 > 0.5;
    float _1278 = in.m_46.x;
    float _1280 = in.m_46.y;
    float _1282 = in.m_46.z;
    float _1284 = _1266 ? _1234 : 0.0;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1288 = -_229;
    int _1290 = _1276 ? as_type<int>(_1288) : as_type<int>(_229);
    float _1292 = _1274 + 0.5;
    bool _1294 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1296 = isnan(1.0);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1302 = _1298 || _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1306 = 1.0 + _1304;
    float _1308 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1286);
    float _1310 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1256);
    int _1312 = int(_1204) + int(_1254);
    float _1314 = 1.0 / _1306;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1316;
    bool _1320 = !_1188;
    float _1322 = _1320 ? _229 : as_type<float>(_1290);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1328 = _961 * _1312;
    int _1330 = _1328 + _1180;
    float _1332 = 1.0 / _1318;
    bool _1334 = uint(_1330) >= uint(_941);
    float _1336 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _945);
    float _1338 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1308);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1342 = _933 + _1340;
    float _1344 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1346 = -_1338;
    float _1348 = _1346 + 1.0;
    if (_1302)
    {
        float _1350 = _1284 * _1314;
        _135 = _1350;
    }
    float _1352 = _135;
    bool _1354 = !_1334;
    int _1356 = _1354 ? 0 : (-1);
    float _1358 = 1.0 / _1326;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1370 = _1368 != 0;
    float _1372 = _1226 * 2.0;
    float _1374 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1376 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1378 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1344);
    int _1380 = ~_1312;
    int _1382 = _1380 + _1356;
    int _1384 = _1382 + 1;
    float _1386 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1374);
    float _1388 = floor(_1372);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1392 = _933 + _1390;
    float _1394 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1376);
    float _1396 = _155 + _1146;
    float _1398 = -_1336;
    float _1400 = _1398 + 1.0;
    float _1402 = _1392 * _1332;
    int _1404 = _1216 ? 0 : 1;
    float _1406 = _1396 + (-1.0);
    float _1408 = _1146 + _1226;
    float _1410 = _1342 * _1358;
    int _1412 = ~_1404;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1420 = _1416;
    if (!_1206)
    {
        int _1422 = ~_1404;
        int _1424 = _1422 + 1;
        _1420 = _1424;
    }
    int _1426 = _1420;
    float _1428 = _1408 + (-1.0);
    float _1430 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1394);
    bool _1432 = _1388 >= 0.0;
    bool _1434 = isnan(_1388);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.0);
    bool _1440 = _1436 || _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1442;
    bool _1446 = _1228 >= 0.0;
    bool _1448 = isnan(_1228);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan(0.0);
    bool _1454 = _1450 || _1452;
    float _1456 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1458 = _1440 ? 0 : 1;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1460;
    bool _1464 = _1388 > 0.0;
    float _1466 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1386);
    float _1468 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1378);
    bool _1470 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1472 = isnan(_933);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1482;
    int _1486 = _1454 ? 0 : 1;
    float _1488 = fma(_1462, _1402, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1490 = _1228 > 0.0;
    float _1492 = -_1480;
    float _1494 = _1492 + 1.0;
    bool _1496 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1498 = isnan(_933);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1504 = _1500 || _1502;
    float _1506 = float(_1504);
    float _1508 = fma(_1484, _1402, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1510 = fma(_1444, _1402, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1512 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1514 = isnan(_933);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    int _1524 = _941 * _1384;
    int _1526 = _1524 + _1180;
    float _1528 = _1506 * _1494;
    float _1530 = -_1506;
    float _1532 = _1530 + 1.0;
    float _1534 = float(uint(_1134));
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1544 = _1522 * _1532;
    float _1546 = -_1522;
    float _1548 = _1546 + 1.0;
    float _1550 = as_type<float>(_971) * _1534;
    float _1552 = fma(_1538, _1410, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1554 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1270);
    bool _1556 = !_1048;
    int _1558 = _1556 ? _1526 : (-1);
    float _1560 = fma(_1542, _1410, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1562 = _1510 * _1544;
    float _1564 = trunc(_1550);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = _1558 >> 31;
    float _1572 = _1508 * _1544;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1576 = _1574 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1578 = _1488 * _1544;
    int _1580 = _1570 & 3;
    float _1582 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1572);
    float _1584 = fma(_1576, _1410, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1586 = ~_941;
    int _1588 = _1586 + 1;
    float _1590 = _1322 + (-0.5);
    int _1592 = _1558 + _1580;
    float _1594 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1578);
    float _1596 = fma(_1552, _1528, _1582);
    float _1598 = -_1590;
    float _1600 = -_1310;
    float _1602 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1600);
    int _1604 = _1592 >> 2;
    float _1606 = -_1400;
    float _1608 = fma(_1274, _1606, _1554);
    int _1610 = _1588 * int(_1568);
    int _1612 = _1610 + _1134;
    int _1614 = ~_1486;
    int _1616 = _1614 + 1;
    int _1618 = _1616 + 1;
    float _1620 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1562);
    int _1622 = _1618;
    if (!_1490)
    {
        int _1624 = ~_1486;
        int _1626 = _1624 + 1;
        _1622 = _1626;
    }
    int _1628 = _1622;
    float _1630 = fma(_1322, _1348, _1602);
    int _1632 = _1604 << 4;
    int _1634 = _1632 + 368;
    float _1636 = fma(_1584, _1528, _1620);
    int _1638 = ~_1458;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    float _1644 = _1468 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1646 = float(uint(_1612));
    out.m_64.x = _1608;
    out.m_64.y = _1630;
    int _1648 = _1642;
    if (!_1464)
    {
        int _1650 = ~_1458;
        int _1652 = _1650 + 1;
        _1648 = _1652;
    }
    int _1654 = _1648;
    uint _1656 = uint(int(uint(_1634) >> uint(2)));
    uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
    int _1660 = int(_1656) & 3;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[int(_1658)][_1660];
    int _1664 = int(_1656) + 1;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    int _1668 = _1664 & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    bool _1672 = !_1366;
    int _1674 = _1672 ? 0 : 1;
    float _1676 = as_type<float>(_971) * _1646;
    int _1678 = _1558 & 3;
    bool _1680 = _1678 != 0;
    float _1682 = _1466 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1684 = abs(_1674);
    float _1686 = fma(_1560, _1528, _1594);
    bool _1688 = uint(_1678) > 1u;
    float _1690 = trunc(_1676);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    float _1696 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1686);
    float _1698 = float(_1426);
    float _1700 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1596);
    float _1702 = float(_1684);
    float _1704 = _1430 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1706 = ~_941;
    int _1708 = _1706 + 1;
    float _1710 = _1146 + (-0.5);
    float _1712 = float(_1654);
    float _1714 = _1702 * _1698;
    bool _1716 = !_1362;
    int _1718 = _1716 ? 0 : 1;
    int _1720 = _1558 & 3;
    bool _1722 = _1720 != 0;
    int _1724 = abs(_1718);
    int _1726 = _1634 + 8;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    int _1744 = _1722 ? 0 : 1;
    int _1746 = int(_1568) + int(_1694);
    float _1748 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1636);
    int _1750 = ~_1744;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    int _1756 = _1754;
    float _1758 = _1710;
    if (!_1688)
    {
        int _1760 = ~_1744;
        int _1762 = _1760 + 1;
        _1756 = _1762;
    }
    int _1764 = _1756;
    int _1766 = _1708 * _1746;
    int _1768 = _1766 + _1134;
    bool _1770 = !_1680;
    int _1772 = _1770 ? 0 : 1;
    int _1774 = abs(_1764);
    int _1776 = abs(_1772);
    bool _1778 = _1678 != 3;
    int _1780 = ~_1774;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = ~_1776;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    bool _1792 = uint(_1678) >= 2u;
    int _1794 = _1784 * as_type<int>(_1670);
    bool _1796 = uint(_1768) >= uint(_941);
    int _1798 = _1792 ? 0 : 1;
    int _1800 = _1790 * as_type<int>(_1662);
    int _1802 = _1800 + _1794;
    float _1804 = float(_1724);
    float _1806 = in.m_66.x;
    float _1808 = in.m_66.y;
    float _1810 = in.m_66.z;
    int _1812 = ~_1798;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = _1816;
    if (_1778)
    {
        int _1820 = ~_1798;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    float _1826 = _1804 * _1712;
    bool _1828 = !_1796;
    int _1830 = _1828 ? 0 : (-1);
    bool _1832 = _1678 != 3;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1836 = _1644 + _1834;
    int _1838 = abs(_1824);
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1842 = _1682 + _1840;
    int _1844 = ~_1746;
    int _1846 = _1844 + _1830;
    int _1848 = _1846 + 1;
    float _1850 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1852 = !_1832;
    int _1854 = _1852 ? 0 : (-1);
    bool _1856 = !_1176;
    int _1858 = _1856 ? 0 : 1;
    float _1860 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1850);
    int _1862 = ~_1838;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    int _1868 = abs(_1854);
    int _1870 = abs(_1858);
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1874 = _1704 + _1872;
    int _1876 = _1866 * as_type<int>(_1734);
    int _1878 = _1876 + _1802;
    float _1880 = _1714 * (-2.0);
    int _1882 = ~_1868;
    int _1884 = _1882 + 1;
    int _1886 = _1884 + 1;
    float _1888 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1860);
    float _1890 = fma(_1880, _1808, _1808);
    int _1892 = _941 * _1848;
    int _1894 = _1892 + _1134;
    float _1896 = _1836 * _1836;
    int _1898 = _1886 * as_type<int>(_1742);
    int _1900 = _1898 + _1878;
    int _1902 = ~_1870;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    float _1908 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1890);
    bool _1910 = _1888 >= 0.0;
    float _1912 = fma(_1842, _1842, _1896);
    bool _1914 = !_1048;
    int _1916 = _1914 ? _1894 : (-1);
    int _1918 = _1900 * _1906;
    float _1920 = _1826 * (-2.0);
    float _1922 = fma(_1874, _1874, _1912);
    float _1924 = _1748 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1926 = _1916 * _1870;
    int _1928 = _1926 + _1918;
    float _1930 = fma(_1418, _1920, _1418);
    float _1932 = fma(_1920, _1806, _1806);
    float _1934 = rsqrt(_1922);
    float _1936 = _1696 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1938 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1940 = _1810;
    if (_1910)
    {
        _1758 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1942 = _1758;
    float _1944 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1950 = as_type<int>(_1942);
    if (_1910)
    {
        float _1952 = _1942 * 5.0;
        _1950 = as_type<int>(_1952);
    }
    int _1954 = _1950;
    float _1956 = float(_1928);
    float _1958 = fma(_1456, _1880, _1456);
    bool _1960 = !_1370;
    int _1962 = _1960 ? 0 : 1;
    out.m_68.x = _1946;
    out.m_68.y = _1948;
    out.m_68.z = _1944;
    float _1964 = fma(_1958, _1352, _1908);
    float _1966 = _155 + (-0.5);
    if (_1910)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6354 = as_type<float>(_1954);
        out.gl_Position.z = _6354;
    }
    float _1968 = _1836 * _1934;
    out.m_70.x = _1956;
    if (_1910)
    {
        out.m_49.x = 0.0;
    }
    int _1970 = abs(_1962);
    float _1972 = _1842 * _1934;
    if (_1910)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1974 = -_1968;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1644);
    float _1978 = _1874 * _1934;
    float _1980 = -_1972;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _1984 = float(_1628);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1976 + _1986;
    float _1990 = -_1978;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1996 = _1982 + _1994;
    float _1998 = float(_1970);
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2004 = _1992 + _2002;
    float _2006 = -_1968;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1836);
    float _2010 = _1964 * 0.15915493667125701904296875;
    float _2012 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2000);
    float _2014 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1932);
    float _2016 = _1998 * _1984;
    float _2018 = -_1972;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1842);
    float _2022 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2012);
    float _2024 = _2008 * _2008;
    float _2026 = fma(_1930, _1352, _2014);
    float _2028 = _155 + _1226;
    float _2030 = _2016 * (-2.0);
    bool _2032 = _2022 >= 0.0;
    float _2034 = fma(_2020, _2020, _2024);
    float _2036 = -_1978;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1874);
    float _2040 = _2026 * 0.15915493667125701904296875;
    float _2042 = _1226 + (-0.5);
    float _2044 = _2028 + (-1.0);
    float _2046 = fma(_2030, _1810, _1810);
    float _2048 = fma(_2038, _2038, _2034);
    float _2050 = _2010 * 6.283185482025146484375;
    float _2052 = sin(_2050);
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2056 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2046);
    float _2058 = _335 * _897;
    float _2060 = _1978;
    float _2062 = _1982;
    if (_2032)
    {
        _1940 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2064 = _1940;
    float _2066 = fma(_2054, _2030, _2054);
    int _2068 = as_type<int>(_2064);
    if (_2032)
    {
        out.m_49.x = 0.0;
    }
    float _2070 = _2010 * 6.283185482025146484375;
    float _2072 = cos(_2070);
    if (_2032)
    {
        float _2074 = _2064 * 5.0;
        _2068 = as_type<int>(_2074);
    }
    int _2076 = _2068;
    float _2078 = fma(_2066, _1352, _2056);
    if (_2032)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6555 = as_type<float>(_2076);
        out.gl_Position.z = _6555;
    }
    float _2080 = _2078 * 0.15915493667125701904296875;
    float _2082 = _2040 * 6.283185482025146484375;
    float _2084 = sin(_2082);
    float _2086 = sqrt(_2048);
    float _2088 = _2040 * 6.283185482025146484375;
    float _2090 = cos(_2088);
    if (_2032)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2092 = _2080 * 6.283185482025146484375;
    float _2094 = cos(_2092);
    float _2096 = _1934 * _2086;
    float _2098 = _2058 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _2102 = _327 * _899;
    float _2104 = _2090 * _2072;
    float _2106 = _2096 * _2098;
    float _2108 = _2084 * _2052;
    float _2110 = _2080 * 6.283185482025146484375;
    float _2112 = sin(_2110);
    float _2114 = _2084 * _2072;
    float _2116 = _2100 * _2106;
    float _2118 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2120 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _331);
    float _2122 = _2090 * _2052;
    float _2124 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2126 = _2124 * 0.5;
    float _2128 = _2096 * _2118;
    float _2130 = _2090 * _2094;
    float _2132 = _2084 * _2094;
    float _2134 = _2072 * _2094;
    float _2136 = _2120 * _2128;
    float _2138 = _2130 * _2116;
    float _2140 = _2052 * _2094;
    float _2142 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2144 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2146 = fma(_2112, _2104, _2108);
    float _2148 = -_2114;
    float _2150 = fma(_2112, _2122, _2148);
    float _2152 = -_2116;
    float _2154 = _2112 * _2152;
    float _2156 = -_2122;
    float _2158 = fma(_2112, _2114, _2156);
    float _2160 = fma(_2146, _2136, _2138);
    float _2162 = _2132 * _2116;
    float _2164 = fma(_2134, _2136, _2154);
    float _2166 = fma(_2112, _2108, _2104);
    float _2168 = fma(_2150, _2126, _2160);
    float _2170 = fma(_2158, _2136, _2162);
    float _2172 = fma(_2140, _2126, _2164);
    float _2174 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2176 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2178 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2180 = fma(_2166, _2126, _2170);
    float _2182 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2184 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2176);
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2178);
    float _2188 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2190 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2182);
    float _2192 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2184);
    float _2194 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2186);
    float _2196 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2198 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2200 = _2192 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2202 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2204 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2174);
    float _2206 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2190);
    float _2208 = _1682 + _2200;
    float _2210 = _1704 + _2202;
    float _2212 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2188);
    float _2214 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2196);
    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2218 = _2208 + _2216;
    float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2222 = _2210 + _2220;
    float _2224 = -_2112;
    float _2226 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2142);
    float _2228 = -_2112;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2144);
    float _2232 = _2218 * _2218;
    float _2234 = _2222 * _2222;
    float _2236 = -_2112;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2198);
    float _2240 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2204);
    float _2242 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2244 = _2232 + _2234;
    float _2246 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2212);
    float _2248 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2250 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2252 = sqrt(_2244);
    float _2254 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2256 = _1644 + _2242;
    float _2258 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2248);
    float _2260 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2250);
    float _2262 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2254);
    float _2264 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2214);
    bool _2266 = _2252 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2268 = _2254;
    float _2270 = _2232;
    float _2272 = _2234;
    float _2274 = _2208;
    float _2276 = _2210;
    float _2278 = _2222;
    float _2280 = _2246;
    float _2282 = _2096;
    if (!_2266)
    {
        _2268 = _2256;
    }
    float _2284 = _2268;
    bool _2286 = !_2266;
    float _2288 = _2284;
    if (!_2286)
    {
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2294 = _2252 + _2292;
        float _2296 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2298 = rsqrt(_2244);
        float _2300 = _2294 * _2290;
        float _2302 = _2300 * 0.15915493667125701904296875;
        float _2304 = _2302 * 6.283185482025146484375;
        float _2306 = sin(_2304);
        float _2308 = _2302 * 6.283185482025146484375;
        float _2310 = cos(_2308);
        float _2312 = fma(_2306, _2296, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2314 = _2298 * _2312;
        float _2316 = fma(_2218, _2314, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2318 = _2310 + (-1.0);
        float _2320 = fma(_2222, _2314, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2324 = _2316 + _2322;
        float _2326 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2330 = _2320 + _2328;
        float _2332 = _2324 * _2324;
        float _2334 = fma(_2256, _2310, _2326);
        float _2336 = _2330 * _2330;
        _2288 = _2334;
        _2270 = _2332;
        _2272 = _2336;
        _2274 = _2316;
        _2276 = _2320;
    }
    float _2338 = _2288;
    float _2340 = _2270;
    float _2342 = _2272;
    float _2344 = _2274;
    float _2346 = _2276;
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2350 = _2338 + _2348;
    float _2352 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2226);
    float _2354 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2356 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2358 = fma(_2350, _2350, _2340);
    float _2360 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    float _2362 = _331 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2364 = _2356 * _2352;
    float _2366 = _2358 + _2342;
    float _2368 = _2356 * _2354;
    float _2370 = _2356 * _2360;
    float _2372 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2258);
    float _2374 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2260);
    float _2376 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2262);
    float _2378 = sqrt(_2366);
    float _2380 = fma(_2362, _2246, _2364);
    float _2382 = fma(_2362, _2240, _2368);
    float _2384 = fma(_2362, _2264, _2370);
    float _2386 = _2372 + _2380;
    float _2388 = _2374 + _2382;
    float _2390 = _2376 + _2384;
    out.m_72.x = _2386;
    out.m_72.y = _2388;
    out.m_72.z = _2390;
    bool _2392 = _2378 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2394 = isnan(_2378);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2400 = _2396 || _2398;
    if (!_2400)
    {
        _2278 = 1.0;
    }
    float _2402 = _2278;
    bool _2404 = !_2400;
    float _2406 = _2402;
    if (!_2404)
    {
        bool _2408 = _2378 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2410 = isnan(_2378);
        bool _2412 = _2408 || _2410;
        bool _2414 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2416 = _2412 || _2414;
        if (!_2416)
        {
            float _2418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2420 = _2378 + _2418;
            float _2422 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2424 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2422;
            float _2426 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2428 = _2426 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2430 = 1.0 / _2424;
            float _2432 = _2420 * _2430;
            float _2434 = fma(_2432, _2428, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2406 = _2434;
            _2436 = true;
        }
        else
        {
            bool _2438 = _2378 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2440 = isnan(_2378);
            bool _2442 = _2438 || _2440;
            bool _2444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2446 = _2442 || _2444;
            if (!_2446)
            {
                float _2448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2450 = _2378 + _2448;
                float _2452 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2454 = _2452 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2456 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2458 = _2456 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2460 = 1.0 / _2454;
                float _2462 = _2450 * _2460;
                float _2464 = fma(_2462, _2458, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2406 = _2464;
                _2436 = true;
            }
            else
            {
                _2406 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2436 = false;
    float _2466 = _2406;
    float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2470 = _2338 + _2468;
    float _2472 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2474 = _2344 + _2472;
    float _2476 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2478 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2480 = _2346 + _2478;
    float _2482 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2484 = fma(_2474, _2466, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2486 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2476);
    float _2488 = fma(_2480, _2466, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2490 = -_1644;
    float _2492 = _2490 + _2482;
    float _2494 = -_1682;
    float _2496 = _2494 + _2484;
    float _2498 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2486);
    float _2500 = -_1704;
    float _2502 = _2500 + _2488;
    float _2504 = _2492 * _2492;
    float _2506 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2508 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2510 = fma(_2496, _2496, _2504);
    float _2512 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2506);
    float _2514 = 1.0 / _2508;
    float _2516 = fma(_2502, _2502, _2510);
    float _2518 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2512);
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2522 = sqrt(_2516);
    float _2524 = _2520 + _2508;
    float _2526 = _2524 * _2514;
    float _2528 = _2526 * 0.5;
    bool _2530 = _2522 > 0.0;
    float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2534 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2532);
    bool _2536 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan(0.5);
    bool _2544 = _2540 || _2542;
    float _2546 = 1.0 / _2534;
    bool _2548 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan(0.5);
    bool _2556 = _2552 || _2554;
    float _2558 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2560 = _2488;
    float _2562 = _2484;
    if (!_2530)
    {
        _2558 = _2482;
    }
    float _2564 = _2558;
    bool _2566 = !_2530;
    float _2568 = _2564;
    if (!_2566)
    {
        float _2570 = _319 * _319;
        float _2572 = fma(_231, _231, _2570);
        float _2574 = rsqrt(_2516);
        float _2576 = fma(_323, _323, _2572);
        float _2578 = sqrt(_2576);
        float _2580 = _2496 * _2574;
        float _2582 = _2492 * _2574;
        float _2584 = _2502 * _2574;
        bool _2586 = _2578 > 0.0;
        float _2588 = _2578;
        _2280 = _2576;
        if (!_2586)
        {
            _2588 = _2482;
        }
        float _2590 = _2588;
        bool _2592 = !_2586;
        _2568 = _2590;
        if (!_2592)
        {
            float _2594 = rsqrt(_2576);
            float _2596 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2598 = _319 * _2594;
            float _2600 = _231 * _2594;
            float _2602 = _2582 * _2598;
            float _2604 = _323 * _2594;
            float _2606 = fma(_2580, _2600, _2602);
            float _2608 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2610 = fma(_2584, _2604, _2606);
            float _2612 = _2610 * _2608;
            float _2614 = fma(_231, _2612, _2484);
            float _2616 = fma(_319, _2612, _2482);
            float _2618 = fma(_323, _2612, _2488);
            _2560 = _2618;
            _2562 = _2614;
            _2568 = _2616;
            _2280 = _2594;
        }
    }
    float _2620 = _2560;
    float _2622 = _2562;
    float _2624 = _2568;
    float _2626 = _2280;
    float _2628 = -_1978;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2620);
    float _2632 = -_1972;
    float _2634 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2622);
    float _2636 = -_1968;
    float _2638 = fma(_2636, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2624);
    float _2640 = _2638;
    float _2642 = _2634;
    float _2644 = _2630;
    float _2646 = _2622;
    float _2648 = _2626;
    if (_2544)
    {
        _2060 = 1.0;
    }
    float _2650 = _2060;
    float _2652 = _2650;
    if (!_2556)
    {
        float _2654 = _1988 * _1988;
        float _2656 = 1.0 / _2096;
        float _2658 = -_1682;
        float _2660 = _2658 + _2622;
        float _2662 = -_1644;
        float _2664 = _2662 + _2624;
        float _2666 = fma(_1996, _1996, _2654);
        float _2668 = -_1704;
        float _2670 = _2668 + _2620;
        float _2672 = fma(_2004, _2004, _2666);
        float _2674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2676 = sqrt(_2672);
        float _2678 = precise::min(_2676, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2680 = _2678 * _2674;
        float _2682 = _2680 * _2656;
        float _2684 = fma(_2660, _2682, _1982);
        float _2686 = fma(_2664, _2682, _1976);
        float _2688 = fma(_2670, _2682, _1992);
        _2282 = _2656;
        _2640 = _2686;
        _2642 = _2684;
        _2644 = _2688;
    }
    float _2690 = _2282;
    float _2692 = _2640;
    float _2694 = _2642;
    float _2696 = _2644;
    float _2698 = _2690;
    if (_2544)
    {
        _2062 = 1.0;
    }
    float _2700 = _2062;
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2704 = _2546 * _2702;
    float _2706 = _2700;
    if (!_2544)
    {
        float _2708 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2710 = _2708 * 0.15915493667125701904296875;
        float _2712 = _2710 * 6.283185482025146484375;
        float _2714 = cos(_2712);
        float _2716 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2718 = _2716 * 0.15915493667125701904296875;
        float _2720 = _2710 * 6.283185482025146484375;
        float _2722 = sin(_2720);
        float _2724 = 1.0 / _2714;
        float _2726 = _2718 * 6.283185482025146484375;
        float _2728 = cos(_2726);
        float _2730 = _2722 * _2724;
        float _2732 = _2718 * 6.283185482025146484375;
        float _2734 = sin(_2732);
        float _2736 = _2728 * _2730;
        float _2738 = 1.0 / _2736;
        float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2742 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2740;
        float _2744 = 1.0 / _2742;
        float _2746 = _2734 * _2738;
        float _2748 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2750 = fma(_2704, _2746, _2748);
        float _2752 = _2750 * _2744;
        float _2754 = precise::clamp(_2752, 0.0, 1.0);
        _2652 = _2754;
    }
    float _2756 = _2652;
    if (!_2544)
    {
        float _2758 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2760 = _2758 * 0.15915493667125701904296875;
        float _2762 = _2760 * 6.283185482025146484375;
        float _2764 = cos(_2762);
        float _2766 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2768 = _2766 * 0.15915493667125701904296875;
        float _2770 = _2760 * 6.283185482025146484375;
        float _2772 = sin(_2770);
        float _2774 = 1.0 / _2764;
        float _2776 = _2768 * 6.283185482025146484375;
        float _2778 = cos(_2776);
        float _2780 = _2772 * _2774;
        float _2782 = _2768 * 6.283185482025146484375;
        float _2784 = sin(_2782);
        float _2786 = _2778 * _2780;
        float _2788 = 1.0 / _2786;
        float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2792 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2790;
        float _2794 = 1.0 / _2792;
        float _2796 = _2784 * _2788;
        float _2798 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2800 = fma(_2704, _2796, _2798);
        float _2802 = _2800 * _2794;
        float _2804 = precise::clamp(_2802, 0.0, 1.0);
        float _2806 = -_2804;
        float _2808 = _2806 + 1.0;
        _2698 = _2788;
        _2706 = _2808;
    }
    float _2810 = _2698;
    float _2812 = _2706;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2816 = _2692 + _2814;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2820 = _2694 + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2824 = _2696 + _2822;
    float _2826 = _2816 * _2816;
    float _2828 = fma(_2820, _2820, _2826);
    float _2830 = fma(_2824, _2824, _2828);
    float _2832 = rsqrt(_2830);
    float _2834 = sqrt(_2830);
    float _2836 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2838 = _2820 * _2836;
    float _2840 = _2824 * _2836;
    float _2842 = _2838 * _2838;
    float _2844 = _2840 * _2840;
    float _2846 = _2842 + _2844;
    float _2848 = sqrt(_2846);
    bool _2850 = _2848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2854 = _2848 + _2852;
    float _2856 = _2810;
    float _2858 = _2846;
    float _2860 = _2854;
    float _2862 = _2816;
    float _2864 = _2838;
    if (_2850)
    {
        float _2866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2856 = _2866;
    }
    float _2868 = _2856;
    if (_2850)
    {
        float _2870 = rsqrt(_2846);
        _2858 = _2870;
    }
    float _2872 = _2858;
    if (_2850)
    {
        float _2874 = _2854 * _2868;
        _2860 = _2874;
    }
    float _2876 = _2860;
    if (_2850)
    {
        float _2878 = _2876 * 0.15915493667125701904296875;
        _2646 = _2878;
    }
    float _2880 = _2646;
    float _2882 = _2824;
    float _2884 = _2880;
    if (_2850)
    {
        float _2886 = _2880 * 6.283185482025146484375;
        float _2888 = sin(_2886);
        _2882 = _2888;
    }
    float _2890 = _2882;
    float _2892 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2894 = precise::max(0.0, _2892);
    float _2896 = _2868;
    float _2898 = _2894;
    if (_2850)
    {
        float _2900 = _2880 * 6.283185482025146484375;
        float _2902 = cos(_2900);
        _2896 = _2902;
    }
    float _2904 = _2896;
    float _2906 = -_2836;
    float _2908 = -_2894;
    float _2910 = fma(_2816, _2906, _2908);
    if (_2850)
    {
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2862 = _2912;
    }
    float _2914 = _2862;
    float _2916 = _2890;
    float _2918 = _2914;
    if (_2850)
    {
        float _2920 = fma(_2890, _2914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2916 = _2920;
    }
    float _2922 = _2916;
    float _2924 = _2922;
    if (!_2850)
    {
        _2918 = _2910;
    }
    float _2926 = _2918;
    float _2928 = _2926;
    float _2930 = _2904;
    if (_2850)
    {
        float _2932 = _2904 + (-1.0);
        _2898 = _2932;
    }
    float _2934 = _2898;
    float _2936 = _2934;
    if (_2850)
    {
        float _2938 = _2872 * _2922;
        _2648 = _2938;
    }
    float _2940 = _2648;
    if (!_2850)
    {
        _2924 = _2842;
    }
    float _2942 = _2924;
    float _2944 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2946 = _2942;
    if (_2850)
    {
        float _2948 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2884 = _2948;
    }
    float _2950 = _2884;
    if (_2850)
    {
        float _2952 = _2838 * _2940;
        _2864 = _2952;
    }
    float _2954 = _2864;
    if (!_2850)
    {
        _2936 = _2840;
    }
    float _2956 = _2936;
    float _2958 = _2956;
    if (_2850)
    {
        float _2960 = _2840 * _2940;
        _2958 = _2960;
    }
    float _2962 = _2958;
    if (_2850)
    {
        float _2964 = fma(_2910, _2904, _2950);
        _2928 = _2964;
    }
    float _2966 = _2928;
    if (_2850)
    {
        float _2968 = _2954 * _2954;
        _2946 = _2968;
    }
    float _2970 = _2946;
    if (!_2850)
    {
        _2930 = _2844;
    }
    float _2972 = _2930;
    float _2974 = _2972;
    if (_2850)
    {
        float _2976 = _2962 * _2962;
        _2974 = _2976;
    }
    float _2978 = _2974;
    float _2980 = fma(_2966, _2966, _2970);
    float _2982 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2984 = _2980 + _2978;
    float _2986 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2982);
    float _2988 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2992 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2990);
    float _2994 = precise::clamp(_2992, 0.0, 1.0);
    float _2996 = rsqrt(_2984);
    float _2998 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3000 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2988);
    float _3002 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2986);
    float _3004 = -_2994;
    float _3006 = _3004 + 1.0;
    float _3008 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2998);
    float _3010 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3000);
    float _3012 = _3002 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3016 = abs(_3006);
    float _3018 = log2(_3016);
    float _3020 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3008);
    float _3022 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2944);
    float _3024 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3026 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3028 = _3020 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3030 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3022);
    float _3032 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3034 = _2996 * _2954;
    float _3036 = -_3026;
    float _3038 = fma(_3036, _3014, 1.0);
    float _3040 = _2996 * _2966;
    float _3042 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3032);
    float _3044 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3046 = _2996 * _2962;
    float _3048 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3050 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3042);
    float _3052 = -_3044;
    float _3054 = fma(_3040, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3052);
    float _3056 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3058 = log2(_3038);
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3050);
    float _3062 = -_3046;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3054);
    float _3066 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3068 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3070 = fma(_3064, -0.5, 0.5);
    float _3072 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3066);
    float _3074 = exp2(_3056);
    float _3076 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3068);
    float _3078 = fma(_3064, 0.5, 0.5);
    float _3080 = _3040 + 1.0;
    float _3082 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3072);
    float _3084 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3076);
    float _3086 = 1.0 / _3060;
    float _3088 = fma(_3078, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3090 = fma(_3078, _3088, -0.212114393711090087890625);
    float _3092 = sqrt(_3070);
    float _3094 = -_3040;
    float _3096 = fma(_3074, _3080, _3094);
    float _3098 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3082);
    float _3100 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3084);
    float _3102 = _3058 * 0.693147182464599609375;
    float _3104 = fma(_3078, _3090, 1.570728778839111328125);
    float _3106 = fma(_3096, 0.5, 0.5);
    float _3108 = _3098 * _3086;
    float _3110 = _3100 * _3086;
    float _3112 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3114 = fma(_3108, 0.5, 0.5);
    float _3116 = fma(_3110, -0.5, 0.5);
    float _3118 = _3092 * 0.636619746685028076171875;
    float3 _8241 = float3(_3114, _3116, _3112);
    float _3120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8241, float3(0.0), isnan(_8241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8241, float3(0.0), isnan(_8241)), level(0.0)).x;
    float _3122 = -_3104;
    float _3124 = fma(_3118, _3122, 1.0);
    float3 _8257 = float3(_3114, _3116, _3112);
    float4 _3127 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8257, float3(0.0), isnan(_8257)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8257, float3(0.0), isnan(_8257)), level(0.0)).xyzw;
    float _3129 = _3127.x;
    float _3131 = _3127.y;
    float _3133 = _3127.z;
    float _3135 = _3127.w;
    float2 _8274 = float2(_3124, _3106);
    float3 _3139 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8274, float2(0.0), isnan(_8274)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8274, float2(0.0), isnan(_8274)), level(0.0)).xyz;
    float _3141 = _3139.x;
    float _3143 = _3139.y;
    float _3145 = _3139.z;
    float _3147 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3149 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3151 = _3060 * 0.5;
    bool _3153 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3155 = isnan(_2834);
    bool _3157 = _3153 || _3155;
    bool _3159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3161 = _3157 || _3159;
    float _3163 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3149);
    float _3165 = exp2(_3147);
    float _3167 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3163);
    float _3169 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3167);
    float _3171 = fma(_3100, -0.5, _3151);
    float _3173 = _3098 + _3060;
    float _3175 = _3169 + _3060;
    float _3177 = _3173 * 0.5;
    out.gl_Position.x = _3098;
    out.gl_Position.y = _3100;
    out.gl_Position.z = _3169;
    out.gl_Position.w = _3060;
    float _3179 = _3175 * 0.5;
    float _3181 = -_3165;
    float _3183 = _3181 + 1.0;
    float _3185 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _3177;
    out.m_74.y = _3171;
    out.m_74.z = _3179;
    out.m_74.w = _3060;
    float _3187 = -_3185;
    float _3189 = _3187 + 1.0;
    float _3191 = _3100;
    float _3193 = _3098;
    if (!_3161)
    {
        _3191 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3195 = _3191;
    float _3197 = _3195;
    float _3199 = _3195;
    if (!_3161)
    {
        _3193 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3201 = _3193;
    float _3203 = _3185 * _3120;
    float _3205 = _3135 * _3203;
    float _3207 = _3135 * _3189;
    float _3209 = _3145 * _3203;
    float _3211 = fma(_3141, _3205, _3129);
    float _3213 = fma(_3143, _3205, _3131);
    float _3215 = fma(_3135, _3209, _3133);
    float _3217 = _2756 * _2812;
    out.m_76.x = _3211;
    out.m_76.y = _3213;
    out.m_76.z = _3215;
    out.m_76.w = _3207;
    float _3219 = _3217 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3221 = _3217;
    float _3223 = _3201;
    float _3225 = _3201;
    if (!_3161)
    {
        _3221 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3227 = _3221;
    bool _3229 = !_3161;
    float _3231 = _3227;
    float _3233 = _3227;
    if (!_3229)
    {
        bool _3235 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3237 = isnan(_2834);
        bool _3239 = _3235 || _3237;
        bool _3241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3243 = _3239 || _3241;
        if (!_3243)
        {
            float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3247 = _2834 + _3245;
            float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3251 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3249;
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3261 = 1.0 / _3251;
            float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3267 = _3247 * _3261;
            float _3269 = precise::clamp(_3267, 0.0, 1.0);
            float _3271 = fma(_3269, _3255, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3273 = fma(_3269, _3259, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3275 = fma(_3269, _3265, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3225 = _3273;
            _3199 = _3271;
            _3233 = _3275;
            _3277 = true;
        }
        else
        {
            bool _3279 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3281 = isnan(_2834);
            bool _3283 = _3279 || _3281;
            bool _3285 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3287 = _3283 || _3285;
            if (!_3287)
            {
                _3197 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3289 = _3197;
            _3199 = _3289;
            if (!_3287)
            {
                _3223 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3291 = _3223;
            _3225 = _3291;
            if (!_3287)
            {
                _3231 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3293 = _3231;
            bool _3295 = !_3287;
            _3233 = _3293;
            if (!_3295)
            {
                bool _3297 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3299 = isnan(_2834);
                bool _3301 = _3297 || _3299;
                bool _3303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3305 = _3301 || _3303;
                if (!_3305)
                {
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3309 = _2834 + _3307;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3311;
                    float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3323 = 1.0 / _3313;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3329 = _3309 * _3323;
                    float _3331 = precise::clamp(_3329, 0.0, 1.0);
                    float _3333 = fma(_3331, _3317, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3335 = fma(_3331, _3321, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3337 = fma(_3331, _3327, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3225 = _3335;
                    _3199 = _3333;
                    _3233 = _3337;
                    _3277 = true;
                }
                else
                {
                    _3225 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3199 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3233 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3277 = false;
    float _3339 = _3225;
    float _3341 = _3199;
    float _3343 = _3233;
    float _3345 = _3219 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_78.x = 0.0;
    float _3347 = _3339 * 0.586610972881317138671875;
    bool _3349 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _3345;
    float _3351 = fma(_3341, 0.298911988735198974609375, _3347);
    bool _3353 = _2756 > 0.0;
    bool _3355 = isnan(_2756);
    bool _3357 = _3353 || _3355;
    bool _3359 = isnan(0.0);
    bool _3361 = _3357 || _3359;
    float _3363 = fma(_3343, 0.114477999508380889892578125, _3351);
    bool _3365 = _2812 <= 0.0;
    bool _3367 = !_3361;
    bool _3369 = _3365 || _3367;
    float _3371 = -_3363;
    float _3373 = _3371 + _3341;
    float _3375 = -_3363;
    float _3377 = _3375 + _3339;
    float _3379 = -_3363;
    float _3381 = _3379 + _3343;
    float _3383 = fma(_3373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3363);
    float _3385 = fma(_3377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3363);
    float _3387 = fma(_3381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3363);
    bool _3389 = !_3349;
    if (!_3389)
    {
        float _3391 = -_2692;
        float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3395 = -_2694;
        float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3399 = -_2696;
        float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3403 = _3393 * _3393;
        float _3405 = fma(_3397, _3397, _3403);
        float _3407 = fma(_3401, _3401, _3405);
        float _3409 = sqrt(_3407);
        float _3411 = rsqrt(_3407);
        float _3413 = -_3409;
        float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3417 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3419 = precise::clamp(_3417, 0.0, 1.0);
        float _3421 = _3397 * _3411;
        float _3423 = _3393 * _3411;
        float _3425 = abs(_3419);
        float _3427 = log2(_3425);
        float _3429 = _3401 * _3411;
        float _3431 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3433 = _2388 * _3423;
        float _3435 = -_3423;
        float _3437 = -_3431;
        float _3439 = fma(_3435, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3437);
        float _3441 = fma(_2386, _3421, _3433);
        float _3443 = -_3429;
        float _3445 = fma(_3443, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3439);
        float _3447 = fma(_2390, _3429, _3441);
        float _3449 = precise::clamp(_3447, 0.0, 1.0);
        float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3453 = _3445 + _3451;
        float _3455 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3457 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = exp2(_3455);
        float _3463 = _3461 * _3459;
        float _3465 = _3449 * _3463;
        float _3467 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3469 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3471 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _3467;
        out.m_78.y = _3469;
        out.m_78.z = _3471;
    }
    out.m_80.x = _3383;
    out.m_80.y = _3385;
    out.m_80.z = _3387;
    if (!_3369)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3473 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3473;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3277 = false;
    bool _2436 = false;
    bool _923 = false;
    bool _731 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3530 = as_type<float>(_115);
        out.gl_Position.z = _3530;
    }
    if (!_103)
    {
        return out;
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3600 = as_type<float>(_153);
        out.gl_Position.z = _3600;
    }
    if (_145)
    {
        return out;
    }
    float _155 = in.m_53.x;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _159 = _133 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_58.x;
    float _165 = in.m_58.y;
    float _167 = in.m_58.z;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _171 = _159 * _157;
    float _173 = _133 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].x, _171);
    float _177 = _173 * _169;
    float _179 = floor(_175);
    float _181 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].y, _177);
    int _183 = as_type<int>(_161) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_161) & 2;
    bool _189 = _187 != 0;
    float _191 = _175 * 6.283185482025146484375;
    int _193 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _195 = _193 != 0;
    float _197 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _199 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _201 = _191 * 0.15915493667125701904296875;
    float _203 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _205 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _197);
    float _207 = _181 * 6.283185482025146484375;
    float _209 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _199);
    float _211 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _203);
    float _213 = _201 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = _207 * 0.15915493667125701904296875;
    bool _219 = !_195;
    int _221 = _219 ? 0 : 1;
    float _223 = -_179;
    float _225 = _175 + _223;
    bool _227 = !_189;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _235 = _233 != 0;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _239 = _237 != 0;
    float _241 = floor(_181);
    int _243 = abs(_221);
    bool _245 = !_235;
    int _247 = _245 ? 0 : 1;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _251 = abs(_247);
    float _253 = _217 * 6.283185482025146484375;
    float _255 = cos(_253);
    bool _257 = _225 < 0.5;
    float _259 = float(_257);
    float _261 = fma(_215, 0.5, 0.5);
    float _263 = -_259;
    float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _267 = float(_243);
    float _269 = -_241;
    float _271 = _181 + _269;
    float _273 = -_225;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_251);
    float _279 = -_261;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _283 = !_239;
    int _285 = _283 ? 0 : 1;
    float _287 = -_271;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _291 = _271 < 0.5;
    float _293 = float(_291);
    float _295 = abs(_275);
    float _297 = _277 * _295;
    float _299 = fma(_255, 0.5, 0.5);
    int _301 = abs(_285);
    float _303 = abs(_289);
    float _305 = _277 * _303;
    float _307 = fma(_267, _281, _297);
    float _309 = -_299;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _313 = float(_301);
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _319 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _321 = fma(_267, _311, _305);
    float _323 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _211);
    float _325 = abs(_265);
    float _327 = fma(_313, _325, _307);
    bool _329 = !_185;
    float _331 = _329 ? (-0.5) : 0.5;
    float _333 = abs(_317);
    float _335 = fma(_313, _333, _321);
    bool _337 = !_249;
    float _353;
    if (!_337)
    {
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_99);
        float _359 = 1.0 / _357;
        float _361 = _133 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _363 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _389 = 1.0 / _375;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _399 = 1.0 / _383;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _363 + _401;
    bool _405 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_363);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _419 = 1.0 / _379;
    float _421 = _403 * _389;
    bool _423 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _425 = isnan(_363);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_433;
    float _437 = _435 + 1.0;
    float _439 = 1.0 / _387;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _441;
    float _445 = _367 * _399;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _449 = _363 + _447;
    bool _451 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _453 = isnan(_363);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = 1.0 / _393;
    float _465 = _371 * _419;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _469 = _363 + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _473 = _363 + _471;
    float _475 = 1.0 / _397;
    float _477 = _449 * _439;
    bool _479 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _481 = isnan(_363);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -_461;
    float _493 = _491 + 1.0;
    float _495 = 1.0 / _443;
    float _497 = _469 * _463;
    bool _499 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _501 = isnan(_363);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _513 = _363 + _511;
    float _515 = -_509;
    float _517 = _515 + 1.0;
    float _519 = _513 * _475;
    float _521 = _461 * _437;
    bool _523 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _525 = isnan(_363);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = _489 * _493;
    float _537 = -_489;
    float _539 = _537 + 1.0;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _545;
    float _549 = -_533;
    float _551 = _549 + 1.0;
    float _553 = _533 * _539;
    float _555 = _473 * _495;
    bool _557 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _559 = isnan(_363);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _509 * _551;
    bool _571 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _573 = isnan(_363);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = _415 * _517;
    float _585 = -_415;
    float _587 = _585 + 1.0;
    float _589 = fma(_543, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _591 = fma(_547, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _593 = -_581;
    float _595 = _593 + 1.0;
    float _597 = _581 * _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _607;
    float _611 = _567 * _595;
    float _613 = fma(_601, _465, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _615 = fma(_605, _465, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _617 = fma(_609, _445, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _619 = _589 * _611;
    float _621 = -_567;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _625;
    float _629 = _591 * _611;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].x, _619);
    float _637 = fma(_627, _445, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _643 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].y, _629);
    float _645 = fma(_613, _597, _635);
    float _647 = fma(_633, _477, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _649 = fma(_615, _597, _643);
    float _651 = fma(_641, _477, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _657;
    float _661 = fma(_617, _583, _645);
    float _663 = fma(_637, _583, _649);
    float _665 = fma(_655, _497, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _667 = fma(_659, _497, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _673 = fma(_647, _569, _661);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _679 = fma(_651, _569, _663);
    float _681 = fma(_671, _519, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _683;
    float _687 = fma(_665, _553, _673);
    float _689 = fma(_677, _519, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _691;
    float _695 = fma(_667, _553, _679);
    float _697 = fma(_685, _555, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _699 = fma(_681, _535, _687);
    float _701 = fma(_693, _555, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _703 = fma(_689, _535, _695);
    float _705 = fma(_697, _521, _699);
    float _707 = fma(_701, _521, _703);
    float _709 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[150].x, _705);
    float _711 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[150].y, _707);
    bool _713 = !_417;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _717 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[11].x, _133);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_99);
        float _735 = 1.0 / _733;
        float _737 = _133 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = _739 + _741;
    bool _745 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _747 = isnan(_739);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _759 = _739 + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _761;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _769 = -_755;
    float _771 = _769 + 1.0;
    float _773 = 1.0 / _763;
    bool _775 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _777 = 1.0 / _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _779;
    float _783 = _743 * _773;
    bool _785 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _787 = isnan(_739);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _797;
    bool _801 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _803 = isnan(_739);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = fma(_781, _783, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _815 = fma(_799, _783, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _817 = _811 * _771;
    float _819 = -_811;
    float _821 = _819 + 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _823;
    float _827 = _759 * _777;
    float _829 = _795 * _821;
    float _831 = fma(_825, _783, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _833 = -_795;
    float _835 = _833 + 1.0;
    float _837 = _813 * _829;
    float _839 = _831 * _829;
    float _841 = _815 * _829;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _855 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[107].x, _839);
    float _857 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[107].y, _837);
    float _859 = fma(_845, _827, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _861 = fma(_849, _827, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _863 = fma(_853, _827, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _865 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[107].z, _841);
    float _867 = fma(_859, _817, _855);
    float _869 = fma(_861, _817, _857);
    float _871 = fma(_863, _817, _865);
    float _873 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].x, _867);
    float _875 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].y, _869);
    float _877 = in.m_60.x;
    float _879 = in.m_60.y;
    float _881 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].z, _871);
    float _883 = _873 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = _875 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _889 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _891;
    out.m_62.y = _893;
    out.m_62.z = _895;
    out.m_62.w = _887;
    float _897 = _711 * _879;
    float _899 = _709 * _877;
    bool _901 = !_775;
    float _919;
    float _921;
    if (!_901)
    {
        float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _905 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[11].z, _133);
        float _909 = _907 * _903;
        float _911 = float(_99);
        float _913 = floor(_909);
        float _915 = -_913;
        float _917 = _909 + _915;
        _919 = _911;
        _921 = _917;
        _923 = true;
    }
    else
    {
        float _925 = float(_99);
        float _927 = 1.0 / _925;
        float _929 = _133 * _927;
        _919 = _925;
        _921 = _929;
    }
    _923 = false;
    float _931 = _919;
    float _933 = _921;
    float _935 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _937 = int(_935);
    float _939 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _941 = int(_939);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _945 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _943);
    float _947 = float(_937);
    float _949 = 1.0 / _931;
    float _951 = float(uint(_941));
    float _953 = 1.0 / _947;
    int _955 = ~_941;
    int _957 = _955 + 1;
    int _959 = ~_941;
    int _961 = _959 + 1;
    float _963 = 1.0 / _951;
    float _965 = _953 * _133;
    float _967 = trunc(_965);
    int _969 = int(_967);
    int _971 = as_type<int>(_963) + (-2);
    float _973 = float(uint(_969));
    float _975 = float(_969);
    float _977 = as_type<float>(_971) * _973;
    float _979 = trunc(_977);
    float _981 = precise::max(_979, 0.0);
    uint _984 = uint(_981);
    int _986 = ~_941;
    int _988 = _986 + 1;
    int _990 = _957 * int(_984);
    int _992 = _990 + _969;
    float _994 = float(uint(_992));
    float _996 = as_type<float>(_971) * _994;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1000 = _998 != 0;
    float _1002 = trunc(_996);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = !_1000;
    float _1010 = _1008 ? 7.345489978790283203125 : 1.0;
    float _1012 = float(_941);
    float _1014 = _1010 * _155;
    bool _1016 = _975 >= _1012;
    bool _1018 = isnan(_975);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan(_1012);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = trunc(_1026);
    int _1030 = int(_1028);
    int _1032 = int(_984) + int(_1006);
    int _1034 = _941 + (-1);
    int _1036 = _988 * _1032;
    int _1038 = _1036 + _969;
    float _1040 = floor(_1014);
    bool _1042 = uint(_1038) >= uint(_941);
    bool _1044 = !_1042;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = _941 == 0;
    int _1050 = ~_1032;
    int _1052 = _1050 + _1046;
    int _1054 = _1052 + 1;
    int _1056 = ~_1030;
    int _1058 = _1056 + 1;
    int _1060 = _1058 + 1;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1072 = _1070 != 0;
    int _1074 = _941 * _1054;
    int _1076 = _1074 + _969;
    float _1078 = -_1040;
    float _1080 = _1014 + _1078;
    bool _1082 = !_1048;
    int _1084 = _1082 ? _1076 : (-1);
    float _1086 = _1080 * _1012;
    float _1088 = _1012 * _133;
    int _1090 = _1084 * _1060;
    float _1092 = _1088 * _949;
    bool _1094 = !_1068;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = trunc(_1086);
    int _1100 = int(_1098);
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1104 = _1102 != 0;
    int _1106 = _1030 * _1034;
    int _1108 = _1106 + _1090;
    bool _1110 = !_1064;
    int _1112 = _1110 ? 0 : 1;
    bool _1114 = !_1104;
    int _1116 = _1114 ? 0 : 1;
    int _1118 = abs(_1096);
    float _1120 = trunc(_1092);
    int _1122 = int(_1120);
    int _1124 = abs(_1116);
    bool _1126 = !_1072;
    int _1128 = _1126 ? 0 : 1;
    int _1130 = abs(_1112);
    int _1132 = _1100 * _1124;
    int _1134 = _1132 + _969;
    int _1136 = abs(_1128);
    float _1138 = _155 * 2.0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1142 = _1140 != 0;
    int _1144 = _1108 * _1118;
    float _1146 = in.m_53.y;
    bool _1148 = !_1142;
    int _1150 = _1148 ? 0 : 1;
    float _1152 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1154 = log2(_1152);
    bool _1156 = _155 > 0.5;
    int _1158 = _1122 * _1130;
    int _1160 = _1158 + _1144;
    int _1162 = abs(_1150);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1166 = _1164 != 0;
    int _1168 = _1134 * _1136;
    int _1170 = _1168 + _1160;
    float _1172 = floor(_1138);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1176 = _1174 != 0;
    int _1178 = _1100 * _1162;
    int _1180 = _1178 + _1170;
    int _1182 = ~_941;
    int _1184 = _1182 + 1;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1188 = _1186 != 0;
    float _1190 = float(uint(_1180));
    float _1192 = _1154 * _133;
    float _1194 = as_type<float>(_971) * _1190;
    float _1196 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1198 = _1146 * 2.0;
    float _1200 = trunc(_1194);
    float _1202 = precise::max(_1200, 0.0);
    uint _1204 = uint(_1202);
    bool _1206 = _1172 > 0.0;
    bool _1208 = _1172 >= 0.0;
    bool _1210 = isnan(_1172);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    float _1218 = exp2(_1192);
    float _1220 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1222 = _1184 * int(_1204);
    int _1224 = _1222 + _1180;
    float _1226 = in.m_53.z;
    float _1228 = floor(_1198);
    float _1230 = float(uint(_1224));
    float _1232 = -_1218;
    float _1234 = _1232 + 1.0;
    float _1236 = as_type<float>(_971) * _1230;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1242 = -_1238;
    float _1244 = fma(_1220, 2.0, _1242);
    float _1246 = -_331;
    int _1248 = _1156 ? as_type<int>(_1246) : as_type<int>(_331);
    float _1250 = trunc(_1236);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    float _1256 = fma(_1196, -2.0, _1240);
    bool _1258 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1260 = isnan(0.0);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1266 = _1262 || _1264;
    float _1268 = -_133;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1244);
    bool _1272 = !_1166;
    float _1274 = _1272 ? _331 : as_type<float>(_1248);
    bool _1276 = _1146 > 0.5;
    float _1278 = in.m_46.x;
    float _1280 = in.m_46.y;
    float _1282 = in.m_46.z;
    float _1284 = _1266 ? _1234 : 0.0;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1288 = -_229;
    int _1290 = _1276 ? as_type<int>(_1288) : as_type<int>(_229);
    float _1292 = _1274 + 0.5;
    bool _1294 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1296 = isnan(1.0);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1302 = _1298 || _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1306 = 1.0 + _1304;
    float _1308 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1286);
    float _1310 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1256);
    int _1312 = int(_1204) + int(_1254);
    float _1314 = 1.0 / _1306;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1316;
    bool _1320 = !_1188;
    float _1322 = _1320 ? _229 : as_type<float>(_1290);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1328 = _961 * _1312;
    int _1330 = _1328 + _1180;
    float _1332 = 1.0 / _1318;
    bool _1334 = uint(_1330) >= uint(_941);
    float _1336 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _945);
    float _1338 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1308);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1342 = _933 + _1340;
    float _1344 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1346 = -_1338;
    float _1348 = _1346 + 1.0;
    if (_1302)
    {
        float _1350 = _1284 * _1314;
        _135 = _1350;
    }
    float _1352 = _135;
    bool _1354 = !_1334;
    int _1356 = _1354 ? 0 : (-1);
    float _1358 = 1.0 / _1326;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1370 = _1368 != 0;
    float _1372 = _1226 * 2.0;
    float _1374 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1376 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1378 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1344);
    int _1380 = ~_1312;
    int _1382 = _1380 + _1356;
    int _1384 = _1382 + 1;
    float _1386 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1374);
    float _1388 = floor(_1372);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1392 = _933 + _1390;
    float _1394 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1376);
    float _1396 = _155 + _1146;
    float _1398 = -_1336;
    float _1400 = _1398 + 1.0;
    float _1402 = _1392 * _1332;
    int _1404 = _1216 ? 0 : 1;
    float _1406 = _1396 + (-1.0);
    float _1408 = _1146 + _1226;
    float _1410 = _1342 * _1358;
    int _1412 = ~_1404;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1420 = _1416;
    if (!_1206)
    {
        int _1422 = ~_1404;
        int _1424 = _1422 + 1;
        _1420 = _1424;
    }
    int _1426 = _1420;
    float _1428 = _1408 + (-1.0);
    float _1430 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1394);
    bool _1432 = _1388 >= 0.0;
    bool _1434 = isnan(_1388);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.0);
    bool _1440 = _1436 || _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1442;
    bool _1446 = _1228 >= 0.0;
    bool _1448 = isnan(_1228);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan(0.0);
    bool _1454 = _1450 || _1452;
    float _1456 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1458 = _1440 ? 0 : 1;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1460;
    bool _1464 = _1388 > 0.0;
    float _1466 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1386);
    float _1468 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1378);
    bool _1470 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1472 = isnan(_933);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1482;
    int _1486 = _1454 ? 0 : 1;
    float _1488 = fma(_1462, _1402, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1490 = _1228 > 0.0;
    float _1492 = -_1480;
    float _1494 = _1492 + 1.0;
    bool _1496 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1498 = isnan(_933);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1504 = _1500 || _1502;
    float _1506 = float(_1504);
    float _1508 = fma(_1484, _1402, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1510 = fma(_1444, _1402, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1512 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1514 = isnan(_933);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    int _1524 = _941 * _1384;
    int _1526 = _1524 + _1180;
    float _1528 = _1506 * _1494;
    float _1530 = -_1506;
    float _1532 = _1530 + 1.0;
    float _1534 = float(uint(_1134));
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1544 = _1522 * _1532;
    float _1546 = -_1522;
    float _1548 = _1546 + 1.0;
    float _1550 = as_type<float>(_971) * _1534;
    float _1552 = fma(_1538, _1410, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1554 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1270);
    bool _1556 = !_1048;
    int _1558 = _1556 ? _1526 : (-1);
    float _1560 = fma(_1542, _1410, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1562 = _1510 * _1544;
    float _1564 = trunc(_1550);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = _1558 >> 31;
    float _1572 = _1508 * _1544;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1576 = _1574 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1578 = _1488 * _1544;
    int _1580 = _1570 & 3;
    float _1582 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1572);
    float _1584 = fma(_1576, _1410, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1586 = ~_941;
    int _1588 = _1586 + 1;
    float _1590 = _1322 + (-0.5);
    int _1592 = _1558 + _1580;
    float _1594 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1578);
    float _1596 = fma(_1552, _1528, _1582);
    float _1598 = -_1590;
    float _1600 = -_1310;
    float _1602 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1600);
    int _1604 = _1592 >> 2;
    float _1606 = -_1400;
    float _1608 = fma(_1274, _1606, _1554);
    int _1610 = _1588 * int(_1568);
    int _1612 = _1610 + _1134;
    int _1614 = ~_1486;
    int _1616 = _1614 + 1;
    int _1618 = _1616 + 1;
    float _1620 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1562);
    int _1622 = _1618;
    if (!_1490)
    {
        int _1624 = ~_1486;
        int _1626 = _1624 + 1;
        _1622 = _1626;
    }
    int _1628 = _1622;
    float _1630 = fma(_1322, _1348, _1602);
    int _1632 = _1604 << 4;
    int _1634 = _1632 + 368;
    float _1636 = fma(_1584, _1528, _1620);
    int _1638 = ~_1458;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    float _1644 = _1468 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1646 = float(uint(_1612));
    out.m_64.x = _1608;
    out.m_64.y = _1630;
    int _1648 = _1642;
    if (!_1464)
    {
        int _1650 = ~_1458;
        int _1652 = _1650 + 1;
        _1648 = _1652;
    }
    int _1654 = _1648;
    uint _1656 = uint(int(uint(_1634) >> uint(2)));
    uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
    int _1660 = int(_1656) & 3;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[int(_1658)][_1660];
    int _1664 = int(_1656) + 1;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    int _1668 = _1664 & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    bool _1672 = !_1366;
    int _1674 = _1672 ? 0 : 1;
    float _1676 = as_type<float>(_971) * _1646;
    int _1678 = _1558 & 3;
    bool _1680 = _1678 != 0;
    float _1682 = _1466 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1684 = abs(_1674);
    float _1686 = fma(_1560, _1528, _1594);
    bool _1688 = uint(_1678) > 1u;
    float _1690 = trunc(_1676);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    float _1696 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1686);
    float _1698 = float(_1426);
    float _1700 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1596);
    float _1702 = float(_1684);
    float _1704 = _1430 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1706 = ~_941;
    int _1708 = _1706 + 1;
    float _1710 = _1146 + (-0.5);
    float _1712 = float(_1654);
    float _1714 = _1702 * _1698;
    bool _1716 = !_1362;
    int _1718 = _1716 ? 0 : 1;
    int _1720 = _1558 & 3;
    bool _1722 = _1720 != 0;
    int _1724 = abs(_1718);
    int _1726 = _1634 + 8;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    int _1744 = _1722 ? 0 : 1;
    int _1746 = int(_1568) + int(_1694);
    float _1748 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1636);
    int _1750 = ~_1744;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    int _1756 = _1754;
    float _1758 = _1710;
    if (!_1688)
    {
        int _1760 = ~_1744;
        int _1762 = _1760 + 1;
        _1756 = _1762;
    }
    int _1764 = _1756;
    int _1766 = _1708 * _1746;
    int _1768 = _1766 + _1134;
    bool _1770 = !_1680;
    int _1772 = _1770 ? 0 : 1;
    int _1774 = abs(_1764);
    int _1776 = abs(_1772);
    bool _1778 = _1678 != 3;
    int _1780 = ~_1774;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = ~_1776;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    bool _1792 = uint(_1678) >= 2u;
    int _1794 = _1784 * as_type<int>(_1670);
    bool _1796 = uint(_1768) >= uint(_941);
    int _1798 = _1792 ? 0 : 1;
    int _1800 = _1790 * as_type<int>(_1662);
    int _1802 = _1800 + _1794;
    float _1804 = float(_1724);
    float _1806 = in.m_66.x;
    float _1808 = in.m_66.y;
    float _1810 = in.m_66.z;
    int _1812 = ~_1798;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = _1816;
    if (_1778)
    {
        int _1820 = ~_1798;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    float _1826 = _1804 * _1712;
    bool _1828 = !_1796;
    int _1830 = _1828 ? 0 : (-1);
    bool _1832 = _1678 != 3;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1836 = _1644 + _1834;
    int _1838 = abs(_1824);
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1842 = _1682 + _1840;
    int _1844 = ~_1746;
    int _1846 = _1844 + _1830;
    int _1848 = _1846 + 1;
    float _1850 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1852 = !_1832;
    int _1854 = _1852 ? 0 : (-1);
    bool _1856 = !_1176;
    int _1858 = _1856 ? 0 : 1;
    float _1860 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1850);
    int _1862 = ~_1838;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    int _1868 = abs(_1854);
    int _1870 = abs(_1858);
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1874 = _1704 + _1872;
    int _1876 = _1866 * as_type<int>(_1734);
    int _1878 = _1876 + _1802;
    float _1880 = _1714 * (-2.0);
    int _1882 = ~_1868;
    int _1884 = _1882 + 1;
    int _1886 = _1884 + 1;
    float _1888 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1860);
    float _1890 = fma(_1880, _1808, _1808);
    int _1892 = _941 * _1848;
    int _1894 = _1892 + _1134;
    float _1896 = _1836 * _1836;
    int _1898 = _1886 * as_type<int>(_1742);
    int _1900 = _1898 + _1878;
    int _1902 = ~_1870;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    float _1908 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1890);
    bool _1910 = _1888 >= 0.0;
    float _1912 = fma(_1842, _1842, _1896);
    bool _1914 = !_1048;
    int _1916 = _1914 ? _1894 : (-1);
    int _1918 = _1900 * _1906;
    float _1920 = _1826 * (-2.0);
    float _1922 = fma(_1874, _1874, _1912);
    float _1924 = _1748 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1926 = _1916 * _1870;
    int _1928 = _1926 + _1918;
    float _1930 = fma(_1418, _1920, _1418);
    float _1932 = fma(_1920, _1806, _1806);
    float _1934 = rsqrt(_1922);
    float _1936 = _1696 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1938 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1940 = _1810;
    if (_1910)
    {
        _1758 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1942 = _1758;
    float _1944 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1950 = as_type<int>(_1942);
    if (_1910)
    {
        float _1952 = _1942 * 5.0;
        _1950 = as_type<int>(_1952);
    }
    int _1954 = _1950;
    float _1956 = float(_1928);
    float _1958 = fma(_1456, _1880, _1456);
    bool _1960 = !_1370;
    int _1962 = _1960 ? 0 : 1;
    out.m_68.x = _1946;
    out.m_68.y = _1948;
    out.m_68.z = _1944;
    float _1964 = fma(_1958, _1352, _1908);
    float _1966 = _155 + (-0.5);
    if (_1910)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6354 = as_type<float>(_1954);
        out.gl_Position.z = _6354;
    }
    float _1968 = _1836 * _1934;
    out.m_70.x = _1956;
    if (_1910)
    {
        out.m_49.x = 0.0;
    }
    int _1970 = abs(_1962);
    float _1972 = _1842 * _1934;
    if (_1910)
    {
        return out;
    }
    float _1974 = -_1968;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1644);
    float _1978 = _1874 * _1934;
    float _1980 = -_1972;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _1984 = float(_1628);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1976 + _1986;
    float _1990 = -_1978;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1996 = _1982 + _1994;
    float _1998 = float(_1970);
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2004 = _1992 + _2002;
    float _2006 = -_1968;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1836);
    float _2010 = _1964 * 0.15915493667125701904296875;
    float _2012 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2000);
    float _2014 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1932);
    float _2016 = _1998 * _1984;
    float _2018 = -_1972;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1842);
    float _2022 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2012);
    float _2024 = _2008 * _2008;
    float _2026 = fma(_1930, _1352, _2014);
    float _2028 = _155 + _1226;
    float _2030 = _2016 * (-2.0);
    bool _2032 = _2022 >= 0.0;
    float _2034 = fma(_2020, _2020, _2024);
    float _2036 = -_1978;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1874);
    float _2040 = _2026 * 0.15915493667125701904296875;
    float _2042 = _1226 + (-0.5);
    float _2044 = _2028 + (-1.0);
    float _2046 = fma(_2030, _1810, _1810);
    float _2048 = fma(_2038, _2038, _2034);
    float _2050 = _2010 * 6.283185482025146484375;
    float _2052 = sin(_2050);
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2056 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2046);
    float _2058 = _335 * _897;
    float _2060 = _1978;
    float _2062 = _1982;
    if (_2032)
    {
        _1940 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2064 = _1940;
    float _2066 = fma(_2054, _2030, _2054);
    int _2068 = as_type<int>(_2064);
    if (_2032)
    {
        out.m_49.x = 0.0;
    }
    float _2070 = _2010 * 6.283185482025146484375;
    float _2072 = cos(_2070);
    if (_2032)
    {
        float _2074 = _2064 * 5.0;
        _2068 = as_type<int>(_2074);
    }
    int _2076 = _2068;
    float _2078 = fma(_2066, _1352, _2056);
    if (_2032)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6555 = as_type<float>(_2076);
        out.gl_Position.z = _6555;
    }
    float _2080 = _2078 * 0.15915493667125701904296875;
    float _2082 = _2040 * 6.283185482025146484375;
    float _2084 = sin(_2082);
    float _2086 = sqrt(_2048);
    float _2088 = _2040 * 6.283185482025146484375;
    float _2090 = cos(_2088);
    if (_2032)
    {
        return out;
    }
    float _2092 = _2080 * 6.283185482025146484375;
    float _2094 = cos(_2092);
    float _2096 = _1934 * _2086;
    float _2098 = _2058 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _2102 = _327 * _899;
    float _2104 = _2090 * _2072;
    float _2106 = _2096 * _2098;
    float _2108 = _2084 * _2052;
    float _2110 = _2080 * 6.283185482025146484375;
    float _2112 = sin(_2110);
    float _2114 = _2084 * _2072;
    float _2116 = _2100 * _2106;
    float _2118 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2120 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _331);
    float _2122 = _2090 * _2052;
    float _2124 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2126 = _2124 * 0.5;
    float _2128 = _2096 * _2118;
    float _2130 = _2090 * _2094;
    float _2132 = _2084 * _2094;
    float _2134 = _2072 * _2094;
    float _2136 = _2120 * _2128;
    float _2138 = _2130 * _2116;
    float _2140 = _2052 * _2094;
    float _2142 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2144 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2146 = fma(_2112, _2104, _2108);
    float _2148 = -_2114;
    float _2150 = fma(_2112, _2122, _2148);
    float _2152 = -_2116;
    float _2154 = _2112 * _2152;
    float _2156 = -_2122;
    float _2158 = fma(_2112, _2114, _2156);
    float _2160 = fma(_2146, _2136, _2138);
    float _2162 = _2132 * _2116;
    float _2164 = fma(_2134, _2136, _2154);
    float _2166 = fma(_2112, _2108, _2104);
    float _2168 = fma(_2150, _2126, _2160);
    float _2170 = fma(_2158, _2136, _2162);
    float _2172 = fma(_2140, _2126, _2164);
    float _2174 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2176 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2178 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2180 = fma(_2166, _2126, _2170);
    float _2182 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2184 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2176);
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2178);
    float _2188 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2190 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2182);
    float _2192 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2184);
    float _2194 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2186);
    float _2196 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2198 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2200 = _2192 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2202 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2204 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2174);
    float _2206 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2190);
    float _2208 = _1682 + _2200;
    float _2210 = _1704 + _2202;
    float _2212 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2188);
    float _2214 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2196);
    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2218 = _2208 + _2216;
    float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2222 = _2210 + _2220;
    float _2224 = -_2112;
    float _2226 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2142);
    float _2228 = -_2112;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2144);
    float _2232 = _2218 * _2218;
    float _2234 = _2222 * _2222;
    float _2236 = -_2112;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2198);
    float _2240 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2204);
    float _2242 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2244 = _2232 + _2234;
    float _2246 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2212);
    float _2248 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2250 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2252 = sqrt(_2244);
    float _2254 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2256 = _1644 + _2242;
    float _2258 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2248);
    float _2260 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2250);
    float _2262 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2254);
    float _2264 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2214);
    bool _2266 = _2252 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2268 = _2254;
    float _2270 = _2232;
    float _2272 = _2234;
    float _2274 = _2208;
    float _2276 = _2210;
    float _2278 = _2222;
    float _2280 = _2246;
    float _2282 = _2096;
    if (!_2266)
    {
        _2268 = _2256;
    }
    float _2284 = _2268;
    bool _2286 = !_2266;
    float _2288 = _2284;
    if (!_2286)
    {
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2294 = _2252 + _2292;
        float _2296 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2298 = rsqrt(_2244);
        float _2300 = _2294 * _2290;
        float _2302 = _2300 * 0.15915493667125701904296875;
        float _2304 = _2302 * 6.283185482025146484375;
        float _2306 = sin(_2304);
        float _2308 = _2302 * 6.283185482025146484375;
        float _2310 = cos(_2308);
        float _2312 = fma(_2306, _2296, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2314 = _2298 * _2312;
        float _2316 = fma(_2218, _2314, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2318 = _2310 + (-1.0);
        float _2320 = fma(_2222, _2314, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2324 = _2316 + _2322;
        float _2326 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2330 = _2320 + _2328;
        float _2332 = _2324 * _2324;
        float _2334 = fma(_2256, _2310, _2326);
        float _2336 = _2330 * _2330;
        _2288 = _2334;
        _2270 = _2332;
        _2272 = _2336;
        _2274 = _2316;
        _2276 = _2320;
    }
    float _2338 = _2288;
    float _2340 = _2270;
    float _2342 = _2272;
    float _2344 = _2274;
    float _2346 = _2276;
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2350 = _2338 + _2348;
    float _2352 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2226);
    float _2354 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2356 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2358 = fma(_2350, _2350, _2340);
    float _2360 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    float _2362 = _331 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2364 = _2356 * _2352;
    float _2366 = _2358 + _2342;
    float _2368 = _2356 * _2354;
    float _2370 = _2356 * _2360;
    float _2372 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2258);
    float _2374 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2260);
    float _2376 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2262);
    float _2378 = sqrt(_2366);
    float _2380 = fma(_2362, _2246, _2364);
    float _2382 = fma(_2362, _2240, _2368);
    float _2384 = fma(_2362, _2264, _2370);
    float _2386 = _2372 + _2380;
    float _2388 = _2374 + _2382;
    float _2390 = _2376 + _2384;
    out.m_72.x = _2386;
    out.m_72.y = _2388;
    out.m_72.z = _2390;
    bool _2392 = _2378 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2394 = isnan(_2378);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2400 = _2396 || _2398;
    if (!_2400)
    {
        _2278 = 1.0;
    }
    float _2402 = _2278;
    bool _2404 = !_2400;
    float _2406 = _2402;
    if (!_2404)
    {
        bool _2408 = _2378 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2410 = isnan(_2378);
        bool _2412 = _2408 || _2410;
        bool _2414 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2416 = _2412 || _2414;
        if (!_2416)
        {
            float _2418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2420 = _2378 + _2418;
            float _2422 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2424 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2422;
            float _2426 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2428 = _2426 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2430 = 1.0 / _2424;
            float _2432 = _2420 * _2430;
            float _2434 = fma(_2432, _2428, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2406 = _2434;
            _2436 = true;
        }
        else
        {
            bool _2438 = _2378 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2440 = isnan(_2378);
            bool _2442 = _2438 || _2440;
            bool _2444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2446 = _2442 || _2444;
            if (!_2446)
            {
                float _2448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2450 = _2378 + _2448;
                float _2452 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2454 = _2452 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2456 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2458 = _2456 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2460 = 1.0 / _2454;
                float _2462 = _2450 * _2460;
                float _2464 = fma(_2462, _2458, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2406 = _2464;
                _2436 = true;
            }
            else
            {
                _2406 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2436 = false;
    float _2466 = _2406;
    float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2470 = _2338 + _2468;
    float _2472 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2474 = _2344 + _2472;
    float _2476 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2478 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2480 = _2346 + _2478;
    float _2482 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2484 = fma(_2474, _2466, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2486 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2476);
    float _2488 = fma(_2480, _2466, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2490 = -_1644;
    float _2492 = _2490 + _2482;
    float _2494 = -_1682;
    float _2496 = _2494 + _2484;
    float _2498 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2486);
    float _2500 = -_1704;
    float _2502 = _2500 + _2488;
    float _2504 = _2492 * _2492;
    float _2506 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2508 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2510 = fma(_2496, _2496, _2504);
    float _2512 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2506);
    float _2514 = 1.0 / _2508;
    float _2516 = fma(_2502, _2502, _2510);
    float _2518 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2512);
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2522 = sqrt(_2516);
    float _2524 = _2520 + _2508;
    float _2526 = _2524 * _2514;
    float _2528 = _2526 * 0.5;
    bool _2530 = _2522 > 0.0;
    float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2534 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2532);
    bool _2536 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan(0.5);
    bool _2544 = _2540 || _2542;
    float _2546 = 1.0 / _2534;
    bool _2548 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan(0.5);
    bool _2556 = _2552 || _2554;
    float _2558 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2560 = _2488;
    float _2562 = _2484;
    if (!_2530)
    {
        _2558 = _2482;
    }
    float _2564 = _2558;
    bool _2566 = !_2530;
    float _2568 = _2564;
    if (!_2566)
    {
        float _2570 = _319 * _319;
        float _2572 = fma(_231, _231, _2570);
        float _2574 = rsqrt(_2516);
        float _2576 = fma(_323, _323, _2572);
        float _2578 = sqrt(_2576);
        float _2580 = _2496 * _2574;
        float _2582 = _2492 * _2574;
        float _2584 = _2502 * _2574;
        bool _2586 = _2578 > 0.0;
        float _2588 = _2578;
        _2280 = _2576;
        if (!_2586)
        {
            _2588 = _2482;
        }
        float _2590 = _2588;
        bool _2592 = !_2586;
        _2568 = _2590;
        if (!_2592)
        {
            float _2594 = rsqrt(_2576);
            float _2596 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2598 = _319 * _2594;
            float _2600 = _231 * _2594;
            float _2602 = _2582 * _2598;
            float _2604 = _323 * _2594;
            float _2606 = fma(_2580, _2600, _2602);
            float _2608 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2610 = fma(_2584, _2604, _2606);
            float _2612 = _2610 * _2608;
            float _2614 = fma(_231, _2612, _2484);
            float _2616 = fma(_319, _2612, _2482);
            float _2618 = fma(_323, _2612, _2488);
            _2560 = _2618;
            _2562 = _2614;
            _2568 = _2616;
            _2280 = _2594;
        }
    }
    float _2620 = _2560;
    float _2622 = _2562;
    float _2624 = _2568;
    float _2626 = _2280;
    float _2628 = -_1978;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2620);
    float _2632 = -_1972;
    float _2634 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2622);
    float _2636 = -_1968;
    float _2638 = fma(_2636, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2624);
    float _2640 = _2638;
    float _2642 = _2634;
    float _2644 = _2630;
    float _2646 = _2622;
    float _2648 = _2626;
    if (_2544)
    {
        _2060 = 1.0;
    }
    float _2650 = _2060;
    float _2652 = _2650;
    if (!_2556)
    {
        float _2654 = _1988 * _1988;
        float _2656 = 1.0 / _2096;
        float _2658 = -_1682;
        float _2660 = _2658 + _2622;
        float _2662 = -_1644;
        float _2664 = _2662 + _2624;
        float _2666 = fma(_1996, _1996, _2654);
        float _2668 = -_1704;
        float _2670 = _2668 + _2620;
        float _2672 = fma(_2004, _2004, _2666);
        float _2674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2676 = sqrt(_2672);
        float _2678 = precise::min(_2676, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2680 = _2678 * _2674;
        float _2682 = _2680 * _2656;
        float _2684 = fma(_2660, _2682, _1982);
        float _2686 = fma(_2664, _2682, _1976);
        float _2688 = fma(_2670, _2682, _1992);
        _2282 = _2656;
        _2640 = _2686;
        _2642 = _2684;
        _2644 = _2688;
    }
    float _2690 = _2282;
    float _2692 = _2640;
    float _2694 = _2642;
    float _2696 = _2644;
    float _2698 = _2690;
    if (_2544)
    {
        _2062 = 1.0;
    }
    float _2700 = _2062;
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2704 = _2546 * _2702;
    float _2706 = _2700;
    if (!_2544)
    {
        float _2708 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2710 = _2708 * 0.15915493667125701904296875;
        float _2712 = _2710 * 6.283185482025146484375;
        float _2714 = cos(_2712);
        float _2716 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2718 = _2716 * 0.15915493667125701904296875;
        float _2720 = _2710 * 6.283185482025146484375;
        float _2722 = sin(_2720);
        float _2724 = 1.0 / _2714;
        float _2726 = _2718 * 6.283185482025146484375;
        float _2728 = cos(_2726);
        float _2730 = _2722 * _2724;
        float _2732 = _2718 * 6.283185482025146484375;
        float _2734 = sin(_2732);
        float _2736 = _2728 * _2730;
        float _2738 = 1.0 / _2736;
        float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2742 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2740;
        float _2744 = 1.0 / _2742;
        float _2746 = _2734 * _2738;
        float _2748 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2750 = fma(_2704, _2746, _2748);
        float _2752 = _2750 * _2744;
        float _2754 = precise::clamp(_2752, 0.0, 1.0);
        _2652 = _2754;
    }
    float _2756 = _2652;
    if (!_2544)
    {
        float _2758 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2760 = _2758 * 0.15915493667125701904296875;
        float _2762 = _2760 * 6.283185482025146484375;
        float _2764 = cos(_2762);
        float _2766 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2768 = _2766 * 0.15915493667125701904296875;
        float _2770 = _2760 * 6.283185482025146484375;
        float _2772 = sin(_2770);
        float _2774 = 1.0 / _2764;
        float _2776 = _2768 * 6.283185482025146484375;
        float _2778 = cos(_2776);
        float _2780 = _2772 * _2774;
        float _2782 = _2768 * 6.283185482025146484375;
        float _2784 = sin(_2782);
        float _2786 = _2778 * _2780;
        float _2788 = 1.0 / _2786;
        float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2792 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2790;
        float _2794 = 1.0 / _2792;
        float _2796 = _2784 * _2788;
        float _2798 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2800 = fma(_2704, _2796, _2798);
        float _2802 = _2800 * _2794;
        float _2804 = precise::clamp(_2802, 0.0, 1.0);
        float _2806 = -_2804;
        float _2808 = _2806 + 1.0;
        _2698 = _2788;
        _2706 = _2808;
    }
    float _2810 = _2698;
    float _2812 = _2706;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2816 = _2692 + _2814;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2820 = _2694 + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2824 = _2696 + _2822;
    float _2826 = _2816 * _2816;
    float _2828 = fma(_2820, _2820, _2826);
    float _2830 = fma(_2824, _2824, _2828);
    float _2832 = rsqrt(_2830);
    float _2834 = sqrt(_2830);
    float _2836 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2838 = _2820 * _2836;
    float _2840 = _2824 * _2836;
    float _2842 = _2838 * _2838;
    float _2844 = _2840 * _2840;
    float _2846 = _2842 + _2844;
    float _2848 = sqrt(_2846);
    bool _2850 = _2848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2854 = _2848 + _2852;
    float _2856 = _2810;
    float _2858 = _2846;
    float _2860 = _2854;
    float _2862 = _2816;
    float _2864 = _2838;
    if (_2850)
    {
        float _2866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2856 = _2866;
    }
    float _2868 = _2856;
    if (_2850)
    {
        float _2870 = rsqrt(_2846);
        _2858 = _2870;
    }
    float _2872 = _2858;
    if (_2850)
    {
        float _2874 = _2854 * _2868;
        _2860 = _2874;
    }
    float _2876 = _2860;
    if (_2850)
    {
        float _2878 = _2876 * 0.15915493667125701904296875;
        _2646 = _2878;
    }
    float _2880 = _2646;
    float _2882 = _2824;
    float _2884 = _2880;
    if (_2850)
    {
        float _2886 = _2880 * 6.283185482025146484375;
        float _2888 = sin(_2886);
        _2882 = _2888;
    }
    float _2890 = _2882;
    float _2892 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2894 = precise::max(0.0, _2892);
    float _2896 = _2868;
    float _2898 = _2894;
    if (_2850)
    {
        float _2900 = _2880 * 6.283185482025146484375;
        float _2902 = cos(_2900);
        _2896 = _2902;
    }
    float _2904 = _2896;
    float _2906 = -_2836;
    float _2908 = -_2894;
    float _2910 = fma(_2816, _2906, _2908);
    if (_2850)
    {
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2862 = _2912;
    }
    float _2914 = _2862;
    float _2916 = _2890;
    float _2918 = _2914;
    if (_2850)
    {
        float _2920 = fma(_2890, _2914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2916 = _2920;
    }
    float _2922 = _2916;
    float _2924 = _2922;
    if (!_2850)
    {
        _2918 = _2910;
    }
    float _2926 = _2918;
    float _2928 = _2926;
    float _2930 = _2904;
    if (_2850)
    {
        float _2932 = _2904 + (-1.0);
        _2898 = _2932;
    }
    float _2934 = _2898;
    float _2936 = _2934;
    if (_2850)
    {
        float _2938 = _2872 * _2922;
        _2648 = _2938;
    }
    float _2940 = _2648;
    if (!_2850)
    {
        _2924 = _2842;
    }
    float _2942 = _2924;
    float _2944 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2946 = _2942;
    if (_2850)
    {
        float _2948 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2884 = _2948;
    }
    float _2950 = _2884;
    if (_2850)
    {
        float _2952 = _2838 * _2940;
        _2864 = _2952;
    }
    float _2954 = _2864;
    if (!_2850)
    {
        _2936 = _2840;
    }
    float _2956 = _2936;
    float _2958 = _2956;
    if (_2850)
    {
        float _2960 = _2840 * _2940;
        _2958 = _2960;
    }
    float _2962 = _2958;
    if (_2850)
    {
        float _2964 = fma(_2910, _2904, _2950);
        _2928 = _2964;
    }
    float _2966 = _2928;
    if (_2850)
    {
        float _2968 = _2954 * _2954;
        _2946 = _2968;
    }
    float _2970 = _2946;
    if (!_2850)
    {
        _2930 = _2844;
    }
    float _2972 = _2930;
    float _2974 = _2972;
    if (_2850)
    {
        float _2976 = _2962 * _2962;
        _2974 = _2976;
    }
    float _2978 = _2974;
    float _2980 = fma(_2966, _2966, _2970);
    float _2982 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2984 = _2980 + _2978;
    float _2986 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2982);
    float _2988 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2992 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2990);
    float _2994 = precise::clamp(_2992, 0.0, 1.0);
    float _2996 = rsqrt(_2984);
    float _2998 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3000 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2988);
    float _3002 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2986);
    float _3004 = -_2994;
    float _3006 = _3004 + 1.0;
    float _3008 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2998);
    float _3010 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3000);
    float _3012 = _3002 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3016 = abs(_3006);
    float _3018 = log2(_3016);
    float _3020 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3008);
    float _3022 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2944);
    float _3024 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3026 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3028 = _3020 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3030 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3022);
    float _3032 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3034 = _2996 * _2954;
    float _3036 = -_3026;
    float _3038 = fma(_3036, _3014, 1.0);
    float _3040 = _2996 * _2966;
    float _3042 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3032);
    float _3044 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3046 = _2996 * _2962;
    float _3048 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3050 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3042);
    float _3052 = -_3044;
    float _3054 = fma(_3040, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3052);
    float _3056 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3058 = log2(_3038);
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3050);
    float _3062 = -_3046;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3054);
    float _3066 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3068 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3070 = fma(_3064, -0.5, 0.5);
    float _3072 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3066);
    float _3074 = exp2(_3056);
    float _3076 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3068);
    float _3078 = fma(_3064, 0.5, 0.5);
    float _3080 = _3040 + 1.0;
    float _3082 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3072);
    float _3084 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3076);
    float _3086 = 1.0 / _3060;
    float _3088 = fma(_3078, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3090 = fma(_3078, _3088, -0.212114393711090087890625);
    float _3092 = sqrt(_3070);
    float _3094 = -_3040;
    float _3096 = fma(_3074, _3080, _3094);
    float _3098 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3082);
    float _3100 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3084);
    float _3102 = _3058 * 0.693147182464599609375;
    float _3104 = fma(_3078, _3090, 1.570728778839111328125);
    float _3106 = fma(_3096, 0.5, 0.5);
    float _3108 = _3098 * _3086;
    float _3110 = _3100 * _3086;
    float _3112 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3114 = fma(_3108, 0.5, 0.5);
    float _3116 = fma(_3110, -0.5, 0.5);
    float _3118 = _3092 * 0.636619746685028076171875;
    float3 _8241 = float3(_3114, _3116, _3112);
    float _3120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8241, float3(0.0), isnan(_8241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8241, float3(0.0), isnan(_8241)), level(0.0)).x;
    float _3122 = -_3104;
    float _3124 = fma(_3118, _3122, 1.0);
    float3 _8257 = float3(_3114, _3116, _3112);
    float4 _3127 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8257, float3(0.0), isnan(_8257)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8257, float3(0.0), isnan(_8257)), level(0.0)).xyzw;
    float _3129 = _3127.x;
    float _3131 = _3127.y;
    float _3133 = _3127.z;
    float _3135 = _3127.w;
    float2 _8274 = float2(_3124, _3106);
    float3 _3139 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8274, float2(0.0), isnan(_8274)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8274, float2(0.0), isnan(_8274)), level(0.0)).xyz;
    float _3141 = _3139.x;
    float _3143 = _3139.y;
    float _3145 = _3139.z;
    float _3147 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3149 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3151 = _3060 * 0.5;
    bool _3153 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3155 = isnan(_2834);
    bool _3157 = _3153 || _3155;
    bool _3159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3161 = _3157 || _3159;
    float _3163 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3149);
    float _3165 = exp2(_3147);
    float _3167 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3163);
    float _3169 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3167);
    float _3171 = fma(_3100, -0.5, _3151);
    float _3173 = _3098 + _3060;
    float _3175 = _3169 + _3060;
    float _3177 = _3173 * 0.5;
    out.gl_Position.x = _3098;
    out.gl_Position.y = _3100;
    out.gl_Position.z = _3169;
    out.gl_Position.w = _3060;
    float _3179 = _3175 * 0.5;
    float _3181 = -_3165;
    float _3183 = _3181 + 1.0;
    float _3185 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _3177;
    out.m_74.y = _3171;
    out.m_74.z = _3179;
    out.m_74.w = _3060;
    float _3187 = -_3185;
    float _3189 = _3187 + 1.0;
    float _3191 = _3100;
    float _3193 = _3098;
    if (!_3161)
    {
        _3191 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3195 = _3191;
    float _3197 = _3195;
    float _3199 = _3195;
    if (!_3161)
    {
        _3193 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3201 = _3193;
    float _3203 = _3185 * _3120;
    float _3205 = _3135 * _3203;
    float _3207 = _3135 * _3189;
    float _3209 = _3145 * _3203;
    float _3211 = fma(_3141, _3205, _3129);
    float _3213 = fma(_3143, _3205, _3131);
    float _3215 = fma(_3135, _3209, _3133);
    float _3217 = _2756 * _2812;
    out.m_76.x = _3211;
    out.m_76.y = _3213;
    out.m_76.z = _3215;
    out.m_76.w = _3207;
    float _3219 = _3217 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3221 = _3217;
    float _3223 = _3201;
    float _3225 = _3201;
    if (!_3161)
    {
        _3221 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3227 = _3221;
    bool _3229 = !_3161;
    float _3231 = _3227;
    float _3233 = _3227;
    if (!_3229)
    {
        bool _3235 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3237 = isnan(_2834);
        bool _3239 = _3235 || _3237;
        bool _3241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3243 = _3239 || _3241;
        if (!_3243)
        {
            float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3247 = _2834 + _3245;
            float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3251 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3249;
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3261 = 1.0 / _3251;
            float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3267 = _3247 * _3261;
            float _3269 = precise::clamp(_3267, 0.0, 1.0);
            float _3271 = fma(_3269, _3255, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3273 = fma(_3269, _3259, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3275 = fma(_3269, _3265, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3225 = _3273;
            _3199 = _3271;
            _3233 = _3275;
            _3277 = true;
        }
        else
        {
            bool _3279 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3281 = isnan(_2834);
            bool _3283 = _3279 || _3281;
            bool _3285 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3287 = _3283 || _3285;
            if (!_3287)
            {
                _3197 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3289 = _3197;
            _3199 = _3289;
            if (!_3287)
            {
                _3223 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3291 = _3223;
            _3225 = _3291;
            if (!_3287)
            {
                _3231 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3293 = _3231;
            bool _3295 = !_3287;
            _3233 = _3293;
            if (!_3295)
            {
                bool _3297 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3299 = isnan(_2834);
                bool _3301 = _3297 || _3299;
                bool _3303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3305 = _3301 || _3303;
                if (!_3305)
                {
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3309 = _2834 + _3307;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3311;
                    float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3323 = 1.0 / _3313;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3329 = _3309 * _3323;
                    float _3331 = precise::clamp(_3329, 0.0, 1.0);
                    float _3333 = fma(_3331, _3317, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3335 = fma(_3331, _3321, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3337 = fma(_3331, _3327, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3225 = _3335;
                    _3199 = _3333;
                    _3233 = _3337;
                    _3277 = true;
                }
                else
                {
                    _3225 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3199 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3233 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3277 = false;
    float _3339 = _3225;
    float _3341 = _3199;
    float _3343 = _3233;
    float _3345 = _3219 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_78.x = 0.0;
    float _3347 = _3339 * 0.586610972881317138671875;
    bool _3349 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _3345;
    float _3351 = fma(_3341, 0.298911988735198974609375, _3347);
    bool _3353 = _2756 > 0.0;
    bool _3355 = isnan(_2756);
    bool _3357 = _3353 || _3355;
    bool _3359 = isnan(0.0);
    bool _3361 = _3357 || _3359;
    float _3363 = fma(_3343, 0.114477999508380889892578125, _3351);
    bool _3365 = _2812 <= 0.0;
    bool _3367 = !_3361;
    bool _3369 = _3365 || _3367;
    float _3371 = -_3363;
    float _3373 = _3371 + _3341;
    float _3375 = -_3363;
    float _3377 = _3375 + _3339;
    float _3379 = -_3363;
    float _3381 = _3379 + _3343;
    float _3383 = fma(_3373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3363);
    float _3385 = fma(_3377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3363);
    float _3387 = fma(_3381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3363);
    bool _3389 = !_3349;
    if (!_3389)
    {
        float _3391 = -_2692;
        float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3395 = -_2694;
        float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3399 = -_2696;
        float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3403 = _3393 * _3393;
        float _3405 = fma(_3397, _3397, _3403);
        float _3407 = fma(_3401, _3401, _3405);
        float _3409 = sqrt(_3407);
        float _3411 = rsqrt(_3407);
        float _3413 = -_3409;
        float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3417 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3419 = precise::clamp(_3417, 0.0, 1.0);
        float _3421 = _3397 * _3411;
        float _3423 = _3393 * _3411;
        float _3425 = abs(_3419);
        float _3427 = log2(_3425);
        float _3429 = _3401 * _3411;
        float _3431 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3433 = _2388 * _3423;
        float _3435 = -_3423;
        float _3437 = -_3431;
        float _3439 = fma(_3435, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3437);
        float _3441 = fma(_2386, _3421, _3433);
        float _3443 = -_3429;
        float _3445 = fma(_3443, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3439);
        float _3447 = fma(_2390, _3429, _3441);
        float _3449 = precise::clamp(_3447, 0.0, 1.0);
        float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3453 = _3445 + _3451;
        float _3455 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3457 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = exp2(_3455);
        float _3463 = _3461 * _3459;
        float _3465 = _3449 * _3463;
        float _3467 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3469 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3471 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _3467;
        out.m_78.y = _3469;
        out.m_78.z = _3471;
    }
    out.m_80.x = _3383;
    out.m_80.y = _3385;
    out.m_80.z = _3387;
    if (!_3369)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3473 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3473;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3277 = false;
    bool _2436 = false;
    bool _923 = false;
    bool _731 = false;
    bool _355 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _94 = in.m_46.w;
    float _96 = trunc(_94);
    int _99 = int(_96);
    bool _103 = _99 >= 1;
    float _105 = 0.0;
    if (!_103)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _107 = _105;
    float _109 = _107;
    if (!_103)
    {
        out.m_49.x = 0.0;
    }
    int _111 = 0;
    if (!_103)
    {
        float _113 = _107 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_103)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3530 = as_type<float>(_115);
        out.gl_Position.z = _3530;
    }
    if (!_103)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_51.w;
    bool _121 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _123 = isnan(_119);
    bool _125 = _121 || _123;
    bool _127 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _129 = _125 || _127;
    float _131 = -_119;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _135 = _133;
    if (_129)
    {
        float _137 = float(_99);
        _109 = _137;
    }
    float _139 = _109;
    bool _141 = _133 >= _139;
    bool _143 = !_129;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_49.x = 0.0;
    }
    if (_145)
    {
        float _151 = _149 * 5.0;
        _117 = as_type<int>(_151);
    }
    int _153 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3600 = as_type<float>(_153);
        out.gl_Position.z = _3600;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = in.m_53.x;
    float _157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _159 = _133 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_58.x;
    float _165 = in.m_58.y;
    float _167 = in.m_58.z;
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _171 = _159 * _157;
    float _173 = _133 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    float _175 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].x, _171);
    float _177 = _173 * _169;
    float _179 = floor(_175);
    float _181 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[20].y, _177);
    int _183 = as_type<int>(_161) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_161) & 2;
    bool _189 = _187 != 0;
    float _191 = _175 * 6.283185482025146484375;
    int _193 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _195 = _193 != 0;
    float _197 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _199 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _201 = _191 * 0.15915493667125701904296875;
    float _203 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _205 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _197);
    float _207 = _181 * 6.283185482025146484375;
    float _209 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _199);
    float _211 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _203);
    float _213 = _201 * 6.283185482025146484375;
    float _215 = cos(_213);
    float _217 = _207 * 0.15915493667125701904296875;
    bool _219 = !_195;
    int _221 = _219 ? 0 : 1;
    float _223 = -_179;
    float _225 = _175 + _223;
    bool _227 = !_189;
    float _229 = _227 ? (-0.5) : 0.5;
    float _231 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    int _233 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _235 = _233 != 0;
    int _237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _239 = _237 != 0;
    float _241 = floor(_181);
    int _243 = abs(_221);
    bool _245 = !_235;
    int _247 = _245 ? 0 : 1;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _251 = abs(_247);
    float _253 = _217 * 6.283185482025146484375;
    float _255 = cos(_253);
    bool _257 = _225 < 0.5;
    float _259 = float(_257);
    float _261 = fma(_215, 0.5, 0.5);
    float _263 = -_259;
    float _265 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _267 = float(_243);
    float _269 = -_241;
    float _271 = _181 + _269;
    float _273 = -_225;
    float _275 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _277 = float(_251);
    float _279 = -_261;
    float _281 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _283 = !_239;
    int _285 = _283 ? 0 : 1;
    float _287 = -_271;
    float _289 = fma(_287, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    bool _291 = _271 < 0.5;
    float _293 = float(_291);
    float _295 = abs(_275);
    float _297 = _277 * _295;
    float _299 = fma(_255, 0.5, 0.5);
    int _301 = abs(_285);
    float _303 = abs(_289);
    float _305 = _277 * _303;
    float _307 = fma(_267, _281, _297);
    float _309 = -_299;
    float _311 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _313 = float(_301);
    float _315 = -_293;
    float _317 = fma(_315, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _319 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _321 = fma(_267, _311, _305);
    float _323 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _211);
    float _325 = abs(_265);
    float _327 = fma(_313, _325, _307);
    bool _329 = !_185;
    float _331 = _329 ? (-0.5) : 0.5;
    float _333 = abs(_317);
    float _335 = fma(_313, _333, _321);
    bool _337 = !_249;
    float _353;
    if (!_337)
    {
        float _339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _341 = _155 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _343 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _345 = _343 * _339;
        float _347 = floor(_345);
        float _349 = -_347;
        float _351 = _345 + _349;
        _353 = _351;
        _355 = true;
    }
    else
    {
        float _357 = float(_99);
        float _359 = 1.0 / _357;
        float _361 = _133 * _359;
        _353 = _361;
    }
    _355 = false;
    float _363 = _353;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _367 = _363 + _365;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _371 = _363 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _373;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _389 = 1.0 / _375;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _397 = _395 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _399 = 1.0 / _383;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _403 = _363 + _401;
    bool _405 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _407 = isnan(_363);
    bool _409 = _405 || _407;
    bool _411 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _413 = _409 || _411;
    float _415 = float(_413);
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _419 = 1.0 / _379;
    float _421 = _403 * _389;
    bool _423 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _425 = isnan(_363);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -_433;
    float _437 = _435 + 1.0;
    float _439 = 1.0 / _387;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _441;
    float _445 = _367 * _399;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _449 = _363 + _447;
    bool _451 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _453 = isnan(_363);
    bool _455 = _451 || _453;
    bool _457 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = 1.0 / _393;
    float _465 = _371 * _419;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _469 = _363 + _467;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _473 = _363 + _471;
    float _475 = 1.0 / _397;
    float _477 = _449 * _439;
    bool _479 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _481 = isnan(_363);
    bool _483 = _479 || _481;
    bool _485 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _487 = _483 || _485;
    float _489 = float(_487);
    float _491 = -_461;
    float _493 = _491 + 1.0;
    float _495 = 1.0 / _443;
    float _497 = _469 * _463;
    bool _499 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _501 = isnan(_363);
    bool _503 = _499 || _501;
    bool _505 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _507 = _503 || _505;
    float _509 = float(_507);
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _513 = _363 + _511;
    float _515 = -_509;
    float _517 = _515 + 1.0;
    float _519 = _513 * _475;
    float _521 = _461 * _437;
    bool _523 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _525 = isnan(_363);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = _489 * _493;
    float _537 = -_489;
    float _539 = _537 + 1.0;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _541;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _547 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _545;
    float _549 = -_533;
    float _551 = _549 + 1.0;
    float _553 = _533 * _539;
    float _555 = _473 * _495;
    bool _557 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _559 = isnan(_363);
    bool _561 = _557 || _559;
    bool _563 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _565 = _561 || _563;
    float _567 = float(_565);
    float _569 = _509 * _551;
    bool _571 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _573 = isnan(_363);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = _415 * _517;
    float _585 = -_415;
    float _587 = _585 + 1.0;
    float _589 = fma(_543, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _591 = fma(_547, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _593 = -_581;
    float _595 = _593 + 1.0;
    float _597 = _581 * _587;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _601 = _599 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _609 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _607;
    float _611 = _567 * _595;
    float _613 = fma(_601, _465, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _615 = fma(_605, _465, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _617 = fma(_609, _445, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _619 = _589 * _611;
    float _621 = -_567;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _625;
    float _629 = _591 * _611;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].x, _619);
    float _637 = fma(_627, _445, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _643 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[143].y, _629);
    float _645 = fma(_613, _597, _635);
    float _647 = fma(_633, _477, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _649 = fma(_615, _597, _643);
    float _651 = fma(_641, _477, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _653;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _657;
    float _661 = fma(_617, _583, _645);
    float _663 = fma(_637, _583, _649);
    float _665 = fma(_655, _497, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _667 = fma(_659, _497, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _671 = _669 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _673 = fma(_647, _569, _661);
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _679 = fma(_651, _569, _663);
    float _681 = fma(_671, _519, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _683;
    float _687 = fma(_665, _553, _673);
    float _689 = fma(_677, _519, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _691;
    float _695 = fma(_667, _553, _679);
    float _697 = fma(_685, _555, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _699 = fma(_681, _535, _687);
    float _701 = fma(_693, _555, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _703 = fma(_689, _535, _695);
    float _705 = fma(_697, _521, _699);
    float _707 = fma(_701, _521, _703);
    float _709 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[150].x, _705);
    float _711 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[150].y, _707);
    bool _713 = !_417;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _717 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[11].x, _133);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_99);
        float _735 = 1.0 / _733;
        float _737 = _133 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _743 = _739 + _741;
    bool _745 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _747 = isnan(_739);
    bool _749 = _745 || _747;
    bool _751 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _753 = _749 || _751;
    float _755 = float(_753);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _759 = _739 + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _763 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _761;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _769 = -_755;
    float _771 = _769 + 1.0;
    float _773 = 1.0 / _763;
    bool _775 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _777 = 1.0 / _767;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _779;
    float _783 = _743 * _773;
    bool _785 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _787 = isnan(_739);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _797;
    bool _801 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _803 = isnan(_739);
    bool _805 = _801 || _803;
    bool _807 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _809 = _805 || _807;
    float _811 = float(_809);
    float _813 = fma(_781, _783, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _815 = fma(_799, _783, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _817 = _811 * _771;
    float _819 = -_811;
    float _821 = _819 + 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _825 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _823;
    float _827 = _759 * _777;
    float _829 = _795 * _821;
    float _831 = fma(_825, _783, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _833 = -_795;
    float _835 = _833 + 1.0;
    float _837 = _813 * _829;
    float _839 = _831 * _829;
    float _841 = _815 * _829;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _855 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[107].x, _839);
    float _857 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[107].y, _837);
    float _859 = fma(_845, _827, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _861 = fma(_849, _827, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _863 = fma(_853, _827, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _865 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[107].z, _841);
    float _867 = fma(_859, _817, _855);
    float _869 = fma(_861, _817, _857);
    float _871 = fma(_863, _817, _865);
    float _873 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].x, _867);
    float _875 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].y, _869);
    float _877 = in.m_60.x;
    float _879 = in.m_60.y;
    float _881 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[109].z, _871);
    float _883 = _873 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _885 = _875 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _889 = _881 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _891 = _883 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _893 = _885 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _895 = _889 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _891;
    out.m_62.y = _893;
    out.m_62.z = _895;
    out.m_62.w = _887;
    float _897 = _711 * _879;
    float _899 = _709 * _877;
    bool _901 = !_775;
    float _919;
    float _921;
    if (!_901)
    {
        float _903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _905 = _155 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[11].z, _133);
        float _909 = _907 * _903;
        float _911 = float(_99);
        float _913 = floor(_909);
        float _915 = -_913;
        float _917 = _909 + _915;
        _919 = _911;
        _921 = _917;
        _923 = true;
    }
    else
    {
        float _925 = float(_99);
        float _927 = 1.0 / _925;
        float _929 = _133 * _927;
        _919 = _925;
        _921 = _929;
    }
    _923 = false;
    float _931 = _919;
    float _933 = _921;
    float _935 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _937 = int(_935);
    float _939 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _941 = int(_939);
    float _943 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _945 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _943);
    float _947 = float(_937);
    float _949 = 1.0 / _931;
    float _951 = float(uint(_941));
    float _953 = 1.0 / _947;
    int _955 = ~_941;
    int _957 = _955 + 1;
    int _959 = ~_941;
    int _961 = _959 + 1;
    float _963 = 1.0 / _951;
    float _965 = _953 * _133;
    float _967 = trunc(_965);
    int _969 = int(_967);
    int _971 = as_type<int>(_963) + (-2);
    float _973 = float(uint(_969));
    float _975 = float(_969);
    float _977 = as_type<float>(_971) * _973;
    float _979 = trunc(_977);
    float _981 = precise::max(_979, 0.0);
    uint _984 = uint(_981);
    int _986 = ~_941;
    int _988 = _986 + 1;
    int _990 = _957 * int(_984);
    int _992 = _990 + _969;
    float _994 = float(uint(_992));
    float _996 = as_type<float>(_971) * _994;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1000 = _998 != 0;
    float _1002 = trunc(_996);
    float _1004 = precise::max(_1002, 0.0);
    uint _1006 = uint(_1004);
    bool _1008 = !_1000;
    float _1010 = _1008 ? 7.345489978790283203125 : 1.0;
    float _1012 = float(_941);
    float _1014 = _1010 * _155;
    bool _1016 = _975 >= _1012;
    bool _1018 = isnan(_975);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan(_1012);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = trunc(_1026);
    int _1030 = int(_1028);
    int _1032 = int(_984) + int(_1006);
    int _1034 = _941 + (-1);
    int _1036 = _988 * _1032;
    int _1038 = _1036 + _969;
    float _1040 = floor(_1014);
    bool _1042 = uint(_1038) >= uint(_941);
    bool _1044 = !_1042;
    int _1046 = _1044 ? 0 : (-1);
    bool _1048 = _941 == 0;
    int _1050 = ~_1032;
    int _1052 = _1050 + _1046;
    int _1054 = _1052 + 1;
    int _1056 = ~_1030;
    int _1058 = _1056 + 1;
    int _1060 = _1058 + 1;
    int _1062 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1064 = _1062 != 0;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1072 = _1070 != 0;
    int _1074 = _941 * _1054;
    int _1076 = _1074 + _969;
    float _1078 = -_1040;
    float _1080 = _1014 + _1078;
    bool _1082 = !_1048;
    int _1084 = _1082 ? _1076 : (-1);
    float _1086 = _1080 * _1012;
    float _1088 = _1012 * _133;
    int _1090 = _1084 * _1060;
    float _1092 = _1088 * _949;
    bool _1094 = !_1068;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = trunc(_1086);
    int _1100 = int(_1098);
    int _1102 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1104 = _1102 != 0;
    int _1106 = _1030 * _1034;
    int _1108 = _1106 + _1090;
    bool _1110 = !_1064;
    int _1112 = _1110 ? 0 : 1;
    bool _1114 = !_1104;
    int _1116 = _1114 ? 0 : 1;
    int _1118 = abs(_1096);
    float _1120 = trunc(_1092);
    int _1122 = int(_1120);
    int _1124 = abs(_1116);
    bool _1126 = !_1072;
    int _1128 = _1126 ? 0 : 1;
    int _1130 = abs(_1112);
    int _1132 = _1100 * _1124;
    int _1134 = _1132 + _969;
    int _1136 = abs(_1128);
    float _1138 = _155 * 2.0;
    int _1140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1142 = _1140 != 0;
    int _1144 = _1108 * _1118;
    float _1146 = in.m_53.y;
    bool _1148 = !_1142;
    int _1150 = _1148 ? 0 : 1;
    float _1152 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1154 = log2(_1152);
    bool _1156 = _155 > 0.5;
    int _1158 = _1122 * _1130;
    int _1160 = _1158 + _1144;
    int _1162 = abs(_1150);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1166 = _1164 != 0;
    int _1168 = _1134 * _1136;
    int _1170 = _1168 + _1160;
    float _1172 = floor(_1138);
    int _1174 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1176 = _1174 != 0;
    int _1178 = _1100 * _1162;
    int _1180 = _1178 + _1170;
    int _1182 = ~_941;
    int _1184 = _1182 + 1;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1188 = _1186 != 0;
    float _1190 = float(uint(_1180));
    float _1192 = _1154 * _133;
    float _1194 = as_type<float>(_971) * _1190;
    float _1196 = _1146 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1198 = _1146 * 2.0;
    float _1200 = trunc(_1194);
    float _1202 = precise::max(_1200, 0.0);
    uint _1204 = uint(_1202);
    bool _1206 = _1172 > 0.0;
    bool _1208 = _1172 >= 0.0;
    bool _1210 = isnan(_1172);
    bool _1212 = _1208 || _1210;
    bool _1214 = isnan(0.0);
    bool _1216 = _1212 || _1214;
    float _1218 = exp2(_1192);
    float _1220 = _155 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1222 = _1184 * int(_1204);
    int _1224 = _1222 + _1180;
    float _1226 = in.m_53.z;
    float _1228 = floor(_1198);
    float _1230 = float(uint(_1224));
    float _1232 = -_1218;
    float _1234 = _1232 + 1.0;
    float _1236 = as_type<float>(_971) * _1230;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1240 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1242 = -_1238;
    float _1244 = fma(_1220, 2.0, _1242);
    float _1246 = -_331;
    int _1248 = _1156 ? as_type<int>(_1246) : as_type<int>(_331);
    float _1250 = trunc(_1236);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    float _1256 = fma(_1196, -2.0, _1240);
    bool _1258 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1260 = isnan(0.0);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1266 = _1262 || _1264;
    float _1268 = -_133;
    float _1270 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1244);
    bool _1272 = !_1166;
    float _1274 = _1272 ? _331 : as_type<float>(_1248);
    bool _1276 = _1146 > 0.5;
    float _1278 = in.m_46.x;
    float _1280 = in.m_46.y;
    float _1282 = in.m_46.z;
    float _1284 = _1266 ? _1234 : 0.0;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1288 = -_229;
    int _1290 = _1276 ? as_type<int>(_1288) : as_type<int>(_229);
    float _1292 = _1274 + 0.5;
    bool _1294 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1296 = isnan(1.0);
    bool _1298 = _1294 || _1296;
    bool _1300 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1302 = _1298 || _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1306 = 1.0 + _1304;
    float _1308 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1286);
    float _1310 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1256);
    int _1312 = int(_1204) + int(_1254);
    float _1314 = 1.0 / _1306;
    float _1316 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1316;
    bool _1320 = !_1188;
    float _1322 = _1320 ? _229 : as_type<float>(_1290);
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1326 = _1324 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1328 = _961 * _1312;
    int _1330 = _1328 + _1180;
    float _1332 = 1.0 / _1318;
    bool _1334 = uint(_1330) >= uint(_941);
    float _1336 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _945);
    float _1338 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1308);
    float _1340 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1342 = _933 + _1340;
    float _1344 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1346 = -_1338;
    float _1348 = _1346 + 1.0;
    if (_1302)
    {
        float _1350 = _1284 * _1314;
        _135 = _1350;
    }
    float _1352 = _135;
    bool _1354 = !_1334;
    int _1356 = _1354 ? 0 : (-1);
    float _1358 = 1.0 / _1326;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1370 = _1368 != 0;
    float _1372 = _1226 * 2.0;
    float _1374 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1376 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1378 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1344);
    int _1380 = ~_1312;
    int _1382 = _1380 + _1356;
    int _1384 = _1382 + 1;
    float _1386 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1374);
    float _1388 = floor(_1372);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1392 = _933 + _1390;
    float _1394 = fma(_1278, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1376);
    float _1396 = _155 + _1146;
    float _1398 = -_1336;
    float _1400 = _1398 + 1.0;
    float _1402 = _1392 * _1332;
    int _1404 = _1216 ? 0 : 1;
    float _1406 = _1396 + (-1.0);
    float _1408 = _1146 + _1226;
    float _1410 = _1342 * _1358;
    int _1412 = ~_1404;
    int _1414 = _1412 + 1;
    int _1416 = _1414 + 1;
    float _1418 = fma(_1406, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1420 = _1416;
    if (!_1206)
    {
        int _1422 = ~_1404;
        int _1424 = _1422 + 1;
        _1420 = _1424;
    }
    int _1426 = _1420;
    float _1428 = _1408 + (-1.0);
    float _1430 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1394);
    bool _1432 = _1388 >= 0.0;
    bool _1434 = isnan(_1388);
    bool _1436 = _1432 || _1434;
    bool _1438 = isnan(0.0);
    bool _1440 = _1436 || _1438;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1442;
    bool _1446 = _1228 >= 0.0;
    bool _1448 = isnan(_1228);
    bool _1450 = _1446 || _1448;
    bool _1452 = isnan(0.0);
    bool _1454 = _1450 || _1452;
    float _1456 = fma(_1428, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1458 = _1440 ? 0 : 1;
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1460;
    bool _1464 = _1388 > 0.0;
    float _1466 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1386);
    float _1468 = fma(_1282, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1378);
    bool _1470 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1472 = isnan(_933);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1478 = _1474 || _1476;
    float _1480 = float(_1478);
    float _1482 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1482;
    int _1486 = _1454 ? 0 : 1;
    float _1488 = fma(_1462, _1402, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1490 = _1228 > 0.0;
    float _1492 = -_1480;
    float _1494 = _1492 + 1.0;
    bool _1496 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1498 = isnan(_933);
    bool _1500 = _1496 || _1498;
    bool _1502 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1504 = _1500 || _1502;
    float _1506 = float(_1504);
    float _1508 = fma(_1484, _1402, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1510 = fma(_1444, _1402, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1512 = _933 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1514 = isnan(_933);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1520 = _1516 || _1518;
    float _1522 = float(_1520);
    int _1524 = _941 * _1384;
    int _1526 = _1524 + _1180;
    float _1528 = _1506 * _1494;
    float _1530 = -_1506;
    float _1532 = _1530 + 1.0;
    float _1534 = float(uint(_1134));
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1544 = _1522 * _1532;
    float _1546 = -_1522;
    float _1548 = _1546 + 1.0;
    float _1550 = as_type<float>(_971) * _1534;
    float _1552 = fma(_1538, _1410, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1554 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1270);
    bool _1556 = !_1048;
    int _1558 = _1556 ? _1526 : (-1);
    float _1560 = fma(_1542, _1410, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1562 = _1510 * _1544;
    float _1564 = trunc(_1550);
    float _1566 = precise::max(_1564, 0.0);
    uint _1568 = uint(_1566);
    int _1570 = _1558 >> 31;
    float _1572 = _1508 * _1544;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1576 = _1574 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1578 = _1488 * _1544;
    int _1580 = _1570 & 3;
    float _1582 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1572);
    float _1584 = fma(_1576, _1410, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _1586 = ~_941;
    int _1588 = _1586 + 1;
    float _1590 = _1322 + (-0.5);
    int _1592 = _1558 + _1580;
    float _1594 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1578);
    float _1596 = fma(_1552, _1528, _1582);
    float _1598 = -_1590;
    float _1600 = -_1310;
    float _1602 = fma(_1598, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1600);
    int _1604 = _1592 >> 2;
    float _1606 = -_1400;
    float _1608 = fma(_1274, _1606, _1554);
    int _1610 = _1588 * int(_1568);
    int _1612 = _1610 + _1134;
    int _1614 = ~_1486;
    int _1616 = _1614 + 1;
    int _1618 = _1616 + 1;
    float _1620 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1562);
    int _1622 = _1618;
    if (!_1490)
    {
        int _1624 = ~_1486;
        int _1626 = _1624 + 1;
        _1622 = _1626;
    }
    int _1628 = _1622;
    float _1630 = fma(_1322, _1348, _1602);
    int _1632 = _1604 << 4;
    int _1634 = _1632 + 368;
    float _1636 = fma(_1584, _1528, _1620);
    int _1638 = ~_1458;
    int _1640 = _1638 + 1;
    int _1642 = _1640 + 1;
    float _1644 = _1468 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1646 = float(uint(_1612));
    out.m_64.x = _1608;
    out.m_64.y = _1630;
    int _1648 = _1642;
    if (!_1464)
    {
        int _1650 = ~_1458;
        int _1652 = _1650 + 1;
        _1648 = _1652;
    }
    int _1654 = _1648;
    uint _1656 = uint(int(uint(_1634) >> uint(2)));
    uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
    int _1660 = int(_1656) & 3;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[int(_1658)][_1660];
    int _1664 = int(_1656) + 1;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    int _1668 = _1664 & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    bool _1672 = !_1366;
    int _1674 = _1672 ? 0 : 1;
    float _1676 = as_type<float>(_971) * _1646;
    int _1678 = _1558 & 3;
    bool _1680 = _1678 != 0;
    float _1682 = _1466 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1684 = abs(_1674);
    float _1686 = fma(_1560, _1528, _1594);
    bool _1688 = uint(_1678) > 1u;
    float _1690 = trunc(_1676);
    float _1692 = precise::max(_1690, 0.0);
    uint _1694 = uint(_1692);
    float _1696 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1686);
    float _1698 = float(_1426);
    float _1700 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1596);
    float _1702 = float(_1684);
    float _1704 = _1430 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1706 = ~_941;
    int _1708 = _1706 + 1;
    float _1710 = _1146 + (-0.5);
    float _1712 = float(_1654);
    float _1714 = _1702 * _1698;
    bool _1716 = !_1362;
    int _1718 = _1716 ? 0 : 1;
    int _1720 = _1558 & 3;
    bool _1722 = _1720 != 0;
    int _1724 = abs(_1718);
    int _1726 = _1634 + 8;
    uint _1728 = uint(int(uint(_1726) >> uint(2)));
    uint _1730 = uint(int(uint(int(_1728)) >> uint(2)));
    int _1732 = int(_1728) & 3;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[int(_1730)][_1732];
    int _1736 = int(_1728) + 1;
    uint _1738 = uint(int(uint(_1736) >> uint(2)));
    int _1740 = _1736 & 3;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[int(_1738)][_1740];
    int _1744 = _1722 ? 0 : 1;
    int _1746 = int(_1568) + int(_1694);
    float _1748 = fma(_1480, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1636);
    int _1750 = ~_1744;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    int _1756 = _1754;
    float _1758 = _1710;
    if (!_1688)
    {
        int _1760 = ~_1744;
        int _1762 = _1760 + 1;
        _1756 = _1762;
    }
    int _1764 = _1756;
    int _1766 = _1708 * _1746;
    int _1768 = _1766 + _1134;
    bool _1770 = !_1680;
    int _1772 = _1770 ? 0 : 1;
    int _1774 = abs(_1764);
    int _1776 = abs(_1772);
    bool _1778 = _1678 != 3;
    int _1780 = ~_1774;
    int _1782 = _1780 + 1;
    int _1784 = _1782 + 1;
    int _1786 = ~_1776;
    int _1788 = _1786 + 1;
    int _1790 = _1788 + 1;
    bool _1792 = uint(_1678) >= 2u;
    int _1794 = _1784 * as_type<int>(_1670);
    bool _1796 = uint(_1768) >= uint(_941);
    int _1798 = _1792 ? 0 : 1;
    int _1800 = _1790 * as_type<int>(_1662);
    int _1802 = _1800 + _1794;
    float _1804 = float(_1724);
    float _1806 = in.m_66.x;
    float _1808 = in.m_66.y;
    float _1810 = in.m_66.z;
    int _1812 = ~_1798;
    int _1814 = _1812 + 1;
    int _1816 = _1814 + 1;
    int _1818 = _1816;
    if (_1778)
    {
        int _1820 = ~_1798;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    float _1826 = _1804 * _1712;
    bool _1828 = !_1796;
    int _1830 = _1828 ? 0 : (-1);
    bool _1832 = _1678 != 3;
    float _1834 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1836 = _1644 + _1834;
    int _1838 = abs(_1824);
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1842 = _1682 + _1840;
    int _1844 = ~_1746;
    int _1846 = _1844 + _1830;
    int _1848 = _1846 + 1;
    float _1850 = _1836 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1852 = !_1832;
    int _1854 = _1852 ? 0 : (-1);
    bool _1856 = !_1176;
    int _1858 = _1856 ? 0 : 1;
    float _1860 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1850);
    int _1862 = ~_1838;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    int _1868 = abs(_1854);
    int _1870 = abs(_1858);
    float _1872 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1874 = _1704 + _1872;
    int _1876 = _1866 * as_type<int>(_1734);
    int _1878 = _1876 + _1802;
    float _1880 = _1714 * (-2.0);
    int _1882 = ~_1868;
    int _1884 = _1882 + 1;
    int _1886 = _1884 + 1;
    float _1888 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1860);
    float _1890 = fma(_1880, _1808, _1808);
    int _1892 = _941 * _1848;
    int _1894 = _1892 + _1134;
    float _1896 = _1836 * _1836;
    int _1898 = _1886 * as_type<int>(_1742);
    int _1900 = _1898 + _1878;
    int _1902 = ~_1870;
    int _1904 = _1902 + 1;
    int _1906 = _1904 + 1;
    float _1908 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1890);
    bool _1910 = _1888 >= 0.0;
    float _1912 = fma(_1842, _1842, _1896);
    bool _1914 = !_1048;
    int _1916 = _1914 ? _1894 : (-1);
    int _1918 = _1900 * _1906;
    float _1920 = _1826 * (-2.0);
    float _1922 = fma(_1874, _1874, _1912);
    float _1924 = _1748 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1926 = _1916 * _1870;
    int _1928 = _1926 + _1918;
    float _1930 = fma(_1418, _1920, _1418);
    float _1932 = fma(_1920, _1806, _1806);
    float _1934 = rsqrt(_1922);
    float _1936 = _1696 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1938 = _1700 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1940 = _1810;
    if (_1910)
    {
        _1758 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1942 = _1758;
    float _1944 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1946 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1948 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1950 = as_type<int>(_1942);
    if (_1910)
    {
        float _1952 = _1942 * 5.0;
        _1950 = as_type<int>(_1952);
    }
    int _1954 = _1950;
    float _1956 = float(_1928);
    float _1958 = fma(_1456, _1880, _1456);
    bool _1960 = !_1370;
    int _1962 = _1960 ? 0 : 1;
    out.m_68.x = _1946;
    out.m_68.y = _1948;
    out.m_68.z = _1944;
    float _1964 = fma(_1958, _1352, _1908);
    float _1966 = _155 + (-0.5);
    if (_1910)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6354 = as_type<float>(_1954);
        out.gl_Position.z = _6354;
    }
    float _1968 = _1836 * _1934;
    out.m_70.x = _1956;
    if (_1910)
    {
        out.m_49.x = 0.0;
    }
    int _1970 = abs(_1962);
    float _1972 = _1842 * _1934;
    if (_1910)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1974 = -_1968;
    float _1976 = fma(_1974, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1644);
    float _1978 = _1874 * _1934;
    float _1980 = -_1972;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _1984 = float(_1628);
    float _1986 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1988 = _1976 + _1986;
    float _1990 = -_1978;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1704);
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1996 = _1982 + _1994;
    float _1998 = float(_1970);
    float _2000 = _1988 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2004 = _1992 + _2002;
    float _2006 = -_1968;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1836);
    float _2010 = _1964 * 0.15915493667125701904296875;
    float _2012 = fma(_1996, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2000);
    float _2014 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1932);
    float _2016 = _1998 * _1984;
    float _2018 = -_1972;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1842);
    float _2022 = fma(_2004, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2012);
    float _2024 = _2008 * _2008;
    float _2026 = fma(_1930, _1352, _2014);
    float _2028 = _155 + _1226;
    float _2030 = _2016 * (-2.0);
    bool _2032 = _2022 >= 0.0;
    float _2034 = fma(_2020, _2020, _2024);
    float _2036 = -_1978;
    float _2038 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1874);
    float _2040 = _2026 * 0.15915493667125701904296875;
    float _2042 = _1226 + (-0.5);
    float _2044 = _2028 + (-1.0);
    float _2046 = fma(_2030, _1810, _1810);
    float _2048 = fma(_2038, _2038, _2034);
    float _2050 = _2010 * 6.283185482025146484375;
    float _2052 = sin(_2050);
    float _2054 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2056 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2046);
    float _2058 = _335 * _897;
    float _2060 = _1978;
    float _2062 = _1982;
    if (_2032)
    {
        _1940 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2064 = _1940;
    float _2066 = fma(_2054, _2030, _2054);
    int _2068 = as_type<int>(_2064);
    if (_2032)
    {
        out.m_49.x = 0.0;
    }
    float _2070 = _2010 * 6.283185482025146484375;
    float _2072 = cos(_2070);
    if (_2032)
    {
        float _2074 = _2064 * 5.0;
        _2068 = as_type<int>(_2074);
    }
    int _2076 = _2068;
    float _2078 = fma(_2066, _1352, _2056);
    if (_2032)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6555 = as_type<float>(_2076);
        out.gl_Position.z = _6555;
    }
    float _2080 = _2078 * 0.15915493667125701904296875;
    float _2082 = _2040 * 6.283185482025146484375;
    float _2084 = sin(_2082);
    float _2086 = sqrt(_2048);
    float _2088 = _2040 * 6.283185482025146484375;
    float _2090 = cos(_2088);
    if (_2032)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2092 = _2080 * 6.283185482025146484375;
    float _2094 = cos(_2092);
    float _2096 = _1934 * _2086;
    float _2098 = _2058 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2100 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _229);
    float _2102 = _327 * _899;
    float _2104 = _2090 * _2072;
    float _2106 = _2096 * _2098;
    float _2108 = _2084 * _2052;
    float _2110 = _2080 * 6.283185482025146484375;
    float _2112 = sin(_2110);
    float _2114 = _2084 * _2072;
    float _2116 = _2100 * _2106;
    float _2118 = _2102 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2120 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _331);
    float _2122 = _2090 * _2052;
    float _2124 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2126 = _2124 * 0.5;
    float _2128 = _2096 * _2118;
    float _2130 = _2090 * _2094;
    float _2132 = _2084 * _2094;
    float _2134 = _2072 * _2094;
    float _2136 = _2120 * _2128;
    float _2138 = _2130 * _2116;
    float _2140 = _2052 * _2094;
    float _2142 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2144 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2146 = fma(_2112, _2104, _2108);
    float _2148 = -_2114;
    float _2150 = fma(_2112, _2122, _2148);
    float _2152 = -_2116;
    float _2154 = _2112 * _2152;
    float _2156 = -_2122;
    float _2158 = fma(_2112, _2114, _2156);
    float _2160 = fma(_2146, _2136, _2138);
    float _2162 = _2132 * _2116;
    float _2164 = fma(_2134, _2136, _2154);
    float _2166 = fma(_2112, _2108, _2104);
    float _2168 = fma(_2150, _2126, _2160);
    float _2170 = fma(_2158, _2136, _2162);
    float _2172 = fma(_2140, _2126, _2164);
    float _2174 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2176 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2178 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2180 = fma(_2166, _2126, _2170);
    float _2182 = _2168 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2184 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2176);
    float _2186 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2178);
    float _2188 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2190 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2182);
    float _2192 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2184);
    float _2194 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2186);
    float _2196 = _2146 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2198 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2200 = _2192 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2202 = _2194 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2204 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2174);
    float _2206 = fma(_2180, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2190);
    float _2208 = _1682 + _2200;
    float _2210 = _1704 + _2202;
    float _2212 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2188);
    float _2214 = fma(_2134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2196);
    float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2218 = _2208 + _2216;
    float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2222 = _2210 + _2220;
    float _2224 = -_2112;
    float _2226 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2142);
    float _2228 = -_2112;
    float _2230 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2144);
    float _2232 = _2218 * _2218;
    float _2234 = _2222 * _2222;
    float _2236 = -_2112;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2198);
    float _2240 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2204);
    float _2242 = _2206 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2244 = _2232 + _2234;
    float _2246 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2212);
    float _2248 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2250 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2252 = sqrt(_2244);
    float _2254 = _2150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2256 = _1644 + _2242;
    float _2258 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2248);
    float _2260 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2250);
    float _2262 = fma(_2140, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2254);
    float _2264 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2214);
    bool _2266 = _2252 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2268 = _2254;
    float _2270 = _2232;
    float _2272 = _2234;
    float _2274 = _2208;
    float _2276 = _2210;
    float _2278 = _2222;
    float _2280 = _2246;
    float _2282 = _2096;
    if (!_2266)
    {
        _2268 = _2256;
    }
    float _2284 = _2268;
    bool _2286 = !_2266;
    float _2288 = _2284;
    if (!_2286)
    {
        float _2290 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2294 = _2252 + _2292;
        float _2296 = _2256 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2298 = rsqrt(_2244);
        float _2300 = _2294 * _2290;
        float _2302 = _2300 * 0.15915493667125701904296875;
        float _2304 = _2302 * 6.283185482025146484375;
        float _2306 = sin(_2304);
        float _2308 = _2302 * 6.283185482025146484375;
        float _2310 = cos(_2308);
        float _2312 = fma(_2306, _2296, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2314 = _2298 * _2312;
        float _2316 = fma(_2218, _2314, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2318 = _2310 + (-1.0);
        float _2320 = fma(_2222, _2314, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2324 = _2316 + _2322;
        float _2326 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2330 = _2320 + _2328;
        float _2332 = _2324 * _2324;
        float _2334 = fma(_2256, _2310, _2326);
        float _2336 = _2330 * _2330;
        _2288 = _2334;
        _2270 = _2332;
        _2272 = _2336;
        _2274 = _2316;
        _2276 = _2320;
    }
    float _2338 = _2288;
    float _2340 = _2270;
    float _2342 = _2272;
    float _2344 = _2274;
    float _2346 = _2276;
    float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2350 = _2338 + _2348;
    float _2352 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2226);
    float _2354 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2230);
    float _2356 = _229 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2358 = fma(_2350, _2350, _2340);
    float _2360 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2238);
    float _2362 = _331 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2364 = _2356 * _2352;
    float _2366 = _2358 + _2342;
    float _2368 = _2356 * _2354;
    float _2370 = _2356 * _2360;
    float _2372 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2258);
    float _2374 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2260);
    float _2376 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2262);
    float _2378 = sqrt(_2366);
    float _2380 = fma(_2362, _2246, _2364);
    float _2382 = fma(_2362, _2240, _2368);
    float _2384 = fma(_2362, _2264, _2370);
    float _2386 = _2372 + _2380;
    float _2388 = _2374 + _2382;
    float _2390 = _2376 + _2384;
    out.m_72.x = _2386;
    out.m_72.y = _2388;
    out.m_72.z = _2390;
    bool _2392 = _2378 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2394 = isnan(_2378);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2400 = _2396 || _2398;
    if (!_2400)
    {
        _2278 = 1.0;
    }
    float _2402 = _2278;
    bool _2404 = !_2400;
    float _2406 = _2402;
    if (!_2404)
    {
        bool _2408 = _2378 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2410 = isnan(_2378);
        bool _2412 = _2408 || _2410;
        bool _2414 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2416 = _2412 || _2414;
        if (!_2416)
        {
            float _2418 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2420 = _2378 + _2418;
            float _2422 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2424 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2422;
            float _2426 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2428 = _2426 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2430 = 1.0 / _2424;
            float _2432 = _2420 * _2430;
            float _2434 = fma(_2432, _2428, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2406 = _2434;
            _2436 = true;
        }
        else
        {
            bool _2438 = _2378 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2440 = isnan(_2378);
            bool _2442 = _2438 || _2440;
            bool _2444 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2446 = _2442 || _2444;
            if (!_2446)
            {
                float _2448 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2450 = _2378 + _2448;
                float _2452 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2454 = _2452 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2456 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2458 = _2456 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2460 = 1.0 / _2454;
                float _2462 = _2450 * _2460;
                float _2464 = fma(_2462, _2458, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2406 = _2464;
                _2436 = true;
            }
            else
            {
                _2406 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2436 = false;
    float _2466 = _2406;
    float _2468 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2470 = _2338 + _2468;
    float _2472 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2474 = _2344 + _2472;
    float _2476 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2478 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2480 = _2346 + _2478;
    float _2482 = fma(_2470, _2466, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2484 = fma(_2474, _2466, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2486 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2476);
    float _2488 = fma(_2480, _2466, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2490 = -_1644;
    float _2492 = _2490 + _2482;
    float _2494 = -_1682;
    float _2496 = _2494 + _2484;
    float _2498 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2486);
    float _2500 = -_1704;
    float _2502 = _2500 + _2488;
    float _2504 = _2492 * _2492;
    float _2506 = _1976 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2508 = _2498 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2510 = fma(_2496, _2496, _2504);
    float _2512 = fma(_1982, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2506);
    float _2514 = 1.0 / _2508;
    float _2516 = fma(_2502, _2502, _2510);
    float _2518 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2512);
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2522 = sqrt(_2516);
    float _2524 = _2520 + _2508;
    float _2526 = _2524 * _2514;
    float _2528 = _2526 * 0.5;
    bool _2530 = _2522 > 0.0;
    float _2532 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2534 = fma(_2528, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2532);
    bool _2536 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2538 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2540 = _2536 || _2538;
    bool _2542 = isnan(0.5);
    bool _2544 = _2540 || _2542;
    float _2546 = 1.0 / _2534;
    bool _2548 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2552 = _2548 || _2550;
    bool _2554 = isnan(0.5);
    bool _2556 = _2552 || _2554;
    float _2558 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2560 = _2488;
    float _2562 = _2484;
    if (!_2530)
    {
        _2558 = _2482;
    }
    float _2564 = _2558;
    bool _2566 = !_2530;
    float _2568 = _2564;
    if (!_2566)
    {
        float _2570 = _319 * _319;
        float _2572 = fma(_231, _231, _2570);
        float _2574 = rsqrt(_2516);
        float _2576 = fma(_323, _323, _2572);
        float _2578 = sqrt(_2576);
        float _2580 = _2496 * _2574;
        float _2582 = _2492 * _2574;
        float _2584 = _2502 * _2574;
        bool _2586 = _2578 > 0.0;
        float _2588 = _2578;
        _2280 = _2576;
        if (!_2586)
        {
            _2588 = _2482;
        }
        float _2590 = _2588;
        bool _2592 = !_2586;
        _2568 = _2590;
        if (!_2592)
        {
            float _2594 = rsqrt(_2576);
            float _2596 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2598 = _319 * _2594;
            float _2600 = _231 * _2594;
            float _2602 = _2582 * _2598;
            float _2604 = _323 * _2594;
            float _2606 = fma(_2580, _2600, _2602);
            float _2608 = _2596 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2610 = fma(_2584, _2604, _2606);
            float _2612 = _2610 * _2608;
            float _2614 = fma(_231, _2612, _2484);
            float _2616 = fma(_319, _2612, _2482);
            float _2618 = fma(_323, _2612, _2488);
            _2560 = _2618;
            _2562 = _2614;
            _2568 = _2616;
            _2280 = _2594;
        }
    }
    float _2620 = _2560;
    float _2622 = _2562;
    float _2624 = _2568;
    float _2626 = _2280;
    float _2628 = -_1978;
    float _2630 = fma(_2628, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2620);
    float _2632 = -_1972;
    float _2634 = fma(_2632, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2622);
    float _2636 = -_1968;
    float _2638 = fma(_2636, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2624);
    float _2640 = _2638;
    float _2642 = _2634;
    float _2644 = _2630;
    float _2646 = _2622;
    float _2648 = _2626;
    if (_2544)
    {
        _2060 = 1.0;
    }
    float _2650 = _2060;
    float _2652 = _2650;
    if (!_2556)
    {
        float _2654 = _1988 * _1988;
        float _2656 = 1.0 / _2096;
        float _2658 = -_1682;
        float _2660 = _2658 + _2622;
        float _2662 = -_1644;
        float _2664 = _2662 + _2624;
        float _2666 = fma(_1996, _1996, _2654);
        float _2668 = -_1704;
        float _2670 = _2668 + _2620;
        float _2672 = fma(_2004, _2004, _2666);
        float _2674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2676 = sqrt(_2672);
        float _2678 = precise::min(_2676, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2680 = _2678 * _2674;
        float _2682 = _2680 * _2656;
        float _2684 = fma(_2660, _2682, _1982);
        float _2686 = fma(_2664, _2682, _1976);
        float _2688 = fma(_2670, _2682, _1992);
        _2282 = _2656;
        _2640 = _2686;
        _2642 = _2684;
        _2644 = _2688;
    }
    float _2690 = _2282;
    float _2692 = _2640;
    float _2694 = _2642;
    float _2696 = _2644;
    float _2698 = _2690;
    if (_2544)
    {
        _2062 = 1.0;
    }
    float _2700 = _2062;
    float _2702 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2704 = _2546 * _2702;
    float _2706 = _2700;
    if (!_2544)
    {
        float _2708 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2710 = _2708 * 0.15915493667125701904296875;
        float _2712 = _2710 * 6.283185482025146484375;
        float _2714 = cos(_2712);
        float _2716 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2718 = _2716 * 0.15915493667125701904296875;
        float _2720 = _2710 * 6.283185482025146484375;
        float _2722 = sin(_2720);
        float _2724 = 1.0 / _2714;
        float _2726 = _2718 * 6.283185482025146484375;
        float _2728 = cos(_2726);
        float _2730 = _2722 * _2724;
        float _2732 = _2718 * 6.283185482025146484375;
        float _2734 = sin(_2732);
        float _2736 = _2728 * _2730;
        float _2738 = 1.0 / _2736;
        float _2740 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2742 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2740;
        float _2744 = 1.0 / _2742;
        float _2746 = _2734 * _2738;
        float _2748 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2750 = fma(_2704, _2746, _2748);
        float _2752 = _2750 * _2744;
        float _2754 = precise::clamp(_2752, 0.0, 1.0);
        _2652 = _2754;
    }
    float _2756 = _2652;
    if (!_2544)
    {
        float _2758 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2760 = _2758 * 0.15915493667125701904296875;
        float _2762 = _2760 * 6.283185482025146484375;
        float _2764 = cos(_2762);
        float _2766 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2768 = _2766 * 0.15915493667125701904296875;
        float _2770 = _2760 * 6.283185482025146484375;
        float _2772 = sin(_2770);
        float _2774 = 1.0 / _2764;
        float _2776 = _2768 * 6.283185482025146484375;
        float _2778 = cos(_2776);
        float _2780 = _2772 * _2774;
        float _2782 = _2768 * 6.283185482025146484375;
        float _2784 = sin(_2782);
        float _2786 = _2778 * _2780;
        float _2788 = 1.0 / _2786;
        float _2790 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2792 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2790;
        float _2794 = 1.0 / _2792;
        float _2796 = _2784 * _2788;
        float _2798 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2800 = fma(_2704, _2796, _2798);
        float _2802 = _2800 * _2794;
        float _2804 = precise::clamp(_2802, 0.0, 1.0);
        float _2806 = -_2804;
        float _2808 = _2806 + 1.0;
        _2698 = _2788;
        _2706 = _2808;
    }
    float _2810 = _2698;
    float _2812 = _2706;
    float _2814 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2816 = _2692 + _2814;
    float _2818 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2820 = _2694 + _2818;
    float _2822 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2824 = _2696 + _2822;
    float _2826 = _2816 * _2816;
    float _2828 = fma(_2820, _2820, _2826);
    float _2830 = fma(_2824, _2824, _2828);
    float _2832 = rsqrt(_2830);
    float _2834 = sqrt(_2830);
    float _2836 = _2832 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2838 = _2820 * _2836;
    float _2840 = _2824 * _2836;
    float _2842 = _2838 * _2838;
    float _2844 = _2840 * _2840;
    float _2846 = _2842 + _2844;
    float _2848 = sqrt(_2846);
    bool _2850 = _2848 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2852 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2854 = _2848 + _2852;
    float _2856 = _2810;
    float _2858 = _2846;
    float _2860 = _2854;
    float _2862 = _2816;
    float _2864 = _2838;
    if (_2850)
    {
        float _2866 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2856 = _2866;
    }
    float _2868 = _2856;
    if (_2850)
    {
        float _2870 = rsqrt(_2846);
        _2858 = _2870;
    }
    float _2872 = _2858;
    if (_2850)
    {
        float _2874 = _2854 * _2868;
        _2860 = _2874;
    }
    float _2876 = _2860;
    if (_2850)
    {
        float _2878 = _2876 * 0.15915493667125701904296875;
        _2646 = _2878;
    }
    float _2880 = _2646;
    float _2882 = _2824;
    float _2884 = _2880;
    if (_2850)
    {
        float _2886 = _2880 * 6.283185482025146484375;
        float _2888 = sin(_2886);
        _2882 = _2888;
    }
    float _2890 = _2882;
    float _2892 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2894 = precise::max(0.0, _2892);
    float _2896 = _2868;
    float _2898 = _2894;
    if (_2850)
    {
        float _2900 = _2880 * 6.283185482025146484375;
        float _2902 = cos(_2900);
        _2896 = _2902;
    }
    float _2904 = _2896;
    float _2906 = -_2836;
    float _2908 = -_2894;
    float _2910 = fma(_2816, _2906, _2908);
    if (_2850)
    {
        float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2862 = _2912;
    }
    float _2914 = _2862;
    float _2916 = _2890;
    float _2918 = _2914;
    if (_2850)
    {
        float _2920 = fma(_2890, _2914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2916 = _2920;
    }
    float _2922 = _2916;
    float _2924 = _2922;
    if (!_2850)
    {
        _2918 = _2910;
    }
    float _2926 = _2918;
    float _2928 = _2926;
    float _2930 = _2904;
    if (_2850)
    {
        float _2932 = _2904 + (-1.0);
        _2898 = _2932;
    }
    float _2934 = _2898;
    float _2936 = _2934;
    if (_2850)
    {
        float _2938 = _2872 * _2922;
        _2648 = _2938;
    }
    float _2940 = _2648;
    if (!_2850)
    {
        _2924 = _2842;
    }
    float _2942 = _2924;
    float _2944 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2946 = _2942;
    if (_2850)
    {
        float _2948 = _2934 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2884 = _2948;
    }
    float _2950 = _2884;
    if (_2850)
    {
        float _2952 = _2838 * _2940;
        _2864 = _2952;
    }
    float _2954 = _2864;
    if (!_2850)
    {
        _2936 = _2840;
    }
    float _2956 = _2936;
    float _2958 = _2956;
    if (_2850)
    {
        float _2960 = _2840 * _2940;
        _2958 = _2960;
    }
    float _2962 = _2958;
    if (_2850)
    {
        float _2964 = fma(_2910, _2904, _2950);
        _2928 = _2964;
    }
    float _2966 = _2928;
    if (_2850)
    {
        float _2968 = _2954 * _2954;
        _2946 = _2968;
    }
    float _2970 = _2946;
    if (!_2850)
    {
        _2930 = _2844;
    }
    float _2972 = _2930;
    float _2974 = _2972;
    if (_2850)
    {
        float _2976 = _2962 * _2962;
        _2974 = _2976;
    }
    float _2978 = _2974;
    float _2980 = fma(_2966, _2966, _2970);
    float _2982 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2984 = _2980 + _2978;
    float _2986 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2982);
    float _2988 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2990 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2992 = fma(_2834, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2990);
    float _2994 = precise::clamp(_2992, 0.0, 1.0);
    float _2996 = rsqrt(_2984);
    float _2998 = _2692 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3000 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2988);
    float _3002 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2986);
    float _3004 = -_2994;
    float _3006 = _3004 + 1.0;
    float _3008 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2998);
    float _3010 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3000);
    float _3012 = _3002 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3014 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3016 = abs(_3006);
    float _3018 = log2(_3016);
    float _3020 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3008);
    float _3022 = fma(_2694, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2944);
    float _3024 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3026 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3028 = _3020 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3030 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3022);
    float _3032 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3034 = _2996 * _2954;
    float _3036 = -_3026;
    float _3038 = fma(_3036, _3014, 1.0);
    float _3040 = _2996 * _2966;
    float _3042 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3032);
    float _3044 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3046 = _2996 * _2962;
    float _3048 = _3030 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3050 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3042);
    float _3052 = -_3044;
    float _3054 = fma(_3040, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3052);
    float _3056 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3058 = log2(_3038);
    float _3060 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3050);
    float _3062 = -_3046;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3054);
    float _3066 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3068 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3070 = fma(_3064, -0.5, 0.5);
    float _3072 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3066);
    float _3074 = exp2(_3056);
    float _3076 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3068);
    float _3078 = fma(_3064, 0.5, 0.5);
    float _3080 = _3040 + 1.0;
    float _3082 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3072);
    float _3084 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3076);
    float _3086 = 1.0 / _3060;
    float _3088 = fma(_3078, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3090 = fma(_3078, _3088, -0.212114393711090087890625);
    float _3092 = sqrt(_3070);
    float _3094 = -_3040;
    float _3096 = fma(_3074, _3080, _3094);
    float _3098 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3082);
    float _3100 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3084);
    float _3102 = _3058 * 0.693147182464599609375;
    float _3104 = fma(_3078, _3090, 1.570728778839111328125);
    float _3106 = fma(_3096, 0.5, 0.5);
    float _3108 = _3098 * _3086;
    float _3110 = _3100 * _3086;
    float _3112 = _3102 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3114 = fma(_3108, 0.5, 0.5);
    float _3116 = fma(_3110, -0.5, 0.5);
    float _3118 = _3092 * 0.636619746685028076171875;
    float3 _8241 = float3(_3114, _3116, _3112);
    float _3120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8241, float3(0.0), isnan(_8241)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8241, float3(0.0), isnan(_8241)), level(0.0)).x;
    float _3122 = -_3104;
    float _3124 = fma(_3118, _3122, 1.0);
    float3 _8257 = float3(_3114, _3116, _3112);
    float4 _3127 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8257, float3(0.0), isnan(_8257)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8257, float3(0.0), isnan(_8257)), level(0.0)).xyzw;
    float _3129 = _3127.x;
    float _3131 = _3127.y;
    float _3133 = _3127.z;
    float _3135 = _3127.w;
    float2 _8274 = float2(_3124, _3106);
    float3 _3139 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8274, float2(0.0), isnan(_8274)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8274, float2(0.0), isnan(_8274)), level(0.0)).xyz;
    float _3141 = _3139.x;
    float _3143 = _3139.y;
    float _3145 = _3139.z;
    float _3147 = _3018 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3149 = _3024 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3151 = _3060 * 0.5;
    bool _3153 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3155 = isnan(_2834);
    bool _3157 = _3153 || _3155;
    bool _3159 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3161 = _3157 || _3159;
    float _3163 = fma(_3028, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3149);
    float _3165 = exp2(_3147);
    float _3167 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3163);
    float _3169 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3167);
    float _3171 = fma(_3100, -0.5, _3151);
    float _3173 = _3098 + _3060;
    float _3175 = _3169 + _3060;
    float _3177 = _3173 * 0.5;
    out.gl_Position.x = _3098;
    out.gl_Position.y = _3100;
    out.gl_Position.z = _3169;
    out.gl_Position.w = _3060;
    float _3179 = _3175 * 0.5;
    float _3181 = -_3165;
    float _3183 = _3181 + 1.0;
    float _3185 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_74.x = _3177;
    out.m_74.y = _3171;
    out.m_74.z = _3179;
    out.m_74.w = _3060;
    float _3187 = -_3185;
    float _3189 = _3187 + 1.0;
    float _3191 = _3100;
    float _3193 = _3098;
    if (!_3161)
    {
        _3191 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3195 = _3191;
    float _3197 = _3195;
    float _3199 = _3195;
    if (!_3161)
    {
        _3193 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3201 = _3193;
    float _3203 = _3185 * _3120;
    float _3205 = _3135 * _3203;
    float _3207 = _3135 * _3189;
    float _3209 = _3145 * _3203;
    float _3211 = fma(_3141, _3205, _3129);
    float _3213 = fma(_3143, _3205, _3131);
    float _3215 = fma(_3135, _3209, _3133);
    float _3217 = _2756 * _2812;
    out.m_76.x = _3211;
    out.m_76.y = _3213;
    out.m_76.z = _3215;
    out.m_76.w = _3207;
    float _3219 = _3217 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3221 = _3217;
    float _3223 = _3201;
    float _3225 = _3201;
    if (!_3161)
    {
        _3221 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3227 = _3221;
    bool _3229 = !_3161;
    float _3231 = _3227;
    float _3233 = _3227;
    if (!_3229)
    {
        bool _3235 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3237 = isnan(_2834);
        bool _3239 = _3235 || _3237;
        bool _3241 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3243 = _3239 || _3241;
        if (!_3243)
        {
            float _3245 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3247 = _2834 + _3245;
            float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3251 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3249;
            float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3261 = 1.0 / _3251;
            float _3263 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3265 = _3263 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3267 = _3247 * _3261;
            float _3269 = precise::clamp(_3267, 0.0, 1.0);
            float _3271 = fma(_3269, _3255, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3273 = fma(_3269, _3259, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3275 = fma(_3269, _3265, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _3225 = _3273;
            _3199 = _3271;
            _3233 = _3275;
            _3277 = true;
        }
        else
        {
            bool _3279 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3281 = isnan(_2834);
            bool _3283 = _3279 || _3281;
            bool _3285 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3287 = _3283 || _3285;
            if (!_3287)
            {
                _3197 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3289 = _3197;
            _3199 = _3289;
            if (!_3287)
            {
                _3223 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3291 = _3223;
            _3225 = _3291;
            if (!_3287)
            {
                _3231 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3293 = _3231;
            bool _3295 = !_3287;
            _3233 = _3293;
            if (!_3295)
            {
                bool _3297 = _2834 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3299 = isnan(_2834);
                bool _3301 = _3297 || _3299;
                bool _3303 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3305 = _3301 || _3303;
                if (!_3305)
                {
                    float _3307 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3309 = _2834 + _3307;
                    float _3311 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3313 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3311;
                    float _3315 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3317 = _3315 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3319 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3321 = _3319 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3323 = 1.0 / _3313;
                    float _3325 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3327 = _3325 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3329 = _3309 * _3323;
                    float _3331 = precise::clamp(_3329, 0.0, 1.0);
                    float _3333 = fma(_3331, _3317, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3335 = fma(_3331, _3321, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3337 = fma(_3331, _3327, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _3225 = _3335;
                    _3199 = _3333;
                    _3233 = _3337;
                    _3277 = true;
                }
                else
                {
                    _3225 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3199 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3233 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3277 = false;
    float _3339 = _3225;
    float _3341 = _3199;
    float _3343 = _3233;
    float _3345 = _3219 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_78.x = 0.0;
    float _3347 = _3339 * 0.586610972881317138671875;
    bool _3349 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_49.x = _3345;
    float _3351 = fma(_3341, 0.298911988735198974609375, _3347);
    bool _3353 = _2756 > 0.0;
    bool _3355 = isnan(_2756);
    bool _3357 = _3353 || _3355;
    bool _3359 = isnan(0.0);
    bool _3361 = _3357 || _3359;
    float _3363 = fma(_3343, 0.114477999508380889892578125, _3351);
    bool _3365 = _2812 <= 0.0;
    bool _3367 = !_3361;
    bool _3369 = _3365 || _3367;
    float _3371 = -_3363;
    float _3373 = _3371 + _3341;
    float _3375 = -_3363;
    float _3377 = _3375 + _3339;
    float _3379 = -_3363;
    float _3381 = _3379 + _3343;
    float _3383 = fma(_3373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3363);
    float _3385 = fma(_3377, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3363);
    float _3387 = fma(_3381, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3363);
    bool _3389 = !_3349;
    if (!_3389)
    {
        float _3391 = -_2692;
        float _3393 = _3391 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3395 = -_2694;
        float _3397 = _3395 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3399 = -_2696;
        float _3401 = _3399 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3403 = _3393 * _3393;
        float _3405 = fma(_3397, _3397, _3403);
        float _3407 = fma(_3401, _3401, _3405);
        float _3409 = sqrt(_3407);
        float _3411 = rsqrt(_3407);
        float _3413 = -_3409;
        float _3415 = _3413 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3417 = _3415 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3419 = precise::clamp(_3417, 0.0, 1.0);
        float _3421 = _3397 * _3411;
        float _3423 = _3393 * _3411;
        float _3425 = abs(_3419);
        float _3427 = log2(_3425);
        float _3429 = _3401 * _3411;
        float _3431 = _3421 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3433 = _2388 * _3423;
        float _3435 = -_3423;
        float _3437 = -_3431;
        float _3439 = fma(_3435, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3437);
        float _3441 = fma(_2386, _3421, _3433);
        float _3443 = -_3429;
        float _3445 = fma(_3443, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3439);
        float _3447 = fma(_2390, _3429, _3441);
        float _3449 = precise::clamp(_3447, 0.0, 1.0);
        float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3453 = _3445 + _3451;
        float _3455 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3457 = _3453 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3459 = precise::clamp(_3457, 0.0, 1.0);
        float _3461 = exp2(_3455);
        float _3463 = _3461 * _3459;
        float _3465 = _3449 * _3463;
        float _3467 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3469 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3471 = _3465 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_78.x = _3467;
        out.m_78.y = _3469;
        out.m_78.z = _3471;
    }
    out.m_80.x = _3383;
    out.m_80.y = _3385;
    out.m_80.z = _3387;
    if (!_3369)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3473 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3473;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

