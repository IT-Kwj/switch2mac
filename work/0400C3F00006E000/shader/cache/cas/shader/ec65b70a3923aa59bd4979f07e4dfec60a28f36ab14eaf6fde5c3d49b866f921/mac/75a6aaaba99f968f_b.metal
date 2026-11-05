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
    float4 m_68 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_70 [[user(locn6)]];
    float4 m_78 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_72 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_64 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1803 = false;
    bool _717 = false;
    bool _543 = false;
    bool _427 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _111 = 0;
    if (!_105)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_115);
        out.gl_Position.z = _2412;
    }
    if (!_105)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _119 = in.m_49.w;
    float _121 = float(_101);
    float _123 = 1.0 / _121;
    float _125 = -_119;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_119);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = _127 * _123;
    bool _141 = _127 >= _121;
    bool _143 = !_137;
    bool _145 = _141 || _143;
    out.m_51.x = _139;
    float _147 = _119;
    float _149 = _127;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _147;
    if (_145)
    {
        out.m_47.x = 0.0;
    }
    if (_145)
    {
        float _153 = _151 * 5.0;
        _117 = as_type<int>(_153);
    }
    int _155 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2484 = as_type<float>(_155);
        out.gl_Position.z = _2484;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = in.m_62.x;
    float _179 = in.m_62.y;
    float _181 = in.m_62.z;
    int _183 = as_type<int>(_157) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_157) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _193 = !_185;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _161 * _167;
    float _203 = _161 * _173;
    float _205 = fma(_159, _165, _201);
    float _207 = _161 * _179;
    float _209 = fma(_159, _171, _203);
    float _211 = fma(_163, _169, _205);
    float _213 = fma(_159, _177, _207);
    float _215 = fma(_163, _175, _209);
    float _217 = fma(_163, _181, _213);
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_64.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        _237 = _139;
    }
    _239 = false;
    float _241 = _237;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    bool _251 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_241);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _241 + _275;
    float _279 = 1.0 / _269;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _265;
    float _285 = 1.0 / _273;
    float _287 = _277 * _279;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _245 * _283;
    bool _303 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_241);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_261;
    float _317 = _315 + 1.0;
    float _319 = _313 * _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _325 = _249 * _285;
    bool _327 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_241);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_313;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = _337 * _341;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = fma(_345, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_349, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _365 = fma(_323, _287, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = _299 * _359;
    float _369 = fma(_353, _287, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_299;
    float _373 = _371 + 1.0;
    float _375 = _361 * _367;
    float _377 = _363 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _383;
    float _387 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_385, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _395 = fma(_365, _355, _387);
    float _397 = fma(_369, _355, _389);
    float _399 = fma(_391, _319, _395);
    float _401 = fma(_393, _319, _397);
    float _403 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_281;
    float _425;
    if (!_407)
    {
        float _409 = in.m_64.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        _425 = _139;
    }
    _427 = false;
    float _429 = _425;
    float _431 = in.m_66.x;
    float _433 = in.m_66.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = _429 + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _439;
    bool _443 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _445 = 1.0 / _441;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _447;
    float _451 = _405 * _433;
    float _453 = _437 * _445;
    bool _455 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _457 = isnan(_429);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = _403 * _431;
    bool _469 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _471 = isnan(_429);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = -_465;
    float _491 = _489 + 1.0;
    float _493 = fma(_449, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _495 = fma(_483, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _497 = fma(_487, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _499 = _479 * _491;
    float _501 = -_479;
    float _503 = _501 + 1.0;
    float _505 = _495 * _499;
    float _507 = _497 * _499;
    float _509 = _493 * _499;
    float _511 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _505);
    float _513 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _507);
    float _515 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _509);
    float _517 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].x, _511);
    float _519 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].y, _513);
    float _521 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].z, _515);
    bool _523 = !_443;
    float _541;
    if (!_523)
    {
        float _525 = in.m_64.x;
        float _527 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _529 = _525 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _533 = _531 * _527;
        float _535 = floor(_533);
        float _537 = -_535;
        float _539 = _533 + _537;
        _541 = _539;
        _543 = true;
    }
    else
    {
        _541 = _139;
    }
    _543 = false;
    float _545 = _541;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _549 = _545 + _547;
    float _551 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _561 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _563 = isnan(_545);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _577 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_545);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = 1.0 / _555;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _591;
    float _595 = -_571;
    float _597 = _595 + 1.0;
    bool _599 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _601 = isnan(_545);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _613 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _615 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _617 = 1.0 / _559;
    float _619 = 1.0 / _575;
    float _621 = _593 * _589;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _627 = _587 * _597;
    float _629 = -_587;
    float _631 = _629 + 1.0;
    float _633 = fma(_621, _549, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _635;
    float _639 = _609 * _631;
    float _641 = _625 * _617;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _545 + _643;
    bool _647 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _649 = isnan(_545);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _633 * _639;
    float _661 = -_609;
    float _663 = _661 + 1.0;
    float _665 = fma(_641, _645, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _669 = _545 + _667;
    float _671 = _637 * _619;
    float _673 = -_657;
    float _675 = _673 + 1.0;
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _679 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _681 = fma(_671, _669, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _683 = _571 * _675;
    float _685 = fma(_665, _627, _677);
    float _687 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = fma(_681, _683, _685);
    float _693 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[118].x, _691);
    float _695 = _693 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _679;
    out.m_68.y = _687;
    out.m_68.z = _689;
    out.m_68.w = _695;
    bool _697 = !_615;
    float _715;
    if (!_697)
    {
        float _699 = in.m_64.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        _715 = _139;
    }
    _717 = false;
    float _719 = _715;
    float _721 = in.m_64.x;
    float _723 = in.m_64.y;
    float _725 = in.m_64.z;
    float _727 = in.m_64.w;
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _731 = in.m_44.x;
    float _733 = in.m_44.y;
    float _735 = in.m_44.z;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _739 = _737 != 0;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _743 = _719 + _741;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _751 = _749 != 0;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _757 = _755 != 0;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _761 = _729 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _763 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _767 = _723 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _769 = _727 > 0.5;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _773 = _721 > 0.5;
    float _775 = _167 * _733;
    float _777 = -_199;
    int _779 = _769 ? as_type<int>(_777) : as_type<int>(_199);
    float _781 = _179 * _733;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _789 = _787 != 0;
    float _791 = fma(_767, -2.0, _759);
    float _793 = fma(_177, _731, _781);
    float _795 = -_195;
    int _797 = _773 ? as_type<int>(_795) : as_type<int>(_195);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _803 = _801 != 0;
    float _805 = _173 * _733;
    float _807 = fma(_165, _731, _775);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _813 = fma(_171, _731, _805);
    float _815 = _721 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _817 = 1.0 / _811;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _827 = fma(_169, _735, _807);
    float _829 = _725 * 2.0;
    float _831 = _723 + _725;
    float _833 = fma(_181, _735, _793);
    float _835 = 1.0 / _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _837;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _843 = fma(_175, _735, _813);
    float _845 = _831 + (-1.0);
    float _847 = -_841;
    float _849 = fma(_815, 2.0, _847);
    bool _851 = !_739;
    float _853 = _851 ? _195 : as_type<float>(_797);
    float _855 = 1.0 / _821;
    float _857 = _839 * _817;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _863 = _721 * 2.0;
    bool _865 = _723 > 0.5;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _867;
    float _871 = floor(_829);
    float _873 = _861 * _835;
    float _875 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _877 = _723 * 2.0;
    float _879 = -_127;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[76].x, _849);
    float _883 = _853 + 0.5;
    bool _885 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _887 = isnan(_719);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = _843 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _899 = _869 * _855;
    float _901 = -_199;
    int _903 = _865 ? as_type<int>(_901) : as_type<int>(_199);
    float _905 = floor(_863);
    float _907 = -_195;
    int _909 = _865 ? as_type<int>(_907) : as_type<int>(_195);
    float _911 = _723 + _721;
    bool _913 = _725 > 0.5;
    float _915 = fma(_761, _883, _881);
    bool _917 = !_747;
    float _919 = _917 ? _199 : as_type<float>(_903);
    float _921 = _911 + (-1.0);
    float _923 = -_199;
    int _925 = _913 ? as_type<int>(_923) : as_type<int>(_199);
    float _927 = floor(_877);
    bool _929 = !_785;
    float _931 = _929 ? _195 : as_type<float>(_909);
    float _933 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _935 = !_789;
    float _937 = _935 ? _199 : as_type<float>(_925);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _941 = _719 + _939;
    bool _943 = _871 > 0.0;
    float _945 = _919 + (-0.5);
    bool _947 = _871 >= 0.0;
    bool _949 = isnan(_871);
    bool _951 = _947 || _949;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    float _957 = fma(_857, _941, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _959 = _877;
    float _961 = _871;
    if (!_803)
    {
        _959 = _725;
    }
    float _963 = _959;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _967 = _719 + _965;
    float _969 = _963;
    if (_803)
    {
        _969 = _723;
    }
    float _971 = _969;
    float _973 = fma(_899, _743, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _975 = -_195;
    int _977 = _913 ? as_type<int>(_975) : as_type<int>(_195);
    float _979 = fma(_873, _967, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _981 = _905 > 0.0;
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[83].w, _765);
    bool _985 = _905 >= 0.0;
    bool _987 = isnan(_905);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.0);
    bool _993 = _989 || _991;
    float _995 = -_895;
    float _997 = _995 + 1.0;
    float _999 = _905;
    if (!_803)
    {
        _961 = _723;
    }
    float _1001 = _961;
    float _1003 = _931 + 0.5;
    float _1005 = _1001;
    if (!_803)
    {
        _999 = _725;
    }
    float _1007 = _999;
    float _1009 = _827 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1011 = _955 ? 0 : 1;
    float _1013 = _833 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1015 = _1007;
    if (_803)
    {
        _1005 = _721;
    }
    float _1017 = _1005;
    float _1019 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _983);
    if (_803)
    {
        _1015 = _723;
    }
    float _1021 = _1015;
    bool _1023 = _927 >= 0.0;
    bool _1025 = isnan(_927);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    float _1033 = -_1019;
    float _1035 = _1033 + 1.0;
    bool _1037 = _927 > 0.0;
    float _1039 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1041 = ~_1011;
    int _1043 = _1041 + 1;
    int _1045 = _1043 + 1;
    int _1047 = _1045;
    if (!_943)
    {
        int _1049 = ~_1011;
        int _1051 = _1049 + 1;
        _1047 = _1051;
    }
    int _1053 = _1047;
    int _1055 = _993 ? 0 : 1;
    float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1059 = _1031 ? 0 : 1;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1067 = _1065 != 0;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1071 = _1069 != 0;
    bool _1073 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1075 = isnan(_719);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    bool _1085 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1087 = isnan(_719);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    bool _1097 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1099 = isnan(_719);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    bool _1113 = !_751;
    float _1115 = _1113 ? _199 : as_type<float>(_779);
    float _1117 = _1107 * _997;
    float _1119 = -_1107;
    float _1121 = _1119 + 1.0;
    float _1123 = _753 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1125 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _791);
    float _1127 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _771);
    float _1129 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1131 = _895 * _1111;
    float _1133 = -_1123;
    float _1135 = -_1125;
    float _1137 = fma(_1133, _945, _1135);
    float _1139 = _1095 * _1121;
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1143 = -_1095;
    float _1145 = _1143 + 1.0;
    float _1147 = -_799;
    float _1149 = fma(_1129, 2.0, _1147);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1153 = _957 * _1139;
    float _1155 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1157 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1127);
    float _1159 = fma(_1039, -2.0, _1151);
    float _1161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1153);
    bool _1165 = !_757;
    float _1167 = _1165 ? _195 : as_type<float>(_977);
    float _1169 = -_937;
    float _1171 = _1169 + 0.5;
    float _1173 = _1115 + (-0.5);
    float _1175 = fma(_979, _1117, _1163);
    float _1177 = -_127;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1149);
    float _1181 = _1167 + 0.5;
    float _1183 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1185 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1159);
    float _1187 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1189 = fma(_1155, _1181, _1179);
    float _1191 = fma(_973, _1131, _1175);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _897 + _1193;
    float _1197 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1199 = log2(_1197);
    float _1201 = -_1183;
    float _1203 = -_1185;
    float _1205 = fma(_1201, _1173, _1203);
    float _1207 = _1187 * _1161;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1211 = _1009 + _1209;
    float _1213 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1217 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1221 = _1013 + _1219;
    float _1223 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1213);
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1227 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1215);
    float _1229 = _1217 * _763;
    float _1231 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1223);
    float _1233 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1225);
    float _1235 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1227);
    float _1237 = _1199 * _127;
    float _1239 = fma(_1115, _1035, _1205);
    float _1241 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1233);
    float _1243 = -_1235;
    float _1245 = _1243 + 1.0;
    float _1247 = _1195 * _1195;
    float _1249 = -_1157;
    float _1251 = _1249 + 1.0;
    float _1253 = -_1241;
    float _1255 = _1253 + 1.0;
    float _1257 = -_1245;
    float _1259 = fma(_853, _1257, _915);
    float _1261 = exp2(_1237);
    float _1263 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1191);
    float _1265 = fma(_919, _1255, _1137);
    float _1267 = fma(_1211, _1211, _1247);
    int _1269 = ~_1055;
    int _1271 = _1269 + 1;
    int _1273 = _1271 + 1;
    float _1275 = -_1251;
    float _1277 = fma(_1167, _1275, _1189);
    int _1279 = _1273;
    int _1281 = as_type<int>(_1195);
    if (!_981)
    {
        int _1283 = ~_1055;
        int _1285 = _1283 + 1;
        _1279 = _1285;
    }
    int _1287 = _1279;
    out.m_70.x = _1207;
    out.m_70.y = _1229;
    bool _1289 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1291 = isnan(1.0);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1297 = _1293 || _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    bool _1303 = !_1067;
    int _1305 = _1303 ? 0 : 1;
    float _1307 = in.m_72.x;
    float _1309 = in.m_72.y;
    float _1311 = in.m_72.z;
    bool _1313 = _1231 >= 0.0;
    float _1315 = fma(_1221, _1221, _1267);
    int _1317 = ~_1059;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    float _1323 = -_1261;
    float _1325 = _1323 + 1.0;
    int _1327 = _1321;
    if (!_1037)
    {
        int _1329 = ~_1059;
        int _1331 = _1329 + 1;
        _1327 = _1331;
    }
    int _1333 = _1327;
    out.m_74.x = _1259;
    out.m_74.y = _1265;
    out.m_74.z = _1277;
    out.m_74.w = _1239;
    float _1335 = 1.0 / _1301;
    int _1337 = abs(_1305);
    bool _1339 = !_1063;
    int _1341 = _1339 ? 0 : 1;
    bool _1343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(0.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1053);
    float _1355 = rsqrt(_1315);
    int _1357 = abs(_1341);
    float _1359 = _1263 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1361 = float(_1287);
    if (_1313)
    {
        out.m_47.x = 0.0;
    }
    float _1363 = float(_1357);
    float _1365 = _1351 ? _1325 : 0.0;
    float _1367 = float(_1337);
    float _1369 = _1363 * _1353;
    float _1371 = _1335;
    if (_1297)
    {
        float _1373 = _1365 * _1335;
        _149 = _1373;
    }
    float _1375 = _149;
    float _1377 = _1367 * _1361;
    float _1379 = _1195 * _1355;
    if (_1313)
    {
        _1371 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1381 = _1371;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1389 = _1369 * (-2.0);
    float _1391 = _1211 * _1355;
    float _1393 = -_1379;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1195);
    float _1397 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1399 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1401 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1313)
    {
        float _1403 = _1381 * 5.0;
        _1281 = as_type<int>(_1403);
    }
    int _1405 = _1281;
    float _1407 = -_1391;
    float _1409 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1211);
    float _1411 = _1395 * _1395;
    float _1413 = _721 + (-0.5);
    float _1415 = fma(_1389, _1307, _1307);
    out.m_76.x = _1397;
    out.m_76.y = _1399;
    out.m_76.z = _1401;
    out.m_76.w = _1359;
    float _1417 = fma(_1409, _1409, _1411);
    float _1419 = fma(_933, _1389, _933);
    float _1421 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1415);
    float _1423 = _1311;
    if (_1313)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4521 = as_type<float>(_1405);
        out.gl_Position.z = _4521;
    }
    bool _1425 = !_1071;
    int _1427 = _1425 ? 0 : 1;
    if (_1313)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1429 = -_1379;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _1433 = _1377 * (-2.0);
    float _1435 = -_1391;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1009);
    float _1439 = _1221 * _1355;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1443 = _1431 + _1441;
    float _1445 = fma(_875, _1433, _875);
    float _1447 = fma(_1433, _1309, _1309);
    int _1449 = abs(_1427);
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1453 = _1437 + _1451;
    float _1455 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1457 = float(_1333);
    float _1459 = fma(_1419, _1375, _1421);
    float _1461 = float(_1449);
    float _1463 = _723 + (-0.5);
    float _1465 = -_1439;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1013);
    float _1469 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1455);
    float _1471 = _725 + _721;
    float _1473 = _1459 * 0.15915493667125701904296875;
    float _1475 = _1461 * _1457;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1479 = _1467 + _1477;
    float _1481 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1447);
    float _1483 = _1471 + (-1.0);
    float _1485 = _1475 * (-2.0);
    float _1487 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1469);
    float _1489 = _725 + (-0.5);
    float _1491 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1493 = fma(_1485, _1311, _1311);
    float _1495 = -_1439;
    float _1497 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    bool _1499 = _1487 >= 0.0;
    float _1501 = fma(_1491, _1485, _1491);
    float _1503 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1493);
    float _1505 = fma(_1497, _1497, _1417);
    float _1507 = fma(_1445, _1375, _1481);
    float _1509 = _1473 * 6.283185482025146484375;
    float _1511 = sin(_1509);
    float _1513 = fma(_1501, _1375, _1503);
    float _1515 = _1507 * 0.15915493667125701904296875;
    float _1517 = _1513 * 0.15915493667125701904296875;
    float _1519 = sqrt(_1505);
    int _1521 = as_type<int>(_1503);
    if (_1499)
    {
        _1423 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1523 = _1423;
    if (_1499)
    {
        out.m_47.x = 0.0;
    }
    if (_1499)
    {
        float _1525 = _1523 * 5.0;
        _1521 = as_type<int>(_1525);
    }
    int _1527 = _1521;
    float _1529 = _1473 * 6.283185482025146484375;
    float _1531 = cos(_1529);
    if (_1499)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4709 = as_type<float>(_1527);
        out.gl_Position.z = _4709;
    }
    float _1533 = _1515 * 6.283185482025146484375;
    float _1535 = sin(_1533);
    float _1537 = _1355 * _1519;
    float _1539 = _1515 * 6.283185482025146484375;
    float _1541 = cos(_1539);
    float _1543 = _1517 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    if (_1499)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1547 = _1517 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1555 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1557 = _1511 * _1535;
    float _1559 = _1537 * _1551;
    float _1561 = _1531 * _1541;
    float _1563 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1565 = _1537 * _1555;
    float _1567 = _1553 * _1559;
    float _1569 = _1531 * _1535;
    float _1571 = fma(_1545, _1561, _1557);
    float _1573 = _1563 * _1565;
    float _1575 = fma(_1545, _1557, _1561);
    float _1577 = _1549 * _1567;
    float _1579 = _1535 * _1549;
    float _1581 = _1541 * _1549;
    float _1583 = _1511 * _1541;
    float _1585 = _1531 * _1577;
    float _1587 = -_1567;
    float _1589 = _1545 * _1587;
    float _1591 = _1511 * _1577;
    float _1593 = fma(_1571, _1573, _1585);
    float _1595 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1597 = _1595 * 0.5;
    float _1599 = -_1583;
    float _1601 = fma(_1545, _1569, _1599);
    float _1603 = -_1569;
    float _1605 = fma(_1545, _1583, _1603);
    float _1607 = fma(_1581, _1573, _1589);
    float _1609 = fma(_1601, _1597, _1593);
    float _1611 = fma(_1605, _1573, _1591);
    float _1613 = fma(_1579, _1597, _1607);
    float _1615 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1617 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1619 = fma(_1575, _1597, _1611);
    float _1621 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1615);
    float _1623 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1617);
    float _1625 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1621);
    float _1627 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1623);
    float _1629 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1631 = _1627 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1633 = _1009 + _1629;
    float _1635 = _1013 + _1631;
    float _1637 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1633 + _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1645 = _1635 + _1643;
    float _1647 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1637);
    float _1649 = _1641 * _1641;
    float _1651 = _1645 * _1645;
    float _1653 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1647);
    float _1655 = _1649 + _1651;
    float _1657 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1659 = sqrt(_1655);
    float _1661 = _897 + _1657;
    bool _1663 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1637;
    float _1667 = _1619;
    float _1669 = _1635;
    float _1671 = _1649;
    float _1673 = _1651;
    if (!_1663)
    {
        _1665 = _1635;
    }
    float _1675 = _1665;
    float _1677 = _1675;
    if (!_1663)
    {
        _1667 = _1633;
    }
    float _1679 = _1667;
    float _1681 = _1679;
    if (!_1663)
    {
        _1669 = _1661;
    }
    float _1683 = _1669;
    bool _1685 = !_1663;
    float _1687 = _1683;
    if (!_1685)
    {
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1693 = _1659 + _1691;
        float _1695 = _1661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1697 = rsqrt(_1655);
        float _1699 = _1693 * _1689;
        float _1701 = _1699 * 0.15915493667125701904296875;
        float _1703 = _1701 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1701 * 6.283185482025146484375;
        float _1709 = cos(_1707);
        float _1711 = fma(_1705, _1695, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1713 = _1697 * _1711;
        float _1715 = _1709 + (-1.0);
        float _1717 = fma(_1641, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1719 = fma(_1645, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1721 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1725 = _1717 + _1723;
        float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1729 = _1719 + _1727;
        float _1731 = fma(_1661, _1709, _1721);
        float _1733 = _1725 * _1725;
        float _1735 = _1729 * _1729;
        _1687 = _1731;
        _1671 = _1733;
        _1673 = _1735;
        _1681 = _1717;
        _1677 = _1719;
    }
    float _1737 = _1687;
    float _1739 = _1671;
    float _1741 = _1673;
    float _1743 = _1681;
    float _1745 = _1677;
    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1749 = _1737 + _1747;
    float _1751 = fma(_1749, _1749, _1739);
    float _1753 = _1751 + _1741;
    float _1755 = sqrt(_1753);
    bool _1757 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1759 = isnan(_1755);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1765 = _1761 || _1763;
    float _1767 = _1751;
    if (!_1765)
    {
        _1767 = 1.0;
    }
    float _1769 = _1767;
    bool _1771 = !_1765;
    float _1773 = _1769;
    if (!_1771)
    {
        bool _1775 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1777 = isnan(_1755);
        bool _1779 = _1775 || _1777;
        bool _1781 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1783 = _1779 || _1781;
        if (!_1783)
        {
            float _1785 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1787 = _1755 + _1785;
            float _1789 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1791 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1789;
            float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1795 = _1793 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1797 = 1.0 / _1791;
            float _1799 = _1787 * _1797;
            float _1801 = fma(_1799, _1795, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1773 = _1801;
            _1803 = true;
        }
        else
        {
            bool _1805 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1807 = isnan(_1755);
            bool _1809 = _1805 || _1807;
            bool _1811 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1813 = _1809 || _1811;
            if (!_1813)
            {
                float _1815 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1817 = _1755 + _1815;
                float _1819 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1821 = _1819 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1825 = _1823 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1827 = 1.0 / _1821;
                float _1829 = _1817 * _1827;
                float _1831 = fma(_1829, _1825, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1773 = _1831;
                _1803 = true;
            }
            else
            {
                _1773 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1803 = false;
    float _1833 = _1773;
    float _1835 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1837 = _1737 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1841 = _1743 + _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1845 = _1745 + _1843;
    float _1847 = fma(_1837, _1833, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1849 = fma(_1841, _1833, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1851 = fma(_1845, _1833, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1853 = -_897;
    float _1855 = _1853 + _1847;
    float _1857 = -_1009;
    float _1859 = _1857 + _1849;
    float _1861 = -_1013;
    float _1863 = _1861 + _1851;
    float _1865 = _1855 * _1855;
    float _1867 = fma(_1859, _1859, _1865);
    float _1869 = fma(_1863, _1863, _1867);
    float _1871 = sqrt(_1869);
    bool _1873 = _1871 > 0.0;
    float _1875 = _1837;
    float _1877 = _1845;
    float _1879 = _1841;
    float _1881 = _1851;
    float _1883 = _1859;
    if (!_1873)
    {
        _1875 = _1849;
    }
    float _1885 = _1875;
    float _1887 = _1885;
    float _1889 = _1885;
    if (!_1873)
    {
        _1877 = _1847;
    }
    float _1891 = _1877;
    float _1893 = _1891;
    if (!_1873)
    {
        _1879 = _1851;
    }
    float _1895 = _1879;
    bool _1897 = !_1873;
    float _1899 = _1895;
    float _1901 = _1895;
    if (!_1897)
    {
        float _1903 = _215 * _215;
        float _1905 = fma(_211, _211, _1903);
        float _1907 = fma(_217, _217, _1905);
        float _1909 = rsqrt(_1869);
        float _1911 = sqrt(_1907);
        float _1913 = _1859 * _1909;
        float _1915 = _1855 * _1909;
        float _1917 = _1863 * _1909;
        bool _1919 = _1911 > 0.0;
        float _1921 = _1911;
        if (!_1919)
        {
            _1887 = _1849;
        }
        float _1923 = _1887;
        _1889 = _1923;
        if (!_1919)
        {
            _1921 = _1847;
        }
        float _1925 = _1921;
        _1893 = _1925;
        if (!_1919)
        {
            _1899 = _1851;
        }
        float _1927 = _1899;
        bool _1929 = !_1919;
        _1901 = _1927;
        if (!_1929)
        {
            float _1931 = rsqrt(_1907);
            float _1933 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1935 = _215 * _1931;
            float _1937 = _211 * _1931;
            float _1939 = _1915 * _1935;
            float _1941 = _217 * _1931;
            float _1943 = fma(_1913, _1937, _1939);
            float _1945 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1947 = fma(_1917, _1941, _1943);
            float _1949 = _1947 * _1945;
            float _1951 = fma(_211, _1949, _1849);
            float _1953 = fma(_215, _1949, _1847);
            float _1955 = fma(_217, _1949, _1851);
            _1893 = _1953;
            _1889 = _1951;
            _1901 = _1955;
        }
    }
    float _1957 = _1893;
    float _1959 = _1889;
    float _1961 = _1901;
    float _1963 = -_1379;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1957);
    float _1967 = -_1391;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1959);
    float _1971 = -_1439;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1961);
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1977 = _1965 + _1975;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1981 = _1969 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1985 = _1973 + _1983;
    float _1987 = _1977 * _1977;
    float _1989 = fma(_1981, _1981, _1987);
    float _1991 = fma(_1985, _1985, _1989);
    float _1993 = rsqrt(_1991);
    float _1995 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1997 = _1981 * _1995;
    float _1999 = _1985 * _1995;
    float _2001 = _1997 * _1997;
    float _2003 = _1999 * _1999;
    float _2005 = _2001 + _2003;
    float _2007 = sqrt(_2005);
    bool _2009 = _2007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = _2007 + _2011;
    float _2015 = _1985;
    float _2017 = _2013;
    float _2019 = _1977;
    float _2021 = _1995;
    float _2023 = _1997;
    if (_2009)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2025;
    }
    float _2027 = _2015;
    if (_2009)
    {
        float _2029 = rsqrt(_2005);
        _1881 = _2029;
    }
    float _2031 = _1881;
    float _2033 = _2031;
    if (_2009)
    {
        float _2035 = _2013 * _2027;
        _2017 = _2035;
    }
    float _2037 = _2017;
    if (_2009)
    {
        float _2039 = _2037 * 0.15915493667125701904296875;
        _1883 = _2039;
    }
    float _2041 = _1883;
    float _2043 = _1993;
    if (_2009)
    {
        float _2045 = _2041 * 6.283185482025146484375;
        float _2047 = sin(_2045);
        _2043 = _2047;
    }
    float _2049 = _2043;
    float _2051 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2053 = precise::max(0.0, _2051);
    float _2055 = _1869;
    float _2057 = _2051;
    if (_2009)
    {
        float _2059 = _2041 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        _2055 = _2061;
    }
    float _2063 = _2055;
    float _2065 = -_1995;
    float _2067 = -_2053;
    float _2069 = fma(_1977, _2065, _2067);
    float _2071 = _2069;
    if (_2009)
    {
        float _2073 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2057 = _2073;
    }
    float _2075 = _2057;
    float _2077 = sqrt(_1991);
    float _2079 = _2049;
    float _2081 = _2075;
    if (_2009)
    {
        float _2083 = fma(_2049, _2075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2019 = _2083;
    }
    float _2085 = _2019;
    float _2087 = _2085;
    if (!_2009)
    {
        _2079 = _1999;
    }
    float _2089 = _2079;
    float _2091 = _2089;
    if (_2009)
    {
        float _2093 = _2063 + (-1.0);
        _2081 = _2093;
    }
    float _2095 = _2081;
    float _2097 = _2095;
    if (_2009)
    {
        float _2099 = _2031 * _2085;
        _2021 = _2099;
    }
    float _2101 = _2021;
    if (!_2009)
    {
        _2033 = _2069;
    }
    float _2103 = _2033;
    float _2105 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2107 = _2103;
    if (_2009)
    {
        float _2109 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2087 = _2109;
    }
    float _2111 = _2087;
    if (_2009)
    {
        float _2113 = _1997 * _2101;
        _2023 = _2113;
    }
    float _2115 = _2023;
    if (!_2009)
    {
        _2097 = _2001;
    }
    float _2117 = _2097;
    float _2119 = _2117;
    if (_2009)
    {
        float _2121 = _1999 * _2101;
        _2091 = _2121;
    }
    float _2123 = _2091;
    if (_2009)
    {
        float _2125 = fma(_2069, _2063, _2111);
        _2107 = _2125;
    }
    float _2127 = _2107;
    if (_2009)
    {
        float _2129 = _2115 * _2115;
        _2119 = _2129;
    }
    float _2131 = _2119;
    if (!_2009)
    {
        _2071 = _2003;
    }
    float _2133 = _2071;
    float _2135 = _2133;
    if (_2009)
    {
        float _2137 = _2123 * _2123;
        _2135 = _2137;
    }
    float _2139 = _2135;
    float _2141 = fma(_2127, _2127, _2131);
    float _2143 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2145 = _2141 + _2139;
    float _2147 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2151 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2149);
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2157 = rsqrt(_2145);
    float _2159 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2147);
    float _2161 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2163 = -_2153;
    float _2165 = _2163 + 1.0;
    float _2167 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2159);
    float _2169 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2171 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2173 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2175 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2169);
    float _2177 = abs(_2165);
    float _2179 = log2(_2177);
    float _2181 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2171);
    float _2183 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2185 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2175);
    float _2187 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2189 = _2157 * _2115;
    float _2191 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = _2157 * _2127;
    float _2195 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2197 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2199 = -_2183;
    float _2201 = fma(_2199, _2155, 1.0);
    float _2203 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2143);
    float _2205 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2195);
    float _2207 = _2157 * _2123;
    float _2209 = -_2197;
    float _2211 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2209);
    float _2213 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2215 = _2203 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2217 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2205);
    float _2219 = -_2207;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2211);
    float _2223 = exp2(_2213);
    float _2225 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2227 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2217);
    float _2229 = fma(_2221, -0.5, 0.5);
    float _2231 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2233 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2225);
    float _2235 = fma(_2221, 0.5, 0.5);
    float _2237 = _2193 + 1.0;
    float _2239 = log2(_2201);
    float _2241 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2231);
    float _2243 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2233);
    float _2245 = fma(_2235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2247 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2241);
    float _2249 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2243);
    float _2251 = 1.0 / _2227;
    float _2253 = -_2193;
    float _2255 = fma(_2223, _2237, _2253);
    float _2257 = fma(_2235, _2245, -0.212114393711090087890625);
    float _2259 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2247);
    float _2261 = fma(_2255, 0.5, 0.5);
    float _2263 = fma(_2235, _2257, 1.570728778839111328125);
    float _2265 = sqrt(_2229);
    float _2267 = _2239 * 0.693147182464599609375;
    float _2269 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2271 = _2249 * _2251;
    float _2273 = _2259 * _2251;
    float _2275 = fma(_2271, 0.5, 0.5);
    float _2277 = fma(_2273, -0.5, 0.5);
    float _2279 = _2265 * 0.636619746685028076171875;
    float3 _5936 = float3(_2275, _2277, _2269);
    float _2281 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5936, float3(0.0), isnan(_5936)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5936, float3(0.0), isnan(_5936)), level(0.0)).x;
    float3 _5947 = float3(_2275, _2277, _2269);
    float4 _2284 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).xyzw;
    float _2286 = _2284.x;
    float _2288 = _2284.y;
    float _2290 = _2284.z;
    float _2292 = _2284.w;
    float _2294 = -_2263;
    float _2296 = fma(_2279, _2294, 1.0);
    float2 _5969 = float2(_2296, _2261);
    float3 _2300 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5969, float2(0.0), isnan(_5969)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5969, float2(0.0), isnan(_5969)), level(0.0)).xyz;
    float _2302 = _2300.x;
    float _2304 = _2300.y;
    float _2306 = _2300.z;
    float _2308 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2310 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2312 = _2227 * 0.5;
    out.m_78.x = _1969;
    out.m_78.y = _1965;
    out.m_78.z = _1973;
    float _2314 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2310);
    float _2316 = exp2(_2308);
    float _2318 = fma(_2259, -0.5, _2312);
    float _2320 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2314);
    float _2322 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2320);
    float _2324 = _2249 + _2227;
    float _2326 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2328 = _2322 + _2227;
    float _2330 = _2324 * 0.5;
    out.gl_Position.x = _2249;
    out.gl_Position.y = _2259;
    out.gl_Position.z = _2322;
    out.gl_Position.w = _2227;
    float _2332 = _2328 * 0.5;
    float _2334 = -_2316;
    float _2336 = _2334 + 1.0;
    out.m_47.x = _2326;
    float _2338 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2330;
    out.m_80.y = _2318;
    out.m_80.z = _2332;
    out.m_80.w = _2227;
    float _2340 = -_2338;
    float _2342 = _2340 + 1.0;
    float _2344 = _2338 * _2281;
    float _2346 = _2292 * _2344;
    float _2348 = _2292 * _2342;
    float _2350 = _2306 * _2344;
    float _2352 = fma(_2302, _2346, _2286);
    float _2354 = fma(_2304, _2346, _2288);
    float _2356 = fma(_2292, _2350, _2290);
    out.m_82.x = _2352;
    out.m_82.y = _2354;
    out.m_82.z = _2356;
    out.m_82.w = _2348;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1803 = false;
    bool _717 = false;
    bool _543 = false;
    bool _427 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _111 = 0;
    if (!_105)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_115);
        out.gl_Position.z = _2412;
    }
    if (!_105)
    {
        return out;
    }
    float _119 = in.m_49.w;
    float _121 = float(_101);
    float _123 = 1.0 / _121;
    float _125 = -_119;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_119);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = _127 * _123;
    bool _141 = _127 >= _121;
    bool _143 = !_137;
    bool _145 = _141 || _143;
    out.m_51.x = _139;
    float _147 = _119;
    float _149 = _127;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _147;
    if (_145)
    {
        out.m_47.x = 0.0;
    }
    if (_145)
    {
        float _153 = _151 * 5.0;
        _117 = as_type<int>(_153);
    }
    int _155 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2484 = as_type<float>(_155);
        out.gl_Position.z = _2484;
    }
    if (_145)
    {
        return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = in.m_62.x;
    float _179 = in.m_62.y;
    float _181 = in.m_62.z;
    int _183 = as_type<int>(_157) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_157) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _193 = !_185;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _161 * _167;
    float _203 = _161 * _173;
    float _205 = fma(_159, _165, _201);
    float _207 = _161 * _179;
    float _209 = fma(_159, _171, _203);
    float _211 = fma(_163, _169, _205);
    float _213 = fma(_159, _177, _207);
    float _215 = fma(_163, _175, _209);
    float _217 = fma(_163, _181, _213);
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_64.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        _237 = _139;
    }
    _239 = false;
    float _241 = _237;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    bool _251 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_241);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _241 + _275;
    float _279 = 1.0 / _269;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _265;
    float _285 = 1.0 / _273;
    float _287 = _277 * _279;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _245 * _283;
    bool _303 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_241);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_261;
    float _317 = _315 + 1.0;
    float _319 = _313 * _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _325 = _249 * _285;
    bool _327 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_241);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_313;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = _337 * _341;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = fma(_345, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_349, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _365 = fma(_323, _287, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = _299 * _359;
    float _369 = fma(_353, _287, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_299;
    float _373 = _371 + 1.0;
    float _375 = _361 * _367;
    float _377 = _363 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _383;
    float _387 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_385, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _395 = fma(_365, _355, _387);
    float _397 = fma(_369, _355, _389);
    float _399 = fma(_391, _319, _395);
    float _401 = fma(_393, _319, _397);
    float _403 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_281;
    float _425;
    if (!_407)
    {
        float _409 = in.m_64.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        _425 = _139;
    }
    _427 = false;
    float _429 = _425;
    float _431 = in.m_66.x;
    float _433 = in.m_66.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = _429 + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _439;
    bool _443 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _445 = 1.0 / _441;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _447;
    float _451 = _405 * _433;
    float _453 = _437 * _445;
    bool _455 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _457 = isnan(_429);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = _403 * _431;
    bool _469 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _471 = isnan(_429);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = -_465;
    float _491 = _489 + 1.0;
    float _493 = fma(_449, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _495 = fma(_483, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _497 = fma(_487, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _499 = _479 * _491;
    float _501 = -_479;
    float _503 = _501 + 1.0;
    float _505 = _495 * _499;
    float _507 = _497 * _499;
    float _509 = _493 * _499;
    float _511 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _505);
    float _513 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _507);
    float _515 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _509);
    float _517 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].x, _511);
    float _519 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].y, _513);
    float _521 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].z, _515);
    bool _523 = !_443;
    float _541;
    if (!_523)
    {
        float _525 = in.m_64.x;
        float _527 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _529 = _525 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _533 = _531 * _527;
        float _535 = floor(_533);
        float _537 = -_535;
        float _539 = _533 + _537;
        _541 = _539;
        _543 = true;
    }
    else
    {
        _541 = _139;
    }
    _543 = false;
    float _545 = _541;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _549 = _545 + _547;
    float _551 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _561 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _563 = isnan(_545);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _577 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_545);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = 1.0 / _555;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _591;
    float _595 = -_571;
    float _597 = _595 + 1.0;
    bool _599 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _601 = isnan(_545);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _613 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _615 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _617 = 1.0 / _559;
    float _619 = 1.0 / _575;
    float _621 = _593 * _589;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _627 = _587 * _597;
    float _629 = -_587;
    float _631 = _629 + 1.0;
    float _633 = fma(_621, _549, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _635;
    float _639 = _609 * _631;
    float _641 = _625 * _617;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _545 + _643;
    bool _647 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _649 = isnan(_545);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _633 * _639;
    float _661 = -_609;
    float _663 = _661 + 1.0;
    float _665 = fma(_641, _645, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _669 = _545 + _667;
    float _671 = _637 * _619;
    float _673 = -_657;
    float _675 = _673 + 1.0;
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _679 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _681 = fma(_671, _669, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _683 = _571 * _675;
    float _685 = fma(_665, _627, _677);
    float _687 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = fma(_681, _683, _685);
    float _693 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[118].x, _691);
    float _695 = _693 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _679;
    out.m_68.y = _687;
    out.m_68.z = _689;
    out.m_68.w = _695;
    bool _697 = !_615;
    float _715;
    if (!_697)
    {
        float _699 = in.m_64.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        _715 = _139;
    }
    _717 = false;
    float _719 = _715;
    float _721 = in.m_64.x;
    float _723 = in.m_64.y;
    float _725 = in.m_64.z;
    float _727 = in.m_64.w;
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _731 = in.m_44.x;
    float _733 = in.m_44.y;
    float _735 = in.m_44.z;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _739 = _737 != 0;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _743 = _719 + _741;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _751 = _749 != 0;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _757 = _755 != 0;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _761 = _729 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _763 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _767 = _723 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _769 = _727 > 0.5;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _773 = _721 > 0.5;
    float _775 = _167 * _733;
    float _777 = -_199;
    int _779 = _769 ? as_type<int>(_777) : as_type<int>(_199);
    float _781 = _179 * _733;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _789 = _787 != 0;
    float _791 = fma(_767, -2.0, _759);
    float _793 = fma(_177, _731, _781);
    float _795 = -_195;
    int _797 = _773 ? as_type<int>(_795) : as_type<int>(_195);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _803 = _801 != 0;
    float _805 = _173 * _733;
    float _807 = fma(_165, _731, _775);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _813 = fma(_171, _731, _805);
    float _815 = _721 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _817 = 1.0 / _811;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _827 = fma(_169, _735, _807);
    float _829 = _725 * 2.0;
    float _831 = _723 + _725;
    float _833 = fma(_181, _735, _793);
    float _835 = 1.0 / _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _837;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _843 = fma(_175, _735, _813);
    float _845 = _831 + (-1.0);
    float _847 = -_841;
    float _849 = fma(_815, 2.0, _847);
    bool _851 = !_739;
    float _853 = _851 ? _195 : as_type<float>(_797);
    float _855 = 1.0 / _821;
    float _857 = _839 * _817;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _863 = _721 * 2.0;
    bool _865 = _723 > 0.5;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _867;
    float _871 = floor(_829);
    float _873 = _861 * _835;
    float _875 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _877 = _723 * 2.0;
    float _879 = -_127;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[76].x, _849);
    float _883 = _853 + 0.5;
    bool _885 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _887 = isnan(_719);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = _843 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _899 = _869 * _855;
    float _901 = -_199;
    int _903 = _865 ? as_type<int>(_901) : as_type<int>(_199);
    float _905 = floor(_863);
    float _907 = -_195;
    int _909 = _865 ? as_type<int>(_907) : as_type<int>(_195);
    float _911 = _723 + _721;
    bool _913 = _725 > 0.5;
    float _915 = fma(_761, _883, _881);
    bool _917 = !_747;
    float _919 = _917 ? _199 : as_type<float>(_903);
    float _921 = _911 + (-1.0);
    float _923 = -_199;
    int _925 = _913 ? as_type<int>(_923) : as_type<int>(_199);
    float _927 = floor(_877);
    bool _929 = !_785;
    float _931 = _929 ? _195 : as_type<float>(_909);
    float _933 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _935 = !_789;
    float _937 = _935 ? _199 : as_type<float>(_925);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _941 = _719 + _939;
    bool _943 = _871 > 0.0;
    float _945 = _919 + (-0.5);
    bool _947 = _871 >= 0.0;
    bool _949 = isnan(_871);
    bool _951 = _947 || _949;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    float _957 = fma(_857, _941, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _959 = _877;
    float _961 = _871;
    if (!_803)
    {
        _959 = _725;
    }
    float _963 = _959;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _967 = _719 + _965;
    float _969 = _963;
    if (_803)
    {
        _969 = _723;
    }
    float _971 = _969;
    float _973 = fma(_899, _743, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _975 = -_195;
    int _977 = _913 ? as_type<int>(_975) : as_type<int>(_195);
    float _979 = fma(_873, _967, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _981 = _905 > 0.0;
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[83].w, _765);
    bool _985 = _905 >= 0.0;
    bool _987 = isnan(_905);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.0);
    bool _993 = _989 || _991;
    float _995 = -_895;
    float _997 = _995 + 1.0;
    float _999 = _905;
    if (!_803)
    {
        _961 = _723;
    }
    float _1001 = _961;
    float _1003 = _931 + 0.5;
    float _1005 = _1001;
    if (!_803)
    {
        _999 = _725;
    }
    float _1007 = _999;
    float _1009 = _827 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1011 = _955 ? 0 : 1;
    float _1013 = _833 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1015 = _1007;
    if (_803)
    {
        _1005 = _721;
    }
    float _1017 = _1005;
    float _1019 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _983);
    if (_803)
    {
        _1015 = _723;
    }
    float _1021 = _1015;
    bool _1023 = _927 >= 0.0;
    bool _1025 = isnan(_927);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    float _1033 = -_1019;
    float _1035 = _1033 + 1.0;
    bool _1037 = _927 > 0.0;
    float _1039 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1041 = ~_1011;
    int _1043 = _1041 + 1;
    int _1045 = _1043 + 1;
    int _1047 = _1045;
    if (!_943)
    {
        int _1049 = ~_1011;
        int _1051 = _1049 + 1;
        _1047 = _1051;
    }
    int _1053 = _1047;
    int _1055 = _993 ? 0 : 1;
    float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1059 = _1031 ? 0 : 1;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1067 = _1065 != 0;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1071 = _1069 != 0;
    bool _1073 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1075 = isnan(_719);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    bool _1085 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1087 = isnan(_719);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    bool _1097 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1099 = isnan(_719);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    bool _1113 = !_751;
    float _1115 = _1113 ? _199 : as_type<float>(_779);
    float _1117 = _1107 * _997;
    float _1119 = -_1107;
    float _1121 = _1119 + 1.0;
    float _1123 = _753 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1125 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _791);
    float _1127 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _771);
    float _1129 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1131 = _895 * _1111;
    float _1133 = -_1123;
    float _1135 = -_1125;
    float _1137 = fma(_1133, _945, _1135);
    float _1139 = _1095 * _1121;
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1143 = -_1095;
    float _1145 = _1143 + 1.0;
    float _1147 = -_799;
    float _1149 = fma(_1129, 2.0, _1147);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1153 = _957 * _1139;
    float _1155 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1157 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1127);
    float _1159 = fma(_1039, -2.0, _1151);
    float _1161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1153);
    bool _1165 = !_757;
    float _1167 = _1165 ? _195 : as_type<float>(_977);
    float _1169 = -_937;
    float _1171 = _1169 + 0.5;
    float _1173 = _1115 + (-0.5);
    float _1175 = fma(_979, _1117, _1163);
    float _1177 = -_127;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1149);
    float _1181 = _1167 + 0.5;
    float _1183 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1185 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1159);
    float _1187 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1189 = fma(_1155, _1181, _1179);
    float _1191 = fma(_973, _1131, _1175);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _897 + _1193;
    float _1197 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1199 = log2(_1197);
    float _1201 = -_1183;
    float _1203 = -_1185;
    float _1205 = fma(_1201, _1173, _1203);
    float _1207 = _1187 * _1161;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1211 = _1009 + _1209;
    float _1213 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1217 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1221 = _1013 + _1219;
    float _1223 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1213);
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1227 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1215);
    float _1229 = _1217 * _763;
    float _1231 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1223);
    float _1233 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1225);
    float _1235 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1227);
    float _1237 = _1199 * _127;
    float _1239 = fma(_1115, _1035, _1205);
    float _1241 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1233);
    float _1243 = -_1235;
    float _1245 = _1243 + 1.0;
    float _1247 = _1195 * _1195;
    float _1249 = -_1157;
    float _1251 = _1249 + 1.0;
    float _1253 = -_1241;
    float _1255 = _1253 + 1.0;
    float _1257 = -_1245;
    float _1259 = fma(_853, _1257, _915);
    float _1261 = exp2(_1237);
    float _1263 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1191);
    float _1265 = fma(_919, _1255, _1137);
    float _1267 = fma(_1211, _1211, _1247);
    int _1269 = ~_1055;
    int _1271 = _1269 + 1;
    int _1273 = _1271 + 1;
    float _1275 = -_1251;
    float _1277 = fma(_1167, _1275, _1189);
    int _1279 = _1273;
    int _1281 = as_type<int>(_1195);
    if (!_981)
    {
        int _1283 = ~_1055;
        int _1285 = _1283 + 1;
        _1279 = _1285;
    }
    int _1287 = _1279;
    out.m_70.x = _1207;
    out.m_70.y = _1229;
    bool _1289 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1291 = isnan(1.0);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1297 = _1293 || _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    bool _1303 = !_1067;
    int _1305 = _1303 ? 0 : 1;
    float _1307 = in.m_72.x;
    float _1309 = in.m_72.y;
    float _1311 = in.m_72.z;
    bool _1313 = _1231 >= 0.0;
    float _1315 = fma(_1221, _1221, _1267);
    int _1317 = ~_1059;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    float _1323 = -_1261;
    float _1325 = _1323 + 1.0;
    int _1327 = _1321;
    if (!_1037)
    {
        int _1329 = ~_1059;
        int _1331 = _1329 + 1;
        _1327 = _1331;
    }
    int _1333 = _1327;
    out.m_74.x = _1259;
    out.m_74.y = _1265;
    out.m_74.z = _1277;
    out.m_74.w = _1239;
    float _1335 = 1.0 / _1301;
    int _1337 = abs(_1305);
    bool _1339 = !_1063;
    int _1341 = _1339 ? 0 : 1;
    bool _1343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(0.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1053);
    float _1355 = rsqrt(_1315);
    int _1357 = abs(_1341);
    float _1359 = _1263 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1361 = float(_1287);
    if (_1313)
    {
        out.m_47.x = 0.0;
    }
    float _1363 = float(_1357);
    float _1365 = _1351 ? _1325 : 0.0;
    float _1367 = float(_1337);
    float _1369 = _1363 * _1353;
    float _1371 = _1335;
    if (_1297)
    {
        float _1373 = _1365 * _1335;
        _149 = _1373;
    }
    float _1375 = _149;
    float _1377 = _1367 * _1361;
    float _1379 = _1195 * _1355;
    if (_1313)
    {
        _1371 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1381 = _1371;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1389 = _1369 * (-2.0);
    float _1391 = _1211 * _1355;
    float _1393 = -_1379;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1195);
    float _1397 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1399 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1401 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1313)
    {
        float _1403 = _1381 * 5.0;
        _1281 = as_type<int>(_1403);
    }
    int _1405 = _1281;
    float _1407 = -_1391;
    float _1409 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1211);
    float _1411 = _1395 * _1395;
    float _1413 = _721 + (-0.5);
    float _1415 = fma(_1389, _1307, _1307);
    out.m_76.x = _1397;
    out.m_76.y = _1399;
    out.m_76.z = _1401;
    out.m_76.w = _1359;
    float _1417 = fma(_1409, _1409, _1411);
    float _1419 = fma(_933, _1389, _933);
    float _1421 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1415);
    float _1423 = _1311;
    if (_1313)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4521 = as_type<float>(_1405);
        out.gl_Position.z = _4521;
    }
    bool _1425 = !_1071;
    int _1427 = _1425 ? 0 : 1;
    if (_1313)
    {
        return out;
    }
    float _1429 = -_1379;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _1433 = _1377 * (-2.0);
    float _1435 = -_1391;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1009);
    float _1439 = _1221 * _1355;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1443 = _1431 + _1441;
    float _1445 = fma(_875, _1433, _875);
    float _1447 = fma(_1433, _1309, _1309);
    int _1449 = abs(_1427);
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1453 = _1437 + _1451;
    float _1455 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1457 = float(_1333);
    float _1459 = fma(_1419, _1375, _1421);
    float _1461 = float(_1449);
    float _1463 = _723 + (-0.5);
    float _1465 = -_1439;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1013);
    float _1469 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1455);
    float _1471 = _725 + _721;
    float _1473 = _1459 * 0.15915493667125701904296875;
    float _1475 = _1461 * _1457;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1479 = _1467 + _1477;
    float _1481 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1447);
    float _1483 = _1471 + (-1.0);
    float _1485 = _1475 * (-2.0);
    float _1487 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1469);
    float _1489 = _725 + (-0.5);
    float _1491 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1493 = fma(_1485, _1311, _1311);
    float _1495 = -_1439;
    float _1497 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    bool _1499 = _1487 >= 0.0;
    float _1501 = fma(_1491, _1485, _1491);
    float _1503 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1493);
    float _1505 = fma(_1497, _1497, _1417);
    float _1507 = fma(_1445, _1375, _1481);
    float _1509 = _1473 * 6.283185482025146484375;
    float _1511 = sin(_1509);
    float _1513 = fma(_1501, _1375, _1503);
    float _1515 = _1507 * 0.15915493667125701904296875;
    float _1517 = _1513 * 0.15915493667125701904296875;
    float _1519 = sqrt(_1505);
    int _1521 = as_type<int>(_1503);
    if (_1499)
    {
        _1423 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1523 = _1423;
    if (_1499)
    {
        out.m_47.x = 0.0;
    }
    if (_1499)
    {
        float _1525 = _1523 * 5.0;
        _1521 = as_type<int>(_1525);
    }
    int _1527 = _1521;
    float _1529 = _1473 * 6.283185482025146484375;
    float _1531 = cos(_1529);
    if (_1499)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4709 = as_type<float>(_1527);
        out.gl_Position.z = _4709;
    }
    float _1533 = _1515 * 6.283185482025146484375;
    float _1535 = sin(_1533);
    float _1537 = _1355 * _1519;
    float _1539 = _1515 * 6.283185482025146484375;
    float _1541 = cos(_1539);
    float _1543 = _1517 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    if (_1499)
    {
        return out;
    }
    float _1547 = _1517 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1555 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1557 = _1511 * _1535;
    float _1559 = _1537 * _1551;
    float _1561 = _1531 * _1541;
    float _1563 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1565 = _1537 * _1555;
    float _1567 = _1553 * _1559;
    float _1569 = _1531 * _1535;
    float _1571 = fma(_1545, _1561, _1557);
    float _1573 = _1563 * _1565;
    float _1575 = fma(_1545, _1557, _1561);
    float _1577 = _1549 * _1567;
    float _1579 = _1535 * _1549;
    float _1581 = _1541 * _1549;
    float _1583 = _1511 * _1541;
    float _1585 = _1531 * _1577;
    float _1587 = -_1567;
    float _1589 = _1545 * _1587;
    float _1591 = _1511 * _1577;
    float _1593 = fma(_1571, _1573, _1585);
    float _1595 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1597 = _1595 * 0.5;
    float _1599 = -_1583;
    float _1601 = fma(_1545, _1569, _1599);
    float _1603 = -_1569;
    float _1605 = fma(_1545, _1583, _1603);
    float _1607 = fma(_1581, _1573, _1589);
    float _1609 = fma(_1601, _1597, _1593);
    float _1611 = fma(_1605, _1573, _1591);
    float _1613 = fma(_1579, _1597, _1607);
    float _1615 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1617 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1619 = fma(_1575, _1597, _1611);
    float _1621 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1615);
    float _1623 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1617);
    float _1625 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1621);
    float _1627 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1623);
    float _1629 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1631 = _1627 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1633 = _1009 + _1629;
    float _1635 = _1013 + _1631;
    float _1637 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1633 + _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1645 = _1635 + _1643;
    float _1647 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1637);
    float _1649 = _1641 * _1641;
    float _1651 = _1645 * _1645;
    float _1653 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1647);
    float _1655 = _1649 + _1651;
    float _1657 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1659 = sqrt(_1655);
    float _1661 = _897 + _1657;
    bool _1663 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1637;
    float _1667 = _1619;
    float _1669 = _1635;
    float _1671 = _1649;
    float _1673 = _1651;
    if (!_1663)
    {
        _1665 = _1635;
    }
    float _1675 = _1665;
    float _1677 = _1675;
    if (!_1663)
    {
        _1667 = _1633;
    }
    float _1679 = _1667;
    float _1681 = _1679;
    if (!_1663)
    {
        _1669 = _1661;
    }
    float _1683 = _1669;
    bool _1685 = !_1663;
    float _1687 = _1683;
    if (!_1685)
    {
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1693 = _1659 + _1691;
        float _1695 = _1661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1697 = rsqrt(_1655);
        float _1699 = _1693 * _1689;
        float _1701 = _1699 * 0.15915493667125701904296875;
        float _1703 = _1701 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1701 * 6.283185482025146484375;
        float _1709 = cos(_1707);
        float _1711 = fma(_1705, _1695, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1713 = _1697 * _1711;
        float _1715 = _1709 + (-1.0);
        float _1717 = fma(_1641, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1719 = fma(_1645, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1721 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1725 = _1717 + _1723;
        float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1729 = _1719 + _1727;
        float _1731 = fma(_1661, _1709, _1721);
        float _1733 = _1725 * _1725;
        float _1735 = _1729 * _1729;
        _1687 = _1731;
        _1671 = _1733;
        _1673 = _1735;
        _1681 = _1717;
        _1677 = _1719;
    }
    float _1737 = _1687;
    float _1739 = _1671;
    float _1741 = _1673;
    float _1743 = _1681;
    float _1745 = _1677;
    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1749 = _1737 + _1747;
    float _1751 = fma(_1749, _1749, _1739);
    float _1753 = _1751 + _1741;
    float _1755 = sqrt(_1753);
    bool _1757 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1759 = isnan(_1755);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1765 = _1761 || _1763;
    float _1767 = _1751;
    if (!_1765)
    {
        _1767 = 1.0;
    }
    float _1769 = _1767;
    bool _1771 = !_1765;
    float _1773 = _1769;
    if (!_1771)
    {
        bool _1775 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1777 = isnan(_1755);
        bool _1779 = _1775 || _1777;
        bool _1781 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1783 = _1779 || _1781;
        if (!_1783)
        {
            float _1785 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1787 = _1755 + _1785;
            float _1789 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1791 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1789;
            float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1795 = _1793 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1797 = 1.0 / _1791;
            float _1799 = _1787 * _1797;
            float _1801 = fma(_1799, _1795, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1773 = _1801;
            _1803 = true;
        }
        else
        {
            bool _1805 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1807 = isnan(_1755);
            bool _1809 = _1805 || _1807;
            bool _1811 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1813 = _1809 || _1811;
            if (!_1813)
            {
                float _1815 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1817 = _1755 + _1815;
                float _1819 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1821 = _1819 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1825 = _1823 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1827 = 1.0 / _1821;
                float _1829 = _1817 * _1827;
                float _1831 = fma(_1829, _1825, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1773 = _1831;
                _1803 = true;
            }
            else
            {
                _1773 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1803 = false;
    float _1833 = _1773;
    float _1835 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1837 = _1737 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1841 = _1743 + _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1845 = _1745 + _1843;
    float _1847 = fma(_1837, _1833, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1849 = fma(_1841, _1833, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1851 = fma(_1845, _1833, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1853 = -_897;
    float _1855 = _1853 + _1847;
    float _1857 = -_1009;
    float _1859 = _1857 + _1849;
    float _1861 = -_1013;
    float _1863 = _1861 + _1851;
    float _1865 = _1855 * _1855;
    float _1867 = fma(_1859, _1859, _1865);
    float _1869 = fma(_1863, _1863, _1867);
    float _1871 = sqrt(_1869);
    bool _1873 = _1871 > 0.0;
    float _1875 = _1837;
    float _1877 = _1845;
    float _1879 = _1841;
    float _1881 = _1851;
    float _1883 = _1859;
    if (!_1873)
    {
        _1875 = _1849;
    }
    float _1885 = _1875;
    float _1887 = _1885;
    float _1889 = _1885;
    if (!_1873)
    {
        _1877 = _1847;
    }
    float _1891 = _1877;
    float _1893 = _1891;
    if (!_1873)
    {
        _1879 = _1851;
    }
    float _1895 = _1879;
    bool _1897 = !_1873;
    float _1899 = _1895;
    float _1901 = _1895;
    if (!_1897)
    {
        float _1903 = _215 * _215;
        float _1905 = fma(_211, _211, _1903);
        float _1907 = fma(_217, _217, _1905);
        float _1909 = rsqrt(_1869);
        float _1911 = sqrt(_1907);
        float _1913 = _1859 * _1909;
        float _1915 = _1855 * _1909;
        float _1917 = _1863 * _1909;
        bool _1919 = _1911 > 0.0;
        float _1921 = _1911;
        if (!_1919)
        {
            _1887 = _1849;
        }
        float _1923 = _1887;
        _1889 = _1923;
        if (!_1919)
        {
            _1921 = _1847;
        }
        float _1925 = _1921;
        _1893 = _1925;
        if (!_1919)
        {
            _1899 = _1851;
        }
        float _1927 = _1899;
        bool _1929 = !_1919;
        _1901 = _1927;
        if (!_1929)
        {
            float _1931 = rsqrt(_1907);
            float _1933 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1935 = _215 * _1931;
            float _1937 = _211 * _1931;
            float _1939 = _1915 * _1935;
            float _1941 = _217 * _1931;
            float _1943 = fma(_1913, _1937, _1939);
            float _1945 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1947 = fma(_1917, _1941, _1943);
            float _1949 = _1947 * _1945;
            float _1951 = fma(_211, _1949, _1849);
            float _1953 = fma(_215, _1949, _1847);
            float _1955 = fma(_217, _1949, _1851);
            _1893 = _1953;
            _1889 = _1951;
            _1901 = _1955;
        }
    }
    float _1957 = _1893;
    float _1959 = _1889;
    float _1961 = _1901;
    float _1963 = -_1379;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1957);
    float _1967 = -_1391;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1959);
    float _1971 = -_1439;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1961);
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1977 = _1965 + _1975;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1981 = _1969 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1985 = _1973 + _1983;
    float _1987 = _1977 * _1977;
    float _1989 = fma(_1981, _1981, _1987);
    float _1991 = fma(_1985, _1985, _1989);
    float _1993 = rsqrt(_1991);
    float _1995 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1997 = _1981 * _1995;
    float _1999 = _1985 * _1995;
    float _2001 = _1997 * _1997;
    float _2003 = _1999 * _1999;
    float _2005 = _2001 + _2003;
    float _2007 = sqrt(_2005);
    bool _2009 = _2007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = _2007 + _2011;
    float _2015 = _1985;
    float _2017 = _2013;
    float _2019 = _1977;
    float _2021 = _1995;
    float _2023 = _1997;
    if (_2009)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2025;
    }
    float _2027 = _2015;
    if (_2009)
    {
        float _2029 = rsqrt(_2005);
        _1881 = _2029;
    }
    float _2031 = _1881;
    float _2033 = _2031;
    if (_2009)
    {
        float _2035 = _2013 * _2027;
        _2017 = _2035;
    }
    float _2037 = _2017;
    if (_2009)
    {
        float _2039 = _2037 * 0.15915493667125701904296875;
        _1883 = _2039;
    }
    float _2041 = _1883;
    float _2043 = _1993;
    if (_2009)
    {
        float _2045 = _2041 * 6.283185482025146484375;
        float _2047 = sin(_2045);
        _2043 = _2047;
    }
    float _2049 = _2043;
    float _2051 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2053 = precise::max(0.0, _2051);
    float _2055 = _1869;
    float _2057 = _2051;
    if (_2009)
    {
        float _2059 = _2041 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        _2055 = _2061;
    }
    float _2063 = _2055;
    float _2065 = -_1995;
    float _2067 = -_2053;
    float _2069 = fma(_1977, _2065, _2067);
    float _2071 = _2069;
    if (_2009)
    {
        float _2073 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2057 = _2073;
    }
    float _2075 = _2057;
    float _2077 = sqrt(_1991);
    float _2079 = _2049;
    float _2081 = _2075;
    if (_2009)
    {
        float _2083 = fma(_2049, _2075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2019 = _2083;
    }
    float _2085 = _2019;
    float _2087 = _2085;
    if (!_2009)
    {
        _2079 = _1999;
    }
    float _2089 = _2079;
    float _2091 = _2089;
    if (_2009)
    {
        float _2093 = _2063 + (-1.0);
        _2081 = _2093;
    }
    float _2095 = _2081;
    float _2097 = _2095;
    if (_2009)
    {
        float _2099 = _2031 * _2085;
        _2021 = _2099;
    }
    float _2101 = _2021;
    if (!_2009)
    {
        _2033 = _2069;
    }
    float _2103 = _2033;
    float _2105 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2107 = _2103;
    if (_2009)
    {
        float _2109 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2087 = _2109;
    }
    float _2111 = _2087;
    if (_2009)
    {
        float _2113 = _1997 * _2101;
        _2023 = _2113;
    }
    float _2115 = _2023;
    if (!_2009)
    {
        _2097 = _2001;
    }
    float _2117 = _2097;
    float _2119 = _2117;
    if (_2009)
    {
        float _2121 = _1999 * _2101;
        _2091 = _2121;
    }
    float _2123 = _2091;
    if (_2009)
    {
        float _2125 = fma(_2069, _2063, _2111);
        _2107 = _2125;
    }
    float _2127 = _2107;
    if (_2009)
    {
        float _2129 = _2115 * _2115;
        _2119 = _2129;
    }
    float _2131 = _2119;
    if (!_2009)
    {
        _2071 = _2003;
    }
    float _2133 = _2071;
    float _2135 = _2133;
    if (_2009)
    {
        float _2137 = _2123 * _2123;
        _2135 = _2137;
    }
    float _2139 = _2135;
    float _2141 = fma(_2127, _2127, _2131);
    float _2143 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2145 = _2141 + _2139;
    float _2147 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2151 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2149);
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2157 = rsqrt(_2145);
    float _2159 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2147);
    float _2161 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2163 = -_2153;
    float _2165 = _2163 + 1.0;
    float _2167 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2159);
    float _2169 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2171 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2173 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2175 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2169);
    float _2177 = abs(_2165);
    float _2179 = log2(_2177);
    float _2181 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2171);
    float _2183 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2185 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2175);
    float _2187 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2189 = _2157 * _2115;
    float _2191 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = _2157 * _2127;
    float _2195 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2197 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2199 = -_2183;
    float _2201 = fma(_2199, _2155, 1.0);
    float _2203 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2143);
    float _2205 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2195);
    float _2207 = _2157 * _2123;
    float _2209 = -_2197;
    float _2211 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2209);
    float _2213 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2215 = _2203 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2217 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2205);
    float _2219 = -_2207;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2211);
    float _2223 = exp2(_2213);
    float _2225 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2227 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2217);
    float _2229 = fma(_2221, -0.5, 0.5);
    float _2231 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2233 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2225);
    float _2235 = fma(_2221, 0.5, 0.5);
    float _2237 = _2193 + 1.0;
    float _2239 = log2(_2201);
    float _2241 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2231);
    float _2243 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2233);
    float _2245 = fma(_2235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2247 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2241);
    float _2249 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2243);
    float _2251 = 1.0 / _2227;
    float _2253 = -_2193;
    float _2255 = fma(_2223, _2237, _2253);
    float _2257 = fma(_2235, _2245, -0.212114393711090087890625);
    float _2259 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2247);
    float _2261 = fma(_2255, 0.5, 0.5);
    float _2263 = fma(_2235, _2257, 1.570728778839111328125);
    float _2265 = sqrt(_2229);
    float _2267 = _2239 * 0.693147182464599609375;
    float _2269 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2271 = _2249 * _2251;
    float _2273 = _2259 * _2251;
    float _2275 = fma(_2271, 0.5, 0.5);
    float _2277 = fma(_2273, -0.5, 0.5);
    float _2279 = _2265 * 0.636619746685028076171875;
    float3 _5936 = float3(_2275, _2277, _2269);
    float _2281 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5936, float3(0.0), isnan(_5936)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5936, float3(0.0), isnan(_5936)), level(0.0)).x;
    float3 _5947 = float3(_2275, _2277, _2269);
    float4 _2284 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).xyzw;
    float _2286 = _2284.x;
    float _2288 = _2284.y;
    float _2290 = _2284.z;
    float _2292 = _2284.w;
    float _2294 = -_2263;
    float _2296 = fma(_2279, _2294, 1.0);
    float2 _5969 = float2(_2296, _2261);
    float3 _2300 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5969, float2(0.0), isnan(_5969)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5969, float2(0.0), isnan(_5969)), level(0.0)).xyz;
    float _2302 = _2300.x;
    float _2304 = _2300.y;
    float _2306 = _2300.z;
    float _2308 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2310 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2312 = _2227 * 0.5;
    out.m_78.x = _1969;
    out.m_78.y = _1965;
    out.m_78.z = _1973;
    float _2314 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2310);
    float _2316 = exp2(_2308);
    float _2318 = fma(_2259, -0.5, _2312);
    float _2320 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2314);
    float _2322 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2320);
    float _2324 = _2249 + _2227;
    float _2326 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2328 = _2322 + _2227;
    float _2330 = _2324 * 0.5;
    out.gl_Position.x = _2249;
    out.gl_Position.y = _2259;
    out.gl_Position.z = _2322;
    out.gl_Position.w = _2227;
    float _2332 = _2328 * 0.5;
    float _2334 = -_2316;
    float _2336 = _2334 + 1.0;
    out.m_47.x = _2326;
    float _2338 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2330;
    out.m_80.y = _2318;
    out.m_80.z = _2332;
    out.m_80.w = _2227;
    float _2340 = -_2338;
    float _2342 = _2340 + 1.0;
    float _2344 = _2338 * _2281;
    float _2346 = _2292 * _2344;
    float _2348 = _2292 * _2342;
    float _2350 = _2306 * _2344;
    float _2352 = fma(_2302, _2346, _2286);
    float _2354 = fma(_2304, _2346, _2288);
    float _2356 = fma(_2292, _2350, _2290);
    out.m_82.x = _2352;
    out.m_82.y = _2354;
    out.m_82.z = _2356;
    out.m_82.w = _2348;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1803 = false;
    bool _717 = false;
    bool _543 = false;
    bool _427 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _96 = in.m_44.w;
    float _98 = trunc(_96);
    int _101 = int(_98);
    bool _105 = _101 >= 1;
    float _107 = 0.0;
    if (!_105)
    {
        _107 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _109 = _107;
    if (!_105)
    {
        out.m_47.x = 0.0;
    }
    int _111 = 0;
    if (!_105)
    {
        float _113 = _109 * 5.0;
        _111 = as_type<int>(_113);
    }
    int _115 = _111;
    int _117 = _115;
    if (!_105)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2412 = as_type<float>(_115);
        out.gl_Position.z = _2412;
    }
    if (!_105)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _119 = in.m_49.w;
    float _121 = float(_101);
    float _123 = 1.0 / _121;
    float _125 = -_119;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _131 = isnan(_119);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _137 = _133 || _135;
    float _139 = _127 * _123;
    bool _141 = _127 >= _121;
    bool _143 = !_137;
    bool _145 = _141 || _143;
    out.m_51.x = _139;
    float _147 = _119;
    float _149 = _127;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _147;
    if (_145)
    {
        out.m_47.x = 0.0;
    }
    if (_145)
    {
        float _153 = _151 * 5.0;
        _117 = as_type<int>(_153);
    }
    int _155 = _117;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2484 = as_type<float>(_155);
        out.gl_Position.z = _2484;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = in.m_56.x;
    float _161 = in.m_56.y;
    float _163 = in.m_56.z;
    float _165 = in.m_58.x;
    float _167 = in.m_58.y;
    float _169 = in.m_58.z;
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = in.m_62.x;
    float _179 = in.m_62.y;
    float _181 = in.m_62.z;
    int _183 = as_type<int>(_157) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_157) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _193 = !_185;
    float _195 = _193 ? (-0.5) : 0.5;
    bool _197 = !_189;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = _161 * _167;
    float _203 = _161 * _173;
    float _205 = fma(_159, _165, _201);
    float _207 = _161 * _179;
    float _209 = fma(_159, _171, _203);
    float _211 = fma(_163, _169, _205);
    float _213 = fma(_159, _177, _207);
    float _215 = fma(_163, _175, _209);
    float _217 = fma(_163, _181, _213);
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_64.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        _237 = _139;
    }
    _239 = false;
    float _241 = _237;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    bool _251 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _253 = isnan(_241);
    bool _255 = _251 || _253;
    bool _257 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _259 = _255 || _257;
    float _261 = float(_259);
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _267 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _241 + _275;
    float _279 = 1.0 / _269;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _283 = 1.0 / _265;
    float _285 = 1.0 / _273;
    float _287 = _277 * _279;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _245 * _283;
    bool _303 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_241);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_261;
    float _317 = _315 + 1.0;
    float _319 = _313 * _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _325 = _249 * _285;
    bool _327 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _329 = isnan(_241);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_313;
    float _341 = _339 + 1.0;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _353 = _351 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _355 = _337 * _341;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = fma(_345, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_349, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _365 = fma(_323, _287, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _367 = _299 * _359;
    float _369 = fma(_353, _287, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_299;
    float _373 = _371 + 1.0;
    float _375 = _361 * _367;
    float _377 = _363 * _367;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _383;
    float _387 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _325, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_385, _325, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _395 = fma(_365, _355, _387);
    float _397 = fma(_369, _355, _389);
    float _399 = fma(_391, _319, _395);
    float _401 = fma(_393, _319, _397);
    float _403 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_281;
    float _425;
    if (!_407)
    {
        float _409 = in.m_64.x;
        float _411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _413 = _409 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _415 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[11].x, _127);
        float _417 = _415 * _411;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _423;
        _427 = true;
    }
    else
    {
        _425 = _139;
    }
    _427 = false;
    float _429 = _425;
    float _431 = in.m_66.x;
    float _433 = in.m_66.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _437 = _429 + _435;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _439;
    bool _443 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _445 = 1.0 / _441;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _447;
    float _451 = _405 * _433;
    float _453 = _437 * _445;
    bool _455 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _457 = isnan(_429);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = _403 * _431;
    bool _469 = _429 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _471 = isnan(_429);
    bool _473 = _469 || _471;
    bool _475 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _477 = _473 || _475;
    float _479 = float(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _485;
    float _489 = -_465;
    float _491 = _489 + 1.0;
    float _493 = fma(_449, _453, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _495 = fma(_483, _453, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _497 = fma(_487, _453, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _499 = _479 * _491;
    float _501 = -_479;
    float _503 = _501 + 1.0;
    float _505 = _495 * _499;
    float _507 = _497 * _499;
    float _509 = _493 * _499;
    float _511 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].x, _505);
    float _513 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].y, _507);
    float _515 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[107].z, _509);
    float _517 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].x, _511);
    float _519 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].y, _513);
    float _521 = fma(_465, (*spvDescriptorSet0.vp_c9)._m0[108].z, _515);
    bool _523 = !_443;
    float _541;
    if (!_523)
    {
        float _525 = in.m_64.x;
        float _527 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _529 = _525 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _531 = fma(_529, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _533 = _531 * _527;
        float _535 = floor(_533);
        float _537 = -_535;
        float _539 = _533 + _537;
        _541 = _539;
        _543 = true;
    }
    else
    {
        _541 = _139;
    }
    _543 = false;
    float _545 = _541;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _549 = _545 + _547;
    float _551 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _561 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _563 = isnan(_545);
    bool _565 = _561 || _563;
    bool _567 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _569 = _565 || _567;
    float _571 = float(_569);
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _577 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _579 = isnan(_545);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    float _589 = 1.0 / _555;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _591;
    float _595 = -_571;
    float _597 = _595 + 1.0;
    bool _599 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _601 = isnan(_545);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _613 = _521 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _615 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _617 = 1.0 / _559;
    float _619 = 1.0 / _575;
    float _621 = _593 * _589;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _627 = _587 * _597;
    float _629 = -_587;
    float _631 = _629 + 1.0;
    float _633 = fma(_621, _549, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _635;
    float _639 = _609 * _631;
    float _641 = _625 * _617;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _645 = _545 + _643;
    bool _647 = _545 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _649 = isnan(_545);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = _633 * _639;
    float _661 = -_609;
    float _663 = _661 + 1.0;
    float _665 = fma(_641, _645, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _669 = _545 + _667;
    float _671 = _637 * _619;
    float _673 = -_657;
    float _675 = _673 + 1.0;
    float _677 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _659);
    float _679 = _551 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _681 = fma(_671, _669, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _683 = _571 * _675;
    float _685 = fma(_665, _627, _677);
    float _687 = _611 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _613 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _691 = fma(_681, _683, _685);
    float _693 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[118].x, _691);
    float _695 = _693 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_68.x = _679;
    out.m_68.y = _687;
    out.m_68.z = _689;
    out.m_68.w = _695;
    bool _697 = !_615;
    float _715;
    if (!_697)
    {
        float _699 = in.m_64.x;
        float _701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _703 = _699 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[11].w, _127);
        float _707 = _705 * _701;
        float _709 = floor(_707);
        float _711 = -_709;
        float _713 = _707 + _711;
        _715 = _713;
        _717 = true;
    }
    else
    {
        _715 = _139;
    }
    _717 = false;
    float _719 = _715;
    float _721 = in.m_64.x;
    float _723 = in.m_64.y;
    float _725 = in.m_64.z;
    float _727 = in.m_64.w;
    float _729 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _731 = in.m_44.x;
    float _733 = in.m_44.y;
    float _735 = in.m_44.z;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _739 = _737 != 0;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _743 = _719 + _741;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _747 = _745 != 0;
    int _749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _751 = _749 != 0;
    float _753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _757 = _755 != 0;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _761 = _729 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _763 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _767 = _723 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _769 = _727 > 0.5;
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _773 = _721 > 0.5;
    float _775 = _167 * _733;
    float _777 = -_199;
    int _779 = _769 ? as_type<int>(_777) : as_type<int>(_199);
    float _781 = _179 * _733;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _789 = _787 != 0;
    float _791 = fma(_767, -2.0, _759);
    float _793 = fma(_177, _731, _781);
    float _795 = -_195;
    int _797 = _773 ? as_type<int>(_795) : as_type<int>(_195);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _803 = _801 != 0;
    float _805 = _173 * _733;
    float _807 = fma(_165, _731, _775);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _813 = fma(_171, _731, _805);
    float _815 = _721 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _817 = 1.0 / _811;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _827 = fma(_169, _735, _807);
    float _829 = _725 * 2.0;
    float _831 = _723 + _725;
    float _833 = fma(_181, _735, _793);
    float _835 = 1.0 / _825;
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _837;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _843 = fma(_175, _735, _813);
    float _845 = _831 + (-1.0);
    float _847 = -_841;
    float _849 = fma(_815, 2.0, _847);
    bool _851 = !_739;
    float _853 = _851 ? _195 : as_type<float>(_797);
    float _855 = 1.0 / _821;
    float _857 = _839 * _817;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _863 = _721 * 2.0;
    bool _865 = _723 > 0.5;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _867;
    float _871 = floor(_829);
    float _873 = _861 * _835;
    float _875 = fma(_845, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _877 = _723 * 2.0;
    float _879 = -_127;
    float _881 = fma(_879, (*spvDescriptorSet0.vp_c9)._m0[76].x, _849);
    float _883 = _853 + 0.5;
    bool _885 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _887 = isnan(_719);
    bool _889 = _885 || _887;
    bool _891 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _893 = _889 || _891;
    float _895 = float(_893);
    float _897 = _843 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _899 = _869 * _855;
    float _901 = -_199;
    int _903 = _865 ? as_type<int>(_901) : as_type<int>(_199);
    float _905 = floor(_863);
    float _907 = -_195;
    int _909 = _865 ? as_type<int>(_907) : as_type<int>(_195);
    float _911 = _723 + _721;
    bool _913 = _725 > 0.5;
    float _915 = fma(_761, _883, _881);
    bool _917 = !_747;
    float _919 = _917 ? _199 : as_type<float>(_903);
    float _921 = _911 + (-1.0);
    float _923 = -_199;
    int _925 = _913 ? as_type<int>(_923) : as_type<int>(_199);
    float _927 = floor(_877);
    bool _929 = !_785;
    float _931 = _929 ? _195 : as_type<float>(_909);
    float _933 = fma(_921, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _935 = !_789;
    float _937 = _935 ? _199 : as_type<float>(_925);
    float _939 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _941 = _719 + _939;
    bool _943 = _871 > 0.0;
    float _945 = _919 + (-0.5);
    bool _947 = _871 >= 0.0;
    bool _949 = isnan(_871);
    bool _951 = _947 || _949;
    bool _953 = isnan(0.0);
    bool _955 = _951 || _953;
    float _957 = fma(_857, _941, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _959 = _877;
    float _961 = _871;
    if (!_803)
    {
        _959 = _725;
    }
    float _963 = _959;
    float _965 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _967 = _719 + _965;
    float _969 = _963;
    if (_803)
    {
        _969 = _723;
    }
    float _971 = _969;
    float _973 = fma(_899, _743, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _975 = -_195;
    int _977 = _913 ? as_type<int>(_975) : as_type<int>(_195);
    float _979 = fma(_873, _967, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _981 = _905 > 0.0;
    float _983 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[83].w, _765);
    bool _985 = _905 >= 0.0;
    bool _987 = isnan(_905);
    bool _989 = _985 || _987;
    bool _991 = isnan(0.0);
    bool _993 = _989 || _991;
    float _995 = -_895;
    float _997 = _995 + 1.0;
    float _999 = _905;
    if (!_803)
    {
        _961 = _723;
    }
    float _1001 = _961;
    float _1003 = _931 + 0.5;
    float _1005 = _1001;
    if (!_803)
    {
        _999 = _725;
    }
    float _1007 = _999;
    float _1009 = _827 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1011 = _955 ? 0 : 1;
    float _1013 = _833 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1015 = _1007;
    if (_803)
    {
        _1005 = _721;
    }
    float _1017 = _1005;
    float _1019 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _983);
    if (_803)
    {
        _1015 = _723;
    }
    float _1021 = _1015;
    bool _1023 = _927 >= 0.0;
    bool _1025 = isnan(_927);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan(0.0);
    bool _1031 = _1027 || _1029;
    float _1033 = -_1019;
    float _1035 = _1033 + 1.0;
    bool _1037 = _927 > 0.0;
    float _1039 = _1021 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1041 = ~_1011;
    int _1043 = _1041 + 1;
    int _1045 = _1043 + 1;
    int _1047 = _1045;
    if (!_943)
    {
        int _1049 = ~_1011;
        int _1051 = _1049 + 1;
        _1047 = _1051;
    }
    int _1053 = _1047;
    int _1055 = _993 ? 0 : 1;
    float _1057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1059 = _1031 ? 0 : 1;
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1063 = _1061 != 0;
    int _1065 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1067 = _1065 != 0;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1071 = _1069 != 0;
    bool _1073 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1075 = isnan(_719);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1081 = _1077 || _1079;
    float _1083 = float(_1081);
    bool _1085 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1087 = isnan(_719);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1093 = _1089 || _1091;
    float _1095 = float(_1093);
    bool _1097 = _719 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1099 = isnan(_719);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = -_1083;
    float _1111 = _1109 + 1.0;
    bool _1113 = !_751;
    float _1115 = _1113 ? _199 : as_type<float>(_779);
    float _1117 = _1107 * _997;
    float _1119 = -_1107;
    float _1121 = _1119 + 1.0;
    float _1123 = _753 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1125 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _791);
    float _1127 = fma(_1017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _771);
    float _1129 = _1017 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1131 = _895 * _1111;
    float _1133 = -_1123;
    float _1135 = -_1125;
    float _1137 = fma(_1133, _945, _1135);
    float _1139 = _1095 * _1121;
    float _1141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1143 = -_1095;
    float _1145 = _1143 + 1.0;
    float _1147 = -_799;
    float _1149 = fma(_1129, 2.0, _1147);
    float _1151 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1153 = _957 * _1139;
    float _1155 = _1057 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1157 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1127);
    float _1159 = fma(_1039, -2.0, _1151);
    float _1161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1163 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1153);
    bool _1165 = !_757;
    float _1167 = _1165 ? _195 : as_type<float>(_977);
    float _1169 = -_937;
    float _1171 = _1169 + 0.5;
    float _1173 = _1115 + (-0.5);
    float _1175 = fma(_979, _1117, _1163);
    float _1177 = -_127;
    float _1179 = fma(_1177, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1149);
    float _1181 = _1167 + 0.5;
    float _1183 = _1141 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1185 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1159);
    float _1187 = _1003 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1189 = fma(_1155, _1181, _1179);
    float _1191 = fma(_973, _1131, _1175);
    float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1195 = _897 + _1193;
    float _1197 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1199 = log2(_1197);
    float _1201 = -_1183;
    float _1203 = -_1185;
    float _1205 = fma(_1201, _1173, _1203);
    float _1207 = _1187 * _1161;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1211 = _1009 + _1209;
    float _1213 = _1195 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1215 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1217 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1219 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1221 = _1013 + _1219;
    float _1223 = fma(_1211, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1213);
    float _1225 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1227 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1215);
    float _1229 = _1217 * _763;
    float _1231 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1223);
    float _1233 = fma(_723, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1225);
    float _1235 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1227);
    float _1237 = _1199 * _127;
    float _1239 = fma(_1115, _1035, _1205);
    float _1241 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1233);
    float _1243 = -_1235;
    float _1245 = _1243 + 1.0;
    float _1247 = _1195 * _1195;
    float _1249 = -_1157;
    float _1251 = _1249 + 1.0;
    float _1253 = -_1241;
    float _1255 = _1253 + 1.0;
    float _1257 = -_1245;
    float _1259 = fma(_853, _1257, _915);
    float _1261 = exp2(_1237);
    float _1263 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1191);
    float _1265 = fma(_919, _1255, _1137);
    float _1267 = fma(_1211, _1211, _1247);
    int _1269 = ~_1055;
    int _1271 = _1269 + 1;
    int _1273 = _1271 + 1;
    float _1275 = -_1251;
    float _1277 = fma(_1167, _1275, _1189);
    int _1279 = _1273;
    int _1281 = as_type<int>(_1195);
    if (!_981)
    {
        int _1283 = ~_1055;
        int _1285 = _1283 + 1;
        _1279 = _1285;
    }
    int _1287 = _1279;
    out.m_70.x = _1207;
    out.m_70.y = _1229;
    bool _1289 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1291 = isnan(1.0);
    bool _1293 = _1289 || _1291;
    bool _1295 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1297 = _1293 || _1295;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1301 = 1.0 + _1299;
    bool _1303 = !_1067;
    int _1305 = _1303 ? 0 : 1;
    float _1307 = in.m_72.x;
    float _1309 = in.m_72.y;
    float _1311 = in.m_72.z;
    bool _1313 = _1231 >= 0.0;
    float _1315 = fma(_1221, _1221, _1267);
    int _1317 = ~_1059;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    float _1323 = -_1261;
    float _1325 = _1323 + 1.0;
    int _1327 = _1321;
    if (!_1037)
    {
        int _1329 = ~_1059;
        int _1331 = _1329 + 1;
        _1327 = _1331;
    }
    int _1333 = _1327;
    out.m_74.x = _1259;
    out.m_74.y = _1265;
    out.m_74.z = _1277;
    out.m_74.w = _1239;
    float _1335 = 1.0 / _1301;
    int _1337 = abs(_1305);
    bool _1339 = !_1063;
    int _1341 = _1339 ? 0 : 1;
    bool _1343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1345 = isnan(0.0);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1351 = _1347 || _1349;
    float _1353 = float(_1053);
    float _1355 = rsqrt(_1315);
    int _1357 = abs(_1341);
    float _1359 = _1263 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1361 = float(_1287);
    if (_1313)
    {
        out.m_47.x = 0.0;
    }
    float _1363 = float(_1357);
    float _1365 = _1351 ? _1325 : 0.0;
    float _1367 = float(_1337);
    float _1369 = _1363 * _1353;
    float _1371 = _1335;
    if (_1297)
    {
        float _1373 = _1365 * _1335;
        _149 = _1373;
    }
    float _1375 = _149;
    float _1377 = _1367 * _1361;
    float _1379 = _1195 * _1355;
    if (_1313)
    {
        _1371 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1381 = _1371;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1385 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1387 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1389 = _1369 * (-2.0);
    float _1391 = _1211 * _1355;
    float _1393 = -_1379;
    float _1395 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1195);
    float _1397 = _1383 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1399 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1401 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_1313)
    {
        float _1403 = _1381 * 5.0;
        _1281 = as_type<int>(_1403);
    }
    int _1405 = _1281;
    float _1407 = -_1391;
    float _1409 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1211);
    float _1411 = _1395 * _1395;
    float _1413 = _721 + (-0.5);
    float _1415 = fma(_1389, _1307, _1307);
    out.m_76.x = _1397;
    out.m_76.y = _1399;
    out.m_76.z = _1401;
    out.m_76.w = _1359;
    float _1417 = fma(_1409, _1409, _1411);
    float _1419 = fma(_933, _1389, _933);
    float _1421 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1415);
    float _1423 = _1311;
    if (_1313)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4521 = as_type<float>(_1405);
        out.gl_Position.z = _4521;
    }
    bool _1425 = !_1071;
    int _1427 = _1425 ? 0 : 1;
    if (_1313)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1429 = -_1379;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c9)._m0[18].w, _897);
    float _1433 = _1377 * (-2.0);
    float _1435 = -_1391;
    float _1437 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1009);
    float _1439 = _1221 * _1355;
    float _1441 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1443 = _1431 + _1441;
    float _1445 = fma(_875, _1433, _875);
    float _1447 = fma(_1433, _1309, _1309);
    int _1449 = abs(_1427);
    float _1451 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1453 = _1437 + _1451;
    float _1455 = _1443 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1457 = float(_1333);
    float _1459 = fma(_1419, _1375, _1421);
    float _1461 = float(_1449);
    float _1463 = _723 + (-0.5);
    float _1465 = -_1439;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1013);
    float _1469 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1455);
    float _1471 = _725 + _721;
    float _1473 = _1459 * 0.15915493667125701904296875;
    float _1475 = _1461 * _1457;
    float _1477 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1479 = _1467 + _1477;
    float _1481 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1447);
    float _1483 = _1471 + (-1.0);
    float _1485 = _1475 * (-2.0);
    float _1487 = fma(_1479, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1469);
    float _1489 = _725 + (-0.5);
    float _1491 = fma(_1483, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1493 = fma(_1485, _1311, _1311);
    float _1495 = -_1439;
    float _1497 = fma(_1495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1221);
    bool _1499 = _1487 >= 0.0;
    float _1501 = fma(_1491, _1485, _1491);
    float _1503 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1493);
    float _1505 = fma(_1497, _1497, _1417);
    float _1507 = fma(_1445, _1375, _1481);
    float _1509 = _1473 * 6.283185482025146484375;
    float _1511 = sin(_1509);
    float _1513 = fma(_1501, _1375, _1503);
    float _1515 = _1507 * 0.15915493667125701904296875;
    float _1517 = _1513 * 0.15915493667125701904296875;
    float _1519 = sqrt(_1505);
    int _1521 = as_type<int>(_1503);
    if (_1499)
    {
        _1423 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1523 = _1423;
    if (_1499)
    {
        out.m_47.x = 0.0;
    }
    if (_1499)
    {
        float _1525 = _1523 * 5.0;
        _1521 = as_type<int>(_1525);
    }
    int _1527 = _1521;
    float _1529 = _1473 * 6.283185482025146484375;
    float _1531 = cos(_1529);
    if (_1499)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4709 = as_type<float>(_1527);
        out.gl_Position.z = _4709;
    }
    float _1533 = _1515 * 6.283185482025146484375;
    float _1535 = sin(_1533);
    float _1537 = _1355 * _1519;
    float _1539 = _1515 * 6.283185482025146484375;
    float _1541 = cos(_1539);
    float _1543 = _1517 * 6.283185482025146484375;
    float _1545 = sin(_1543);
    if (_1499)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1547 = _1517 * 6.283185482025146484375;
    float _1549 = cos(_1547);
    float _1551 = _451 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1555 = _467 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1557 = _1511 * _1535;
    float _1559 = _1537 * _1551;
    float _1561 = _1531 * _1541;
    float _1563 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1565 = _1537 * _1555;
    float _1567 = _1553 * _1559;
    float _1569 = _1531 * _1535;
    float _1571 = fma(_1545, _1561, _1557);
    float _1573 = _1563 * _1565;
    float _1575 = fma(_1545, _1557, _1561);
    float _1577 = _1549 * _1567;
    float _1579 = _1535 * _1549;
    float _1581 = _1541 * _1549;
    float _1583 = _1511 * _1541;
    float _1585 = _1531 * _1577;
    float _1587 = -_1567;
    float _1589 = _1545 * _1587;
    float _1591 = _1511 * _1577;
    float _1593 = fma(_1571, _1573, _1585);
    float _1595 = _1537 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1597 = _1595 * 0.5;
    float _1599 = -_1583;
    float _1601 = fma(_1545, _1569, _1599);
    float _1603 = -_1569;
    float _1605 = fma(_1545, _1583, _1603);
    float _1607 = fma(_1581, _1573, _1589);
    float _1609 = fma(_1601, _1597, _1593);
    float _1611 = fma(_1605, _1573, _1591);
    float _1613 = fma(_1579, _1597, _1607);
    float _1615 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1617 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1619 = fma(_1575, _1597, _1611);
    float _1621 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1615);
    float _1623 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1617);
    float _1625 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1621);
    float _1627 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1623);
    float _1629 = _1625 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1631 = _1627 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1633 = _1009 + _1629;
    float _1635 = _1013 + _1631;
    float _1637 = _1609 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1639 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1641 = _1633 + _1639;
    float _1643 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1645 = _1635 + _1643;
    float _1647 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1637);
    float _1649 = _1641 * _1641;
    float _1651 = _1645 * _1645;
    float _1653 = fma(_1619, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1647);
    float _1655 = _1649 + _1651;
    float _1657 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1659 = sqrt(_1655);
    float _1661 = _897 + _1657;
    bool _1663 = _1659 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1665 = _1637;
    float _1667 = _1619;
    float _1669 = _1635;
    float _1671 = _1649;
    float _1673 = _1651;
    if (!_1663)
    {
        _1665 = _1635;
    }
    float _1675 = _1665;
    float _1677 = _1675;
    if (!_1663)
    {
        _1667 = _1633;
    }
    float _1679 = _1667;
    float _1681 = _1679;
    if (!_1663)
    {
        _1669 = _1661;
    }
    float _1683 = _1669;
    bool _1685 = !_1663;
    float _1687 = _1683;
    if (!_1685)
    {
        float _1689 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1693 = _1659 + _1691;
        float _1695 = _1661 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1697 = rsqrt(_1655);
        float _1699 = _1693 * _1689;
        float _1701 = _1699 * 0.15915493667125701904296875;
        float _1703 = _1701 * 6.283185482025146484375;
        float _1705 = sin(_1703);
        float _1707 = _1701 * 6.283185482025146484375;
        float _1709 = cos(_1707);
        float _1711 = fma(_1705, _1695, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1713 = _1697 * _1711;
        float _1715 = _1709 + (-1.0);
        float _1717 = fma(_1641, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1719 = fma(_1645, _1713, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1721 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1723 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1725 = _1717 + _1723;
        float _1727 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1729 = _1719 + _1727;
        float _1731 = fma(_1661, _1709, _1721);
        float _1733 = _1725 * _1725;
        float _1735 = _1729 * _1729;
        _1687 = _1731;
        _1671 = _1733;
        _1673 = _1735;
        _1681 = _1717;
        _1677 = _1719;
    }
    float _1737 = _1687;
    float _1739 = _1671;
    float _1741 = _1673;
    float _1743 = _1681;
    float _1745 = _1677;
    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1749 = _1737 + _1747;
    float _1751 = fma(_1749, _1749, _1739);
    float _1753 = _1751 + _1741;
    float _1755 = sqrt(_1753);
    bool _1757 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1759 = isnan(_1755);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1765 = _1761 || _1763;
    float _1767 = _1751;
    if (!_1765)
    {
        _1767 = 1.0;
    }
    float _1769 = _1767;
    bool _1771 = !_1765;
    float _1773 = _1769;
    if (!_1771)
    {
        bool _1775 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1777 = isnan(_1755);
        bool _1779 = _1775 || _1777;
        bool _1781 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1783 = _1779 || _1781;
        if (!_1783)
        {
            float _1785 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1787 = _1755 + _1785;
            float _1789 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1791 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1789;
            float _1793 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1795 = _1793 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1797 = 1.0 / _1791;
            float _1799 = _1787 * _1797;
            float _1801 = fma(_1799, _1795, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1773 = _1801;
            _1803 = true;
        }
        else
        {
            bool _1805 = _1755 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1807 = isnan(_1755);
            bool _1809 = _1805 || _1807;
            bool _1811 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1813 = _1809 || _1811;
            if (!_1813)
            {
                float _1815 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1817 = _1755 + _1815;
                float _1819 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1821 = _1819 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1823 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1825 = _1823 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1827 = 1.0 / _1821;
                float _1829 = _1817 * _1827;
                float _1831 = fma(_1829, _1825, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1773 = _1831;
                _1803 = true;
            }
            else
            {
                _1773 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1803 = false;
    float _1833 = _1773;
    float _1835 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1837 = _1737 + _1835;
    float _1839 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1841 = _1743 + _1839;
    float _1843 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1845 = _1745 + _1843;
    float _1847 = fma(_1837, _1833, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1849 = fma(_1841, _1833, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1851 = fma(_1845, _1833, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1853 = -_897;
    float _1855 = _1853 + _1847;
    float _1857 = -_1009;
    float _1859 = _1857 + _1849;
    float _1861 = -_1013;
    float _1863 = _1861 + _1851;
    float _1865 = _1855 * _1855;
    float _1867 = fma(_1859, _1859, _1865);
    float _1869 = fma(_1863, _1863, _1867);
    float _1871 = sqrt(_1869);
    bool _1873 = _1871 > 0.0;
    float _1875 = _1837;
    float _1877 = _1845;
    float _1879 = _1841;
    float _1881 = _1851;
    float _1883 = _1859;
    if (!_1873)
    {
        _1875 = _1849;
    }
    float _1885 = _1875;
    float _1887 = _1885;
    float _1889 = _1885;
    if (!_1873)
    {
        _1877 = _1847;
    }
    float _1891 = _1877;
    float _1893 = _1891;
    if (!_1873)
    {
        _1879 = _1851;
    }
    float _1895 = _1879;
    bool _1897 = !_1873;
    float _1899 = _1895;
    float _1901 = _1895;
    if (!_1897)
    {
        float _1903 = _215 * _215;
        float _1905 = fma(_211, _211, _1903);
        float _1907 = fma(_217, _217, _1905);
        float _1909 = rsqrt(_1869);
        float _1911 = sqrt(_1907);
        float _1913 = _1859 * _1909;
        float _1915 = _1855 * _1909;
        float _1917 = _1863 * _1909;
        bool _1919 = _1911 > 0.0;
        float _1921 = _1911;
        if (!_1919)
        {
            _1887 = _1849;
        }
        float _1923 = _1887;
        _1889 = _1923;
        if (!_1919)
        {
            _1921 = _1847;
        }
        float _1925 = _1921;
        _1893 = _1925;
        if (!_1919)
        {
            _1899 = _1851;
        }
        float _1927 = _1899;
        bool _1929 = !_1919;
        _1901 = _1927;
        if (!_1929)
        {
            float _1931 = rsqrt(_1907);
            float _1933 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1935 = _215 * _1931;
            float _1937 = _211 * _1931;
            float _1939 = _1915 * _1935;
            float _1941 = _217 * _1931;
            float _1943 = fma(_1913, _1937, _1939);
            float _1945 = _1933 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1947 = fma(_1917, _1941, _1943);
            float _1949 = _1947 * _1945;
            float _1951 = fma(_211, _1949, _1849);
            float _1953 = fma(_215, _1949, _1847);
            float _1955 = fma(_217, _1949, _1851);
            _1893 = _1953;
            _1889 = _1951;
            _1901 = _1955;
        }
    }
    float _1957 = _1893;
    float _1959 = _1889;
    float _1961 = _1901;
    float _1963 = -_1379;
    float _1965 = fma(_1963, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1957);
    float _1967 = -_1391;
    float _1969 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1959);
    float _1971 = -_1439;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1961);
    float _1975 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1977 = _1965 + _1975;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1981 = _1969 + _1979;
    float _1983 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1985 = _1973 + _1983;
    float _1987 = _1977 * _1977;
    float _1989 = fma(_1981, _1981, _1987);
    float _1991 = fma(_1985, _1985, _1989);
    float _1993 = rsqrt(_1991);
    float _1995 = _1993 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1997 = _1981 * _1995;
    float _1999 = _1985 * _1995;
    float _2001 = _1997 * _1997;
    float _2003 = _1999 * _1999;
    float _2005 = _2001 + _2003;
    float _2007 = sqrt(_2005);
    bool _2009 = _2007 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2011 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2013 = _2007 + _2011;
    float _2015 = _1985;
    float _2017 = _2013;
    float _2019 = _1977;
    float _2021 = _1995;
    float _2023 = _1997;
    if (_2009)
    {
        float _2025 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2025;
    }
    float _2027 = _2015;
    if (_2009)
    {
        float _2029 = rsqrt(_2005);
        _1881 = _2029;
    }
    float _2031 = _1881;
    float _2033 = _2031;
    if (_2009)
    {
        float _2035 = _2013 * _2027;
        _2017 = _2035;
    }
    float _2037 = _2017;
    if (_2009)
    {
        float _2039 = _2037 * 0.15915493667125701904296875;
        _1883 = _2039;
    }
    float _2041 = _1883;
    float _2043 = _1993;
    if (_2009)
    {
        float _2045 = _2041 * 6.283185482025146484375;
        float _2047 = sin(_2045);
        _2043 = _2047;
    }
    float _2049 = _2043;
    float _2051 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2053 = precise::max(0.0, _2051);
    float _2055 = _1869;
    float _2057 = _2051;
    if (_2009)
    {
        float _2059 = _2041 * 6.283185482025146484375;
        float _2061 = cos(_2059);
        _2055 = _2061;
    }
    float _2063 = _2055;
    float _2065 = -_1995;
    float _2067 = -_2053;
    float _2069 = fma(_1977, _2065, _2067);
    float _2071 = _2069;
    if (_2009)
    {
        float _2073 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2057 = _2073;
    }
    float _2075 = _2057;
    float _2077 = sqrt(_1991);
    float _2079 = _2049;
    float _2081 = _2075;
    if (_2009)
    {
        float _2083 = fma(_2049, _2075, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2019 = _2083;
    }
    float _2085 = _2019;
    float _2087 = _2085;
    if (!_2009)
    {
        _2079 = _1999;
    }
    float _2089 = _2079;
    float _2091 = _2089;
    if (_2009)
    {
        float _2093 = _2063 + (-1.0);
        _2081 = _2093;
    }
    float _2095 = _2081;
    float _2097 = _2095;
    if (_2009)
    {
        float _2099 = _2031 * _2085;
        _2021 = _2099;
    }
    float _2101 = _2021;
    if (!_2009)
    {
        _2033 = _2069;
    }
    float _2103 = _2033;
    float _2105 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2107 = _2103;
    if (_2009)
    {
        float _2109 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2087 = _2109;
    }
    float _2111 = _2087;
    if (_2009)
    {
        float _2113 = _1997 * _2101;
        _2023 = _2113;
    }
    float _2115 = _2023;
    if (!_2009)
    {
        _2097 = _2001;
    }
    float _2117 = _2097;
    float _2119 = _2117;
    if (_2009)
    {
        float _2121 = _1999 * _2101;
        _2091 = _2121;
    }
    float _2123 = _2091;
    if (_2009)
    {
        float _2125 = fma(_2069, _2063, _2111);
        _2107 = _2125;
    }
    float _2127 = _2107;
    if (_2009)
    {
        float _2129 = _2115 * _2115;
        _2119 = _2129;
    }
    float _2131 = _2119;
    if (!_2009)
    {
        _2071 = _2003;
    }
    float _2133 = _2071;
    float _2135 = _2133;
    if (_2009)
    {
        float _2137 = _2123 * _2123;
        _2135 = _2137;
    }
    float _2139 = _2135;
    float _2141 = fma(_2127, _2127, _2131);
    float _2143 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2145 = _2141 + _2139;
    float _2147 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2151 = fma(_2077, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2149);
    float _2153 = precise::clamp(_2151, 0.0, 1.0);
    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2157 = rsqrt(_2145);
    float _2159 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2147);
    float _2161 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2163 = -_2153;
    float _2165 = _2163 + 1.0;
    float _2167 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2159);
    float _2169 = _1965 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2171 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2161);
    float _2173 = _2167 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2175 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2169);
    float _2177 = abs(_2165);
    float _2179 = log2(_2177);
    float _2181 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2171);
    float _2183 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2185 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2175);
    float _2187 = _2181 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2189 = _2157 * _2115;
    float _2191 = _2185 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2193 = _2157 * _2127;
    float _2195 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2197 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2199 = -_2183;
    float _2201 = fma(_2199, _2155, 1.0);
    float _2203 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2143);
    float _2205 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2195);
    float _2207 = _2157 * _2123;
    float _2209 = -_2197;
    float _2211 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2209);
    float _2213 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2215 = _2203 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2217 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2205);
    float _2219 = -_2207;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2211);
    float _2223 = exp2(_2213);
    float _2225 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2227 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2217);
    float _2229 = fma(_2221, -0.5, 0.5);
    float _2231 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2233 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2225);
    float _2235 = fma(_2221, 0.5, 0.5);
    float _2237 = _2193 + 1.0;
    float _2239 = log2(_2201);
    float _2241 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2231);
    float _2243 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2233);
    float _2245 = fma(_2235, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2247 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2241);
    float _2249 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2243);
    float _2251 = 1.0 / _2227;
    float _2253 = -_2193;
    float _2255 = fma(_2223, _2237, _2253);
    float _2257 = fma(_2235, _2245, -0.212114393711090087890625);
    float _2259 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2247);
    float _2261 = fma(_2255, 0.5, 0.5);
    float _2263 = fma(_2235, _2257, 1.570728778839111328125);
    float _2265 = sqrt(_2229);
    float _2267 = _2239 * 0.693147182464599609375;
    float _2269 = _2267 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2271 = _2249 * _2251;
    float _2273 = _2259 * _2251;
    float _2275 = fma(_2271, 0.5, 0.5);
    float _2277 = fma(_2273, -0.5, 0.5);
    float _2279 = _2265 * 0.636619746685028076171875;
    float3 _5936 = float3(_2275, _2277, _2269);
    float _2281 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5936, float3(0.0), isnan(_5936)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5936, float3(0.0), isnan(_5936)), level(0.0)).x;
    float3 _5947 = float3(_2275, _2277, _2269);
    float4 _2284 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5947, float3(0.0), isnan(_5947)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5947, float3(0.0), isnan(_5947)), level(0.0)).xyzw;
    float _2286 = _2284.x;
    float _2288 = _2284.y;
    float _2290 = _2284.z;
    float _2292 = _2284.w;
    float _2294 = -_2263;
    float _2296 = fma(_2279, _2294, 1.0);
    float2 _5969 = float2(_2296, _2261);
    float3 _2300 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5969, float2(0.0), isnan(_5969)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5969, float2(0.0), isnan(_5969)), level(0.0)).xyz;
    float _2302 = _2300.x;
    float _2304 = _2300.y;
    float _2306 = _2300.z;
    float _2308 = _2179 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2310 = _2187 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2312 = _2227 * 0.5;
    out.m_78.x = _1969;
    out.m_78.y = _1965;
    out.m_78.z = _1973;
    float _2314 = fma(_2191, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2310);
    float _2316 = exp2(_2308);
    float _2318 = fma(_2259, -0.5, _2312);
    float _2320 = fma(_2173, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2314);
    float _2322 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2320);
    float _2324 = _2249 + _2227;
    float _2326 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2328 = _2322 + _2227;
    float _2330 = _2324 * 0.5;
    out.gl_Position.x = _2249;
    out.gl_Position.y = _2259;
    out.gl_Position.z = _2322;
    out.gl_Position.w = _2227;
    float _2332 = _2328 * 0.5;
    float _2334 = -_2316;
    float _2336 = _2334 + 1.0;
    out.m_47.x = _2326;
    float _2338 = _2336 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_80.x = _2330;
    out.m_80.y = _2318;
    out.m_80.z = _2332;
    out.m_80.w = _2227;
    float _2340 = -_2338;
    float _2342 = _2340 + 1.0;
    float _2344 = _2338 * _2281;
    float _2346 = _2292 * _2344;
    float _2348 = _2292 * _2342;
    float _2350 = _2306 * _2344;
    float _2352 = fma(_2302, _2346, _2286);
    float _2354 = fma(_2304, _2346, _2288);
    float _2356 = fma(_2292, _2350, _2290);
    out.m_82.x = _2352;
    out.m_82.y = _2354;
    out.m_82.z = _2356;
    out.m_82.w = _2348;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

