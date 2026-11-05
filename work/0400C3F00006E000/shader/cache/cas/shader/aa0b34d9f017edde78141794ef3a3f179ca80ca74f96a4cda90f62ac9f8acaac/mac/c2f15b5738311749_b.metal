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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_74 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_52 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _739 = false;
    bool _503 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3390 = as_type<float>(_109);
        out.gl_Position.z = _3390;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_47.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3460 = as_type<float>(_147);
        out.gl_Position.z = _3460;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_52.x;
    float _153 = in.m_52.y;
    float _155 = in.m_52.z;
    int _157 = as_type<int>(_149) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_149) & 2;
    bool _163 = _161 != 0;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _171 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _173 = !_159;
    float _175 = _173 ? (-0.5) : 0.5;
    float _177 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _179 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    float _181 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _171);
    bool _183 = !_163;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _189 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _191 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _193 = !_165;
    float _195 = _187;
    float _197 = _189;
    float _215;
    if (!_193)
    {
        float _199 = in.m_54.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_93);
        float _221 = 1.0 / _219;
        float _223 = _127 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = 1.0 / _233;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _249;
    bool _253 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _255 = isnan(_225);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = 1.0 / _237;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _225 + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _241;
    float _275 = _269 * _247;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _225 + _277;
    float _281 = 1.0 / _245;
    float _283 = _229 * _265;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _225 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _291 = _225 + _289;
    float _293 = 1.0 / _251;
    float _295 = _279 * _273;
    bool _297 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _299 = isnan(_225);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    bool _309 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _311 = isnan(_225);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _287 * _281;
    float _323 = -_263;
    float _325 = _323 + 1.0;
    float _327 = -_307;
    float _329 = _327 + 1.0;
    float _331 = _307 * _325;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = _291 * _293;
    bool _343 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _345 = isnan(_225);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_319;
    float _357 = _355 + 1.0;
    float _359 = _319 * _329;
    float _361 = fma(_335, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_339, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _365 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _367 = isnan(_225);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = _353 * _357;
    float _379 = -_353;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _387 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _389 = isnan(_225);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = _375 * _381;
    float _405 = -_375;
    float _407 = _405 + 1.0;
    float _409 = fma(_385, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = -_397;
    float _413 = _411 + 1.0;
    float _415 = fma(_401, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _417 = _397 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _423;
    float _427 = _361 * _417;
    float _429 = _363 * _417;
    float _431 = fma(_421, _295, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _433 = fma(_425, _295, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _435 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _427);
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _429);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _443 = fma(_415, _403, _435);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _449 = fma(_409, _403, _437);
    float _451 = fma(_441, _321, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _453;
    float _457 = fma(_431, _377, _443);
    float _459 = fma(_447, _321, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _461;
    float _465 = fma(_433, _377, _449);
    float _467 = fma(_455, _341, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _469 = fma(_451, _359, _457);
    float _471 = fma(_463, _341, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _473 = fma(_459, _359, _465);
    float _475 = fma(_467, _331, _469);
    float _477 = fma(_471, _331, _473);
    float _479 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[148].x, _475);
    float _481 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[148].y, _477);
    bool _483 = !_271;
    float _501;
    if (!_483)
    {
        float _485 = in.m_54.x;
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _489 = _485 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_93);
        float _507 = 1.0 / _505;
        float _509 = _127 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _515 = _511 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _529 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _531 = isnan(_511);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = 1.0 / _519;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _547 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _549 = isnan(_511);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _561 = 1.0 / _527;
    float _563 = _523 * _541;
    bool _565 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _567 = isnan(_511);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = 1.0 / _545;
    float _579 = -_539;
    float _581 = _579 + 1.0;
    float _583 = fma(_563, _515, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _589 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _591 = isnan(_511);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -_575;
    float _603 = _601 + 1.0;
    float _605 = _575 * _581;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _611 = 1.0 / _587;
    float _613 = -_599;
    float _615 = _613 + 1.0;
    float _617 = _557 * _603;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _619;
    float _623 = _609 * _561;
    float _625 = _539 * _615;
    float _627 = _583 * _617;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _511 + _629;
    float _633 = -_557;
    float _635 = _633 + 1.0;
    bool _637 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _639 = isnan(_511);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = _621 * _577;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _657 = _511 + _655;
    float _659 = fma(_623, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _661 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[115].x, _627);
    float _663 = -_647;
    float _665 = _663 + 1.0;
    float _667 = _653 * _611;
    float _669 = fma(_649, _657, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _673 = _511 + _671;
    float _675 = fma(_659, _605, _661);
    float _677 = _599 * _665;
    float _679 = fma(_667, _673, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _681 = fma(_669, _625, _675);
    float _683 = fma(_679, _677, _681);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _689 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[119].x, _683);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _689 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = in.m_56.x;
    float _703 = in.m_56.y;
    out.m_58.x = _693;
    out.m_58.y = _695;
    out.m_58.z = _699;
    out.m_58.w = _697;
    float _705 = _481 * _703;
    float _707 = _479 * _701;
    bool _709 = !_559;
    float _733;
    float _735;
    float _737;
    if (!_709)
    {
        float _711 = in.m_54.x;
        float _713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _715 = float(_93);
        float _717 = 1.0 / _715;
        float _719 = _711 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _721 = _127 * _717;
        float _723 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _725 = _723 * _713;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = _715;
        _737 = _721;
        _739 = true;
    }
    else
    {
        float _741 = float(_93);
        float _743 = 1.0 / _741;
        float _745 = _127 * _743;
        _733 = _745;
        _735 = _741;
        _737 = _745;
    }
    _739 = false;
    float _747 = _733;
    float _749 = _735;
    float _751 = _737;
    float _753 = in.m_54.x;
    float _755 = in.m_54.y;
    float _757 = in.m_54.z;
    float _759 = in.m_54.w;
    float _761 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _763 = log2(_761);
    float _765 = _705 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _769 = _767 != 0;
    float _771 = _707 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _781 = _757 * 2.0;
    float _783 = _753 * 2.0;
    float _785 = _755 * 2.0;
    bool _787 = _755 > 0.5;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _791 = floor(_783);
    bool _793 = _757 > 0.5;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _797 = -_175;
    int _799 = _787 ? as_type<int>(_797) : as_type<int>(_175);
    float _801 = _763 * _127;
    int _803 = int(_559);
    int _805 = _769 ? 2 : 0;
    int _807 = _803 | _805;
    int _809 = _793 ? 4 : 0;
    int _811 = _807 | _809;
    int _813 = _787 ? 8 : 0;
    int _815 = _811 | _813;
    int _817 = false ? 16 : 0;
    int _819 = _815 | _817;
    int _821 = false ? 32 : 0;
    int _823 = _819 | _821;
    int _825 = false ? 64 : 0;
    int _827 = _823 | _825;
    int _829 = _827 & 4;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _833 = -_185;
    int _835 = _793 ? as_type<int>(_833) : as_type<int>(_185);
    float _837 = floor(_781);
    float _839 = _753 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _841 = -_773;
    float _843 = fma(_839, 2.0, _841);
    float _845 = floor(_785);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _851 = -_127;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[76].x, _843);
    float _855 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _847);
    float _857 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[88].w, _849);
    bool _859 = _837 > 0.0;
    float _861 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _863 = _837 >= 0.0;
    bool _865 = isnan(_837);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    float _873 = exp2(_801);
    float _875 = _755 + _753;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _883 = _881 != 0;
    float _885 = fma(_861, -2.0, _775);
    bool _887 = _791 >= 0.0;
    bool _889 = isnan(_791);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = _875 + (-1.0);
    bool _899 = _845 >= 0.0;
    bool _901 = isnan(_845);
    bool _903 = _899 || _901;
    bool _905 = isnan(0.0);
    bool _907 = _903 || _905;
    float _909 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _911 = int(_909);
    bool _913 = !_879;
    float _915 = _913 ? _175 : as_type<float>(_799);
    float _917 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _919 = !_883;
    float _921 = _919 ? _185 : as_type<float>(_835);
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _933 = _931 != 0;
    int _935 = _871 ? 0 : 1;
    float _937 = -_873;
    float _939 = _937 + 1.0;
    bool _941 = _791 > 0.0;
    bool _943 = !_925;
    int _945 = _943 ? 0 : 1;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _949 = _947 != 0;
    int _951 = ~_935;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    int _957 = _955;
    float _959 = _897;
    float _961 = _839;
    float _963 = _791;
    if (!_859)
    {
        int _965 = ~_935;
        int _967 = _965 + 1;
        _957 = _967;
    }
    int _969 = _957;
    int _971 = abs(_945);
    bool _973 = _845 > 0.0;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _977 = float(_971);
    float _979 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _981 = int(_979);
    if (_949)
    {
        _959 = _753;
    }
    float _983 = _959;
    float _985 = _983;
    if (!_949)
    {
        _961 = _757;
    }
    float _987 = _961;
    float _989 = _987;
    if (!_949)
    {
        _985 = _757;
    }
    float _991 = _985;
    float _993 = _991;
    if (!_949)
    {
        _963 = _755;
    }
    float _995 = _963;
    float _997 = _995;
    if (_949)
    {
        _989 = _755;
    }
    float _999 = _989;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1003 = _999;
    if (_949)
    {
        _997 = _753;
    }
    float _1005 = _997;
    if (_949)
    {
        _993 = _755;
    }
    float _1007 = _993;
    float _1009 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[83].w, _777);
    float _1011 = _1007;
    if (!_949)
    {
        _1003 = _757;
    }
    float _1013 = _1003;
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1017 = _1013;
    if (!_949)
    {
        _1011 = _753;
    }
    float _1019 = _1011;
    float _1021 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[83].z, _975);
    if (_949)
    {
        _1017 = _755;
    }
    float _1023 = _1017;
    float _1025 = -_779;
    float _1027 = fma(_1015, 2.0, _1025);
    float _1029 = -_831;
    float _1031 = fma(_1001, 2.0, _1029);
    float _1033 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1035 = float(_969);
    float _1037 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1039 = fma(_1033, -2.0, _795);
    float _1041 = float(_911);
    float _1043 = fma(_1037, -2.0, _789);
    float _1045 = _977 * _1035;
    float _1047 = in.m_60.x;
    float _1049 = in.m_60.y;
    float _1051 = in.m_60.z;
    int _1053 = _895 ? 0 : 1;
    float _1055 = 1.0 / _1041;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1059 = 1.0 + _1057;
    int _1061 = _907 ? 0 : 1;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1065 = ~_1053;
    int _1067 = _1065 + 1;
    int _1069 = _1067 + 1;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1073 = 1.0 / _1059;
    int _1075 = _1069;
    if (!_941)
    {
        int _1077 = ~_1053;
        int _1079 = _1077 + 1;
        _1075 = _1079;
    }
    int _1081 = _1075;
    float _1083 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1063);
    bool _1085 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1087 = isnan(1.0);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1093 = _1089 || _1091;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1097 = ~_1061;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    float _1103 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1071);
    int _1105 = _1101;
    if (!_973)
    {
        int _1107 = ~_1061;
        int _1109 = _1107 + 1;
        _1105 = _1109;
    }
    int _1111 = _1105;
    float _1113 = _1045 * (-2.0);
    bool _1115 = !_929;
    int _1117 = _1115 ? 0 : 1;
    float _1119 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1021);
    bool _1121 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1123 = isnan(0.0);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1129 = _1125 || _1127;
    float _1131 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1095);
    float _1133 = float(_981);
    float _1135 = _753 + (-0.5);
    int _1137 = abs(_1117);
    float _1139 = fma(_1113, _1047, _1047);
    float _1141 = _1129 ? _939 : 0.0;
    float _1143 = -_127;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1031);
    bool _1147 = !_933;
    int _1149 = _1147 ? 0 : 1;
    float _1151 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1131);
    float _1153 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _885);
    float _1155 = _1133 * _127;
    float _1157 = float(_1081);
    float _1159 = _1055 * _127;
    float _1161 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1083);
    float _1163 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _855);
    float _1165 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1103);
    float _1167 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _857);
    float _1169 = -_127;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1027);
    float _1173 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1009);
    float _1175 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1043);
    float _1177 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1039);
    if (_1093)
    {
        float _1179 = _1141 * _1073;
        _129 = _1179;
    }
    float _1181 = _129;
    float _1183 = fma(_917, _1113, _917);
    float _1185 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1139);
    int _1187 = abs(_1149);
    float _1189 = _755 + _757;
    float _1191 = float(_1137);
    float _1193 = fma(_1183, _1181, _1185);
    float _1195 = _1189 + (-1.0);
    float _1197 = _1191 * _1157;
    float _1199 = float(_1111);
    float _1201 = _1193 * 0.15915493667125701904296875;
    float _1203 = float(_1187);
    float _1205 = _1197 * (-2.0);
    float _1207 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1209 = _757 + _753;
    float _1211 = _757 + (-0.5);
    float _1213 = _1203 * _1199;
    float _1215 = fma(_1205, _1049, _1049);
    float _1217 = _1209 + (-1.0);
    float _1219 = _1213 * (-2.0);
    float _1221 = _755 + (-0.5);
    float _1223 = fma(_1207, _1205, _1207);
    float _1225 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1227 = fma(_1219, _1051, _1051);
    float _1229 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1215);
    float _1231 = _1201 * 6.283185482025146484375;
    float _1233 = sin(_1231);
    float _1235 = fma(_1225, _1219, _1225);
    float _1237 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    float _1239 = fma(_1223, _1181, _1229);
    float _1241 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1245 = fma(_1235, _1181, _1237);
    float _1247 = _1239 * 0.15915493667125701904296875;
    float _1249 = _1201 * 6.283185482025146484375;
    float _1251 = cos(_1249);
    float _1253 = _765 * _1241;
    float _1255 = _1245 * 0.15915493667125701904296875;
    float _1257 = _771 * _1243;
    float _1259 = in.m_42.x;
    float _1261 = in.m_42.y;
    float _1263 = in.m_42.z;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1275 = _1273 != 0;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1279 = _1277 != 0;
    float _1281 = _1247 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = _1255 * 6.283185482025146484375;
    float _1287 = cos(_1285);
    float _1289 = _1247 * 6.283185482025146484375;
    float _1291 = cos(_1289);
    float _1293 = _1251 * _1283;
    float _1295 = _1233 * _1283;
    float _1297 = _1255 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    float _1301 = _1283 * _1287;
    float _1303 = _1287 * _1253;
    bool _1305 = !_1279;
    int _1307 = _1305 ? 0 : 1;
    float _1309 = _1251 * _1303;
    float _1311 = _1251 * _1291;
    float _1313 = _1233 * _1291;
    float _1315 = _1291 * _1287;
    bool _1317 = !_1267;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = fma(_1299, _1311, _1295);
    float _1323 = -_1293;
    float _1325 = fma(_1299, _1313, _1323);
    float _1327 = -_1253;
    float _1329 = _1299 * _1327;
    float _1331 = -_1313;
    float _1333 = fma(_1299, _1293, _1331);
    float _1335 = _1233 * _1303;
    float _1337 = fma(_1321, _1257, _1309);
    float _1339 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1341 = fma(_1299, _1295, _1311);
    float _1343 = fma(_1325, _1257, _1335);
    float _1345 = fma(_1315, _1257, _1329);
    float _1347 = fma(_1333, _1339, _1337);
    float _1349 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1351 = fma(_1341, _1339, _1343);
    float _1353 = fma(_1301, _1339, _1345);
    float _1355 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1357 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1359 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1349);
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1363 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1355);
    float _1365 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1357);
    float _1367 = fma(_1263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1359);
    float _1369 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1361);
    float _1371 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1363);
    float _1373 = fma(_1263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1365);
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1369);
    float _1379 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1381 = _1373 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1383 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1385 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1387 = _1375 + _1379;
    float _1389 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1391 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1383);
    float _1393 = _1381 + _1385;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1397 = _1387 + _1395;
    float _1399 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1389);
    float _1401 = fma(_1263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1391);
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1405 = _1393 + _1403;
    float _1407 = _1397 * _1397;
    bool _1409 = !_1271;
    int _1411 = _1409 ? 0 : 1;
    float _1413 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1399);
    float _1415 = _1401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1417 = fma(_1405, _1405, _1407);
    bool _1419 = !_1275;
    int _1421 = _1419 ? 0 : 1;
    float _1423 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1427 = sqrt(_1417);
    float _1429 = _1415 + _1423;
    float _1431 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1425);
    float _1433 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1431);
    bool _1435 = _1427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1437 = _1413;
    float _1439 = _1393;
    float _1441 = _1423;
    float _1443 = _1427;
    if (!_1435)
    {
        _1437 = _1393;
    }
    float _1445 = _1437;
    float _1447 = _1445;
    if (!_1435)
    {
        _1439 = _1387;
    }
    float _1449 = _1439;
    float _1451 = _1449;
    if (!_1435)
    {
        _1441 = _1429;
    }
    float _1453 = _1441;
    bool _1455 = !_1435;
    float _1457 = _1453;
    if (!_1455)
    {
        float _1459 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1463 = _1427 + _1461;
        float _1465 = _1429 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = rsqrt(_1417);
        float _1469 = _1463 * _1459;
        float _1471 = _1469 * 0.15915493667125701904296875;
        float _1473 = _1471 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = _1471 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = _1475 + (-1.0);
        float _1483 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1485 = fma(_1479, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1487 = fma(_1429, _1475, _1483);
        float _1489 = _1467 * _1485;
        float _1491 = fma(_1405, _1489, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1493 = fma(_1397, _1489, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1457 = _1487;
        _1447 = _1491;
        _1451 = _1493;
        _1443 = _1485;
    }
    float _1495 = _1457;
    float _1497 = _1447;
    float _1499 = _1451;
    float _1501 = _1443;
    float _1503 = -_1415;
    float _1505 = _1503 + _1495;
    float _1507 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1509 = -_1381;
    float _1511 = _1509 + _1497;
    float _1513 = -_1375;
    float _1515 = _1513 + _1499;
    float _1517 = _1505 * _1505;
    float _1519 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1521 = 1.0 / _1507;
    float _1523 = fma(_1511, _1511, _1517);
    float _1525 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1519);
    float _1527 = fma(_1515, _1515, _1523);
    float _1529 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    bool _1531 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1533 = isnan(0.5);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1539 = _1535 || _1537;
    float _1541 = sqrt(_1527);
    float _1543 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1545 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1547 = isnan(0.5);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1553 = _1549 || _1551;
    float _1555 = _1543 + _1507;
    float _1557 = _1555 * _1521;
    float _1559 = _1557 * 0.5;
    bool _1561 = _1541 > 0.0;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1565 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1563);
    float _1567 = 1.0 / _1565;
    float _1569 = _1559;
    float _1571 = _1497;
    float _1573 = _1499;
    float _1575 = _1501;
    float _1577 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1579 = _1495;
    float _1581 = _1527;
    if (!_1561)
    {
        _1569 = _1495;
    }
    float _1583 = _1569;
    bool _1585 = !_1561;
    float _1587 = _1583;
    if (!_1585)
    {
        float _1589 = _189 * _189;
        float _1591 = fma(_187, _187, _1589);
        float _1593 = fma(_191, _191, _1591);
        float _1595 = rsqrt(_1527);
        float _1597 = sqrt(_1593);
        float _1599 = _1511 * _1595;
        float _1601 = _1505 * _1595;
        float _1603 = _1515 * _1595;
        bool _1605 = _1597 > 0.0;
        float _1607 = _1597;
        _1575 = _1593;
        _1577 = _1595;
        if (!_1605)
        {
            _1607 = _1495;
        }
        float _1609 = _1607;
        bool _1611 = !_1605;
        _1587 = _1609;
        if (!_1611)
        {
            float _1613 = rsqrt(_1593);
            float _1615 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1617 = _189 * _1613;
            float _1619 = _187 * _1613;
            float _1621 = _191 * _1613;
            float _1623 = _1601 * _1617;
            float _1625 = fma(_1599, _1619, _1623);
            float _1627 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1629 = fma(_1603, _1621, _1625);
            float _1631 = _1629 * _1627;
            float _1633 = fma(_187, _1631, _1497);
            float _1635 = fma(_189, _1631, _1495);
            float _1637 = fma(_191, _1631, _1499);
            _1571 = _1633;
            _1587 = _1635;
            _1573 = _1637;
            _1577 = _1631;
        }
    }
    float _1639 = _1571;
    float _1641 = _1587;
    float _1643 = _1573;
    float _1645 = _1575;
    float _1647 = _1577;
    float _1649 = _1647;
    float _1651 = _1639;
    float _1653 = _1641;
    float _1655 = _1645;
    if (_1553)
    {
        _1649 = 1.0;
    }
    float _1657 = _1649;
    float _1659 = _1657;
    if (_1539)
    {
        _195 = _1639;
    }
    float _1661 = _195;
    float _1663 = _1661;
    if (_1539)
    {
        _197 = _1641;
    }
    float _1665 = _197;
    float _1667 = _1665;
    if (_1539)
    {
        _1579 = _1643;
    }
    float _1669 = _1579;
    float _1671 = _1669;
    if (!_1539)
    {
        float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1675 = _1415 + _1673;
        float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1679 = _1381 + _1677;
        float _1681 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1683 = -_1381;
        float _1685 = _1683 + _1639;
        float _1687 = _1675 * _1675;
        float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1691 = _1375 + _1689;
        float _1693 = -_1415;
        float _1695 = _1693 + _1641;
        float _1697 = fma(_1679, _1679, _1687);
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1701 = fma(_1691, _1691, _1697);
        float _1703 = sqrt(_1701);
        float _1705 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1707 = -_1375;
        float _1709 = _1707 + _1643;
        float _1711 = precise::min(_1703, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1713 = _1711 * _1699;
        float _1715 = _1705 * _1713;
        float _1717 = fma(_1685, _1715, _1381);
        float _1719 = fma(_1695, _1715, _1415);
        float _1721 = fma(_1709, _1715, _1375);
        _1651 = _1685;
        _1653 = _1695;
        _1667 = _1719;
        _1663 = _1717;
        _1671 = _1721;
        _1655 = _1715;
    }
    float _1723 = _1651;
    float _1725 = _1653;
    float _1727 = _1667;
    float _1729 = _1663;
    float _1731 = _1671;
    float _1733 = _1655;
    float _1735 = _1725;
    float _1737 = _1723;
    float _1739 = _1733;
    if (_1553)
    {
        _1735 = 1.0;
    }
    float _1741 = _1735;
    float _1743 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1745 = _1567 * _1743;
    float _1747 = _1741;
    if (!_1553)
    {
        float _1749 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1751 = _1749 * 0.15915493667125701904296875;
        float _1753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1757 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1755;
        float _1759 = _1751 * 6.283185482025146484375;
        float _1761 = cos(_1759);
        float _1763 = _1753 * 0.15915493667125701904296875;
        float _1765 = _1751 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = 1.0 / _1761;
        float _1771 = _1763 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = _1763 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1773 * _1775;
        float _1783 = 1.0 / _1757;
        float _1785 = 1.0 / _1781;
        float _1787 = _1779 * _1785;
        float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1791 = fma(_1745, _1787, _1789);
        float _1793 = _1791 * _1783;
        float _1795 = precise::clamp(_1793, 0.0, 1.0);
        _1737 = _1769;
        _1659 = _1795;
    }
    float _1797 = _1737;
    float _1799 = _1659;
    float _1801 = _1797;
    if (!_1553)
    {
        float _1803 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1805 = _1803 * 0.15915493667125701904296875;
        float _1807 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1809 = _1805 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = _1807 * 0.15915493667125701904296875;
        float _1815 = _1805 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        float _1819 = 1.0 / _1811;
        float _1821 = _1813 * 6.283185482025146484375;
        float _1823 = cos(_1821);
        float _1825 = _1817 * _1819;
        float _1827 = _1813 * 6.283185482025146484375;
        float _1829 = sin(_1827);
        float _1831 = _1823 * _1825;
        float _1833 = 1.0 / _1831;
        float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1837 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1835;
        float _1839 = 1.0 / _1837;
        float _1841 = _1829 * _1833;
        float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1845 = fma(_1745, _1841, _1843);
        float _1847 = _1845 * _1839;
        float _1849 = precise::clamp(_1847, 0.0, 1.0);
        float _1851 = -_1849;
        float _1853 = _1851 + 1.0;
        _1739 = _1841;
        _1801 = _1829;
        _1747 = _1853;
    }
    float _1855 = _1739;
    float _1857 = _1801;
    float _1859 = _1747;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1863 = _1727 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1867 = _1729 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1871 = _1731 + _1869;
    float _1873 = _1863 * _1863;
    float _1875 = fma(_1867, _1867, _1873);
    float _1877 = fma(_1871, _1871, _1875);
    float _1879 = rsqrt(_1877);
    float _1881 = sqrt(_1877);
    float _1883 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1885 = _1867 * _1883;
    float _1887 = _1871 * _1883;
    float _1889 = _1885 * _1885;
    float _1891 = _1887 * _1887;
    float _1893 = _1889 + _1891;
    float _1895 = sqrt(_1893);
    bool _1897 = _1895 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1901 = _1895 + _1899;
    float _1903 = _1879;
    float _1905 = _1893;
    float _1907 = _1901;
    float _1909 = _1855;
    if (_1897)
    {
        float _1911 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _1911;
    }
    float _1913 = _1903;
    if (_1897)
    {
        float _1915 = rsqrt(_1893);
        _1905 = _1915;
    }
    float _1917 = _1905;
    float _1919 = _1917;
    if (_1897)
    {
        float _1921 = _1901 * _1913;
        _1907 = _1921;
    }
    float _1923 = _1907;
    if (_1897)
    {
        float _1925 = _1923 * 0.15915493667125701904296875;
        _1909 = _1925;
    }
    float _1927 = _1909;
    float _1929 = _1871;
    float _1931 = _1927;
    if (_1897)
    {
        float _1933 = _1927 * 6.283185482025146484375;
        float _1935 = sin(_1933);
        _1929 = _1935;
    }
    float _1937 = _1929;
    float _1939 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1941 = precise::max(0.0, _1939);
    float _1943 = _1857;
    float _1945 = _1941;
    float _1947 = _1939;
    if (_1897)
    {
        float _1949 = _1927 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        _1943 = _1951;
    }
    float _1953 = _1943;
    float _1955 = -_1883;
    float _1957 = -_1941;
    float _1959 = fma(_1863, _1955, _1957);
    float _1961 = _1959;
    if (_1897)
    {
        float _1963 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1945 = _1963;
    }
    float _1965 = _1945;
    float _1967 = _1937;
    float _1969 = _1965;
    if (_1897)
    {
        float _1971 = fma(_1937, _1965, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1967 = _1971;
    }
    float _1973 = _1967;
    float _1975 = _1973;
    if (!_1897)
    {
        _1969 = _1885;
    }
    float _1977 = _1969;
    float _1979 = _1977;
    if (_1897)
    {
        float _1981 = _1953 + (-1.0);
        _1947 = _1981;
    }
    float _1983 = _1947;
    float _1985 = _1983;
    if (_1897)
    {
        float _1987 = _1917 * _1973;
        _1581 = _1987;
    }
    float _1989 = _1581;
    if (!_1897)
    {
        _1975 = _1959;
    }
    float _1991 = _1975;
    float _1993 = _1991;
    if (_1897)
    {
        float _1995 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1931 = _1995;
    }
    float _1997 = _1931;
    if (_1897)
    {
        float _1999 = _1885 * _1989;
        _1979 = _1999;
    }
    float _2001 = _1979;
    if (!_1897)
    {
        _1985 = _1887;
    }
    float _2003 = _1985;
    float _2005 = _2003;
    if (_1897)
    {
        float _2007 = _1887 * _1989;
        _2005 = _2007;
    }
    float _2009 = _2005;
    if (!_1897)
    {
        _1919 = _1889;
    }
    float _2011 = _1919;
    float _2013 = _2011;
    if (_1897)
    {
        float _2015 = fma(_1959, _1953, _1997);
        _1993 = _2015;
    }
    float _2017 = _1993;
    if (_1897)
    {
        float _2019 = _2001 * _2001;
        _2013 = _2019;
    }
    float _2021 = _2013;
    if (!_1897)
    {
        _1961 = _1891;
    }
    float _2023 = _1961;
    float _2025 = _2023;
    if (_1897)
    {
        float _2027 = _2009 * _2009;
        _2025 = _2027;
    }
    float _2029 = _2025;
    float _2031 = fma(_2017, _2017, _2021);
    float _2033 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2035 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2037 = _2031 + _2029;
    float _2039 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2033);
    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2043 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2041);
    float _2045 = precise::clamp(_2043, 0.0, 1.0);
    float _2047 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2049 = rsqrt(_2037);
    float _2051 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2039);
    float _2053 = -_2045;
    float _2055 = _2053 + 1.0;
    float _2057 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2059 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2061 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2047);
    float _2063 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2065 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2057);
    float _2067 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2059);
    float _2069 = abs(_2055);
    float _2071 = log2(_2069);
    float _2073 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2061);
    float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2077 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    float _2079 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2065);
    float _2081 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2083 = -_2075;
    float _2085 = fma(_2083, _2035, 1.0);
    float _2087 = _2049 * _2001;
    float _2089 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2091 = _2049 * _2017;
    float _2093 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2095 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2097 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2099 = _2049 * _2009;
    float _2101 = log2(_2085);
    float _2103 = -_2095;
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2103);
    float _2107 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2097);
    float _2109 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2111 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2113 = -_2099;
    float _2115 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2105);
    float _2117 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2107);
    float _2119 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2121 = exp2(_2109);
    float _2123 = fma(_2115, -0.5, 0.5);
    float _2125 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2117);
    float _2127 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2119);
    float _2129 = fma(_2115, 0.5, 0.5);
    float _2131 = _2091 + 1.0;
    float _2133 = 1.0 / _2125;
    float _2135 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2111);
    float _2137 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2127);
    float _2139 = fma(_2129, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2141 = _2101 * 0.693147182464599609375;
    float _2143 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2135);
    float _2145 = fma(_2129, _2139, -0.212114393711090087890625);
    float _2147 = sqrt(_2123);
    float _2149 = -_2091;
    float _2151 = fma(_2121, _2131, _2149);
    float _2153 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2137);
    float _2155 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2143);
    float _2157 = fma(_2129, _2145, 1.570728778839111328125);
    float _2159 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2161 = fma(_2151, 0.5, 0.5);
    float _2163 = _2153 * _2133;
    float _2165 = _2155 * _2133;
    float _2167 = fma(_2163, 0.5, 0.5);
    float _2169 = fma(_2165, -0.5, 0.5);
    float _2171 = _2147 * 0.636619746685028076171875;
    float _2173 = -_2157;
    float _2175 = fma(_2171, _2173, 1.0);
    float3 _6638 = float3(_2167, _2169, _2159);
    float _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6638, float3(0.0), isnan(_6638)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6638, float3(0.0), isnan(_6638)), level(0.0)).x;
    float3 _6649 = float3(_2167, _2169, _2159);
    float4 _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6649, float3(0.0), isnan(_6649)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6649, float3(0.0), isnan(_6649)), level(0.0)).xyzw;
    float _2182 = _2180.x;
    float _2184 = _2180.y;
    float _2186 = _2180.z;
    float _2188 = _2180.w;
    float2 _6666 = float2(_2175, _2161);
    float3 _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6666, float2(0.0), isnan(_6666)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6666, float2(0.0), isnan(_6666)), level(0.0)).xyz;
    float _2194 = _2192.x;
    float _2196 = _2192.y;
    float _2198 = _2192.z;
    float _2200 = float(uint(_981));
    float _2202 = trunc(_1159);
    int _2204 = int(_2202);
    int _2206 = ~_981;
    int _2208 = _2206 + 1;
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2212 = _747 + _2210;
    bool _2214 = _755 > 0.5;
    float _2216 = _1151 * (-0.15915493667125701904296875);
    float _2218 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2220 = !_949;
    float _2222 = _2220 ? _755 : _753;
    float _2224 = 1.0 / _2200;
    float _2226 = -_1173;
    float _2228 = _2226 + 1.0;
    bool _2230 = _759 > 0.5;
    float _2232 = -_1161;
    float _2234 = _2232 + 1.0;
    int _2236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2238 = _2236 != 0;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2242 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2248 = float(uint(_2204));
    float _2250 = 1.0 / _749;
    float _2252 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2254 = -_185;
    int _2256 = _2214 ? as_type<int>(_2254) : as_type<int>(_185);
    float _2258 = -_1165;
    float _2260 = _2258 + 1.0;
    bool _2262 = !_949;
    float _2264 = _2262 ? 1.2345600128173828125 : 1.0;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _2270 = as_type<int>(_2224) + (-2);
    float _2272 = 1.0 / _2242;
    int _2274 = ~_981;
    int _2276 = _2274 + 1;
    float _2278 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2252);
    float _2280 = float(_2204);
    float _2282 = as_type<float>(_2270) * _2248;
    float _2284 = -_185;
    int _2286 = _2230 ? as_type<int>(_2284) : as_type<int>(_185);
    float _2288 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2278);
    bool _2290 = !_2238;
    float _2292 = _2290 ? _185 : as_type<float>(_2256);
    float _2294 = trunc(_2282);
    float _2296 = precise::max(_2294, 0.0);
    uint _2299 = uint(_2296);
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2303 = _2301 != 0;
    float _2305 = -_1167;
    float _2307 = _2305 + 1.0;
    int _2309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2311 = _2309 != 0;
    float _2313 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2288);
    int _2315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2317 = _2315 != 0;
    int _2319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2321 = _2319 != 0;
    float _2323 = 1.0 / _2246;
    out.gl_Position.x = _2153;
    out.gl_Position.y = _2155;
    out.gl_Position.z = _2313;
    out.gl_Position.w = _2125;
    bool _2325 = _753 > 0.5;
    bool _2327 = _829 != 0;
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2333 = _2280 >= _1133;
    bool _2335 = isnan(_2280);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(_1133);
    bool _2341 = _2337 || _2339;
    float _2343 = float(_2341);
    int _2345 = _2208 * int(_2299);
    int _2347 = _2345 + _2204;
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2351 = _747 + _2349;
    float _2353 = 1.0 / _2268;
    int _2355 = abs(_1319);
    float _2357 = _2351 * _2272;
    float _2359 = float(uint(_2347));
    float _2361 = _2212 * _2323;
    float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    int _2367 = abs(_1421);
    float _2369 = as_type<float>(_2270) * _2359;
    float _2371 = 1.0 / _2331;
    float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2375 = _2373 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2377 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2379 = isnan(_751);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2385 = _2381 || _2383;
    float _2387 = float(_2385);
    float _2389 = trunc(_2369);
    float _2391 = precise::max(_2389, 0.0);
    uint _2393 = uint(_2391);
    float _2395 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2397 = _2395 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _2399 = ~_981;
    int _2401 = _2399 + 1;
    float _2403 = trunc(_2343);
    int _2405 = int(_2403);
    int _2407 = int(_2299) + int(_2393);
    float _2409 = 1.0 / _2375;
    int _2411 = _2276 * _2407;
    int _2413 = _2411 + _2204;
    float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2419 = 1.0 / _2397;
    bool _2421 = uint(_2413) >= uint(_981);
    bool _2423 = !_2421;
    int _2425 = _2423 ? 0 : (-1);
    float _2427 = 1.0 / _2417;
    int _2429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2431 = _2429 != 0;
    float _2433 = _2264 * _2222;
    float _2435 = floor(_2433);
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2437;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2445 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2447 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2445;
    float _2449 = _2439 * _2409;
    float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2455 = _2447 * _2371;
    int _2457 = ~_2407;
    int _2459 = _2457 + _2425;
    int _2461 = _2459 + 1;
    float _2463 = _2365 * _2427;
    float _2465 = _1155 * _2250;
    float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2469 = _2467 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2471 = !_2431;
    float _2473 = _2471 ? _185 : as_type<float>(_2286);
    int _2475 = _981 * _2461;
    int _2477 = _2475 + _2204;
    bool _2479 = _981 == 0;
    float _2481 = -_2435;
    float _2483 = _2433 + _2481;
    float _2485 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2485;
    int _2489 = ~_2405;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    float _2495 = 1.0 / _2469;
    bool _2497 = !_2479;
    int _2499 = _2497 ? _2477 : (-1);
    float _2501 = _2483 * _1133;
    float _2503 = _2487 * _2353;
    int _2505 = abs(_1411);
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2509 = _2507 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _2511 = _2499 * _2493;
    float _2513 = trunc(_2465);
    int _2515 = int(_2513);
    int _2517 = _981 + (-1);
    float _2519 = _2443 * _2419;
    int _2521 = ~_981;
    int _2523 = _2521 + 1;
    float _2525 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2525;
    bool _2529 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2531 = isnan(_747);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2537 = _2533 || _2535;
    float _2539 = float(_2537);
    int _2541 = _2405 * _2517;
    int _2543 = _2541 + _2511;
    bool _2545 = !_2321;
    int _2547 = _2545 ? 0 : 1;
    float _2549 = trunc(_2501);
    int _2551 = int(_2549);
    int _2553 = abs(_1307);
    int _2555 = _2543 * _2505;
    int _2557 = abs(_2547);
    float _2559 = _2527 * _2495;
    float _2561 = -_175;
    int _2563 = _2327 ? as_type<int>(_2561) : as_type<int>(_175);
    float _2565 = -_175;
    int _2567 = _2325 ? as_type<int>(_2565) : as_type<int>(_175);
    int _2569 = _2515 * _2355;
    int _2571 = _2569 + _2555;
    float _2573 = 1.0 / _2453;
    bool _2575 = !_2303;
    float _2577 = _2575 ? _175 : as_type<float>(_2563);
    bool _2579 = !_2317;
    float _2581 = _2579 ? _175 : as_type<float>(_2567);
    int _2583 = _2551 * _2557;
    int _2585 = _2583 + _2204;
    float _2587 = _2216 * 6.283185482025146484375;
    float _2589 = sin(_2587);
    int _2591 = _2585 * _2367;
    int _2593 = _2591 + _2571;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2597 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2595;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2599;
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2605 = _2603 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _2607 = _2551 * _2553;
    int _2609 = _2607 + _2593;
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2611;
    float _2615 = fma(_2601, _2357, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2619 = _751 + _2617;
    float _2621 = fma(_2605, _2361, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2623 = float(uint(_2609));
    float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2627 = _751 + _2625;
    float _2629 = fma(_2449, _2619, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2631 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2633 = _2631 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2637 = _751 + _2635;
    float _2639 = as_type<float>(_2270) * _2623;
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2643 = _2641 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2647 = _751 + _2645;
    float _2649 = fma(_2519, _2627, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _2651 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2653 = isnan(_751);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2659 = _2655 || _2657;
    float _2661 = float(_2659);
    float _2663 = fma(_2633, _2361, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2665 = trunc(_2639);
    float _2667 = precise::max(_2665, 0.0);
    uint _2669 = uint(_2667);
    float _2671 = fma(_2455, _2637, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2673 = fma(_2597, _2357, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2675 = fma(_2643, _2361, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2677 = fma(_2503, _2647, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2679 = _2509 * _2573;
    float _2681 = fma(_2613, _2357, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2685 = _751 + _2683;
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2689 = _751 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2693 = _751 + _2691;
    bool _2695 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2697 = isnan(_751);
    bool _2699 = _2695 || _2697;
    bool _2701 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2703 = _2699 || _2701;
    float _2705 = float(_2703);
    float _2707 = -_2661;
    float _2709 = _2707 + 1.0;
    float _2711 = fma(_2463, _2685, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2713 = fma(_2679, _2689, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2715 = fma(_2559, _2693, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _2717 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2719 = isnan(_751);
    bool _2721 = _2717 || _2719;
    bool _2723 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2725 = _2721 || _2723;
    float _2727 = float(_2725);
    int _2729 = _2523 * int(_2669);
    int _2731 = _2729 + _2609;
    float _2733 = _2705 * _2709;
    float _2735 = -_2705;
    float _2737 = _2735 + 1.0;
    bool _2739 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2741 = isnan(_747);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2747 = _2743 || _2745;
    float _2749 = float(_2747);
    float _2751 = -_2727;
    float _2753 = _2751 + 1.0;
    float _2755 = float(uint(_2731));
    float _2757 = _2727 * _2737;
    bool _2759 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2761 = isnan(_751);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2767 = _2763 || _2765;
    float _2769 = float(_2767);
    float _2771 = -_2749;
    float _2773 = _2771 + 1.0;
    bool _2775 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2777 = isnan(_747);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2783 = _2779 || _2781;
    float _2785 = float(_2783);
    float _2787 = as_type<float>(_2270) * _2755;
    bool _2789 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2791 = isnan(_751);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2797 = _2793 || _2795;
    float _2799 = float(_2797);
    float _2801 = -_2769;
    float _2803 = _2801 + 1.0;
    bool _2805 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2807 = isnan(_751);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = -_2785;
    float _2819 = _2817 + 1.0;
    float _2821 = exp2(_2218);
    float _2823 = _2799 * _2753;
    bool _2825 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2827 = isnan(_751);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    float _2837 = -_2815;
    float _2839 = _2837 + 1.0;
    float _2841 = _2815 * _2803;
    float _2843 = _2749 * _2819;
    float _2845 = -_2799;
    float _2847 = _2845 + 1.0;
    float _2849 = _2387 * _2839;
    float _2851 = trunc(_2787);
    float _2853 = precise::max(_2851, 0.0);
    uint _2855 = uint(_2853);
    float _2857 = -_2387;
    float _2859 = _2857 + 1.0;
    float _2861 = _2539 * _2773;
    float _2863 = -_2539;
    float _2865 = _2863 + 1.0;
    float _2867 = _2835 * _2859;
    float _2869 = float(uint(_2585));
    float _2871 = _2615 * _2861;
    float _2873 = _2681 * _2861;
    float _2875 = _2629 * _2867;
    float _2877 = -_2835;
    float _2879 = _2877 + 1.0;
    float _2881 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2871);
    float _2883 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2873);
    float _2885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2887 = fma(_2879, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2875);
    float _2889 = fma(_2663, _2843, _2881);
    int _2891 = int(_2669) + int(_2855);
    float _2893 = _2673 * _2861;
    float _2895 = as_type<float>(_2270) * _2869;
    float _2897 = _2292 * _2589;
    float _2899 = fma(_2649, _2849, _2887);
    int _2901 = _2401 * _2891;
    int _2903 = _2901 + _2609;
    float _2905 = _2216 * 6.283185482025146484375;
    float _2907 = cos(_2905);
    float _2909 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2893);
    float _2911 = fma(_2671, _2841, _2899);
    float _2913 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2889);
    bool _2915 = uint(_2903) >= uint(_981);
    float _2917 = fma(_2621, _2843, _2909);
    int _2919 = ~_981;
    int _2921 = _2919 + 1;
    float _2923 = _2769 * _2847;
    float _2925 = trunc(_2895);
    float _2927 = precise::max(_2925, 0.0);
    uint _2929 = uint(_2927);
    bool _2931 = !_2915;
    int _2933 = _2931 ? 0 : (-1);
    float _2935 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2917);
    float _2937 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2939 = ~_2891;
    int _2941 = _2939 + _2933;
    int _2943 = _2941 + 1;
    float _2945 = fma(_2675, _2843, _2883);
    float _2947 = fma(_2711, _2923, _2911);
    float _2949 = _2292 * _2907;
    float _2951 = -_2897;
    float _2953 = fma(_2581, _2907, _2951);
    int _2955 = _981 * _2943;
    int _2957 = _2955 + _2609;
    float _2959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2961 = fma(_2581, _2589, _2949);
    float _2963 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2945);
    float _2965 = _2953 + 0.5;
    bool _2967 = !_2479;
    int _2969 = _2967 ? _2957 : (-1);
    int _2971 = _2921 * int(_2929);
    int _2973 = _2971 + _2585;
    float _2975 = _915 + 0.5;
    float _2977 = fma(_2937, _2965, _853);
    int _2979 = _2969 >> 31;
    float _2981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2983 = float(uint(_2973));
    float _2985 = fma(_2677, _2823, _2947);
    int _2987 = _2979 & 3;
    float _2989 = -_2821;
    float _2991 = _2989 + 1.0;
    int _2993 = _2969 & 3;
    bool _2995 = _2993 != 0;
    float _2997 = as_type<float>(_2270) * _2983;
    int _2999 = _2969 + _2987;
    float _3001 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3003 = _2961 + (-0.5);
    float _3005 = trunc(_2997);
    float _3007 = precise::max(_3005, 0.0);
    uint _3009 = uint(_3007);
    int _3011 = _2999 >> 2;
    float _3013 = fma(_2713, _2757, _2985);
    float _3015 = -_3001;
    float _3017 = -_1153;
    float _3019 = fma(_3015, _3003, _3017);
    bool _3021 = uint(_2993) > 1u;
    float _3023 = _2963 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3025 = _3011 << 4;
    int _3027 = _3025 + 512;
    float _3029 = _2981 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3033 = _2473 + (-0.5);
    uint _3035 = uint(int(uint(_3027) >> uint(2)));
    uint _3037 = uint(int(uint(int(_3035)) >> uint(2)));
    int _3039 = int(_3035) & 3;
    float _3041 = (*spvDescriptorSet0.vp_c9)._m0[int(_3037)][_3039];
    int _3043 = int(_3035) + 1;
    uint _3045 = uint(int(uint(_3043) >> uint(2)));
    int _3047 = _3043 & 3;
    float _3049 = (*spvDescriptorSet0.vp_c9)._m0[int(_3045)][_3047];
    int _3051 = _2969 & 3;
    bool _3053 = _3051 != 0;
    float _3055 = fma(_3029, _2975, _1145);
    float _3057 = -_3033;
    float _3059 = -_1175;
    float _3061 = fma(_3057, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3059);
    float _3063 = _2577 + 0.5;
    float _3065 = _921 + (-0.5);
    int _3067 = _3053 ? 0 : 1;
    int _3069 = _3027 + 8;
    uint _3071 = uint(int(uint(_3069) >> uint(2)));
    uint _3073 = uint(int(uint(int(_3071)) >> uint(2)));
    int _3075 = int(_3071) & 3;
    float _3077 = (*spvDescriptorSet0.vp_c9)._m0[int(_3073)][_3075];
    int _3079 = int(_3071) + 1;
    uint _3081 = uint(int(uint(_3079) >> uint(2)));
    int _3083 = _3079 & 3;
    float _3085 = (*spvDescriptorSet0.vp_c9)._m0[int(_3081)][_3083];
    float _3087 = fma(_3063, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1171);
    float _3089 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3091 = ~_3067;
    int _3093 = _3091 + 1;
    int _3095 = _3093 + 1;
    float _3097 = _2935 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3099 = _3095;
    if (!_3021)
    {
        int _3101 = ~_3067;
        int _3103 = _3101 + 1;
        _3099 = _3103;
    }
    int _3105 = _3099;
    float _3107 = _3031 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3109 = _2913 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3111 = _2993 != 3;
    float _3113 = _3097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3115 = -_3107;
    float _3117 = -_1177;
    float _3119 = fma(_3115, _3065, _3117);
    bool _3121 = !_2995;
    int _3123 = _3121 ? 0 : 1;
    float _3125 = _3109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3127 = _3023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3129 = uint(_2993) >= 2u;
    float _3131 = _2991 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3133 = abs(_3105);
    float _3135 = -_2260;
    float _3137 = fma(_915, _3135, _3055);
    int _3139 = abs(_3123);
    out.m_62.x = _3113;
    out.m_62.y = _3125;
    out.m_62.z = _3127;
    out.m_62.w = _3089;
    int _3141 = _3129 ? 0 : 1;
    float _3143 = _3131 * _2177;
    int _3145 = int(_2929) + int(_3009);
    float _3147 = fma(_921, _2307, _3119);
    int _3149 = ~_981;
    int _3151 = _3149 + 1;
    float _3153 = fma(_2715, _2733, _3013);
    bool _3155 = _2993 != 3;
    int _3157 = _3151 * _3145;
    int _3159 = _3157 + _2585;
    int _3161 = ~_3133;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    float _3167 = -_1119;
    float _3169 = _3167 + 1.0;
    int _3171 = ~_3141;
    int _3173 = _3171 + 1;
    int _3175 = _3173 + 1;
    float _3177 = _2198 * _3143;
    int _3179 = _3175;
    if (_3111)
    {
        int _3181 = ~_3141;
        int _3183 = _3181 + 1;
        _3179 = _3183;
    }
    int _3185 = _3179;
    float _3187 = -_3169;
    float _3189 = fma(_2577, _3187, _3087);
    int _3191 = ~_3139;
    int _3193 = _3191 + 1;
    int _3195 = _3193 + 1;
    int _3197 = _3165 * as_type<int>(_3049);
    int _3199 = abs(_3185);
    float _3201 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3153);
    bool _3203 = !_2311;
    int _3205 = _3203 ? 0 : 1;
    int _3207 = _3195 * as_type<int>(_3041);
    int _3209 = _3207 + _3197;
    bool _3211 = uint(_3159) >= uint(_981);
    float _3213 = -_1163;
    float _3215 = _3213 + 1.0;
    bool _3217 = !_3155;
    int _3219 = _3217 ? 0 : (-1);
    float _3221 = -_2234;
    float _3223 = fma(_2953, _3221, _2977);
    int _3225 = abs(_3205);
    float _3227 = fma(_2473, _2228, _3061);
    float _3229 = fma(_2961, _3215, _3019);
    bool _3231 = !_3211;
    int _3233 = _3231 ? 0 : (-1);
    out.m_64.x = _3137;
    out.m_64.y = _3147;
    int _3235 = abs(_3219);
    int _3237 = ~_3199;
    int _3239 = _3237 + 1;
    int _3241 = _3239 + 1;
    out.m_66.x = _3223;
    out.m_66.y = _3229;
    out.m_66.z = _3189;
    out.m_66.w = _3227;
    int _3243 = ~_3145;
    int _3245 = _3243 + _3233;
    int _3247 = _3245 + 1;
    int _3249 = ~_3235;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    int _3255 = _3241 * as_type<int>(_3077);
    int _3257 = _3255 + _3209;
    int _3259 = ~_3225;
    int _3261 = _3259 + 1;
    int _3263 = _3261 + 1;
    int _3265 = _981 * _3247;
    int _3267 = _3265 + _2585;
    bool _3269 = _1799 > 0.0;
    bool _3271 = isnan(_1799);
    bool _3273 = _3269 || _3271;
    bool _3275 = isnan(0.0);
    bool _3277 = _3273 || _3275;
    int _3279 = _3253 * as_type<int>(_3085);
    int _3281 = _3279 + _3257;
    float _3283 = _2313 + _2125;
    out.m_68.x = _3201;
    bool _3285 = _1859 <= 0.0;
    bool _3287 = !_3277;
    bool _3289 = _3285 || _3287;
    int _3291 = _3281 * _3263;
    float _3293 = _3283 * 0.5;
    float _3295 = _1799 * _1859;
    bool _3297 = !_2479;
    int _3299 = _3297 ? _3267 : (-1);
    float _3301 = _2125 * 0.5;
    float _3303 = fma(_2188, _3177, _2186);
    float _3305 = _3295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3307 = _3299 * _3225;
    int _3309 = _3307 + _3291;
    float _3311 = fma(_2155, -0.5, _3301);
    float _3313 = _3305 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3315 = _2153 + _2125;
    float _3317 = -_3131;
    float _3319 = _3317 + 1.0;
    float _3321 = float(_3309);
    float _3323 = _3315 * 0.5;
    float _3325 = _2188 * _3143;
    float _3327 = _2188 * _3319;
    float _3329 = fma(_2194, _3325, _2182);
    float _3331 = fma(_2196, _3325, _2184);
    out.m_45.x = _3313;
    out.m_70.y = _3321;
    out.m_72.x = _3323;
    out.m_72.y = _3311;
    out.m_72.z = _3293;
    out.m_72.w = _2125;
    out.m_74.x = _3329;
    out.m_74.y = _3331;
    out.m_74.z = _3303;
    out.m_74.w = _3327;
    if (!_3289)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3333 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3333;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _739 = false;
    bool _503 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3390 = as_type<float>(_109);
        out.gl_Position.z = _3390;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_47.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3460 = as_type<float>(_147);
        out.gl_Position.z = _3460;
    }
    if (_139)
    {
        return out;
    }
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_52.x;
    float _153 = in.m_52.y;
    float _155 = in.m_52.z;
    int _157 = as_type<int>(_149) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_149) & 2;
    bool _163 = _161 != 0;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _171 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _173 = !_159;
    float _175 = _173 ? (-0.5) : 0.5;
    float _177 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _179 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    float _181 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _171);
    bool _183 = !_163;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _189 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _191 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _193 = !_165;
    float _195 = _187;
    float _197 = _189;
    float _215;
    if (!_193)
    {
        float _199 = in.m_54.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_93);
        float _221 = 1.0 / _219;
        float _223 = _127 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = 1.0 / _233;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _249;
    bool _253 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _255 = isnan(_225);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = 1.0 / _237;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _225 + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _241;
    float _275 = _269 * _247;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _225 + _277;
    float _281 = 1.0 / _245;
    float _283 = _229 * _265;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _225 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _291 = _225 + _289;
    float _293 = 1.0 / _251;
    float _295 = _279 * _273;
    bool _297 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _299 = isnan(_225);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    bool _309 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _311 = isnan(_225);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _287 * _281;
    float _323 = -_263;
    float _325 = _323 + 1.0;
    float _327 = -_307;
    float _329 = _327 + 1.0;
    float _331 = _307 * _325;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = _291 * _293;
    bool _343 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _345 = isnan(_225);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_319;
    float _357 = _355 + 1.0;
    float _359 = _319 * _329;
    float _361 = fma(_335, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_339, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _365 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _367 = isnan(_225);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = _353 * _357;
    float _379 = -_353;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _387 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _389 = isnan(_225);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = _375 * _381;
    float _405 = -_375;
    float _407 = _405 + 1.0;
    float _409 = fma(_385, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = -_397;
    float _413 = _411 + 1.0;
    float _415 = fma(_401, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _417 = _397 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _423;
    float _427 = _361 * _417;
    float _429 = _363 * _417;
    float _431 = fma(_421, _295, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _433 = fma(_425, _295, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _435 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _427);
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _429);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _443 = fma(_415, _403, _435);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _449 = fma(_409, _403, _437);
    float _451 = fma(_441, _321, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _453;
    float _457 = fma(_431, _377, _443);
    float _459 = fma(_447, _321, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _461;
    float _465 = fma(_433, _377, _449);
    float _467 = fma(_455, _341, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _469 = fma(_451, _359, _457);
    float _471 = fma(_463, _341, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _473 = fma(_459, _359, _465);
    float _475 = fma(_467, _331, _469);
    float _477 = fma(_471, _331, _473);
    float _479 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[148].x, _475);
    float _481 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[148].y, _477);
    bool _483 = !_271;
    float _501;
    if (!_483)
    {
        float _485 = in.m_54.x;
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _489 = _485 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_93);
        float _507 = 1.0 / _505;
        float _509 = _127 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _515 = _511 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _529 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _531 = isnan(_511);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = 1.0 / _519;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _547 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _549 = isnan(_511);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _561 = 1.0 / _527;
    float _563 = _523 * _541;
    bool _565 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _567 = isnan(_511);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = 1.0 / _545;
    float _579 = -_539;
    float _581 = _579 + 1.0;
    float _583 = fma(_563, _515, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _589 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _591 = isnan(_511);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -_575;
    float _603 = _601 + 1.0;
    float _605 = _575 * _581;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _611 = 1.0 / _587;
    float _613 = -_599;
    float _615 = _613 + 1.0;
    float _617 = _557 * _603;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _619;
    float _623 = _609 * _561;
    float _625 = _539 * _615;
    float _627 = _583 * _617;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _511 + _629;
    float _633 = -_557;
    float _635 = _633 + 1.0;
    bool _637 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _639 = isnan(_511);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = _621 * _577;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _657 = _511 + _655;
    float _659 = fma(_623, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _661 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[115].x, _627);
    float _663 = -_647;
    float _665 = _663 + 1.0;
    float _667 = _653 * _611;
    float _669 = fma(_649, _657, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _673 = _511 + _671;
    float _675 = fma(_659, _605, _661);
    float _677 = _599 * _665;
    float _679 = fma(_667, _673, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _681 = fma(_669, _625, _675);
    float _683 = fma(_679, _677, _681);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _689 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[119].x, _683);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _689 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = in.m_56.x;
    float _703 = in.m_56.y;
    out.m_58.x = _693;
    out.m_58.y = _695;
    out.m_58.z = _699;
    out.m_58.w = _697;
    float _705 = _481 * _703;
    float _707 = _479 * _701;
    bool _709 = !_559;
    float _733;
    float _735;
    float _737;
    if (!_709)
    {
        float _711 = in.m_54.x;
        float _713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _715 = float(_93);
        float _717 = 1.0 / _715;
        float _719 = _711 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _721 = _127 * _717;
        float _723 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _725 = _723 * _713;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = _715;
        _737 = _721;
        _739 = true;
    }
    else
    {
        float _741 = float(_93);
        float _743 = 1.0 / _741;
        float _745 = _127 * _743;
        _733 = _745;
        _735 = _741;
        _737 = _745;
    }
    _739 = false;
    float _747 = _733;
    float _749 = _735;
    float _751 = _737;
    float _753 = in.m_54.x;
    float _755 = in.m_54.y;
    float _757 = in.m_54.z;
    float _759 = in.m_54.w;
    float _761 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _763 = log2(_761);
    float _765 = _705 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _769 = _767 != 0;
    float _771 = _707 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _781 = _757 * 2.0;
    float _783 = _753 * 2.0;
    float _785 = _755 * 2.0;
    bool _787 = _755 > 0.5;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _791 = floor(_783);
    bool _793 = _757 > 0.5;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _797 = -_175;
    int _799 = _787 ? as_type<int>(_797) : as_type<int>(_175);
    float _801 = _763 * _127;
    int _803 = int(_559);
    int _805 = _769 ? 2 : 0;
    int _807 = _803 | _805;
    int _809 = _793 ? 4 : 0;
    int _811 = _807 | _809;
    int _813 = _787 ? 8 : 0;
    int _815 = _811 | _813;
    int _817 = false ? 16 : 0;
    int _819 = _815 | _817;
    int _821 = false ? 32 : 0;
    int _823 = _819 | _821;
    int _825 = false ? 64 : 0;
    int _827 = _823 | _825;
    int _829 = _827 & 4;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _833 = -_185;
    int _835 = _793 ? as_type<int>(_833) : as_type<int>(_185);
    float _837 = floor(_781);
    float _839 = _753 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _841 = -_773;
    float _843 = fma(_839, 2.0, _841);
    float _845 = floor(_785);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _851 = -_127;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[76].x, _843);
    float _855 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _847);
    float _857 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[88].w, _849);
    bool _859 = _837 > 0.0;
    float _861 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _863 = _837 >= 0.0;
    bool _865 = isnan(_837);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    float _873 = exp2(_801);
    float _875 = _755 + _753;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _883 = _881 != 0;
    float _885 = fma(_861, -2.0, _775);
    bool _887 = _791 >= 0.0;
    bool _889 = isnan(_791);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = _875 + (-1.0);
    bool _899 = _845 >= 0.0;
    bool _901 = isnan(_845);
    bool _903 = _899 || _901;
    bool _905 = isnan(0.0);
    bool _907 = _903 || _905;
    float _909 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _911 = int(_909);
    bool _913 = !_879;
    float _915 = _913 ? _175 : as_type<float>(_799);
    float _917 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _919 = !_883;
    float _921 = _919 ? _185 : as_type<float>(_835);
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _933 = _931 != 0;
    int _935 = _871 ? 0 : 1;
    float _937 = -_873;
    float _939 = _937 + 1.0;
    bool _941 = _791 > 0.0;
    bool _943 = !_925;
    int _945 = _943 ? 0 : 1;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _949 = _947 != 0;
    int _951 = ~_935;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    int _957 = _955;
    float _959 = _897;
    float _961 = _839;
    float _963 = _791;
    if (!_859)
    {
        int _965 = ~_935;
        int _967 = _965 + 1;
        _957 = _967;
    }
    int _969 = _957;
    int _971 = abs(_945);
    bool _973 = _845 > 0.0;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _977 = float(_971);
    float _979 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _981 = int(_979);
    if (_949)
    {
        _959 = _753;
    }
    float _983 = _959;
    float _985 = _983;
    if (!_949)
    {
        _961 = _757;
    }
    float _987 = _961;
    float _989 = _987;
    if (!_949)
    {
        _985 = _757;
    }
    float _991 = _985;
    float _993 = _991;
    if (!_949)
    {
        _963 = _755;
    }
    float _995 = _963;
    float _997 = _995;
    if (_949)
    {
        _989 = _755;
    }
    float _999 = _989;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1003 = _999;
    if (_949)
    {
        _997 = _753;
    }
    float _1005 = _997;
    if (_949)
    {
        _993 = _755;
    }
    float _1007 = _993;
    float _1009 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[83].w, _777);
    float _1011 = _1007;
    if (!_949)
    {
        _1003 = _757;
    }
    float _1013 = _1003;
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1017 = _1013;
    if (!_949)
    {
        _1011 = _753;
    }
    float _1019 = _1011;
    float _1021 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[83].z, _975);
    if (_949)
    {
        _1017 = _755;
    }
    float _1023 = _1017;
    float _1025 = -_779;
    float _1027 = fma(_1015, 2.0, _1025);
    float _1029 = -_831;
    float _1031 = fma(_1001, 2.0, _1029);
    float _1033 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1035 = float(_969);
    float _1037 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1039 = fma(_1033, -2.0, _795);
    float _1041 = float(_911);
    float _1043 = fma(_1037, -2.0, _789);
    float _1045 = _977 * _1035;
    float _1047 = in.m_60.x;
    float _1049 = in.m_60.y;
    float _1051 = in.m_60.z;
    int _1053 = _895 ? 0 : 1;
    float _1055 = 1.0 / _1041;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1059 = 1.0 + _1057;
    int _1061 = _907 ? 0 : 1;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1065 = ~_1053;
    int _1067 = _1065 + 1;
    int _1069 = _1067 + 1;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1073 = 1.0 / _1059;
    int _1075 = _1069;
    if (!_941)
    {
        int _1077 = ~_1053;
        int _1079 = _1077 + 1;
        _1075 = _1079;
    }
    int _1081 = _1075;
    float _1083 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1063);
    bool _1085 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1087 = isnan(1.0);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1093 = _1089 || _1091;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1097 = ~_1061;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    float _1103 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1071);
    int _1105 = _1101;
    if (!_973)
    {
        int _1107 = ~_1061;
        int _1109 = _1107 + 1;
        _1105 = _1109;
    }
    int _1111 = _1105;
    float _1113 = _1045 * (-2.0);
    bool _1115 = !_929;
    int _1117 = _1115 ? 0 : 1;
    float _1119 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1021);
    bool _1121 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1123 = isnan(0.0);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1129 = _1125 || _1127;
    float _1131 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1095);
    float _1133 = float(_981);
    float _1135 = _753 + (-0.5);
    int _1137 = abs(_1117);
    float _1139 = fma(_1113, _1047, _1047);
    float _1141 = _1129 ? _939 : 0.0;
    float _1143 = -_127;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1031);
    bool _1147 = !_933;
    int _1149 = _1147 ? 0 : 1;
    float _1151 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1131);
    float _1153 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _885);
    float _1155 = _1133 * _127;
    float _1157 = float(_1081);
    float _1159 = _1055 * _127;
    float _1161 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1083);
    float _1163 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _855);
    float _1165 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1103);
    float _1167 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _857);
    float _1169 = -_127;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1027);
    float _1173 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1009);
    float _1175 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1043);
    float _1177 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1039);
    if (_1093)
    {
        float _1179 = _1141 * _1073;
        _129 = _1179;
    }
    float _1181 = _129;
    float _1183 = fma(_917, _1113, _917);
    float _1185 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1139);
    int _1187 = abs(_1149);
    float _1189 = _755 + _757;
    float _1191 = float(_1137);
    float _1193 = fma(_1183, _1181, _1185);
    float _1195 = _1189 + (-1.0);
    float _1197 = _1191 * _1157;
    float _1199 = float(_1111);
    float _1201 = _1193 * 0.15915493667125701904296875;
    float _1203 = float(_1187);
    float _1205 = _1197 * (-2.0);
    float _1207 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1209 = _757 + _753;
    float _1211 = _757 + (-0.5);
    float _1213 = _1203 * _1199;
    float _1215 = fma(_1205, _1049, _1049);
    float _1217 = _1209 + (-1.0);
    float _1219 = _1213 * (-2.0);
    float _1221 = _755 + (-0.5);
    float _1223 = fma(_1207, _1205, _1207);
    float _1225 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1227 = fma(_1219, _1051, _1051);
    float _1229 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1215);
    float _1231 = _1201 * 6.283185482025146484375;
    float _1233 = sin(_1231);
    float _1235 = fma(_1225, _1219, _1225);
    float _1237 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    float _1239 = fma(_1223, _1181, _1229);
    float _1241 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1245 = fma(_1235, _1181, _1237);
    float _1247 = _1239 * 0.15915493667125701904296875;
    float _1249 = _1201 * 6.283185482025146484375;
    float _1251 = cos(_1249);
    float _1253 = _765 * _1241;
    float _1255 = _1245 * 0.15915493667125701904296875;
    float _1257 = _771 * _1243;
    float _1259 = in.m_42.x;
    float _1261 = in.m_42.y;
    float _1263 = in.m_42.z;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1275 = _1273 != 0;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1279 = _1277 != 0;
    float _1281 = _1247 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = _1255 * 6.283185482025146484375;
    float _1287 = cos(_1285);
    float _1289 = _1247 * 6.283185482025146484375;
    float _1291 = cos(_1289);
    float _1293 = _1251 * _1283;
    float _1295 = _1233 * _1283;
    float _1297 = _1255 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    float _1301 = _1283 * _1287;
    float _1303 = _1287 * _1253;
    bool _1305 = !_1279;
    int _1307 = _1305 ? 0 : 1;
    float _1309 = _1251 * _1303;
    float _1311 = _1251 * _1291;
    float _1313 = _1233 * _1291;
    float _1315 = _1291 * _1287;
    bool _1317 = !_1267;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = fma(_1299, _1311, _1295);
    float _1323 = -_1293;
    float _1325 = fma(_1299, _1313, _1323);
    float _1327 = -_1253;
    float _1329 = _1299 * _1327;
    float _1331 = -_1313;
    float _1333 = fma(_1299, _1293, _1331);
    float _1335 = _1233 * _1303;
    float _1337 = fma(_1321, _1257, _1309);
    float _1339 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1341 = fma(_1299, _1295, _1311);
    float _1343 = fma(_1325, _1257, _1335);
    float _1345 = fma(_1315, _1257, _1329);
    float _1347 = fma(_1333, _1339, _1337);
    float _1349 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1351 = fma(_1341, _1339, _1343);
    float _1353 = fma(_1301, _1339, _1345);
    float _1355 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1357 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1359 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1349);
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1363 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1355);
    float _1365 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1357);
    float _1367 = fma(_1263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1359);
    float _1369 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1361);
    float _1371 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1363);
    float _1373 = fma(_1263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1365);
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1369);
    float _1379 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1381 = _1373 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1383 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1385 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1387 = _1375 + _1379;
    float _1389 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1391 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1383);
    float _1393 = _1381 + _1385;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1397 = _1387 + _1395;
    float _1399 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1389);
    float _1401 = fma(_1263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1391);
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1405 = _1393 + _1403;
    float _1407 = _1397 * _1397;
    bool _1409 = !_1271;
    int _1411 = _1409 ? 0 : 1;
    float _1413 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1399);
    float _1415 = _1401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1417 = fma(_1405, _1405, _1407);
    bool _1419 = !_1275;
    int _1421 = _1419 ? 0 : 1;
    float _1423 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1427 = sqrt(_1417);
    float _1429 = _1415 + _1423;
    float _1431 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1425);
    float _1433 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1431);
    bool _1435 = _1427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1437 = _1413;
    float _1439 = _1393;
    float _1441 = _1423;
    float _1443 = _1427;
    if (!_1435)
    {
        _1437 = _1393;
    }
    float _1445 = _1437;
    float _1447 = _1445;
    if (!_1435)
    {
        _1439 = _1387;
    }
    float _1449 = _1439;
    float _1451 = _1449;
    if (!_1435)
    {
        _1441 = _1429;
    }
    float _1453 = _1441;
    bool _1455 = !_1435;
    float _1457 = _1453;
    if (!_1455)
    {
        float _1459 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1463 = _1427 + _1461;
        float _1465 = _1429 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = rsqrt(_1417);
        float _1469 = _1463 * _1459;
        float _1471 = _1469 * 0.15915493667125701904296875;
        float _1473 = _1471 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = _1471 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = _1475 + (-1.0);
        float _1483 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1485 = fma(_1479, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1487 = fma(_1429, _1475, _1483);
        float _1489 = _1467 * _1485;
        float _1491 = fma(_1405, _1489, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1493 = fma(_1397, _1489, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1457 = _1487;
        _1447 = _1491;
        _1451 = _1493;
        _1443 = _1485;
    }
    float _1495 = _1457;
    float _1497 = _1447;
    float _1499 = _1451;
    float _1501 = _1443;
    float _1503 = -_1415;
    float _1505 = _1503 + _1495;
    float _1507 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1509 = -_1381;
    float _1511 = _1509 + _1497;
    float _1513 = -_1375;
    float _1515 = _1513 + _1499;
    float _1517 = _1505 * _1505;
    float _1519 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1521 = 1.0 / _1507;
    float _1523 = fma(_1511, _1511, _1517);
    float _1525 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1519);
    float _1527 = fma(_1515, _1515, _1523);
    float _1529 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    bool _1531 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1533 = isnan(0.5);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1539 = _1535 || _1537;
    float _1541 = sqrt(_1527);
    float _1543 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1545 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1547 = isnan(0.5);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1553 = _1549 || _1551;
    float _1555 = _1543 + _1507;
    float _1557 = _1555 * _1521;
    float _1559 = _1557 * 0.5;
    bool _1561 = _1541 > 0.0;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1565 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1563);
    float _1567 = 1.0 / _1565;
    float _1569 = _1559;
    float _1571 = _1497;
    float _1573 = _1499;
    float _1575 = _1501;
    float _1577 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1579 = _1495;
    float _1581 = _1527;
    if (!_1561)
    {
        _1569 = _1495;
    }
    float _1583 = _1569;
    bool _1585 = !_1561;
    float _1587 = _1583;
    if (!_1585)
    {
        float _1589 = _189 * _189;
        float _1591 = fma(_187, _187, _1589);
        float _1593 = fma(_191, _191, _1591);
        float _1595 = rsqrt(_1527);
        float _1597 = sqrt(_1593);
        float _1599 = _1511 * _1595;
        float _1601 = _1505 * _1595;
        float _1603 = _1515 * _1595;
        bool _1605 = _1597 > 0.0;
        float _1607 = _1597;
        _1575 = _1593;
        _1577 = _1595;
        if (!_1605)
        {
            _1607 = _1495;
        }
        float _1609 = _1607;
        bool _1611 = !_1605;
        _1587 = _1609;
        if (!_1611)
        {
            float _1613 = rsqrt(_1593);
            float _1615 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1617 = _189 * _1613;
            float _1619 = _187 * _1613;
            float _1621 = _191 * _1613;
            float _1623 = _1601 * _1617;
            float _1625 = fma(_1599, _1619, _1623);
            float _1627 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1629 = fma(_1603, _1621, _1625);
            float _1631 = _1629 * _1627;
            float _1633 = fma(_187, _1631, _1497);
            float _1635 = fma(_189, _1631, _1495);
            float _1637 = fma(_191, _1631, _1499);
            _1571 = _1633;
            _1587 = _1635;
            _1573 = _1637;
            _1577 = _1631;
        }
    }
    float _1639 = _1571;
    float _1641 = _1587;
    float _1643 = _1573;
    float _1645 = _1575;
    float _1647 = _1577;
    float _1649 = _1647;
    float _1651 = _1639;
    float _1653 = _1641;
    float _1655 = _1645;
    if (_1553)
    {
        _1649 = 1.0;
    }
    float _1657 = _1649;
    float _1659 = _1657;
    if (_1539)
    {
        _195 = _1639;
    }
    float _1661 = _195;
    float _1663 = _1661;
    if (_1539)
    {
        _197 = _1641;
    }
    float _1665 = _197;
    float _1667 = _1665;
    if (_1539)
    {
        _1579 = _1643;
    }
    float _1669 = _1579;
    float _1671 = _1669;
    if (!_1539)
    {
        float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1675 = _1415 + _1673;
        float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1679 = _1381 + _1677;
        float _1681 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1683 = -_1381;
        float _1685 = _1683 + _1639;
        float _1687 = _1675 * _1675;
        float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1691 = _1375 + _1689;
        float _1693 = -_1415;
        float _1695 = _1693 + _1641;
        float _1697 = fma(_1679, _1679, _1687);
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1701 = fma(_1691, _1691, _1697);
        float _1703 = sqrt(_1701);
        float _1705 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1707 = -_1375;
        float _1709 = _1707 + _1643;
        float _1711 = precise::min(_1703, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1713 = _1711 * _1699;
        float _1715 = _1705 * _1713;
        float _1717 = fma(_1685, _1715, _1381);
        float _1719 = fma(_1695, _1715, _1415);
        float _1721 = fma(_1709, _1715, _1375);
        _1651 = _1685;
        _1653 = _1695;
        _1667 = _1719;
        _1663 = _1717;
        _1671 = _1721;
        _1655 = _1715;
    }
    float _1723 = _1651;
    float _1725 = _1653;
    float _1727 = _1667;
    float _1729 = _1663;
    float _1731 = _1671;
    float _1733 = _1655;
    float _1735 = _1725;
    float _1737 = _1723;
    float _1739 = _1733;
    if (_1553)
    {
        _1735 = 1.0;
    }
    float _1741 = _1735;
    float _1743 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1745 = _1567 * _1743;
    float _1747 = _1741;
    if (!_1553)
    {
        float _1749 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1751 = _1749 * 0.15915493667125701904296875;
        float _1753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1757 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1755;
        float _1759 = _1751 * 6.283185482025146484375;
        float _1761 = cos(_1759);
        float _1763 = _1753 * 0.15915493667125701904296875;
        float _1765 = _1751 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = 1.0 / _1761;
        float _1771 = _1763 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = _1763 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1773 * _1775;
        float _1783 = 1.0 / _1757;
        float _1785 = 1.0 / _1781;
        float _1787 = _1779 * _1785;
        float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1791 = fma(_1745, _1787, _1789);
        float _1793 = _1791 * _1783;
        float _1795 = precise::clamp(_1793, 0.0, 1.0);
        _1737 = _1769;
        _1659 = _1795;
    }
    float _1797 = _1737;
    float _1799 = _1659;
    float _1801 = _1797;
    if (!_1553)
    {
        float _1803 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1805 = _1803 * 0.15915493667125701904296875;
        float _1807 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1809 = _1805 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = _1807 * 0.15915493667125701904296875;
        float _1815 = _1805 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        float _1819 = 1.0 / _1811;
        float _1821 = _1813 * 6.283185482025146484375;
        float _1823 = cos(_1821);
        float _1825 = _1817 * _1819;
        float _1827 = _1813 * 6.283185482025146484375;
        float _1829 = sin(_1827);
        float _1831 = _1823 * _1825;
        float _1833 = 1.0 / _1831;
        float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1837 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1835;
        float _1839 = 1.0 / _1837;
        float _1841 = _1829 * _1833;
        float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1845 = fma(_1745, _1841, _1843);
        float _1847 = _1845 * _1839;
        float _1849 = precise::clamp(_1847, 0.0, 1.0);
        float _1851 = -_1849;
        float _1853 = _1851 + 1.0;
        _1739 = _1841;
        _1801 = _1829;
        _1747 = _1853;
    }
    float _1855 = _1739;
    float _1857 = _1801;
    float _1859 = _1747;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1863 = _1727 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1867 = _1729 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1871 = _1731 + _1869;
    float _1873 = _1863 * _1863;
    float _1875 = fma(_1867, _1867, _1873);
    float _1877 = fma(_1871, _1871, _1875);
    float _1879 = rsqrt(_1877);
    float _1881 = sqrt(_1877);
    float _1883 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1885 = _1867 * _1883;
    float _1887 = _1871 * _1883;
    float _1889 = _1885 * _1885;
    float _1891 = _1887 * _1887;
    float _1893 = _1889 + _1891;
    float _1895 = sqrt(_1893);
    bool _1897 = _1895 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1901 = _1895 + _1899;
    float _1903 = _1879;
    float _1905 = _1893;
    float _1907 = _1901;
    float _1909 = _1855;
    if (_1897)
    {
        float _1911 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _1911;
    }
    float _1913 = _1903;
    if (_1897)
    {
        float _1915 = rsqrt(_1893);
        _1905 = _1915;
    }
    float _1917 = _1905;
    float _1919 = _1917;
    if (_1897)
    {
        float _1921 = _1901 * _1913;
        _1907 = _1921;
    }
    float _1923 = _1907;
    if (_1897)
    {
        float _1925 = _1923 * 0.15915493667125701904296875;
        _1909 = _1925;
    }
    float _1927 = _1909;
    float _1929 = _1871;
    float _1931 = _1927;
    if (_1897)
    {
        float _1933 = _1927 * 6.283185482025146484375;
        float _1935 = sin(_1933);
        _1929 = _1935;
    }
    float _1937 = _1929;
    float _1939 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1941 = precise::max(0.0, _1939);
    float _1943 = _1857;
    float _1945 = _1941;
    float _1947 = _1939;
    if (_1897)
    {
        float _1949 = _1927 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        _1943 = _1951;
    }
    float _1953 = _1943;
    float _1955 = -_1883;
    float _1957 = -_1941;
    float _1959 = fma(_1863, _1955, _1957);
    float _1961 = _1959;
    if (_1897)
    {
        float _1963 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1945 = _1963;
    }
    float _1965 = _1945;
    float _1967 = _1937;
    float _1969 = _1965;
    if (_1897)
    {
        float _1971 = fma(_1937, _1965, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1967 = _1971;
    }
    float _1973 = _1967;
    float _1975 = _1973;
    if (!_1897)
    {
        _1969 = _1885;
    }
    float _1977 = _1969;
    float _1979 = _1977;
    if (_1897)
    {
        float _1981 = _1953 + (-1.0);
        _1947 = _1981;
    }
    float _1983 = _1947;
    float _1985 = _1983;
    if (_1897)
    {
        float _1987 = _1917 * _1973;
        _1581 = _1987;
    }
    float _1989 = _1581;
    if (!_1897)
    {
        _1975 = _1959;
    }
    float _1991 = _1975;
    float _1993 = _1991;
    if (_1897)
    {
        float _1995 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1931 = _1995;
    }
    float _1997 = _1931;
    if (_1897)
    {
        float _1999 = _1885 * _1989;
        _1979 = _1999;
    }
    float _2001 = _1979;
    if (!_1897)
    {
        _1985 = _1887;
    }
    float _2003 = _1985;
    float _2005 = _2003;
    if (_1897)
    {
        float _2007 = _1887 * _1989;
        _2005 = _2007;
    }
    float _2009 = _2005;
    if (!_1897)
    {
        _1919 = _1889;
    }
    float _2011 = _1919;
    float _2013 = _2011;
    if (_1897)
    {
        float _2015 = fma(_1959, _1953, _1997);
        _1993 = _2015;
    }
    float _2017 = _1993;
    if (_1897)
    {
        float _2019 = _2001 * _2001;
        _2013 = _2019;
    }
    float _2021 = _2013;
    if (!_1897)
    {
        _1961 = _1891;
    }
    float _2023 = _1961;
    float _2025 = _2023;
    if (_1897)
    {
        float _2027 = _2009 * _2009;
        _2025 = _2027;
    }
    float _2029 = _2025;
    float _2031 = fma(_2017, _2017, _2021);
    float _2033 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2035 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2037 = _2031 + _2029;
    float _2039 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2033);
    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2043 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2041);
    float _2045 = precise::clamp(_2043, 0.0, 1.0);
    float _2047 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2049 = rsqrt(_2037);
    float _2051 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2039);
    float _2053 = -_2045;
    float _2055 = _2053 + 1.0;
    float _2057 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2059 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2061 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2047);
    float _2063 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2065 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2057);
    float _2067 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2059);
    float _2069 = abs(_2055);
    float _2071 = log2(_2069);
    float _2073 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2061);
    float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2077 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    float _2079 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2065);
    float _2081 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2083 = -_2075;
    float _2085 = fma(_2083, _2035, 1.0);
    float _2087 = _2049 * _2001;
    float _2089 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2091 = _2049 * _2017;
    float _2093 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2095 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2097 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2099 = _2049 * _2009;
    float _2101 = log2(_2085);
    float _2103 = -_2095;
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2103);
    float _2107 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2097);
    float _2109 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2111 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2113 = -_2099;
    float _2115 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2105);
    float _2117 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2107);
    float _2119 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2121 = exp2(_2109);
    float _2123 = fma(_2115, -0.5, 0.5);
    float _2125 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2117);
    float _2127 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2119);
    float _2129 = fma(_2115, 0.5, 0.5);
    float _2131 = _2091 + 1.0;
    float _2133 = 1.0 / _2125;
    float _2135 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2111);
    float _2137 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2127);
    float _2139 = fma(_2129, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2141 = _2101 * 0.693147182464599609375;
    float _2143 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2135);
    float _2145 = fma(_2129, _2139, -0.212114393711090087890625);
    float _2147 = sqrt(_2123);
    float _2149 = -_2091;
    float _2151 = fma(_2121, _2131, _2149);
    float _2153 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2137);
    float _2155 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2143);
    float _2157 = fma(_2129, _2145, 1.570728778839111328125);
    float _2159 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2161 = fma(_2151, 0.5, 0.5);
    float _2163 = _2153 * _2133;
    float _2165 = _2155 * _2133;
    float _2167 = fma(_2163, 0.5, 0.5);
    float _2169 = fma(_2165, -0.5, 0.5);
    float _2171 = _2147 * 0.636619746685028076171875;
    float _2173 = -_2157;
    float _2175 = fma(_2171, _2173, 1.0);
    float3 _6638 = float3(_2167, _2169, _2159);
    float _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6638, float3(0.0), isnan(_6638)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6638, float3(0.0), isnan(_6638)), level(0.0)).x;
    float3 _6649 = float3(_2167, _2169, _2159);
    float4 _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6649, float3(0.0), isnan(_6649)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6649, float3(0.0), isnan(_6649)), level(0.0)).xyzw;
    float _2182 = _2180.x;
    float _2184 = _2180.y;
    float _2186 = _2180.z;
    float _2188 = _2180.w;
    float2 _6666 = float2(_2175, _2161);
    float3 _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6666, float2(0.0), isnan(_6666)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6666, float2(0.0), isnan(_6666)), level(0.0)).xyz;
    float _2194 = _2192.x;
    float _2196 = _2192.y;
    float _2198 = _2192.z;
    float _2200 = float(uint(_981));
    float _2202 = trunc(_1159);
    int _2204 = int(_2202);
    int _2206 = ~_981;
    int _2208 = _2206 + 1;
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2212 = _747 + _2210;
    bool _2214 = _755 > 0.5;
    float _2216 = _1151 * (-0.15915493667125701904296875);
    float _2218 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2220 = !_949;
    float _2222 = _2220 ? _755 : _753;
    float _2224 = 1.0 / _2200;
    float _2226 = -_1173;
    float _2228 = _2226 + 1.0;
    bool _2230 = _759 > 0.5;
    float _2232 = -_1161;
    float _2234 = _2232 + 1.0;
    int _2236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2238 = _2236 != 0;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2242 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2248 = float(uint(_2204));
    float _2250 = 1.0 / _749;
    float _2252 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2254 = -_185;
    int _2256 = _2214 ? as_type<int>(_2254) : as_type<int>(_185);
    float _2258 = -_1165;
    float _2260 = _2258 + 1.0;
    bool _2262 = !_949;
    float _2264 = _2262 ? 1.2345600128173828125 : 1.0;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _2270 = as_type<int>(_2224) + (-2);
    float _2272 = 1.0 / _2242;
    int _2274 = ~_981;
    int _2276 = _2274 + 1;
    float _2278 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2252);
    float _2280 = float(_2204);
    float _2282 = as_type<float>(_2270) * _2248;
    float _2284 = -_185;
    int _2286 = _2230 ? as_type<int>(_2284) : as_type<int>(_185);
    float _2288 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2278);
    bool _2290 = !_2238;
    float _2292 = _2290 ? _185 : as_type<float>(_2256);
    float _2294 = trunc(_2282);
    float _2296 = precise::max(_2294, 0.0);
    uint _2299 = uint(_2296);
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2303 = _2301 != 0;
    float _2305 = -_1167;
    float _2307 = _2305 + 1.0;
    int _2309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2311 = _2309 != 0;
    float _2313 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2288);
    int _2315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2317 = _2315 != 0;
    int _2319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2321 = _2319 != 0;
    float _2323 = 1.0 / _2246;
    out.gl_Position.x = _2153;
    out.gl_Position.y = _2155;
    out.gl_Position.z = _2313;
    out.gl_Position.w = _2125;
    bool _2325 = _753 > 0.5;
    bool _2327 = _829 != 0;
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2333 = _2280 >= _1133;
    bool _2335 = isnan(_2280);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(_1133);
    bool _2341 = _2337 || _2339;
    float _2343 = float(_2341);
    int _2345 = _2208 * int(_2299);
    int _2347 = _2345 + _2204;
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2351 = _747 + _2349;
    float _2353 = 1.0 / _2268;
    int _2355 = abs(_1319);
    float _2357 = _2351 * _2272;
    float _2359 = float(uint(_2347));
    float _2361 = _2212 * _2323;
    float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    int _2367 = abs(_1421);
    float _2369 = as_type<float>(_2270) * _2359;
    float _2371 = 1.0 / _2331;
    float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2375 = _2373 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2377 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2379 = isnan(_751);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2385 = _2381 || _2383;
    float _2387 = float(_2385);
    float _2389 = trunc(_2369);
    float _2391 = precise::max(_2389, 0.0);
    uint _2393 = uint(_2391);
    float _2395 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2397 = _2395 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _2399 = ~_981;
    int _2401 = _2399 + 1;
    float _2403 = trunc(_2343);
    int _2405 = int(_2403);
    int _2407 = int(_2299) + int(_2393);
    float _2409 = 1.0 / _2375;
    int _2411 = _2276 * _2407;
    int _2413 = _2411 + _2204;
    float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2419 = 1.0 / _2397;
    bool _2421 = uint(_2413) >= uint(_981);
    bool _2423 = !_2421;
    int _2425 = _2423 ? 0 : (-1);
    float _2427 = 1.0 / _2417;
    int _2429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2431 = _2429 != 0;
    float _2433 = _2264 * _2222;
    float _2435 = floor(_2433);
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2437;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2445 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2447 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2445;
    float _2449 = _2439 * _2409;
    float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2455 = _2447 * _2371;
    int _2457 = ~_2407;
    int _2459 = _2457 + _2425;
    int _2461 = _2459 + 1;
    float _2463 = _2365 * _2427;
    float _2465 = _1155 * _2250;
    float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2469 = _2467 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2471 = !_2431;
    float _2473 = _2471 ? _185 : as_type<float>(_2286);
    int _2475 = _981 * _2461;
    int _2477 = _2475 + _2204;
    bool _2479 = _981 == 0;
    float _2481 = -_2435;
    float _2483 = _2433 + _2481;
    float _2485 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2485;
    int _2489 = ~_2405;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    float _2495 = 1.0 / _2469;
    bool _2497 = !_2479;
    int _2499 = _2497 ? _2477 : (-1);
    float _2501 = _2483 * _1133;
    float _2503 = _2487 * _2353;
    int _2505 = abs(_1411);
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2509 = _2507 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _2511 = _2499 * _2493;
    float _2513 = trunc(_2465);
    int _2515 = int(_2513);
    int _2517 = _981 + (-1);
    float _2519 = _2443 * _2419;
    int _2521 = ~_981;
    int _2523 = _2521 + 1;
    float _2525 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2525;
    bool _2529 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2531 = isnan(_747);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2537 = _2533 || _2535;
    float _2539 = float(_2537);
    int _2541 = _2405 * _2517;
    int _2543 = _2541 + _2511;
    bool _2545 = !_2321;
    int _2547 = _2545 ? 0 : 1;
    float _2549 = trunc(_2501);
    int _2551 = int(_2549);
    int _2553 = abs(_1307);
    int _2555 = _2543 * _2505;
    int _2557 = abs(_2547);
    float _2559 = _2527 * _2495;
    float _2561 = -_175;
    int _2563 = _2327 ? as_type<int>(_2561) : as_type<int>(_175);
    float _2565 = -_175;
    int _2567 = _2325 ? as_type<int>(_2565) : as_type<int>(_175);
    int _2569 = _2515 * _2355;
    int _2571 = _2569 + _2555;
    float _2573 = 1.0 / _2453;
    bool _2575 = !_2303;
    float _2577 = _2575 ? _175 : as_type<float>(_2563);
    bool _2579 = !_2317;
    float _2581 = _2579 ? _175 : as_type<float>(_2567);
    int _2583 = _2551 * _2557;
    int _2585 = _2583 + _2204;
    float _2587 = _2216 * 6.283185482025146484375;
    float _2589 = sin(_2587);
    int _2591 = _2585 * _2367;
    int _2593 = _2591 + _2571;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2597 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2595;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2599;
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2605 = _2603 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _2607 = _2551 * _2553;
    int _2609 = _2607 + _2593;
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2611;
    float _2615 = fma(_2601, _2357, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2619 = _751 + _2617;
    float _2621 = fma(_2605, _2361, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2623 = float(uint(_2609));
    float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2627 = _751 + _2625;
    float _2629 = fma(_2449, _2619, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2631 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2633 = _2631 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2637 = _751 + _2635;
    float _2639 = as_type<float>(_2270) * _2623;
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2643 = _2641 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2647 = _751 + _2645;
    float _2649 = fma(_2519, _2627, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _2651 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2653 = isnan(_751);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2659 = _2655 || _2657;
    float _2661 = float(_2659);
    float _2663 = fma(_2633, _2361, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2665 = trunc(_2639);
    float _2667 = precise::max(_2665, 0.0);
    uint _2669 = uint(_2667);
    float _2671 = fma(_2455, _2637, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2673 = fma(_2597, _2357, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2675 = fma(_2643, _2361, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2677 = fma(_2503, _2647, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2679 = _2509 * _2573;
    float _2681 = fma(_2613, _2357, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2685 = _751 + _2683;
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2689 = _751 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2693 = _751 + _2691;
    bool _2695 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2697 = isnan(_751);
    bool _2699 = _2695 || _2697;
    bool _2701 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2703 = _2699 || _2701;
    float _2705 = float(_2703);
    float _2707 = -_2661;
    float _2709 = _2707 + 1.0;
    float _2711 = fma(_2463, _2685, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2713 = fma(_2679, _2689, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2715 = fma(_2559, _2693, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _2717 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2719 = isnan(_751);
    bool _2721 = _2717 || _2719;
    bool _2723 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2725 = _2721 || _2723;
    float _2727 = float(_2725);
    int _2729 = _2523 * int(_2669);
    int _2731 = _2729 + _2609;
    float _2733 = _2705 * _2709;
    float _2735 = -_2705;
    float _2737 = _2735 + 1.0;
    bool _2739 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2741 = isnan(_747);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2747 = _2743 || _2745;
    float _2749 = float(_2747);
    float _2751 = -_2727;
    float _2753 = _2751 + 1.0;
    float _2755 = float(uint(_2731));
    float _2757 = _2727 * _2737;
    bool _2759 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2761 = isnan(_751);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2767 = _2763 || _2765;
    float _2769 = float(_2767);
    float _2771 = -_2749;
    float _2773 = _2771 + 1.0;
    bool _2775 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2777 = isnan(_747);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2783 = _2779 || _2781;
    float _2785 = float(_2783);
    float _2787 = as_type<float>(_2270) * _2755;
    bool _2789 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2791 = isnan(_751);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2797 = _2793 || _2795;
    float _2799 = float(_2797);
    float _2801 = -_2769;
    float _2803 = _2801 + 1.0;
    bool _2805 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2807 = isnan(_751);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = -_2785;
    float _2819 = _2817 + 1.0;
    float _2821 = exp2(_2218);
    float _2823 = _2799 * _2753;
    bool _2825 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2827 = isnan(_751);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    float _2837 = -_2815;
    float _2839 = _2837 + 1.0;
    float _2841 = _2815 * _2803;
    float _2843 = _2749 * _2819;
    float _2845 = -_2799;
    float _2847 = _2845 + 1.0;
    float _2849 = _2387 * _2839;
    float _2851 = trunc(_2787);
    float _2853 = precise::max(_2851, 0.0);
    uint _2855 = uint(_2853);
    float _2857 = -_2387;
    float _2859 = _2857 + 1.0;
    float _2861 = _2539 * _2773;
    float _2863 = -_2539;
    float _2865 = _2863 + 1.0;
    float _2867 = _2835 * _2859;
    float _2869 = float(uint(_2585));
    float _2871 = _2615 * _2861;
    float _2873 = _2681 * _2861;
    float _2875 = _2629 * _2867;
    float _2877 = -_2835;
    float _2879 = _2877 + 1.0;
    float _2881 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2871);
    float _2883 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2873);
    float _2885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2887 = fma(_2879, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2875);
    float _2889 = fma(_2663, _2843, _2881);
    int _2891 = int(_2669) + int(_2855);
    float _2893 = _2673 * _2861;
    float _2895 = as_type<float>(_2270) * _2869;
    float _2897 = _2292 * _2589;
    float _2899 = fma(_2649, _2849, _2887);
    int _2901 = _2401 * _2891;
    int _2903 = _2901 + _2609;
    float _2905 = _2216 * 6.283185482025146484375;
    float _2907 = cos(_2905);
    float _2909 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2893);
    float _2911 = fma(_2671, _2841, _2899);
    float _2913 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2889);
    bool _2915 = uint(_2903) >= uint(_981);
    float _2917 = fma(_2621, _2843, _2909);
    int _2919 = ~_981;
    int _2921 = _2919 + 1;
    float _2923 = _2769 * _2847;
    float _2925 = trunc(_2895);
    float _2927 = precise::max(_2925, 0.0);
    uint _2929 = uint(_2927);
    bool _2931 = !_2915;
    int _2933 = _2931 ? 0 : (-1);
    float _2935 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2917);
    float _2937 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2939 = ~_2891;
    int _2941 = _2939 + _2933;
    int _2943 = _2941 + 1;
    float _2945 = fma(_2675, _2843, _2883);
    float _2947 = fma(_2711, _2923, _2911);
    float _2949 = _2292 * _2907;
    float _2951 = -_2897;
    float _2953 = fma(_2581, _2907, _2951);
    int _2955 = _981 * _2943;
    int _2957 = _2955 + _2609;
    float _2959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2961 = fma(_2581, _2589, _2949);
    float _2963 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2945);
    float _2965 = _2953 + 0.5;
    bool _2967 = !_2479;
    int _2969 = _2967 ? _2957 : (-1);
    int _2971 = _2921 * int(_2929);
    int _2973 = _2971 + _2585;
    float _2975 = _915 + 0.5;
    float _2977 = fma(_2937, _2965, _853);
    int _2979 = _2969 >> 31;
    float _2981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2983 = float(uint(_2973));
    float _2985 = fma(_2677, _2823, _2947);
    int _2987 = _2979 & 3;
    float _2989 = -_2821;
    float _2991 = _2989 + 1.0;
    int _2993 = _2969 & 3;
    bool _2995 = _2993 != 0;
    float _2997 = as_type<float>(_2270) * _2983;
    int _2999 = _2969 + _2987;
    float _3001 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3003 = _2961 + (-0.5);
    float _3005 = trunc(_2997);
    float _3007 = precise::max(_3005, 0.0);
    uint _3009 = uint(_3007);
    int _3011 = _2999 >> 2;
    float _3013 = fma(_2713, _2757, _2985);
    float _3015 = -_3001;
    float _3017 = -_1153;
    float _3019 = fma(_3015, _3003, _3017);
    bool _3021 = uint(_2993) > 1u;
    float _3023 = _2963 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3025 = _3011 << 4;
    int _3027 = _3025 + 512;
    float _3029 = _2981 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3033 = _2473 + (-0.5);
    uint _3035 = uint(int(uint(_3027) >> uint(2)));
    uint _3037 = uint(int(uint(int(_3035)) >> uint(2)));
    int _3039 = int(_3035) & 3;
    float _3041 = (*spvDescriptorSet0.vp_c9)._m0[int(_3037)][_3039];
    int _3043 = int(_3035) + 1;
    uint _3045 = uint(int(uint(_3043) >> uint(2)));
    int _3047 = _3043 & 3;
    float _3049 = (*spvDescriptorSet0.vp_c9)._m0[int(_3045)][_3047];
    int _3051 = _2969 & 3;
    bool _3053 = _3051 != 0;
    float _3055 = fma(_3029, _2975, _1145);
    float _3057 = -_3033;
    float _3059 = -_1175;
    float _3061 = fma(_3057, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3059);
    float _3063 = _2577 + 0.5;
    float _3065 = _921 + (-0.5);
    int _3067 = _3053 ? 0 : 1;
    int _3069 = _3027 + 8;
    uint _3071 = uint(int(uint(_3069) >> uint(2)));
    uint _3073 = uint(int(uint(int(_3071)) >> uint(2)));
    int _3075 = int(_3071) & 3;
    float _3077 = (*spvDescriptorSet0.vp_c9)._m0[int(_3073)][_3075];
    int _3079 = int(_3071) + 1;
    uint _3081 = uint(int(uint(_3079) >> uint(2)));
    int _3083 = _3079 & 3;
    float _3085 = (*spvDescriptorSet0.vp_c9)._m0[int(_3081)][_3083];
    float _3087 = fma(_3063, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1171);
    float _3089 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3091 = ~_3067;
    int _3093 = _3091 + 1;
    int _3095 = _3093 + 1;
    float _3097 = _2935 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3099 = _3095;
    if (!_3021)
    {
        int _3101 = ~_3067;
        int _3103 = _3101 + 1;
        _3099 = _3103;
    }
    int _3105 = _3099;
    float _3107 = _3031 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3109 = _2913 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3111 = _2993 != 3;
    float _3113 = _3097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3115 = -_3107;
    float _3117 = -_1177;
    float _3119 = fma(_3115, _3065, _3117);
    bool _3121 = !_2995;
    int _3123 = _3121 ? 0 : 1;
    float _3125 = _3109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3127 = _3023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3129 = uint(_2993) >= 2u;
    float _3131 = _2991 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3133 = abs(_3105);
    float _3135 = -_2260;
    float _3137 = fma(_915, _3135, _3055);
    int _3139 = abs(_3123);
    out.m_62.x = _3113;
    out.m_62.y = _3125;
    out.m_62.z = _3127;
    out.m_62.w = _3089;
    int _3141 = _3129 ? 0 : 1;
    float _3143 = _3131 * _2177;
    int _3145 = int(_2929) + int(_3009);
    float _3147 = fma(_921, _2307, _3119);
    int _3149 = ~_981;
    int _3151 = _3149 + 1;
    float _3153 = fma(_2715, _2733, _3013);
    bool _3155 = _2993 != 3;
    int _3157 = _3151 * _3145;
    int _3159 = _3157 + _2585;
    int _3161 = ~_3133;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    float _3167 = -_1119;
    float _3169 = _3167 + 1.0;
    int _3171 = ~_3141;
    int _3173 = _3171 + 1;
    int _3175 = _3173 + 1;
    float _3177 = _2198 * _3143;
    int _3179 = _3175;
    if (_3111)
    {
        int _3181 = ~_3141;
        int _3183 = _3181 + 1;
        _3179 = _3183;
    }
    int _3185 = _3179;
    float _3187 = -_3169;
    float _3189 = fma(_2577, _3187, _3087);
    int _3191 = ~_3139;
    int _3193 = _3191 + 1;
    int _3195 = _3193 + 1;
    int _3197 = _3165 * as_type<int>(_3049);
    int _3199 = abs(_3185);
    float _3201 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3153);
    bool _3203 = !_2311;
    int _3205 = _3203 ? 0 : 1;
    int _3207 = _3195 * as_type<int>(_3041);
    int _3209 = _3207 + _3197;
    bool _3211 = uint(_3159) >= uint(_981);
    float _3213 = -_1163;
    float _3215 = _3213 + 1.0;
    bool _3217 = !_3155;
    int _3219 = _3217 ? 0 : (-1);
    float _3221 = -_2234;
    float _3223 = fma(_2953, _3221, _2977);
    int _3225 = abs(_3205);
    float _3227 = fma(_2473, _2228, _3061);
    float _3229 = fma(_2961, _3215, _3019);
    bool _3231 = !_3211;
    int _3233 = _3231 ? 0 : (-1);
    out.m_64.x = _3137;
    out.m_64.y = _3147;
    int _3235 = abs(_3219);
    int _3237 = ~_3199;
    int _3239 = _3237 + 1;
    int _3241 = _3239 + 1;
    out.m_66.x = _3223;
    out.m_66.y = _3229;
    out.m_66.z = _3189;
    out.m_66.w = _3227;
    int _3243 = ~_3145;
    int _3245 = _3243 + _3233;
    int _3247 = _3245 + 1;
    int _3249 = ~_3235;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    int _3255 = _3241 * as_type<int>(_3077);
    int _3257 = _3255 + _3209;
    int _3259 = ~_3225;
    int _3261 = _3259 + 1;
    int _3263 = _3261 + 1;
    int _3265 = _981 * _3247;
    int _3267 = _3265 + _2585;
    bool _3269 = _1799 > 0.0;
    bool _3271 = isnan(_1799);
    bool _3273 = _3269 || _3271;
    bool _3275 = isnan(0.0);
    bool _3277 = _3273 || _3275;
    int _3279 = _3253 * as_type<int>(_3085);
    int _3281 = _3279 + _3257;
    float _3283 = _2313 + _2125;
    out.m_68.x = _3201;
    bool _3285 = _1859 <= 0.0;
    bool _3287 = !_3277;
    bool _3289 = _3285 || _3287;
    int _3291 = _3281 * _3263;
    float _3293 = _3283 * 0.5;
    float _3295 = _1799 * _1859;
    bool _3297 = !_2479;
    int _3299 = _3297 ? _3267 : (-1);
    float _3301 = _2125 * 0.5;
    float _3303 = fma(_2188, _3177, _2186);
    float _3305 = _3295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3307 = _3299 * _3225;
    int _3309 = _3307 + _3291;
    float _3311 = fma(_2155, -0.5, _3301);
    float _3313 = _3305 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3315 = _2153 + _2125;
    float _3317 = -_3131;
    float _3319 = _3317 + 1.0;
    float _3321 = float(_3309);
    float _3323 = _3315 * 0.5;
    float _3325 = _2188 * _3143;
    float _3327 = _2188 * _3319;
    float _3329 = fma(_2194, _3325, _2182);
    float _3331 = fma(_2196, _3325, _2184);
    out.m_45.x = _3313;
    out.m_70.y = _3321;
    out.m_72.x = _3323;
    out.m_72.y = _3311;
    out.m_72.z = _3293;
    out.m_72.w = _2125;
    out.m_74.x = _3329;
    out.m_74.y = _3331;
    out.m_74.z = _3303;
    out.m_74.w = _3327;
    if (!_3289)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3333 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3333;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _739 = false;
    bool _503 = false;
    bool _217 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3390 = as_type<float>(_109);
        out.gl_Position.z = _3390;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_47.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_93);
        _103 = _131;
    }
    float _133 = _103;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _111 = as_type<int>(_145);
    }
    int _147 = _111;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3460 = as_type<float>(_147);
        out.gl_Position.z = _3460;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _149 = as_type<float>(int(gl_VertexIndex));
    float _151 = in.m_52.x;
    float _153 = in.m_52.y;
    float _155 = in.m_52.z;
    int _157 = as_type<int>(_149) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_149) & 2;
    bool _163 = _161 != 0;
    bool _165 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _167 = _153 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _169 = _153 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _171 = _153 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _173 = !_159;
    float _175 = _173 ? (-0.5) : 0.5;
    float _177 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].x, _167);
    float _179 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].x, _169);
    float _181 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].x, _171);
    bool _183 = !_163;
    float _185 = _183 ? (-0.5) : 0.5;
    float _187 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].z, _177);
    float _189 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].z, _179);
    float _191 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].z, _181);
    bool _193 = !_165;
    float _195 = _187;
    float _197 = _189;
    float _215;
    if (!_193)
    {
        float _199 = in.m_54.x;
        float _201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _203 = _199 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _205 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _207 = _205 * _201;
        float _209 = floor(_207);
        float _211 = -_209;
        float _213 = _207 + _211;
        _215 = _213;
        _217 = true;
    }
    else
    {
        float _219 = float(_93);
        float _221 = 1.0 / _219;
        float _223 = _127 * _221;
        _215 = _223;
    }
    _217 = false;
    float _225 = _215;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _245 = _243 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _247 = 1.0 / _233;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _249;
    bool _253 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _255 = isnan(_225);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = 1.0 / _237;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = _225 + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _273 = 1.0 / _241;
    float _275 = _269 * _247;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = _225 + _277;
    float _281 = 1.0 / _245;
    float _283 = _229 * _265;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _225 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _291 = _225 + _289;
    float _293 = 1.0 / _251;
    float _295 = _279 * _273;
    bool _297 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _299 = isnan(_225);
    bool _301 = _297 || _299;
    bool _303 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _305 = _301 || _303;
    float _307 = float(_305);
    bool _309 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _311 = isnan(_225);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = _287 * _281;
    float _323 = -_263;
    float _325 = _323 + 1.0;
    float _327 = -_307;
    float _329 = _327 + 1.0;
    float _331 = _307 * _325;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _335 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _333;
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _337;
    float _341 = _291 * _293;
    bool _343 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _345 = isnan(_225);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_319;
    float _357 = _355 + 1.0;
    float _359 = _319 * _329;
    float _361 = fma(_335, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _363 = fma(_339, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _365 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _367 = isnan(_225);
    bool _369 = _365 || _367;
    bool _371 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _373 = _369 || _371;
    float _375 = float(_373);
    float _377 = _353 * _357;
    float _379 = -_353;
    float _381 = _379 + 1.0;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _387 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _389 = isnan(_225);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _401 = _399 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _403 = _375 * _381;
    float _405 = -_375;
    float _407 = _405 + 1.0;
    float _409 = fma(_385, _283, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _411 = -_397;
    float _413 = _411 + 1.0;
    float _415 = fma(_401, _283, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _417 = _397 * _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _423;
    float _427 = _361 * _417;
    float _429 = _363 * _417;
    float _431 = fma(_421, _295, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _433 = fma(_425, _295, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _435 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].x, _427);
    float _437 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[143].y, _429);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _441 = _439 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _443 = fma(_415, _403, _435);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _449 = fma(_409, _403, _437);
    float _451 = fma(_441, _321, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _453;
    float _457 = fma(_431, _377, _443);
    float _459 = fma(_447, _321, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _461;
    float _465 = fma(_433, _377, _449);
    float _467 = fma(_455, _341, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _469 = fma(_451, _359, _457);
    float _471 = fma(_463, _341, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _473 = fma(_459, _359, _465);
    float _475 = fma(_467, _331, _469);
    float _477 = fma(_471, _331, _473);
    float _479 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[148].x, _475);
    float _481 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[148].y, _477);
    bool _483 = !_271;
    float _501;
    if (!_483)
    {
        float _485 = in.m_54.x;
        float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _489 = _485 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _491 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[11].y, _127);
        float _493 = _491 * _487;
        float _495 = floor(_493);
        float _497 = -_495;
        float _499 = _493 + _497;
        _501 = _499;
        _503 = true;
    }
    else
    {
        float _505 = float(_93);
        float _507 = 1.0 / _505;
        float _509 = _127 * _507;
        _501 = _509;
    }
    _503 = false;
    float _511 = _501;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _515 = _511 + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _529 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _531 = isnan(_511);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = 1.0 / _519;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _547 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _549 = isnan(_511);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    bool _559 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _561 = 1.0 / _527;
    float _563 = _523 * _541;
    bool _565 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _567 = isnan(_511);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = 1.0 / _545;
    float _579 = -_539;
    float _581 = _579 + 1.0;
    float _583 = fma(_563, _515, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _589 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _591 = isnan(_511);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = -_575;
    float _603 = _601 + 1.0;
    float _605 = _575 * _581;
    float _607 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _609 = _607 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _611 = 1.0 / _587;
    float _613 = -_599;
    float _615 = _613 + 1.0;
    float _617 = _557 * _603;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _619;
    float _623 = _609 * _561;
    float _625 = _539 * _615;
    float _627 = _583 * _617;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _631 = _511 + _629;
    float _633 = -_557;
    float _635 = _633 + 1.0;
    bool _637 = _511 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _639 = isnan(_511);
    bool _641 = _637 || _639;
    bool _643 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _645 = _641 || _643;
    float _647 = float(_645);
    float _649 = _621 * _577;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _657 = _511 + _655;
    float _659 = fma(_623, _631, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _661 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[115].x, _627);
    float _663 = -_647;
    float _665 = _663 + 1.0;
    float _667 = _653 * _611;
    float _669 = fma(_649, _657, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _673 = _511 + _671;
    float _675 = fma(_659, _605, _661);
    float _677 = _599 * _665;
    float _679 = fma(_667, _673, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _681 = fma(_669, _625, _675);
    float _683 = fma(_679, _677, _681);
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _689 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[119].x, _683);
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _693 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _695 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _697 = _689 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _699 = _691 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = in.m_56.x;
    float _703 = in.m_56.y;
    out.m_58.x = _693;
    out.m_58.y = _695;
    out.m_58.z = _699;
    out.m_58.w = _697;
    float _705 = _481 * _703;
    float _707 = _479 * _701;
    bool _709 = !_559;
    float _733;
    float _735;
    float _737;
    if (!_709)
    {
        float _711 = in.m_54.x;
        float _713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _715 = float(_93);
        float _717 = 1.0 / _715;
        float _719 = _711 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _721 = _127 * _717;
        float _723 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[11].z, _127);
        float _725 = _723 * _713;
        float _727 = floor(_725);
        float _729 = -_727;
        float _731 = _725 + _729;
        _733 = _731;
        _735 = _715;
        _737 = _721;
        _739 = true;
    }
    else
    {
        float _741 = float(_93);
        float _743 = 1.0 / _741;
        float _745 = _127 * _743;
        _733 = _745;
        _735 = _741;
        _737 = _745;
    }
    _739 = false;
    float _747 = _733;
    float _749 = _735;
    float _751 = _737;
    float _753 = in.m_54.x;
    float _755 = in.m_54.y;
    float _757 = in.m_54.z;
    float _759 = in.m_54.w;
    float _761 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _763 = log2(_761);
    float _765 = _705 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _769 = _767 != 0;
    float _771 = _707 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _773 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _779 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _781 = _757 * 2.0;
    float _783 = _753 * 2.0;
    float _785 = _755 * 2.0;
    bool _787 = _755 > 0.5;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _791 = floor(_783);
    bool _793 = _757 > 0.5;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _797 = -_175;
    int _799 = _787 ? as_type<int>(_797) : as_type<int>(_175);
    float _801 = _763 * _127;
    int _803 = int(_559);
    int _805 = _769 ? 2 : 0;
    int _807 = _803 | _805;
    int _809 = _793 ? 4 : 0;
    int _811 = _807 | _809;
    int _813 = _787 ? 8 : 0;
    int _815 = _811 | _813;
    int _817 = false ? 16 : 0;
    int _819 = _815 | _817;
    int _821 = false ? 32 : 0;
    int _823 = _819 | _821;
    int _825 = false ? 64 : 0;
    int _827 = _823 | _825;
    int _829 = _827 & 4;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _833 = -_185;
    int _835 = _793 ? as_type<int>(_833) : as_type<int>(_185);
    float _837 = floor(_781);
    float _839 = _753 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _841 = -_773;
    float _843 = fma(_839, 2.0, _841);
    float _845 = floor(_785);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _851 = -_127;
    float _853 = fma(_851, (*spvDescriptorSet0.vp_c9)._m0[76].x, _843);
    float _855 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[78].w, _847);
    float _857 = fma(_755, (*spvDescriptorSet0.vp_c9)._m0[88].w, _849);
    bool _859 = _837 > 0.0;
    float _861 = _755 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _863 = _837 >= 0.0;
    bool _865 = isnan(_837);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    float _873 = exp2(_801);
    float _875 = _755 + _753;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _883 = _881 != 0;
    float _885 = fma(_861, -2.0, _775);
    bool _887 = _791 >= 0.0;
    bool _889 = isnan(_791);
    bool _891 = _887 || _889;
    bool _893 = isnan(0.0);
    bool _895 = _891 || _893;
    float _897 = _875 + (-1.0);
    bool _899 = _845 >= 0.0;
    bool _901 = isnan(_845);
    bool _903 = _899 || _901;
    bool _905 = isnan(0.0);
    bool _907 = _903 || _905;
    float _909 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _911 = int(_909);
    bool _913 = !_879;
    float _915 = _913 ? _175 : as_type<float>(_799);
    float _917 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _919 = !_883;
    float _921 = _919 ? _185 : as_type<float>(_835);
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _925 = _923 != 0;
    int _927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _929 = _927 != 0;
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _933 = _931 != 0;
    int _935 = _871 ? 0 : 1;
    float _937 = -_873;
    float _939 = _937 + 1.0;
    bool _941 = _791 > 0.0;
    bool _943 = !_925;
    int _945 = _943 ? 0 : 1;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _949 = _947 != 0;
    int _951 = ~_935;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    int _957 = _955;
    float _959 = _897;
    float _961 = _839;
    float _963 = _791;
    if (!_859)
    {
        int _965 = ~_935;
        int _967 = _965 + 1;
        _957 = _967;
    }
    int _969 = _957;
    int _971 = abs(_945);
    bool _973 = _845 > 0.0;
    float _975 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _977 = float(_971);
    float _979 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _981 = int(_979);
    if (_949)
    {
        _959 = _753;
    }
    float _983 = _959;
    float _985 = _983;
    if (!_949)
    {
        _961 = _757;
    }
    float _987 = _961;
    float _989 = _987;
    if (!_949)
    {
        _985 = _757;
    }
    float _991 = _985;
    float _993 = _991;
    if (!_949)
    {
        _963 = _755;
    }
    float _995 = _963;
    float _997 = _995;
    if (_949)
    {
        _989 = _755;
    }
    float _999 = _989;
    float _1001 = _991 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1003 = _999;
    if (_949)
    {
        _997 = _753;
    }
    float _1005 = _997;
    if (_949)
    {
        _993 = _755;
    }
    float _1007 = _993;
    float _1009 = fma(_999, (*spvDescriptorSet0.vp_c9)._m0[83].w, _777);
    float _1011 = _1007;
    if (!_949)
    {
        _1003 = _757;
    }
    float _1013 = _1003;
    float _1015 = _1005 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1017 = _1013;
    if (!_949)
    {
        _1011 = _753;
    }
    float _1019 = _1011;
    float _1021 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[83].z, _975);
    if (_949)
    {
        _1017 = _755;
    }
    float _1023 = _1017;
    float _1025 = -_779;
    float _1027 = fma(_1015, 2.0, _1025);
    float _1029 = -_831;
    float _1031 = fma(_1001, 2.0, _1029);
    float _1033 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1035 = float(_969);
    float _1037 = _1023 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1039 = fma(_1033, -2.0, _795);
    float _1041 = float(_911);
    float _1043 = fma(_1037, -2.0, _789);
    float _1045 = _977 * _1035;
    float _1047 = in.m_60.x;
    float _1049 = in.m_60.y;
    float _1051 = in.m_60.z;
    int _1053 = _895 ? 0 : 1;
    float _1055 = 1.0 / _1041;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1059 = 1.0 + _1057;
    int _1061 = _907 ? 0 : 1;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1065 = ~_1053;
    int _1067 = _1065 + 1;
    int _1069 = _1067 + 1;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1073 = 1.0 / _1059;
    int _1075 = _1069;
    if (!_941)
    {
        int _1077 = ~_1053;
        int _1079 = _1077 + 1;
        _1075 = _1079;
    }
    int _1081 = _1075;
    float _1083 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1063);
    bool _1085 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1087 = isnan(1.0);
    bool _1089 = _1085 || _1087;
    bool _1091 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1093 = _1089 || _1091;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    int _1097 = ~_1061;
    int _1099 = _1097 + 1;
    int _1101 = _1099 + 1;
    float _1103 = fma(_753, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1071);
    int _1105 = _1101;
    if (!_973)
    {
        int _1107 = ~_1061;
        int _1109 = _1107 + 1;
        _1105 = _1109;
    }
    int _1111 = _1105;
    float _1113 = _1045 * (-2.0);
    bool _1115 = !_929;
    int _1117 = _1115 ? 0 : 1;
    float _1119 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1021);
    bool _1121 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1123 = isnan(0.0);
    bool _1125 = _1121 || _1123;
    bool _1127 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1129 = _1125 || _1127;
    float _1131 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1095);
    float _1133 = float(_981);
    float _1135 = _753 + (-0.5);
    int _1137 = abs(_1117);
    float _1139 = fma(_1113, _1047, _1047);
    float _1141 = _1129 ? _939 : 0.0;
    float _1143 = -_127;
    float _1145 = fma(_1143, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1031);
    bool _1147 = !_933;
    int _1149 = _1147 ? 0 : 1;
    float _1151 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1131);
    float _1153 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _885);
    float _1155 = _1133 * _127;
    float _1157 = float(_1081);
    float _1159 = _1055 * _127;
    float _1161 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1083);
    float _1163 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _855);
    float _1165 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1103);
    float _1167 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[87].w, _857);
    float _1169 = -_127;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1027);
    float _1173 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1009);
    float _1175 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1043);
    float _1177 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1039);
    if (_1093)
    {
        float _1179 = _1141 * _1073;
        _129 = _1179;
    }
    float _1181 = _129;
    float _1183 = fma(_917, _1113, _917);
    float _1185 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1139);
    int _1187 = abs(_1149);
    float _1189 = _755 + _757;
    float _1191 = float(_1137);
    float _1193 = fma(_1183, _1181, _1185);
    float _1195 = _1189 + (-1.0);
    float _1197 = _1191 * _1157;
    float _1199 = float(_1111);
    float _1201 = _1193 * 0.15915493667125701904296875;
    float _1203 = float(_1187);
    float _1205 = _1197 * (-2.0);
    float _1207 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1209 = _757 + _753;
    float _1211 = _757 + (-0.5);
    float _1213 = _1203 * _1199;
    float _1215 = fma(_1205, _1049, _1049);
    float _1217 = _1209 + (-1.0);
    float _1219 = _1213 * (-2.0);
    float _1221 = _755 + (-0.5);
    float _1223 = fma(_1207, _1205, _1207);
    float _1225 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1227 = fma(_1219, _1051, _1051);
    float _1229 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1215);
    float _1231 = _1201 * 6.283185482025146484375;
    float _1233 = sin(_1231);
    float _1235 = fma(_1225, _1219, _1225);
    float _1237 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1227);
    float _1239 = fma(_1223, _1181, _1229);
    float _1241 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1245 = fma(_1235, _1181, _1237);
    float _1247 = _1239 * 0.15915493667125701904296875;
    float _1249 = _1201 * 6.283185482025146484375;
    float _1251 = cos(_1249);
    float _1253 = _765 * _1241;
    float _1255 = _1245 * 0.15915493667125701904296875;
    float _1257 = _771 * _1243;
    float _1259 = in.m_42.x;
    float _1261 = in.m_42.y;
    float _1263 = in.m_42.z;
    int _1265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1267 = _1265 != 0;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1275 = _1273 != 0;
    int _1277 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1279 = _1277 != 0;
    float _1281 = _1247 * 6.283185482025146484375;
    float _1283 = sin(_1281);
    float _1285 = _1255 * 6.283185482025146484375;
    float _1287 = cos(_1285);
    float _1289 = _1247 * 6.283185482025146484375;
    float _1291 = cos(_1289);
    float _1293 = _1251 * _1283;
    float _1295 = _1233 * _1283;
    float _1297 = _1255 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    float _1301 = _1283 * _1287;
    float _1303 = _1287 * _1253;
    bool _1305 = !_1279;
    int _1307 = _1305 ? 0 : 1;
    float _1309 = _1251 * _1303;
    float _1311 = _1251 * _1291;
    float _1313 = _1233 * _1291;
    float _1315 = _1291 * _1287;
    bool _1317 = !_1267;
    int _1319 = _1317 ? 0 : 1;
    float _1321 = fma(_1299, _1311, _1295);
    float _1323 = -_1293;
    float _1325 = fma(_1299, _1313, _1323);
    float _1327 = -_1253;
    float _1329 = _1299 * _1327;
    float _1331 = -_1313;
    float _1333 = fma(_1299, _1293, _1331);
    float _1335 = _1233 * _1303;
    float _1337 = fma(_1321, _1257, _1309);
    float _1339 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1341 = fma(_1299, _1295, _1311);
    float _1343 = fma(_1325, _1257, _1335);
    float _1345 = fma(_1315, _1257, _1329);
    float _1347 = fma(_1333, _1339, _1337);
    float _1349 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1351 = fma(_1341, _1339, _1343);
    float _1353 = fma(_1301, _1339, _1345);
    float _1355 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1357 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1359 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1349);
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1363 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1355);
    float _1365 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1357);
    float _1367 = fma(_1263, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1359);
    float _1369 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1361);
    float _1371 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1363);
    float _1373 = fma(_1263, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1365);
    float _1375 = _1367 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1377 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1369);
    float _1379 = _1371 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1381 = _1373 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1383 = _1261 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1385 = _1377 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1387 = _1375 + _1379;
    float _1389 = _1347 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1391 = fma(_1259, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1383);
    float _1393 = _1381 + _1385;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1397 = _1387 + _1395;
    float _1399 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1389);
    float _1401 = fma(_1263, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1391);
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1405 = _1393 + _1403;
    float _1407 = _1397 * _1397;
    bool _1409 = !_1271;
    int _1411 = _1409 ? 0 : 1;
    float _1413 = fma(_1351, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1399);
    float _1415 = _1401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1417 = fma(_1405, _1405, _1407);
    bool _1419 = !_1275;
    int _1421 = _1419 ? 0 : 1;
    float _1423 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1425 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1427 = sqrt(_1417);
    float _1429 = _1415 + _1423;
    float _1431 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1425);
    float _1433 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1431);
    bool _1435 = _1427 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1437 = _1413;
    float _1439 = _1393;
    float _1441 = _1423;
    float _1443 = _1427;
    if (!_1435)
    {
        _1437 = _1393;
    }
    float _1445 = _1437;
    float _1447 = _1445;
    if (!_1435)
    {
        _1439 = _1387;
    }
    float _1449 = _1439;
    float _1451 = _1449;
    if (!_1435)
    {
        _1441 = _1429;
    }
    float _1453 = _1441;
    bool _1455 = !_1435;
    float _1457 = _1453;
    if (!_1455)
    {
        float _1459 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1463 = _1427 + _1461;
        float _1465 = _1429 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1467 = rsqrt(_1417);
        float _1469 = _1463 * _1459;
        float _1471 = _1469 * 0.15915493667125701904296875;
        float _1473 = _1471 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = _1471 * 6.283185482025146484375;
        float _1479 = sin(_1477);
        float _1481 = _1475 + (-1.0);
        float _1483 = _1481 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1485 = fma(_1479, _1465, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1487 = fma(_1429, _1475, _1483);
        float _1489 = _1467 * _1485;
        float _1491 = fma(_1405, _1489, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1493 = fma(_1397, _1489, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1457 = _1487;
        _1447 = _1491;
        _1451 = _1493;
        _1443 = _1485;
    }
    float _1495 = _1457;
    float _1497 = _1447;
    float _1499 = _1451;
    float _1501 = _1443;
    float _1503 = -_1415;
    float _1505 = _1503 + _1495;
    float _1507 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1509 = -_1381;
    float _1511 = _1509 + _1497;
    float _1513 = -_1375;
    float _1515 = _1513 + _1499;
    float _1517 = _1505 * _1505;
    float _1519 = _1415 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1521 = 1.0 / _1507;
    float _1523 = fma(_1511, _1511, _1517);
    float _1525 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1519);
    float _1527 = fma(_1515, _1515, _1523);
    float _1529 = fma(_1375, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1525);
    bool _1531 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1533 = isnan(0.5);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1539 = _1535 || _1537;
    float _1541 = sqrt(_1527);
    float _1543 = _1529 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1545 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1547 = isnan(0.5);
    bool _1549 = _1545 || _1547;
    bool _1551 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1553 = _1549 || _1551;
    float _1555 = _1543 + _1507;
    float _1557 = _1555 * _1521;
    float _1559 = _1557 * 0.5;
    bool _1561 = _1541 > 0.0;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1565 = fma(_1559, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1563);
    float _1567 = 1.0 / _1565;
    float _1569 = _1559;
    float _1571 = _1497;
    float _1573 = _1499;
    float _1575 = _1501;
    float _1577 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1579 = _1495;
    float _1581 = _1527;
    if (!_1561)
    {
        _1569 = _1495;
    }
    float _1583 = _1569;
    bool _1585 = !_1561;
    float _1587 = _1583;
    if (!_1585)
    {
        float _1589 = _189 * _189;
        float _1591 = fma(_187, _187, _1589);
        float _1593 = fma(_191, _191, _1591);
        float _1595 = rsqrt(_1527);
        float _1597 = sqrt(_1593);
        float _1599 = _1511 * _1595;
        float _1601 = _1505 * _1595;
        float _1603 = _1515 * _1595;
        bool _1605 = _1597 > 0.0;
        float _1607 = _1597;
        _1575 = _1593;
        _1577 = _1595;
        if (!_1605)
        {
            _1607 = _1495;
        }
        float _1609 = _1607;
        bool _1611 = !_1605;
        _1587 = _1609;
        if (!_1611)
        {
            float _1613 = rsqrt(_1593);
            float _1615 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1617 = _189 * _1613;
            float _1619 = _187 * _1613;
            float _1621 = _191 * _1613;
            float _1623 = _1601 * _1617;
            float _1625 = fma(_1599, _1619, _1623);
            float _1627 = _1615 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1629 = fma(_1603, _1621, _1625);
            float _1631 = _1629 * _1627;
            float _1633 = fma(_187, _1631, _1497);
            float _1635 = fma(_189, _1631, _1495);
            float _1637 = fma(_191, _1631, _1499);
            _1571 = _1633;
            _1587 = _1635;
            _1573 = _1637;
            _1577 = _1631;
        }
    }
    float _1639 = _1571;
    float _1641 = _1587;
    float _1643 = _1573;
    float _1645 = _1575;
    float _1647 = _1577;
    float _1649 = _1647;
    float _1651 = _1639;
    float _1653 = _1641;
    float _1655 = _1645;
    if (_1553)
    {
        _1649 = 1.0;
    }
    float _1657 = _1649;
    float _1659 = _1657;
    if (_1539)
    {
        _195 = _1639;
    }
    float _1661 = _195;
    float _1663 = _1661;
    if (_1539)
    {
        _197 = _1641;
    }
    float _1665 = _197;
    float _1667 = _1665;
    if (_1539)
    {
        _1579 = _1643;
    }
    float _1669 = _1579;
    float _1671 = _1669;
    if (!_1539)
    {
        float _1673 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1675 = _1415 + _1673;
        float _1677 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1679 = _1381 + _1677;
        float _1681 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1683 = -_1381;
        float _1685 = _1683 + _1639;
        float _1687 = _1675 * _1675;
        float _1689 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1691 = _1375 + _1689;
        float _1693 = -_1415;
        float _1695 = _1693 + _1641;
        float _1697 = fma(_1679, _1679, _1687);
        float _1699 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1701 = fma(_1691, _1691, _1697);
        float _1703 = sqrt(_1701);
        float _1705 = _1681 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1707 = -_1375;
        float _1709 = _1707 + _1643;
        float _1711 = precise::min(_1703, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1713 = _1711 * _1699;
        float _1715 = _1705 * _1713;
        float _1717 = fma(_1685, _1715, _1381);
        float _1719 = fma(_1695, _1715, _1415);
        float _1721 = fma(_1709, _1715, _1375);
        _1651 = _1685;
        _1653 = _1695;
        _1667 = _1719;
        _1663 = _1717;
        _1671 = _1721;
        _1655 = _1715;
    }
    float _1723 = _1651;
    float _1725 = _1653;
    float _1727 = _1667;
    float _1729 = _1663;
    float _1731 = _1671;
    float _1733 = _1655;
    float _1735 = _1725;
    float _1737 = _1723;
    float _1739 = _1733;
    if (_1553)
    {
        _1735 = 1.0;
    }
    float _1741 = _1735;
    float _1743 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1745 = _1567 * _1743;
    float _1747 = _1741;
    if (!_1553)
    {
        float _1749 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1751 = _1749 * 0.15915493667125701904296875;
        float _1753 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1757 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1755;
        float _1759 = _1751 * 6.283185482025146484375;
        float _1761 = cos(_1759);
        float _1763 = _1753 * 0.15915493667125701904296875;
        float _1765 = _1751 * 6.283185482025146484375;
        float _1767 = sin(_1765);
        float _1769 = 1.0 / _1761;
        float _1771 = _1763 * 6.283185482025146484375;
        float _1773 = cos(_1771);
        float _1775 = _1767 * _1769;
        float _1777 = _1763 * 6.283185482025146484375;
        float _1779 = sin(_1777);
        float _1781 = _1773 * _1775;
        float _1783 = 1.0 / _1757;
        float _1785 = 1.0 / _1781;
        float _1787 = _1779 * _1785;
        float _1789 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1791 = fma(_1745, _1787, _1789);
        float _1793 = _1791 * _1783;
        float _1795 = precise::clamp(_1793, 0.0, 1.0);
        _1737 = _1769;
        _1659 = _1795;
    }
    float _1797 = _1737;
    float _1799 = _1659;
    float _1801 = _1797;
    if (!_1553)
    {
        float _1803 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1805 = _1803 * 0.15915493667125701904296875;
        float _1807 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1809 = _1805 * 6.283185482025146484375;
        float _1811 = cos(_1809);
        float _1813 = _1807 * 0.15915493667125701904296875;
        float _1815 = _1805 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        float _1819 = 1.0 / _1811;
        float _1821 = _1813 * 6.283185482025146484375;
        float _1823 = cos(_1821);
        float _1825 = _1817 * _1819;
        float _1827 = _1813 * 6.283185482025146484375;
        float _1829 = sin(_1827);
        float _1831 = _1823 * _1825;
        float _1833 = 1.0 / _1831;
        float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1837 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1835;
        float _1839 = 1.0 / _1837;
        float _1841 = _1829 * _1833;
        float _1843 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1845 = fma(_1745, _1841, _1843);
        float _1847 = _1845 * _1839;
        float _1849 = precise::clamp(_1847, 0.0, 1.0);
        float _1851 = -_1849;
        float _1853 = _1851 + 1.0;
        _1739 = _1841;
        _1801 = _1829;
        _1747 = _1853;
    }
    float _1855 = _1739;
    float _1857 = _1801;
    float _1859 = _1747;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1863 = _1727 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1867 = _1729 + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1871 = _1731 + _1869;
    float _1873 = _1863 * _1863;
    float _1875 = fma(_1867, _1867, _1873);
    float _1877 = fma(_1871, _1871, _1875);
    float _1879 = rsqrt(_1877);
    float _1881 = sqrt(_1877);
    float _1883 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1885 = _1867 * _1883;
    float _1887 = _1871 * _1883;
    float _1889 = _1885 * _1885;
    float _1891 = _1887 * _1887;
    float _1893 = _1889 + _1891;
    float _1895 = sqrt(_1893);
    bool _1897 = _1895 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1899 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1901 = _1895 + _1899;
    float _1903 = _1879;
    float _1905 = _1893;
    float _1907 = _1901;
    float _1909 = _1855;
    if (_1897)
    {
        float _1911 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1903 = _1911;
    }
    float _1913 = _1903;
    if (_1897)
    {
        float _1915 = rsqrt(_1893);
        _1905 = _1915;
    }
    float _1917 = _1905;
    float _1919 = _1917;
    if (_1897)
    {
        float _1921 = _1901 * _1913;
        _1907 = _1921;
    }
    float _1923 = _1907;
    if (_1897)
    {
        float _1925 = _1923 * 0.15915493667125701904296875;
        _1909 = _1925;
    }
    float _1927 = _1909;
    float _1929 = _1871;
    float _1931 = _1927;
    if (_1897)
    {
        float _1933 = _1927 * 6.283185482025146484375;
        float _1935 = sin(_1933);
        _1929 = _1935;
    }
    float _1937 = _1929;
    float _1939 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1941 = precise::max(0.0, _1939);
    float _1943 = _1857;
    float _1945 = _1941;
    float _1947 = _1939;
    if (_1897)
    {
        float _1949 = _1927 * 6.283185482025146484375;
        float _1951 = cos(_1949);
        _1943 = _1951;
    }
    float _1953 = _1943;
    float _1955 = -_1883;
    float _1957 = -_1941;
    float _1959 = fma(_1863, _1955, _1957);
    float _1961 = _1959;
    if (_1897)
    {
        float _1963 = _1959 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1945 = _1963;
    }
    float _1965 = _1945;
    float _1967 = _1937;
    float _1969 = _1965;
    if (_1897)
    {
        float _1971 = fma(_1937, _1965, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1967 = _1971;
    }
    float _1973 = _1967;
    float _1975 = _1973;
    if (!_1897)
    {
        _1969 = _1885;
    }
    float _1977 = _1969;
    float _1979 = _1977;
    if (_1897)
    {
        float _1981 = _1953 + (-1.0);
        _1947 = _1981;
    }
    float _1983 = _1947;
    float _1985 = _1983;
    if (_1897)
    {
        float _1987 = _1917 * _1973;
        _1581 = _1987;
    }
    float _1989 = _1581;
    if (!_1897)
    {
        _1975 = _1959;
    }
    float _1991 = _1975;
    float _1993 = _1991;
    if (_1897)
    {
        float _1995 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1931 = _1995;
    }
    float _1997 = _1931;
    if (_1897)
    {
        float _1999 = _1885 * _1989;
        _1979 = _1999;
    }
    float _2001 = _1979;
    if (!_1897)
    {
        _1985 = _1887;
    }
    float _2003 = _1985;
    float _2005 = _2003;
    if (_1897)
    {
        float _2007 = _1887 * _1989;
        _2005 = _2007;
    }
    float _2009 = _2005;
    if (!_1897)
    {
        _1919 = _1889;
    }
    float _2011 = _1919;
    float _2013 = _2011;
    if (_1897)
    {
        float _2015 = fma(_1959, _1953, _1997);
        _1993 = _2015;
    }
    float _2017 = _1993;
    if (_1897)
    {
        float _2019 = _2001 * _2001;
        _2013 = _2019;
    }
    float _2021 = _2013;
    if (!_1897)
    {
        _1961 = _1891;
    }
    float _2023 = _1961;
    float _2025 = _2023;
    if (_1897)
    {
        float _2027 = _2009 * _2009;
        _2025 = _2027;
    }
    float _2029 = _2025;
    float _2031 = fma(_2017, _2017, _2021);
    float _2033 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2035 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2037 = _2031 + _2029;
    float _2039 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2033);
    float _2041 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2043 = fma(_1881, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2041);
    float _2045 = precise::clamp(_2043, 0.0, 1.0);
    float _2047 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2049 = rsqrt(_2037);
    float _2051 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2039);
    float _2053 = -_2045;
    float _2055 = _2053 + 1.0;
    float _2057 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2059 = _1727 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2061 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2047);
    float _2063 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2065 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2057);
    float _2067 = fma(_1729, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2059);
    float _2069 = abs(_2055);
    float _2071 = log2(_2069);
    float _2073 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2061);
    float _2075 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2077 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    float _2079 = fma(_1731, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2065);
    float _2081 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2083 = -_2075;
    float _2085 = fma(_2083, _2035, 1.0);
    float _2087 = _2049 * _2001;
    float _2089 = _2077 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2091 = _2049 * _2017;
    float _2093 = _2079 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2095 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2097 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2099 = _2049 * _2009;
    float _2101 = log2(_2085);
    float _2103 = -_2095;
    float _2105 = fma(_2091, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2103);
    float _2107 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2097);
    float _2109 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2111 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2113 = -_2099;
    float _2115 = fma(_2113, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2105);
    float _2117 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2107);
    float _2119 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2121 = exp2(_2109);
    float _2123 = fma(_2115, -0.5, 0.5);
    float _2125 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2117);
    float _2127 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2119);
    float _2129 = fma(_2115, 0.5, 0.5);
    float _2131 = _2091 + 1.0;
    float _2133 = 1.0 / _2125;
    float _2135 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2111);
    float _2137 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2127);
    float _2139 = fma(_2129, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2141 = _2101 * 0.693147182464599609375;
    float _2143 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2135);
    float _2145 = fma(_2129, _2139, -0.212114393711090087890625);
    float _2147 = sqrt(_2123);
    float _2149 = -_2091;
    float _2151 = fma(_2121, _2131, _2149);
    float _2153 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2137);
    float _2155 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2143);
    float _2157 = fma(_2129, _2145, 1.570728778839111328125);
    float _2159 = _2141 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2161 = fma(_2151, 0.5, 0.5);
    float _2163 = _2153 * _2133;
    float _2165 = _2155 * _2133;
    float _2167 = fma(_2163, 0.5, 0.5);
    float _2169 = fma(_2165, -0.5, 0.5);
    float _2171 = _2147 * 0.636619746685028076171875;
    float _2173 = -_2157;
    float _2175 = fma(_2171, _2173, 1.0);
    float3 _6638 = float3(_2167, _2169, _2159);
    float _2177 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6638, float3(0.0), isnan(_6638)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6638, float3(0.0), isnan(_6638)), level(0.0)).x;
    float3 _6649 = float3(_2167, _2169, _2159);
    float4 _2180 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6649, float3(0.0), isnan(_6649)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6649, float3(0.0), isnan(_6649)), level(0.0)).xyzw;
    float _2182 = _2180.x;
    float _2184 = _2180.y;
    float _2186 = _2180.z;
    float _2188 = _2180.w;
    float2 _6666 = float2(_2175, _2161);
    float3 _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6666, float2(0.0), isnan(_6666)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6666, float2(0.0), isnan(_6666)), level(0.0)).xyz;
    float _2194 = _2192.x;
    float _2196 = _2192.y;
    float _2198 = _2192.z;
    float _2200 = float(uint(_981));
    float _2202 = trunc(_1159);
    int _2204 = int(_2202);
    int _2206 = ~_981;
    int _2208 = _2206 + 1;
    float _2210 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2212 = _747 + _2210;
    bool _2214 = _755 > 0.5;
    float _2216 = _1151 * (-0.15915493667125701904296875);
    float _2218 = _2071 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2220 = !_949;
    float _2222 = _2220 ? _755 : _753;
    float _2224 = 1.0 / _2200;
    float _2226 = -_1173;
    float _2228 = _2226 + 1.0;
    bool _2230 = _759 > 0.5;
    float _2232 = -_1161;
    float _2234 = _2232 + 1.0;
    int _2236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2238 = _2236 != 0;
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2242 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2240;
    float _2244 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2246 = _2244 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2248 = float(uint(_2204));
    float _2250 = 1.0 / _749;
    float _2252 = _2081 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2254 = -_185;
    int _2256 = _2214 ? as_type<int>(_2254) : as_type<int>(_185);
    float _2258 = -_1165;
    float _2260 = _2258 + 1.0;
    bool _2262 = !_949;
    float _2264 = _2262 ? 1.2345600128173828125 : 1.0;
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2268 = _2266 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _2270 = as_type<int>(_2224) + (-2);
    float _2272 = 1.0 / _2242;
    int _2274 = ~_981;
    int _2276 = _2274 + 1;
    float _2278 = fma(_2093, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2252);
    float _2280 = float(_2204);
    float _2282 = as_type<float>(_2270) * _2248;
    float _2284 = -_185;
    int _2286 = _2230 ? as_type<int>(_2284) : as_type<int>(_185);
    float _2288 = fma(_2063, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2278);
    bool _2290 = !_2238;
    float _2292 = _2290 ? _185 : as_type<float>(_2256);
    float _2294 = trunc(_2282);
    float _2296 = precise::max(_2294, 0.0);
    uint _2299 = uint(_2296);
    int _2301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2303 = _2301 != 0;
    float _2305 = -_1167;
    float _2307 = _2305 + 1.0;
    int _2309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2311 = _2309 != 0;
    float _2313 = fma(_2089, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2288);
    int _2315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2317 = _2315 != 0;
    int _2319 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2321 = _2319 != 0;
    float _2323 = 1.0 / _2246;
    out.gl_Position.x = _2153;
    out.gl_Position.y = _2155;
    out.gl_Position.z = _2313;
    out.gl_Position.w = _2125;
    bool _2325 = _753 > 0.5;
    bool _2327 = _829 != 0;
    float _2329 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2331 = _2329 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2333 = _2280 >= _1133;
    bool _2335 = isnan(_2280);
    bool _2337 = _2333 || _2335;
    bool _2339 = isnan(_1133);
    bool _2341 = _2337 || _2339;
    float _2343 = float(_2341);
    int _2345 = _2208 * int(_2299);
    int _2347 = _2345 + _2204;
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2351 = _747 + _2349;
    float _2353 = 1.0 / _2268;
    int _2355 = abs(_1319);
    float _2357 = _2351 * _2272;
    float _2359 = float(uint(_2347));
    float _2361 = _2212 * _2323;
    float _2363 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _2365 = _2363 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    int _2367 = abs(_1421);
    float _2369 = as_type<float>(_2270) * _2359;
    float _2371 = 1.0 / _2331;
    float _2373 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2375 = _2373 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2377 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _2379 = isnan(_751);
    bool _2381 = _2377 || _2379;
    bool _2383 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _2385 = _2381 || _2383;
    float _2387 = float(_2385);
    float _2389 = trunc(_2369);
    float _2391 = precise::max(_2389, 0.0);
    uint _2393 = uint(_2391);
    float _2395 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2397 = _2395 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _2399 = ~_981;
    int _2401 = _2399 + 1;
    float _2403 = trunc(_2343);
    int _2405 = int(_2403);
    int _2407 = int(_2299) + int(_2393);
    float _2409 = 1.0 / _2375;
    int _2411 = _2276 * _2407;
    int _2413 = _2411 + _2204;
    float _2415 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2417 = _2415 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2419 = 1.0 / _2397;
    bool _2421 = uint(_2413) >= uint(_981);
    bool _2423 = !_2421;
    int _2425 = _2423 ? 0 : (-1);
    float _2427 = 1.0 / _2417;
    int _2429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2431 = _2429 != 0;
    float _2433 = _2264 * _2222;
    float _2435 = floor(_2433);
    float _2437 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _2439 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _2437;
    float _2441 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _2443 = _2441 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2445 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _2447 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _2445;
    float _2449 = _2439 * _2409;
    float _2451 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2453 = _2451 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2455 = _2447 * _2371;
    int _2457 = ~_2407;
    int _2459 = _2457 + _2425;
    int _2461 = _2459 + 1;
    float _2463 = _2365 * _2427;
    float _2465 = _1155 * _2250;
    float _2467 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2469 = _2467 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2471 = !_2431;
    float _2473 = _2471 ? _185 : as_type<float>(_2286);
    int _2475 = _981 * _2461;
    int _2477 = _2475 + _2204;
    bool _2479 = _981 == 0;
    float _2481 = -_2435;
    float _2483 = _2433 + _2481;
    float _2485 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _2487 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _2485;
    int _2489 = ~_2405;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    float _2495 = 1.0 / _2469;
    bool _2497 = !_2479;
    int _2499 = _2497 ? _2477 : (-1);
    float _2501 = _2483 * _1133;
    float _2503 = _2487 * _2353;
    int _2505 = abs(_1411);
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _2509 = _2507 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    int _2511 = _2499 * _2493;
    float _2513 = trunc(_2465);
    int _2515 = int(_2513);
    int _2517 = _981 + (-1);
    float _2519 = _2443 * _2419;
    int _2521 = ~_981;
    int _2523 = _2521 + 1;
    float _2525 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _2527 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _2525;
    bool _2529 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2531 = isnan(_747);
    bool _2533 = _2529 || _2531;
    bool _2535 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2537 = _2533 || _2535;
    float _2539 = float(_2537);
    int _2541 = _2405 * _2517;
    int _2543 = _2541 + _2511;
    bool _2545 = !_2321;
    int _2547 = _2545 ? 0 : 1;
    float _2549 = trunc(_2501);
    int _2551 = int(_2549);
    int _2553 = abs(_1307);
    int _2555 = _2543 * _2505;
    int _2557 = abs(_2547);
    float _2559 = _2527 * _2495;
    float _2561 = -_175;
    int _2563 = _2327 ? as_type<int>(_2561) : as_type<int>(_175);
    float _2565 = -_175;
    int _2567 = _2325 ? as_type<int>(_2565) : as_type<int>(_175);
    int _2569 = _2515 * _2355;
    int _2571 = _2569 + _2555;
    float _2573 = 1.0 / _2453;
    bool _2575 = !_2303;
    float _2577 = _2575 ? _175 : as_type<float>(_2563);
    bool _2579 = !_2317;
    float _2581 = _2579 ? _175 : as_type<float>(_2567);
    int _2583 = _2551 * _2557;
    int _2585 = _2583 + _2204;
    float _2587 = _2216 * 6.283185482025146484375;
    float _2589 = sin(_2587);
    int _2591 = _2585 * _2367;
    int _2593 = _2591 + _2571;
    float _2595 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2597 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2595;
    float _2599 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2601 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2599;
    float _2603 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2605 = _2603 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    int _2607 = _2551 * _2553;
    int _2609 = _2607 + _2593;
    float _2611 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2611;
    float _2615 = fma(_2601, _2357, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2617 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _2619 = _751 + _2617;
    float _2621 = fma(_2605, _2361, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2623 = float(uint(_2609));
    float _2625 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _2627 = _751 + _2625;
    float _2629 = fma(_2449, _2619, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _2631 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2633 = _2631 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2635 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _2637 = _751 + _2635;
    float _2639 = as_type<float>(_2270) * _2623;
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2643 = _2641 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2645 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _2647 = _751 + _2645;
    float _2649 = fma(_2519, _2627, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _2651 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _2653 = isnan(_751);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _2659 = _2655 || _2657;
    float _2661 = float(_2659);
    float _2663 = fma(_2633, _2361, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2665 = trunc(_2639);
    float _2667 = precise::max(_2665, 0.0);
    uint _2669 = uint(_2667);
    float _2671 = fma(_2455, _2637, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _2673 = fma(_2597, _2357, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2675 = fma(_2643, _2361, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2677 = fma(_2503, _2647, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _2679 = _2509 * _2573;
    float _2681 = fma(_2613, _2357, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _2685 = _751 + _2683;
    float _2687 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _2689 = _751 + _2687;
    float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _2693 = _751 + _2691;
    bool _2695 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _2697 = isnan(_751);
    bool _2699 = _2695 || _2697;
    bool _2701 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _2703 = _2699 || _2701;
    float _2705 = float(_2703);
    float _2707 = -_2661;
    float _2709 = _2707 + 1.0;
    float _2711 = fma(_2463, _2685, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _2713 = fma(_2679, _2689, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _2715 = fma(_2559, _2693, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _2717 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _2719 = isnan(_751);
    bool _2721 = _2717 || _2719;
    bool _2723 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _2725 = _2721 || _2723;
    float _2727 = float(_2725);
    int _2729 = _2523 * int(_2669);
    int _2731 = _2729 + _2609;
    float _2733 = _2705 * _2709;
    float _2735 = -_2705;
    float _2737 = _2735 + 1.0;
    bool _2739 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2741 = isnan(_747);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2747 = _2743 || _2745;
    float _2749 = float(_2747);
    float _2751 = -_2727;
    float _2753 = _2751 + 1.0;
    float _2755 = float(uint(_2731));
    float _2757 = _2727 * _2737;
    bool _2759 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _2761 = isnan(_751);
    bool _2763 = _2759 || _2761;
    bool _2765 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _2767 = _2763 || _2765;
    float _2769 = float(_2767);
    float _2771 = -_2749;
    float _2773 = _2771 + 1.0;
    bool _2775 = _747 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2777 = isnan(_747);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2783 = _2779 || _2781;
    float _2785 = float(_2783);
    float _2787 = as_type<float>(_2270) * _2755;
    bool _2789 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _2791 = isnan(_751);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _2797 = _2793 || _2795;
    float _2799 = float(_2797);
    float _2801 = -_2769;
    float _2803 = _2801 + 1.0;
    bool _2805 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _2807 = isnan(_751);
    bool _2809 = _2805 || _2807;
    bool _2811 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _2813 = _2809 || _2811;
    float _2815 = float(_2813);
    float _2817 = -_2785;
    float _2819 = _2817 + 1.0;
    float _2821 = exp2(_2218);
    float _2823 = _2799 * _2753;
    bool _2825 = _751 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _2827 = isnan(_751);
    bool _2829 = _2825 || _2827;
    bool _2831 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _2833 = _2829 || _2831;
    float _2835 = float(_2833);
    float _2837 = -_2815;
    float _2839 = _2837 + 1.0;
    float _2841 = _2815 * _2803;
    float _2843 = _2749 * _2819;
    float _2845 = -_2799;
    float _2847 = _2845 + 1.0;
    float _2849 = _2387 * _2839;
    float _2851 = trunc(_2787);
    float _2853 = precise::max(_2851, 0.0);
    uint _2855 = uint(_2853);
    float _2857 = -_2387;
    float _2859 = _2857 + 1.0;
    float _2861 = _2539 * _2773;
    float _2863 = -_2539;
    float _2865 = _2863 + 1.0;
    float _2867 = _2835 * _2859;
    float _2869 = float(uint(_2585));
    float _2871 = _2615 * _2861;
    float _2873 = _2681 * _2861;
    float _2875 = _2629 * _2867;
    float _2877 = -_2835;
    float _2879 = _2877 + 1.0;
    float _2881 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2871);
    float _2883 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2873);
    float _2885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2887 = fma(_2879, (*spvDescriptorSet0.vp_c9)._m0[151].x, _2875);
    float _2889 = fma(_2663, _2843, _2881);
    int _2891 = int(_2669) + int(_2855);
    float _2893 = _2673 * _2861;
    float _2895 = as_type<float>(_2270) * _2869;
    float _2897 = _2292 * _2589;
    float _2899 = fma(_2649, _2849, _2887);
    int _2901 = _2401 * _2891;
    int _2903 = _2901 + _2609;
    float _2905 = _2216 * 6.283185482025146484375;
    float _2907 = cos(_2905);
    float _2909 = fma(_2865, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2893);
    float _2911 = fma(_2671, _2841, _2899);
    float _2913 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2889);
    bool _2915 = uint(_2903) >= uint(_981);
    float _2917 = fma(_2621, _2843, _2909);
    int _2919 = ~_981;
    int _2921 = _2919 + 1;
    float _2923 = _2769 * _2847;
    float _2925 = trunc(_2895);
    float _2927 = precise::max(_2925, 0.0);
    uint _2929 = uint(_2927);
    bool _2931 = !_2915;
    int _2933 = _2931 ? 0 : (-1);
    float _2935 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2917);
    float _2937 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2939 = ~_2891;
    int _2941 = _2939 + _2933;
    int _2943 = _2941 + 1;
    float _2945 = fma(_2675, _2843, _2883);
    float _2947 = fma(_2711, _2923, _2911);
    float _2949 = _2292 * _2907;
    float _2951 = -_2897;
    float _2953 = fma(_2581, _2907, _2951);
    int _2955 = _981 * _2943;
    int _2957 = _2955 + _2609;
    float _2959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2961 = fma(_2581, _2589, _2949);
    float _2963 = fma(_2785, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2945);
    float _2965 = _2953 + 0.5;
    bool _2967 = !_2479;
    int _2969 = _2967 ? _2957 : (-1);
    int _2971 = _2921 * int(_2929);
    int _2973 = _2971 + _2585;
    float _2975 = _915 + 0.5;
    float _2977 = fma(_2937, _2965, _853);
    int _2979 = _2969 >> 31;
    float _2981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2983 = float(uint(_2973));
    float _2985 = fma(_2677, _2823, _2947);
    int _2987 = _2979 & 3;
    float _2989 = -_2821;
    float _2991 = _2989 + 1.0;
    int _2993 = _2969 & 3;
    bool _2995 = _2993 != 0;
    float _2997 = as_type<float>(_2270) * _2983;
    int _2999 = _2969 + _2987;
    float _3001 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3003 = _2961 + (-0.5);
    float _3005 = trunc(_2997);
    float _3007 = precise::max(_3005, 0.0);
    uint _3009 = uint(_3007);
    int _3011 = _2999 >> 2;
    float _3013 = fma(_2713, _2757, _2985);
    float _3015 = -_3001;
    float _3017 = -_1153;
    float _3019 = fma(_3015, _3003, _3017);
    bool _3021 = uint(_2993) > 1u;
    float _3023 = _2963 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _3025 = _3011 << 4;
    int _3027 = _3025 + 512;
    float _3029 = _2981 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3031 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3033 = _2473 + (-0.5);
    uint _3035 = uint(int(uint(_3027) >> uint(2)));
    uint _3037 = uint(int(uint(int(_3035)) >> uint(2)));
    int _3039 = int(_3035) & 3;
    float _3041 = (*spvDescriptorSet0.vp_c9)._m0[int(_3037)][_3039];
    int _3043 = int(_3035) + 1;
    uint _3045 = uint(int(uint(_3043) >> uint(2)));
    int _3047 = _3043 & 3;
    float _3049 = (*spvDescriptorSet0.vp_c9)._m0[int(_3045)][_3047];
    int _3051 = _2969 & 3;
    bool _3053 = _3051 != 0;
    float _3055 = fma(_3029, _2975, _1145);
    float _3057 = -_3033;
    float _3059 = -_1175;
    float _3061 = fma(_3057, (*spvDescriptorSet0.vp_c9)._m0[85].y, _3059);
    float _3063 = _2577 + 0.5;
    float _3065 = _921 + (-0.5);
    int _3067 = _3053 ? 0 : 1;
    int _3069 = _3027 + 8;
    uint _3071 = uint(int(uint(_3069) >> uint(2)));
    uint _3073 = uint(int(uint(int(_3071)) >> uint(2)));
    int _3075 = int(_3071) & 3;
    float _3077 = (*spvDescriptorSet0.vp_c9)._m0[int(_3073)][_3075];
    int _3079 = int(_3071) + 1;
    uint _3081 = uint(int(uint(_3079) >> uint(2)));
    int _3083 = _3079 & 3;
    float _3085 = (*spvDescriptorSet0.vp_c9)._m0[int(_3081)][_3083];
    float _3087 = fma(_3063, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1171);
    float _3089 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _3091 = ~_3067;
    int _3093 = _3091 + 1;
    int _3095 = _3093 + 1;
    float _3097 = _2935 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _3099 = _3095;
    if (!_3021)
    {
        int _3101 = ~_3067;
        int _3103 = _3101 + 1;
        _3099 = _3103;
    }
    int _3105 = _3099;
    float _3107 = _3031 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3109 = _2913 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _3111 = _2993 != 3;
    float _3113 = _3097 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3115 = -_3107;
    float _3117 = -_1177;
    float _3119 = fma(_3115, _3065, _3117);
    bool _3121 = !_2995;
    int _3123 = _3121 ? 0 : 1;
    float _3125 = _3109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3127 = _3023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _3129 = uint(_2993) >= 2u;
    float _3131 = _2991 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3133 = abs(_3105);
    float _3135 = -_2260;
    float _3137 = fma(_915, _3135, _3055);
    int _3139 = abs(_3123);
    out.m_62.x = _3113;
    out.m_62.y = _3125;
    out.m_62.z = _3127;
    out.m_62.w = _3089;
    int _3141 = _3129 ? 0 : 1;
    float _3143 = _3131 * _2177;
    int _3145 = int(_2929) + int(_3009);
    float _3147 = fma(_921, _2307, _3119);
    int _3149 = ~_981;
    int _3151 = _3149 + 1;
    float _3153 = fma(_2715, _2733, _3013);
    bool _3155 = _2993 != 3;
    int _3157 = _3151 * _3145;
    int _3159 = _3157 + _2585;
    int _3161 = ~_3133;
    int _3163 = _3161 + 1;
    int _3165 = _3163 + 1;
    float _3167 = -_1119;
    float _3169 = _3167 + 1.0;
    int _3171 = ~_3141;
    int _3173 = _3171 + 1;
    int _3175 = _3173 + 1;
    float _3177 = _2198 * _3143;
    int _3179 = _3175;
    if (_3111)
    {
        int _3181 = ~_3141;
        int _3183 = _3181 + 1;
        _3179 = _3183;
    }
    int _3185 = _3179;
    float _3187 = -_3169;
    float _3189 = fma(_2577, _3187, _3087);
    int _3191 = ~_3139;
    int _3193 = _3191 + 1;
    int _3195 = _3193 + 1;
    int _3197 = _3165 * as_type<int>(_3049);
    int _3199 = abs(_3185);
    float _3201 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[158].x, _3153);
    bool _3203 = !_2311;
    int _3205 = _3203 ? 0 : 1;
    int _3207 = _3195 * as_type<int>(_3041);
    int _3209 = _3207 + _3197;
    bool _3211 = uint(_3159) >= uint(_981);
    float _3213 = -_1163;
    float _3215 = _3213 + 1.0;
    bool _3217 = !_3155;
    int _3219 = _3217 ? 0 : (-1);
    float _3221 = -_2234;
    float _3223 = fma(_2953, _3221, _2977);
    int _3225 = abs(_3205);
    float _3227 = fma(_2473, _2228, _3061);
    float _3229 = fma(_2961, _3215, _3019);
    bool _3231 = !_3211;
    int _3233 = _3231 ? 0 : (-1);
    out.m_64.x = _3137;
    out.m_64.y = _3147;
    int _3235 = abs(_3219);
    int _3237 = ~_3199;
    int _3239 = _3237 + 1;
    int _3241 = _3239 + 1;
    out.m_66.x = _3223;
    out.m_66.y = _3229;
    out.m_66.z = _3189;
    out.m_66.w = _3227;
    int _3243 = ~_3145;
    int _3245 = _3243 + _3233;
    int _3247 = _3245 + 1;
    int _3249 = ~_3235;
    int _3251 = _3249 + 1;
    int _3253 = _3251 + 1;
    int _3255 = _3241 * as_type<int>(_3077);
    int _3257 = _3255 + _3209;
    int _3259 = ~_3225;
    int _3261 = _3259 + 1;
    int _3263 = _3261 + 1;
    int _3265 = _981 * _3247;
    int _3267 = _3265 + _2585;
    bool _3269 = _1799 > 0.0;
    bool _3271 = isnan(_1799);
    bool _3273 = _3269 || _3271;
    bool _3275 = isnan(0.0);
    bool _3277 = _3273 || _3275;
    int _3279 = _3253 * as_type<int>(_3085);
    int _3281 = _3279 + _3257;
    float _3283 = _2313 + _2125;
    out.m_68.x = _3201;
    bool _3285 = _1859 <= 0.0;
    bool _3287 = !_3277;
    bool _3289 = _3285 || _3287;
    int _3291 = _3281 * _3263;
    float _3293 = _3283 * 0.5;
    float _3295 = _1799 * _1859;
    bool _3297 = !_2479;
    int _3299 = _3297 ? _3267 : (-1);
    float _3301 = _2125 * 0.5;
    float _3303 = fma(_2188, _3177, _2186);
    float _3305 = _3295 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3307 = _3299 * _3225;
    int _3309 = _3307 + _3291;
    float _3311 = fma(_2155, -0.5, _3301);
    float _3313 = _3305 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3315 = _2153 + _2125;
    float _3317 = -_3131;
    float _3319 = _3317 + 1.0;
    float _3321 = float(_3309);
    float _3323 = _3315 * 0.5;
    float _3325 = _2188 * _3143;
    float _3327 = _2188 * _3319;
    float _3329 = fma(_2194, _3325, _2182);
    float _3331 = fma(_2196, _3325, _2184);
    out.m_45.x = _3313;
    out.m_70.y = _3321;
    out.m_72.x = _3323;
    out.m_72.y = _3311;
    out.m_72.z = _3293;
    out.m_72.w = _2125;
    out.m_74.x = _3329;
    out.m_74.y = _3331;
    out.m_74.z = _3303;
    out.m_74.w = _3327;
    if (!_3289)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3333 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3333;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

