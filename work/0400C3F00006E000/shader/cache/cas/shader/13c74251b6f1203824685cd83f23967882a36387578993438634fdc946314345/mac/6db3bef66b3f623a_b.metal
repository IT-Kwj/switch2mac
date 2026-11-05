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
    float4 m_64 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_74 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_54 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_62 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1141 = false;
    bool _683 = false;
    bool _541 = false;
    bool _427 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1885 = as_type<float>(_109);
        out.gl_Position.z = _1885;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1954 = as_type<float>(_145);
        out.gl_Position.z = _1954;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = in.m_54.x;
    float _151 = in.m_54.y;
    float _153 = in.m_54.z;
    float _155 = in.m_56.x;
    float _157 = in.m_56.y;
    float _159 = in.m_56.z;
    float _161 = in.m_58.x;
    float _163 = in.m_58.y;
    float _165 = in.m_58.z;
    float _167 = in.m_60.x;
    float _169 = in.m_60.y;
    float _171 = in.m_60.z;
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _151 * _157;
    float _185 = _151 * _163;
    float _187 = fma(_149, _155, _183);
    float _189 = _151 * _169;
    float _191 = fma(_149, _161, _185);
    float _193 = fma(_153, _159, _187);
    float _195 = fma(_149, _167, _189);
    float _197 = fma(_153, _165, _191);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_153, _171, _195);
    bool _205 = !_175;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_181;
    float _211 = _197;
    float _213 = _193;
    float _231;
    if (!_209)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_93);
        float _237 = 1.0 / _235;
        float _239 = _127 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _241 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _263;
    float _267 = 1.0 / _257;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _271 = 1.0 / _265;
    bool _273 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _275 = isnan(_241);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = 1.0 / _261;
    float _287 = _245 * _267;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _249 * _271;
    bool _303 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_241);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_283;
    float _317 = _315 + 1.0;
    float _319 = _313 * _317;
    float _321 = -_313;
    float _323 = _321 + 1.0;
    float _325 = _253 * _285;
    float _327 = -_299;
    float _329 = _327 + 1.0;
    bool _331 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_241);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = _283 * _329;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = fma(_345, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = _341 * _323;
    float _365 = fma(_355, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = fma(_349, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_359, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_341;
    float _373 = _371 + 1.0;
    float _375 = _361 * _363;
    float _377 = _365 * _363;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_367, _319, _383);
    float _395 = fma(_387, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_369, _319, _389);
    float _399 = fma(_391, _351, _393);
    float _401 = fma(_395, _351, _397);
    float _403 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_269;
    float _425;
    if (!_407)
    {
        float _409 = in.m_62.x;
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
        float _429 = float(_93);
        float _431 = 1.0 / _429;
        float _433 = _127 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _435 + _437;
    bool _441 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _443 = isnan(_435);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _453;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _459 = 1.0 / _455;
    float _461 = -_451;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _465;
    float _469 = _439 * _459;
    bool _471 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_435);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _483;
    float _487 = fma(_467, _469, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _489;
    float _493 = _481 * _463;
    float _495 = fma(_485, _469, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _497 = fma(_491, _469, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _499 = -_481;
    float _501 = _499 + 1.0;
    float _503 = _487 * _493;
    float _505 = _495 * _493;
    float _507 = _497 * _493;
    float _509 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _505);
    float _511 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _507);
    float _513 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _503);
    float _515 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[108].x, _509);
    float _517 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[108].y, _511);
    float _519 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[108].z, _513);
    bool _521 = !_457;
    float _539;
    if (!_521)
    {
        float _523 = in.m_62.x;
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _527 = _523 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _531 = _529 * _525;
        float _533 = floor(_531);
        float _535 = -_533;
        float _537 = _531 + _535;
        _539 = _537;
        _541 = true;
    }
    else
    {
        float _543 = float(_93);
        float _545 = 1.0 / _543;
        float _547 = _127 * _545;
        _539 = _547;
    }
    _541 = false;
    float _549 = _539;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _555 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = isnan(_549);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _571 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _573 = isnan(_549);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = 1.0 / _553;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _585;
    float _589 = -_565;
    float _591 = _589 + 1.0;
    bool _593 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _595 = isnan(_549);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _607 = 1.0 / _569;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _613 = _587 * _583;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _549 + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _549 + _619;
    float _623 = fma(_613, _617, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _625 = _581 * _591;
    float _627 = -_581;
    float _629 = _627 + 1.0;
    float _631 = _611 * _607;
    float _633 = -_603;
    float _635 = _633 + 1.0;
    float _637 = _623 * _625;
    float _639 = fma(_631, _621, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _641 = _565 * _635;
    float _643 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[115].x, _637);
    float _645 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _647 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _649 = fma(_639, _641, _643);
    float _651 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[117].x, _649);
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _653;
    out.m_64.y = _655;
    out.m_64.z = _659;
    out.m_64.w = _661;
    bool _663 = !_605;
    float _681;
    if (!_663)
    {
        float _665 = in.m_62.x;
        float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _669 = _665 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _673 = _671 * _667;
        float _675 = floor(_673);
        float _677 = -_675;
        float _679 = _673 + _677;
        _681 = _679;
        _683 = true;
    }
    else
    {
        float _685 = float(_93);
        float _687 = 1.0 / _685;
        float _689 = _127 * _687;
        _681 = _689;
    }
    _683 = false;
    float _691 = _681;
    float _693 = _197 * _197;
    float _695 = in.m_66.x;
    float _697 = in.m_66.y;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _701 = fma(_193, _193, _693);
    float _703 = fma(_203, _203, _701);
    float _705 = in.m_44.x;
    float _707 = in.m_44.y;
    float _709 = in.m_44.z;
    float _711 = rsqrt(_703);
    float _713 = _405 * _697;
    float _715 = _403 * _695;
    float _717 = _203 * _711;
    float _719 = _193 * _711;
    float _721 = _197 * _711;
    float _723 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _725 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _727 = _717 * _725;
    float _729 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _731 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _733 = _721 * _731;
    float _735 = _157 * _707;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _739 = -_727;
    float _741 = fma(_719, _737, _739);
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _745 = _719 * _743;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _749 = -_733;
    float _751 = fma(_717, _747, _749);
    float _753 = fma(_155, _705, _735);
    float _755 = _741 * _741;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _759 = -_745;
    float _761 = fma(_721, _757, _759);
    float _763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _765 = _169 * _707;
    float _767 = fma(_751, _751, _755);
    float _769 = _723 * _699;
    float _771 = in.m_62.x;
    float _773 = in.m_62.y;
    float _775 = fma(_167, _705, _765);
    float _777 = fma(_761, _761, _767);
    float _779 = _769 * _717;
    float _781 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _783 = _163 * _707;
    float _785 = rsqrt(_777);
    float _787 = _729 * _763;
    float _789 = _761 * _785;
    float _791 = _741 * _785;
    float _793 = _751 * _785;
    float _795 = _769 * _719;
    float _797 = _721 * _789;
    float _799 = _719 * _791;
    bool _801 = _771 > 0.5;
    float _803 = fma(_787, _793, _795);
    float _805 = fma(_787, _789, _779);
    float _807 = -_797;
    float _809 = fma(_717, _791, _807);
    float _811 = -_799;
    float _813 = fma(_721, _793, _811);
    float _815 = fma(_159, _709, _753);
    float _817 = fma(_171, _709, _775);
    float _819 = fma(_781, _809, _803);
    float _821 = fma(_781, _813, _805);
    float _823 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _825 = _817 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _827 = _769 * _721;
    float _829 = _823 + _819;
    float _831 = _825 + _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _833;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _843 = _831 + _841;
    float _845 = fma(_161, _705, _783);
    float _847 = 1.0 / _835;
    float _849 = _839 * _839;
    float _851 = _843 * _843;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _855 = _853 != 0;
    float _857 = _717 * _793;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _861 = _859 != 0;
    float _863 = _849 + _851;
    float _865 = fma(_787, _791, _827);
    float _867 = -_207;
    int _869 = _801 ? as_type<int>(_867) : as_type<int>(_207);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _873 = _691 + _871;
    float _875 = sqrt(_863);
    float _877 = -_857;
    float _879 = fma(_719, _789, _877);
    bool _881 = _773 > 0.5;
    float _883 = fma(_165, _709, _845);
    float _885 = fma(_781, _879, _865);
    float _887 = _873 * _847;
    float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _891 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _893 = isnan(_691);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _903;
    float _907 = -_201;
    int _909 = _881 ? as_type<int>(_907) : as_type<int>(_201);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _911;
    bool _915 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _917 = isnan(_691);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = fma(_913, _887, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _929 = _875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _931 = _883 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _933 = !_861;
    float _935 = _933 ? _201 : as_type<float>(_909);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _937;
    float _941 = -_925;
    float _943 = _941 + 1.0;
    float _945 = _931 + _885;
    bool _947 = !_855;
    float _949 = _947 ? _207 : as_type<float>(_869);
    float _951 = fma(_905, _887, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _953 = fma(_939, _887, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _955 = _901 * _943;
    float _957 = _905;
    float _959 = _849;
    float _961 = _851;
    float _963 = _829;
    float _965 = _831;
    if (!_929)
    {
        _957 = _945;
    }
    float _967 = _957;
    bool _969 = !_929;
    float _971 = _967;
    if (!_969)
    {
        float _973 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _975 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _977 = _875 + _975;
        float _979 = _945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _981 = rsqrt(_863);
        float _983 = _977 * _973;
        float _985 = _983 * 0.15915493667125701904296875;
        float _987 = _985 * 6.283185482025146484375;
        float _989 = sin(_987);
        float _991 = _985 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = fma(_989, _979, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _997 = _981 * _995;
        float _999 = _993 + (-1.0);
        float _1001 = fma(_839, _997, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1003 = fma(_843, _997, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1005 = _999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1009 = _1001 + _1007;
        float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1013 = _1003 + _1011;
        float _1015 = fma(_945, _993, _1005);
        float _1017 = _1009 * _1009;
        float _1019 = _1013 * _1013;
        _971 = _1015;
        _959 = _1017;
        _961 = _1019;
        _963 = _1001;
        _965 = _1003;
    }
    float _1021 = _971;
    float _1023 = _959;
    float _1025 = _961;
    float _1027 = _963;
    float _1029 = _965;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1033 = _1021 + _1031;
    float _1035 = _927 * _955;
    float _1037 = _951 * _955;
    float _1039 = -_901;
    float _1041 = _1039 + 1.0;
    float _1043 = _953 * _955;
    float _1045 = fma(_1033, _1033, _1023);
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1049 = _949 + 0.5;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1035);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1037);
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1043);
    float _1057 = _1045 + _1025;
    float _1059 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1061 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1051);
    float _1063 = -_935;
    float _1065 = _1063 + 0.5;
    float _1067 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1053);
    float _1069 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1055);
    float _1071 = _1059 * _889;
    float _1073 = sqrt(_1057);
    float _1075 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1081 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1083 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = _1077 * _1047;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _1071;
    out.m_68.y = _1085;
    out.m_70.x = _1083;
    out.m_70.y = _1087;
    out.m_70.z = _1089;
    bool _1091 = _1073 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1093 = isnan(_1073);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1099 = _1095 || _1097;
    float _1101 = _1033;
    float _1103 = _1089;
    float _1105 = _1049;
    if (!_1099)
    {
        _1101 = 1.0;
    }
    float _1107 = _1101;
    bool _1109 = !_1099;
    float _1111 = _1107;
    if (!_1109)
    {
        bool _1113 = _1073 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1115 = isnan(_1073);
        bool _1117 = _1113 || _1115;
        bool _1119 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1121 = _1117 || _1119;
        if (!_1121)
        {
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1125 = _1073 + _1123;
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1129 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1127;
            float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1133 = _1131 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1135 = 1.0 / _1129;
            float _1137 = _1125 * _1135;
            float _1139 = fma(_1137, _1133, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1111 = _1139;
            _1141 = true;
        }
        else
        {
            bool _1143 = _1073 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1145 = isnan(_1073);
            bool _1147 = _1143 || _1145;
            bool _1149 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1151 = _1147 || _1149;
            if (!_1151)
            {
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1155 = _1073 + _1153;
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1159 = _1157 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1161 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1163 = _1161 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1165 = 1.0 / _1159;
                float _1167 = _1155 * _1165;
                float _1169 = fma(_1167, _1163, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1111 = _1169;
                _1141 = true;
            }
            else
            {
                _1111 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1141 = false;
    float _1171 = _1111;
    float _1173 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1175 = _1021 + _1173;
    float _1177 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1179 = _1027 + _1177;
    float _1181 = fma(_1175, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1183 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1185 = _1029 + _1183;
    float _1187 = fma(_1179, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1189 = -_931;
    float _1191 = _1189 + _1181;
    float _1193 = fma(_1185, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1195 = -_823;
    float _1197 = _1195 + _1187;
    float _1199 = _1191 * _1191;
    float _1201 = -_825;
    float _1203 = _1201 + _1193;
    float _1205 = fma(_1197, _1197, _1199);
    float _1207 = fma(_1203, _1203, _1205);
    float _1209 = sqrt(_1207);
    bool _1211 = _1209 > 0.0;
    bool _1213 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1215 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan(0.5);
    bool _1221 = _1217 || _1219;
    float _1223 = _1185;
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1227 = _1197;
    float _1229 = _1171;
    float _1231 = _1187;
    if (!_1211)
    {
        _1223 = _1187;
    }
    float _1233 = _1223;
    float _1235 = _1233;
    if (!_1211)
    {
        _1103 = _1181;
    }
    float _1237 = _1103;
    float _1239 = _1237;
    if (!_1211)
    {
        _1225 = _1193;
    }
    float _1241 = _1225;
    bool _1243 = !_1211;
    float _1245 = _1241;
    if (!_1243)
    {
        bool _1247 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1249 = sqrt(_703);
        float _1251 = rsqrt(_1207);
        float _1253 = _1171;
        if (!_1247)
        {
            float _1255 = in.m_66.w;
            _1253 = _1255;
        }
        float _1257 = _1253;
        bool _1259 = _1249 > 0.0;
        float _1261 = _1233;
        if (!_1247)
        {
            float _1263 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            _1261 = _1263;
        }
        float _1265 = _1261;
        float _1267 = _1191 * _1251;
        float _1269 = _1237;
        float _1271 = _1251;
        float _1273 = _1267;
        if (_1247)
        {
            float _1275 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1269 = _1275;
        }
        float _1277 = _1269;
        float _1279 = _1197 * _1251;
        float _1281 = _1203 * _1251;
        if (_1259)
        {
            float _1283 = _721 * _1267;
            _1271 = _1283;
        }
        float _1285 = _1271;
        float _1287 = _1285;
        if (_1259)
        {
            float _1289 = fma(_719, _1279, _1285);
            _1287 = _1289;
        }
        float _1291 = _1287;
        float _1293 = _1291;
        float _1295 = _1265;
        float _1297 = _1257;
        if (!_1247)
        {
            float _1299 = _1265 * _1257;
            _1273 = _1299;
        }
        float _1301 = _1273;
        _1105 = _1301;
        if (_1259)
        {
            float _1303 = fma(_717, _1281, _1291);
            _1293 = _1303;
        }
        float _1305 = _1293;
        float _1307 = _1305;
        if (!_1259)
        {
            _1295 = _1187;
        }
        float _1309 = _1295;
        float _1311 = _1277;
        float _1313 = _1309;
        if (_1247)
        {
            float _1315 = _197 * _1277;
            _1297 = _1315;
        }
        float _1317 = _1297;
        float _1319 = _1317;
        if (_1247)
        {
            float _1321 = _193 * _1277;
            _1227 = _1321;
        }
        float _1323 = _1227;
        float _1325 = _1323;
        if (!_1247)
        {
            float _1327 = _197 * _1301;
            _1319 = _1327;
        }
        float _1329 = _1319;
        _1229 = _1329;
        if (!_1247)
        {
            float _1331 = _193 * _1301;
            _1325 = _1331;
        }
        float _1333 = _1325;
        if (_1247)
        {
            float _1335 = _203 * _1277;
            _211 = _1335;
        }
        float _1337 = _211;
        float _1339 = _1337;
        if (_1259)
        {
            float _1341 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            _213 = _1341;
        }
        float _1343 = _213;
        if (!_1247)
        {
            float _1345 = _203 * _1301;
            _1339 = _1345;
        }
        float _1347 = _1339;
        if (!_1259)
        {
            _1311 = _1181;
        }
        float _1349 = _1311;
        float _1351 = _1349;
        if (!_1259)
        {
            _1307 = _1193;
        }
        float _1353 = _1307;
        _1245 = _1353;
        if (_1259)
        {
            float _1355 = fma(_1333, _1343, _1187);
            _1313 = _1355;
        }
        float _1357 = _1313;
        _1235 = _1357;
        if (_1259)
        {
            float _1359 = fma(_1329, _1343, _1181);
            _1351 = _1359;
        }
        float _1361 = _1351;
        _1239 = _1361;
        if (_1259)
        {
            float _1363 = fma(_1347, _1343, _1193);
            _1245 = _1363;
        }
    }
    float _1365 = _1235;
    float _1367 = _1245;
    float _1369 = _1239;
    float _1371 = _1229;
    float _1373 = _1105;
    float _1375 = _1369;
    float _1377 = _1365;
    float _1379 = _1367;
    float _1381 = _1371;
    float _1383 = _1373;
    if (!_1221)
    {
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1387 = _931 + _1385;
        float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1391 = _823 + _1389;
        float _1393 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1395 = _1387 * _1387;
        float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1399 = _825 + _1397;
        float _1401 = fma(_1391, _1391, _1395);
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1405 = fma(_1399, _1399, _1401);
        float _1407 = sqrt(_1405);
        float _1409 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1411 = precise::min(_1407, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1413 = _1411 * _1403;
        float _1415 = -_823;
        float _1417 = _1415 + _1365;
        float _1419 = -_825;
        float _1421 = _1419 + _1367;
        float _1423 = _1409 * _1413;
        float _1425 = -_931;
        float _1427 = _1425 + _1369;
        float _1429 = fma(_1417, _1423, _823);
        float _1431 = fma(_1427, _1423, _931);
        float _1433 = fma(_1421, _1423, _825);
        _1375 = _1431;
        _1377 = _1429;
        _1379 = _1433;
        _1231 = _1423;
        _1381 = _1417;
    }
    float _1435 = _1375;
    float _1437 = _1377;
    float _1439 = _1379;
    float _1441 = _1231;
    float _1443 = _1381;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1447 = _1435 + _1445;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1451 = _1437 + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1455 = _1439 + _1453;
    float _1457 = _1447 * _1447;
    float _1459 = fma(_1451, _1451, _1457);
    float _1461 = fma(_1455, _1455, _1459);
    float _1463 = rsqrt(_1461);
    float _1465 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1467 = _1451 * _1465;
    float _1469 = _1455 * _1465;
    float _1471 = _1467 * _1467;
    float _1473 = _1469 * _1469;
    float _1475 = _1471 + _1473;
    float _1477 = sqrt(_1475);
    bool _1479 = _1477 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1483 = _1477 + _1481;
    float _1485 = _1463;
    float _1487 = _1483;
    float _1489 = _1441;
    float _1491 = _1447;
    float _1493 = _1467;
    if (_1479)
    {
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1485 = _1495;
    }
    float _1497 = _1485;
    float _1499 = _1497;
    if (_1479)
    {
        float _1501 = _1483 * _1497;
        _1487 = _1501;
    }
    float _1503 = _1487;
    if (_1479)
    {
        float _1505 = rsqrt(_1475);
        _1499 = _1505;
    }
    float _1507 = _1499;
    float _1509 = _1507;
    if (_1479)
    {
        float _1511 = _1503 * 0.15915493667125701904296875;
        _1489 = _1511;
    }
    float _1513 = _1489;
    float _1515 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1517 = _1455;
    if (_1479)
    {
        float _1519 = _1513 * 6.283185482025146484375;
        float _1521 = sin(_1519);
        _1517 = _1521;
    }
    float _1523 = _1517;
    float _1525 = precise::max(0.0, _1515);
    float _1527 = _1443;
    float _1529 = _1525;
    if (_1479)
    {
        float _1531 = _1513 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        _1527 = _1533;
    }
    float _1535 = _1527;
    float _1537 = -_1465;
    float _1539 = -_1525;
    float _1541 = fma(_1447, _1537, _1539);
    if (_1479)
    {
        float _1543 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1491 = _1543;
    }
    float _1545 = _1491;
    float _1547 = sqrt(_1461);
    float _1549 = _1523;
    float _1551 = _1545;
    if (_1479)
    {
        float _1553 = fma(_1523, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1549 = _1553;
    }
    float _1555 = _1549;
    float _1557 = _1555;
    if (_1479)
    {
        float _1559 = _1507 * _1555;
        _1383 = _1559;
    }
    float _1561 = _1383;
    if (!_1479)
    {
        _1509 = _1541;
    }
    float _1563 = _1509;
    float _1565 = _1563;
    if (_1479)
    {
        float _1567 = _1535 + (-1.0);
        _1529 = _1567;
    }
    float _1569 = _1529;
    float _1571 = _1569;
    if (_1479)
    {
        float _1573 = _1467 * _1561;
        _1493 = _1573;
    }
    float _1575 = _1493;
    if (!_1479)
    {
        _1557 = _1469;
    }
    float _1577 = _1557;
    float _1579 = _1577;
    if (_1479)
    {
        float _1581 = _1469 * _1561;
        _1579 = _1581;
    }
    float _1583 = _1579;
    if (_1479)
    {
        float _1585 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1585;
    }
    float _1587 = _1551;
    float _1589 = _1587;
    if (!_1479)
    {
        _1571 = _1471;
    }
    float _1591 = _1571;
    float _1593 = _1591;
    if (_1479)
    {
        float _1595 = _1575 * _1575;
        _1593 = _1595;
    }
    float _1597 = _1593;
    if (_1479)
    {
        float _1599 = fma(_1541, _1535, _1587);
        _1565 = _1599;
    }
    float _1601 = _1565;
    if (!_1479)
    {
        _1589 = _1473;
    }
    float _1603 = _1589;
    float _1605 = _1603;
    if (_1479)
    {
        float _1607 = _1583 * _1583;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1613 = fma(_1601, _1601, _1597);
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1617 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1615);
    float _1619 = precise::clamp(_1617, 0.0, 1.0);
    float _1621 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1611);
    float _1623 = _1613 + _1609;
    float _1625 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1627 = -_1619;
    float _1629 = _1627 + 1.0;
    float _1631 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1633 = rsqrt(_1623);
    float _1635 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1625);
    float _1637 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1639 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1621);
    float _1641 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1643 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1635);
    float _1645 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1637);
    float _1647 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1631);
    float _1649 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1651 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1645);
    float _1653 = abs(_1629);
    float _1655 = log2(_1653);
    float _1657 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1659 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1647);
    float _1661 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1665 = _1633 * _1575;
    float _1667 = _1633 * _1601;
    float _1669 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1671 = -_1663;
    float _1673 = fma(_1671, _1641, 1.0);
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1677 = _1633 * _1583;
    float _1679 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1669);
    float _1681 = _1659 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1683 = -_1675;
    float _1685 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1683);
    float _1687 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1689 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1679);
    float _1691 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1693 = -_1677;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1685);
    float _1697 = log2(_1673);
    float _1699 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1689);
    float _1701 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1703 = fma(_1695, -0.5, 0.5);
    float _1705 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1687);
    float _1707 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1701);
    float _1709 = exp2(_1691);
    float _1711 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1705);
    float _1713 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1707);
    float _1715 = 1.0 / _1699;
    float _1717 = fma(_1695, 0.5, 0.5);
    float _1719 = _1667 + 1.0;
    float _1721 = _1697 * 0.693147182464599609375;
    float _1723 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1725 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1727 = sqrt(_1703);
    float _1729 = -_1667;
    float _1731 = fma(_1709, _1719, _1729);
    float _1733 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1711);
    float _1735 = fma(_1717, _1723, -0.212114393711090087890625);
    float _1737 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1713);
    float _1739 = fma(_1717, _1735, 1.570728778839111328125);
    float _1741 = _1733 * _1715;
    float _1743 = _1737 * _1715;
    float _1745 = fma(_1741, 0.5, 0.5);
    float _1747 = fma(_1743, -0.5, 0.5);
    float _1749 = _1727 * 0.636619746685028076171875;
    float3 _4526 = float3(_1745, _1747, _1725);
    float _1751 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4526, float3(0.0), isnan(_4526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4526, float3(0.0), isnan(_4526)), level(0.0)).x;
    float _1753 = fma(_1731, 0.5, 0.5);
    float _1755 = -_1739;
    float _1757 = fma(_1749, _1755, 1.0);
    float3 _4544 = float3(_1745, _1747, _1725);
    float4 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4544, float3(0.0), isnan(_4544)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4544, float3(0.0), isnan(_4544)), level(0.0)).xyzw;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = _1760.w;
    float2 _4561 = float2(_1757, _1753);
    float3 _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4561, float2(0.0), isnan(_4561)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4561, float2(0.0), isnan(_4561)), level(0.0)).xyz;
    float _1774 = _1772.x;
    float _1776 = _1772.y;
    float _1778 = _1772.z;
    float _1780 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1782 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1784 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1782);
    float _1786 = exp2(_1780);
    float _1788 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1784);
    float _1790 = _1733 + _1699;
    float _1792 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1788);
    float _1794 = _1790 * 0.5;
    float _1796 = _1699 * 0.5;
    float _1798 = _1792 + _1699;
    out.gl_Position.x = _1733;
    out.gl_Position.y = _1737;
    out.gl_Position.z = _1792;
    out.gl_Position.w = _1699;
    float _1800 = -_1786;
    float _1802 = _1800 + 1.0;
    float _1804 = fma(_1737, -0.5, _1796);
    float _1806 = _1798 * 0.5;
    float _1808 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1810 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _1794;
    out.m_72.y = _1804;
    out.m_72.z = _1806;
    out.m_72.w = _1699;
    out.m_47.x = _1810;
    float _1812 = _1808 * _1751;
    float _1814 = -_1808;
    float _1816 = _1814 + 1.0;
    float _1818 = _1768 * _1812;
    float _1820 = _1778 * _1812;
    float _1822 = fma(_1774, _1818, _1762);
    float _1824 = fma(_1776, _1818, _1764);
    float _1826 = _1768 * _1816;
    float _1828 = fma(_1768, _1820, _1766);
    out.m_74.x = _1822;
    out.m_74.y = _1824;
    out.m_74.z = _1828;
    out.m_74.w = _1826;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1141 = false;
    bool _683 = false;
    bool _541 = false;
    bool _427 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1885 = as_type<float>(_109);
        out.gl_Position.z = _1885;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1954 = as_type<float>(_145);
        out.gl_Position.z = _1954;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = in.m_54.x;
    float _151 = in.m_54.y;
    float _153 = in.m_54.z;
    float _155 = in.m_56.x;
    float _157 = in.m_56.y;
    float _159 = in.m_56.z;
    float _161 = in.m_58.x;
    float _163 = in.m_58.y;
    float _165 = in.m_58.z;
    float _167 = in.m_60.x;
    float _169 = in.m_60.y;
    float _171 = in.m_60.z;
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _151 * _157;
    float _185 = _151 * _163;
    float _187 = fma(_149, _155, _183);
    float _189 = _151 * _169;
    float _191 = fma(_149, _161, _185);
    float _193 = fma(_153, _159, _187);
    float _195 = fma(_149, _167, _189);
    float _197 = fma(_153, _165, _191);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_153, _171, _195);
    bool _205 = !_175;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_181;
    float _211 = _197;
    float _213 = _193;
    float _231;
    if (!_209)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_93);
        float _237 = 1.0 / _235;
        float _239 = _127 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _241 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _263;
    float _267 = 1.0 / _257;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _271 = 1.0 / _265;
    bool _273 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _275 = isnan(_241);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = 1.0 / _261;
    float _287 = _245 * _267;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _249 * _271;
    bool _303 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_241);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_283;
    float _317 = _315 + 1.0;
    float _319 = _313 * _317;
    float _321 = -_313;
    float _323 = _321 + 1.0;
    float _325 = _253 * _285;
    float _327 = -_299;
    float _329 = _327 + 1.0;
    bool _331 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_241);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = _283 * _329;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = fma(_345, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = _341 * _323;
    float _365 = fma(_355, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = fma(_349, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_359, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_341;
    float _373 = _371 + 1.0;
    float _375 = _361 * _363;
    float _377 = _365 * _363;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_367, _319, _383);
    float _395 = fma(_387, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_369, _319, _389);
    float _399 = fma(_391, _351, _393);
    float _401 = fma(_395, _351, _397);
    float _403 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_269;
    float _425;
    if (!_407)
    {
        float _409 = in.m_62.x;
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
        float _429 = float(_93);
        float _431 = 1.0 / _429;
        float _433 = _127 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _435 + _437;
    bool _441 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _443 = isnan(_435);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _453;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _459 = 1.0 / _455;
    float _461 = -_451;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _465;
    float _469 = _439 * _459;
    bool _471 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_435);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _483;
    float _487 = fma(_467, _469, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _489;
    float _493 = _481 * _463;
    float _495 = fma(_485, _469, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _497 = fma(_491, _469, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _499 = -_481;
    float _501 = _499 + 1.0;
    float _503 = _487 * _493;
    float _505 = _495 * _493;
    float _507 = _497 * _493;
    float _509 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _505);
    float _511 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _507);
    float _513 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _503);
    float _515 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[108].x, _509);
    float _517 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[108].y, _511);
    float _519 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[108].z, _513);
    bool _521 = !_457;
    float _539;
    if (!_521)
    {
        float _523 = in.m_62.x;
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _527 = _523 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _531 = _529 * _525;
        float _533 = floor(_531);
        float _535 = -_533;
        float _537 = _531 + _535;
        _539 = _537;
        _541 = true;
    }
    else
    {
        float _543 = float(_93);
        float _545 = 1.0 / _543;
        float _547 = _127 * _545;
        _539 = _547;
    }
    _541 = false;
    float _549 = _539;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _555 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = isnan(_549);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _571 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _573 = isnan(_549);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = 1.0 / _553;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _585;
    float _589 = -_565;
    float _591 = _589 + 1.0;
    bool _593 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _595 = isnan(_549);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _607 = 1.0 / _569;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _613 = _587 * _583;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _549 + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _549 + _619;
    float _623 = fma(_613, _617, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _625 = _581 * _591;
    float _627 = -_581;
    float _629 = _627 + 1.0;
    float _631 = _611 * _607;
    float _633 = -_603;
    float _635 = _633 + 1.0;
    float _637 = _623 * _625;
    float _639 = fma(_631, _621, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _641 = _565 * _635;
    float _643 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[115].x, _637);
    float _645 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _647 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _649 = fma(_639, _641, _643);
    float _651 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[117].x, _649);
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _653;
    out.m_64.y = _655;
    out.m_64.z = _659;
    out.m_64.w = _661;
    bool _663 = !_605;
    float _681;
    if (!_663)
    {
        float _665 = in.m_62.x;
        float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _669 = _665 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _673 = _671 * _667;
        float _675 = floor(_673);
        float _677 = -_675;
        float _679 = _673 + _677;
        _681 = _679;
        _683 = true;
    }
    else
    {
        float _685 = float(_93);
        float _687 = 1.0 / _685;
        float _689 = _127 * _687;
        _681 = _689;
    }
    _683 = false;
    float _691 = _681;
    float _693 = _197 * _197;
    float _695 = in.m_66.x;
    float _697 = in.m_66.y;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _701 = fma(_193, _193, _693);
    float _703 = fma(_203, _203, _701);
    float _705 = in.m_44.x;
    float _707 = in.m_44.y;
    float _709 = in.m_44.z;
    float _711 = rsqrt(_703);
    float _713 = _405 * _697;
    float _715 = _403 * _695;
    float _717 = _203 * _711;
    float _719 = _193 * _711;
    float _721 = _197 * _711;
    float _723 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _725 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _727 = _717 * _725;
    float _729 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _731 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _733 = _721 * _731;
    float _735 = _157 * _707;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _739 = -_727;
    float _741 = fma(_719, _737, _739);
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _745 = _719 * _743;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _749 = -_733;
    float _751 = fma(_717, _747, _749);
    float _753 = fma(_155, _705, _735);
    float _755 = _741 * _741;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _759 = -_745;
    float _761 = fma(_721, _757, _759);
    float _763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _765 = _169 * _707;
    float _767 = fma(_751, _751, _755);
    float _769 = _723 * _699;
    float _771 = in.m_62.x;
    float _773 = in.m_62.y;
    float _775 = fma(_167, _705, _765);
    float _777 = fma(_761, _761, _767);
    float _779 = _769 * _717;
    float _781 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _783 = _163 * _707;
    float _785 = rsqrt(_777);
    float _787 = _729 * _763;
    float _789 = _761 * _785;
    float _791 = _741 * _785;
    float _793 = _751 * _785;
    float _795 = _769 * _719;
    float _797 = _721 * _789;
    float _799 = _719 * _791;
    bool _801 = _771 > 0.5;
    float _803 = fma(_787, _793, _795);
    float _805 = fma(_787, _789, _779);
    float _807 = -_797;
    float _809 = fma(_717, _791, _807);
    float _811 = -_799;
    float _813 = fma(_721, _793, _811);
    float _815 = fma(_159, _709, _753);
    float _817 = fma(_171, _709, _775);
    float _819 = fma(_781, _809, _803);
    float _821 = fma(_781, _813, _805);
    float _823 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _825 = _817 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _827 = _769 * _721;
    float _829 = _823 + _819;
    float _831 = _825 + _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _833;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _843 = _831 + _841;
    float _845 = fma(_161, _705, _783);
    float _847 = 1.0 / _835;
    float _849 = _839 * _839;
    float _851 = _843 * _843;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _855 = _853 != 0;
    float _857 = _717 * _793;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _861 = _859 != 0;
    float _863 = _849 + _851;
    float _865 = fma(_787, _791, _827);
    float _867 = -_207;
    int _869 = _801 ? as_type<int>(_867) : as_type<int>(_207);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _873 = _691 + _871;
    float _875 = sqrt(_863);
    float _877 = -_857;
    float _879 = fma(_719, _789, _877);
    bool _881 = _773 > 0.5;
    float _883 = fma(_165, _709, _845);
    float _885 = fma(_781, _879, _865);
    float _887 = _873 * _847;
    float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _891 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _893 = isnan(_691);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _903;
    float _907 = -_201;
    int _909 = _881 ? as_type<int>(_907) : as_type<int>(_201);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _911;
    bool _915 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _917 = isnan(_691);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = fma(_913, _887, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _929 = _875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _931 = _883 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _933 = !_861;
    float _935 = _933 ? _201 : as_type<float>(_909);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _937;
    float _941 = -_925;
    float _943 = _941 + 1.0;
    float _945 = _931 + _885;
    bool _947 = !_855;
    float _949 = _947 ? _207 : as_type<float>(_869);
    float _951 = fma(_905, _887, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _953 = fma(_939, _887, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _955 = _901 * _943;
    float _957 = _905;
    float _959 = _849;
    float _961 = _851;
    float _963 = _829;
    float _965 = _831;
    if (!_929)
    {
        _957 = _945;
    }
    float _967 = _957;
    bool _969 = !_929;
    float _971 = _967;
    if (!_969)
    {
        float _973 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _975 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _977 = _875 + _975;
        float _979 = _945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _981 = rsqrt(_863);
        float _983 = _977 * _973;
        float _985 = _983 * 0.15915493667125701904296875;
        float _987 = _985 * 6.283185482025146484375;
        float _989 = sin(_987);
        float _991 = _985 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = fma(_989, _979, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _997 = _981 * _995;
        float _999 = _993 + (-1.0);
        float _1001 = fma(_839, _997, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1003 = fma(_843, _997, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1005 = _999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1009 = _1001 + _1007;
        float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1013 = _1003 + _1011;
        float _1015 = fma(_945, _993, _1005);
        float _1017 = _1009 * _1009;
        float _1019 = _1013 * _1013;
        _971 = _1015;
        _959 = _1017;
        _961 = _1019;
        _963 = _1001;
        _965 = _1003;
    }
    float _1021 = _971;
    float _1023 = _959;
    float _1025 = _961;
    float _1027 = _963;
    float _1029 = _965;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1033 = _1021 + _1031;
    float _1035 = _927 * _955;
    float _1037 = _951 * _955;
    float _1039 = -_901;
    float _1041 = _1039 + 1.0;
    float _1043 = _953 * _955;
    float _1045 = fma(_1033, _1033, _1023);
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1049 = _949 + 0.5;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1035);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1037);
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1043);
    float _1057 = _1045 + _1025;
    float _1059 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1061 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1051);
    float _1063 = -_935;
    float _1065 = _1063 + 0.5;
    float _1067 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1053);
    float _1069 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1055);
    float _1071 = _1059 * _889;
    float _1073 = sqrt(_1057);
    float _1075 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1081 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1083 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = _1077 * _1047;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _1071;
    out.m_68.y = _1085;
    out.m_70.x = _1083;
    out.m_70.y = _1087;
    out.m_70.z = _1089;
    bool _1091 = _1073 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1093 = isnan(_1073);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1099 = _1095 || _1097;
    float _1101 = _1033;
    float _1103 = _1089;
    float _1105 = _1049;
    if (!_1099)
    {
        _1101 = 1.0;
    }
    float _1107 = _1101;
    bool _1109 = !_1099;
    float _1111 = _1107;
    if (!_1109)
    {
        bool _1113 = _1073 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1115 = isnan(_1073);
        bool _1117 = _1113 || _1115;
        bool _1119 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1121 = _1117 || _1119;
        if (!_1121)
        {
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1125 = _1073 + _1123;
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1129 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1127;
            float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1133 = _1131 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1135 = 1.0 / _1129;
            float _1137 = _1125 * _1135;
            float _1139 = fma(_1137, _1133, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1111 = _1139;
            _1141 = true;
        }
        else
        {
            bool _1143 = _1073 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1145 = isnan(_1073);
            bool _1147 = _1143 || _1145;
            bool _1149 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1151 = _1147 || _1149;
            if (!_1151)
            {
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1155 = _1073 + _1153;
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1159 = _1157 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1161 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1163 = _1161 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1165 = 1.0 / _1159;
                float _1167 = _1155 * _1165;
                float _1169 = fma(_1167, _1163, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1111 = _1169;
                _1141 = true;
            }
            else
            {
                _1111 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1141 = false;
    float _1171 = _1111;
    float _1173 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1175 = _1021 + _1173;
    float _1177 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1179 = _1027 + _1177;
    float _1181 = fma(_1175, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1183 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1185 = _1029 + _1183;
    float _1187 = fma(_1179, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1189 = -_931;
    float _1191 = _1189 + _1181;
    float _1193 = fma(_1185, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1195 = -_823;
    float _1197 = _1195 + _1187;
    float _1199 = _1191 * _1191;
    float _1201 = -_825;
    float _1203 = _1201 + _1193;
    float _1205 = fma(_1197, _1197, _1199);
    float _1207 = fma(_1203, _1203, _1205);
    float _1209 = sqrt(_1207);
    bool _1211 = _1209 > 0.0;
    bool _1213 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1215 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan(0.5);
    bool _1221 = _1217 || _1219;
    float _1223 = _1185;
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1227 = _1197;
    float _1229 = _1171;
    float _1231 = _1187;
    if (!_1211)
    {
        _1223 = _1187;
    }
    float _1233 = _1223;
    float _1235 = _1233;
    if (!_1211)
    {
        _1103 = _1181;
    }
    float _1237 = _1103;
    float _1239 = _1237;
    if (!_1211)
    {
        _1225 = _1193;
    }
    float _1241 = _1225;
    bool _1243 = !_1211;
    float _1245 = _1241;
    if (!_1243)
    {
        bool _1247 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1249 = sqrt(_703);
        float _1251 = rsqrt(_1207);
        float _1253 = _1171;
        if (!_1247)
        {
            float _1255 = in.m_66.w;
            _1253 = _1255;
        }
        float _1257 = _1253;
        bool _1259 = _1249 > 0.0;
        float _1261 = _1233;
        if (!_1247)
        {
            float _1263 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            _1261 = _1263;
        }
        float _1265 = _1261;
        float _1267 = _1191 * _1251;
        float _1269 = _1237;
        float _1271 = _1251;
        float _1273 = _1267;
        if (_1247)
        {
            float _1275 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1269 = _1275;
        }
        float _1277 = _1269;
        float _1279 = _1197 * _1251;
        float _1281 = _1203 * _1251;
        if (_1259)
        {
            float _1283 = _721 * _1267;
            _1271 = _1283;
        }
        float _1285 = _1271;
        float _1287 = _1285;
        if (_1259)
        {
            float _1289 = fma(_719, _1279, _1285);
            _1287 = _1289;
        }
        float _1291 = _1287;
        float _1293 = _1291;
        float _1295 = _1265;
        float _1297 = _1257;
        if (!_1247)
        {
            float _1299 = _1265 * _1257;
            _1273 = _1299;
        }
        float _1301 = _1273;
        _1105 = _1301;
        if (_1259)
        {
            float _1303 = fma(_717, _1281, _1291);
            _1293 = _1303;
        }
        float _1305 = _1293;
        float _1307 = _1305;
        if (!_1259)
        {
            _1295 = _1187;
        }
        float _1309 = _1295;
        float _1311 = _1277;
        float _1313 = _1309;
        if (_1247)
        {
            float _1315 = _197 * _1277;
            _1297 = _1315;
        }
        float _1317 = _1297;
        float _1319 = _1317;
        if (_1247)
        {
            float _1321 = _193 * _1277;
            _1227 = _1321;
        }
        float _1323 = _1227;
        float _1325 = _1323;
        if (!_1247)
        {
            float _1327 = _197 * _1301;
            _1319 = _1327;
        }
        float _1329 = _1319;
        _1229 = _1329;
        if (!_1247)
        {
            float _1331 = _193 * _1301;
            _1325 = _1331;
        }
        float _1333 = _1325;
        if (_1247)
        {
            float _1335 = _203 * _1277;
            _211 = _1335;
        }
        float _1337 = _211;
        float _1339 = _1337;
        if (_1259)
        {
            float _1341 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            _213 = _1341;
        }
        float _1343 = _213;
        if (!_1247)
        {
            float _1345 = _203 * _1301;
            _1339 = _1345;
        }
        float _1347 = _1339;
        if (!_1259)
        {
            _1311 = _1181;
        }
        float _1349 = _1311;
        float _1351 = _1349;
        if (!_1259)
        {
            _1307 = _1193;
        }
        float _1353 = _1307;
        _1245 = _1353;
        if (_1259)
        {
            float _1355 = fma(_1333, _1343, _1187);
            _1313 = _1355;
        }
        float _1357 = _1313;
        _1235 = _1357;
        if (_1259)
        {
            float _1359 = fma(_1329, _1343, _1181);
            _1351 = _1359;
        }
        float _1361 = _1351;
        _1239 = _1361;
        if (_1259)
        {
            float _1363 = fma(_1347, _1343, _1193);
            _1245 = _1363;
        }
    }
    float _1365 = _1235;
    float _1367 = _1245;
    float _1369 = _1239;
    float _1371 = _1229;
    float _1373 = _1105;
    float _1375 = _1369;
    float _1377 = _1365;
    float _1379 = _1367;
    float _1381 = _1371;
    float _1383 = _1373;
    if (!_1221)
    {
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1387 = _931 + _1385;
        float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1391 = _823 + _1389;
        float _1393 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1395 = _1387 * _1387;
        float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1399 = _825 + _1397;
        float _1401 = fma(_1391, _1391, _1395);
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1405 = fma(_1399, _1399, _1401);
        float _1407 = sqrt(_1405);
        float _1409 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1411 = precise::min(_1407, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1413 = _1411 * _1403;
        float _1415 = -_823;
        float _1417 = _1415 + _1365;
        float _1419 = -_825;
        float _1421 = _1419 + _1367;
        float _1423 = _1409 * _1413;
        float _1425 = -_931;
        float _1427 = _1425 + _1369;
        float _1429 = fma(_1417, _1423, _823);
        float _1431 = fma(_1427, _1423, _931);
        float _1433 = fma(_1421, _1423, _825);
        _1375 = _1431;
        _1377 = _1429;
        _1379 = _1433;
        _1231 = _1423;
        _1381 = _1417;
    }
    float _1435 = _1375;
    float _1437 = _1377;
    float _1439 = _1379;
    float _1441 = _1231;
    float _1443 = _1381;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1447 = _1435 + _1445;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1451 = _1437 + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1455 = _1439 + _1453;
    float _1457 = _1447 * _1447;
    float _1459 = fma(_1451, _1451, _1457);
    float _1461 = fma(_1455, _1455, _1459);
    float _1463 = rsqrt(_1461);
    float _1465 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1467 = _1451 * _1465;
    float _1469 = _1455 * _1465;
    float _1471 = _1467 * _1467;
    float _1473 = _1469 * _1469;
    float _1475 = _1471 + _1473;
    float _1477 = sqrt(_1475);
    bool _1479 = _1477 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1483 = _1477 + _1481;
    float _1485 = _1463;
    float _1487 = _1483;
    float _1489 = _1441;
    float _1491 = _1447;
    float _1493 = _1467;
    if (_1479)
    {
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1485 = _1495;
    }
    float _1497 = _1485;
    float _1499 = _1497;
    if (_1479)
    {
        float _1501 = _1483 * _1497;
        _1487 = _1501;
    }
    float _1503 = _1487;
    if (_1479)
    {
        float _1505 = rsqrt(_1475);
        _1499 = _1505;
    }
    float _1507 = _1499;
    float _1509 = _1507;
    if (_1479)
    {
        float _1511 = _1503 * 0.15915493667125701904296875;
        _1489 = _1511;
    }
    float _1513 = _1489;
    float _1515 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1517 = _1455;
    if (_1479)
    {
        float _1519 = _1513 * 6.283185482025146484375;
        float _1521 = sin(_1519);
        _1517 = _1521;
    }
    float _1523 = _1517;
    float _1525 = precise::max(0.0, _1515);
    float _1527 = _1443;
    float _1529 = _1525;
    if (_1479)
    {
        float _1531 = _1513 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        _1527 = _1533;
    }
    float _1535 = _1527;
    float _1537 = -_1465;
    float _1539 = -_1525;
    float _1541 = fma(_1447, _1537, _1539);
    if (_1479)
    {
        float _1543 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1491 = _1543;
    }
    float _1545 = _1491;
    float _1547 = sqrt(_1461);
    float _1549 = _1523;
    float _1551 = _1545;
    if (_1479)
    {
        float _1553 = fma(_1523, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1549 = _1553;
    }
    float _1555 = _1549;
    float _1557 = _1555;
    if (_1479)
    {
        float _1559 = _1507 * _1555;
        _1383 = _1559;
    }
    float _1561 = _1383;
    if (!_1479)
    {
        _1509 = _1541;
    }
    float _1563 = _1509;
    float _1565 = _1563;
    if (_1479)
    {
        float _1567 = _1535 + (-1.0);
        _1529 = _1567;
    }
    float _1569 = _1529;
    float _1571 = _1569;
    if (_1479)
    {
        float _1573 = _1467 * _1561;
        _1493 = _1573;
    }
    float _1575 = _1493;
    if (!_1479)
    {
        _1557 = _1469;
    }
    float _1577 = _1557;
    float _1579 = _1577;
    if (_1479)
    {
        float _1581 = _1469 * _1561;
        _1579 = _1581;
    }
    float _1583 = _1579;
    if (_1479)
    {
        float _1585 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1585;
    }
    float _1587 = _1551;
    float _1589 = _1587;
    if (!_1479)
    {
        _1571 = _1471;
    }
    float _1591 = _1571;
    float _1593 = _1591;
    if (_1479)
    {
        float _1595 = _1575 * _1575;
        _1593 = _1595;
    }
    float _1597 = _1593;
    if (_1479)
    {
        float _1599 = fma(_1541, _1535, _1587);
        _1565 = _1599;
    }
    float _1601 = _1565;
    if (!_1479)
    {
        _1589 = _1473;
    }
    float _1603 = _1589;
    float _1605 = _1603;
    if (_1479)
    {
        float _1607 = _1583 * _1583;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1613 = fma(_1601, _1601, _1597);
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1617 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1615);
    float _1619 = precise::clamp(_1617, 0.0, 1.0);
    float _1621 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1611);
    float _1623 = _1613 + _1609;
    float _1625 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1627 = -_1619;
    float _1629 = _1627 + 1.0;
    float _1631 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1633 = rsqrt(_1623);
    float _1635 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1625);
    float _1637 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1639 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1621);
    float _1641 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1643 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1635);
    float _1645 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1637);
    float _1647 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1631);
    float _1649 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1651 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1645);
    float _1653 = abs(_1629);
    float _1655 = log2(_1653);
    float _1657 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1659 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1647);
    float _1661 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1665 = _1633 * _1575;
    float _1667 = _1633 * _1601;
    float _1669 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1671 = -_1663;
    float _1673 = fma(_1671, _1641, 1.0);
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1677 = _1633 * _1583;
    float _1679 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1669);
    float _1681 = _1659 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1683 = -_1675;
    float _1685 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1683);
    float _1687 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1689 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1679);
    float _1691 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1693 = -_1677;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1685);
    float _1697 = log2(_1673);
    float _1699 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1689);
    float _1701 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1703 = fma(_1695, -0.5, 0.5);
    float _1705 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1687);
    float _1707 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1701);
    float _1709 = exp2(_1691);
    float _1711 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1705);
    float _1713 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1707);
    float _1715 = 1.0 / _1699;
    float _1717 = fma(_1695, 0.5, 0.5);
    float _1719 = _1667 + 1.0;
    float _1721 = _1697 * 0.693147182464599609375;
    float _1723 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1725 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1727 = sqrt(_1703);
    float _1729 = -_1667;
    float _1731 = fma(_1709, _1719, _1729);
    float _1733 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1711);
    float _1735 = fma(_1717, _1723, -0.212114393711090087890625);
    float _1737 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1713);
    float _1739 = fma(_1717, _1735, 1.570728778839111328125);
    float _1741 = _1733 * _1715;
    float _1743 = _1737 * _1715;
    float _1745 = fma(_1741, 0.5, 0.5);
    float _1747 = fma(_1743, -0.5, 0.5);
    float _1749 = _1727 * 0.636619746685028076171875;
    float3 _4526 = float3(_1745, _1747, _1725);
    float _1751 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4526, float3(0.0), isnan(_4526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4526, float3(0.0), isnan(_4526)), level(0.0)).x;
    float _1753 = fma(_1731, 0.5, 0.5);
    float _1755 = -_1739;
    float _1757 = fma(_1749, _1755, 1.0);
    float3 _4544 = float3(_1745, _1747, _1725);
    float4 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4544, float3(0.0), isnan(_4544)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4544, float3(0.0), isnan(_4544)), level(0.0)).xyzw;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = _1760.w;
    float2 _4561 = float2(_1757, _1753);
    float3 _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4561, float2(0.0), isnan(_4561)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4561, float2(0.0), isnan(_4561)), level(0.0)).xyz;
    float _1774 = _1772.x;
    float _1776 = _1772.y;
    float _1778 = _1772.z;
    float _1780 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1782 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1784 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1782);
    float _1786 = exp2(_1780);
    float _1788 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1784);
    float _1790 = _1733 + _1699;
    float _1792 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1788);
    float _1794 = _1790 * 0.5;
    float _1796 = _1699 * 0.5;
    float _1798 = _1792 + _1699;
    out.gl_Position.x = _1733;
    out.gl_Position.y = _1737;
    out.gl_Position.z = _1792;
    out.gl_Position.w = _1699;
    float _1800 = -_1786;
    float _1802 = _1800 + 1.0;
    float _1804 = fma(_1737, -0.5, _1796);
    float _1806 = _1798 * 0.5;
    float _1808 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1810 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _1794;
    out.m_72.y = _1804;
    out.m_72.z = _1806;
    out.m_72.w = _1699;
    out.m_47.x = _1810;
    float _1812 = _1808 * _1751;
    float _1814 = -_1808;
    float _1816 = _1814 + 1.0;
    float _1818 = _1768 * _1812;
    float _1820 = _1778 * _1812;
    float _1822 = fma(_1774, _1818, _1762);
    float _1824 = fma(_1776, _1818, _1764);
    float _1826 = _1768 * _1816;
    float _1828 = fma(_1768, _1820, _1766);
    out.m_74.x = _1822;
    out.m_74.y = _1824;
    out.m_74.z = _1828;
    out.m_74.w = _1826;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1141 = false;
    bool _683 = false;
    bool _541 = false;
    bool _427 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1885 = as_type<float>(_109);
        out.gl_Position.z = _1885;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_123)
    {
        float _129 = float(_93);
        _103 = _129;
    }
    float _131 = _103;
    bool _133 = _127 >= _131;
    bool _135 = !_123;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_47.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _111 = as_type<int>(_143);
    }
    int _145 = _111;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1954 = as_type<float>(_145);
        out.gl_Position.z = _1954;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = in.m_54.x;
    float _151 = in.m_54.y;
    float _153 = in.m_54.z;
    float _155 = in.m_56.x;
    float _157 = in.m_56.y;
    float _159 = in.m_56.z;
    float _161 = in.m_58.x;
    float _163 = in.m_58.y;
    float _165 = in.m_58.z;
    float _167 = in.m_60.x;
    float _169 = in.m_60.y;
    float _171 = in.m_60.z;
    int _173 = as_type<int>(_147) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_147) & 2;
    bool _179 = _177 != 0;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _151 * _157;
    float _185 = _151 * _163;
    float _187 = fma(_149, _155, _183);
    float _189 = _151 * _169;
    float _191 = fma(_149, _161, _185);
    float _193 = fma(_153, _159, _187);
    float _195 = fma(_149, _167, _189);
    float _197 = fma(_153, _165, _191);
    bool _199 = !_179;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_153, _171, _195);
    bool _205 = !_175;
    float _207 = _205 ? (-0.5) : 0.5;
    bool _209 = !_181;
    float _211 = _197;
    float _213 = _193;
    float _231;
    if (!_209)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        float _235 = float(_93);
        float _237 = 1.0 / _235;
        float _239 = _127 * _237;
        _231 = _239;
    }
    _233 = false;
    float _241 = _231;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _249 = _241 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _241 + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _263;
    float _267 = 1.0 / _257;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _271 = 1.0 / _265;
    bool _273 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _275 = isnan(_241);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = 1.0 / _261;
    float _287 = _245 * _267;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _249 * _271;
    bool _303 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _305 = isnan(_241);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = -_283;
    float _317 = _315 + 1.0;
    float _319 = _313 * _317;
    float _321 = -_313;
    float _323 = _321 + 1.0;
    float _325 = _253 * _285;
    float _327 = -_299;
    float _329 = _327 + 1.0;
    bool _331 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _333 = isnan(_241);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _343;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = _283 * _329;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _353;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _361 = fma(_345, _287, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = _341 * _323;
    float _365 = fma(_355, _287, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _367 = fma(_349, _325, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _369 = fma(_359, _325, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _371 = -_341;
    float _373 = _371 + 1.0;
    float _375 = _361 * _363;
    float _377 = _365 * _363;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _379;
    float _383 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _375);
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _385;
    float _389 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _377);
    float _391 = fma(_381, _301, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _393 = fma(_367, _319, _383);
    float _395 = fma(_387, _301, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _397 = fma(_369, _319, _389);
    float _399 = fma(_391, _351, _393);
    float _401 = fma(_395, _351, _397);
    float _403 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].x, _399);
    float _405 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[146].y, _401);
    bool _407 = !_269;
    float _425;
    if (!_407)
    {
        float _409 = in.m_62.x;
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
        float _429 = float(_93);
        float _431 = 1.0 / _429;
        float _433 = _127 * _431;
        _425 = _433;
    }
    _427 = false;
    float _435 = _425;
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = _435 + _437;
    bool _441 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _443 = isnan(_435);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _453;
    bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _459 = 1.0 / _455;
    float _461 = -_451;
    float _463 = _461 + 1.0;
    float _465 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _465;
    float _469 = _439 * _459;
    bool _471 = _435 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _473 = isnan(_435);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _483;
    float _487 = fma(_467, _469, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _489;
    float _493 = _481 * _463;
    float _495 = fma(_485, _469, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _497 = fma(_491, _469, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _499 = -_481;
    float _501 = _499 + 1.0;
    float _503 = _487 * _493;
    float _505 = _495 * _493;
    float _507 = _497 * _493;
    float _509 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].x, _505);
    float _511 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].y, _507);
    float _513 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[107].z, _503);
    float _515 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[108].x, _509);
    float _517 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[108].y, _511);
    float _519 = fma(_451, (*spvDescriptorSet0.vp_c9)._m0[108].z, _513);
    bool _521 = !_457;
    float _539;
    if (!_521)
    {
        float _523 = in.m_62.x;
        float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _527 = _523 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _529 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _531 = _529 * _525;
        float _533 = floor(_531);
        float _535 = -_533;
        float _537 = _531 + _535;
        _539 = _537;
        _541 = true;
    }
    else
    {
        float _543 = float(_93);
        float _545 = 1.0 / _543;
        float _547 = _127 * _545;
        _539 = _547;
    }
    _541 = false;
    float _549 = _539;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _555 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = isnan(_549);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _571 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _573 = isnan(_549);
    bool _575 = _571 || _573;
    bool _577 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _579 = _575 || _577;
    float _581 = float(_579);
    float _583 = 1.0 / _553;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _585;
    float _589 = -_565;
    float _591 = _589 + 1.0;
    bool _593 = _549 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _595 = isnan(_549);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _601 = _597 || _599;
    float _603 = float(_601);
    bool _605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _607 = 1.0 / _569;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _611 = _609 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _613 = _587 * _583;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _549 + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _621 = _549 + _619;
    float _623 = fma(_613, _617, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _625 = _581 * _591;
    float _627 = -_581;
    float _629 = _627 + 1.0;
    float _631 = _611 * _607;
    float _633 = -_603;
    float _635 = _633 + 1.0;
    float _637 = _623 * _625;
    float _639 = fma(_631, _621, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _641 = _565 * _635;
    float _643 = fma(_629, (*spvDescriptorSet0.vp_c9)._m0[115].x, _637);
    float _645 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _647 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _649 = fma(_639, _641, _643);
    float _651 = _519 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _653 = _645 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _655 = _647 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _657 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[117].x, _649);
    float _659 = _651 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _661 = _657 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _653;
    out.m_64.y = _655;
    out.m_64.z = _659;
    out.m_64.w = _661;
    bool _663 = !_605;
    float _681;
    if (!_663)
    {
        float _665 = in.m_62.x;
        float _667 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _669 = _665 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _671 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _673 = _671 * _667;
        float _675 = floor(_673);
        float _677 = -_675;
        float _679 = _673 + _677;
        _681 = _679;
        _683 = true;
    }
    else
    {
        float _685 = float(_93);
        float _687 = 1.0 / _685;
        float _689 = _127 * _687;
        _681 = _689;
    }
    _683 = false;
    float _691 = _681;
    float _693 = _197 * _197;
    float _695 = in.m_66.x;
    float _697 = in.m_66.y;
    float _699 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _201);
    float _701 = fma(_193, _193, _693);
    float _703 = fma(_203, _203, _701);
    float _705 = in.m_44.x;
    float _707 = in.m_44.y;
    float _709 = in.m_44.z;
    float _711 = rsqrt(_703);
    float _713 = _405 * _697;
    float _715 = _403 * _695;
    float _717 = _203 * _711;
    float _719 = _193 * _711;
    float _721 = _197 * _711;
    float _723 = _713 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _725 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _727 = _717 * _725;
    float _729 = _715 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _731 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _733 = _721 * _731;
    float _735 = _157 * _707;
    float _737 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _739 = -_727;
    float _741 = fma(_719, _737, _739);
    float _743 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _745 = _719 * _743;
    float _747 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _749 = -_733;
    float _751 = fma(_717, _747, _749);
    float _753 = fma(_155, _705, _735);
    float _755 = _741 * _741;
    float _757 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _759 = -_745;
    float _761 = fma(_721, _757, _759);
    float _763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _765 = _169 * _707;
    float _767 = fma(_751, _751, _755);
    float _769 = _723 * _699;
    float _771 = in.m_62.x;
    float _773 = in.m_62.y;
    float _775 = fma(_167, _705, _765);
    float _777 = fma(_761, _761, _767);
    float _779 = _769 * _717;
    float _781 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _783 = _163 * _707;
    float _785 = rsqrt(_777);
    float _787 = _729 * _763;
    float _789 = _761 * _785;
    float _791 = _741 * _785;
    float _793 = _751 * _785;
    float _795 = _769 * _719;
    float _797 = _721 * _789;
    float _799 = _719 * _791;
    bool _801 = _771 > 0.5;
    float _803 = fma(_787, _793, _795);
    float _805 = fma(_787, _789, _779);
    float _807 = -_797;
    float _809 = fma(_717, _791, _807);
    float _811 = -_799;
    float _813 = fma(_721, _793, _811);
    float _815 = fma(_159, _709, _753);
    float _817 = fma(_171, _709, _775);
    float _819 = fma(_781, _809, _803);
    float _821 = fma(_781, _813, _805);
    float _823 = _815 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _825 = _817 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _827 = _769 * _721;
    float _829 = _823 + _819;
    float _831 = _825 + _821;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _833;
    float _837 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _839 = _829 + _837;
    float _841 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _843 = _831 + _841;
    float _845 = fma(_161, _705, _783);
    float _847 = 1.0 / _835;
    float _849 = _839 * _839;
    float _851 = _843 * _843;
    int _853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _855 = _853 != 0;
    float _857 = _717 * _793;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _861 = _859 != 0;
    float _863 = _849 + _851;
    float _865 = fma(_787, _791, _827);
    float _867 = -_207;
    int _869 = _801 ? as_type<int>(_867) : as_type<int>(_207);
    float _871 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _873 = _691 + _871;
    float _875 = sqrt(_863);
    float _877 = -_857;
    float _879 = fma(_719, _789, _877);
    bool _881 = _773 > 0.5;
    float _883 = fma(_165, _709, _845);
    float _885 = fma(_781, _879, _865);
    float _887 = _873 * _847;
    float _889 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _891 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _893 = isnan(_691);
    bool _895 = _891 || _893;
    bool _897 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _899 = _895 || _897;
    float _901 = float(_899);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _905 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _903;
    float _907 = -_201;
    int _909 = _881 ? as_type<int>(_907) : as_type<int>(_201);
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _911;
    bool _915 = _691 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _917 = isnan(_691);
    bool _919 = _915 || _917;
    bool _921 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _923 = _919 || _921;
    float _925 = float(_923);
    float _927 = fma(_913, _887, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _929 = _875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _931 = _883 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _933 = !_861;
    float _935 = _933 ? _201 : as_type<float>(_909);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _937;
    float _941 = -_925;
    float _943 = _941 + 1.0;
    float _945 = _931 + _885;
    bool _947 = !_855;
    float _949 = _947 ? _207 : as_type<float>(_869);
    float _951 = fma(_905, _887, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _953 = fma(_939, _887, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _955 = _901 * _943;
    float _957 = _905;
    float _959 = _849;
    float _961 = _851;
    float _963 = _829;
    float _965 = _831;
    if (!_929)
    {
        _957 = _945;
    }
    float _967 = _957;
    bool _969 = !_929;
    float _971 = _967;
    if (!_969)
    {
        float _973 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _975 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _977 = _875 + _975;
        float _979 = _945 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _981 = rsqrt(_863);
        float _983 = _977 * _973;
        float _985 = _983 * 0.15915493667125701904296875;
        float _987 = _985 * 6.283185482025146484375;
        float _989 = sin(_987);
        float _991 = _985 * 6.283185482025146484375;
        float _993 = cos(_991);
        float _995 = fma(_989, _979, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _997 = _981 * _995;
        float _999 = _993 + (-1.0);
        float _1001 = fma(_839, _997, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1003 = fma(_843, _997, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1005 = _999 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1009 = _1001 + _1007;
        float _1011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1013 = _1003 + _1011;
        float _1015 = fma(_945, _993, _1005);
        float _1017 = _1009 * _1009;
        float _1019 = _1013 * _1013;
        _971 = _1015;
        _959 = _1017;
        _961 = _1019;
        _963 = _1001;
        _965 = _1003;
    }
    float _1021 = _971;
    float _1023 = _959;
    float _1025 = _961;
    float _1027 = _963;
    float _1029 = _965;
    float _1031 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1033 = _1021 + _1031;
    float _1035 = _927 * _955;
    float _1037 = _951 * _955;
    float _1039 = -_901;
    float _1041 = _1039 + 1.0;
    float _1043 = _953 * _955;
    float _1045 = fma(_1033, _1033, _1023);
    float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1049 = _949 + 0.5;
    float _1051 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1035);
    float _1053 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1037);
    float _1055 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1043);
    float _1057 = _1045 + _1025;
    float _1059 = _1049 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1061 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1051);
    float _1063 = -_935;
    float _1065 = _1063 + 0.5;
    float _1067 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1053);
    float _1069 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1055);
    float _1071 = _1059 * _889;
    float _1073 = sqrt(_1057);
    float _1075 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1077 = _1065 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1079 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1081 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1083 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1085 = _1077 * _1047;
    float _1087 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1089 = _1081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_68.x = _1071;
    out.m_68.y = _1085;
    out.m_70.x = _1083;
    out.m_70.y = _1087;
    out.m_70.z = _1089;
    bool _1091 = _1073 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1093 = isnan(_1073);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1099 = _1095 || _1097;
    float _1101 = _1033;
    float _1103 = _1089;
    float _1105 = _1049;
    if (!_1099)
    {
        _1101 = 1.0;
    }
    float _1107 = _1101;
    bool _1109 = !_1099;
    float _1111 = _1107;
    if (!_1109)
    {
        bool _1113 = _1073 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1115 = isnan(_1073);
        bool _1117 = _1113 || _1115;
        bool _1119 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1121 = _1117 || _1119;
        if (!_1121)
        {
            float _1123 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1125 = _1073 + _1123;
            float _1127 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1129 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1127;
            float _1131 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1133 = _1131 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1135 = 1.0 / _1129;
            float _1137 = _1125 * _1135;
            float _1139 = fma(_1137, _1133, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1111 = _1139;
            _1141 = true;
        }
        else
        {
            bool _1143 = _1073 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1145 = isnan(_1073);
            bool _1147 = _1143 || _1145;
            bool _1149 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1151 = _1147 || _1149;
            if (!_1151)
            {
                float _1153 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1155 = _1073 + _1153;
                float _1157 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1159 = _1157 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1161 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1163 = _1161 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1165 = 1.0 / _1159;
                float _1167 = _1155 * _1165;
                float _1169 = fma(_1167, _1163, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1111 = _1169;
                _1141 = true;
            }
            else
            {
                _1111 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1141 = false;
    float _1171 = _1111;
    float _1173 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1175 = _1021 + _1173;
    float _1177 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1179 = _1027 + _1177;
    float _1181 = fma(_1175, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1183 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1185 = _1029 + _1183;
    float _1187 = fma(_1179, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1189 = -_931;
    float _1191 = _1189 + _1181;
    float _1193 = fma(_1185, _1171, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1195 = -_823;
    float _1197 = _1195 + _1187;
    float _1199 = _1191 * _1191;
    float _1201 = -_825;
    float _1203 = _1201 + _1193;
    float _1205 = fma(_1197, _1197, _1199);
    float _1207 = fma(_1203, _1203, _1205);
    float _1209 = sqrt(_1207);
    bool _1211 = _1209 > 0.0;
    bool _1213 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1215 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan(0.5);
    bool _1221 = _1217 || _1219;
    float _1223 = _1185;
    float _1225 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1227 = _1197;
    float _1229 = _1171;
    float _1231 = _1187;
    if (!_1211)
    {
        _1223 = _1187;
    }
    float _1233 = _1223;
    float _1235 = _1233;
    if (!_1211)
    {
        _1103 = _1181;
    }
    float _1237 = _1103;
    float _1239 = _1237;
    if (!_1211)
    {
        _1225 = _1193;
    }
    float _1241 = _1225;
    bool _1243 = !_1211;
    float _1245 = _1241;
    if (!_1243)
    {
        bool _1247 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1249 = sqrt(_703);
        float _1251 = rsqrt(_1207);
        float _1253 = _1171;
        if (!_1247)
        {
            float _1255 = in.m_66.w;
            _1253 = _1255;
        }
        float _1257 = _1253;
        bool _1259 = _1249 > 0.0;
        float _1261 = _1233;
        if (!_1247)
        {
            float _1263 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            _1261 = _1263;
        }
        float _1265 = _1261;
        float _1267 = _1191 * _1251;
        float _1269 = _1237;
        float _1271 = _1251;
        float _1273 = _1267;
        if (_1247)
        {
            float _1275 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1269 = _1275;
        }
        float _1277 = _1269;
        float _1279 = _1197 * _1251;
        float _1281 = _1203 * _1251;
        if (_1259)
        {
            float _1283 = _721 * _1267;
            _1271 = _1283;
        }
        float _1285 = _1271;
        float _1287 = _1285;
        if (_1259)
        {
            float _1289 = fma(_719, _1279, _1285);
            _1287 = _1289;
        }
        float _1291 = _1287;
        float _1293 = _1291;
        float _1295 = _1265;
        float _1297 = _1257;
        if (!_1247)
        {
            float _1299 = _1265 * _1257;
            _1273 = _1299;
        }
        float _1301 = _1273;
        _1105 = _1301;
        if (_1259)
        {
            float _1303 = fma(_717, _1281, _1291);
            _1293 = _1303;
        }
        float _1305 = _1293;
        float _1307 = _1305;
        if (!_1259)
        {
            _1295 = _1187;
        }
        float _1309 = _1295;
        float _1311 = _1277;
        float _1313 = _1309;
        if (_1247)
        {
            float _1315 = _197 * _1277;
            _1297 = _1315;
        }
        float _1317 = _1297;
        float _1319 = _1317;
        if (_1247)
        {
            float _1321 = _193 * _1277;
            _1227 = _1321;
        }
        float _1323 = _1227;
        float _1325 = _1323;
        if (!_1247)
        {
            float _1327 = _197 * _1301;
            _1319 = _1327;
        }
        float _1329 = _1319;
        _1229 = _1329;
        if (!_1247)
        {
            float _1331 = _193 * _1301;
            _1325 = _1331;
        }
        float _1333 = _1325;
        if (_1247)
        {
            float _1335 = _203 * _1277;
            _211 = _1335;
        }
        float _1337 = _211;
        float _1339 = _1337;
        if (_1259)
        {
            float _1341 = _1305 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            _213 = _1341;
        }
        float _1343 = _213;
        if (!_1247)
        {
            float _1345 = _203 * _1301;
            _1339 = _1345;
        }
        float _1347 = _1339;
        if (!_1259)
        {
            _1311 = _1181;
        }
        float _1349 = _1311;
        float _1351 = _1349;
        if (!_1259)
        {
            _1307 = _1193;
        }
        float _1353 = _1307;
        _1245 = _1353;
        if (_1259)
        {
            float _1355 = fma(_1333, _1343, _1187);
            _1313 = _1355;
        }
        float _1357 = _1313;
        _1235 = _1357;
        if (_1259)
        {
            float _1359 = fma(_1329, _1343, _1181);
            _1351 = _1359;
        }
        float _1361 = _1351;
        _1239 = _1361;
        if (_1259)
        {
            float _1363 = fma(_1347, _1343, _1193);
            _1245 = _1363;
        }
    }
    float _1365 = _1235;
    float _1367 = _1245;
    float _1369 = _1239;
    float _1371 = _1229;
    float _1373 = _1105;
    float _1375 = _1369;
    float _1377 = _1365;
    float _1379 = _1367;
    float _1381 = _1371;
    float _1383 = _1373;
    if (!_1221)
    {
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1387 = _931 + _1385;
        float _1389 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1391 = _823 + _1389;
        float _1393 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1395 = _1387 * _1387;
        float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1399 = _825 + _1397;
        float _1401 = fma(_1391, _1391, _1395);
        float _1403 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1405 = fma(_1399, _1399, _1401);
        float _1407 = sqrt(_1405);
        float _1409 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1411 = precise::min(_1407, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1413 = _1411 * _1403;
        float _1415 = -_823;
        float _1417 = _1415 + _1365;
        float _1419 = -_825;
        float _1421 = _1419 + _1367;
        float _1423 = _1409 * _1413;
        float _1425 = -_931;
        float _1427 = _1425 + _1369;
        float _1429 = fma(_1417, _1423, _823);
        float _1431 = fma(_1427, _1423, _931);
        float _1433 = fma(_1421, _1423, _825);
        _1375 = _1431;
        _1377 = _1429;
        _1379 = _1433;
        _1231 = _1423;
        _1381 = _1417;
    }
    float _1435 = _1375;
    float _1437 = _1377;
    float _1439 = _1379;
    float _1441 = _1231;
    float _1443 = _1381;
    float _1445 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1447 = _1435 + _1445;
    float _1449 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1451 = _1437 + _1449;
    float _1453 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1455 = _1439 + _1453;
    float _1457 = _1447 * _1447;
    float _1459 = fma(_1451, _1451, _1457);
    float _1461 = fma(_1455, _1455, _1459);
    float _1463 = rsqrt(_1461);
    float _1465 = _1463 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1467 = _1451 * _1465;
    float _1469 = _1455 * _1465;
    float _1471 = _1467 * _1467;
    float _1473 = _1469 * _1469;
    float _1475 = _1471 + _1473;
    float _1477 = sqrt(_1475);
    bool _1479 = _1477 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1481 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1483 = _1477 + _1481;
    float _1485 = _1463;
    float _1487 = _1483;
    float _1489 = _1441;
    float _1491 = _1447;
    float _1493 = _1467;
    if (_1479)
    {
        float _1495 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1485 = _1495;
    }
    float _1497 = _1485;
    float _1499 = _1497;
    if (_1479)
    {
        float _1501 = _1483 * _1497;
        _1487 = _1501;
    }
    float _1503 = _1487;
    if (_1479)
    {
        float _1505 = rsqrt(_1475);
        _1499 = _1505;
    }
    float _1507 = _1499;
    float _1509 = _1507;
    if (_1479)
    {
        float _1511 = _1503 * 0.15915493667125701904296875;
        _1489 = _1511;
    }
    float _1513 = _1489;
    float _1515 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1517 = _1455;
    if (_1479)
    {
        float _1519 = _1513 * 6.283185482025146484375;
        float _1521 = sin(_1519);
        _1517 = _1521;
    }
    float _1523 = _1517;
    float _1525 = precise::max(0.0, _1515);
    float _1527 = _1443;
    float _1529 = _1525;
    if (_1479)
    {
        float _1531 = _1513 * 6.283185482025146484375;
        float _1533 = cos(_1531);
        _1527 = _1533;
    }
    float _1535 = _1527;
    float _1537 = -_1465;
    float _1539 = -_1525;
    float _1541 = fma(_1447, _1537, _1539);
    if (_1479)
    {
        float _1543 = _1541 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1491 = _1543;
    }
    float _1545 = _1491;
    float _1547 = sqrt(_1461);
    float _1549 = _1523;
    float _1551 = _1545;
    if (_1479)
    {
        float _1553 = fma(_1523, _1545, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1549 = _1553;
    }
    float _1555 = _1549;
    float _1557 = _1555;
    if (_1479)
    {
        float _1559 = _1507 * _1555;
        _1383 = _1559;
    }
    float _1561 = _1383;
    if (!_1479)
    {
        _1509 = _1541;
    }
    float _1563 = _1509;
    float _1565 = _1563;
    if (_1479)
    {
        float _1567 = _1535 + (-1.0);
        _1529 = _1567;
    }
    float _1569 = _1529;
    float _1571 = _1569;
    if (_1479)
    {
        float _1573 = _1467 * _1561;
        _1493 = _1573;
    }
    float _1575 = _1493;
    if (!_1479)
    {
        _1557 = _1469;
    }
    float _1577 = _1557;
    float _1579 = _1577;
    if (_1479)
    {
        float _1581 = _1469 * _1561;
        _1579 = _1581;
    }
    float _1583 = _1579;
    if (_1479)
    {
        float _1585 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1551 = _1585;
    }
    float _1587 = _1551;
    float _1589 = _1587;
    if (!_1479)
    {
        _1571 = _1471;
    }
    float _1591 = _1571;
    float _1593 = _1591;
    if (_1479)
    {
        float _1595 = _1575 * _1575;
        _1593 = _1595;
    }
    float _1597 = _1593;
    if (_1479)
    {
        float _1599 = fma(_1541, _1535, _1587);
        _1565 = _1599;
    }
    float _1601 = _1565;
    if (!_1479)
    {
        _1589 = _1473;
    }
    float _1603 = _1589;
    float _1605 = _1603;
    if (_1479)
    {
        float _1607 = _1583 * _1583;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1613 = fma(_1601, _1601, _1597);
    float _1615 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1617 = fma(_1547, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1615);
    float _1619 = precise::clamp(_1617, 0.0, 1.0);
    float _1621 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1611);
    float _1623 = _1613 + _1609;
    float _1625 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1627 = -_1619;
    float _1629 = _1627 + 1.0;
    float _1631 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1633 = rsqrt(_1623);
    float _1635 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1625);
    float _1637 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1639 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1621);
    float _1641 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1643 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1635);
    float _1645 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1637);
    float _1647 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1631);
    float _1649 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1651 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1645);
    float _1653 = abs(_1629);
    float _1655 = log2(_1653);
    float _1657 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1659 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1647);
    float _1661 = _1651 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1663 = _1649 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1665 = _1633 * _1575;
    float _1667 = _1633 * _1601;
    float _1669 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1671 = -_1663;
    float _1673 = fma(_1671, _1641, 1.0);
    float _1675 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1677 = _1633 * _1583;
    float _1679 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1669);
    float _1681 = _1659 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1683 = -_1675;
    float _1685 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1683);
    float _1687 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1689 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1679);
    float _1691 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1693 = -_1677;
    float _1695 = fma(_1693, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1685);
    float _1697 = log2(_1673);
    float _1699 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1689);
    float _1701 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1703 = fma(_1695, -0.5, 0.5);
    float _1705 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1687);
    float _1707 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1701);
    float _1709 = exp2(_1691);
    float _1711 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1705);
    float _1713 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1707);
    float _1715 = 1.0 / _1699;
    float _1717 = fma(_1695, 0.5, 0.5);
    float _1719 = _1667 + 1.0;
    float _1721 = _1697 * 0.693147182464599609375;
    float _1723 = fma(_1717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1725 = _1721 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1727 = sqrt(_1703);
    float _1729 = -_1667;
    float _1731 = fma(_1709, _1719, _1729);
    float _1733 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1711);
    float _1735 = fma(_1717, _1723, -0.212114393711090087890625);
    float _1737 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1713);
    float _1739 = fma(_1717, _1735, 1.570728778839111328125);
    float _1741 = _1733 * _1715;
    float _1743 = _1737 * _1715;
    float _1745 = fma(_1741, 0.5, 0.5);
    float _1747 = fma(_1743, -0.5, 0.5);
    float _1749 = _1727 * 0.636619746685028076171875;
    float3 _4526 = float3(_1745, _1747, _1725);
    float _1751 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4526, float3(0.0), isnan(_4526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4526, float3(0.0), isnan(_4526)), level(0.0)).x;
    float _1753 = fma(_1731, 0.5, 0.5);
    float _1755 = -_1739;
    float _1757 = fma(_1749, _1755, 1.0);
    float3 _4544 = float3(_1745, _1747, _1725);
    float4 _1760 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4544, float3(0.0), isnan(_4544)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4544, float3(0.0), isnan(_4544)), level(0.0)).xyzw;
    float _1762 = _1760.x;
    float _1764 = _1760.y;
    float _1766 = _1760.z;
    float _1768 = _1760.w;
    float2 _4561 = float2(_1757, _1753);
    float3 _1772 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4561, float2(0.0), isnan(_4561)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4561, float2(0.0), isnan(_4561)), level(0.0)).xyz;
    float _1774 = _1772.x;
    float _1776 = _1772.y;
    float _1778 = _1772.z;
    float _1780 = _1655 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1782 = _1661 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1784 = fma(_1657, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1782);
    float _1786 = exp2(_1780);
    float _1788 = fma(_1649, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1784);
    float _1790 = _1733 + _1699;
    float _1792 = fma(_1681, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1788);
    float _1794 = _1790 * 0.5;
    float _1796 = _1699 * 0.5;
    float _1798 = _1792 + _1699;
    out.gl_Position.x = _1733;
    out.gl_Position.y = _1737;
    out.gl_Position.z = _1792;
    out.gl_Position.w = _1699;
    float _1800 = -_1786;
    float _1802 = _1800 + 1.0;
    float _1804 = fma(_1737, -0.5, _1796);
    float _1806 = _1798 * 0.5;
    float _1808 = _1802 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1810 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _1794;
    out.m_72.y = _1804;
    out.m_72.z = _1806;
    out.m_72.w = _1699;
    out.m_47.x = _1810;
    float _1812 = _1808 * _1751;
    float _1814 = -_1808;
    float _1816 = _1814 + 1.0;
    float _1818 = _1768 * _1812;
    float _1820 = _1778 * _1812;
    float _1822 = fma(_1774, _1818, _1762);
    float _1824 = fma(_1776, _1818, _1764);
    float _1826 = _1768 * _1816;
    float _1828 = fma(_1768, _1820, _1766);
    out.m_74.x = _1822;
    out.m_74.y = _1824;
    out.m_74.z = _1828;
    out.m_74.w = _1826;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

