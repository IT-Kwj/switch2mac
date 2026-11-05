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
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_72 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_88 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_60 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_62 [[user(locn13)]];
    float4 m_74 [[user(locn14)]];
    float4 m_80 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2999 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3284 = as_type<float>(_125);
        out.gl_Position.z = _3284;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_139)
    {
        float _145 = float(_109);
        _119 = _145;
    }
    float _147 = _119;
    bool _149 = _143 >= _147;
    bool _151 = !_139;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3353 = as_type<float>(_161);
        out.gl_Position.z = _3353;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_56.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_109);
        float _207 = 1.0 / _205;
        float _209 = _143 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = in.m_46.x;
    float _215 = in.m_46.y;
    float _217 = in.m_46.z;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _211 + _219;
    bool _223 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _225 = isnan(_211);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = 1.0 / _237;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _247 = _245 != 0;
    int _249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _251 = _249 != 0;
    int _253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _255 = _253 != 0;
    bool _257 = !_247;
    int _259 = _257 ? 0 : 1;
    float _261 = 1.0 / _241;
    bool _263 = !_255;
    int _265 = _263 ? 0 : 1;
    bool _267 = !_251;
    int _269 = _267 ? 0 : 1;
    float _271 = _215 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _273 = _215 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _275 = _215 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _211 + _277;
    float _281 = fma(_213, (*spvDescriptorSet0.vp_c10)._m0[5].x, _271);
    float _283 = fma(_213, (*spvDescriptorSet0.vp_c10)._m0[4].x, _273);
    float _285 = _221 * _243;
    float _287 = fma(_213, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    float _289 = fma(_217, (*spvDescriptorSet0.vp_c10)._m0[5].z, _281);
    float _291 = fma(_217, (*spvDescriptorSet0.vp_c10)._m0[4].z, _283);
    bool _293 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_211);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _279 * _261;
    bool _307 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_211);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _289 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _321 = fma(_217, (*spvDescriptorSet0.vp_c10)._m0[6].z, _287);
    float _323 = in.m_58.x;
    float _325 = in.m_58.y;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _327;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = _291 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _339 = _319 + _337;
    float _341 = fma(_329, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = _303 * _333;
    float _345 = _321 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _349 = _335 + _347;
    float _351 = _339 * _339;
    float _353 = -_303;
    float _355 = _353 + 1.0;
    float _357 = -_233;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _365 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _367 = _345 + _365;
    float _369 = fma(_349, _349, _351);
    float _371 = _341 * _343;
    float _373 = _317 * _359;
    float _375 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = fma(_367, _367, _369);
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = sqrt(_377);
    float _383 = fma(_375, _373, _379);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _391 = fma(_387, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = rsqrt(_377);
    float _395 = _389 * _323;
    float _397 = _391 * _343;
    float _399 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _401 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _397);
    float _403 = _381 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _405 = _399 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _407 = precise::min(_405, _403);
    float _409 = _393 * _407;
    float _411 = _339 * _409;
    float _413 = _349 * _409;
    float _415 = -_411;
    float _417 = _339 + _415;
    float _419 = _367 * _409;
    float _421 = -_413;
    float _423 = _349 + _421;
    float _425 = _417 * _417;
    float _427 = -_419;
    float _429 = _367 + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = fma(_423, _423, _425);
    float _437 = fma(_433, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = fma(_429, _429, _435);
    float _441 = fma(_437, _373, _401);
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _445 = sqrt(_439);
    float _447 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _449 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[145].y, _441);
    float _451 = _449 * _325;
    float _453 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _455 = _393 * _445;
    float _457 = _453 * _455;
    float _459 = _399 * _455;
    float _461 = _455 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _463 = _461 * 0.5;
    float _465 = _457 * _443;
    float _467 = _459 * _447;
    float _469 = _465 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _471 = _465 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _473 = _465 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _475 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[26].x, _469);
    float _477 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[24].x, _471);
    float _479 = in.m_56.x;
    float _481 = in.m_56.y;
    float _483 = in.m_56.z;
    float _485 = in.m_56.w;
    float _487 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[25].x, _473);
    float _489 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _475);
    float _491 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _477);
    float _493 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _487);
    float _495 = _489 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _497 = _491 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _505 = _503 != 0;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _513 = _511 != 0;
    float _515 = _493 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _517 = _345 + _495;
    float _519 = _335 + _497;
    bool _521 = !_505;
    int _523 = _521 ? 0 : 1;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _527 = _517 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _531 = _519 + _529;
    bool _533 = !_501;
    int _535 = _533 ? 0 : 1;
    float _537 = _319 + _515;
    float _539 = _527 * _527;
    bool _541 = !_509;
    int _543 = _541 ? 0 : 1;
    float _545 = -_413;
    float _547 = _335 + _545;
    bool _549 = !_513;
    int _551 = _549 ? 0 : 1;
    float _553 = fma(_531, _531, _539);
    bool _555 = _481 > 0.5;
    float _557 = sqrt(_553);
    bool _559 = _483 > 0.5;
    bool _561 = _481 > 0.5;
    int _563 = int(_561);
    int _565 = _505 ? 2 : 0;
    int _567 = _563 | _565;
    int _569 = _509 ? 4 : 0;
    int _571 = _567 | _569;
    int _573 = _513 ? 8 : 0;
    int _575 = _571 | _573;
    int _577 = _555 ? 16 : 0;
    int _579 = _575 | _577;
    int _581 = _251 ? 32 : 0;
    int _583 = _579 | _581;
    int _585 = _559 ? 64 : 0;
    int _587 = _583 | _585;
    int _589 = _587 & 16;
    float _591 = -_177;
    int _593 = _561 ? as_type<int>(_591) : as_type<int>(_177);
    float _595 = -_181;
    int _597 = _559 ? as_type<int>(_595) : as_type<int>(_181);
    bool _599 = _557 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _607 = _605 != 0;
    bool _609 = !_603;
    float _611 = _609 ? _177 : as_type<float>(_593);
    bool _613 = !_607;
    float _615 = _613 ? _181 : as_type<float>(_597);
    float _617 = _495;
    float _619 = _519;
    float _621 = _517;
    float _623 = _411;
    if (!_599)
    {
        _617 = _537;
    }
    float _625 = _617;
    bool _627 = !_599;
    float _629 = _625;
    if (!_627)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _635 = _557 + _633;
        float _637 = rsqrt(_553);
        float _639 = _635 * _631;
        float _641 = _537 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = _639 * 0.15915493667125701904296875;
        float _645 = _643 * 6.283185482025146484375;
        float _647 = sin(_645);
        float _649 = _643 * 6.283185482025146484375;
        float _651 = cos(_649);
        float _653 = fma(_647, _641, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _655 = _637 * _653;
        float _657 = _651 + (-1.0);
        float _659 = fma(_531, _655, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _661 = fma(_527, _655, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _663 = _657 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _665 = fma(_537, _651, _663);
        _619 = _659;
        _621 = _661;
        _629 = _665;
    }
    float _667 = _619;
    float _669 = _621;
    float _671 = _629;
    bool _673 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _675 = isnan(0.5);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _681 = _677 || _679;
    float _683 = -_413;
    float _685 = _683 + _667;
    float _687 = -_419;
    float _689 = _687 + _669;
    float _691 = -_411;
    float _693 = _691 + _671;
    float _695 = -_411;
    float _697 = _319 + _695;
    float _699 = -_419;
    float _701 = _345 + _699;
    float _703 = _685;
    float _705 = _693;
    float _707 = _689;
    float _709 = _671;
    float _711 = _667;
    if (_681)
    {
        _623 = _685;
    }
    float _713 = _623;
    float _715 = _713;
    if (_681)
    {
        _703 = _689;
    }
    float _717 = _703;
    float _719 = _717;
    if (!_681)
    {
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _723 = _697 + _721;
        float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _727 = _547 + _725;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _731 = -_335;
        float _733 = _731 + _667;
        float _735 = _723 * _723;
        float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _739 = _701 + _737;
        float _741 = fma(_727, _727, _735);
        float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _745 = fma(_739, _739, _741);
        float _747 = sqrt(_745);
        float _749 = _729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _751 = -_319;
        float _753 = _751 + _671;
        float _755 = -_345;
        float _757 = _755 + _669;
        float _759 = precise::min(_747, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _761 = _759 * _743;
        float _763 = _749 * _761;
        float _765 = fma(_733, _763, _547);
        float _767 = fma(_753, _763, _697);
        float _769 = fma(_757, _763, _701);
        _705 = _767;
        _715 = _765;
        _719 = _769;
        _707 = _753;
    }
    float _771 = _705;
    float _773 = _715;
    float _775 = _719;
    float _777 = _707;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _781 = _771 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _785 = _773 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _789 = _775 + _787;
    bool _791 = _589 != 0;
    float _793 = _781 * _781;
    float _795 = fma(_785, _785, _793);
    float _797 = fma(_789, _789, _795);
    float _799 = rsqrt(_797);
    float _801 = _799 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _803 = _785 * _801;
    float _805 = _789 * _801;
    float _807 = _803 * _803;
    float _809 = _805 * _805;
    float _811 = _807 + _809;
    float _813 = sqrt(_811);
    bool _815 = _813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _819 = _813 + _817;
    float _821 = _789;
    float _823 = _819;
    float _825 = _777;
    if (_815)
    {
        float _827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _821 = _827;
    }
    float _829 = _821;
    if (_815)
    {
        float _831 = rsqrt(_811);
        _709 = _831;
    }
    float _833 = _709;
    float _835 = _833;
    if (_815)
    {
        float _837 = _819 * _829;
        _823 = _837;
    }
    float _839 = _823;
    float _841 = _771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_815)
    {
        float _843 = _839 * 0.15915493667125701904296875;
        _711 = _843;
    }
    float _845 = _711;
    float _847 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _841);
    float _849 = _799;
    float _851 = _845;
    if (_815)
    {
        float _853 = _845 * 6.283185482025146484375;
        float _855 = sin(_853);
        _849 = _855;
    }
    float _857 = _849;
    float _859 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _861 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _847);
    float _863 = precise::max(0.0, _859);
    float _865 = _793;
    float _867 = _863;
    float _869 = _859;
    if (_815)
    {
        float _871 = _845 * 6.283185482025146484375;
        float _873 = cos(_871);
        _865 = _873;
    }
    float _875 = _865;
    float _877 = -_801;
    float _879 = -_863;
    float _881 = fma(_781, _877, _879);
    if (_815)
    {
        float _883 = _881 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _867 = _883;
    }
    float _885 = _867;
    if (!_815)
    {
        _851 = _805;
    }
    float _887 = _851;
    float _889 = fma(_547, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _891 = _857;
    float _893 = _887;
    if (_815)
    {
        float _895 = fma(_857, _885, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _825 = _895;
    }
    float _897 = _825;
    float _899 = _897;
    if (!_815)
    {
        _891 = _807;
    }
    float _901 = _891;
    float _903 = floor(_889);
    float _905 = _901;
    float _907 = _875;
    if (_815)
    {
        float _909 = _875 + (-1.0);
        _869 = _909;
    }
    float _911 = _869;
    float _913 = 0.0;
    float _915 = _911;
    if (_815)
    {
        float _917 = _833 * _897;
        _913 = _917;
    }
    float _919 = _913;
    if (!_815)
    {
        _835 = _803;
    }
    float _921 = _835;
    float _923 = _921;
    if (_815)
    {
        float _925 = _911 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _925;
    }
    float _927 = _915;
    if (_815)
    {
        float _929 = _803 * _919;
        _923 = _929;
    }
    float _931 = _923;
    if (!_815)
    {
        _899 = _881;
    }
    float _933 = _899;
    float _935 = _933;
    if (_815)
    {
        float _937 = _805 * _919;
        _893 = _937;
    }
    float _939 = _893;
    if (_815)
    {
        float _941 = fma(_881, _875, _927);
        _935 = _941;
    }
    float _943 = _935;
    if (_815)
    {
        float _945 = _931 * _931;
        _905 = _945;
    }
    float _947 = _905;
    if (!_815)
    {
        _907 = _809;
    }
    float _949 = _907;
    float _951 = sqrt(_797);
    float _953 = _949;
    if (_815)
    {
        float _955 = _939 * _939;
        _953 = _955;
    }
    float _957 = _953;
    float _959 = fma(_943, _943, _947);
    float _961 = fma(_701, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _963 = _771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _965 = _959 + _957;
    float _967 = _771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _969 = _771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _971 = rsqrt(_965);
    float _973 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _967);
    float _975 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _963);
    float _977 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _969);
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _981 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _973);
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _985 = fma(_951, (*spvDescriptorSet0.vp_c15)._m0[23].w, _983);
    float _987 = precise::clamp(_985, 0.0, 1.0);
    float _989 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _977);
    float _991 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _975);
    float _993 = _981 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = -_987;
    float _997 = _995 + 1.0;
    float _999 = _989 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1001 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1003 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1005 = _861 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1007 = floor(_961);
    float _1009 = _971 * _939;
    float _1011 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1003);
    float _1013 = _1001 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1015 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1011);
    float _1017 = _971 * _931;
    float _1019 = abs(_997);
    float _1021 = log2(_1019);
    float _1023 = -_1013;
    float _1025 = fma(_1023, _979, 1.0);
    float _1027 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1015);
    float _1029 = _971 * _943;
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1033 = -_903;
    float _1035 = _889 + _1033;
    float _1037 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1039 = -_1031;
    float _1041 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1039);
    float _1043 = 1.0 / _1027;
    float _1045 = -_1007;
    float _1047 = _961 + _1045;
    float _1049 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1037);
    float _1051 = -_1009;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1041);
    float _1055 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1057 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1049);
    float _1059 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1061 = fma(_1053, -0.5, 0.5);
    float _1063 = log2(_1025);
    float _1065 = fma(_1053, 0.5, 0.5);
    float _1067 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1055);
    float _1069 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1057);
    float _1071 = _1029 + 1.0;
    float _1073 = fma(_1065, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1075 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1067);
    float _1077 = _1069 * _1043;
    float _1079 = exp2(_1059);
    float _1081 = fma(_1065, _1073, -0.212114393711090087890625);
    float _1083 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1075);
    float _1085 = fma(_1077, 0.5, 0.5);
    float _1087 = fma(_1065, _1081, 1.570728778839111328125);
    float _1089 = _1083 * _1043;
    float _1091 = sqrt(_1061);
    float _1093 = _1063 * 0.693147182464599609375;
    float _1095 = fma(_1089, -0.5, 0.5);
    float _1097 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1099 = -_1029;
    float _1101 = fma(_1079, _1071, _1099);
    float2 _4851 = float2(_1035, _1047);
    float _1103 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4851, float2(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4851, float2(0.0), isnan(_4851)), level(0.0)).x;
    float3 _4862 = float3(_1085, _1095, _1097);
    float _1105 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4862, float3(0.0), isnan(_4862)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4862, float3(0.0), isnan(_4862)), level(0.0)).x;
    float3 _4873 = float3(_1085, _1095, _1097);
    float4 _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4873, float3(0.0), isnan(_4873)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4873, float3(0.0), isnan(_4873)), level(0.0)).xyzw;
    float _1110 = _1108.x;
    float _1112 = _1108.y;
    float _1114 = _1108.z;
    float _1116 = _1108.w;
    float _1118 = fma(_1101, 0.5, 0.5);
    float _1120 = _1091 * 0.636619746685028076171875;
    float _1122 = -_1087;
    float _1124 = fma(_1120, _1122, 1.0);
    float2 _4899 = float2(_1124, _1118);
    float3 _1128 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4899, float2(0.0), isnan(_4899)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4899, float2(0.0), isnan(_4899)), level(0.0)).xyz;
    float _1130 = _1128.x;
    float _1132 = _1128.y;
    float _1134 = _1128.z;
    float _1136 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1138 = int(_1136);
    float _1140 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1142 = _697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1146 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1148 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1150 = int(_1148);
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1154 = fma(_1140, _1140, 1.0);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1158 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1142);
    float _1160 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1152);
    float _1162 = _611 + 0.5;
    float _1164 = -_615;
    float _1166 = _1164 + 0.5;
    float _1168 = float(_1138);
    float _1170 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1172 = int(_1170);
    float _1174 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1158);
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1178 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1160);
    out.m_60.w = _407;
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1182 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1184 = float(uint(_1150));
    float _1186 = 1.0 / _1168;
    int _1188 = ~_1150;
    int _1190 = _1188 + 1;
    out.m_62.x = _547;
    out.m_62.y = _697;
    out.m_62.z = _701;
    int _1192 = ~_1150;
    int _1194 = _1192 + 1;
    float _1196 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1182);
    bool _1198 = _1150 == 0;
    float _1200 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_64.x = _459;
    float _1202 = 1.0 / _1184;
    float _1204 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1196);
    float _1206 = float(uint(_1172));
    out.m_66.x = _773;
    out.m_66.y = _771;
    out.m_66.z = _775;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1210 = _1208 != 0;
    float _1212 = _143 * _1186;
    float _1214 = 1.0 / _1206;
    float _1216 = trunc(_1212);
    int _1218 = int(_1216);
    float _1220 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1222 = int(_1220);
    int _1224 = as_type<int>(_1202) + (-2);
    float _1226 = float(uint(_1218));
    float _1228 = rsqrt(_1154);
    float _1230 = as_type<float>(_1224) * _1226;
    float _1232 = float(_1222);
    float _1234 = trunc(_1230);
    float _1236 = precise::max(_1234, 0.0);
    uint _1239 = uint(_1236);
    float _1241 = 1.0 / _1232;
    float _1243 = _1140 * _1228;
    int _1245 = _1190 * int(_1239);
    int _1247 = _1245 + _1218;
    float _1249 = exp2(_1200);
    float _1251 = float(uint(_1247));
    float _1253 = as_type<float>(_1247);
    float _1255 = _1083;
    float _1257 = _1069;
    if (_1210)
    {
        _1253 = 1.0;
    }
    float _1259 = _1253;
    float _1261 = _143 * _1241;
    float _1263 = _1259;
    if (!_1210)
    {
        _1263 = 7.345489978790283203125;
    }
    float _1265 = _1263;
    float _1267 = as_type<float>(_1224) * _1251;
    int _1269 = as_type<int>(_1214) + (-2);
    float _1271 = trunc(_1261);
    int _1273 = int(_1271);
    float _1275 = _1265 * _479;
    float _1277 = _1265;
    if (_1210)
    {
        float _1279 = in.m_56.x;
        _1277 = _1279;
    }
    float _1281 = _1277;
    float _1283 = -_1249;
    float _1285 = _1283 + 1.0;
    float _1287 = _1281;
    if (!_1210)
    {
        float _1289 = in.m_56.y;
        _1287 = _1289;
    }
    float _1291 = _1287;
    float _1293 = trunc(_1267);
    float _1295 = precise::max(_1293, 0.0);
    uint _1297 = uint(_1295);
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1301 = float(uint(_1273));
    float _1303 = floor(_1275);
    float _1305 = as_type<float>(_1269) * _1301;
    int _1307 = int(_1239) + int(_1297);
    float _1309 = float(_1150);
    float _1311 = trunc(_1305);
    float _1313 = precise::max(_1311, 0.0);
    uint _1315 = uint(_1313);
    float _1317 = float(_1218);
    int _1319 = _1194 * _1307;
    int _1321 = _1319 + _1218;
    float _1323 = float(_109);
    bool _1325 = _1317 >= _1309;
    bool _1327 = isnan(_1317);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan(_1309);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = -_1303;
    float _1339 = _1275 + _1337;
    bool _1341 = uint(_1321) >= uint(_1150);
    int _1343 = ~_1172;
    int _1345 = _1343 + 1;
    float _1347 = 1.0 / _1323;
    bool _1349 = !_1341;
    int _1351 = _1349 ? 0 : (-1);
    float _1353 = _1339 * _1309;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1357 = _1355 != 0;
    int _1359 = ~_1307;
    int _1361 = _1359 + _1351;
    int _1363 = _1361 + 1;
    int _1365 = _1345 * int(_1315);
    int _1367 = _1365 + _1273;
    bool _1369 = !_1357;
    int _1371 = _1369 ? 0 : 1;
    float _1373 = trunc(_1335);
    int _1375 = int(_1373);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1379 = _1377 != 0;
    int _1381 = _1150 * _1363;
    int _1383 = _1381 + _1218;
    float _1385 = float(uint(_1367));
    bool _1387 = !_1198;
    int _1389 = _1387 ? _1383 : (-1);
    float _1391 = as_type<float>(_1269) * _1385;
    float _1393 = trunc(_1353);
    int _1395 = int(_1393);
    int _1397 = ~_1375;
    int _1399 = _1397 + 1;
    int _1401 = _1399 + 1;
    float _1403 = trunc(_1391);
    float _1405 = precise::max(_1403, 0.0);
    uint _1407 = uint(_1405);
    int _1409 = _1389 * _1401;
    float _1411 = _143 * _1347;
    float _1413 = as_type<float>(_1401);
    if (_1210)
    {
        _1413 = 1.0;
    }
    float _1415 = _1413;
    int _1417 = _1150 + (-1);
    float _1419 = _1411 * _1309;
    int _1421 = abs(_1371);
    int _1423 = abs(_269);
    int _1425 = _1375 * _1417;
    int _1427 = _1425 + _1409;
    float _1429 = trunc(_1419);
    int _1431 = int(_1429);
    float _1433 = _1415;
    float _1435 = as_type<float>(_1423);
    if (!_1210)
    {
        _1433 = 1.2345600128173828125;
    }
    float _1437 = _1433;
    int _1439 = _1395 * _1421;
    int _1441 = _1439 + _1218;
    int _1443 = abs(_259);
    float _1445 = _1291 * _1437;
    bool _1447 = !_1379;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = _1427 * _1423;
    int _1453 = abs(_265);
    float _1455 = floor(_1445);
    int _1457 = int(_1315) + int(_1407);
    int _1459 = abs(_1449);
    float _1461 = float(_1172);
    int _1463 = _1431 * _1443;
    int _1465 = _1463 + _1451;
    float _1467 = float(_1273);
    float _1469 = _1411 * _1461;
    int _1471 = ~_1172;
    int _1473 = _1471 + 1;
    bool _1475 = _1467 >= _1461;
    bool _1477 = isnan(_1467);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan(_1461);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    int _1487 = _1441 * _1453;
    int _1489 = _1487 + _1465;
    float _1491 = -_1455;
    float _1493 = _1445 + _1491;
    float _1495 = trunc(_1469);
    int _1497 = int(_1495);
    float _1499 = -_181;
    float _1501 = _791 ? _1499 : _181;
    int _1503 = _1395 * _1459;
    int _1505 = _1503 + _1489;
    float _1507 = _1493 * _1461;
    int _1509 = _1473 * _1457;
    int _1511 = _1509 + _1273;
    int _1513 = abs(_523);
    float _1515 = float(uint(_1505));
    float _1517 = trunc(_1485);
    int _1519 = int(_1517);
    bool _1521 = uint(_1511) >= uint(_1172);
    int _1523 = ~_1150;
    int _1525 = _1523 + 1;
    float _1527 = as_type<float>(_1224) * _1515;
    bool _1529 = !_1521;
    int _1531 = _1529 ? 0 : (-1);
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1535 = _1533 != 0;
    float _1537 = trunc(_1507);
    int _1539 = int(_1537);
    int _1541 = ~_1457;
    int _1543 = _1541 + _1531;
    int _1545 = _1543 + 1;
    bool _1547 = !_1535;
    int _1549 = _1547 ? 0 : 1;
    bool _1551 = _1172 == 0;
    int _1553 = abs(_1549);
    float _1555 = trunc(_1527);
    float _1557 = precise::max(_1555, 0.0);
    uint _1559 = uint(_1557);
    int _1561 = _1172 * _1545;
    int _1563 = _1561 + _1273;
    int _1565 = ~_1519;
    int _1567 = _1565 + 1;
    int _1569 = _1567 + 1;
    int _1571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1573 = _1571 != 0;
    bool _1575 = !_1551;
    int _1577 = _1575 ? _1563 : (-1);
    int _1579 = _1539 * _1553;
    int _1581 = _1579 + _1273;
    int _1583 = _1172 + (-1);
    int _1585 = _1577 * _1569;
    float _1587 = -_177;
    int _1589 = _559 ? as_type<int>(_1587) : as_type<int>(_177);
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1593 = _1591 != 0;
    int _1595 = _1519 * _1583;
    int _1597 = _1595 + _1585;
    int _1599 = abs(_543);
    int _1601 = _1525 * int(_1559);
    int _1603 = _1601 + _1505;
    int _1605 = abs(_535);
    float _1607 = float(uint(_1603));
    int _1609 = _1597 * _1513;
    int _1611 = abs(_551);
    int _1613 = _1497 * _1605;
    int _1615 = _1613 + _1609;
    float _1617 = as_type<float>(_1224) * _1607;
    int _1619 = _1581 * _1599;
    int _1621 = _1619 + _1615;
    float _1623 = trunc(_1617);
    float _1625 = precise::max(_1623, 0.0);
    uint _1627 = uint(_1625);
    int _1629 = ~_1150;
    int _1631 = _1629 + 1;
    int _1633 = _1539 * _1611;
    int _1635 = _1633 + _1621;
    int _1637 = ~_1150;
    int _1639 = _1637 + 1;
    bool _1641 = !_1573;
    float _1643 = _1641 ? _181 : _1501;
    float _1645 = float(uint(_1635));
    int _1647 = ~_1172;
    int _1649 = _1647 + 1;
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1653 = _1651 != 0;
    float _1655 = as_type<float>(_1269) * _1645;
    float _1657 = -_1103;
    float _1659 = _1657 + 1.0;
    int _1661 = int(_1559) + int(_1627);
    float _1663 = trunc(_1655);
    float _1665 = precise::max(_1663, 0.0);
    uint _1667 = uint(_1665);
    float _1669 = float(uint(_1441));
    int _1671 = _1631 * _1661;
    int _1673 = _1671 + _1505;
    float _1675 = as_type<float>(_1224) * _1669;
    bool _1677 = uint(_1673) >= uint(_1150);
    float _1679 = trunc(_1675);
    float _1681 = precise::max(_1679, 0.0);
    uint _1683 = uint(_1681);
    bool _1685 = !_1677;
    int _1687 = _1685 ? 0 : (-1);
    int _1689 = _1649 * int(_1667);
    int _1691 = _1689 + _1635;
    bool _1693 = _485 > 0.5;
    int _1695 = ~_1661;
    int _1697 = _1695 + _1687;
    int _1699 = _1697 + 1;
    float _1701 = float(uint(_1691));
    float _1703 = -_181;
    int _1705 = _1693 ? as_type<int>(_1703) : as_type<int>(_181);
    int _1707 = _1150 * _1699;
    int _1709 = _1707 + _1505;
    float _1711 = float(uint(_1581));
    float _1713 = as_type<float>(_1269) * _1701;
    int _1715 = ~_1150;
    int _1717 = _1715 + 1;
    bool _1719 = !_1198;
    int _1721 = _1719 ? _1709 : (-1);
    int _1723 = _1639 * int(_1683);
    int _1725 = _1723 + _1441;
    float _1727 = as_type<float>(_1269) * _1711;
    float _1729 = trunc(_1713);
    float _1731 = precise::max(_1729, 0.0);
    uint _1733 = uint(_1731);
    int _1735 = _1721 & 3;
    bool _1737 = _1735 != 0;
    int _1739 = _1721 & 3;
    bool _1741 = _1739 != 0;
    int _1743 = _1737 ? 0 : 1;
    bool _1745 = uint(_1739) > 1u;
    float _1747 = trunc(_1727);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    float _1753 = float(uint(_1725));
    int _1755 = ~_1172;
    int _1757 = _1755 + 1;
    float _1759 = as_type<float>(_1224) * _1753;
    int _1761 = ~_1743;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    int _1767 = int(_1667) + int(_1733);
    float _1769 = trunc(_1759);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    int _1775 = ~_1172;
    int _1777 = _1775 + 1;
    int _1779 = _1765;
    float _1781 = _1501;
    float _1783 = as_type<float>(_1459);
    float _1785 = as_type<float>(_1473);
    if (!_1745)
    {
        int _1787 = ~_1743;
        int _1789 = _1787 + 1;
        _1779 = _1789;
    }
    int _1791 = _1779;
    int _1793 = _1757 * _1767;
    int _1795 = _1793 + _1635;
    bool _1797 = uint(_1739) >= 2u;
    int _1799 = _1777 * int(_1751);
    int _1801 = _1799 + _1581;
    int _1803 = _1797 ? 0 : 1;
    bool _1805 = uint(_1795) >= uint(_1172);
    float _1807 = float(uint(_1801));
    bool _1809 = !_1805;
    int _1811 = _1809 ? 0 : (-1);
    bool _1813 = _1739 != 3;
    float _1815 = as_type<float>(_1269) * _1807;
    int _1817 = ~_1767;
    int _1819 = _1817 + _1811;
    int _1821 = _1819 + 1;
    int _1823 = int(_1683) + int(_1773);
    int _1825 = _1172 * _1821;
    int _1827 = _1825 + _1635;
    int _1829 = ~_1803;
    int _1831 = _1829 + 1;
    int _1833 = _1831 + 1;
    float _1835 = trunc(_1815);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    int _1841 = ~_1172;
    int _1843 = _1841 + 1;
    int _1845 = _1717 * _1823;
    int _1847 = _1845 + _1441;
    bool _1849 = !_1551;
    int _1851 = _1849 ? _1827 : (-1);
    int _1853 = _1833;
    int _1855 = _1717;
    if (_1813)
    {
        int _1857 = ~_1803;
        int _1859 = _1857 + 1;
        _1853 = _1859;
    }
    int _1861 = _1853;
    bool _1863 = uint(_1847) >= uint(_1150);
    if (_1210)
    {
        _1855 = 0;
    }
    int _1865 = _1855;
    bool _1867 = !_1863;
    int _1869 = _1867 ? 0 : (-1);
    int _1871 = _1865;
    if (!_1210)
    {
        _1871 = 1;
    }
    int _1873 = _1871;
    int _1875 = _1851 & 3;
    bool _1877 = _1875 != 0;
    int _1879 = _1851 & 3;
    bool _1881 = _1879 != 0;
    int _1883 = _1877 ? 0 : 1;
    bool _1885 = uint(_1879) > 1u;
    int _1887 = int(_1751) + int(_1839);
    int _1889 = ~_1883;
    int _1891 = _1889 + 1;
    int _1893 = _1891 + 1;
    int _1895 = abs(_1861);
    int _1897 = _1843 * _1887;
    int _1899 = _1897 + _1581;
    int _1901 = _1893;
    if (!_1885)
    {
        int _1903 = ~_1883;
        int _1905 = _1903 + 1;
        _1901 = _1905;
    }
    int _1907 = _1901;
    bool _1909 = uint(_1899) >= uint(_1172);
    bool _1911 = !_1909;
    int _1913 = _1911 ? 0 : (-1);
    bool _1915 = _479 > 0.5;
    float _1917 = -_177;
    int _1919 = _1915 ? as_type<int>(_1917) : as_type<int>(_177);
    int _1921 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1923 = _1921 != 0;
    float _1925 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1927 = !_1923;
    float _1929 = _1927 ? _177 : as_type<float>(_1919);
    float _1931 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1925);
    bool _1933 = _1873 != 1;
    float _1935 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1931);
    int _1937 = ~_1887;
    int _1939 = _1937 + _1913;
    int _1941 = _1939 + 1;
    bool _1943 = !_1881;
    int _1945 = _1943 ? 0 : 1;
    out.m_68.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_68.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_68.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _1947 = _1739 != 3;
    int _1949 = _1172 * _1941;
    int _1951 = _1949 + _1581;
    if (!_1933)
    {
        _1781 = _481;
    }
    float _1953 = _1781;
    float _1955 = _1953;
    if (!_1933)
    {
        _1783 = _481;
    }
    float _1957 = _1783;
    float _1959 = _1957;
    if (!_1933)
    {
        _1785 = _483;
    }
    float _1961 = _1785;
    float _1963 = _1961;
    if (!_1933)
    {
        _1435 = _483;
    }
    float _1965 = _1435;
    float _1967 = _479 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1969 = _1965;
    if (_1933)
    {
        _1955 = _479;
    }
    float _1971 = _1955;
    float _1973 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1933)
    {
        _1959 = _479;
    }
    float _1975 = _1959;
    float _1977 = -_1144;
    float _1979 = fma(_1967, 2.0, _1977);
    if (_1933)
    {
        _1963 = _481;
    }
    float _1981 = _1963;
    float _1983 = _481 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1933)
    {
        _1969 = _481;
    }
    float _1985 = _1969;
    float _1987 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1991 = _1989 != 0;
    float _1993 = fma(_1983, -2.0, _1156);
    int _1995 = _1721 >> 31;
    float _1997 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1999 = !_1991;
    float _2001 = _1999 ? _177 : as_type<float>(_1589);
    float _2003 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2007 = _2005 != 0;
    float _2009 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2011 = _1995 & 3;
    float _2013 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1146);
    int _2015 = _1851 >> 31;
    float _2017 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1987);
    int _2019 = _1721 + _2011;
    float _2021 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1973);
    float _2023 = _697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2025 = _2015 & 3;
    float _2027 = -_143;
    float _2029 = fma(_2027, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1979);
    int _2031 = _2019 >> 2;
    float _2033 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2023);
    int _2035 = _1851 + _2025;
    float _2037 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1993);
    int _2039 = _2031 << 4;
    int _2041 = _2039 + 368;
    float _2043 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2033);
    float _2045 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    uint _2047 = uint(int(uint(_2041) >> uint(2)));
    uint _2049 = uint(int(uint(int(_2047)) >> uint(2)));
    int _2051 = int(_2047) & 3;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[int(_2049)][_2051];
    int _2055 = int(_2047) + 1;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    int _2059 = _2055 & 3;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[int(_2057)][_2059];
    float _2063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2065 = _2035 >> 2;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2069 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2073 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2075 = _2065 << 4;
    int _2077 = _2075 + 512;
    float _2079 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    uint _2087 = uint(int(uint(_2077) >> uint(2)));
    uint _2089 = uint(int(uint(int(_2087)) >> uint(2)));
    int _2091 = int(_2087) & 3;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[int(_2089)][_2091];
    int _2095 = int(_2087) + 1;
    uint _2097 = uint(int(uint(_2095) >> uint(2)));
    int _2099 = _2095 & 3;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[int(_2097)][_2099];
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2107 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2109 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2111 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_70.x = _2071;
    out.m_70.y = _2073;
    out.m_70.z = _2079;
    bool _2113 = !_2007;
    float _2115 = _2113 ? _181 : as_type<float>(_1705);
    float _2117 = 1.0 / _2111;
    out.m_72.x = _2105;
    out.m_72.y = _2107;
    out.m_72.z = _2109;
    out.m_72.w = _2103;
    int _2119 = ~_1823;
    int _2121 = _2119 + _1869;
    int _2123 = _2121 + 1;
    float _2125 = _1180 + _2111;
    int _2127 = _2041 + 8;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    uint _2131 = uint(int(uint(int(_2129)) >> uint(2)));
    int _2133 = int(_2129) & 3;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[int(_2131)][_2133];
    int _2137 = int(_2129) + 1;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    int _2141 = _2137 & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    float _2145 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2147 = _1243 * _2145;
    bool _2149 = uint(_1879) >= 2u;
    int _2151 = _1150 * _2123;
    int _2153 = _2151 + _1441;
    bool _2155 = !_1741;
    int _2157 = _2155 ? 0 : 1;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2161 = _1243 * _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2165 = _1243 * _2163;
    bool _2167 = _1879 != 3;
    float _2169 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2171 = int(_2169);
    int _2173 = abs(_2157);
    float _2175 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2161);
    float _2177 = _2125 * _2117;
    float _2179 = _2177 * 0.5;
    int _2181 = _2077 + 8;
    uint _2183 = uint(int(uint(_2181) >> uint(2)));
    uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
    int _2187 = int(_2183) & 3;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[int(_2185)][_2187];
    int _2191 = int(_2183) + 1;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    int _2195 = _2191 & 3;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[int(_2193)][_2195];
    int _2199 = abs(_1791);
    float _2201 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2147);
    float _2203 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2165);
    int _2205 = abs(_1907);
    float _2207 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2209 = int(_2207);
    out.m_74.x = _2201;
    out.m_74.y = _2175;
    out.m_74.z = _2203;
    int _2211 = _2149 ? 0 : 1;
    int _2213 = ~_2199;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    int _2219 = ~_2205;
    int _2221 = _2219 + 1;
    int _2223 = _2221 + 1;
    int _2225 = _2217 * as_type<int>(_2061);
    bool _2227 = !_1551;
    int _2229 = _2227 ? _1951 : (-1);
    float _2231 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2233 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2231);
    int _2235 = ~_2211;
    int _2237 = _2235 + 1;
    int _2239 = _2237 + 1;
    int _2241 = _2223 * as_type<int>(_2101);
    int _2243 = ~_2173;
    int _2245 = _2243 + 1;
    int _2247 = _2245 + 1;
    float _2249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2251 = _2239;
    if (_2167)
    {
        int _2253 = ~_2211;
        int _2255 = _2253 + 1;
        _2251 = _2255;
    }
    int _2257 = _2251;
    float _2259 = _2017 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    int _2261 = abs(_1945);
    int _2263 = _2247 * as_type<int>(_2053);
    int _2265 = _2263 + _2225;
    bool _2267 = !_1947;
    int _2269 = _2267 ? 0 : (-1);
    int _2271 = abs(_2257);
    float _2273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2275 = abs(_2269);
    int _2277 = ~_2261;
    int _2279 = _2277 + 1;
    int _2281 = _2279 + 1;
    bool _2283 = _1879 != 3;
    int _2285 = _2281 * as_type<int>(_2093);
    int _2287 = _2285 + _2241;
    int _2289 = ~_2271;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = ~_1895;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = ~_2275;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    int _2307 = _2293 * as_type<int>(_2189);
    int _2309 = _2307 + _2287;
    bool _2311 = !_1653;
    int _2313 = _2311 ? 0 : 1;
    int _2315 = _2299 * as_type<int>(_2135);
    int _2317 = _2315 + _2265;
    float _2319 = float(uint(_2209));
    float _2321 = 1.0 / _2233;
    float _2323 = float(uint(_2171));
    int _2325 = _2305 * as_type<int>(_2143);
    int _2327 = _2325 + _2317;
    bool _2329 = !_2283;
    int _2331 = _2329 ? 0 : (-1);
    float _2333 = _1176 * _2273;
    int _2335 = abs(_2313);
    int _2337 = abs(_2171);
    float _2339 = 1.0 / _2319;
    bool _2341 = !_1198;
    int _2343 = _2341 ? _2153 : (-1);
    int _2345 = abs(_2209);
    float _2347 = float(uint(_2345));
    float _2349 = 1.0 / _2323;
    int _2351 = abs(_2331);
    bool _2353 = !_1593;
    int _2355 = _2353 ? 0 : 1;
    int _2357 = ~_2351;
    int _2359 = _2357 + 1;
    int _2361 = _2359 + 1;
    int _2363 = abs(_2355);
    float _2365 = 1.0 / _2347;
    int _2367 = _2361 * as_type<int>(_2197);
    int _2369 = _2367 + _2309;
    int _2371 = ~_2335;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    int _2377 = ~_2363;
    int _2379 = _2377 + 1;
    int _2381 = _2379 + 1;
    float _2383 = float(uint(_2337));
    int _2385 = _2327 * _2375;
    int _2387 = ~_2171;
    int _2389 = _2387 + 1;
    int _2391 = _2369 * _2381;
    float _2393 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2395 = _2321 * _2393;
    int _2397 = _2343 * _2335;
    int _2399 = _2397 + _2385;
    int _2401 = _2229 * _2363;
    int _2403 = _2401 + _2391;
    int _2405 = as_type<int>(_2339) + (-2);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2409 = float(uint(_2399));
    float _2411 = abs(_2395);
    float _2413 = log2(_2411);
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2417 = float(uint(_2403));
    float _2419 = as_type<float>(_2405) * _2409;
    int _2421 = as_type<int>(_2349) + (-2);
    float _2423 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2415);
    int _2425 = abs(_2399);
    float _2427 = 1.0 / _2383;
    int _2429 = ~_2209;
    int _2431 = _2429 + 1;
    float _2433 = trunc(_2419);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2441 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2407);
    float _2443 = as_type<float>(_2421) * _2417;
    int _2445 = ~_2209;
    int _2447 = _2445 + 1;
    float _2449 = _2439 * _2249;
    float _2451 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2453 = trunc(_2443);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    int _2459 = as_type<int>(_2365) + (-2);
    out.m_76.x = _2449;
    out.m_76.y = _2333;
    float _2461 = float(uint(_2425));
    int _2463 = abs(_2403);
    int _2465 = as_type<int>(_2427) + (-2);
    float _2467 = as_type<float>(_2459) * _2461;
    float _2469 = float(uint(_2463));
    int _2471 = _2447 * int(_2437);
    int _2473 = _2471 + _2399;
    float _2475 = exp2(_2451);
    float _2477 = float(uint(_2473));
    int _2479 = _2389 * int(_2457);
    int _2481 = _2479 + _2403;
    float _2483 = as_type<float>(_2465) * _2469;
    float _2485 = trunc(_2467);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = as_type<float>(_2405) * _2477;
    float _2493 = float(uint(_2481));
    float _2495 = as_type<float>(_2421) * _2493;
    float _2497 = trunc(_2483);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    int _2503 = ~_2345;
    int _2505 = _2503 + 1;
    float _2507 = fma(_2475, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2509 = precise::clamp(_2507, 0.0, 1.0);
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2513 = ~_2337;
    int _2515 = _2513 + 1;
    float _2517 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2519 = trunc(_2491);
    float _2521 = precise::max(_2519, 0.0);
    uint _2523 = uint(_2521);
    int _2525 = _2505 * int(_2489);
    int _2527 = _2525 + _2425;
    float _2529 = -_2511;
    float _2531 = fma(_1997, 2.0, _2529);
    float _2533 = fma(_2509, -2.0, 3.0);
    float _2535 = _2509 * _2509;
    float _2537 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2441);
    float _2539 = float(uint(_2527));
    int _2541 = _2515 * int(_2501);
    int _2543 = _2541 + _2463;
    float _2545 = fma(_2009, -2.0, _2517);
    float _2547 = trunc(_2495);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    float _2553 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2423);
    float _2555 = as_type<float>(_2459) * _2539;
    float _2557 = float(uint(_2543));
    float _2559 = -_143;
    float _2561 = fma(_2559, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2531);
    float _2563 = _2535 * _2533;
    float _2565 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2545);
    int _2567 = int(_2437) + int(_2523);
    float _2569 = as_type<float>(_2465) * _2557;
    float _2571 = -_2563;
    float _2573 = _2571 + 1.0;
    float _2575 = trunc(_2555);
    float _2577 = precise::max(_2575, 0.0);
    uint _2579 = uint(_2577);
    int _2581 = ~_2345;
    int _2583 = _2581 + 1;
    int _2585 = _2431 * _2567;
    int _2587 = _2585 + _2399;
    float _2589 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2563);
    int _2591 = ~_2171;
    int _2593 = _2591 + 1;
    float _2595 = -_1935;
    float _2597 = _2595 + 1.0;
    int _2599 = int(_2457) + int(_2551);
    float _2601 = -_2537;
    float _2603 = _2601 + 1.0;
    float _2605 = trunc(_2569);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    float _2611 = -_2553;
    float _2613 = _2611 + 1.0;
    int _2615 = ~_2337;
    int _2617 = _2615 + 1;
    bool _2619 = uint(_2587) >= uint(_2209);
    int _2621 = int(_2489) + int(_2579);
    float _2623 = -_1178;
    float _2625 = _2623 + 1.0;
    bool _2627 = !_2619;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = _2209 == 0;
    int _2633 = _2583 * _2621;
    int _2635 = _2633 + _2425;
    int _2637 = int(_2501) + int(_2609);
    int _2639 = _2593 * _2599;
    int _2641 = _2639 + _2403;
    int _2643 = ~_2567;
    int _2645 = _2643 + _2629;
    int _2647 = _2645 + 1;
    float _2649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2651 = uint(_2635) >= uint(_2345);
    int _2653 = _2617 * _2637;
    int _2655 = _2653 + _2463;
    bool _2657 = uint(_2641) >= uint(_2171);
    int _2659 = _2209 * _2647;
    int _2661 = _2659 + _2399;
    int _2663 = _2399 ^ _2209;
    float _2665 = _1069 + _1027;
    bool _2667 = !_2657;
    int _2669 = _2667 ? 0 : (-1);
    float _2671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2673 = _2209 == 0;
    float _2675 = _2665 * 0.5;
    bool _2677 = uint(_2655) >= uint(_2337);
    int _2679 = _2403 ^ _2171;
    bool _2681 = !_2651;
    int _2683 = _2681 ? 0 : (-1);
    float _2685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2687 = uint(int(uint(_2663) >> uint(31)));
    bool _2689 = !_2677;
    int _2691 = _2689 ? 0 : (-1);
    uint _2693 = uint(int(uint(_2679) >> uint(31)));
    int _2695 = ~_2683;
    int _2697 = _2621 + _2695;
    int _2699 = _2697 + 1;
    int _2701 = ~int(_2687);
    int _2703 = _2701 + 1;
    float _2705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2707 = ~_2691;
    int _2709 = _2637 + _2707;
    int _2711 = _2709 + 1;
    int _2713 = ~int(_2693);
    int _2715 = _2713 + 1;
    int _2717 = ~_2599;
    int _2719 = _2717 + _2669;
    int _2721 = _2719 + 1;
    float _2723 = _2685 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2725 = _2699 ^ _2703;
    int _2727 = _2711 ^ _2715;
    int _2729 = _2171 * _2721;
    int _2731 = _2729 + _2403;
    bool _2733 = _2171 == 0;
    float _2735 = _2671 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2737 = _2171 == 0;
    int _2739 = ~_2703;
    int _2741 = _2739 + _2725;
    int _2743 = _2741 + 1;
    int _2745 = ~_2715;
    int _2747 = _2745 + _2727;
    int _2749 = _2747 + 1;
    float _2751 = _2649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2753 = !_2631;
    int _2755 = _2753 ? _2661 : (-1);
    bool _2757 = !_2733;
    int _2759 = _2757 ? _2731 : (-1);
    bool _2761 = !_2673;
    int _2763 = _2761 ? _2743 : (-1);
    float _2765 = _2115 + (-0.5);
    float _2767 = float(_2759);
    float _2769 = float(_2763);
    float _2771 = float(_2755);
    float _2773 = fma(_2723, _2767, _2561);
    float _2775 = _1643 + (-0.5);
    float _2777 = -_2037;
    float _2779 = fma(_2735, _2769, _2777);
    float _2781 = _1929 + 0.5;
    float _2783 = fma(_2751, _2771, _2029);
    bool _2785 = !_2737;
    int _2787 = _2785 ? _2749 : (-1);
    float _2789 = -_2735;
    float _2791 = fma(_2789, _2775, _2779);
    float _2793 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2795 = fma(_2751, _2781, _2783);
    float _2797 = float(_2787);
    float _2799 = in.m_78.x;
    float _2801 = fma(_1643, _2625, _2791);
    bool _2803 = _2395 <= 8000.0;
    bool _2805 = isnan(_2395);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan(8000.0);
    bool _2811 = _2807 || _2809;
    float _2813 = float(_2811);
    float _2815 = _2705 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2817 = -_2597;
    float _2819 = fma(_1929, _2817, _2795);
    float _2821 = _1027 * 0.5;
    out.m_80.x = _2045;
    out.m_80.y = _2259;
    out.m_80.z = _2793;
    float _2823 = _2813 * _2589;
    float _2825 = -_2565;
    float _2827 = fma(_2815, _2797, _2825);
    float _2829 = _2001 + 0.5;
    float _2831 = _2823 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2833 = -_2815;
    float _2835 = fma(_2833, _2765, _2827);
    float _2837 = fma(_2723, _2829, _2773);
    float _2839 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1204);
    float _2841 = _1659 * _2831;
    float _2843 = precise::clamp(_2841, 0.0, 1.0);
    float _2845 = fma(_2115, _2613, _2835);
    float _2847 = -_2603;
    float _2849 = fma(_2001, _2847, _2837);
    float _2851 = fma(_1083, -0.5, _2821);
    float _2853 = _1299 * _1105;
    float _2855 = -_2843;
    float _2857 = fma(_2855, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2859 = _2839 + _1027;
    float _2861 = -_1299;
    float _2863 = _2861 + 1.0;
    float _2865 = _1116 * _2853;
    float _2867 = _2857 * _2799;
    float _2869 = _1134 * _2853;
    out.gl_Position.x = _1069;
    out.gl_Position.y = _1083;
    out.gl_Position.z = _2839;
    out.gl_Position.w = _1027;
    float _2871 = _2859 * 0.5;
    float _2873 = fma(_1130, _2865, _1110);
    float _2875 = fma(_1132, _2865, _1112);
    float _2877 = _1116 * _2863;
    float _2879 = fma(_1116, _2869, _1114);
    out.m_82.x = _2675;
    out.m_82.y = _2851;
    out.m_82.z = _2871;
    out.m_82.w = _1027;
    bool _2881 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2883 = isnan(_951);
    bool _2885 = _2881 || _2883;
    bool _2887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2889 = _2885 || _2887;
    out.m_84.x = _2819;
    out.m_84.y = _2801;
    out.m_84.z = _2849;
    out.m_84.w = _2845;
    float _2891 = _2867 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _2873;
    out.m_86.y = _2875;
    out.m_86.z = _2879;
    out.m_86.w = _2877;
    out.m_88.x = _2891;
    float _2893 = _2865;
    float _2895 = _2867;
    float _2897 = _2799;
    float _2899 = _2853;
    if (!_2889)
    {
        _1255 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2901 = _1255;
    float _2903 = _2901;
    float _2905 = _2901;
    if (!_2889)
    {
        _1257 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2907 = _1257;
    float _2909 = _2907;
    float _2911 = _2907;
    if (!_2889)
    {
        _2893 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2913 = _2893;
    float _2915 = _2913;
    float _2917 = _2913;
    if (!_2889)
    {
        _2895 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2919 = _2895;
    float _2921 = _2919;
    float _2923 = _2919;
    if (!_2889)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2925 = _2897;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2889)
    {
        _2899 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2931 = _2899;
    bool _2933 = !_2889;
    float _2935 = _2931;
    float _2937 = _2931;
    if (!_2933)
    {
        bool _2939 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2941 = isnan(_951);
        bool _2943 = _2939 || _2941;
        bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2947 = _2943 || _2945;
        if (!_2947)
        {
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2951 = _951 + _2949;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2953;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2961 = 1.0 / _2955;
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2979 = _2951 * _2961;
            float _2981 = precise::clamp(_2979, 0.0, 1.0);
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2987 = fma(_2981, _2959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2989 = fma(_2981, _2985, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2991 = fma(_2981, _2965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2993 = fma(_2981, _2969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2995 = fma(_2981, _2973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2997 = fma(_2981, _2977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2911 = _2991;
            _2929 = _2995;
            _2905 = _2987;
            _2923 = _2993;
            _2917 = _2989;
            _2937 = _2997;
            _2999 = true;
        }
        else
        {
            bool _3001 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3003 = isnan(_951);
            bool _3005 = _3001 || _3003;
            bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3009 = _3005 || _3007;
            if (!_3009)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3011 = _2903;
            _2905 = _3011;
            if (!_3009)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3013 = _2909;
            _2911 = _3013;
            if (!_3009)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3015 = _2915;
            _2917 = _3015;
            if (!_3009)
            {
                _2921 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3017 = _2921;
            _2923 = _3017;
            if (!_3009)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3009)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3021 = _2935;
            bool _3023 = !_3009;
            _2937 = _3021;
            if (!_3023)
            {
                bool _3025 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3027 = isnan(_951);
                bool _3029 = _3025 || _3027;
                bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3033 = _3029 || _3031;
                if (!_3033)
                {
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3037 = _951 + _3035;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3039;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3047 = 1.0 / _3041;
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3065 = _3037 * _3047;
                    float _3067 = precise::clamp(_3065, 0.0, 1.0);
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3073 = fma(_3067, _3045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3075 = fma(_3067, _3071, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3077 = fma(_3067, _3051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3079 = fma(_3067, _3055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3081 = fma(_3067, _3059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3083 = fma(_3067, _3063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2911 = _3077;
                    _2929 = _3081;
                    _2905 = _3073;
                    _2923 = _3079;
                    _2917 = _3075;
                    _2937 = _3083;
                    _2999 = true;
                }
                else
                {
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2923 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2999 = false;
    float _3085 = _2911;
    float _3087 = _2929;
    float _3089 = _2905;
    float _3091 = _2923;
    float _3093 = _2917;
    float _3095 = _2937;
    float _3097 = fma(_2259, -0.5, 0.5);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -_3085;
    float _3103 = _3101 + _3087;
    float _3105 = -_3089;
    float _3107 = _3105 + _3091;
    float _3109 = -_3093;
    float _3111 = _3109 + _3095;
    bool _3113 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3115 = fma(_3099, _3103, _3085);
    float _3117 = fma(_3099, _3107, _3089);
    float _3119 = fma(_3099, _3111, _3093);
    float _3121 = _3115 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _3123 = fma(_3117, 0.298911988735198974609375, _3121);
    float _3125 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = 1.0;
    float _3127 = fma(_3119, 0.114477999508380889892578125, _3123);
    float _3129 = -_3127;
    float _3131 = _3117 + _3129;
    float _3133 = -_3127;
    float _3135 = _3115 + _3133;
    float _3137 = -_3127;
    float _3139 = _3119 + _3137;
    out.m_88.w = _3125;
    float _3141 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3143 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3145 = fma(_3139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    out.m_60.x = _3141;
    out.m_60.y = _3143;
    out.m_60.z = _3145;
    if (!_3113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3147 = -_771;
    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3151 = -_773;
    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3155 = -_775;
    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3159 = _3149 * _3149;
    float _3161 = fma(_3153, _3153, _3159);
    float _3163 = fma(_3157, _3157, _3161);
    float _3165 = sqrt(_3163);
    float _3167 = rsqrt(_3163);
    float _3169 = -_3165;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = _3153 * _3167;
    float _3179 = _3149 * _3167;
    float _3181 = abs(_3175);
    float _3183 = log2(_3181);
    float _3185 = _3157 * _3167;
    float _3187 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3189 = _2259 * _3179;
    float _3191 = -_3179;
    float _3193 = -_3187;
    float _3195 = fma(_3191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3193);
    float _3197 = fma(_2045, _3177, _3189);
    float _3199 = -_3185;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3195);
    float _3203 = fma(_2793, _3185, _3197);
    float _3205 = precise::clamp(_3203, 0.0, 1.0);
    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3209 = _3201 + _3207;
    float _3211 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3213 = _3209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3215 = precise::clamp(_3213, 0.0, 1.0);
    float _3217 = exp2(_3211);
    float _3219 = _3217 * _3215;
    float _3221 = _3205 * _3219;
    float _3223 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3225 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3227 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3223;
    out.m_90.y = _3225;
    out.m_90.z = _3227;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2999 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3284 = as_type<float>(_125);
        out.gl_Position.z = _3284;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_139)
    {
        float _145 = float(_109);
        _119 = _145;
    }
    float _147 = _119;
    bool _149 = _143 >= _147;
    bool _151 = !_139;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3353 = as_type<float>(_161);
        out.gl_Position.z = _3353;
    }
    if (_153)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_56.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_109);
        float _207 = 1.0 / _205;
        float _209 = _143 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = in.m_46.x;
    float _215 = in.m_46.y;
    float _217 = in.m_46.z;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _211 + _219;
    bool _223 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _225 = isnan(_211);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = 1.0 / _237;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _247 = _245 != 0;
    int _249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _251 = _249 != 0;
    int _253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _255 = _253 != 0;
    bool _257 = !_247;
    int _259 = _257 ? 0 : 1;
    float _261 = 1.0 / _241;
    bool _263 = !_255;
    int _265 = _263 ? 0 : 1;
    bool _267 = !_251;
    int _269 = _267 ? 0 : 1;
    float _271 = _215 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _273 = _215 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _275 = _215 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _211 + _277;
    float _281 = fma(_213, (*spvDescriptorSet0.vp_c10)._m0[5].x, _271);
    float _283 = fma(_213, (*spvDescriptorSet0.vp_c10)._m0[4].x, _273);
    float _285 = _221 * _243;
    float _287 = fma(_213, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    float _289 = fma(_217, (*spvDescriptorSet0.vp_c10)._m0[5].z, _281);
    float _291 = fma(_217, (*spvDescriptorSet0.vp_c10)._m0[4].z, _283);
    bool _293 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_211);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _279 * _261;
    bool _307 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_211);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _289 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _321 = fma(_217, (*spvDescriptorSet0.vp_c10)._m0[6].z, _287);
    float _323 = in.m_58.x;
    float _325 = in.m_58.y;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _327;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = _291 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _339 = _319 + _337;
    float _341 = fma(_329, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = _303 * _333;
    float _345 = _321 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _349 = _335 + _347;
    float _351 = _339 * _339;
    float _353 = -_303;
    float _355 = _353 + 1.0;
    float _357 = -_233;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _365 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _367 = _345 + _365;
    float _369 = fma(_349, _349, _351);
    float _371 = _341 * _343;
    float _373 = _317 * _359;
    float _375 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = fma(_367, _367, _369);
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = sqrt(_377);
    float _383 = fma(_375, _373, _379);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _391 = fma(_387, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = rsqrt(_377);
    float _395 = _389 * _323;
    float _397 = _391 * _343;
    float _399 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _401 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _397);
    float _403 = _381 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _405 = _399 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _407 = precise::min(_405, _403);
    float _409 = _393 * _407;
    float _411 = _339 * _409;
    float _413 = _349 * _409;
    float _415 = -_411;
    float _417 = _339 + _415;
    float _419 = _367 * _409;
    float _421 = -_413;
    float _423 = _349 + _421;
    float _425 = _417 * _417;
    float _427 = -_419;
    float _429 = _367 + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = fma(_423, _423, _425);
    float _437 = fma(_433, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = fma(_429, _429, _435);
    float _441 = fma(_437, _373, _401);
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _445 = sqrt(_439);
    float _447 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _449 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[145].y, _441);
    float _451 = _449 * _325;
    float _453 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _455 = _393 * _445;
    float _457 = _453 * _455;
    float _459 = _399 * _455;
    float _461 = _455 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _463 = _461 * 0.5;
    float _465 = _457 * _443;
    float _467 = _459 * _447;
    float _469 = _465 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _471 = _465 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _473 = _465 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _475 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[26].x, _469);
    float _477 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[24].x, _471);
    float _479 = in.m_56.x;
    float _481 = in.m_56.y;
    float _483 = in.m_56.z;
    float _485 = in.m_56.w;
    float _487 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[25].x, _473);
    float _489 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _475);
    float _491 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _477);
    float _493 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _487);
    float _495 = _489 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _497 = _491 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _505 = _503 != 0;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _513 = _511 != 0;
    float _515 = _493 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _517 = _345 + _495;
    float _519 = _335 + _497;
    bool _521 = !_505;
    int _523 = _521 ? 0 : 1;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _527 = _517 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _531 = _519 + _529;
    bool _533 = !_501;
    int _535 = _533 ? 0 : 1;
    float _537 = _319 + _515;
    float _539 = _527 * _527;
    bool _541 = !_509;
    int _543 = _541 ? 0 : 1;
    float _545 = -_413;
    float _547 = _335 + _545;
    bool _549 = !_513;
    int _551 = _549 ? 0 : 1;
    float _553 = fma(_531, _531, _539);
    bool _555 = _481 > 0.5;
    float _557 = sqrt(_553);
    bool _559 = _483 > 0.5;
    bool _561 = _481 > 0.5;
    int _563 = int(_561);
    int _565 = _505 ? 2 : 0;
    int _567 = _563 | _565;
    int _569 = _509 ? 4 : 0;
    int _571 = _567 | _569;
    int _573 = _513 ? 8 : 0;
    int _575 = _571 | _573;
    int _577 = _555 ? 16 : 0;
    int _579 = _575 | _577;
    int _581 = _251 ? 32 : 0;
    int _583 = _579 | _581;
    int _585 = _559 ? 64 : 0;
    int _587 = _583 | _585;
    int _589 = _587 & 16;
    float _591 = -_177;
    int _593 = _561 ? as_type<int>(_591) : as_type<int>(_177);
    float _595 = -_181;
    int _597 = _559 ? as_type<int>(_595) : as_type<int>(_181);
    bool _599 = _557 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _607 = _605 != 0;
    bool _609 = !_603;
    float _611 = _609 ? _177 : as_type<float>(_593);
    bool _613 = !_607;
    float _615 = _613 ? _181 : as_type<float>(_597);
    float _617 = _495;
    float _619 = _519;
    float _621 = _517;
    float _623 = _411;
    if (!_599)
    {
        _617 = _537;
    }
    float _625 = _617;
    bool _627 = !_599;
    float _629 = _625;
    if (!_627)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _635 = _557 + _633;
        float _637 = rsqrt(_553);
        float _639 = _635 * _631;
        float _641 = _537 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = _639 * 0.15915493667125701904296875;
        float _645 = _643 * 6.283185482025146484375;
        float _647 = sin(_645);
        float _649 = _643 * 6.283185482025146484375;
        float _651 = cos(_649);
        float _653 = fma(_647, _641, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _655 = _637 * _653;
        float _657 = _651 + (-1.0);
        float _659 = fma(_531, _655, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _661 = fma(_527, _655, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _663 = _657 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _665 = fma(_537, _651, _663);
        _619 = _659;
        _621 = _661;
        _629 = _665;
    }
    float _667 = _619;
    float _669 = _621;
    float _671 = _629;
    bool _673 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _675 = isnan(0.5);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _681 = _677 || _679;
    float _683 = -_413;
    float _685 = _683 + _667;
    float _687 = -_419;
    float _689 = _687 + _669;
    float _691 = -_411;
    float _693 = _691 + _671;
    float _695 = -_411;
    float _697 = _319 + _695;
    float _699 = -_419;
    float _701 = _345 + _699;
    float _703 = _685;
    float _705 = _693;
    float _707 = _689;
    float _709 = _671;
    float _711 = _667;
    if (_681)
    {
        _623 = _685;
    }
    float _713 = _623;
    float _715 = _713;
    if (_681)
    {
        _703 = _689;
    }
    float _717 = _703;
    float _719 = _717;
    if (!_681)
    {
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _723 = _697 + _721;
        float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _727 = _547 + _725;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _731 = -_335;
        float _733 = _731 + _667;
        float _735 = _723 * _723;
        float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _739 = _701 + _737;
        float _741 = fma(_727, _727, _735);
        float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _745 = fma(_739, _739, _741);
        float _747 = sqrt(_745);
        float _749 = _729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _751 = -_319;
        float _753 = _751 + _671;
        float _755 = -_345;
        float _757 = _755 + _669;
        float _759 = precise::min(_747, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _761 = _759 * _743;
        float _763 = _749 * _761;
        float _765 = fma(_733, _763, _547);
        float _767 = fma(_753, _763, _697);
        float _769 = fma(_757, _763, _701);
        _705 = _767;
        _715 = _765;
        _719 = _769;
        _707 = _753;
    }
    float _771 = _705;
    float _773 = _715;
    float _775 = _719;
    float _777 = _707;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _781 = _771 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _785 = _773 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _789 = _775 + _787;
    bool _791 = _589 != 0;
    float _793 = _781 * _781;
    float _795 = fma(_785, _785, _793);
    float _797 = fma(_789, _789, _795);
    float _799 = rsqrt(_797);
    float _801 = _799 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _803 = _785 * _801;
    float _805 = _789 * _801;
    float _807 = _803 * _803;
    float _809 = _805 * _805;
    float _811 = _807 + _809;
    float _813 = sqrt(_811);
    bool _815 = _813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _819 = _813 + _817;
    float _821 = _789;
    float _823 = _819;
    float _825 = _777;
    if (_815)
    {
        float _827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _821 = _827;
    }
    float _829 = _821;
    if (_815)
    {
        float _831 = rsqrt(_811);
        _709 = _831;
    }
    float _833 = _709;
    float _835 = _833;
    if (_815)
    {
        float _837 = _819 * _829;
        _823 = _837;
    }
    float _839 = _823;
    float _841 = _771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_815)
    {
        float _843 = _839 * 0.15915493667125701904296875;
        _711 = _843;
    }
    float _845 = _711;
    float _847 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _841);
    float _849 = _799;
    float _851 = _845;
    if (_815)
    {
        float _853 = _845 * 6.283185482025146484375;
        float _855 = sin(_853);
        _849 = _855;
    }
    float _857 = _849;
    float _859 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _861 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _847);
    float _863 = precise::max(0.0, _859);
    float _865 = _793;
    float _867 = _863;
    float _869 = _859;
    if (_815)
    {
        float _871 = _845 * 6.283185482025146484375;
        float _873 = cos(_871);
        _865 = _873;
    }
    float _875 = _865;
    float _877 = -_801;
    float _879 = -_863;
    float _881 = fma(_781, _877, _879);
    if (_815)
    {
        float _883 = _881 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _867 = _883;
    }
    float _885 = _867;
    if (!_815)
    {
        _851 = _805;
    }
    float _887 = _851;
    float _889 = fma(_547, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _891 = _857;
    float _893 = _887;
    if (_815)
    {
        float _895 = fma(_857, _885, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _825 = _895;
    }
    float _897 = _825;
    float _899 = _897;
    if (!_815)
    {
        _891 = _807;
    }
    float _901 = _891;
    float _903 = floor(_889);
    float _905 = _901;
    float _907 = _875;
    if (_815)
    {
        float _909 = _875 + (-1.0);
        _869 = _909;
    }
    float _911 = _869;
    float _913 = 0.0;
    float _915 = _911;
    if (_815)
    {
        float _917 = _833 * _897;
        _913 = _917;
    }
    float _919 = _913;
    if (!_815)
    {
        _835 = _803;
    }
    float _921 = _835;
    float _923 = _921;
    if (_815)
    {
        float _925 = _911 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _925;
    }
    float _927 = _915;
    if (_815)
    {
        float _929 = _803 * _919;
        _923 = _929;
    }
    float _931 = _923;
    if (!_815)
    {
        _899 = _881;
    }
    float _933 = _899;
    float _935 = _933;
    if (_815)
    {
        float _937 = _805 * _919;
        _893 = _937;
    }
    float _939 = _893;
    if (_815)
    {
        float _941 = fma(_881, _875, _927);
        _935 = _941;
    }
    float _943 = _935;
    if (_815)
    {
        float _945 = _931 * _931;
        _905 = _945;
    }
    float _947 = _905;
    if (!_815)
    {
        _907 = _809;
    }
    float _949 = _907;
    float _951 = sqrt(_797);
    float _953 = _949;
    if (_815)
    {
        float _955 = _939 * _939;
        _953 = _955;
    }
    float _957 = _953;
    float _959 = fma(_943, _943, _947);
    float _961 = fma(_701, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _963 = _771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _965 = _959 + _957;
    float _967 = _771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _969 = _771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _971 = rsqrt(_965);
    float _973 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _967);
    float _975 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _963);
    float _977 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _969);
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _981 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _973);
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _985 = fma(_951, (*spvDescriptorSet0.vp_c15)._m0[23].w, _983);
    float _987 = precise::clamp(_985, 0.0, 1.0);
    float _989 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _977);
    float _991 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _975);
    float _993 = _981 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = -_987;
    float _997 = _995 + 1.0;
    float _999 = _989 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1001 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1003 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1005 = _861 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1007 = floor(_961);
    float _1009 = _971 * _939;
    float _1011 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1003);
    float _1013 = _1001 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1015 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1011);
    float _1017 = _971 * _931;
    float _1019 = abs(_997);
    float _1021 = log2(_1019);
    float _1023 = -_1013;
    float _1025 = fma(_1023, _979, 1.0);
    float _1027 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1015);
    float _1029 = _971 * _943;
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1033 = -_903;
    float _1035 = _889 + _1033;
    float _1037 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1039 = -_1031;
    float _1041 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1039);
    float _1043 = 1.0 / _1027;
    float _1045 = -_1007;
    float _1047 = _961 + _1045;
    float _1049 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1037);
    float _1051 = -_1009;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1041);
    float _1055 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1057 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1049);
    float _1059 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1061 = fma(_1053, -0.5, 0.5);
    float _1063 = log2(_1025);
    float _1065 = fma(_1053, 0.5, 0.5);
    float _1067 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1055);
    float _1069 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1057);
    float _1071 = _1029 + 1.0;
    float _1073 = fma(_1065, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1075 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1067);
    float _1077 = _1069 * _1043;
    float _1079 = exp2(_1059);
    float _1081 = fma(_1065, _1073, -0.212114393711090087890625);
    float _1083 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1075);
    float _1085 = fma(_1077, 0.5, 0.5);
    float _1087 = fma(_1065, _1081, 1.570728778839111328125);
    float _1089 = _1083 * _1043;
    float _1091 = sqrt(_1061);
    float _1093 = _1063 * 0.693147182464599609375;
    float _1095 = fma(_1089, -0.5, 0.5);
    float _1097 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1099 = -_1029;
    float _1101 = fma(_1079, _1071, _1099);
    float2 _4851 = float2(_1035, _1047);
    float _1103 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4851, float2(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4851, float2(0.0), isnan(_4851)), level(0.0)).x;
    float3 _4862 = float3(_1085, _1095, _1097);
    float _1105 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4862, float3(0.0), isnan(_4862)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4862, float3(0.0), isnan(_4862)), level(0.0)).x;
    float3 _4873 = float3(_1085, _1095, _1097);
    float4 _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4873, float3(0.0), isnan(_4873)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4873, float3(0.0), isnan(_4873)), level(0.0)).xyzw;
    float _1110 = _1108.x;
    float _1112 = _1108.y;
    float _1114 = _1108.z;
    float _1116 = _1108.w;
    float _1118 = fma(_1101, 0.5, 0.5);
    float _1120 = _1091 * 0.636619746685028076171875;
    float _1122 = -_1087;
    float _1124 = fma(_1120, _1122, 1.0);
    float2 _4899 = float2(_1124, _1118);
    float3 _1128 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4899, float2(0.0), isnan(_4899)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4899, float2(0.0), isnan(_4899)), level(0.0)).xyz;
    float _1130 = _1128.x;
    float _1132 = _1128.y;
    float _1134 = _1128.z;
    float _1136 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1138 = int(_1136);
    float _1140 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1142 = _697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1146 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1148 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1150 = int(_1148);
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1154 = fma(_1140, _1140, 1.0);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1158 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1142);
    float _1160 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1152);
    float _1162 = _611 + 0.5;
    float _1164 = -_615;
    float _1166 = _1164 + 0.5;
    float _1168 = float(_1138);
    float _1170 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1172 = int(_1170);
    float _1174 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1158);
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1178 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1160);
    out.m_60.w = _407;
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1182 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1184 = float(uint(_1150));
    float _1186 = 1.0 / _1168;
    int _1188 = ~_1150;
    int _1190 = _1188 + 1;
    out.m_62.x = _547;
    out.m_62.y = _697;
    out.m_62.z = _701;
    int _1192 = ~_1150;
    int _1194 = _1192 + 1;
    float _1196 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1182);
    bool _1198 = _1150 == 0;
    float _1200 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_64.x = _459;
    float _1202 = 1.0 / _1184;
    float _1204 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1196);
    float _1206 = float(uint(_1172));
    out.m_66.x = _773;
    out.m_66.y = _771;
    out.m_66.z = _775;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1210 = _1208 != 0;
    float _1212 = _143 * _1186;
    float _1214 = 1.0 / _1206;
    float _1216 = trunc(_1212);
    int _1218 = int(_1216);
    float _1220 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1222 = int(_1220);
    int _1224 = as_type<int>(_1202) + (-2);
    float _1226 = float(uint(_1218));
    float _1228 = rsqrt(_1154);
    float _1230 = as_type<float>(_1224) * _1226;
    float _1232 = float(_1222);
    float _1234 = trunc(_1230);
    float _1236 = precise::max(_1234, 0.0);
    uint _1239 = uint(_1236);
    float _1241 = 1.0 / _1232;
    float _1243 = _1140 * _1228;
    int _1245 = _1190 * int(_1239);
    int _1247 = _1245 + _1218;
    float _1249 = exp2(_1200);
    float _1251 = float(uint(_1247));
    float _1253 = as_type<float>(_1247);
    float _1255 = _1083;
    float _1257 = _1069;
    if (_1210)
    {
        _1253 = 1.0;
    }
    float _1259 = _1253;
    float _1261 = _143 * _1241;
    float _1263 = _1259;
    if (!_1210)
    {
        _1263 = 7.345489978790283203125;
    }
    float _1265 = _1263;
    float _1267 = as_type<float>(_1224) * _1251;
    int _1269 = as_type<int>(_1214) + (-2);
    float _1271 = trunc(_1261);
    int _1273 = int(_1271);
    float _1275 = _1265 * _479;
    float _1277 = _1265;
    if (_1210)
    {
        float _1279 = in.m_56.x;
        _1277 = _1279;
    }
    float _1281 = _1277;
    float _1283 = -_1249;
    float _1285 = _1283 + 1.0;
    float _1287 = _1281;
    if (!_1210)
    {
        float _1289 = in.m_56.y;
        _1287 = _1289;
    }
    float _1291 = _1287;
    float _1293 = trunc(_1267);
    float _1295 = precise::max(_1293, 0.0);
    uint _1297 = uint(_1295);
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1301 = float(uint(_1273));
    float _1303 = floor(_1275);
    float _1305 = as_type<float>(_1269) * _1301;
    int _1307 = int(_1239) + int(_1297);
    float _1309 = float(_1150);
    float _1311 = trunc(_1305);
    float _1313 = precise::max(_1311, 0.0);
    uint _1315 = uint(_1313);
    float _1317 = float(_1218);
    int _1319 = _1194 * _1307;
    int _1321 = _1319 + _1218;
    float _1323 = float(_109);
    bool _1325 = _1317 >= _1309;
    bool _1327 = isnan(_1317);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan(_1309);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = -_1303;
    float _1339 = _1275 + _1337;
    bool _1341 = uint(_1321) >= uint(_1150);
    int _1343 = ~_1172;
    int _1345 = _1343 + 1;
    float _1347 = 1.0 / _1323;
    bool _1349 = !_1341;
    int _1351 = _1349 ? 0 : (-1);
    float _1353 = _1339 * _1309;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1357 = _1355 != 0;
    int _1359 = ~_1307;
    int _1361 = _1359 + _1351;
    int _1363 = _1361 + 1;
    int _1365 = _1345 * int(_1315);
    int _1367 = _1365 + _1273;
    bool _1369 = !_1357;
    int _1371 = _1369 ? 0 : 1;
    float _1373 = trunc(_1335);
    int _1375 = int(_1373);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1379 = _1377 != 0;
    int _1381 = _1150 * _1363;
    int _1383 = _1381 + _1218;
    float _1385 = float(uint(_1367));
    bool _1387 = !_1198;
    int _1389 = _1387 ? _1383 : (-1);
    float _1391 = as_type<float>(_1269) * _1385;
    float _1393 = trunc(_1353);
    int _1395 = int(_1393);
    int _1397 = ~_1375;
    int _1399 = _1397 + 1;
    int _1401 = _1399 + 1;
    float _1403 = trunc(_1391);
    float _1405 = precise::max(_1403, 0.0);
    uint _1407 = uint(_1405);
    int _1409 = _1389 * _1401;
    float _1411 = _143 * _1347;
    float _1413 = as_type<float>(_1401);
    if (_1210)
    {
        _1413 = 1.0;
    }
    float _1415 = _1413;
    int _1417 = _1150 + (-1);
    float _1419 = _1411 * _1309;
    int _1421 = abs(_1371);
    int _1423 = abs(_269);
    int _1425 = _1375 * _1417;
    int _1427 = _1425 + _1409;
    float _1429 = trunc(_1419);
    int _1431 = int(_1429);
    float _1433 = _1415;
    float _1435 = as_type<float>(_1423);
    if (!_1210)
    {
        _1433 = 1.2345600128173828125;
    }
    float _1437 = _1433;
    int _1439 = _1395 * _1421;
    int _1441 = _1439 + _1218;
    int _1443 = abs(_259);
    float _1445 = _1291 * _1437;
    bool _1447 = !_1379;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = _1427 * _1423;
    int _1453 = abs(_265);
    float _1455 = floor(_1445);
    int _1457 = int(_1315) + int(_1407);
    int _1459 = abs(_1449);
    float _1461 = float(_1172);
    int _1463 = _1431 * _1443;
    int _1465 = _1463 + _1451;
    float _1467 = float(_1273);
    float _1469 = _1411 * _1461;
    int _1471 = ~_1172;
    int _1473 = _1471 + 1;
    bool _1475 = _1467 >= _1461;
    bool _1477 = isnan(_1467);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan(_1461);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    int _1487 = _1441 * _1453;
    int _1489 = _1487 + _1465;
    float _1491 = -_1455;
    float _1493 = _1445 + _1491;
    float _1495 = trunc(_1469);
    int _1497 = int(_1495);
    float _1499 = -_181;
    float _1501 = _791 ? _1499 : _181;
    int _1503 = _1395 * _1459;
    int _1505 = _1503 + _1489;
    float _1507 = _1493 * _1461;
    int _1509 = _1473 * _1457;
    int _1511 = _1509 + _1273;
    int _1513 = abs(_523);
    float _1515 = float(uint(_1505));
    float _1517 = trunc(_1485);
    int _1519 = int(_1517);
    bool _1521 = uint(_1511) >= uint(_1172);
    int _1523 = ~_1150;
    int _1525 = _1523 + 1;
    float _1527 = as_type<float>(_1224) * _1515;
    bool _1529 = !_1521;
    int _1531 = _1529 ? 0 : (-1);
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1535 = _1533 != 0;
    float _1537 = trunc(_1507);
    int _1539 = int(_1537);
    int _1541 = ~_1457;
    int _1543 = _1541 + _1531;
    int _1545 = _1543 + 1;
    bool _1547 = !_1535;
    int _1549 = _1547 ? 0 : 1;
    bool _1551 = _1172 == 0;
    int _1553 = abs(_1549);
    float _1555 = trunc(_1527);
    float _1557 = precise::max(_1555, 0.0);
    uint _1559 = uint(_1557);
    int _1561 = _1172 * _1545;
    int _1563 = _1561 + _1273;
    int _1565 = ~_1519;
    int _1567 = _1565 + 1;
    int _1569 = _1567 + 1;
    int _1571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1573 = _1571 != 0;
    bool _1575 = !_1551;
    int _1577 = _1575 ? _1563 : (-1);
    int _1579 = _1539 * _1553;
    int _1581 = _1579 + _1273;
    int _1583 = _1172 + (-1);
    int _1585 = _1577 * _1569;
    float _1587 = -_177;
    int _1589 = _559 ? as_type<int>(_1587) : as_type<int>(_177);
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1593 = _1591 != 0;
    int _1595 = _1519 * _1583;
    int _1597 = _1595 + _1585;
    int _1599 = abs(_543);
    int _1601 = _1525 * int(_1559);
    int _1603 = _1601 + _1505;
    int _1605 = abs(_535);
    float _1607 = float(uint(_1603));
    int _1609 = _1597 * _1513;
    int _1611 = abs(_551);
    int _1613 = _1497 * _1605;
    int _1615 = _1613 + _1609;
    float _1617 = as_type<float>(_1224) * _1607;
    int _1619 = _1581 * _1599;
    int _1621 = _1619 + _1615;
    float _1623 = trunc(_1617);
    float _1625 = precise::max(_1623, 0.0);
    uint _1627 = uint(_1625);
    int _1629 = ~_1150;
    int _1631 = _1629 + 1;
    int _1633 = _1539 * _1611;
    int _1635 = _1633 + _1621;
    int _1637 = ~_1150;
    int _1639 = _1637 + 1;
    bool _1641 = !_1573;
    float _1643 = _1641 ? _181 : _1501;
    float _1645 = float(uint(_1635));
    int _1647 = ~_1172;
    int _1649 = _1647 + 1;
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1653 = _1651 != 0;
    float _1655 = as_type<float>(_1269) * _1645;
    float _1657 = -_1103;
    float _1659 = _1657 + 1.0;
    int _1661 = int(_1559) + int(_1627);
    float _1663 = trunc(_1655);
    float _1665 = precise::max(_1663, 0.0);
    uint _1667 = uint(_1665);
    float _1669 = float(uint(_1441));
    int _1671 = _1631 * _1661;
    int _1673 = _1671 + _1505;
    float _1675 = as_type<float>(_1224) * _1669;
    bool _1677 = uint(_1673) >= uint(_1150);
    float _1679 = trunc(_1675);
    float _1681 = precise::max(_1679, 0.0);
    uint _1683 = uint(_1681);
    bool _1685 = !_1677;
    int _1687 = _1685 ? 0 : (-1);
    int _1689 = _1649 * int(_1667);
    int _1691 = _1689 + _1635;
    bool _1693 = _485 > 0.5;
    int _1695 = ~_1661;
    int _1697 = _1695 + _1687;
    int _1699 = _1697 + 1;
    float _1701 = float(uint(_1691));
    float _1703 = -_181;
    int _1705 = _1693 ? as_type<int>(_1703) : as_type<int>(_181);
    int _1707 = _1150 * _1699;
    int _1709 = _1707 + _1505;
    float _1711 = float(uint(_1581));
    float _1713 = as_type<float>(_1269) * _1701;
    int _1715 = ~_1150;
    int _1717 = _1715 + 1;
    bool _1719 = !_1198;
    int _1721 = _1719 ? _1709 : (-1);
    int _1723 = _1639 * int(_1683);
    int _1725 = _1723 + _1441;
    float _1727 = as_type<float>(_1269) * _1711;
    float _1729 = trunc(_1713);
    float _1731 = precise::max(_1729, 0.0);
    uint _1733 = uint(_1731);
    int _1735 = _1721 & 3;
    bool _1737 = _1735 != 0;
    int _1739 = _1721 & 3;
    bool _1741 = _1739 != 0;
    int _1743 = _1737 ? 0 : 1;
    bool _1745 = uint(_1739) > 1u;
    float _1747 = trunc(_1727);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    float _1753 = float(uint(_1725));
    int _1755 = ~_1172;
    int _1757 = _1755 + 1;
    float _1759 = as_type<float>(_1224) * _1753;
    int _1761 = ~_1743;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    int _1767 = int(_1667) + int(_1733);
    float _1769 = trunc(_1759);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    int _1775 = ~_1172;
    int _1777 = _1775 + 1;
    int _1779 = _1765;
    float _1781 = _1501;
    float _1783 = as_type<float>(_1459);
    float _1785 = as_type<float>(_1473);
    if (!_1745)
    {
        int _1787 = ~_1743;
        int _1789 = _1787 + 1;
        _1779 = _1789;
    }
    int _1791 = _1779;
    int _1793 = _1757 * _1767;
    int _1795 = _1793 + _1635;
    bool _1797 = uint(_1739) >= 2u;
    int _1799 = _1777 * int(_1751);
    int _1801 = _1799 + _1581;
    int _1803 = _1797 ? 0 : 1;
    bool _1805 = uint(_1795) >= uint(_1172);
    float _1807 = float(uint(_1801));
    bool _1809 = !_1805;
    int _1811 = _1809 ? 0 : (-1);
    bool _1813 = _1739 != 3;
    float _1815 = as_type<float>(_1269) * _1807;
    int _1817 = ~_1767;
    int _1819 = _1817 + _1811;
    int _1821 = _1819 + 1;
    int _1823 = int(_1683) + int(_1773);
    int _1825 = _1172 * _1821;
    int _1827 = _1825 + _1635;
    int _1829 = ~_1803;
    int _1831 = _1829 + 1;
    int _1833 = _1831 + 1;
    float _1835 = trunc(_1815);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    int _1841 = ~_1172;
    int _1843 = _1841 + 1;
    int _1845 = _1717 * _1823;
    int _1847 = _1845 + _1441;
    bool _1849 = !_1551;
    int _1851 = _1849 ? _1827 : (-1);
    int _1853 = _1833;
    int _1855 = _1717;
    if (_1813)
    {
        int _1857 = ~_1803;
        int _1859 = _1857 + 1;
        _1853 = _1859;
    }
    int _1861 = _1853;
    bool _1863 = uint(_1847) >= uint(_1150);
    if (_1210)
    {
        _1855 = 0;
    }
    int _1865 = _1855;
    bool _1867 = !_1863;
    int _1869 = _1867 ? 0 : (-1);
    int _1871 = _1865;
    if (!_1210)
    {
        _1871 = 1;
    }
    int _1873 = _1871;
    int _1875 = _1851 & 3;
    bool _1877 = _1875 != 0;
    int _1879 = _1851 & 3;
    bool _1881 = _1879 != 0;
    int _1883 = _1877 ? 0 : 1;
    bool _1885 = uint(_1879) > 1u;
    int _1887 = int(_1751) + int(_1839);
    int _1889 = ~_1883;
    int _1891 = _1889 + 1;
    int _1893 = _1891 + 1;
    int _1895 = abs(_1861);
    int _1897 = _1843 * _1887;
    int _1899 = _1897 + _1581;
    int _1901 = _1893;
    if (!_1885)
    {
        int _1903 = ~_1883;
        int _1905 = _1903 + 1;
        _1901 = _1905;
    }
    int _1907 = _1901;
    bool _1909 = uint(_1899) >= uint(_1172);
    bool _1911 = !_1909;
    int _1913 = _1911 ? 0 : (-1);
    bool _1915 = _479 > 0.5;
    float _1917 = -_177;
    int _1919 = _1915 ? as_type<int>(_1917) : as_type<int>(_177);
    int _1921 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1923 = _1921 != 0;
    float _1925 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1927 = !_1923;
    float _1929 = _1927 ? _177 : as_type<float>(_1919);
    float _1931 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1925);
    bool _1933 = _1873 != 1;
    float _1935 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1931);
    int _1937 = ~_1887;
    int _1939 = _1937 + _1913;
    int _1941 = _1939 + 1;
    bool _1943 = !_1881;
    int _1945 = _1943 ? 0 : 1;
    out.m_68.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_68.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_68.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _1947 = _1739 != 3;
    int _1949 = _1172 * _1941;
    int _1951 = _1949 + _1581;
    if (!_1933)
    {
        _1781 = _481;
    }
    float _1953 = _1781;
    float _1955 = _1953;
    if (!_1933)
    {
        _1783 = _481;
    }
    float _1957 = _1783;
    float _1959 = _1957;
    if (!_1933)
    {
        _1785 = _483;
    }
    float _1961 = _1785;
    float _1963 = _1961;
    if (!_1933)
    {
        _1435 = _483;
    }
    float _1965 = _1435;
    float _1967 = _479 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1969 = _1965;
    if (_1933)
    {
        _1955 = _479;
    }
    float _1971 = _1955;
    float _1973 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1933)
    {
        _1959 = _479;
    }
    float _1975 = _1959;
    float _1977 = -_1144;
    float _1979 = fma(_1967, 2.0, _1977);
    if (_1933)
    {
        _1963 = _481;
    }
    float _1981 = _1963;
    float _1983 = _481 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1933)
    {
        _1969 = _481;
    }
    float _1985 = _1969;
    float _1987 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1991 = _1989 != 0;
    float _1993 = fma(_1983, -2.0, _1156);
    int _1995 = _1721 >> 31;
    float _1997 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1999 = !_1991;
    float _2001 = _1999 ? _177 : as_type<float>(_1589);
    float _2003 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2007 = _2005 != 0;
    float _2009 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2011 = _1995 & 3;
    float _2013 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1146);
    int _2015 = _1851 >> 31;
    float _2017 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1987);
    int _2019 = _1721 + _2011;
    float _2021 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1973);
    float _2023 = _697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2025 = _2015 & 3;
    float _2027 = -_143;
    float _2029 = fma(_2027, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1979);
    int _2031 = _2019 >> 2;
    float _2033 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2023);
    int _2035 = _1851 + _2025;
    float _2037 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1993);
    int _2039 = _2031 << 4;
    int _2041 = _2039 + 368;
    float _2043 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2033);
    float _2045 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    uint _2047 = uint(int(uint(_2041) >> uint(2)));
    uint _2049 = uint(int(uint(int(_2047)) >> uint(2)));
    int _2051 = int(_2047) & 3;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[int(_2049)][_2051];
    int _2055 = int(_2047) + 1;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    int _2059 = _2055 & 3;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[int(_2057)][_2059];
    float _2063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2065 = _2035 >> 2;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2069 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2073 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2075 = _2065 << 4;
    int _2077 = _2075 + 512;
    float _2079 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    uint _2087 = uint(int(uint(_2077) >> uint(2)));
    uint _2089 = uint(int(uint(int(_2087)) >> uint(2)));
    int _2091 = int(_2087) & 3;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[int(_2089)][_2091];
    int _2095 = int(_2087) + 1;
    uint _2097 = uint(int(uint(_2095) >> uint(2)));
    int _2099 = _2095 & 3;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[int(_2097)][_2099];
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2107 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2109 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2111 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_70.x = _2071;
    out.m_70.y = _2073;
    out.m_70.z = _2079;
    bool _2113 = !_2007;
    float _2115 = _2113 ? _181 : as_type<float>(_1705);
    float _2117 = 1.0 / _2111;
    out.m_72.x = _2105;
    out.m_72.y = _2107;
    out.m_72.z = _2109;
    out.m_72.w = _2103;
    int _2119 = ~_1823;
    int _2121 = _2119 + _1869;
    int _2123 = _2121 + 1;
    float _2125 = _1180 + _2111;
    int _2127 = _2041 + 8;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    uint _2131 = uint(int(uint(int(_2129)) >> uint(2)));
    int _2133 = int(_2129) & 3;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[int(_2131)][_2133];
    int _2137 = int(_2129) + 1;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    int _2141 = _2137 & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    float _2145 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2147 = _1243 * _2145;
    bool _2149 = uint(_1879) >= 2u;
    int _2151 = _1150 * _2123;
    int _2153 = _2151 + _1441;
    bool _2155 = !_1741;
    int _2157 = _2155 ? 0 : 1;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2161 = _1243 * _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2165 = _1243 * _2163;
    bool _2167 = _1879 != 3;
    float _2169 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2171 = int(_2169);
    int _2173 = abs(_2157);
    float _2175 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2161);
    float _2177 = _2125 * _2117;
    float _2179 = _2177 * 0.5;
    int _2181 = _2077 + 8;
    uint _2183 = uint(int(uint(_2181) >> uint(2)));
    uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
    int _2187 = int(_2183) & 3;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[int(_2185)][_2187];
    int _2191 = int(_2183) + 1;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    int _2195 = _2191 & 3;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[int(_2193)][_2195];
    int _2199 = abs(_1791);
    float _2201 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2147);
    float _2203 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2165);
    int _2205 = abs(_1907);
    float _2207 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2209 = int(_2207);
    out.m_74.x = _2201;
    out.m_74.y = _2175;
    out.m_74.z = _2203;
    int _2211 = _2149 ? 0 : 1;
    int _2213 = ~_2199;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    int _2219 = ~_2205;
    int _2221 = _2219 + 1;
    int _2223 = _2221 + 1;
    int _2225 = _2217 * as_type<int>(_2061);
    bool _2227 = !_1551;
    int _2229 = _2227 ? _1951 : (-1);
    float _2231 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2233 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2231);
    int _2235 = ~_2211;
    int _2237 = _2235 + 1;
    int _2239 = _2237 + 1;
    int _2241 = _2223 * as_type<int>(_2101);
    int _2243 = ~_2173;
    int _2245 = _2243 + 1;
    int _2247 = _2245 + 1;
    float _2249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2251 = _2239;
    if (_2167)
    {
        int _2253 = ~_2211;
        int _2255 = _2253 + 1;
        _2251 = _2255;
    }
    int _2257 = _2251;
    float _2259 = _2017 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    int _2261 = abs(_1945);
    int _2263 = _2247 * as_type<int>(_2053);
    int _2265 = _2263 + _2225;
    bool _2267 = !_1947;
    int _2269 = _2267 ? 0 : (-1);
    int _2271 = abs(_2257);
    float _2273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2275 = abs(_2269);
    int _2277 = ~_2261;
    int _2279 = _2277 + 1;
    int _2281 = _2279 + 1;
    bool _2283 = _1879 != 3;
    int _2285 = _2281 * as_type<int>(_2093);
    int _2287 = _2285 + _2241;
    int _2289 = ~_2271;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = ~_1895;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = ~_2275;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    int _2307 = _2293 * as_type<int>(_2189);
    int _2309 = _2307 + _2287;
    bool _2311 = !_1653;
    int _2313 = _2311 ? 0 : 1;
    int _2315 = _2299 * as_type<int>(_2135);
    int _2317 = _2315 + _2265;
    float _2319 = float(uint(_2209));
    float _2321 = 1.0 / _2233;
    float _2323 = float(uint(_2171));
    int _2325 = _2305 * as_type<int>(_2143);
    int _2327 = _2325 + _2317;
    bool _2329 = !_2283;
    int _2331 = _2329 ? 0 : (-1);
    float _2333 = _1176 * _2273;
    int _2335 = abs(_2313);
    int _2337 = abs(_2171);
    float _2339 = 1.0 / _2319;
    bool _2341 = !_1198;
    int _2343 = _2341 ? _2153 : (-1);
    int _2345 = abs(_2209);
    float _2347 = float(uint(_2345));
    float _2349 = 1.0 / _2323;
    int _2351 = abs(_2331);
    bool _2353 = !_1593;
    int _2355 = _2353 ? 0 : 1;
    int _2357 = ~_2351;
    int _2359 = _2357 + 1;
    int _2361 = _2359 + 1;
    int _2363 = abs(_2355);
    float _2365 = 1.0 / _2347;
    int _2367 = _2361 * as_type<int>(_2197);
    int _2369 = _2367 + _2309;
    int _2371 = ~_2335;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    int _2377 = ~_2363;
    int _2379 = _2377 + 1;
    int _2381 = _2379 + 1;
    float _2383 = float(uint(_2337));
    int _2385 = _2327 * _2375;
    int _2387 = ~_2171;
    int _2389 = _2387 + 1;
    int _2391 = _2369 * _2381;
    float _2393 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2395 = _2321 * _2393;
    int _2397 = _2343 * _2335;
    int _2399 = _2397 + _2385;
    int _2401 = _2229 * _2363;
    int _2403 = _2401 + _2391;
    int _2405 = as_type<int>(_2339) + (-2);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2409 = float(uint(_2399));
    float _2411 = abs(_2395);
    float _2413 = log2(_2411);
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2417 = float(uint(_2403));
    float _2419 = as_type<float>(_2405) * _2409;
    int _2421 = as_type<int>(_2349) + (-2);
    float _2423 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2415);
    int _2425 = abs(_2399);
    float _2427 = 1.0 / _2383;
    int _2429 = ~_2209;
    int _2431 = _2429 + 1;
    float _2433 = trunc(_2419);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2441 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2407);
    float _2443 = as_type<float>(_2421) * _2417;
    int _2445 = ~_2209;
    int _2447 = _2445 + 1;
    float _2449 = _2439 * _2249;
    float _2451 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2453 = trunc(_2443);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    int _2459 = as_type<int>(_2365) + (-2);
    out.m_76.x = _2449;
    out.m_76.y = _2333;
    float _2461 = float(uint(_2425));
    int _2463 = abs(_2403);
    int _2465 = as_type<int>(_2427) + (-2);
    float _2467 = as_type<float>(_2459) * _2461;
    float _2469 = float(uint(_2463));
    int _2471 = _2447 * int(_2437);
    int _2473 = _2471 + _2399;
    float _2475 = exp2(_2451);
    float _2477 = float(uint(_2473));
    int _2479 = _2389 * int(_2457);
    int _2481 = _2479 + _2403;
    float _2483 = as_type<float>(_2465) * _2469;
    float _2485 = trunc(_2467);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = as_type<float>(_2405) * _2477;
    float _2493 = float(uint(_2481));
    float _2495 = as_type<float>(_2421) * _2493;
    float _2497 = trunc(_2483);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    int _2503 = ~_2345;
    int _2505 = _2503 + 1;
    float _2507 = fma(_2475, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2509 = precise::clamp(_2507, 0.0, 1.0);
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2513 = ~_2337;
    int _2515 = _2513 + 1;
    float _2517 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2519 = trunc(_2491);
    float _2521 = precise::max(_2519, 0.0);
    uint _2523 = uint(_2521);
    int _2525 = _2505 * int(_2489);
    int _2527 = _2525 + _2425;
    float _2529 = -_2511;
    float _2531 = fma(_1997, 2.0, _2529);
    float _2533 = fma(_2509, -2.0, 3.0);
    float _2535 = _2509 * _2509;
    float _2537 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2441);
    float _2539 = float(uint(_2527));
    int _2541 = _2515 * int(_2501);
    int _2543 = _2541 + _2463;
    float _2545 = fma(_2009, -2.0, _2517);
    float _2547 = trunc(_2495);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    float _2553 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2423);
    float _2555 = as_type<float>(_2459) * _2539;
    float _2557 = float(uint(_2543));
    float _2559 = -_143;
    float _2561 = fma(_2559, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2531);
    float _2563 = _2535 * _2533;
    float _2565 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2545);
    int _2567 = int(_2437) + int(_2523);
    float _2569 = as_type<float>(_2465) * _2557;
    float _2571 = -_2563;
    float _2573 = _2571 + 1.0;
    float _2575 = trunc(_2555);
    float _2577 = precise::max(_2575, 0.0);
    uint _2579 = uint(_2577);
    int _2581 = ~_2345;
    int _2583 = _2581 + 1;
    int _2585 = _2431 * _2567;
    int _2587 = _2585 + _2399;
    float _2589 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2563);
    int _2591 = ~_2171;
    int _2593 = _2591 + 1;
    float _2595 = -_1935;
    float _2597 = _2595 + 1.0;
    int _2599 = int(_2457) + int(_2551);
    float _2601 = -_2537;
    float _2603 = _2601 + 1.0;
    float _2605 = trunc(_2569);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    float _2611 = -_2553;
    float _2613 = _2611 + 1.0;
    int _2615 = ~_2337;
    int _2617 = _2615 + 1;
    bool _2619 = uint(_2587) >= uint(_2209);
    int _2621 = int(_2489) + int(_2579);
    float _2623 = -_1178;
    float _2625 = _2623 + 1.0;
    bool _2627 = !_2619;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = _2209 == 0;
    int _2633 = _2583 * _2621;
    int _2635 = _2633 + _2425;
    int _2637 = int(_2501) + int(_2609);
    int _2639 = _2593 * _2599;
    int _2641 = _2639 + _2403;
    int _2643 = ~_2567;
    int _2645 = _2643 + _2629;
    int _2647 = _2645 + 1;
    float _2649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2651 = uint(_2635) >= uint(_2345);
    int _2653 = _2617 * _2637;
    int _2655 = _2653 + _2463;
    bool _2657 = uint(_2641) >= uint(_2171);
    int _2659 = _2209 * _2647;
    int _2661 = _2659 + _2399;
    int _2663 = _2399 ^ _2209;
    float _2665 = _1069 + _1027;
    bool _2667 = !_2657;
    int _2669 = _2667 ? 0 : (-1);
    float _2671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2673 = _2209 == 0;
    float _2675 = _2665 * 0.5;
    bool _2677 = uint(_2655) >= uint(_2337);
    int _2679 = _2403 ^ _2171;
    bool _2681 = !_2651;
    int _2683 = _2681 ? 0 : (-1);
    float _2685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2687 = uint(int(uint(_2663) >> uint(31)));
    bool _2689 = !_2677;
    int _2691 = _2689 ? 0 : (-1);
    uint _2693 = uint(int(uint(_2679) >> uint(31)));
    int _2695 = ~_2683;
    int _2697 = _2621 + _2695;
    int _2699 = _2697 + 1;
    int _2701 = ~int(_2687);
    int _2703 = _2701 + 1;
    float _2705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2707 = ~_2691;
    int _2709 = _2637 + _2707;
    int _2711 = _2709 + 1;
    int _2713 = ~int(_2693);
    int _2715 = _2713 + 1;
    int _2717 = ~_2599;
    int _2719 = _2717 + _2669;
    int _2721 = _2719 + 1;
    float _2723 = _2685 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2725 = _2699 ^ _2703;
    int _2727 = _2711 ^ _2715;
    int _2729 = _2171 * _2721;
    int _2731 = _2729 + _2403;
    bool _2733 = _2171 == 0;
    float _2735 = _2671 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2737 = _2171 == 0;
    int _2739 = ~_2703;
    int _2741 = _2739 + _2725;
    int _2743 = _2741 + 1;
    int _2745 = ~_2715;
    int _2747 = _2745 + _2727;
    int _2749 = _2747 + 1;
    float _2751 = _2649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2753 = !_2631;
    int _2755 = _2753 ? _2661 : (-1);
    bool _2757 = !_2733;
    int _2759 = _2757 ? _2731 : (-1);
    bool _2761 = !_2673;
    int _2763 = _2761 ? _2743 : (-1);
    float _2765 = _2115 + (-0.5);
    float _2767 = float(_2759);
    float _2769 = float(_2763);
    float _2771 = float(_2755);
    float _2773 = fma(_2723, _2767, _2561);
    float _2775 = _1643 + (-0.5);
    float _2777 = -_2037;
    float _2779 = fma(_2735, _2769, _2777);
    float _2781 = _1929 + 0.5;
    float _2783 = fma(_2751, _2771, _2029);
    bool _2785 = !_2737;
    int _2787 = _2785 ? _2749 : (-1);
    float _2789 = -_2735;
    float _2791 = fma(_2789, _2775, _2779);
    float _2793 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2795 = fma(_2751, _2781, _2783);
    float _2797 = float(_2787);
    float _2799 = in.m_78.x;
    float _2801 = fma(_1643, _2625, _2791);
    bool _2803 = _2395 <= 8000.0;
    bool _2805 = isnan(_2395);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan(8000.0);
    bool _2811 = _2807 || _2809;
    float _2813 = float(_2811);
    float _2815 = _2705 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2817 = -_2597;
    float _2819 = fma(_1929, _2817, _2795);
    float _2821 = _1027 * 0.5;
    out.m_80.x = _2045;
    out.m_80.y = _2259;
    out.m_80.z = _2793;
    float _2823 = _2813 * _2589;
    float _2825 = -_2565;
    float _2827 = fma(_2815, _2797, _2825);
    float _2829 = _2001 + 0.5;
    float _2831 = _2823 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2833 = -_2815;
    float _2835 = fma(_2833, _2765, _2827);
    float _2837 = fma(_2723, _2829, _2773);
    float _2839 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1204);
    float _2841 = _1659 * _2831;
    float _2843 = precise::clamp(_2841, 0.0, 1.0);
    float _2845 = fma(_2115, _2613, _2835);
    float _2847 = -_2603;
    float _2849 = fma(_2001, _2847, _2837);
    float _2851 = fma(_1083, -0.5, _2821);
    float _2853 = _1299 * _1105;
    float _2855 = -_2843;
    float _2857 = fma(_2855, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2859 = _2839 + _1027;
    float _2861 = -_1299;
    float _2863 = _2861 + 1.0;
    float _2865 = _1116 * _2853;
    float _2867 = _2857 * _2799;
    float _2869 = _1134 * _2853;
    out.gl_Position.x = _1069;
    out.gl_Position.y = _1083;
    out.gl_Position.z = _2839;
    out.gl_Position.w = _1027;
    float _2871 = _2859 * 0.5;
    float _2873 = fma(_1130, _2865, _1110);
    float _2875 = fma(_1132, _2865, _1112);
    float _2877 = _1116 * _2863;
    float _2879 = fma(_1116, _2869, _1114);
    out.m_82.x = _2675;
    out.m_82.y = _2851;
    out.m_82.z = _2871;
    out.m_82.w = _1027;
    bool _2881 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2883 = isnan(_951);
    bool _2885 = _2881 || _2883;
    bool _2887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2889 = _2885 || _2887;
    out.m_84.x = _2819;
    out.m_84.y = _2801;
    out.m_84.z = _2849;
    out.m_84.w = _2845;
    float _2891 = _2867 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _2873;
    out.m_86.y = _2875;
    out.m_86.z = _2879;
    out.m_86.w = _2877;
    out.m_88.x = _2891;
    float _2893 = _2865;
    float _2895 = _2867;
    float _2897 = _2799;
    float _2899 = _2853;
    if (!_2889)
    {
        _1255 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2901 = _1255;
    float _2903 = _2901;
    float _2905 = _2901;
    if (!_2889)
    {
        _1257 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2907 = _1257;
    float _2909 = _2907;
    float _2911 = _2907;
    if (!_2889)
    {
        _2893 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2913 = _2893;
    float _2915 = _2913;
    float _2917 = _2913;
    if (!_2889)
    {
        _2895 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2919 = _2895;
    float _2921 = _2919;
    float _2923 = _2919;
    if (!_2889)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2925 = _2897;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2889)
    {
        _2899 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2931 = _2899;
    bool _2933 = !_2889;
    float _2935 = _2931;
    float _2937 = _2931;
    if (!_2933)
    {
        bool _2939 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2941 = isnan(_951);
        bool _2943 = _2939 || _2941;
        bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2947 = _2943 || _2945;
        if (!_2947)
        {
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2951 = _951 + _2949;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2953;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2961 = 1.0 / _2955;
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2979 = _2951 * _2961;
            float _2981 = precise::clamp(_2979, 0.0, 1.0);
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2987 = fma(_2981, _2959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2989 = fma(_2981, _2985, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2991 = fma(_2981, _2965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2993 = fma(_2981, _2969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2995 = fma(_2981, _2973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2997 = fma(_2981, _2977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2911 = _2991;
            _2929 = _2995;
            _2905 = _2987;
            _2923 = _2993;
            _2917 = _2989;
            _2937 = _2997;
            _2999 = true;
        }
        else
        {
            bool _3001 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3003 = isnan(_951);
            bool _3005 = _3001 || _3003;
            bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3009 = _3005 || _3007;
            if (!_3009)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3011 = _2903;
            _2905 = _3011;
            if (!_3009)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3013 = _2909;
            _2911 = _3013;
            if (!_3009)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3015 = _2915;
            _2917 = _3015;
            if (!_3009)
            {
                _2921 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3017 = _2921;
            _2923 = _3017;
            if (!_3009)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3009)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3021 = _2935;
            bool _3023 = !_3009;
            _2937 = _3021;
            if (!_3023)
            {
                bool _3025 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3027 = isnan(_951);
                bool _3029 = _3025 || _3027;
                bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3033 = _3029 || _3031;
                if (!_3033)
                {
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3037 = _951 + _3035;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3039;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3047 = 1.0 / _3041;
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3065 = _3037 * _3047;
                    float _3067 = precise::clamp(_3065, 0.0, 1.0);
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3073 = fma(_3067, _3045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3075 = fma(_3067, _3071, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3077 = fma(_3067, _3051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3079 = fma(_3067, _3055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3081 = fma(_3067, _3059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3083 = fma(_3067, _3063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2911 = _3077;
                    _2929 = _3081;
                    _2905 = _3073;
                    _2923 = _3079;
                    _2917 = _3075;
                    _2937 = _3083;
                    _2999 = true;
                }
                else
                {
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2923 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2999 = false;
    float _3085 = _2911;
    float _3087 = _2929;
    float _3089 = _2905;
    float _3091 = _2923;
    float _3093 = _2917;
    float _3095 = _2937;
    float _3097 = fma(_2259, -0.5, 0.5);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -_3085;
    float _3103 = _3101 + _3087;
    float _3105 = -_3089;
    float _3107 = _3105 + _3091;
    float _3109 = -_3093;
    float _3111 = _3109 + _3095;
    bool _3113 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3115 = fma(_3099, _3103, _3085);
    float _3117 = fma(_3099, _3107, _3089);
    float _3119 = fma(_3099, _3111, _3093);
    float _3121 = _3115 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _3123 = fma(_3117, 0.298911988735198974609375, _3121);
    float _3125 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = 1.0;
    float _3127 = fma(_3119, 0.114477999508380889892578125, _3123);
    float _3129 = -_3127;
    float _3131 = _3117 + _3129;
    float _3133 = -_3127;
    float _3135 = _3115 + _3133;
    float _3137 = -_3127;
    float _3139 = _3119 + _3137;
    out.m_88.w = _3125;
    float _3141 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3143 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3145 = fma(_3139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    out.m_60.x = _3141;
    out.m_60.y = _3143;
    out.m_60.z = _3145;
    if (!_3113)
    {
        return out;
    }
    float _3147 = -_771;
    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3151 = -_773;
    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3155 = -_775;
    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3159 = _3149 * _3149;
    float _3161 = fma(_3153, _3153, _3159);
    float _3163 = fma(_3157, _3157, _3161);
    float _3165 = sqrt(_3163);
    float _3167 = rsqrt(_3163);
    float _3169 = -_3165;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = _3153 * _3167;
    float _3179 = _3149 * _3167;
    float _3181 = abs(_3175);
    float _3183 = log2(_3181);
    float _3185 = _3157 * _3167;
    float _3187 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3189 = _2259 * _3179;
    float _3191 = -_3179;
    float _3193 = -_3187;
    float _3195 = fma(_3191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3193);
    float _3197 = fma(_2045, _3177, _3189);
    float _3199 = -_3185;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3195);
    float _3203 = fma(_2793, _3185, _3197);
    float _3205 = precise::clamp(_3203, 0.0, 1.0);
    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3209 = _3201 + _3207;
    float _3211 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3213 = _3209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3215 = precise::clamp(_3213, 0.0, 1.0);
    float _3217 = exp2(_3211);
    float _3219 = _3217 * _3215;
    float _3221 = _3205 * _3219;
    float _3223 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3225 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3227 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3223;
    out.m_90.y = _3225;
    out.m_90.z = _3227;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2999 = false;
    bool _203 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_46.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_49.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3284 = as_type<float>(_125);
        out.gl_Position.z = _3284;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_51.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_139)
    {
        float _145 = float(_109);
        _119 = _145;
    }
    float _147 = _119;
    bool _149 = _143 >= _147;
    bool _151 = !_139;
    bool _153 = _149 || _151;
    float _155 = _147;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _155;
    if (_153)
    {
        out.m_49.x = 0.0;
    }
    if (_153)
    {
        float _159 = _157 * 5.0;
        _127 = as_type<int>(_159);
    }
    int _161 = _127;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3353 = as_type<float>(_161);
        out.gl_Position.z = _3353;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _167 = as_type<int>(_163) & 1;
    bool _169 = _167 != 0;
    int _171 = as_type<int>(_163) & 2;
    bool _173 = _171 != 0;
    bool _175 = !_169;
    float _177 = _175 ? (-0.5) : 0.5;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_165;
    float _201;
    if (!_183)
    {
        float _185 = in.m_56.x;
        float _187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _189 = _185 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _193 = _191 * _187;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = true;
    }
    else
    {
        float _205 = float(_109);
        float _207 = 1.0 / _205;
        float _209 = _143 * _207;
        _201 = _209;
    }
    _203 = false;
    float _211 = _201;
    float _213 = in.m_46.x;
    float _215 = in.m_46.y;
    float _217 = in.m_46.z;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _211 + _219;
    bool _223 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _225 = isnan(_211);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = 1.0 / _237;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _247 = _245 != 0;
    int _249 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _251 = _249 != 0;
    int _253 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _255 = _253 != 0;
    bool _257 = !_247;
    int _259 = _257 ? 0 : 1;
    float _261 = 1.0 / _241;
    bool _263 = !_255;
    int _265 = _263 ? 0 : 1;
    bool _267 = !_251;
    int _269 = _267 ? 0 : 1;
    float _271 = _215 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _273 = _215 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _275 = _215 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _279 = _211 + _277;
    float _281 = fma(_213, (*spvDescriptorSet0.vp_c10)._m0[5].x, _271);
    float _283 = fma(_213, (*spvDescriptorSet0.vp_c10)._m0[4].x, _273);
    float _285 = _221 * _243;
    float _287 = fma(_213, (*spvDescriptorSet0.vp_c10)._m0[6].x, _275);
    float _289 = fma(_217, (*spvDescriptorSet0.vp_c10)._m0[5].z, _281);
    float _291 = fma(_217, (*spvDescriptorSet0.vp_c10)._m0[4].z, _283);
    bool _293 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _295 = isnan(_211);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _279 * _261;
    bool _307 = _211 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _309 = isnan(_211);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = _289 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _321 = fma(_217, (*spvDescriptorSet0.vp_c10)._m0[6].z, _287);
    float _323 = in.m_58.x;
    float _325 = in.m_58.y;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _329 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _327;
    float _331 = -_317;
    float _333 = _331 + 1.0;
    float _335 = _291 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _339 = _319 + _337;
    float _341 = fma(_329, _285, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _343 = _303 * _333;
    float _345 = _321 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _349 = _335 + _347;
    float _351 = _339 * _339;
    float _353 = -_303;
    float _355 = _353 + 1.0;
    float _357 = -_233;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _363 = _361 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _365 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _367 = _345 + _365;
    float _369 = fma(_349, _349, _351);
    float _371 = _341 * _343;
    float _373 = _317 * _359;
    float _375 = fma(_363, _305, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _377 = fma(_367, _367, _369);
    float _379 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = sqrt(_377);
    float _383 = fma(_375, _373, _379);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[145].x, _383);
    float _391 = fma(_387, _285, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _393 = rsqrt(_377);
    float _395 = _389 * _323;
    float _397 = _391 * _343;
    float _399 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _401 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _397);
    float _403 = _381 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _405 = _399 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _407 = precise::min(_405, _403);
    float _409 = _393 * _407;
    float _411 = _339 * _409;
    float _413 = _349 * _409;
    float _415 = -_411;
    float _417 = _339 + _415;
    float _419 = _367 * _409;
    float _421 = -_413;
    float _423 = _349 + _421;
    float _425 = _417 * _417;
    float _427 = -_419;
    float _429 = _367 + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = fma(_423, _423, _425);
    float _437 = fma(_433, _305, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = fma(_429, _429, _435);
    float _441 = fma(_437, _373, _401);
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _181);
    float _445 = sqrt(_439);
    float _447 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _177);
    float _449 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[145].y, _441);
    float _451 = _449 * _325;
    float _453 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _455 = _393 * _445;
    float _457 = _453 * _455;
    float _459 = _399 * _455;
    float _461 = _455 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _463 = _461 * 0.5;
    float _465 = _457 * _443;
    float _467 = _459 * _447;
    float _469 = _465 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _471 = _465 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _473 = _465 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _475 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[26].x, _469);
    float _477 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[24].x, _471);
    float _479 = in.m_56.x;
    float _481 = in.m_56.y;
    float _483 = in.m_56.z;
    float _485 = in.m_56.w;
    float _487 = fma(_467, (*spvDescriptorSet0.vp_c8)._m0[25].x, _473);
    float _489 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[26].z, _475);
    float _491 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[24].z, _477);
    float _493 = fma(_463, (*spvDescriptorSet0.vp_c8)._m0[25].z, _487);
    float _495 = _489 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _497 = _491 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _501 = _499 != 0;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _505 = _503 != 0;
    int _507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _509 = _507 != 0;
    int _511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _513 = _511 != 0;
    float _515 = _493 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _517 = _345 + _495;
    float _519 = _335 + _497;
    bool _521 = !_505;
    int _523 = _521 ? 0 : 1;
    float _525 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _527 = _517 + _525;
    float _529 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _531 = _519 + _529;
    bool _533 = !_501;
    int _535 = _533 ? 0 : 1;
    float _537 = _319 + _515;
    float _539 = _527 * _527;
    bool _541 = !_509;
    int _543 = _541 ? 0 : 1;
    float _545 = -_413;
    float _547 = _335 + _545;
    bool _549 = !_513;
    int _551 = _549 ? 0 : 1;
    float _553 = fma(_531, _531, _539);
    bool _555 = _481 > 0.5;
    float _557 = sqrt(_553);
    bool _559 = _483 > 0.5;
    bool _561 = _481 > 0.5;
    int _563 = int(_561);
    int _565 = _505 ? 2 : 0;
    int _567 = _563 | _565;
    int _569 = _509 ? 4 : 0;
    int _571 = _567 | _569;
    int _573 = _513 ? 8 : 0;
    int _575 = _571 | _573;
    int _577 = _555 ? 16 : 0;
    int _579 = _575 | _577;
    int _581 = _251 ? 32 : 0;
    int _583 = _579 | _581;
    int _585 = _559 ? 64 : 0;
    int _587 = _583 | _585;
    int _589 = _587 & 16;
    float _591 = -_177;
    int _593 = _561 ? as_type<int>(_591) : as_type<int>(_177);
    float _595 = -_181;
    int _597 = _559 ? as_type<int>(_595) : as_type<int>(_181);
    bool _599 = _557 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _603 = _601 != 0;
    int _605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _607 = _605 != 0;
    bool _609 = !_603;
    float _611 = _609 ? _177 : as_type<float>(_593);
    bool _613 = !_607;
    float _615 = _613 ? _181 : as_type<float>(_597);
    float _617 = _495;
    float _619 = _519;
    float _621 = _517;
    float _623 = _411;
    if (!_599)
    {
        _617 = _537;
    }
    float _625 = _617;
    bool _627 = !_599;
    float _629 = _625;
    if (!_627)
    {
        float _631 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _635 = _557 + _633;
        float _637 = rsqrt(_553);
        float _639 = _635 * _631;
        float _641 = _537 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _643 = _639 * 0.15915493667125701904296875;
        float _645 = _643 * 6.283185482025146484375;
        float _647 = sin(_645);
        float _649 = _643 * 6.283185482025146484375;
        float _651 = cos(_649);
        float _653 = fma(_647, _641, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _655 = _637 * _653;
        float _657 = _651 + (-1.0);
        float _659 = fma(_531, _655, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _661 = fma(_527, _655, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _663 = _657 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _665 = fma(_537, _651, _663);
        _619 = _659;
        _621 = _661;
        _629 = _665;
    }
    float _667 = _619;
    float _669 = _621;
    float _671 = _629;
    bool _673 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _675 = isnan(0.5);
    bool _677 = _673 || _675;
    bool _679 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _681 = _677 || _679;
    float _683 = -_413;
    float _685 = _683 + _667;
    float _687 = -_419;
    float _689 = _687 + _669;
    float _691 = -_411;
    float _693 = _691 + _671;
    float _695 = -_411;
    float _697 = _319 + _695;
    float _699 = -_419;
    float _701 = _345 + _699;
    float _703 = _685;
    float _705 = _693;
    float _707 = _689;
    float _709 = _671;
    float _711 = _667;
    if (_681)
    {
        _623 = _685;
    }
    float _713 = _623;
    float _715 = _713;
    if (_681)
    {
        _703 = _689;
    }
    float _717 = _703;
    float _719 = _717;
    if (!_681)
    {
        float _721 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _723 = _697 + _721;
        float _725 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _727 = _547 + _725;
        float _729 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _731 = -_335;
        float _733 = _731 + _667;
        float _735 = _723 * _723;
        float _737 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _739 = _701 + _737;
        float _741 = fma(_727, _727, _735);
        float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _745 = fma(_739, _739, _741);
        float _747 = sqrt(_745);
        float _749 = _729 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _751 = -_319;
        float _753 = _751 + _671;
        float _755 = -_345;
        float _757 = _755 + _669;
        float _759 = precise::min(_747, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _761 = _759 * _743;
        float _763 = _749 * _761;
        float _765 = fma(_733, _763, _547);
        float _767 = fma(_753, _763, _697);
        float _769 = fma(_757, _763, _701);
        _705 = _767;
        _715 = _765;
        _719 = _769;
        _707 = _753;
    }
    float _771 = _705;
    float _773 = _715;
    float _775 = _719;
    float _777 = _707;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _781 = _771 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _785 = _773 + _783;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _789 = _775 + _787;
    bool _791 = _589 != 0;
    float _793 = _781 * _781;
    float _795 = fma(_785, _785, _793);
    float _797 = fma(_789, _789, _795);
    float _799 = rsqrt(_797);
    float _801 = _799 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _803 = _785 * _801;
    float _805 = _789 * _801;
    float _807 = _803 * _803;
    float _809 = _805 * _805;
    float _811 = _807 + _809;
    float _813 = sqrt(_811);
    bool _815 = _813 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _819 = _813 + _817;
    float _821 = _789;
    float _823 = _819;
    float _825 = _777;
    if (_815)
    {
        float _827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _821 = _827;
    }
    float _829 = _821;
    if (_815)
    {
        float _831 = rsqrt(_811);
        _709 = _831;
    }
    float _833 = _709;
    float _835 = _833;
    if (_815)
    {
        float _837 = _819 * _829;
        _823 = _837;
    }
    float _839 = _823;
    float _841 = _771 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_815)
    {
        float _843 = _839 * 0.15915493667125701904296875;
        _711 = _843;
    }
    float _845 = _711;
    float _847 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[3].x, _841);
    float _849 = _799;
    float _851 = _845;
    if (_815)
    {
        float _853 = _845 * 6.283185482025146484375;
        float _855 = sin(_853);
        _849 = _855;
    }
    float _857 = _849;
    float _859 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _861 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[3].z, _847);
    float _863 = precise::max(0.0, _859);
    float _865 = _793;
    float _867 = _863;
    float _869 = _859;
    if (_815)
    {
        float _871 = _845 * 6.283185482025146484375;
        float _873 = cos(_871);
        _865 = _873;
    }
    float _875 = _865;
    float _877 = -_801;
    float _879 = -_863;
    float _881 = fma(_781, _877, _879);
    if (_815)
    {
        float _883 = _881 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _867 = _883;
    }
    float _885 = _867;
    if (!_815)
    {
        _851 = _805;
    }
    float _887 = _851;
    float _889 = fma(_547, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _891 = _857;
    float _893 = _887;
    if (_815)
    {
        float _895 = fma(_857, _885, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _825 = _895;
    }
    float _897 = _825;
    float _899 = _897;
    if (!_815)
    {
        _891 = _807;
    }
    float _901 = _891;
    float _903 = floor(_889);
    float _905 = _901;
    float _907 = _875;
    if (_815)
    {
        float _909 = _875 + (-1.0);
        _869 = _909;
    }
    float _911 = _869;
    float _913 = 0.0;
    float _915 = _911;
    if (_815)
    {
        float _917 = _833 * _897;
        _913 = _917;
    }
    float _919 = _913;
    if (!_815)
    {
        _835 = _803;
    }
    float _921 = _835;
    float _923 = _921;
    if (_815)
    {
        float _925 = _911 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _915 = _925;
    }
    float _927 = _915;
    if (_815)
    {
        float _929 = _803 * _919;
        _923 = _929;
    }
    float _931 = _923;
    if (!_815)
    {
        _899 = _881;
    }
    float _933 = _899;
    float _935 = _933;
    if (_815)
    {
        float _937 = _805 * _919;
        _893 = _937;
    }
    float _939 = _893;
    if (_815)
    {
        float _941 = fma(_881, _875, _927);
        _935 = _941;
    }
    float _943 = _935;
    if (_815)
    {
        float _945 = _931 * _931;
        _905 = _945;
    }
    float _947 = _905;
    if (!_815)
    {
        _907 = _809;
    }
    float _949 = _907;
    float _951 = sqrt(_797);
    float _953 = _949;
    if (_815)
    {
        float _955 = _939 * _939;
        _953 = _955;
    }
    float _957 = _953;
    float _959 = fma(_943, _943, _947);
    float _961 = fma(_701, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _963 = _771 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _965 = _959 + _957;
    float _967 = _771 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _969 = _771 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _971 = rsqrt(_965);
    float _973 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[1].x, _967);
    float _975 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[2].x, _963);
    float _977 = fma(_773, (*spvDescriptorSet0.vp_c8)._m0[0].x, _969);
    float _979 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _981 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[1].z, _973);
    float _983 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _985 = fma(_951, (*spvDescriptorSet0.vp_c15)._m0[23].w, _983);
    float _987 = precise::clamp(_985, 0.0, 1.0);
    float _989 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[0].z, _977);
    float _991 = fma(_775, (*spvDescriptorSet0.vp_c8)._m0[2].z, _975);
    float _993 = _981 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _995 = -_987;
    float _997 = _995 + 1.0;
    float _999 = _989 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1001 = _991 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1003 = _993 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1005 = _861 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1007 = floor(_961);
    float _1009 = _971 * _939;
    float _1011 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1003);
    float _1013 = _1001 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1015 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1011);
    float _1017 = _971 * _931;
    float _1019 = abs(_997);
    float _1021 = log2(_1019);
    float _1023 = -_1013;
    float _1025 = fma(_1023, _979, 1.0);
    float _1027 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1015);
    float _1029 = _971 * _943;
    float _1031 = _1017 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1033 = -_903;
    float _1035 = _889 + _1033;
    float _1037 = _993 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1039 = -_1031;
    float _1041 = fma(_1029, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1039);
    float _1043 = 1.0 / _1027;
    float _1045 = -_1007;
    float _1047 = _961 + _1045;
    float _1049 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1037);
    float _1051 = -_1009;
    float _1053 = fma(_1051, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1041);
    float _1055 = _993 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1057 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1049);
    float _1059 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1061 = fma(_1053, -0.5, 0.5);
    float _1063 = log2(_1025);
    float _1065 = fma(_1053, 0.5, 0.5);
    float _1067 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1055);
    float _1069 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1057);
    float _1071 = _1029 + 1.0;
    float _1073 = fma(_1065, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1075 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1067);
    float _1077 = _1069 * _1043;
    float _1079 = exp2(_1059);
    float _1081 = fma(_1065, _1073, -0.212114393711090087890625);
    float _1083 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1075);
    float _1085 = fma(_1077, 0.5, 0.5);
    float _1087 = fma(_1065, _1081, 1.570728778839111328125);
    float _1089 = _1083 * _1043;
    float _1091 = sqrt(_1061);
    float _1093 = _1063 * 0.693147182464599609375;
    float _1095 = fma(_1089, -0.5, 0.5);
    float _1097 = _1093 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1099 = -_1029;
    float _1101 = fma(_1079, _1071, _1099);
    float2 _4851 = float2(_1035, _1047);
    float _1103 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4851, float2(0.0), isnan(_4851)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4851, float2(0.0), isnan(_4851)), level(0.0)).x;
    float3 _4862 = float3(_1085, _1095, _1097);
    float _1105 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4862, float3(0.0), isnan(_4862)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4862, float3(0.0), isnan(_4862)), level(0.0)).x;
    float3 _4873 = float3(_1085, _1095, _1097);
    float4 _1108 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4873, float3(0.0), isnan(_4873)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4873, float3(0.0), isnan(_4873)), level(0.0)).xyzw;
    float _1110 = _1108.x;
    float _1112 = _1108.y;
    float _1114 = _1108.z;
    float _1116 = _1108.w;
    float _1118 = fma(_1101, 0.5, 0.5);
    float _1120 = _1091 * 0.636619746685028076171875;
    float _1122 = -_1087;
    float _1124 = fma(_1120, _1122, 1.0);
    float2 _4899 = float2(_1124, _1118);
    float3 _1128 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4899, float2(0.0), isnan(_4899)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4899, float2(0.0), isnan(_4899)), level(0.0)).xyz;
    float _1130 = _1128.x;
    float _1132 = _1128.y;
    float _1134 = _1128.z;
    float _1136 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1138 = int(_1136);
    float _1140 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1142 = _697 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1146 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1148 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1150 = int(_1148);
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1154 = fma(_1140, _1140, 1.0);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1158 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1142);
    float _1160 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1152);
    float _1162 = _611 + 0.5;
    float _1164 = -_615;
    float _1166 = _1164 + 0.5;
    float _1168 = float(_1138);
    float _1170 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1172 = int(_1170);
    float _1174 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1158);
    float _1176 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1178 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1160);
    out.m_60.w = _407;
    float _1180 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1182 = _993 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1184 = float(uint(_1150));
    float _1186 = 1.0 / _1168;
    int _1188 = ~_1150;
    int _1190 = _1188 + 1;
    out.m_62.x = _547;
    out.m_62.y = _697;
    out.m_62.z = _701;
    int _1192 = ~_1150;
    int _1194 = _1192 + 1;
    float _1196 = fma(_999, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1182);
    bool _1198 = _1150 == 0;
    float _1200 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_64.x = _459;
    float _1202 = 1.0 / _1184;
    float _1204 = fma(_1001, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1196);
    float _1206 = float(uint(_1172));
    out.m_66.x = _773;
    out.m_66.y = _771;
    out.m_66.z = _775;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1210 = _1208 != 0;
    float _1212 = _143 * _1186;
    float _1214 = 1.0 / _1206;
    float _1216 = trunc(_1212);
    int _1218 = int(_1216);
    float _1220 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1222 = int(_1220);
    int _1224 = as_type<int>(_1202) + (-2);
    float _1226 = float(uint(_1218));
    float _1228 = rsqrt(_1154);
    float _1230 = as_type<float>(_1224) * _1226;
    float _1232 = float(_1222);
    float _1234 = trunc(_1230);
    float _1236 = precise::max(_1234, 0.0);
    uint _1239 = uint(_1236);
    float _1241 = 1.0 / _1232;
    float _1243 = _1140 * _1228;
    int _1245 = _1190 * int(_1239);
    int _1247 = _1245 + _1218;
    float _1249 = exp2(_1200);
    float _1251 = float(uint(_1247));
    float _1253 = as_type<float>(_1247);
    float _1255 = _1083;
    float _1257 = _1069;
    if (_1210)
    {
        _1253 = 1.0;
    }
    float _1259 = _1253;
    float _1261 = _143 * _1241;
    float _1263 = _1259;
    if (!_1210)
    {
        _1263 = 7.345489978790283203125;
    }
    float _1265 = _1263;
    float _1267 = as_type<float>(_1224) * _1251;
    int _1269 = as_type<int>(_1214) + (-2);
    float _1271 = trunc(_1261);
    int _1273 = int(_1271);
    float _1275 = _1265 * _479;
    float _1277 = _1265;
    if (_1210)
    {
        float _1279 = in.m_56.x;
        _1277 = _1279;
    }
    float _1281 = _1277;
    float _1283 = -_1249;
    float _1285 = _1283 + 1.0;
    float _1287 = _1281;
    if (!_1210)
    {
        float _1289 = in.m_56.y;
        _1287 = _1289;
    }
    float _1291 = _1287;
    float _1293 = trunc(_1267);
    float _1295 = precise::max(_1293, 0.0);
    uint _1297 = uint(_1295);
    float _1299 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1301 = float(uint(_1273));
    float _1303 = floor(_1275);
    float _1305 = as_type<float>(_1269) * _1301;
    int _1307 = int(_1239) + int(_1297);
    float _1309 = float(_1150);
    float _1311 = trunc(_1305);
    float _1313 = precise::max(_1311, 0.0);
    uint _1315 = uint(_1313);
    float _1317 = float(_1218);
    int _1319 = _1194 * _1307;
    int _1321 = _1319 + _1218;
    float _1323 = float(_109);
    bool _1325 = _1317 >= _1309;
    bool _1327 = isnan(_1317);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan(_1309);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = -_1303;
    float _1339 = _1275 + _1337;
    bool _1341 = uint(_1321) >= uint(_1150);
    int _1343 = ~_1172;
    int _1345 = _1343 + 1;
    float _1347 = 1.0 / _1323;
    bool _1349 = !_1341;
    int _1351 = _1349 ? 0 : (-1);
    float _1353 = _1339 * _1309;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1357 = _1355 != 0;
    int _1359 = ~_1307;
    int _1361 = _1359 + _1351;
    int _1363 = _1361 + 1;
    int _1365 = _1345 * int(_1315);
    int _1367 = _1365 + _1273;
    bool _1369 = !_1357;
    int _1371 = _1369 ? 0 : 1;
    float _1373 = trunc(_1335);
    int _1375 = int(_1373);
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1379 = _1377 != 0;
    int _1381 = _1150 * _1363;
    int _1383 = _1381 + _1218;
    float _1385 = float(uint(_1367));
    bool _1387 = !_1198;
    int _1389 = _1387 ? _1383 : (-1);
    float _1391 = as_type<float>(_1269) * _1385;
    float _1393 = trunc(_1353);
    int _1395 = int(_1393);
    int _1397 = ~_1375;
    int _1399 = _1397 + 1;
    int _1401 = _1399 + 1;
    float _1403 = trunc(_1391);
    float _1405 = precise::max(_1403, 0.0);
    uint _1407 = uint(_1405);
    int _1409 = _1389 * _1401;
    float _1411 = _143 * _1347;
    float _1413 = as_type<float>(_1401);
    if (_1210)
    {
        _1413 = 1.0;
    }
    float _1415 = _1413;
    int _1417 = _1150 + (-1);
    float _1419 = _1411 * _1309;
    int _1421 = abs(_1371);
    int _1423 = abs(_269);
    int _1425 = _1375 * _1417;
    int _1427 = _1425 + _1409;
    float _1429 = trunc(_1419);
    int _1431 = int(_1429);
    float _1433 = _1415;
    float _1435 = as_type<float>(_1423);
    if (!_1210)
    {
        _1433 = 1.2345600128173828125;
    }
    float _1437 = _1433;
    int _1439 = _1395 * _1421;
    int _1441 = _1439 + _1218;
    int _1443 = abs(_259);
    float _1445 = _1291 * _1437;
    bool _1447 = !_1379;
    int _1449 = _1447 ? 0 : 1;
    int _1451 = _1427 * _1423;
    int _1453 = abs(_265);
    float _1455 = floor(_1445);
    int _1457 = int(_1315) + int(_1407);
    int _1459 = abs(_1449);
    float _1461 = float(_1172);
    int _1463 = _1431 * _1443;
    int _1465 = _1463 + _1451;
    float _1467 = float(_1273);
    float _1469 = _1411 * _1461;
    int _1471 = ~_1172;
    int _1473 = _1471 + 1;
    bool _1475 = _1467 >= _1461;
    bool _1477 = isnan(_1467);
    bool _1479 = _1475 || _1477;
    bool _1481 = isnan(_1461);
    bool _1483 = _1479 || _1481;
    float _1485 = float(_1483);
    int _1487 = _1441 * _1453;
    int _1489 = _1487 + _1465;
    float _1491 = -_1455;
    float _1493 = _1445 + _1491;
    float _1495 = trunc(_1469);
    int _1497 = int(_1495);
    float _1499 = -_181;
    float _1501 = _791 ? _1499 : _181;
    int _1503 = _1395 * _1459;
    int _1505 = _1503 + _1489;
    float _1507 = _1493 * _1461;
    int _1509 = _1473 * _1457;
    int _1511 = _1509 + _1273;
    int _1513 = abs(_523);
    float _1515 = float(uint(_1505));
    float _1517 = trunc(_1485);
    int _1519 = int(_1517);
    bool _1521 = uint(_1511) >= uint(_1172);
    int _1523 = ~_1150;
    int _1525 = _1523 + 1;
    float _1527 = as_type<float>(_1224) * _1515;
    bool _1529 = !_1521;
    int _1531 = _1529 ? 0 : (-1);
    int _1533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1535 = _1533 != 0;
    float _1537 = trunc(_1507);
    int _1539 = int(_1537);
    int _1541 = ~_1457;
    int _1543 = _1541 + _1531;
    int _1545 = _1543 + 1;
    bool _1547 = !_1535;
    int _1549 = _1547 ? 0 : 1;
    bool _1551 = _1172 == 0;
    int _1553 = abs(_1549);
    float _1555 = trunc(_1527);
    float _1557 = precise::max(_1555, 0.0);
    uint _1559 = uint(_1557);
    int _1561 = _1172 * _1545;
    int _1563 = _1561 + _1273;
    int _1565 = ~_1519;
    int _1567 = _1565 + 1;
    int _1569 = _1567 + 1;
    int _1571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1573 = _1571 != 0;
    bool _1575 = !_1551;
    int _1577 = _1575 ? _1563 : (-1);
    int _1579 = _1539 * _1553;
    int _1581 = _1579 + _1273;
    int _1583 = _1172 + (-1);
    int _1585 = _1577 * _1569;
    float _1587 = -_177;
    int _1589 = _559 ? as_type<int>(_1587) : as_type<int>(_177);
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1593 = _1591 != 0;
    int _1595 = _1519 * _1583;
    int _1597 = _1595 + _1585;
    int _1599 = abs(_543);
    int _1601 = _1525 * int(_1559);
    int _1603 = _1601 + _1505;
    int _1605 = abs(_535);
    float _1607 = float(uint(_1603));
    int _1609 = _1597 * _1513;
    int _1611 = abs(_551);
    int _1613 = _1497 * _1605;
    int _1615 = _1613 + _1609;
    float _1617 = as_type<float>(_1224) * _1607;
    int _1619 = _1581 * _1599;
    int _1621 = _1619 + _1615;
    float _1623 = trunc(_1617);
    float _1625 = precise::max(_1623, 0.0);
    uint _1627 = uint(_1625);
    int _1629 = ~_1150;
    int _1631 = _1629 + 1;
    int _1633 = _1539 * _1611;
    int _1635 = _1633 + _1621;
    int _1637 = ~_1150;
    int _1639 = _1637 + 1;
    bool _1641 = !_1573;
    float _1643 = _1641 ? _181 : _1501;
    float _1645 = float(uint(_1635));
    int _1647 = ~_1172;
    int _1649 = _1647 + 1;
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1653 = _1651 != 0;
    float _1655 = as_type<float>(_1269) * _1645;
    float _1657 = -_1103;
    float _1659 = _1657 + 1.0;
    int _1661 = int(_1559) + int(_1627);
    float _1663 = trunc(_1655);
    float _1665 = precise::max(_1663, 0.0);
    uint _1667 = uint(_1665);
    float _1669 = float(uint(_1441));
    int _1671 = _1631 * _1661;
    int _1673 = _1671 + _1505;
    float _1675 = as_type<float>(_1224) * _1669;
    bool _1677 = uint(_1673) >= uint(_1150);
    float _1679 = trunc(_1675);
    float _1681 = precise::max(_1679, 0.0);
    uint _1683 = uint(_1681);
    bool _1685 = !_1677;
    int _1687 = _1685 ? 0 : (-1);
    int _1689 = _1649 * int(_1667);
    int _1691 = _1689 + _1635;
    bool _1693 = _485 > 0.5;
    int _1695 = ~_1661;
    int _1697 = _1695 + _1687;
    int _1699 = _1697 + 1;
    float _1701 = float(uint(_1691));
    float _1703 = -_181;
    int _1705 = _1693 ? as_type<int>(_1703) : as_type<int>(_181);
    int _1707 = _1150 * _1699;
    int _1709 = _1707 + _1505;
    float _1711 = float(uint(_1581));
    float _1713 = as_type<float>(_1269) * _1701;
    int _1715 = ~_1150;
    int _1717 = _1715 + 1;
    bool _1719 = !_1198;
    int _1721 = _1719 ? _1709 : (-1);
    int _1723 = _1639 * int(_1683);
    int _1725 = _1723 + _1441;
    float _1727 = as_type<float>(_1269) * _1711;
    float _1729 = trunc(_1713);
    float _1731 = precise::max(_1729, 0.0);
    uint _1733 = uint(_1731);
    int _1735 = _1721 & 3;
    bool _1737 = _1735 != 0;
    int _1739 = _1721 & 3;
    bool _1741 = _1739 != 0;
    int _1743 = _1737 ? 0 : 1;
    bool _1745 = uint(_1739) > 1u;
    float _1747 = trunc(_1727);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    float _1753 = float(uint(_1725));
    int _1755 = ~_1172;
    int _1757 = _1755 + 1;
    float _1759 = as_type<float>(_1224) * _1753;
    int _1761 = ~_1743;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    int _1767 = int(_1667) + int(_1733);
    float _1769 = trunc(_1759);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    int _1775 = ~_1172;
    int _1777 = _1775 + 1;
    int _1779 = _1765;
    float _1781 = _1501;
    float _1783 = as_type<float>(_1459);
    float _1785 = as_type<float>(_1473);
    if (!_1745)
    {
        int _1787 = ~_1743;
        int _1789 = _1787 + 1;
        _1779 = _1789;
    }
    int _1791 = _1779;
    int _1793 = _1757 * _1767;
    int _1795 = _1793 + _1635;
    bool _1797 = uint(_1739) >= 2u;
    int _1799 = _1777 * int(_1751);
    int _1801 = _1799 + _1581;
    int _1803 = _1797 ? 0 : 1;
    bool _1805 = uint(_1795) >= uint(_1172);
    float _1807 = float(uint(_1801));
    bool _1809 = !_1805;
    int _1811 = _1809 ? 0 : (-1);
    bool _1813 = _1739 != 3;
    float _1815 = as_type<float>(_1269) * _1807;
    int _1817 = ~_1767;
    int _1819 = _1817 + _1811;
    int _1821 = _1819 + 1;
    int _1823 = int(_1683) + int(_1773);
    int _1825 = _1172 * _1821;
    int _1827 = _1825 + _1635;
    int _1829 = ~_1803;
    int _1831 = _1829 + 1;
    int _1833 = _1831 + 1;
    float _1835 = trunc(_1815);
    float _1837 = precise::max(_1835, 0.0);
    uint _1839 = uint(_1837);
    int _1841 = ~_1172;
    int _1843 = _1841 + 1;
    int _1845 = _1717 * _1823;
    int _1847 = _1845 + _1441;
    bool _1849 = !_1551;
    int _1851 = _1849 ? _1827 : (-1);
    int _1853 = _1833;
    int _1855 = _1717;
    if (_1813)
    {
        int _1857 = ~_1803;
        int _1859 = _1857 + 1;
        _1853 = _1859;
    }
    int _1861 = _1853;
    bool _1863 = uint(_1847) >= uint(_1150);
    if (_1210)
    {
        _1855 = 0;
    }
    int _1865 = _1855;
    bool _1867 = !_1863;
    int _1869 = _1867 ? 0 : (-1);
    int _1871 = _1865;
    if (!_1210)
    {
        _1871 = 1;
    }
    int _1873 = _1871;
    int _1875 = _1851 & 3;
    bool _1877 = _1875 != 0;
    int _1879 = _1851 & 3;
    bool _1881 = _1879 != 0;
    int _1883 = _1877 ? 0 : 1;
    bool _1885 = uint(_1879) > 1u;
    int _1887 = int(_1751) + int(_1839);
    int _1889 = ~_1883;
    int _1891 = _1889 + 1;
    int _1893 = _1891 + 1;
    int _1895 = abs(_1861);
    int _1897 = _1843 * _1887;
    int _1899 = _1897 + _1581;
    int _1901 = _1893;
    if (!_1885)
    {
        int _1903 = ~_1883;
        int _1905 = _1903 + 1;
        _1901 = _1905;
    }
    int _1907 = _1901;
    bool _1909 = uint(_1899) >= uint(_1172);
    bool _1911 = !_1909;
    int _1913 = _1911 ? 0 : (-1);
    bool _1915 = _479 > 0.5;
    float _1917 = -_177;
    int _1919 = _1915 ? as_type<int>(_1917) : as_type<int>(_177);
    int _1921 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1923 = _1921 != 0;
    float _1925 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1927 = !_1923;
    float _1929 = _1927 ? _177 : as_type<float>(_1919);
    float _1931 = fma(_479, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1925);
    bool _1933 = _1873 != 1;
    float _1935 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1931);
    int _1937 = ~_1887;
    int _1939 = _1937 + _1913;
    int _1941 = _1939 + 1;
    bool _1943 = !_1881;
    int _1945 = _1943 ? 0 : 1;
    out.m_68.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_68.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_68.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _1947 = _1739 != 3;
    int _1949 = _1172 * _1941;
    int _1951 = _1949 + _1581;
    if (!_1933)
    {
        _1781 = _481;
    }
    float _1953 = _1781;
    float _1955 = _1953;
    if (!_1933)
    {
        _1783 = _481;
    }
    float _1957 = _1783;
    float _1959 = _1957;
    if (!_1933)
    {
        _1785 = _483;
    }
    float _1961 = _1785;
    float _1963 = _1961;
    if (!_1933)
    {
        _1435 = _483;
    }
    float _1965 = _1435;
    float _1967 = _479 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1969 = _1965;
    if (_1933)
    {
        _1955 = _479;
    }
    float _1971 = _1955;
    float _1973 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1933)
    {
        _1959 = _479;
    }
    float _1975 = _1959;
    float _1977 = -_1144;
    float _1979 = fma(_1967, 2.0, _1977);
    if (_1933)
    {
        _1963 = _481;
    }
    float _1981 = _1963;
    float _1983 = _481 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1933)
    {
        _1969 = _481;
    }
    float _1985 = _1969;
    float _1987 = _1140 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1991 = _1989 != 0;
    float _1993 = fma(_1983, -2.0, _1156);
    int _1995 = _1721 >> 31;
    float _1997 = _1971 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1999 = !_1991;
    float _2001 = _1999 ? _177 : as_type<float>(_1589);
    float _2003 = _177 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2005 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2007 = _2005 != 0;
    float _2009 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2011 = _1995 & 3;
    float _2013 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1146);
    int _2015 = _1851 >> 31;
    float _2017 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1987);
    int _2019 = _1721 + _2011;
    float _2021 = fma(_2003, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1973);
    float _2023 = _697 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2025 = _2015 & 3;
    float _2027 = -_143;
    float _2029 = fma(_2027, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1979);
    int _2031 = _2019 >> 2;
    float _2033 = fma(_547, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2023);
    int _2035 = _1851 + _2025;
    float _2037 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1993);
    int _2039 = _2031 << 4;
    int _2041 = _2039 + 368;
    float _2043 = fma(_701, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2033);
    float _2045 = _2013 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    uint _2047 = uint(int(uint(_2041) >> uint(2)));
    uint _2049 = uint(int(uint(int(_2047)) >> uint(2)));
    int _2051 = int(_2047) & 3;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[int(_2049)][_2051];
    int _2055 = int(_2047) + 1;
    uint _2057 = uint(int(uint(_2055) >> uint(2)));
    int _2059 = _2055 & 3;
    float _2061 = (*spvDescriptorSet0.vp_c9)._m0[int(_2057)][_2059];
    float _2063 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2065 = _2035 >> 2;
    float _2067 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2069 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2071 = _2063 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2073 = _2067 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2075 = _2065 << 4;
    int _2077 = _2075 + 512;
    float _2079 = _2069 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2085 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    uint _2087 = uint(int(uint(_2077) >> uint(2)));
    uint _2089 = uint(int(uint(int(_2087)) >> uint(2)));
    int _2091 = int(_2087) & 3;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[int(_2089)][_2091];
    int _2095 = int(_2087) + 1;
    uint _2097 = uint(int(uint(_2095) >> uint(2)));
    int _2099 = _2095 & 3;
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[int(_2097)][_2099];
    float _2103 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2105 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2107 = _2083 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2109 = _2085 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2111 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_70.x = _2071;
    out.m_70.y = _2073;
    out.m_70.z = _2079;
    bool _2113 = !_2007;
    float _2115 = _2113 ? _181 : as_type<float>(_1705);
    float _2117 = 1.0 / _2111;
    out.m_72.x = _2105;
    out.m_72.y = _2107;
    out.m_72.z = _2109;
    out.m_72.w = _2103;
    int _2119 = ~_1823;
    int _2121 = _2119 + _1869;
    int _2123 = _2121 + 1;
    float _2125 = _1180 + _2111;
    int _2127 = _2041 + 8;
    uint _2129 = uint(int(uint(_2127) >> uint(2)));
    uint _2131 = uint(int(uint(int(_2129)) >> uint(2)));
    int _2133 = int(_2129) & 3;
    float _2135 = (*spvDescriptorSet0.vp_c9)._m0[int(_2131)][_2133];
    int _2137 = int(_2129) + 1;
    uint _2139 = uint(int(uint(_2137) >> uint(2)));
    int _2141 = _2137 & 3;
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[int(_2139)][_2141];
    float _2145 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2147 = _1243 * _2145;
    bool _2149 = uint(_1879) >= 2u;
    int _2151 = _1150 * _2123;
    int _2153 = _2151 + _1441;
    bool _2155 = !_1741;
    int _2157 = _2155 ? 0 : 1;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2161 = _1243 * _2159;
    float _2163 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2165 = _1243 * _2163;
    bool _2167 = _1879 != 3;
    float _2169 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2171 = int(_2169);
    int _2173 = abs(_2157);
    float _2175 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[25].y, _2161);
    float _2177 = _2125 * _2117;
    float _2179 = _2177 * 0.5;
    int _2181 = _2077 + 8;
    uint _2183 = uint(int(uint(_2181) >> uint(2)));
    uint _2185 = uint(int(uint(int(_2183)) >> uint(2)));
    int _2187 = int(_2183) & 3;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[int(_2185)][_2187];
    int _2191 = int(_2183) + 1;
    uint _2193 = uint(int(uint(_2191) >> uint(2)));
    int _2195 = _2191 & 3;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[int(_2193)][_2195];
    int _2199 = abs(_1791);
    float _2201 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[24].y, _2147);
    float _2203 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[26].y, _2165);
    int _2205 = abs(_1907);
    float _2207 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2209 = int(_2207);
    out.m_74.x = _2201;
    out.m_74.y = _2175;
    out.m_74.z = _2203;
    int _2211 = _2149 ? 0 : 1;
    int _2213 = ~_2199;
    int _2215 = _2213 + 1;
    int _2217 = _2215 + 1;
    int _2219 = ~_2205;
    int _2221 = _2219 + 1;
    int _2223 = _2221 + 1;
    int _2225 = _2217 * as_type<int>(_2061);
    bool _2227 = !_1551;
    int _2229 = _2227 ? _1951 : (-1);
    float _2231 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2233 = fma(_2179, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2231);
    int _2235 = ~_2211;
    int _2237 = _2235 + 1;
    int _2239 = _2237 + 1;
    int _2241 = _2223 * as_type<int>(_2101);
    int _2243 = ~_2173;
    int _2245 = _2243 + 1;
    int _2247 = _2245 + 1;
    float _2249 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2251 = _2239;
    if (_2167)
    {
        int _2253 = ~_2211;
        int _2255 = _2253 + 1;
        _2251 = _2255;
    }
    int _2257 = _2251;
    float _2259 = _2017 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    int _2261 = abs(_1945);
    int _2263 = _2247 * as_type<int>(_2053);
    int _2265 = _2263 + _2225;
    bool _2267 = !_1947;
    int _2269 = _2267 ? 0 : (-1);
    int _2271 = abs(_2257);
    float _2273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2275 = abs(_2269);
    int _2277 = ~_2261;
    int _2279 = _2277 + 1;
    int _2281 = _2279 + 1;
    bool _2283 = _1879 != 3;
    int _2285 = _2281 * as_type<int>(_2093);
    int _2287 = _2285 + _2241;
    int _2289 = ~_2271;
    int _2291 = _2289 + 1;
    int _2293 = _2291 + 1;
    int _2295 = ~_1895;
    int _2297 = _2295 + 1;
    int _2299 = _2297 + 1;
    int _2301 = ~_2275;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    int _2307 = _2293 * as_type<int>(_2189);
    int _2309 = _2307 + _2287;
    bool _2311 = !_1653;
    int _2313 = _2311 ? 0 : 1;
    int _2315 = _2299 * as_type<int>(_2135);
    int _2317 = _2315 + _2265;
    float _2319 = float(uint(_2209));
    float _2321 = 1.0 / _2233;
    float _2323 = float(uint(_2171));
    int _2325 = _2305 * as_type<int>(_2143);
    int _2327 = _2325 + _2317;
    bool _2329 = !_2283;
    int _2331 = _2329 ? 0 : (-1);
    float _2333 = _1176 * _2273;
    int _2335 = abs(_2313);
    int _2337 = abs(_2171);
    float _2339 = 1.0 / _2319;
    bool _2341 = !_1198;
    int _2343 = _2341 ? _2153 : (-1);
    int _2345 = abs(_2209);
    float _2347 = float(uint(_2345));
    float _2349 = 1.0 / _2323;
    int _2351 = abs(_2331);
    bool _2353 = !_1593;
    int _2355 = _2353 ? 0 : 1;
    int _2357 = ~_2351;
    int _2359 = _2357 + 1;
    int _2361 = _2359 + 1;
    int _2363 = abs(_2355);
    float _2365 = 1.0 / _2347;
    int _2367 = _2361 * as_type<int>(_2197);
    int _2369 = _2367 + _2309;
    int _2371 = ~_2335;
    int _2373 = _2371 + 1;
    int _2375 = _2373 + 1;
    int _2377 = ~_2363;
    int _2379 = _2377 + 1;
    int _2381 = _2379 + 1;
    float _2383 = float(uint(_2337));
    int _2385 = _2327 * _2375;
    int _2387 = ~_2171;
    int _2389 = _2387 + 1;
    int _2391 = _2369 * _2381;
    float _2393 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2395 = _2321 * _2393;
    int _2397 = _2343 * _2335;
    int _2399 = _2397 + _2385;
    int _2401 = _2229 * _2363;
    int _2403 = _2401 + _2391;
    int _2405 = as_type<int>(_2339) + (-2);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2409 = float(uint(_2399));
    float _2411 = abs(_2395);
    float _2413 = log2(_2411);
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2417 = float(uint(_2403));
    float _2419 = as_type<float>(_2405) * _2409;
    int _2421 = as_type<int>(_2349) + (-2);
    float _2423 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2415);
    int _2425 = abs(_2399);
    float _2427 = 1.0 / _2383;
    int _2429 = ~_2209;
    int _2431 = _2429 + 1;
    float _2433 = trunc(_2419);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    float _2439 = _1162 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2441 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2407);
    float _2443 = as_type<float>(_2421) * _2417;
    int _2445 = ~_2209;
    int _2447 = _2445 + 1;
    float _2449 = _2439 * _2249;
    float _2451 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2453 = trunc(_2443);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    int _2459 = as_type<int>(_2365) + (-2);
    out.m_76.x = _2449;
    out.m_76.y = _2333;
    float _2461 = float(uint(_2425));
    int _2463 = abs(_2403);
    int _2465 = as_type<int>(_2427) + (-2);
    float _2467 = as_type<float>(_2459) * _2461;
    float _2469 = float(uint(_2463));
    int _2471 = _2447 * int(_2437);
    int _2473 = _2471 + _2399;
    float _2475 = exp2(_2451);
    float _2477 = float(uint(_2473));
    int _2479 = _2389 * int(_2457);
    int _2481 = _2479 + _2403;
    float _2483 = as_type<float>(_2465) * _2469;
    float _2485 = trunc(_2467);
    float _2487 = precise::max(_2485, 0.0);
    uint _2489 = uint(_2487);
    float _2491 = as_type<float>(_2405) * _2477;
    float _2493 = float(uint(_2481));
    float _2495 = as_type<float>(_2421) * _2493;
    float _2497 = trunc(_2483);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    int _2503 = ~_2345;
    int _2505 = _2503 + 1;
    float _2507 = fma(_2475, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2509 = precise::clamp(_2507, 0.0, 1.0);
    float _2511 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2513 = ~_2337;
    int _2515 = _2513 + 1;
    float _2517 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2519 = trunc(_2491);
    float _2521 = precise::max(_2519, 0.0);
    uint _2523 = uint(_2521);
    int _2525 = _2505 * int(_2489);
    int _2527 = _2525 + _2425;
    float _2529 = -_2511;
    float _2531 = fma(_1997, 2.0, _2529);
    float _2533 = fma(_2509, -2.0, 3.0);
    float _2535 = _2509 * _2509;
    float _2537 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2441);
    float _2539 = float(uint(_2527));
    int _2541 = _2515 * int(_2501);
    int _2543 = _2541 + _2463;
    float _2545 = fma(_2009, -2.0, _2517);
    float _2547 = trunc(_2495);
    float _2549 = precise::max(_2547, 0.0);
    uint _2551 = uint(_2549);
    float _2553 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2423);
    float _2555 = as_type<float>(_2459) * _2539;
    float _2557 = float(uint(_2543));
    float _2559 = -_143;
    float _2561 = fma(_2559, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2531);
    float _2563 = _2535 * _2533;
    float _2565 = fma(_143, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2545);
    int _2567 = int(_2437) + int(_2523);
    float _2569 = as_type<float>(_2465) * _2557;
    float _2571 = -_2563;
    float _2573 = _2571 + 1.0;
    float _2575 = trunc(_2555);
    float _2577 = precise::max(_2575, 0.0);
    uint _2579 = uint(_2577);
    int _2581 = ~_2345;
    int _2583 = _2581 + 1;
    int _2585 = _2431 * _2567;
    int _2587 = _2585 + _2399;
    float _2589 = fma(_2573, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2563);
    int _2591 = ~_2171;
    int _2593 = _2591 + 1;
    float _2595 = -_1935;
    float _2597 = _2595 + 1.0;
    int _2599 = int(_2457) + int(_2551);
    float _2601 = -_2537;
    float _2603 = _2601 + 1.0;
    float _2605 = trunc(_2569);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    float _2611 = -_2553;
    float _2613 = _2611 + 1.0;
    int _2615 = ~_2337;
    int _2617 = _2615 + 1;
    bool _2619 = uint(_2587) >= uint(_2209);
    int _2621 = int(_2489) + int(_2579);
    float _2623 = -_1178;
    float _2625 = _2623 + 1.0;
    bool _2627 = !_2619;
    int _2629 = _2627 ? 0 : (-1);
    bool _2631 = _2209 == 0;
    int _2633 = _2583 * _2621;
    int _2635 = _2633 + _2425;
    int _2637 = int(_2501) + int(_2609);
    int _2639 = _2593 * _2599;
    int _2641 = _2639 + _2403;
    int _2643 = ~_2567;
    int _2645 = _2643 + _2629;
    int _2647 = _2645 + 1;
    float _2649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2651 = uint(_2635) >= uint(_2345);
    int _2653 = _2617 * _2637;
    int _2655 = _2653 + _2463;
    bool _2657 = uint(_2641) >= uint(_2171);
    int _2659 = _2209 * _2647;
    int _2661 = _2659 + _2399;
    int _2663 = _2399 ^ _2209;
    float _2665 = _1069 + _1027;
    bool _2667 = !_2657;
    int _2669 = _2667 ? 0 : (-1);
    float _2671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2673 = _2209 == 0;
    float _2675 = _2665 * 0.5;
    bool _2677 = uint(_2655) >= uint(_2337);
    int _2679 = _2403 ^ _2171;
    bool _2681 = !_2651;
    int _2683 = _2681 ? 0 : (-1);
    float _2685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _2687 = uint(int(uint(_2663) >> uint(31)));
    bool _2689 = !_2677;
    int _2691 = _2689 ? 0 : (-1);
    uint _2693 = uint(int(uint(_2679) >> uint(31)));
    int _2695 = ~_2683;
    int _2697 = _2621 + _2695;
    int _2699 = _2697 + 1;
    int _2701 = ~int(_2687);
    int _2703 = _2701 + 1;
    float _2705 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2707 = ~_2691;
    int _2709 = _2637 + _2707;
    int _2711 = _2709 + 1;
    int _2713 = ~int(_2693);
    int _2715 = _2713 + 1;
    int _2717 = ~_2599;
    int _2719 = _2717 + _2669;
    int _2721 = _2719 + 1;
    float _2723 = _2685 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2725 = _2699 ^ _2703;
    int _2727 = _2711 ^ _2715;
    int _2729 = _2171 * _2721;
    int _2731 = _2729 + _2403;
    bool _2733 = _2171 == 0;
    float _2735 = _2671 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2737 = _2171 == 0;
    int _2739 = ~_2703;
    int _2741 = _2739 + _2725;
    int _2743 = _2741 + 1;
    int _2745 = ~_2715;
    int _2747 = _2745 + _2727;
    int _2749 = _2747 + 1;
    float _2751 = _2649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2753 = !_2631;
    int _2755 = _2753 ? _2661 : (-1);
    bool _2757 = !_2733;
    int _2759 = _2757 ? _2731 : (-1);
    bool _2761 = !_2673;
    int _2763 = _2761 ? _2743 : (-1);
    float _2765 = _2115 + (-0.5);
    float _2767 = float(_2759);
    float _2769 = float(_2763);
    float _2771 = float(_2755);
    float _2773 = fma(_2723, _2767, _2561);
    float _2775 = _1643 + (-0.5);
    float _2777 = -_2037;
    float _2779 = fma(_2735, _2769, _2777);
    float _2781 = _1929 + 0.5;
    float _2783 = fma(_2751, _2771, _2029);
    bool _2785 = !_2737;
    int _2787 = _2785 ? _2749 : (-1);
    float _2789 = -_2735;
    float _2791 = fma(_2789, _2775, _2779);
    float _2793 = _2021 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2795 = fma(_2751, _2781, _2783);
    float _2797 = float(_2787);
    float _2799 = in.m_78.x;
    float _2801 = fma(_1643, _2625, _2791);
    bool _2803 = _2395 <= 8000.0;
    bool _2805 = isnan(_2395);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan(8000.0);
    bool _2811 = _2807 || _2809;
    float _2813 = float(_2811);
    float _2815 = _2705 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2817 = -_2597;
    float _2819 = fma(_1929, _2817, _2795);
    float _2821 = _1027 * 0.5;
    out.m_80.x = _2045;
    out.m_80.y = _2259;
    out.m_80.z = _2793;
    float _2823 = _2813 * _2589;
    float _2825 = -_2565;
    float _2827 = fma(_2815, _2797, _2825);
    float _2829 = _2001 + 0.5;
    float _2831 = _2823 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2833 = -_2815;
    float _2835 = fma(_2833, _2765, _2827);
    float _2837 = fma(_2723, _2829, _2773);
    float _2839 = fma(_1005, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1204);
    float _2841 = _1659 * _2831;
    float _2843 = precise::clamp(_2841, 0.0, 1.0);
    float _2845 = fma(_2115, _2613, _2835);
    float _2847 = -_2603;
    float _2849 = fma(_2001, _2847, _2837);
    float _2851 = fma(_1083, -0.5, _2821);
    float _2853 = _1299 * _1105;
    float _2855 = -_2843;
    float _2857 = fma(_2855, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2859 = _2839 + _1027;
    float _2861 = -_1299;
    float _2863 = _2861 + 1.0;
    float _2865 = _1116 * _2853;
    float _2867 = _2857 * _2799;
    float _2869 = _1134 * _2853;
    out.gl_Position.x = _1069;
    out.gl_Position.y = _1083;
    out.gl_Position.z = _2839;
    out.gl_Position.w = _1027;
    float _2871 = _2859 * 0.5;
    float _2873 = fma(_1130, _2865, _1110);
    float _2875 = fma(_1132, _2865, _1112);
    float _2877 = _1116 * _2863;
    float _2879 = fma(_1116, _2869, _1114);
    out.m_82.x = _2675;
    out.m_82.y = _2851;
    out.m_82.z = _2871;
    out.m_82.w = _1027;
    bool _2881 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2883 = isnan(_951);
    bool _2885 = _2881 || _2883;
    bool _2887 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2889 = _2885 || _2887;
    out.m_84.x = _2819;
    out.m_84.y = _2801;
    out.m_84.z = _2849;
    out.m_84.w = _2845;
    float _2891 = _2867 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_86.x = _2873;
    out.m_86.y = _2875;
    out.m_86.z = _2879;
    out.m_86.w = _2877;
    out.m_88.x = _2891;
    float _2893 = _2865;
    float _2895 = _2867;
    float _2897 = _2799;
    float _2899 = _2853;
    if (!_2889)
    {
        _1255 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2901 = _1255;
    float _2903 = _2901;
    float _2905 = _2901;
    if (!_2889)
    {
        _1257 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2907 = _1257;
    float _2909 = _2907;
    float _2911 = _2907;
    if (!_2889)
    {
        _2893 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2913 = _2893;
    float _2915 = _2913;
    float _2917 = _2913;
    if (!_2889)
    {
        _2895 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2919 = _2895;
    float _2921 = _2919;
    float _2923 = _2919;
    if (!_2889)
    {
        _2897 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2925 = _2897;
    float _2927 = _2925;
    float _2929 = _2925;
    if (!_2889)
    {
        _2899 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2931 = _2899;
    bool _2933 = !_2889;
    float _2935 = _2931;
    float _2937 = _2931;
    if (!_2933)
    {
        bool _2939 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2941 = isnan(_951);
        bool _2943 = _2939 || _2941;
        bool _2945 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2947 = _2943 || _2945;
        if (!_2947)
        {
            float _2949 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2951 = _951 + _2949;
            float _2953 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2955 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2953;
            float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2959 = _2957 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2961 = 1.0 / _2955;
            float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2969 = _2967 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2973 = _2971 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2975 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2977 = _2975 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2979 = _2951 * _2961;
            float _2981 = precise::clamp(_2979, 0.0, 1.0);
            float _2983 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2987 = fma(_2981, _2959, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2989 = fma(_2981, _2985, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2991 = fma(_2981, _2965, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2993 = fma(_2981, _2969, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2995 = fma(_2981, _2973, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2997 = fma(_2981, _2977, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2911 = _2991;
            _2929 = _2995;
            _2905 = _2987;
            _2923 = _2993;
            _2917 = _2989;
            _2937 = _2997;
            _2999 = true;
        }
        else
        {
            bool _3001 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3003 = isnan(_951);
            bool _3005 = _3001 || _3003;
            bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3009 = _3005 || _3007;
            if (!_3009)
            {
                _2903 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3011 = _2903;
            _2905 = _3011;
            if (!_3009)
            {
                _2909 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3013 = _2909;
            _2911 = _3013;
            if (!_3009)
            {
                _2915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3015 = _2915;
            _2917 = _3015;
            if (!_3009)
            {
                _2921 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3017 = _2921;
            _2923 = _3017;
            if (!_3009)
            {
                _2927 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3019 = _2927;
            _2929 = _3019;
            if (!_3009)
            {
                _2935 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3021 = _2935;
            bool _3023 = !_3009;
            _2937 = _3021;
            if (!_3023)
            {
                bool _3025 = _951 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3027 = isnan(_951);
                bool _3029 = _3025 || _3027;
                bool _3031 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3033 = _3029 || _3031;
                if (!_3033)
                {
                    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3037 = _951 + _3035;
                    float _3039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3041 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3039;
                    float _3043 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3045 = _3043 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3047 = 1.0 / _3041;
                    float _3049 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3051 = _3049 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3053 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3055 = _3053 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3057 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3059 = _3057 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3061 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3063 = _3061 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3065 = _3037 * _3047;
                    float _3067 = precise::clamp(_3065, 0.0, 1.0);
                    float _3069 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3071 = _3069 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3073 = fma(_3067, _3045, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3075 = fma(_3067, _3071, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3077 = fma(_3067, _3051, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3079 = fma(_3067, _3055, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3081 = fma(_3067, _3059, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3083 = fma(_3067, _3063, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2911 = _3077;
                    _2929 = _3081;
                    _2905 = _3073;
                    _2923 = _3079;
                    _2917 = _3075;
                    _2937 = _3083;
                    _2999 = true;
                }
                else
                {
                    _2911 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2929 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2905 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2923 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2937 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2999 = false;
    float _3085 = _2911;
    float _3087 = _2929;
    float _3089 = _2905;
    float _3091 = _2923;
    float _3093 = _2917;
    float _3095 = _2937;
    float _3097 = fma(_2259, -0.5, 0.5);
    float _3099 = precise::clamp(_3097, 0.0, 1.0);
    float _3101 = -_3085;
    float _3103 = _3101 + _3087;
    float _3105 = -_3089;
    float _3107 = _3105 + _3091;
    float _3109 = -_3093;
    float _3111 = _3109 + _3095;
    bool _3113 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3115 = fma(_3099, _3103, _3085);
    float _3117 = fma(_3099, _3107, _3089);
    float _3119 = fma(_3099, _3111, _3093);
    float _3121 = _3115 * 0.586610972881317138671875;
    out.m_90.x = 0.0;
    float _3123 = fma(_3117, 0.298911988735198974609375, _3121);
    float _3125 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_49.x = 1.0;
    float _3127 = fma(_3119, 0.114477999508380889892578125, _3123);
    float _3129 = -_3127;
    float _3131 = _3117 + _3129;
    float _3133 = -_3127;
    float _3135 = _3115 + _3133;
    float _3137 = -_3127;
    float _3139 = _3119 + _3137;
    out.m_88.w = _3125;
    float _3141 = fma(_3131, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3143 = fma(_3135, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    float _3145 = fma(_3139, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3127);
    out.m_60.x = _3141;
    out.m_60.y = _3143;
    out.m_60.z = _3145;
    if (!_3113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3147 = -_771;
    float _3149 = _3147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3151 = -_773;
    float _3153 = _3151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3155 = -_775;
    float _3157 = _3155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3159 = _3149 * _3149;
    float _3161 = fma(_3153, _3153, _3159);
    float _3163 = fma(_3157, _3157, _3161);
    float _3165 = sqrt(_3163);
    float _3167 = rsqrt(_3163);
    float _3169 = -_3165;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3175 = precise::clamp(_3173, 0.0, 1.0);
    float _3177 = _3153 * _3167;
    float _3179 = _3149 * _3167;
    float _3181 = abs(_3175);
    float _3183 = log2(_3181);
    float _3185 = _3157 * _3167;
    float _3187 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3189 = _2259 * _3179;
    float _3191 = -_3179;
    float _3193 = -_3187;
    float _3195 = fma(_3191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3193);
    float _3197 = fma(_2045, _3177, _3189);
    float _3199 = -_3185;
    float _3201 = fma(_3199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3195);
    float _3203 = fma(_2793, _3185, _3197);
    float _3205 = precise::clamp(_3203, 0.0, 1.0);
    float _3207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3209 = _3201 + _3207;
    float _3211 = _3183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3213 = _3209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3215 = precise::clamp(_3213, 0.0, 1.0);
    float _3217 = exp2(_3211);
    float _3219 = _3217 * _3215;
    float _3221 = _3205 * _3219;
    float _3223 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3225 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3227 = _3221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_90.x = _3223;
    out.m_90.y = _3225;
    out.m_90.z = _3227;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

